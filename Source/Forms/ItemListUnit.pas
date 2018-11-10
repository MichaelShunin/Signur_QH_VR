{*************************************************}
{             Базовая форма списка               *}
{*************************************************}

unit ItemListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit, StdCtrls, DBCtrls, ComCtrls, ToolWin, ExtCtrls,
  ImgList, ExtraUnit, DbGridUnit, DB, ItemEditUnit, GFunctions;

type
  TItemListForm = class(TMaximizedForm)
    ToolPanel: TPanel;
    ToolBar: TToolBar;
    AddBtn: TToolButton;
    Panel: TPanel;
    ToolImages: TImageList;
    OpenBtn: TToolButton;
    DelBtn: TToolButton;
    GridFrame: TDbGridFrame;
    StatusBar: TStatusBar;
    procedure AddBtnClick(Sender: TObject);
    procedure OpenBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridFrameDataSourceDataChange(Sender: TObject;
      Field: TField);
    procedure GridFrameGridDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridFrameGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  protected
    FEditFormClass: TItemEditFormClass;
    FIDFieldName: string;
    FFirstShow: boolean;
    procedure CommonOpen; virtual;
    procedure CommonRefresh; virtual;
    procedure RefreshAfterEdit; virtual;
    procedure DoDelete; virtual;
    procedure FontChanged; override;
  end;

var
  ItemListForm: TItemListForm;

implementation

{$R *.dfm}

procedure TItemListForm.FormCreate(Sender: TObject);
begin
  inherited;
  FFirstShow := true;
end;

procedure TItemListForm.FormActivate(Sender: TObject);
begin
  inherited;
  if FFirstShow then begin
    FFirstShow := false;
    CommonOpen;
  end
  else CommonRefresh;
end;

procedure TItemListForm.CommonRefresh;
begin
  GridFrame.RefreshGridByID(GridFrame.DataSource.DataSet.FindField(FIDFieldName));
end;

procedure TItemListForm.CommonOpen;
begin
  GridFrame.DataSource.DataSet.Open;
end;

procedure TItemListForm.AddBtnClick(Sender: TObject);
var
  Form: TItemEditForm;
begin
  Form := FEditFormClass.Create(Application);
  try
    Form.StartAdd;
    Form.ShowModal;
    if (Form.ID > 0) then begin
      try
        GridFrame.DataSource.DataSet.DisableControls;
        CommonRefresh;
        GLocate(GridFrame.DataSource.DataSet, FIDFieldName, Form.ID);
      finally
        GridFrame.DataSource.DataSet.EnableControls;
      end;
    end;
  finally
    Form.Free;
  end;
end;

procedure TItemListForm.OpenBtnClick(Sender: TObject);
var
  Form: TItemEditForm;
begin
  Form := FEditFormClass.Create(Application);
  try
    Form.StartEdit(GridFrame.DataSource.DataSet.FindField(FIDFieldName).AsInteger);
    Form.ShowModal;
    if Form.Modified and Assigned(GridFrame.DataSource.DataSet)
      then GridFrame.DataSource.DataSet.Refresh;
    RefreshAfterEdit;
  finally
    Form.Free;
  end;
end;

procedure TItemListForm.RefreshAfterEdit;
begin
end;

procedure TItemListForm.DelBtnClick(Sender: TObject);
begin
  DoDelete;
end;

procedure TItemListForm.DoDelete;
begin
end;


procedure TItemListForm.FontChanged;
begin
  ToolPanel.Height := 41 + FontHeight(Font);
end;


procedure TItemListForm.GridFrameDataSourceDataChange(Sender: TObject;
  Field: TField);
var
  XE: boolean;
begin
  XE := GridFrame.DataSource.DataSet.EOF and GridFrame.DataSource.DataSet.BOF;
  OpenBtn.Enabled := not XE;
  DelBtn.Enabled := not XE;
end;

procedure TItemListForm.GridFrameGridDblClick(Sender: TObject);
begin
  inherited;
  if OpenBtn.Enabled then OpenBtn.Click;
end;

procedure TItemListForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift=[]) and (Key=VK_F5) then begin
    CommonRefresh;
    Key := 0;
  end;
end;

procedure TItemListForm.GridFrameGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
  begin
    if OpenBtn.Enabled then OpenBtn.Click;
    Key := 0;
  end
  else GridFrame.FrameKeyDown(Sender, Key, Shift);
end;

end.
