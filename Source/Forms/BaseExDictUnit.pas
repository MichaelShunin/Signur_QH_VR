unit BaseExDictUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDictUnit, IBCustomDataSet, IBUpdateSQL, DB, IBQuery,
  ImgList, ComCtrls, DbGridUnit, ToolWin, ExtCtrls, StdCtrls, DBCtrls, DBCtrlsEh,
  Menus,DBGridEh,StrUtils, StorageUnit, Mask, DBLookupEh, Contnrs, Buttons, DBGrids, gridreport,
  xlreport;

type
  TDictInfo = record
      Caption : String;
      DictClass : TFormClass;
      TableName,
      KeyFld,
      FieldList,
      GenName,
      Where_Conditions,
      ColumnList : string;
      ALIAS : String;
      Show_detail:boolean;
  end;


  TBaseDictExForm = class(TBaseDictForm, IRememberable)
    btnExcel: TToolButton;
    btnIA: TToolButton;
    pmIntervalAct: TPopupMenu;
    miIANew: TMenuItem;
    miIAFltr: TMenuItem;
    miIAFltr2: TMenuItem;
    miIABreake: TMenuItem;
    miNoIA: TMenuItem;
    Splitter1: TSplitter;
    pnBottom: TPanel;
    pcDetail: TPageControl;
    tsAddPanel: TTabSheet;
    ScrollBox1: TScrollBox;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miPanelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MainQueryNewRecord(DataSet: TDataSet);
    procedure MainQueryAfterOpen(DataSet: TDataSet);
    procedure btnExcelClick(Sender: TObject);
    procedure MainQueryPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure miIAFltrClick(Sender: TObject);
    procedure miIAFltr2Click(Sender: TObject);
    procedure miNoIAClick(Sender: TObject);
    procedure miIANewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FISDetail : Boolean;
    FMasterField : String;
    FDetailField : String;
    FLookupList, lstPnlFlds  : TStringList;
    Prepared : Boolean;
    PanelConstructed : Boolean;
    fActDate : TDate;
    fIAFld1 : String;
    fIAFld2 : String;
//    fFieldList : String;
    FDetailForms : TObjectList;
    FPanelMondatoryFields :  String;
    LocateFields:string;
    LocateValues:variant;
  protected
    procedure SetPanelMondatoryFields(const AFields : String);
    procedure GetLookupFldTxt(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string);
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string);

    procedure ConstructPanel; virtual; 
    procedure PrepareUpdateSQL(const TableName, KeyFld, FieldList : String);
    procedure PrepareMainQuery(const TableName, KeyFld, FieldList, GenName : String;
                           Where_Conditions : string = '');
    procedure PrepareQuery(const TableName, KeyFld, FieldList, GenName : String);
    procedure BuildColumns(const TableName,  FieldList: String);


    { Private declarations }
    procedure  SetActualityToday;
    procedure  SetActualityAtDate(D : TDate);
    procedure  SetNoActuality;
    procedure  DisplayActFltrStatus(const Msg: String);



    procedure InspectPageControl;
    procedure CommonOpen; override;
    procedure FontChanged; override;

    procedure CommonRefresh; override;
    procedure FillLookupFields;

  public
    procedure PrepareLookUpColumn  (Grd: TDBGridEh; const FN: String;
                                    const LookUpTableName,
                                    LookUpKeyFld,
                                    LookUpDisplayFld : string;
                                    SQLTEXT : String = '');
    procedure AddIntervalAct(IAFld1,IAFld2: String);
    procedure PrepareForm(const TableName, KeyFld, FieldList, GenName: String;
                           Where_Conditions : string = ''; ColumnList : string = '');
    procedure PrepareAsDetail(const AMasterField, ADetailField: String);
    procedure GetFieldList(TableName:string);

    procedure InitOther; //для дополнительной инициализации геометрии, когда форма используется как дочерняя у другой формы
    procedure AddDetail(Frm : TBaseDictExForm);
    class function GetForm(AOwner : TComponent; const ALIAS : String; DictClass : TFormClass;  const Suf : String = '1' ) : TForm;
    {  В  модальном режиме открывает  справочник и возвращает ResultValue, как VarArray
       ResultFlds -  список  нужных  полей через ";".
       Если полей  больше одного,  то массим 2-мерный  иначе  одномерный, но всегда  массив.
       (Даже  если выбрана только одна запись)
       Пример:
       var V : Variant;
       ..............
       if not TBaseDictExForm.SelectRows(TSomeDictForm, 'ID;NAME' , V) then  exit;;
       for i := 0  to VarArrayHighBound(V, 1) do
       begin
         .... V[i][0]... ; // ID
         .... V[i][1]... ; // NAME
         // Если  поле одно то обращение как 1-мерному  массиву ...V[i]...
       end;

    }
    class function SelectRows(const DictInfo : TDictInfo; const ResultFlds :  String;
                              var ResultValue : Variant ;
                              var LocValues: variant ;
                              const locFields: string = '' ;
                              const Suf : String = '1' ) :  Boolean;
    { Public declarations }
  end;

