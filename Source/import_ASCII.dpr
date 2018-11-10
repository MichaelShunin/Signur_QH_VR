library import_ASCII;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  sharemem,
  windows,
  forms,
  SysUtils,
  Classes,
  dateutils,
  tvc_u in 'tvc_u.pas',
  import_ASCII_Dialog in 'import_ASCII_Dialog.pas' {ImportASCIIDialog};

{$R *.res}
const
 ScaleTD_LCR  = 1000000;
type
{$A-}
  TASCIIShapka = record
    SignalDateTime:tDateTime;
    TD:double;   //шаг дискретизации, c
    IgnoreLine:byte;
    IgnoreColumn:byte
  end;

{$A+}

  function WordPosition(N : integer; S : string; WordDelims : string) : integer;
  var I,WordCount:integer;
  begin
    { следующие подр€д разделители воспринимались как один }
    WordCount:=1;
    I:=1;

    {≈сли в начале строки разделители, то они игнорируютс€ }
    while (Pos(Copy(S,I,1),WordDelims)>0) and (I<Length(S)) do
      Inc(I);

    while (WordCount<N) and (I<Length(S)) do
      begin
        if (Pos(Copy(S,I,1),WordDelims)>0) and (Pos(Copy(S,I+1,1),WordDelims)=0)
          then Inc(WordCount);
        Inc(I);
      end;
    WordPosition:=I;
    if (I>=Length(S)) and (WordCount<N) then WordPosition:=0;
  end;  { WordPosition }

