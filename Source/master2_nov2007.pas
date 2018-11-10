unit master2_nov2007;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, Mask, Math, tvc_u, import_signur_2,
   cxLookAndFeelPainters,
  cxButtons;

const
  A_ID  = 0;
  EQ_ID = 1;
  EH_ID = 2;

// что делать в скрипте?
  GET_H         =   4;
  GET_D         =   5;
  GET_On         =  6;
  GET_Off        =  7;

  ScriptStatus_Wait = 0;  // статусы элементов скрипта
  ScriptStatus_Started = 1;
  ScriptStatus_Finished = 2;


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

  GET_ID_MB          = 101;
  GET_INST_MB        = 102;
  GET_MAX_MB         = 103;
  GET_ARCH_H_MB      = 104;
  GET_ARCH_D_MB      = 105;
  GET_ARCH_ON_MB     = 106;
  GET_ARCH_OFF_MB    = 107;
  GET_ARCH_ERR_MB    = 108;
  GET_ARCH_P_MB      = 108;

  GET_ID_REM         = 201;
  GET_INST_REM       = 202;
  GET_MAX_REM        = 203;
  GET_ARCH_H_REM     = 204;
  GET_ARCH_D_REM     = 205;
  GET_ARCH_ON_REM    = 206;
  GET_ARCH_OFF_REM   = 207;
  GET_ARCH_ERR_REM   = 208;
  GET_ARCH_P_REM     = 208;

  GET_GAUGEPROGRESS  = $c0;
  REMOTE_CONNECT     = $c5;
  LOCAL_CONNECT      = $c7;
  DRIVER_HANDLE      = $c6;


  WM_COPYDATA        = $004a;

  LOC_MSG_NOCONNECT  =  0;
  LOC_MSG_DISCONNECT =  1;
  LOC_MSG_ARCHEMPTY  =  2;
  LOC_MSG_NOTECHO    =  3;
  LOC_MSG_NOTCONFIRM =  4;
  LOC_MSG_NOTTABLE   =  5;
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
  REM_MSG_ARCHEMPTY  = 12;

  MSG_ESCAPE         = 10;

  TEST_MODE_FILENAME = '\tm';
  REM_CONN_FILENAME = '\modem';
  MB_CONN_FILENAME = '\modbus';


