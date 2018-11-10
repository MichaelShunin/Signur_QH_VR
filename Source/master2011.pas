unit master2011;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, Mask, Math, tvc_u,
  cxLookAndFeelPainters, cxButtons, Menus, ComCtrls, cxMaskEdit,
  cxDropDownEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit,rxstrutils,
  cxListBox;

const
  A_ID  = 0;
  EQ_ID = 1;
  EH_ID = 2;

  Limit_H = 2502;
  Limit_D = 2202;

  Limit_H_AKRON = 1925;
  Limit_D_AKRON = 2200;
                                TEST = 0;
  GET_ID             =   1;
  GET_INST           =   2;
  GET_MAX            =   3;
  GET_ARCH_H         =   4;
  GET_ARCH_D         =   5;
  GET_ARCH_ON        =   6;
  GET_ARCH_OFF       =   7;
  GET_ARCH_ERR       =   8;
  GET_ARCH_P         =   8;
  PUT_TABLE          =   9;
  PUT_DT             =  $a;
  GET_ARCH_ONOFFERR  =  11;
  GET_ARCH_ALL       =  12;

  GET_ID_MB          = 101;
  GET_INST_MB        = 102;
  GET_MAX_MB         = 103;
  GET_ARCH_H_MB      = 104;
  GET_ARCH_D_MB      = 105;
  GET_ARCH_ON_MB     = 106;
  GET_ARCH_OFF_MB    = 107;
  GET_ARCH_ERR_MB    = 108;
  GET_ARCH_P_MB      = 108;
  PUT_DT_MB          = 110;
  GET_ARCH_ONOFFERR_MB = 111;
  GET_ARCH_ALL_MB    = 112;

  GET_ID_REM         = 201;
  GET_INST_REM       = 202;
  GET_MAX_REM        = 203;
  GET_ARCH_H_REM     = 204;
  GET_ARCH_D_REM     = 205;
  GET_ARCH_ON_REM    = 206;
  GET_ARCH_OFF_REM   = 207;
  GET_ARCH_ERR_REM   = 208;
  GET_ARCH_P_REM     = 208;
  PUT_DT_REM         = 210;
  GET_ARCH_ONOFFERR_REM = 211;
  GET_ARCH_ALL_REM   = 212;
  GET_ARCH_ALL_SET   = 232;    // пакетный режим - "архивы" (код 232(десятичный)).



  GET_GAUGEPROGRESS  = $c0;
  REMOTE_CONNECT     = $c5;
  LOCAL_CONNECT      = $c7;
  DRIVER_HANDLE      = $c6;


  WM_COPYDATA        = $004a;

  LOC_MSG_CONNECT    =  0;
  LOC_MSG_DISCONNECT =  1;
  LOC_MSG_ARCHEMPTY  =  2;
  LOC_MSG_WRONGINSTR =  3;
  LOC_MSG_NOTCONFIRM =  4;
  LOC_MSG_NOTTABLE   =  5;
  LOC_MSG_NOCONNECT  =  6;
  MSG_DISTORTION     = 11;

  REM_MSG_CONNECT    =  0;
  REM_MSG_DISCONNECT =  1;
  REM_MSG_NOMODEM    =  2;
  REM_MSG_NODIALTONE =  3;
  REM_MSG_BUSY       =  4;
  REM_MSG_NOANSWER   =  5;
  REM_MSG_NONUMBER   =  6;
  REM_MSG_NOADAPTER  =  7;
  REM_MSG_NOINSTR    =  8;
  REM_MSG_DATABREAK  =  9;
  REM_MSG_WRONGINSTR = 12;

  MSG_ESCAPE         = 10;

  TEST_MODE_FILENAME = '/tm';
  REM_CONN_FILENAME = '/modem';
  MB_CONN_FILENAME = '/modbus';

