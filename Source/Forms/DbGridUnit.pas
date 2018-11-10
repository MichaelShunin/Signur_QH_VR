unit DbGridUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DBGridEh, StdCtrls, ComCtrls, DB, Buttons,
  StorageUnit, Menus, DBCtrls, XmlIntf, IBQuery, Contnrs, Spin, IBCustomDataSet,
  IBDatabase, DateUtils, ImgList,  Math, StrUtils  ,
  {,TxDB, TxMenus,
  TxDBCtrls, TxSpin, TxStdCtrls, TxExtCtrls, TxControls, TxButtons,
  TxGrids, TxDBGridEh, TxClasses, TxForms}imagedata, dm_u;

type

{ TDBGridEh }

  TEditLimitEvent = procedure (Sender: TObject; var MaxLength: Integer) of object;

  TDBGridEh = class(DBGridEh.TDBGridEh)
  private
    FOnEditLimit: TEditLimitEvent;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function GetEditLimit: Integer; override;
  public
    property OnEditLimit: TEditLimitEvent read FOnEditLimit write FOnEditLimit;
  end;

{ TDBNavigator }

  TDBNavigator = class(DBCtrls.TDBNavigator)
  public
    procedure BtnClick(Index: TNavigateBtn); override;
  end;

{ TDbGridFrame }

  TSearchKind = (skBeginning, skPartial, skExact, skFuzzy, skEmpty, skNotEmpty);

  TDbGridFrame = class(TFrame, IRememberable)
    Grid: TDBGridEh;
    ToolPanel: TPanel;
    Label1: TLabel;
    FieldCombo: TComboBox;
    ValueEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    SearchCombo: TComboBox;
    SimilarityLabel: TLabel;
    ToolBtn: TSpeedButton;
    Bevel: TBevel;
    PopupMenu: TPopupMenu;
    SelectColumnMenuItem: TMenuItem;
    Separator2Item: TMenuItem;
    ToolMenuItem: TMenuItem;
    DataSource: TDataSource;
    TopPanel: TPanel;
    Navigator: TDBNavigator;
    ExtraPanel: TPanel;
    FormEditBtn: TSpeedButton;
    CopyToClipItem: TMenuItem;
    PasteFromClipItem: TMenuItem;
    CutToClipItem: TMenuItem;
    RefreshMenuItem: TMenuItem;
    Separator1Item: TMenuItem;
    SimilaritySpinEdit: TSpinEdit;
    Label4: TLabel;
    SetFilterBtn: TSpeedButton;
    PrevBtn: TSpeedButton;
    NextBtn: TSpeedButton;
    CancelFilterBtn: TSpeedButton;
    SaveSettingsItem: TMenuItem;
    AllBtn: TSpeedButton;
    procedure ToolBtnClick(Sender: TObject);
    procedure SearchComboChange(Sender: TObject);
    procedure ValueEditChange(Sender: TObject);
    procedure FieldComboChange(Sender: TObject);
    procedure SimilaritySpinEditChange(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure FrameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridColEnter(Sender: TObject);
    procedure ToolMenuItemClick(Sender: TObject);
    procedure GridColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure GridSortMarkingChanged(Sender: TObject);
    procedure TopPanelResize(Sender: TObject);
    procedure CopyToClipItemClick(Sender: TObject);
    procedure PasteFromClipItemClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure CutToClipItemClick(Sender: TObject);
    procedure RefreshMenuItemClick(Sender: TObject);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure KeyPressRouter(Sender: TObject; var Key: Char);
    procedure GridExit(Sender: TObject);
    procedure SetFilterBtnClick(Sender: TObject);
    procedure CancelFilterBtnClick(Sender: TObject);
    procedure SaveSettingsItemClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure SelectColumnMenuItemClick(Sender: TObject);
    procedure AllBtnClick(Sender: TObject);
  private
    FNotChangeCursor, FReadOnly: boolean;
    FForceExit: Boolean;
    FReverseSort: Boolean;
    FSortColumn: TColumnEh;
    FSortModeLock: Integer;
    FToolPanelWndProc: TWndMethod;
    FOrderByLine: string;
    FDeleteConfirmation: string;
    FOnUserDelete: TNotifyEvent;
    FRadioButtons: array of TRadioButton;
    FFiltered, FViewsVisible, FManualSave, FBrowseOnExit: boolean;
    procedure FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure ToolPanelWndProc(var Message: TMessage);
    procedure SetToolPanelVisible(Visible: Boolean);
    procedure SetFieldComboText(const Text: string);
    function GetFilterCheck: Boolean;
    procedure SetFilter(Filtered: Boolean);
    function GetSearchField: TField;
    procedure SetSearchField(ASearchField: TField);
    function GetSearchKind: TSearchKind;
    procedure SetSearchKind(ASearchKind: TSearchKind);
    procedure SyncField;
    procedure CopyFieldValue;
    procedure ExtendedCopy;
    procedure AdjustColumns;
    procedure CopyToClipboard(ClearCells: Boolean);
    procedure PasteFromClipboard;
    procedure CMFontChanged(var Msg: TMessage); message CM_FONTCHANGED;
    procedure SetReverseSort(AReverseSort: Boolean);
    function GetSortField: TField;
    procedure SetSortField(ASortField: TField);
    procedure SetSortColumn(ASortColumn: TColumnEh);
    procedure UpdateSortMode;
    function SearchOrderByLine(Strings: TStrings;
      var OrderLine: Integer): string;
    function GridIsActive: Boolean;
    procedure UpdateMarkers;
    procedure TryUpdateSortMode;
    function TryLookup: Boolean;
  protected
    procedure Loaded; override;
    procedure FontChanged; virtual;
  protected
    procedure SaveStateI(Storage: TStorage; const SectionName, Prefix: string);
    procedure LoadStateI(Storage: TStorage; const SectionName, Prefix: string);
  { IRememberable }
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string);
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ColumnByField(Field: TField): TColumnEh;
    function ColumnByFieldName(FieldName: string): TColumnEh;
    procedure ApplySoftMarking;
    procedure SetBrowseMode;
    procedure LockSortMode;
    procedure RefreshGrid; overload;
    procedure RefreshGrid(Field: TField); overload;
    procedure RefreshGrid(const Fields: array of TField); overload;
    procedure RefreshGridByID(IDField: TField; GoLast: boolean = false); overload;
    procedure SyncSortMode;
    procedure SetSortMode(Field: TField; Reverse: Boolean = False); overload;
    procedure SetSortMode(Column: TColumnEh; Reverse: Boolean = False); overload;
    procedure UnlockSortMode;
    procedure UpdateFieldList;
    procedure UpdateFilter;
    property DeleteConfirmation: string read FDeleteConfirmation write FDeleteConfirmation;
    property Filtered: Boolean read GetFilterCheck write SetFilter;
    property OnUserDelete: TNotifyEvent read FOnUserDelete write FOnUserDelete;
    property ReverseSort: Boolean read FReverseSort write SetReverseSort;
    property SearchField: TField read GetSearchField write SetSearchField;
    property SearchKind: TSearchKind read GetSearchKind write SetSearchKind;
    property SortColumn: TColumnEh read FSortColumn write SetSortColumn;
    property SortField: TField read GetSortField write SetSortField;
    property BrowseOnExit: boolean write FBrowseOnExit;
    function FindColumn(Field: TField): TColumnEh;
  end;

  
implementation

uses
  EhExtraUnit, DbGridColumnsUnit, DbUtilsEh, Clipbrd, XmlDoc, TypInfo, DBClient,
  ExtraUnit, {LookupUnit, DataUnit, }IniFiles{, FDetailUnit, MainUnit};

{$R *.dfm}
{$R *.res}


{ TDBGridEh }

procedure TDBGridEh.KeyDown(var Key: Word; Shift: TShiftState);
var
  CtrlDelete, DoConfirm: Boolean;
  CustomConfirmation: string;
  Frame: TDbGridFrame;
