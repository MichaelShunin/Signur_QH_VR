{*************************************************}
{*     Базовая форма линейного справочника       *}
{*************************************************}

unit BaseDictUnit;

interface

uses
  Windows, forms,Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, MaximizedUnit, StdCtrls, DBCtrls, ComCtrls, ToolWin, ExtCtrls,
  ImgList, ExtraUnit, DbGridUnit, DB, DataUnit, IBCustomDataSet, IBQuery,
  IBUpdateSQL, DBGridEh, GFunctions, Menus;

type

  

  TBaseDictForm = class(TMaximizedForm)
    ToolPanel: TPanel;
    ToolBar: TToolBar;
    Panel: TPanel;
    GridFrame: TDbGridFrame;
    StatusBar: TStatusBar;
    ToolImages: TImageList;
    RefreshBtn: TToolButton;
    AddBtn: TToolButton;
    DelBtn: TToolButton;
    SaveBtn: TToolButton;
    CancelBtn: TToolButton;
    MainQuery: TIBQuery;
    MainUpdate: TIBUpdateSQL;
    procedure AddBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure GridFrameDataSourceDataChange(Sender: TObject;
      Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GridFrameDataSourceStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MainQueryAfterDelete(DataSet: TDataSet);
    procedure MainQueryAfterPost(DataSet: TDataSet);
    procedure MainQueryBeforePost(DataSet: TDataSet);
    procedure MainQueryPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure GridFrameSelectColumnMenuItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    FReadOnly   : Boolean;
    FAutoCommit : Boolean;
    FIDFieldName: string;
    FDoRefresh: boolean;
    procedure CommonRefresh; virtual;
    procedure CommonOpen; virtual;
    procedure CommonCancel; virtual;
    procedure CommonPost; virtual;
    function  CommonEditState: boolean; virtual;
    procedure DoDelete; virtual;
    procedure SetSaveBtns;
    procedure SetReadOnly(AValue : Boolean);virtual;
  public
    fFieldList : String;
    property AutoCommit : Boolean read FAutoCommit write FAutoCommit;
    property  ReadOnly  : Boolean read FReadOnly   write SetReadOnly;
  end;


var
  BaseDictForm: TBaseDictForm;

implementation

//uses FMainUnit, DepincoFMainUnit;

{$R *.dfm}







procedure TBaseDictForm.FormCreate(Sender: TObject);
begin
  inherited;
  FAutoCommit := True; 
  FIDFieldName := 'ID'; //если поле первичного ключа называется иначе, в наследнике присваиваем нужное значение
  FReadOnly := True;
  SetReadOnly(False);
end;

procedure TBaseDictForm.FormShow(Sender: TObject);
begin
  inherited;
  CommonOpen;
  FDoRefresh := false;
end;

procedure TBaseDictForm.FormActivate(Sender: TObject);
begin
  inherited;
  if FDoRefresh then CommonRefresh;
  FDoRefresh := true;
end;

procedure TBaseDictForm.CommonRefresh;
begin
  GridFrame.RefreshGridByID(MainQuery.FindField(FIDFieldName));
end;

procedure TBaseDictForm.CommonOpen;
begin
  MainQuery.Close;
  MainQuery.Open;
end;

procedure TBaseDictForm.CommonPost;
begin
  if (MainQuery.State in dsEditModes) then begin
    MainQuery.UpdateRecord;
    MainQuery.Post;
  end;
end;

procedure TBaseDictForm.CommonCancel;
begin
  if (MainQuery.State in dsEditModes) then MainQuery.Cancel;
end;

function TBaseDictForm.CommonEditState: boolean;
begin
  Result := MainQuery.State in dsEditModes;
end;

procedure TBaseDictForm.RefreshBtnClick(Sender: TObject);
begin
  if CommonEditState then CommonPost;
  CommonRefresh;
end;

procedure TBaseDictForm.AddBtnClick(Sender: TObject);
begin
  if CommonEditState then CommonPost;
  if ActiveControl<>GridFrame.Grid then //..ActiveControl := GridFrame.Grid; namy
  GridFrame.Grid.SetFocus;

  MainQuery.Append;
end;

procedure TBaseDictForm.DelBtnClick(Sender: TObject);
begin
  DoDelete;
end;

procedure TBaseDictForm.DoDelete;
begin
  if MainQuery.State = dsInsert
  then MainQuery.Cancel
  else begin
    if not ConfirmDelete('Удалить запись?', MainQuery) then exit;
    MainQuery.Delete;
  end;  
end;

procedure TBaseDictForm.SaveBtnClick(Sender: TObject);
begin
  if CommonEditState then CommonPost;
end;

procedure TBaseDictForm.CancelBtnClick(Sender: TObject);
begin
  if CommonEditState then CommonCancel;
end;

procedure TBaseDictForm.GridFrameDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  DelBtn.Enabled := (not (MainQuery.EOF and MainQuery.BOF))  and ( not ReadOnly);
end;

procedure TBaseDictForm.GridFrameDataSourceStateChange(Sender: TObject);
begin
  SetSaveBtns;
end;

procedure TBaseDictForm.SetSaveBtns;
var
  XE: boolean;
begin
  XE := CommonEditState;
  SaveBtn.Enabled := XE;
  CancelBtn.Enabled := XE;
end;

procedure TBaseDictForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=true;
  if CommonEditState then begin
    try
      CommonPost;
    except
      CanClose:=false;
    end;
  end;
end;

procedure TBaseDictForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift=[]) then begin
    case Key of
      VK_F5:
      begin
        RefreshBtn.Click;
        Key := 0;
      end;
      VK_F2:
      begin
        SaveBtn.Click;
        Key := 0;
      end;
    end;
  end;