//  function GenerateSQLText(const TableName,Fields,KeyFields: string; SQL_Kind: TSQL_Kind): string;

var
  BaseDictExForm: TBaseDictExForm;

implementation

uses DataUnit, DbGridColumnsUnit, DateUtils, mnUtils,
     MaximizedUnit;//, tfSecurity,SecurityUtils;

{$R *.dfm}

procedure TBaseDictExForm.InitOther;
begin
  if not PanelConstructed then
  begin
    ConstructPanel;
    InspectPageControl;
    PanelConstructed :=  True;
  end;
end;

procedure TBaseDictExForm.ConstructPanel;
var
  i : Integer;
  LeftOffset : integer;

  function AddCtrl(CC : TControlClass;  Pnl : TWinControl; var top_ : integer): TControl;
  begin
     result  := CC.Create(Pnl);
     result.Parent := Pnl;
     result.SetBounds(LeftOffset, top_ , Pnl.ClientWidth -  LeftOffset*3 , result.Height);
     Inc(top_, result.Height);
  end;

  procedure AddLbl(const Cap: String;  Pnl : TWinControl; var top_ : integer);
  var
    lbl : TLabel;
  begin
    lbl :=AddCtrl(TLabel, Pnl, top_) as TLabel;
    lbl.Caption := Cap;
    Inc(top_,2);
  end;

  procedure LinkDBCtrl(Ctrl : TControl; fn : String);
  var
    DataLink  : TFieldDataLink;
  begin
    // Для ЭхЛиба  почему то не работает через DataLink
    if Ctrl is TCustomDBEditEh then
    with Ctrl as TCustomDBEditEh do
    begin
      DataSource := GridFrame.DataSource;
      DataField  := fn;
    end else
    begin
      DataLink := TFieldDataLink(ctrl.Perform(CM_GETDATALINK, 0, 0));
      if DataLink <> nil then
      begin
        DataLink.FieldName  := fn;
        DataLink.DataSource := GridFrame.DataSource;
        DataLink.Reset;
      end;
    end;
  end;

var
  top_ : Integer;
  dbctrl : TControl;
  Col : TDBGridColumnEh;
  Pnl : TWinControl;
  sit : IStringIterator;
  idx : Integer;
begin
  ScrollBox1.AutoScroll :=  False;
  Pnl := ScrollBox1;

  While Pnl.ControlCount > 0  do Pnl.Controls[0].Free;
  LeftOffset :=  10 ;
  top_ := 10;

//  for I := 0  to GridFrame.Grid.Columns.Count -1  do

  // Принудительно  вставляем  поля в доп. панеь.
  sit := GetStringIterator(FPanelMondatoryFields);
  while not sit.Eof do
  begin
    sit.Next;
    idx :=  lstPnlFlds.IndexOf(sit.GetItem);
    if idx <> sit.GetIndex then
    begin
      if  idx = -1 then
       lstPnlFlds.Insert(sit.GetIndex, sit.GetItem)
      else
       lstPnlFlds.Exchange(sit.GetIndex, idx);
    end;
  end;


  for I := 0  to lstPnlFlds.Count -1  do
  begin
    try
      Col := GridFrame.Grid[lstPnlFlds[i]] as TDBGridColumnEh;
    except
      Continue;
    end;
//    if  Col.Visible or (Col.Field =  nil) then Continue;

    if {MEMO}((Col.Field is TStringField) and (Col.Field.Size > 250))  or
       ((Col.Field is TMemoField))  then
    begin
      AddLbl(Col.Title.Caption , Pnl,  top_);
      dbctrl := AddCtrl(TDBMemo, Pnl, top_);
      Dec(top_, dbctrl.Height - 50);
      dbctrl.Height := 50;
    end else if {CHEXBOX}Col.Checkboxes then
    begin
      dbctrl := AddCtrl(TDBCheckBox, Pnl, top_);
      (dbctrl as TDBCheckBox).ValueChecked := Col.KeyList[0];
      (dbctrl as TDBCheckBox).ValueUnchecked := Col.KeyList[1];
      (dbctrl as TDBCheckBox).Caption  := Col.Title.Caption;
    end else if {DateTimePicker} (Col.Field is TDateTimeField) then
    begin
      AddLbl(Col.Title.Caption , Pnl,  top_);
      dbctrl := AddCtrl(TDBDateTimeEditEh, Pnl, top_);
    end else {ComboBox} if (Col.KeyList.Count > 0) and (Col.PickList.Count > 0) then
    begin
      AddLbl(Col.Title.Caption , Pnl,  top_);
      dbctrl := AddCtrl(TDBComboBoxEh, Pnl, top_);
      (dbctrl  as TDBComboBoxEh).Items.Assign(Col.PickList);
      (dbctrl  as TDBComboBoxEh).KeyItems.Assign(Col.KeyList);
    end else {EDIT}
    begin
      AddLbl(Col.Title.Caption { ' (' + Col.Field.ClassName + ')' }, Pnl,  top_);
      dbctrl := AddCtrl(TDBEditEh, Pnl, top_);
      dbctrl.Name :=  'Edit_' +  Col.FieldName; 
    end;
    LinkDBCtrl(dbctrl, Col.FieldName);
    dbctrl.Anchors := [akLeft, akTop, akRight];
    dbctrl.Hint := Col.Title.Hint;
    Inc(top_,7);
  end;

  ScrollBox1.AutoScroll :=  True;

