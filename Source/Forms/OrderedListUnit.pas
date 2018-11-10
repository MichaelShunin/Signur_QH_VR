unit OrderedListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, DB, IBCustomDataSet, IBQuery,
  IBUpdateSQL, ComCtrls, DataUnit;

type
{ TOrderedListForm }

  TOrderedListForm = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    ListQuery: TIBQuery;
    ListView: TListView;
    UpBtn: TButton;
    DownBtn: TButton;
    procedure ListViewColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListViewCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure ListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure UpBtnClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    FSorted: Boolean;
    FIndex: Integer;
    FAscending: Boolean;
    FSection: string;
    procedure ReassignIndices;
  public
    procedure FillListView;
    property Section: string read FSection write FSection;
  end;

var
  OrderedListForm: TOrderedListForm;

procedure OrderedSelectList(const Caption, SQL: string;
  const Params: array of Integer; const StorageSection: string;
  const ColumnInfos: array of TListColumnInfo; List: TList);

procedure OrderSelectProductAttributes(Kind, ProductID: Integer; List: TList);
procedure OrderSelectFillProductAttributes(ProductID: Integer; List: TList);

implementation

uses
  StorageUnit;

{$R *.dfm}

procedure OrderSelectProductAttributes(Kind, ProductID: Integer; List: TList);
const
  ColumnInfos: array [0..2] of TListColumnInfo =
  ( (Title: 'Номер пп.'; Width: 80),
    (Title: 'Название'; Width: 120),
    (Title: 'Описание'; Width: 180) );
begin
  OrderedSelectList('Порядок следования атрибутов',
    'select AL.ATTR_ID, A.NAME, A.DESCR' +
    '  from ATTR_LIST AL' +
    '  left join ATTRIBUTES A on (AL.ATTR_ID = A.ID)' +
    '  where (AL.KIND = :KIND) and (AL.ID = :ID)' +
    '  order by AL.ORDER_ID',
    [Kind, ProductID], 'OrderedListForm.ATTR_LIST', ColumnInfos, List);
end;

// Для налива

procedure OrderSelectFillProductAttributes(ProductID: Integer; List: TList);
const
  ColumnInfos: array [0..2] of TListColumnInfo =
  ( (Title: 'Номер пп.'; Width: 80),
    (Title: 'Название'; Width: 120),
    (Title: 'Описание'; Width: 180) );
begin
  OrderedSelectList('Порядок следования атрибутов',
    'select AL.ATTR_ID, A.NAME, A.DESCR' +
    '  from FILL_ATTR_LIST AL' +
    '  left join ATTRIBUTES A on (AL.ATTR_ID = A.ID)' +
    '  where (AL.PRODUCT_ID = :PRODUCT_ID)' +
    '  order by AL.ORDER_ID',
    [ProductID], 'OrderedListForm.FILL_ATTR_LIST', ColumnInfos, List);
end;


type
{ TListItemProp }

  TListItemProp = class(TObject)
    Index: Integer;
    Id: Integer;
  end;

procedure OrderedSelectList(const Caption, SQL: string;
  const Params: array of Integer; const StorageSection: string;
  const ColumnInfos: array of TListColumnInfo; List: TList);
var
  Form: TOrderedListForm;
  I: Integer;
  Column: TListColumn;
begin
  Form := TOrderedListForm.Create(Application);
  try
    Form.Caption := Caption;
    Form.ListQuery.SQL.Text := SQL;
    Form.Section := StorageSection;
    for I := Low(ColumnInfos) to High(ColumnInfos) do
    begin
      Column := Form.ListView.Columns.Add;
      Column.Caption := ColumnInfos[I].Title;
      Column.Width := ColumnInfos[I].Width;
    end;
    for I := 0 to Form.ListQuery.Params.Count - 1 do
    begin
      Form.ListQuery.Params[I].AsInteger := Params[I];
    end;
    Form.FillListView;
    if Form.ShowModal = mrOK then
    begin
      for I := 0 to Form.ListView.Items.Count - 1
        do List.Add(Pointer(TListItemProp(Form.ListView.Items[I].Data).ID));
    end;
  finally
    Form.Free;
  end;
