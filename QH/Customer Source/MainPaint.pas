unit MainPaint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    PaintBox1: TPaintBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    rgTypeOfImage: TRadioGroup;
    rgTypeOfSystem: TRadioGroup;
    pnRotorStator: TPanel;
    Label3: TLabel;
    cbRotor: TComboBox;
    Label4: TLabel;
    cbStator: TComboBox;
    Panel5: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Button1: TButton;
    procedure rgTypeOfSystemClick(Sender: TObject);
    procedure cbRotorChange(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure cbStatorChange(Sender: TObject);
    procedure rgTypeOfImageClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations } // ����������� ������

    // �������� ������
     // ��� �������� ������ ������������
    itype,inum,ishow : Integer;
     // ������ �������������� ��������
    s : array[0..8] of Word;
    // �.�. � ���������� ���������� �����
    // ������������ ������������� ������� �� 2,
    // �� ��������� ������ ����� ����������.
    // � ���������, �������� �������� ��������
    // ����� ������������� � ������. ��� ����
    // ����� ����� �������� ����� ��������� ������:
    sdub : array[0..8] of Word;
    // � ��������������� ��������� MyDuble;
    // ������ ��������� ���������
    bVis : array[0..8] of bool;
    // ���������� ���������������� �����������
    xstart,ystart,xend,xend2,yend : Word;

    // ������ ������
     Procedure MyDuble(b : bool); // ����������� ��������.
     // ���� ������
     Procedure RotorRoundClosedShow;        // ������� ��������
     Procedure RotorRoundAlmostClosedShow;  // ������� ������������
     Procedure RotorOvalClosedShow;         // �������� ��������
     Procedure RotorOvalAlmostClosedShow;   // �������� ������������
     Procedure RotorTrapeziumAlmostClosedShow;  // ��������������� ������������
     Procedure RotorRectangleAlmostClosedShow;  // ������������� ������������
     // ���� �������
     Procedure StatorOvalShow;                  // ��������
     Procedure StatorAlmostOvalShow;            // ������������
     Procedure StatorTrapeziumShow;             // ���������������
     Procedure StatorRectangleOpenShow;         // ������������� ��������
     Procedure StatorRectangleAlmostClosedShow; // ������������� ������������
     // ������� ������� ����������� ���������
     Procedure ChiefSizeASinchronMotorShow;

     // ���������� �������
     Procedure MyArrowUp(ix,iy : Integer);    // �����
     Procedure MyArrowDown(ix,iy : Integer);  // ����
     Procedure MyArrowRight(ix,iy : Integer); // ������
     Procedure MyArrowLeft(ix,iy : Integer);  // �����
     Procedure MyArrowDownLeft(ix,iy : Integer); // ����� ����� � ����
     Procedure MyArrowUpRight(ix,iy : Integer);  // ����� ������ � �����
     // ������ ��������� �������� (���� ������)
     Procedure RotorRoundClosedMetric;        // ������� ��������
     Procedure RotorRoundAlmostClosedMetric;  // ������� ������������
     Procedure RotorOvalClosedMetric;         // �������� ��������
     Procedure RotorOvalAlmostClosedMetric;   // �������� ������������
     Procedure RotorTrapeziumAlmostClosedMetric;  // ��������������� ������������
     Procedure RotorRectangleAlmostClosedMetric;  // ������������� ������������
     // ������ ��������� �������� (���� �������)
     Procedure StatorOvalMetric;                  // ��������
     Procedure StatorAlmostOvalMetric;            // ������������
     Procedure StatorTrapeziumMetric;             // ���������������
     Procedure StatorRectangleOpenMetric;         // ������������� ��������
     Procedure StatorRectangleAlmostClosedMetric; // ������������� ������������
     // ������� ������� ����������� ���������
     Procedure ChiefSizeASinchronMotorMetric;
     // ��������� ��������� �� �����
     Procedure MyVisibleProc;
  public
    { Public declarations }
    
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.rgTypeOfSystemClick(Sender: TObject);
var
  i : Integer; // �������
begin
  // �������� ���������� ���������� itype
  // ����� ����������� ����������
  // ���������������� ��� �������.
  itype:=rgTypeOfSystem.ItemIndex+1;
  inum:=0; // ����� ����������� ������
  // ������ ������ ����������
  if (itype=1) or (itype=2) then
  begin
     for i:=0 to 8 do bVis[i]:=false;
     MyVisibleProc;
     Button1.Visible:=false;
  end;
  case itype of
  1: begin
       cbStator.Visible:=false;
       cbRotor.Visible:=true;
       Label3.Visible:=true;
       Label4.Visible:=false;
       cbRotorChange(nil);
     end;
  2: begin
       cbRotor.Visible:=false;
       cbStator.Visible:=true;
       Label3.Visible:=false;
       Label4.Visible:=true;
       cbStatorChange(nil);
     end;
  3: begin
       cbRotor.Visible:=false;
       cbStator.Visible:=false;
       Label3.Visible:=false;
       Label4.Visible:=false;
     end;
  end; // case
  // �������������� �����������
  pnRotorStator.Visible:=iType<>3;
  Repaint;

end;

procedure TForm1.cbRotorChange(Sender: TObject);
begin
     // �������� ���������� ���������� inum
     // ����� ���������� ����������
     // ��� ������������
     if itype=1 then
        inum:=cbRotor.ItemIndex+1;
     // �������������� �����������
     Repaint;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
var
   // ���� �� �������� �����������
   // �������������� �������
   f : TStrings;
   // �������
   i : Shortint;
begin
  // ��������� ���������������� �����������
  xstart:=60; // ������� ����� ���������� �� ��� x
  ystart:=60; // ������� ������� ���������� �� ��� y
  xend:=PaintBox1.Width-60;  // ������� ������ ���������� �� ��� x
  xend2:=30+round(xend/2); // �������� �� ��� x
  yend:=PaintBox1.Height-60;  // ������� ������ ���������� �� ��� y

  f:=TStringList.Create();
  if inum<>0 then
  begin
    case itype of
       // ����� �������� ������
       1: f.LoadFromFile('input\rotor'+IntToStr(inum)+'.txt');
       // ����� �������� �������
       2: f.LoadFromFile('input\stator'+IntToStr(inum)+'.txt');
       // ������� ������� ������������ ���������
       3: f.LoadFromFile('input\motor.txt');
    end; // case

    // ���������� ������� s[] - ��������
    for i:=0 to f.Count-1 do s[i]:=StrToInt(f.Strings[i]);
    // ���������� ������� bVis[] - ��������� ���������
    for i:=0 to f.Count-1 do bVis[i]:=true;
    for i:=f.Count to 8 do bVis[i]:=false;
  end
  else
  begin
    if itype=3 then
    begin
      // ������� ������� ������������ ���������
      f.LoadFromFile('input\motor.txt');
      // ���������� ������� s[] - ��������
      for i:=0 to f.Count-1 do s[i]:=StrToInt(f.Strings[i]);
      // ���������� ������� bVis[] - ��������� ���������
      for i:=0 to f.Count-1 do bVis[i]:=true;
      for i:=f.Count to 8 do bVis[i]:=false;
    end;
  end;

  f.Free; // ����������� �������

  // ������� ����� �����.
  PaintBox1.Color:=RGB(255,255,255);
  PaintBox1.Canvas.Rectangle(0,PaintBox1.Height,PaintBox1.Width,0);

  if ishow=1 then
  begin
    case itype of
    // ���� ������
    1: begin
         case inum of
         // ������� ��������
         1: begin
              PaintBox1.Canvas.Pen.Width:=3;
              RotorRoundClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              RotorRoundClosedMetric;
            end;
         // ������� ������������
         2: begin
              PaintBox1.Canvas.Pen.Width:=3;
              RotorRoundAlmostClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              RotorRoundAlmostClosedMetric;
            end;
         // �������� ��������
         3: begin
              PaintBox1.Canvas.Pen.Width:=3;
              RotorOvalClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              RotorOvalClosedMetric;
            end;
         // �������� ������������
         4: begin
              PaintBox1.Canvas.Pen.Width:=3;
              RotorOvalAlmostClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              RotorOvalAlmostClosedMetric;
            end;
         // ��������������� ������������
         5: begin
              PaintBox1.Canvas.Pen.Width:=3;
              RotorTrapeziumAlmostClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              RotorTrapeziumAlmostClosedMetric;
            end;
         // ������������� ������������
         6: begin
              PaintBox1.Canvas.Pen.Width:=3;
              RotorRectangleAlmostClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              RotorRectangleAlmostClosedMetric;
            end;
         end; // case inum of
       end;
    // ���� �������
    2: begin
         case inum of
         // ��������
         1: begin
              PaintBox1.Canvas.Pen.Width:=3;
              StatorOvalShow;
              PaintBox1.Canvas.Pen.Width:=1;
              StatorOvalMetric;
            end;
         // ������������
         2: begin
              PaintBox1.Canvas.Pen.Width:=3;
              StatorAlmostOvalShow;
              PaintBox1.Canvas.Pen.Width:=1;
              StatorAlmostOvalMetric;
            end;
         // ���������������
         3: begin
              PaintBox1.Canvas.Pen.Width:=3;
              StatorTrapeziumShow;
              PaintBox1.Canvas.Pen.Width:=1;
              StatorTrapeziumMetric;
            end;
         // ������������� ��������
         4: begin
              PaintBox1.Canvas.Pen.Width:=3;
              StatorRectangleOpenShow;
              PaintBox1.Canvas.Pen.Width:=1;
              StatorRectangleOpenMetric;
            end;
         // ������������� ������������
         5: begin
              PaintBox1.Canvas.Pen.Width:=3;
              StatorRectangleAlmostClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              StatorRectangleAlmostClosedMetric;
            end;
         end; // case inum of
       end;
     // ������� ������� ����������� ���������
    3: begin
         PaintBox1.Canvas.Pen.Width:=3;
         ChiefSizeASinchronMotorShow;
         PaintBox1.Canvas.Pen.Width:=1;
         ChiefSizeASinchronMotorMetric;
       end;
    end; // case itype of
  end // ishow = 1
   else // ishow = 0
  begin
     case itype of
     1: begin
          case inum of
           1: RotorRoundClosedShow;
           2: RotorRoundAlmostClosedShow;
           3: RotorOvalClosedShow;
           4: RotorOvalAlmostClosedShow;
           5: RotorTrapeziumAlmostClosedShow;
           6: RotorRectangleAlmostClosedShow;
          end; // case inum of
        end;
     2: begin
          case inum of
           1: StatorOvalShow;
           2: StatorAlmostOvalShow;
           3: StatorTrapeziumShow;
           4: StatorRectangleOpenShow;
           5: StatorRectangleAlmostClosedShow;
           end; // case inum of
        end;
     3: ChiefSizeASinchronMotorShow;
     end; // case itype of
  end;

end;

procedure TForm1.cbStatorChange(Sender: TObject);
begin
     // �������� ���������� ���������� inum
     // ����� ���������� ����������
     // ��� ������������
     if itype=2 then
        inum:=cbStator.ItemIndex+1;
     // �������������� �����������
     Repaint;
end;