//  Pnl.Height := top_ + 10;
end;

procedure TBaseDictExForm.FormActivate(Sender: TObject);
begin
  inherited;
  if not PanelConstructed then
  begin
    ConstructPanel;
    InspectPageControl; 
    PanelConstructed :=  True;
  end;
end;

procedure TBaseDictExForm.FormCreate(Sender: TObject);
var
  miPanel : TMenuItem;
begin
  inherited;
  FDetailForms := TObjectList.Create(False);
  lstPnlFlds  := TStringList.Create;
  lstPnlFlds.CaseSensitive := False;
  PanelConstructed :=  False;
  Prepared :=  False;
  MainQuery.Database :=  CommonData.Database;
  miPanel := TMenuItem.Create(Self);
  miPanel.Name := 'miPanel';
  miPanel.OnClick := miPanelClick;
  miPanel.Caption := 'Доп. панель';
  GridFrame.PopupMenu.Items.Add(miPanel) ;
  MainQuery.UpdateObject := MainUpdate;
  FLookupList := TStringList.Create;
end;

procedure TBaseDictExForm.PrepareUpdateSQL(const TableName, KeyFld, FieldList : String);
begin
  MainUpdate.InsertSQL.Text  := GenerateSQLText( TableName, FieldList, KeyFld, skInsert);
  MainUpdate.ModifySQL.Text  := GenerateSQLText( TableName, FieldList, KeyFld, skUpdate);
  MainUpdate.DeleteSQL.Text  := GenerateSQLText( TableName, FieldList, KeyFld, skDelete);
  MainUpdate.RefreshSQL.Text := GenerateSQLText( TableName, FieldList, KeyFld, skSelect);
end;

procedure TBaseDictExForm.PrepareMainQuery(const TableName, KeyFld, FieldList, GenName : String;
                           Where_Conditions : string = '');
begin
  MainQuery.SQL.Text := GenerateSQLText( TableName, FieldList, '', skSelect);
  if  (Where_Conditions<>'') then
    begin
     MainQuery.SQL.Add(' Where ');
     MainQuery.SQL.Add(Where_Conditions);
    end; //  для Where
  MainQuery.SQL.Add('');
  MainQuery.SQL.Add('ORDER BY 1'); //  Нужно пока  для  механизма  сортировки
  if GenName > '' then
  with MainQuery.GeneratorField do
  begin
    Field := KeyFld;
    Generator := GenName;
    IncrementBy := 1;
    ApplyEvent  := gamOnPost;
  end;
end;

procedure TBaseDictExForm.PrepareQuery(const TableName, KeyFld, FieldList, GenName : String);
begin
  PrepareUpdateSQL(TableName, KeyFld, FieldList);
  PrepareMainQuery(TableName, KeyFld, FieldList, GenName);
end;

function  DelComments(AText: String; StartCom, EndCom : String): String;
var
  l1,l2 : integer;
begin
  result := AText;
  l1 := Pos(StartCom, AText);
  l2 := Pos(EndCom, AText);
  if (l1>0) and (l2>0) and (l2>l1) then
    result := Copy(AText, 1, l1-1) + Copy(AText, l2 + Length(EndCom),  Length(AText));
end;

