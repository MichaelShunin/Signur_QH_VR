program Ftime_p;

uses
  Forms,
  FUNCTIME in 'FUNCTIME.PAS' {FuncDialog},
  Config in 'Config.pas',
  tvc_u in 'tvc_u.pas';

{$R *.RES}

begin
  Application.Title := '������� ��������� �� ��������� �������';
  Application.CreateForm(TFuncDialog, FuncDialog);
  Application.Run;
end.

