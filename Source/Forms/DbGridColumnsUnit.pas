unit DbGridColumnsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBGridEh, DbGridUnit, DB, DBClient, ExtCtrls,
  Menus;

type
{ TListItemData }

  TListItemData = class(TObject)
    Index: Integer;
    Data: Pointer;
    constructor Create(AIndex: Integer; AData: Pointer);
  end;

{ TDbGridColumnSetupForm }

  TDbGridColumnSetupForm = class(TForm)
    ColumnsDataSet: TClientDataSet;
    ColumnsDataSetVISIBLE: TBooleanField;
    ColumnsDataSetTITLE: TStringField;
    ColumnsDataSetFIELD_NAME: TStringField;
    ColumnsFrame: TDbGridFrame;
    ColumnsDataSetORDER_ID: TIntegerField;
    ColumnsDataSetCOLUMN_REF: TIntegerField;
    Panel1: TPanel;
    ResetBtn: TButton;
    DownBtn: TButton;
    UpBtn: TButton;
    CancelBtn: TButton;
    OKBtn: TButton;
    ColumnsDataSetALIGNMENT: TIntegerField;
    procedure UpBtnClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);
    procedure ResetBtnClick(Sender: TObject);
    procedure ColumnsFrameGridSortMarkingChanged(Sender: TObject);
    procedure ColumnsDataSetVISIBLEChange(Sender: TField);
  private
    procedure ResetSortMarker;
  public
    class function AdjustColumns(Grid: TDBGridEh): Boolean;
    class function AdjustGridPanel(Grid: TDBGridEh; Lst :  TStrings): Boolean;
  end;

var
  DbGridColumnSetupForm: TDbGridColumnSetupForm;

implementation

uses
  Grids;

{$R *.dfm}

{ TListItemData }

constructor TListItemData.Create(AIndex: Integer; AData: Pointer);
begin
  inherited Create;
  Index := AIndex;
  Data := AData;
end;

{ TDbGridColumnSetupForm }

class function TDbGridColumnSetupForm.AdjustColumns(Grid: TDBGridEh): Boolean;
var
  Form: TDbGridColumnSetupForm;
  I: Integer;
  Column: TColumnEh;
begin
  Form := TDbGridColumnSetupForm.Create(nil);
  try
    Form.ColumnsDataSet.CreateDataSet;
    Column := Form.ColumnsFrame.Grid.Columns[1];
    Column.ImageList := Grid.TitleImages;

    for I := 0 to Grid.Columns.Count - 1 do
    begin
      Column := Grid.Columns[I];

      Form.ColumnsDataSet.Append;
      Form.ColumnsDataSetORDER_ID.AsInteger := I;
      Form.ColumnsDataSetVISIBLE.AsBoolean := Column.Visible;
      Form.ColumnsDataSetTITLE.AsString := Column.Title.Caption;
      Form.ColumnsDataSetFIELD_NAME.AsString := Column.FieldName;
      Form.ColumnsDataSetCOLUMN_REF.AsInteger := Integer(Column);
      Form.ColumnsDataSetALIGNMENT.AsInteger := Integer(Column.Alignment);
      Form.ColumnsDataSet.Post;
    end;

    Form.ColumnsDataSet.First;

    Result := Form.ShowModal = mrOK;
    if Result then
    begin
      Form.ColumnsDataSet.First;
      while not Form.ColumnsDataSet.Eof do
      begin
        Column := TColumnEh(Form.ColumnsDataSetCOLUMN_REF.AsInteger);
        Column.Index := Form.ColumnsDataSetORDER_ID.AsInteger;
        Column.Visible := Form.ColumnsDataSetVISIBLE.AsBoolean;
        Column.Alignment := TAlignment(Form.ColumnsDataSetALIGNMENT.AsInteger);
        Form.ColumnsDataSet.Next;
      end;
    end;
  finally
    Form.Free;
  end;
end;

class function TDbGridColumnSetupForm.AdjustGridPanel(Grid: TDBGridEh; Lst :  TStrings): Boolean;
var
  Form: TDbGridColumnSetupForm;
  I: Integer;
  Column: TColumnEh;
begin
  if Lst =  nil  then  Exit;
  Form := TDbGridColumnSetupForm.Create(nil);
  try
    Form.ColumnsDataSet.CreateDataSet;
    Column := Form.ColumnsFrame.Grid.Columns[1];
    Column.ImageList := Grid.TitleImages;
