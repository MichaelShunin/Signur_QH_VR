unit StringListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DbGridUnit, DB, IBCustomDataSet, IBQuery,
  IBUpdateSQL, ExtCtrls, Mask, DBCtrlsEh, ToolWin, ImgList;

type
{ TStringListForm }

  TStringListForm = class(TForm)
    StringQuery: TIBQuery;
    StringUpdate: TIBUpdateSQL;
    TabControl: TTabControl;
    StringFrame: TDbGridFrame;
    RangesQuery: TIBQuery;
    RangesQueryDESCR: TIBStringField;
    RangesQueryNAME: TIBStringField;
    StringQuerySUBJECT: TIBStringField;
    StringQueryORDER_ID: TSmallintField;
    StringQueryIS_ACTIVE: TSmallintField;
    StringQueryITEM: TIBStringField;
    StringQueryNAME: TIBStringField;
    StringQueryDESCR: TIBStringField;
    RangesQueryMIN_ORDER: TSmallintField;
    RangesQueryMAX_ORDER: TSmallintField;
    StringQueryITEM_ID: TIntegerField;
    ToolPanel: TPanel;
    ToolBar: TToolBar;
    CloseBtn: TToolButton;
    AddBtn: TToolButton;
    UpBtn: TToolButton;
    DelBtn: TToolButton;
    DownBtn: TToolButton;
    ToolImages: TImageList;
    NamesBtn: TToolButton;
    UpdateNamesQuery: TIBQuery;
    StringQueryITEM2: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure StringQueryNewRecord(DataSet: TDataSet);
    procedure FormHide(Sender: TObject);
    procedure TabControlChange(Sender: TObject);
    procedure StringFrameDataSourceDataChange(Sender: TObject;
      Field: TField);
    procedure StringQueryAfterPost(DataSet: TDataSet);
    procedure StringQueryBeforeDelete(DataSet: TDataSet);
    procedure StringQueryAfterDelete(DataSet: TDataSet);
    procedure UpBtnClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);
    procedure StringQueryBeforeInsert(DataSet: TDataSet);
    procedure CloseBtnClick(Sender: TObject);
    procedure NamesBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FSubject: string;
    FRanges: TStrings;
    FSafeInsert: Boolean;
    FDeleting: Integer;
    procedure AddRange(const RangeDescr, RangeName: string;
      AMinOrder, AMaxOrder: Integer);
    function GetMaxOrder: Integer;
    function GetMinOrder: Integer;
    procedure SetMaxOrder(AMaxOrder: Integer);
    procedure SetMinOrder(AMinOrder: Integer);
    procedure CorrectAfterDelete(OrderId: Integer);
    procedure WMUser1(var Msg: TMessage); message WM_USER + 1;
    procedure WMUser2(var Msg: TMessage); message WM_USER + 2;
    procedure UpdateDelBtn;
  public
    class procedure EditStrings(const Title, Subject: string);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property MinOrder: Integer read GetMinOrder write SetMinOrder;
    property MaxOrder: Integer read GetMaxOrder write SetMaxOrder;
    property Subject: string read FSubject write FSubject;
  end;

var
  StringListForm: TStringListForm;

implementation

uses
  DataUnit, StorageUnit, StringPropsUnit, EhExtraUnit;

{$R *.dfm}

{ TStringListForm }

class procedure TStringListForm.EditStrings(const Title, Subject: string);
var
  Form: TStringListForm;
begin
  Form := TStringListForm.Create(nil);
  try
    Form.Caption := Title;
    Form.Subject := Subject;
    Form.ShowModal;
    if Form.StringQuery.State in dsEditModes then Form.StringQuery.Post;
  finally
    Form.Free;
  end;
end;

constructor TStringListForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRanges := TStringList.Create;
end;

destructor TStringListForm.Destroy;
begin
  FRanges.Free;
  inherited Destroy;
end;

procedure TStringListForm.AddRange(const RangeDescr, RangeName: string;
  AMinOrder, AMaxOrder: Integer);
begin
  TabControl.Tabs.AddObject(RangeDescr, Pointer(AMinOrder));
  FRanges.AddObject(RangeName, Pointer(AMaxOrder));
end;

procedure TStringListForm.FormShow(Sender: TObject);
begin
  RangesQuery.ParamByName('SUBJECT').AsString := Subject;
  RangesQuery.Open;
  try
    if RangesQuery.Eof then AddRange('Информация', 'info', 2, 0) else
    begin
      while not RangesQuery.Eof do
      begin
        AddRange(RangesQueryDESCR.AsString, RangesQueryNAME.AsString,
          RangesQueryMIN_ORDER.AsInteger, RangesQueryMAX_ORDER.AsInteger);
        RangesQuery.Next;
      end;
    end;
  finally
    RangesQuery.Close;
  end;

  UpdateDelBtn;
  StringQuery.ParamByName('SUBJECT').AsString := Subject;
  StringQuery.ParamByName('NAME').AsString := FRanges[TabControl.TabIndex];
  StringQuery.Open;
  LoadFormState(Self, Name + '@' + Subject, '');
