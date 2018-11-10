unit Main_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, COMObj, ActiveX, variants;

type
  TMainWin = class(TForm)
    Val11: TEdit;
    Val12: TEdit;
    Val13: TEdit;
    Val21: TEdit;
    Val22: TEdit;
    Val23: TEdit;
    Val31: TEdit;
    Val32: TEdit;
    Val33: TEdit;
    Val41: TEdit;
    Val42: TEdit;
    Val43: TEdit;
    Val14: TEdit;
    Val24: TEdit;
    Val34: TEdit;
    Val44: TEdit;
    Bevel1: TBevel;
    SendMatrixBut: TBitBtn;
    RetMatrixBut: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    SendDBut: TBitBtn;
    Bevel2: TBevel;
    GetDBut: TBitBtn;
    RunDemoBut: TBitBtn;
    Memo: TMemo;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    InvBut: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure SendMatrixButClick(Sender: TObject);
    procedure RetMatrixButClick(Sender: TObject);
    procedure InvButClick(Sender: TObject);
    procedure SendDButClick(Sender: TObject);
    procedure GetDButClick(Sender: TObject);
    procedure RunDemoButClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainWin: TMainWin;
  MatLabOLEWin : Variant;

implementation

{$R *.DFM}

procedure TMainWin.FormCreate(Sender: TObject);
begin
   MatLabOLEWin:= CreateOLEObject('Matlab.Application');
end;

procedure TMainWin.SendMatrixButClick(Sender: TObject);
VAR  MReal : OleVariant;
     MImage : OleVariant;
begin
   MReal := VarArrayCreate([0,3,0,3], varDouble);  //Creates 0..3,0..3 Array
   MImage:= VarArrayCreate([0,3,0,3], varDouble);  //Creates 0..3,0..3 Array
   { Col 1 }
   MReal[0,0]:= StrToFloat(Val11.Text);
   MReal[0,1]:= StrToFloat(Val12.Text);
   MReal[0,2]:= StrToFloat(Val13.Text);
   MReal[0,3]:= StrToFloat(Val14.Text);
   { Col 2 }
   MReal[1,0]:= StrToFloat(Val21.Text);
   MReal[1,1]:= StrToFloat(Val22.Text);
   MReal[1,2]:= StrToFloat(Val23.Text);
   MReal[1,3]:= StrToFloat(Val24.Text);
   { Col 3 }
   MReal[2,0]:= StrToFloat(Val31.Text);
   MReal[2,1]:= StrToFloat(Val32.Text);
   MReal[2,2]:= StrToFloat(Val33.Text);
   MReal[2,3]:= StrToFloat(Val34.Text);
   { Col 4 }
   MReal[3,0]:= StrToFloat(Val41.Text);
   MReal[3,1]:= StrToFloat(Val42.Text);
   MReal[3,2]:= StrToFloat(Val43.Text);
   MReal[3,3]:= StrToFloat(Val44.Text);
   MatLabOLEWin.PutFullMatrix( 'A','base',VarArrayRef(MReal),VarArrayRef(MImage));
  MatLabOLEWin.execute('Plot(A)');
end;

procedure TMainWin.RetMatrixButClick(Sender: TObject);
VAR  MReal : OleVariant;
     MImage : OleVariant;
begin
   MReal := VarArrayCreate([0,3,0,3], varDouble);  //Creates 0..3,0..3 Array
   MImage:= VarArrayCreate([0,3,0,3], varDouble);  //Creates 0..3,0..3 Array
   MatLabOLEWin.GetFullMatrix('A','base',VarArrayRef(MReal),VarArrayRef(MImage));
   { Col1 }
   Val11.Text:= FloatToStr(MReal[0,0]);
   Val12.Text:= FloatToStr(MReal[0,1]);
   Val13.Text:= FloatToStr(MReal[0,2]);
   Val14.Text:= FloatToStr(MReal[0,3]);
   { Col2 }
   Val21.Text:= FloatToStr(MReal[1,0]);
   Val22.Text:= FloatToStr(MReal[1,1]);
   Val23.Text:= FloatToStr(MReal[1,2]);
   Val24.Text:= FloatToStr(MReal[1,3]);
   { Col3 }
   Val31.Text:= FloatToStr(MReal[2,0]);
   Val32.Text:= FloatToStr(MReal[2,1]);
   Val33.Text:= FloatToStr(MReal[2,2]);
   Val34.Text:= FloatToStr(MReal[2,3]);
   { Col4 }
   Val41.Text:= FloatToStr(MReal[3,0]);
   Val42.Text:= FloatToStr(MReal[3,1]);
   Val43.Text:= FloatToStr(MReal[3,2]);
   Val44.Text:= FloatToStr(MReal[3,3]);
end;

procedure TMainWin.InvButClick(Sender: TObject);
begin
   MatLabOLEWin.Execute('A = inv(A)');
end;

procedure TMainWin.SendDButClick(Sender: TObject);
begin
   MatLabOLEWin.Execute('D=23.45');
end;

procedure TMainWin.GetDButClick(Sender: TObject);
VAR MReal : OleVariant;
    MImage : OleVariant;
begin
   // Send d in case not already sent
   MatLabOLEWin.Execute('d=23.45');
   // Retrieve Single number example
   MReal  := VarArrayCreate([0,0], varDouble);  //Creates 0..0 Array or 1 Number
   MImage := VarArrayCreate([0,0], varDouble);
   MatLabOLEWin.GetFullMatrix('D','base',VarArrayRef(MReal),VarArrayRef(MImage));
   GetDBut.Caption:= 'Retrived D = ' +FloatToStr(MReal[0]);    // Caption dispalys '23.45'
end;

procedure TMainWin.RunDemoButClick(Sender: TObject);
VAR loop:INTEGER;
begin
  MatLabOLEWin.Execute(Memo.Lines.Text);
  {
   FOR loop:= 0 TO Memo.Lines.Count-1 DO
   BEGIN
      MatLabOLEWin.Execute(Memo.Lines[loop]);
   END;
   }
end;

procedure TMainWin.BitBtn1Click(Sender: TObject);
begin
   MatLabOLEWin.Execute('demo');
end;

procedure TMainWin.Button1Click(Sender: TObject);
    VAR loop:INTEGER;
begin
 //   MatLabOLEWin.Execute('InY = ones(inNpointmax,inNchan)');
    memo.lines.LoadFromFile('C:\matlabgemis.m');
    MatLabOLEWin.Execute('inNchan=3');
    MatLabOLEWin.Execute('inNpointmax=71');
//    memo.lines.Insert(0,'inNchan=3');
//    memo.lines.Insert(0,'inNpointmax=71');

{    for chan = 1:inNchan
    for point = 1:inNpointmax
        InY(point,chan)=rand;
    end}
end;
{   FOR loop:= 0 TO Memo.Lines.Count-1 DO
   BEGIN
      MatLabOLEWin.Execute(Memo.Lines[loop]);
   END;}

procedure TMainWin.Button2Click(Sender: TObject);
begin
MatLabOLEWin:= CreateOLEObject('Matlab.Application');
end;

end.
