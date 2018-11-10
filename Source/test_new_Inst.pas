unit test_new_Inst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
type
  imType_old = record
                   h_or_v : Single;
                   q      : Single;
                   vol    : String[10];
                   w      : String[10];
                   e      : string[10];
                  end;
  imType = record
                   h_or_v : string[10];
                   q      : string[10];
                   vol    : String[10];
                  end;
var
  im : imType;
  Fim : File of imType;
  s:string;
  b:byte;
begin
  if FileExists('fim') then
    begin
      AssignFile(Fim,'fim');
      Reset(Fim);
      Read(Fim,im);
        // 1 акрон - скорость, м/c
 //   1 эхо   уровень, м
 //    2 расход, куб.м/час
 //    3 объем куб.м
 //    4 наработка, час.мин
           Caption := 'Уровень, м  = '+im.h_or_v;//FloatToStrF(im.h_or_v,ffFixed,7,3);
      if trim(im.q)<>'' then
//      if not IsNan(im.q) then
         Caption := Caption +
          '  Расход,куб.м/час = '+im.q+//FloatToStrF(im.q,ffFixed,7,1)+
          '  Объем, куб.м = '+ im.vol;;
      if trim(s)='ошибок нет' then
        begin
           caption:= '' ;
           s:='';
        end
         else
     begin
      try
        delete(s,1,6);
        s:=trim(s);
        b:=0;
        case b of
        0:    s:='';
        1..5: s:= 'Ошибка памяти';
        6..11:s:= 'Ошибка таймера';
        12:   s:= 'Не установлены часы';
        13:   s:= 'Температура вне диапазона';
        14:   s:= 'Нет эхо-сигнала';
        15:   s:= 'Переполнение';
 {       1..5: s:= 'Ошибка памяти (неисправность № '+s+')';
        6..11:s:= 'Ошибка таймера (неисправность № '+s+')';
        12:   s:= 'Не установлены часы (неисправность № 12) ';
        13:   s:= 'Температура вне диапазона (неисправность № 13)';
        14:   s:= 'Нет эхо-сигнала (неисправность № 14)';
        15:   s:= 'Переполнение (неисправность № 15)';
 }     end;
       except
        s:='';
      end;
      caption:= s;
     end;
      CloseFile(Fim);
    end
  else
    begin
      Caption := '';
      Application.MessageBox(PChar(''),'Ошибка',MB_ICONERROR);
    end;
end;

end.