procedure TBaseDictExForm.BuildColumns(const TableName,  FieldList: String);
var
  i  : Integer;
  Descr : String;
  C : TColumnEh;
  fn : String;

  procedure ProcessCheckBox;
  begin
    if Pos('CHECKBOX',  AnsiUpperCase(Descr) ) > 0  then
    begin
      C.KeyList.CommaText := '1,0';
      C.Checkboxes  :=  True;
    end;
    Descr :=  AnsiReplaceText(Descr, 'CHECKBOX', '');
  end;

  procedure ProcessList;
  var
    l :  Integer;
  begin
    l := Pos('LIST=',  AnsiUpperCase(Descr) );
    if l > 0  then
    begin
      C.KeyList.CommaText := ExtractString('(', ')', Copy(Descr, l+1, Length(Descr)));
      C.PickList.Assign(C.KeyList);
    end;
    Descr :=  AnsiReplaceText(Descr, C.KeyList.CommaText, '');
    Descr :=  AnsiReplaceText(Descr, 'LIST=', '');
  end;

  procedure ProcessMatch;
  var
    l :  Integer;
    s :  String;
    kl,pl : String;
  begin
    l := Pos('MATCH=',  AnsiUpperCase(Descr) );
    if l > 0  then
    begin
      S := ExtractString('(', ')', Copy(Descr, l+1, Length(Descr)));
      SplitString(s, '=', kl, pl);
      C.KeyList.CommaText := kl;
      C.PickList.CommaText :=  pl;
    end;
    Descr :=  AnsiReplaceText(Descr, C.KeyList.CommaText, '');
    Descr :=  AnsiReplaceText(Descr, 'MATCH=', '');
  end;

begin
  GridFrame.Grid.Columns.Clear;
  i := 1;
  while i <= Length(FieldList) do
  begin
    FN:= ExtractFieldName(FieldList, i);
    if FN = '' then Continue;
    C := GridFrame.Grid.Columns.Add;
    with C do
    begin
      FieldName :=  FN;
      MaxWidth := GridFrame.Grid.Canvas.TextWidth(DupeString('W', 50));
      Descr  := CommonData.GetFieldDescr( AnsiUpperCase('"'+ TableName + '"."' + FieldName + '"'));

      ProcessCheckBox;
      ProcessList;
      ProcessMatch;

      Title.Hint :=  Descr;
      Title.Caption := DelComments(Descr, '{', '}');
      if Title.Caption = '' then Title.Caption := FieldName;
    end;
  end;
end;

procedure TBaseDictExForm.PrepareForm(const TableName, KeyFld, FieldList, GenName: String;
                           Where_Conditions : string = ''; ColumnList : string = '');
var
  lst : TStringList;
  i:integer;
  ColName:string;
begin
  if Prepared then  exit;
  FIDFieldName := KeyFld;
  if FieldList = '*' then
  begin
    lst := TStringList.Create;
    CommonData.Database.GetFieldNames(TableName, lst);
    fFieldList := AnsiReplaceText(lst.CommaText, ',', ';');
    lst.Free;
  end else
  begin
    fFieldList := FieldList;
  end;
  PrepareUpdateSQL(TableName, KeyFld, fFieldList);
  PrepareMainQuery(TableName, KeyFld, fFieldList, GenName,Where_Conditions);
  BuildColumns(TableName, fFieldList) ;
  if ColumnList<>'' then
   begin
    for i:=0 to GridFrame.Grid.Columns.count-1 do
      begin
       colname:=GridFrame.Grid.Columns[i].FieldName;
       GridFrame.Grid.Columns[i].Visible:=pos(Colname,ColumnList)>0;
      end;
   end;
  Prepared :=  True;
end;


procedure TBaseDictExForm.miPanelClick(Sender: TObject);
begin
  if TDbGridColumnSetupForm.AdjustGridPanel(GridFrame.Grid, lstPnlFlds) then
  begin
    ConstructPanel;
    InspectPageControl;
  end;
end;
//------------------------------------------------------------------------------
procedure TBaseDictExForm.SaveState(Storage: TStorage; const SectionName, Prefix: string);
begin
  Storage.WriteString(SectionName, Prefix + Name + '.PnlFlds', lstPnlFlds.CommaText);
  Storage.WriteInteger(SectionName, Prefix + Name + '.PnlDetailHeight', pcDetail.Height);
end;
//------------------------------------------------------------------------------
procedure TBaseDictExForm.LoadState(Storage: TStorage; const SectionName, Prefix: string);
begin
  lstPnlFlds.CommaText := Storage.ReadString(SectionName, Prefix + Name + '.PnlFlds', '');
  pcDetail.Height := Storage.ReadInteger(SectionName, Prefix + Name + '.PnlDetailHeight', pcDetail.Height);
end;
//------------------------------------------------------------------------------
procedure TBaseDictExForm.FormDestroy(Sender: TObject);
begin
  inherited;
  lstPnlFlds.Free;
  FLookupList.Free;
end;

procedure TBaseDictExForm.FontChanged;
var
  i : Integer;
  frm : TBaseDictExForm;
begin
  inherited;
  ConstructPanel;
  for i := 0  to FDetailForms.Count - 1 do
  begin
     frm  := FDetailForms[i] as TBaseDictExForm; 
     frm.Font.Assign(Self.Font);
  end;
end;
//------------------------------------------------------------------------------
procedure TBaseDictExForm.MainQueryNewRecord(DataSet: TDataSet);
var
  i : Integer;
  Dflt : String;
