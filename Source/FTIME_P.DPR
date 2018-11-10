program Ftime_p;

uses
  Forms,
  FUNCTIME in 'FUNCTIME.PAS' {FuncDialog},
  Config in 'Config.pas',
  tvc_u in 'tvc_u.pas';

{$R *.RES}

begin
  Application.Title := 'Функции обработки во временной области';
  Application.CreateForm(TFuncDialog, FuncDialog);
  Application.Run;
end.

