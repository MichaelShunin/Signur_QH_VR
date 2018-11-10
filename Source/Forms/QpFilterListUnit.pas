unit QpFilterListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit, ComCtrls, ToolWin, ExtCtrls, ImgList, DbGridUnit,
  DB, IBCustomDataSet, IBUpdateSQL, IBQuery, DbGridEh;

type
{ TFilterListForm }

  TFilterListForm = class(TMaximizedForm)
    ToolImages: TImageList;
    ToolPanel: TPanel;
    ToolBar: TToolBar;
    OKBtn: TToolButton;
    FilterFrame: TDbGridFrame;
    Splitter: TSplitter;
    LimitFrame: TDbGridFrame;
    EmptyBtn: TToolButton;
    RefreshBtn: TToolButton;
    FilterQuery: TIBQuery;
    FilterUpdate: TIBUpdateSQL;
    FilterQueryFILTER_ID: TIntegerField;
    FilterQueryDESCR: TIBStringField;
    FilterQueryLIMIT_OR: TSmallintField;
    LimitQuery: TIBQuery;
    LimitUpdate: TIBUpdateSQL;
    LimitQueryLIMIT_ID: TIntegerField;
    LimitQueryFILTER_ID: TIntegerField;
    LimitQueryKIND: TSmallintField;
    LimitQueryID: TIntegerField;
    LimitQueryCONDITION: TIntegerField;
    LimitQueryATTR_VALUE: TIBBCDField;
    StationQuery: TIBQuery;
    CompanyQuery: TIBQuery;
    ProductQuery: TIBQuery;
    AttrQuery: TIBQuery;
    AttrQueryID: TIntegerField;
    AttrQueryDESCR: TIBStringField;
    StationQuerySTATION_ID: TIntegerField;
    StationQueryNAME: TIBStringField;
    CompanyQueryCOMPANY_ID: TIntegerField;
    CompanyQueryNAME: TIBStringField;
    ProductQueryID: TIntegerField;
    ProductQueryDESCR: TIBStringField;
    LimitQueryATTR_NAME: TStringField;
    LimitQuerySTATION_NAME: TStringField;
    LimitQueryCOMPANY_NAME: TStringField;
    LimitQueryPRODUCT_NAME: TStringField;
    LimitQueryID_NAME: TStringField;
    procedure FilterQueryNewRecord(DataSet: TDataSet);
    procedure FilterQueryBeforePost(DataSet: TDataSet);
    procedure LimitQueryNewRecord(DataSet: TDataSet);
    procedure FilterFrameDataSourceDataChange(Sender: TObject;
      Field: TField);
    procedure FormShow(Sender: TObject);
    procedure LimitQueryKINDChange(Sender: TField);
    procedure LimitQueryBeforePost(DataSet: TDataSet);
    procedure LimitQueryCalcFields(DataSet: TDataSet);
    procedure GridColumns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure OKBtnClick(Sender: TObject);
    procedure EmptyBtnClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure LimitFrameGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FilterQueryAfterDelete(DataSet: TDataSet);
    procedure FilterQueryAfterPost(DataSet: TDataSet);
    procedure LimitQueryAfterDelete(DataSet: TDataSet);
    procedure LimitQueryAfterPost(DataSet: TDataSet);
  private
    FListID: Integer;
    FChanged: Boolean;
    function GetFilterID: Integer;
    procedure SetFilterID(AFilterID: Integer);
    procedure FilterQueryChanged;
  protected
    procedure FontChanged; override;
  public
    constructor Create(AOwner: TComponent); override;
    function UpdateList(Strings: TStrings; ListID: Integer): Integer;
    property FilterID: Integer read GetFilterID write SetFilterID;
  end;

var
  FilterListForm: TFilterListForm;

implementation

uses
  DataUnit, DataLookupUnit, ExtraUnit, Math;

{$R *.dfm}

{ TFilterListForm }

constructor TFilterListForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  IgnoreLimits := True;
  FListID := 1;
end;

function TFilterListForm.GetFilterID: Integer;
begin
  Result := FilterQueryFILTER_ID.AsInteger;
end;

procedure TFilterListForm.SetFilterID(AFilterID: Integer);
begin
  FilterQuery.Locate('FILTER_ID', AFilterID, []);
end;

function TFilterListForm.UpdateList(Strings: TStrings; ListID: Integer): Integer;
var
  SavedFilterID: Integer;
begin
  if FListID > ListID then
  begin
    FilterQuery.Open;
    FilterQuery.DisableControls;
    try
      SavedFilterID := FilterQueryFILTER_ID.AsInteger;
      try
        FilterQuery.First;
        Strings.Clear;
        while not FilterQuery.Eof do
        begin
          Strings.AddObject(FilterQueryDESCR.AsString, Pointer(FilterQueryFILTER_ID.AsInteger));
          FilterQuery.Next;
        end;
        Strings.Insert(0, '<Нет ограничений>');
        Strings.Append('<Редактировать...>');
      finally
        FilterQuery.Locate('FILTER_ID', SavedFilterID, []);
      end;
    finally
      FilterQuery.EnableControls;
    end;
  end;
  Result := FListID;
