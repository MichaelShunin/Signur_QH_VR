unit Colscale;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TColor_Scale_Form = class(TForm)
    PaintBox1: TPaintBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Color_Scale_Form: TColor_Scale_Form;

implementation
 uses main_f,tvc_u;
{$R *.DFM}

procedure TColor_Scale_Form.PaintBox1Paint(Sender: TObject);
 var i:integer;
begin
 for i:=0 to PaintBox1.Height -2 do
  begin
   PaintBox1.Canvas.Brush.Color:=ColorMap[1024-trunc(1024/PaintBox1.Height*i)];
   paintBox1.Canvas.FillRect(Rect(0,i,PaintBox1.Width,i+1));
  end;
end;

procedure TColor_Scale_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
 MainForm.Color_Scale.Enabled:=true;
end;

procedure TColor_Scale_Form.FormCreate(Sender: TObject);
begin
 MainForm.Color_Scale.Enabled:=false;
// Get_Lang_Par({Lang_2_Ini,}self,'ColorScl');
{ Save_Lang_Par(Lang_2_Ini,self,'ColorScale');}
end;

end.
