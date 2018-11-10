unit MultiListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, DB, IBCustomDataSet, IBQuery,
  IBUpdateSQL, ComCtrls, DataUnit;

type
{ TMultiListForm }

  TMultiListForm = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    ListQuery: TIBQuery;
    ListView: TListView;
    MarkBtn: TButton;
    UnmarkBtn: TButton;
    MarkAllBtn: TButton;
    UnmarkAllBtn: TButton;
    procedure ListViewColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListViewCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure ListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure MarkBtnClick(Sender: TObject);
    procedure UnmarkBtnClick(Sender: TObject);
    procedure MarkAllBtnClick(Sender: TObject);
    procedure UnmarkAllBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    FSorted: Boolean;
    FIndex: Integer;
    FAscending: Boolean;
    FSection: string;
    procedure MarkItems(Checked: Boolean; AllItems: Boolean);
  public
    procedure FillListView(const ColumnInfos: array of TListColumnInfo);
    property Section: string read FSection write FSection;
  end;

var
  MultiListForm: TMultiListForm;

procedure MultiSelectList(const Caption, SQL: string;
  const Params: array of Integer; const StorageSection: string;
  const ColumnInfos: array of TListColumnInfo; List: TList);

procedure MultiSelectAttributes(Kind, ProductID: Integer; List: TList);
procedure MultiSelectTypeAttributes(TypeID: Integer; List: TList);
procedure MultiSelectAttributeProducts(Kind, AttrID: Integer; List: TList);
procedure MultiSelectGroupProducts(GroupID: Integer; List: TList);
procedure MultiSelectCompRoles(CompanyID: Integer; List: TList);
procedure MultiSelectFillAttributes(ProductID: Integer; List: TList);

implementation

uses
  StorageUnit;

{$R *.dfm}

procedure MultiSelectAttributes(Kind, ProductID: Integer; List: TList);
const
  ColumnInfos: array [0..2] of TListColumnInfo =
  ( (Title: ''; Width: 40),
    (Title: 'Название'; Width: 140),
    (Title: 'Описание'; Width: 200) );
begin
  MultiSelectList('Добавить атрибуты',
    'select A.ID, A.NAME, A.DESCR' +
    '  from ATTRIBUTES A' +
    '  left join ATTR_LIST AL on (AL.KIND = :KIND) and (AL.ID = :ID) and (AL.ATTR_ID = A.ID)' +
    '  where (AL.ORDER_ID is null)',
    [Kind, ProductID], 'MultiListForm.ATTR_LIST', ColumnInfos, List);
end;

procedure MultiSelectTypeAttributes(TypeID: Integer; List: TList);
const
  ColumnInfos: array [0..3] of TListColumnInfo =
  ( (Title: ''; Width: 40),
    (Title: 'Название'; Width: 100),
    (Title: 'Описание'; Width: 120),
    (Title: 'Тип'; Width: 120) );
begin
  MultiSelectList('Добавить атрибуты',
    'select A.ID, A.NAME, A.DESCR, ATT.DESCR' +
    '  from ATTRIBUTES A' +
    '  left join ATTR_TYPES ATT on (ATT.ID = A.TYPE_ID)' +
    '  where (A.TYPE_ID <> :ID)',
    [TypeId], 'MultiListForm.ATTR_TYPES.ATTR_LIST', ColumnInfos, List);
end;

procedure MultiSelectAttributeProducts(Kind, AttrID: Integer; List: TList);
const
  ColumnInfos: array [0..2] of TListColumnInfo =
  ( (Title: ''; Width: 40),
    (Title: 'Название'; Width: 140),
    (Title: 'Группа грузов'; Width: 200) );
begin
  MultiSelectList('Добавить виды грузов',
    'select P.ID, P.DESCR, PG.DESCR as GROUP_DESCR' +
    '  from PRODUCTS P' +
    '  left join PR_GROUPS PG on (P.GROUP_ID = PG.GROUP_ID)' +
    '  left join ATTR_LIST AL on (AL.KIND = :KIND) and (AL.ID = P.ID) and (AL.ATTR_ID = :ID)' +
    '  where (AL.ORDER_ID is null)',
    [Kind, AttrID], 'MultiListForm.PRODUCTS', ColumnInfos, List);
end;

procedure MultiSelectGroupProducts(GroupID: Integer; List: TList);
const
  ColumnInfos: array [0..3] of TListColumnInfo =
  ( (Title: ''; Width: 40),
    (Title: 'Код'; Width: 80; Format: '00'),
    (Title: 'Название'; Width: 140),
    (Title: 'Группа грузов'; Width: 200) );
begin
  MultiSelectList('Добавить виды грузов',
    'select P.ID, P.ID, P.DESCR, PG.DESCR as GROUP_DESCR' +
    '  from PRODUCTS P' +
    '  left join PR_GROUPS PG on P.GROUP_ID = PG.GROUP_ID' +
    '  where (P.GROUP_ID <> :GROUP_ID)',
    [GroupID], 'MultiListForm.PR_GROUPS.PRODUCTS', ColumnInfos, List);
end;

// Для налива

procedure MultiSelectFillAttributes(ProductID: Integer; List: TList);
const
  ColumnInfos: array [0..2] of TListColumnInfo =
  ( (Title: ''; Width: 40),
    (Title: 'Название'; Width: 140),
    (Title: 'Описание'; Width: 200) );
