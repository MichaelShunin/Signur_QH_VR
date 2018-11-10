unit MasterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit, ComCtrls, DateTimeUnit, StdCtrls, ExtCtrls,
  ToolWin, ImgList, DbGridUnit, StorageUnit, DetailFrameUnit, Grids, Menus;

type
{ TDetailSheet }

  TDetailSheet = class(TTabSheet)
  private
    FDetailFrame: TDetailFrame;
    procedure InitDetailFrame(DetailID: Integer);
    procedure CMRelease(var Message: TMessage); message CM_RELEASE;
  public
    property DetailFrame: TDetailFrame read FDetailFrame;
  end;

{ TMasterForm }

  TMasterForm = class(TMaximizedForm, IRememberable)
    PageControl: TPageControl;
    MainSheet: TTabSheet;
    ToolImages: TImageList;
    ToolPanel: TPanel;
    ToolBar: TToolBar;
    EditBtn: TToolButton;
    ExtraPanel: TPanel;
    ExtraBevel: TBevel;
    ShowAllCheck: TCheckBox;
    BackSyncCheck: TCheckBox;
    DatesFrame: TDateTimeFrame;
    MasterFrame: TDbGridFrame;
    HorizSplitter: TSplitter;
    procedure EditBtnClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MasterFrameGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MasterFrameGridDblClick(Sender: TObject);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure PageControlChange(Sender: TObject);
  private
    { Private declarations }
  protected
  { IRememberable }
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string);
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string);
  protected
    procedure FontChanged; override;
    procedure DatesChanged(Sender: TObject); virtual;
    function CreateDetailFrame(FrameOwner: TComponent): TDetailFrame; virtual;
    procedure AfterCloseSheet; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    function GetCurrentDetailID: Integer; virtual;
    function FindDetail(DetailID: Integer): TDetailSheet;
    procedure OpenDetail(DetailID: Integer);
    procedure CloseAll;
    procedure CloseSheet(Sheet: TDetailSheet);
  end;

var
  MasterForm: TMasterForm;

implementation

uses
  ExtraUnit, Math, DB;

{$R *.dfm}

{ TDetailSheet }

procedure TDetailSheet.InitDetailFrame(DetailID: Integer);
begin
  PageControl := (Owner as TMasterForm).PageControl;
  FDetailFrame := (Owner as TMasterForm).CreateDetailFrame(Self);
  FDetailFrame.Parent := Self;
  FDetailFrame.Align := alClient;
  FDetailFrame.Initialize(DetailID);
end;

procedure TDetailSheet.CMRelease(var Message: TMessage);
begin
  try
    Screen.Cursor:=crSQLWait;
    (Owner as TMasterForm).CloseSheet(Self);
  finally
    Screen.Cursor:=crDefault;
  end;  
end;

{ TMasterForm }

constructor TMasterForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DatesFrame.OnChange := DatesChanged;
end;

procedure TMasterForm.FontChanged;
var
  H: Integer;
begin
  inherited FontChanged;

  H := FontHeight(Font);

  ShowAllCheck.Height := H + 6;
  ShowAllCheck.Width := ShowAllCheck.Height + TextWidth(Self, ShowAllCheck.Caption);

  BackSyncCheck.Top := DatesFrame.ToCheck.Top;
  BackSyncCheck.Height := H + 6;
  BackSyncCheck.Width := BackSyncCheck.Height + TextWidth(Self, BackSyncCheck.Caption);

  ExtraPanel.Width := Max(ControlOffsetX(ShowAllCheck, 2), ControlOffsetX(BackSyncCheck, 2));

  ToolPanel.Height := Max(41 + H, ControlOffsetY(DatesFrame.ToDatePicker, 4));
end;

procedure TMasterForm.DatesChanged(Sender: TObject);
begin
  { nothing to do }
end;

function TMasterForm.CreateDetailFrame(FrameOwner: TComponent): TDetailFrame;
begin
  Result := TDetailFrame.Create(FrameOwner);
end;

function TMasterForm.FindDetail(DetailID: Integer): TDetailSheet;
var
  I: Integer;
