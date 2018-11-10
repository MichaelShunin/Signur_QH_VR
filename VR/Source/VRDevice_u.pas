unit VRDevice_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit, Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls,
  Grids, DBGridEh, Menus;

type
  TVRDeviceForm = class(TMaximizedForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    SpeedButton1: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    GroupBox1: TGroupBox;
    Splitter2: TSplitter;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Splitter3: TSplitter;
    StaticText1: TStaticText;
    DBGridEh2: TDBGridEh;
    StaticText2: TStaticText;
    DBGridEh3: TDBGridEh;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    StaticText3: TStaticText;
    SpeedButton2: TSpeedButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VRDeviceForm: TVRDeviceForm;

implementation

{$R *.dfm}

end.
