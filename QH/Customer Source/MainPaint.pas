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
    { Private declarations } // собственные данные

    // элементы данные
     // для хранения выбора пользователя
    itype,inum,ishow : Integer;
     // массив геометрических размеров
    s : array[0..8] of Word;
    // т.к. в результате прорисовки часто
    // используется целочисленное деление на 2,
    // то некоторые данные могут исказиться.
    // В частности, нечётные величины размеров
    // будут преобразованы к чётным. Для того
    // чтобы этого избежать введён следующий массив:
    sdub : array[0..8] of Word;
    // и соответствующая процедура MyDuble;
    // массив видимости элементов
    bVis : array[0..8] of bool;
    // переменные позиционирования изображения
    xstart,ystart,xend,xend2,yend : Word;

    // методы данные
     Procedure MyDuble(b : bool); // копирование размеров.
     // пазы ротора
     Procedure RotorRoundClosedShow;        // круглый закрытый
     Procedure RotorRoundAlmostClosedShow;  // круглый полузакрытый
     Procedure RotorOvalClosedShow;         // овальный закрытый
     Procedure RotorOvalAlmostClosedShow;   // овальный полузакрытый
     Procedure RotorTrapeziumAlmostClosedShow;  // трапецеидальный полузакрытый
     Procedure RotorRectangleAlmostClosedShow;  // прямоугольный полузакрытый
     // пазы статора
     Procedure StatorOvalShow;                  // овальный
     Procedure StatorAlmostOvalShow;            // полуовальный
     Procedure StatorTrapeziumShow;             // трапецеидальный
     Procedure StatorRectangleOpenShow;         // прямоугольный открытый
     Procedure StatorRectangleAlmostClosedShow; // прямоугольный полузакрытый
     // главные размеры асинхроного двигателя
     Procedure ChiefSizeASinchronMotorShow;

     // прорисовка стрелок
     Procedure MyArrowUp(ix,iy : Integer);    // вверх
     Procedure MyArrowDown(ix,iy : Integer);  // вниз
     Procedure MyArrowRight(ix,iy : Integer); // вправо
     Procedure MyArrowLeft(ix,iy : Integer);  // влево
     Procedure MyArrowDownLeft(ix,iy : Integer); // косая влево и вниз
     Procedure MyArrowUpRight(ix,iy : Integer);  // косая вправо и вверх
     // методы нанесения размеров (пазы ротора)
     Procedure RotorRoundClosedMetric;        // круглый закрытый
     Procedure RotorRoundAlmostClosedMetric;  // круглый полузакрытый
     Procedure RotorOvalClosedMetric;         // овальный закрытый
     Procedure RotorOvalAlmostClosedMetric;   // овальный полузакрытый
     Procedure RotorTrapeziumAlmostClosedMetric;  // трапецеидальный полузакрытый
     Procedure RotorRectangleAlmostClosedMetric;  // прямоугольный полузакрытый
     // методы нанесения размеров (пазы статора)
     Procedure StatorOvalMetric;                  // овальный
     Procedure StatorAlmostOvalMetric;            // полуовальный
     Procedure StatorTrapeziumMetric;             // трапецеидальный
     Procedure StatorRectangleOpenMetric;         // прямоугольный открытый
     Procedure StatorRectangleAlmostClosedMetric; // прямоугольный полузакрытый
     // главные размеры асинхроного двигателя
     Procedure ChiefSizeASinchronMotorMetric;
     // видимость элементов на форме
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
  i : Integer; // счётчик
begin
  // присвоим глобальной переменной itype
  // номер выделенного компонента
  // характеризующего тип системы.
  itype:=rgTypeOfSystem.ItemIndex+1;
  inum:=0; // сброс предыдущего выбора
  // скроем лишние компоненты
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
  // принудительная перерисовка
  pnRotorStator.Visible:=iType<>3;
  Repaint;

end;

procedure TForm1.cbRotorChange(Sender: TObject);
begin
     // присвоим глобальной переменной inum
     // номер выбранного компонента
     // для визуализации
     if itype=1 then
        inum:=cbRotor.ItemIndex+1;
     // принудительная перерисовка
     Repaint;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
var
   // файл из которого считываются
   // геометрические размеры
   f : TStrings;
   // счётчик
   i : Shortint;
begin
  // настройка позиционирования изображения
  xstart:=60; // крайняя левая координата по оси x
  ystart:=60; // крайняя верхняя координата по оси y
  xend:=PaintBox1.Width-60;  // крайняя правая координата по оси x
  xend2:=30+round(xend/2); // середина по оси x
  yend:=PaintBox1.Height-60;  // крайняя нижняя координата по оси y

  f:=TStringList.Create();
  if inum<>0 then
  begin
    case itype of
       // файлы размеров ротора
       1: f.LoadFromFile('input\rotor'+IntToStr(inum)+'.txt');
       // файлы размеров статора
       2: f.LoadFromFile('input\stator'+IntToStr(inum)+'.txt');
       // главные размеры асинхронного двигателя
       3: f.LoadFromFile('input\motor.txt');
    end; // case

    // заполнение массива s[] - размеров
    for i:=0 to f.Count-1 do s[i]:=StrToInt(f.Strings[i]);
    // заполнение массива bVis[] - видимости элементов
    for i:=0 to f.Count-1 do bVis[i]:=true;
    for i:=f.Count to 8 do bVis[i]:=false;
  end
  else
  begin
    if itype=3 then
    begin
      // главные размеры асинхронного двигателя
      f.LoadFromFile('input\motor.txt');
      // заполнение массива s[] - размеров
      for i:=0 to f.Count-1 do s[i]:=StrToInt(f.Strings[i]);
      // заполнение массива bVis[] - видимости элементов
      for i:=0 to f.Count-1 do bVis[i]:=true;
      for i:=f.Count to 8 do bVis[i]:=false;
    end;
  end;

  f.Free; // уничтожение объекта

  // сделаем белый холст.
  PaintBox1.Color:=RGB(255,255,255);
  PaintBox1.Canvas.Rectangle(0,PaintBox1.Height,PaintBox1.Width,0);

  if ishow=1 then
  begin
    case itype of
    // пазы ротора
    1: begin
         case inum of
         // круглый закрытый
         1: begin
              PaintBox1.Canvas.Pen.Width:=3;
              RotorRoundClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              RotorRoundClosedMetric;
            end;
         // круглый полузакрытый
         2: begin
              PaintBox1.Canvas.Pen.Width:=3;
              RotorRoundAlmostClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              RotorRoundAlmostClosedMetric;
            end;
         // овальный закрытый
         3: begin
              PaintBox1.Canvas.Pen.Width:=3;
              RotorOvalClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              RotorOvalClosedMetric;
            end;
         // овальный полузакрытый
         4: begin
              PaintBox1.Canvas.Pen.Width:=3;
              RotorOvalAlmostClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              RotorOvalAlmostClosedMetric;
            end;
         // трапецеидальный полузакрытый
         5: begin
              PaintBox1.Canvas.Pen.Width:=3;
              RotorTrapeziumAlmostClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              RotorTrapeziumAlmostClosedMetric;
            end;
         // прямоугольный полузакрытый
         6: begin
              PaintBox1.Canvas.Pen.Width:=3;
              RotorRectangleAlmostClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              RotorRectangleAlmostClosedMetric;
            end;
         end; // case inum of
       end;
    // пазы статора
    2: begin
         case inum of
         // овальный
         1: begin
              PaintBox1.Canvas.Pen.Width:=3;
              StatorOvalShow;
              PaintBox1.Canvas.Pen.Width:=1;
              StatorOvalMetric;
            end;
         // полуовальный
         2: begin
              PaintBox1.Canvas.Pen.Width:=3;
              StatorAlmostOvalShow;
              PaintBox1.Canvas.Pen.Width:=1;
              StatorAlmostOvalMetric;
            end;
         // трапецеидальный
         3: begin
              PaintBox1.Canvas.Pen.Width:=3;
              StatorTrapeziumShow;
              PaintBox1.Canvas.Pen.Width:=1;
              StatorTrapeziumMetric;
            end;
         // прямоугольный открытый
         4: begin
              PaintBox1.Canvas.Pen.Width:=3;
              StatorRectangleOpenShow;
              PaintBox1.Canvas.Pen.Width:=1;
              StatorRectangleOpenMetric;
            end;
         // прямоугольный полузакрытый
         5: begin
              PaintBox1.Canvas.Pen.Width:=3;
              StatorRectangleAlmostClosedShow;
              PaintBox1.Canvas.Pen.Width:=1;
              StatorRectangleAlmostClosedMetric;
            end;
         end; // case inum of
       end;
     // главные размеры асинхроного двигателя
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
     // присвоим глобальной переменной inum
     // номер выбранного компонента
     // для визуализации
     if itype=2 then
        inum:=cbStator.ItemIndex+1;
     // принудительная перерисовка
     Repaint;