begin
  if not (Parent is TDbGridFrame) then
  begin
    inherited KeyDown(Key, Shift);
    Exit;
  end;

  DoConfirm := False;
  Frame := Parent as TDbGridFrame;
  CtrlDelete := (Key = VK_DELETE) and (Shift = [ssCtrl]);
  if CtrlDelete then
  begin
    DoConfirm := dgConfirmDelete in Options;
    if DoConfirm then
    begin
      CustomConfirmation := Frame.DeleteConfirmation;
      if CustomConfirmation = '' then DoConfirm := False;
    end;
  end;

  if DoConfirm then
  begin
    if not ExtraUnit.ConfirmDelete(CustomConfirmation, DataSource.DataSet) then
    begin
      Key := 0;
    end else
    begin
      if Assigned(Frame.OnUserDelete) then Frame.OnUserDelete(Self);
      Options := Options - [dgConfirmDelete];
      try
        inherited KeyDown(Key, Shift);
      finally
        Options := Options + [dgConfirmDelete];
      end;
    end;
  end else
  begin
    if CtrlDelete and Assigned(Frame.OnUserDelete) then Frame.OnUserDelete(Self);
    inherited KeyDown(Key, Shift);
  end;
end;

function TDBGridEh.GetEditLimit: Integer;
begin
  Result := inherited GetEditLimit;
  if Assigned(OnEditLimit) then OnEditLimit(Self, Result);
end;

{ TDBNavigator }

procedure TDBNavigator.BtnClick(Index: TNavigateBtn);
var
  Frame: TDbGridFrame;
  CustomConfirmation: string;
begin
  if Index = nbDelete then
  begin
    ConfirmDelete := False;
    Frame := Parent.Parent as TDbGridFrame;
    if dgConfirmDelete in Frame.Grid.Options then
    begin
      CustomConfirmation := Frame.DeleteConfirmation;
      if CustomConfirmation <> '' then
      begin
        if not ExtraUnit.ConfirmDelete(CustomConfirmation, DataSource.DataSet) then Exit;
      end;
    end;
    if Assigned(Frame.OnUserDelete) then Frame.OnUserDelete(Self);
  end;
  inherited BtnClick(Index);
end;

{ TDbGridFrame }

constructor TDbGridFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FNotChangeCursor:=false;
  FBrowseOnExit := true;
  ImageData.LoadMiddleButton(ToolBtn, mbToolFilter);
  ImageData.LoadMiddleButton(PrevBtn, mbPrev);
  ImageData.LoadMiddleButton(NextBtn, mbNext);
  ImageData.LoadMiddleButton(AllBtn, mbAll);
  ImageData.LoadMiddleButton(SetFilterBtn, mbFilter);
  ImageData.LoadMiddleButton(CancelFilterBtn, mbCancel);
  CancelFilterBtn.Enabled := false;
end;

destructor TDbGridFrame.Destroy;
begin
  inherited Destroy;
end;

procedure TDbGridFrame.ToolPanelWndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_NCHITTEST:
    begin
      if ToolPanel.ScreenToClient(Point(Message.LParamLo, 0)).X >= (ToolPanel.Width - 4)
        then Message.Result := HTRIGHT else Message.Result := HTCLIENT;
      Exit;
    end;
  end;
  FToolPanelWndProc(Message);
end;

procedure TDbGridFrame.SetToolPanelVisible(Visible: Boolean);
begin
  ToolPanel.Visible := Visible;
  ToolBtn.Down := Visible;
  ToolMenuItem.Checked := Visible;
  if Visible then
  begin
    if ValueEdit.CanFocus then ValueEdit.SetFocus;
    SyncField;
  end else
  begin
    if Grid.CanFocus then Grid.SetFocus;
  end;
  if Visible then FontChanged;
end;

procedure TDbGridFrame.SetFieldComboText(const Text: string);
var
  ItemIndex: Integer;
begin
  ItemIndex := FieldCombo.Items.IndexOf(Text);
  if (ItemIndex = -1) and (FieldCombo.Items.Count > 0) then ItemIndex := 0;
  FieldCombo.ItemIndex := ItemIndex;
  SyncField;
end;

function TDbGridFrame.GetFilterCheck: Boolean;
begin
  Result := DataSource.DataSet.Filtered;
end;

procedure TDbGridFrame.SetFilter(Filtered: Boolean);
begin
  try
    if Filtered and ((FieldCombo.ItemIndex<0) or (SearchCombo.ItemIndex<0) or
                     ((ValueEdit.Text = '') and not (SearchKind in [skEmpty, skNotEmpty])))
    then exit;

    if not FNotChangeCursor then Screen.Cursor:=crSQLWait;
    FFiltered := Filtered;
    PrevBtn.Enabled := not Filtered;
    NextBtn.Enabled := not Filtered;
    AllBtn.Enabled := not Filtered;
    CancelFilterBtn.Enabled := Filtered;
    if Filtered then begin
      ToolBtn.Glyph := nil;
      ImageData.LoadMiddleButton(ToolBtn,mbToolFilterF);
    end  
    else begin
      ToolBtn.Glyph := nil;
      ImageData.LoadMiddleButton(ToolBtn,mbToolFilter);
    end;
    UpdateFilter;
  finally
    if not FNotChangeCursor then Screen.Cursor:=crDefault;
  end;
end;

function TDbGridFrame.GetSearchField: TField;
begin
  if SearchCombo.ItemIndex < 1 then Result := nil
  else Result := TDBGridColumnEh(FieldCombo.Items.Objects[FieldCombo.ItemIndex]).Field;
end;

procedure TDbGridFrame.SetSearchField(ASearchField: TField);
var
  I: Integer;
  Column: TDBGridColumnEh;
begin
  for I := 1 to FieldCombo.Items.Count - 1 do
  begin
    Column := TDBGridColumnEh(FieldCombo.Items.Objects[I]);
    if Column.Field = ASearchField then
    begin
      FieldCombo.ItemIndex := I;
      SyncField;
      UpdateFilter;
      Break;
    end;
  end;
end;

function TDbGridFrame.GetSearchKind: TSearchKind;
begin
  Result := TSearchKind(SearchCombo.ItemIndex);
end;

procedure TDbGridFrame.SetSearchKind(ASearchKind: TSearchKind);
begin
  SearchCombo.ItemIndex := Ord(ASearchKind);
  SimilaritySpinEdit.Enabled := (ASearchKind = skFuzzy);
  UpdateFilter;
end;

function TDbGridFrame.GridIsActive: Boolean;
begin
  Result := (Grid.DataSource <> nil) and (Grid.DataSource.DataSet <> nil)
    and Grid.DataSource.DataSet.Active;
end;

procedure TDbGridFrame.SyncField;
begin
  if GridIsActive and (FieldCombo.ItemIndex > 0) then
  begin
    Grid.Col := TDBGridColumnEh(FieldCombo.Items.Objects[FieldCombo.ItemIndex]).Index;
  end;
end;

procedure TDbGridFrame.Loaded;
begin
  inherited Loaded;
  UpdateFieldList;
  FToolPanelWndProc := ToolPanel.WindowProc;
  ToolPanel.WindowProc := ToolPanelWndProc;
  if (dghAutoSortMarking  in Grid.OptionsEh) then SyncSortMode;
end;

procedure TDbGridFrame.UpdateFieldList;
var
  I: Integer;
  ItemText: string;
  Column: TColumnEh;
begin
  ItemText := FieldCombo.Text;
  FieldCombo.Items.Clear;
  FieldCombo.Items.AddObject('Везде', nil);
  for I := 0 to Grid.Columns.Count - 1 do
  begin
    Column := Grid.Columns[I];
    if Column.Visible then FieldCombo.Items.AddObject(Column.Title.Caption, Column);
  end;
  SetFieldComboText(ItemText);
end;

procedure TDbGridFrame.ToolBtnClick(Sender: TObject);
begin
  SetToolPanelVisible(ToolBtn.Down);
end;

procedure TDbGridFrame.SearchComboChange(Sender: TObject);
begin
  SearchKind := TSearchKind(SearchCombo.ItemIndex);
end;

procedure TDbGridFrame.ValueEditChange(Sender: TObject);
begin
  UpdateFilter;
