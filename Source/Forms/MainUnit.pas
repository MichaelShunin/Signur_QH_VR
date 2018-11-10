unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Menus, ImgList, ToolWin, ComCtrls, StorageUnit, DataUnit;

type
{ TMainForm }

  TMainForm = class(TForm)
    SysToolBar: TToolBar;
    SysImages: TImageList;
    ExitBtn: TToolButton;
    AppToolBar: TToolBar;
    AppImages: TImageList;
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    ExitMenuItem: TMenuItem;
    N7: TMenuItem;
    FontDialog: TFontDialog;
    ViewMenuItem: TMenuItem;
    AboutMenuItem: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FontDialogApply(Sender: TObject; Wnd: HWND);
    procedure AboutMenuItemClick(Sender: TObject);
    procedure ExitMenuItemClick(Sender: TObject);
  private
    FDatabaseName: string;
    FDatabaseParams: TStrings;
    FReportDir: string;
    FTemplateDir: string;
    FSQLMonitor: boolean;
    procedure LoadSettings;
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    function CalcFormHeight: Integer;
    procedure ApplicationException(Sender: TObject; E: Exception);
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
  protected
    procedure FontButtonClick; virtual;
    procedure FontChanged; virtual;
    procedure DoShow; override;
    procedure DoHide; override;
  public
    FormatSettings: TFormatSettings;

    property DatabaseName: string read FDatabaseName write FDatabaseName;
    property DatabaseParams: TStrings read FDatabaseParams;
    property ReportDir: string read FReportDir write FReportDir;
    property TemplateDir: string read FTemplateDir write FTemplateDir;
    property SQLMonitor: boolean read FSQLMonitor write FSQLMonitor;
    procedure ConnectDatabases;
  end;

var
  MainForm: TMainForm;

implementation

uses
  IniFiles, About, DebugUnit, ReportUnit, DateUtils, MaximizedUnit, HelloUnit,
  BaseDictUnit, StorageDataUnit;

{$R *.dfm}

{ TMainForm }

procedure TMainForm.AboutMenuItemClick(Sender: TObject);
begin
  CallAbout;
end;

procedure TMainForm.ExitMenuItemClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ApplicationException(Sender: TObject; E: Exception);
begin
  //можно вставить доп. обработку исключений
  Application.ShowException(E);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  MainForm := self;
  GetLocaleFormatSettings(GetThreadLocale, FormatSettings);
  FDatabaseParams := TStringList.Create;
  LoadSettings;
  SetBounds(0, 0, Screen.Width, CalcFormHeight);
  Application.OnException := ApplicationException;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Application.OnException := nil;

//  if Assigned(Storage) and SuperUser then StorageIniToBase(Storage.IniName);
  FDatabaseParams.Free;
  MainForm := nil;
end;

procedure TMainForm.LoadSettings;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    DatabaseName := IniFile.ReadString('Settings', 'DatabaseName', '');
    DatabaseParams.Values['user_name'] := IniFile.ReadString('Settings', 'user_name', 'SYSDBA');
    DatabaseParams.Values['password'] := IniFile.ReadString('Settings', 'password', 'masterkey');
    DatabaseParams.Values['lc_ctype'] := IniFile.ReadString('Settings', 'lc_ctype', 'WIN1251');
    ReportDir := IniFile.ReadString('Settings', 'ReportDir', '');
    TemplateDir := IniFile.ReadString('Settings', 'TemplateDir', '');
    SQLMonitor := IniFile.ReadBool('Settings', 'SQLMonitor', False);
  finally
    IniFile.Free;
  end;
end;

procedure TMainForm.ConnectDatabases;
begin
  CommonData.Database.Close;
  CommonData.Database.DatabaseName := DatabaseName;
  CommonData.Database.Params := DatabaseParams;
  CommonData.Database.Open;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  S: string;
begin
  Caption := Caption + ' (' + AppVersion + ')';
  try
    HelloForm := THelloForm.Create(Self);
    HelloForm.execute('Добрый день, ' +CommonData.User_Greetings+'!');
  except
    HelloForm.Free;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TReportForm.CleanupReportDir;
end;