begin
  for I := 1 to PageControl.PageCount - 1 do
  begin
    Result := PageControl.Pages[I] as TDetailSheet;
    if Result.DetailFrame.ID = DetailID then Exit;
  end;
  Result := nil;
end;

procedure TMasterForm.OpenDetail(DetailID: Integer);
var
  Sheet: TDetailSheet;
begin
  try
    Screen.Cursor:=crSQLWait;
    Sheet := FindDetail(DetailID);
    if Sheet <> nil then
    begin
      PageControl.ActivePage := Sheet;
      Exit;
    end;

    if MasterFrame.Grid.DataSource.State = dsInsert then
    begin
      MasterFrame.Grid.DataSource.DataSet.Post;
    end;

    Sheet := TDetailSheet.Create(Self);
    Sheet.InitDetailFrame(DetailID);
    PageControl.ActivePage := Sheet;
  finally
    Screen.Cursor:=crDefault;
  end;  
end;

procedure TMasterForm.CloseAll;
var
  Sheet: TTabSheet;
begin
  while PageControl.PageCount > 1 do
  begin
    Sheet := PageControl.Pages[PageControl.PageCount - 1];
    Sheet.Free;
  end;
  PageControl.ActivePageIndex := 0;
end;

procedure TMasterForm.CloseSheet(Sheet: TDetailSheet);
var
  Index: Integer;
begin
  if Sheet.PageControl = PageControl then
  begin
    Index := Sheet.PageIndex;
    Sheet.Free;
    if Index > 0 then PageControl.ActivePageIndex := 0;
  end;
  AfterCloseSheet;
end;

procedure TMasterForm.AfterCloseSheet;
begin
end;

function TMasterForm.GetCurrentDetailID: Integer;
begin
  Result := 0;
end;

{ IRememberable }

procedure TMasterForm.SaveState(Storage: TStorage; const SectionName, Prefix: string);
begin
  Storage.WriteInteger(SectionName, Prefix + Name + '.MasterFrame.Height', MasterFrame.Height);
end;

procedure TMasterForm.LoadState(Storage: TStorage; const SectionName, Prefix: string);
begin
  MasterFrame.Height := Storage.ReadInteger(SectionName, Prefix + Name + '.MasterFrame.Height', MasterFrame.Height);
end;

procedure TMasterForm.EditBtnClick(Sender: TObject);
begin
  OpenDetail(GetCurrentDetailID);
end;

procedure TMasterForm.FormHide(Sender: TObject);
begin
  CloseAll;
end;

procedure TMasterForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F4) and (Shift = [ssCtrl]) then
  begin
    if PageControl.ActivePageIndex > 0 then
    begin
      TDetailSheet(PageControl.ActivePage).DetailFrame.CloseFrame;
      Key := 0;
    end;
  end;
end;

procedure TMasterForm.MasterFrameGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
  begin
    if EditBtn.Enabled then EditBtn.Click;
    Key := 0;
  end;

  MasterFrame.FrameKeyDown(Sender, Key, Shift);
end;

procedure TMasterForm.MasterFrameGridDblClick(Sender: TObject);
var
  P: TPoint;
  Coord: TGridCoord;
begin
  if KeyboardStateToShiftState * [ssShift, ssAlt, ssCtrl] = [] then
  begin
    if GetCursorPos(P) then
    begin
      P := MasterFrame.Grid.ScreenToClient(P);
      Coord := MasterFrame.Grid.MouseCoord(P.X, P.Y);
      if Coord.Y = 0 then Exit;
    end;

    if EditBtn.Enabled then EditBtn.Click;
  end else
  begin
    MasterFrame.GridDblClick(Sender);
  end;
end;

procedure TMasterForm.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
  PageControl.ActivePage.Tag := Integer(ActiveControl);
end;

procedure TMasterForm.PageControlChange(Sender: TObject);
begin
  if PageControl.ActivePage.Tag <> 0 then
  begin
    ActiveControl := TWinControl(PageControl.ActivePage.Tag);
  end;
end;

end.