end;

procedure TDbGridFrame.UpdateFilter;
begin
  if (Grid.DataSource <> nil) and (Grid.DataSource.DataSet <> nil) then
  begin
    Grid.DataSource.DataSet.DisableControls;
    if ((ValueEdit.Text = '') and not (SearchKind in [skEmpty, skNotEmpty])) or not FFiltered then
    begin
      if Grid.DataSource.DataSet.Filtered then
      begin
        Grid.DataSource.DataSet.Filtered := False;
      end;
    end else
    begin
      if Grid.DataSource.DataSet.Filtered then
      begin
        Grid.DataSource.DataSet.Filtered := False;
      end;
      Grid.DataSource.DataSet.OnFilterRecord := FilterRecord;
      Grid.DataSource.DataSet.Filtered := True;
    end;
    Grid.DataSource.DataSet.EnableControls;
  end;
end;

procedure TDbGridFrame.FilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  Field: TField;
  I: integer;
  Col:TColumnEh;

  procedure Match;
  begin
    case TSearchKind(SearchCombo.ItemIndex) of
    skBeginning:
      Accept := AnsiCompareText(ValueEdit.Text, AnsiLeftStr(Col.displayText, Length(ValueEdit.Text))) = 0;
    skPartial:
      Accept := Pos(AnsiUpperCase(ValueEdit.Text), AnsiUpperCase(Col.displayText)) <> 0;
    skExact:
      Accept := AnsiCompareText(Col.displayText, ValueEdit.Text) = 0;
    skFuzzy:
      Accept := LevenshteinSimilarity(AnsiUpperCase(ValueEdit.Text), AnsiUpperCase(Col.displayText))
        >= (SimilaritySpinEdit.Value / 100);
    skEmpty:
      Accept := (Field.IsNull) or (Col.displayText = '');
    skNotEmpty:
      Accept := not (Field.IsNull or (Col.displayText = ''));
    end;
  end;

{  procedure Match;
  begin
    case TSearchKind(SearchCombo.ItemIndex) of
    skBeginning:
      Accept := AnsiCompareText(ValueEdit.Text, AnsiLeftStr(Field.DisplayText, Length(ValueEdit.Text))) = 0;
    skPartial:
      Accept := Pos(AnsiUpperCase(ValueEdit.Text), AnsiUpperCase(Field.DisplayText)) <> 0;
    skExact:
      Accept := AnsiCompareText(Field.DisplayText, ValueEdit.Text) = 0;
    skFuzzy:
      Accept := LevenshteinSimilarity(AnsiUpperCase(ValueEdit.Text), AnsiUpperCase(Field.DisplayText))
        >= (SimilaritySpinEdit.Value / 100);
    skEmpty:
      Accept := (Field.IsNull) or (Field.AsString = '');
    skNotEmpty:
      Accept := not (Field.IsNull or (Field.AsString = ''));
    end;
  end;
}

begin
  if ((ValueEdit.Text <> '') or (SearchKind in [skEmpty, skNotEmpty])) then begin
    Accept := false;
    if (FieldCombo.ItemIndex = 0) then begin   //если по всем полям
      for I := 0 to Grid.Columns.Count - 1 do
      begin
        if Grid.Columns[I].Visible then
        begin
          Field := Grid.Columns[I].Field;
          Col:=Grid.Columns[I];
          Match;
          if Accept then exit;
        end;
      end;
    end
    else begin
      Field := TDBGridColumnEh(FieldCombo.Items.Objects[FieldCombo.ItemIndex]).Field;
      Col:=TDBGridColumnEh(FieldCombo.Items.Objects[FieldCombo.ItemIndex]);
      if (Field <> nil) then Match;
    end;
  end;
end;

procedure TDbGridFrame.FieldComboChange(Sender: TObject);
begin
  { @@@ SyncField; }
  UpdateFilter;
end;

procedure TDbGridFrame.SimilaritySpinEditChange(Sender: TObject);
begin
  UpdateFilter;
end;

procedure TDbGridFrame.PrevBtnClick(Sender: TObject);
var
  DataSet: TDataSet;
  Accept, CurAccept: Boolean;
  Bookmark: TBookmark;
  SavedCursor: TCursor;
begin
  DataSet := Grid.DataSource.DataSet;
  if DataSet <> nil then
  begin
    SavedCursor := Screen.Cursor;
    Bookmark := DataSet.GetBookmark;
    FilterRecord(DataSet, CurAccept);
    try
      Screen.Cursor := crSQLWait;
      DataSet.DisableControls;
      try
        while True do
        begin
          DataSet.Prior;
          if DataSet.Bof then Break;
          Accept := True;
          FilterRecord(DataSet, Accept);
          if Accept then Exit;
        end;
        if (Bookmark <> nil) and DataSet.BookmarkValid(Bookmark)
          then DataSet.GotoBookmark(Bookmark);
        if not CurAccept then ShowMessage('Искомое значение не найдено');
      finally
        DataSet.EnableControls;
      end;
    finally
      Screen.Cursor := SavedCursor;
      if Bookmark <> nil then DataSet.FreeBookmark(Bookmark);
    end;
  end;
end;

procedure TDbGridFrame.NextBtnClick(Sender: TObject);
var
  DataSet: TDataSet;
  Accept, CurAccept: Boolean;
  Bookmark: TBookmark;
  SavedCursor: TCursor;
begin
  DataSet := Grid.DataSource.DataSet;
  if DataSet <> nil then
  begin
    SavedCursor := Screen.Cursor;
    Bookmark := DataSet.GetBookmark;
    FilterRecord(DataSet, CurAccept);
    try
      Screen.Cursor := crSQLWait;
      DataSet.DisableControls;
      try
        while True do
        begin
          DataSet.Next;
          if DataSet.Eof then Break;
          Accept := True;
          FilterRecord(DataSet, Accept);
          if Accept then Exit;
        end;
        if (Bookmark <> nil) and DataSet.BookmarkValid(Bookmark)
          then DataSet.GotoBookmark(Bookmark);
        if not CurAccept then ShowMessage('Искомое значение не найдено');
      finally
        DataSet.EnableControls;
      end;
    finally
      Screen.Cursor := SavedCursor;
      if Bookmark <> nil then DataSet.FreeBookmark(Bookmark);
    end;
  end;
end;

procedure TDbGridFrame.AllBtnClick(Sender: TObject);
var
  DataSet: TDataSet;
  Accept, IsCicle: Boolean;
  Bookmark: TBookmark;
  SavedCursor: TCursor;
begin
  DataSet := Grid.DataSource.DataSet;
  if DataSet <> nil then
  begin
    SavedCursor := Screen.Cursor;
    Bookmark := DataSet.GetBookmark;
    try
      Screen.Cursor := crSQLWait;
      DataSet.DisableControls;
      try
        IsCicle := False;
        while True do
        begin
          DataSet.Next;
          if DataSet.Eof then
            if IsCicle then
              Break // если пройден круг и ничего не найдено
            else
            begin
              IsCicle := True;
              DataSet.First;
            end;
          Accept := True;
          FilterRecord(DataSet, Accept);
          if Accept then
            Exit;
        end;
        if (Bookmark <> nil) and DataSet.BookmarkValid(Bookmark) then
          DataSet.GotoBookmark(Bookmark);
        ShowMessage('Искомое значение не найдено');
      finally
        DataSet.EnableControls;
      end;
    finally
      Screen.Cursor := SavedCursor;
      if Bookmark <> nil then DataSet.FreeBookmark(Bookmark);
    end;
  end;
end;


procedure TDbGridFrame.SaveStateI(Storage: TStorage; const SectionName, Prefix: string);
var
  Count, I, J: Integer;
  Column: TColumnEh;
  S, ColumnPrefix: string;