end;

// пазы ротора
// круглый закрытый
procedure TForm1.RotorRoundClosedShow;
begin
  MyDuble(true); // запоминает исходные значения
  //  s[0] - hшr
  //  s[1] - hпr
  //  s[2] - dr (диаметр)
  s[2]:=round(s[2]/2);
  //  s[2] - радиус
  with PaintBox1.Canvas do
  begin
    MoveTo(xstart,ystart);
    LineTo(xend,ystart);
    Ellipse(xend2-s[2],ystart+s[1],xend2+s[2],ystart+s[0]);
  end; // with
  MyDuble(false); // возвращаем исходные значения
end;

// овальный полузакрытый
procedure TForm1.RotorOvalAlmostClosedShow;
begin
   MyDuble(true); // запоминает исходные значения
   //  s[0] - bшr
   s[0]:=round(s[0]/2);
   //  s[1] - hшr
   //  s[2] - hпr
   //  s[3] - d2r
   s[3]:=round(s[3]/2);  // радиус
   //  s[4] - d1r
   s[4]:=round(s[4]/2);  // радиус
   //  s[5] - h12r
   with PaintBox1.Canvas do
   begin
      // верхняя горизонтальная линия
      MoveTo(xstart,ystart);
      LineTo(xend,ystart);
      // окружность 1.
      Ellipse(xend2-s[4],ystart+s[2]-s[3]-s[4]-s[5],xend2+s[4],ystart+s[2]-s[3]-s[5]+s[4]);
      // нарисуем прямоугольник для скрытия нижней полуокружности
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-s[4],ystart+s[2]-s[3]-s[5],xend2+s[4],ystart+s[2]-s[3]-s[5]+s[4]);
      Pen.Color:=RGB(0,0,0); // чёрный
      // окружность 2.
      Ellipse(xend2-s[3],ystart+s[2]-2*s[3],xend2+s[3],ystart+s[2]);
      // нарисуем прямоугольник для скрытия верхней полуокружности
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-s[3],ystart+s[2]-2*s[3],xend2+s[3],ystart+s[2]-s[3]);
      // делаем вырез
      Rectangle(xend2-s[0],ystart,xend2+s[0],ystart+s[1]);
      Pen.Color:=RGB(0,0,0); // чёрный
      // рисуем две вертикальные черты
      MoveTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart+s[1]);
      MoveTo(xend2+s[0],ystart);
      LineTo(xend2+s[0],ystart+s[1]);
      // теперь осталось нарисовать две косые линии
      MoveTo(xend2-s[4],ystart+s[2]-s[3]-s[5]);
      LineTo(xend2-s[3],ystart+s[2]-s[3]);
      MoveTo(xend2+s[4],ystart+s[2]-s[3]-s[5]);
      LineTo(xend2+s[3],ystart+s[2]-s[3]);
   end; // with
   MyDuble(false); // возвращаем исходные значения
end;

// овальный закрытый
procedure TForm1.RotorOvalClosedShow;
begin
   MyDuble(true); // запоминает исходные значения
   //  s[0] - hшr
   //  s[1] - hпr
   //  s[2] - d2r
   s[2]:=round(s[2]/2);  // радиус
   //  s[3] - d1r
   s[3]:=round(s[3]/2);  // радиус
   //  s[4] - h12r
   with PaintBox1.Canvas do
   begin
      // верхняя горизонтальная линия
      MoveTo(xstart,ystart);
      LineTo(xend,ystart);
      // полуокружность 1.
      Ellipse(xend2-s[3],ystart+s[0],xend2+s[3],ystart+s[0]+2*s[3]);
      // нарисуем прямоугольник для скрытия нижней полуокружности
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-s[3],ystart+s[0]+s[3],xend2+s[3],ystart+s[0]+2*s[3]);
      Pen.Color:=RGB(0,0,0); // чёрный
      // полуокружность 2.
      Ellipse(xend2-s[2],ystart+s[1]-2*s[2],xend2+s[2],ystart+s[1]);
      // нарисуем прямоугольник для скрытия верхней полуокружности
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-s[2],ystart+s[1]-2*s[2],xend2+s[2],ystart+s[1]-s[2]);
      Pen.Color:=RGB(0,0,0); // чёрный
      // теперь осталось нарисовать две косые линии
      MoveTo(xend2-s[3],ystart+s[0]+s[3]);
      LineTo(xend2-s[2],ystart+s[1]-s[2]);
      MoveTo(xend2+s[3],ystart+s[0]+s[3]);
      LineTo(xend2+s[2],ystart+s[1]-s[2]);
   end; // with
   MyDuble(false); // возвращаем исходные значения
end;

// круглый полузакрытый
procedure TForm1.RotorRoundAlmostClosedShow;
begin
   MyDuble(true); // запоминает исходные значения
   //  s[0] - bшr
   s[0]:=round(s[0]/2); // половина
   //  s[1] - hшr
   //  s[2] - hпr
   //  s[3] - dr
   s[3]:=round(s[3]/2);
   // s[3] - радиус
   with PaintBox1.Canvas do
   begin
      // верхняя горизонтальная линия
      MoveTo(xstart,ystart);
      LineTo(xend,ystart);
      // окружность.
      Ellipse(xend2-s[3],ystart+s[2],xend2+s[3],ystart+s[2]-2*s[3]);
      // прямоугольник для стирания верхней дуги окружности,
      // а также прорисовки левой и правой вертикальной черт.
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-s[0],ystart+s[1],xend2+s[0],ystart);
      Pen.Color:=RGB(0,0,0); // чёрный
      // левая вертикальная черта
      MoveTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart+s[1]);
      // правая вертикальная черта
      MoveTo(xend2+s[0],ystart);
      LineTo(xend2+s[0],ystart+s[1]);
   end; // with
   MyDuble(false); // возвращаем исходные значения
end;

// прямоугольный полузакрытый
procedure TForm1.RotorRectangleAlmostClosedShow;
begin
   MyDuble(true); // запоминает исходные значения
   //  s[0] - bщr
   s[0]:=round(s[0]/2);  // половина
   //  s[1] - hпr
   //  s[2] - d1r
   s[2]:= round(s[2]/2); //  радиус
   //  s[3] - d2r
   s[3]:=round(s[3]/2); //   радиус
   //  s[4] - hщr
   // рисуем линиями
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
   MyDuble(false); // возвращаем исходные значения
end;

// трапецеидальный полузакрытый
procedure TForm1.RotorTrapeziumAlmostClosedShow;
begin
   MyDuble(true); // запоминает исходные значения
   //  s[0] - bщr
   s[0]:=round(s[0]/2);  // половина
   //  s[1] - hпr
   //  s[2] - d1r
   s[2]:=round(s[2]/2); // радиус
   //  s[3] - d2r
   s[3]:=round(s[3]/2); // радиус
   //  s[4] - hщr
   //  s[5] - h12r  (размер отсутствующий на чертеже)
   // рисуем линиями
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
   MyDuble(false); // возвращаем исходные значения
end;

