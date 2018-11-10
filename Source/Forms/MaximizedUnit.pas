unit MaximizedUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
{ TMaximizedForm }

  TMaximizedForm = class(TForm)
    procedure FontDialogApply(Sender: TObject; Wnd: HWND);
//    procedure CreateParams(var Params: TCreateParams); override;
  private
    FIgnoreLimits: Boolean;
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
  private
    FFontButtonVisible  : Boolean;
    FButtonDown: Boolean;
    FDown: Boolean;
    FFontDialog: TFontDialog;
    procedure SetFontButtonVisible(AVisible : Boolean);
    procedure DrawFontButton;
    function  MouseOnButton(X, Y: Integer): Boolean;
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
  protected
    procedure DoShow; override;
    procedure DoHide; override;
    procedure FontButtonClick; virtual;
    procedure FontChanged; virtual;
  public
    property IgnoreLimits: Boolean read FIgnoreLimits write FIgnoreLimits;
    property FontButtonVisible : Boolean read FFontButtonVisible write SetFontButtonVisible;
    Constructor Create(AOwner : TComponent);override; {namy}
  end;

var
  MaximizedForm: TMaximizedForm;
  FontSetupBitmap: TBitmap;

implementation

uses
  RRJ_main_u, //MainUnit,
   StorageUnit ;
  // ,FMainUnit;

{$R *.dfm}
{$R *.res}

{ TMaximizedForm }


procedure TMaximizedForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
var
  H: Integer;
begin
  Exit;
  if not IgnoreLimits then
  begin
    H := RRJ_MainForm.Top + RRJ_MainForm.Height;
    Msg.MinMaxInfo.ptMaxSize.X := GetSystemMetrics(SM_CXMAXIMIZED);
    Msg.MinMaxInfo.ptMaxSize.Y := GetSystemMetrics(SM_CYMAXIMIZED) - H;
    Msg.MinMaxInfo.ptMaxPosition.X := 0;
    Msg.MinMaxInfo.ptMaxPosition.Y := H;
    Msg.MinMaxInfo.ptMinTrackSize.X := GetSystemMetrics(SM_CXMINTRACK);
    Msg.MinMaxInfo.ptMinTrackSize.Y := GetSystemMetrics(SM_CYMINTRACK);
    Msg.MinMaxInfo.ptMaxTrackSize.X := GetSystemMetrics(SM_CXMAXTRACK);
    Msg.MinMaxInfo.ptMaxTrackSize.Y := GetSystemMetrics(SM_CXMAXTRACK) - H;
    Msg.Result := 0;
  end;
end;

procedure TMaximizedForm.DoShow;
begin
 // LoadFormState(Self, Name, '');
//  inherited DoShow;
end;

procedure TMaximizedForm.DoHide;
begin
 // inherited DoHide;
 // SaveFormState(Self, Name, '');
end;

procedure TMaximizedForm.SetFontButtonVisible(AVisible : Boolean);
begin
  if  FFontButtonVisible <> AVisible then
  begin
    FFontButtonVisible :=  AVisible;
    Invalidate;
  end;
end;

procedure TMaximizedForm.DrawFontButton;
var
  CX, DX, DY: Integer;
  R: TRect;
  Canvas: TCanvas;
  State: Cardinal;
begin
  if not FFontButtonVisible then exit; 
  DX := GetSystemMetrics(SM_CXFRAME);
  DY := GetSystemMetrics(SM_CYFRAME);
  R.Left := Width - DX - GetSystemMetrics(SM_CXSIZE);
  R.Top := DY;

  Canvas := TCanvas.Create;
  try
    Canvas.Handle := GetWindowDC(Handle);
    try
      SetWindowOrgEx(Canvas.Handle, -DX, -DY, nil);

      CX := GetSystemMetrics(SM_CXSIZE);
      R.Left := ClientWidth - CX * 4;
      R.Top := 0;
      R.Right := R.Left + CX;
      R.Bottom := GetSystemMetrics(SM_CYSIZE);

      InflateRect(R, -1, -2);

      State := DFCS_BUTTONPUSH;
      if FDown then State := State or DFCS_PUSHED;
      DrawFrameControl(Canvas.Handle, R, DFC_BUTTON, State);

      Canvas.Draw(R.Left + 3 + Ord(FDown), R.Top + 2 + Ord(FDown), FontSetupBitmap);
    finally
      ReleaseDC(Canvas.Handle, Canvas.Handle);
    end;
  finally
    Canvas.Handle := 0;
    Canvas.Free;
  end;
