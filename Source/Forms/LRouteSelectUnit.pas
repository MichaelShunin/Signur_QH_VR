unit LRouteSelectUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit, ComCtrls, ToolWin, ExtCtrls, ImgList, StdCtrls,
  Mask, DBCtrlsEh, DBLookupEh, DbGridUnit, DB, IBCustomDataSet, IBQuery,
  IBUpdateSQL, EventUnit, StorageUnit;

type
{ TBillSelectForm }

  TLRouteSelectForm = class(TMaximizedForm, IRememberable)
    ToolImages: TImageList;
    ToolPanel: TPanel;
    ToolBar: TToolBar;
    OKBtn: TToolButton;
    NewBtn: TToolButton;
    CancelBtn: TToolButton;
    NumberPanel: TPanel;
    NumberBevel: TBevel;
    StationLabel: TLabel;
    ProductLabel: TLabel;
    ManufactLabel: TLabel;
    SenderLabel: TLabel;
    OwnerLabel: TLabel;
    StationLookup: TDBLookupComboboxEh;
    ProductLookup: TDBLookupComboboxEh;
    ManufactLookup: TDBLookupComboboxEh;
    SenderLookup: TDBLookupComboboxEh;
    OwnerLookup: TDBLookupComboboxEh;
    LRouteFrame: TDbGridFrame;
    LRouteQuery: TIBQuery;
    LRouteQueryLROUTE_ID: TIntegerField;
    LRouteQuerySTATION_ID: TIntegerField;
    LRouteQueryMANUFACT_ID: TIntegerField;
    LRouteQuerySENDER_ID: TIntegerField;
    LRouteQueryOWNER_ID: TIntegerField;
    LRouteQueryPRODUCT_ID: TIntegerField;
    LRouteQuerySTATION_NAME: TIBStringField;
    LRouteQueryPRODUCT_NAME: TIBStringField;
    LRouteLimitQuery: TIBQuery;
    LRouteLimitQuerySTATION_ID: TIntegerField;
    LRouteLimitQueryPRODUCT_ID: TIntegerField;
    LRouteLimitQuerySENDER_ID: TIntegerField;
    LRouteLimitQueryOWNER_ID: TIntegerField;
    LRouteLimitQueryMANUFACT_ID: TIntegerField;
    StationsSource: TDataSource;
    CompaniesSource: TDataSource;
    StationsQuery: TIBQuery;
    StationsQueryNAME: TIBStringField;
    CompaniesQuery: TIBQuery;
    CompaniesQueryCOMPANY_ID: TIntegerField;
    CompaniesQueryNAME: TIBStringField;
    ProductsSource: TDataSource;
    ProductsQuery: TIBQuery;
    ProductsQueryID: TIntegerField;
    ProductsQueryDESCR: TIBStringField;
    LRouteLimitSource: TDataSource;
    LRouteLimitUpdate: TIBUpdateSQL;
    LRoutesUpdate: TIBUpdateSQL;
    CompaniesQueryCOMPANY_CODE: TIntegerField;
    StationsQuerySTATION_CODE: TIntegerField;
    StationsQuerySTATION_ID: TIntegerField;
    OwnerQuery: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IntegerField2: TIntegerField;
    OwnerSource: TDataSource;
    SenderQuery: TIBQuery;
    IntegerField3: TIntegerField;
    IBStringField2: TIBStringField;
    IntegerField4: TIntegerField;
    SenderSource: TDataSource;
    ManufactQuery: TIBQuery;
    IntegerField5: TIntegerField;
    IBStringField3: TIBStringField;
    IntegerField6: TIntegerField;
    ManufactSource: TDataSource;
    CompaniesQuerySHORT_NAME: TIBStringField;
    LRouteQueryMANUFACT_NAME: TIBStringField;
    LRouteQuerySENDER_NAME: TIBStringField;
    LRouteQueryOWNER_NAME: TIBStringField;
    OwnerQuerySHORT_NAME: TIBStringField;
    SenderQuerySHORT_NAME: TIBStringField;
    ManufactQuerySHORT_NAME: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure UpdateLRouteLimit(Sender: TField);
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure LRouteFrameDataSourceDataChange(Sender: TObject;
      Field: TField);
    procedure NewBtnClick(Sender: TObject);
    procedure LookupKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LRouteQueryAfterPost(DataSet: TDataSet);
    procedure LRouteQueryBeforePost(DataSet: TDataSet);
    procedure StationLookupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StationLookupChange(Sender: TObject);
    procedure ProductLookupChange(Sender: TObject);
    procedure SenderLookupChange(Sender: TObject);
    procedure OwnerLookupChange(Sender: TObject);
    procedure ManufactLookupChange(Sender: TObject);
    procedure LRouteQueryAfterDelete(DataSet: TDataSet);
  private
    FInserting: Boolean;
    FLRouteID: Variant;
  protected
    procedure FontChanged; override;
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string);
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string);
  public
    class function SelectLRoute(StationID, ProductID, SenderID, OwnerID, ManufactID: Variant): Variant;
    property LRouteID: Variant read FLRouteID;
  end;

