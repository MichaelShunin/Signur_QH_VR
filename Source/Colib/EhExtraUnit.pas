unit EhExtraUnit;

interface

uses
  SysUtils, DB, DBGridEh;

procedure DeleteGridSelection(Grid: TDBGridEh);
procedure SortGridEh(Grid: TDBGridEh; Marker: TSortMarkerEh);
procedure RefreshGrid(Grid: TDBGridEh); overload;
procedure RefreshGrid(Grid: TDBGridEh; Field: TField); overload;
procedure RefreshGrid(Grid: TDBGridEh; const Fields: array of TField); overload;
function AssignFieldValue(Param: TParam; Field: TField): Boolean;
function AssignParams(Params: TParams; FromChecked: Boolean;
  FromDate: TDateTime; ToChecked: Boolean; ToDate: TDateTime): Boolean;

type
  TSelectionIteratorEh = procedure (DataSet: TDataSet) of object;
  TColumnIteratorEh = procedure (Column: TColumnEh) of object;

procedure IterateSelectionRecords(Grid: TDBGridEh; Iterator: TSelectionIteratorEh);
procedure IterateSelectionColumns(Grid: TDBGridEh; Iterator: TColumnIteratorEh);

implementation

uses
  Variants, IBCustomDataSet, IBDatabase;

procedure IterateSelectionRecords(Grid: TDBGridEh; Iterator: TSelectionIteratorEh);
var
  DataSet: TDataSet;
  Bookmark: TBookmarkStr;
  Rect: TDBGridEhSelectionRect;
begin
  if Grid.DataSource = nil then Exit;
  DataSet := Grid.DataSource.DataSet;
  if (DataSet = nil) or (DataSet.Bof and DataSet.Eof) then Exit;

  if Grid.Selection.SelectionType <> gstRectangle then
  begin
    Iterator(DataSet);
  end else
  begin
    DataSet.DisableControls;
    try
      Bookmark := DataSet.Bookmark;
      try
        Rect := Grid.Selection.Rect;
        DataSet.Bookmark := Rect.TopRow;
        while True do
        begin
          Iterator(DataSet);
          if DataSet.CompareBookmarks(PChar(DataSet.Bookmark), PChar(Rect.BottomRow)) = 0 then Break;
          DataSet.Next;
        end;
      finally
        DataSet.Bookmark := Bookmark;
      end;
    finally
      DataSet.EnableControls;
    end;
  end;
end;

procedure IterateSelectionColumns(Grid: TDBGridEh; Iterator: TColumnIteratorEh);
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
    for I := LeftCol to RightCol do Iterator(Grid.Columns[I]);
  end;
end;

function AssignFieldValue(Param: TParam; Field: TField): Boolean;
var
  PV, FV: Variant;
begin
  PV := Param.Value;
  FV := Field.Value;
  Result := VarIsNull(PV) or VarIsNull(FV) or (VarType(PV) <> VarType(FV)) or (PV <> FV);
  if Result then Param.AssignFieldValue(Field, FV);
end;

function AssignParams(Params: TParams; FromChecked: Boolean;
  FromDate: TDateTime; ToChecked: Boolean; ToDate: TDateTime): Boolean;
var
  DateFrom, IgnoreFrom, DateTo, IgnoreTo: TParam;
begin
  DateFrom := Params.FindParam('DATE_FROM');
  IgnoreFrom := Params.FindParam('IGNORE_FROM');
  DateTo := Params.FindParam('DATE_TO');
  IgnoreTo := Params.FindParam('IGNORE_TO');

  Result := (DateFrom <> nil) and (IgnoreFrom <> nil) and (DateTo <> nil) and (IgnoreTo <> nil);

  if Result then
  begin
    Result := ((IgnoreFrom.AsInteger <> Ord(not FromChecked))
      or (FromChecked and (DateFrom.AsDate <> FromDate))) or
              ((IgnoreTo.AsInteger <> Ord(not ToChecked))
      or (ToChecked and (DateTo.AsDate <> ToDate)));
      
    IgnoreFrom.AsInteger := Ord(not FromChecked);
    if FromChecked then DateFrom.AsDate := FromDate else DateFrom.Clear;
    IgnoreTo.AsInteger := Ord(not ToChecked);
    if ToChecked then DateTo.AsDate := ToDate else DateTo.Clear;
  end;