begin
  MultiSelectList('Добавить атрибуты',
    'select A.ID, A.NAME, A.DESCR' +
    '  from ATTRIBUTES A' +
    '  left join FILL_ATTR_LIST AL on (AL.PRODUCT_ID = :PRODUCT_ID) and (AL.ATTR_ID = A.ID)' +
    '  where (AL.ORDER_ID is null)',
    [ProductID], 'MultiListForm.FILL_ATTR_LIST', ColumnInfos, List);
end;


procedure MultiSelectCompRoles(CompanyID: Integer; List: TList);
const
  ColumnInfos: array [0..2] of TListColumnInfo =
  ( (Title: ''; Width: 40),
    (Title: 'Название'; Width: 140),
    (Title: 'Описание'; Width: 200) );
begin
  MultiSelectList('Добавить список ролей',
    'select R.CROLE_ID, R.NAME, R.DESCR, CR.COMPANY_ID' +
    '  from CROLES R' +
    '  left join COMP_ROLES CR on (CR.CROLE_ID = R.CROLE_ID) and (CR.COMPANY_ID = :COMPANY_ID)' +
    '  where (CR.COMPANY_ID is null)',
    [CompanyID], 'MultiListForm.COMPANIES.COMP_ROLES', ColumnInfos, List);
end;

procedure MultiSelectList(const Caption, SQL: string;
  const Params: array of Integer; const StorageSection: string;
  const ColumnInfos: array of TListColumnInfo; List: TList);
var
  Form: TMultiListForm;
  I: Integer;
  Column: TListColumn;
  ListItem: TListItem;
begin
  Form := TMultiListForm.Create(Application);
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
    Form.FillListView(ColumnInfos);
    if Form.ShowModal = mrOK then
    begin
      for I := 0 to Form.ListView.Items.Count - 1 do
      begin
        ListItem := Form.ListView.Items[I];
        if ListItem.Checked then List.Add(ListItem.Data);
      end;
    end;
  finally
    Form.Free;
  end;
end;

{ TMultiListForm }

procedure TMultiListForm.FillListView(const ColumnInfos: array of TListColumnInfo);
var
  ListItem: TListItem;
  I: Integer;
  DisplayFormat: string;
  Field: TField;
begin
  ListQuery.Open;
  try
    for I := 1 to ListQuery.Fields.Count - 1 do if I <= High(ColumnInfos) then
    begin
      DisplayFormat := ColumnInfos[I].Format;
      if DisplayFormat <> '' then
      begin
        Field := ListQuery.Fields[I];
        if Field is TNumericField then TNumericField(Field).DisplayFormat := DisplayFormat;
      end;
    end;
    while not ListQuery.Eof do
    begin
      ListItem := ListView.Items.Add;
      ListItem.Data := Pointer(ListQuery.Fields[0].AsInteger);
      for I := 1 to ListQuery.Fields.Count - 1 do
      begin
        ListItem.SubItems.Add(ListQuery.Fields[I].DisplayText);
      end;
      ListQuery.Next;
    end;
  finally
    ListQuery.Close;
  end;
end;

procedure TMultiListForm.ListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  if not FSorted or (FIndex <> Column.Index) then
  begin
    FSorted := True;
    FIndex := Column.Index;
    FAscending := True;
  end else FAscending := not FAscending;

  ListView.CustomSort(nil, Column.Index);
end;

procedure TMultiListForm.ListViewCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if Data = 0 then
  begin
    if Item1.Checked = Item2.Checked then Compare := 0
    else if Item2.Checked then Compare := 1 else Compare := -1;
  end else Compare := CompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  if not FAscending then Compare := - Compare;
end;

procedure TMultiListForm.ListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  SelectionIsNotEmpty: Boolean;
begin
  SelectionIsNotEmpty := ListView.SelCount > 0;
  MarkBtn.Enabled := SelectionIsNotEmpty;
  UnmarkBtn.Enabled := SelectionIsNotEmpty;
end;

procedure TMultiListForm.MarkItems(Checked: Boolean; AllItems: Boolean);
var
  ListItem: TListItem;
  States: TItemStates;
begin
  if not AllItems then States := [isSelected]
  else States := [isNone];
  ListItem := nil;

  while True do
  begin
    ListItem := ListView.GetNextItem(ListItem, sdAll, States);
    if ListItem = nil then Break;
    ListItem.Checked := Checked;
  end;
end;

procedure TMultiListForm.MarkBtnClick(Sender: TObject);
begin
  MarkItems(True, False);
end;

procedure TMultiListForm.UnmarkBtnClick(Sender: TObject);
begin
  MarkItems(False, False);
end;

procedure TMultiListForm.MarkAllBtnClick(Sender: TObject);
begin
  MarkItems(True, True);
end;

procedure TMultiListForm.UnmarkAllBtnClick(Sender: TObject);
begin
  MarkItems(False, True);
end;

procedure TMultiListForm.FormShow(Sender: TObject);
begin
  LoadFormState(Self, Section, '');
end;

procedure TMultiListForm.FormHide(Sender: TObject);
begin
  LoadFormState(Self, Section, '');
end;

end.
