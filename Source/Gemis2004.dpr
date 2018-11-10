program Gemis2004;

uses
  Forms,
  common_f in 'common_f.pas' {CommonForm},
  menu_f in 'menu_f.pas' {MenuForm},
  Main_f in 'Main_f.pas' {MainForm},
  Exp_f in 'Exp_f.pas' {ExpForm},
  DM_dm in 'DM_dm.pas' {DM: TDataModule},
  Import_f in 'Import_f.pas' {ImportForm},
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
  Picture_u in 'Picture_u.pas' {Pictureform};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'GeMiS';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSCALE_HELP_Form, SCALE_HELP_Form);
  Application.CreateForm(TExport_Form, Export_Form);
  Application.CreateForm(TDialogGetParam, DialogGetParam);
  Application.Run;

end.

