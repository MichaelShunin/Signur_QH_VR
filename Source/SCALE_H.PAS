unit Scale_h;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls,image_u,{Y_X_Form,}tvc_u;

type
  TSCALE_HELP_Form = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label3: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    procedure OKButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ImForm:TImageForm;
//    YXForm:TYX_Form;
  end;

var
  SCALE_HELP_Form: TSCALE_HELP_Form;

implementation

{$R *.DFM}
procedure TSCALE_HELP_Form.OKButtonClick(Sender: TObject);
begin
close;
end;

procedure TSCALE_HELP_Form.SpeedButton1Click(Sender: TObject);
begin
if ImForm<>nil then
begin
with imform do
begin
 if sender = SpeedButton1 then ScaleRB.Itemindex:=0;
 if sender = SpeedButton2 then ScaleRB.Itemindex:=1;
 if sender = SpeedButton3 then ScaleRB.Itemindex:=2;
 if sender = SpeedButton4 then ScaleRB.Itemindex:=3;
 ScaleButton.Glyph:=TSpeedButton(Sender).Glyph;
 ScaleButton.NumGlyphs:=1;
 if ScaleStyle<>ScaleRb.ItemIndex then
        begin
         ScaleStyle:=ScaleRb.ItemIndex;
         bSetCurveParam:=false;
         if bCreateOver then UpdateView(True,true);
        end;
   end;  {with}
end
 else
  begin
(*    with YXForm do
    begin
     if sender = SpeedButton1 then ScaleRB.Itemindex:=0;
     if sender = SpeedButton2 then ScaleRB.Itemindex:=1;
     if sender = SpeedButton3 then ScaleRB.Itemindex:=2;
     if sender = SpeedButton4 then ScaleRB.Itemindex:=3;
     ScaleButton.Glyph:=TSpeedButton(Sender).Glyph;
     ScaleButton.NumGlyphs:=1;
     if ScaleStyle<>ScaleRb.ItemIndex then
            begin
             ScaleStyle:=ScaleRb.ItemIndex;
             bSetCurveParam:=false;
             if bCreateOver then UpdateView(True,true);
            end;
       end;  {with}
*)
  end;
  close;
end;

procedure TSCALE_HELP_Form.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TSCALE_HELP_Form.FormCreate(Sender: TObject);
begin
//Get_Lang_Par({Lang_Ini,}self,'ScaleHlp');
{Save_Lang_Par(Lang_Ini,self,'ScaleHelp');}
end;

end.
 
