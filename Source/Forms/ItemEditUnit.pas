{*************************************************}
{      Ѕазова€ форма модального редактора        *}
{*************************************************}
unit ItemEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit, ComCtrls, ImgList, ToolWin, ExtCtrls, DB, ExtraUnit;

type
  TItemEditFormClass = class of TItemEditForm;
  TItemEditForm = class(TMaximizedForm)
    ToolPanel: TPanel;
    ToolBar: TToolBar;
    CloseBtn: TToolButton;
    ToolImages: TImageList;
    StatusBar: TStatusBar;
    Panel: TPanel;
    DataSource: TDataSource;
    procedure CloseBtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  protected
    FID: integer;
    FIDFieldName: string;
    FModified: boolean;
    procedure SetIDParam(ID: integer); virtual;
    function CheckBefPost: boolean; virtual;
    function CommonPost: boolean; virtual;
    function CommonEditState: boolean; virtual;
    procedure OtherRefresh; virtual; //обновить дополнительные наборы данных
    procedure FontChanged; override;
  public
    procedure StartAdd; virtual;
    procedure StartEdit(ID: integer); virtual;
    property ID: integer read FID;
    property Modified: boolean read FModified;
  end;

var
  ItemEditForm: TItemEditForm;

implementation

{$R *.dfm}

procedure TItemEditForm.StartAdd;
begin
  FID := -1;
  SetIDParam(-1);
  DataSource.DataSet.Open;
  DataSource.DataSet.Append;
  OtherRefresh;
end;

procedure TItemEditForm.StartEdit(ID: integer);
begin
  FID := ID;
  SetIDParam(ID);
  DataSource.DataSet.Open;
  OtherRefresh;
end;

procedure TItemEditForm.SetIDParam(ID: integer);
begin
end;

procedure TItemEditForm.OtherRefresh;
begin
end;

function TItemEditForm.CheckBefPost: boolean;
begin
  Result := true; //чтобы можно было не перекрывать эту функцию, а выполн€ть проверку на BeforePost
end;

function TItemEditForm.CommonEditState: boolean;
begin
  Result := false;
  if (DataSource.DataSet.State in dsEditModes) then begin
    DataSource.DataSet.UpdateRecord;
    Result := DataSource.DataSet.Modified;
  end;  
end;

function TItemEditForm.CommonPost: boolean;
begin
  Result := false;
  if (DataSource.DataSet.State in dsEditModes) then begin
    DataSource.DataSet.UpdateRecord;
    if CheckBefPost then begin
      try
        DataSource.DataSet.Post;
        if (FID = -1) then FID := DataSource.DataSet.FindField(FIDFieldName).AsInteger;
        FModified := true;
        Result := true;
      except
        raise;
      end;
    end;
  end;  
end;

procedure TItemEditForm.CloseBtnClick(Sender: TObject);
begin
  inherited;
  if CommonEditState then begin
    if CommonPost then Close;
  end
  else begin
    Close;
  end;
end;

procedure TItemEditForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift = []) then begin
    if (Key = VK_F2) then begin
      if CommonEditState then CommonPost;
      Key := 0;
    end;
  end;
end;

procedure TItemEditForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if CommonEditState then begin
    if MessageDlg('ƒанные были отредактированы.' + #13#10 + '—охранить изменени€?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then begin
      if CommonPost then CanClose := true else CanClose := false;
    end;
  end
  else CanClose := true;
  if CanClose then DataSource.DataSet.Close;
end;

procedure TItemEditForm.FontChanged;
begin
  ToolPanel.Height := 41 + FontHeight(Font);
end;


end.