function ExtractWord(N : integer; S : string; WordDelims : string) : string;
    {-Given a set of word delimiters, return the N'th word in S}
  var
    StartPos,EndPos:integer;
  begin
    StartPos := WordPosition(N, S, WordDelims);
    EndPos:=StartPos;
    while (EndPos <= Length(S)) and (Pos(S[EndPos],WordDelims)=0) do
      Inc(EndPos);
    ExtractWord:=System.Copy(S,StartPos,EndPos-StartPos);
  end;           { ExtractWord }

function NWords(S : string; WordDelims : string) : integer;
var Count:integer;
begin
  Count:=1;
  while WordPosition(Count,S,WordDelims)>0 do Inc(Count);
  Dec(Count);
  NWords:=Count;
end;        { NWords }

Function ChangeSymbols(OldSymbols:string; NewSymbol:string;S:string):string;
 var i:integer;
begin
{ Ёто вариант когда NewSymbol типа char
  for i:=1 to length(S) do
   if Pos(s[i],OldSymbols)>0 then s[i]:=NewSymbol;
 ChangeSymbols:=s;}

{ Ёто вариант с NewSymbol типа string, т.е. вместо символа можно вставить строку
  Ќапример, символ = заменить на :=, или Sky на Ground, или какой-либо символ на пустую строку
  4 но€бр€ 1998}
 Result:='';
 for i:=1 to length(S) do
   if Pos(s[i],OldSymbols)>0 then Result:=Result+NewSymbol else Result:=Result+S[I];
end;



procedure GetData_ASCII(
  SourceFilename: TFilename; // исходный сигнал
  DestFilename: TFileName; // шаблон имени файла дл€ данных по каналам
  SignalShapka: TSignalShapka; //описание входного сигнала
  var ChanArray: TChanArray //описание  данных по каналам
  );
  export;
type
 tDataSingle = array of Single;
var
  FDS, FDD: TFileStream;
  ASCII: TASCIIShapka;
  i, j: integer;
  DataSingle: TDataSingle;
  DataS2:array of array of Single;
  Data: smallint;
  IgnoreLine, IgnoreColumn:integer;
 TMPFile,TMPStr:string;
 DataF:TextFile;
 cPoint,IT:longint;
 ATmp:single;
 Err:integer;



begin
  ImportASCIIDialog:=TImportASCIIDialog.create(Application);
  ImportASCIIDIALOG.DateExp.date:=trunc(SignalShapka.Date_Eksp);
  ImportASCIIDIALOG.TimeExp.Time:=SignalShapka.Date_Eksp-trunc(SignalShapka.Date_Eksp);
  ImportASCIIDIALOG.Show;

  SignalShapka.TipData:=1;//ASCII.TipData;
  SignalShapka.date_eksp:= trunc(ImportASCIIDIALOG.DateExp.date)+
                           ImportASCIIDIALOG.TimeExp.time-Trunc(ImportASCIIDIALOG.TimeExp.time);
  SignalShapka.TD:=ImportASCIIDIALOG.Td.Value;//ASCII.Td/ScaleTD_ASCII;
  IgnoreLine:=ImportASCIIDIALOG.IgnoreLine.Value;//ASCII.Npoints;
  IgnoreColumn:=ImportASCIIDIALOG.IgnoreColumn.Value;//ASCII.Npoints;
  ImportASCIIDIALOG.free;


  {ѕерекачка данных из текстового файла }

(*AssignFile(DataF,SourceFileName);
Reset(DataF);
for IT:=1 to IgnoreLine do ReadLn(DataF,TMPStr);
glbNPoints:=0;
while not EOF(DataF) do
  begin
    ReadLn(DataF,TMPStr);
    if TMPStr='' then Break;
    if NWords(TMPStr,' ')=0 then Break;
    if glbNPoints=1 then glbNChan:=NWords(TMPStr,' ')-IgnoreColumn;
    for IT:=IgnoreColumn to NWords(TMPStr,' ') do
      begin
        Err:=0;
        val(ChangeSymbols('.,','.',ExtractWord(IT,TmpStr,' ;')),ATmp,Err);
        if Err>0 then Continue;
      end;
    if Err>0 then Continue;
    Inc(glbNPoints);
  end;
CloseFile(DataF);

SignalShapka.NPoints:=glbNPoints;
SignalShapka.NChanal:=glbNChan;
SignalShapka.NChanalOriginal:=glbNChan;
  *)

AssignFile(DataF,SourceFileName);
Reset(DataF);
for IT:=1 to IgnoreLine do ReadLn(DataF,TMPStr);
DataS2 := nil;
setlength(DataS2, SignalShapka.npoints,SignalShapka.NChanal);
cPoint:=0;
while not EOF(DataF) do
  begin
    ReadLn(DataF,TMPStr);
    if TMPStr='' then Break;
    if NWords(TMPStr,' ')=0 then Break;
    for IT:=IgnoreColumn to NWords(TMPStr,' ') do
      begin
        Err:=0;
        val(ChangeSymbols('.,','.',ExtractWord(IT+1,TmpStr,' ;')),ATmp,Err);
        if Err>0 then Continue;
        DataS2[cPoint,IT-IgnoreColumn]:=ATmp;
//        FileDat.Write(ATmp,SizeOf(ATmp));
      end;
//    if Err>0 then Continue;
    Inc(cPoint);
  end;
CloseFile(DataF);



  for j := 0 to SignalShapka.Nchanal - 1 do
  begin
    FDD := TFileStream.Create(DestFileName + '_ch' + inttostr(j + 1) + '.gms',
      fmCreate or fmShareDenyNone);
    for i := 0 to (SignalShapka.Npoints - 1) do
    begin
     FDD.write(datas2[i,j], sizeof(DataSingle) );
    end;
    FDD.destroy;
    ChanArray[j].NOMER:=j+1;
    ChanArray[j].HEADER:='ASCII';
    ChanArray[j].DELTX:=SignalShapka.TD;
    ChanArray[j].NAMEX:='t';
    ChanArray[j].RAZMX:='сек';
    ChanArray[j].NAMEY:='U'+inttostr(j);
    ChanArray[j].RazmY:='¬';
    ChanArray[j].RazmY:='¬';
    ChanArray[j].MULTX:=1;
    ChanArray[j].MULTY:=1;
    ChanArray[j].MAXX:=0;
    ChanArray[j].MAXY:=0;
    ChanArray[j].MINX:=0;;
    ChanArray[j].MINY:=0;
    ChanArray[j].DateTime_START:=signalshapka.Date_Eksp;
    ChanArray[j].POINTALL:=Signalshapka.NPoints;
    ChanArray[j].BMAXMINX:=false;
    ChanArray[j].BMAXMINY:=false;
    ChanArray[j].FileDat:=DestFileName + '_ch' + inttostr(j + 1) + '.gms';
    ChanArray[j].SIGNALMEMO:='';
    ChanArray[j].SIGNAL_SELECTED:=1;
    ChanArray[j].File_Seek:=0;
  end;
  datas2 := nil;
end;



procedure  GETINFO_ASCII(
        FileName:TFilename;
        var SignalShapka:TSignalShapka    //описание входного сигнала
        )
 export;
var
  IgnoreLine, IgnoreColumn:integer;
 TMPFile,TMPStr:string;
 DataF:TextFile;
 cPoint,IT:longint;
 ATmp:single;
 Err:integer;

 begin
//  FDS:=TFileStream.Create(Filename,fmOpenRead);
//  FDS.Read(ASCII,SizeOf(TASCIIShapka));

  signalshapka.Date_Eksp:=FiledateToDateTime(Fileage(Filename));

  ImportASCIIDialog:=TImportASCIIDialog.create(Application);
  ImportASCIIDIALOG.DateExp.date:=trunc(SignalShapka.Date_Eksp);
  ImportASCIIDIALOG.TimeExp.Time:=SignalShapka.Date_Eksp-trunc(SignalShapka.Date_Eksp);
  ImportASCIIDIALOG.Filename.caption:=Filename;
  ImportASCIIDIALOG.ShowModal;
  SignalShapka.TipData:=1;//ASCII.TipData;
  SignalShapka.date_eksp:= trunc(ImportASCIIDIALOG.DateExp.date)+
                            ImportASCIIDIALOG.TimeExp.time-trunc(ImportASCIIDIALOG.TimeExp.time);
  SignalShapka.TD:=ImportASCIIDIALOG.Td.Value;//ASCII.Td/ScaleTD_ASCII;
  IgnoreLine:=ImportASCIIDIALOG.IgnoreLine.Value;//ASCII.Npoints;
  IgnoreColumn:=ImportASCIIDIALOG.IgnoreColumn.Value;//ASCII.Npoints;
  ImportASCIIDIALOG.free;
  SignalShapka.TipData:=1;//ASCII.TipData;
//  SignalShapka. .IgnoreLine:=ImportASCIIDIALOG.IgnoreLine;//ASCII.Npoints;
//  SignalShapka.IgnoreColumn:=ImportASCIIDIALOG.IgnoreColumn;//ASCII.Npoints;
  AssignFile(DataF,FileName);
  Reset(DataF);
  for IT:=1 to IgnoreLine do ReadLn(DataF,TMPStr);
  glbNPoints:=0;
  while not EOF(DataF) do
    begin
      ReadLn(DataF,TMPStr);
      if TMPStr='' then Break;
      if NWords(TMPStr,' ')=0 then Break;
      if glbNPoints=1 then glbNChan:=NWords(TMPStr,' ')-IgnoreColumn;
      for IT:=IgnoreColumn to NWords(TMPStr,' ') do
        begin
  {        ATmp:=StrToFloat(ChangeSymbols('.,',DecimalSeparator,ExtractWord(IT,TmpStr,' ;')));}
          Err:=0;
          val(ChangeSymbols('.,','.',ExtractWord(IT,TmpStr,' ;')),ATmp,Err);
          if Err>0 then Continue;
  //        FileDat.Write(ATmp,SizeOf(ATmp));
        end;
      if Err>0 then Continue;
      Inc(glbNPoints);
    end;
  CloseFile(DataF);

SignalShapka.NPoints:=glbNPoints;
SignalShapka.NChanal:=glbNChan;
SignalShapka.NChanalOriginal:=glbNChan;


{SignalShapka.NPoints:=1;
SignalShapka.NChanal:=1;
SignalShapka.NChanalOriginal:=1;
SignalShapka.Td:=1;
signalshapka.Date_Eksp:=FiledateToDateTime(Fileage(Filename));}

end;


exports
 GETINFO_ASCII name 'GETINFO_ASCII',
 GETDATA_ASCII name 'GETDATA_ASCII';
end.

