unit Save_new;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Buttons,tvc_u;

type
  TSave_new_Form = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Part_All: TRadioGroup;
    Active_Visible: TRadioGroup;
    procedure FormCreate(Sender: TObject);
  end;

var
  Save_new_Form: TSave_new_Form;

implementation

{$R *.DFM}

procedure TSave_new_Form.FormCreate(Sender: TObject);
begin
//Get_Lang_Par({Lang_Ini,}self,'SaveForm');
{Save_Lang_Par(Lang_Ini,self,'SaveNewForm');}

end;

end.
