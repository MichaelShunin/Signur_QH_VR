unit OpenExp_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, menu_f, Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls, Gauges,
  Buttons, Mask, Menus;

type
  TOpenExpForm = class(TMenuForm)
    Panel_uP: TPanel;
    ChangeTime: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DateStartEdit: TDBEdit;
    TimeStartEdit: TDBEdit;
    DeltXEdit: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    DelButton: TSpeedButton;
    Label3: TLabel;
    Gauge1: TGauge;
    Label1: TLabel;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    DBMemo1: TDBMemo;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    ImportSignal: TBitBtn;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    N2: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OpenExpForm: TOpenExpForm;

implementation

uses Main_f;

{$R *.dfm}

end.