type



  TMaster2Form = class(TForm)
    pnStatus: TPanel;
    pnButtons: TPanel;
    Gauge: TGauge;
    Panel1: TPanel;
    btnLocal: TSpeedButton;
    btnModem: TSpeedButton;
    btnModbus: TSpeedButton;
    cbAlwaysOnTop: TCheckBox;
    btnIdent: TcxButton;
    btnInst: TcxButton;
    btnMax: TcxButton;
    BitBtn1: TcxButton;
    btnArchP: TcxButton;
    btnArchH: TcxButton;
    btnArchD: TcxButton;
    btnArchOn: TcxButton;
    btnArchOff: TcxButton;
    btnArchErr: TcxButton;
    CurrentScriptStage: TLabel;
    btnPrm: TSpeedButton;
    ScriptTimer: TTimer;
    SaveDialog: TSaveDialog;
    btnLoadInfoFromDevice: TcxButton;
    Panel2: TPanel;
    btnTable: TcxButton;
    btnSetDT: TcxButton;
    lbStrNum: TLabel;
    meStrNum: TMaskEdit;
    lbStrInit: TLabel;
    meStrInit: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnIdentClick(Sender: TObject);
    procedure btnInstClick(Sender: TObject);
    procedure btnMaxClick(Sender: TObject);
    procedure MessageReceiver(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure GetInstMax;
    procedure GetArch(Type_of_File:byte);
    procedure btnArchDClick(Sender: TObject);
    procedure btnArchHClick(Sender: TObject);
    procedure btnArchOnClick(Sender: TObject);
    procedure btnArchOffClick(Sender: TObject);
    procedure btnArchPClick(Sender: TObject);
    procedure btnArchErrClick(Sender: TObject);
    procedure btnTableClick(Sender: TObject);
    procedure btnSetDTClick(Sender: TObject);
    procedure btnPrmClick(Sender: TObject);
    procedure btnModemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnModbusClick(Sender: TObject);
    procedure btnLocalClick(Sender: TObject);
    procedure BreakConnection;
    procedure ScaleForm(F: TForm);
    procedure cbAlwaysOnTopClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ScriptTimerTimer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure btnLoadInfoFromDeviceClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

    FprmMD : File of prmModemType;
    FprmMB : File of prmModbusType;
    path, fn, txt : string;

    InScheduleMode:boolean;

    DeviceType :integer;

    CD : TCopyDataStruct;
//    txt : string;

    Script :TScript;

    HourLast: TDateTime;
    DayLast: TDateTime;

    Targethandle:longint;
    RecToTransfer:TRecToTransfer;
    eksp_nomer:integer;
    Remote, WaitRemoteAnswer : Boolean;
    prm : prmType;
//    ModemFile: file of prmType;
    TypeOfFile:byte;
    Mult_K:single;
    ID_Device:integer;

    CurrentStatus: integer;
    CurrentStage:integer;
    procedure CheckScript;

   end;


  TFooClass = class(TControl);

var
  Master2Form: TMaster2Form;
  prmMD : prmModemType;
  prmMB : prmModbusType;

implementation

uses Param2, Param3, Schedule_u;

{$R *.dfm}
var
  DriverHandle : THandle;
  result : Word;
  Remote, WaitAnswer, Modbus: Boolean;

  Ftm : File of Byte;
  tm : Byte;

procedure TMaster2Form.FormCreate(Sender: TObject);
begin
//  ScaleForm(Master2Form);
  GetDir(0,path);
  WaitAnswer := False;
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
end;

procedure TMaster2Form.btnIdentClick(Sender: TObject);
var
  OpCode, n : Byte;
  m : Word;
begin

  pnStatus.Caption := '';

  if not FileExists(path+'/signurdriver2.exe') then
    begin
     pnStatus.Caption := 'программа-драйвер не найдена';
     if inScheduleMode then
        begin
         Scheduleform.SaveLog(txt);
         close;
        end;

    end
  else
    begin
     pnStatus.Caption := 'ждите...' +CurrentScriptStage.caption;
     Repaint;

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
         m := 2920;
         n := 31;
         OpCode := GET_ARCH_H;
         if Modbus then
           OpCode := GET_ARCH_H_MB;
         if Remote then
           OpCode := GET_ARCH_H_REM;
       end;
     if (Sender=btnArchD) then
       begin
         m := 2202;
         n := 36;
         OpCode := GET_ARCH_D;
         if Modbus then
           OpCode := GET_ARCH_D_MB;
         if Remote then
           OpCode := GET_ARCH_D_REM;
       end;
     if (Sender=btnArchOn) then
       begin
         m := 100;
         n := 50;
         OpCode := GET_ARCH_ON;
         if Modbus then
           OpCode := GET_ARCH_ON_MB;
         if Remote then
           OpCode := GET_ARCH_ON_REM;
       end;
     if (Sender=btnArchOff) then
       begin
         m := 100;
         n := 50;
         OpCode := GET_ARCH_OFF;
         if Modbus then
           OpCode := GET_ARCH_OFF_MB;
         if Remote then
           OpCode := GET_ARCH_OFF_REM;
       end;
     if (Sender=btnArchP) then
       begin
         m := 20;
         n := 8;
         OpCode := GET_ARCH_P;
         if Modbus then
           OpCode := GET_ARCH_P_MB;
         if Remote then
           OpCode := GET_ARCH_P_REM;
       end;
     if (Sender=btnArchErr) then
       begin
         m := 100;
         n := 50;
         OpCode := GET_ARCH_P;
         if Modbus then
           OpCode := GET_ARCH_P_MB;
         if Remote then
           OpCode := GET_ARCH_P_REM;
       end;
     if (Sender=btnTable) then
       OpCode := PUT_TABLE;
     if (Sender=btnSetDT) then
       OpCode := PUT_DT;
     if (OpCode in [GET_ARCH_H,GET_ARCH_D,GET_ARCH_ON,GET_ARCH_OFF,GET_ARCH_P,
                    GET_ARCH_H_MB,GET_ARCH_D_MB,GET_ARCH_ON_MB,GET_ARCH_OFF_MB,GET_ARCH_P_MB,
                    GET_ARCH_H_REM,GET_ARCH_D_REM,GET_ARCH_ON_REM,GET_ARCH_OFF_REM,GET_ARCH_P_REM]
        )  then
       //проверить корректность параметров запроса архива
       begin
         if((meStrNum.Text='')or(StrToInt(meStrNum.Text)=0)or
            (StrToInt(meStrNum.Text)>n)) then
           begin
             txt := 'недопустимое число строк';
              if not inScheduleMode then Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR)
              else
              begin
              Scheduleform.SaveLog(txt);
              close;
              end;
             Exit;
           end;
         if ((meStrInit.Text='')or(StrToInt(meStrInit.Text)=0)or
                   (StrToInt(meStrInit.Text)>m)) then
           begin
             txt := 'недопустимый начальный номер';
              if not inScheduleMode then Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR)
              else
              begin
              Scheduleform.SaveLog(txt);
              close;
              end;
             Exit;
           end;
         if (StrToInt(meStrInit.Text)+StrToInt(meStrNum.Text)>m+1) then
           begin
             txt := 'недопустимое сочетание начального номера и числа строк';
              if not inScheduleMode then Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR)
              else
              begin
              Scheduleform.SaveLog(txt);
              close;
              end;
             Exit;
           end;
       end;
     btnIdent.Enabled := False;
     btnInst.Enabled := False;
     btnMax.Enabled := False;
     btnArchH.Enabled := False;
     btnArchD.Enabled := False;
     btnArchOn.Enabled := False;
     btnArchOff.Enabled := False;
     btnArchP.Enabled := False;
     btnArchErr.Enabled := False;
     btnTable.Enabled := False;
     btnSetDT.Enabled := False;
     btnPrm.Enabled := False;
     Repaint;
     WaitAnswer := Remote or (OpCode in [GET_INST_MB,GET_INST]);
     pnStatus.Caption := 'ждите...' +CurrentScriptStage.Caption;
     txt := path+'/signurdriver2.exe '+IntToStr(Handle)+' '+IntToStr(OpCode);
     if (OpCode in [GET_ARCH_H,GET_ARCH_D,GET_ARCH_ON,GET_ARCH_OFF,GET_ARCH_P,
                    GET_ARCH_H_MB,GET_ARCH_D_MB,GET_ARCH_ON_MB,GET_ARCH_OFF_MB,GET_ARCH_P_MB,
                    GET_ARCH_H_REM,GET_ARCH_D_REM,GET_ARCH_ON_REM,GET_ARCH_OFF_REM,GET_ARCH_P_REM]
        )  then
       txt := txt + ' ' + meStrInit.Text + ' ' + meStrNum.Text;
     result := WinExec(PChar(txt),SW_SHOWMINIMIZED);
     Repaint;
     if result<33 then
       begin
         case result of
               0  :    txt := 'недостаточно памяти';
              11  :    txt := 'программа-драйвер не найдена'
              else     txt := 'некорректный вызов программы-драйвера'
           end;
          if not inScheduleMode then Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR)
              else
              begin
              Scheduleform.SaveLog(txt);
              close;
              end;
         pnStatus.Caption := '';
         btnIdent.Enabled := True;
         btnInst.Enabled := True;
         btnMax.Enabled := True;
         btnArchH.Enabled := True;
         btnArchD.Enabled := True;
         btnArchOn.Enabled := True;
         btnArchOff.Enabled := True;
         btnArchP.Enabled := True;
         btnArchErr.Enabled := True;
         btnTable.Enabled := True;
         btnSetDT.Enabled := True;
         btnModem.Enabled := True;
         WaitAnswer := False;
       end;
    end;