// ���� ������
// ������� ��������
procedure TForm1.RotorRoundClosedShow;
begin
  MyDuble(true); // ���������� �������� ��������
  //  s[0] - h�r
  //  s[1] - h�r
  //  s[2] - dr (�������)
  s[2]:=round(s[2]/2);
  //  s[2] - ������
  with PaintBox1.Canvas do
  begin
    MoveTo(xstart,ystart);
    LineTo(xend,ystart);
    Ellipse(xend2-s[2],ystart+s[1],xend2+s[2],ystart+s[0]);
  end; // with
  MyDuble(false); // ���������� �������� ��������
end;

// �������� ������������
procedure TForm1.RotorOvalAlmostClosedShow;
begin
   MyDuble(true); // ���������� �������� ��������
   //  s[0] - b�r
   s[0]:=round(s[0]/2);
   //  s[1] - h�r
   //  s[2] - h�r
   //  s[3] - d2r
   s[3]:=round(s[3]/2);  // ������
   //  s[4] - d1r
   s[4]:=round(s[4]/2);  // ������
   //  s[5] - h12r
   with PaintBox1.Canvas do
   begin
      // ������� �������������� �����
      MoveTo(xstart,ystart);
      LineTo(xend,ystart);
      // ���������� 1.
      Ellipse(xend2-s[4],ystart+s[2]-s[3]-s[4]-s[5],xend2+s[4],ystart+s[2]-s[3]-s[5]+s[4]);
      // �������� ������������� ��� ������� ������ ��������������
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-s[4],ystart+s[2]-s[3]-s[5],xend2+s[4],ystart+s[2]-s[3]-s[5]+s[4]);
      Pen.Color:=RGB(0,0,0); // ������
      // ���������� 2.
      Ellipse(xend2-s[3],ystart+s[2]-2*s[3],xend2+s[3],ystart+s[2]);
      // �������� ������������� ��� ������� ������� ��������������
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-s[3],ystart+s[2]-2*s[3],xend2+s[3],ystart+s[2]-s[3]);
      // ������ �����
      Rectangle(xend2-s[0],ystart,xend2+s[0],ystart+s[1]);
      Pen.Color:=RGB(0,0,0); // ������
      // ������ ��� ������������ �����
      MoveTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart+s[1]);
      MoveTo(xend2+s[0],ystart);
      LineTo(xend2+s[0],ystart+s[1]);
      // ������ �������� ���������� ��� ����� �����
      MoveTo(xend2-s[4],ystart+s[2]-s[3]-s[5]);
      LineTo(xend2-s[3],ystart+s[2]-s[3]);
      MoveTo(xend2+s[4],ystart+s[2]-s[3]-s[5]);
      LineTo(xend2+s[3],ystart+s[2]-s[3]);
   end; // with
   MyDuble(false); // ���������� �������� ��������
end;

// �������� ��������
procedure TForm1.RotorOvalClosedShow;
begin
   MyDuble(true); // ���������� �������� ��������
   //  s[0] - h�r
   //  s[1] - h�r
   //  s[2] - d2r
   s[2]:=round(s[2]/2);  // ������
   //  s[3] - d1r
   s[3]:=round(s[3]/2);  // ������
   //  s[4] - h12r
   with PaintBox1.Canvas do
   begin
      // ������� �������������� �����
      MoveTo(xstart,ystart);
      LineTo(xend,ystart);
      // �������������� 1.
      Ellipse(xend2-s[3],ystart+s[0],xend2+s[3],ystart+s[0]+2*s[3]);
      // �������� ������������� ��� ������� ������ ��������������
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-s[3],ystart+s[0]+s[3],xend2+s[3],ystart+s[0]+2*s[3]);
      Pen.Color:=RGB(0,0,0); // ������
      // �������������� 2.
      Ellipse(xend2-s[2],ystart+s[1]-2*s[2],xend2+s[2],ystart+s[1]);
      // �������� ������������� ��� ������� ������� ��������������
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-s[2],ystart+s[1]-2*s[2],xend2+s[2],ystart+s[1]-s[2]);
      Pen.Color:=RGB(0,0,0); // ������
      // ������ �������� ���������� ��� ����� �����
      MoveTo(xend2-s[3],ystart+s[0]+s[3]);
      LineTo(xend2-s[2],ystart+s[1]-s[2]);
      MoveTo(xend2+s[3],ystart+s[0]+s[3]);
      LineTo(xend2+s[2],ystart+s[1]-s[2]);
   end; // with
   MyDuble(false); // ���������� �������� ��������
end;

// ������� ������������
procedure TForm1.RotorRoundAlmostClosedShow;
begin
   MyDuble(true); // ���������� �������� ��������
   //  s[0] - b�r
   s[0]:=round(s[0]/2); // ��������
   //  s[1] - h�r
   //  s[2] - h�r
   //  s[3] - dr
   s[3]:=round(s[3]/2);
   // s[3] - ������
   with PaintBox1.Canvas do
   begin
      // ������� �������������� �����
      MoveTo(xstart,ystart);
      LineTo(xend,ystart);
      // ����������.
      Ellipse(xend2-s[3],ystart+s[2],xend2+s[3],ystart+s[2]-2*s[3]);
      // ������������� ��� �������� ������� ���� ����������,
      // � ����� ���������� ����� � ������ ������������ ����.
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-s[0],ystart+s[1],xend2+s[0],ystart);
      Pen.Color:=RGB(0,0,0); // ������
      // ����� ������������ �����
      MoveTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart+s[1]);
      // ������ ������������ �����
      MoveTo(xend2+s[0],ystart);
      LineTo(xend2+s[0],ystart+s[1]);
   end; // with
   MyDuble(false); // ���������� �������� ��������
end;

// ������������� ������������
procedure TForm1.RotorRectangleAlmostClosedShow;
begin
   MyDuble(true); // ���������� �������� ��������
   //  s[0] - b�r
   s[0]:=round(s[0]/2);  // ��������
   //  s[1] - h�r
   //  s[2] - d1r
   s[2]:= round(s[2]/2); //  ������
   //  s[3] - d2r
   s[3]:=round(s[3]/2); //   ������
   //  s[4] - h�r
   // ������ �������
   with PaintBox1.Canvas do
   begin
      MoveTo(xstart,ystart);
      LineTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart+s[4]);
      LineTo(xend2-s[2],ystart+s[4]);
      LineTo(xend2-s[3],ystart+s[1]);
      LineTo(xend2+s[3],ystart+s[1]);
      LineTo(xend2+s[2],ystart+s[4]);
      LineTo(xend2+s[0],ystart+s[4]);
      LineTo(xend2+s[0],ystart);
      LineTo(xend,ystart);
   end; // with
   MyDuble(false); // ���������� �������� ��������
end;

// ��������������� ������������
procedure TForm1.RotorTrapeziumAlmostClosedShow;
begin
   MyDuble(true); // ���������� �������� ��������
   //  s[0] - b�r
   s[0]:=round(s[0]/2);  // ��������
   //  s[1] - h�r
   //  s[2] - d1r
   s[2]:=round(s[2]/2); // ������
   //  s[3] - d2r
   s[3]:=round(s[3]/2); // ������
   //  s[4] - h�r
   //  s[5] - h12r  (������ ������������� �� �������)
   // ������ �������
   with PaintBox1.Canvas do
   begin
      MoveTo(xstart,ystart);
      LineTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart+s[4]);
      LineTo(xend2-s[2],ystart+s[1]-s[5]);
      LineTo(xend2-s[3],ystart+s[1]);
      LineTo(xend2+s[3],ystart+s[1]);
      LineTo(xend2+s[2],ystart+s[1]-s[5]);
      LineTo(xend2+s[0],ystart+s[4]);
      LineTo(xend2+s[0],ystart);
      LineTo(xend,ystart);
   end; // with
   MyDuble(false); // ���������� �������� ��������
end;

// ���� �������
// ��������
procedure TForm1.StatorOvalShow;
begin
   MyDuble(true); // ���������� �������� ��������
   //  s[0] - h�s  - ���� ������ ���������
   // ��� ������������ ������ ���� ���������
   // h�s = round(d2/2) + h12 + round((d1-b�s)/2) + h�s.
   //  s[1] - b�s
   s[1]:=round(s[1]/2);  // ��������
   //  s[2] - h�s
   //  s[3] - d2
   s[3]:=round(s[3]/2); // ��������
   //  s[4] - d1
   s[4]:=round(s[4]/2); // ��������
   //  s[5] - h12
   with PaintBox1.Canvas do
   begin
      // ������� ������ ���� ����������
      Ellipse(xend2-s[3],yend-s[2]-s[4]+s[1]-s[5]-s[3],xend2+s[3],yend-s[2]-s[4]+s[1]-s[5]+s[3]);
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-s[3],yend-s[2]-s[4]+s[1]-s[5]-s[3],xend2,yend-s[2]-s[4]+s[1]-s[5]+s[3]);
      Rectangle(xend2,yend-s[2]-s[4]+s[1]-s[5],xend2+s[3],yend-s[2]-s[4]+s[1]-s[5]+s[3]);
      Pen.Color:=RGB(0,0,0); // ������
      // ������� ����� ���� ����������
      Ellipse(xend2-2*s[3],yend-s[2]-s[4]+s[1]-s[5]-s[3],xend2,yend-s[2]-s[4]+s[1]-s[5]+s[3]);
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-2*s[3],yend-s[2]-s[4]+s[1]-s[5]-s[3],xend2-s[3],yend-s[2]-s[4]+s[1]-s[5]+s[3]);
      Rectangle(xend2-s[3],yend-s[2]-s[4]+s[1]-s[5],xend2,yend-s[2]-s[4]+s[1]-s[5]+s[3]);
      Pen.Color:=RGB(0,0,0); // ������
      // ������ �����
      // ������ ������� �����
      MoveTo(xend2,yend-s[2]-s[4]+s[1]-s[5]-s[3]);
      LineTo(xend2+s[3],yend-s[2]-s[4]+s[1]-s[5]);
      // ����� ������� �����
      MoveTo(xend2-s[3],yend-s[2]-s[4]+s[1]-s[5]-s[3]);
      LineTo(xend2,yend-s[2]-s[4]+s[1]-s[5]);
      // ������ ������� �������
      MoveTo(xend2+s[3],yend-s[2]-s[4]+s[1]-s[5]);
      LineTo(xend2+s[4],yend-s[2]-s[4]+s[1]);
      // ����� ������� �������
      MoveTo(xend2-s[3],yend-s[2]-s[4]+s[1]-s[5]);
      LineTo(xend2-s[4],yend-s[2]-s[4]+s[1]);
      // ������ ���� �����������
      // ������ ������ ���� ����������
      Ellipse(xend2+s[1]-s[4],yend-s[2]-s[4]+s[1],xend2+s[4],yend-s[2]+s[4]-s[1]);
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2+s[1]-s[4],yend-s[2]-s[4]+s[1],xend2+s[1],yend-s[2]+s[4]-s[1]);
      Rectangle(xend2+s[1],yend-s[2],xend2+s[4],yend-s[2]+s[4]-s[1]);
      Pen.Color:=RGB(0,0,0); // ������
      // ������ ����� ���� ����������
      Ellipse(xend2-2*s[4],yend-s[2]-s[4]+s[1],xend2-s[1],yend-s[2]+s[4]-s[1]);
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-2*s[4],yend-s[2]-s[4]+s[1],xend2-s[4],yend-s[2]+s[4]-s[1]);
      Rectangle(xend2-s[4],yend-s[2],xend2-s[1],yend-s[2]+s[4]-s[1]);
      Pen.Color:=RGB(0,0,0); // ������
      // ������ �����
      // ������ ������ �����
      MoveTo(xend2+s[1],yend-s[2]-s[4]+s[1]);
      LineTo(xend2+s[4],yend-s[2]);
      // ����� ������ �����
      MoveTo(xend2-s[4],yend-s[2]-s[4]+s[1]);
      LineTo(xend2-s[1],yend-s[2]);
      // ����� ������ ����� ����� � ������������ ��������
      MoveTo(xstart,yend);
      LineTo(xend2-s[1],yend);
      LineTo(xend2-s[1],yend-s[2]);
      // ����� ������ ������ ����� � ������������ ��������
      MoveTo(xend2+s[1],yend-s[2]);
      LineTo(xend2+s[1],yend);
      LineTo(xend,yend);
   end; // with
   MyDuble(false); // ���������� �������� ��������
end;

// ������������� ������������
procedure TForm1.StatorRectangleAlmostClosedShow;
begin
   MyDuble(true); // ���������� �������� ��������
   // s[0] - b1
   s[0]:=round(s[0]/2); // ��������
   // s[1] - h�s
   // s[2] - b�s
   s[2]:=round(s[2]/2); // ��������
   // s[3] - h�s
   with PaintBox1.Canvas do
   begin
      // ������ �������
      MoveTo(xstart,yend);
      LineTo(xend2-s[2],yend);
      LineTo(xend2-s[2],yend-s[3]);
      LineTo(xend2-s[0],yend-s[3]);
      LineTo(xend2-s[0],yend-s[1]);
      LineTo(xend2+s[0],yend-s[1]);
      LineTo(xend2+s[0],yend-s[3]);
      LineTo(xend2+s[2],yend-s[3]);
      LineTo(xend2+s[2],yend);
      LineTo(xend,yend);
   end;
   MyDuble(false); // ���������� �������� ��������
end;

// ������������
procedure TForm1.StatorAlmostOvalShow;
begin
   MyDuble(true); // ���������� �������� ��������
   // s[0] - b2
   s[0]:=round(s[0]/2); // ��������
   // s[1] - h�s
   // s[2] - h�s
   // s[3] - b�s
   s[3]:=round(s[3]/2); // ��������
   // s[4] - d1
   s[4]:=round(s[4]/2); // ��������
   // s[5] - h12
   with PaintBox1.Canvas do
   begin
      // ������ ������� �������� ����������
      Ellipse(xend2-s[0]+2*s[4],yend-s[1],xend2+s[0],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-s[0]+2*s[4],yend-s[1],xend2+s[4],yend-s[1]+2*(s[0]-s[4]));
      Rectangle(xend2+s[4],yend-s[1]+s[0]-s[4],xend2+s[0],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(0,0,0); // ������
      // ����� ������� �������� ����������
      Ellipse(xend2-2*s[0]+s[4],yend-s[1],xend2-s[4],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-2*s[0]+s[4],yend-s[1],xend2-s[0],yend-s[1]+2*(s[0]-s[4]));
      Rectangle(xend2-s[0],yend-s[1]+s[0]-s[4],xend2-s[4],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(0,0,0); // ������
      // ������� �����
      MoveTo(xend2-s[4],yend-s[1]);
      LineTo(xend2+s[4],yend-s[1]);
      // ����� ������� �����
      MoveTo(xend2-s[0],yend-s[1]);
      LineTo(xend2-s[4],yend-s[1]+s[0]-s[4]);
      // ������ ������� �����
      MoveTo(xend2+s[4],yend-s[1]);
      LineTo(xend2+s[0],yend-s[1]+s[0]-s[4]);
      // ������ ������� �������� ����������
      Ellipse(xend2-s[4]+2*s[3],yend-s[2]-s[4]+s[3],xend2+s[4],yend-s[2]+s[4]-s[3]);
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-s[4]+2*s[3],yend-s[2]-s[4]+s[3],xend2+s[3],yend-s[2]+s[4]-s[3]);
      Rectangle(xend2+s[3],yend-s[2],xend2+s[4],yend-s[2]+s[4]-s[3]);
      Pen.Color:=RGB(0,0,0); // ������
      // ����� ������ �������� ����������
      Ellipse(xend2-2*s[4]+s[3],yend-s[2]-s[4]+s[3],xend2-s[3],yend-s[2]+s[4]-s[3]);
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-2*s[4]+s[3],yend-s[1]+s[5],xend2-s[4],yend-s[2]+s[4]-s[3]);
      Rectangle(xend2-s[4],yend-s[2],xend2-s[3],yend-s[2]+s[4]-s[3]);
      Pen.Color:=RGB(0,0,0); // ������
      // ������ �����
      // ����� ��������� �����
      MoveTo(xend2-s[0],yend-s[1]);
      LineTo(xend2-s[4],yend-s[1]+s[5]);
      // ������ ��������� �����
      MoveTo(xend2+s[0],yend-s[1]);
      LineTo(xend2+s[4],yend-s[1]+s[5]);
      // ����� ������ �����
      MoveTo(xend2-s[4],yend-s[1]+s[5]);
      LineTo(xend2-s[3],yend-s[2]);
      // ������ ������ �����
      MoveTo(xend2+s[3],yend-s[1]+s[5]);
      LineTo(xend2+s[4],yend-s[2]);
      // ����� ������ ����� ����� � ������������ ��������
      MoveTo(xstart,yend);
      LineTo(xend2-s[3],yend);
      LineTo(xend2-s[3],yend-s[2]);
      // ����� ������ ������ ����� � ������������ ��������
      MoveTo(xend2+s[3],yend-s[2]);
      LineTo(xend2+s[3],yend);
      LineTo(xend,yend);
   end; // with
   MyDuble(false); // ���������� �������� ��������
end;

