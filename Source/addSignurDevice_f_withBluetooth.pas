unit addSignurDevice_f_withBluetooth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, menu_f, Menus, StdCtrls, Buttons, ExtCtrls,
  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer, cxListBox,
  tvc_u, ComCtrls, Grids, DBGrids, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  cxEdit, cxMemo, Spin, cxSpinEdit, cxDBEdit;

type

  TAddSignurDeviceForm = class(TMenuForm)
    N3: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    cxButton1: TcxButton;
    btnSave: TcxButton;
    Label3: TLabel;
    eksp_header: TcxTextEdit;
    Theme: TcxComboBox;
    Author: TcxComboBox;
    Label5: TLabel;
    Device_CB: TcxComboBox;
    PageControl1: TPageControl;
    TabSheetModem: TTabSheet;
    TabSheetMOdbus: TTabSheet;
    Tone_Pulse: TRadioGroup;
    Label8: TLabel;
    Access: TcxComboBox;
    Phone_Number: TcxTextEdit;
    Label6: TLabel;
    Label9: TLabel;
    lbBdr: TLabel;
    lbParity: TLabel;
    TabSheet1: TTabSheet;
    memo: TcxMemo;
    ModBus_address: TcxSpinEdit;
    cbBDR: TcxComboBox;
    cbParity: TcxComboBox;
    Label4: TLabel;
    device_Number: TcxMaskEdit;
    Label_Tone: TLabel;
    Label_pulse: TLabel;
    rgAccess: TRadioGroup;
    TabSheetBlueTooth: TTabSheet;
    Label7: TLabel;
    BLUETOOTH_PIN: TcxSpinEdit;
//    procedure LBClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure ModBusClick(Sender: TObject);
    procedure ModemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure modbus_addressPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure Tone_PulseClick(Sender: TObject);
    procedure rgAccessClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SignalShapka: TSignalShapka;
    FilterIndex:integer;
    ID:integer;
  end;

var
  AddSignurDeviceForm: TAddSignurDeviceForm;

implementation

uses config, DM_dm, Main_f;

{$R *.dfm}


procedure TAddSignurDeviceForm.cxButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;


procedure TAddSignurDeviceForm.FormShow(Sender: TObject);
begin
  inherited;
 dm.GetStringsFromQuery(dm.sql,theme.Properties.Items,'select distinct eksp_theme as theme from eksp where (( eksp_proc = 0 ) or ( eksp_proc >2 ) )  and (id_uplevel=-1) and (hide = 0) ', 'theme');
 dm.GetStringsFromQuery(dm.sql,author.Properties.Items,'select distinct eksp_author as author from eksp where (( eksp_proc = 0 ) or ( eksp_proc >2 ) )  and (id_uplevel=-1) and (hide = 0)  ', 'author');
 dm.GetStringsObjectsFromQuery(dm.sql, device_CB.Properties.Items,'select device_Name, id_Device from devices where not device_type is null ', 'device_name', 'ID_Device');
// Importclick(nil);
end;

procedure TAddSignurDeviceForm.btnSaveClick(Sender: TObject);

var
 i:integer;
