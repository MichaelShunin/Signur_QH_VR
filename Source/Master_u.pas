unit Master_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Gauges, ExtCtrls;

const
  GET_GAUGEPROGRESS  = $c0;
  GET_ID             = $c1;
  GET_INST           = $c2;
  GET_MAX            = $c3;
  GET_ARCH           = $c4;
  MESS_NOCONNECT     = WM_USER + 100;
  MESS_BREAKCONNECT  = WM_USER + 101;
  MESS_DISTORTION    = WM_USER + 102;

 WM_COPYDATA = $004A;

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
    // тут можно добавить любые другие данные в передаваемую запись
  end;

 type
  TMasterForm = class(TForm)
    Panel1: TPanel;
    Gauge: TGauge;
    pnStatus: TPanel;
    btnInst: TBitBtn;
    btnMax: TBitBtn;
    btnIdent: TBitBtn;
    SaveDialog: TSaveDialog;
    btnArch: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnIdentClick(Sender: TObject);
    procedure MessageReceiver1(var msg: TMsg); message MESS_NOCONNECT;
    procedure MessageReceiver2(var msg: TMsg); message MESS_BREAKCONNECT;
    procedure MessageReceiver3(var msg: TMsg); message MESS_DISTORTION;
    procedure MessageReceiver4(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure GetInstMax;
    procedure GetArch;
    procedure btnInstClick(Sender: TObject);
    procedure btnMaxClick(Sender: TObject);
    procedure btnArchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Targethandle:longint;
    CD: TCopyDataStruct;
    RecToTransfer:TRecToTransfer;
   end;

var
  MasterForm: TMasterForm;

implementation

{$R *.dfm}

var
  path, txt, fn : string;
  result : Word;

procedure TMasterForm.FormCreate(Sender: TObject);
begin
  GetDir(0,path);
  if paramcount>=1 then
  TargetHandle:=strToInt(Paramstr(1));
end;

procedure TMasterForm.btnIdentClick(Sender: TObject);
var
  OpCode : Byte;
begin
  pnStatus.Caption := '';
  if not FileExists('signurdriver1.exe') then
    begin
      txt := 'программа-драйвер не найдена';
      Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
    end
  else
    begin
     OpCode := GET_ID;
     if (Sender=btnInst) then
       OpCode := GET_INST;
     if (Sender=btnMax) then
       OpCode := GET_MAX;
     if (Sender=btnArch) then
       OpCode := GET_ARCH;
     txt := 'signurdriver1.exe '+IntToStr(Handle)+' '+IntToStr(OpCode);
     Cursor := crHourGlass;
     pnStatus.Caption := 'ожидание ответа';
     btnIdent.Enabled := False;
     btnInst.Enabled := False;
     btnMax.Enabled := False;
     btnArch.Enabled := False;
     result := WinExec(PChar(txt),SW_SHOWMINIMIZED);
     Cursor := crDefault;
     if result<33 then
       begin
         case result of
               0  :    txt := 'недостаточно памяти';
              11  :    txt := 'программа-драйвер не найдена'
              else     txt := 'некорректный вызов программы-драйвера'
           end;
         pnStatus.Caption := '';
         Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
       end;
    end;
end;

procedure TMasterForm.btnInstClick(Sender: TObject);
begin
  btnIdentClick(btnInst);
end;

procedure TMasterForm.btnMaxClick(Sender: TObject);
begin
  btnIdentClick(btnMax);
end;

procedure TMasterForm.btnArchClick(Sender: TObject);
begin
  btnIdentClick(btnArch);
end;

procedure TMasterForm.MessageReceiver1(var msg: TMsg);
begin
  pnStatus.Caption := '';
  txt := 'нет соединения';
  Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
  btnIdent.Enabled := True;
  btnInst.Enabled := True;
  btnMax.Enabled := True;
  btnArch.Enabled := True;
end;

procedure TMasterForm.MessageReceiver2(var msg: TMsg);
begin
  pnStatus.Caption := '';
  txt := 'обрыв связи';
  Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
  btnIdent.Enabled := True;
  btnInst.Enabled := True;
  btnMax.Enabled := True;
  btnArch.Enabled := True;
end;

procedure TMasterForm.MessageReceiver3(var msg: TMsg);
begin
  pnStatus.Caption := '';
  txt := 'искажения в канале связи';
  Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
  btnIdent.Enabled := True;
  btnInst.Enabled := True;
  btnMax.Enabled := True;
  btnArch.Enabled := True;
end;

procedure TMasterForm.MessageReceiver4(var Msg: TWMCopyData);
var
  oc : Integer;
begin
  oc := Msg.CopyDataStruct.dwData;
  fn := PChar(Msg.CopyDataStruct.lpData);
  case oc of
       GET_ID :  pnStatus.Caption := 'Код идентификатора = '+ fn;
       GET_INST : GetInstMax;
       GET_MAX  : GetInstMax;
       GET_ARCH : GetArch;
       GET_GAUGEPROGRESS : Gauge.Progress := Msg.CopyDataStruct.cbData;
       end;
  btnIdent.Enabled := True;
  btnInst.Enabled := True;
  btnMax.Enabled := True;
  btnArch.Enabled := True;
end;

procedure TMasterForm.GetInstMax;
var
  Fsingle : File of Single;
  fp : Single;
begin
  if FileExists(fn) then
    begin
      AssignFile(Fsingle,fn);
      Reset(Fsingle);
      Read(Fsingle,fp);
      pnStatus.Caption := FloatToStrF(fp,ffFixed,7,3) + '    ';
      Read(Fsingle,fp);
      pnStatus.Caption := pnStatus.Caption + FloatToStrF(fp,ffFixed,7,1);
      CloseFile(Fsingle);
    end
  else
    begin
      pnStatus.Caption := '';
      txt := 'не найден файл-посредник';
      Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
    end;
end;

procedure TMasterForm.GetArch;
var
  FlagErr : Boolean;
begin
  pnStatus.Caption := '';
  if not FileExists(fn) then
    begin
      txt := 'не найден файл-посредник';
      Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
    end
  else
   begin
(*    if SaveDialog.Execute then
      begin
        Cursor := crHourGlass;
        CopyFile(PChar(fn),PChar(SaveDialog.FileName),FlagErr);
        Cursor := crDefault;
      end;
      *)
   RecToTransfer.FName:=FN{OD.Filename};

   RecToTransfer.otherdata:=125;  // тут можно задать любые доп.данные
   CD.lpData := @RecToTransfer;
   CD.dwData :=length(RecToTransfer.Fname);
//   CD.dwData := sizeof(RecToTransfer);
   cd.cbData := sizeof(RecToTransfer);
   hide;
   update;
   sendMessage(TargetHandle, WM_COPYDATA, Handle, integer(@CD));
   end;
end;


end.