// ���������������
procedure TForm1.StatorTrapeziumShow;
begin
   MyDuble(true); // ���������� �������� ��������
   // s[0] - b2
   s[0]:=round(s[0]/2); // ��������
   // s[1] - h�s
   // s[2] - h�s
   // s[3] - b�s
   s[3]:=round(s[3]/2); // ��������
   // s[4] - b1
   s[4]:=round(s[4]/2); // ��������
   // s[5] - h12
   // s[6] - h3
   with PaintBox1.Canvas do
   begin
      // ������ ������� �������� ����������
      Ellipse(xend2-s[0]+2*s[4],yend-s[1],xend2+s[0],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-s[0]+2*s[4],yend-s[1],xend2+s[4],yend-s[1]+2*(s[0]-s[4]));
      Rectangle(xend2+s[4],yend-s[1]+s[0]-s[4],xend2+s[0],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(0,0,0); // ������
      // ����� ������� �������� ����������
      Ellipse(xend2-2*s[0]+s[4],yend-s[1],xend2-s[4],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(255,255,255); // �����
      Rectangle(xend2-2*s[0]+s[4],yend-s[1],xend2-s[0],yend-s[1]+2*(s[0]-s[4]));
      Rectangle(xend2-s[0],yend-s[1]+s[0]-s[4],xend2-s[4],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(0,0,0); // ������
      // ������� �����
      MoveTo(xend2-s[4],yend-s[1]);
      LineTo(xend2+s[4],yend-s[1]);
      // ����� ������� �����
      MoveTo(xend2-s[0],yend-s[1]);
      LineTo(xend2-s[4],yend-s[1]+s[0]-s[4]);
      // ������ ������� �����
      MoveTo(xend2+s[4],yend-s[1]);
      LineTo(xend2+s[0],yend-s[1]+s[0]-s[4]);
      // ������ �����
      // ����� ��������� �����
      MoveTo(xend2-s[0],yend-s[1]);
      LineTo(xend2-s[4],yend-s[1]+s[5]);
      // ������ ��������� �����
      MoveTo(xend2+s[0],yend-s[1]);
      LineTo(xend2+s[4],yend-s[1]+s[5]);
      // ����� ������ �����
      MoveTo(xend2-s[4],yend-s[1]+s[5]);
      LineTo(xend2-s[3],yend-s[2]);
      // ������ ������ �����
      MoveTo(xend2+s[3],yend-s[2]);
      LineTo(xend2+s[4],yend-s[2]-s[6]);
      // ����� ������ ����� ����� � ������������ ��������
      MoveTo(xstart,yend);
      LineTo(xend2-s[3],yend);
      LineTo(xend2-s[3],yend-s[2]);
      // ����� ������ ������ ����� � ������������ ��������
      MoveTo(xend2+s[3],yend-s[2]);
      LineTo(xend2+s[3],yend);
      LineTo(xend,yend);
   end; // with
   MyDuble(false); // ���������� �������� ��������
end;

// ������� ������� ����������� ���������
procedure TForm1.ChiefSizeASinchronMotorShow;
begin
   MyDuble(true); // ���������� �������� ��������
   // s[0] - ls
   s[0]:=round(s[0]/2); // ��������
   // s[1] - d
   // s[2] - lr
   s[2]:=round(s[2]/2); // ��������
   // s[3] - D�
   // s[4] - D��
   // s[5] - D
   // s[6] - D�
   // s[7] - a
   // s[8] - b
   s[8]:=round(s[8]/2); // ��������

   // ������ �������
   with PaintBox1.Canvas do
   begin
      // ��������� (���������)
      MoveTo(xstart+20,yend);
      LineTo(xstart+20,yend-s[3]);
      LineTo(xend-20,yend-s[3]);
      LineTo(xend-20,yend);
      // �����
      Rectangle(xend2-s[2],yend-s[3],xend2+s[2],yend-s[5]+s[1]);
      // ����� �������������
      Rectangle(xend2-s[2]-s[7],yend-s[4]-s[8],xend2-s[2],yend-s[4]+s[8]);
      // ������ �������������
      Rectangle(xend2+s[2]+s[7],yend-s[4]-s[8],xend2+s[2],yend-s[4]+s[8]);
      // ������
      Rectangle(xend2-s[0],yend-s[6],xend2+s[0],yend-s[5]);
   end; // with

   MyDuble(false); // ���������� �������� ��������
end;

// ������������� ��������
procedure TForm1.StatorRectangleOpenShow;
const
  idelta = 4; // �����
var
  ibuf,ih : Word; // ���������� �������������� ��������
begin
   MyDuble(true); // ���������� �������� ��������
   // s[0] - h�s
   // s[1] - b1
   s[1]:=round(s[1]/2); // ��������
   // s[2] - h
   with PaintBox1.Canvas do
   begin
      // ������ �������
      MoveTo(xstart,yend);
      LineTo(xend2-s[1],yend);
      ibuf:=round((s[2]-idelta)/2); // ������ �� ���������
      ih:=round((s[2]-idelta-ibuf)/2);
      LineTo(xend2-s[1],yend-ibuf);
      LineTo(xend2-s[1]-ibuf,yend-ibuf-ih);
      LineTo(xend2-s[1],yend-ibuf-2*ih);
      LineTo(xend2-s[1],yend-s[0]);
      LineTo(xend2+s[1],yend-s[0]);
      LineTo(xend2+s[1],yend-ibuf-2*ih);
      LineTo(xend2+s[1]+ibuf,yend-ibuf-ih);
      LineTo(xend2+s[1],yend-ibuf);
      LineTo(xend2+s[1],yend);
      LineTo(xend,yend);
      // ��������� ��� ����� ������ ���� ����
      Brush.Style:=bsBDiagonal; // ������� ����� ��������
      Brush.Color:=RGB(0,0,0); // ������ ���� �����
      Rectangle(xend2-s[1]+idelta,yend-s[0]+idelta,xend2+s[1]-idelta,yend-s[2]);
      Brush.Style:=bsClear; // ����� ����� �������� �������
      Brush.Color:=RGB(255,255,255); // ����� ���� �����
      ibuf:=round((s[0]-s[2])/2);
      Rectangle(xend2-s[1]+idelta,yend-s[2]-ibuf-idelta,xend2+s[1]-idelta,yend-s[2]-ibuf+idelta);
   end; // with
   MyDuble(false); // ���������� �������� ��������
end;

// �������� ������������
procedure TForm1.RotorOvalAlmostClosedMetric;
const
  xstep = 10; // ������ �� ��� x
var
  ibuf : Word; // ���������� �������������� ��������
begin
   MyDuble(true); // ���������� �������� ��������
   //  s[0] - b�r
   s[0]:=round(s[0]/2);
   //  s[1] - h�r
   //  s[2] - h�r
   //  s[3] - d2r
   s[3]:=round(s[3]/2);  // ������
   //  s[4] - d1r
   s[4]:=round(s[4]/2);  // ������
   //  s[5] - h12r
   with PaintBox1.Canvas do
   begin
      MoveTo(xend2,ystart+s[2]);
      LineTo(xend2-s[4]-xstep-5,ystart+s[2]);
      MoveTo(xend2-s[4]-xstep,ystart+s[2]);
      LineTo(xend2-s[4]-xstep,ystart);
      MyArrowUp(xend2-s[4]-xstep,ystart);
      MyArrowDown(xend2-s[4]-xstep,ystart+s[2]);
      ibuf:=round(s[2]/2);
      TextOut(xend2-s[4]-xstep-20,ystart+ibuf,'h�r');
      MoveTo(xend2-s[4],ystart+s[2]-s[3]-s[5]);
      LineTo(xend2+2*s[4]+5,ystart+s[2]-s[3]-s[5]);
      MoveTo(xend2-s[3],ystart+s[2]-s[3]);
      LineTo(xend2+2*s[4]+5,ystart+s[2]-s[3]);
      MyArrowLeft(xend2-s[4],ystart+s[2]-s[3]-s[5]);
      MyArrowRight(xend2+s[4],ystart+s[2]-s[3]-s[5]);
      MyArrowLeft(xend2-s[3],ystart+s[2]-s[3]);
      MyArrowRight(xend2+s[3],ystart+s[2]-s[3]);
      MoveTo(xend2+2*s[4],ystart+s[2]-s[3]-s[5]);
      LineTo(xend2+2*s[4],ystart+s[2]-s[3]);
      MyArrowUp(xend2+2*s[4],ystart+s[2]-s[3]-s[5]);
      MyArrowDown(xend2+2*s[4],ystart+s[2]-s[3]);
      TextOut(xend2-10,ystart+s[2]-s[3]-s[5]-15,'d1r');
      TextOut(xend2-10,ystart+s[2]-s[3]-15,'d2r');
      ibuf:=round(s[5]/2);
      TextOut(xend2+2*s[4]+4,ystart+s[2]-s[3]-ibuf,'h12r');
      MoveTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart-s[4]);
      MoveTo(xend2+s[0],ystart);
      LineTo(xend2+s[0],ystart-s[4]);
      s[4]:=round(s[4]/2);
      MoveTo(xend2-s[0]-2*s[4],ystart-s[4]);
      LineTo(xend2+2*s[4],ystart-s[4]);
      MyArrowLeft(xend2+s[0],ystart-s[4]);
      MyArrowRight(xend2-s[0],ystart-s[4]);
      TextOut(xend2-s[0]-30,ystart-s[4]-20,'b�r');
      MoveTo(xend2+s[0],ystart+s[1]);
      LineTo(xend2+s[0]+s[4]+xstep+5,ystart+s[1]);
      MoveTo(xend2+s[0]+s[4]+xstep,ystart-2*s[4]);
      LineTo(xend2+s[0]+s[4]+xstep,ystart+s[0]+s[4]);
      MyArrowUp(xend2+s[0]+s[4]+xstep,ystart+s[1]);
      MyArrowDown(xend2+s[0]+s[4]+xstep,ystart);
      TextOut(xend2+s[0]+s[4]+xstep+10,ystart+s[1],'h�r');
   end; // with
   MyDuble(false); // ���������� �������� ��������
   MyVisibleProc; // ��������� �����������
   // ����� ������������ �� �����
   Label5.Caption:='b�r';
   Label6.Caption:='h�r';
   Label7.Caption:='h�r';
   Label8.Caption:='d2r';
   Label9.Caption:='d1r';
   Label10.Caption:='h12r';
end;

// �������� ��������
procedure TForm1.RotorOvalClosedMetric;
const
  xstep = 10; // ������ �����
begin
   MyDuble(true); // ���������� �������� ��������
   //  s[0] - h�r
   //  s[1] - h�r
   //  s[2] - d2r
   s[2]:=round(s[2]/2);  // ������
   //  s[3] - d1r
   s[3]:=round(s[3]/2);  // ������
   //  s[4] - h12r
   with PaintBox1.Canvas do
   begin
      MoveTo(xend2,ystart+s[1]);
      LineTo(xend2-s[3]-xstep-5,ystart+s[1]);
      MoveTo(xend2-s[3]-xstep,ystart+s[1]);
      LineTo(xend2-s[3]-xstep,ystart);
      MyArrowUp(xend2-s[3]-xstep,ystart); // ������� �����
      MyArrowDown(xend2-s[3]-xstep,ystart+s[1]); // ������� ����
      s[1]:=round(s[1]/2);
      TextOut(xend2-s[3]-xstep-20,ystart+s[1],'h�r');
      s[1]:=s[1]*2;
      MoveTo(xend2-s[3],ystart+s[0]+s[3]);
      LineTo(xend2+2*s[3]+5,ystart+s[0]+s[3]);
      MyArrowLeft(xend2-s[3],ystart+s[0]+s[3]); // ������� �����
      MyArrowRight(xend2+s[3],ystart+s[0]+s[3]); // ������� ������
      TextOut(xend2-10,ystart+s[0]+s[3]+3,'d1r');
      MoveTo(xend2-s[2],ystart+s[1]-s[2]);
      LineTo(xend2+2*s[3]+5,ystart+s[1]-s[2]);
      MyArrowLeft(xend2-s[2],ystart+s[1]-s[2]); // ������� �����
      MyArrowRight(xend2+s[2],ystart+s[1]-s[2]); // ������� ������
      TextOut(xend2-10,ystart+s[1]-s[2]-14,'d2r');
      MoveTo(xend2+2*s[3],ystart+s[0]+s[3]);
      LineTo(xend2+2*s[3],ystart+s[1]-s[2]);
      MyArrowUp(xend2+2*s[3],ystart+s[0]+s[3]);  // ������� �����
      MyArrowDown(xend2+2*s[3],ystart+s[1]-s[2]); // ������� ����
      TextOut(xend2+2*s[3]+3,ystart+s[1]-2*s[2]-15,'h12r');
      s[3]:=round(s[3]/2); // �������� �������
      MoveTo(xend2,ystart+s[0]+s[3]);
      LineTo(xend2,ystart-2*s[3]);
      MyArrowUp(xend2,ystart+s[0]);  // ������� �����
      MyArrowDown(xend2,ystart); // ������� ����
      TextOut(xend2-30,ystart-20,'h�r');
   end; // with
   MyDuble(false); // ���������� �������� ��������
   MyVisibleProc; // ��������� �����������
   // ����� ������������ �� �����
   Label5.Caption:='h�r';
   Label6.Caption:='h�r';
   Label7.Caption:='d2r';
   Label8.Caption:='d1r';
   Label9.Caption:='h12r';
end;

// ������������� ������������
procedure TForm1.RotorRectangleAlmostClosedMetric;
const
   xstep = 10; // ������ �� ��� x
var
   imax,ibuf : Integer; // ���������� ���������� ��������
begin
   MyDuble(true); // ���������� �������� ��������
   //  s[0] - b�r
   s[0]:=round(s[0]/2);  // ��������
   //  s[1] - h�r
   //  s[2] - d1r
   s[2]:= round(s[2]/2); // ��������
   //  s[3] - d2r
   s[3]:= round(s[3]/2); // ��������
   //  s[4] - h�r
   with PaintBox1.Canvas do
   begin
      if s[3]>s[2] then imax:=s[3]
      else imax:=s[2];
      MoveTo(xend2-s[3],ystart+s[1]);
      LineTo(xend2-imax-xstep-5,ystart+s[1]);
      MoveTo(xend2-imax-xstep,ystart+s[1]);
      LineTo(xend2-imax-xstep,ystart);
      MyArrowUp(xend2-imax-xstep,ystart); // ������� �����
      MyArrowDown(xend2-imax-xstep,ystart+s[1]); // ������� ����
      // h�r
      ibuf:=round(s[1]/2);
      TextOut(xend2-imax-xstep-20,ystart+ibuf,'h�r');
      MoveTo(xend2-s[3],ystart+s[1]);
      LineTo(xend2-s[3],ystart+s[1]+25);
      MoveTo(xend2+s[3],ystart+s[1]);
      LineTo(xend2+s[3],ystart+s[1]+25);
      MoveTo(xend2-s[3],ystart+s[1]+20);
      LineTo(xend2+s[3],ystart+s[1]+20);
      MyArrowLeft(xend2-s[3],ystart+s[1]+20); // ������� �����
      MyArrowRight(xend2+s[3],ystart+s[1]+20); // ������� ������
      // d2r
      TextOut(xend2-10,ystart+s[1]+25,'d2r');
      MoveTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart-25);
      MoveTo(xend2+s[0],ystart);
      LineTo(xend2+s[0],ystart-25);
      MoveTo(xend2-s[0]-30,ystart-20);
      LineTo(xend2+s[0]+20,ystart-20);
      MyArrowLeft(xend2+s[0],ystart-20); // ������� �����
      MyArrowRight(xend2-s[0],ystart-20); // ������� ������
      // b�r
      TextOut(xend2-s[0]-25,ystart-37,'b�r');
      MoveTo(xend2+s[0],ystart+s[4]);
      LineTo(xend2+2*s[0]+s[2]+5,ystart+s[4]);
      MoveTo(xend2+2*s[0]+s[2],ystart+s[4]+20);
      LineTo(xend2+2*s[0]+s[2],ystart-25);
      MyArrowUp(xend2+2*s[0]+s[2],ystart+s[4]);
      MyArrowDown(xend2+2*s[0]+s[2],ystart);
      // h�r
      TextOut(xend2+2*s[0]+s[2]+6,ystart+s[4]-10,'h�r');
      MoveTo(xend2-s[2],ystart+s[4]);
      LineTo(xend2-s[2],ystart+s[4]+25);
      MoveTo(xend2+s[2],ystart+s[4]);
      LineTo(xend2+s[2],ystart+s[4]+25);
      MoveTo(xend2-s[2],ystart+s[4]+20);
      LineTo(xend2+s[2],ystart+s[4]+20);
      MyArrowLeft(xend2-s[2],ystart+s[4]+20); // ������� �����
      MyArrowRight(xend2+s[2],ystart+s[4]+20); // ������� ������
      // d1r
      TextOut(xend2-10,ystart+s[4]+25,'d1r');
   end; // with
   MyDuble(false); // ���������� �������� ��������
   MyVisibleProc; // ��������� �����������
   // ����� ������������ �� �����
   Label5.Caption:='b�r';
   Label6.Caption:='h�r';
   Label7.Caption:='d1r';
   Label8.Caption:='d2r';
   Label9.Caption:='h�r';
end;

// ������� ������������
procedure TForm1.RotorRoundAlmostClosedMetric;
const
   xstep = 10; // ������ �����
var
   ibuf : Integer; // ���������� �������������� ��������
begin
   MyDuble(true); // ���������� �������� ��������
   //  s[0] - b�r
   s[0]:=round(s[0]/2); // ��������
   //  s[1] - h�r
   //  s[2] - h�r
   //  s[3] - dr
   s[3]:=round(s[3]/2);
   // s[3] - ������
   with PaintBox1.Canvas do
   begin
      MoveTo(xend2,ystart+s[2]);
      LineTo(xend2-s[3]-xstep-5,ystart+s[2]);
      MoveTo(xend2-s[3]-xstep,ystart+s[2]);
      LineTo(xend2-s[3]-xstep,ystart);
      TextOut(xend2-s[3]-xstep-30,ystart+s[2]-20,'h�r');
      MyArrowUp(xend2-s[3]-xstep,ystart);  // ������� �����
      MyArrowDown(xend2-s[3]-xstep,ystart+s[2]);  // ������� ����
      MoveTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart-s[3]);
      MoveTo(xend2+s[0],ystart);
      LineTo(xend2+s[0],ystart-s[3]);
      s[3]:=round(s[3]/2); // �������� �������
      MoveTo(xend2-s[0]-s[3],ystart-s[3]);
      LineTo(xend2+s[0]+s[3],ystart-s[3]);
      TextOut(xend2-s[0]-s[3]-20,ystart-s[3]-20,'b�r');
      MyArrowRight(xend2-s[0],ystart-s[3]); // ������� ������
      MyArrowLeft(xend2+s[0],ystart-s[3]);  // ������� �����
      MoveTo(xend2+s[0],ystart+s[1]);
      LineTo(xend2+s[0]+2*s[3],ystart+s[1]);
      MoveTo(xend2+s[0]+2*s[3]-5,ystart-2*s[3]);
      LineTo(xend2+s[0]+2*s[3]-5,ystart+s[1]+2*s[3]);
      TextOut(xend2+s[0]+2*s[3]+3,ystart+s[1]+5,'h�r');
      MyArrowUp(xend2+s[0]+2*s[3]-5,ystart+s[1]); // ������� �����
      MyArrowDown(xend2+s[0]+2*s[3]-5,ystart); // ������� ����
      ibuf:=round(s[3]/4);  // ��������� �������
      MoveTo(xend2-5*ibuf,ystart+s[2]-3*ibuf);
      LineTo(xend2+5*ibuf,ystart+s[1]+3*ibuf);
      TextOut(xend2-13,ystart+s[1]+8*ibuf-15,'dr');
      MyArrowUpRight(xend2+5*ibuf,ystart+s[1]+3*ibuf); // ��������� ������� ����� � ������
      MyArrowDownLeft(xend2-5*ibuf,ystart+s[2]-3*ibuf); // ��������� ������� ���� � �����
   end; // with
   MyDuble(false); // ���������� �������� ��������
   MyVisibleProc; // ��������� �����������
   // ����� ������������ �� �����
   Label5.Caption:='b�r';
   Label6.Caption:='h�r';
   Label7.Caption:='h�r';
   Label8.Caption:='dr';
