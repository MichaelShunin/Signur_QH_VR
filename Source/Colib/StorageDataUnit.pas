unit StorageDataUnit;

interface

uses
  SysUtils, Classes, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, IBDatabase;

type
  TStorageData = class(TDataModule)
    Database: TIBDatabase;
    ManualAutoStartTransaction: TIBTransaction;
    StorageQuery: TIBQuery;
    StorageUpdate: TIBUpdateSQL;
    StorageQueryID: TIntegerField;
    StorageQueryBODY: TBlobField;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure StorageIniToBase(AIniName: string); //записать данные ini-файла с настройками в базу
    procedure BaseToStorageIni(AIniName: string); //записать из базы в ini-файл с настройками
  end;

var
  StorageData: TStorageData;

procedure StorageIniToBase(AIniName: string); //записать данные ini-файла с настройками в базу
procedure BaseToStorageIni(AIniName: string); //записать из базы в ini-файл с настройками

implementation

uses MainUnit;

{$R *.dfm}

procedure StorageIniToBase(AIniName: string);
begin
  StorageData := TStorageData.Create(nil);
  try
    StorageData.DataBase.Close;
    StorageData.Database.DatabaseName := MainForm.DatabaseName;
    StorageData.Database.Params := MainForm.DatabaseParams;
    StorageData.DataBase.Open;
    try
      StorageData.StorageIniToBase(AIniName);
    finally
      StorageData.DataBase.Close;
    end;
  finally
    StorageData.Free;
  end;
end;

procedure BaseToStorageIni(AIniName: string);
begin
  StorageData := TStorageData.Create(nil);
  try
    StorageData.DataBase.Close;
    StorageData.Database.DatabaseName := MainForm.DatabaseName;
    StorageData.Database.Params := MainForm.DatabaseParams;
    StorageData.DataBase.Open;
    try
      StorageData.BaseToStorageIni(AIniName);
    finally
      StorageData.DataBase.Close;
    end;
  finally
    StorageData.Free;
  end;
end;

procedure TStorageData.StorageIniToBase(AIniName: string);
begin
  if not FileExists(AIniName) then exit;
  StorageQuery.Close;
  StorageQuery.Open;
  StorageQuery.FetchAll;
  if StorageQuery.BOF and StorageQuery.EOF
  then begin
    StorageQuery.Append;
    StorageQueryID.AsInteger := 1;
  end
  else StorageQuery.Edit;

  StorageQueryBODY.LoadFromFile(AIniName);

  try
    StorageQuery.Post;
    StorageQuery.Transaction.CommitRetaining;
  except
    raise;
  end;
end;

procedure TStorageData.BaseToStorageIni(AIniName: string);
begin
  StorageQuery.Close;
  StorageQuery.Open;
  StorageQuery.Transaction.CommitRetaining;
  StorageQuery.FetchAll;
  if not (StorageQuery.BOF and StorageQuery.EOF) then
  begin
    try
      StorageQueryBODY.SaveToFile(AIniName);
    except
      raise;
    end;
  end;
end;

procedure TStorageData.DataModuleDestroy(Sender: TObject);
begin
  if ManualAutoStartTransaction.Active then ManualAutoStartTransaction.Commit;
end;

end.
