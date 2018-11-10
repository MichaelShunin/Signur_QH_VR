unit FMasterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit, ComCtrls, StdCtrls, ExtCtrls, ToolWin, ImgList,
  DbGridUnit, StorageUnit, FDetailUnit, Grids, Menus, DataUnit, Buttons;

type
{ TDetailSheet }

  TDetailSheet = class(TTabSheet)
  private
    FDetailForm: TFDetailForm;
    procedure InitDetail(DetailID: Integer);
    procedure CMRelease(var Message: TMessage); message CM_RELEASE;
  public
    destructor Destroy; override;
    property DetailForm: TFDetailForm read FDetailForm;
  end;

{ TMasterForm }

  TFMasterForm = class(TMaximizedForm)
    PageControl: TPageControl;
    MainSheet: TTabSheet;
    ToolImages: TImageList;
    btnCloseAll: TBitBtn;
    pnl_podlojka: TPanel;
    MasterFrame: TDbGridFrame;
    ToolPanel: TPanel;
    ToolBar: TToolBar;
    OpenBtn: TToolButton;
    RefreshBtn: TToolButton;
    procedure OpenBtnClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MasterFrameGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MasterFrameGridDblClick(Sender: TObject);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure PageControlChange(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageControlResize(Sender: TObject);
  protected
    FDetailFormClass: TDetailFormClass;
    function CreateDetailForm: TFDetailForm; virtual;
    procedure AfterCloseSheet; virtual;
    procedure DoRefresh; virtual;
    procedure CommonRefresh;
    procedure ShowDetailAsForm;
    procedure wmShowDetailAsForm(var Message: TMessage); message wm_ShowPersonCardAsForm;
    function OpenEnabled(ID: integer): boolean; virtual;
  public
    function GetCurrentDetailID: Integer; virtual;
    function FindDetail(DetailID: Integer): TDetailSheet;
    procedure OpenDetail(DetailID: Integer);
    procedure CloseAll;
    procedure CloseSheet(Sheet: TDetailSheet);
  end;

var
  FMasterForm: TFMasterForm;

implementation

uses
  ExtraUnit, Math, DB;

{$R *.dfm}

{ TDetailSheet }

destructor TDetailSheet.Destroy;
begin
  FDetailForm.Free;
  inherited;
end;

procedure TDetailSheet.InitDetail(DetailID: Integer);
begin
  PageControl := (Owner as TFMasterForm).PageControl;
  FDetailForm := (Owner as TFMasterForm).CreateDetailForm;
  if fDetailForm<>nil then
  begin
  FDetailForm.Parent := Self;
  FDetailForm.Left:=0; FDetailForm.top:=0;
  FDetailForm.width:=PageControl.ClientWidth; FDetailForm.Height:=PageControl.ClientHeight;
  FDetailForm.Align:=alClient;
  FDetailForm.Show;
  FDetailForm.Initialize(DetailID, false);
  end;
end;

procedure TDetailSheet.CMRelease(var Message: TMessage);
var
  XCur: TCursor;
begin
  try
    XCur := Screen.Cursor;
    Screen.Cursor := crSQLWait;
    (Owner as TFMasterForm).CloseSheet(Self);
  finally
    Screen.Cursor := XCur;
  end;
end;


{ TMasterForm }


function TFMasterForm.FindDetail(DetailID: Integer): TDetailSheet;
var
  I: Integer;
begin
  for I := 1 to PageControl.PageCount - 1 do
  begin
    if  PageControl.Pages[I] is TDetailSheet then
    begin
    Result := PageControl.Pages[I] as TDetailSheet;
    if Result.DetailForm.ID = DetailID then Exit;
   end; 
  end;
  Result := nil;
end;

function TFMasterForm.OpenEnabled(ID: integer): boolean;
begin
  Result := true;
end;

procedure TFMasterForm.OpenDetail(DetailID: Integer);
var
  Sheet: TDetailSheet;
  DetForm: TFDetailForm;
  XCur: TCursor;
  i: integer;
begin
  if not OpenEnabled(DetailID) then exit;

  try
    XCur := Screen.Cursor;
    Screen.Cursor := crSQLWait;

    if MasterFrame.Grid.DataSource.State in dsEditModes
      then MasterFrame.Grid.DataSource.DataSet.Post;

    //если редактор уже открыт в отдельной форме
    for i:=0 to Application.ComponentCount-1 do begin
      if (Application.Components[i] is FDetailFormClass) then begin
        DetForm := ((Application.Components[i]) as FDetailFormClass);
        if (DetForm.ID = DetailID) then begin
          DetForm.Show;
          exit;
        end;
      end;
    end;
    //если редактор уже открыт на вкладке
    Sheet := FindDetail(DetailID);
    if Sheet <> nil then
    begin
      PageControl.ActivePage := Sheet;
      Exit;
    end;


    Sheet := TDetailSheet.Create(Self);
    Sheet.InitDetail(DetailID);
    PageControl.ActivePage := Sheet;
    FormResize(self);
  //  btnCloseAll.Visible := true;
  finally
    Screen.Cursor := XCur;
  end;
end;

procedure TFMasterForm.CloseAll;
var
  Sheet: TTabSheet;
  i:integer;
begin

  if PageControl.ActivePageIndex > 0 then begin
    Sheet := PageControl.ActivePage;
    if not TDetailSheet(Sheet).DetailForm.DoPost then exit;
  end;

 if PageControl.PageCount>1 then
 begin
  pageControl.ActivePageIndex:=PageControl.pageCount-1;
  while PageControl.PageCount > 1 do
  begin
  try
   Sheet := PageControl.Pages[PageControl.PageCount - 1];
   
   if PageControl.Pages[PageControl.PageCount-1] is TDetailSheet then
    try
      closesheet(TdETAILsHEET(SHEET));
     except
    end ;
    for i:=0 to 12 do
    begin
     application.processmessages;
     sleep(10);
     end;

  //   Sheet.Free;

  except
  end;
 end;
 end;

  PageControl.ActivePageIndex := 0;
end;

procedure TFMasterForm.CloseSheet(Sheet: TDetailSheet);
var
  Index: Integer;
begin
//  if (not (sheet is tDetailsheet)) then exit;
  if Sheet.PageControl = PageControl then
  begin
    Index := Sheet.PageIndex;
    if not TDetailSheet(Sheet).DetailForm.DoPost then exit;
    Sheet.Free;
    if Index > 0 then PageControl.ActivePageIndex := 0;
  end;
  AfterCloseSheet;
//  btnCloseAll.Visible:=Pagecontrol.PageCount>1;
end;

procedure TFMasterForm.AfterCloseSheet;
begin
end;

function TFMasterForm.GetCurrentDetailID: Integer;
begin
  Result := 0;
end;

procedure TFMasterForm.OpenBtnClick(Sender: TObject);
begin
  OpenDetail(GetCurrentDetailID);
end;

function TFMasterForm.CreateDetailForm: TFDetailForm;
begin
end;

procedure TFMasterForm.FormHide(Sender: TObject);
begin
  inherited;
//  CloseAll;
end;

procedure TFMasterForm.FormActivate(Sender: TObject);
begin
  CommonRefresh;
end;

//обновление основного списка
procedure TFMasterForm.DoRefresh;
begin
end;

//обновление в зависимости от выбранной закладки
procedure TFMasterForm.CommonRefresh;
begin
  if PageControl.ActivePageIndex > 0
    then TDetailSheet(PageControl.ActivePage).DetailForm.DoRefresh
    else DoRefresh;
end;

procedure TFMasterForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F4) and (Shift = [ssCtrl]) then
  begin
    if PageControl.ActivePageIndex > 0 then
    begin
      TDetailSheet(PageControl.ActivePage).DetailForm.CloseForm;
      Key := 0;
    end;
  end
  else if (Key = VK_F5) then
  begin
    CommonRefresh;
    Key := 0;
  end
  else if (Key = VK_F2) then
  begin
    if PageControl.ActivePageIndex > 0 then begin
      TDetailSheet(PageControl.ActivePage).DetailForm.DoPost;
      Key := 0;
    end;  
  end;
