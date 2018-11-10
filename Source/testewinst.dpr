program testewinst;

uses
  Forms,
  test_new_Inst in 'test_new_Inst.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