begin
  inherited;
  if FISDetail then MainQuery[FDetailField] := MainQuery.DataSource.DataSet[FMasterField]; 

  for i := 0  to MainQuery.Fields.Count -1  do
  begin
    Dflt := CommonData.GetFieldDefault( MainQuery.Fields[i].Origin );
    if Dflt > '' then
    begin
       if (MainQuery.Fields[i] is TDateTimeField) and AnsiSameText('now', dflt) then
         MainQuery.Fields[i].Value := VarAsDate(Date); 
       MainQuery.Fields[i].AsString := Dflt;
    end;
  end;

  for i := 0  to GridFrame.Grid.Columns.Count -1  do
  begin
    if (GridFrame.Grid.Columns[i].Field <> nil)
       and GridFrame.Grid.Columns[i].Field.Required
       and (not GridFrame.Grid.Columns[i].Field.ReadOnly)
    then
    begin
      GridFrame.Grid.SelectedIndex := i;
      break;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TBaseDictExForm.MainQueryAfterOpen(DataSet: TDataSet);
var
  i : Integer;
begin
  inherited;
  for i := 0  to MainQuery.Fields.Count -1  do
  begin
    MainQuery.Fields[i].DisplayLabel :=
        DelComments(CommonData.GetFieldDescr( MainQuery.Fields[i].Origin),'{','}');

    if AnsiSameText(MainQuery.Fields[i].FieldName , FIDFieldName)
      then  MainQuery.Fields[i].ReadOnly := True;
  end;
end;

procedure TBaseDictExForm.PrepareLookUpColumn(Grd: TDBGridEh; const FN: String;
                              const LookUpTableName,
                                    LookUpKeyFld,
                                    LookUpDisplayFld : String;
                                    SQLTEXT : String = '' );
//var
//  Col  : TColumnEh;
begin
{  Col := Grd[FN];
  if Col =  nil  then  exit;
  Col.KeyList.Clear;
  Col.PickList.Clear;
  with CommonData.AnyQuery do
  begin}
    if SQLTEXT = '' then  SQLTEXT := GenerateSQLText(LookUpTableName, LookUpKeyFld + ';' + LookUpDisplayFld, '', skSelect) + ' Order by '+LookUpDisplayFld;
    FLookupList.AddObject(FN + '=' + AnsiQuotedStr(SQLTEXT, '"'), Grd);
    {SQL.Text := SQLTEXT;
    Open;                         
    Col.ReadOnly := IsEmpty;
    while  not Eof do
    begin
      Col.KeyList.Add(Fields[0].AsString);
      Col.PickList.Add(Fields[1].AsString);
      Next;
    end;
  end;}
end;

procedure TBaseDictExForm.btnExcelClick(Sender: TObject);
var
  i : Integer;
  fld : TField;
  Col : TColumnEh;
begin
{  for i := 0  to  MainQuery.Fields.Count -1  do
  begin
    fld := MainQuery.Fields[i];
    col := GridFrame.Grid[fld.FieldName];
    if  (col <> nil) and (col.KeyList.Count > 0) and (Col.PickList.Count > 0 ) then
      Fld.OnGetText := GetLookupFldTxt;
  end; }

  for i := 0  to  GridFrame.Grid.Columns.Count -1  do
  begin
    fld := GridFrame.Grid.columns[i].Field;
    col := GridFrame.Grid.Columns[i];
    if  (col <> nil) and (col.KeyList.Count > 0) and (Col.PickList.Count > 0 ) then
      Fld.OnGetText := GetLookupFldTxt;
  end;

  GenerateGridReport( ExtractFileDir(ParamStr(0)) + '\reports\' + Caption +formatdatetime('yymmddhhmmss',now)+ '.xls',
     '','',GridFrame.Grid,  xlreport.xdmVariant,nil, Caption );

{  for i := 0  to  MainQuery.Fields.Count -1  do
  begin
    fld := MainQuery.Fields[i];
    col := GridFrame.Grid[fld.FieldName];
    if  (col <> nil) and (col.KeyList.Count > 0) and (Col.PickList.Count > 0) then
      Fld.OnGetText := nil;
  end;}
  for i := 0  to  GridFrame.Grid.Columns.Count -1   do
  begin
    fld := GridFrame.Grid.columns[i].Field;
    col := GridFrame.Grid.Columns[i];
    if  (col <> nil) and (col.KeyList.Count > 0) and (Col.PickList.Count > 0) then
      Fld.OnGetText := nil;
  end;
end;

procedure TBaseDictExForm.GetLookupFldTxt(Sender: TField; var Text: String; DisplayText: Boolean);
var
  idx : Integer;
begin
  idx := GridFrame.Grid[Sender.FieldName].KeyList.IndexOf(Sender.AsString);
  if idx > -1  then
    Text  := GridFrame.Grid[Sender.FieldName].PickList[Idx];
end;

