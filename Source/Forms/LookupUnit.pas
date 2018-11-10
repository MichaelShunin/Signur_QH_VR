unit LookupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, ExtCtrls, DB, DbGridUnit, StorageUnit,
  MaximizedUnit, DataUnit;

type
{ TLookupForm }

  TLookupForm = class(TMaximizedForm, IRememberable)
    BottomPanel: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    LookupFrame: TDbGridFrame;
    Bevel1: TBevel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure LookupFrameGridDblClick(Sender: TObject);
  private
    FLocateField: string;
    FLocateValue: Variant;
    FSection: string;
  protected
    function SelectRecord(const FieldName: string; Value: Variant): Variant; overload;
    function SelectRecord(const FieldName: string; var Value: Variant; var Values: Variant): Boolean; overload;
    function SelectRecordEx(const FieldNames: string; Values: Variant): Boolean;
    procedure Loaded; override;

    function DoLookupRecord(const Caption, StorageSection: string;
      ColumnInfos: array of TColumnInfo; const FieldName: string;
      var Value: Variant; var Values: Variant): Boolean;
  protected
  { IRememberable }
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string); virtual;
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string); virtual;
  public
    property Section: string read FSection write FSection;
    class function LookupDataSetRecord(DataSet: TDataSet;
      const Caption, StorageSection: string; ColumnInfos: array of TColumnInfo;
      const FieldName: string; var Value: Variant; var Values: Variant): Boolean;
  end;

var
  LookupForm: TLookupForm;

implementation

{$R *.dfm}

{ TLookupForm }

function TLookupForm.SelectRecord(const FieldName: string; Value: Variant): Variant;
var
  Values: Variant;
begin
  Result := Value;
  SelectRecord(FieldName, Result, Values);
end;

function TLookupForm.SelectRecord(const FieldName: string; var Value: Variant; var Values: Variant): Boolean;
var
  Count, I: Integer;
  AlreadyActive: Boolean;
begin
  AlreadyActive := LookupFrame.DataSource.DataSet.Active;
  if not AlreadyActive then LookupFrame.DataSource.DataSet.Open;
  try
    FLocateField := FieldName;
    FLocateValue := Value;
    Result := ShowModal = mrOK;
    if Result then
    begin
      Value := LookupFrame.DataSource.DataSet.FieldValues[FieldName];
      Count := LookupFrame.DataSource.DataSet.FieldCount;
      Values := VarArrayCreate([0, Count], varVariant);
      for I := 0 to Count - 1 do Values[I] := LookupFrame.DataSource.DataSet.Fields[I].Value;
    end;
  finally
    if not AlreadyActive then LookupFrame.DataSource.DataSet.Close;
  end;
end;

function TLookupForm.SelectRecordEx(const FieldNames: string; Values: Variant): Boolean;
begin
  if not LookupFrame.DataSource.DataSet.Active then LookupFrame.DataSource.DataSet.Open;
  if FieldNames <> '' then LookupFrame.DataSource.DataSet.Locate(FieldNames, Values, []);
  Result := ShowModal = mrOK;
end;

procedure TLookupForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F3) and (Shift = []) then
  begin
    ModalResult := mrCancel;
    Key := 0;
  end;
end;

procedure TLookupForm.FormShow(Sender: TObject);
begin
  LoadFormState(Self, Section, '');
  if (FLocateField <> '') and not VarIsEmpty(FLocateValue) then LookupFrame.DataSource.DataSet.Locate(FLocateField, FLocateValue, []);
  LookupFrame.Grid.SetFocus;
end;

procedure TLookupForm.FormHide(Sender: TObject);
begin
  SaveFormState(Self, Section, '');
end;

procedure TLookupForm.Loaded;
begin
  inherited Loaded;
  if Section = '' then Section := Name;
end;

{ IRememberable }

procedure TLookupForm.SaveState(Storage: TStorage; const SectionName, Prefix: string);
begin
  if FLocateField <> '' then
  begin
    Storage.WriteString(SectionName, Prefix + Name + '.SavedField',
      LookupFrame.DataSource.DataSet.FieldByName(FLocateField).AsString);
  end;
end;

procedure TLookupForm.LoadState(Storage: TStorage; const SectionName, Prefix: string);
var
  SavedField: string;
begin
  if FLocateField <> '' then
  begin
    SavedField := Storage.ReadString(SectionName, Prefix + Name + '.SavedField', '');
    LookupFrame.DataSource.DataSet.Locate(FLocateField, SavedField, []);
  end;
end;

function TLookupForm.DoLookupRecord(const Caption, StorageSection: string;
  ColumnInfos: array of TColumnInfo; const FieldName: string; var Value,
  Values: Variant): Boolean;
var
  I: Integer;
  Column: TColumnEh;
begin
  Self.Caption := Caption;
  Section := StorageSection;
  for I := Low(ColumnInfos) to High(ColumnInfos) do
  begin
    Column := LookupFrame.Grid.Columns.Add;
    Column.FieldName := ColumnInfos[I].FieldName;
    Column.Title.Caption := ColumnInfos[I].Title;
    Column.Width := ColumnInfos[I].Width;
    Column.DisplayFormat := ColumnInfos[I].Format;
  end;
  LookupFrame.UpdateFieldList;
  Result := SelectRecord(FieldName, Value, Values);
end;

class function TLookupForm.LookupDataSetRecord(DataSet: TDataSet;
  const Caption, StorageSection: string; ColumnInfos: array of TColumnInfo;
  const FieldName: string; var Value: Variant; var Values: Variant): Boolean;
var
  Form: TLookupForm;
begin
  Form := TLookupForm.Create(Application);
  try
    Form.LookupFrame.DataSource.DataSet := DataSet;
    Result := Form.DoLookupRecord(Caption, StorageSection, ColumnInfos, FieldName, Value, Values);
  finally
    Form.Free;
  end;
end;

procedure TLookupForm.LookupFrameGridDblClick(Sender: TObject);
begin
  inherited;
  ModalResult:=mrOK;
end;

end.
