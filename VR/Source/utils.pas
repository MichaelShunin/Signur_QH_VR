unit utils;

interface
uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, Grids, DBGrids, ComCtrls, inifiles,
  OleCtrls, SHDocVw, mshtml,math, TeeProcs, TeEngine, Chart, DBChart,
   Series,jpeg,filectrl, GanttCh, IBDatabase,
  IBCustomDataSet, IBQuery,variants;


procedure ClearGrid(Grid: TStringGrid);
Function ConvertBmpToJpeg(fname:string):boolean;
Function SearchPos (Items:Tstrings;s:string):integer;
function ShowModalForm(FormClass: TFormClass): Boolean;
function changesymbol(s:string;oldSymb,NewSymb:char):string;
function GetGUIDStr: string;

{$IFDEF DEBUG}
procedure DebugMessage(const s: string) ;
//Procedure writeToLogFile(UserIP:integer;app,action:string);


{$ENDIF}

var
 newstring:string;
 IPAddr:string;
 
implementation

{$IFDEF DEBUG}
const
  FILENAME = 'debug.log';


 
procedure DebugMessage(const s: string);
var
  F: Text;
begin
  if FileExists(FILENAME) then
    AssignFile(F, FILENAME)
  else
    Rewrite(F, FILENAME);

  Append(F);
  try
    WriteLn(F, s);
  finally
    CloseFile(F);
  end;

end;
{$ENDIF}

function ShowModalForm(FormClass: TFormClass): Boolean;
var
  Form: TForm;
begin
  Form := FormClass.Create(Application);
  try
    Result := Form.ShowModal = idOk;
  finally
    Form.Free;
  end;
end;

procedure ClearGrid(Grid: TStringGrid);
var
  i: Integer;
begin
  with Grid do
  begin
    RowCount := 2;
    for i := 0 to ColCount - 1 do
      Cells[i, 1] := '';
    Objects[0, 1] := nil;
  end;
end;

Function SearchPos (Items:Tstrings;s:string):integer;
var i:integer;
begin
Result:=-1;
s:=Ansiuppercase(s);
for i:= 0 to Items.count-1 do
 begin
  if pos(s,Ansiuppercase(Items[i]))>0 then begin result:=i ;exit;end;
 end;
end;



function changesymbol(s:string;oldSymb,NewSymb:char):string;
var I:integer;
begin
for i:=1 to length(s) do
  if s[i]=oldsymb then s[i]:=newsymb;
result:=s;
end;


Function ConvertBmpToJpeg(fname:string):boolean;
var
   Bmp:TBitMap;
   Jpeg:TJpegImage;
   FJpegName:string;
begin
     Bmp:=TBitMap.Create( );
     Jpeg:=TJpegImage.Create();
     Bmp.LoadFromFile(fname);
     Jpeg.Assign(Bmp);
     FJpegName:=ChangeFileExt(fname,'.jpg');
     Jpeg.SaveToFile(FJpegName);
     DeleteFile(fname);

     Bmp.FreeImage();
     Jpeg.Free();
     result:=true;
end;

function CoCreateGuid(out guid: TGUID): HResult; stdcall; external 'ole32.dll' name 'CoCreateGuid';

function GetGUIDStr: string;
var
  GUID: TGUID;
begin
  CoCreateGUID(GUID);
  Result := GuidToString(GUID);
end;

end.
