program test_ftp;

uses
  Forms,
  master_ftp in 'master_ftp.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
