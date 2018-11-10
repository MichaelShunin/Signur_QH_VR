program SIGNUR_FTPCODE;

uses
  Forms,
  GetFTP_CODE_U in 'GetFTP_CODE_U.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