function TMainForm.CalcFormHeight: Integer;
begin
  Result := 60 + GetSystemMetrics(SM_CYSIZEFRAME) * 2 + GetSystemMetrics(SM_CYCAPTION)
    + GetSystemMetrics(SM_CYMENUSIZE);
end;

procedure TMainForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
var
  H: Integer;
begin
  H := CalcFormHeight;
  Msg.MinMaxInfo.ptMaxSize.X := GetSystemMetrics(SM_CXMAXIMIZED);
  Msg.MinMaxInfo.ptMaxSize.Y := H;
  Msg.MinMaxInfo.ptMaxPosition.X := 0;
  Msg.MinMaxInfo.ptMaxPosition.Y := 0;
  Msg.MinMaxInfo.ptMinTrackSize.X := GetSystemMetrics(SM_CXMINTRACK);
  Msg.MinMaxInfo.ptMinTrackSize.Y := H;
  Msg.MinMaxInfo.ptMaxTrackSize.X := GetSystemMetrics(SM_CXMAXTRACK);
  Msg.MinMaxInfo.ptMaxTrackSize.Y := H;
  Msg.Result := 0;
end;


procedure TMainForm.DrawFontButton;
var
  CX, DX, DY: Integer;
  R: TRect;
  Canvas: TCanvas;
  State: Cardinal;
begin
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

      Canvas.Draw(R.Left + 3 + Ord(FDown), R.Top + 2 + Ord(FDown), MaximizedUnit.FontSetupBitmap);
    finally
      ReleaseDC(Canvas.Handle, Canvas.Handle);
    end;
  finally
    Canvas.Handle := 0;
    Canvas.Free;
  end;
end;

procedure TMainForm.NCPaint(var Msg: TWMNCPaint);
begin
  inherited;
  DrawFontButton;
end;

procedure TMainForm.WMSetText(var Msg: TWMSetText);
begin
  inherited;
  DrawFontButton;
end;

procedure TMainForm.WMSize(var Msg: TWMSize);
begin
  inherited;
  RedrawCaption;
end;

procedure TMainForm.RedrawCaption;
begin
  RedrawWindow(Handle, nil, 0, RDW_FRAME or RDW_ERASE or RDW_INVALIDATE);
end;

procedure TMainForm.WMSettingChange(var Msg: TWMSettingChange);
begin
  inherited;
  RedrawCaption;
end;

function TMainForm.MouseOnButton(X, Y: Integer): Boolean;
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

procedure TMainForm.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  if MouseOnButton(Msg.XPos, Msg.YPos) then
  begin
    Msg.Result := HTBORDER;
  end else
  begin
    inherited;
  end;
end;

procedure TMainForm.WMMouseMove(var Msg: TWMMouseMove);
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

procedure TMainForm.WMNCLButtonDown(var Msg: TWMNCLButtonDown);
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

procedure TMainForm.WMNCLButtonDblClk(var Msg: TWMNCLButtonDblClk);
begin
  if MouseOnButton(Msg.XCursor, Msg.YCursor) then
  begin
    {  }
  end else
  begin
    inherited;
  end;
end;

procedure TMainForm.WMLButtonUp(var Msg: TWMLButtonUp);
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

procedure TMainForm.FontButtonClick;
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

procedure TMainForm.WMWindowPosChanged(var Msg: TWMWindowPosChanged);
begin
  inherited;
  RedrawCaption;
end;

procedure TMainForm.WMNCActivate(var Msg: TWMNCActivate);
begin
  inherited;
  DrawFontButton;
end;

procedure TMainForm.CMFontChanged(var Msg: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) and HandleAllocated then FontChanged;
end;

type
  TXToolBar = class(TToolBar)
  end;

procedure TMainForm.FontChanged;
var
  W, H: Integer;
begin
  TXToolBar(AppToolBar).WrapButtons(W, H);
end;

procedure TMainForm.FontDialogApply(Sender: TObject; Wnd: HWND);
begin
  Font := FontDialog.Font;
end;

procedure TMainForm.DoShow;
begin
//  inherited DoShow;
 // LoadFormState(Self, Name, '');
end;

procedure TMainForm.DoHide;
begin
//  SaveFormState(Self, Name, '');
 // inherited DoHide;
end;


initialization
  IgnoreException(EAbort);
end.