end;

procedure TMaster2Form.btnInstClick(Sender: TObject);
begin
  btnIdentClick(btnInst);
end;

procedure TMaster2Form.btnMaxClick(Sender: TObject);
begin
  btnIdentClick(btnMax);
end;

procedure TMaster2Form.MessageReceiver(var Msg: TWMCopyData);
var
  oc, mess : Integer;
begin
  oc := Msg.CopyDataStruct.dwData;
  fn := PChar(Msg.CopyDataStruct.lpData);
  if (oc=DRIVER_HANDLE) then
      DriverHandle := StrToInt(fn);
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
           MSG_DISTORTION     : pnStatus.Caption :=
                                'искажения в канале связи';
      end;
          if inScheduleMode then
          case  mess of
           REM_MSG_DISCONNECT ,
           REM_MSG_NOMODEM    ,
           REM_MSG_NODIALTONE ,
           REM_MSG_BUSY       ,
           REM_MSG_NOANSWER   ,
           REM_MSG_NONUMBER   ,
           REM_MSG_NOADAPTER  ,
           REM_MSG_NOINSTR    ,
           REM_MSG_DATABREAK ,
           MSG_DISTORTION :  begin
                              Scheduleform.SaveLog(pnStatus.Caption);
                              close;
                             end;
      end;


      if (mess=REM_MSG_CONNECT) then
        Exit;
    end;
  if (oc=LOCAL_CONNECT) then
    begin
      mess := StrToInt(fn);
      case  mess of
           LOC_MSG_NOCONNECT  : pnStatus.Caption :=
                                'соединение не установлено';
           LOC_MSG_DISCONNECT : pnStatus.Caption :=
                                'соединение оборвалось';
           LOC_MSG_NOTECHO    : pnStatus.Caption :=
                                'прибор - не "ЭХО"';
           LOC_MSG_NOTCONFIRM : pnStatus.Caption :=
                                'нет подтверждения приёма';
           LOC_MSG_NOTTABLE   : pnStatus.Caption :=
                                'не найден файл *.tbl';
           LOC_MSG_ARCHEMPTY  : pnStatus.Caption :=
                                'архив пуст';
           MSG_DISTORTION     : pnStatus.Caption :=
                                'искажения в канале связи';
      end;
    if inScheduleMode then
      case  mess of
           LOC_MSG_NOCONNECT ,
           LOC_MSG_DISCONNECT,
           LOC_MSG_NOTECHO   ,
           LOC_MSG_NOTCONFIRM,
           LOC_MSG_NOTTABLE  ,
           LOC_MSG_ARCHEMPTY ,
           MSG_DISTORTION    : begin
                                Scheduleform.SaveLog(pnStatus.Caption);
                                close;
                              end;
      end;
    end;

  case oc of
       GET_ID, GET_ID_MB, GET_ID_REM:
       begin
        if pos('ЭХО Р', fn)>0 then deviceType:=0;
        if pos('ЭХО AC', fn)>0 then deviceType:=1;
        if pos('АКРОН', fn)>0 then deviceType:=2;
       end;
      end;
  case oc of
       GET_ID            :  pnStatus.Caption := fn;
       GET_ID_MB         :  pnStatus.Caption := fn;
       GET_ID_REM        :  pnStatus.Caption := fn;
       GET_INST          :  GetInstMax;
       GET_INST_MB       :  GetInstMax;
       GET_INST_REM      :  GetInstMax;
       GET_MAX           :  GetInstMax;
       GET_MAX_MB        :  GetInstMax;
       GET_MAX_REM       :  GetInstMax;
       GET_ARCH_H        :  GetArch(1);
       GET_ARCH_H_MB     :  GetArch(1);
       GET_ARCH_H_REM    :  GetArch(1);
       GET_ARCH_D        :  GetArch(2);
       GET_ARCH_D_MB     :  GetArch(2);
       GET_ARCH_D_REM    :  GetArch(2);
       GET_ARCH_ON       :  GetArch(3);
       GET_ARCH_ON_MB    :  GetArch(3);
       GET_ARCH_ON_REM   :  GetArch(3);
       GET_ARCH_OFF      :  GetArch(4);
       GET_ARCH_OFF_MB   :  GetArch(4);
       GET_ARCH_OFF_REM  :  GetArch(4);
       GET_ARCH_P        :  GetArch(5);
       GET_ARCH_P_MB     :  GetArch(5);
       GET_ARCH_P_REM    :  GetArch(5);
       PUT_TABLE         :  pnStatus.Caption := 'загружен файл ' + fn;
       PUT_DT            :  pnStatus.Caption := 'установлены дата и время';
       GET_GAUGEPROGRESS :  begin
                             Gauge.Progress := Msg.CopyDataStruct.cbData;
                             Exit;
                            end;
       end;

  if scriptTimer.Enabled then
   case oc of
       GET_ID, GET_ID_MB, GET_ID_REM,
       GET_MAX, GET_MAX_MB,  GET_MAX_REM,
       GET_ARCH_H, GET_ARCH_H_MB, GET_ARCH_H_REM,
       GET_ARCH_D, GET_ARCH_D_MB, GET_ARCH_D_REM,
       GET_ARCH_ON, GET_ARCH_ON_MB, GET_ARCH_ON_REM,
       GET_ARCH_OFF, GET_ARCH_OFF_MB, GET_ARCH_OFF_REM:
        begin
          Script[currentstage].status:=scriptstatus_finished;
          CurrentStatus :=  scriptstatus_finished;
        end;
       end;


  if not(oc in [DRIVER_HANDLE,GET_INST,GET_INST_MB,GET_INST_REM]) then
    begin
      btnIdent.Enabled := True;
      btnInst.Enabled := True;
      btnMax.Enabled := True;
      btnArchH.Enabled := True;
      btnArchD.Enabled := True;
      btnArchOn.Enabled := True;
      btnArchOff.Enabled := True;
      btnArchP.Enabled := True;
      btnArchErr.Enabled := True;
      btnTable.Enabled := True;
      btnSetDT.Enabled := True;
      btnModem.Enabled := True;
      WaitAnswer := False;
    end;