end;

procedure TStringListForm.FormHide(Sender: TObject);
begin
  SaveFormState(Self, Name + '@' + Subject, '');
end;

procedure TStringListForm.StringQueryNewRecord(DataSet: TDataSet);
begin
  StringQuerySUBJECT.AsString := Subject;
  StringQueryNAME.AsString := FRanges[TabControl.TabIndex];
  StringQueryDESCR.AsString := TabControl.Tabs[TabControl.TabIndex];
  StringQueryORDER_ID.AsInteger := MaxOrder + 1;
  StringQueryIS_ACTIVE.AsInteger := 1;
end;

procedure TStringListForm.TabControlChange(Sender: TObject);
begin
  StringQuery.ParamByName('NAME').AsString := FRanges[TabControl.TabIndex];
  StringQuery.Close;
  StringQuery.Open;
end;

procedure TStringListForm.StringFrameDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  if StringQuery.Bof and StringQuery.Eof then
  begin
    UpBtn.Enabled := False;
    DownBtn.Enabled := False;
  end else
  begin
    UpBtn.Enabled := StringQueryORDER_ID.AsInteger > MinOrder;
    DownBtn.Enabled := StringQueryORDER_ID.AsInteger < MaxOrder;
  end;
end;

function TStringListForm.GetMinOrder: Integer;
begin
  Result := Integer(TabControl.Tabs.Objects[TabControl.TabIndex]);
end;

function TStringListForm.GetMaxOrder: Integer;
begin
  Result := Integer(FRanges.Objects[TabControl.TabIndex]);
end;

procedure TStringListForm.SetMinOrder(AMinOrder: Integer);
begin
  TabControl.Tabs.Objects[TabControl.TabIndex] := Pointer(AMinOrder);
end;

procedure TStringListForm.SetMaxOrder(AMaxOrder: Integer);
begin
  FRanges.Objects[TabControl.TabIndex] := Pointer(AMaxOrder);
end;

procedure TStringListForm.StringQueryAfterPost(DataSet: TDataSet);
begin
  StringQuery.Transaction.CommitRetaining;
  if StringQueryORDER_ID.AsInteger > MaxOrder then MaxOrder := StringQueryORDER_ID.AsInteger;
  if StringQueryORDER_ID.AsInteger < MinOrder then MinOrder := StringQueryORDER_ID.AsInteger;
end;

procedure TStringListForm.StringQueryBeforeDelete(DataSet: TDataSet);
begin
  FDeleting := StringQueryORDER_ID.AsInteger;
end;

procedure TStringListForm.StringQueryAfterDelete(DataSet: TDataSet);
begin
  StringQuery.Transaction.CommitRetaining;
  PostMessage(Handle, WM_USER + 1, FDeleting, 0);
end;

procedure TStringListForm.WMUser1(var Msg: TMessage);
begin
  CorrectAfterDelete(Msg.WParam);
end;

procedure TStringListForm.CorrectAfterDelete(OrderId: Integer);
var
  SavedOrder: Integer;
  ItemID: Integer;
begin
  ItemID := StringQueryITEM_ID.AsInteger;
  SavedOrder := StringQueryORDER_ID.AsInteger;
  if SavedOrder = OrderId then Exit
  else if SavedOrder > OrderId then Dec(SavedOrder);

  StringQuery.DisableControls;
  try
    StringQuery.First;
    while not StringQuery.Eof do
    begin
      if MaxOrder = StringQueryORDER_ID.AsInteger then MaxOrder := StringQueryORDER_ID.AsInteger - 1;
      if StringQueryORDER_ID.AsInteger > SavedOrder then
      begin
        StringQuery.Edit;
        StringQueryORDER_ID.AsInteger := StringQueryORDER_ID.AsInteger - 1;
        StringQuery.Post;
      end;
      StringQuery.Next;
    end;
    StringQuery.Close;
    StringQuery.Open;
    StringQuery.Locate('ITEM_ID', ItemID, []);
  finally
    StringQuery.EnableControls;
  end;
end;

procedure TStringListForm.UpBtnClick(Sender: TObject);
var
  SavedOrder: Integer;
  ItemID: Integer;
begin
  ItemID := StringQueryITEM_ID.AsInteger;
  SavedOrder := StringQueryORDER_ID.AsInteger;
  StringQuery.DisableControls;
  try
    StringQuery.First;
    while not StringQuery.Eof do
    begin
      if StringQueryORDER_ID.AsInteger = SavedOrder then
      begin
        StringQuery.Edit;
        StringQueryORDER_ID.AsInteger := SavedOrder - 1;
        StringQuery.Post;
      end else if StringQueryORDER_ID.AsInteger = SavedOrder - 1 then
      begin
        StringQuery.Edit;
        StringQueryORDER_ID.AsInteger := SavedOrder;
        StringQuery.Post;
      end;
      StringQuery.Next;
    end;
    StringQuery.Close;
    StringQuery.Open;
    StringQuery.Locate('ITEM_ID', ItemID, []);
  finally
    StringQuery.EnableControls;
  end;
