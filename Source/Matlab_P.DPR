program Matlab_P;

uses
  Forms,
  matlab_U in 'matlab_U.PAS' {MainWin};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainWin, MainWin);
  Application.Run;
end.