end;

procedure TMaster2Form.GetInstMax;
type
  imType = record
                   h_or_v : Single;
                   q      : Single;
                   vol    : String[10];
                   w      : String[10];
                  end;
var
  im : imType;
  Fim : File of imType;
begin
  if FileExists(fn) then
    begin
      AssignFile(Fim,fn);
      Reset(Fim);
      Read(Fim,im);
      pnStatus.Caption := FloatToStrF(im.h_or_v,ffFixed,7,3);
      if not IsNan(im.q) then
        pnStatus.Caption := pnStatus.Caption + '    '+
                          FloatToStrF(im.q,ffFixed,7,1)+'    '+
                          im.vol+'    '+im.w;
      mult_k:=1;
      Mult_k:=StrtoFloat(im.vol);
        
      if inScheduleMode then  // переписать!!!!
             scheduleform.SaveCurrentValue(im.h_or_v);
      if inScheduleMode then  // переписать!!!!
             scheduleform.SaveMaxValue(im.h_or_v);
      CloseFile(Fim);
      if inScheduleMode then
              begin
              Scheduleform.SaveLog('ОК');
              close;
              end;

    end
  else
    begin
      pnStatus.Caption := '';
      txt := 'не найден файл-посредник';
      if not inScheduleMode then Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR)
              else
              begin
              Scheduleform.SaveLog(txt);
              close;
              end;

    end;
