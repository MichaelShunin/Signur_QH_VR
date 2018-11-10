unit DM;

interface

uses
  SysUtils, Classes, DB, IBDatabase;

type
  TDM = class(TDataModule)
    DB: TIBDatabase;
    TA: TIBTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
 db.Connected:=true;
 ta.StartTransaction;
end;

end.
