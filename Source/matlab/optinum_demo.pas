unit optinum_demo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,COMObj,ActiveX, Grids, variants;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  V : Variant;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);

var


 MReal : OleVariant;
 MImage : OleVariant;

 i,j : integer;


begin

 MReal  := VarArrayCreate([0, 1, 0, 3], varDouble);
 MImage := VarArrayCreate([0,0,0,0], varDouble);

 V.Execute('a=[1 2 3 4; 5 6 7 8]');
 V.GetFullMatrix('a','base',VarArrayRef(MReal),VararrayRef(MImage));
 for i := 0 to 1 do
  for j := 0 to 3 do
   Stringgrid1.Cells[j,i] := MReal[i,j];

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 V := CreateOLEObject('Matlab.Application');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 V.Execute('peaks');
end;

procedure TForm1.Button2Click(Sender: TObject);

var

 MReal : OleVariant;
 MImage : OleVariant;

 i,j : integer;

begin

 MReal  := VarArrayCreate([0, 1, 0, 3], varDouble);
 MImage := VarArrayCreate([0,0,0,0], varDouble);

 for i := 0 to 1 do
  for j := 0 to 3 do
   MReal[i,j] := i+4;

  V.PutFullmatrix('b','base',VarArrayRef(MReal),VararrayRef(MImage));
  
end;

end.

