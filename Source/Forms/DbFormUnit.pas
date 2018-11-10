unit DbFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, DB, DBCtrls;

type
{ TDbFormForm }

  TFormDataLink = class;

  TDbFormForm = class(TForm)
    PostBtn: TButton;
    CancelBtn: TButton;
    CloseBtn: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    CheckPanel: TPanel;
    MassPanel: TPanel;
    CheckAllBtn: TSpeedButton;
    Label1: TLabel;
    SearchEdit: TEdit;
    SpeedButton1: TSpeedButton;
    Navigator: TDBNavigator;
    procedure FormHide(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NavigatorBeforeAction(Sender: TObject; Button: TNavigateBtn);
  private
    FAfterInsert: Boolean;
    FAfterChange: Boolean;
    FAutoInsert: Boolean;
    FDataLink: TFormDataLink;
    FFrame: TFrame;
    function GetDataSource: TDataSource;
    procedure SetDataSource(ADataSource: TDataSource);
    procedure DataActiveChanged;
    procedure DataDataSetChanged;
    procedure DataEditingChanged;
    procedure DataRecordChanged(Field: TField);
    procedure UpdateDataLinks(Control: TControl; Inserting: Boolean);
    procedure CMControlListChange(var Message: TCMControlListChange); message CM_CONTROLLISTCHANGE;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property AutoInsert: Boolean read FAutoInsert write FAutoInsert;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property Frame: TFrame read FFrame write FFrame;
  end;

  TDbFormFormClass = class of TDbFormForm;

{ TFormDataLink }

  TFormDataLink = class(TDataLink)
  private
    FForm: TDbFormForm;
  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
    procedure EditingChanged; override;
    procedure RecordChanged(Field: TField); override;
  public
    constructor Create(AForm: TDbFormForm);
    destructor Destroy; override;
  end;

var
  DbFormForm: TDbFormForm;

implementation

uses
  DbEditUnit;

{$R *.dfm}

{ TFormDataLink }

constructor TFormDataLink.Create(AForm: TDbFormForm);
begin
  inherited Create;
  FForm := AForm;
  VisualControl := True;
end;

destructor TFormDataLink.Destroy;
begin
  FForm := nil;
  inherited Destroy;
end;

procedure TFormDataLink.ActiveChanged;
begin
  if FForm <> nil then FForm.DataActiveChanged;
end;

procedure TFormDataLink.DataSetChanged;
begin
  if FForm <> nil then FForm.DataDataSetChanged;
end;

procedure TFormDataLink.EditingChanged;
begin
  if FForm <> nil then FForm.DataEditingChanged;
end;

procedure TFormDataLink.RecordChanged(Field: TField);
begin
  if FForm <> nil then FForm.DataRecordChanged(Field);
end;

{ TDbFormForm }

constructor TDbFormForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataLink := TFormDataLink.Create(Self);
end;

destructor TDbFormForm.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

function TDbFormForm.GetDataSource: TDataSource;
begin
  if FDataLink = nil then Result := nil
  else Result := FDataLink.DataSource;
end;

procedure TDbFormForm.SetDataSource(ADataSource: TDataSource);
begin
  FDataLink.DataSource := ADataSource;
  if ADataSource <> nil then ADataSource.FreeNotification(Self);
  UpdateDataLinks(Self, True);
  Navigator.DataSource := DataSource;
end;

procedure TDbFormForm.UpdateDataLinks(Control: TControl; Inserting: Boolean);
var
  I: Integer;
  DataLink: TDataLink;
begin
  DataLink := TDataLink(Control.Perform(CM_GETDATALINK, 0, 0));
  if DataLink <> nil then
  begin
    DataLink.DataSourceFixed := False;
    if Inserting then
    begin
      DataLink.DataSource := DataSource;
      { DataLink.DataSourceFixed := True; }
    end;
  end;
  if Control is TWinControl then
    with TWinControl(Control) do
      for I := 0 to ControlCount - 1 do
        UpdateDataLinks(Controls[I], Inserting);
end;

procedure TDbFormForm.CMControlListChange(var Message: TCMControlListChange);
begin
  UpdateDataLinks(Message.Control, Message.Inserting);
end;

procedure TDbFormForm.DataEditingChanged;
begin
  PostBtn.Enabled := FDataLink.Editing;
  CancelBtn.Enabled := FDataLink.Editing;
end;

procedure TDbFormForm.DataDataSetChanged;
begin
  FAfterInsert := DataSource.DataSet.State = dsInsert;
  if FAfterInsert then FAfterChange := False;
end;

procedure TDbFormForm.DataActiveChanged;
begin
  {}
end;

procedure TDbFormForm.DataRecordChanged(Field: TField);
begin
  if Field <> nil then FAfterChange := True;
end;

procedure TDbFormForm.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = DataSource) then DataSource := nil;
end;

procedure TDbFormForm.FormHide(Sender: TObject);
begin
  if Frame <> nil then TDbEditFrame(Frame).EditBtn.Down := False;
end;

procedure TDbFormForm.PostBtnClick(Sender: TObject);
var
  AfterInsert: Boolean;
begin
  AfterInsert := FAfterInsert;
  DataSource.DataSet.Post;
  if AfterInsert and AutoInsert then DataSource.DataSet.Append;
end;

procedure TDbFormForm.CancelBtnClick(Sender: TObject);
begin
  DataSource.DataSet.Cancel;
end;

procedure TDbFormForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TDbFormForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  WinControl: TWinControl;
begin
  if (Key = VK_RETURN) and (Shift = []) then
  begin
    WinControl := FindNextControl(ActiveControl, True, True, False);
    if WinControl <> nil then
    begin
      WinControl.SetFocus;
      Key := 0;
    end;
    Exit;
  end;

  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
  begin
    if PostBtn.Enabled then
    begin
      PostBtn.Click;
      Key := 0;
    end;
    Exit;
  end;
end;

procedure TDbFormForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FDataLink.Editing then
  begin
    if FAfterInsert and not FAfterChange then DataSource.DataSet.Cancel
    else DataSource.DataSet.Post;
  end;
end;

procedure TDbFormForm.NavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
  begin
    Navigator.DataSource.DataSet.Append;
    Abort;
  end;
end;

end.