end;

procedure TFMasterForm.MasterFrameGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
  begin
    if OpenBtn.Enabled then OpenBtn.Click;
    Key := 0;
  end;

  MasterFrame.FrameKeyDown(Sender, Key, Shift);
end;

procedure TFMasterForm.MasterFrameGridDblClick(Sender: TObject);
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

    if OpenBtn.Enabled then OpenBtn.Click;
  end else
  begin
    MasterFrame.GridDblClick(Sender);
  end;
end;

procedure TFMasterForm.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if (PageControl.ActivePageIndex > 0)
   and  (PageControl.ActivePage is TDetailSheet )
     and not TDetailSheet(PageControl.ActivePage).DetailForm.DoPost
  then AllowChange := false;

  PageControl.ActivePage.Tag := Integer(ActiveControl);
end;

procedure TFMasterForm.PageControlChange(Sender: TObject);
begin
//  CommonRefresh; чтобы быстрее
  if PageControl.ActivePageIndex > 0 then
   if PageControl.ActivePage is TDetailSheet then
     TDetailSheet(PageControl.ActivePage).DetailForm.DoRefresh;
  if PageControl.ActivePage.Tag <> 0 then
  begin
    ActiveControl := TWinControl(PageControl.ActivePage.Tag);
  end;
end;

procedure TFMasterForm.RefreshBtnClick(Sender: TObject);
begin
  DoRefresh;
end;


procedure TFMasterForm.FormResize(Sender: TObject);
var
  i: integer;
  Sheet: TTabSheet;
begin
  inherited;
  (*
  for i:=2 to PageControl.PageCount do begin
    Sheet := PageControl.Pages[i -1];
    TDetailSheet(Sheet).FDetailForm.Width := Sheet.ClientWidth;
    TDetailSheet(Sheet).FDetailForm.Height := Sheet.ClientHeight;
  end;   *)
end;

procedure TFMasterForm.wmShowDetailAsForm;
begin
  ShowDetailAsForm;
end;

procedure TFMasterForm.ShowDetailAsForm;
var
  Sheet: TDetailSheet;
  ID: integer;
begin
  Sheet := TDetailSheet(PageControl.ActivePage);
  ID := Sheet.DetailForm.ID;
  Sheet.Free;
  ShowDetail(ID, FDetailFormClass);
 // btnCloseAll.Visible:=Pagecontrol.PageCount>1;
end;

procedure TFMasterForm.btnCloseAllClick(Sender: TObject);
begin
  CloseAll;
  btnCloseAll.Visible := false;
end;

procedure TFMasterForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFMasterForm.PageControlResize(Sender: TObject);
begin
  inherited;
  IF fdETAILFORM<>NIL THEN
   BEGIN
 FDetailForm.width:=PageControl.ClientWidth; FDetailForm.Height:=PageControl.ClientHeight;
   end;
end;

end.