begin
  Storage.WriteInteger(SectionName, '.ToolPanel.Width', ToolPanel.Width);

  S:=SectionName+'\Main';

  Count := Grid.Columns.Count;
  Storage.WriteInteger(S, 'Grid.Columns.Count', Count);
  for I := 0 to Count - 1 do
  begin
    Column := Grid.Columns[I];
    ColumnPrefix := 'Grid.Columns.' + IntToStr(I);
    Storage.WriteString(S, ColumnPrefix, Trim(Column.FieldName + '|' + Column.Title.Caption));
    Storage.WriteInteger(S, ColumnPrefix+'.Width', Column.Width);
    Storage.WriteBool(S, ColumnPrefix+'.Visible', Column.Visible);
    Storage.WriteInteger(S, ColumnPrefix+'.DropDownWidth', Column.DropDownWidth);
    for J := 0 to Column.DropDownBox.Columns.Count - 1 do begin
      Storage.WriteInteger(S, ColumnPrefix+'.DropDownWidth' + IntToStr(J), Column.DropDownBox.Columns[J].Width);
    end;
    Storage.WriteInteger(S, ColumnPrefix+'.Alignment', Integer(Column.Alignment));
  end;
end;

procedure TDbGridFrame.LoadStateI(Storage: TStorage; const SectionName, Prefix: string);
var
  Count, I, J, L, Index: Integer;
  Column, Column1: TColumnEh;
  FieldAndTitle: string;
  AutoFitColWidths: Boolean;
  S, ColumnPrefix: string;
  GridVisible: Boolean;
begin
  ToolPanel.Width := Storage.ReadInteger(SectionName, 'ToolPanel.Width', ToolPanel.Width);

  S:=SectionName+'\Main';

  GridVisible := Grid.HandleAllocated;
  if GridVisible then LockWindowUpdate(Grid.Handle);
  try
    AutoFitColWidths := Grid.AutoFitColWidths;
    Grid.AutoFitColWidths := False;
    Count := Storage.ReadInteger(S,'Grid.Columns.Count', 0);
    Index := 0;
    for I := 0 to Count - 1 do
    begin
      FieldAndTitle := Storage.ReadString(S,'Grid.Columns.' + IntToStr(I), '');
      Column := nil;
     for J := 0 to Grid.Columns.Count - 1 do
      begin
        Column1 := Grid.Columns[J];
        if Trim(Column1.FieldName + '|' + Column1.Title.Caption) = FieldAndTitle then
        begin
          Column := Column1;
          Break;
        end;
      end;
      if Column <> nil then
      begin
        // assign Index, not I to adjust columns deleted
        Column.Index := Index;
        ColumnPrefix := 'Grid.Columns.' + IntToStr(I);
        Column.Width := Storage.ReadInteger(S, ColumnPrefix + '.Width', Column.Width);
        Column.Visible := Storage.ReadBool(S, ColumnPrefix + '.Visible', Column.Visible);
        Column.DropDownWidth := Storage.ReadInteger(S, ColumnPrefix + '.DropDownWidth', Column.DropDownWidth);
        for L := 0 to Column.DropDownBox.Columns.Count - 1 do begin
          Column.DropDownBox.Columns[L].Width:=
            Storage.ReadInteger(S, ColumnPrefix+'.DropDownWidth' + IntToStr(L), Column.DropDownBox.Columns[L].Width);
        end;

        Column.Alignment := TAlignment(Storage.ReadInteger(S, ColumnPrefix + '.Alignment', Integer(Column.Alignment)));
        Inc(Index);
      end;
    end;
    Grid.AutoFitColWidths := AutoFitColWidths;
  finally
    if GridVisible then
    begin
      LockWindowUpdate(0);
      Grid.Invalidate;
    end;
  end;
  UpdateFieldList;
end;

{ IRememberable }

procedure TDbGridFrame.SaveState(Storage: TStorage; const SectionName, Prefix: string);
begin
  if not FManualSave then exit;
  SaveStateI(Storage, SectionName, Prefix);
end;

procedure TDbGridFrame.LoadState(Storage: TStorage; const SectionName, Prefix: string);
begin
  LoadStateI(Storage, SectionName, Prefix);
end;

type
  TFieldX = class(TField)
  end;

function TDbGridFrame.TryLookup: Boolean;
var
  Column: TColumnEh;
  ColumnInfos: array of TColumnInfo;
  StorageSection: string;
  Value, Values: Variant;
  Field: TField;
  I: Integer;
begin
  if DataSource.State <> dsInactive then
  begin
    Column := Grid.Columns[Grid.Col];
    if (Column.Field <> nil) and (Column.Field.FieldKind = fkLookup) and Column.CanModify(False) then
    begin
      if Column.DropDownBox.ListSource <> nil then
      begin
        Field := Column.Field.DataSet.FieldByName(Column.Field.KeyFields);
        StorageSection := 'AutoLookup.' + Field.Origin;
        Value := Field.AsVariant;
        SetLength(ColumnInfos, Column.DropDownBox.Columns.Count);
        for I := 0 to Column.DropDownBox.Columns.Count - 1 do
        begin
          ColumnInfos[I].FieldName := Column.DropDownBox.Columns[I].FieldName;
          ColumnInfos[I].Title := Column.DropDownBox.Columns[I].Title.Caption;
          ColumnInfos[I].Width := Column.DropDownBox.Columns[I].Width;
          ColumnInfos[I].Format := Column.DropDownBox.Columns[I].DisplayFormat;
        end;
    {    if TLookupForm.LookupDataSetRecord(Column.DropDownBox.ListSource.DataSet,
          Column.Title.Caption, StorageSection, ColumnInfos, Column.Field.LookupKeyFields,
          Value, Values) then
        begin
          if not (Field.DataSet.State in dsEditModes) then Field.DataSet.Edit;
          Field.Value := Value;
          Result := True;
          Exit;
        end;}
      end;
    end else if (Column.ButtonStyle = cbsEllipsis) then
    begin
      if Assigned(Column.OnEditButtonClick) then
      begin
        Result := True;
        Column.OnEditButtonClick(Grid, Result);
        Exit;
      end;
    end;
  end;
  Result := False;
end;

type
  TDBGridX = class(TDBGridEh)
  end;

procedure TDbGridFrame.FrameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  procedure TrySort(Reverse: Boolean);
  var
    Column: TColumnEh;
  begin
    if Sender = Grid then
    begin
      Column := Grid.Columns[Grid.Col];
      if Column.Title.TitleButton then
      begin
        SetSortMode(Column, Reverse);
        if Assigned(Grid.OnSortMarkingChanged) then Grid.OnSortMarkingChanged(Grid);
      end;
    end;
  end;

  procedure SetColumnAlignment(Alignment: TAlignment);
  var
    Rect: TDBGridEhSelectionRect;
    I, LeftCol, RightCol: Integer;
  begin
    if Grid.Columns.Count > 0 then
    begin
      if Grid.Selection.SelectionType = gstRectangle then
      begin
        Rect := Grid.Selection.Rect;
        LeftCol := Rect.LeftCol;
        RightCol := Rect.RightCol;
      end else
      begin
        LeftCol := Grid.Col;
        RightCol := Grid.Col;
      end;
      for I := LeftCol to RightCol do Grid.Columns[I].Alignment := Alignment;
    end;
  end;

  procedure HideColumns;
  var
    Rect: TDBGridEhSelectionRect;
    I, LeftCol, RightCol: Integer;
    Col: Integer;
  begin
    if Grid.Columns.Count > 0 then
    begin
      if Grid.Selection.SelectionType = gstRectangle then
      begin
        Rect := Grid.Selection.Rect;
        LeftCol := Rect.LeftCol;
        RightCol := Rect.RightCol;
      end else
      begin
        LeftCol := Grid.Col;
        RightCol := Grid.Col;
      end;
      for I := LeftCol to RightCol do Grid.Columns[I].Visible := False;
      Col := RightCol;
      while (Col < Grid.Columns.Count - 1) and not Grid.Columns[Col].Visible do Inc(Col);
      while (Col > 0) and not Grid.Columns[Col].Visible do Dec(Col);
      Grid.Col := Col;
    end;
  end;

var
  Index: Integer;
  XKeyEvent: TKeyEvent;
  XCol: TColumnEh;