end;

procedure TFilterListForm.FilterQueryNewRecord(DataSet: TDataSet);
begin
  FilterQueryLIMIT_OR.AsInteger := 0;
end;

procedure TFilterListForm.FilterQueryBeforePost(DataSet: TDataSet);
begin
  if FilterQueryLIMIT_OR.IsNull then FilterQueryLIMIT_OR.AsInteger := 0;
end;

procedure TFilterListForm.LimitQueryNewRecord(DataSet: TDataSet);
begin
  if FilterQuery.State in dsEditModes then FilterQuery.Post;
  LimitQueryFILTER_ID.AsInteger := FilterQueryFILTER_ID.AsInteger;
  LimitQueryKIND.AsInteger := 0;
end;

procedure TFilterListForm.FilterFrameDataSourceDataChange(Sender: TObject;
  Field: TField);
var
  FilterExists: Boolean;
begin
  FilterExists := not (FilterQuery.Bof and FilterQuery.Eof);
  OKBtn.Enabled := FilterExists;
  LimitQuery.Active := FilterExists;
end;

procedure TFilterListForm.FormShow(Sender: TObject);
begin
  FilterQuery.Open;
  AttrQuery.Open;
  StationQuery.Open;
  CompanyQuery.Open;
  ProductQuery.Open;
end;

procedure TFilterListForm.LimitQueryBeforePost(DataSet: TDataSet);
begin
  if LimitQueryKIND.IsNull then LimitQueryKIND.AsInteger := 0;
end;

procedure TFilterListForm.LimitQueryKINDChange(Sender: TField);
begin
  LimitQueryID.Clear;
end;

procedure TFilterListForm.LimitQueryCalcFields(DataSet: TDataSet);
var
  S: string;
begin
  case LimitQueryKIND.AsInteger of
    0:       S := LimitQueryATTR_NAME.AsString;
    1:       S := LimitQuerySTATION_NAME.AsString;
    2, 3, 4: S := LimitQueryCOMPANY_NAME.AsString;
    5:       S := LimitQueryPRODUCT_NAME.AsString;
    else     S := '';
  end;
  LimitQueryID_NAME.AsString := S;
end;

procedure TFilterListForm.GridColumns1EditButtonClick(Sender: TObject;
  var Handled: Boolean);

  procedure UpdateID(ID: Integer);
  begin
    if LimitQueryID.AsInteger <> ID then
    begin
      if not (LimitQuery.State in dsEditModes) then LimitQuery.Edit;
      LimitQueryID.AsInteger := ID;
    end;
  end;

begin
  case LimitQueryKIND.AsInteger of
    0: UpdateID(LookupAttribute(LimitQueryID.AsInteger));
    1: UpdateID(LookupStation(LimitQueryID.AsInteger));
    2, 3, 4:
       UpdateID(LookupCompany(LimitQueryID.AsInteger));
    5: UpdateID(LookupProduct(LimitQueryID.AsInteger));
  end;

  Handled := True;
end;

procedure TFilterListForm.OKBtnClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFilterListForm.EmptyBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFilterListForm.FilterQueryChanged;
begin
  FChanged := True;
end;

procedure TFilterListForm.FormHide(Sender: TObject);
begin
  if FilterQuery.State in dsEditModes then FilterQuery.Post;
  if LimitQuery.State in dsEditModes then LimitQuery.Post;

  if FChanged then
  begin
    Inc(FListID);
    FChanged := False;
  end;
end;

procedure TFilterListForm.LimitFrameGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Handled: Boolean;  
begin
  if (Key = VK_F3) and (Shift = []) and
    (LimitFrame.Grid.Col = LimitFrame.ColumnByField(LimitQueryID_NAME).Index) then
  begin
    GridColumns1EditButtonClick(Self, Handled);
  end;

  LimitFrame.FrameKeyDown(Sender, Key, Shift);
end;

procedure TFilterListForm.FontChanged;
begin
  ToolPanel.Height := 41 + FontHeight(Font);
end;

procedure TFilterListForm.FilterQueryAfterDelete(DataSet: TDataSet);
begin
  FilterQuery.Transaction.CommitRetaining;
  FilterQueryChanged;
end;

procedure TFilterListForm.FilterQueryAfterPost(DataSet: TDataSet);
begin
  FilterQuery.Transaction.CommitRetaining;
  FilterQueryChanged;
end;

procedure TFilterListForm.LimitQueryAfterDelete(DataSet: TDataSet);
begin
  LimitQuery.Transaction.CommitRetaining;
end;

procedure TFilterListForm.LimitQueryAfterPost(DataSet: TDataSet);
begin
  LimitQuery.Transaction.CommitRetaining;
end;

end.
