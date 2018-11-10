program Filtr_p;

uses
  Forms,
  FILTRLH in 'FILTRLH.PAS' {Battervort},
  Config in 'Config.pas',
  tvc_u in 'tvc_u.pas';

{$R *.RES}

begin
  Application.Title := 'Программа фильрации';
  Application.CreateForm(TBattervort, Battervort);
  Application.Run;
end.