end;

procedure TMaster2Form.GetArch(Type_of_File:byte);
var
  FlagErr : Boolean;
  FDD: TFileStream;
  DataArray: array of byte;
  i:integer;
  isEmpty:boolean;
begin
  pnStatus.Caption := '';
  if not FileExists(fn) then
    begin
      txt := 'не найден файл-посредник';
      if not inScheduleMode then Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR)
              else
              begin
              Scheduleform.SaveLog(txt);
              close;
              end
    end
  else
    begin
// так было в старом драйвере
   RecToTransfer.FName:=FN{OD.Filename};
   RecToTransfer.otherdata:=eksp_nomer;  // код записи в архиве, для который передаются данные
   RecToTransfer.TypeOfFile:=Type_of_File;
   RecToTransfer.Mult_k:=Mult_k;
   CD.lpData := @RecToTransfer;
   CD.dwData :=length(RecToTransfer.Fname);
   cd.cbData := sizeof(RecToTransfer);
   if not ScriptTimer.enabled then
     hide;
   update;
   if ScriptTimer.enabled then
    begin
     FDD := TFileStream.Create(FN, fmOpenRead);
     Setlength(dataArray,fdd.Size);
     fdd.Read(dataarray[0],fdd.size);
     isEmpty:=true;
     for i:=0 to length(Dataarray)-1 do
       isEmpty:=isEmpty and (dataArray[i]=255);
     setlength(dataarray,0);
     FDD.destroy;
     if isEmpty then
       for i:=CurrentStage+1 to length(script)-1 do
         begin
          if script[i].what = script[CurrentStage].what
           then
             script[i].status:=scriptStatus_finished
           else
             begin
              CurrentStage:=i-1;
              break
             end;
       end;  // isempty;
     end; //if ScriptTimer.enabled
   sendMessage(TargetHandle, WM_COPYDATA, Handle, integer(@CD));
   if inScheduleMode then  scheduleform.SaveLog('ОК');
   if not ScriptTimer.enabled then
    close;
   exit;