end;

// ������� ��������
procedure TForm1.RotorRoundClosedMetric;
const
   xstep = 10; // ������ �����
var
   ibuf : Integer; // ���������� �������������� ��������
begin
  MyDuble(true); // ���������� �������� ��������
  //  s[0] - h�r
  //  s[1] - h�r
  //  s[2] - dr (�������)
  s[2]:=round(s[2]/2);
  //  s[2] - ������
  with PaintBox1.Canvas do
  begin
    MoveTo(xend2,ystart+s[1]);
    LineTo(xend2-s[2]-xstep-5,ystart+s[1]);
    MoveTo(xend2-s[2]-xstep,ystart+s[1]);
    LineTo(xend2-s[2]-xstep,ystart);
    TextOut(xend2-s[2]-xstep-30,ystart+s[1]-20,'h�r');
    MyArrowUp(xend2-s[2]-xstep,ystart); // ������� �����
    MyArrowDown(xend2-s[2]-xstep,ystart+s[1]); // ������� ����
    s[2]:=round(s[2]/2);  // �������� �������
    MoveTo(xend2,ystart+s[2]+s[0]);
    LineTo(xend2,ystart-2*s[2]);
    TextOut(xend2-30,ystart-20,'h�r');
    MyArrowUp(xend2,ystart+s[0]); // ������� �����
    MyArrowDown(xend2,ystart);  // ������� ����
    ibuf:=round(s[2]/4);  // ��������� �������
    MoveTo(xend2-5*ibuf,ystart+s[1]-3*ibuf);
    LineTo(xend2+5*ibuf,ystart+s[0]+3*ibuf);
    TextOut(xend2-13,ystart+s[0]+8*ibuf-15,'dr');
    MyArrowUpRight(xend2+5*ibuf,ystart+s[0]+3*ibuf); // ��������� ������� ����� � ������
    MyArrowDownLeft(xend2-5*ibuf,ystart+s[1]-3*ibuf); // ��������� ������� ���� � �����
  end;
  MyDuble(false); // ���������� �������� ��������
  MyVisibleProc; // ��������� �����������
  // ����� ������������ �� �����
  Label5.Caption:='h�r';
  Label6.Caption:='h�r';
  Label7.Caption:='dr';
end;

// ��������������� ������������
procedure TForm1.RotorTrapeziumAlmostClosedMetric;
const
   xstep = 10; // ������ �� ��� x
var
   imax,ibuf : Integer;
begin
   MyDuble(true); // ���������� �������� ��������
   //  s[0] - b�r
   s[0]:=round(s[0]/2);  // ��������
   //  s[1] - h�r
   //  s[2] - d1r
   s[2]:=round(s[2]/2); // ������
   //  s[3] - d2r
   s[3]:=round(s[3]/2); // ������
   //  s[4] - h�r
   //  s[5] - h12r
   with PaintBox1.Canvas do
   begin
      if s[3]>s[2] then imax:=s[3]
      else imax:=s[2];
      MoveTo(xend2-s[3],ystart+s[1]);
      LineTo(xend2-imax-xstep-5,ystart+s[1]);
      MoveTo(xend2-imax-xstep,ystart+s[1]);
      LineTo(xend2-imax-xstep,ystart);
      MyArrowUp(xend2-imax-xstep,ystart); // ������� �����
      MyArrowDown(xend2-imax-xstep,ystart+s[1]); // ������� ����
      // h�r
      ibuf:=round(s[1]/2);
      TextOut(xend2-imax-xstep-20,ystart+ibuf,'h�r');
      MoveTo(xend2-s[3],ystart+s[1]);
      LineTo(xend2-s[3],ystart+s[1]+25);
      MoveTo(xend2+s[3],ystart+s[1]);
      LineTo(xend2+s[3],ystart+s[1]+25);
      MoveTo(xend2-s[3],ystart+s[1]+20);
      LineTo(xend2+s[3],ystart+s[1]+20);
      MyArrowLeft(xend2-s[3],ystart+s[1]+20); // ������� �����
      MyArrowRight(xend2+s[3],ystart+s[1]+20); // ������� ������
      TextOut(xend2-10,ystart+s[1]+25,'d2r');  // d2r
      MoveTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart-25);
      MoveTo(xend2+s[0],ystart);
      LineTo(xend2+s[0],ystart-25);
      MoveTo(xend2-s[0]-30,ystart-20);
      LineTo(xend2+s[0]+20,ystart-20);
      MyArrowLeft(xend2+s[0],ystart-20); // ������� �����
      MyArrowRight(xend2-s[0],ystart-20); // ������� ������
      TextOut(xend2-s[0]-25,ystart-37,'b�r'); // b�r
      MoveTo(xend2+s[0],ystart+s[4]);
      LineTo(xend2+2*s[0]+s[2]+5,ystart+s[4]);
      MoveTo(xend2+2*s[0]+s[2],ystart+s[4]+20);
      LineTo(xend2+2*s[0]+s[2],ystart-25);
      MyArrowUp(xend2+2*s[0]+s[2],ystart+s[4]);
      MyArrowDown(xend2+2*s[0]+s[2],ystart);
      TextOut(xend2+2*s[0]+s[2]+6,ystart+s[4]-10,'h�r'); // h�r
      MoveTo(xend2-s[2],ystart+s[4]);
      LineTo(xend2-s[2],ystart+s[4]+25);
      MoveTo(xend2+s[2],ystart+s[4]);
      LineTo(xend2+s[2],ystart+s[4]+25);
      MoveTo(xend2-s[2],ystart+s[4]+20);
      LineTo(xend2+s[2],ystart+s[4]+20);
      MyArrowLeft(xend2-s[2],ystart+s[4]+20); // ������� �����
      MyArrowRight(xend2+s[2],ystart+s[4]+20); // ������� ������
      TextOut(xend2-10,ystart+s[4]+25,'d1r');
      MoveTo(xend2+s[2],ystart+s[1]-s[5]);
      LineTo(xend2+imax+xstep+5,ystart+s[1]-s[5]);
      MoveTo(xend2+s[3],ystart+s[1]);
      LineTo(xend2+imax+xstep+5,ystart+s[1]);
      MoveTo(xend2+imax+xstep,ystart+s[1]-s[5]);
      LineTo(xend2+imax+xstep,ystart+s[1]);
      MyArrowUp(xend2+imax+xstep,ystart+s[1]-s[5]); // ������� �����
      MyArrowDown(xend2+imax+xstep,ystart+s[1]); // ������� ����
      ibuf:=round(s[5]/2);
      TextOut(xend2+imax+xstep+3,ystart+s[1]-ibuf-5,'h12r'); // d1r
   end; // with
   MyDuble(false); // ���������� �������� ��������
   MyVisibleProc; // ��������� �����������
   // ����� ������������ �� �����
   Label5.Caption:='b�r';
   Label6.Caption:='h�r';
   Label7.Caption:='d1r';
   Label8.Caption:='d2r';
   Label9.Caption:='h�r';
   Label10.Caption:='h12r';
end;