type



  TMaster2011Form = class(TForm)
    pnButtons: TPanel;
    Gauge: TGauge;
    btnIdent: TBitBtn;
    btnInst: TBitBtn;
    btnMax: TBitBtn;
    btnArchH: TBitBtn;
    btnArchD: TBitBtn;
    btnArchAll: TBitBtn;
    btnArchOnOffErr: TBitBtn;
    btnArchP: TBitBtn;
    meStrNum: TMaskEdit;
    lbStrNum: TLabel;
    SaveDialog: TSaveDialog;
    btnModem: TSpeedButton;
    btnPrm: TSpeedButton;
    meStrInit: TMaskEdit;
    lbStrInit: TLabel;
    btnLocal: TSpeedButton;
    btnModbus: TSpeedButton;
    Timer: TTimer;
    cbAlwaysOnTop: TCheckBox;
    btnLoadInfoFromDevice: TcxButton;
    btnTable: TBitBtn;
    btnSetDT: TBitBtn;
    pnStatus: TPanel;
    pnErrorInfo: TPanel;
    MainMenu1: TMainMenu;
    pnStatus2: TPanel;
    pgcSET: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    lstlb: TListBox;
    rgTone_Pulse: TRadioGroup;
    lbl1: TLabel;
    lbl2: TLabel;
    Access: TcxComboBox;
    Phone_Number: TcxMaskEdit;
    btnArchAllModem: TBitBtn;
    DeviceList: TcxListBox;
    procedure FormCreate(Sender: TObject);
    procedure btnIdentClick(Sender: TObject);
    procedure btnInstClick(Sender: TObject);
    procedure btnMaxClick(Sender: TObject);
    procedure MessageReceiver(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure GetInstMax;
    procedure GetArch(arch: Byte; fn:string);
    procedure btnArchDClick(Sender: TObject);
    procedure btnArchHClick(Sender: TObject);
    procedure btnArchAllClick(Sender: TObject);
    procedure btnArchOnOffErrClick(Sender: TObject);
    procedure btnArchPClick(Sender: TObject);
    procedure btnTableClick(Sender: TObject);
    procedure btnSetDTClick(Sender: TObject);
    procedure btnPrmClick(Sender: TObject);
    procedure btnModemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnModbusClick(Sender: TObject);
    procedure btnLocalClick(Sender: TObject);
    procedure BreakConnection;
    procedure ScaleForm(F: TForm);
    procedure TimerTimer(Sender: TObject);
    procedure cbAlwaysOnTopClick(Sender: TObject);
    procedure btnLoadInfoFromDeviceClick(Sender: TObject);
    procedure Get_Arch_SET;
    procedure FormShow(Sender: TObject);
    procedure btnArchAllModemClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    CD : TCopyDataStruct;
    txt : string;

    FprmMD : File of prmModemType;
    FprmMB : File of prmModbusType;
    path, fn : string;

    InScheduleMode:boolean;

    DeviceType :integer;
    ID_Device:integer;

    Targethandle:longint;
    RecToTransfer:TRecToTransfer;
    HourLast: TDateTime;
    DayLast: TDateTime;
    DayLastMax, HourLastMax:TDateTime;
    eksp_nomer:integer;
    prm : prmType;
    Mult_K:single;
    LimitH,LimitD:integer;

    Addr_Set : file of word;  // октябрь  2011   Подключение нескольких приборов
    bArchive_May2011:boolean;
    SET_ARCH:string;
    DeviceNumber_set: array[0..1000] of Integer;
    Device_addR_set: array[0..1000] of Integer;
    bgoodNumbers,bBadListContent,bBadRSCount:boolean;
    StartLargeArchive:string;
  end;

  // 1 акрон - скорость, м/c
 //   1 эхо   уровень, м
 //    2 расход, куб.м/час
 //    3 объем куб.м
 //    4 наработка, час.мин



  TFooClass = class(TControl);

var
  Master2011Form: TMaster2011Form;
  prmMD : prmModemType;
  prmMB : prmModbusType;

implementation

uses Param2, Param3, DM_dm, Exp_f, config;

{$R *.dfm}
var
  DriverHandle : THandle;
  path, fn, txt : string;
  result : Word;
  Remote, WaitAnswer, DriverAnswer, Modbus: Boolean;
  FprmMD : File of prmModemType;
  FprmMB : File of prmModbusType;
  Ftm : File of Byte;
  tm : Byte;

procedure TMaster2011Form.FormCreate(Sender: TObject);
begin
//  ScaleForm(Master2Form);
  GetDir(0,path);
  WaitAnswer := False;
  DriverAnswer := False;
  if FileExists(path+TEST_MODE_FILENAME) then
    begin
      AssignFile(Ftm,path+TEST_MODE_FILENAME);
      Reset(Ftm);
      if FileSize(Ftm)<>1 then
        begin
          CloseFile(Ftm);
          Erase(Ftm);
        end
      else
        begin
          Reset(Ftm);
          Read(Ftm,tm);
          CloseFile(Ftm);
          if not(tm in [1..3]) then
            Erase(Ftm);
        end;
    end;
  if not FileExists(path+TEST_MODE_FILENAME) then
    tm := 1;
  if tm=1 then
    btnLocalClick(Self);
  if tm=2 then
    btnModemClick(Self);
  if tm=3 then
    btnModbusClick(Self);
  //rgTone_Pulse.ItemIndex:=AppConfig.inifile.ReadInteger('Modem','Ton_Pulse',1);
  //Phone_Number.Text:=AppConfig.inifile.ReadString('Modem','Phone_Number','+79167559710');
  //Access.ItemIndex:=AppConfig.inifile.ReadInteger('Modem','Access',10);

end;

procedure TMaster2011Form.btnIdentClick(Sender: TObject);
var
  OpCode : Byte;
  n : Word;
  N_Hour, N_Day:integer;
  PhoneNmb:string  ;
begin
   case devicetype of
      0,1: begin LimitH:=Limit_H; LimitD:=Limit_D;end;
      2:   begin LimitH:=Limit_H_Akron; LimitD:=Limit_D_Akron;end;
   end;
  pnStatus.Caption := ''; pnStatus2.Caption := '';  pnErrorInfo.Caption:='';
  if not FileExists(path+'/signurdriver2.exe') then
    pnStatus.Caption := 'программа-драйвер не найдена'
  else
    begin
     OpCode := GET_ID;
     if Modbus then
       OpCode := GET_ID_MB;
     if Remote then
       OpCode := GET_ID_REM;
     if (Sender=btnInst) then
       begin
         OpCode := GET_INST;
         if Modbus then
           OpCode := GET_INST_MB;
         if Remote then
           OpCode := GET_INST_REM;
       end;
     if (Sender=btnMax) then
       begin
         OpCode := GET_MAX;
         if Modbus then
           OpCode := GET_MAX_MB;
         if Remote then
           OpCode := GET_MAX_REM;
       end;
     if (Sender=btnArchH) then
       begin
         n := LimitH;//2502;
         N_Hour := trunc(now * 24)-trunc(Hourlast * 24)+24;  // сколько нужно отсчетов почасовых значений?
         if N_Hour > Limith then N_Hour :=LimitH;
         meStrNum.Text:=inttostr(N_Hour);
                  mestrNum.update;
         OpCode := GET_ARCH_H;
         if Modbus then
           OpCode := GET_ARCH_H_MB;
         if Remote then
           OpCode := GET_ARCH_H_REM;
       end;
     if (Sender=btnArchD) then
       begin
         n := LimitD;//2202;
         N_Day := trunc(now)-trunc(Daylast) + 24;   // сколько нужно отсчетов суточных значенимй?
         if N_Day > LimitD then N_Day :=LimitD;
         meStrNum.Text:=inttostr(N_Day);
         mestrNum.update;
         OpCode := GET_ARCH_D;
         if Modbus then
           OpCode := GET_ARCH_D_MB;
         if Remote then
           OpCode := GET_ARCH_D_REM;
       end;
     if (Sender=btnArchOnOffErr) then
       begin
         OpCode := GET_ARCH_ONOFFERR;
         if Modbus then
           OpCode := GET_ARCH_ONOFFERR_MB;
         if Remote then
           OpCode := GET_ARCH_ONOFFERR_REM;
       end;
     if (Sender=btnArchP) then
       begin
         OpCode := GET_ARCH_P;
         if Modbus then
           OpCode := GET_ARCH_P_MB;
         if Remote then
           OpCode := GET_ARCH_P_REM;
       end;

     if ((Sender=btnArchAll) and (bArchive_May2011=False)) then
       begin
         N_Hour := trunc(now * 24)-trunc(Hourlast * 24)+24; // сколько нужно отсчетов почасовых значений?
         if N_Hour > Limith then N_Hour :=LimitH;
         N_Day := trunc(now)-trunc(Daylast) + 14;  // сколько нужно отсчетов суточных значений?
         if N_Day > LimitD then N_Day :=LimitD;

         OpCode := GET_ARCH_ALL;
         if Modbus then
           OpCode := GET_ARCH_ALL_MB;
         if Remote then
           OpCode := GET_ARCH_ALL_REM;
       end;

     if ((Sender=btnArchAll) and (bArchive_May2011=true)) then
       begin
         N_Hour := trunc(now * 24)-trunc(HourlastMax * 24)+24; // сколько нужно отсчетов почасовых значений?
         if N_Hour > Limith then N_Hour :=LimitH;
         N_Day := trunc(now)-trunc(DaylastMax) + 14;  // сколько нужно отсчетов суточных значений?
         if N_Day > LimitD then N_Day :=LimitD;

         OpCode := GET_ARCH_ALL_SET;

          // запись файла MODEM для режима пакетной передачи

          AssignFile(FprmMD,path+REM_CONN_FILENAME);
          Rewrite(FprmMD);
      //     phoneNmb:='                    ';
           PhoneNmb:=phone_number.Text;
           phoneNmb:=delchars(Phonenmb,'-');
           phoneNmb:=delchars(Phonenmb,' ');
           phoneNmb:=delchars(Phonenmb,'.');
           phoneNmb:=delchars(Phonenmb,'(');
           phoneNmb:=delchars(Phonenmb,')');
           Prm.phoneNmb:=Phonenmb;
      //     Master2NewForm.Prm.Access:=access.ItemIndex;
           if  ((access.ItemIndex = -1) or  (access.ItemIndex = 10)) then Prm.access:=0;
           if  (access.ItemIndex in [0,1,2,3,4,5,6,7,8,9]) then  Prm.access:= access.ItemIndex+1;
            prmMD.Tone := rgTone_Pulse.ItemIndex=1;        //импульс-тон
            prmMD.PhoneNmb := Phonenmb;       // номер
            while length(prmMD.PhoneNmb)< 20 do
               prmMD.PhoneNmb:=prmMD.PhoneNmb+' ';
            while length( prm.PhoneNmb)< 20 do
                prm.PhoneNmb:= prm.PhoneNmb+' ';
      //      prmMD.Access := access.ItemIndex;         //выход в город
           if  ((access.ItemIndex = -1) or  (access.ItemIndex = 10)) then prmMD.access:=0;
           if  (access.ItemIndex in [0,1,2,3,4,5,6,7,8,9]) then  PrmMD.access:= access.ItemIndex+1;
            Write(FprmMD,prmMD);
            CloseFile(FprmMD);
       end;


     if (Sender=btnTable) then
       OpCode := PUT_TABLE;
     if (Sender=btnSetDT) then
       begin
       OpCode := PUT_DT;
        if Modbus then
           OpCode := PUT_DT_MB;
         if Remote then
           OpCode := PUT_DT_REM;
      end;
     if (OpCode in [GET_ARCH_H,GET_ARCH_D,GET_ARCH_H_MB,GET_ARCH_D_MB,
                    GET_ARCH_H_REM,GET_ARCH_D_REM])  then
       //проверить корректность параметров запроса архива
       begin
         if((meStrNum.Text='')or(StrToInt(meStrNum.Text)=0)or
            (StrToInt(meStrNum.Text)>n)) then
           begin
             txt := 'недопустимое число строк';
             Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
             Exit;
           end;
         if ((meStrInit.Text='')or(StrToInt(meStrInit.Text)=0)or
                   (StrToInt(meStrInit.Text)>n)) then
           begin
             txt := 'недопустимый начальный номер';
             Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
             Exit;
           end;
         if (StrToInt(meStrInit.Text)+StrToInt(meStrNum.Text)>n+1) then
           begin
             txt := 'недопустимое сочетание начального номера и числа строк';
             Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
             Exit;
           end;
       end;
     btnIdent.Enabled := False;
     btnInst.Enabled := False;
     btnMax.Enabled := False;
     btnArchH.Enabled := False;
     btnArchD.Enabled := False;
     btnArchOnOffErr.Enabled := False;
     btnArchAll.Enabled := False;
     btnArchP.Enabled := False;
     btnTable.Enabled := False;
     btnSetDT.Enabled := False;
     btnPrm.Enabled := False;
     Repaint;
     WaitAnswer := Remote or (OpCode in [GET_INST_MB,GET_INST]);
     pnStatus.Caption := 'wait...';  pnStatus2.Caption := '';
     txt := path+'/signurdriver2.exe '+IntToStr(Handle)+' '+IntToStr(OpCode);
     if (OpCode in [GET_ARCH_H,GET_ARCH_D,GET_ARCH_H_MB,GET_ARCH_D_MB,
                    GET_ARCH_H_REM,GET_ARCH_D_REM])  then
       txt := txt + ' ' + meStrInit.Text + ' ' + meStrNum.Text;

    if (OpCode in [GET_ARCH_ALL,GET_ARCH_ALL_MB,GET_ARCH_ALL_REM, GET_ARCH_ALL_SET])  then
       txt := txt + ' ' + inttostr(N_HOUR) + ' ' + Inttostr(N_DAY);
     result := WinExec(PChar(txt),SW_SHOWMINIMIZED);
     caption:=txt;  // для отладки 
     Repaint;
     if result<33 then
       begin
         case result of
               0  :    txt := 'недостаточно памяти';
              11  :    txt := 'программа-драйвер не найдена'
              else     txt := 'некорректный вызов программы-драйвера'
           end;
         Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
         pnStatus.Caption := '';   pnStatus2.Caption := '';  pnErrorInfo.Caption:='';
         btnIdent.Enabled := True;
         btnInst.Enabled := True;
         btnMax.Enabled := True;
         btnArchH.Enabled := True;
         btnArchD.Enabled := True;
         btnArchOnOffErr.Enabled := True;
         btnArchP.Enabled := True;
         btnArchAll.Enabled := True;
         btnTable.Enabled := True;
         btnSetDT.Enabled := True;
         btnModem.Enabled := True;
         WaitAnswer := False;
       end
     else
       Timer.Enabled := True;
    end;
end;

procedure TMaster2011Form.btnInstClick(Sender: TObject);
begin
  btnIdentClick(btnInst);
end;

procedure TMaster2011Form.btnMaxClick(Sender: TObject);
begin
  btnIdentClick(btnMax);
end;

procedure TMaster2011Form.MessageReceiver(var Msg: TWMCopyData);
var
  oc, mess : Integer;
begin
  oc := Msg.CopyDataStruct.dwData;
  fn := PChar(Msg.CopyDataStruct.lpData);
  pnStatus2.Caption:='';
  if (oc=DRIVER_HANDLE) then
    DriverHandle := StrToInt(fn)
  else
    DriverAnswer:= True;
  if (oc=REMOTE_CONNECT) then
    begin
      mess := StrToInt(fn);
      case  mess of
           REM_MSG_CONNECT    : pnStatus.Caption :=
                                'установлено модемное соединение';
           REM_MSG_DISCONNECT : pnStatus.Caption :=
                                'модемное соединение разорвано';
           REM_MSG_NOMODEM    : pnStatus.Caption :=
                                'модем не найден';
           REM_MSG_NODIALTONE : pnStatus.Caption :=
                                'нет гудка';
           REM_MSG_BUSY       : pnStatus.Caption :=
                                'занято';
           REM_MSG_NOANSWER   : pnStatus.Caption :=
                                'удаленный модем не отвечает';
           REM_MSG_NONUMBER   : pnStatus.Caption :=
                                'не указан телефонный номер';
           REM_MSG_NOADAPTER  : pnStatus.Caption :=
                                'адаптер удаленного модема не отвечает';
           REM_MSG_NOINSTR    : pnStatus.Caption :=
                                'удаленный прибор не отвечает';
           REM_MSG_DATABREAK  : pnStatus.Caption :=
                                'передача данных прервалась';
           REM_MSG_WRONGINSTR : pnStatus.Caption :=
                                'запрос не соответствует типу прибора';
           MSG_DISTORTION     : pnStatus.Caption :=
                                'искажения в канале связи';
      end;
      Repaint;
      if (mess=REM_MSG_CONNECT) then
        Exit;
    end;
  if (oc=LOCAL_CONNECT) then
    begin
      mess := StrToInt(fn);
      case  mess of           LOC_MSG_CONNECT    : pnStatus.Caption :=
                                'установлено соединение';
           LOC_MSG_NOCONNECT  : pnStatus.Caption :=
                                'соединение не установлено';
           LOC_MSG_DISCONNECT : pnStatus.Caption :=
                                'соединение оборвалось';
           LOC_MSG_WRONGINSTR : pnStatus.Caption :=
                                'запрос не соответствует типу прибора';
           LOC_MSG_NOTCONFIRM : pnStatus.Caption :=
                                'нет подтверждения приёма';
           LOC_MSG_NOTTABLE   : pnStatus.Caption :=
                                'не найден файл-таблица';
           LOC_MSG_ARCHEMPTY  : pnStatus.Caption :=
                                'архив пуст';
           MSG_DISTORTION     : pnStatus.Caption :=
                                'искажения в канале связи';
      end;
      Repaint;
      if (mess=LOC_MSG_CONNECT) then
        Exit;
    end;
  case oc of
       TEST              :  pnStatus.Caption := fn;
       GET_ID            :  pnStatus.Caption := fn;
       GET_ID_MB         :  pnStatus.Caption := fn;
       GET_ID_REM        :  pnStatus.Caption := fn;
       GET_INST          :  GetInstMax;
       GET_INST_MB       :  GetInstMax;
       GET_INST_REM      :  GetInstMax;
       GET_MAX           :  GetInstMax;
       GET_MAX_MB        :  GetInstMax;
       GET_MAX_REM       :  GetInstMax;
       GET_ARCH_H        :  GetArch(GET_ARCH_H,'');
       GET_ARCH_H_MB     :  GetArch(GET_ARCH_H,'');
       GET_ARCH_H_REM    :  GetArch(GET_ARCH_H,'');
       GET_ARCH_D        :  GetArch(GET_ARCH_D,'');
       GET_ARCH_D_MB     :  GetArch(GET_ARCH_D,'');
       GET_ARCH_D_REM    :  GetArch(GET_ARCH_D,'');
       GET_ARCH_ONOFFERR :  GetArch(GET_ARCH_ONOFFERR,'');
       GET_ARCH_ONOFFERR_MB    :  GetArch(GET_ARCH_ONOFFERR,'');
       GET_ARCH_ONOFFERR_REM   :  GetArch(GET_ARCH_ONOFFERR,'');
       GET_ARCH_ALL      :  GetArch(GET_ARCH_ALL,'');
       GET_ARCH_ALL_MB   :  GetArch(GET_ARCH_ALL,'');
       GET_ARCH_ALL_REM  :  GetArch(GET_ARCH_ALL,'');
       GET_ARCH_P        :  GetArch(GET_ARCH_P,'');
       GET_ARCH_P_MB     :  GetArch(GET_ARCH_P,'');
       GET_ARCH_P_REM    :  GetArch(GET_ARCH_P,'');
       PUT_TABLE         :  pnStatus.Caption := 'загружен файл ' + fn;
       PUT_DT            :  pnStatus.Caption := 'установлены дата и время';
       PUT_DT_REM        :  pnStatus.Caption := 'установлены дата и время';
       PUT_DT_MB         :  pnStatus.Caption := 'установлены дата и время';
       GET_GAUGEPROGRESS :  begin
                             Gauge.Progress := Msg.CopyDataStruct.cbData;
                             Exit;
                            end;
       GET_ARCH_ALL_SET  : GetArch(GET_ARCH_ALL_set,fn);


       end;
  Repaint;
  if not(oc in [DRIVER_HANDLE,GET_INST,GET_INST_MB,GET_INST_REM]) then
    begin
      btnIdent.Enabled := True;
      btnInst.Enabled := True;
      btnMax.Enabled := True;
      btnArchH.Enabled := True;
      btnArchD.Enabled := True;
      btnArchOnOffErr.Enabled := True;
      btnArchP.Enabled := True;
      btnArchAll.Enabled := True;
      btnTable.Enabled := True;
      btnSetDT.Enabled := True;
      btnModem.Enabled := True;
      WaitAnswer := False;
    end;
end;

procedure TMaster2011Form.GetInstMax;
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
                   w      : String[10];
                   e      : string[10];
  //                 am     : string[10];
  //                 dt     : string[20];
                  end;
var
  im : imType;
  Fim : File of imType;
  s:string;
  b:byte;
begin
  PnErrorInfo.caption:='';
  pnStatus2.Caption:='';
  if FileExists(fn) then
    begin
      AssignFile(Fim,fn);
      Reset(Fim);
      Read(Fim,im);
        // 1 акрон - скорость, м/c
 //   1 эхо   уровень, м
 //    2 расход, куб.м/час
 //    3 объем куб.м
 //    4 наработка, час.мин
       case devicetype of
          0,1: pnStatus.Caption := ' Уровень, м  = '+im.h_or_v;//FloatToStrF(im.h_or_v,ffFixed,7,3);
           2:   pnStatus.Caption := ' Скорость, м/c  = '+im.h_or_v;//FloatToStrF(im.h_or_v,ffFixed,7,3);
 //old         0,1: pnStatus.Caption := 'Уровень, м  = '+FloatToStrF(im.h_or_v,ffFixed,7,3);
 //old         2:   pnStatus.Caption := 'Скорость, м/c  = '+FloatToStrF(im.h_or_v,ffFixed,7,3);
       end;
    if trim(im.q)<>'' then
 // old       if not IsNan(im.q) then
      begin
         pnStatus.Caption := pnStatus.Caption +
         '  Расход,куб.м/час = '+im.q+//FloatToStrF(im.q,ffFixed,7,1)+
 //         '  Расход,куб.м/час = '+FloatToStrF(im.q,ffFixed,7,1)+
          '  Объем, куб.м = '+ im.vol+
          '  Наработка, час.мин = '+im.w;
     pnStatus2.Caption:= '';
  {       pnStatus2.Caption:=
          '  Амплитуда, мВ = '+im.am+
          '  Дата, время = '+im.dt ;
         if trim(im.am)='' then pnStatus2.Caption:= '';
   }  end  ;
      s:=im.e;
      if ((trim(s)='ошибок нет') or (trim(s)='')) then
        begin
           pnErrorInfo.caption:= '' ;
           s:='';
        end
         else
     begin
      try
        delete(s,1,6);
        s:=trim(s);
        b:=strtoint(s);
        case b of
        0:    s:='';
        1..5: s:= ' Ошибка памяти';
        6..11:s:= ' Ошибка таймера';
        12:   s:= ' Не установлены часы';
        13:   s:= ' Температура вне диапазона';
        14:   s:= ' Нет эхо-сигнала';
        15:   s:= ' Переполнение';
 {       1..5: s:= 'Ошибка памяти (неисправность № '+s+')';
        6..11:s:= 'Ошибка таймера (неисправность № '+s+')';
        12:   s:= 'Не установлены часы (неисправность № 12) ';
        13:   s:= 'Температура вне диапазона (неисправность № 13)';
        14:   s:= 'Нет эхо-сигнала (неисправность № 14)';
        15:   s:= 'Переполнение (неисправность № 15)';
 }     end;
       except
        s:=im.e;
      end;
      pnErrorInfo.caption:= s;
     end;
      CloseFile(Fim);
    end
  else
    begin
      pnStatus.Caption := '';  pnStatus2.Caption := '';
      txt := ' не найден файл-посредник '+fn;
      Application.MessageBox(PChar(txt),' Ошибка',MB_ICONERROR);
    end;
end;

procedure TMaster2011Form.GetArch(arch: Byte; fn:string);
var
  FlagErr : Boolean;
begin
  pnStatus.Caption := '';  pnStatus2.Caption := '';  pnErrorInfo.Caption:='';

 Mult_k:=1;

 if (arch in [GET_ARCH_H,GET_ARCH_ALL]) then
    begin
      if not FileExists({fn+\}'temp_h') then
        begin
          txt := 'не найден файл-посредник "temp_h"';
          Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
        end
      else
        begin
         { txt := 'сохраните почасовой архив';   }
         RecToTransfer.FName:={fn+\}'temp_h';
         RecToTransfer.otherdata:=eksp_nomer;  // код записи в архиве, для который передаются данные
         RecToTransfer.TypeOfFile:=1 {Hours};
         RecToTransfer.Mult_k:=Mult_k;
         RecToTransfer.HourLast:=HourLast;
         RecToTransfer.dayLast:=dayLast;
         CD.lpData := @RecToTransfer;
         CD.dwData :=length(RecToTransfer.Fname);
         cd.cbData := sizeof(RecToTransfer);
         pnStatus.Caption   := 'обработка часового архива';
         pnStatus2.Caption:='';
         pnstatus.Update; pnstatus2.Update;
         sendMessage(TargetHandle, WM_COPYDATA, Handle, integer(@CD));

        end;
    end;
  if (arch in [GET_ARCH_D,GET_ARCH_ALL]) then
    begin
      if not FileExists({fn+\}'temp_d') then
        begin
          txt := 'не найден файл-посредник "temp_d"';
          Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
        end
      else
        begin
         { txt := 'сохраните посуточный архив'; }
         RecToTransfer.FName:={fn+\}'temp_d';
         RecToTransfer.otherdata:=eksp_nomer;  // код записи в архиве, для который передаются данные
         RecToTransfer.TypeOfFile:=2 {Days};
         RecToTransfer.Mult_k:=Mult_k;
         RecToTransfer.HourLast:=HourLast;
         RecToTransfer.dayLast:=dayLast;
         CD.lpData := @RecToTransfer;
         CD.dwData :=length(RecToTransfer.Fname);
         cd.cbData := sizeof(RecToTransfer);
         pnStatus.Caption   := 'обработка суточного архива';
         pnstatus.Update;
         pnStatus2.Caption:='';          pnStatus2.Update;
         sendMessage(TargetHandle, WM_COPYDATA, Handle, integer(@CD));
        end;
    end;
  if (arch in [GET_ARCH_ONOFFERR,GET_ARCH_ALL]) then
    begin
      if not FileExists({fn+\}'temp_on') then
        begin
          txt := 'не найден файл-посредник "temp_on"';
          Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
        end
      else
        begin
         { txt := 'сохраните архив включений';   }
         RecToTransfer.FName:={fn+\}'temp_on';
         RecToTransfer.otherdata:=eksp_nomer;  // код записи в архиве, для который передаются данные
         RecToTransfer.TypeOfFile:=3 {On_Event};
         RecToTransfer.Mult_k:=Mult_k;
         RecToTransfer.HourLast:=HourLast;
         RecToTransfer.dayLast:=dayLast;
         CD.lpData := @RecToTransfer;
         CD.dwData :=length(RecToTransfer.Fname);
         cd.cbData := sizeof(RecToTransfer);
           pnStatus.Caption   := 'обработка архива включений';
         pnstatus.Update;
           pnStatus2.Caption   := '';
         pnstatus2.Update;
         sendMessage(TargetHandle, WM_COPYDATA, Handle, integer(@CD));

        end;
      if not FileExists({fn+\}'temp_off') then
        begin
          txt := 'не найден файл-посредник "temp_off"';
          Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
        end
      else
        begin
       {   txt := 'сохраните архив отключений';  }
         RecToTransfer.FName:={fn+\}'temp_off';
         RecToTransfer.otherdata:=eksp_nomer;  // код записи в архиве, для который передаются данные
         RecToTransfer.TypeOfFile:=4 {Off_Event};
         RecToTransfer.Mult_k:=Mult_k;
         RecToTransfer.HourLast:=HourLast;
         RecToTransfer.dayLast:=dayLast;
         CD.lpData := @RecToTransfer;
         CD.dwData :=length(RecToTransfer.Fname);
         cd.cbData := sizeof(RecToTransfer);
         pnStatus.Caption   := 'обработка архива выключений';
         pnstatus.Update;
         pnStatus2.Caption   := '';
         pnstatus2.Update;
         SendMessage(TargetHandle, WM_COPYDATA, Handle, integer(@CD));

        end;
      if FileExists({fn+}'/temp_err') then
        begin
        {  txt := 'сохраните архив причин отключений';
          Application.MessageBox(PChar(txt),'Извещение',MB_OK);
          if SaveDialog.Execute then
            begin
              Cursor := crHourGlass;
              CopyFile(PChar(fn+'/temp_err'),PChar(SaveDialog.FileName),FlagErr);
              Cursor := crDefault;
            end;  }
        end;
    end;
  if (arch in [GET_ARCH_P,GET_ARCH_ALL]) then
    begin
      if FileExists({fn+}'/temp_p') then
        begin
        {  txt := 'сохраните архив параметров';
          Application.MessageBox(PChar(txt),'Извещение',MB_OK);
          if SaveDialog.Execute then
            begin
              Cursor := crHourGlass;
              CopyFile(PChar(fn+'/temp_p'),PChar(SaveDialog.FileName),FlagErr);
              Cursor := crDefault;
            end;  }
        end;
    end;
   if (arch =GET_ARCH_ALL) then close;
   if (arch = GET_ARCH_ALL_SET) then
     begin
        RecToTransfer.fname:=fn;
        SET_ARCH := RecToTransfer.FName+'\';
  //      WaitAnswer:=false; pnButtons.Enabled:=true; Timer1.Enabled:=false;
        Repaint;
        pnStatus.Caption:='Архивы приборов переданы в папку '+SET_ARCH;
        Gauge.Visible:=false;
        update; sleep(1000);
        Get_Arch_SET;
//        close;
     end;
end;

procedure TMaster2011Form.btnArchDClick(Sender: TObject);
begin
  btnIdentClick(btnArchD);
end;

procedure TMaster2011Form.btnArchHClick(Sender: TObject);
begin
  btnIdentClick(btnArchH);
end;

procedure TMaster2011Form.btnArchAllClick(Sender: TObject);
begin
  bArchive_May2011:=false;
  btnIdentClick(btnArchAll);
end;

procedure TMaster2011Form.btnArchOnOffErrClick(Sender: TObject);
begin
  btnIdentClick(btnArchOnOffErr);
end;

procedure TMaster2011Form.btnArchPClick(Sender: TObject);
begin
  btnIdentClick(btnArchP);
end;

procedure TMaster2011Form.btnTableClick(Sender: TObject);
begin
  btnIdentClick(btnTable);
end;

procedure TMaster2011Form.btnSetDTClick(Sender: TObject);
begin
  btnIdentClick(btnSetDT);
end;

procedure TMaster2011Form.btnPrmClick(Sender: TObject);
begin
  if Remote then
    begin
      AssignFile(FprmMD,path+REM_CONN_FILENAME);
      if FileExists(path+REM_CONN_FILENAME) then
        begin
         Reset(FprmMD);
         try
           Read(FprmMD,prmMD);
         except
           CloseFile(FprmMD);
           Erase(FprmMD);
         end;
        end;
      if not FileExists(path+REM_CONN_FILENAME) then
      //создать файл по умолчанию
        begin
          Rewrite(FprmMD);
          prmMD.Tone := False;        //импульсный набор
          prmMD.PhoneNmb := '';       //нет номера
          prmMD.Access := 10;         //выход в город через 9
          Write(FprmMD,prmMD);
        end;
      PrmForm.ShowModal;
      Reset(FprmMD);
      Write(FprmMD,prmMD);
      CloseFile(FprmMD);
    end
  else
    begin
      AssignFile(FprmMB,path+MB_CONN_FILENAME);
      if FileExists(path+MB_CONN_FILENAME) then
        begin
         Reset(FprmMB);
         try
           Read(FprmMB,prmMB);
         except
           CloseFile(FprmMB);
           Erase(FprmMB);
         end;
        end;
      if not FileExists(path+MB_CONN_FILENAME) then
      //создать файл по умолчанию
        begin
          Rewrite(FprmMB);
          prmMB.Addr := 1;              //адрес = 1
          prmMB.Bdr := 3;               //скорость  = 9600
          prmMB.Parity := 0;            //контрольный бит не используется
          Write(FprmMB,prmMB);
        end;
      PrmModbusForm.ShowModal;
      Reset(FprmMB);
      Write(FprmMB,prmMB);
      CloseFile(FprmMB);
    end
end;

procedure TMaster2011Form.btnModemClick(Sender: TObject);
//Разрешить связь через модем
begin
  btnModem.Down := True;
  tm := 2;
  Remote := True;
  Modbus := False;
  btnModem.Hint := '';
  btnModbus.Hint := 'разрешить связь через MODBUS';
  btnLocal.Hint := 'разрешить непосредственную связь';
  btnPrm.Hint := 'параметры соединения';
  btnTable.Enabled := False;
  btnSetDT.Enabled := true;//False;
  btnPrm.Enabled := True;
  BreakConnection;
end;

procedure TMaster2011Form.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  //AppConfig.inifile.WriteInteger('Modem','Ton_Pulse',rgTone_Pulse.ItemIndex);
  //AppConfig.inifile.WriteString('Modem','Phone_Number',Phone_Number.Text);
  //AppConfig.inifile.WriteInteger('Modem','Access',Access.ItemIndex);

  BreakConnection;
  AssignFile(Ftm,path+TEST_MODE_FILENAME);
  Rewrite(Ftm);
  Write(Ftm,tm);
  CloseFile(Ftm);
end;

procedure TMaster2011Form.btnModbusClick(Sender: TObject);
begin
  btnModbus.Down := True;
  tm := 3;
  Remote := False;
  Modbus := True;
  btnModbus.Hint := '';
  btnModem.Hint := 'разрешить связь через модем';
  btnLocal.Hint := 'разрешить непосредственную связь';
  btnPrm.Hint := 'параметры соединения';
  btnTable.Enabled := False;
  btnSetDT.Enabled := true;//False;
  btnPrm.Enabled := True;
  BreakConnection;
end;

procedure TMaster2011Form.btnLocalClick(Sender: TObject);
begin
  btnLocal.Down := True;
  tm := 1;
  btnModem.Hint := 'разрешить связь через модем';
  btnModbus.Hint := 'разрешить связь через MODBUS';
  btnPrm.Hint := '';
  btnLocal.Hint := '';
  Remote := False;
  Modbus := False;
  btnTable.Enabled := True;
  btnSetDT.Enabled := True;
  btnPrm.Enabled := False;
  BreakConnection;
end;

procedure TMaster2011Form.BreakConnection;
begin
  if WaitAnswer then
    begin
      WaitAnswer := False;
      txt := IntToStr(MSG_ESCAPE);
      CD.dwData := REMOTE_CONNECT;
      CD.cbData := StrLen(PChar(txt)) + 1;
      CD.lpData := PChar(txt);
      SendMessage(DriverHandle,WM_COPYDATA,DriverHandle,DWORD(@CD));
      pnStatus.Caption :='';             pnStatus2.Caption   := '';
      pnErrorInfo.Caption:='';
      btnIdent.Enabled := True;
      btnInst.Enabled := True;
      btnMax.Enabled := True;
      btnPrm.Enabled := True;
      btnArchH.Enabled := True;
      btnArchD.Enabled := True;
      btnArchOnOffErr.Enabled := True;
      btnArchP.Enabled := True;
      btnArchAll.Enabled := True;
    end;
end;

procedure TMaster2011Form.ScaleForm(F: TForm);
const
    cScreenWidth  : Integer = 1024;
    cScreenHeight : Integer =  768;
    cPixelsPerInch: Integer =   96;
    cFontHeight   : Integer =  -11;
var
    i : Integer;
begin
  if ((Screen.Width<>cScreenWidth)or(Screen.PixelsPerInch<>cPixelsPerInch)) then
    begin
      F.Scaled := True;
      F.AutoScroll := False;
      F.Height := F.Height*Screen.Height div cScreenHeight;
      F.Width := F.Width*Screen.Width div cScreenWidth;
      F.ScaleBy(Screen.Width,cScreenWidth);
    end;
  if (Screen.PixelsPerInch<>cPixelsPerInch) then
    begin
      for i:=F.ControlCount-1 downto 0 do
        TFooClass(F.Controls[i]).Font.Height := (F.Font.Height div cFontHeight)*
                                          TFooClass(F.Controls[i]).Font.Height;
    end;
end;

procedure TMaster2011Form.TimerTimer(Sender: TObject);
begin
  if not DriverAnswer then
    begin
      txt := 'программа-драйвер не отвечает';
      Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
      pnStatus.Caption := '';   pnStatus2.Caption := '';
      pnErrorInfo.Caption:='';
      btnIdent.Enabled := True;
      btnInst.Enabled := True;
      btnMax.Enabled := True;
      btnArchH.Enabled := True;
      btnArchD.Enabled := True;
      btnArchOnOffErr.Enabled := True;
      btnArchP.Enabled := True;
      btnArchAll.Enabled := True;
      btnTable.Enabled := True;
      btnSetDT.Enabled := True;
      btnModem.Enabled := True;
      WaitAnswer := False;
      Timer.Interval:=10000;
    end;
  Timer.Enabled := False;
end;

procedure TMaster2011Form.cbAlwaysOnTopClick(Sender: TObject);
begin
 if cbAlwaysOnTop.checked then FormStyle:=fsStayOnTop
  else Formstyle:=fsNormal;
end;

procedure TMaster2011Form.btnLoadInfoFromDeviceClick(Sender: TObject);
begin
close
end;

procedure TMaster2011Form.Get_Arch_SET;
var
 i,j:integer;
 s:string;
 Device_number, Device_id :integer;
 Device_type:string;
 Device_addr_str:string;
 device_addr:Integer;
 HourLast, DayLast: TDatetime;
 bClear:boolean;

 RecToTransfer:TRecToTransfer;
 CD : TCopyDataStruct;

function GetFiles(Path:String; Full: Boolean = False):TStrings;
   Var
   Rec:TSearchRec;
   TMP:TStrings;
   ls: String;
   i: integer;
begin
  Result:=TStringList.Create;
  if Path[Length(Path)]<>'\' Then Path:=Path+'\';
  //ChDir(Path);
  if FindFirst(Path+'\*.*',faAnyFile,Rec)=0 then
    begin
     if (Rec.Name<>'.')and(Rec.Name<>'..') then
       if (Rec.Attr and faDirectory) <> 0 then begin
       TMP:=GetFiles(Path+Rec.Name,True);
       Result.AddStrings(TMP);
       TMP.Free;
       end else Result.Add(Path+Rec.Name);

     while FindNext(Rec)=0 do
       begin
        if (Rec.Name<>'.')and(Rec.Name<>'..') then
         if (Rec.Attr and faDirectory) <> 0 then begin
         TMP:=GetFiles(Path+Rec.Name,True);
         Result.AddStrings(TMP);
         TMP.Free;
         end else Result.Add(Path+Rec.Name);
       end;
    end;
 if not Full then
  for i:=0 to Result.Count-1 do
   begin
     ls := Result[i];
     Delete(ls,1,Length(Path));
     Result[i] := ls;
   end;
  FindClose(Rec);
end;

procedure RemoveAll(path: string);
var
  sr: TSearchRec;
begin
  if FindFirst(path + '\*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if sr.Attr and faDirectory = 0 then
      begin
        DeleteFile(path + '\' + sr.name);
      end
      else
      begin
        if pos('.', sr.name) <= 0 then
          RemoveAll(path + '\' + sr.name);
      end;
    until
      FindNext(sr) <> 0;
  end;
  FindClose(sr);
  RemoveDirectory(PChar(path));
end;


Procedure getHourDayLast(DeviceId: integer);
 begin
  dm.q.close;
  dm.q.SQL.Clear;
  dm.q.SQL.add('select max(Hour_Value) as hourlast from HoursData where Eksp_Nomer = :Eksp_Nomer');
  dm.q.parambyname('eksp_Nomer').asinteger:=DeviceId;
  dm.q.Open;
  if dm.q.fieldbyname('HourLast').isnull then HourLast:=0 else HourLast:=dm.q.fieldbyname('hourlast').value;
  dm.q.close;
  dm.q.SQL.Clear;
  dm.q.SQL.add('select max(day_Value) as daylast from daysData where Eksp_Nomer = :Eksp_Nomer');
  dm.q.parambyname('eksp_Nomer').asinteger:=DeviceId;
  dm.q.Open;
  if dm.q.fieldbyname('daylast').isnull then dayLast:=0 else DayLast:=dm.q.fieldbyname('daylast').value;
 end;



begin
lstLB.Visible:=false;
bClear:=true;
lstlB.Items.clear;
lstLB.Items.assign(gETfILES(SET_ARCH,false));
FOR I:=0 TO lstlb.items.count-1 do
 begin
  lstlb.ItemIndex:=i;
  update;
  // извлечь фдрес прибора
  s:=lstlb.items[i];       // 044441305101622
  Device_Addr_str:=copy(s,1,3);
  if Device_Addr_str[1]='0' then Delete(Device_Addr_str,1,1);
  if Device_Addr_str[1]='0' then Delete(Device_Addr_str,1,1);
  Device_addr:=strtoint(Device_Addr_str);
  Device_id := 0;
  for J:=0 to 1000 do   // НАЙТИ КОД ПРИБОРА
   begin
    if device_addr_set[j]=Device_addR then Device_id :=Devicenumber_set[j];
   end;
  if device_id = 0 then
   BEGIN
     lstlb.items[i]:='ОШИБКА. Нет прибора с адресом'+Device_Addr_str+' в БД:  '+lstlb.items[i];
     bClear:=false;
   END
   else
    begin
       getHourDayLast(Device_ID);
   // определить тип файла
         RecToTransfer.TypeOfFile:=100;
         if pos ('temp_h',s)>0 then
                  RecToTransfer.TypeOfFile:=1 {Hours};
         if pos ('temp_d',s)>0 then
                  RecToTransfer.TypeOfFile:=2 {Days};
         if pos ('temp_on',s)>0 then
                  RecToTransfer.TypeOfFile:=3 {On_event};
         if pos ('temp_off',s)>0 then
                  RecToTransfer.TypeOfFile:=4 {off_event};
         if pos ('temp_err',s)>0 then
                  RecToTransfer.TypeOfFile:=40 {off_event +причины отключений
                                                 причины отключений будут выбираться из temp_err файла при считывнии temp_off};
         if pos ('temp_p',s)>0 then
                  RecToTransfer.TypeOfFile:=5 {таблица параметров};  // импорт таблицы параметров не выполняется из прибора
         RecToTransfer.FName:=SET_ARCH+'\'+s;
  // загрузить данные в архив
        RecToTransfer.otherdata:=Device_ID;  // код записи в архиве, для который передаются данные
          RecToTransfer.Mult_k:=1;
         RecToTransfer.HourLast:=HourLast;
         RecToTransfer.dayLast:=dayLast;
         CD.lpData := @RecToTransfer;
         CD.dwData :=length(RecToTransfer.Fname);
         cd.cbData := sizeof(RecToTransfer);
         pnStatus.Caption   := 'обработка '+s;
         pnStatus.Update;
         if RecToTransfer.TypeOfFile in [1,2,3,4] then
            sendMessage(ExpForm.Handle, WM_COPYDATA, Handle, integer(@CD));
         show;
   end;
  end;

  for i:=lstlb.Items.count-1 downto 0 do
  begin
   s:=lstlb.items[i];
   if pos('ОШИБКА.',s)<=0 then begin lstlb.ItemIndex:=i; lstlb.DeleteSelected;end
     else deletefile(SET_ARCH+'\'+s);
  end;
   sleep(1500);
  if bClear then RemoveAll(SET_ARCH);
  lstlb.Visible:=not bClear;  Update;
  sleep(1000);
  
  if lstlb.Visible then pgcSET.ActivePageIndex:=1;
  pnStatus.Caption   := 'Загрузка данных в пакетном режиме  в БД Сигнур завершена';
  Update;
  if not lstlb.Visible then close;
end;


procedure TMaster2011Form.FormShow(Sender: TObject);
begin
 pgcSET.Visible:=bArchive_May2011;
 btnArchAllModem.visible:=bArchive_May2011;

 if bArchive_May2011 then
  begin
   height:=300  ;
   btnInst.Enabled:=true;
   btnArchAll.Enabled:=True;
   btnSetDT.Enabled:=true;
   btnModem.Down:=False;
   btnModem.Visible:=true;
   btnLocal.Visible:=False;
   btnModbus.Visible:=False;
  end
  else
   begin
    height:=200;
   end

end;

procedure TMaster2011Form.btnArchAllModemClick(Sender: TObject);
procedure RemoveAll1(path: string);
var
  sr: TSearchRec;
begin
  if FindFirst(path + '\*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if sr.Attr and faDirectory = 0 then
      begin
        DeleteFile(path + '\' + sr.name);
      end
      else
      begin
        if pos('.', sr.name) <= 0 then
          RemoveAll1(path + '\' + sr.name);
      end;
    until
      FindNext(sr) <> 0;
  end;
  FindClose(sr);
  RemoveDirectory(PChar(path));
end;

begin
 if not bGoodNumbers then
  begin
   ShowMessage('Работа с несколькими приборами через общий модем разрешена только для приборов с номерами не менее  '+
       StartLargeArchive);
   exit;
  end;
  if bBadListContent then
  begin
   ShowMessage('В список приборов для работы через общий модем могут быть включены приборы с ModBus  и не более одного прибора с RS-232');
   exit;
  end;
  if bBadRSCount then
  begin
   ShowMessage('В список приборов для работы через общий модем может входить не более одного прибора с RS-232');
   exit;
  end;
  bArchive_May2011:=True;
  RemoveAll1(extractfilepath(Application.exename)+'\ARCH\');
  CreateDir(extractfilepath(Application.exename)+'\ARCH');
  btnIdentClick(btnArchAll);
 end;

end.
