unit DbEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StorageUnit, DB, DbFormUnit;

type
{ TDbEditFrame }

  TDbEditFrame = class(TFrame, IRememberable)
    EditBtn: TSpeedButton;
    procedure EditBtnClick(Sender: TObject);
  private
    FAutoInsert: Boolean;
    FDataSource: TDataSource;
    FForm: TDbFormForm;
    FFormClass: TDbFormFormClass;
    procedure SetDataSource(ADataSource: TDataSource);
    function GetForm: TDbFormForm;
    function GetFormVisible: Boolean;
    procedure SetFormVisible(AFormVisible: Boolean);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  protected
  { IRememberable }
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string);
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string);
  public
    property FormVisible: Boolean read GetFormVisible write SetFormVisible;
    property FormClass: TDbFormFormClass read FFormClass write FFormClass;
    property Form: TDbFormForm read GetForm;
  published
    property AutoInsert: Boolean read FAutoInsert write FAutoInsert;
    property DataSource: TDataSource read FDataSource write SetDataSource;
  end;

implementation

{$R *.dfm}

{ TDbEditFrame }

procedure TDbEditFrame.SetDataSource(ADataSource: TDataSource);
begin
  if FDataSource <> ADataSource then
  begin
    FDataSource := ADataSource;
    if ADataSource <> nil then ADataSource.FreeNotification(Self);
    if FForm <> nil then FForm.DataSource := DataSource;
  end;
end;

function TDbEditFrame.GetForm: TDbFormForm;
begin
  if FForm = nil then
  begin
    Assert(FormClass <> nil, Format('FormClass is not assigned in %s', [Name]));
    FForm := FormClass.Create(Self);
    FForm.AutoInsert := AutoInsert;
    FForm.Caption := Hint;
    FForm.DataSource := DataSource;
    FForm.Frame := Self;
  end;
  Result := FForm;
end;

function TDbEditFrame.GetFormVisible: Boolean;
begin
  Result := EditBtn.Down;
end;

procedure TDbEditFrame.SetFormVisible(AFormVisible: Boolean);
begin
  if EditBtn.Down <> AFormVisible then
  begin
    Form.Visible := AFormVisible;
    EditBtn.Down := AFormVisible;
  end;
end;

procedure TDbEditFrame.EditBtnClick(Sender: TObject);
begin
  Form.Visible := EditBtn.Down;
end;

procedure TDbEditFrame.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = DataSource) then DataSource := nil;
end;

{ IRememberable }

procedure TDbEditFrame.SaveState(Storage: TStorage; const SectionName, Prefix: string);
begin
  SaveFormState(Form, SectionName, Prefix + Name + '.Form.');
  Storage.WriteBool(SectionName, Prefix + Name + '.FormVisible', FormVisible);
  FormVisible := False;
end;

procedure TDbEditFrame.LoadState(Storage: TStorage; const SectionName, Prefix: string);
begin
  LoadFormState(Form, SectionName, Prefix + Name + '.Form.');
  FormVisible := Storage.ReadBool(SectionName, Prefix + Name + '.FormVisible', FormVisible);
end;

end.
