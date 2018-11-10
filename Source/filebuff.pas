unit FileBuff;
{$DEFINE _NDEBUG}
{
   Project "Opnek Libraries"
   Copyright © 1995 Opnek Research.  All Rights Reserved.

   SUBSYSTEM:      Opnek Standard Libraries
   TEST STUB:      Test stub included
   FILE:           FileBuff.Pas
   AUTHOR:         Jay Cole
   WRITTEN:        05/10/95
   LAST ASSERT:    19 <- Unique Assert code start here w/ new asserts.
                                                                               
   OVERVIEW                                                                    
   ========                                                                    
   Delphi provides no direct file buffer support, so I have invented a little
   set of routines to allow full buffering up to 64k worth of buffer space.  
   The routines pretty much mirror the delphi assignfile(), reset(), blockread->
   Read() and blockWrite->write().  The system will re-raise exceptions as the 
   it processes.  You can use the typical try ... except ... end block to catch
   any problems that might occur.  Replacement for the TBufStream now missing
   from BP 7.0, too bad.

   CAUTIONS
   ========
   This routine works poorely when trying to go backwards seeking through a file
   you will get worse performance than straight reads.

   SUGGESTED ENHANCEMENTS
   ======================
   - Change to Windows read/write routines or assember routines which ever is 
     faster.
   - Add Read/Only open to the system.
   - Provide a more accurate FileSize() method.

   UPDATE HISTORY
   ==============
   05/10/95 - Created initial object.
   05/13/95 - Added logic for record size spanning 2 or more buffers.
   05/20/95 - Fixed reading across spanned buffers.
}
interface
{$define _TESTHARNESS} { directive ($) in for test harness inclusion }

{ Externally used types and classes }
type
   shortstring =string;
   ansiString = string;
   smallint = integer;

   TMemBuffer = array[0..65534] of char;
   PMemBuffer = ^TMemBuffer;

   TBufferedFile = class(TObject)
   private
      { Memory buffer information }
      buffer : PMemBuffer;
      bufferSize,
      bufferEnd : word;
      bufferFilePos,
      bufferOffset : longint; {<- Handle 64k wrap problems by using longint type }

      { file information }
      fileName : string;
      fileHandle : File;

      { File conditionals }
      isOpen, dirtyBuffer : boolean;

      procedure LoadBuffer;
      procedure DumpBuffer;

   public
      constructor Create(const afileName : string; bufSize : word);
      destructor Destroy; override;

      procedure AssignFile(const afileName : string);
      procedure Reset;
      procedure Rewrite;
      procedure Close;

      function Eof : boolean;
      function FilePos : longint;
      function FileSize : longint;
      procedure Seek(const offset : longint);

      procedure Read(var contents; const numBytes : word; var bytesRead : word);
      procedure Write(var contents; const numBytes : word; var bytesWrote : word);
   end;

   { Export the TestFileBuff test harness only if test harness is needed }
   {$ifdef _TESTHARNESS} 
      procedure TestFileBuff(
                  bufsize, recsize : word;
                  numiterations : longint;            
                  var oldCreateTime, oldCopyTime, oldReadTime, oldModifyTime : double;
                  var newCreateTime, newCopyTime, newReadTime, newModifyTime : double;
                  var benchWrite, benchRead : double
      ); 
   {$endif}
   

implementation
uses  SysUtils; {<- Remember define _NDEBUG to remove slow Assert code }

{ -- Public routines -- }

{ (Final) Create a buffer file at this point, if a filename is supplied         }
{ other than '', the filename will be assigned, but the file will not be opened }
{ until the call to reset is made.  Note all files are opened as 1 byte binary  }
{ files.                                                                        }
constructor TBufferedFile.Create(const afileName : string; bufSize : word);
begin
   { Call inherited constructor }
   inherited Create;

   { init all the local variables passed by create method }
   {$ifndef _NDEBUG} Assert(bufSize > 0, 'Invalid BufferSize', 1); {$endif}
   bufferSize  := bufSize;
   fileName    := afileName;
   if (fileName <> '') then AssignFile(afileName);

   { boolean conditionals }
   dirtyBuffer := true; 
   isOpen := false; 

   { Other buffering positioning, the buffer file position, the offset in the   }
   { current buffer and the amount of bytes in the buffer, for end of file      }
   { conditions                                                                 }
   bufferFilePos := 0;
   bufferOffset := 0;
   bufferEnd := 0;

   { Try to get our block of buffer memory, handle the problem and re-raise the }
   { exception to the calling application, they can determine on how to handle  }
   { it.                                                                        }
   try
      Getmem(buffer, bufferSize);
   except
      on EOutOfMemory do begin
         buffer := nil;
         raise;
      end;
   end;