//-----

// это код Виктора
      if SaveDialog.Execute then
        begin
          Cursor := crHourGlass;
          CopyFile(PChar(fn),PChar(SaveDialog.FileName),FlagErr);
          Cursor := crDefault;
        end;
//----
    end;
end;

procedure TMaster2Form.btnArchDClick(Sender: TObject);
begin
  btnIdentClick(btnArchD);
end;

procedure TMaster2Form.btnArchHClick(Sender: TObject);
begin
  btnIdentClick(btnArchH);
end;

procedure TMaster2Form.btnArchOnClick(Sender: TObject);
begin
  btnIdentClick(btnArchOn);
end;

procedure TMaster2Form.btnArchOffClick(Sender: TObject);
begin
  btnIdentClick(btnArchOff);
end;

procedure TMaster2Form.btnArchPClick(Sender: TObject);
begin
  btnIdentClick(btnArchP);
end;

procedure TMaster2Form.btnArchErrClick(Sender: TObject);
begin
  btnIdentClick(btnArchErr);
end;

procedure TMaster2Form.btnTableClick(Sender: TObject);
begin
  btnIdentClick(btnTable);
end;

procedure TMaster2Form.btnSetDTClick(Sender: TObject);
begin
  btnIdentClick(btnSetDT);
end;

procedure TMaster2Form.btnPrmClick(Sender: TObject);
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
    end   ;

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

procedure TMaster2Form.btnModemClick(Sender: TObject);
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
  btnSetDT.Enabled := False;
  btnPrm.Enabled := True;
  BreakConnection;
end;

procedure TMaster2Form.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  BreakConnection;
  AssignFile(Ftm,path+TEST_MODE_FILENAME);
  Rewrite(Ftm);
  Write(Ftm,tm);
  CloseFile(Ftm);
end;

procedure TMaster2Form.btnModbusClick(Sender: TObject);
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
  btnSetDT.Enabled := False;
  btnPrm.Enabled := True;
  BreakConnection;
end;

procedure TMaster2Form.btnLocalClick(Sender: TObject);
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

