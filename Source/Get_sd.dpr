program Get_sd;

uses
  Forms,
  Master_u in 'Master_u.pas' {MasterForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMasterForm, MasterForm);
  Application.Run;
end.