begin

  if (Shift = [ssAlt]) and (Key = Word('A')) then
  begin
    ExtendedCopy;
    Key := 0;
    Exit;
  end;

  {if Shift * [ssCtrl, ssShift] = [ssCtrl] then
  begin
    case Key of
      VK_LEFT:
      begin
        if ToolPanel.Visible then ToolPanel.Width := ToolPanel.Width - 1;
        Key := 0;
        Exit;
      end;
      VK_RIGHT:
      begin
        if ToolPanel.Visible then ToolPanel.Width := ToolPanel.Width + 1;
        Key := 0;
        Exit;
      end;
    end;
  end;}

  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_DOWN: if NextBtn.Enabled then NextBtn.Click;
      VK_UP: if PrevBtn.Enabled then PrevBtn.Click;
      VK_RIGHT: if AllBtn.Enabled then AllBtn.Click;
      Word('B'): if Sender = Grid then CopyFieldValue;
      Word('C'), VK_INSERT: if (Sender = Grid) and not TDBGridX(Grid).InplaceEditorVisible
        then CopyToClipboard(False) else Exit;
      Word('D'): TrySort(True);
      Word('E'): if Sender = Grid then SetColumnAlignment(taCenter) else Exit;
      Word('I'): if Sender = Grid then HideColumns;
      Word('L'): if Sender = Grid then SetColumnAlignment(taLeftJustify) else Exit;
      Word('N'):
      begin
        SortColumn := nil;
        if Assigned(Grid.OnSortMarkingChanged) then Grid.OnSortMarkingChanged(Grid);
      end;
      Word('P'): Filtered := not Filtered;
      Word('S'): SetToolPanelVisible(not ToolPanel.Visible);
      Word('R'): if Sender = Grid then SetColumnAlignment(taRightJustify) else Exit;
      Word('T'): AdjustColumns;
      Word('U'): TrySort(False);
      Word('V'): if (Sender = Grid) and not TDBGridX(Grid).InplaceEditorVisible
        then PasteFromClipboard else Exit;
      Word('X'): if (Sender = Grid) and not TDBGridX(Grid).InplaceEditorVisible
        then CopyToClipboard(True) else Exit;
      else Exit;
    end;
    Key := 0;
  end else if Shift = [ssShift] then
  begin
    case Key of
      VK_INSERT: if (Sender = Grid) and not TDBGridX(Grid).InplaceEditorVisible
        then PasteFromClipboard else Exit;
      VK_DELETE: if (Sender = Grid) and not TDBGridX(Grid).InplaceEditorVisible
        then CopyToClipboard(True) else Exit;
      VK_DOWN: begin
        FReadOnly:=Grid.ReadOnly;
        Grid.ReadOnly:=true;
        XKeyEvent:=Grid.OnKeyDown;
        Grid.OnKeyDown:=nil;
        Grid.Perform(WM_KEYDOWN, VK_DOWN, 0);
        Grid.ReadOnly:=FReadOnly;
        Grid.OnKeyDown:=XKeyEvent;
      end
      else Exit;
    end;
    Key := 0;
  end else if (Shift = []) then
  begin
    if Key = VK_F5 then
    begin
      RefreshMenuItem.Click;
      Key := 0;
    end else if (Sender = Grid) then
    begin
      if Key = VK_F2 then
      begin
        if Grid.EditorMode or (DataSource.State in dsEditModes) then
        begin
          Grid.EditorMode := False;
          if DataSource.State in dsEditModes then DataSource.DataSet.Post;
          Key := 0;
        end;
      end else if Grid.Selection.SelectionType = gstRectangle then
      begin
        Grid.Selection.Clear;
      end else if Key = VK_SPACE then
      begin
        XCol := Grid.Columns[Grid.SelectedIndex];
        if XCol.CheckBoxes and (XCOl.Tag=1) then begin
          Grid.DblClick;
          Key := 0;
        end;
      end;
    end;
  end;
end;

type
  TClipboardX = class(TClipboard)
  end;

const
  xnGrid = 'grid';
  xnRow = 'row';
  xnField = 'field';
  xnValue = 'value';
  xnLookup = 'lookup';
  xnOrigin = 'origin';

procedure TDbGridFrame.CopyToClipboard(ClearCells: Boolean);
var
  DataSet: TDataSet;
  S: string;
  WS: WideString;
  I: Integer;
  Field, RealField, LookupResultField: TField;
  ClipX: TClipboardX;
  Rect: TDBGridEhSelectionRect;
  FDocument: IXMLDocument;
  RootNode, RecordNode, FieldNode: IXMLNode;
  Bookmark: TBookmarkStr;
  SingleCell: Boolean;
  LeftCol, RightCol: Integer;
  Column: TColumnEh;
  SetNull: Boolean;
begin
  DataSet := Grid.DataSource.DataSet;
  S := '';
  Rect := Grid.Selection.Rect;
  SingleCell := Grid.Selection.SelectionType <> gstRectangle;

  if SingleCell then
  begin
    LeftCol := Grid.Col;
    RightCol := Grid.Col;
  end else
  begin
    LeftCol := Rect.LeftCol;
    RightCol := Rect.RightCol;
  end;

  FDocument := TXMLDocument.Create(nil);
  FDocument.XML.Text := Format('<%0:s></%0:s>', [xnGrid]);
  FDocument.Active := True;
  RootNode := FDocument.ChildNodes[0];
  FDocument.Options := FDocument.Options + [doNodeAutoIndent];

  DataSet.DisableControls;
  try
    if not SingleCell then Bookmark := DataSet.Bookmark;
    try
      if not SingleCell then DataSet.Bookmark := Rect.TopRow;
      while True do
      begin
        RecordNode := RootNode.AddChild(xnRow);

        for I := LeftCol to RightCol do
        begin
          Column := Grid.Columns[I-1];
          if not Column.Visible then Continue;

          FieldNode := RecordNode.AddChild(xnField);

          if I > LeftCol then S := S + #9;
          Field := Column.Field;

          if Field <> nil then
          begin
            SetNull := ClearCells and Column.CanModify(False);

            if SetNull and not (DataSet.State in dsEditModes) then DataSet.Edit;

            S := S + Field.AsString;
            FieldNode.Attributes[xnValue] := Field.AsString;
            if Field.Lookup then
            begin
              RealField := Field.DataSet.FindField(Field.KeyFields);
              if RealField <> nil then
              begin
                FieldNode.Attributes[xnLookup] := RealField.AsString;
                if Field.LookupDataSet <> nil then
                begin
                  LookupResultField := Field.LookupDataSet.FindField(Field.LookupResultField);
                  if LookupResultField <> nil then
                  begin
                    FieldNode.Attributes[xnOrigin] := LookupResultField.Origin;
                  end;
                end;
                if SetNull then RealField.Clear;
              end;
            end else if SetNull then Field.Clear;
          end;
        end;
        S := S + #13#10;
        if SingleCell or (DataSet.CompareBookmarks(PChar(DataSet.Bookmark), PChar(Rect.BottomRow)) = 0)
          then Break;
        DataSet.Next;
      end;
    finally
      if not SingleCell then DataSet.Bookmark := Bookmark;
    end;
  finally
    DataSet.EnableControls;
  end;

  ClipX := TClipboardX(Clipboard);
  ClipX.Open;
  try
    ClipX.SetBuffer(CF_TEXT, PChar(S)^, Length(S) + 1);
    WS := S;
    ClipX.SetBuffer(CF_UNICODETEXT, PWideChar(WS)^, (Length(WS) + 1) * SizeOf(WideChar));
    S := FDocument.XML.Text;
    ClipX.SetBuffer(CF_DSPTEXT, PChar(S)^, Length(S) + 1);
  finally
    ClipX.Close;
  end;
end;

procedure TDbGridFrame.PasteFromClipboard;
var
  ClipX: TClipboardX;
  G: HGLOBAL;
  P: PChar;
  S: string;
  FDocument: IXMLDocument;
  RootNode, RecordNode, FieldNode: IXMLNode;
  I, J: Integer;
  ContFill: Boolean;
  LeftColumnIndex, MaxColumnIndex: Integer;
  Rect: TDBGridEhSelectionRect;
  DataSet: TDataSet;
  Field, RealField, LookupResultField: TField;
  Origin: string;
  Bookmark: TBookmarkStr;
  Insert: Boolean;
  SelectionType: TDBGridEhSelectionType;
  BottomRow: string;
  Column: TColumnEh;
