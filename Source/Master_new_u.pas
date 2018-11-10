unit Master_new_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Gauges, ExtCtrls, cxLookAndFeelPainters,
  cxButtons, tvc_u, PropFilerEh, PropStorageEh;

const

  GET_ID             = $c1;
  GET_INST           = $c2;
  GET_MAX            = $c3;
  GET_ARCH           = $c4;
  GET_ID_REM         = $c8;
  GET_INST_REM       = $c9;
  GET_MAX_REM        = $ca;
  GET_ARCH_REM       = $cb;

  GET_GAUGEPROGRESS  = $c0;
  REMOTE_CONNECT     = $c5;
  LOCAL_CONNECT      = $c7;
  DRIVER_HANDLE      = $c6;

  WM_COPYDATA        = $004a;

  LOC_MSG_NOCONNECT  = 0;
  LOC_MSG_DISCONNECT = 1;

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

  MSG_ESCAPE         = 10;
  MSG_DISTORTION     = 11;

  REM_CONN_FILENAME = '/modem';


type

  prmType = record
                   Tone     : byte;
                   PhoneNmb : String[20];
                   Access   : Integer
                  end;

  TMasterNewForm = class(TForm)
    Panel1: TPanel;
    Gauge: TGauge;
    btnInst: TcxButton;
    btnMax: TcxButton;
    btnIdent: TcxButton;
    SaveDialog: TSaveDialog;
    btnArch: TcxButton;
    Timer: TTimer;
    pnStatus: TPanel;
    Panel2: TPanel;
    cbRepeated: TComboBox;
    cbRepeatedRead: TCheckBox;
    btnModem: TSpeedButton;
    btnLoadInfoFromDevice: TcxButton;
    cbAlwaysOnTop: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnIdentClick(Sender: TObject);
    procedure MessageReceiver(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure GetInstMax;
    procedure GetArch(Type_Of_File:byte);
    procedure btnInstClick(Sender: TObject);
    procedure btnMaxClick(Sender: TObject);
    procedure btnArchClick(Sender: TObject);
    procedure btnModem_Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbRepeatedReadClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure cbAlwaysOnTopClick(Sender: TObject);
    procedure btnLoadInfoFromDeviceClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
procedure MSGEscape(Sender: TObject);
  public
    { Public declarations }
    CD : TCopyDataStruct;
    txt : string;
    Targethandle:longint;
    RecToTransfer:TRecToTransfer;
    eksp_nomer:integer;

    Remote, WaitRemoteAnswer : Boolean;
    prm : prmType;
    ID_Device:integer;
    deviceType: integer;
    Type_Connect:integer;

    DriverHandle : THandle;
    path, fn : string;
    result : Word;
    ModemFile,Fprm : File of prmType;
    InScheduleMode:boolean;
    
   end;
 // 1 ����� - ��������, �/c
 //   1 ���   �������, �
 //    2 ������, ���.�/���






var
  MasterNewForm: TMasterNewForm;


implementation

uses Main_f, Schedule_u;

//uses Param;

{$R *.dfm}


procedure TMasterNewForm.FormCreate(Sender: TObject);
begin
  GetDir(0,path);
  Remote := False;
  WaitRemoteAnswer := False;
end;

procedure TMasterNewForm.btnIdentClick(Sender: TObject);
var
  OpCode : Byte;
begin
//memo1.lines.clear;
  FormStyle:=fsNormal;
  pnStatus.Font.color:=clBlack;
  pnStatus.Caption := '';
  if not FileExists(path+'/signurdriver1.exe') then
    begin
      txt := '���������-������� signurdriver1.exe �� �������';
      if not inScheduleMode then Application.MessageBox(PChar(txt),'������',MB_ICONERROR)
       else
        begin
         Scheduleform.SaveLog(txt);
         close;
        end;
      exit;
    end
  else
    begin
     btnIdent.Enabled := False;
     btnInst.Enabled := False;
     btnMax.Enabled := False;
     btnArch.Enabled := False;
     WaitRemoteAnswer := Remote;
     pnStatus.Caption := '�����...';
     Repaint;
     MSGEscape (sender);
     if (sender=btnIdent) then
     begin
      if Remote then  OpCode := GET_ID_REM
                 else OpCode := GET_ID;
     end;
     if (Sender=btnInst) then
       begin
         FormStyle:=fsStayOnTop;
         if Remote then OpCode := GET_INST_REM
                 else  OpCode := GET_INST;
       end;
     if (Sender=btnMax) then
       begin
         if Remote then  OpCode := GET_MAX_REM
              else    OpCode := GET_MAX;
       end;
     if (Sender=btnArch) then
       begin
         if Remote then  OpCode := GET_ARCH_REM
         else OpCode := GET_ARCH;
       end;
     txt := path+'/signurdriver1.exe '+IntToStr(Handle)+' '+IntToStr(OpCode);
     Repaint;
     result := WinExec(PChar(txt),SW_SHOWMINIMIZED);
     if (OpCode in [GET_ID_REM,GET_INST_REM,GET_MAX_REM,GET_ARCH_REM]) then
       btnModem.Enabled := True;
     Repaint;
     if result<33 then
       begin
         case result of
               0  :    txt := '������������ ������';
              11  :    txt := '���������-������� �� �������'
              else     txt := '������������ ����� ���������-��������'
           end;
         if not inScheduleMode then Application.MessageBox(PChar(txt),'������ ������ ��������� ��������',MB_ICONERROR)
         else
          begin
           Scheduleform.SaveLog('������ ������ ��������� ��������: '+txt);;
           close;
          end;
         pnStatus.Caption := '';
         btnIdent.Enabled := True;
         btnInst.Enabled := True;
         btnMax.Enabled := True;
         btnArch.Enabled := True;
         btnModem.Enabled := True;
         WaitRemoteAnswer := False;
         Repaint;
       end;
    end;
end;

procedure TMasterNewForm.btnInstClick(Sender: TObject);
begin
  btnIdentClick(btnInst);
end;

procedure TMasterNewForm.btnMaxClick(Sender: TObject);
begin
  btnIdentClick(btnMax);
end;

procedure TMasterNewForm.btnArchClick(Sender: TObject);
begin
  btnIdentClick(btnArch);
end;

procedure TMasterNewForm.MessageReceiver(var Msg: TWMCopyData);
var
  oc, mess : Integer;
  txt:string;
begin
  pnStatus.Font.Color:=clRed;
  oc := Msg.CopyDataStruct.dwData;
  fn := PChar(Msg.CopyDataStruct.lpData);
//memo1.lines.insert(0,'oc = '+inttostr(oc)+' fn='+fn+'              '+formatdatetime('hh:mm:ss', now));

  if (oc=DRIVER_HANDLE) then
      begin
       Type_Connect:=oc;
       DriverHandle := StrToInt(fn);
//       pnStatus.Caption := 'DriverHandle='+fn;
     end;
  if (oc=REMOTE_CONNECT) then
    begin
      try
       Type_Connect:=oc;
       mess := StrToInt(fn);
       except  on e:exception  do
        begin
         txt:='����� ��������� �� �������� REMOTE_CONNECT. ������������ �������� fn: '+e.message;
         if not inScheduleMode then showmessage(txt)
         else
        begin
         scheduleForm.SaveLog(txt);
         close;
         end;
         FormStyle:=fsNormal;
        end;
       end; //try
       case  mess of
           REM_MSG_CONNECT    : pnStatus.Caption :=
                                '����������� �������� ����������';
           REM_MSG_DISCONNECT : pnStatus.Caption :=
                                '�������� ���������� ���������';
           REM_MSG_NOMODEM    : pnStatus.Caption :=
                                '����� �� ������';
           REM_MSG_NODIALTONE : pnStatus.Caption :=
                                '��� �����';
           REM_MSG_BUSY       : pnStatus.Caption :=
                                '������';
           REM_MSG_NOANSWER   : pnStatus.Caption :=
                                '��������� ����� �� ��������';
           REM_MSG_NONUMBER   : pnStatus.Caption :=
                                '�� ������ ���������� �����';
           REM_MSG_NOADAPTER  : pnStatus.Caption :=
                                '������� ���������� ������ �� ��������';
           REM_MSG_NOINSTR    : pnStatus.Caption :=
                                '��������� ������ �� ��������';
           REM_MSG_DATABREAK  : pnStatus.Caption :=
                                '�������� ������ ����������';
           MSG_DISTORTION     : pnStatus.Caption :=
                                '��������� � ������ �����';
      end;
      case  mess of
           REM_MSG_CONNECT,
           REM_MSG_DISCONNECT,
           REM_MSG_NOMODEM,
           REM_MSG_NODIALTONE,
           REM_MSG_BUSY,
           REM_MSG_NOANSWER,
           REM_MSG_NONUMBER,
           REM_MSG_NOADAPTER,
           REM_MSG_NOINSTR,
           REM_MSG_DATABREAK,
           MSG_DISTORTION: FormStyle:=fsStayOnTop;
      end;
      if inScheduleMode then
       case  mess of
//           REM_MSG_CONNECT,
//           REM_MSG_DISCONNECT,
           REM_MSG_NOMODEM,
           REM_MSG_NODIALTONE,
           REM_MSG_BUSY,
           REM_MSG_NOANSWER,
           REM_MSG_NONUMBER,
           REM_MSG_NOADAPTER,
           REM_MSG_NOINSTR,
           REM_MSG_DATABREAK,
           MSG_DISTORTION:
            begin
             scheduleform.SaveLog(pnStatus.Caption);
             close;
            end;
//          end;
      end;
     if not(Msg.CopyDataStruct.cbData=REM_MSG_CONNECT) then  WaitRemoteAnswer := False;
   end;  //if (oc=REMOTE_CONNECT)
  Repaint;
  if (oc=LOCAL_CONNECT) then
    begin
      Type_Connect:=oc;
      mess := StrToInt(fn);
      case  mess of
           LOC_MSG_NOCONNECT  : pnStatus.Caption :=
                                '���������� �� �����������';
           LOC_MSG_DISCONNECT : pnStatus.Caption :=
                                '���������� ����������';
           MSG_DISTORTION     : pnStatus.Caption :=
                                '��������� � ������ �����';
      end;
      if not(Msg.CopyDataStruct.cbData=REM_MSG_CONNECT) then
        begin
         WaitRemoteAnswer := False;
        end;
      case  mess of
           LOC_MSG_NOCONNECT,
           LOC_MSG_DISCONNECT,
           MSG_DISTORTION:
            begin
             FormStyle:=fsStayOnTop;
             if inScheduleMode then
             begin
               scheduleform.SaveLog(pnStatus.Caption);
               close;
              end;
            end;
      end;
    end;  //  if (oc=LOCAL_CONNECT)
  case oc of
       GET_ID            :  pnStatus.Caption := '��� �������������� = '+ fn;
       GET_ID_REM        :  pnStatus.Caption := '��� �������������� = '+ fn;
       GET_INST          :  GetInstMax;
       GET_INST_REM      :  GetInstMax;
       GET_MAX           :  GetInstMax;
       GET_MAX_REM       :  GetInstMax;
       GET_ARCH          :  GetArch(0);
       GET_ARCH_REM      :  GetArch(0);
       GET_GAUGEPROGRESS :  begin
                             Gauge.Progress := Msg.CopyDataStruct.cbData;
                             Exit;
                            end;
       end;

  if not(oc=DRIVER_HANDLE) then
    begin
      btnIdent.Enabled := True;
      btnInst.Enabled := True;
      btnMax.Enabled := True;
      btnArch.Enabled := True;
      btnModem.Enabled := True;
    end;
  Repaint;
end;

procedure TMasterNewForm.GetInstMax;
var
  Fsingle : File of Single;
  fp : Single;
begin
  pnStatus.Font.color:=clBlack;
  if FileExists(fn) then
    begin
      AssignFile(Fsingle,fn);
      Reset(Fsingle);
      Read(Fsingle,fp);
      if inScheduleMode then
             scheduleform.SaveCurrentValue(fp);
 //     pnStatus.Caption := FloatToStrF(fp,ffFixed,7,3) + '    ';
      case devicetype of
          0,1: pnStatus.Caption := '�������, �  = '+FloatToStrF(fp,ffFixed,7,3);
          2:   pnStatus.Caption := '��������, �/c  = '+FloatToStrF(fp,ffFixed,7,3);
       end;
      Read(Fsingle,fp);
      pnStatus.Caption := pnStatus.Caption + ' ������,���.�/��� = '+FloatToStrF(fp,ffFixed,7,1);
      CloseFile(Fsingle);
      if inScheduleMode then
            begin
             scheduleform.SaveMaxValue(fp);
             Scheduleform.SaveLog('��');
             close;
            end;
    end
  else
    begin
      pnStatus.Caption := '';
      txt := '�� ������ ����-���������';
      if not inScheduleMode then Application.MessageBox(PChar(txt),'������',MB_ICONERROR)
             else
        begin
         scheduleform.SaveLog(txt);
         close;
        end;
    end;
end;

procedure TMasterNewForm.GetArch(Type_of_File:byte);
var
  FlagErr : Boolean;
begin
  pnStatus.Font.color:=clBlack;
  pnStatus.Caption := '';
  if not FileExists(fn) then
    begin
      txt := '�� ������ ����-���������';
      if not inScheduleMode then    Application.MessageBox(PChar(txt),'������',MB_ICONERROR)
             else
        begin
         scheduleform.SaveLog(txt);
         close;
        end;
    end
  else
  begin
   RecToTransfer.FName:=FN{OD.Filename};
   RecToTransfer.otherdata:=eksp_nomer;  // ��� ������ � ������, ��� ������� ���������� ������
   RecToTransfer.TypeOfFile:=Type_Of_File;
   CD.lpData := @RecToTransfer;
   CD.dwData :=length(RecToTransfer.Fname);
//   CD.dwData := sizeof(RecToTransfer);
   cd.cbData := sizeof(RecToTransfer);
   hide;    update;
   sendMessage(TargetHandle, WM_COPYDATA, Handle, integer(@CD));
   if inScheduleMode then  scheduleform.SaveLog('��');
   close;
   end
end;

procedure TMasterNewForm.btnModem_Click(Sender: TObject);
//���������/��������� ����� ����� �����
begin
      if WaitRemoteAnswer then
        begin
          WaitRemoteAnswer := False;
          txt := IntToStr(MSG_ESCAPE);
          CD.dwData := REMOTE_CONNECT;
          CD.cbData := StrLen(PChar(txt)) + 1;
          CD.lpData := PChar(txt);
          SendMessage(DriverHandle,WM_COPYDATA,DriverHandle,DWORD(@CD));
          pnStatus.Caption :='';
          btnIdent.Enabled := True;
          btnInst.Enabled := True;
          btnMax.Enabled := True;
          btnArch.Enabled := True;
//          if not inScheduleMode then Showmessage('�������� ������� �� ��������� �������� ������ �������');
        end
         else
          begin
  //         if not inScheduleMode then  Showmessage('�������� ������ � ��������� ������ �� �����������');
          end;
end;

procedure TMasterNewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 timer.Enabled:=false;
 Formstyle:=fsNormal;
 cbRepeatedRead.Checked:=false;
 MSGEscape(nil);
end;

procedure TMasterNewForm.cbRepeatedReadClick(Sender: TObject);
begin
 timer.Enabled:=cbRepeatedRead.checked;
 if cbRepeatedRead.checked then  cbAlwaysOnTop.Checked:= true;
 if cbRepeatedRead.checked then btnIdentClick(btnInst);
end;

procedure TMasterNewForm.TimerTimer(Sender: TObject);
begin
 btnIdentClick(btnInst);
end;

procedure TMasterNewForm.cbAlwaysOnTopClick(Sender: TObject);
begin
 if cbAlwaysOnTop.checked then FormStyle:=fsStayOnTop
  else Formstyle:=fsNormal;
end;

procedure TMasterNewForm.btnLoadInfoFromDeviceClick(Sender: TObject);
begin
 cbRepeatedRead.Checked:=false;
 close;
end;

procedure TMasterNewForm.MSGEscape(Sender: TObject);
begin
timer.Enabled:=false;
if driverhandle<>0 then
 begin
      txt := IntToStr(MSG_ESCAPE);
      CD.dwData := Type_Connect;
      CD.cbData := StrLen(PChar(txt)) + 1;
      CD.lpData := PChar(txt);
      Repaint;
//      beep;
      SendMessage(DriverHandle,WM_COPYDATA,DriverHandle,DWORD(@CD));
      driverhandle:=0;
      Repaint;
//      if sender<>nil then Sleep(6000);
//      beep;
 end;
end;

procedure TMasterNewForm.FormDestroy(Sender: TObject);
begin
MSGEscape(nil);
end;

end.
