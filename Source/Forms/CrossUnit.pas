unit CrossUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, CrossMainFrame, CrossDetailedFrame,
  Buttons, StdCtrls;

type
{ TCrossForm }

  TMainFrameClass = class of TMainFrame;
  TDetailedFrameClass = class of TDetailedFrame;

  TCrossItemInfo = packed record
    MainFrameClass: TMainFrameClass;
    DetailedFrameClass: TDetailedFrameClass;
  end;

  PCrossForm = ^TCrossForm;
  TCrossForm = class(TForm)
    PageScroller: TPageScroller;
    ClientPanel: TPanel;
    MainPageControl: TPageControl;
    Splitter: TSplitter;
    DetailedPageControl: TPageControl;
    ToolPanel: TPanel;
    BottomBevel: TBevel;
    CloseBtn: TButton;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    FSection: string;
    FSelfRef: PCrossForm;
    procedure AddPage(MainFrameClass: TMainFrameClass; DetailedFrameClass: TDetailedFrameClass);
    procedure MainButtonClick(Sender: TObject);
    procedure ClickButton(Index: Integer);
  public
    constructor CreateX(AOwner: TComponent; const Infos: array of TCrossItemInfo);
    destructor Destroy; override;
    property Section: string read FSection write FSection;
    property SelfRef: PCrossForm read FSelfRef write FSelfRef;
  end;

var
  CrossForm: TCrossForm;

function CreateInfo(MainFrameClass: TMainFrameClass; DetailedFrameClass: TDetailedFrameClass): TCrossItemInfo;

implementation

uses StorageUnit;

{$R *.dfm}

function CreateInfo(MainFrameClass: TMainFrameClass; DetailedFrameClass: TDetailedFrameClass): TCrossItemInfo;
begin
  Result.MainFrameClass := MainFrameClass;
  Result.DetailedFrameClass := DetailedFrameClass;
end;

{ TCrossForm }

constructor TCrossForm.CreateX(AOwner: TComponent; const Infos: array of TCrossItemInfo);
var
  I: Integer;
begin
  inherited Create(AOwner);
  for I := Low(Infos) to High(Infos)
    do AddPage(Infos[I].MainFrameClass, Infos[I].DetailedFrameClass);
end;

destructor TCrossForm.Destroy;
begin
  inherited Destroy;
end;

procedure TCrossForm.AddPage(MainFrameClass: TMainFrameClass; DetailedFrameClass: TDetailedFrameClass);
var
  MainSheet, DetailedSheet: TTabSheet;
  MainFrame: TMainFrame;
  DetailedFrame: TDetailedFrame;
  FrameButton: TSpeedButton;
  FrameLabel: TLabel;
  Index, Y: Integer;
begin
  Index := MainPageControl.PageCount;

  MainSheet := TTabSheet.Create(Self);
  MainSheet.PageControl := MainPageControl;
  MainSheet.TabVisible := False;
  MainFrame := MainFrameClass.Create(Self);
  MainFrame.Parent := MainSheet;
  MainFrame.Align := alClient;

  DetailedSheet := TTabSheet.Create(Self);
  DetailedSheet.PageControl := DetailedPageControl;
  DetailedSheet.TabVisible := False;
  DetailedFrame := DetailedFrameClass.Create(Self);
  DetailedFrame.Parent := DetailedSheet;
  DetailedFrame.Align := alClient;

  MainFrame.DetailedFrame := DetailedFrame;
  DetailedFrame.MainFrame := MainFrame;

  MainFrame.AfterLink;
  DetailedFrame.AfterLink;

  Y := 5 + 100 * Index;

  FrameButton := TSpeedButton.Create(Self);
  FrameButton.Parent := ToolPanel;
  FrameButton.Flat := True;
  FrameButton.OnClick := MainButtonClick;
  FrameButton.Tag := Index;
  FrameButton.GroupIndex := 1;
  FrameButton.Glyph.Assign(MainFrame.GetToolButtonGlyph);
  FrameButton.SetBounds(5, Y, 70, 70);

  FrameLabel := TLabel.Create(Self);
  FrameLabel.Parent := ToolPanel;
  FrameLabel.AutoSize := False;
  FrameLabel.SetBounds(5, Y + 70, 70, 28);
  FrameLabel.Alignment := taCenter;
  FrameLabel.WordWrap := True;
  FrameLabel.Caption := MainFrame.GetToolButtonCaption;

  ToolPanel.Height := Y + 100;

  // to avoid possible name conflicts
  // MainFrame.Name := '';
  // DetailedFrame.Name := '';
end;

procedure TCrossForm.MainButtonClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := (Sender as TSpeedButton).Tag;
  MainPageControl.ActivePageIndex := Index;
  DetailedPageControl.ActivePageIndex := Index;
end;

procedure TCrossForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if SelfRef <> nil then SelfRef^ := nil;
end;

procedure TCrossForm.FormShow(Sender: TObject);
begin
  ClickButton(0);
  LoadFormState(Self, Section, '');
  MainPageControl.Height := Storage.ReadInteger(Section, 'MainPageControl.Height', MainPageControl.Height);
end;

procedure TCrossForm.FormHide(Sender: TObject);
begin
  SaveFormState(Self, Section, '');
  Storage.WriteInteger(Section, 'MainPageControl.Height', MainPageControl.Height);
end;

procedure TCrossForm.ClickButton(Index: Integer);
var
  C: TControl;
  I: Integer;
begin
  for I := 0 to ToolPanel.ControlCount - 1 do
  begin
    C := ToolPanel.Controls[I];
    if (C is TSpeedButton) and (C.Tag = Index) then
    begin
      TSpeedButton(C).Down := True;
      TSpeedButton(C).Click;
    end;
  end;
end;

procedure TCrossForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Index: Integer;
begin
  if Key = VK_TAB then
  begin
    if Shift = [ssCtrl] then
    begin
      Index := (MainPageControl.ActivePageIndex + 1) mod MainPageControl.PageCount;
    end else if Shift = [ssCtrl, ssShift] then
    begin
      Index := (MainPageControl.ActivePageIndex + MainPageControl.PageCount - 1) mod MainPageControl.PageCount;
    end else Exit;

    ClickButton(Index);
    Key := 0;
  end;
end;

procedure TCrossForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

end.