begin
  if Grid.ReadOnly then Exit;

  ClipX := TClipboardX(Clipboard);
  try
    ClipX.Open;
    try
      if ClipX.HasFormat(CF_DSPTEXT) then
      begin
        G := ClipX.GetAsHandle(CF_DSPTEXT);
        P := GlobalLock(G);
        try
          S := string(P);
        finally
          GlobalUnlock(G);
        end;
      end;

      if S <> '' then
      begin
        FDocument := TXMLDocument.Create(nil);
        FDocument.XML.Text := S;
        FDocument.Active := True;

        DataSet := Grid.DataSource.DataSet;
        Insert := DataSet.State = dsInsert;

        DataSet.DisableControls;
        try
          Bookmark := DataSet.Bookmark;
          try
            SelectionType := Grid.Selection.SelectionType;
            if Insert then SelectionType := gstNon;
            case SelectionType of
              gstNon:
              begin
                ContFill := False;
                LeftColumnIndex := Grid.Col;
                MaxColumnIndex := Grid.Columns.Count - 1;
                BottomRow := '';
              end;
              gstRectangle:
              begin
                Rect := Grid.Selection.Rect;
                ContFill := DataSet.CompareBookmarks(PChar(Rect.TopRow), PChar(Rect.BottomRow)) <> 0;
                MaxColumnIndex := Rect.RightCol;
                LeftColumnIndex := Rect.LeftCol;
                if (LeftColumnIndex = MaxColumnIndex) and not ContFill then
                begin
                  MaxColumnIndex := Grid.Columns.Count - 1;
                end;
                BottomRow := Rect.BottomRow;
                DataSet.Bookmark := Rect.TopRow;
              end;
              else
              begin
                ShowMessage('Не могу вставить в выделенную область');
                Exit;
              end;
            end;

            RootNode := FDocument.ChildNodes[0];
            if RootNode.NodeName = xnGrid then
            repeat
              for I := 0 to RootNode.ChildNodes.Count - 1 do
              begin
                RecordNode := RootNode.ChildNodes.Nodes[I];
                if RecordNode.NodeName = xnRow then
                begin
                  for J := 0 to RecordNode.ChildNodes.Count - 1 do
                  begin
                    if LeftColumnIndex + J > MaxColumnIndex then Break;

                    FieldNode := RecordNode.ChildNodes.Nodes[J];
                    if FieldNode.NodeName = xnField then
                    begin
                      Column := Grid.Columns[LeftColumnIndex + J];
                      if Column.CanModify(False) then
                      begin
                        Field := Column.Field;
                        if Field <> nil then
                        begin
                          if not (DataSet.State in dsEditModes) then
                          begin
                            if Insert then DataSet.Insert else DataSet.Edit;
                          end;
                        
                          if Field.Lookup then
                          begin
                            RealField := Field.DataSet.FindField(Field.KeyFields);
                            if RealField <> nil then
                            begin
                              Origin := FieldNode.Attributes[xnOrigin];

                              if Field.LookupDataSet <> nil then
                              begin
                                LookupResultField := Field.LookupDataSet.FindField(Field.LookupResultField);
                              end else
                              begin
                                LookupResultField := nil;
                              end;

                              if (Origin = '') or ((LookupResultField <> nil) and (LookupResultField.Origin = Origin)) then
                              begin
                                RealField.AsString := FieldNode.Attributes[xnLookup];
                              end else
                              begin
                                if Field.LookupDataSet <> nil then
                                begin
                                  if Field.LookupDataSet.Locate(Field.LookupKeyFields, string(FieldNode.Attributes[xnValue]), []) then
                                  begin
                                    if LookupResultField <> nil then RealField.Value := LookupResultField.Value;
                                  end;
                                end;
                              end;
                            end;
                          end else
                          begin
                            Field.AsString := FieldNode.Attributes[xnValue];
                          end;
                        end;
                      end;
                    end;
                  end;

                  if DataSet.State in dsEditModes then DataSet.Post;
                  if not Insert then
                  begin
                    if ContFill and (DataSet.CompareBookmarks(PChar(DataSet.Bookmark), PChar(BottomRow)) = 0) then
                    begin
                      ContFill := False;
                      Break;
                    end;
                    DataSet.Next;
                  end;
                end;
              end;
            until not ContFill;
          finally
            DataSet.Bookmark := Bookmark;
          end;
        finally
          DataSet.EnableControls;
        end;
      end;
    finally
      ClipX.Close;
    end;
  except
    ShowMessage('Ошибка вставки данных из буфера обмена.');
  end;
end;

procedure TDbGridFrame.GridColEnter(Sender: TObject);
begin
  { @@@ if not Filtered and ToolPanel.Visible then
  begin
    FieldCombo.ItemIndex := FieldCombo.Items.IndexOfObject(Grid.Columns[Grid.Col]);
    UpdateFilter;
  end; }
end;

procedure TDbGridFrame.CopyFieldValue;
var
  Field: TField;
  S: string;
begin
  if ToolPanel.Visible then
  begin
    Field := Grid.Columns[Grid.Col].Field;
    if Field <> nil then
    begin
      S := Field.AsString;
      if S <> '' then
      begin
        if ValueEdit.Text <> S then
        begin
          Filtered := False;
          ValueEdit.Text := S;
        end;
      end;
    end;
  end;
end;

procedure TDbGridFrame.ExtendedCopy;
var
  Column: TColumnEh;
begin
  if Filtered then Filtered := False
  else begin
    Column := Grid.Columns[Grid.Col];
    ValueEdit.Text := Column.DisplayText;
    FieldCombo.ItemIndex := FieldCombo.Items.IndexOfObject(Column);
    UpdateFilter;
    Filtered := True;
  end;  
end;

procedure TDbGridFrame.SelectColumnMenuItemClick(Sender: TObject);
begin
  AdjustColumns;
end;

procedure TDbGridFrame.AdjustColumns;
begin
  if TDbGridColumnSetupForm.AdjustColumns(Grid) then UpdateFieldList;
end;

procedure TDbGridFrame.ToolMenuItemClick(Sender: TObject);
begin
  SetToolPanelVisible(ToolMenuItem.Checked);
end;

procedure TDbGridFrame.GridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  UpdateFieldList;
end;

function IsSQLBasedDataSet(DataSet: TDataSet; var SQL: TStrings): Boolean;
var
  FPropInfo: PPropInfo;
begin
  Result := False;
  SQL := nil;
  FPropInfo := GetPropInfo(DataSet.ClassInfo, 'SQL');
  if (FPropInfo <> nil) and (FPropInfo^.PropType^.Kind = tkClass) then
  try
    SQL := (TObject(GetOrdProp(DataSet, FPropInfo)) as TStrings);
  except // if PropInfo is not TStrings or not inherited of
  end;

  if SQL <> nil then
    Result := True;
end;

procedure TDbGridFrame.GridSortMarkingChanged(Sender: TObject);
begin
  ApplySoftMarking;
end;

function TDbGridFrame.ColumnByField(Field: TField): TColumnEh;
begin
  Result := FindColumn(Field);
//  if Result = nil then raise Exception.CreateFmt('Column for field "%s" not found', [Field.FieldName]);
end;

function TDbGridFrame.ColumnByFieldName(FieldName: string): TColumnEh;
var
  I: Integer;
begin
  for I := 0 to Grid.Columns.Count - 1 do
  begin
    Result := Grid.Columns[I];
    if Result.FieldName = FieldName then Exit;
  end;
  Result := nil;
end;

procedure TDbGridFrame.ApplySoftMarking;
begin
  if Grid.SortMarkedColumns.Count = 0 then
  begin
    FSortColumn := nil;
  end else
  begin
    FSortColumn := Grid.SortMarkedColumns[0];
    FReverseSort := FSortColumn.Title.SortMarker = smUpEh;
  end;
  UpdateSortMode;