var
  LRouteSelectForm: TLRouteSelectForm;

implementation

uses
  DataUnit, ExtraUnit;

{$R *.dfm}

{ TLRouteSelectForm }

function VarID2Str(V: Variant): string;
begin
  if VarIsNull(V) then Result := 'null' else Result := IntToStr(V);
end;

const
  LimitSQL =
    'select distinct'#13#10 +
    '  cast(%s as integer) as STATION_ID,'#13#10 +
    '  cast(%s as integer) as PRODUCT_ID,'#13#10 +
    '  cast(%s as integer) as SENDER_ID,'#13#10 +
    '  cast(%s as integer) as OWNER_ID,'#13#10 +
    '  cast(%s as integer) as MANUFACT_ID'#13#10 +
    'from LROUTES'#13#10;

class function TLRouteSelectForm.SelectLRoute(StationID, ProductID,
  SenderID, OwnerID, ManufactID: Variant): Variant;
var
  Form: TLRouteSelectForm;
begin
  Form := TLRouteSelectForm.Create(nil);
  try
    Form.LRouteLimitQuery.SQL.Text := Format(LimitSQL, [VarID2Str(StationID),
      VarID2Str(ProductID), VarID2Str(SenderID), VarID2Str(OwnerID), VarID2Str(ManufactID)]);
    Form.ActiveControl := Form.LRouteFrame.Grid;  
    Form.ShowModal;
    Result := Form.LRouteID;
  finally
    Form.Free;
  end;
end;

procedure TLRouteSelectForm.FormShow(Sender: TObject);
begin
  FLRouteID := Null;
  LRouteLimitQuery.Open;
  StationsQuery.Close;
  StationsQuery.Open;
  CompaniesQuery.Close;
  CompaniesQuery.Open;
  ProductsQuery.Close;
  ProductsQuery.Open;
  OwnerQuery.Close;
  OwnerQuery.Open;
  SenderQuery.Close;
  SenderQuery.Open;
  ManufactQuery.Close;
  ManufactQuery.Open;
  UpdateLRouteLimit(nil);
end;

procedure TLRouteSelectForm.UpdateLRouteLimit(Sender: TField);

  procedure AssignLRouteParam(const Name: string; V: Variant);
  const
    Colors: array [Boolean] of TColor = ($00E8FFFF, $00E8E8E8);
  var
    IsNull: Boolean;
    ID: Integer;
  begin
    IsNull := VarIsNull(V) or (V=0);
    LRouteQuery.ParamByName(Name + '_IS_NULL').AsInteger := Ord(IsNull);
    if IsNull then ID := 0 else ID := V;
    LRouteQuery.ParamByName(Name + '_ID').AsInteger := ID;
    LRouteFrame.ColumnByField(LRouteQuery.FieldByName(Name + '_NAME')).Color := Colors[IsNull];
  end;

