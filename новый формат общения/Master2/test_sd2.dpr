program test_sd2;

uses
  Forms,
  master2 in 'master2.pas' {Master2Form},
  Param2 in 'Param2.pas' {PrmForm},
  Param3 in 'Param3.pas' {PrmModbusForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMaster2Form, Master2Form);
  Application.CreateForm(TPrmForm, PrmForm);
  Application.CreateForm(TPrmModbusForm, PrmModbusForm);
  Application.Run;
end.
