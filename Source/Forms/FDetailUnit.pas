unit FDetailUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, StorageUnit, ExtCtrls;

type
  TDetailFormClass = class of TFDetailForm;

  TFDetailForm = class(TForm)
    TopPanel: TPanel;
    btnClosePlan: TBitBtn;
    btnShowAsForm: TBitBtn;
    MainPanel: TPanel;
    procedure btnClosePlanClick(Sender: TObject);
    procedure btnShowAsFormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  protected
    FID: Integer;
    FAsForm: boolean;
    procedure SetTitle(const Title: string);
    procedure SetAsForm(AsForm: boolean);

  public

    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure Initialize(AID: Integer; SAsForm: boolean); virtual;
    procedure CloseForm;
    procedure DoRefresh; virtual;
    function DoPost: boolean; virtual; //возвращает true при удачном сохранении всех данных
    property ID: Integer read FID;
    property AsForm: boolean read FAsForm write SetAsForm;
  end;

var
  FDetailForm: TFDetailForm;

procedure ShowDetail(ID: integer; DC: TDetailFormClass);

implementation

{$R *.dfm}

uses
  FMasterUnit, DataUnit, MainUnit;


procedure ShowDetail(ID: integer; DC: TDetailFormClass);
var
  i: integer;
  F: TFDetailForm;
  XCur: TCursor;
begin
  XCur := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    //если редактор открыт как отдельная форма
    for i:=0 to Application.ComponentCount-1 do begin
      if (Application.Components[i] is DC) then begin
        F := (Application.Components[i] as DC);
        if F.ID = ID then begin
          F.Show;
          exit;
        end;
      end;
    end;

    Application.CreateForm(DC, F);
    F.Initialize(ID, true);
    F.Show;
  finally
    Screen.Cursor := XCur;
  end;    
end;

procedure TFDetailForm.SetAsForm(AsForm: boolean);
begin
  FAsForm := AsForm;
  if AsForm then borderstyle := bsSizeable else borderstyle := bsNone;
  btnShowAsForm.Visible := not AsForm;
  btnClosePlan.Visible := not AsForm;
  btnClosePlan.Visible :=  AsForm;
end;

//сохранение геометрии

procedure TFDetailForm.AfterConstruction;
begin
  inherited AfterConstruction;

//  if (Owner<>nil) and (Owner<>MainForm) and (Owner<>Application)
//    then StorageUnit.LoadState(Self, Owner.Name + '\' + 'EDITOR#' + ClassName, '')
 //   else StorageUnit.LoadFormState(Self, 'EDITOR#' + ClassName, '');
end;

procedure TFDetailForm.BeforeDestruction;
begin
//  if (Owner<>nil) and (Owner<>MainForm) and (Owner<>Application)
//    then StorageUnit.SaveState(Self, Owner.Name + '\' + 'EDITOR#' + ClassName, '')
//    else StorageUnit.SaveFormState(Self, 'EDITOR#' + ClassName, '');
    
  inherited BeforeDestruction;
end;

procedure TFDetailForm.Initialize(AID: Integer; SAsForm: boolean);
begin
  FID := AID;
  AsForm := SAsForm;
end;

procedure TFDetailForm.DoRefresh;
begin
end;

function TFDetailForm.DoPost;
begin
  Result := true;                          
end;

procedure TFDetailForm.CloseForm;
begin
    if Parent <> nil then PostMessage(Parent.Handle, CM_RELEASE, 0, 0);
    if ((parent=nil) and asform) then close;
end;

procedure TFDetailForm.btnClosePlanClick(Sender: TObject);
begin
  CloseForm;
end;

type
  TXWinControl = class(TWinControl)
  end;

procedure TFDetailForm.SetTitle(const Title: string);
begin
  if (Parent is TDetailSheet)
    then TXWinControl(Parent).Text := Title
    else Caption := Title;
end;

procedure TFDetailForm.btnShowAsFormClick(Sender: TObject);
begin
  PostMessage(TFMasterForm(Owner).Handle, wm_ShowPersonCardasForm, 0, 0);
end;

procedure TFDetailForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=caFree;
end;

procedure TFDetailForm.FormActivate(Sender: TObject);
begin
  DoRefresh;
end;

procedure TFDetailForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F5) then
  begin
    DoRefresh;
    Key := 0;
  end
  else if (Key = VK_F2) then
  begin
    DoPost;
    Key := 0;
  end;
end;

end.