//    Grid['ALIGNMENT'].Visible :=  False;

    for I := 0 to Lst.Count -1  do
    begin
      Column := Grid[Lst[I]];

      Form.ColumnsDataSet.Append;
      Form.ColumnsDataSetORDER_ID.AsInteger := I;
      Form.ColumnsDataSetVISIBLE.AsBoolean := True;
      Form.ColumnsDataSetTITLE.AsString := Column.Title.Caption;
      Form.ColumnsDataSetFIELD_NAME.AsString := Column.FieldName;
      Form.ColumnsDataSetCOLUMN_REF.AsInteger := Integer(Column);
      Form.ColumnsDataSetALIGNMENT.AsInteger := Integer(Column.Alignment);
      Form.ColumnsDataSet.Post;
    end;

    for I := 0 to Grid.Columns.Count - 1 do
    begin
      Column := Grid.Columns[I];
      if Lst.IndexOf(Column.FieldName) > -1  then  continue;
      Form.ColumnsDataSet.Append;
      Form.ColumnsDataSetORDER_ID.AsInteger := I;
      Form.ColumnsDataSetVISIBLE.AsBoolean := False;
      Form.ColumnsDataSetTITLE.AsString := Column.Title.Caption;
      Form.ColumnsDataSetFIELD_NAME.AsString := Column.FieldName;
      Form.ColumnsDataSetCOLUMN_REF.AsInteger := Integer(Column);
      Form.ColumnsDataSetALIGNMENT.AsInteger := Integer(Column.Alignment);
      Form.ColumnsDataSet.Post;
    end;

    Form.ColumnsDataSet.First;

    Result := Form.ShowModal = mrOK;
    if Result then
    begin
      Lst.Clear;
      Form.ColumnsDataSet.First;
      while not Form.ColumnsDataSet.Eof do
      begin
        if Form.ColumnsDataSetVISIBLE.AsBoolean then
          Lst.Add(TColumnEh(Form.ColumnsDataSetCOLUMN_REF.AsInteger).FieldName);
        Form.ColumnsDataSet.Next;
      end;
    end;
  finally
    Form.Free;
  end;
end;


procedure TDbGridColumnSetupForm.UpBtnClick(Sender: TObject);
var
  Title: string;
  OrderId, Delta: Integer;
  Rect: TGridRect;
  Rectangled: Boolean;
begin
  Title := ColumnsDataSetTITLE.AsString;

  Rectangled := ColumnsFrame.Grid.Selection.SelectionType = gstRectangle;
  if Rectangled then
  begin
    Rect := ColumnsFrame.Grid.Selection.SelectionToGridRect;
    Delta := Rect.Bottom - Rect.Top + 1;
    ColumnsDataSet.Bookmark := ColumnsFrame.Grid.Selection.Rect.TopRow;
  end else Delta := 1;

  OrderId := ColumnsDataSetORDER_ID.AsInteger;

  if OrderId = 0 then Exit;

  ColumnsDataSet.DisableControls;
  try
    ColumnsDataSet.IndexName := '';

    ColumnsDataSet.First;
    while not ColumnsDataSet.Eof do
    begin
      if ColumnsDataSetORDER_ID.AsInteger = OrderId - 1 then
      begin
        ColumnsDataSet.Edit;
        ColumnsDataSetORDER_ID.AsInteger := ColumnsDataSetORDER_ID.AsInteger + Delta;
        ColumnsDataSet.Post;
      end else if (ColumnsDataSetORDER_ID.AsInteger >= OrderId) and
                  (ColumnsDataSetORDER_ID.AsInteger < OrderId + Delta) then
      begin
        ColumnsDataSet.Edit;
        ColumnsDataSetORDER_ID.AsInteger := ColumnsDataSetORDER_ID.AsInteger - 1;
        ColumnsDataSet.Post;
      end;

      ColumnsDataSet.Next;
    end;

    ColumnsDataSet.IndexName := 'ORDER_ID_A';

    ColumnsFrame.Grid.Selection.Clear;
  
    if Rectangled then
    begin
      ColumnsDataSet.First;
      ColumnsDataSet.MoveBy(OrderId - 1);
      ColumnsFrame.Grid.Selection.Rect.Select(Rect.Left, ColumnsDataSet.Bookmark, True);
      ColumnsDataSet.MoveBy(Delta - 1);
      ColumnsFrame.Grid.Selection.Rect.Select(Rect.Right, ColumnsDataSet.Bookmark, True);
    end;

    ColumnsDataSet.Locate('TITLE', Title, []);
    ResetSortMarker;
  finally
    ColumnsDataSet.EnableControls;
  end;
end;

procedure TDbGridColumnSetupForm.DownBtnClick(Sender: TObject);
var
  Title: string;
  OrderId, Delta: Integer;
  Rect: TGridRect;
  Rectangled: Boolean;
