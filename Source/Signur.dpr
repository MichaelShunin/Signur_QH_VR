program Signur;

uses
  windows,
  Forms,
  common_f in 'common_f.pas' {CommonForm},
  menu_f in 'menu_f.pas' {MenuForm},
  Main_f in 'Main_f.pas' {MainForm},
  Exp_f in 'Exp_f.pas' {ExpForm},
  DM_dm in 'DM_dm.pas' {DM: TDataModule},
  config in 'config.pas',
  tvc_u in 'tvc_u.pas',
  IMAGE_u in 'IMAGE_u.PAS' {ImageForm},
  Getgwrez in 'GETGWREZ.PAS',
  FileBuff in 'FILEBUFF.PAS',
  Scale_h in 'SCALE_H.PAS' {SCALE_HELP_Form},
  Save_new in 'SAVE_NEW.PAS' {Save_new_Form},
  CURSORS in 'CURSORS.PAS' {Cursors_Form},
  Setstyle in 'setstyle.PAS' {SetStyle_Form},
  Obzorka in 'OBZORKA.PAS' {ObzorkaForm},
  Obzordlg in 'OBZORDLG.PAS' {ObzorDialog},
  Colscale in 'colscale.PAS' {Color_Scale_Form},
  Audio_u in 'AUDIO_U.PAS' {AudioForm},
  Pagename in 'PAGENAME.PAS' {PageNameDialog},
  Formtext in 'FORMTEXT.PAS' {TextForm},
  About in 'ABOUT.PAS' {AboutBox},
  Export_f in 'EXPORT_F.PAS' {Export_Form},
  Dialog_GetParam in 'Dialog_GetParam.pas' {DialogGetParam},
  ArchievInfo_u in 'ArchievInfo_u.pas' {ArchievInfoForm},
  Picture_u in 'Picture_u.pas' {Pictureform},
  Import_f in 'Import_f.pas' {ImportForm},
  Import_signur in 'Import_signur.pas' {Import_Signur_Form},
  Schedule_u in 'Schedule_u.pas' {ScheduleForm},
  addSignurDevice_f in 'addSignurDevice_f.pas' {AddSignurDeviceForm},
  master2 in 'master2.pas' {Master2Form},
  Param3 in 'Param3.pas' {PrmModbusForm},
  Param2 in 'Param2.pas' {PrmForm},
  Import_signur_2 in 'Import_signur_2.pas' {Import_Signur_Form2},
  master2013 in 'master2013.pas' {Master2013Form},
  BlueTooth_f in 'BlueTooth_f.pas' {BlueToothForm},
  ComPortSettings_u in 'ComPortSettings_u.pas' {ComPortSettings_form},
  master_ftp in 'master_ftp.pas' {masterFTP_Form};
 // DebugUnit in 'Colib\DebugUnit.pas';

{$R *.res}


var
  HM: THandle;

function Check: boolean;
begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'SignurBDMutex');
  Result := (HM <> 0);
  if HM = 0 then
    HM := CreateMutex(nil, false, 'SignurBDMutex');
end;

begin
  if Check then

     begin
      application.Initialize;
      application.MessageBox('Программа уже запущена.','Сигнур-база данных',0);
      application.Terminate;
      Exit;
     end;
  Application.Initialize;
  Application.Title := 'Signur';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSCALE_HELP_Form, SCALE_HELP_Form);
  Application.CreateForm(TExport_Form, Export_Form);
  Application.CreateForm(TDialogGetParam, DialogGetParam);
  Application.CreateForm(TPrmModbusForm, PrmModbusForm);
  Application.CreateForm(TPrmForm, PrmForm);
  Application.CreateForm(TMaster2013Form, Master2013Form);
  Application.CreateForm(TBlueToothForm, BlueToothForm);
  Application.CreateForm(TComPortSettings_form, ComPortSettings_form);
  Application.CreateForm(TmasterFTP_Form, masterFTP_Form);
  //  Application.CreateForm(TScheduleForm, ScheduleForm);
  Application.Run;

end.
                                          