begin
  inherited;

   if ((rgAccess.itemindex=2) and (ModBus_address.value > 247) or (ModBus_address.value <1)) then
     begin
      showmessage('Ошибка ввода адреса ModBus. Адреc должен быть в пределах от 1 до 247');
      modalresult:=mrNone;
      exit;
     end;

   if trim(device_number.text)='' then
    begin
     showmessage('Вы не задали заводской номер прибора');
     modalresult:=mrNone;
     exit;
    end;


   if trim(Device_CB.text)='' then
    begin
     showmessage('Задайте тип прибора');
     modalresult:=mrNone;
     exit;
    end;

   dm.q.sql.clear;
   dm.q.sql.add('select count(*) as cnt from eksp where device_number = :device_Number and id_device = :id_device and hide=0');
   dm.q.parambyname('device_Number').asinteger:= strtoint(trim(Device_Number.text));
   dm.q.parambyname('id_device').asinteger:= integer(Device_CB.Properties.Items.objects[device_CB.itemindex]);
   dm.q.Open;
   if dm.q.FieldByName('cnt').asinteger<>0 then
    begin
     showmessage('Заводской номер прибора должен быть уникальным для приборов данного типа');
     modalresult:=mrNone;
     exit;
    end;
   dm.q.close;

     if trim(eksp_Header.text)='' then
    begin
     if messagedlg('Вы не задали наименование прибора. Предложено наименование на основе типа и номера:  '+
                device_cb.text+' №'+device_number.text,
                mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                 begin
                  modalresult:=mrNone;
                  exit;
                 end else eksp_Header.text:=device_cb.text+' №'+device_number.text;
    end;

 try
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('EKSP_THEME').asstring:=theme.text;
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('EKSP_Date').asdatetime:=now;
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('EKSP_Time').asdatetime:=time;
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('EKSP_Header').asstring:=trim(eksp_Header.text);
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('EKSP_Author').asstring:=Author.Text;
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('EKSP_memo').asstring:=memo.text;
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('EKSP_SignalSource').asstring:='';
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('EKSP_SOURCEFILE').asstring:='';
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('ModBus_address').asinteger:=(ModBus_address.value);
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('modBus').asinteger:=integer(rgAccess.Itemindex=2);
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('BDR').asinteger:=(cbBDR.itemindex);
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('ParityControl').asinteger:=(cbParity.itemindex);
    dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('Phone_Number').asstring:=trim(Phone_Number.text);
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('modem').asinteger:=integer(rgAccess.Itemindex=1);
  dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('Tone_Pulse').asinteger:=Tone_Pulse.ItemIndex;
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('Access').asinteger:=Access.ItemIndex;
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('ID_Device').asinteger:=integer(Device_CB.Properties.Items.objects[device_CB.itemindex]);
   dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('Device_Number').asinteger:=strtoint(trim(Device_Number.text));
   dm.CREATE_EKSP_AND_DEVICEPARAM.ExecProc;

   Id:=dm.CREATE_EKSP_AND_DEVICEPARAM.ParamByName('ID').asinteger;

   if rgAccess.ItemIndex =3 then
    begin
     dm.q.sql.clear;
     dm.q.sql.add('update eksp set BlueTooth=1, BlueTooth_pin=:BlueTooth_pin where eksp_nomer = :eksp_nomer ');
     dm.q.parambyname('eksp_nomer').asinteger:=id;
     dm.q.parambyname('BlueTooth_pin').asinteger:=BlueTooth_pin.Value;
     dm.q.ExecSQL;
    end;

   dm.q.sql.clear;
   dm.q.sql.add('insert into signals');
   dm.q.sql.add(' (  EKSP_NOMER, EKSP_PARENT, CHANAL_NOMER,');
   dm.q.sql.add('    CHANAL_HEADER,  DELTX , NAMEX, NAMEY, RAZMX, RAZMY,');
   dm.q.sql.add('    MULTX, MULTY,  MAXX,    MAXY  ,');
   dm.q.sql.add('    MINX ,    MINY ,    DATE_START , TIME_START,');
   dm.q.sql.add('    POINTALL,BMAXMINX,  BMAXMINY,  FILEDAT,  REZTYPE,');
   dm.q.sql.add('    REZLENGTH ,  A0 ,A1 , A2 ,A3  ,SIGNALMEMO , SIGNAL_SELECTED ,FILE_SEEK, datetimestart)');
   dm.q.sql.add(' values ( :EKSP_NOMER, :EKSP_PARENT, :CHANAL_NOMER,');
   dm.q.sql.add('    :CHANAL_HEADER,  :DELTX , :NAMEX, :NAMEY, :RAZMX, :RAZMY,');
   dm.q.sql.add('    :MULTX, :MULTY,  :MAXX,    :MAXY  ,');
   dm.q.sql.add('    :MINX ,    :MINY ,    :DATE_START , :TIME_START,');
   dm.q.sql.add('    :POINTALL,:BMAXMINX,  :BMAXMINY,  :FILEDAT,  :REZTYPE,');
   dm.q.sql.add('    :REZLENGTH ,  0 ,1 , 0 ,0  ,:SIGNALMEMO , 1 ,0, :datetimestart)');
   dm.q.parambyname('eksp_nomer').asinteger:=ID;
   dm.q.parambyname('eksp_Parent').asinteger:=ID;
   dm.q.parambyname('RezType').asinteger:=cRealLong;
   dm.q.parambyname('RezLength').asinteger:=sizeof(Single);
   for i:=0 to 1 do
     begin
        dm.q.parambyname('Chanal_Nomer').asinteger:=i+1;
        case i of
         0:dm.q.parambyname('Chanal_Header').asstring:='Ah';
         1:dm.q.parambyname('Chanal_Header').asstring:='Ad';
        end;
        case i of
         0:dm.q.parambyname('DeltX').asfloat:=3600;
         1:dm.q.parambyname('DeltX').asfloat:=3600*24;
        end;
        dm.q.parambyname('NameX').asstring:='t';
        case i of
         0:dm.q.parambyname('NameY').asstring:='Ah';
         1:dm.q.parambyname('NameY').asstring:='Ad';
        end;
        dm.q.parambyname('RazmX').asstring:='сек';
        dm.q.parambyname('RazmY').asstring:='куб.м';
        dm.q.parambyname('MinX').asfloat:=0;
        dm.q.parambyname('MinY').asfloat:=0;
        dm.q.parambyname('MaxX').asfloat:=1;
        dm.q.parambyname('MaxY').asfloat:=1;
        dm.q.parambyname('DateTimeStart').asfloat:=now;
        dm.q.parambyname('Date_Start').asdatetime:=now;
        dm.q.parambyname('Time_Start').asDatetime:=now;
        dm.q.parambyname('PointAll').asinteger:=1;
        dm.q.parambyname('bmaxMinX').asinteger:=integer(false);
        dm.q.parambyname('bmaxMinY').asinteger:=integer(false);
        dm.q.parambyname('Filedat').asstring:={dm.ActiveStoragepath + }GetGuidStr+'.sgnr';
        dm.q.parambyname('SignalMemo').asstring:='';
        dm.q.execSQL;
       end;
          dm.CREATE_EKSP_AND_DEVICEPARAM.Transaction.CommitRetaining;
      except  on e:exception  do
       begin
       showmessage('Ошибка при регистрации. Описание и код ошибки: '+e.message);
       dm.CREATE_EKSP_AND_DEVICEPARAM.Transaction.RollbackRetaining;
       modalresult:=mrNone;
       exit;
       end;
 end;
end;

procedure TAddSignurDeviceForm.ModBusClick(Sender: TObject);
begin
  inherited;
{ IF MODBUS.Checked THEN begin MODEM.CHECKED:=FALSE;RS232.checked:=false;end;
 TabsheetModem.TabVisible:=modem.checked;
 TabsheetModbus.TabVisible:=modbus.checked;
 if modbus.checked then Pagecontrol1.ActivePage:=TabsheetModbus;}
end;

procedure TAddSignurDeviceForm.ModemClick(Sender: TObject);
begin
  inherited;
  { IF MODEM.Checked THEN begin MODBUS.CHECKED:=FALSE; RS232.checked:=false;end;
   TabsheetModem.TabVisible:=modem.checked;
   TabsheetModbus.TabVisible:=modbus.checked;
   if modem.checked then Pagecontrol1.ActivePage:=TabsheetModem;   }
end;

procedure TAddSignurDeviceForm.FormCreate(Sender: TObject);
begin
  inherited;
 TabsheetModem.TabVisible:=false ;
 TabsheetModbus.TabVisible:=false;
 TabsheetBlueTooth.TabVisible:=false;
end;

procedure TAddSignurDeviceForm.modbus_addressPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
 if ((displayvalue > 247) or (displayValue<1)) then errortext:='Ошибка ввода адреса. Адреc должен быть в пределах от 1 до 247';

end;

procedure TAddSignurDeviceForm.Tone_PulseClick(Sender: TObject);
begin
  inherited;
 Label_tone.Visible:=tone_pulse.ItemIndex=1;
 Label_pulse.Visible:=tone_pulse.ItemIndex=0;
end;

procedure TAddSignurDeviceForm.rgAccessClick(Sender: TObject);
begin
  inherited;
 TabsheetModem.TabVisible:=rgAccess.itemindex=1;
 TabsheetModbus.TabVisible:=rgAccess.itemindex=2;
 TabsheetBlueTooth.TabVisible:=rgAccess.itemindex=3;
 case rgAccess.itemindex of
  1: Pagecontrol1.ActivePage:=TabsheetModem;
  2: Pagecontrol1.ActivePage:=TabsheetModbus;
  3: Pagecontrol1.ActivePage:=TabsheetBlueTooth;
 end;
end;

end.