// пазы статора
// овальный
procedure TForm1.StatorOvalShow;
begin
   MyDuble(true); // запоминает исходные значения
   //  s[0] - hпs  - этот размер избыточен
   // для корректности должно быть выполнено
   // hпs = round(d2/2) + h12 + round((d1-bщs)/2) + hщs.
   //  s[1] - bщs
   s[1]:=round(s[1]/2);  // половина
   //  s[2] - hщs
   //  s[3] - d2
   s[3]:=round(s[3]/2); // половина
   //  s[4] - d1
   s[4]:=round(s[4]/2); // половина
   //  s[5] - h12
   with PaintBox1.Canvas do
   begin
      // верхняя правая дуга окружности
      Ellipse(xend2-s[3],yend-s[2]-s[4]+s[1]-s[5]-s[3],xend2+s[3],yend-s[2]-s[4]+s[1]-s[5]+s[3]);
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-s[3],yend-s[2]-s[4]+s[1]-s[5]-s[3],xend2,yend-s[2]-s[4]+s[1]-s[5]+s[3]);
      Rectangle(xend2,yend-s[2]-s[4]+s[1]-s[5],xend2+s[3],yend-s[2]-s[4]+s[1]-s[5]+s[3]);
      Pen.Color:=RGB(0,0,0); // чёрный
      // верхняя левая дуга окружности
      Ellipse(xend2-2*s[3],yend-s[2]-s[4]+s[1]-s[5]-s[3],xend2,yend-s[2]-s[4]+s[1]-s[5]+s[3]);
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-2*s[3],yend-s[2]-s[4]+s[1]-s[5]-s[3],xend2-s[3],yend-s[2]-s[4]+s[1]-s[5]+s[3]);
      Rectangle(xend2-s[3],yend-s[2]-s[4]+s[1]-s[5],xend2,yend-s[2]-s[4]+s[1]-s[5]+s[3]);
      Pen.Color:=RGB(0,0,0); // чёрный
      // рисуем линии
      // правая верхняя хорда
      MoveTo(xend2,yend-s[2]-s[4]+s[1]-s[5]-s[3]);
      LineTo(xend2+s[3],yend-s[2]-s[4]+s[1]-s[5]);
      // левая верхняя хорда
      MoveTo(xend2-s[3],yend-s[2]-s[4]+s[1]-s[5]-s[3]);
      LineTo(xend2,yend-s[2]-s[4]+s[1]-s[5]);
      // правый средний отрезок
      MoveTo(xend2+s[3],yend-s[2]-s[4]+s[1]-s[5]);
      LineTo(xend2+s[4],yend-s[2]-s[4]+s[1]);
      // левый средний отрезок
      MoveTo(xend2-s[3],yend-s[2]-s[4]+s[1]-s[5]);
      LineTo(xend2-s[4],yend-s[2]-s[4]+s[1]);
      // рисуем дуги окружностей
      // нижняя правая дуга окружности
      Ellipse(xend2+s[1]-s[4],yend-s[2]-s[4]+s[1],xend2+s[4],yend-s[2]+s[4]-s[1]);
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2+s[1]-s[4],yend-s[2]-s[4]+s[1],xend2+s[1],yend-s[2]+s[4]-s[1]);
      Rectangle(xend2+s[1],yend-s[2],xend2+s[4],yend-s[2]+s[4]-s[1]);
      Pen.Color:=RGB(0,0,0); // чёрный
      // нижняя левая дуга окружности
      Ellipse(xend2-2*s[4],yend-s[2]-s[4]+s[1],xend2-s[1],yend-s[2]+s[4]-s[1]);
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-2*s[4],yend-s[2]-s[4]+s[1],xend2-s[4],yend-s[2]+s[4]-s[1]);
      Rectangle(xend2-s[4],yend-s[2],xend2-s[1],yend-s[2]+s[4]-s[1]);
      Pen.Color:=RGB(0,0,0); // чёрный
      // рисуем линии
      // правая нижняя хорда
      MoveTo(xend2+s[1],yend-s[2]-s[4]+s[1]);
      LineTo(xend2+s[4],yend-s[2]);
      // левая нижняя хорда
      MoveTo(xend2-s[4],yend-s[2]-s[4]+s[1]);
      LineTo(xend2-s[1],yend-s[2]);
      // самая нижняя левая линия и вертикальная чёрточка
      MoveTo(xstart,yend);
      LineTo(xend2-s[1],yend);
      LineTo(xend2-s[1],yend-s[2]);
      // самая нижняя правая линия и вертикальная чёрточка
      MoveTo(xend2+s[1],yend-s[2]);
      LineTo(xend2+s[1],yend);
      LineTo(xend,yend);
   end; // with
   MyDuble(false); // возвращаем исходные значения
end;

// прямоугольный полузакрытый
procedure TForm1.StatorRectangleAlmostClosedShow;
begin
   MyDuble(true); // запоминает исходные значения
   // s[0] - b1
   s[0]:=round(s[0]/2); // половина
   // s[1] - hпs
   // s[2] - bщs
   s[2]:=round(s[2]/2); // половина
   // s[3] - hщs
   with PaintBox1.Canvas do
   begin
      // рисуем линиями
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
   MyDuble(false); // возвращаем исходные значения
end;

// полуовальный
procedure TForm1.StatorAlmostOvalShow;
begin
   MyDuble(true); // запоминает исходные значения
   // s[0] - b2
   s[0]:=round(s[0]/2); // половина
   // s[1] - hпs
   // s[2] - hщs
   // s[3] - bщs
   s[3]:=round(s[3]/2); // половина
   // s[4] - d1
   s[4]:=round(s[4]/2); // половина
   // s[5] - h12
   with PaintBox1.Canvas do
   begin
      // правая верхняя четверть окружности
      Ellipse(xend2-s[0]+2*s[4],yend-s[1],xend2+s[0],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-s[0]+2*s[4],yend-s[1],xend2+s[4],yend-s[1]+2*(s[0]-s[4]));
      Rectangle(xend2+s[4],yend-s[1]+s[0]-s[4],xend2+s[0],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(0,0,0); // чёрный
      // левая верхняя четверть окружности
      Ellipse(xend2-2*s[0]+s[4],yend-s[1],xend2-s[4],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-2*s[0]+s[4],yend-s[1],xend2-s[0],yend-s[1]+2*(s[0]-s[4]));
      Rectangle(xend2-s[0],yend-s[1]+s[0]-s[4],xend2-s[4],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(0,0,0); // чёрный
      // верхняя линия
      MoveTo(xend2-s[4],yend-s[1]);
      LineTo(xend2+s[4],yend-s[1]);
      // левая верхняя хорда
      MoveTo(xend2-s[0],yend-s[1]);
      LineTo(xend2-s[4],yend-s[1]+s[0]-s[4]);
      // правая верхняя хорда
      MoveTo(xend2+s[4],yend-s[1]);
      LineTo(xend2+s[0],yend-s[1]+s[0]-s[4]);
      // правая нижхняя четверть окружности
      Ellipse(xend2-s[4]+2*s[3],yend-s[2]-s[4]+s[3],xend2+s[4],yend-s[2]+s[4]-s[3]);
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-s[4]+2*s[3],yend-s[2]-s[4]+s[3],xend2+s[3],yend-s[2]+s[4]-s[3]);
      Rectangle(xend2+s[3],yend-s[2],xend2+s[4],yend-s[2]+s[4]-s[3]);
      Pen.Color:=RGB(0,0,0); // чёрный
      // левая нижняя четверть окружности
      Ellipse(xend2-2*s[4]+s[3],yend-s[2]-s[4]+s[3],xend2-s[3],yend-s[2]+s[4]-s[3]);
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-2*s[4]+s[3],yend-s[1]+s[5],xend2-s[4],yend-s[2]+s[4]-s[3]);
      Rectangle(xend2-s[4],yend-s[2],xend2-s[3],yend-s[2]+s[4]-s[3]);
      Pen.Color:=RGB(0,0,0); // чёрный
      // рисуем линии
      // левая наклонная линия
      MoveTo(xend2-s[0],yend-s[1]);
      LineTo(xend2-s[4],yend-s[1]+s[5]);
      // правая наклонная линия
      MoveTo(xend2+s[0],yend-s[1]);
      LineTo(xend2+s[4],yend-s[1]+s[5]);
      // левая нижняя хорда
      MoveTo(xend2-s[4],yend-s[1]+s[5]);
      LineTo(xend2-s[3],yend-s[2]);
      // правая нижняя хорда
      MoveTo(xend2+s[3],yend-s[1]+s[5]);
      LineTo(xend2+s[4],yend-s[2]);
      // самая нижняя левая линия и вертикальная чёрточка
      MoveTo(xstart,yend);
      LineTo(xend2-s[3],yend);
      LineTo(xend2-s[3],yend-s[2]);
      // самая нижняя правая линия и вертикальная чёрточка
      MoveTo(xend2+s[3],yend-s[2]);
      LineTo(xend2+s[3],yend);
      LineTo(xend,yend);
   end; // with
   MyDuble(false); // возвращаем исходные значения
end;