end;

procedure DeleteGridSelection(Grid: TDBGridEh);
var
  Bookmarks: TBookmarkListEh;
  I: Integer;
begin
  Bookmarks := Grid.Selection.Rows;
  if Bookmarks.Count = 0 then
  begin
    if not Grid.DataSource.DataSet.Bof or not Grid.DataSource.DataSet.Eof
      then Grid.DataSource.DataSet.Delete;
  end else
  begin
    for I := 0 to Bookmarks.Count - 1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(Pointer(Bookmarks.Items[I]));
      Grid.DataSource.DataSet.Delete;
    end;
  end;
  Grid.Selection.Clear;
end;

procedure SortGridEh(Grid: TDBGridEh; Marker: TSortMarkerEh);
begin
  if dghAutoSortMarking in Grid.OptionsEh then
  begin
    Grid.Columns[Grid.Col].Title.SortMarker := Marker;
    Grid.DefaultApplySorting;
  end;
end;

procedure CommitRetainingTransaction(DataSet: TDataSet);
var
  Transaction: TIBTransaction;
begin
  if DataSet is TIBCustomDataSet then
  begin
    Transaction := TIBCustomDataSet(DataSet).Transaction;
    if (Transaction <> nil) and Transaction.Active then Transaction.CommitRetaining;
  end;
end;

procedure RefreshGrid(Grid: TDBGridEh);
var
  DataSource: TDataSource;
  DataSet: TDataSet;
  Bookmark: Pointer;
  Col: Integer;
begin
  DataSource := Grid.DataSource;
  if DataSource <> nil then
  begin
    DataSet := DataSource.DataSet;
    if DataSet <> nil then
    begin
      Col := Grid.Col;
      Bookmark := DataSet.GetBookmark;
      try
        DataSet.DisableControls;
        try
          DataSet.Close;
          CommitRetainingTransaction(DataSet);
          DataSet.Open;
          Grid.Col := Col;
          if DataSet.BookmarkValid(Bookmark) then DataSet.GotoBookmark(Bookmark);
        finally
          DataSet.EnableControls;
        end;
      finally
        DataSet.FreeBookmark(Bookmark);
      end;
    end;
  end;
end;

procedure RefreshGrid(Grid: TDBGridEh; Field: TField);
var
  DataSource: TDataSource;
  DataSet: TDataSet;
  Value: Variant;
  Col: Integer;
begin
  DataSource := Grid.DataSource;
  if DataSource <> nil then
  begin
    DataSet := DataSource.DataSet;
    if DataSet <> nil then
    begin
      Col := Grid.Col;
      Value := Field.Value;
      DataSet.DisableControls;
      try
        DataSet.Close;
        CommitRetainingTransaction(DataSet);
        DataSet.Open;
        Grid.Col := Col;
        DataSet.Locate(Field.FieldName, Value, []);
      finally
        DataSet.EnableControls;
      end;
    end;
  end;
end;

procedure RefreshGrid(Grid: TDBGridEh; const Fields: array of TField);
var
  DataSource: TDataSource;
  DataSet: TDataSet;
  Values: Variant;
  I, N, Col: Integer;
  FieldNames: string;
  Field: TField;
begin
  N := High(Fields);
  if N = 0 then RefreshGrid(Grid, Fields[0]) else
  begin
    DataSource := Grid.DataSource;
    if DataSource <> nil then
    begin
      DataSet := DataSource.DataSet;
      if DataSet <> nil then
      begin
        Col := Grid.Col;

        Values := VarArrayCreate([0, N], varVariant);
        FieldNames := '';
        for I := 0 to N do
        begin
          Field := Fields[I];
          if I > 0 then FieldNames := FieldNames + ';';
          FieldNames := FieldNames + Field.FieldName;
          Values[I] := Field.Value;
        end;

        DataSet.DisableControls;
        try
          DataSet.Close;
          CommitRetainingTransaction(DataSet);
          DataSet.Open;
          Grid.Col := Col;
          DataSet.Locate(FieldNames, Values, []);
        finally
          DataSet.EnableControls;
        end;
      end;
    end;
  end;
end;

end.
