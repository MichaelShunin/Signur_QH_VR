unit createNewcalc_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBSQL;

type
  TCreateNewcalc_Form = class(TForm)
    Label2: TLabel;
    edCalcName: TEdit;
    Label1: TLabel;
    cbEngine: TComboBox;
    Label3: TLabel;
    edCalcDescr: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreateNewcalc_Form: TCreateNewcalc_Form;

implementation

uses dm_u;

{$R *.dfm}

procedure TCreateNewcalc_Form.FormCreate(Sender: TObject);
begin
 dm.GetStringsFromIBSQL(dm.q,cbengine.Items,'select name from engines order by name ','name');
 if cbEngine.items.count>0 then cbengine.Itemindex:=0;
end; 

end.