end;


procedure TBaseDictForm.FormDestroy(Sender: TObject);
begin
  inherited;
  if CommonEditState then CommonPost;
end;


procedure TBaseDictForm.MainQueryAfterDelete(DataSet: TDataSet);
begin
  if FAutoCommit then 
    MainQuery.Transaction.CommitRetaining;
end;

procedure TBaseDictForm.MainQueryAfterPost(DataSet: TDataSet);
begin
  if FAutoCommit then 
    MainQuery.Transaction.CommitRetaining;
end;

procedure TBaseDictForm.MainQueryBeforePost(DataSet: TDataSet);
begin
  //обрезание пробелов и превращение пустых строк в NULL
  TrimAndNullFields(DataSet);
  //проверка обязательных полей
  CheckRequiredFields(DataSet);
end;

procedure TBaseDictForm.MainQueryPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  ProcDBErr(E);
  ActiveControl := GridFrame.Grid;
  Action := daAbort;
end;

procedure TBaseDictForm.GridFrameSelectColumnMenuItemClick(
  Sender: TObject);
begin
  inherited;
  GridFrame.SelectColumnMenuItemClick(Sender);
end;

procedure TBaseDictForm.SetReadOnly(AValue : Boolean);
begin
  if AValue <> FReadOnly then
  begin
    AddBtn.Enabled := not AValue;
    DelBtn.Enabled := not AValue;
    if AValue then
    begin
      GridFrame.Grid.AllowedOperations := [];
      StatusBar.Panels[0].Text := 'Только для чтения';
      GridFrame.DataSource.AutoEdit := False;
      MainQuery.UpdateObject := nil; 
    end else
    begin
      GridFrame.Grid.AllowedOperations := [alopInsertEh, alopUpdateEh, alopDeleteEh, alopAppendEh];
      StatusBar.Panels[0].Text := '';
      GridFrame.DataSource.AutoEdit := True; 
      MainQuery.UpdateObject := MainUpdate
    end;
    FReadOnly := AValue;
  end;
end;


procedure TBaseDictForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 //  if Application.MainForm is  TDepincoFMainForm then
 //     TDepincoFMainform(Application.MainForm).removefromWindowmenu(self);
 //  if Application.MainForm is  TFMainForm then
 //     TFMainform(Application.MainForm).removefromWindowmenu(self);
end;

end.
