unit createNewDevice_new_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBSQL, ComCtrls, ExtCtrls;

type
  TCreateNewDevice_Form_new = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edDevice_name: TEdit;
    Label2: TLabel;
    edDevice_Number: TEdit;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   Device_name:string;
   Device_Number:string;
   Device_Type:string;

  end;

var
  CreateNewDevice_Form_new: TCreateNewDevice_Form_new;

implementation

uses dm_u;

{$R *.dfm}

procedure TCreateNewDevice_Form_new.BitBtn2Click(Sender: TObject);
begin
  Device_Number:=trim(edDevice_Number.text);
  Device_Name:=trim(edDevice_Name.text);
  Device_Type :='Расходомер-скоростемер Сигнур';
  ModalResult:=mrOK;

end;

end.
