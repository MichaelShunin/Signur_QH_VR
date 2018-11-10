unit ShowDeviceInfo_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBSQL, ComCtrls, ExtCtrls;

type
  TShowDeviceInfo_Form = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RG_RS: TRadioGroup;
    RG_Current: TRadioGroup;
    RG_IR_Port: TRadioGroup;
    RG_Level: TRadioGroup;
    RG_IMP_OUT: TRadioGroup;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   Composition_DeviceTYPE:integer;
   DeviceName:string;

  end;

var
  ShowDeviceInfo_Form: TShowDeviceInfo_Form;

implementation

uses dm_u;

{$R *.dfm}

procedure TShowDeviceInfo_Form.BitBtn2Click(Sender: TObject);
begin

ModalResult:=mrOK;

end;

end.