end;

procedure TStringListForm.DownBtnClick(Sender: TObject);
var
  SavedOrder: Integer;
  ItemID: Integer;
begin
  ItemID := StringQueryITEM_ID.AsInteger;
  SavedOrder := StringQueryORDER_ID.AsInteger;
  StringQuery.DisableControls;
  try
    StringQuery.First;
    while not StringQuery.Eof do
    begin
      if StringQueryORDER_ID.AsInteger = SavedOrder then
      begin
        StringQuery.Edit;
        StringQueryORDER_ID.AsInteger := SavedOrder + 1;
        StringQuery.Post;
      end else if StringQueryORDER_ID.AsInteger = SavedOrder + 1 then
      begin
        StringQuery.Edit;
        StringQueryORDER_ID.AsInteger := SavedOrder;
        StringQuery.Post;
      end;
      StringQuery.Next;
    end;
    StringQuery.Close;
    StringQuery.Open;
    StringQuery.Locate('ITEM_ID', ItemID, []);
  finally
    StringQuery.EnableControls;
  end;
end;

procedure TStringListForm.WMUser2(var Msg: TMessage);
begin
  if FSafeInsert then
  begin
    StringQuery.Append;
    FSafeInsert := False;
  end;
end;

procedure TStringListForm.StringQueryBeforeInsert(DataSet: TDataSet);
begin
  if not FSafeInsert then
  begin
    FSafeInsert := True;
    PostMessage(Handle, WM_USER + 2, 0, 0);
    Abort;
  end;
end;

procedure TStringListForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TStringListForm.NamesBtnClick(Sender: TObject);
var
  Form: TStringPropForm;
begin
  Form := TStringPropForm.Create(nil);
  try
    Form.NameEdit.Text := TabControl.Tabs[TabControl.TabIndex];
    Form.IdentEdit.Text := FRanges[TabControl.TabIndex];
    if Form.ShowModal = mrOK then
    begin
      if (Form.NameEdit.Text <> TabControl.Tabs[TabControl.TabIndex]) or
         (Form.IdentEdit.Text <> FRanges[TabControl.TabIndex]) then
      begin
        UpdateNamesQuery.ParamByName('SUBJECT').AsString := Subject;
        UpdateNamesQuery.ParamByName('OLD_NAME').AsString := FRanges[TabControl.TabIndex];
        UpdateNamesQuery.ParamByName('NAME').AsString := Form.IdentEdit.Text;
        UpdateNamesQuery.ParamByName('DESCR').AsString := Form.NameEdit.Text;
        UpdateNamesQuery.Transaction.StartTransaction;
        try
          UpdateNamesQuery.ExecSQL;
          UpdateNamesQuery.Transaction.Commit;
        except
          UpdateNamesQuery.Transaction.RollBack;
          raise;
        end;

        TabControl.Tabs[TabControl.TabIndex] := Form.NameEdit.Text;
        FRanges[TabControl.TabIndex] := Form.IdentEdit.Text;
        StringQuery.ParamByName('NAME').AsString := Form.IdentEdit.Text;
        StringFrame.RefreshGridByID(StringQueryORDER_ID);
      end;
    end;
  finally
    Form.Free;
  end;
end;

procedure TStringListForm.DelBtnClick(Sender: TObject);
begin
  UpdateNamesQuery.ParamByName('SUBJECT').AsString := Subject;
  UpdateNamesQuery.ParamByName('OLD_NAME').AsString := FRanges[TabControl.TabIndex];
  UpdateNamesQuery.Transaction.StartTransaction;
  try
    UpdateNamesQuery.ExecSQL;
    UpdateNamesQuery.Transaction.Commit;
  except
    UpdateNamesQuery.Transaction.RollBack;
    raise;
  end;

  FRanges.Delete(TabControl.TabIndex);
  TabControl.Tabs.Delete(TabControl.TabIndex);

  UpdateDelBtn;
end;

procedure TStringListForm.UpdateDelBtn;
begin
  DelBtn.Enabled := TabControl.Tabs.Count > 1;
end;

procedure TStringListForm.AddBtnClick(Sender: TObject);
var
  Form: TStringPropForm;
begin
  Form := TStringPropForm.Create(nil);
  try
    if (Form.ShowModal = mrOK) then
    begin
      if (Form.NameEdit.Text <> '') and (Form.IdentEdit.Text <> '') then
      begin
        AddRange(Form.NameEdit.Text, Form.IdentEdit.Text, 2, 0);
        UpdateDelBtn;
      end;
    end;
  finally
    Form.Free;
  end;
end;

procedure TStringListForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_TAB then
  begin
    if Shift = [ssCtrl] then
    begin
      with TabControl do TabIndex := (TabIndex + 1) mod Tabs.Count;
    end else if Shift = [ssCtrl, ssShift] then
    begin
      with TabControl do TabIndex := (TabIndex + Tabs.Count - 1) mod Tabs.Count;
    end else Exit;
    TabControlChange(Self);
    Key := 0;
  end;
end;

end.
