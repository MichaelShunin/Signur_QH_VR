unit GetSignurdata_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

const

 WM_COPYDATA = $004A;
 GET_USAD_INFO = 1;
 GET_USAD_ARCH = 13;
 GET_USAD_CLEAR = 14;

     GET_GAUGEPROGRESS  = $c0;

 type

  PCopyDataStruct = ^TCopyDataStruct;
  TCopyDataStruct = record      // эта структура определена в windows для предачи данных из приложения в приложение
    dwData: LongInt;
    cbData: LongInt;
    lpData: Pointer;
  end;
  PRecToTransfer = ^TRecToTransfer;   // эта запись определяется для
  TRecToTransfer = packed record
    FName:string[255];
    otherdata:word;
    type_of_File: byte;
    // тут можно добавить любые другие данные в передаваемую запись
  end;

type
  TGetSignurDataForm = class(TForm)
    Button1: TButton;
    OD: TOpenDialog;
    RG: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Targethandle:longint;
    CD: TCopyDataStruct;
    RecToTransfer:TRecToTransfer;
  end;

var
  GetSignurDataForm: TGetSignurDataForm;

implementation

{$R *.dfm}

procedure TGetSignurDataForm.FormCreate(Sender: TObject);
begin
 if paramcount>=1 then
  TargetHandle:=strToInt(Paramstr(1));
end;

procedure TGetSignurDataForm.Button1Click(Sender: TObject);
var
 i:integer;
begin
   case rg.ItemIndex of
    7: begin
        RecToTransfer.FName:='УСАД / версия 1 / 4 файла';
        RecToTransfer.otherdata:=GET_USAD_INFO ;
        cd.dwData:=GET_USAD_INFO;
        CD.lpData := pchar('УСАД / версия 1 / 4 файла');
        cd.cbData := sizeof(RecToTransfer);
       end;
     8: begin
         for i:=1 to 4 do
          begin
           sleep(1000);
           cd.dwData:=GET_GAUGEPROGRESS;
           RecToTransfer.FName:='УСАД / версия 1 / 4 файла';
           RecToTransfer.otherdata:=round(100*i/4) ;
           CD.lpData := pchar('УСАД / версия 1 / 4 файла');
           cd.cbData := RecToTransfer.otherdata;
           sendMessage(TargetHandle, WM_COPYDATA, Handle, integer(@CD));
          end;
           RecToTransfer.FName:='c:\signur\exe';
           RecToTransfer.otherdata:=GET_USAD_ARCH ;
           cd.dwData:=GET_USAD_ARCH;
           CD.lpData :=  pchar('c:\signur\exe');
           cd.cbData := sizeof(RecToTransfer);
        end;
      9: begin
        RecToTransfer.FName:='УСАД. Очистка памяти накопителя. Успешно.';
        RecToTransfer.otherdata:=GET_USAD_CLEAR ;
        cd.dwData:=GET_USAD_CLEAR;
        CD.lpData := pchar('УСАД. Очистка памяти накопителя. Успешно.');
        cd.cbData := sizeof(RecToTransfer);
       end;

   else
 begin
  if od.Execute=true then
  begin
   RecToTransfer.FName:=OD.Filename;
   RecToTransfer.type_of_File :=RG.ItemIndex;
   RecToTransfer.otherdata:=125;  // тут можно задать любые доп.данные

   CD.dwData :=length(RecToTransfer.Fname);
//   CD.dwData := sizeof(RecToTransfer);
   cd.cbData := sizeof(RecToTransfer);
  end;
 end;
end;
   hide;
   update;
   sendMessage(TargetHandle, WM_COPYDATA, Handle, integer(@CD));
   close;
end;

end.