procedure TMaster2Form.BreakConnection;
begin
  if WaitAnswer then
    begin
      WaitAnswer := False;
      txt := IntToStr(MSG_ESCAPE);
      CD.dwData := REMOTE_CONNECT;
      CD.cbData := StrLen(PChar(txt)) + 1;
      CD.lpData := PChar(txt);
      SendMessage(DriverHandle,WM_COPYDATA,DriverHandle,DWORD(@CD));
      pnStatus.Caption :='';
      btnIdent.Enabled := True;
      btnInst.Enabled := True;
      btnMax.Enabled := True;
      btnPrm.Enabled := True;
      btnArchH.Enabled := True;
      btnArchD.Enabled := True;
      btnArchOn.Enabled := True;
      btnArchOff.Enabled := True;
      btnArchP.Enabled := True;
      btnArchErr.Enabled := True;
    end;
end;

procedure TMaster2Form.ScaleForm(F: TForm);
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

procedure TMaster2Form.cbAlwaysOnTopClick(Sender: TObject);
begin
 if cbAlwaysOnTop.checked then FormStyle:=fsStayOnTop
  else Formstyle:=fsNormal;
end;

procedure TMaster2Form.BitBtn1Click(Sender: TObject);
var
 N_Hour, N_Day, N_Day_Batch, N_Hour_Batch:integer;
 i:integer;
begin
// создать скрипт ToDO
// сколько нужно отсчетов почасовых значенимй?
N_Hour := trunc(now * 24)-trunc(Hourlast * 24);
if N_Hour > Limit_H then N_Hour :=Limit_H;
// сколько нужно пакетов для чтения часовых отсчетов?
N_Hour_Batch :=(N_Hour div Max_H) +1;

// сколько нужно отсчетов суточных значенимй?
N_Day := trunc(now)-trunc(Daylast);
if N_Day > Limit_D then N_Day :=Limit_D;
// сколько нужно пакетов для чтения суточных отсчетов?
N_Day_Batch :=(N_Day div Max_D) +1;

setlength(Script,1{чтение ID}+1{чтение Max}+N_Hour_Batch+N_Day_Batch+2{чтение включений}+2{чтение отключений});
script[0].what:=Get_ID;
script[0].Status:=ScriptStatus_Wait;
script[1].what:=Get_Max;
script[1].Status:=ScriptStatus_Wait;
for i:=0 to N_Hour_Batch-1 do
 begin
  script[2+i].what:=Get_H;
  script[2+i].Status:=ScriptStatus_Wait;
  script[2+i].start:=1+Max_H*i;
  script[2+i].Max:=Max_H;
 end;
for i:=0 to N_Day_Batch-1 do
 begin
  script[2+N_Hour_Batch+i].what:=Get_D;
  script[2+N_Hour_Batch+i].Status:=ScriptStatus_Wait;
  script[2+N_Hour_Batch+i].start:=1+Max_D*i;
  script[2+N_Hour_Batch+i].Max:=Max_D;
 end;
for i:=0 to 2-1 do
 begin
  script[2+N_Hour_Batch+N_Day_Batch+i].what:=Get_On;
  script[2+N_Hour_Batch+N_Day_Batch+i].Status:=ScriptStatus_Wait;
  script[2+N_Hour_Batch+N_Day_Batch+i].start:=1+Max_On*i;
  script[2+N_Hour_Batch+N_Day_Batch+i].Max:=Max_On;
 end;
for i:=0 to 2-1 do
 begin
  script[2+N_Hour_Batch+N_Day_Batch+2+i].what:=Get_Off;
  script[2+N_Hour_Batch+N_Day_Batch+2+i].Status:=ScriptStatus_Wait;
  script[2+N_Hour_Batch+N_Day_Batch+2+i].start:=1+Max_Off*i;
  script[2+N_Hour_Batch+N_Day_Batch+2+i].Max:=Max_Off;
 end;
 CurrentStatus:=ScriptStatus_Wait;
 CurrentStage:=0;
 scripttimer.Enabled:=true;
end;

procedure TMaster2Form.ScriptTimerTimer(Sender: TObject);
begin
 CheckScript;
