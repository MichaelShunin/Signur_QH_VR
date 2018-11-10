unit Param;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Master_new_u;

type
  TPrmForm = class(TForm)
    cbTone: TComboBox;
    meNumber: TMaskEdit;
    cbAccess: TComboBox;
    lbNumber: TLabel;
    lbTone: TLabel;
    lbAccess: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrmForm: TPrmForm;

implementation

{$R *.dfm}

procedure TPrmForm.FormShow(Sender: TObject);
begin
  meNumber.Text := prm.PhoneNmb;
  if prm.Tone then
    cbTone.ItemIndex := 1
  else
    cbTone.ItemIndex := 0;
  cbAccess.ItemIndex := prm.Access;
end;

procedure TPrmForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  prm.PhoneNmb := meNumber.Text;
  prm.Tone := cbTone.ItemIndex = 1;
  prm.Access := cbAccess.ItemIndex;
end;

end.