end;

function TDbGridFrame.SearchOrderByLine(Strings: TStrings; var OrderLine: Integer): string;
var
  I: Integer;
begin
  for I := 0 to Strings.Count - 1 do
  begin
    if StrLIComp(PChar(Strings[I]), 'ORDER BY ', 9) = 0 then
    begin
      OrderLine := I;
      Result := Strings[I];
      Delete(Result, 1, 9);
      Exit;
    end;
  end;
  OrderLine := -1;
  Result := '';
end;

//самый нормальный рефреш
procedure TDbGridFrame.RefreshGridByID(IDField: TField; GoLast: boolean);
var
  XID: integer;
  XDataSet: TDataSet;
  XFound: boolean;
  IdFieldName : String; 
begin
  if IDField = nil then exit;
  IdFieldName := IDField.FieldName;  // Namy для работы с динамическими  полями
  Screen.Cursor:=crSQLWait;
  XID := IDField.AsInteger;
  XDataSet := Grid.DataSource.DataSet;
  XDataSet.DisableControls;

  try
    XFound := false;
    XDataSet.Close;
    XDataSet.Open;
    if (XDataSet is TIBCustomDataSet) and TIBCustomDataSet(XDataSet).Transaction.Active
      then TIBCustomDataSet(XDataSet).Transaction.CommitRetaining;
    XDataSet.First;
    while not XDataSet.EOF do begin
      if (XDataSet.FieldByName(IDFieldName).AsInteger = XID)
      then begin
        XFound := true;
        break;
      end;
      XDataSet.Next;
    end;
    if not XFound and not GoLast then XDataSet.First;
  finally
    XDataSet.EnableControls;
    Screen.Cursor:=crDefault;
  end;
end;


procedure TDbGridFrame.RefreshGrid;
var
  XDataSet: TDataSet;
  B: TBookMark;
begin
  Screen.Cursor:=crSQLWait;
  XDataSet := Grid.DataSource.DataSet;
  XDataSet.DisableControls;
  try
    B := XDataSet.GetBookmark;
    try
      XDataSet.Close;
      XDataSet.Open;
      if XDataSet.BookmarkValid(B) then XDataSet.GotoBookmark(B);
      if (XDataSet is TIBCustomDataSet) and TIBCustomDataSet(XDataSet).Transaction.Active
        then TIBCustomDataSet(XDataSet).Transaction.CommitRetaining;
    finally
      XDataSet.FreeBookMark(B);
    end;
  finally
    XDataSet.EnableControls;
    Screen.Cursor:=crDefault;
  end;
end;

procedure TDbGridFrame.RefreshGrid(Field: TField);
var
  XDataSet: TDataSet;
begin
  XDataSet := Grid.DataSource.DataSet;
  if (XDataSet is TIBCustomDataSet) and TIBCustomDataSet(XDataSet).Transaction.Active
      then TIBCustomDataSet(XDataSet).Transaction.CommitRetaining;
  EhExtraUnit.RefreshGrid(Grid, Field);
end;

procedure TDbGridFrame.RefreshGrid(const Fields: array of TField);
var
  XDataSet: TDataSet;
begin
  XDataSet := Grid.DataSource.DataSet;
  if (XDataSet is TIBCustomDataSet) and TIBCustomDataSet(XDataSet).Transaction.Active
      then TIBCustomDataSet(XDataSet).Transaction.CommitRetaining;
  EhExtraUnit.RefreshGrid(Grid, Fields);
end;

procedure TDbGridFrame.SyncSortMode;
var
  DataSet: TDataSet;
  Strings: TStrings;
  S: string;
  OrderLine, L, I, FieldNo: Integer;
  F, Field: TField;
  Reversed: Boolean;
  P, P1: PChar;
begin
  DataSet := DataSource.DataSet;
  if (DataSet = nil) and (Grid.DataSource <> nil) then DataSet := Grid.DataSource.DataSet;
  if DataSet = nil then Exit;

  if IsSQLBasedDataSet(DataSet, Strings) then
  begin
    S := SearchOrderByLine(Strings, OrderLine);
    if S <> FOrderByLine then
    begin
      Field := nil;
      Reversed := False;
      if S <> '' then
      begin
        L := Length(S);
        Reversed := (L > 5) and (StrIComp(PChar(S) + L - 5, ' DESC') = 0);
        if Reversed then Delete(S, L - 4, 5);
        if S[1] in ['0'..'9'] then
        begin
          FieldNo := StrToIntDef(S, 0);
          if FieldNo > 0 then
          begin
            for I := 0 to DataSet.FieldCount - 1 do
            begin
              F := DataSet.Fields[I];
              if F.FieldNo = FieldNo then
              begin
                Field := F;
                Break;
              end;
            end;
          end;
        end else
        begin
          P := PChar(S);
          P1 := StrScan(P, '.');
          if P1 <> nil then Delete(S, 1, P1 - P + 1);
          Field := DataSet.FindField(S);
        end;
      end;
//    SetSortMode(Field, Reversed);
      FSortColumn := ColumnByField(Field);
      FReverseSort := Reversed;
      UpdateMarkers;
    end;
  end;
end;

procedure TDbGridFrame.UpdateMarkers;
var
  I: Integer;
  Column: TColumnEh;
  Marker: TSortMarkerEh;
begin
  for I := 0 to Grid.Columns.Count - 1 do
  begin
    Column := Grid.Columns[I];
    if Column = SortColumn then
    begin
      if ReverseSort then Marker := smUpEh else Marker := smDownEh;
    end else Marker := smNoneEh;
    Column.Title.SortMarker := Marker;
  end;
end;

//Как оказалось, данная функция работает только для активного датасета, т.к.
//при неактивном датасете у его полей свойство FieldNo = 0.
//Убираем запоминание записи, т.е. после изменения сортировки всегда
//становимся на первую запись (ненужный код закомментирован).
procedure TDbGridFrame.UpdateSortMode;
var
  DataSet: TDataSet;
  Strings: TStrings;
  S{, KS}: string;
  I, {N,} OrderLine: Integer;
  Field: TField;
  //V: Variant;
  //IsActive: Boolean;
  Col: Integer;
  IndexName: string;
begin
  DataSet := DataSource.DataSet;
  if (DataSet = nil) and (Grid.DataSource <> nil) then DataSet := Grid.DataSource.DataSet;
  if DataSet = nil then Exit;

  if IsSQLBasedDataSet(DataSet, Strings) then
  begin
    FOrderByLine := '';

    if FSortColumn <> nil then
    begin
      Field := FSortColumn.Field;

      if (Field <> nil) and ((Field.FieldNo <= 0) or (pfHidden in Field.ProviderFlags)) then
      begin
        Field := Field.DataSet.FindField(Field.FieldName + '_');
      end;

      if (Field <> nil) and (Field.FieldNo > 0) then
      begin
        FOrderByLine := IntToStr(Field.FieldNo);
        if FReverseSort then FOrderByLine := FOrderByLine + ' DESC';
      end;
    end;

    S := SearchOrderByLine(Strings, OrderLine);

    if S <> FOrderByLine then
    begin
      //N := 0;
      //KS := '';
      Col := Grid.Col;
      {
      IsActive := DataSet.Active;
      if IsActive then
      begin
        for I := 0 to DataSet.FieldCount - 1 do
        begin
          Field := DataSet.Fields[I];
          if pfInKey in Field.ProviderFlags then
          begin
            if N = 0 then V := Field.Value else KS := KS + ';';
            KS := KS + Field.FieldName;
            Inc(N);
          end;
        end;

        if N > 1 then
        begin
          V := VarArrayCreate([0, N - 1], varVariant);
          N := 0;
          for I := 0 to DataSet.FieldCount - 1 do
          begin
            Field := DataSet.Fields[I];
            if pfInKey in Field.ProviderFlags then
            begin
              V[N] := Field.Value;
              Inc(N);
            end;
          end;
        end;
        DataSet.Close;
      end;
      }

      DataSet.Close;

      if OrderLine = -1 then
      begin
        Strings.Add('');
        OrderLine := Strings.Count - 1;
      end;

      if FOrderByLine = '' then S := '' else S := 'ORDER BY ' + FOrderByLine;
      Strings.Strings[OrderLine] := S;
      {
      if IsActive then
      begin
        DataSet.Open;
        if N > 0 then DataSet.Locate(KS, V, []);
      end;
      }
      DataSet.Open;
      Grid.Col := Col;
    end;
  end else if DataSet is TClientDataSet then
  begin
    if FSortColumn = nil then
    begin
      IndexName := '';
    end else
    begin
      IndexName := FSortColumn.Field.FieldName;
      if FReverseSort then IndexName := IndexName + '_D' else IndexName := IndexName + '_A';
    end;
    TClientDataSet(DataSet).IndexName := IndexName;
  end;
