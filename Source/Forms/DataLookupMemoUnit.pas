unit DataLookupMemoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LookupUnit, DB, Grids, DBGridEh, StdCtrls, ExtCtrls,
  IBCustomDataSet, IBQuery, DataUnit, DbGridUnit, DBCtrls, StorageUnit;

type
{ TDataLookupMemoForm - форма выбора с показом одного из полей внизу в ћемо }

  TDataLookupMemoForm = class(TLookupForm)
    ListQuery: TIBQuery;
    Memo: TDBMemo;
    HSplitter: TSplitter;
  protected
  { IRememberable }
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string); override;
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string); override;
  public
    class function LookupRecord(const Caption, SQL, StorageSection: string;
      ColumnInfos: array of TColumnInfo; const FieldName: string;
      var Value: Variant; var Values: Variant): Boolean; overload;
    class function LookupRecord(const Caption, SQL, StorageSection: string;
      ColumnInfos: array of TColumnInfo; const FieldName, MemoFieldName: string;
      var Value: Variant; var Values: Variant): Boolean; overload;
  end;

var
  DataLookupMemoForm: TDataLookupMemoForm;

implementation

uses MainUnit;

{$R *.dfm}

//сюда передаем одно им€ пол€, оно отображаетс€ в ћемо и из него же берем результат
class function TDataLookupMemoForm.LookupRecord(const Caption, SQL, StorageSection: string;
  ColumnInfos: array of TColumnInfo; const FieldName: string;
  var Value: Variant; var Values: Variant): Boolean;
begin
  Result := LookupRecord(Caption, SQL, StorageSection, ColumnInfos,
    FieldName, FieldName, Value, Values);
end;


class function TDataLookupMemoForm.LookupRecord(const Caption, SQL, StorageSection: string;
  ColumnInfos: array of TColumnInfo; const FieldName, MemoFieldName: string;
  var Value: Variant; var Values: Variant): Boolean;
var
  Form: TDataLookupMemoForm;
begin
  Form := TDataLookupMemoForm.Create(Application);
  try
    Form.ListQuery.SQL.Text := SQL;
    Form.Memo.DataField := MemoFieldName;
    Result := Form.DoLookupRecord(Caption, StorageSection, ColumnInfos, FieldName, Value, Values);
  finally
    Form.Free;
  end;
end;

{ IRememberable }

procedure TDataLookupMemoForm.SaveState(Storage: TStorage; const SectionName, Prefix: string);
begin
  inherited;
  Storage.WriteInteger(SectionName, Prefix + Name + '.MemoHeight', Memo.Height);
end;

procedure TDataLookupMemoForm.LoadState(Storage: TStorage; const SectionName, Prefix: string);
begin
  inherited;
  //Align мен€ем чтобы нижн€€ панель не прыгала вверх при изменении высоты ћемо
  Memo.Align := alNone;
  HSplitter.Align := alNone;
  Memo.Height := Storage.ReadInteger(SectionName, Prefix + Name + '.MemoHeight', Memo.Height);
  Memo.Align := alBottom;
  HSplitter.Align := alBottom;
end;

end.