var
  SavedLRouteID: Integer;
begin
  SavedLRouteID := LRouteQueryLROUTE_ID.AsInteger;
  LRouteQuery.DisableControls;
  try
    LRouteQuery.Close;
    if (Sender = nil) or (Sender = LRouteLimitQuerySTATION_ID)
      then AssignLRouteParam('STATION', LRouteLimitQuerySTATION_ID.AsVariant);
    if (Sender = nil) or (Sender = LRouteLimitQueryPRODUCT_ID)
      then AssignLRouteParam('PRODUCT', LRouteLimitQueryPRODUCT_ID.AsVariant);
    if (Sender = nil) or (Sender = LRouteLimitQueryMANUFACT_ID)
      then AssignLRouteParam('MANUFACT', LRouteLimitQueryMANUFACT_ID.AsVariant);
    if (Sender = nil) or (Sender = LRouteLimitQuerySENDER_ID)
      then AssignLRouteParam('SENDER', LRouteLimitQuerySENDER_ID.AsVariant);
    if (Sender = nil) or (Sender = LRouteLimitQueryOWNER_ID)
      then AssignLRouteParam('OWNER', LRouteLimitQueryOWNER_ID.AsVariant);
    LRouteQuery.Open;
    LRouteQuery.Locate('LROUTE_ID', SavedLRouteID, []);
  finally
    LRouteQuery.EnableControls;
    LRouteFrame.Grid.Update;
  end;
end;

procedure TLRouteSelectForm.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TLRouteSelectForm.OKBtnClick(Sender: TObject);
begin
  FLRouteID := LRouteQueryLROUTE_ID.AsVariant;
  ModalResult := mrOK;
end;

procedure TLRouteSelectForm.NewBtnClick(Sender: TObject);
begin
  ActiveControl := LRouteFrame.Grid;
  if LRouteLimitQuerySTATION_ID.IsNull or LRouteLimitQueryPRODUCT_ID.IsNull or
     LRouteLimitQuerySENDER_ID.IsNull or LRouteLimitQueryOWNER_ID.IsNull
  then begin
    ShowMessage('”казаны не все данные дл€ маршрута');
    abort;
  end;
  LRouteQuery.Append;
  LRouteQuerySTATION_ID.AsVariant := LRouteLimitQuerySTATION_ID.AsVariant;
  LRouteQueryPRODUCT_ID.AsVariant := LRouteLimitQueryPRODUCT_ID.AsVariant;
  LRouteQueryMANUFACT_ID.AsVariant := LRouteLimitQueryMANUFACT_ID.AsVariant;
  LRouteQuerySENDER_ID.AsVariant := LRouteLimitQuerySENDER_ID.AsVariant;
  LRouteQueryOWNER_ID.AsVariant := LRouteLimitQueryOWNER_ID.AsVariant;
  LRouteQuery.Post;
  OKBtnClick(Self);
end;

procedure TLRouteSelectForm.LRouteFrameDataSourceDataChange(
  Sender: TObject; Field: TField);
var
  LRoutesExist: Boolean;

  function TooGeneral: Boolean;
  begin
    Result := LRouteLimitQuerySTATION_ID.IsNull
          and LRouteLimitQueryPRODUCT_ID.IsNull
          and LRouteLimitQueryMANUFACT_ID.IsNull
          and LRouteLimitQuerySENDER_ID.IsNull
          and LRouteLimitQueryOWNER_ID.IsNull;
  end;

begin
  LRoutesExist := not LRouteQuery.Bof or not LRouteQuery.Eof;
  OKBtn.Enabled := LRoutesExist;
  NewBtn.Enabled := not LRoutesExist and not TooGeneral;
end;

procedure TLRouteSelectForm.LookupKeyPress(Sender: TObject;
  var Key: Char);
