unit Master_u_s;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Gauges, ExtCtrls, tvc_u,
  cxLookAndFeelPainters, cxButtons, rxstrutils;

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
(*  PRecToTransfer = ^TRecToTransfer;   // эта запись определяется для
  TRecToTransfer = packed record
    FName:string[255];
    otherdata:word;
    // тут можно добавить любые другие данные в передаваемую запись
  end;
  *)
 type
  TMasterForm = class(TForm)
    Panel1: TPanel;
    Gauge: TGauge;
    pnStatus: TPanel;
    btnInst: TcxButton;
    btnMax: TcxButton;
    btnIdent: TcxButton;
    SaveDialog: TSaveDialog;
    btnArch: TcxButton;
    btnLoadInfoFromDevice: TcxButton;
    cbAlwaysOnTop: TCheckBox;
    cbRepeatedRead: TCheckBox;
    cbRepeated: TComboBox;
    Timer: TTimer;
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
    procedure btnLoadInfoFromDeviceClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbAlwaysOnTopClick(Sender: TObject);
    procedure cbRepeatedReadClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure cbRepeatedClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Targethandle:longint;
    CD: TCopyDataStruct;
    RecToTransfer:TRecToTransfer;
    eksp_nomer:integer;
{* vvvvvv  для работы с модемом  vvvvvv *}
     Modem, access, tone_pulse:integer;
    Phone_Number:string;
    DriverHandle:longint;
 (* ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^*)
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
//  if paramcount>=1 then
//  TargetHandle:=strToInt(Paramstr(1));
end;

procedure TMasterForm.btnIdentClick(Sender: TObject);


type
  TprmType = record
       Tone     : Boolean;
                   PhoneNmb : String[20];
                   Access   : Integer
                  end;
var
  OpCode : Byte;
{* vvvvvv  для работы с модемом  vvvvvv *}
  PrmType : tPrmType;
  ModemFile: file of TprmType;
  s:string;
 (* ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^*)

 begin

{* vvvvvv  для работы с модемом  vvvvvv *}
   if modem=1 then
    begin
     prmtype.Tone :=boolean(tone_pulse);
     prmType.phoneNmb:='                    ';
     prmType.phoneNmb:=delchars(Phone_number,'-');
     prmType.phoneNmb:=delchars(prmType.Phonenmb,' ');
     prmType.phoneNmb:=delchars(prmType.Phonenmb,'.');
     prmType.phoneNmb:=delchars(prmType.Phonenmb,'(');
     prmType.phoneNmb:=delchars(prmType.Phonenmb,')');
     prmtype.Access:=access;
     assignfile(ModemFile,'modem');
     rewrite(Modemfile);
     write(Modemfile,prmType);
     closefile(ModemFile);
    end
     else deletefile('modem');
 (* ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^*)

   if (Sender=btnIdent) or (Sender=btnMax) or (Sender=btnArch) then
       begin
        Timer.enabled:=false;
        cbRepeatedRead.Checked:=false;
        update;
       end;

  pnStatus.Caption := '';
  update;
  if not FileExists('signurdriver1.exe') then
    begin
      txt := 'программа-драйвер не найдена';
//      Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
      pnStatus.Caption := 'Ошибка: ' +txt;
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
     cbRepeated.Enabled:=false;
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
//         Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
      pnStatus.Caption := 'Ошибка: ' +txt;
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
//  Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
  pnStatus.Caption := 'Ошибка: ' +txt;
  btnIdent.Enabled := True;
  btnInst.Enabled := True;
  btnMax.Enabled := True;
  btnArch.Enabled := True;
  cbRepeated.Enabled:=True;

end;

procedure TMasterForm.MessageReceiver2(var msg: TMsg);
begin
  pnStatus.Caption := '';
  txt := 'обрыв связи';
//  Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
  pnStatus.Caption := 'Ошибка: ' +txt;

  btnIdent.Enabled := True;
  btnInst.Enabled := True;
  btnMax.Enabled := True;
  btnArch.Enabled := True;
  cbRepeated.Enabled:=True;

end;

procedure TMasterForm.MessageReceiver3(var msg: TMsg);
begin
  pnStatus.Caption := '';
  txt := 'искажения в канале связи';
//  Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
  pnStatus.Caption := 'Ошибка: ' +txt;
  btnIdent.Enabled := True;
  btnInst.Enabled := True;
  btnMax.Enabled := True;
  btnArch.Enabled := True;
  cbRepeated.Enabled:=True;

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
  cbRepeated.Enabled:=True;
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
//      Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
      pnStatus.Caption := 'Ошибка: ' +txt;
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
//      Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
      pnStatus.Caption := 'Ошибка: ' +txt;
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

   RecToTransfer.otherdata:=eksp_nomer;  // код записи в архиве, для который передаются данные
   CD.lpData := @RecToTransfer;
   CD.dwData :=length(RecToTransfer.Fname);
//   CD.dwData := sizeof(RecToTransfer);
   cd.cbData := sizeof(RecToTransfer);
   hide;    update;
   sendMessage(TargetHandle, WM_COPYDATA, Handle, integer(@CD));
   close;
   end;
end;


procedure TMasterForm.btnLoadInfoFromDeviceClick(Sender: TObject);
begin
close;
end;

procedure TMasterForm.FormShow(Sender: TObject);
begin
// pnstatus.Caption:=inttostr(Targethandle);
end;

procedure TMasterForm.cbAlwaysOnTopClick(Sender: TObject);
begin
 if cbAlwaysOnTop.checked then FormStyle:=fsStayOnTop
  else Formstyle:=fsNormal;
end;

procedure TMasterForm.cbRepeatedReadClick(Sender: TObject);
begin
 timer.Enabled:=cbRepeatedRead.checked;
 if cbRepeatedRead.checked then btnIdentClick(btnInst);
end;

procedure TMasterForm.TimerTimer(Sender: TObject);
begin
 btnIdentClick(btnInst);
end;

procedure TMasterForm.cbRepeatedClick(Sender: TObject);
begin
 case cbRepeated.ItemIndex of
  0: timer.interval:= 5000;
  1: timer.interval:=10000;
  2: timer.interval:=30000;
  3: timer.interval:=60000;
 end;
 update;
 btnIdentClick(btnInst);
 cbRepeatedRead.checked:=true;
end;

procedure TMasterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer.enabled:=false;
  cbRepeatedRead.Checked:=false;
end;

end.