begin
  Title := ColumnsDataSetTITLE.AsString;

  Rectangled := ColumnsFrame.Grid.Selection.SelectionType = gstRectangle;
  if Rectangled then
  begin
    Rect := ColumnsFrame.Grid.Selection.SelectionToGridRect;
    Delta := Rect.Bottom - Rect.Top + 1;
    ColumnsDataSet.Bookmark := ColumnsFrame.Grid.Selection.Rect.BottomRow;
  end else Delta := 1;

  OrderId := ColumnsDataSetORDER_ID.AsInteger;

  if OrderId = ColumnsDataSet.RecordCount - 1 then Exit;

  ColumnsDataSet.DisableControls;
  try
    ColumnsDataSet.IndexName := '';

    ColumnsDataSet.First;
    while not ColumnsDataSet.Eof do
    begin
      if ColumnsDataSetORDER_ID.AsInteger = OrderId + 1 then
      begin
        ColumnsDataSet.Edit;
        ColumnsDataSetORDER_ID.AsInteger := ColumnsDataSetORDER_ID.AsInteger - Delta;
        ColumnsDataSet.Post;
      end else if (ColumnsDataSetORDER_ID.AsInteger <= OrderId) and
                  (ColumnsDataSetORDER_ID.AsInteger > OrderId - Delta) then
      begin
        ColumnsDataSet.Edit;
        ColumnsDataSetORDER_ID.AsInteger := ColumnsDataSetORDER_ID.AsInteger + 1;
        ColumnsDataSet.Post;
      end;

      ColumnsDataSet.Next;
    end;

    ColumnsDataSet.IndexName := 'ORDER_ID_A';

    ColumnsFrame.Grid.Selection.Clear;

    if Rectangled then
    begin
      ColumnsDataSet.First;
      ColumnsDataSet.MoveBy(OrderId - Delta + 2);
      ColumnsFrame.Grid.Selection.Rect.Select(Rect.Left, ColumnsDataSet.Bookmark, True);
      ColumnsDataSet.MoveBy(Delta - 1);
      ColumnsFrame.Grid.Selection.Rect.Select(Rect.Right, ColumnsDataSet.Bookmark, True);
    end;

    ColumnsDataSet.Locate('TITLE', Title, []);
    ResetSortMarker;
  finally
    ColumnsDataSet.EnableControls;
  end;
end;

procedure TDbGridColumnSetupForm.ResetSortMarker;
var
  I: Integer;
begin
  for I := 0 to ColumnsFrame.Grid.Columns.Count - 1 do
    ColumnsFrame.Grid.Columns[I].Title.SortMarker := smNoneEh;
end;

procedure TDbGridColumnSetupForm.ResetBtnClick(Sender: TObject);
begin
  ColumnsDataSet.IndexName := '';
  ColumnsFrame.Grid.Selection.Clear;

  ColumnsDataSet.DisableControls;
  try
    ColumnsDataSet.First;
    while not ColumnsDataSet.Eof do
    begin
      ColumnsDataSet.Edit;
      ColumnsDataSetORDER_ID.AsInteger := TColumnEh(ColumnsDataSetCOLUMN_REF.AsInteger).ID;
      ColumnsDataSetVISIBLE.AsBoolean := True;
      ColumnsDataSet.Post;

      ColumnsDataSet.Next;
    end;

    ColumnsDataSet.IndexName := 'ORDER_ID_A';
    ColumnsDataSet.First;
  finally
    ColumnsDataSet.EnableControls;
  end;

  ResetSortMarker;
end;

procedure TDbGridColumnSetupForm.ColumnsFrameGridSortMarkingChanged(Sender: TObject);
var
  I: Integer;
  Ref: Integer;
begin
  ColumnsFrame.GridSortMarkingChanged(Sender);

  I := 0;
  ColumnsDataSet.DisableControls;
  try
    Ref := ColumnsDataSetCOLUMN_REF.AsInteger;
    ColumnsDataSet.First;
    while not ColumnsDataSet.Eof do
    begin
      ColumnsDataSet.Edit;
      ColumnsDataSetORDER_ID.AsInteger := I;
      ColumnsDataSet.Post;
      Inc(I);

      ColumnsDataSet.Next;
    end;
    ColumnsDataSet.Locate('COLUMN_REF', Ref, []);
  finally
    ColumnsDataSet.EnableControls;
  end;
end;

procedure TDbGridColumnSetupForm.ColumnsDataSetVISIBLEChange(
  Sender: TField);
begin
  if ColumnsDataSetVISIBLE.IsNull then ColumnsDataSetVISIBLE.AsBoolean := False;
end;

end.