end;

{ TOrderedListForm }

procedure TOrderedListForm.FillListView;
var
  ItemProp: TListItemProp;
  ListItem: TListItem;
  Index, I: Integer;
begin
  ListQuery.Open;
  try
    Index := 0;
    while not ListQuery.Eof do
    begin
      ListItem := ListView.Items.Add;
      ItemProp := TListItemProp.Create;
      ListItem.Data := ItemProp;
      ItemProp.Index := Index;
      Inc(Index);
      ItemProp.Id := ListQuery.Fields[0].AsInteger;
      ListItem.Caption := IntToStr(Index);
      for I := 1 to ListQuery.Fields.Count - 1 do
      begin
        ListItem.SubItems.Add(ListQuery.Fields[I].AsString);
      end;
      ListQuery.Next;
    end;
  finally
    ListQuery.Close;
  end;
  ListView.CustomSort(nil, -1);
end;

procedure TOrderedListForm.ListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  if not FSorted or (FIndex <> Column.Index) then
  begin
    FSorted := True;
    FIndex := Column.Index;
    FAscending := True;
  end else FAscending := not FAscending;

  ListView.CustomSort(nil, Column.Index);
  ReassignIndices;
end;

procedure TOrderedListForm.ReassignIndices;
var
  I: Integer;
begin
  for I := 0 to ListView.Items.Count - 1 do
    TListItemProp(ListView.Items[I].Data).Index := I;
end;

function IntegerCompare(I1, I2: Integer): Integer;
begin
  if I1 > I2 then Result := 1
  else if I1 = I2 then Result := 0
  else Result := -1;
end;

procedure TOrderedListForm.ListViewCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if Data = -1 then
  begin
    Compare := IntegerCompare(TListItemProp(Item1.Data).Index, TListItemProp(Item2.Data).Index);
    // do not count asc/desc mode !!!
    Exit;
  end else if Data = 0 then Compare := IntegerCompare(StrToIntDef(Item1.Caption, 0), StrToIntDef(Item2.Caption, 0))
  else Compare := CompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  if not FAscending then Compare := - Compare;
end;

procedure TOrderedListForm.ListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  SelectionIsNotEmpty: Boolean;
begin
  SelectionIsNotEmpty := ListView.SelCount > 0;
  UpBtn.Enabled := SelectionIsNotEmpty;
  DownBtn.Enabled := SelectionIsNotEmpty;
end;

procedure TOrderedListForm.UpBtnClick(Sender: TObject);
var
  I: Integer;
  ListItem, ListItem1: TListItem;
begin
  ListItem := ListView.Items[0];
  for I := 1 to ListView.Items.Count - 1 do
  begin
    ListItem1 := ListView.Items[I];
    if not ListItem.Selected and ListItem1.Selected then
    begin
      Inc(TListItemProp(ListItem.Data).Index);
      Dec(TListItemProp(ListItem1.Data).Index);
    end else
    begin
      ListItem := ListItem1;
    end;
  end;
  ListView.CustomSort(nil, -1);
end;

procedure TOrderedListForm.DownBtnClick(Sender: TObject);
var
  I: Integer;
  ListItem, ListItem1: TListItem;
begin
  ListItem := ListView.Items[ListView.Items.Count - 1];
  for I := ListView.Items.Count - 2 downto 0 do
  begin
    ListItem1 := ListView.Items[I];
    if not ListItem.Selected and ListItem1.Selected then
    begin
      Dec(TListItemProp(ListItem.Data).Index);
      Inc(TListItemProp(ListItem1.Data).Index);
    end else
    begin
      ListItem := ListItem1;
    end;
  end;
  ListView.CustomSort(nil, -1);
end;

procedure TOrderedListForm.FormShow(Sender: TObject);
begin
  LoadFormState(Self, Section, '');
end;

procedure TOrderedListForm.FormHide(Sender: TObject);
begin
  SaveFormState(Self, Section, '');
end;

end.