end;


{ (Final) Free up all the buffer space, assert the user has closed the file first }
destructor TBufferedFile.Destroy;
begin
   {$ifndef _NDEBUG} Assert(not isOpen, 'Freeing a closed file', 2); {$endif}
   if (buffer <> nil) then Freemem(buffer, bufferSize);
   inherited Destroy;
end;


{ (Final) Just like Delphi's current AssignFile procedure, only no file handle needed }
procedure TBufferedFile.AssignFile(const afileName : string);
begin
   {$ifndef _NDEBUG} Assert(afileName <> '', 'Can''t assign blank file', 3); {$endif}
   {$ifndef _NDEBUG} Assert(not isOpen, 'Re-assigning an open file', 4); {$endif}
   fileName:= afileName;
   System.Assign(fileHandle, fileName);
end;


{ (Final) Create a file that doesn't exist, or overwrite and existing file }
procedure TBufferedFile.Rewrite;
begin
   {$ifndef _NDEBUG} Assert(not isOpen, 'Rewrite called on an already open file', 5); {$endif}
   {$ifndef _NDEBUG} Assert(fileName <> '', 'No filename assigned yet', 6); {$endif}
   if (not isOpen) then begin
      try
         System.Rewrite(fileHandle, 1);
      except
         on EInOutError do begin
            { Problem rewriting file, raise the exception up to caller }
            isOpen := false;
            raise;
         end;
      end;

      { Set up the buffering variables and set state to open }
      bufferEnd := 0;
      bufferFilePos := 0;
      bufferOffset := 0;
      isOpen := true;
   end;
end;


{ (Final) Reset the file in the ,1 mode for binary access.  setup the system for }
{ buffered access to the system                                                  }
Procedure TBufferedFile.Reset;
begin
   {$ifndef _NDEBUG} Assert(not isOpen, 'Reset called on an already open file', 7); {$endif}
   {$ifndef _NDEBUG} Assert(fileName <> '', 'No filename assigned yet', 8); {$endif}
   if not isOpen then begin
      try
         System.Reset(fileHandle, 1);
      except
         on EInOutError do begin
            { Can't find or open file, re-raise exception up }
            isOpen := false;
            raise;                      
         end;
      end;

      { Now, set up our buffer w/ the beginning of the file info }
      bufferFilePos := 0; 
      bufferOffset := 0; 
      bufferEnd := 0;
      isOpen := true;
      LoadBuffer;
   end;
end;


{ (Final) Close out the file, and flush any outstanding buffer information }
procedure TBufferedFile.Close;
begin
   {$ifndef _NDEBUG} Assert(isOpen, 'File not open yet', 9); {$endif}
   { First, flush buffer if necessary }          
   if dirtyBuffer then 
      DumpBuffer;

   { Close out the file and return to the user }
   try
      System.Close(fileHandle);
   except
      on EInOutError do raise;
   end;
   isOpen := false;
end;


{ (Final) First of several file information procedures, returns the size of the }
{ currently opened file.  Remember, this routine can cause irratic results if   }
{ you call it before a buffer is flushed out fully.  There could be partial file}
{ data still in memory.                                                         } 
function TBufferedFile.FileSize : longint;
begin
   {$ifndef _NDEBUG} Assert(isOpen, 'File not open yet', 10); {$endif}
   FileSize := System.FileSize(fileHandle);
end;

{ (coded) Return the file position in the current file }
function TBufferedFile.FilePos : longint;
begin
   {$ifndef _NDEBUG} Assert(isOpen, 'File not open yet', 11); {$endif}
   FilePos := bufferFilePos + bufferOffset;
end;

{ (Final) Are we at the end of the buffer? }
function TBufferedFile.Eof : boolean;
begin
   {$ifndef _NDEBUG} Assert(isOpen, 'File not open yet', 12); {$endif}
   Eof := FilePos >= FileSize;
end;


{ (Tested) Read and write routines, first the read a set of bytes either from the}
{ buffer or from the file after a buffer reload handle record size spanning      }
{ multiple records                                                               }
procedure TBufferedFile.Read(var contents; const numBytes : word; var bytesRead : word);
var toReadLeft, outPos, currBufferBytesLeft : word;
begin
   bytesRead := 0;
   {$ifndef _NDEBUG} Assert(isOpen, 'File not open yet', 13); {$endif}
   {$ifndef _NDEBUG} Assert(numBytes > 0, 'Can''t read 0 bytes', 14); {$endif}
   if (bufferOffset + longint(numBytes) <= longint(bufferEnd)) then begin
      { We are within the buffer boundary completely, simply a mem move }
      Move(buffer^[bufferOffset], contents, numBytes);
      inc(bufferOffset, numBytes);
      bytesRead := numBytes;
   end else begin
      { The amount we need to read straddles a buffer boundary, we need to }
      { read in two or more chunks.                                        }
      try
         { Read the end of the first buffer/check for EOF condition }
         currBufferBytesLeft := bufferEnd - bufferOffset;      
         if (bufferEnd = 0) then exit;
         if (currBufferBytesLeft > 0) then 
            Move(buffer^[bufferOffset], contents, currBufferBytesLeft);
         bytesRead := currBufferBytesLeft;
         toReadLeft := numBytes - currBufferBytesLeft;
         outPos := currBufferBytesLeft;

         { Now, reload the next buffer and fill in the remaining bytes }
         repeat 
            { Any changes outstanding }
            if (dirtyBuffer) then 
               DumpBuffer;

            { Check for end of file and break if necessary }
            inc(bufferFilePos, bufferEnd);
            LoadBuffer;

            { Handle a read past eof() condition }
            if (toReadLeft <=  bufferEnd) then begin
               { Not at end-of-file, process normally }
               Move(buffer^[bufferOffset], TMemBuffer(contents)[outPos], toReadLeft);
               inc(bytesRead, toReadLeft);
               inc(bufferOffset, toReadLeft);
               toReadLeft := 0;
            end else begin
               { at the end of file, only read what is left, and return if 0 }
               if (bufferEnd > 0) then begin
                  Move(buffer^[bufferOffset], TMemBuffer(contents)[outPos], bufferEnd);
                  inc(outPos, bufferEnd);
                  inc(bufferOffset, bufferEnd);
               end else                     
                  exit;

               { We still have more reads, increment the dest index and dec bytes left }
               { to read.                                                              }
               inc(outPos, bufferEnd);
               inc(bytesRead, bufferEnd);
               dec(toReadLeft, bufferEnd);
            end;
         until toReadLeft = 0;
      except
         on EInOutError do begin
            bytesRead := 0;
            raise;
         end;
      end;
   end;
end;


{ (Tested) Write routine, just like the read routine, either a memory hit or bufsize}
{ disk hit.  Write the contents of the passed variable                              }
procedure TBufferedFile.Write(var contents; const numBytes : word; var bytesWrote : word);
var toWriteLeft, outPos, currBufferBytesLeft : word;
begin
   {$ifndef _NDEBUG} Assert(isOpen, 'File not open yet', 15); {$endif}
   {$ifndef _NDEBUG} Assert(numBytes > 0, 'Can''t write 0 bytes', 16); {$endif}

   { Mark the buffer as modified/dirty and then write the information out }
   dirtyBuffer := true;
   if (bufferOffset + longint(numBytes) <= longint(bufferSize)) then begin
      { We are within the buffer boundary completely, simply a mem move in }
      Move(contents, buffer^[bufferOffset], numBytes);
      inc(bufferOffset, numBytes);
      bytesWrote := numBytes;

      { Did we simply expand the size of the file, if so, increment bufferEnd }
      { accordingly.                                                          }
      if (bufferOffset > bufferEnd) then 
         bufferEnd := bufferOffset;
   end else begin
      { The amount we need to read straddles a buffer boundary, we need to }
      { write in two chunks.                                               }
      try
         { Read the end of the first buffer }
         currBufferBytesLeft := bufferSize - bufferOffset;      
         if (currBufferBytesLeft > 0) then 
            Move(contents, buffer^[bufferOffset], currBufferBytesLeft);
         bytesWrote := currBufferBytesLeft;
         toWriteLeft := numBytes - currBufferBytesLeft;
         outPos := currBufferBytesLeft;
         bufferEnd := bufferSize;

         { Now, reload the next buffer(s) and fill in the remaining bytes  }
         { could span multiple buffers in the worse case                   }
         repeat
            DumpBuffer;
            inc(bufferFilePos, bufferSize);
            LoadBuffer;

            { Handle a read past eof() condition }
            if (toWriteLeft <=  bufferSize) then begin
               { Not at end-of-file, process normally }
               Move(TMemBuffer(contents)[outPos], buffer^[bufferOffset], toWriteLeft);
               inc(bytesWrote, toWriteLeft);
               inc(bufferOffset, toWriteLeft);
               if (bufferOffset > bufferEnd) then bufferEnd := bufferOffset;
               toWriteLeft := 0;
            end else begin
               { at the end of file, only read what is left }
               Move(TMemBuffer(contents)[outPos],buffer^[bufferOffset], bufferSize);
               bufferEnd := bufferSize;
               inc(bytesWrote, bufferSize);
               inc(outPos, bufferSize);
               dec(toWriteLeft, bufferSize);
            end;
         until toWriteLeft = 0;
         dirtyBuffer := true;
      except     
         on EInOutError do begin
            bytesWrote := 0;
            raise;
         end;
      end;
   end;
end;


{ (Final) Seek to a file position, if it is in the buffer, merely adjust the offset }
procedure TBufferedFile.Seek(const offset : longint);
begin
   {$ifndef _NDEBUG} Assert(isOpen, 'File not open yet', 17); {$endif}
   { Are we even in the right ball park to read from memory }
   if (offset >= bufferFilePos) and (offset < bufferFilePos + bufferEnd) then begin
      bufferOffset := offset - bufferFilePos;
   end else begin
      { We are out of buffer range, flush any changes and then reload the  }
      { appropriate buffer range                                           }
      if (dirtyBuffer) then 
         DumpBuffer;
      bufferFilePos := offset;
      try
         LoadBuffer;
      except
         on EInOutError do raise;
      end;
   end;
end;



{ -- Private routines -- }

{ (Final) Load up the buffer with as much data as allowed, this way reads/writes }
{ will go against our buffer memory.                                             }
Procedure TBufferedFile.LoadBuffer;
var
 Res:integer;
begin
   {$ifndef _NDEBUG} Assert(isOpen, 'File not open yet', 18); {$endif}
   { Let's seek to the appropriate place and fill the buffer }
   try
      System.Seek(fileHandle, bufferFilePos);
{2004}

      System.BlockRead(FileHandle, buffer^, bufferSize, res);
      BufferEnd:=res;
      bufferOffset := 0;
   except
      on EInOutError do raise;
   end;
   dirtyBuffer := false;
end;


{ (Final) There have been changes to buffer probably, so a calling routine is    }
{ telling us to dump the contents of the current buffer back out to the disk     }
procedure TBufferedFile.DumpBuffer;
//var writeResult : word;
begin
   {$ifndef _NDEBUG} Assert(isOpen, 'File not open yet', 19); {$endif}
   { Go back to the beginning of the buffer and flush out our changes }
   try
      System.Seek(fileHandle, bufferFilePos);
//      System.BlockWrite(fileHandle, buffer^, bufferEnd, writeResult);
   except
      on EInOutError do raise;
   end;
   dirtyBuffer := false;
end;



{-- Test Harness/Timing program --}

{$ifdef _TESTHARNESS}
{ (Tested) Used to exercise the file buffering routines above and compare }
{ them to the unbuffered equivalents.                                     }
procedure TestFileBuff(
            bufSize, recSize : word;
            numIterations : longint;            
            var oldCreateTime, oldCopyTime, oldReadTime, oldModifyTime : double;
            var newCreateTime, newCopyTime, newReadTime, newModifyTime : double;
            var benchWrite, benchRead : double); 

var 
   bufferOut : array[0..10000] of char;                       
   bigBuf : PChar;
   tmpFile, tmpFile1 : file;
   tempLong, i : longint;
   begTime : TDateTime;
   bufFile, bufFile1 : TBufferedFile;
   amtWrote, amtRead : word;
   seekPos : longint;

begin
   { Limit to practical record size, could be bigger }
   if (recSize > 10000) then recSize := 10000;
   FillChar(bufferOut, sizeof(bufferOut), 'A');

   { Now create the file the new way }
   begTime := Now;
   bufFile := TBufferedFile.Create('\tFile-2.out', bufSize);
   bufFile.Rewrite;
   for i := 0 to numIterations do begin
      bufFile.Write(bufferOut, recSize, amtWrote);
   end;
   bufFile.Close;
   bufFile.Destroy;
   newCreateTime := ((Now - begTime) * 60.0 * 60.0 * 24.0);

   { Create the file the old fashion way }
   begTime := Now;
   Assign(tmpFile, '\tFile-1.out');
   Rewrite(tmpFile,1);
   for i := 0 to numIterations do begin
      BlockWrite(tmpFile, bufferOut, recSize);
   end;
   Close(tmpFile);
   oldCreateTime := ((Now - begTime) * 60.0 * 60.0 * 24.0);

   { Copy the file w/ changes }
   begTime := Now;
   Assign(tmpFile, '\tFile-1.out');
   Reset(tmpFile,1);
   Assign(tmpFile1, '\tFile-11.out');
   Rewrite(tmpFile1,1);
   for i := 0 to numIterations do begin
      BlockRead(tmpFile, bufferOut, recSize);
      bufferOut[2] := 'Q';
      bufferOut[20] := 'R';
      bufferOut[30] := 'S';
      BlockWrite(tmpFile1, bufferOut, recSize);
   end;
   Close(tmpFile);
   Close(tmpFile1);
   oldCopyTime := ((Now - begTime) * 60.0 * 60.0 * 24.0);

   { New copy w/ Changes }
   begTime := Now;
   bufFile := TBufferedFile.Create('\tFile-2.out', bufSize);
   bufFile.Reset;
   bufFile1 := TBufferedFile.Create('\tFile-22.out', bufSize);
   bufFile1.Rewrite;
   for i := 0 to numIterations do begin
      bufFile.Read(bufferOut, recSize, amtRead);
      bufferOut[2] := 'Q';
      bufferOut[20] := 'R';
      bufferOut[30] := 'S';
      bufFile1.Write(bufferOut, recSize, amtWrote);
   end;
   bufFile.Close;
   bufFile.Destroy;
   bufFile1.Close;
   bufFile1.Destroy;
   newCopyTime := ((Now - begTime) * 60.0 * 60.0 * 24.0);

   { Read the file the old fashion way }
   begTime := Now;
   Assign(tmpFile, '\tFile-1.out');
   Reset(tmpFile,1);
   for i := 0 to numIterations do begin
      BlockRead(tmpFile, bufferOut, recSize);
   end;
   Close(tmpFile);
   oldReadTime := ((Now - begTime) * 60.0 * 60.0 * 24.0);

   { Now Read the file the new way }
   begTime := Now;
   bufFile := TBufferedFile.Create('\tFile-2.out', bufSize);
   bufFile.Reset;
   for i := 0 to numIterations do begin
      bufFile.Read(bufferOut, recSize, amtRead);
   end;
   bufFile.Close;
   bufFile.Destroy;
   newReadTime := ((Now - begTime) * 60.0 * 60.0 * 24.0);

   { Unbuffered modify in place }
   begTime := Now;
   Assign(tmpFile, '\tFile-1.out');
   Reset(tmpFile,1);
   seekPos := 0;
   for i := 0 to numIterations do begin
      BlockRead(tmpFile, bufferOut, recSize);
      Seek(tmpFile, seekPos);
      bufferOut[1] := 'F'; bufferOut[2] := 'O';
      BlockWrite(tmpFile, bufferOut, recSize);
      inc(seekPos, recSize);
   end;
   Close(tmpFile);
   oldModifyTime := ((Now - begTime) * 60.0 * 60.0 * 24.0);

   { Buffered modify in place }
   begTime := Now;
   bufFile := TBufferedFile.Create('\tFile-2.out', bufSize);
   bufFile.Reset;
   seekPos := 0;
   for i := 0 to numIterations do begin
      bufFile.Read(bufferOut, recSize, amtRead);
      bufFile.Seek(seekPos);
      bufferOut[1] := 'F'; bufferOut[2] := 'O';
      bufFile.Write(bufferOut, recSize, amtWrote);
      inc(seekPos, recSize);
   end;
   bufFile.Close;
   bufFile.Destroy;
   newModifyTime := ((Now - begTime) * 60.0 * 60.0 * 24.0);

   { Establish the best time possible for reading/ raw 64k at a time }
   tempLong := numIterations * longint(recSize);
   tempLong := tempLong div 65535;
   GetMem(bigBuf, 65535);

   begTime := Now;
   Assign(tmpFile, '\tFile-1.out');
   Reset(tmpFile,1);
   for i := 0 to tempLong-1 do begin
      BlockRead(tmpFile, bigBuf^, 65535);
   end;
   Close(tmpFile);
   benchRead := ((Now - begTime) * 60.0 * 60.0 * 24.0);

   { Establish the best time possible for writing/ raw 64k at a time }
   begTime := Now;
   Assign(tmpFile, '\tFile-1.out');
   Rewrite(tmpFile,1);
   for i := 0 to tempLong do begin
      BlockWrite(tmpFile, bigBuf^, 65535);
   end;
   Close(tmpFile);
   benchWrite := ((Now - begTime) * 60.0 * 60.0 * 24.0);

   FreeMem(bigBuf, 65535);

   { Clean up all the misc files }
   DeleteFile('\tFile-1.out');
   DeleteFile('\tFile-2.out');
   DeleteFile('\tFile-11.out');
   DeleteFile('\tFile-22.out');
end;
{$endif}


end.
