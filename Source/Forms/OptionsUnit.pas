unit OptionsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, StorageUnit;

type
{ TOptionsForm }

  TOptionsForm = class(TForm)
    PageControl: TPageControl;
    CommonSheet: TTabSheet;
    ReportSheet: TTabSheet;
    ReportsCommonPanel: TPanel;
    Bevel1: TBevel;
    BottomPanel: TPanel;
    OkBtn: TButton;
    CancelBtn: TButton;
    ReportPageControl: TPageControl;
    ReportComboPanel: TPanel;
    ReportsCombo: TComboBox;
    FontDialog: TFontDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ReportsComboChange(Sender: TObject);
    procedure FontDialogApply(Sender: TObject; Wnd: HWND);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    FButtonDown: Boolean;
    FDown: Boolean;
    procedure DrawFontButton;
    function MouseOnButton(X, Y: Integer): Boolean;
    procedure RedrawCaption;
    procedure WMMouseMove(var Msg: TWMMouseMove); message WM_MOUSEMOVE;
    procedure WMSetText(var Msg: TWMSetText); message WM_SETTEXT;
    procedure NCPaint(var Msg: TWMNCPaint); message WM_NCPAINT;
    procedure WMSize(var Msg: TWMSize); message WM_SIZE;
    procedure WMSettingChange(var Msg: TWMSettingChange); message WM_SETTINGCHANGE;
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCLButtonDown(var Msg: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
    procedure WMNCLButtonDblClk(var Msg: TWMNCLButtonDblClk); message WM_NCLBUTTONDBLCLK;
    procedure WMLButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMWindowPosChanged(var Msg: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure WMNCActivate(var Msg: TWMNCActivate); message WM_NCACTIVATE;
    procedure CMFontChanged(var Msg: TMessage); message CM_FONTCHANGED;
  private
    procedure FillReportsCombo;
    procedure ShowSinglePage(Page: TTabSheet);
  protected
    procedure FontChanged; virtual;
    procedure LoadData; virtual;
    procedure SaveData; virtual;
    procedure FontButtonClick; virtual;
  public
    procedure Execute;
    procedure ExecuteAll;
    procedure ExecutePage(Page: TTabSheet); overload;
    procedure ExecutePage(const PageName: string); overload;
    procedure ExecuteReport(const ReportName: string);
  end;

var
  OptionsForm: TOptionsForm;

implementation

uses
  MaximizedUnit;

{$R *.dfm}

procedure TOptionsForm.Execute;
begin
  LoadData;
  if ShowModal = mrOk then SaveData;
end;

procedure TOptionsForm.ExecuteAll;
var
  I: Integer;
begin
  for I := 0 to PageControl.PageCount - 1 do PageControl.Pages[I].TabVisible := True;
  Execute;
end;

procedure TOptionsForm.ShowSinglePage(Page: TTabSheet);
var
  I: Integer;
begin
  for I := 0 to PageControl.PageCount - 1 do
  begin
    PageControl.Pages[I].TabVisible := PageControl.Pages[I] = Page;
  end;
end;

procedure TOptionsForm.ExecutePage(Page: TTabSheet);
begin
  ShowSinglePage(Page);
  Execute;
end;

procedure TOptionsForm.ExecutePage(const PageName: string);
var
  C: TComponent;
begin
  C := FindComponent(PageName);
  if (C <> nil) and (C is TTabSheet) then ExecutePage(TTabSheet(C));
end;

procedure TOptionsForm.ExecuteReport(const ReportName: string);
var
  Index: Integer;
begin
  ShowSinglePage(ReportSheet);
  Index := ReportsCombo.Items.IndexOf(ReportName);
  ReportsCombo.Enabled := Index = -1;
  if not ReportsCombo.Enabled then
  begin
    ReportsCombo.ItemIndex := Index;
    ReportsComboChange(Self);
  end;
  Execute;
end;

procedure TOptionsForm.FillReportsCombo;
var
  I: Integer;
  Sheet: TTabSheet;
begin
  ReportsCombo.Items.Clear;
  for I := 0 to ReportPageControl.PageCount - 1 do
  begin
    Sheet := ReportPageControl.Pages[I];
    ReportsCombo.Items.AddObject(Sheet.Caption, Sheet);
    Sheet.TabVisible := False;
  end;
  if ReportsCombo.Items.Count > 0 then
  begin
    ReportsCombo.ItemIndex := 0;
    ReportPageControl.ActivePageIndex := 0;
  end;
end;

procedure TOptionsForm.FormCreate(Sender: TObject);
begin
  if OptionsForm = nil then OptionsForm := Self;
  FillReportsCombo;
end;

procedure TOptionsForm.FormDestroy(Sender: TObject);
begin
  if OptionsForm = Self then OptionsForm := nil;
end;

procedure TOptionsForm.LoadData;
begin
  { do nothing }
end;

procedure TOptionsForm.SaveData;
begin
  { do nothing }
end;

procedure TOptionsForm.ReportsComboChange(Sender: TObject);
begin
  ReportPageControl.ActivePage := ReportsCombo.Items.Objects[ReportsCombo.ItemIndex] as TTabSheet;
end;

procedure TOptionsForm.DrawFontButton;
var
  CX, DX, DY: Integer;
  R: TRect;
  Canvas: TCanvas;
  State: Cardinal;
begin
  DX := GetSystemMetrics(SM_CXDLGFRAME);
  DY := GetSystemMetrics(SM_CYDLGFRAME);
  R.Left := Width - DX - GetSystemMetrics(SM_CXSIZE);
  R.Top := DY;

  Canvas := TCanvas.Create;
  try
    Canvas.Handle := GetWindowDC(Handle);
    try
      SetWindowOrgEx(Canvas.Handle, -DX, -DY, nil);

      CX := GetSystemMetrics(SM_CXSIZE);
      R.Left := ClientWidth - CX * 2;
      R.Top := 0;
      R.Right := R.Left + CX;
      R.Bottom := GetSystemMetrics(SM_CYSIZE);

      InflateRect(R, -1, -2);

      State := DFCS_BUTTONPUSH;
      if FDown then State := State or DFCS_PUSHED;
      DrawFrameControl(Canvas.Handle, R, DFC_BUTTON, State);

      Canvas.Draw(R.Left + 3 + Ord(FDown), R.Top + 2 + Ord(FDown), MaximizedUnit.FontSetupBitmap);
    finally
      ReleaseDC(Canvas.Handle, Canvas.Handle);
    end;
  finally
    Canvas.Handle := 0;
    Canvas.Free;
  end;
end;

procedure TOptionsForm.NCPaint(var Msg: TWMNCPaint);
begin
  inherited;
  DrawFontButton;
end;

procedure TOptionsForm.WMSetText(var Msg: TWMSetText);
begin
  inherited;
  DrawFontButton;
end;

procedure TOptionsForm.WMSize(var Msg: TWMSize);
begin
  inherited;
  RedrawCaption;
end;

procedure TOptionsForm.RedrawCaption;
begin
  RedrawWindow(Handle, nil, 0, RDW_FRAME or RDW_ERASE or RDW_INVALIDATE);
end;

procedure TOptionsForm.WMSettingChange(var Msg: TWMSettingChange);
begin
  inherited;
  RedrawCaption;
end;

function TOptionsForm.MouseOnButton(X, Y: Integer): Boolean;
var
  R: TRect;
  CX, CY: Integer;
begin
  CX := GetSystemMetrics(SM_CXSIZE);
  CY := GetSystemMetrics(SM_CYSIZE);

  R.Left := ClientWidth - CX * 2;
  R.Top := 0;
  R.Right := R.Left + CX;
  R.Bottom := CY;

  InflateRect(R, -1, -2);

  Result := PtInRect(R, Point(X - Left - GetSystemMetrics(SM_CXDLGFRAME), Y - Top - GetSystemMetrics(SM_CYDLGFRAME)));
end;

procedure TOptionsForm.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  if MouseOnButton(Msg.XPos, Msg.YPos) then
  begin
    Msg.Result := HTBORDER;
  end else
  begin
    inherited;
  end;
end;

procedure TOptionsForm.WMMouseMove(var Msg: TWMMouseMove);
var
  WasDown: Boolean;
  P: TPoint;
begin
  if FButtonDown then
  begin
    P := ClientToScreen(Point(Msg.XPos, Msg.YPos));
    WasDown := FDown;
    FDown := MouseOnButton(P.X, P.Y);
    if WasDown <> FDown then DrawFontButton;
  end else
  begin
    inherited;
  end;
end;

procedure TOptionsForm.WMNCLButtonDown(var Msg: TWMNCLButtonDown);
begin
  if MouseOnButton(Msg.XCursor, Msg.YCursor) then
  begin
    SetCapture(Handle);
    FButtonDown := True;
    FDown := True;
    DrawFontButton;
  end else
  begin
    inherited;
  end;
end;

procedure TOptionsForm.WMNCLButtonDblClk(var Msg: TWMNCLButtonDblClk);
begin
  if MouseOnButton(Msg.XCursor, Msg.YCursor) then
  begin
    {  }
  end else
  begin
    inherited;
  end;
end;

procedure TOptionsForm.WMLButtonUp(var Msg: TWMLButtonUp);
var
  P: TPoint;
begin
  if FButtonDown then
  begin
    ReleaseCapture;
    FButtonDown := False;
    FDown := False;
    DrawFontButton;
    P := ClientToScreen(Point(Msg.XPos, Msg.YPos));
    if MouseOnButton(P.X, P.Y) then FontButtonClick;
  end else
  begin
    inherited;
  end;
end;

procedure TOptionsForm.FontButtonClick;
var
  SavedFont: TFont;
begin
  SavedFont := TFont.Create;
  try
    FontDialog.Font := Font;
    SavedFont.Assign(Font);
    if FontDialog.Execute then Font := FontDialog.Font else Font := SavedFont;
  finally
    SavedFont.Free;
  end;
end;

procedure TOptionsForm.WMWindowPosChanged(var Msg: TWMWindowPosChanged);
begin
  inherited;
  RedrawCaption;
end;

procedure TOptionsForm.WMNCActivate(var Msg: TWMNCActivate);
begin
  inherited;
  DrawFontButton;
end;

procedure TOptionsForm.CMFontChanged(var Msg: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) and HandleAllocated then FontChanged;
end;

procedure TOptionsForm.FontChanged;
var
  ButtonHeight, ButtonWidth: Integer;
begin
  ReportComboPanel.Height := ReportsCombo.Height + 15;

  ButtonWidth := Canvas.TextWidth(OkBtn.Caption) + 8;
  if ButtonWidth < 75 then ButtonWidth := 75;
  ButtonHeight := Canvas.TextHeight('Wg') + 8;
  if ButtonHeight < 25 then ButtonHeight := 25;

  CancelBtn.Left := BottomPanel.Width - ButtonWidth - 6;
  CancelBtn.Width := ButtonWidth;
  CancelBtn.Height := ButtonHeight;
  OkBtn.Left := CancelBtn.Left - ButtonWidth - 6;
  OkBtn.Width := ButtonWidth;
  OkBtn.Height := ButtonHeight;

  BottomPanel.Height := ButtonHeight + 13;
end;

procedure TOptionsForm.FontDialogApply(Sender: TObject; Wnd: HWND);
begin
  Font := FontDialog.Font;
end;

procedure TOptionsForm.FormShow(Sender: TObject);
begin
  LoadFormState(Self, Name, '');
end;

procedure TOptionsForm.FormHide(Sender: TObject);
begin
  SaveFormState(Self, Name, '');
end;

end.
