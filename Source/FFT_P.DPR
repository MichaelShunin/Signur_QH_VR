program Fft_p;

uses
  Forms,
  tvc_u in 'tvc_u.pas',
  FFTALL in 'FFTALL.PAS' {fftDialog},
  Config in 'Config.pas';

{$R *.RES}

begin
  Application.Title := 'Расчет спектральных функций ';
  Application.CreateForm(TfftDialog, fftDialog);
  Application.Run;
end.
