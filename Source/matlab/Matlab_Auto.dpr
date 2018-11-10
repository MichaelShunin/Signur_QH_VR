program Matlab_Auto;

uses
  Forms,
  Main_ in 'Main_.pas' {MainWin};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainWin, MainWin);
  Application.Run;
end.
