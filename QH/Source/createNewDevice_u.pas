unit createNewDevice_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBSQL, ComCtrls, ExtCtrls;

type
  TCreateNewDevice_Form = class(TForm)
    Label1: TLabel;
    cbTypeDevice: TComboBox;
    Label3: TLabel;
    edDescr: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    cbCustomer: TComboBox;
    Label5: TLabel;
    cbConverter: TComboBox;
    Label6: TLabel;
    edDeviceNumber: TEdit;
    edDeviceName: TComboBox;
    RG_DeviceType: TRadioGroup;
    Bevel1: TBevel;
    Label7: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbTypeDeviceChange(Sender: TObject);
    procedure edDeviceNumberExit(Sender: TObject);
    procedure edDeviceNameClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RG_DeviceTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreateNewDevice_Form: TCreateNewDevice_Form;

implementation

uses dm_u;

{$R *.dfm}

procedure TCreateNewDevice_Form.FormCreate(Sender: TObject);
begin
// dtpSaleDate.date:=now;
// dtpCreateDate.date:=now;
 dm.GetName_IDStringsFromQuery(dm.q,'select name, ID from devicetypes where not_active is null and ID<>9 order by id ',cbTypeDevice.Items,'name', 'ID');
 if cbTypeDevice.items.count>0 then cbTypeDevice.Itemindex:=0;
 dm.GetName_IDStringsFromQuery(dm.q,'select name, ID from Converters order by name ',cbConverter.Items,'name', 'ID');
 if cbConverter.items.count>0 then cbConverter.Itemindex:=1;
 dm.GetStringsFromIBSQL(dm.q,cbCustomer.Items,'select distinct Customer from devices  order by Customer ','Customer');
 if cbCustomer.items.count>0 then cbCustomer.Itemindex:=-1;
 if cbTypeDevice.text = 'Уровнемер' then
    begin
     edDeviceName.Text:='Уровнемер';
     RG_DeviceType.itemindex:=2;
    end
    else
    begin
     edDeviceName.Text:='Расходомер';
     RG_DeviceType.itemindex:=1;
    end;
end;

procedure TCreateNewDevice_Form.FormShow(Sender: TObject);
begin
 edDeviceNumber.text:='';//dm.GetDeviceNumber;
end;

procedure TCreateNewDevice_Form.cbTypeDeviceChange(Sender: TObject);
begin
 if cbTypeDevice.text = 'Уровнемер' then
    begin
     edDeviceName.Text:='Уровнемер';
     RG_DeviceType.itemindex:=1;
    end
    else
    begin
     edDeviceName.Text:='Расходомер';
     RG_DeviceType.itemindex:=0;
    end;

end;

procedure TCreateNewDevice_Form.edDeviceNumberExit(Sender: TObject);
begin
 If dm.CheckNotUniqDeviceNumber(edDeviceNumber.Text,edDeviceName.text) then
  begin
   Showmessage('Номер прибора должен быть уникальным! Измените номер прибора.');
   edDeviceNumber.setfocus
  end;
end;

procedure TCreateNewDevice_Form.edDeviceNameClick(Sender: TObject);
begin
 if edDeviceName.Text='Уровнемер' then cbTypeDevice.Itemindex:=cbTypeDevice.Items.IndexOf('Уровнемер')
  else cbTypeDevice.Itemindex:=0;
 if edDeviceName.Text = 'Уровнемер' then
    begin
     edDeviceName.Text:='Уровнемер';
     RG_DeviceType.itemindex:=2;
    end
    else
    begin
     edDeviceName.Text:='Расходомер';
     RG_DeviceType.itemindex:=1;
    end;
 cbTypeDevice.enabled:=not (cbTypeDevice.Itemindex=cbTypeDevice.Items.IndexOf('Уровнемер'));
end;

procedure TCreateNewDevice_Form.BitBtn2Click(Sender: TObject);
begin
ModalResult:=mrOK;
if edDeviceNumber.Text='' then
     begin
      ModalResult:=mrNone;
      showmessage('Вы не указали номер прибора');
     end;
end;

procedure TCreateNewDevice_Form.RG_DeviceTypeClick(Sender: TObject);
begin
 case RG_DeviceType.ItemIndex  of
   0: EdDeviceName.Text:='Расходомер';
   1: EdDeviceName.Text:='Уровнемер';
  end;
 if edDeviceName.Text='Уровнемер' then cbTypeDevice.Itemindex:=cbTypeDevice.Items.IndexOf('Уровнемер')
  else cbTypeDevice.Itemindex:=0;
 cbTypeDevice.enabled:=not (cbTypeDevice.Itemindex=cbTypeDevice.Items.IndexOf('Уровнемер'));
end;

end.