function ExtractString(const Delim1, Delim2 : string;const Src: string ): string;
var
  t1,t2     : integer;
  l1  : integer;
begin
  t1 := Pos(Delim1,Src);
  t2 := 0;
  l1  := Length(Delim1);
  if t1>0 then t2 := Pos(Delim2,Copy(Src,t1+ l1,Length(Src)) );
  if (t1 > 0) and (t2 > 0)
    then result :=  Copy( Src,t1+l1,t2-1)
    else result :=  '';
end;


procedure TBaseDictExForm.MainQueryPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  Idx_Name : String;
  S :  String;
  FN  : String;
begin
  {
    Обрабатываем нарушение уникального  индекса.
    Ловим ошибку  в  формате:
    'attempt to store duplicate value (visible to active transactions) in unique index "INDEX_NAME"'
    и вынимаем из  системных  таблиц названия полей.
  }
  if Pos('unique',E.Message) > -1 then
  begin
    Idx_Name := ExtractString('"', '"', E.Message);
    if Idx_Name > '' then
    with CommonData.AnyQuery do
    begin
      SQL.Text := 'select  RDB$FIELD_NAME   from RDB$INDEX_SEGMENTS where RDB$INDEX_NAME=:IDX_NAME order by RDB$FIELD_POSITION';
      ParamByName('IDX_NAME').AsString := IDX_NAME;
      Open;
      S := 'Нарушено условие уникальности для поля(полей):';
      while  not  Eof  do
      begin
        FN := TRIM(Fields[0].AsString);
        try
          if GridFrame.Grid[FN] <> nil then FN := GridFrame.Grid[FN].Title.Caption;
        except
        end;
        S := S + '"' +   FN  + '"';
        Next;
      end;
    end;
    Application.MessageBox(PChar(S), 'Ошибка', MB_OK or MB_ICONSTOP);
    Action := daAbort;
    exit;
  end;
  inherited;
end;


procedure  TBaseDictExForm.SetActualityToday;
begin
  SetActualityAtDate(Today);
  DisplayActFltrStatus('Актуальные на сегодня');
end;
//------------------------------------------------------------------------------
procedure  TBaseDictExForm.SetActualityAtDate(D : TDate);
begin
  MainQuery.ParamByName('DATE1').AsDateTime := D;
  MainQuery.ParamByName('DATE2').AsDateTime := D;
  if MainQuery.Active then    CommonRefresh;
  DisplayActFltrStatus('Актуальные на ' + DateToStr(D));
  btnIA.ImageIndex := 7;
  btnIA.Style :=  tbsDropDown;
end;
//------------------------------------------------------------------------------
procedure  TBaseDictExForm.SetNoActuality;
begin
  MainQuery.ParamByName('DATE1').AsDateTime := EncodeDateDay(2070, 1);
  MainQuery.ParamByName('DATE2').AsDateTime := EncodeDateDay(1970, 1);
  CommonRefresh;
  DisplayActFltrStatus('Фильтр по дате актуальности не включен');
  btnIA.ImageIndex := 6;
  btnIA.Style :=  tbsDropDown;
end;
//------------------------------------------------------------------------------
procedure TBaseDictExForm.miIAFltrClick(Sender: TObject);
begin
  inherited;
  SetActualityToday;
  (Sender  as  TMenuItem).Checked :=  True;
end;

procedure TBaseDictExForm.miIAFltr2Click(Sender: TObject);
var
  frm : TForm;
  mc : TMonthCalendar;
begin
  frm := CreateSimpleForm(TMonthCalendar);
  frm.Caption := 'Выбор  даты';
  mc := frm.Controls[0] as TMonthCalendar;
  mc.Date := fActDate;
  try
    if frm.ShowModal =  mrOk then
    begin
      SetActualityAtDate(mc.Date);
      fActDate := mc.Date;
     (Sender  as  TMenuItem).Checked :=  True;
    end;
  finally
    frm.Free;
  end;
end;

  procedure TBaseDictExForm.AddIntervalAct(IAFld1,IAFld2: String);
  var
    s : String;
    WhereString :  String;
  begin
    fIAFld1  := IAFld1;
    fIAFld2  := IAFld2;
    WhereString := MainQuery.SQL[1];
    if WhereString = '' then WhereString := 'where ' else WhereString := WhereString + ' and ';
    WhereString :=  WhereString + '( COALESCE(' + IAFld1  + ',CAST(''01.01.1970'' AS DATE)) <= :DATE1 and COALESCE(' + IAFld2 + ',CAST(''01.01.2070'' as  DATE)) >=:DATE2) ';
    MainQuery.SQL[1] := WhereString;
    btnIA.Visible := True;
    SetActualityToDay;
    fActDate := Today;
  end;

procedure TBaseDictExForm.miNoIAClick(Sender: TObject);
begin
  SetNoActuality;
  (Sender  as  TMenuItem).Checked :=  True;