// трапецеидальный
procedure TForm1.StatorTrapeziumShow;
begin
   MyDuble(true); // запоминает исходные значения
   // s[0] - b2
   s[0]:=round(s[0]/2); // половина
   // s[1] - hпs
   // s[2] - hщs
   // s[3] - bщs
   s[3]:=round(s[3]/2); // половина
   // s[4] - b1
   s[4]:=round(s[4]/2); // половина
   // s[5] - h12
   // s[6] - h3
   with PaintBox1.Canvas do
   begin
      // правая верхняя четверть окружности
      Ellipse(xend2-s[0]+2*s[4],yend-s[1],xend2+s[0],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-s[0]+2*s[4],yend-s[1],xend2+s[4],yend-s[1]+2*(s[0]-s[4]));
      Rectangle(xend2+s[4],yend-s[1]+s[0]-s[4],xend2+s[0],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(0,0,0); // чёрный
      // левая верхняя четверть окружности
      Ellipse(xend2-2*s[0]+s[4],yend-s[1],xend2-s[4],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(255,255,255); // белый
      Rectangle(xend2-2*s[0]+s[4],yend-s[1],xend2-s[0],yend-s[1]+2*(s[0]-s[4]));
      Rectangle(xend2-s[0],yend-s[1]+s[0]-s[4],xend2-s[4],yend-s[1]+2*(s[0]-s[4]));
      Pen.Color:=RGB(0,0,0); // чёрный
      // верхняя линия
      MoveTo(xend2-s[4],yend-s[1]);
      LineTo(xend2+s[4],yend-s[1]);
      // левая верхняя хорда
      MoveTo(xend2-s[0],yend-s[1]);
      LineTo(xend2-s[4],yend-s[1]+s[0]-s[4]);
      // правая верхняя хорда
      MoveTo(xend2+s[4],yend-s[1]);
      LineTo(xend2+s[0],yend-s[1]+s[0]-s[4]);
      // рисуем линии
      // левая наклонная линия
      MoveTo(xend2-s[0],yend-s[1]);
      LineTo(xend2-s[4],yend-s[1]+s[5]);
      // правая наклонная линия
      MoveTo(xend2+s[0],yend-s[1]);
      LineTo(xend2+s[4],yend-s[1]+s[5]);
      // левая нижняя хорда
      MoveTo(xend2-s[4],yend-s[1]+s[5]);
      LineTo(xend2-s[3],yend-s[2]);
      // правая нижняя хорда
      MoveTo(xend2+s[3],yend-s[2]);
      LineTo(xend2+s[4],yend-s[2]-s[6]);
      // самая нижняя левая линия и вертикальная чёрточка
      MoveTo(xstart,yend);
      LineTo(xend2-s[3],yend);
      LineTo(xend2-s[3],yend-s[2]);
      // самая нижняя правая линия и вертикальная чёрточка
      MoveTo(xend2+s[3],yend-s[2]);
      LineTo(xend2+s[3],yend);
      LineTo(xend,yend);
   end; // with
   MyDuble(false); // возвращаем исходные значения
end;

// главные размеры асинхроного двигателя
procedure TForm1.ChiefSizeASinchronMotorShow;
begin
   MyDuble(true); // запоминает исходные значения
   // s[0] - ls
   s[0]:=round(s[0]/2); // половина
   // s[1] - d
   // s[2] - lr
   s[2]:=round(s[2]/2); // половина
   // s[3] - Dв
   // s[4] - Dкл
   // s[5] - D
   // s[6] - Dн
   // s[7] - a
   // s[8] - b
   s[8]:=round(s[8]/2); // половина

   // рисуем линиями
   with PaintBox1.Canvas do
   begin
      // основание (пъедистал)
      MoveTo(xstart+20,yend);
      LineTo(xstart+20,yend-s[3]);
      LineTo(xend-20,yend-s[3]);
      LineTo(xend-20,yend);
      // ротор
      Rectangle(xend2-s[2],yend-s[3],xend2+s[2],yend-s[5]+s[1]);
      // левый прямоугольник
      Rectangle(xend2-s[2]-s[7],yend-s[4]-s[8],xend2-s[2],yend-s[4]+s[8]);
      // правый прямоугольник
      Rectangle(xend2+s[2]+s[7],yend-s[4]-s[8],xend2+s[2],yend-s[4]+s[8]);
      // статор
      Rectangle(xend2-s[0],yend-s[6],xend2+s[0],yend-s[5]);
   end; // with

   MyDuble(false); // возвращаем исходные значения
end;

// прямоугольный открытый
procedure TForm1.StatorRectangleOpenShow;
const
  idelta = 4; // зазор
var
  ibuf,ih : Word; // переменные промежуточного хранения
begin
   MyDuble(true); // запоминает исходные значения
   // s[0] - hпs
   // s[1] - b1
   s[1]:=round(s[1]/2); // половина
   // s[2] - h
   with PaintBox1.Canvas do
   begin
      // рисуем линиями
      MoveTo(xstart,yend);
      LineTo(xend2-s[1],yend);
      ibuf:=round((s[2]-idelta)/2); // отступ по вертикали
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
      // установим для кисти особый цвет фона
      Brush.Style:=bsBDiagonal; // изменим стиль закраски
      Brush.Color:=RGB(0,0,0); // чёрный цвет кисти
      Rectangle(xend2-s[1]+idelta,yend-s[0]+idelta,xend2+s[1]-idelta,yend-s[2]);
      Brush.Style:=bsClear; // вернём стиль закраски обратно
      Brush.Color:=RGB(255,255,255); // белый цвет кисти
      ibuf:=round((s[0]-s[2])/2);
      Rectangle(xend2-s[1]+idelta,yend-s[2]-ibuf-idelta,xend2+s[1]-idelta,yend-s[2]-ibuf+idelta);
   end; // with
   MyDuble(false); // возвращаем исходные значения
end;

// овальный полузакрытый
procedure TForm1.RotorOvalAlmostClosedMetric;
const
  xstep = 10; // отступ по оси x
var
  ibuf : Word; // переменная промежуточного хранения
begin
   MyDuble(true); // запоминает исходные значения
   //  s[0] - bщr
   s[0]:=round(s[0]/2);
   //  s[1] - hщr
   //  s[2] - hпr
   //  s[3] - d2r
   s[3]:=round(s[3]/2);  // радиус
   //  s[4] - d1r
   s[4]:=round(s[4]/2);  // радиус
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
      TextOut(xend2-s[4]-xstep-20,ystart+ibuf,'hпr');
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
      TextOut(xend2-s[0]-30,ystart-s[4]-20,'bщr');
      MoveTo(xend2+s[0],ystart+s[1]);
      LineTo(xend2+s[0]+s[4]+xstep+5,ystart+s[1]);
      MoveTo(xend2+s[0]+s[4]+xstep,ystart-2*s[4]);
      LineTo(xend2+s[0]+s[4]+xstep,ystart+s[0]+s[4]);
      MyArrowUp(xend2+s[0]+s[4]+xstep,ystart+s[1]);
      MyArrowDown(xend2+s[0]+s[4]+xstep,ystart);
      TextOut(xend2+s[0]+s[4]+xstep+10,ystart+s[1],'hщr');
   end; // with
   MyDuble(false); // возвращаем исходные значения
   MyVisibleProc; // видимость компонентов
   // вывод наименований на экран
   Label5.Caption:='bщr';
   Label6.Caption:='hщr';
   Label7.Caption:='hпr';
   Label8.Caption:='d2r';
   Label9.Caption:='d1r';
   Label10.Caption:='h12r';
end;

// овальный закрытый
procedure TForm1.RotorOvalClosedMetric;
const
  xstep = 10; // отступ влево
begin
   MyDuble(true); // запоминает исходные значения
   //  s[0] - hщr
   //  s[1] - hпr
   //  s[2] - d2r
   s[2]:=round(s[2]/2);  // радиус
   //  s[3] - d1r
   s[3]:=round(s[3]/2);  // радиус
   //  s[4] - h12r
   with PaintBox1.Canvas do
   begin
      MoveTo(xend2,ystart+s[1]);
      LineTo(xend2-s[3]-xstep-5,ystart+s[1]);
      MoveTo(xend2-s[3]-xstep,ystart+s[1]);
      LineTo(xend2-s[3]-xstep,ystart);
      MyArrowUp(xend2-s[3]-xstep,ystart); // стрелка вверх
      MyArrowDown(xend2-s[3]-xstep,ystart+s[1]); // стрелка вниз
      s[1]:=round(s[1]/2);
      TextOut(xend2-s[3]-xstep-20,ystart+s[1],'hпr');
      s[1]:=s[1]*2;
      MoveTo(xend2-s[3],ystart+s[0]+s[3]);
      LineTo(xend2+2*s[3]+5,ystart+s[0]+s[3]);
      MyArrowLeft(xend2-s[3],ystart+s[0]+s[3]); // стрелка влево
      MyArrowRight(xend2+s[3],ystart+s[0]+s[3]); // стрелка вправо
      TextOut(xend2-10,ystart+s[0]+s[3]+3,'d1r');
      MoveTo(xend2-s[2],ystart+s[1]-s[2]);
      LineTo(xend2+2*s[3]+5,ystart+s[1]-s[2]);
      MyArrowLeft(xend2-s[2],ystart+s[1]-s[2]); // стрелка влево
      MyArrowRight(xend2+s[2],ystart+s[1]-s[2]); // стрелка вправо
      TextOut(xend2-10,ystart+s[1]-s[2]-14,'d2r');
      MoveTo(xend2+2*s[3],ystart+s[0]+s[3]);
      LineTo(xend2+2*s[3],ystart+s[1]-s[2]);
      MyArrowUp(xend2+2*s[3],ystart+s[0]+s[3]);  // стрелка вверх
      MyArrowDown(xend2+2*s[3],ystart+s[1]-s[2]); // стрелка вниз
      TextOut(xend2+2*s[3]+3,ystart+s[1]-2*s[2]-15,'h12r');
      s[3]:=round(s[3]/2); // половина радиуса
      MoveTo(xend2,ystart+s[0]+s[3]);
      LineTo(xend2,ystart-2*s[3]);
      MyArrowUp(xend2,ystart+s[0]);  // стрелка вверх
      MyArrowDown(xend2,ystart); // стрелка вниз
      TextOut(xend2-30,ystart-20,'hщr');
   end; // with
   MyDuble(false); // возвращаем исходные значения
   MyVisibleProc; // видимость компонентов
   // вывод наименований на экран
   Label5.Caption:='hщr';
   Label6.Caption:='hпr';
   Label7.Caption:='d2r';
   Label8.Caption:='d1r';
   Label9.Caption:='h12r';
end;

// прямоугольный полузакрытый
procedure TForm1.RotorRectangleAlmostClosedMetric;
const
   xstep = 10; // отступ по оси x
var
   imax,ibuf : Integer; // переменная временного хранения
begin
   MyDuble(true); // запоминает исходные значения
   //  s[0] - bщr
   s[0]:=round(s[0]/2);  // половина
   //  s[1] - hпr
   //  s[2] - d1r
   s[2]:= round(s[2]/2); // половина
   //  s[3] - d2r
   s[3]:= round(s[3]/2); // половина
   //  s[4] - hщr
   with PaintBox1.Canvas do
   begin
      if s[3]>s[2] then imax:=s[3]
      else imax:=s[2];
      MoveTo(xend2-s[3],ystart+s[1]);
      LineTo(xend2-imax-xstep-5,ystart+s[1]);
      MoveTo(xend2-imax-xstep,ystart+s[1]);
      LineTo(xend2-imax-xstep,ystart);
      MyArrowUp(xend2-imax-xstep,ystart); // стрелка вверх
      MyArrowDown(xend2-imax-xstep,ystart+s[1]); // стрелка вниз
      // hпr
      ibuf:=round(s[1]/2);
      TextOut(xend2-imax-xstep-20,ystart+ibuf,'hпr');
      MoveTo(xend2-s[3],ystart+s[1]);
      LineTo(xend2-s[3],ystart+s[1]+25);
      MoveTo(xend2+s[3],ystart+s[1]);
      LineTo(xend2+s[3],ystart+s[1]+25);
      MoveTo(xend2-s[3],ystart+s[1]+20);
      LineTo(xend2+s[3],ystart+s[1]+20);
      MyArrowLeft(xend2-s[3],ystart+s[1]+20); // стрелка влево
      MyArrowRight(xend2+s[3],ystart+s[1]+20); // стрелка вправо
      // d2r
      TextOut(xend2-10,ystart+s[1]+25,'d2r');
      MoveTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart-25);
      MoveTo(xend2+s[0],ystart);
      LineTo(xend2+s[0],ystart-25);
      MoveTo(xend2-s[0]-30,ystart-20);
      LineTo(xend2+s[0]+20,ystart-20);
      MyArrowLeft(xend2+s[0],ystart-20); // стрелка влево
      MyArrowRight(xend2-s[0],ystart-20); // стрелка вправо
      // bщr
      TextOut(xend2-s[0]-25,ystart-37,'bщr');
      MoveTo(xend2+s[0],ystart+s[4]);
      LineTo(xend2+2*s[0]+s[2]+5,ystart+s[4]);
      MoveTo(xend2+2*s[0]+s[2],ystart+s[4]+20);
      LineTo(xend2+2*s[0]+s[2],ystart-25);
      MyArrowUp(xend2+2*s[0]+s[2],ystart+s[4]);
      MyArrowDown(xend2+2*s[0]+s[2],ystart);
      // hщr
      TextOut(xend2+2*s[0]+s[2]+6,ystart+s[4]-10,'hщr');
      MoveTo(xend2-s[2],ystart+s[4]);
      LineTo(xend2-s[2],ystart+s[4]+25);
      MoveTo(xend2+s[2],ystart+s[4]);
      LineTo(xend2+s[2],ystart+s[4]+25);
      MoveTo(xend2-s[2],ystart+s[4]+20);
      LineTo(xend2+s[2],ystart+s[4]+20);
      MyArrowLeft(xend2-s[2],ystart+s[4]+20); // стрелка влево
      MyArrowRight(xend2+s[2],ystart+s[4]+20); // стрелка вправо
      // d1r
      TextOut(xend2-10,ystart+s[4]+25,'d1r');
   end; // with
   MyDuble(false); // возвращаем исходные значения
   MyVisibleProc; // видимость компонентов
   // вывод наименований на экран
   Label5.Caption:='bщr';
   Label6.Caption:='hпr';
   Label7.Caption:='d1r';
   Label8.Caption:='d2r';
   Label9.Caption:='hщr';
end;

// круглый полузакрытый
procedure TForm1.RotorRoundAlmostClosedMetric;
const
   xstep = 10; // отступ влево
var
   ibuf : Integer; // переменная промежуточного хранения
begin
   MyDuble(true); // запоминает исходные значения
   //  s[0] - bщr
   s[0]:=round(s[0]/2); // половина
   //  s[1] - hщr
   //  s[2] - hпr
   //  s[3] - dr
   s[3]:=round(s[3]/2);
   // s[3] - радиус
   with PaintBox1.Canvas do
   begin
      MoveTo(xend2,ystart+s[2]);
      LineTo(xend2-s[3]-xstep-5,ystart+s[2]);
      MoveTo(xend2-s[3]-xstep,ystart+s[2]);
      LineTo(xend2-s[3]-xstep,ystart);
      TextOut(xend2-s[3]-xstep-30,ystart+s[2]-20,'hпr');
      MyArrowUp(xend2-s[3]-xstep,ystart);  // стрелка вверх
      MyArrowDown(xend2-s[3]-xstep,ystart+s[2]);  // стрелка вниз
      MoveTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart-s[3]);
      MoveTo(xend2+s[0],ystart);
      LineTo(xend2+s[0],ystart-s[3]);
      s[3]:=round(s[3]/2); // половина радиуса
      MoveTo(xend2-s[0]-s[3],ystart-s[3]);
      LineTo(xend2+s[0]+s[3],ystart-s[3]);
      TextOut(xend2-s[0]-s[3]-20,ystart-s[3]-20,'bщr');
      MyArrowRight(xend2-s[0],ystart-s[3]); // стрелка вправо
      MyArrowLeft(xend2+s[0],ystart-s[3]);  // стрелка влево
      MoveTo(xend2+s[0],ystart+s[1]);
      LineTo(xend2+s[0]+2*s[3],ystart+s[1]);
      MoveTo(xend2+s[0]+2*s[3]-5,ystart-2*s[3]);
      LineTo(xend2+s[0]+2*s[3]-5,ystart+s[1]+2*s[3]);
      TextOut(xend2+s[0]+2*s[3]+3,ystart+s[1]+5,'hщr');
      MyArrowUp(xend2+s[0]+2*s[3]-5,ystart+s[1]); // стрелка вверх
      MyArrowDown(xend2+s[0]+2*s[3]-5,ystart); // стрелка вниз
      ibuf:=round(s[3]/4);  // восьмушка радиуса
      MoveTo(xend2-5*ibuf,ystart+s[2]-3*ibuf);
      LineTo(xend2+5*ibuf,ystart+s[1]+3*ibuf);
      TextOut(xend2-13,ystart+s[1]+8*ibuf-15,'dr');
      MyArrowUpRight(xend2+5*ibuf,ystart+s[1]+3*ibuf); // наклонная стрелка вверх и вправо
      MyArrowDownLeft(xend2-5*ibuf,ystart+s[2]-3*ibuf); // наклонная стрелка вниз и влево
   end; // with
   MyDuble(false); // возвращаем исходные значения
   MyVisibleProc; // видимость компонентов
   // вывод наименований на экран
   Label5.Caption:='bщr';
   Label6.Caption:='hщr';
   Label7.Caption:='hпr';
   Label8.Caption:='dr';
