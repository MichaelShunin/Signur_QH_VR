unit Formtext;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,filebuff;

type
  TTextForm = class(TForm)
    Memo: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    FontDialog1: TFontDialog;
    SaveDialog1: TSaveDialog;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    WhatDo:word;
  public
    { Public declarations }
    FText_name:shortstring;
    TextForm_Type:word;
    ViewNumber:longint;
  end;

var
  TextForm: TTextForm;

implementation
 uses tvc_u,Main_f,Exp_f,printers, config, DM_dm;
{$R *.DFM}

procedure TTextForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if (TextForm_Type<>cText_View) then
begin
 Action:=caFree;
 exit;
end;
  Memo.Lines.SaveToFile(FText_Name);
  Whatdo:=mrYes;
  if not MainForm.Autosave.Checked then
   begin
   WhatDo:=MessageDlg('Сохранить образ?',mtInformation,[mbYes, mbNo,mbCancel], 0);
   if WhatDo = mrCancel then
    begin
     Action:=caNone;
     exit;
    end;
   end;
  Action:=CAFree;
  AppConfig.IniFile.WriteInteger('textform','TextForm_Font_Size',Memo.Font.Size);
  AppConfig.IniFile.writestring('textform','TextForm_Font_Name',Memo.Font.Name);
end;

procedure TTextForm.FormActivate(Sender: TObject);
begin
  MainForm.FFTButton.Enabled:=false;
  MainForm.FTButton.Enabled:=false;
  MainForm.ObzorkaButton.Enabled:=false;
  MainForm.AudioButton.Enabled:=false;
  MainForm.FiltrButton.Enabled:=false;
  MainForm.UserButton.Enabled:=false;
  mainForm.MenuExport.Enabled:=false;
  MainForm.CursorsButton.Enabled:=false;
//  MainForm.N4.Enabled:=false;
end;

procedure TTextForm.FormDestroy(Sender: TObject);
begin
if TextForm_Type<>cText_View then
begin
 DeleteFile(pchar(FText_Name));
 exit;
end;
 if WhatDo=mrNo then
  begin
    DeleteFile(pchar(FText_Name));
    with ExpForm do
     begin
      dm.q.SQL.Clear;
     dm.q.SQL.add('delete from curveset where view_nomer= :View_Nomer');
     dm.q.parambyname('View_Nomer').asinteger:=ViewNumber;
     dm.q.execsql;
     dm.q.Transaction.commitretaining;
     expform.CurvesetRefresh;
{      DeleteQuery.SQL.Clear;
      DeleteQuery.SQL.Add('Delete from Curve  where View_Nomer = '+IntToStr(ViewNumber));
      DeleteQuery.ExecSQL;
      DeleteQuery.SQL.Clear;
      DeleteQuery.SQL.Add('Delete from CurveSet  where View_Nomer = '+IntToStr(ViewNumber));
      DeleteQuery.ExecSQL;
      DeleteQuery.SQL.Clear;}
     end;
   end;
 end;


procedure TTextForm.BitBtn2Click(Sender: TObject);
var
 i:integer;
 MemoText:TextFile;
begin
 if MainForm.PrintDialog1.Execute then
  begin
   AssignPrn(MemoText);
   Try
      Rewrite(MemoText);
      Printer.Canvas.Font.Assign(Memo.Font);
      for i:=0 to Memo.Lines.Count-1 do writeln(MemoText,Memo.Lines[i]);
    Finally
     CloseFile(MemoText);
    end; {Try}
  end;

end;

procedure TTextForm.BitBtn3Click(Sender: TObject);
begin
 if  FontDialog1.Execute then
  begin
   Memo.Font:=  FontDialog1.Font;
   Memo.Update;
  end;

end;

procedure TTextForm.BitBtn1Click(Sender: TObject);
begin
 Close;
end;

procedure TTextForm.BitBtn4Click(Sender: TObject);
begin
  SaveDialog1.FileName:='noname';
  if SaveDialog1.Execute then
  begin
    Memo.Lines.SaveToFile(SaveDialog1.FileName);
  end;

end;

procedure TTextForm.FormCreate(Sender: TObject);
begin
// Get_Lang_Par({Lang_Ini,}self,'TextForm');
 FText_Name:=PromFileName;
 Memo.Lines.LoadFromFile(FText_Name);
 Memo.Font.Name:=AppConfig.IniFile.ReadString('TextForm','TextForm_Font_Name','System');
 Memo.Font.Size:=AppConfig.IniFile.ReadInteger('TextForm','TextForm_Font_Size',10);
{ Save_Lang_Par(Lang_Ini,self,'TextForm');}
end;

end.