end;

procedure TMaximizedForm.NCPaint(var Msg: TWMNCPaint);
begin
  inherited;
  DrawFontButton;
end;

procedure TMaximizedForm.WMSetText(var Msg: TWMSetText);
begin
  inherited;
  DrawFontButton;
end;


procedure TMaximizedForm.WMSize(var Msg: TWMSize);
begin
  inherited;
  RedrawCaption;
end;


procedure TMaximizedForm.RedrawCaption;
begin
  RedrawWindow(Handle, nil, 0, RDW_FRAME or RDW_ERASE or RDW_INVALIDATE);
end;

procedure TMaximizedForm.WMSettingChange(var Msg: TWMSettingChange);
begin
  inherited;
  RedrawCaption;
end;

function TMaximizedForm.MouseOnButton(X, Y: Integer): Boolean;
var
  R: TRect;
  CX, CY: Integer;
begin
  CX := GetSystemMetrics(SM_CXSIZE);
  CY := GetSystemMetrics(SM_CYSIZE);

  R.Left := ClientWidth - CX * 4;
  R.Top := 0;
  R.Right := R.Left + CX;
  R.Bottom := CY;

  InflateRect(R, -1, -2);

  Result := PtInRect(R, Point(X - Left - GetSystemMetrics(SM_CXFRAME), Y - Top - GetSystemMetrics(SM_CYFRAME)));
end;

procedure TMaximizedForm.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  if MouseOnButton(Msg.XPos, Msg.YPos) then
  begin
    Msg.Result := HTBORDER;
  end else
  begin
    inherited;
  end;
end;

procedure TMaximizedForm.WMMouseMove(var Msg: TWMMouseMove);
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

procedure TMaximizedForm.WMNCLButtonDown(var Msg: TWMNCLButtonDown);
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

procedure TMaximizedForm.WMNCLButtonDblClk(var Msg: TWMNCLButtonDblClk);
begin
  if MouseOnButton(Msg.XCursor, Msg.YCursor) then
  begin
    {  }
  end else
  begin
    inherited;
  end;
end;

procedure TMaximizedForm.WMLButtonUp(var Msg: TWMLButtonUp);
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

procedure TMaximizedForm.FontButtonClick;
var
  SavedFont: TFont;
begin
  SavedFont := TFont.Create;
  try
    FFontDialog := TFontDialog.Create(Self);
    try
      FFontDialog.Options := [fdEffects, fdApplyButton];
      FFontDialog.OnApply := FontDialogApply;
      FFontDialog.Font := Font;
      SavedFont.Assign(Font);
      if FFontDialog.Execute then Font := FFontDialog.Font else Font := SavedFont;
    finally
      FFontDialog.Free;
    end;
  finally
    SavedFont.Free;
  end;
end;

procedure TMaximizedForm.WMWindowPosChanged(var Msg: TWMWindowPosChanged);
begin
  inherited;
  RedrawCaption;
end;

procedure TMaximizedForm.WMNCActivate(var Msg: TWMNCActivate);
begin
  inherited;
  DrawFontButton;
end;

procedure TMaximizedForm.CMFontChanged(var Msg: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) and HandleAllocated then FontChanged;
end;

procedure TMaximizedForm.FontChanged;
begin
  {  }
end;

procedure TMaximizedForm.FontDialogApply(Sender: TObject; Wnd: HWND);
begin
  Font := FFontDialog.Font;
end;

Constructor TMaximizedForm.Create(AOwner : TComponent);
begin
  inherited;
  FFontButtonVisible := True;
end;

{
procedure TMaximizedForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if (self<>TMaximizedForm(MainForm))
    then Params.WndParent:=MainForm.Handle;
end;
}

initialization
  FontSetupBitmap := TBitmap.Create;
  FontSetupBitmap.Handle := LoadBitmap(HInstance, 'FONT_SETUP_BUTTON_BITMAP');
  FontSetupBitmap.Transparent := True;
finalization
  FontSetupBitmap.Free;

end.
