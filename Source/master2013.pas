unit master2013;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, Mask, Math, tvc_u,
  cxLookAndFeelPainters, cxButtons, Menus, ComCtrls, cxMaskEdit,
  cxDropDownEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit,rxstrutils,
  cxListBox, PropFilerEh, PropStorageEh, inifiles, DB, Grids, DBGridEh,
  MemDS, VirtualTable,DBGrids;

const
  A_ID  = 0;
  EQ_ID = 1;
  EH_ID = 2;

  Limit_H = 2502;
  Limit_D = 2202;

  Limit_H_AKRON = 1925;
  Limit_H_AKRON_2Ch = 1896;
  Limit_D_AKRON = 2200;
                                TEST = 0;
  GET_ID             =   1;
  GET_INST           =   2;

  GET_Inst_RS232_2013     =54;
  Get_Arch_All_Rs232_2013 = 55;
  gET_iNST_2          =  42;
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
    GET_ARCH_ALL_2       =  52;

  GET_ID_MB          = 101;
  GET_INST_MB        = 102;
    GET_INST_MB_2        = 65;
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
    GET_ARCH_ALL_MB_2    = 70;

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
  GET_ARCH_ALL_SET_MODEM   = 232;   // пакетный режим - "архивы" (код 232(десятичный)).
  GET_ARCH_ALL_SET_MODBUS  = 132;   // пакетный режим - "архивы" (код 132(десятичный)).
  GET_INST_All_Modem = 222 ;        // пакетный режим - "cчитать текущие значения" (код 222(десятичный)).
  GET_INST_All_Modbus =122 ;        // пакетный режим - "cчитать текущие значения" (код 122(десятичный)).
  PUT_DT_All_Modem  = 230;        // пакетный режим - "установить даты и время" (код 230(десятичный)).
  PUT_DT_All_Modbus = 130;        // пакетный режим - "установить даты и время" (код 130(десятичный)).

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
  COMP_FileName = '/COMP';

  Pos_INI_FILEName = '/master2.ini'  ;
 

type



  TMaster2013Form = class(TForm)
    pnButtons: TPanel;
    Gauge: TGauge;
    btnIdent: TBitBtn;
    btnInst: TBitBtn;
  //  btnMax: TBitBtn;
 //   btnArchH: TBitBtn;
//    btnArchD: TBitBtn;
    btnArchAll: TBitBtn;
