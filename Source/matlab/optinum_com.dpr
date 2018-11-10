program optinum_COM;

uses
  Forms,
  optinum_demo in 'optinum_demo.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