end;

// круглый закрытый
procedure TForm1.RotorRoundClosedMetric;
const
   xstep = 10; // отступ влево
var
   ibuf : Integer; // переменная промежуточного хранения
begin
  MyDuble(true); // запоминает исходные значения
  //  s[0] - hщr
  //  s[1] - hпr
  //  s[2] - dr (диаметр)
  s[2]:=round(s[2]/2);
  //  s[2] - радиус
  with PaintBox1.Canvas do
  begin
    MoveTo(xend2,ystart+s[1]);
    LineTo(xend2-s[2]-xstep-5,ystart+s[1]);
    MoveTo(xend2-s[2]-xstep,ystart+s[1]);
    LineTo(xend2-s[2]-xstep,ystart);
    TextOut(xend2-s[2]-xstep-30,ystart+s[1]-20,'hпr');
    MyArrowUp(xend2-s[2]-xstep,ystart); // стрелка вверх
    MyArrowDown(xend2-s[2]-xstep,ystart+s[1]); // стрелка вниз
    s[2]:=round(s[2]/2);  // половина радиуса
    MoveTo(xend2,ystart+s[2]+s[0]);
    LineTo(xend2,ystart-2*s[2]);
    TextOut(xend2-30,ystart-20,'hщr');
    MyArrowUp(xend2,ystart+s[0]); // стрелка вверх
    MyArrowDown(xend2,ystart);  // стрелка вниз
    ibuf:=round(s[2]/4);  // восьмушка радиуса
    MoveTo(xend2-5*ibuf,ystart+s[1]-3*ibuf);
    LineTo(xend2+5*ibuf,ystart+s[0]+3*ibuf);
    TextOut(xend2-13,ystart+s[0]+8*ibuf-15,'dr');
    MyArrowUpRight(xend2+5*ibuf,ystart+s[0]+3*ibuf); // наклонная стрелка вверх и вправо
    MyArrowDownLeft(xend2-5*ibuf,ystart+s[1]-3*ibuf); // наклонная стрелка вниз и влево
  end;
  MyDuble(false); // возвращаем исходные значения
  MyVisibleProc; // видимость компонентов
  // вывод наименований на экран
  Label5.Caption:='hщr';
  Label6.Caption:='hпr';
  Label7.Caption:='dr';