//    btnArchOnOffErr: TBitBtn;
//    btnArchP: TBitBtn;
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
   // btnTable: TBitBtn;
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
    Access: TcxComboBox;
    Phone_Number: TcxMaskEdit;
    DeviceList: TcxListBox;
    chkPacket_Mode: TCheckBox;
    lstDeviceListAll: TcxListBox;
    chkPacket_: TCheckBox;
    lstDeviceList_DeviceType: TcxListBox;
    lstDevicelist_ID: TcxListBox;
    prpstrgh1: TPropStorageEh;
    VT: TVirtualTable;
    dsVT: TDataSource;
    grid: TDBGridEh;
    VTName: TStringField;
    VTEksp_ID: TIntegerField;
    VTDevice_Type: TSmallintField;
    VTAddress: TIntegerField;
    VTResultText: TStringField;
    VTChannel: TIntegerField;
    VTSize_Current: TLargeintField;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnIdentClick(Sender: TObject);
    procedure btnInstClick(Sender: TObject);
    procedure MessageReceiver(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure GetInstMax;
    procedure GetInst_ALL;
    procedure GetArch(arch: Byte; fn:string);
    procedure btnArchAllClick(Sender: TObject);
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
    procedure chkPacket_ModeClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure VTChannelGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure VTNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    CD : TCopyDataStruct;
    txt : string;

    FComp : File of byte;

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

    File_Addr_Set : file of word;  // октябрь  2011   Подключение нескольких приборов
    File_Size_Set : file of longword;  // октябрь  2011   Подключение нескольких приборов

    bArchive_May2011, bVia_RS232,bVia_RS485, bRS232_2Chan:boolean;
    SET_ARCH:string;
    DeviceNumber_set: array[0..1000] of Integer;
    Device_addR_set: array[0..1000] of Integer;
    bgoodNumbers,bBadListContent,bBadRSCount:boolean;
    StartLargeArchive:string;
    Eksp_Header:string;

    addr_set: array[0..1000] of word;
    HourLast_set: array[0..1000] of Tdatetime;
    DayLast_set: array[0..1000] of Tdatetime;
    N_Hour_set: array[0..1000] of word;
    N_Day_set: array[0..1000] of word;

    Modem_Count:integer;  RSCount,ModBus_Count:Integer;
    Pos_inifile:TIniFile;

  end;

  // 1 акрон - скорость, м/c
 //   1 эхо   уровень, м
 //    2 расход, куб.м/час
 //    3 объем куб.м
 //    4 наработка, час.мин



  TFooClass = class(TControl);

var
  Master2013Form: TMaster2013Form;
  prmMD : prmModemType;
  prmMB : prmModbusType;

implementation

uses Param2, Param3, DM_dm, Exp_f, config, Main_f;

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

procedure TMaster2013Form.FormCreate(Sender: TObject);
begin
  GetDir(0,path);
  WaitAnswer := False;
  DriverAnswer := False;
  Pos_IniFile := TInifile.Create(PATH+Pos_Ini_Filename);
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
  if not FileExists(path+TEST_MODE_FILENAME) then    tm := 1;
  case tm of
   1:btnLocalClick(Self);
   2: btnModemClick(Self);
   3:btnModbusClick(Self);
  end;
end;

procedure TMaster2013Form.btnIdentClick(Sender: TObject);
var
  OpCode : Byte;
  n : Word;
  N_Hour, N_Day:integer;
  PhoneNmb:string  ;
begin
   case devicetype of
      0,1: begin LimitH:=Limit_H; LimitD:=Limit_D;end;
      2:   begin LimitH:=Limit_H_Akron; LimitD:=Limit_D_Akron;end;
      3:   begin LimitH:=Limit_H_AKRON_2Ch; LimitD:=Limit_D_Akron;end;
   end;
  pnStatus.Caption := ''; pnStatus2.Caption := '';  pnErrorInfo.Caption:='';
  if not FileExists(path+'/signurdriver2.exe') then
    pnStatus.Caption := 'программа-драйвер не найдена'
  else
    begin
     OpCode := GET_ID;
     if Modbus then  OpCode := GET_ID_MB;
     if Remote then  OpCode := GET_ID_REM;
     if (Sender=btnInst) then
       begin
         OpCode := GET_INST;
         if Modbus then     OpCode := GET_INST_MB;
         if Remote then     OpCode := GET_INST_REM;
         if bVia_RS232 then OpCode := GET_INST_All_Modem;
         if bVia_RS485 then OpCode := GET_INST_All_Modbus;
         if bRS232_2Chan then OpCode := GET_Inst_RS232_2013;
       end;
 (*    if (Sender=btnMax) then
       begin
         OpCode := GET_MAX;
         if Modbus then  OpCode := GET_MAX_MB;
         if Remote then  OpCode := GET_MAX_REM;
       end;
     if (Sender=btnArchH) then
       begin
         n := LimitH;//2502;
         N_Hour := trunc(now * 24)-trunc(Hourlast * 24)+24;  // сколько нужно отсчетов почасовых значений?
         if N_Hour > Limith then N_Hour :=LimitH;
         meStrNum.Text:=inttostr(N_Hour);  mestrNum.update;
         OpCode := GET_ARCH_H;
         if Modbus then   OpCode := GET_ARCH_H_MB;
         if Remote then   OpCode := GET_ARCH_H_REM;
       end;
     if (Sender=btnArchD) then
       begin
         n := LimitD;//2202;
         N_Day := trunc(now)-trunc(Daylast) + 24;   // сколько нужно отсчетов суточных значенимй?
         if N_Day > LimitD then N_Day :=LimitD;
         meStrNum.Text:=inttostr(N_Day);
         mestrNum.update;
         OpCode := GET_ARCH_D;
         if Modbus then  OpCode := GET_ARCH_D_MB;
         if Remote then  OpCode := GET_ARCH_D_REM;
       end;
     if (Sender=btnArchOnOffErr) then
       begin
         OpCode := GET_ARCH_ONOFFERR;
         if Modbus then  OpCode := GET_ARCH_ONOFFERR_MB;
         if Remote then  OpCode := GET_ARCH_ONOFFERR_REM;
       end;
     if (Sender=btnArchP) then
       begin
         OpCode := GET_ARCH_P;
         if Modbus then  OpCode := GET_ARCH_P_MB;
         if Remote then  OpCode := GET_ARCH_P_REM;
       end;
  *)
     if ((Sender=btnArchAll) ) then
       begin
         N_Hour := trunc(now * 24)-trunc(HourlastMax * 24)+24; // сколько нужно отсчетов почасовых значений?
         if N_Hour > Limith then N_Hour :=LimitH;
         N_Day := trunc(now)-trunc(DaylastMax) + 14;  // сколько нужно отсчетов суточных значений?
         if N_Day > LimitD then N_Day :=LimitD;

         OpCode := GET_ARCH_ALL;
         if bVia_RS232 then OpCode := GET_ARCH_ALL_SET_Modem;
         if bVia_RS485 then OpCode := GET_ARCH_ALL_SET_MODBUS;
         if bRS232_2Chan then OpCode := GET_ARCH_ALL_RS232_2013;
          // запись файла MODEM для режима пакетной передачи

         AssignFile(FprmMD,path+REM_CONN_FILENAME);
         Rewrite(FprmMD);
         PhoneNmb:=phone_number.Text;
         phoneNmb:=delchars(Phonenmb,'-');
         phoneNmb:=delchars(Phonenmb,' ');
         phoneNmb:=delchars(Phonenmb,'.');
         phoneNmb:=delchars(Phonenmb,'(');
         phoneNmb:=delchars(Phonenmb,')');
         Prm.phoneNmb:=Phonenmb;
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


  //   if (Sender=btnTable) then  OpCode := PUT_TABLE;

     if (Sender=btnSetDT) then
      begin
       OpCode := PUT_DT;
        if Modbus then   OpCode := PUT_DT_MB;
         if Remote then  OpCode := PUT_DT_REM;
         if bVia_RS232 then OpCode := PUT_DT_All_Modem;
         if bVia_RS485 then OpCode := PUT_DT_All_Modbus;
      end;
      end;

     if (OpCode in [GET_ARCH_H,GET_ARCH_D,GET_ARCH_H_MB,GET_ARCH_D_MB,
                    GET_ARCH_H_REM,GET_ARCH_D_REM])  then    //проверить корректность параметров запроса архива
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
     chkPacket_Mode.Enabled := False;
     btnInst.Enabled := False;
     btnArchAll.Enabled := False;
 //    btnMax.Enabled := False;   //    btnArchH.Enabled := False; //    btnArchD.Enabled := False;  //     btnArchOnOffErr.Enabled := False;
 //    btnArchP.Enabled := False;     //  btnTable.Enabled := False;
     btnSetDT.Enabled := False;
     btnPrm.Enabled := False;
     Repaint;
     WaitAnswer := Remote or (OpCode in [GET_INST_MB,GET_INST, GET_INST_ALL_MODEM,GET_INST_ALL_MODBUS,GET_Inst_RS232_2013]);
     pnStatus.Caption := ' ждите...';  pnStatus2.Caption := '';
     txt := path+'/signurdriver2.exe '+IntToStr(Handle)+' '+IntToStr(OpCode);
  {   if (OpCode in [GET_ARCH_H,GET_ARCH_D,GET_ARCH_H_MB,GET_ARCH_D_MB,GET_ARCH_H_REM,GET_ARCH_D_REM])
                    then  txt := txt + ' ' + meStrInit.Text + ' ' + meStrNum.Text;
     if (OpCode in [GET_ARCH_ALL_MB,GET_ARCH_ALL_REM, GET_ARCH_ALL_SET_Modem,GET_ARCH_ALL_SET_Modbus])
                    then  txt := txt + ' ' + inttostr(N_HOUR) + ' ' + Inttostr(N_DAY);
   }
    
     if (OpCode in [GET_ARCH_ALL])
                    then  txt := txt + ' ' + inttostr(N_HOUR) + ' ' + Inttostr(N_DAY);

     result := WinExec(PChar(txt),SW_SHOWMINIMIZED);  // вызов драйвера

   //  CAPTION:=txt;   // для отладки  декабрпь2016 , надо будет убрать в инсталляторе

     pnStatus.ShowHint:=True;
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
         chkPacket_Mode.Enabled := True;// вернул 2012.01.10
         btnInst.Enabled := True;
  //       btnMax.Enabled := True;     //       btnArchH.Enabled := True;  //       btnArchD.Enabled := True;  //       btnArchOnOffErr.Enabled := True;
  //       btnArchP.Enabled := True;   // btnTable.Enabled := True;
         btnArchAll.Enabled := True;
         btnSetDT.Enabled := True;
         btnModem.Enabled := True;
         WaitAnswer := False;
         chkPacket_ModeClick(nil);
       end
     else
       Timer.Enabled := True;
end;

procedure TMaster2013Form.btnInstClick(Sender: TObject);
begin
 if chkPacket_mode.Checked then
     begin
       if not bGoodNumbers then
          begin
           //ShowMessage('Работа с несколькими приборами через общий модем разрешена только для приборов АКРОН-01 с номерами не менее  4000 (или 2000 для двухканальных приборов)');
           ShowMessage('Работа с несколькими приборами через общий модем разрешена для приборов АКРОН-01 с номерами не менее  4000 ');
           //        StartLargeArchive);
           exit;
          end;                                                                                                              
          if bBadListContent then
          begin
           ShowMessage('Адреса приборов должны быть индивидуальны. К модему допускается подключать не более одного прибора с интерфейсом RS232');
           exit;
          end;
          if bBadRSCount then
          begin
           ShowMessage('К модему допускается подключать не более одного прибора с интерфейсом RS232');
           exit;
          end;
        {  bArchive_May2011:=True;
          RemoveAll1(extractfilepath(Application.exename)+'\ARCH\');
          CreateDir(extractfilepath(Application.exename)+'\ARCH');
         } btnIdentClick(btnInst);
     end
   else
       btnIdentClick(btnInst);
end;

procedure TMaster2013Form.MessageReceiver(var Msg: TWMCopyData);
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
           LOC_MSG_NOCONNECT  :
              BEGIN
              pnStatus.Caption :=
                                'соединение не установлено';
          /////ИМИТАЦИЯ
           //   FN:=extractfilepath(Application.exename)+'\ARCH\';
           //   GetArch(GET_ARCH_ALL_set_Modbus,fn)
          /////
              END ;

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
       GET_INST_All_Modem:  GetInst_ALL;
       GET_INST_All_Modbus: GetInst_ALL;
       GET_Inst_RS232_2013: GetInst_ALL;
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
       PUT_DT_All_Modem  :  pnStatus.Caption := 'установлены дата и время';
       PUT_DT_All_Modbus :  pnStatus.Caption := 'установлены дата и время';

       GET_GAUGEPROGRESS :  begin
                             Gauge.Progress := Msg.CopyDataStruct.cbData;
                             Exit;
                            end;
       GET_ARCH_ALL_SET_Modem  : GetArch(GET_ARCH_ALL_set_Modem,fn);
       GET_ARCH_ALL_SET_Modbus  : GetArch(GET_ARCH_ALL_set_Modbus,fn);
       Get_Arch_All_Rs232_2013  : GetArch(GET_ARCH_ALL_set_Modbus,fn);


       end;
  Repaint;
  if not(oc in [DRIVER_HANDLE,GET_INST,GET_INST_MB,GET_INST_REM,GET_INST_ALL_MODEM,GET_INST_ALL_MODBUS,GET_Inst_RS232_2013]) then
    begin
      btnIdent.Enabled := True;
      chkPacket_Mode.Enabled := True;// вернул 2012.01.10
      btnInst.Enabled := True;
      //btnMax.Enabled := True;     // btnArchH.Enabled := True;    //  btnArchD.Enabled := True;   //   btnArchOnOffErr.Enabled := True;
   //   btnArchP.Enabled := True;     btnTable.Enabled := True;

      btnArchAll.Enabled := True;
     
      btnSetDT.Enabled := True;
      btnModem.Enabled := True;
      WaitAnswer := False;
      chkPacket_ModeClick(nil);
    end;
end;

procedure TMaster2013Form.GetInst_ALL;
const
  searchstr_1 = '    Уровень, м  = ';
  searchstr_2 = ' Скорость, м/c  = ';
type
  imType = record
                   h_or_v : string[10];
                   q      : string[10];
                   vol    : String[10];
                   w      : String[10];
                   e      : string[10];
                   am     : string[10];
  //                 dt     : string[20];
                  end;
var
  im : imType;
  Fim : File of imType;
  s,s2,s_start:string;
  b:byte;
  am:string;  adres, chan:string;    adr_int, chan_int:Integer;
  am_int:Integer;
   pnStatus_Caption:string;
   SearchStr:string;
   devicetype_Current:Integer;
begin

  PnErrorInfo.caption:='';
  pnStatus2.Caption:='';pnStatus.Caption:='';
  pnStatus_Caption:='';
 // pnStatus.Caption:=fn; Update ;  //31.05.2012
  if FileExists(fn) then
    begin
      AssignFile(Fim,fn);
      Reset(Fim);
      Read(Fim,im);

     // grid.Options:=[dgIndicator,dgColumnResize,dgTabs,dgConfirmDelete,dgCancelOnExit] ;
      grid.Options:=[dgRowSelect, dgAlwaysShowSelection,dgColumnResize,dgTabs,dgConfirmDelete,dgCancelOnExit] ;

        // 1 акрон - скорость, м/c
       //   1 эхо   уровень, м
       //    2 расход, куб.м/час
      //    3 объем куб.м
      //    4 наработка, час.мин

      am:=Trim(im.am);
      if pos('/',am)>0 then
       begin
        adres:=Copy(am,1,Pos('/',am)-1);
        chan:=Copy(am,Length(adres)+2,Length(am));
        //caption:= adres+'   '+Chan;
        adr_int:=StrToInt(adres);
        Chan_int:=StrToInt(chan);
        VT.Locate('Address;Channel',VarArrayOf([adr_int,chan_int]),[]);
        VT.edit;
        VT.fieldbyname('ResultText').value:=s2;
        VT.post;
        devicetype_Current:=VT.Fieldbyname('Device_type').AsInteger;


        begin;
          case devicetype_Current of
              0,1: begin
                    SearchStr:=SearchStr_1; pnStatus_Caption := SearchStr_1+im.h_or_v;//FloatToStrF(im.h_or_v,ffFixed,7,3);
                   end;
               2,3:  begin
                   SearchStr:=SearchStr_2;  pnStatus_Caption := SearchStr_2+im.h_or_v;//FloatToStrF(im.h_or_v,ffFixed,7,3);
                   end  ;

           end;
         if trim(im.q)<>'' then
          begin
             s2:=  '  Расход,куб.м/час = '+im.q+//FloatToStrF(im.q,ffFixed,7,1)+
              '  Объем, куб.м = '+ im.vol+
              '  Наработка, час.мин = '+im.w;
             pnStatus_Caption := pnStatus_Caption + s2;

             pnStatus2.Caption:= '';
          end  ;
         try
            VT.Locate('Address;Channel',VarArrayOf([adr_int,chan_int]),[]);
            VT.edit;
            VT.fieldbyname('ResultText').value:=pnStatus_Caption;//s2;
            VT.post;
            {am_int:=StrToInt(am);
            DeviceList.ItemIndex:=DeviceList.Items.IndexOfObject(Tobject(am_int));
            if DeviceList.ItemIndex<>-1 then
             begin
               s:=DeviceList.Items[DeviceList.ItemIndex];
               if pos(SearchStr,s)>0 then
                begin
                s_start:=Copy(s,1,Pos(SearchStr,s)-1);
                s:=s_start+pnStatus_caption;
                end
                 else
                  s:=DeviceList.Items[DeviceList.ItemIndex]+' '+pnStatus_Caption;
               DeviceList.Items[DeviceList.ItemIndex]:=s;
               DeviceList.Update;
             end;}
            except
           end;
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
                0:    s:=' Отключение питания';
                1..5: s:= 'Ошибка памяти';
                6..11:s:= 'Ошибка таймера';
                12:   s:= 'Не установлены часы';
                13:   s:=  ' t < -100 градусов';
                14:   s:= 'Нет эхо-сигнала';
                15:   s:= 'Переполнение';
                16:   s:= 'Дефект питания';
                17:   s:= ' t > +100 градусов';
                18:   s:= 'к.з. питания АП';
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
       end
       else
       begin;
          //Caption:=Trim(im.am) ; Update; ///31.05.2012
          try
            am_int:=StrToInt(am);
           // было так  lstDeviceList_DeviceType.ItemIndex:=DeviceList.Items.IndexOfObject(Tobject(am_int));
           lstDeviceList_DeviceType.ItemIndex:=lstDeviceListAll.Items.IndexOfObject(Tobject(am_int));
            if lstDeviceList_DeviceType.ItemIndex<>-1 then
             begin
               devicetype_Current:=Integer(lstDeviceList_DeviceType.Items.Objects[lstDeviceList_DeviceType.ItemIndex]);
             end;
            except
           end;
           case devicetype_Current of
              0,1: begin
                    SearchStr:=SearchStr_1; pnStatus_Caption := SearchStr_1+im.h_or_v;//FloatToStrF(im.h_or_v,ffFixed,7,3);
                   end;
               2,3:  begin
                   SearchStr:=SearchStr_2;  pnStatus_Caption := SearchStr_2+im.h_or_v;//FloatToStrF(im.h_or_v,ffFixed,7,3);
                   end  ;

           end;
        if trim(im.q)<>'' then
          begin
             s2:=  '  Расход,куб.м/час = '+im.q+//FloatToStrF(im.q,ffFixed,7,1)+
              '  Объем, куб.м = '+ im.vol+
              '  Наработка, час.мин = '+im.w;
             pnStatus_Caption := pnStatus_Caption + s2;

             pnStatus2.Caption:= '';
          end  ;

          VT.Locate('Address;Channel',VarArrayOf([am_int,0]),[]);
            VT.edit;
            VT.fieldbyname('ResultText').value:=pnStatus_Caption;//s2;
            VT.post;
          am:=Trim(im.am);

          try
            am_int:=StrToInt(am);
            DeviceList.ItemIndex:=DeviceList.Items.IndexOfObject(Tobject(am_int));
            if DeviceList.ItemIndex<>-1 then
             begin
               s:=DeviceList.Items[DeviceList.ItemIndex];
               if pos(SearchStr,s)>0 then
                begin
                s_start:=Copy(s,1,Pos(SearchStr,s)-1);
                s:=s_start+pnStatus_caption;
                end
                 else
                  s:=DeviceList.Items[DeviceList.ItemIndex]+' '+pnStatus_Caption;
               DeviceList.Items[DeviceList.ItemIndex]:=s;
               DeviceList.Update;
             end;
            except
           end;
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
                0:    s:=' Отключение питания';
                1..5: s:= 'Ошибка памяти';
                6..11:s:= 'Ошибка таймера';
                12:   s:= 'Не установлены часы';
                13:   s:=  ' t < -100 градусов';
                14:   s:= 'Нет эхо-сигнала';
                15:   s:= 'Переполнение';
                16:   s:= 'Дефект питания';
                17:   s:= ' t > +100 градусов';
                18:   s:= 'к.з. питания АП';
                
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
    end
  else
    begin
      pnStatus.Caption := '';  pnStatus2.Caption := '';
      txt := 'не найден файл-посредник '+fn;
      Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
    end;
end;



procedure TMaster2013Form.GetInstMax;
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
          0,1:  pnStatus.Caption := '   Уровень, м  = '+im.h_or_v;//FloatToStrF(im.h_or_v,ffFixed,7,3);
           2,3:   pnStatus.Caption := 'Скорость, м/c  = '+im.h_or_v;//FloatToStrF(im.h_or_v,ffFixed,7,3);
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
          0:    s:=' Отключение питания';
          1..5: s:= 'Ошибка памяти';
          6..11:s:= 'Ошибка таймера';
          12:   s:= 'Не установлены часы';
          13:   s:=  ' t < -100 градусов';
          14:   s:= 'Нет эхо-сигнала';
          15:   s:= 'Переполнение';
          16:   s:= 'Дефект питания';
          17:   s:= ' t > +100 градусов';
          18:   s:= 'к.з. питания АП';
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
      txt := 'не найден файл-посредник '+fn;
      Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
    end;
end;

procedure TMaster2013Form.GetArch(arch: Byte; fn:string);
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
 //        RecToTransfer.channel:=0;
         ExpForm.Current_Channel:=0;
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
         //Rectotransfer.Channel:=0;
         ExpForm.Current_Channel:=0;
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
         //RecToTransfer.Channel:=0;
         ExpForm.Current_Channel:=0;
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
         //RecToTransfer.Channel:=0;
         ExpForm.Current_Channel:=0;
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
   if (arch in [GET_ARCH_ALL_SET_MODEM,GET_ARCH_ALL_SET_MODBus,Get_Arch_All_Rs232_2013]) then
     begin
        RecToTransfer.fname:=fn;
        //RecToTransfer.Channel:=0;
        ExpForm.Current_Channel:=0;
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

procedure TMaster2013Form.btnArchAllClick(Sender: TObject);
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
  if chkPacket_mode.Checked then
     begin
       if not bGoodNumbers then
          begin
    //       ShowMessage('Работа с несколькими приборами через общий модем разрешена для приборов АКРОН-01 с номерами не менее  4000 (или 2000 для двухканальных приборов) ');
           ShowMessage('Работа с несколькими приборами через общий модем разрешена для приборов АКРОН-01 с номерами не менее  4000 ');
           //StartLargeArchive);
           exit;
          end;
          if bBadListContent then
          begin
           ShowMessage('Адреса приборов должны быть индивидуальны. К модему допускается подключать не более одного прибора с интерфейсом RS232');
           exit;
          end;
          if bBadRSCount then
          begin
           ShowMessage('К модему допускается подключать не более одного прибора с интерфейсом RS232');
           exit;
          end;
          bArchive_May2011:=True;
          /////имитиация      ПРИ ИМИТАЦИИ ЗАКОММЕНТИТЬ  ДВЕ СЛЕД. СТРОКИ

          RemoveAll1(extractfilepath(Application.exename)+'\ARCH\');
          CreateDir(extractfilepath(Application.exename)+'\ARCH');

          btnIdentClick(btnArchAll);
     end
   else
       btnIdentClick(btnArchAll);
end;

procedure TMaster2013Form.btnSetDTClick(Sender: TObject);
begin
  btnIdentClick(btnSetDT);
end;

procedure TMaster2013Form.btnPrmClick(Sender: TObject);
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

procedure TMaster2013Form.btnModemClick(Sender: TObject);
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
  //btnTable.Enabled := False;
  btnSetDT.Enabled := true;//False;
  btnPrm.Enabled := True;
  BreakConnection;
end;

procedure TMaster2013Form.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  BreakConnection;
  AssignFile(Ftm,path+TEST_MODE_FILENAME);
  Rewrite(Ftm);
  Write(Ftm,tm);
  CloseFile(Ftm);
end;

procedure TMaster2013Form.btnModbusClick(Sender: TObject);
begin
  btnModbus.Down := True;
  tm := 3;
  Remote := False;
  Modbus := True;
  btnModbus.Hint := '';
  btnModem.Hint := 'разрешить связь через модем';
  btnLocal.Hint := 'разрешить непосредственную связь';
  btnPrm.Hint := 'параметры соединения';
  //btnTable.Enabled := False;
  btnSetDT.Enabled := true;//False;
  btnPrm.Enabled := True;
  BreakConnection;
end;

procedure TMaster2013Form.btnLocalClick(Sender: TObject);
begin
  btnLocal.Down := True;
  tm := 1;
  btnModem.Hint := 'разрешить связь через модем';
  btnModbus.Hint := 'разрешить связь через MODBUS';
  btnPrm.Hint := '';
  btnLocal.Hint := '';
  Remote := False;
  Modbus := False;
  //btnTable.Enabled := True;
  btnSetDT.Enabled := True;
  btnPrm.Enabled := False;
  BreakConnection;
end;

procedure TMaster2013Form.BreakConnection;
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
    //  chkPacket_Mode.Enabled := False;//    ВЕРНУТЬ!!!!! True;
      chkPacket_Mode.Enabled := True; // вернул 2012.01.10
      btnInst.Enabled := True;
//      btnMax.Enabled := True;
      btnPrm.Enabled := True;
  //    btnArchH.Enabled := True;
  //    btnArchD.Enabled := True;
  //    btnArchOnOffErr.Enabled := True;
  //    btnArchP.Enabled := True;
      btnArchAll.Enabled := True;
      chkPacket_ModeClick(nil);
    end;
end;

procedure TMaster2013Form.ScaleForm(F: TForm);
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

procedure TMaster2013Form.TimerTimer(Sender: TObject);
begin
  if not DriverAnswer then
    begin
      Timer.Enabled := False;
      //Timer.Interval:=180000*100;
      txt := 'программа-драйвер не отвечает';
      Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
      pnStatus.Caption := '';   pnStatus2.Caption := '';
      pnErrorInfo.Caption:='';
      btnIdent.Enabled := True;
    //  chkPacket_Mode.Enabled := False;//    ВЕРНУТЬ!!!!! True;
      chkPacket_Mode.Enabled := True; // вернул 2012.01.10
      btnInst.Enabled := True;
 //     btnMax.Enabled := True;  //      btnArchH.Enabled := True;  //     btnArchD.Enabled := True;
 //     btnArchOnOffErr.Enabled := True;     //   btnTable.Enabled := True;   //     btnArchP.Enabled := True;

      btnArchAll.Enabled := True;
   
      btnSetDT.Enabled := True;
      btnModem.Enabled := True;
      WaitAnswer := False;
      //Timer.Interval:=180000;
      Timer.Enabled := True;
      chkPacket_ModeClick(nil);
    end;
  Timer.Enabled := False;
end;

procedure TMaster2013Form.cbAlwaysOnTopClick(Sender: TObject);
begin
 if cbAlwaysOnTop.checked then FormStyle:=fsStayOnTop
  else Formstyle:=fsNormal;
end;

procedure TMaster2013Form.btnLoadInfoFromDeviceClick(Sender: TObject);
begin
close
end;

procedure TMaster2013Form.Get_Arch_SET;
var
 i,j:integer;
 s:string;
 Device_number, Device_id :integer; device_name:string;
 Device_type:string;
 Device_addr_str:string;
 device_addr:Integer;
 HourLast, DayLast: TDatetime;
 bClear:boolean;

 RecToTransfer:TRecToTransfer;
 CD : TCopyDataStruct;
 s_error :string;
 chan:Integer;
 chan_s:string;

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
  // извлечь адрес прибора  и номер канала из имени файла с каталогом
  s:=lstlb.items[i];       // 044441305101622
                           //  000_1  ИЛИ 000_2   ИЛИ 000
                          // 2013  -  ТУТ ИЗВЛЕКАТЬ НОМЕР КАНАЛА ИЗ СТРОКИ С ИМЕНЕМ ФАЙЛА
  if Pos('_',s)=4 then
   begin
     chan_S:=Copy(S,5,1);
     CHAN:=StrToInt(chan_s);
     Device_Addr_str:=copy(s,1,3);
     if Device_Addr_str[1]='0' then Delete(Device_Addr_str,1,1);
     if Device_Addr_str[1]='0' then Delete(Device_Addr_str,1,1);
     Device_addr:=strtoint(Device_Addr_str);
   end else
    begin
     Device_Addr_str:=copy(s,1,3);
     if Device_Addr_str[1]='0' then Delete(Device_Addr_str,1,1);
     if Device_Addr_str[1]='0' then Delete(Device_Addr_str,1,1);
     Device_addr:=strtoint(Device_Addr_str);
     chan:=0;
    end ;
  Device_id := 0;       // НАЙТИ КОД ПРИБОРА
   if VT.Locate('Address;Channel',VarArrayOf([Device_addR,chan]),[]) then
    begin
      Device_id :=VT.fieldbyname('Eksp_id').AsInteger;
    end
    else
     begin
       device_id := 0;
     end;
  {
  for J:=0 to 1000 do   
   begin
    if (device_addr_set[j]=Device_addR)   then BEGIN Device_id :=Devicenumber_set[j];  Break; END;
   end;
  }
  if device_id = 0 then
   BEGIN
     lstlb.items[i]:='ОШИБКА. Нет прибора с адресом '+Device_Addr_str+' и соответствующим номером канала в БД:  '+lstlb.items[i];
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
       ExpForm.Current_Channel:=chan;
       CD.lpData := @RecToTransfer;
       CD.dwData :=length(RecToTransfer.Fname);
       cd.cbData := sizeof(RecToTransfer);
       pnStatus.Caption   := 'обработка '+s;
       pnStatus.Update;
       if RecToTransfer.TypeOfFile in [1,2,3,4] then
            sendMessage(ExpForm.Handle, WM_COPYDATA, Handle, integer(@CD));

       VT.Locate('Address;Channel',VarArrayOf([Device_addR,chan]),[]);
       VT.edit;
       VT.fieldbyname('ResultText').value:='обработка архива '+s;
       VT.Post;

        lstDeviceList_ID.ItemIndex:=lstDeviceList_ID.Items.IndexOfObject(TObject(Device_ID));
        if lstDeviceList_ID.ItemIndex<>-1 then
         begin
           if chkPacket_Mode.Checked then
               DeviceList.items[lstDeviceList_ID.ItemIndex]:=
                  lstDeviceListAll.items[lstDeviceList_ID.ItemIndex]+' архив принят'
                   else
                    DeviceList.items[0]:=
                       lstDeviceListAll.items[lstDeviceList_ID.ItemIndex]+' архив принят';
         end;

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
 // 31.05.2012
  {if bClear then
   RemoveAll(SET_ARCH);
  }lstlb.Visible:=not bClear;  Update;
  sleep(1000);
  
  if lstlb.Visible then pgcSET.ActivePageIndex:=1;
  pnStatus.Caption   := 'Загрузка данных в пакетном режиме  в БД Сигнур успешно завершена';
  Update;
  sleep(4000);
 s_error:='';
  for i:=0 to DeviceList.Count-1 do
   begin
     if Pos('архив принят', DeviceList.Items[i])<=0 then
      begin
      if s_error='' then s_error:=' Не удалось принять архив для прибора(ов):  '+
         copy(trim(DeviceList.Items[i]),1,Length(trim(DeviceList.Items[i]))-1)
       else s_error:=s_error+'  '+ copy(trim(DeviceList.Items[i]),1,Length(trim(DeviceList.Items[i]))-1);
      end;
   end;
  if not lstlb.Visible then close;
  if s_error<>'' then
   begin
   Application.MessageBox(PChar(S_Error),'Ошибка',MB_ICONERROR);
   end;
end;


procedure TMaster2013Form.FormShow(Sender: TObject);
begin
 pgcSET.Visible:=bArchive_May2011;
 chkPacket_mode.visible:= True;//false;
 chkPacket_mode.checked:= false;
 if bArchive_May2011 then
  begin
  // chkPacket_mode.checked:= False;//    ВЕРНУТЬ!!!!! true;
   chkPacket_mode.checked:= True;// вернул 2012.01.10
  // chkPacket.checked:= False;//    ВЕРНУТЬ!!!!! true;
   chkPacket_.checked:= True; // вернул 2012.01.10
   chkPacket_mode.enabled:=true;
   height:=400  ;
   btnInst.Enabled:=true;
   btnArchAll.Enabled:=True;
   btnSetDT.Enabled:=true;
   btnModem.Down:=False;
   btnModem.Visible:=true;
   btnLocal.Visible:=False;
   btnModbus.Visible:=False;
   if bRS232_2Chan=True then
    begin
     btnLocal.Visible:=true;
     btnModem.Visible:=False;
     chkPacket_mode.enabled:=false;
    end;
   if bVia_RS232 then Caption:='Работа с приборами ';//через модем RS232 или работа с прибором '+Eksp_Header;
   if bVia_RS485 then Caption:='Работа с приборами ';//через адаптер RS485 или работа с прибором '+Eksp_Header;
  end
  else
   begin
    height:=210;
    Caption:='Работа с прибором '+Eksp_Header;
    chkPacket_mode.enabled:=False;
   end    ;

  left:=Pos_inifile.ReadInteger('Master2new','Left',100) ;
  width:=Pos_inifile.ReadInteger('Master2new','Width',750) ;
  Top:=Pos_inifile.ReadInteger('Master2new','Top',100) ;


end;

procedure TMaster2013Form.chkPacket_ModeClick(Sender: TObject);
var
  i, j:Integer;
  devicetype_Current:integer;
  NHour,Nday:LongWord;
  Size_Current:LongWord;
  addr_Chan:word;
begin
  VT.close;  VT.clear       ;   VT.Open;
 if chkPacket_Mode.checked then
  begin
    height:=400  ;
    // 2013    devicelist.visible:=true;
    DeviceList.Items.Assign(lstDeviceListAll.items);
    ts1.Visible:=True;

    AssignFile( File_addr_set,'addr_set');   Rewrite(File_Addr_set);
    for i := 0 to Modem_Count - 1 do
      Write(File_Addr_set,addr_set[i]);
    CloseFile(File_Addr_set);

    AssignFile( File_Size_set,'Size_set');   Rewrite(File_Size_set);
    for i := 0 to Modem_Count - 1 do
      begin
       devicetype_Current:=Integer(lstDeviceList_DeviceType.Items.Objects[i]);
       case devicetype_Current of
        0,1: begin LimitH:=Limit_H; LimitD:=Limit_D;end;
        2:   begin LimitH:=Limit_H_Akron; LimitD:=Limit_D_Akron;end;
        3:   begin LimitH:=Limit_H_AKRON_2Ch; LimitD:=Limit_D_Akron;end;
       end;
       NHour := trunc(now * 24)-trunc(Hourlast_Set[i] * 24)+24;  // сколько нужно отсчетов почасовых значений?
       if NHour > Limith then NHour :=LimitH;
       NDay := trunc(now)-trunc(Daylast_set[i]) + 24;   // сколько нужно отсчетов суточных значенимй?
       if NDay > LimitD then NDay :=LimitD;
       Size_Current:=NHour+ (Nday shl 16);
       Write(File_Size_set,Size_Current);

       VT.Append;
       VT.FieldByName('Name').value:=DeviceList.items[i];
       VT.FieldByName('Device_Type').value:=Integer(lstDeviceList_DeviceType.Items.Objects[i]);
       VT.FieldByName('Eksp_ID').value:=Integer(lstDeviceList_ID.Items.Objects[i]);
       VT.FieldByName('Address').value:=addr_set[i];
       VT.FieldByName('Channel').value:=0;
       VT.FieldByName('Size_current').value:=Size_Current;
       if devicetype_Current = 3 then
        begin
         VT.FieldByName('Channel').value:=1;
         VT.Post;
         VT.Append;
         VT.FieldByName('Name').value:=DeviceList.items[i];
         VT.FieldByName('Device_Type').value:=Integer(lstDeviceList_DeviceType.Items.Objects[i]);
         VT.FieldByName('Eksp_ID').value:=Integer(lstDeviceList_ID.Items.Objects[i]);
         VT.FieldByName('Address').value:=addr_set[i];
         VT.FieldByName('Channel').value:=2 ;
         VT.FieldByName('Size_current').value:=Size_Current;
         VT.Post;
        end
            else VT.Post;
        end    ;

    CloseFile(File_Size_set);



  end
   else
    begin
     height:=200;
     if lstDeviceListAll.items.count<>0 then
     begin
     devicelist.Items.Clear;
     for J:=0 to 1000 do   // НАЙТИ КОД ПРИБОРА
       begin
        if ID_device=Devicenumber_set[j] then
         begin;
          begin
           devicelist.items.Addobject('   '+lstDeviceListAll.Items[j],lstDeviceListAll.items.objects[j]);
           //DeviceList.
           AssignFile( File_addr_set,'addr_set');   Rewrite(File_Addr_set);
           Write(File_Addr_set,addr_set[j]);
           CloseFile(File_Addr_set);

           AssignFile( File_Size_set,'Size_set');   Rewrite(File_Size_set);
           devicetype_Current:=Integer(lstDeviceList_DeviceType.Items.Objects[j]);
            case devicetype_Current of
                  0,1: begin LimitH:=Limit_H; LimitD:=Limit_D;end;
                  2:   begin LimitH:=Limit_H_Akron; LimitD:=Limit_D_Akron;end;
                  3:   begin LimitH:=Limit_H_Akron_2Ch; LimitD:=Limit_D_Akron;end;
            end;
            
            NHour := trunc(now * 24)-trunc(Hourlast_Set[j] * 24)+24;  // сколько нужно отсчетов почасовых значений?
            if NHour > Limith then NHour :=LimitH;
            NDay := trunc(now)-trunc(Daylast_set[j]) + 24;   // сколько нужно отсчетов суточных значенимй?
            if NDay > LimitD then NDay :=LimitD;
            Size_Current:=NHour+ (Nday shl 16);
           Write(File_Size_set,Size_Current);
           CloseFile(File_Size_set);

           VT.Append;
           VT.FieldByName('Name').value:=lstDeviceListAll.Items[j];
           VT.FieldByName('Device_Type').value:=Integer(lstDeviceList_DeviceType.Items.Objects[j]);
           VT.FieldByName('Eksp_ID').value:=Integer(lstDeviceList_ID.Items.Objects[j]);
           VT.FieldByName('Address').value:=addr_set[j];
           VT.FieldByName('Channel').value:=0;
           VT.FieldByName('Size_current').value:=Size_Current;
           if devicetype_Current = 3 then
            begin
             VT.FieldByName('Channel').value:=1;
             VT.Post;
             VT.Append;
             VT.FieldByName('Name').value:=lstDeviceListAll.Items[j];
             VT.FieldByName('Device_Type').value:=Integer(lstDeviceList_DeviceType.Items.Objects[j]);
             VT.FieldByName('Eksp_ID').value:=Integer(lstDeviceList_ID.Items.Objects[j]);
             VT.FieldByName('Address').value:=addr_set[j];
             VT.FieldByName('Channel').value:=2;
             VT.FieldByName('Size_current').value:=Size_Current;
             VT.Post;
            end
               else VT.Post;
           end
         end;
       end;
     ts1.Visible:=True;
     end;
    end;

    AssignFile( File_addr_set,'addr_set');   Rewrite(File_Addr_set);
    AssignFile( File_Size_set,'Size_set');   Rewrite(File_Size_set);
    VT.First;
    while not VT.eof do
    begin
      addr_chan:=VT.Fieldbyname('address').asinteger      ;
      addr_chan:=addr_chan+(VT.Fieldbyname('channel').asinteger*256);
      Write(File_Addr_set,addr_chan);
      Size_Current:= VT.Fieldbyname('Size_current').asinteger;
      Write(File_Size_set,size_current);
      VT.Next;
    end;
    CloseFile(File_Addr_set);
    CloseFile(File_Size_set);


end;

procedure TMaster2013Form.FormDeactivate(Sender: TObject);
begin
  Pos_inifile.WriteInteger('Master2new','Left',left) ;
  Pos_inifile.WriteInteger('Master2new','width',width) ;
  Pos_inifile.WriteInteger('Master2new','top',top)   ;
end;

procedure TMaster2013Form.VTChannelGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 if VT.FieldByName('Channel').AsInteger=0 then text:='-0-'
 else text:=IntToStr(VT.fieldbyname('Channel').asinteger);
end;

procedure TMaster2013Form.VTNameGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
var
  s:string;
begin
  s:=VT.fieldbyname('Name').AsString;
  if s='' then exit;
  s[Length(s)]:=' ';
  if VT.FieldByName('Channel').AsInteger=0 then text:=s
   else s:='('+IntToStr(VT.fieldbyname('Channel').asinteger)+') '+s ;

  Text:=Trim(s);
end;

procedure TMaster2013Form.Button1Click(Sender: TObject);
begin
set_arch:='C:\Signur\exe\ARCH';
 get_arch_set
end;

end.