end;

procedure  TBaseDictExForm.DisplayActFltrStatus(const Msg: String);
begin
  StatusBar.Panels[1].Text := Msg;
end;


procedure TBaseDictExForm.miIANewClick(Sender: TObject);
var
  D2 : TDate;
  V  : Variant;
  fList : String;
  i : Integer;
begin
  if MainQuery.IsEmpty then  Exit;
  D2 := MainQuery[fIAFld2];
  for i := 0  to MainQuery.Fields.Count - 1 do
    if  not FieldInList(fIAFld1 + ';' + fIAFld2  + ';' + FIDFieldName,MainQuery.Fields[i].FieldName)  then
      fList := StringWithDelim([fList,MainQuery.Fields[i].FieldName], ';');
  V := MainQuery[fList];
  MainQuery.Append;
  MainQuery[fList] := V;
  MainQuery[fIAFld1] := D2+1;
  GridFrame.Grid.SelectedIndex := GridFrame.Grid[fIAFld2].Index;
end;

procedure  TBaseDictExForm.InspectPageControl;
var
  i : Integer;
  pcVis : Boolean;
begin
  pnBottom.Visible:= ScrollBox1.ControlCount > 0;
  tsAddPanel.Visible := ScrollBox1.ControlCount > 0;
  tsAddPanel.TabVisible := ScrollBox1.ControlCount > 0;
  pcVis := False;
  For i := 0  to pcDetail.PageCount -1  do
    pcVis := pcVis or pcDetail.Pages[i].TabVisible;
  pcDetail.Visible := pcVis;
  pnBottom.Visible:= pcDetail.Visible  ;
  Splitter1.Visible := False;
  Splitter1.Align := alTop;
  Splitter1.Visible := pcVis;
  Splitter1.Align := alBottom;
  Splitter1.Height := 7;
end;

procedure TBaseDictExForm.PrepareAsDetail(const AMasterField, ADetailField: String);
var
  WhereString : String;
begin
  FISDetail :=  True;
  FMasterField := AMasterField;
  FDetailField := ADetailField;
  ParentFont := True;
  WhereString := MainQuery.SQL[1];
  if WhereString = '' then WhereString := 'where ' else WhereString := WhereString + ' and ';
  WhereString :=  WhereString  + ' (' + ADetailField + '=:' + AMasterField + ')';
  MainQuery.SQL[1] := WhereString;
  FontButtonVisible := False;
  try
    GridFrame.Grid[ADetailField].Free;
  except
  end
end;


procedure TBaseDictExForm.CommonOpen;
begin
  if FISDetail then MainQuery.DataSource.DataSet.Open;
  inherited;
  if locateFields<>'' then
    MainQuery.locate(locateFields,LocateValues,[]);

end;

procedure TBaseDictExForm.AddDetail(Frm : TBaseDictExForm);
var
  ts : TTabSheet;
begin
  frm.BorderStyle := bsNone;
  frm.Align := alClient;
  ts := TTabSheet.Create(Self);
  ts.PageControl := pcDetail;
  frm.Parent := ts; 
  frm.Visible := True;
  ts.Caption := Frm.Caption;
  frm.MainQuery.DataSource := GridFrame.DataSource;
  FDetailForms.Add(frm); 
end;

procedure TBaseDictExForm.FormShow(Sender: TObject);
var
  i : Integer;
  frm : TBaseDictExForm;
begin
  inherited;
  for i := 0  to FDetailForms.Count - 1 do
  begin
     frm  := FDetailForms[i] as TBaseDictExForm;
     frm.FormShow(frm);
     frm.FormActivate(frm);
  end;
  FillLookupFields;
end;

class function TBaseDictExForm.GetForm(AOwner : TComponent; const ALIAS : String; DictClass : TFormClass;  const Suf : String = '1' ) : TForm;
var
  msg  : String;
