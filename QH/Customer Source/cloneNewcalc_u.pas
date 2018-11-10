unit cloneNewcalc_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBSQL;

type
  TCloneNewcalc_Form = class(TForm)
    Label2: TLabel;
    edCalcName: TEdit;
    Label3: TLabel;
    edCalcDescr: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CloneNewcalc_Form: TCloneNewcalc_Form;

implementation

uses dm_u;

{$R *.dfm}

end.