end;

procedure TDbGridFrame.SetReverseSort(AReverseSort: Boolean);
begin
  if FReverseSort <> AReverseSort then
  begin
    FReverseSort := AReverseSort;
    if FSortColumn <> nil then TryUpdateSortMode;
  end;
end;

function TDbGridFrame.GetSortField: TField;
begin
  if FSortColumn = nil then Result := nil else Result := FSortColumn.Field;
end;

function TDbGridFrame.FindColumn(Field: TField): TColumnEh;
var
  I: Integer;
begin
  if Field <> nil then
  begin
    for I := 0 to Grid.Columns.Count - 1 do
    begin
      Result := Grid.Columns[I];
      if Result.Field = Field then Exit;
    end;
  end;
  Result := nil;
end;

procedure TDbGridFrame.SetSortField(ASortField: TField);
var
  Column: TColumnEh;
begin
  Column := nil;
  if ASortField <> nil then Column := ColumnByField(ASortField);
  SetSortColumn(Column);
end;

procedure TDbGridFrame.SetSortColumn(ASortColumn: TColumnEh);
begin
  if (FSortColumn <> ASortColumn) and ((ASortColumn = nil)
    or (ASortColumn.Collection = Grid.Columns)) then
  begin
    FSortColumn := ASortColumn;
    TryUpdateSortMode;
  end;
end;

procedure TDbGridFrame.SetSortMode(Field: TField; Reverse: Boolean);
begin
  LockSortMode;
  try
    SortField := Field;
    ReverseSort := Reverse;
  finally
    UnlockSortMode;
  end;
end;

procedure TDbGridFrame.SetSortMode(Column: TColumnEh; Reverse: Boolean);
begin
  LockSortMode;
  try
    SortColumn := Column;
    ReverseSort := Reverse;
  finally
    UnlockSortMode;
  end;
end;

procedure TDbGridFrame.LockSortMode;
begin
  Inc(FSortModeLock);
end;

procedure TDbGridFrame.UnlockSortMode;
begin
  Dec(FSortModeLock);
  TryUpdateSortMode;
end;

procedure TDbGridFrame.TryUpdateSortMode;
begin
  if FSortModeLock = 0 then
  begin
    UpdateSortMode;
    UpdateMarkers;
  end;
end;

procedure TDbGridFrame.TopPanelResize(Sender: TObject);
var
  NavigatorBtnCount: Integer;
  Btn: TNavigateBtn;
begin
  NavigatorBtnCount := 0;
  for Btn := nbFirst to nbRefresh do
    if Btn in Navigator.VisibleButtons then Inc(NavigatorBtnCount);
  ExtraPanel.Width := TopPanel.Width div (NavigatorBtnCount + 1);
end;

procedure TDbGridFrame.CopyToClipItemClick(Sender: TObject);
begin
  CopyToClipboard(False);
end;

procedure TDbGridFrame.CutToClipItemClick(Sender: TObject);
begin
  CopyToClipboard(True);
end;

procedure TDbGridFrame.PasteFromClipItemClick(Sender: TObject);
begin
  PasteFromClipboard;
end;

procedure TDbGridFrame.PopupMenuPopup(Sender: TObject);
begin
  PasteFromClipItem.Enabled := not Grid.ReadOnly and Clipboard.HasFormat(CF_DSPTEXT);
end;

procedure TDbGridFrame.CMFontChanged(var Msg: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) and HandleAllocated then FontChanged;
end;

procedure TDbGridFrame.FontChanged;
begin
  ValueEdit.Top := ControlOffsetY(Label2, 4);
  AllBtn.Top := ValueEdit.Top;
  ValueEdit.Height := FieldCombo.Height;
  Label1.Top := ControlOffsetY(ValueEdit, 4);
  FieldCombo.Top := ControlOffsetY(Label1, 4);
  Label3.Top := ControlOffsetY(FieldCombo, 4);
  SearchCombo.Top := ControlOffsetY(Label3, 4);
  SimilaritySpinEdit.Top := ControlOffsetY(SearchCombo, 4);
  SimilarityLabel.Top := SimilaritySpinEdit.Top + 3;
  Label4.Top := SimilarityLabel.Top;
  SimilaritySpinEdit.Left := ControlOffsetX(SimilarityLabel,4);
  Label4.Left := ControlOffsetX(SimilaritySpinEdit,4);
  SetFilterBtn.Top := ControlOffsetY(SimilaritySpinEdit,8);
  CancelFilterBtn.Top := SetFilterBtn.Top;
  ToolPanel.Width := Max(Round(115 * Label2.Font.Size / 8), ControlOffsetX(Label4,4));
end;

procedure TDbGridFrame.RefreshMenuItemClick(Sender: TObject);
begin
  RefreshGrid;
end;

procedure TDbGridFrame.GridKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not (dghEnterAsTab in Grid.OptionsEh) then
  begin
    SelectNextControl(Grid);
    Key := #0;
  end;
end;

procedure TDbGridFrame.KeyPressRouter(Sender: TObject; var Key: Char);
begin
  EnterAsTabKeyPress(Sender, Key);
end;

procedure TDbGridFrame.GridExit(Sender: TObject);
begin
  if FBrowseOnExit then SetBrowseMode;
end;

type
  TXGrid = class(TCustomDBGridEh)
  end;

procedure TDbGridFrame.SetBrowseMode;
begin
  if not FForceExit then
  begin
    FForceExit := True;
    try
      TXGrid(Grid).DoExit;
      Grid.EditorMode := False;
      if Grid.DataSource.State in dsEditModes then
      try
        if Grid.DataSource.DataSet.Modified
        then Grid.DataSource.DataSet.Post
        else Grid.DataSource.DataSet.Cancel;
      except
        Application.HandleException(Self);
      end;
    finally
      FForceExit := False;
    end;
  end;
end;

procedure TDbGridFrame.SetFilterBtnClick(Sender: TObject);
begin
  Filtered:=true;
end;

procedure TDbGridFrame.CancelFilterBtnClick(Sender: TObject);
begin
  Filtered:=false;
  CancelFilterBtn.Enabled:=false;
end;

//сохранение настроек по меню "Фиксация" - используется для сохранения настроек, если нет видов
procedure TDbGridFrame.SaveSettingsItemClick(Sender: TObject);
var
  C: TComponent;
  XSectionName: string;

  procedure AddSName(S: string);
  begin
    if XSectionName<>'' then XSectionName:='\' + XSectionName;
    XSectionName := S + XSectionName;
  end;

begin
  XSectionName:='';
  C:=Self;
  while Assigned(C) do begin
    C:=C.Owner;
    if (C is TApplication) {or (C is TMainForm)} then break;
    if (C is TFrame) then begin
      AddSName(C.Name);
    end
    else if (C is TForm) then begin
     { if (C is TFDetailForm)
        then AddSName('EDITOR#' + C.ClassName)
        else }AddSName(C.Name);
    end;
  end;
  if XSectionName<>'' then begin
    FManualSave:=true;
//    SaveState(Storage, XSectionName + '\' + Name, '');
    FManualSave:=false;
  end;
end;

procedure TDbGridFrame.GridDblClick(Sender: TObject);
begin
  //специально пустой обработчик для борьбы с какими-то глюками
end;


end.
