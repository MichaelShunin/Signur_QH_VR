unit Param3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, master2, StdCtrls, Mask;

type
  TPrmModbusForm = class(TForm)
    meAddr: TMaskEdit;
    cbBdr: TComboBox;
    cbParity: TComboBox;
    lbAddr: TLabel;
    lbBdr: TLabel;
    lbParity: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrmModbusForm: TPrmModbusForm;

implementation

{$R *.dfm}


procedure TPrmModbusForm.FormShow(Sender: TObject);
begin
  meAddr.Text := IntToStr(prmMB.Addr);
  cbBdr.ItemIndex := prmMB.Bdr;
  cbParity.ItemIndex := prmMB.Parity;
end;

procedure TPrmModbusForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  prmMB.Addr := StrToInt(meAddr.Text);
  prmMB.Bdr := cbBdr.ItemIndex;
  prmMB.Parity := cbParity.ItemIndex;
end;

end.
