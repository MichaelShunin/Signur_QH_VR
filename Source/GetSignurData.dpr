program GetSignurData;

uses
  Forms,
  GetSignurdata_U in 'GetSignurdata_U.pas' {GetSignurDataForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGetSignurDataForm, GetSignurDataForm);
  Application.Run;
end.
