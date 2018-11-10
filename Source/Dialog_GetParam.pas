unit Dialog_GetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TDialogGetParam = class(TForm)
    Label4: TLabel;
    WinFunc: TComboBox;
    Label1: TLabel;
    PointFFT: TComboBox;
    Label2: TLabel;
    N_For_Noice: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    UseActiveCurve_CB: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DialogGetParam: TDialogGetParam;

implementation

{$R *.dfm}

end.