end;

// трапецеидальный полузакрытый
procedure TForm1.RotorTrapeziumAlmostClosedMetric;
const
   xstep = 10; // отступ по оси x
var
   imax,ibuf : Integer;
begin
   MyDuble(true); // запоминает исходные значения
   //  s[0] - bщr
   s[0]:=round(s[0]/2);  // половина
   //  s[1] - hпr
   //  s[2] - d1r
   s[2]:=round(s[2]/2); // радиус
   //  s[3] - d2r
   s[3]:=round(s[3]/2); // радиус
   //  s[4] - hщr
   //  s[5] - h12r
   with PaintBox1.Canvas do
   begin
      if s[3]>s[2] then imax:=s[3]
      else imax:=s[2];
      MoveTo(xend2-s[3],ystart+s[1]);
      LineTo(xend2-imax-xstep-5,ystart+s[1]);
      MoveTo(xend2-imax-xstep,ystart+s[1]);
      LineTo(xend2-imax-xstep,ystart);
      MyArrowUp(xend2-imax-xstep,ystart); // стрелка вверх
      MyArrowDown(xend2-imax-xstep,ystart+s[1]); // стрелка вниз
      // hпr
      ibuf:=round(s[1]/2);
      TextOut(xend2-imax-xstep-20,ystart+ibuf,'hпr');
      MoveTo(xend2-s[3],ystart+s[1]);
      LineTo(xend2-s[3],ystart+s[1]+25);
      MoveTo(xend2+s[3],ystart+s[1]);
      LineTo(xend2+s[3],ystart+s[1]+25);
      MoveTo(xend2-s[3],ystart+s[1]+20);
      LineTo(xend2+s[3],ystart+s[1]+20);
      MyArrowLeft(xend2-s[3],ystart+s[1]+20); // стрелка влево
      MyArrowRight(xend2+s[3],ystart+s[1]+20); // стрелка вправо
      TextOut(xend2-10,ystart+s[1]+25,'d2r');  // d2r
      MoveTo(xend2-s[0],ystart);
      LineTo(xend2-s[0],ystart-25);
      MoveTo(xend2+s[0],ystart);
      LineTo(xend2+s[0],ystart-25);
      MoveTo(xend2-s[0]-30,ystart-20);
      LineTo(xend2+s[0]+20,ystart-20);
      MyArrowLeft(xend2+s[0],ystart-20); // стрелка влево
      MyArrowRight(xend2-s[0],ystart-20); // стрелка вправо
      TextOut(xend2-s[0]-25,ystart-37,'bщr'); // bщr
      MoveTo(xend2+s[0],ystart+s[4]);
      LineTo(xend2+2*s[0]+s[2]+5,ystart+s[4]);
      MoveTo(xend2+2*s[0]+s[2],ystart+s[4]+20);
      LineTo(xend2+2*s[0]+s[2],ystart-25);
      MyArrowUp(xend2+2*s[0]+s[2],ystart+s[4]);
      MyArrowDown(xend2+2*s[0]+s[2],ystart);
      TextOut(xend2+2*s[0]+s[2]+6,ystart+s[4]-10,'hщr'); // hщr
      MoveTo(xend2-s[2],ystart+s[4]);
      LineTo(xend2-s[2],ystart+s[4]+25);
      MoveTo(xend2+s[2],ystart+s[4]);
      LineTo(xend2+s[2],ystart+s[4]+25);
      MoveTo(xend2-s[2],ystart+s[4]+20);
      LineTo(xend2+s[2],ystart+s[4]+20);
      MyArrowLeft(xend2-s[2],ystart+s[4]+20); // стрелка влево
      MyArrowRight(xend2+s[2],ystart+s[4]+20); // стрелка вправо
      TextOut(xend2-10,ystart+s[4]+25,'d1r');
      MoveTo(xend2+s[2],ystart+s[1]-s[5]);
      LineTo(xend2+imax+xstep+5,ystart+s[1]-s[5]);
      MoveTo(xend2+s[3],ystart+s[1]);
      LineTo(xend2+imax+xstep+5,ystart+s[1]);
      MoveTo(xend2+imax+xstep,ystart+s[1]-s[5]);
      LineTo(xend2+imax+xstep,ystart+s[1]);
      MyArrowUp(xend2+imax+xstep,ystart+s[1]-s[5]); // стрелка вверх
      MyArrowDown(xend2+imax+xstep,ystart+s[1]); // стрелка вниз
      ibuf:=round(s[5]/2);
      TextOut(xend2+imax+xstep+3,ystart+s[1]-ibuf-5,'h12r'); // d1r
   end; // with
   MyDuble(false); // возвращаем исходные значения
   MyVisibleProc; // видимость компонентов
   // вывод наименований на экран
   Label5.Caption:='bщr';
   Label6.Caption:='hпr';
   Label7.Caption:='d1r';
   Label8.Caption:='d2r';
   Label9.Caption:='hщr';
   Label10.Caption:='h12r';
end;