end;

procedure TMaster2Form.CheckScript;
var
 i:integer;
 Finished_Count:integer;
begin
 Finished_Count:=0;
 case CurrentStatus of
   scriptStatus_wait:
     for i:=0 to length(script)-1 do
      begin
       if script[i].status =scriptStatus_wait then  begin
         script[i].status:=scriptStatus_started;
         CurrentStatus:=scriptStatus_Started;
         CurrentStage:=i;
         case script[i].what of
          get_ID: btnIdentClick(btnIdent);
          get_Max: begin
                    CurrentScriptStage.Caption:='чтение максимумов';
                    btnIdentClick(btnMax);
                    end;
          get_H: begin meStrInit.Text:=inttostr(script[i].start);
                       meStrNum.Text:=inttostr(script[i].Max);
                       CurrentScriptStage.Caption:='чтение часового архива';
                       btnIdentClick(btnArchH);
                 end;
          get_D: begin meStrInit.Text:=inttostr(script[i].start);
                       meStrNum.Text:=inttostr(script[i].Max);
                       CurrentScriptStage.Caption:='чтение суточного архива';
                       btnIdentClick(btnArchD);
                 end;
          get_On: begin  meStrInit.Text:=inttostr(script[i].start);
                          meStrNum.Text:=inttostr(script[i].Max);
                          CurrentScriptStage.Caption:='чтение архива включений';
                          btnIdentClick(btnArchOn);
                 end;
          get_Off: begin  meStrInit.Text:=inttostr(script[i].start);
                          meStrNum.Text:=inttostr(script[i].Max);
                          CurrentScriptStage.Caption:='чтение архива выключений';
                          btnIdentClick(btnArchOff);
                   end;
         end;  //script[i].what
         update;
         exit;
       end; {if script[i].status =scriptStatus_wait}
    end; //for i:=0 to length(script)-1   Для случая  scriptStatus_wait
  scriptStatus_started:
    for i:=0 to length(script)-1 do
      begin
       if script[i].status =scriptStatus_started then  begin
         case script[i].what of
          get_ID: CurrentScriptStage.Caption:='чтение ID';
          get_Max: CurrentScriptStage.Caption:='чтение максимумов';
          get_H: CurrentScriptStage.Caption:='чтение часового архива';
          get_D: CurrentScriptStage.Caption:='чтение суточного архива';
          get_On:CurrentScriptStage.Caption:='чтение архива включений';
          get_Off:CurrentScriptStage.Caption:='чтение архива выключений';
         end;  //script[i].what
         CurrentScriptStage.update;
         exit;
       end; {if script[i].status =scriptStatus_wait}
    end; //for i:=0 to length(script)-1   Для случая  scriptStatus_started
  scriptStatus_finished:
        begin
         case script[CurrentStage].what of
          get_ID: CurrentScriptStage.Caption:='ID прочитан';
          get_Max: CurrentScriptStage.Caption:='максимумы прочитаны';
          get_H: CurrentScriptStage.Caption:='часовой архив прочитан';
          get_D: CurrentScriptStage.Caption:='суточный архив прочитан';
          get_On:CurrentScriptStage.Caption:='архив включений прочитан';
          get_Off:CurrentScriptStage.Caption:='архив выключений прочитан';
         end;
       update;
       CurrentStage:=currentstage+1;         // переход к следующему этапу
       if CurrentStage=length(script) then
       begin
        CurrentScriptStage.Caption:='все прочитано';
        scriptTimer.Enabled:=false;
        update;
        sleep(1000);
        close;
       end else  CurrentStatus:=   scriptStatus_wait;
 //      exit;
      end; //    if script[i].status =scriptStatus_finished

 end; //  case CurrentStatus of
end;


procedure TMaster2Form.FormHide(Sender: TObject);
begin
 //showmessage('hide');
end;

procedure TMaster2Form.btnLoadInfoFromDeviceClick(Sender: TObject);
begin
 close;
end;

end.
