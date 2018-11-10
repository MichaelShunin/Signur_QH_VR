unit createNewDevice_new_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBSQL, ComCtrls, ExtCtrls;

type
  TCreateNewDevice_Form_new = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   Composition_DeviceTYPE:integer;
   DeviceName:string;

  end;

var
  CreateNewDevice_Form_new: TCreateNewDevice_Form_new;

implementation

uses dm_u;

{$R *.dfm}

procedure TCreateNewDevice_Form_new.BitBtn2Click(Sender: TObject);
begin
  Composition_DeviceTYPE:=0;
  DeviceName :='Расходомер';
ModalResult:=mrOK;

end;

procedure TCreateNewDevice_Form_new.BitBtn3Click(Sender: TObject);
begin
  Composition_DeviceTYPE:=1;
  DeviceName :='Уровнемер';
  ModalResult:=mrOK;
end;

end.