// стрелка вверх
// вершина стрелки находитсяв точке с
// координатами (ix,iy);
procedure TForm1.MyArrowUp(ix, iy: Integer);
begin
   with PaintBox1.Canvas do
   begin
      // граница области заливки
      MoveTo(ix,iy);
      LineTo(ix-4,iy+8);
      LineTo(ix+4,iy+8);
      LineTo(ix,iy);
      // заливка
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix-2,iy+6,RGB(255,255,255),fsSurface);
      FloodFill(ix+2,iy+6,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// стрелка вниз
// вершина стрелки находитсяв точке с
// координатами (ix,iy);
procedure TForm1.MyArrowDown(ix, iy: Integer);
begin
   with PaintBox1.Canvas do
   begin
      // граница области заливки
      MoveTo(ix,iy);
      LineTo(ix-4,iy-8);
      LineTo(ix+4,iy-8);
      LineTo(ix,iy);
      // заливка
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix-2,iy-6,RGB(255,255,255),fsSurface);
      FloodFill(ix+2,iy-6,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// стрелка влево
// вершина стрелки находитсяв точке с
// координатами (ix,iy);
procedure TForm1.MyArrowLeft(ix, iy: Integer);
begin
   with PaintBox1.Canvas do
   begin
      // граница области заливки
      MoveTo(ix,iy);
      LineTo(ix+8,iy-4);
      LineTo(ix+8,iy+4);
      LineTo(ix,iy);
      // заливка
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix+6,iy-2,RGB(255,255,255),fsSurface);
      FloodFill(ix+6,iy+2,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// стрелка вправо
// вершина стрелки находитсяв точке с
// координатами (ix,iy);
procedure TForm1.MyArrowRight(ix, iy: Integer);
begin
   with PaintBox1.Canvas do
   begin
      // граница области заливки
      MoveTo(ix,iy);
      LineTo(ix-8,iy-4);
      LineTo(ix-8,iy+4);
      LineTo(ix,iy);
      // заливка
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix-6,iy-2,RGB(255,255,255),fsSurface);
      FloodFill(ix-6,iy+2,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// наклонная стрелка влево и вниз
// вершина стрелки находитсяв точке с
// координатами (ix,iy);
procedure TForm1.MyArrowDownLeft(ix, iy: Integer);
begin
   with PaintBox1.Canvas do
   begin
      // граница области заливки
      MoveTo(ix,iy);
      LineTo(ix+8,iy-2);
      LineTo(ix+2,iy-8);
      LineTo(ix,iy);
      // заливка
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix+6,iy-3,RGB(255,255,255),fsSurface);
      FloodFill(ix+3,iy-5,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// наклонная стрелка вправо и верх
// вершина стрелки находитсяв точке с
// координатами (ix,iy);
procedure TForm1.MyArrowUpRight(ix, iy: Integer);
begin
   with PaintBox1.Canvas do
   begin
      // граница области заливки
      MoveTo(ix,iy);
      LineTo(ix-8,iy+2);
      LineTo(ix-2,iy+8);
      LineTo(ix,iy);
      // заливка
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix-6,iy+3,RGB(255,255,255),fsSurface);
      FloodFill(ix-3,iy+5,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// главные размеры асинхроного двигателя
procedure TForm1.ChiefSizeASinchronMotorMetric;
var
  ibuf : Integer; // переменная промежуточного хранения
begin
   MyDuble(true); // запоминает исходные значения
   // s[0] - ls
   s[0]:=round(s[0]/2); // половина
   // s[1] - d (delta)
   // s[2] - lr
   s[2]:=round(s[2]/2); // половина
   // s[3] - Dв
   // s[4] - Dкл
   // s[5] - D
   // s[6] - Dн
   // s[7] - a
   // s[8] - b
   s[8]:=round(s[8]/2); // половина
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
      // диагональки статора
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
      // диагональки ротора
      MoveTo(xend2+s[0],yend-s[6]);
      LineTo(xend,yend-s[6]);
      MoveTo(xend-5,yend-s[6]);
      LineTo(xend-5,yend);
      MyArrowUp(xend-5,yend-s[6]);
      MyArrowDown(xend-5,yend);
      // Dн
      ibuf:=round(s[6]/2);
      TextOut(xend,yend-ibuf-3,'Dн');
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
      // Dв
      TextOut(xstart-19,yend-15,'Dв');
      MoveTo(xend2-s[2]-s[7]-7,yend-s[4]);
      LineTo(xend-40,yend-s[4]);
      MoveTo(xend-45,yend-s[4]);
      LineTo(xend-45,yend);
      MyArrowUp(xend-45,yend-s[4]);
      MyArrowDown(xend-45,yend);
      // Dкл
      ibuf:=round(s[4]/2);
      TextOut(xend-42,yend-ibuf-5,'Dкл');
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
      // основание
   end;
   MyDuble(false); // возвращаем исходные значения
   MyVisibleProc; // видимость компонентов
   // вывод наименований на экран
   Label5.Caption:='ls';
   Label6.Caption:='d';
   Label7.Caption:='lr';
   Label8.Caption:='Dв';
   Label9.Caption:='Dкл';
   Label10.Caption:='D';
   Label11.Caption:='Dн';
   Label12.Caption:='a';
   Label13.Caption:='b';
end;

// полуовальный
procedure TForm1.StatorAlmostOvalMetric;
const
   xstep = 10; // отступ по оси x
var
   imax,ibuf : Integer; // переменная промежуточного хранения
begin
   MyDuble(true); // запоминает исходные значения
   // s[0] - b2
   s[0]:=round(s[0]/2); // половина
   // s[1] - hпs
   // s[2] - hщs
   // s[3] - bщs
   s[3]:=round(s[3]/2); // половина
   // s[4] - d1
   s[4]:=round(s[4]/2); // половина
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
     MyArrowLeft(xend2-s[0],yend-s[1]-20); // стрелка влево
     MyArrowRight(xend2+s[0],yend-s[1]-20); // стрелка вправо
     // b2
     TextOut(xend2-10,yend-s[1]-35,'b2');
     MoveTo(xend2-s[0],yend-s[1]);
     LineTo(xend2-imax-xstep-5,yend-s[1]);
     MoveTo(xend2-imax-xstep,yend-s[1]);
     LineTo(xend2-imax-xstep,yend);
     MyArrowUp(xend2-imax-xstep,yend-s[1]); // стрелка вверх
     MyArrowDown(xend2-imax-xstep,yend); // стрелка вниз
     // hпs
     ibuf:=round(s[1]/2);
     TextOut(xend2-imax-xstep-22,yend-ibuf,'hпs');
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
     MyArrowUp(xend2+imax+xstep,yend-s[1]); // стрелка вверх
     MyArrowDown(xend2+imax+xstep,yend-s[1]+s[5]);  // стрелка вниз
     // h12
     ibuf:=round(s[5]/2);
     TextOut(xend2+imax+xstep+3,yend-s[1]+ibuf,'h12');
     MoveTo(xend2-s[3],yend);
     LineTo(xend2-s[3],yend+25);
     MoveTo(xend2+s[3],yend);
     LineTo(xend2+s[3],yend+25);
     MoveTo(xend2-s[3]-20,yend+20);
     LineTo(xend2+s[3]+30,yend+20);
     MyArrowLeft(xend2+s[3],yend+20); // стрелка влево
     MyArrowRight(xend2-s[3],yend+20); // стрелка вправо
     // bщs
     TextOut(xend2+s[3]+10,yend+5,'bщs');
     MoveTo(xend2-s[3],yend-s[2]);
     LineTo(xend2-s[4]-xstep-5,yend-s[2]);
     MoveTo(xend2-s[4]-xstep,yend+20);
     LineTo(xend2-s[4]-xstep,yend-s[2]-20);
     MyArrowUp(xend2-s[4]-xstep,yend); // стрелка вверх
     MyArrowDown(xend2-s[4]-xstep,yend-s[2]); // стрелка вниз
     // hщs
     TextOut(xend2-s[4]-xstep-27,yend-s[2]-15,'hщs');
     // дополнительная разметка:
     Pen.Style:=psDot; // стиль карандша (пунктирная линия)
     MoveTo(xend2-s[4],yend-s[1]+s[5]);
     LineTo(xend2-s[4],yend-s[1]);
     MoveTo(xend2+s[4],yend-s[1]+s[5]);
     LineTo(xend2+s[4],yend-s[1]);
     Pen.Style:=psSolid; // возвращаем сплошную линию
   end; // with
   MyDuble(false); // возвращаем исходные значения
   MyVisibleProc; // видимость компонентов
   // вывод наименований на экран
   Label5.Caption:='b2';
   Label6.Caption:='hпs';
   Label7.Caption:='hщs';
   Label8.Caption:='bщs';
   Label9.Caption:='d1';
   Label10.Caption:='h12';
end;

// овальный
procedure TForm1.StatorOvalMetric;
const
   xstep = 10; // отступ по оси x
var
   imax,ibuf : Integer; // переменная промежуточного хранения
begin
   MyDuble(true); // запоминает исходные значения
   //  s[0] - hпs  - этот размер избыточен
   // для корректности должно быть выполнено
   // hпs = round(d2/2) + h12 + round((d1-bщs)/2) + hщs.
   //  s[1] - bщs
   s[1]:=round(s[1]/2);  // половина
   //  s[2] - hщs
   //  s[3] - d2
   s[3]:=round(s[3]/2); // половина
   //  s[4] - d1
   s[4]:=round(s[4]/2); // половина
   //  s[5] - h12
   with PaintBox1.Canvas do
   begin
      if s[3]>s[4] then imax:=s[3]
      else imax:=s[4];
      MoveTo(xend2,yend-s[0]);
      LineTo(xend2-imax-xstep-5,yend-s[0]);
      MoveTo(xend2-imax-xstep,yend-s[0]);
      LineTo(xend2-imax-xstep,yend);
      MyArrowUp(xend2-imax-xstep,yend-s[0]); // стрелка вверх
      MyArrowDown(xend2-imax-xstep,yend); // стрелка вниз
      // hпs
      ibuf:=round(s[0]/2);
      TextOut(xend2-imax-xstep-22,yend-ibuf,'hпs');
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
      MyArrowUp(xend2+imax+xstep,yend-s[0]+s[3]); // стрелка вверх
      MyArrowDown(xend2+imax+xstep,yend-s[0]+s[3]+s[5]); // стрелка вниз
      // h12
      ibuf:=round(s[5]/2);
      TextOut(xend2+imax+xstep+3,yend-s[0]+s[3]+ibuf,'h12');
      MoveTo(xend2-s[1],yend);
      LineTo(xend2-s[1],yend+25);
      MoveTo(xend2+s[1],yend);
      LineTo(xend2+s[1],yend+25);
      MoveTo(xend2-s[1]-15,yend+20);
      LineTo(xend2+s[1]+30,yend+20);
      MyArrowLeft(xend2+s[1],yend+20);  // стрелка влево
      MyArrowRight(xend2-s[1],yend+20); // стрелка вправо
      // bщs
      TextOut(xend2+s[1]+10,yend+5,'bщs');
      MoveTo(xend2-s[1],yend-s[2]);
      LineTo(xend2-s[4]-xstep-5,yend-s[2]);
      MoveTo(xend2-s[4]-xstep,yend-s[2]-20);
      LineTo(xend2-s[4]-xstep,yend+15);
      MyArrowUp(xend2-s[4]-xstep,yend); // стрелка вверх
      MYArrowDown(xend2-s[4]-xstep,yend-s[2]); // стрелка вниз
      // hщs
      TextOut(xend2-s[4]-xstep-25,yend-s[2]-25,'hщs');
   end; // with
   MyDuble(false); // возвращаем исходные значения
   MyVisibleProc; // видимость компонентов
   // вывод наименований на экран
   Label5.Caption:='hпs';
   Label6.Caption:='bщs';
   Label7.Caption:='hщs';
   Label8.Caption:='d2';
   Label9.Caption:='d1';
   Label10.Caption:='h12';
end;

// прямоугольный полузакрытый
procedure TForm1.StatorRectangleAlmostClosedMetric;
const
   xstep = 10; // отступ по оси x
var
   ibuf : Integer;
begin
   MyDuble(true); // запоминает исходные значения
   // s[0] - b1
   s[0]:=round(s[0]/2); // половина
   // s[1] - hпs
   // s[2] - bщs
   s[2]:=round(s[2]/2); // половина
   // s[3] - hщs
   with PaintBox1.Canvas do
   begin
      MoveTo(xend2-s[0],yend-s[1]);
      LineTo(xend2-s[0]-xstep-5,yend-s[1]);
      MoveTo(xend2-s[0]-xstep,yend-s[1]);
      LineTo(xend2-s[0]-xstep,yend);
      MyArrowUp(xend2-s[0]-xstep,yend-s[1]);
      MyArrowDown(xend2-s[0]-xstep,yend);
      // hпs
      ibuf:=round(s[1]/2);
      TextOut(xend2-s[0]-xstep-23,yend-ibuf,'hпs');
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
      // hщs
      TextOut(xend2+s[0]+xstep+7,yend-s[3]+3,'hщs');
      MoveTo(xend2-s[2],yend);
      LineTo(xend2-s[2],yend+25);
      MoveTo(xend2+s[2],yend);
      LineTo(xend2+s[2],yend+25);
      MoveTo(xend2-s[2]-30,yend+20);
      LineTo(xend2+s[2]+20,yend+20);
      MyArrowLeft(xend2+s[2],yend+20);
      MyArrowRight(xend2-s[2],yend+20);
      // bщs
      TextOut(xend2-10,yend+25,'bщs');
   end;
   MyDuble(false); // возвращаем исходные значения
   MyVisibleProc; // видимость компонентов
   // вывод наименований на экран
   Label5.Caption:='b1';
   Label6.Caption:='hпs';
   Label7.Caption:='bщs';
   Label8.Caption:='hщs';
end;

// прямоугольный открытый
procedure TForm1.StatorRectangleOpenMetric;
const
  idelta = 4; // зазор
  xstep = 10; // отступ по оси x
var
  ibuf,imybuf : Word; // переменные промежуточного хранения
begin
   MyDuble(true); // запоминает исходные значения
   // s[0] - hпs
   // s[1] - b1
   s[1]:=round(s[1]/2); // половина
   // s[2] - h
   with PaintBox1.Canvas do
   begin
      ibuf:=round((s[2]-idelta)/2); // отступ по вертикали
      MoveTo(xend2-s[1],yend-s[0]);
      LineTo(xend2-s[1]-ibuf-xstep-5,yend-s[0]);
      MoveTo(xend2-s[1]-ibuf-xstep,yend-s[0]);
      LineTo(xend2-s[1]-ibuf-xstep,yend);
      MyArrowUp(xend2-s[1]-ibuf-xstep,yend-s[0]);
      MyArrowDown(xend2-s[1]-ibuf-xstep,yend);
      // hпs
      imybuf:=round(s[0]/2);
      TextOut(xend2-s[1]-ibuf-xstep-20,yend-imybuf,'hпs');
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
   MyDuble(false); // возвращаем исходные значения
   MyVisibleProc; // видимость компонентов
   // вывод наименований на экран
   Label5.Caption:='hпs';
   Label6.Caption:='b1';
   Label7.Caption:='h';
end;

// трапецеидальный
procedure TForm1.StatorTrapeziumMetric;
const
  xstep = 10; // отступ по оси x
var
  imax,ibuf : Integer;
begin
   MyDuble(true); // запоминает исходные значения
   // s[0] - b2
   s[0]:=round(s[0]/2); // половина
   // s[1] - hпs
   // s[2] - hщs
   // s[3] - bщs
   s[3]:=round(s[3]/2); // половина
   // s[4] - b1
   s[4]:=round(s[4]/2); // половина
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
     // hпs
     ibuf:=round(s[1]/2);
     TextOut(xend2-imax-xstep-22,yend-ibuf,'hпs');
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
     // bщs
     TextOut(xend2+s[3]+10,yend+5,'bщs');
     MoveTo(xend2-s[3],yend-s[2]);
     LineTo(xend2-s[4]-xstep-5,yend-s[2]);
     MoveTo(xend2-s[4]-xstep,yend-s[2]-20);
     LineTo(xend2-s[4]-xstep,yend+20);
     MyArrowUp(xend2-s[4]-xstep,yend);
     MyArrowDown(xend2-s[4]-xstep,yend-s[2]);
     // hщs
     TextOut(xend2-s[4]-xstep-25,yend-s[2]-20,'hщs');
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
     // дополнительная разметка:
     Pen.Style:=psDot; // стиль карандша (пунктирная линия)
     MoveTo(xend2-s[4],yend-s[1]+s[5]);
     LineTo(xend2-s[4],yend-s[1]);
     MoveTo(xend2+s[4],yend-s[1]+s[5]);
     LineTo(xend2+s[4],yend-s[1]);
     Pen.Style:=psSolid; // возвращаем сплошную линию
   end; // with
   MyDuble(false); // возвращаем исходные значения
   MyVisibleProc; // видимость компонентов
   // вывод наименований на экран
   Label5.Caption:='b2';
   Label6.Caption:='hпs';
   Label7.Caption:='hщs';
   Label8.Caption:='bщs';
   Label9.Caption:='b1';
   Label10.Caption:='h12';
   Label11.Caption:='h3';
end;

// видимость элементов на форме
procedure TForm1.MyVisibleProc;
begin
   // установим видимость "надписей"
   Label5.Visible:=bVis[0];
   Label6.Visible:=bVis[1];
   Label7.Visible:=bVis[2];
   Label8.Visible:=bVis[3];
   Label9.Visible:=bVis[4];
   Label10.Visible:=bVis[5];
   Label11.Visible:=bVis[6];
   Label12.Visible:=bVis[7];
   Label13.Visible:=bVis[8];
   // установим видимость "значений"
   Edit1.Visible:=bVis[0];
   Edit2.Visible:=bVis[1];
   Edit3.Visible:=bVis[2];
   Edit4.Visible:=bVis[3];
   Edit5.Visible:=bVis[4];
   Edit6.Visible:=bVis[5];
   Edit7.Visible:=bVis[6];
   Edit8.Visible:=bVis[7];
   Edit9.Visible:=bVis[8];
   // вывод значений размеров на экран
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
   i : Integer; // счётчик
begin
   // инициализирует режим отображения
   ishow:=rgTypeOfImage.ItemIndex;
   // ishow = 0 => отобржение без размеров
   // ishow = 1 => отображение с размерами
   if ishow = 0 then
   begin
      for i:=0 to 8 do bVis[i]:=false;
      MyVisibleProc;
      Button1.Visible:=false;
   end; 
   // принудительная перерисовка
   Repaint;
end;

// по нажатию кнопки осущесляется считывание
// параметров из окон ввода Editi.
procedure TForm1.Button1Click(Sender: TObject);
var
   // файл в котором требуется
   // произвести перезапись
   f : TStrings;
   i : Integer; // счётчик
begin
   // вывод значений размеров на экран
   if bVis[0] then s[0]:=StrToInt(Edit1.Text);
   if bVis[1] then s[1]:=StrToInt(Edit2.Text);
   if bVis[2] then s[2]:=StrToInt(Edit3.Text);
   if bVis[3] then s[3]:=StrToInt(Edit4.Text);
   if bVis[4] then s[4]:=StrToInt(Edit5.Text);
   if bVis[5] then s[5]:=StrToInt(Edit6.Text);
   if bVis[6] then s[6]:=StrToInt(Edit7.Text);
   if bVis[7] then s[7]:=StrToInt(Edit8.Text);
   if bVis[8] then s[8]:=StrToInt(Edit9.Text);
   // введённые именения требуется сохранить в
   // соответствующем файле.
   f:=TStringList.Create();  // создание объекта
   f.Clear; // очистка содержимого объекта
   for i:=0 to 8 do
   begin
      if bVis[i] then f.Add(IntToStr(s[i])); // добавляем новую строку
   end;
   // сохраняем результат изменения
   case itype of
       // файлы размеров ротора
       1: f.SaveToFile('input\rotor'+IntToStr(inum)+'.txt');
       // файлы размеров статора
       2: f.SaveToFile('input\stator'+IntToStr(inum)+'.txt');
       // главные размеры асинхронного двигателя
       3: f.SaveToFile('input\motor.txt');
    end; // case
    f.Free; // уничтожение объекта
   // принудительная перерисовка
   Repaint;
end;

// генерируется при изменении размеров окна (главной формы)
procedure TForm1.FormResize(Sender: TObject);
begin
  PaintBox1.Width:=Width-380;
  PaintBox1.Height:=Height-120;
  Repaint;
end;

// копирование размеров
procedure TForm1.MyDuble(b: bool);
var
   i : Integer; // счётчик
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