begin
  result :=  nil; 
  if ALIAS <> '' then
{    if not dmSecurity.CheckPriv(ALIAS, 0, oalRead, MSG) then
    begin
      // Raise Exception.Create(msg);
      ShowMessage(MSG);
      Exit;
    end;
}  Result := nil;
  if AOwner <> nil then 
    Result := AOwner.FindComponent(DictClass.ClassName + Suf) as TForm;
  if Result = nil then
  begin
    Result := DictClass.Create(AOwner);
    Result.Name := DictClass.ClassName + Suf;
    if (ALIAS <> '') and (Result is TBaseDictForm) then
    begin
    {  if not dmSecurity.CheckPriv(ALIAS, 0, oalWrite, MSG)  then
      begin
        ShowMessage('Форма будет открыта  только для  чтения' +  #13  + msg);
        (Result as TBaseDictForm).ReadOnly := True;
      end;}
    end;
  end;
end;

class function TBaseDictExForm.SelectRows(const DictInfo : TDictInfo; const ResultFlds : String;
               var ResultValue : Variant ; var LocValues: variant;
               const locFields: string = '';
               const Suf : String = '1' ) :  Boolean;
var
  frm  : TBaseDictExForm;
  Bookmarks: TBookmarkListEh;
  I  : Integer;
  gr : TDBGridEh;
  fn : String;

  function  GetLookUpString: String;
  var
    idx : Integer;
  begin
    result := '';
    Idx := gr[fn].KeyList.IndexOf(frm.MainQuery.FieldByName(fn).AsString);
    if idx >  -1  then result := gr[fn].PickList[Idx];
  end;

  Function GetRecValue: Variant;
  var
    sit : IStringIterator;
    NewValue : Variant;
  begin
    Result :=  frm.MainQuery[ResultFlds];
    sit := GetStringIterator(ResultFlds);
    while not  sit.Eof  do
    begin
      fn := sit.Next;
      if (gr[fn].PickList.Count > 0)  and
         (gr[fn].KeyList.Count > 0) then
      begin
        NewValue := VarArrayOf([frm.MainQuery[fn],GetLookUpString]);
        if VarIsArray(Result)  then
          Result[sit.GetIndex]  := NewValue
        else
          Result := NewValue;
      end;
    end;
  end;


begin
  result :=  False;

  if DictInfo.DictClass <> nil then
  begin
    frm := GetForm( nil, DictInfo.ALIAS  , DictInfo.DictClass, Suf) as  TBaseDictExForm;
  end else
  begin
    frm := GetForm( nil, DictInfo.ALIAS  , TBaseDictExForm, Suf) as  TBaseDictExForm;
    if frm =  nil then  exit;
   (frm as TBaseDictExForm).PrepareForm(DictInfo.TableName, DictInfo.KeyFld, DictInfo.FieldList, DictInfo.GenName, DIctInfo.Where_Conditions, DictInfo.ColumnList);
    frm.Caption := DictInfo.Caption;
    frm.pcDetail.Visible:=DictInfo.Show_detail;
    frm.pnBottom.Visible:=frm.pcDetail.Visible;
    frm.PanelConstructed:= not DictInfo.Show_detail;
    frm.toolpanel.Visible:=false;
  end;
  frm.LocateFields:=LocFields;
  frm.LocateValues:=LocValues;
  gr := frm.GridFrame.Grid;
  gr.AutoFitColWidths:=true;
  AddStandartButtonPanel(frm, '', [bkOk]);
  gr.Options := gr.Options + [{dgRowSelect,}dgIndicator,dgMultiSelect];
  gr.OptionsEh := gr.OptionsEh + [dghPreferIncSearch];
 gr.AllowedSelections := gr.AllowedSelections + [gstRecordBookmarks];

  result  := frm.ShowModal =  mrOk;
  if result then
  begin
    Bookmarks := gr.Selection.Rows;
    for I := 0 to Bookmarks.Count - 1 do
    begin
      frm.MainQuery.GotoBookmark(Pointer(Bookmarks.Items[I]));
      VarAddItemAndRedimArray(ResultValue, GetRecValue);
    end;
    if Bookmarks.Count = 0  then
      VarAddItemAndRedimArray(ResultValue, GetRecValue);
  end;
  frm.Free;
end;

procedure TBaseDictExForm.SetPanelMondatoryFields(const AFields : String);
begin
  FPanelMondatoryFields := AFields; 
end;

procedure TBaseDictExForm.GetFieldList(TableName:string);
var
  lst : TStringList;
begin
    lst := TStringList.Create;
    CommonData.Database.GetFieldNames(TableName, lst);
    fFieldList := AnsiReplaceText(lst.CommaText, ',', ';');
    lst.Free;
end;

procedure TBaseDictExForm.CommonRefresh;
begin
  inherited;
  FillLookupFields;
end;

procedure TBaseDictExForm.FillLookupFields;
var
  I: Integer;
  Col  : TColumnEh;
begin
  for I := 0 to FLookupList.Count - 1 do    // Iterate
  begin
    Col := TDBGridEh(FLookupList.Objects[i])[FLookupList.Names[I]];
    if Col =  nil  then  exit;
    Col.KeyList.Clear;
    Col.PickList.Clear;
    with CommonData.AnyQuery do
    begin
      SQL.Text := AnsiDequotedStr(FLookupList.ValueFromIndex[i], '"');
      Open;
      Col.ReadOnly := IsEmpty;
      while not Eof do
      begin
        Col.KeyList.Add(Fields[0].AsString);
        Col.PickList.Add(Fields[1].AsString);
        Next;
      end;
    end;
  end;    // for
end;

procedure TBaseDictExForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  FLookupList.Clear;
end;

end.