var
  Lookup: TDBLookupComboboxEh;
begin
  if (Key = #13) then
  begin
    Lookup := Sender as TDBLookupComboboxEh;
    if not Lookup.ListVisible then
    begin
      Lookup.UpdateData;
      Key := #0;
    end;
  end;
end;

procedure TLRouteSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: if OKBtn.Enabled then OKBtn.Click else NewBtn.Click;
    VK_ESCAPE: CancelBtn.Click;
    else Exit;
  end;
  Key := 0;
end;

procedure TLRouteSelectForm.LRouteQueryBeforePost(DataSet: TDataSet);
begin
  FInserting := (LRouteQuery.State = dsInsert);
end;

procedure TLRouteSelectForm.LRouteQueryAfterPost(DataSet: TDataSet);
begin
  LRouteQuery.Transaction.CommitRetaining;
end;

procedure TLRouteSelectForm.FontChanged;
begin
  inherited;
  StationLookup.Left := ControlOffsetX(StationLabel, 4);
  StationLookup.Left := ControlOffsetX(StationLabel, 4);
  StationLookup.Width := Round(120 * Font.Size / 8);
  ProductLabel.Left := ControlOffsetX(StationLookup, 8);
  ProductLookup.Left := ControlOffsetX(ProductLabel, 4);
  SenderLookUp.Width := Round(170 * Font.Size / 8);
  SenderLookUp.Left := ProductLookup.left + ProductLookup.Width - SenderLookup.Width;
  SenderLabel.Left := SenderLookUp.Left - 4 - SenderLabel.Width;
  ManufactLabel.Left := ControlOffsetX(ProductLookup, 16);
  ManufactLookup.Width := Round(170 * Font.Size / 8);
  ManufactLookup.Left := ControlOffsetX(ManufactLabel, 4);
  OwnerLookup.Width := ManufactLookup.Width;
  OwnerLookup.Left := ManufactLookup.Left;
  OwnerLabel.Left := ManufactLabel.Left + ManufactLabel.Width - OwnerLabel.Width;

  StationLabel.Top := StationLookup.Top + Round((StationLookup.Height - StationLabel.Height) / 2);
  ProductLabel.Top := StationLabel.Top;
  ManufactLabel.Top := StationLabel.Top;
  SenderLookup.Top := ControlOffsetY(StationLookup, 4);
  OwnerLookup.Top := SenderLookup.Top;
  SenderLabel.Top := SenderLookup.Top + Round((SenderLookup.Height - SenderLabel.Height) / 2);
  OwnerLabel.Top := SenderLabel.Top;

  ToolPanel.Height := ControlOffsetY(SenderLookup, 8);
end;

procedure TLRouteSelectForm.SaveState(Storage: TStorage; const SectionName, Prefix: string);
begin
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.StationLookup.DropDownBox.Width', StationLookup.DropDownBox.Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.StationLookup.DropDownBox.Columns[0].Width', StationLookup.DropDownBox.Columns[0].Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.StationLookup.DropDownBox.Columns[1].Width', StationLookup.DropDownBox.Columns[1].Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.ProductLookup.DropDownBox.Width', ProductLookup.DropDownBox.Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.ProductLookup.DropDownBox.Columns[0].Width', ProductLookup.DropDownBox.Columns[0].Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.SenderLookup.DropDownBox.Width', SenderLookup.DropDownBox.Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.SenderLookup.DropDownBox.Columns[0].Width', SenderLookup.DropDownBox.Columns[0].Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.SenderLookup.DropDownBox.Columns[1].Width', SenderLookup.DropDownBox.Columns[1].Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.OwnerLookup.DropDownBox.Width', OwnerLookup.DropDownBox.Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.OwnerLookup.DropDownBox.Columns[0].Width', OwnerLookup.DropDownBox.Columns[0].Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.OwnerLookup.DropDownBox.Columns[1].Width', OwnerLookup.DropDownBox.Columns[1].Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.ManufactLookup.DropDownBox.Width', ManufactLookup.DropDownBox.Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.ManufactLookup.DropDownBox.Columns[0].Width', ManufactLookup.DropDownBox.Columns[0].Width);
  Storage.WriteInteger(SectionName,
    Prefix + Name + '.ManufactLookup.DropDownBox.Columns[1].Width', ManufactLookup.DropDownBox.Columns[1].Width);
end;

procedure TLRouteSelectForm.LoadState(Storage: TStorage; const SectionName, Prefix: string);
begin
  StationLookup.DropDownBox.Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.StationLookup.DropDownBox.Width', StationLookup.DropDownBox.Width);
  StationLookup.DropDownBox.Columns[0].Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.StationLookup.DropDownBox.Columns[0].Width', StationLookup.DropDownBox.Columns[0].Width);
  StationLookup.DropDownBox.Columns[1].Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.StationLookup.DropDownBox.Columns[1].Width', StationLookup.DropDownBox.Columns[1].Width);
  ProductLookup.DropDownBox.Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.ProductLookup.DropDownBox.Width', ProductLookup.DropDownBox.Width);
  ProductLookup.DropDownBox.Columns[0].Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.ProductLookup.DropDownBox.Columns[0].Width', ProductLookup.DropDownBox.Columns[0].Width);
  SenderLookup.DropDownBox.Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.SenderLookup.DropDownBox.Width', SenderLookup.DropDownBox.Width);
  SenderLookup.DropDownBox.Columns[0].Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.SenderLookup.DropDownBox.Columns[0].Width', SenderLookup.DropDownBox.Columns[0].Width);
  SenderLookup.DropDownBox.Columns[1].Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.SenderLookup.DropDownBox.Columns[1].Width', SenderLookup.DropDownBox.Columns[1].Width);
  OwnerLookup.DropDownBox.Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.OwnerLookup.DropDownBox.Width', OwnerLookup.DropDownBox.Width);
  OwnerLookup.DropDownBox.Columns[0].Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.OwnerLookup.DropDownBox.Columns[0].Width', OwnerLookup.DropDownBox.Columns[0].Width);
  OwnerLookup.DropDownBox.Columns[1].Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.OwnerLookup.DropDownBox.Columns[1].Width', OwnerLookup.DropDownBox.Columns[1].Width);
  ManufactLookup.DropDownBox.Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.ManufactLookup.DropDownBox.Width', ManufactLookup.DropDownBox.Width);
  ManufactLookup.DropDownBox.Columns[0].Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.ManufactLookup.DropDownBox.Columns[0].Width', ManufactLookup.DropDownBox.Columns[0].Width);
  ManufactLookup.DropDownBox.Columns[1].Width := Storage.ReadInteger(SectionName,
    Prefix + Name + '.ManufactLookup.DropDownBox.Columns[1].Width', ManufactLookup.DropDownBox.Columns[1].Width);
end;

procedure TLRouteSelectForm.StationLookupKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_RETURN then Key:=0;
end;

procedure TLRouteSelectForm.StationLookupChange(Sender: TObject);
begin
  UpdateLRouteLimit(nil);
end;

procedure TLRouteSelectForm.ProductLookupChange(Sender: TObject);
begin
  UpdateLRouteLimit(nil);
end;

procedure TLRouteSelectForm.SenderLookupChange(Sender: TObject);
begin
  UpdateLRouteLimit(nil);
end;

procedure TLRouteSelectForm.OwnerLookupChange(Sender: TObject);
begin
  UpdateLRouteLimit(nil);
end;

procedure TLRouteSelectForm.ManufactLookupChange(Sender: TObject);
begin
  UpdateLRouteLimit(nil);
end;

procedure TLRouteSelectForm.LRouteQueryAfterDelete(DataSet: TDataSet);
begin
  LRouteQuery.Transaction.CommitRetaining;
end;

end.
