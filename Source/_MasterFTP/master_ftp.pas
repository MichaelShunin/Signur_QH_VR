unit master_ftp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    pnContr: TPanel;
    pnMess: TPanel;
    btnLoad: TSpeedButton;
    lbInstr: TLabel;
    lbSN: TLabel;
    cbInstr: TComboBox;
    meSN: TMaskEdit;
    Timer: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure MessageReceiver(var Msg: TWMCopyData); message WM_COPYDATA;
  private
    { Private declarations }
  public
    { Public declarations }
    CD : TCopyDataStruct;
    txt : string;
  end;

var
  Form1: TForm1;

implementation

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

var
  DriverHandle : THandle;
  path,fn,s,dir : string;
  result : Word;
  DriverAnswer : Boolean;
  id : Byte;

//______________________________________________________________________________
procedure TForm1.FormActivate(Sender: TObject);
begin
  GetDir(0,path);
  path := path + '\';
end;

//______________________________________________________________________________
procedure TForm1.btnLoadClick(Sender: TObject);
begin
  btnLoad.Enabled := False;
  case cbInstr.ItemIndex of
                0 :  begin
                       id := 0;
                       dir := 'A1_'+meSN.Text;
                     end;
                1 :  begin
                       id := 6;
                       dir := 'A1_'+meSN.Text;
                     end;
                2 :  begin
                       id := 5;
                       dir := 'A2_'+meSN.Text;
                     end;
                3 :  begin
                       id := 1;
                       dir := 'EQ_'+meSN.Text;
                     end;
                4 :  begin
                       id := 2;
                       dir := 'EQ_'+meSN.Text;
                     end;
               end;
  pnMess.Caption := 'wait...';
  s := path+'signurdriverftp.exe '+IntToStr(Handle)+' '+IntToStr(id)+' '+ meSN.Text;
  result := WinExec(PChar(s),SW_SHOWMINIMIZED);
  Repaint;
  if result<33 then
    begin
      case result of
              ERROR_FILE_NOT_FOUND :    s := 'программа-драйвер не найдена'
              else                      s := 'некорректный вызов программы-драйвера';
           end;
      Application.MessageBox(PChar(s),'Ошибка',MB_ICONERROR);
      pnMess.Caption := '';
      btnLoad.Enabled := True;
    end
  else
    Timer.Enabled := True;
end;

//______________________________________________________________________________
procedure TForm1.TimerTimer(Sender: TObject);
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
procedure TForm1.MessageReceiver(var Msg: TWMCopyData);
var
  oc, mess : Integer;
begin
  DriverAnswer:= True;
  oc := Msg.CopyDataStruct.dwData;
  fn := PChar(Msg.CopyDataStruct.lpData);
  if (oc=DRIVER_HANDLE) then
    DriverHandle := StrToInt(fn);
  mess := StrToInt(fn);
  if (oc=ON_CONNECT) then
      case  mess of
           MSG_NO_HOST          : pnMess.Caption :=
                                  'invalid host';
           MSG_FAIL_CONNECT     : pnMess.Caption :=
                                  'connection failure';
           MSG_NO_INSTR         : pnMess.Caption :=
                                  'no instrument '+dir;
           MSG_NO_FILE          : pnMess.Caption :=
                                  'file not finded';
           MSG_NO_CMND_EXE      : pnMess.Caption :=
                                  'FTP command not performed';
           MSG_FAILURE          : pnMess.Caption :=
                                  'FTP session failure';
           MSG_FILE_FORMATT_ERR1: pnMess.Caption :=
                                  'file formatt error 1';
           MSG_FILE_FORMATT_ERR2: pnMess.Caption :=
                                  'file formatt error 2';
           MSG_FILE_FORMATT_ERR3: pnMess.Caption :=
                                  'file formatt error 3';
      end;
  if (oc=ON_UPDATE) then
    begin
      if mess=MSG_NO_UPD then
        pnMess.Caption := 'no update'
      else
        begin
          pnMess.Caption := '';
          if (mess and MSG_H_UPD = MSG_H_UPD) then
            begin
              if id=5 then
                pnMess.Caption := 'temp_h(1), '
              else
                pnMess.Caption := 'temp_h, ';
            end;
          if (mess and MSG_D_UPD = MSG_D_UPD) then
            begin
              if id=5 then
                pnMess.Caption := pnMess.Caption+'temp_d(1), '
              else
                pnMess.Caption := pnMess.Caption+'temp_d, ';
            end;
          if (mess and MSG_ONOFF_UPD = MSG_ONOFF_UPD) then
            begin
              if id in[1,2] then
                pnMess.Caption := pnMess.Caption+'temp_on, temp_off, temp_err'
              else
                pnMess.Caption := pnMess.Caption+'temp_on, temp_off, ';
            end;
          if (mess and MSG_H2_UPD = MSG_H2_UPD) then
            pnMess.Caption := pnMess.Caption+'temp_h(2), ';
          if (mess and MSG_D2_UPD = MSG_D2_UPD) then
            pnMess.Caption := pnMess.Caption+'temp_d(2)';
        end;
    end;
  Repaint;
  btnLoad.Enabled := True;
end;


end.
