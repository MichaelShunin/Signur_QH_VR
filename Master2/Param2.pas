unit Param2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, master2;

type
  TPrmForm = class(TForm)
    meNumber: TMaskEdit;
    cbTone: TComboBox;
    cbAccess: TComboBox;
    lbNumber: TLabel;
    lbTone: TLabel;
    lbAccess: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbToneChange(Sender: TObject);
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
  meNumber.Text := prmMD.PhoneNmb;
  cbAccess.ItemIndex := prmMD.Access;
  cbAccess.Visible := not prmMD.Tone;
  lbAccess.Visible := not prmMD.Tone;
  if prmMD.Tone then
    cbTone.ItemIndex := 1
  else
    cbTone.ItemIndex := 0;
end;

procedure TPrmForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  prmMD.PhoneNmb := meNumber.Text;
  prmMD.Tone := cbTone.ItemIndex = 1;
  prmMD.Access := cbAccess.ItemIndex;
end;


procedure TPrmForm.cbToneChange(Sender: TObject);
begin
  cbAccess.Visible := (cbTone.ItemIndex=0);
  lbAccess.Visible := (cbTone.ItemIndex=0);
end;

end.