// ������� �����
// ������� ������� ���������� ����� �
// ������������ (ix,iy);
procedure TForm1.MyArrowUp(ix, iy: Integer);
begin
   with PaintBox1.Canvas do
   begin
      // ������� ������� �������
      MoveTo(ix,iy);
      LineTo(ix-4,iy+8);
      LineTo(ix+4,iy+8);
      LineTo(ix,iy);
      // �������
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix-2,iy+6,RGB(255,255,255),fsSurface);
      FloodFill(ix+2,iy+6,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// ������� ����
// ������� ������� ���������� ����� �
// ������������ (ix,iy);
procedure TForm1.MyArrowDown(ix, iy: Integer);
begin
   with PaintBox1.Canvas do
   begin
      // ������� ������� �������
      MoveTo(ix,iy);
      LineTo(ix-4,iy-8);
      LineTo(ix+4,iy-8);
      LineTo(ix,iy);
      // �������
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix-2,iy-6,RGB(255,255,255),fsSurface);
      FloodFill(ix+2,iy-6,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// ������� �����
// ������� ������� ���������� ����� �
// ������������ (ix,iy);
procedure TForm1.MyArrowLeft(ix, iy: Integer);
begin
   with PaintBox1.Canvas do
   begin
      // ������� ������� �������
      MoveTo(ix,iy);
      LineTo(ix+8,iy-4);
      LineTo(ix+8,iy+4);
      LineTo(ix,iy);
      // �������
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix+6,iy-2,RGB(255,255,255),fsSurface);
      FloodFill(ix+6,iy+2,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// ������� ������
// ������� ������� ���������� ����� �
// ������������ (ix,iy);
procedure TForm1.MyArrowRight(ix, iy: Integer);
begin
   with PaintBox1.Canvas do
   begin
      // ������� ������� �������
      MoveTo(ix,iy);
      LineTo(ix-8,iy-4);
      LineTo(ix-8,iy+4);
      LineTo(ix,iy);
      // �������
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix-6,iy-2,RGB(255,255,255),fsSurface);
      FloodFill(ix-6,iy+2,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// ��������� ������� ����� � ����
// ������� ������� ���������� ����� �
// ������������ (ix,iy);
procedure TForm1.MyArrowDownLeft(ix, iy: Integer);
begin
   with PaintBox1.Canvas do
   begin
      // ������� ������� �������
      MoveTo(ix,iy);
      LineTo(ix+8,iy-2);
      LineTo(ix+2,iy-8);
      LineTo(ix,iy);
      // �������
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix+6,iy-3,RGB(255,255,255),fsSurface);
      FloodFill(ix+3,iy-5,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// ��������� ������� ������ � ����
// ������� ������� ���������� ����� �
// ������������ (ix,iy);
procedure TForm1.MyArrowUpRight(ix, iy: Integer);
begin
   with PaintBox1.Canvas do
   begin
      // ������� ������� �������
      MoveTo(ix,iy);
      LineTo(ix-8,iy+2);
      LineTo(ix-2,iy+8);
      LineTo(ix,iy);
      // �������
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix-6,iy+3,RGB(255,255,255),fsSurface);
      FloodFill(ix-3,iy+5,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// ������� ������� ����������� ���������
procedure TForm1.ChiefSizeASinchronMotorMetric;
var
  ibuf : Integer; // ���������� �������������� ��������
begin
   MyDuble(true); // ���������� �������� ��������
   // s[0] - ls
   s[0]:=round(s[0]/2); // ��������
   // s[1] - d (delta)
   // s[2] - lr
   s[2]:=round(s[2]/2); // ��������
   // s[3] - D�
   // s[4] - D��
   // s[5] - D
   // s[6] - D�
   // s[7] - a
   // s[8] - b
   s[8]:=round(s[8]/2); // ��������
   with PaintBox1.Canvas do
   begin
      MoveTo(xend2-s[0],yend-s[6]);
      LineTo(xend2-s[0],yend-s[6]-25);
      MoveTo(xend2+s[0],yend-s[6]);
      LineTo(xend2+s[0],yend-s[6]-25);
      MoveTo(xend2-s[0],yend-s[6]-20);
      LineTo(xend2+s[0],yend-s[6]-20);
      MyArrowLeft(xend2-s[0],yend-s[6]-20);
      MyArrowRight(xend2+s[0],yend-s[6]-20);
      // ls
      TextOut(xend2-5,yend-s[6]-35,'ls');
      MoveTo(xend2-s[0],yend-s[6]);
      LineTo(xend2+s[0],yend-s[5]);
      MoveTo(xend2+s[0],yend-s[6]);
      LineTo(xend2-s[0],yend-s[5]);
      // ����������� �������
      MoveTo(xend2,yend-s[5]-13);
      LineTo(xend2,yend-s[5]+s[1]+13);
      MyArrowUp(xend2,yend-s[5]+s[1]);
      MyArrowDown(xend2,yend-s[5]);
      // d
      TextOut(xend2-12,yend-s[5]-15,'d');
      MoveTo(xend2-s[2],yend-s[5]+s[1]);
      LineTo(xend2+s[2],yend-s[3]);
      MoveTo(xend2+s[2],yend-s[5]+s[1]);
      LineTo(xend2-s[2],yend-s[3]);
      // ����������� ������
      MoveTo(xend2+s[0],yend-s[6]);
      LineTo(xend,yend-s[6]);
      MoveTo(xend-5,yend-s[6]);
      LineTo(xend-5,yend);
      MyArrowUp(xend-5,yend-s[6]);
      MyArrowDown(xend-5,yend);
      // D�
      ibuf:=round(s[6]/2);
      TextOut(xend,yend-ibuf-3,'D�');
      MoveTo(xend2+s[0],yend-s[5]);
      LineTo(xend-25,yend-s[5]);
      MoveTo(xend-30,yend-s[5]);
      LineTo(xend-30,yend);
      MyArrowUp(xend-30,yend-s[5]);
      MyArrowDown(xend-30,yend);
      // D
      ibuf:=round(s[5]/2);
      TextOut(xend-25,yend-ibuf-3,'D');
      MoveTo(xend2-s[2]-s[7],yend-s[4]-s[8]);
      LineTo(xend2-s[2]-s[7]-25,yend-s[4]-s[8]);
      MoveTo(xend2-s[2]-s[7]-20,yend-s[4]-s[8]);
      LineTo(xend2-s[2]-s[7]-20,yend-s[4]+s[8]);
      MoveTo(xend2-s[2]-s[7],yend-s[4]+s[8]);
      LineTo(xend2-s[2]-s[7]-25,yend-s[4]+s[8]);
      MyArrowUp(xend2-s[2]-s[7]-20,yend-s[4]-s[8]);
      MyArrowDown(xend2-s[2]-s[7]-20,yend-s[4]+s[8]);
      // b
      TextOut(xend2-s[2]-s[7]-30,yend-s[4]-5,'b');
      MoveTo(xstart+20,yend-s[3]);
      LineTo(xstart,yend-s[3]);
      MoveTo(xstart+5,yend-s[3]-20);
      LineTo(xstart+5,yend+20);
      MyArrowUp(xstart+5,yend);
      MyArrowDown(xstart+5,yend-s[3]);
      // D�
      TextOut(xstart-19,yend-15,'D�');
      MoveTo(xend2-s[2]-s[7]-7,yend-s[4]);
      LineTo(xend-40,yend-s[4]);
      MoveTo(xend-45,yend-s[4]);
      LineTo(xend-45,yend);
      MyArrowUp(xend-45,yend-s[4]);
      MyArrowDown(xend-45,yend);
      // D��
      ibuf:=round(s[4]/2);
      TextOut(xend-42,yend-ibuf-5,'D��');
      MoveTo(xend2-s[2],yend-s[3]-10);
      LineTo(xend2+s[2],yend-s[3]-10);
      MyArrowLeft(xend2-s[2],yend-s[3]-10);
      MyArrowRight(xend2+s[2],yend-s[3]-10);
      // lr
      TextOut(xend2-3,yend-s[3]-24,'lr');
      MoveTo(xend2-s[2],yend-s[4]-s[8]);
      LineTo(xend2-s[2],yend-s[4]-s[8]-25);
      MoveTo(xend2-s[2]-s[7],yend-s[4]-s[8]);
      LineTo(xend2-s[2]-s[7],yend-s[4]-s[8]-25);
      MoveTo(xend2-s[2]+17,yend-s[4]-s[8]-20);
      LineTo(xend2-s[2]-s[7]-17,yend-s[4]-s[8]-20);
      MyArrowLeft(xend2-s[2],yend-s[4]-s[8]-20);
      MyArrowRight(xend2-s[2]-s[7],yend-s[4]-s[8]-20);
      // a
      TextOut(xend2-s[2]-s[7],yend-s[4]-s[8]-35,'a');
      MoveTo(xstart,yend);
      LineTo(xend,yend);
      // ���������
   end;
   MyDuble(false); // ���������� �������� ��������
   MyVisibleProc; // ��������� �����������
   // ����� ������������ �� �����
   Label5.Caption:='ls';
   Label6.Caption:='d';
   Label7.Caption:='lr';
   Label8.Caption:='D�';
   Label9.Caption:='D��';
   Label10.Caption:='D';
   Label11.Caption:='D�';
   Label12.Caption:='a';
   Label13.Caption:='b';
end;

// ������������
procedure TForm1.StatorAlmostOvalMetric;
const
   xstep = 10; // ������ �� ��� x
var
   imax,ibuf : Integer; // ���������� �������������� ��������
begin
   MyDuble(true); // ���������� �������� ��������
   // s[0] - b2
   s[0]:=round(s[0]/2); // ��������
   // s[1] - h�s
   // s[2] - h�s
   // s[3] - b�s
   s[3]:=round(s[3]/2); // ��������
   // s[4] - d1
   s[4]:=round(s[4]/2); // ��������
   // s[5] - h12
   with PaintBox1.Canvas do
   begin
     if s[0]>s[4] then imax:=s[0]
     else imax:=s[4];
     MoveTo(xend2-s[0],yend-s[1]);
     LineTo(xend2-s[0],yend-s[1]-25);
     MoveTo(xend2+s[0],yend-s[1]);
     LineTo(xend2+s[0],yend-s[1]-25);
     MoveTo(xend2-s[0],yend-s[1]-20);
     LineTo(xend2+s[0],yend-s[1]-20);
     MyArrowLeft(xend2-s[0],yend-s[1]-20); // ������� �����
     MyArrowRight(xend2+s[0],yend-s[1]-20); // ������� ������
     // b2
     TextOut(xend2-10,yend-s[1]-35,'b2');
     MoveTo(xend2-s[0],yend-s[1]);
     LineTo(xend2-imax-xstep-5,yend-s[1]);
     MoveTo(xend2-imax-xstep,yend-s[1]);
     LineTo(xend2-imax-xstep,yend);
     MyArrowUp(xend2-imax-xstep,yend-s[1]); // ������� �����
     MyArrowDown(xend2-imax-xstep,yend); // ������� ����
     // h�s
     ibuf:=round(s[1]/2);
     TextOut(xend2-imax-xstep-22,yend-ibuf,'h�s');
     MoveTo(xend2+s[0],yend-s[1]);
     LineTo(xend2+imax+xstep+5,yend-s[1]);
     MoveTo(xend2-s[4],yend-s[1]+s[5]);
     LineTo(xend2+imax+xstep+5,yend-s[1]+s[5]);
     MyArrowLeft(xend2-s[4],yend-s[1]+s[5]);
     MyArrowRight(xend2+s[4],yend-s[1]+s[5]);
     // d1
     TextOut(xend2-5,yend-s[1]+s[5]-15,'d1');
     MoveTo(xend2+imax+xstep,yend-s[1]);
     LineTo(xend2+imax+xstep,yend-s[1]+s[5]);
     MyArrowUp(xend2+imax+xstep,yend-s[1]); // ������� �����
     MyArrowDown(xend2+imax+xstep,yend-s[1]+s[5]);  // ������� ����
     // h12
     ibuf:=round(s[5]/2);
     TextOut(xend2+imax+xstep+3,yend-s[1]+ibuf,'h12');
     MoveTo(xend2-s[3],yend);
     LineTo(xend2-s[3],yend+25);
     MoveTo(xend2+s[3],yend);
     LineTo(xend2+s[3],yend+25);
     MoveTo(xend2-s[3]-20,yend+20);
     LineTo(xend2+s[3]+30,yend+20);
     MyArrowLeft(xend2+s[3],yend+20); // ������� �����
     MyArrowRight(xend2-s[3],yend+20); // ������� ������
     // b�s
     TextOut(xend2+s[3]+10,yend+5,'b�s');
     MoveTo(xend2-s[3],yend-s[2]);
     LineTo(xend2-s[4]-xstep-5,yend-s[2]);
     MoveTo(xend2-s[4]-xstep,yend+20);
     LineTo(xend2-s[4]-xstep,yend-s[2]-20);
     MyArrowUp(xend2-s[4]-xstep,yend); // ������� �����
     MyArrowDown(xend2-s[4]-xstep,yend-s[2]); // ������� ����
     // h�s
     TextOut(xend2-s[4]-xstep-27,yend-s[2]-15,'h�s');
     // �������������� ��������:
     Pen.Style:=psDot; // ����� �������� (���������� �����)
     MoveTo(xend2-s[4],yend-s[1]+s[5]);
     LineTo(xend2-s[4],yend-s[1]);
     MoveTo(xend2+s[4],yend-s[1]+s[5]);
     LineTo(xend2+s[4],yend-s[1]);
     Pen.Style:=psSolid; // ���������� �������� �����
   end; // with
   MyDuble(false); // ���������� �������� ��������
   MyVisibleProc; // ��������� �����������
   // ����� ������������ �� �����
   Label5.Caption:='b2';
   Label6.Caption:='h�s';
   Label7.Caption:='h�s';
   Label8.Caption:='b�s';
   Label9.Caption:='d1';
   Label10.Caption:='h12';
end;

// ��������
procedure TForm1.StatorOvalMetric;
const
   xstep = 10; // ������ �� ��� x
var
   imax,ibuf : Integer; // ���������� �������������� ��������
begin
   MyDuble(true); // ���������� �������� ��������
   //  s[0] - h�s  - ���� ������ ���������
   // ��� ������������ ������ ���� ���������
   // h�s = round(d2/2) + h12 + round((d1-b�s)/2) + h�s.
   //  s[1] - b�s
   s[1]:=round(s[1]/2);  // ��������
   //  s[2] - h�s
   //  s[3] - d2
   s[3]:=round(s[3]/2); // ��������
   //  s[4] - d1
   s[4]:=round(s[4]/2); // ��������
   //  s[5] - h12
   with PaintBox1.Canvas do
   begin
      if s[3]>s[4] then imax:=s[3]
      else imax:=s[4];
      MoveTo(xend2,yend-s[0]);
      LineTo(xend2-imax-xstep-5,yend-s[0]);
      MoveTo(xend2-imax-xstep,yend-s[0]);
      LineTo(xend2-imax-xstep,yend);
      MyArrowUp(xend2-imax-xstep,yend-s[0]); // ������� �����
      MyArrowDown(xend2-imax-xstep,yend); // ������� ����
      // h�s
      ibuf:=round(s[0]/2);
      TextOut(xend2-imax-xstep-22,yend-ibuf,'h�s');
      MoveTo(xend2-s[3],yend-s[0]+s[3]);
      LineTo(xend2+imax+xstep+5,yend-s[0]+s[3]);
      MoveTo(xend2-s[4],yend-s[0]+s[3]+s[5]);
      LineTo(xend2+imax+xstep+5,yend-s[0]+s[3]+s[5]);
      MoveTo(xend2+imax+xstep,yend-s[0]+s[3]);
      LineTo(xend2+imax+xstep,yend-s[0]+s[3]+s[5]);
      // d1
      TextOut(xend2-5,yend-s[0]+s[3]+s[5]-15,'d1');
      MyArrowLeft(xend2-s[4],yend-s[0]+s[3]+s[5]);
      MyArrowRight(xend2+s[4],yend-s[0]+s[3]+s[5]);
      // d2
      TextOut(xend2-5,yend-s[0]+s[3]+5,'d2');
      MyArrowLeft(xend2-s[3],yend-s[0]+s[3]);
      MyArrowRight(xend2+s[3],yend-s[0]+s[3]);
      MyArrowUp(xend2+imax+xstep,yend-s[0]+s[3]); // ������� �����
      MyArrowDown(xend2+imax+xstep,yend-s[0]+s[3]+s[5]); // ������� ����
      // h12
      ibuf:=round(s[5]/2);
      TextOut(xend2+imax+xstep+3,yend-s[0]+s[3]+ibuf,'h12');
      MoveTo(xend2-s[1],yend);
      LineTo(xend2-s[1],yend+25);
      MoveTo(xend2+s[1],yend);
      LineTo(xend2+s[1],yend+25);
      MoveTo(xend2-s[1]-15,yend+20);
      LineTo(xend2+s[1]+30,yend+20);
      MyArrowLeft(xend2+s[1],yend+20);  // ������� �����
      MyArrowRight(xend2-s[1],yend+20); // ������� ������
      // b�s
      TextOut(xend2+s[1]+10,yend+5,'b�s');
      MoveTo(xend2-s[1],yend-s[2]);
      LineTo(xend2-s[4]-xstep-5,yend-s[2]);
      MoveTo(xend2-s[4]-xstep,yend-s[2]-20);
      LineTo(xend2-s[4]-xstep,yend+15);
      MyArrowUp(xend2-s[4]-xstep,yend); // ������� �����
      MYArrowDown(xend2-s[4]-xstep,yend-s[2]); // ������� ����
      // h�s
      TextOut(xend2-s[4]-xstep-25,yend-s[2]-25,'h�s');
   end; // with
   MyDuble(false); // ���������� �������� ��������
   MyVisibleProc; // ��������� �����������
   // ����� ������������ �� �����
   Label5.Caption:='h�s';
   Label6.Caption:='b�s';
   Label7.Caption:='h�s';
   Label8.Caption:='d2';
   Label9.Caption:='d1';
   Label10.Caption:='h12';
end;

// ������������� ������������
procedure TForm1.StatorRectangleAlmostClosedMetric;
const
   xstep = 10; // ������ �� ��� x
var
   ibuf : Integer;
begin
   MyDuble(true); // ���������� �������� ��������
   // s[0] - b1
   s[0]:=round(s[0]/2); // ��������
   // s[1] - h�s
   // s[2] - b�s
   s[2]:=round(s[2]/2); // ��������
   // s[3] - h�s
   with PaintBox1.Canvas do
   begin
      MoveTo(xend2-s[0],yend-s[1]);
      LineTo(xend2-s[0]-xstep-5,yend-s[1]);
      MoveTo(xend2-s[0]-xstep,yend-s[1]);
      LineTo(xend2-s[0]-xstep,yend);
      MyArrowUp(xend2-s[0]-xstep,yend-s[1]);
      MyArrowDown(xend2-s[0]-xstep,yend);
      // h�s
      ibuf:=round(s[1]/2);
      TextOut(xend2-s[0]-xstep-23,yend-ibuf,'h�s');
      MoveTo(xend2-s[0],yend-s[1]);
      LineTo(xend2-s[0],yend-s[1]-25);
      MoveTo(xend2+s[0],yend-s[1]);
      LineTo(xend2+s[0],yend-s[1]-25);
      MoveTo(xend2-s[0],yend-s[1]-20);
      LineTo(xend2+s[0],yend-s[1]-20);
      MyArrowLeft(xend2-s[0],yend-s[1]-20);
      MyArrowRight(xend2+s[0],yend-s[1]-20);
      // b1
      TextOut(xend2-5,yend-s[1]-35,'b1');
      MoveTo(xend2+s[0],yend-s[3]);
      LineTo(xend2+s[0]+xstep+5,yend-s[3]);
      MoveTo(xend2+s[0]+xstep,yend-s[3]-20);
      LineTo(xend2+s[0]+xstep,yend+20);
      MyArrowUp(xend2+s[0]+xstep,yend);
      MyArrowDown(xend2+s[0]+xstep,yend-s[3]);
      // h�s
      TextOut(xend2+s[0]+xstep+7,yend-s[3]+3,'h�s');
      MoveTo(xend2-s[2],yend);
      LineTo(xend2-s[2],yend+25);
      MoveTo(xend2+s[2],yend);
      LineTo(xend2+s[2],yend+25);
      MoveTo(xend2-s[2]-30,yend+20);
      LineTo(xend2+s[2]+20,yend+20);
      MyArrowLeft(xend2+s[2],yend+20);
      MyArrowRight(xend2-s[2],yend+20);
      // b�s
      TextOut(xend2-10,yend+25,'b�s');
   end;
   MyDuble(false); // ���������� �������� ��������
   MyVisibleProc; // ��������� �����������
   // ����� ������������ �� �����
   Label5.Caption:='b1';
   Label6.Caption:='h�s';
   Label7.Caption:='b�s';
   Label8.Caption:='h�s';
end;

// ������������� ��������
procedure TForm1.StatorRectangleOpenMetric;
const
  idelta = 4; // �����
  xstep = 10; // ������ �� ��� x
var
  ibuf,imybuf : Word; // ���������� �������������� ��������
begin
   MyDuble(true); // ���������� �������� ��������
   // s[0] - h�s
   // s[1] - b1
   s[1]:=round(s[1]/2); // ��������
   // s[2] - h
   with PaintBox1.Canvas do
   begin
      ibuf:=round((s[2]-idelta)/2); // ������ �� ���������
      MoveTo(xend2-s[1],yend-s[0]);
      LineTo(xend2-s[1]-ibuf-xstep-5,yend-s[0]);
      MoveTo(xend2-s[1]-ibuf-xstep,yend-s[0]);
      LineTo(xend2-s[1]-ibuf-xstep,yend);
      MyArrowUp(xend2-s[1]-ibuf-xstep,yend-s[0]);
      MyArrowDown(xend2-s[1]-ibuf-xstep,yend);
      // h�s
      imybuf:=round(s[0]/2);
      TextOut(xend2-s[1]-ibuf-xstep-20,yend-imybuf,'h�s');
      MoveTo(xend2-s[1],yend);
      LineTo(xend2-s[1],yend+25);
      MoveTo(xend2+s[1],yend);
      LineTo(xend2+s[1],yend+25);
      MoveTo(xend2-s[1],yend+20);
      LineTo(xend2+s[1],yend+20);
      MyArrowLeft(xend2-s[1],yend+20);
      MyArrowRight(xend2+s[1],yend+20);
      // b1
      TextOut(xend2-7,yend+25,'b1');
      MoveTo(xend2+s[1]-idelta,yend-s[2]);
      LineTo(xend2+s[1]+ibuf+xstep+5,yend-s[2]);
      MoveTo(xend2+s[1]+ibuf+xstep,yend-s[2]);
      LineTo(xend2+s[1]+ibuf+xstep,yend);
      MyArrowUp(xend2+s[1]+ibuf+xstep,yend-s[2]);
      MyArrowDown(xend2+s[1]+ibuf+xstep,yend);
      // h
      imybuf:=round(s[2]/2);
      TextOut(xend2+s[1]+ibuf+xstep+5,yend-imybuf-7,'h');
   end; // with
   MyDuble(false); // ���������� �������� ��������
   MyVisibleProc; // ��������� �����������
   // ����� ������������ �� �����
   Label5.Caption:='h�s';
   Label6.Caption:='b1';
   Label7.Caption:='h';
end;

// ���������������
procedure TForm1.StatorTrapeziumMetric;
const
  xstep = 10; // ������ �� ��� x
var
  imax,ibuf : Integer;
begin
   MyDuble(true); // ���������� �������� ��������
   // s[0] - b2
   s[0]:=round(s[0]/2); // ��������
   // s[1] - h�s
   // s[2] - h�s
   // s[3] - b�s
   s[3]:=round(s[3]/2); // ��������
   // s[4] - b1
   s[4]:=round(s[4]/2); // ��������
   // s[5] - h12
   // s[6] - h3
   with PaintBox1.Canvas do
   begin
     if s[0]>s[4] then imax:=s[0]
     else imax:=s[4];
     MoveTo(xend2-s[0],yend-s[1]);
     LineTo(xend2-imax-xstep-5,yend-s[1]);
     MoveTo(xend2-imax-xstep,yend-s[1]);
     LineTo(xend2-imax-xstep,yend);
     MyArrowUp(xend2-imax-xstep,yend-s[1]);
     MyArrowDown(xend2-imax-xstep,yend);
     // h�s
     ibuf:=round(s[1]/2);
     TextOut(xend2-imax-xstep-22,yend-ibuf,'h�s');
     MoveTo(xend2-s[0],yend-s[1]);
     LineTo(xend2-s[0],yend-s[1]-25);
     MoveTo(xend2+s[0],yend-s[1]);
     LineTo(xend2+s[0],yend-s[1]-25);
     MoveTo(xend2-s[0],yend-s[1]-20);
     LineTo(xend2+s[0],yend-s[1]-20);
     MyArrowLeft(xend2-s[0],yend-s[1]-20);
     MyArrowRight(xend2+s[0],yend-s[1]-20);
     // b2
     TextOut(xend2-6,yend-s[1]-35,'b2');
     MoveTo(xend2-s[3],yend);
     LineTo(xend2-s[3],yend+25);
     MoveTo(xend2+s[3],yend);
     LineTo(xend2+s[3],yend+25);
     MoveTo(xend2-s[3]-20,yend+20);
     LineTo(xend2+s[3]+30,yend+20);
     MyArrowLeft(xend2+s[3],yend+20);
     MyArrowRight(xend2-s[3],yend+20);
     // b�s
     TextOut(xend2+s[3]+10,yend+5,'b�s');
     MoveTo(xend2-s[3],yend-s[2]);
     LineTo(xend2-s[4]-xstep-5,yend-s[2]);
     MoveTo(xend2-s[4]-xstep,yend-s[2]-20);
     LineTo(xend2-s[4]-xstep,yend+20);
     MyArrowUp(xend2-s[4]-xstep,yend);
     MyArrowDown(xend2-s[4]-xstep,yend-s[2]);
     // h�s
     TextOut(xend2-s[4]-xstep-25,yend-s[2]-20,'h�s');
     MoveTo(xend2+s[0],yend-s[1]);
     LineTo(xend2+imax+xstep+5,yend-s[1]);
     MoveTo(xend2+imax+xstep,yend-s[1]);
     LineTo(xend2+imax+xstep,yend-s[2]-s[6]);
     MoveTo(xend2-s[4],yend-s[2]-s[6]);
     LineTo(xend2+imax+xstep+5,yend-s[2]-s[6]);
     MyArrowUp(xend2+imax+xstep,yend-s[1]);
     MyArrowDown(xend2+imax+xstep,yend-s[2]-s[6]);
     // h12
     ibuf:=round(s[5]/2);
     TextOut(xend2+imax+xstep+3,yend-s[1]+ibuf,'h12');
     MoveTo(xend2+s[3],yend-s[2]);
     LineTo(xend2+s[4]+xstep+5,yend-s[2]);
     MoveTo(xend2+s[4]+xstep,yend-s[2]+20);
     LineTo(xend2+s[4]+xstep,yend-s[2]-s[6]-20);
     MyArrowUp(xend2+s[4]+xstep,yend-s[2]);
     MyArrowDown(xend2+s[4]+xstep,yend-s[2]-s[6]);
     // h3
     ibuf:=round(s[6]/2);
     TextOut(xend2+s[4]+xstep+7,yend-s[2]-ibuf-7,'h3');
     MyArrowLeft(xend2-s[4],yend-s[2]-s[6]);
     MyArrowRight(xend2+s[4],yend-s[2]-s[6]);
     // b1
     TextOut(xend2-5,yend-s[2]-s[6]-15,'b1');
     // �������������� ��������:
     Pen.Style:=psDot; // ����� �������� (���������� �����)
     MoveTo(xend2-s[4],yend-s[1]+s[5]);
     LineTo(xend2-s[4],yend-s[1]);
     MoveTo(xend2+s[4],yend-s[1]+s[5]);
     LineTo(xend2+s[4],yend-s[1]);
     Pen.Style:=psSolid; // ���������� �������� �����
   end; // with
   MyDuble(false); // ���������� �������� ��������
   MyVisibleProc; // ��������� �����������
   // ����� ������������ �� �����
   Label5.Caption:='b2';
   Label6.Caption:='h�s';
   Label7.Caption:='h�s';
   Label8.Caption:='b�s';
   Label9.Caption:='b1';
   Label10.Caption:='h12';
   Label11.Caption:='h3';
end;

// ��������� ��������� �� �����
procedure TForm1.MyVisibleProc;
begin
   // ��������� ��������� "��������"
   Label5.Visible:=bVis[0];
   Label6.Visible:=bVis[1];
   Label7.Visible:=bVis[2];
   Label8.Visible:=bVis[3];
   Label9.Visible:=bVis[4];
   Label10.Visible:=bVis[5];
   Label11.Visible:=bVis[6];
   Label12.Visible:=bVis[7];
   Label13.Visible:=bVis[8];
   // ��������� ��������� "��������"
   Edit1.Visible:=bVis[0];
   Edit2.Visible:=bVis[1];
   Edit3.Visible:=bVis[2];
   Edit4.Visible:=bVis[3];
   Edit5.Visible:=bVis[4];
   Edit6.Visible:=bVis[5];
   Edit7.Visible:=bVis[6];
   Edit8.Visible:=bVis[7];
   Edit9.Visible:=bVis[8];
   // ����� �������� �������� �� �����
   if bVis[0] then Edit1.Text:=IntToStr(s[0]);
   if bVis[1] then Edit2.Text:=IntToStr(s[1]);
   if bVis[2] then Edit3.Text:=IntToStr(s[2]);
   if bVis[3] then Edit4.Text:=IntToStr(s[3]);
   if bVis[4] then Edit5.Text:=IntToStr(s[4]);
   if bVis[5] then Edit6.Text:=IntToStr(s[5]);
   if bVis[6] then Edit7.Text:=IntToStr(s[6]);
   if bVis[7] then Edit8.Text:=IntToStr(s[7]);
   if bVis[8] then Edit9.Text:=IntToStr(s[8]);
   Button1.Visible:=true;
end;

procedure TForm1.rgTypeOfImageClick(Sender: TObject);
var
   i : Integer; // �������
begin
   // �������������� ����� �����������
   ishow:=rgTypeOfImage.ItemIndex;
   // ishow = 0 => ���������� ��� ��������
   // ishow = 1 => ����������� � ���������
   if ishow = 0 then
   begin
      for i:=0 to 8 do bVis[i]:=false;
      MyVisibleProc;
      Button1.Visible:=false;
   end; 
   // �������������� �����������
   Repaint;
end;

// �� ������� ������ ������������ ����������
// ���������� �� ���� ����� Editi.
procedure TForm1.Button1Click(Sender: TObject);
var
   // ���� � ������� ���������
   // ���������� ����������
   f : TStrings;
   i : Integer; // �������
begin
   // ����� �������� �������� �� �����
   if bVis[0] then s[0]:=StrToInt(Edit1.Text);
   if bVis[1] then s[1]:=StrToInt(Edit2.Text);
   if bVis[2] then s[2]:=StrToInt(Edit3.Text);
   if bVis[3] then s[3]:=StrToInt(Edit4.Text);
   if bVis[4] then s[4]:=StrToInt(Edit5.Text);
   if bVis[5] then s[5]:=StrToInt(Edit6.Text);
   if bVis[6] then s[6]:=StrToInt(Edit7.Text);
   if bVis[7] then s[7]:=StrToInt(Edit8.Text);
   if bVis[8] then s[8]:=StrToInt(Edit9.Text);
   // �������� �������� ��������� ��������� �
   // ��������������� �����.
   f:=TStringList.Create();  // �������� �������
   f.Clear; // ������� ����������� �������
   for i:=0 to 8 do
   begin
      if bVis[i] then f.Add(IntToStr(s[i])); // ��������� ����� ������
   end;
   // ��������� ��������� ���������
   case itype of
       // ����� �������� ������
       1: f.SaveToFile('input\rotor'+IntToStr(inum)+'.txt');
       // ����� �������� �������
       2: f.SaveToFile('input\stator'+IntToStr(inum)+'.txt');
       // ������� ������� ������������ ���������
       3: f.SaveToFile('input\motor.txt');
    end; // case
    f.Free; // ����������� �������
   // �������������� �����������
   Repaint;
end;

// ������������ ��� ��������� �������� ���� (������� �����)
procedure TForm1.FormResize(Sender: TObject);
begin
  PaintBox1.Width:=Width-380;
  PaintBox1.Height:=Height-120;
  Repaint;
end;

// ����������� ��������
procedure TForm1.MyDuble(b: bool);
var
   i : Integer; // �������
begin
  if b then
  begin
    // s -> sdub
    for i:=0 to 8 do sdub[i]:=s[i];
  end
  else
  begin
    // sdub -> s
    for i:=0 to 8 do s[i]:=sdub[i];
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
rgTypeOfImageClick(nil);
label4.Top :=label3.Top;
cbStator.top := cbRotor.Top;
rgTypeOfSystemClick(nil);
end;

end.
