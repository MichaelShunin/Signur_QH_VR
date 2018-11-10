unit master_ftp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, tvc_u, Gauges;

type
  TmasterFTP_Form = class(TForm)
    pnContr: TPanel;
    pnMess: TPanel;
    btnLoad: TSpeedButton;
    lbInstr: TLabel;
    lbSN: TLabel;
    cbInstr: TComboBox;
    meSN: TMaskEdit;
    Timer: TTimer;
    cbAlwaysOnTop: TCheckBox;
    pnStatus: TPanel;
    mm: TMemo;
    Gauge: TGauge;
    Timerclose: TTimer;
    btnCancel: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure MessageReceiver(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure SendMessageToExpForm(FN:string; TypeOfFile:Integer; Chan:smallInt);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimercloseTimer(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CD : TCopyDataStruct;
    txt : string;
    Device_ID:integer;
    eksp_nomer:Integer;
    deviceType:Integer;
    TargetHandle:THandle;

    RecToTransfer:TRecToTransfer;
    HourLast: TDateTime;
    DayLast:TDateTime;

    dir:string;
  end;

var
  masterFTP_Form: TmasterFTP_Form;

implementation

uses Exp_f;

{$R *.dfm}

const
  DRIVER_HANDLE         = $80;
  ON_CONNECT            = $81;
  ON_UPDATE             = $82;

  MSG_NO_HOST           = 1;
  MSG_FAIL_CONNECT      = 2;
  MSG_NO_INSTR          = 3;
  MSG_NO_FILE           = 4;
  MSG_NO_CMND_EXE       = 5;

   GET_GAUGEPROGRESS  = $c0;

  MSG_FAILURE           = 6;
  MSG_FILE_FORMATT_ERR1 = 7;
  MSG_FILE_FORMATT_ERR2 = 8;
  MSG_FILE_FORMATT_ERR3 = 9;
  MSG_NO_UPD            = 0;
  MSG_H_UPD             = 1;
  MSG_D_UPD             = 2;
  MSG_ONOFF_UPD         = 4;
  MSG_H2_UPD            = 8;
  MSG_D2_UPD            = $10;

  WM_COPYDATA        = $004a;

   ESC_CMND  = $d0  ;

var
  DriverHandle : THandle;
  path,fn,s : string;
  result : Word;
  DriverAnswer : Boolean;
  id : Byte;

//______________________________________________________________________________
procedure TmasterFTP_Form.FormActivate(Sender: TObject);
begin
  GetDir(0,path);
 // path := path + '\FTP_DATA\';
   path := path + '\';
end;

//______________________________________________________________________________
procedure TmasterFTP_Form.btnLoadClick(Sender: TObject);

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
            mm.Lines.Add('удаление файла '+path + '\' + sr.name) ;
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
      mm.Lines.Add('удаление каталога  '+path) ;
    end;

begin
  pnStatus.caption:='Обращение к драйверу FTP...';
  Timerclose.Enabled:=False;
  pnMess.Caption:=''; pnMess.Update;
  pnstatus.update; 
  btnLoad.Enabled := False;
  case cbInstr.ItemIndex of
                0 :  begin
                       id := 0;
                       dir := 'A1_'+meSN.Text;
                         RemoveAll(ExtractFilePath(Application.ExeName)+'\FTP_DATA\'+Dir+'\0');
                     end;
                1 :  begin
                       id := 6;
                       dir := 'A1_'+meSN.Text;
                       RemoveAll(ExtractFilePath(Application.ExeName)+'\FTP_DATA\'+Dir+'\0');
                     end;
                2 :  begin
                       id := 5;
                       dir := 'A2_'+meSN.Text;
                       RemoveAll(ExtractFilePath(Application.ExeName)+'\FTP_DATA\'+Dir+'\1');
                       RemoveAll(ExtractFilePath(Application.ExeName)+'\FTP_DATA\'+Dir+'\2')
                     end;
                3 :  begin
                       id := 6;
                       dir := 'A1_'+meSN.Text;
                       RemoveAll(ExtractFilePath(Application.ExeName)+'\FTP_DATA\'+Dir+'\0');
                     end;

                4 :  begin
                       id := 2;
                       dir := 'EQ_'+meSN.Text;  
                       RemoveAll(ExtractFilePath(Application.ExeName)+'\FTP_DATA\'+Dir+'\0');
                     end;
                5 :  begin
                       id := 1;
                       dir := 'EQ_'+meSN.Text;
                       RemoveAll(ExtractFilePath(Application.ExeName)+'\FTP_DATA\'+Dir+'\0');
                     end;
               end;
  pnstatus.Caption := 'ожидание ответа от FT-сервера....'; pnStatus.Update;
  s := path+'signurdriverftp.exe '+IntToStr(Handle)+' '+IntToStr(id)+' '+ meSN.Text;
//  s := path+'SignurLoader.exe '+IntToStr(Handle)+' '+IntToStr(id)+' '+ meSN.Text;
  mm.Lines.Add(formatdatetime('hh:mm:ss:dss', now)+' обращение к SignurDriverFTP'+ '     ID  = '+IntToStr(id)+'   SN='+ meSN.Text);
 //    mm.Lines.Add(formatdatetime('hh:mm:ss:dss', now)+' обращение к SignurLoader'+ '     ID  = '+IntToStr(id)+'   SN='+ meSN.Text);

 result := WinExec(PChar(s),SW_SHOWMINIMIZED);
   Repaint;
  if result<33 then
    begin
      case result of
              ERROR_FILE_NOT_FOUND :    s := 'программа-драйвер не найдена'
              else                      s := 'некорректный вызов программы-драйвера';
           end;
      Application.MessageBox(PChar(s),'Ошибка',MB_ICONERROR);
      pnMess.Caption := '';  pnMess.Update;
      btnLoad.Enabled := True;
    end
  else
    Timer.Enabled := True;

end;

//______________________________________________________________________________
procedure TmasterFTP_Form.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := False;
  if not DriverAnswer then
    begin
      s := 'программа-драйвер не отвечает';
      Application.MessageBox(PChar(s),'Ошибка',MB_ICONERROR);
      pnMess.Caption := '';
      btnLoad.Enabled := True;
    end;
end;

//______________________________________________________________________________
procedure TmasterFTP_Form.MessageReceiver(var Msg: TWMCopyData);
var
  oc, mess : Integer;
  fn:string;
begin
  DriverAnswer:= True;
  oc := Msg.CopyDataStruct.dwData;
 // caption:=Caption+' '+inttostr(OC);
  fn := PChar(Msg.CopyDataStruct.lpData);
    if (oc=GET_GAUGEPROGRESS) then
    begin
      Gauge.Progress := Msg.CopyDataStruct.cbData;
      Exit;
    end;
    if (oc=ESC_CMND) then
    begin
       pnMess.Caption:='Отмена сеанса связи, подтверждено';    pnMess.Update;
       Timerclose.Enabled:=True;
      Exit;
    end;
  if (oc=DRIVER_HANDLE) then
   begin
     DriverHandle := StrToInt(fn);
     pnStatus.Caption   := 'Драйвер сообщил handle.  Ожидание данных...';
     pnStatus.Update;
    end ;
  mess := StrToInt(fn);
  
  mm.Lines.Add(formatdatetime('hh:mm:ss:dss', now)+' принято OC  = '+inttostr(OC)+'    mess = '+ fn+ '     ID  = '+IntToStr(id));
  if (oc=ON_CONNECT) then
    begin
      case  mess of
           MSG_NO_HOST          : pnMess.Caption :=
                                  'invalid host';
           MSG_FAIL_CONNECT     : pnMess.Caption :=
                                  'connection failure';
           MSG_NO_INSTR         : pnMess.Caption :=
                                  'no instrument '+dir;
           MSG_NO_FILE          : pnMess.Caption :=
                                  'file not found';
           MSG_NO_CMND_EXE      : pnMess.Caption :=
                                  'FTP command not performed';
           MSG_FAILURE          : pnMess.Caption :=
                                  'FTP session failure';
           MSG_FILE_FORMATT_ERR1: pnMess.Caption :=
                                  'file format error 1';
           MSG_FILE_FORMATT_ERR2: pnMess.Caption :=
                                  'file format error 2';
           MSG_FILE_FORMATT_ERR3: pnMess.Caption :=
                                  'file format error 3';
        

      end;
       pnStatus.Caption   := 'Данные не загружены';
       pnStatus.Update;
       pnMess.Update;
        Timerclose.Enabled:=True;
     end;
  if (oc=ON_UPDATE) then
    begin
     if mess=MSG_FAILURE then
       begin
         pnMess.Caption := 'file system error'  ;   pnMess.Update;
          Timerclose.Enabled:=True;
       end else
     if mess=MSG_NO_UPD then
        pnMess.Caption := 'Нет обновления данных на сервере после предыдущего чтения' // 'no update';
      else
        begin
          if (mess and MSG_H_UPD = MSG_H_UPD) then
            begin
              if id=5 then
              begin
                 pnMess.Caption := pnMess.Caption+'  temp_h(1)  ';   pnMess.Update;
                 fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\1\Temp_h' ;
                 SendMessageToExpForm(fn, 1,1);
              end
              else
               begin
                 pnMess.Caption :=pnMess.Caption+ '  temp_h  ';      pnMess.Update;
                 fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\0\temp_h' ;
                 SendMessageToExpForm(fn, 1,0);
               end
            end;
          if (mess and MSG_D_UPD = MSG_D_UPD) then
            begin
              if id=5 then
                begin
                 pnMess.Caption := pnMess.Caption+' temp_d(1)  ';    pnMess.Update;
                 fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\1\Temp_d' ;
                 SendMessageToExpForm(fn, 2,1);
                end
              else
               begin
                 fn:=ExtractFilePath(Application.ExeName)+'\FTP_DATA\'+Dir+'\0\Temp_d' ;
                 pnMess.Caption := pnMess.Caption+' temp_d  ';       pnMess.Update;
                SendMessageToExpForm(fn, 2,0);
               end
            end;
          if (mess and MSG_ONOFF_UPD = MSG_ONOFF_UPD) then
 //          если 1 и 2 то    temp_on  temp_off  temp_err
 //             0,4,6   -     temp_on  temp_off       одноканальный
 //              5  -     temp_on  temp_off    двухканальный
            begin
              if id in[0, 6 ] then
                begin
                 pnMess.Caption := pnMess.Caption+' temp_on  temp_off  ';    pnMess.Update;

                 fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\0\Temp_on' ;
                 SendMessageToExpForm(fn, 3,0);

                 fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\0\Temp_off' ;
                 SendMessageToExpForm(fn, 4,0);
                end  ;
              if id in [1,2] then
                begin
                 pnMess.Caption := pnMess.Caption+' temp_on  temp_off  temp_err ';   pnMess.Update;

                 fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\0\Temp_on' ;
                 SendMessageToExpForm(fn, 3,0);

                 fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\0\Temp_off' ;
                 SendMessageToExpForm(fn, 4,0);

                 fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\0\Temp_err' ;
                 SendMessageToExpForm(fn, 40,0);
                end;

                 if id in [5] then
                begin
                 pnMess.Caption := pnMess.Caption+' temp_on  temp_off  ';   pnMess.Update;

                 fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\1\Temp_on' ;
                 SendMessageToExpForm(fn, 3,1);
                 fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\2\Temp_on' ;
                 SendMessageToExpForm(fn, 3,2);

                 fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\1\Temp_off' ;
                 SendMessageToExpForm(fn, 4,1);
                 fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\2\Temp_off' ;
                 SendMessageToExpForm(fn, 4,2);
                end;
            end;
          if (mess and MSG_H2_UPD = MSG_H2_UPD) then
            begin
             pnMess.Caption := pnMess.Caption+' temp_h(2) ';            pnMess.Update;
             fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\2\Temp_h' ;
             SendMessageToExpForm(fn, 1,2);
            end ;
          if (mess and MSG_D2_UPD = MSG_D2_UPD) then
            begin
             pnMess.Caption := pnMess.Caption+' temp_d(2) ';           pnMess.Update;
             fn:=ExtractFilePath(Application.ExeName)+'FTP_DATA\'+Dir+'\2\Temp_d' ;
             SendMessageToExpForm(fn, 2,2);
            end ;
        end;

        pnStatus.Caption   := 'FTP-сервер ответил на запрос. Ответ обработан';
        pnStatus.Update;
        if  pnMess.Caption <> 'file system error' then
           Timerclose.Enabled:=True;
    end;
  Repaint;
  btnLoad.Enabled := True;
   pnMess.Update;
//  close;
end;

procedure TmasterFTP_Form.SendMessageToExpForm(FN:string; TypeOfFile:Integer; Chan:smallint);
begin
 RecToTransfer.TypeOfFile:=TypeOfFile;
 RecToTransfer.FName:=FN;
  // загрузить данные в архив
       RecToTransfer.otherdata:=Device_ID;  // код записи в архиве, для который передаются данные
       RecToTransfer.Mult_k:=1;
       RecToTransfer.HourLast:=HourLast;
       RecToTransfer.dayLast:=dayLast;
       ExpForm.Current_Channel:=chan;
       CD.lpData := @RecToTransfer;
       CD.dwData :=length(RecToTransfer.Fname);
       cd.cbData := sizeof(RecToTransfer);
       pnStatus.Caption   := 'обработка '+fn;
       pnStatus.Update;
       if RecToTransfer.TypeOfFile in [1,2,3,4,40] then
            sendMessage(ExpForm.Handle, WM_COPYDATA, Handle, integer(@CD));
       Sleep(500);     

end;

procedure TmasterFTP_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  pnStatus.Caption   := '';
  pnmess.caption:='';
  Timerclose.Enabled:=False;
end;

procedure TmasterFTP_Form.TimercloseTimer(Sender: TObject);
begin
 Timerclose.Enabled:=False;
 close;
end;

procedure TmasterFTP_Form.btnCancelClick(Sender: TObject);
begin
  CD.dwData := ESC_CMND;
  CD.cbData := 0;
  CD.lpData := nil;
  SendMessage(DriverHandle,WM_COPYDATA,DriverHandle,DWORD(@CD));
  pnMess.Caption:='Отмена сеанса связи....';    pnMess.Update;
//  Timerclose.Enabled:=True;
end;

end.
