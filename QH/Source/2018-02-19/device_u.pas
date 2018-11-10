unit device_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TxFrame, DbGridUnit, DB, IBCustomDataSet,
  IBUpdateSQL, IBQuery, Menus, ImgList, Buttons, Mask, DBCtrls, ComCtrls,
  DBCtrlsEh, Grids, DBGridEh, TeEngine, Series, TeeProcs, Chart, DbChart, utils, shellapi, rxstrutils,
    OleServer, math,
     ComObj, ActiveX, Excel2000, xlcOPack, xlProOPack, xlcClasses,
  xlEngine, xlReport, MemDS, VirtualTable, DBGrids, ToolEdit, CurrEdit,
  PropFilerEh, PropStorageEh, cxControls, cxContainer, cxEdit, cxTextEdit;


type
  TDevice_Form = class(TForm)
    Image24: TImageList;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    miClose: TMenuItem;
    N2: TMenuItem;
    miSaveEdit: TMenuItem;
    miRefresh: TMenuItem;
    N4: TMenuItem;
    miDeleteDevice: TMenuItem;
    q_devices: TIBQuery;
    q_devicesID: TIntegerField;
    q_devicesNAME: TIBStringField;
    q_devicesDEVICENUMBER: TIBStringField;
    q_devicesTYPEDEVICE_ID: TIntegerField;
    q_devicesCREATE_DATE: TDateField;
    q_devicesSALE_DATE: TDateField;
    q_devicesCUSTOMER: TIBStringField;
    q_devicesDESCR: TIBStringField;
    q_devicesID_CONVERTER: TIntegerField;
    q_devicesLOCKED: TSmallintField;
    q_devicesDEVICETYPENAME: TIBStringField;
    q_devicesCONVERTERNAME: TIBStringField;
    updateDevice: TIBUpdateSQL;
    ds_devices: TDataSource;
    DevicesPanel: TPanel;
    GridFrame: TDbGridFrame;
    N1: TMenuItem;
    Splitter1: TSplitter;
    ParamPanel: TPanel;
    pcInputValues: TPageControl;
    tsDeviceAttribute: TTabSheet;
    tsParamGrid: TTabSheet;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    edDescr: TDBMemo;
    Label2: TLabel;
    edName: TDBEdit;
    Panel2: TPanel;
    btnSaveInputData: TBitBtn;
    btnReport: TBitBtn;
    q_deviceparams: TIBQuery;
    ds_deviceparams: TDataSource;
    updateDeviceParams: TIBUpdateSQL;
    Label4: TLabel;
    edDeviceNumber: TDBEdit;
    Label5: TLabel;
    edCreate_date: TDBDateTimeEditEh;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edSale_Date: TDBDateTimeEditEh;
    cbConverter: TComboBox;
    pcQH: TPageControl;
    tsQH: TTabSheet;
    TabSheet5: TTabSheet;
    ParamGrid: TDBGridEh;
    q_deviceparamsID: TIntegerField;
    q_deviceparamsDEVICE_ID: TIntegerField;
    q_deviceparamsPARAMETER_ID: TIntegerField;
    q_deviceparamsPARAM_VALUE: TFloatField;
    q_deviceparamsNAME: TIBStringField;
    q_deviceparamsUNIT: TIBStringField;
    q_deviceparamsSHORTNAME: TIBStringField;
    q_deviceparamsCHANGEABLE: TSmallintField;
    q_deviceparamsFORMAT: TIBStringField;
    q_deviceparamsTYPEPARAM: TSmallintField;
    QHGrid: TDBGridEh;
    update_QH: TIBUpdateSQL;
    q_QH: TIBQuery;
    DS_QH: TDataSource;
    q_QHID: TIntegerField;
    q_QHDEVICE_ID: TIntegerField;
    q_QHX_VALUE: TFloatField;
    q_QHY_VALUE: TFloatField;
    q_QHI: TIntegerField;
    Panel3: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label10: TLabel;
    Panel4: TPanel;
    DBText3: TDBText;
    DBText4: TDBText;
    Label11: TLabel;
    q_devicesCALCMODE: TIBStringField;
    q_devicesVT_X_UNIT: TIBStringField;
    q_devicesVT_X_NAME: TIBStringField;
    q_devicesVT_X_SHORTNAME: TIBStringField;
    q_devicesVT_Y_UNIT: TIBStringField;
    q_devicesVT_Y_NAME: TIBStringField;
    q_devicesVT_Y_SHORTNAME: TIBStringField;
    Panel1: TPanel;
    btnProcessing: TBitBtn;
    btnGetHex: TBitBtn;
    N5: TMenuItem;
    miLock: TMenuItem;
    miUnlock: TMenuItem;
    q_devicesFORMULA: TIBStringField;
    DBText5: TDBText;
    DBMemo1: TDBMemo;
    q_conditions: TIBQuery;
    Splitter2: TSplitter;
    DBGridEh1: TDBGridEh;
    ds_conditions: TDataSource;
    q_conditionsID: TIntegerField;
    q_conditionsTYPEDEVICE_ID: TIntegerField;
    q_conditionsCONDITION: TIBStringField;
    q_conditionsVARS: TIBStringField;
    q_formulas: TIBQuery;
    ds_formulas: TDataSource;
    SD: TSaveDialog;
    q_QHT_COUNTER: TFloatField;
    q_QHX_PROCENT: TFloatField;
    GetQHMax: TIBQuery;
    GetQHMaxQMAX: TFloatField;
    GetQHMaxHMAX: TFloatField;
    q_QHY_PROCENT: TFloatField;
    GOSTTABLE: TVirtualTable;
    GOSTTABLEX_VALUE: TFloatField;
    GOSTTABLEY_VALUE: TFloatField;
    GOSTTABLET_COUNTER: TFloatField;
    xlProPackage1: TxlProPackage;
    btnXlsReport: TSpeedButton;
    ds_gosttable: TDataSource;
    q_deviceParam_RG: TIBQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    FloatField1: TFloatField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    SmallintField1: TSmallintField;
    IBStringField4: TIBStringField;
    SmallintField2: TSmallintField;
    RG_material: TRadioGroup;
    Label12: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label13: TLabel;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    N8: TMenuItem;
    N9: TMenuItem;
    miCloneDevice: TMenuItem;
    q_devicesDEVICE_PARENT_ID: TIntegerField;
    N11: TMenuItem;
    N12: TMenuItem;
    q_devicesPARENTDEVICENUMBER: TIBStringField;
    q_devicesPARAMS_ARE_BAD: TSmallintField;
    q_devicesCOMPOSITION_CURRENT: TSmallintField;
    q_devicesCOMPOSITION_RS: TSmallintField;
    q_devicesCOMPOSITION_LEVEL: TSmallintField;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    DBText6: TDBText;
    TabSheet2: TTabSheet;
    GostGrid: TDBGridEh;
    ds_GetQHMax: TDataSource;
    q_QH_SortByX: TIBQuery;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    IntegerField6: TIntegerField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    GOSTTABLEX_PROCENT: TFloatField;
    GOSTTABLEY_PROCENT: TFloatField;
    DBMemo2: TDBMemo;
    q_conditionsDISPLAYCONDITION: TIBStringField;
    q_deviceparamsDISPLAYNAME: TIBStringField;
    VisiblePointsTable: TVirtualTable;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    VisiblePointsTableI: TIntegerField;
    ds_visiblepointsTable: TDataSource;
    TabSheet4: TTabSheet;
    VisiblePointsGrid: TDBGridEh;
    Panel5: TPanel;
    Mnogitel: TLabel;
    btnProcessing1: TBitBtn;
    Label14: TLabel;
    DBText9: TDBText;
    Label15: TLabel;
    DBText10: TDBText;
    Label16: TLabel;
    DBText11: TDBText;
    miReplaceParent: TMenuItem;
    pmReplaceParent: TMenuItem;
    N20: TMenuItem;
    pmDeleteDevice: TMenuItem;
    N3: TMenuItem;
    q_devicesCOMPOSITION_IR_PORT: TSmallintField;
    q_devicesCOMPOSITION_DEVICETYPE: TSmallintField;
    q_devicesCOMPOSITION_IMP_OUT: TSmallintField;
    RG_DeviceType: TRadioGroup;
    q_devicesTABLE_CODE: TSmallintField;
    SpeedButton1: TSpeedButton;
    q_devicestblfile: TStringField;
    DBText7: TDBText;
    q_devicesRECORD_DATE: TDateTimeField;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    q_devicesNEED_RECALC: TSmallintField;
    q_devicesNEED_TBL: TSmallintField;
    btnTypeDevice: TBitBtn;
    q_QH_Parent: TIBQuery;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    cbTypeDevice: TComboBox;
    q_deviceparams_XLS: TIBQuery;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    FloatField14: TFloatField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    SmallintField3: TSmallintField;
    IBStringField8: TIBStringField;
    SmallintField4: TSmallintField;
    IBStringField9: TIBStringField;
    Chart: TDBChart;
    Series1: TLineSeries;
    Series2: TPointSeries;
    Series3: TPointSeries;
    Series4: TLineSeries;
    pmMenu_QHGrid: TPopupMenu;
    pmAddPoint: TMenuItem;
    pmDeletePoint: TMenuItem;
    RG_RS: TRadioGroup;
    RG_Level: TRadioGroup;
    RG_Current: TRadioGroup;
    RG_IR_Port: TRadioGroup;
    RG_IMP_OUT: TRadioGroup;
    Label6: TLabel;
    miCopyDevice: TMenuItem;
    miCreateNew_Urovnemer: TMenuItem;
    miCreateNew_rashodomer: TMenuItem;
    N7: TMenuItem;
    BitBtn1: TBitBtn;
    pnDelAddPoint: TPanel;
    btnAddPoint: TBitBtn;
    btnDeletePoint: TBitBtn;
    BitBtn2: TBitBtn;
    AddSdvig: TRxCalcEdit;
    RegPropStorageManEh1: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    dbnvgr1: TDBNavigator;
    pnltop: TPanel;
    pb: TProgressBar;
    lbl1: TLabel;
    btnclose: TSpeedButton;
    lblMouseY: TLabel;
    lblMouseX: TLabel;
    pnl1: TPanel;
    rgRG_Filter: TRadioGroup;
    btnInList: TButton;
    N24: TMenuItem;
    cbbCUSTOMER: TDBComboBoxEh;
    lbl2: TLabel;
    dbtxtadd: TDBText;
    fltfld_devicesADDITIVE_SHIFT: TFloatField;
    pnl2: TPanel;
    GB_L0: TGroupBox;
    edt_L0: TDBNumberEditEh;
    q_devicesL_0: TFloatField;
    chkL0: TCheckBox;
    pnlCanEditQh: TPanel;
    btnCanEditQH: TButton;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    cxFTP_CODE: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure q_devicesAfterDelete(DataSet: TDataSet);
    procedure q_devicesAfterOpen(DataSet: TDataSet);
    procedure q_devicesAfterPost(DataSet: TDataSet);
    procedure q_devicesAfterScroll(DataSet: TDataSet);
    procedure q_devicesBeforeClose(DataSet: TDataSet);
    procedure q_devicesBeforeScroll(DataSet: TDataSet);
    procedure btnSaveInputDataClick(Sender: TObject);
    procedure miRefreshClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure cbTypeDeviceCloseUp(Sender: TObject);
    procedure cbConverterCloseUp(Sender: TObject);
    procedure miDeleteDeviceClick(Sender: TObject);
    procedure ParamGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ParamGridCellClick(Column: TColumnEh);
    procedure ParamGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure q_deviceparamsBeforePost(DataSet: TDataSet);
    procedure q_deviceparamsAfterPost(DataSet: TDataSet);
    procedure q_QHBeforePost(DataSet: TDataSet);
    procedure q_QHAfterPost(DataSet: TDataSet);
    procedure pcQHChange(Sender: TObject);
    procedure lbl1DblClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure btnProcessingClick(Sender: TObject);
    procedure miLockClick(Sender: TObject);
    procedure miUnlockClick(Sender: TObject);
    procedure DbGridFrame1GridGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnxlsReportClick(Sender: TObject);
    procedure q_deviceParam_RGAfterOpen(DataSet: TDataSet);
    procedure ds_deviceParam_RGDataChange(Sender: TObject; Field: TField);
    procedure RG_materialClick(Sender: TObject);
    procedure QHGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N9Click(Sender: TObject);
    procedure miCloneDeviceClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure RG_CurrentClick(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure q_devicesPARAMS_ARE_BADGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure q_QHT_COUNTERGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure GOSTTABLET_COUNTERGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure q_QHX_VALUEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure q_QHY_VALUEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure pcInputValuesChange(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure QHGridExit(Sender: TObject);
    procedure FloatField7GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FloatField8GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ds_devicesDataChange(Sender: TObject; Field: TField);
    procedure miReplaceParentClick(Sender: TObject);
    procedure q_devicesNAMEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure N3Click(Sender: TObject);
    procedure ChartClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure q_devicesCOMPOSITION_DEVICETYPEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure q_devicesCalcFields(DataSet: TDataSet);
    procedure q_deviceparamsPARAM_VALUEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FloatField14GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ds_deviceparamsDataChange(Sender: TObject; Field: TField);
    procedure q_devicesBeforePost(DataSet: TDataSet);
    procedure pcInputValuesChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure edDeviceNumberExit(Sender: TObject);
    procedure cbConverterClick(Sender: TObject);
    procedure cbConverterExit(Sender: TObject);
    procedure btnTypeDeviceClick(Sender: TObject);
    procedure pmAddPointClick(Sender: TObject);
    procedure pmDeletePointClick(Sender: TObject);
    procedure edDeviceNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbCustomerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbCustomerCloseUp(Sender: TObject; Accept: Boolean);
    procedure miCopyDeviceClick(Sender: TObject);
    procedure miCreateNew_UrovnemerClick(Sender: TObject);
    procedure miCreateNew_rashodomerClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ParamGridExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnGetHexClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncloseClick(Sender: TObject);
    procedure pnltopResize(Sender: TObject);
    procedure edDeviceNumberEnter(Sender: TObject);
    procedure ChartMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GridFrameFieldComboNotInList(Sender: TObject;
      NewText: String; var RecheckInList: Boolean);
    procedure btnInListClick(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure cbbCustomerClick(Sender: TObject);
    procedure pnl2Click(Sender: TObject);
    procedure edt_L0Exit(Sender: TObject);
    procedure edt_L0KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComputeCRC (var data:Byte; var CRC:Word);
    procedure chkL0Click(Sender: TObject);
    procedure cbCanEditQH_Click(Sender: TObject);
    procedure btnCanEditQHClick(Sender: TObject);

  private
    { Private declarations }
    QMax:double; H_On_Qmax, Q_ON_HMax:double;
    Par_isd:double;
    Last_qetQHMax_ID:integer;
    oldDeviceNumber:string;
    procedure SetColumn_attValues;
  public
    { Public declarations }
   procedure SetQHGridTitleAndMode;
   procedure CheckLocked;
   Function GetParamValue(ParamShortName:string):double;
   procedure CreateQH_Values;
   Function CheckParams:boolean;
   procedure GetQHCalcColumns;
   procedure GetGOSTTable;
   procedure GetVisiblePointsTable;
   procedure GetVisiblePointsTable_New(NVisiblePoints:integer);
   procedure CalcQMax_for_User_table;
   Function CheckFillParams:boolean;
   Procedure updateDetailInfo;
   procedure CheckFiles;
   Procedure Calc_all;
   Procedure DropTblFile;
   procedure GET_QH_SORTbyX;
   Procedure GET_GETQHMax;
   procedure CreateTBL(Nomer_Vyzova:integer);
   Function Q_CHECK_USERMODE_NotAll_POINTS(ID_Device:integer):boolean;
   procedure RemoveAll(path: string);
 end;

var
  Device_Form: TDevice_Form;

implementation

uses dm_u,pascalc, pasfunc, main_u, SelectForm, createNewDevice_new_u,
  ShowDeviceInfo_u, DeviceList_u;



{$R *.dfm}

var Calc : TPasCalc;


procedure ProcessProc;
begin
  // Perform messages processing
  Application.ProcessMessages;
end;

procedure TDevice_Form.FormCreate(Sender: TObject);
var
  MyDecimal: PChar;
begin
  decimalseparator:= '.';

{  MyDecimal:=StrAlloc(10);
  GetLocaleInfo( LOCALE_SYSTEM_DEFAULT, LOCALE_SDECIMAL,  MyDecimal, 10);
  if MyDecimal = '.' then  decimalseparator:='.';
  if MyDecimal = ',' then  decimalseparator:=',' ;
 }
  Calc := TPasCalc.Create;
  // Register idle procedure (not required)
  Calc.SetProcessProc(@ProcessProc);
  // Register user-defined functions from module pasfunc.pas
  SetFunctions(Calc);

 pcInputValues.ActivePageIndex:=0;
 dm.GetName_IDStringsFromQuery(dm.q,'select name, ID from devicetypes order by id ',cbTypeDevice.Items,'name', 'ID');
 if cbTypeDevice.items.count>0 then cbTypeDevice.Itemindex:=0;
 dm.GetName_IDStringsFromQuery(dm.q,'select name, ID from Converters order by name ',cbConverter.Items,'name', 'ID');
 if cbConverter.items.count>0 then cbConverter.Itemindex:=0;
 dm.GetStringsFromIBSQL(dm.q,RG_Material.Items,'select Value_str from Settings where Value_Id=1 order by ID','Value_str');
 RG_Material.Itemindex:=0;
 if RG_Material.Items.count=7 then RG_Material.Items.add('Пластик');

  //dm.GetStringsFromIBSQL(dm.q,cbCustomer.Items,'select distinct Customer from devices  order by Customer ','Customer');
  //if cbCustomer.items.count>0 then cbCustomer.Itemindex:=0;
  dm.GetStringsFromIBSQL(dm.q,cbbCustomer.Items,'select distinct Customer from devices  order by Customer ','Customer');
 // if cbbCustomer.items.count>0 then cbbCustomer.Itemindex:=0;


 miRefreshClick(nil);
 DeviceListForm.VT.Clear;
 if not DirectoryExists(extractfiledir(Application.exename)+'\DeviceList') then
  CreateDir(extractfiledir(Application.exename)+'\DeviceList') ;
 RemoveAll(extractfiledir(Application.exename)+'\Devicelist');
end;

procedure TDevice_Form.FormShow(Sender: TObject);
begin
// q_devices.close;
 //q_devices.open;
end;

procedure TDevice_Form.q_devicesAfterDelete(DataSet: TDataSet);
begin
q_devices.Transaction.CommitRetaining;
end;

procedure TDevice_Form.q_devicesAfterOpen(DataSet: TDataSet);
var
 i:integer;
begin
 cbTypeDevice.ItemIndex:=cbTypeDevice.Items.IndexOfObject(Tobject(q_devices.fieldbyname('TypeDevice_ID').asinteger));
 cbConverter.ItemIndex:=cbConverter.Items.IndexOfObject(Tobject(q_devices.fieldbyname('ID_Converter').asinteger));
 RG_Current.OnClick:=nil;
 RG_Level.OnClick:=nil;
 RG_RS.OnClick:=nil;
 RG_DeviceType.OnClick:=nil;
 RG_IR_PORT.OnClick:=nil;
 RG_IMP_OUT.OnClick:=nil;

 RG_RS.ItemIndex:=q_devices.fieldbyname('Composition_RS').asinteger;
 RG_Level.ItemIndex:=q_devices.fieldbyname('Composition_Level').asinteger;
 RG_Current.ItemIndex:=q_devices.fieldbyname('Composition_Current').asinteger;
 RG_IR_PORT.ItemIndex:=q_devices.fieldbyname('Composition_IR_PORT').asinteger;
 RG_DEVICETYPE.ItemIndex:=q_devices.fieldbyname('Composition_DEVICETYPE').asinteger;
 RG_IMP_OUT.ItemIndex:=q_devices.fieldbyname('Composition_IMP_OUT').asinteger;

 RG_Current.OnClick:=RG_Currentclick;
 RG_Level.OnClick:=RG_Currentclick;
 RG_RS.OnClick:=RG_Currentclick;
 RG_DeviceTYPE.OnClick:=RG_Currentclick;
 RG_IR_PORT.OnClick:=RG_Currentclick;
 RG_IMP_OUT.OnClick:=RG_Currentclick;

 q_deviceparams.open;
 q_deviceparam_RG.open;
 q_QH.Open;  q_qh_Parent.Open;     q_QH_SortByX.Open;
 setQHGridTitleAndMode;
 CheckLocked;
 q_conditions.Open;
 q_Formulas.Open;
 case rgRG_Filter.itemindex of
  1:begin
    for i:=0 to GridFrame.Grid.columns.count-1 do
     if (GridFrame.grid.Columns[i].FieldName='DEVICETYPENAME') then
      GridFrame.grid.Columns[i].visible:=false;
    btnTypeDevice.visible:=false;  cbTypeDevice.visible:=false;
    end;
  0: begin
      for i:=0 to GridFrame.Grid.columns.count-1 do
       if (GridFrame.grid.Columns[i].FieldName='DEVICETYPENAME') then
        GridFrame.grid.Columns[i].visible:=true;
          btnTypeDevice.visible:=true;  cbTypeDevice.visible:=true;
    end;
  end;
end;

procedure TDevice_Form.q_devicesAfterPost(DataSet: TDataSet);
begin
q_devices.Transaction.CommitRetaining;
end;

procedure TDevice_Form.q_devicesAfterScroll(DataSet: TDataSet);
begin
  chkL0.Checked:=(Abs(q_devices.FieldByName('L_0').asfloat)>=0.001)  ;
//  Calc_all;
end;

Procedure  TDevice_Form.Calc_all;
begin
  cbTypeDevice.ItemIndex:=cbTypeDevice.Items.IndexOfObject(Tobject(q_devices.fieldbyname('TypeDevice_ID').asinteger));
 cbConverter.ItemIndex:=cbConverter.Items.IndexOfObject(Tobject(q_devices.fieldbyname('ID_Converter').asinteger));

 RG_Current.OnClick:=nil;
 RG_Level.OnClick:=nil;
 RG_RS.OnClick:=nil;
 RG_DeviceType.OnClick:=nil;
 RG_IR_PORT.OnClick:=nil;
 RG_IMP_OUT.OnClick:=nil;

 RG_RS.ItemIndex:=q_devices.fieldbyname('Composition_RS').asinteger;
 RG_Level.ItemIndex:=q_devices.fieldbyname('Composition_Level').asinteger;
 RG_Current.ItemIndex:=q_devices.fieldbyname('Composition_Current').asinteger;
 RG_IR_PORT.ItemIndex:=q_devices.fieldbyname('Composition_IR_PORT').asinteger;
 RG_IMP_OUT.ItemIndex:=q_devices.fieldbyname('Composition_IMP_OUT').asinteger;
 RG_DEVICETYPE.ItemIndex:=q_devices.fieldbyname('Composition_DEVICETYPE').asinteger;

 RG_Current.OnClick:=RG_Currentclick;
 RG_Level.OnClick:=RG_Currentclick;
 RG_RS.OnClick:=RG_Currentclick;
 RG_DeviceTYPE.OnClick:=RG_Currentclick;
 RG_IR_PORT.OnClick:=RG_Currentclick;
 RG_IMP_OUT.OnClick:=RG_Currentclick;

 setQHGridTitleAndMode;
 CheckLocked;
 //GetQHMax.Close; GetQHMax.open;
 GET_GETQHMax;
 Chart.RefreshDataSet(q_QH,Series1);
 GetGostTable; Chart.RefreshDataSet(GostTable,Series2);
 GetVisiblePointsTable;  Chart.RefreshDataSet(VisiblePointsTable,Series3);
 Chart.RefreshDataSet(q_QH_Parent,Series4);
 if q_qh.active then q_QH.First;
end;

procedure TDevice_Form.q_devicesBeforeClose(DataSet: TDataSet);
begin
q_deviceparams.close;
q_deviceparam_RG.close;
q_QH.close;q_QH_Parent.close;  q_QH_SortByX.close;   GetQHMax.Close;
q_conditions.close;
q_formulas.close;
end;

procedure TDevice_Form.q_devicesBeforeScroll(DataSet: TDataSet);
begin
try
 if (q_devices.State in [dsedit]) then q_devices.post;
{ q_devices.edit;
 q_devices.fieldbyname('Composition_Current').asinteger:=  RG_Current.ItemIndex;
 q_devices.fieldbyname('Composition_RS').asinteger:=  RG_RS.ItemIndex;
 q_devices.fieldbyname('Composition_Level').asinteger:=  RG_Level.ItemIndex;
 q_devices.post;
 }    except on E: Exception do
           showmessage('Ошибка при сохранении в базу данных:' +E.Message+'.      Вероятно, не выполнено требование уникальности номера прибора.');
 end;
end;

procedure TDevice_Form.btnSaveInputDataClick(Sender: TObject);
begin
 q_devicesBeforeScroll(q_devices);
 if (q_devices.State in [dsedit]) then q_devices.post;
 if (q_deviceparams.State in [dsEdit]) then q_deviceparams.post;
 if (q_deviceparam_RG.State in [dsEdit]) then q_deviceparam_RG.post;
 if (q_QH.state in [dsEdit]) then q_QH.post;
end;

procedure TDevice_Form.miRefreshClick(Sender: TObject);
var
 NLine, i:integer;
begin
 q_devices.close;
 NLine:=0;
 for i:=0 to Q_devices.SQL.Count-1 do
 begin
  if pos('WHERE ',AnsiUppercase(q_devices.sql[i]))=1 then
   begin
    NLine:=i;
    Break;
   end;
  end;
 case rgRG_Filter.itemindex of
//  0: q_devices.SQL[NLine]:='WHERE ';
  0: q_devices.SQL[NLine]:='WHERE D.COMPOSITION_DEVICETYPE=0  ';
  1: q_devices.SQL[NLine]:='WHERE D.COMPOSITION_DEVICETYPE=1  ';
 end;
 q_devices.open;
 q_devices.Last;
 q_devices.first;
end;

procedure TDevice_Form.miCloseClick(Sender: TObject);
begin
hide;
end;

procedure TDevice_Form.cbTypeDeviceCloseUp(Sender: TObject);
begin
 q_devices.edit;
 q_devices.fieldbyname('DeviceTypeName').asstring:=  cbTypeDevice.text;
 q_devices.post;
end;

procedure TDevice_Form.cbConverterCloseUp(Sender: TObject);
var
 id:integer;
begin
if cbConverter.ItemIndex  = -1 then exit;
 q_devices.edit;
 q_devices.fieldbyname('ConverterName').asstring:=  cbConverter.text;
 q_devices.fieldbyname('ID_Converter').asinteger:=  integer(cbConverter.Items.Objects[cbConverter.ItemIndex]);
 q_devices.post;
 cbbCustomer.SetFocus;
end;

procedure TDevice_Form.miDeleteDeviceClick(Sender: TObject);
begin
 if q_devices.FieldByName('Locked').asinteger=1 then
  begin
   ShowMessage('Прибор заблокирован. Удалить заблокированный прибор нельзя.');
   exit;
  end;
 if  application.MessageBox( pansiChar( format( QUEST_DeleteCalc,[q_devices.fieldbyname('DeviceNumber').asstring])),
                  pchar(msg_warning), MB_YESNO or MB_ICONQUESTION) = idYes
            then q_devices.delete;
end;

procedure TDevice_Form.ParamGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
 if q_deviceparams.FieldByName('typeparam').asinteger= 0 then background:=clskyblue;
 if q_deviceparams.FieldByName('typeparam').asinteger= 1 then background:=clcream;
// if q_deviceparams.FieldByName('typeparam').asinteger= 2 then background:=clscream;
 if column.FieldName = 'PARAM_VALUE' then
  begin
   if q_deviceparams.FieldByName('CHANGEABLE').asinteger=0 then background:=clSilver
  end;

 if ((q_devices.fieldbyname('Params_are_Bad').asinteger=1)
        and (ansiUppercase(Column.FieldName) = 'PARAM_VALUE'))
  then  begin
         Afont.Color:=clRed;
        end;

end;

procedure TDevice_Form.ParamGridCellClick(Column: TColumnEh);
begin
 ParamGrid.Columns[1].ReadOnly:=q_deviceparams.FieldByName('CHANGEABLE').asinteger=0;
 if q_deviceparams.FieldByName('Name').asstring='Материал трубы' then rg_material.Visible:=true
  else rg_material.Visible:=false;
end;

procedure TDevice_Form.ParamGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
ParamGrid.Columns[3].ReadOnly:=q_deviceparams.FieldByName('CHANGEABLE').asinteger=0;
if ((Key = VK_RETURN) or (key = VK_LEFT)) then
 begin
  if q_deviceparams.state in [dsEdit] then q_deviceparams.post;
 end;

 if q_deviceparams.FieldByName('Name').asstring='Материал трубы' then
  begin
   if key=vk_right then
    begin
     if rg_material.ItemIndex<7 then  rg_material.ItemIndex:=rg_material.ItemIndex+1
      else rg_material.ItemIndex :=0;
    rg_materialclick(nil);
    end;
  end
end;

procedure TDevice_Form.q_deviceparamsBeforePost(DataSet: TDataSet);
begin
 if q_deviceparams.fieldbyname('Format').asstring='0' then
  q_deviceparams.fieldbyname('param_value').value:=round(q_deviceparams.fieldbyname('param_value').value);
end;

procedure TDevice_Form.q_deviceparamsAfterPost(DataSet: TDataSet);
var
  ID_Param:integer;
begin
 ID_Param:=q_deviceparams.fieldbyname('ID').asinteger;
 dm.tranDefault.CommitRetaining;
 q_QH.close;q_QH.open;
 //if  (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE') then
  begin
  dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
  dm.needRecalc(1,q_devices.FieldByName('ID').ASINTEGER);
  CheckFiles;
  q_devices.Edit;
  q_devices.fieldbyname('Need_TBL').asinteger:=1;
  q_devices.fieldbyname('Need_RECALC').asinteger:=1;
  q_devices.fieldbyname('TblFile').asstring:='';
  q_devices.post;
 end;
 q_deviceparams.locate('ID',ID_Param,[]);
end;

procedure TDevice_Form.SetQHGridTitleAndMode;
begin
 QHGrid.columns[1].title.Caption:=q_devices.fieldbyname('VT_X_Name').asstring+'|'+q_devices.fieldbyname('VT_X_Unit').asstring;
 QHGrid.columns[2].title.Caption:=q_devices.fieldbyname('VT_Y_Name').asstring+'|'+q_devices.fieldbyname('VT_Y_Unit').asstring;
 QHGrid.columns[3].title.Caption:=q_devices.fieldbyname('VT_X_Name').asstring+'|%';
 QHGrid.columns[4].title.Caption:=q_devices.fieldbyname('VT_Y_Name').asstring+'|%';
 QHGrid.columns[5].visible:=not (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE');
 QHGrid.readonly:=not (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE');



 if (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE') then
  begin
   qhGrid.PopupMenu:=pmMenu_QHgrid   ;
   pnDelAddPoint.Visible:=true;
   pnlCanEditQh.Visible:=False;   //2017.09.21
  end
  else
   begin
    QHGrid.PopupMenu:=nil;
    pnDelAddPoint.Visible:=false;
    pnlCanEditQH.Visible:=true;   //2017.09.21
   end;
 Chart.BottomAxis.Title.Caption:=q_devices.fieldbyname('VT_X_Name').asstring+','+q_devices.fieldbyname('VT_X_Unit').asstring;
 Chart.LeftAxis.Title.Caption:=q_devices.fieldbyname('VT_Y_Name').asstring+','+q_devices.fieldbyname('VT_Y_Unit').asstring;
 Chart.RefreshDataSet(q_QH,Series1);
 GetGostTable;
 GostGrid.columns[0].title.Caption:=q_devices.fieldbyname('VT_X_Name').asstring+'|'+q_devices.fieldbyname('VT_X_Unit').asstring;
 GostGrid.columns[1].title.Caption:=q_devices.fieldbyname('VT_Y_Name').asstring+'|'+q_devices.fieldbyname('VT_Y_Unit').asstring;
 GostGrid.columns[2].visible:=not (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE');
 GetVisiblePointsTable;
 VisiblePointsGrid.columns[1].title.Caption:=q_devices.fieldbyname('VT_X_Name').asstring+'|'+q_devices.fieldbyname('VT_X_Unit').asstring;
 VisiblePointsGrid.columns[2].title.Caption:=q_devices.fieldbyname('VT_Y_Name').asstring+'|'+q_devices.fieldbyname('VT_Y_Unit').asstring;
 VisiblePointsGrid.columns[3].title.Caption:=q_devices.fieldbyname('VT_X_Name').asstring+'|%';
 VisiblePointsGrid.columns[4].title.Caption:=q_devices.fieldbyname('VT_Y_Name').asstring+'|%';
 VisiblePointsGrid.columns[5].visible:=not (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE');
 Chart.RefreshDataSet(GostTable,Series2);
end;

procedure TDevice_Form.q_QHBeforePost(DataSet: TDataSet);
begin
  if q_QH.fieldbyname('X_Value').asfloat > GetParamValue('Hmax')
   then q_QH.fieldbyname('X_Value').asfloat:= GetParamValue('Hmax');

 // 2017.09.21
      if q_qh.Fieldbyname('Y_Value').asfloat<>0 then
    q_QH.fieldbyname('T_Counter').asfloat:=3600.0/q_qh.Fieldbyname('Y_Value').asfloat
     else q_QH.fieldbyname('T_Counter').asfloat:=0;
   if GetQHMax.fieldbyname('Qmax').asfloat<>0 then
    q_QH.fieldbyname('Y_procent').asfloat:=q_qh.Fieldbyname('Y_Value').asfloat/GetQHMax.fieldbyname('Qmax').asfloat*100
     else q_QH.fieldbyname('Y_procent').asfloat:=0;
   if GetQHMax.fieldbyname('Hmax').asfloat<>0 then
    q_QH.fieldbyname('X_procent').asfloat:=q_qh.Fieldbyname('X_Value').asfloat/GetQHMax.fieldbyname('Hmax').asfloat*100
     else q_QH.fieldbyname('X_procent').asfloat:=0;
 // 2017.09.21
 
end;

Function TDevice_Form.GetParamValue(ParamShortName:string):double;
begin
 if q_deviceparams.active then
 begin
 q_Deviceparams.disablecontrols;
 if q_Deviceparams.Locate('ShortName',ParamShortName,[])
  then
   begin
    if q_deviceparams.fieldbyname('Param_Value').isnull then result:=0
     else result:=q_deviceparams.fieldbyname('Param_Value').Value;
   end;
  q_Deviceparams.enablecontrols;
 end; 
end;

procedure TDevice_Form.q_QHAfterPost(DataSet: TDataSet);
var
 I, ID:integer  ;
begin
 ID:=q_qh.fieldbyname('ID').asinteger;
 dm.tranDefault.CommitRetaining;
 if  (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE') then
  begin
  I:=q_qh.fieldbyname('I').asinteger;
  dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
  CheckFiles;
  q_devices.Edit;
  q_devices.fieldbyname('Need_TBL').asinteger:=1;
  q_devices.fieldbyname('TblFile').asstring:='';
  q_devices.post;

  q_qh.locate('I',I,[]);
  q_qh.locate('I',I,[]);
 end
  else
   q_qh.locate('ID',ID,[]);
end;

procedure TDevice_Form.pcQHChange(Sender: TObject);
begin

 if pcQH.ActivePageIndex=1 then CalcQMax_for_User_table;

 //GetQHMax.Close; GetQHMax.open;
 GET_GETQHMax;

 Chart.RefreshDataSet(q_QH,Series1);
 q_QH_SortByX.Close;
 GetGOSTTable;  Chart.RefreshDataSet(GostTable,Series2);
 GetVisiblePointsTable;  Chart.RefreshDataSet(VisiblePointsTable,Series3);
 Chart.RefreshDataSet(q_QH_Parent,Series4);
 q_qh.First;
end;

procedure TDevice_Form.lbl1DblClick(Sender: TObject);
begin
// if ParamPanel.width<50 then ParamPanel.width:=width *3 div 4
//  else ParamPanel.width:=45;
end;

procedure TDevice_Form.btnReportClick(Sender: TObject);
var
  HTML: TStringList;
  i:integer;
  QHImageFilename,HTMLFileName:string;
  Image:TImage;

  xlReport:TxlReport;
  
  function SpaceReplace(Value: string): string;
  begin
    if Value <> '' then
      Result := Value
    else
      Result := '&nbsp;';
  end;


  function CreateHtmlReportHeader(ReportHeader:string): string;
  var
    I: Integer;
  begin
    try
      HTML.Add('<HTML><HEAD><TITLE>');
      HTML.Add('Прибор:  ' + q_devices.fieldbyname('Name').text);
      HTML.Add('</TITLE><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"><HEAD>');
      HTML.Add('<BODY>');
//      HTML.Add(ReportHeader+'<BR>');
//      HTML.Add('<BR>');
      HTML.Add('Прибор:  ' + q_devices.fieldbyname('Name').text +' '+ RG_DEVICETYPE.Items[RG_DeviceType.itemindex]+'<BR>');
      HTML.Add('Номер прибора:  ' + q_devices.fieldbyname('DeviceNumber').text + '<BR><BR>');
      HTML.Add('Дата первичного расчета:  ' + formatdatetime('dd.mm.yyyy',q_devices.fieldbyname('Create_Date').asdatetime) + '<BR>');
      HTML.Add('Дата текущего расчета:  ' + formatdatetime('dd.mm.yyyy',q_devices.fieldbyname('Sale_Date').asdatetime) + '<BR>');
//      HTML.Add('<BR>');
      HTML.Add('Тип водовода: ' + cbTypeDevice.text+'<BR>');
      HTML.Add('Тип акустического преобразователя: ' + cbConverter.text+'<BR>');
      HTML.Add('Комплектация.  Блок тока: ' + RG_Current.Items[RG_Current.Itemindex]+' Блок RS: ' + RG_RS.Items[RG_RS.Itemindex] +' Блок уставок: ' + RG_Level.Items[RG_Level.Itemindex]+'<BR>');
      HTML.Add('               ИК-порт:' + RG_IR_PORT.Items[RG_IR_PORT.Itemindex]+' Импульсный вход: ' + RG_IMP_OUT.Items[RG_IMP_OUT.Itemindex] +' Блок уставок: ' + RG_Level.Items[RG_Level.Itemindex]+'<BR>');
      HTML.Add('Примечание к прибору:' + edDescr.text{eksps.FieldByName('EKSP_MEMO').text}+'<BR>');
      HTML.Add('<BR>');

    finally
      result := html.Text;
    end;
  end;

  function CreateHtmlReportTable_Values(Grid:TDBGridEh): string;
  var
    I: Integer;
  begin
    try
      HTML.Add('<P><table border=1 cellspacing=0 cellpadding=2 bordercolor=#808080 >');
  // первая строка таблицы
      HTML.Add('<TR>');
      for i := 0 to Grid.Columns.Count - 1 do
          HTML.Add('<TD align=center nowrap bgColor=#FFFFCC >' + Grid.Columns[i].Title.Caption + '</TD>');
      HTML.Add('</TR>');

      Grid.DataSource.DataSet.first;
      while not Grid.DataSource.DataSet.eof do
      begin
        HTML.Add('  <TR>');
        for i := 0 to Grid.Columns.Count - 1 do
        begin
             if Grid.Columns[i].alignment=taRightJustify then
              HTML.Add(Format('<TD align=right nowrap> %s</TD>',
               [SpaceReplace(Grid.DataSource.DataSet.fieldbyname(Grid.columns[i].fieldname).text)]));
             if Grid.Columns[i].alignment=taCenter then
              HTML.Add(Format('<TD align=center nowrap> %s</TD>',
               [SpaceReplace(Grid.DataSource.DataSet.fieldbyname(Grid.columns[i].fieldname).text)]));
             if Grid.Columns[i].alignment=taLeftJustify then
              HTML.Add(Format('<TD align=left nowrap> %s</TD>',
               [SpaceReplace(Grid.DataSource.DataSet.fieldbyname(Grid.columns[i].fieldname).text)]));
        end;
        HTML.Add('</TR>');
        Grid.DataSource.DataSet.next;
      end;
      HTML.Add('</TABLE>');
    finally
      result := html.Text;
    end;
  end;

begin
   GetGOSTTable;
   GetVisiblePointsTable;

   HTML := TStringList.create;
   CreateHtmlReportHeader('---------');
   CreateHtmlReportTable_Values(ParamGrid);
//   CreateHtmlReportHeader('---------');
   if q_devices.fieldbyname('Params_are_bad').asinteger=1 then
      HTML.Add('<BR>Параметры некорректны!!!<BR>');
   HTML.Add('<BR>Градуировочная характеристика<BR>');
   CreateHtmlReportTable_Values(GostGrid);
   HTML.Add('<BR>Справочная характеристика<BR>');
   HTML.Add('<BR>'+Mnogitel.Caption+'<BR>');

   CreateHtmlReportTable_Values(VisiblePointsGrid{QHGrid});
   QHImagefilename:=ExtractFilePath(Application.exename)+'HTML\QH_'+GetGuidstr+'.bmp';
   Image:=TImage.create(self); Image.height:=Chart.height; Image.width:=Chart.width;
   Chart.paintto(Image.Canvas,0,0);
   Image.Picture.SaveToFile(QHImagefilename);
   dm.ConvertBmpToJpeg(QHImagefilename);
   HTML.Add('<BR><IMG SRC = "'+ChangeFileExt(QHImagefilename,'.jpg')+'" ALT="Характеристика"<BR>');
   HTML.Add('<p align=left style="font-size:9pt">Отчет сформирован ' + FormatDateTime('dd.mm.yyyy hh:mm', Now));
   HTML.Add('</BODY></HTML>');
   HTMLFilename:=ExtractFilePath(Application.exename)+'HTML\'+GetGuidstr+'.htm';
   HTML.SaveToFile(HTMLFileName);
   ShellExecute(Application.Handle, nil, pchar(HTMLFilename), nil, nil, SW_SHOW);
   HTML.Free;
end;

procedure TDevice_Form.btnProcessingClick(Sender: TObject);
begin
  Last_qetQHMax_ID:=-1;
  q_QH_SortByX.Close;
 if q_devices.fieldbyname('TypeDevice_ID').IsNull then
  begin
   ShowMessage('Не выбран тип водовода');
   exit;
  end;
 if not CheckFillParams then exit;
 if ((q_devices.fieldbyname('CalcMode').asstring='FORMULA') or
   (( q_devices.fieldbyname('CalcMode').asstring='USERTABLE')
    and  (MessageDlg('Существующая характеристика будет удалена. Вы уверены?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes))) then
 begin
 if CheckParams   // если параметры корректны, считает характристику
  then
   begin
    q_devices.Edit;
    if q_devices.fieldbyname('Create_Date').isnull then q_devices.fieldbyname('Create_Date').asdatetime:=now;
    if not q_devices.fieldbyname('Sale_Date').isnull then q_devices.fieldbyname('Create_Date').asdatetime:=q_devices.fieldbyname('Sale_Date').asdatetime;
    q_devices.fieldbyname('Sale_Date').asdatetime:=now;
    q_DEVICES.FieldByName('Params_are_bad').asinteger:=0;
    q_devices.fieldbyname('Record_Date').asdatetime:=now;
    q_devices.fieldbyname('Need_Recalc').asinteger:=0;
    q_devices.fieldbyname('Need_TBL').asinteger:=1;
    q_devices.fieldbyname('TblFile').asstring:='';
    q_devices.fieldbyname('Additive_shift').value:=0;
    q_devices.post;
    dm.NEEDRecalc(0,q_devices.FieldByName('ID').ASINTEGER);
    dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
    CreateQH_values;
    GetQHCalcColumns;
    GetGostTable;
    GetVisiblePointsTable;
    pcInputValues.ActivePageIndex:=2;
   end
    else
     begin
     if MessageDlg('Параметры заданы некорректно. Вы все равно хотите рассчитать характеристику?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        q_devices.Edit;
        if q_devices.fieldbyname('Create_Date').isnull then q_devices.fieldbyname('Create_Date').asdatetime:=now;
        q_devices.fieldbyname('Sale_Date').asdatetime:=now;
        q_DEVICES.FieldByName('Params_are_bad').asinteger:=1;
        q_devices.fieldbyname('Record_Date').asdatetime:=now;
        q_devices.fieldbyname('Need_Recalc').asinteger:=0;
        q_devices.fieldbyname('Need_TBL').asinteger:=1;
        q_devices.fieldbyname('TblFile').asstring:='';
        q_devices.fieldbyname('Additive_shift').value:=0;
        q_devices.post;
        dm.NEEDRecalc(0,q_devices.FieldByName('ID').ASINTEGER);
        dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
        CreateQH_values;                        
        GetQHCalcColumns;
        GetGostTable;
        GetVisiblePointsTable;
        pcInputValues.ActivePageIndex:=2;
      end;
     end;
 Chart.RefreshDataSet(q_QH,Series1);
 GetQHCalcColumns;
 GetGostTable;    Chart.RefreshDataSet(GostTable,Series2);
 GetVisiblePointsTable;Chart.RefreshDataSet(VisiblePointsTable,Series3);

 if q_devices.fieldbyname('CalcMode').asstring='USERTABLE' then  pcQH.ActivePageIndex:=0
  else  pcQH.ActivePageIndex:=1;
 end;
 Chart.RefreshDataSet(q_QH_Parent,Series4);
 if q_devices.FieldByName('TblFile').asstring<>'' then
    begin
     DropTBLFile;
    end;
 Last_qetQHMax_ID:=-1;
 q_QH_SortByX.Close;
 Calc_all;
end;

procedure TDevice_Form.GetQHCalcColumns;
var
 P_Isd:double;
begin
 GET_GETQHMax;//GetQHMax.close; GetQHMax.Open;

 if GetQHMax.fieldbyname('Qmax').asfloat>36000 then  P_isd:=100;
 if GetQHMax.fieldbyname('Qmax').asfloat<=36000 then P_isd:=10;
 if GetQHMax.fieldbyname('Qmax').asfloat<= 3600 then P_isd:=1;
 if GetQHMax.fieldbyname('Qmax').asfloat<=  360 then P_isd:=0.1;
 if GetQHMax.fieldbyname('Qmax').asfloat<=  36 then  P_isd:=0.01;
 if GetQHMax.fieldbyname('Qmax').asfloat<=  3.6 then P_isd:=0.001;
 Mnogitel.caption:='Множитель единицы младшего разряда: '+formatfloat('0.000',P_ISD);
 q_QH.disablecontrols;
 q_QH.first;
 while not q_QH.eof do
  begin
   q_QH.edit;
   if q_qh.Fieldbyname('Y_Value').asfloat<>0 then
    q_QH.fieldbyname('T_Counter').asfloat:=3600.0/q_qh.Fieldbyname('Y_Value').asfloat
     else q_QH.fieldbyname('T_Counter').asfloat:=0;
   if GetQHMax.fieldbyname('Qmax').asfloat<>0 then
    q_QH.fieldbyname('Y_procent').asfloat:=q_qh.Fieldbyname('Y_Value').asfloat/GetQHMax.fieldbyname('Qmax').asfloat*100
     else q_QH.fieldbyname('Y_procent').asfloat:=0;
   if GetQHMax.fieldbyname('Hmax').asfloat<>0 then
    q_QH.fieldbyname('X_procent').asfloat:=q_qh.Fieldbyname('X_Value').asfloat/GetQHMax.fieldbyname('Hmax').asfloat*100
     else q_QH.fieldbyname('X_procent').asfloat:=0;
   q_QH.Post;
   q_QH.next;
  end;
  q_QH.first;
  q_QH.Enablecontrols;
end;


Function TDevice_Form.CheckParams:boolean;
// проверяет корректность ввода параметров, опираясь на запись в Conditions
var
 i: integer;
 R:TVar;
 Text:string;
 Vars:Tstringlist;
 ParamValue:double;
 s, s1,s2:string;
 nWords,Cword:integer;
 bError:boolean;
begin
 //

 decimalseparator:= '.';
 
 if (q_deviceparams.State in [dsEdit]) then q_deviceparams.post;
 q_deviceparams.DisableControls;
 q_deviceparams.first;
 bError:=false;
 while not q_deviceparams.eof do
  begin
   if q_deviceparams.fieldbyname('Param_value').isnull then bError:=true;
   q_deviceparams.next
  end;
 q_deviceparams.EnableControls;
 if bError then
  begin
   ShowMessage('Нет возможности выполнить расчет, т.к. не все необходимые параметры заданы.');
   exit;
  end;
 Result:=true;
 q_conditions.First;
 while not q_conditions.eof do  // последовательно для каждого условия
  begin
   Text:='RESULT:='+q_Conditions.fieldbyname('Condition').asstring+';';
   Vars:=TStringlist.Create;
   s:=q_Conditions.fieldbyname('vars').asstring;
   s1:=s;
   NWords:=wordcount(s,[';']);
   for Cword:=1 to NWords do
    begin
     s2:=trim(extractword(Cword,s,[';']));
     Vars.add(s2);
    end;
   for i:=0 to vars.Count-1 do
      if q_deviceparams.Locate('shortname',vars[i],[]) then Text:=vars[i]+':='+
            formatfloat(q_deviceparams.fieldbyname('Format').asstring,
                       q_deviceparams.fieldbyname('Param_Value').AsFloat)+';'+Text;
   Calc.ClearVars;
   Calc.Execute(Text);
   if Calc.ErrCode<>0 then
    begin
     showmessage(Calc.ErrMsg);
     Result:=false;
   end
   else
    begin
     Calc.VarByName('RESULT',R);
     if R.Num=0 then
      begin
       showmessage('Не выполнено условие:'+q_Conditions.fieldbyname('DisplayCondition').asstring);
       Result:=false;
      end;
    end;
   vars.Free;
   Calc.ClearVars;
   q_Conditions.Next;
  end;
end;


Function TDevice_Form.CheckFillParams:boolean;
// проверяет заполненность параметров
var
 bError:boolean;
begin
 //
 if (q_deviceparams.State in [dsEdit]) then q_deviceparams.post;
 q_deviceparams.DisableControls;
 q_deviceparams.first;
 bError:=false;
 while not q_deviceparams.eof do
  begin
   if q_deviceparams.fieldbyname('Param_value').isnull then bError:=true;
   q_deviceparams.next
  end;
 q_deviceparams.EnableControls;
 if bError then
  begin
   ShowMessage('Нет возможности выполнить расчет, т.к. не все необходимые параметры заданы.');
   Result:=false;
   exit;
  end;
 Result:=true;
end;


procedure TDevice_Form.CreateQH_Values;  // рассчитывает характеристику.
//Сначала считает значения по X,
//полагая их равномерно распределенными по оси от 0 до HMax
var
 Hmax:double;
 i,j,N:integer;
 step:double;
 x:double;

 filename: string;
  Excel: TExcelApplication;
  Sheet: _WorkSheet;
  Book: _WorkBook;
  s:string;

  VarName,varsString:string;
  CellName,CellsString:string;
  Vars, Cells:TstringList;
  NWords, CWord:integer;
  Y_Value,Table_Value,Row_Value, Col_Value:double;
  ArgumentFormulaValue:double;
begin
try
if (q_deviceparams.State in [dsEdit]) then q_deviceparams.post;
if (q_deviceparam_RG.State in [dsEdit]) then q_deviceparam_RG.post;
q_QH.disablecontrols;
q_QH.FetchAll;
Hmax:=GetParamValue('Hmax');
N:=q_QH.recordcount;
q_QH.First;
i:=0;
Step:=HMax/(N-1);
q_qh.afterpost:=nil;
while not q_QH.eof do
 begin
  q_QH.edit;
  x:=Step*i;
 q_QH.FieldByName('Y_Value').AsFloat:=0;
 if q_devices.fieldbyname('CalcMode').asstring='USERTABLE' then q_QH.FieldByName('X_Value').AsFloat:=0
  else  q_QH.FieldByName('X_Value').AsFloat:=x;//strtofloat(formatfloat('0.00',x));
  if x>=(HMax-step/10) then q_QH.FieldByName('X_Value').AsFloat:=x;
  q_QH.post;
  q_qh.Next;
  i:=i+1;
 end;
 q_QH.enablecontrols;
 q_qh.afterpost:=q_QHAfterpost;
 if q_devices.fieldbyname('CalcMode').asstring='USERTABLE' then
  begin
   pcInputValues.ActivePageIndex:=2;
   pcQH.ActivePageIndex:=0;
   exit;
  end;

    Filename:=extractFilepath(application.exename)+'excel\'+q_devices.fieldbyname('formula').asstring;

  q_deviceparams.disablecontrols;

  Excel := TExcelApplication.Create(nil);
  try
    Excel.ConnectKind := ckNewInstance;
    Excel.DisplayAlerts[0] := False;
    Excel.AutoQuit := True;
  Excel.Visible[0] :=  false;//true;
//    Excel.Visible[0] :=  true;
    Excel.Connect;
    Book := Excel.Workbooks.Open(FileName,
      Emptyparam, Emptyparam, Emptyparam,
      Emptyparam, Emptyparam, Emptyparam,
      Emptyparam, Emptyparam, True,
      Emptyparam, Emptyparam, Emptyparam, 0);
    Book.Activate(0);
    Excel.Calculation[0] := xlManual;
//    Sheet := Book.WorkSheets[1] as _Worksheet; Sheet.Activate(0);
    q_QH.disablecontrols;
    PB.visible:=true;
    PB.Min:=0;PB.Max:=q_qh.RecordCount; i:=0;
    q_qh.first;
    while not q_qh.eof do   // перебираю точки характеристики
     begin
     i:=i+1; Pb.Position:=i;PB.Update;
     q_formulas.first;
      while not q_formulas.eof do  // перебираю аргументы для расчета формулы
       begin
        if q_formulas.fieldbyname('parameter').asinteger=1 then
         begin
          ArgumentFormulaValue:=getParamValue(q_formulas.fieldbyname('Shortname').asstring);
         end;
        if q_formulas.fieldbyname('parameter').asinteger=2 then
         begin
          ArgumentFormulaValue:=q_QH.fieldbyname('X_Value').asfloat;
         end;
         if q_formulas.fieldbyname('parameter').asinteger=0 then // расчет с помощью листа с таблицей
         begin
          Sheet := Book.WorkSheets[q_formulas.fieldbyname('Sheet_num').asinteger] as _Worksheet;
          Sheet.Activate(0); // положил на лист значение параметра
          varsString:=q_formulas.fieldbyname('Vars').asstring;  // список переменных
          CellsString:=q_formulas.fieldbyname('Cells').asstring; // cписок ячеек
          NWords:=wordcount(varsString,[';']);
          for Cword:=1 to NWords do
            begin
             varname:=trim(extractword(Cword,VarsString,[';']));
             Cellname:=trim(extractword(Cword,CellsString,[';']));
             if AnsiUpperCase(varname)='HX' then sheet.Range[Cellname,CellName].Value:=q_QH.fieldbyname('X_Value').asfloat
               else  sheet.Range[Cellname,CellName].Value:=getParamValue(Varname);  // положили в excel lанные для расчета значения по колонке и строке
             end;

           Row_Value:= sheet.Range[q_formulas.fieldbyname('Row_Res_Cell').asstring,   // excel рассчитал значения по строке
                                   q_formulas.fieldbyname('Row_Res_Cell').asstring].Value;
           Col_Value:= sheet.Range[q_formulas.fieldbyname('Col_Res_Cell').asstring,  // excel рассчитал значения по колонке
                                   q_formulas.fieldbyname('Col_Res_Cell').asstring].Value;
           Row_value:=strtofloat(formatfloat(q_formulas.fieldbyname('Format_Row').asstring,Row_value));  //округлили значения
           Col_value:=strtofloat(formatfloat(q_formulas.fieldbyname('Format_Col').asstring,Col_value));

           sheet.Range[q_formulas.fieldbyname('RowValue_CellName').asstring,    // передаю в Excel значения для таблицы по строкам и рядам
                       q_formulas.fieldbyname('RowValue_CellName').asstring].Value:=Row_Value;
           sheet.Range[q_formulas.fieldbyname('ColValue_CellName').asstring,
                       q_formulas.fieldbyname('ColValue_CellName').asstring].Value:=Col_Value;
          try
           s:= sheet.Range[q_formulas.fieldbyname('Result_Cellname').asstring,
                      q_formulas.fieldbyname('Result_Cellname').asstring].Text;
           if ((s='#N/A') or (s=''))  then
                   Table_Value:=0
                        else
                    Table_Value:=sheet.Range[q_formulas.fieldbyname('Result_Cellname').asstring,
                      q_formulas.fieldbyname('Result_Cellname').asstring].value;
            except
             Table_Value:=-1;
            end;
           ArgumentFormulaValue:=Table_Value
         end;
       Sheet := Book.WorkSheets[1] as _Worksheet; Sheet.Activate(0); // положил на лист значение параметра
       sheet.Range[q_formulas.fieldbyname('Cellname').asstring,
                   q_formulas.fieldbyname('Cellname').asstring].Value:=ArgumentFormulaValue;
       q_formulas.next;
      end;
                 // получить рез-т расчета формулы из A1 на первом листе
      Excel.Calculate;
      Sheet := Book.WorkSheets[1] as _Worksheet; Sheet.Activate(0); //
      try
       Y_Value :=  sheet.Range['A1','A1'].Value;
       except
       Y_value := 0
       end;

      q_QH.edit;
      q_QH.FieldByName('Y_Value').AsFloat:=Y_Value;
      q_QH.post;
//    sleep(2000);
      q_QH.next;
     end;
    q_QH.enablecontrols;
    PB.Visible:=false;

//    Sheet := Book.WorkSheets[2] as _Worksheet; Sheet.Activate(0);

  finally
    q_deviceparams.enablecontrols;
    q_QH.enablecontrols;
    Excel.Disconnect;
    Excel.Free;

  end;

  except on E: Exception do
           showmessage('Ошибка при выполнении расчета:' +E.Message);
 end;

end;

procedure TDevice_Form.ComputeCRC (var data:Byte; var CRC:Word);
   var
     i : Byte;
     fl  : Boolean;
     data_w   : Word;
     data_ar2 : Array[1..2] of Byte absolute data_w;
   begin
    data_ar2[1] := data;
    data_ar2[2] := 0;
    CRC := CRC xor data_w;
    for i:=1 to 8 do
      begin
       fl := (CRC and 1 = 1);
       CRC := CRC shr 1;
       if fl then
         CRC := CRC xor $a001;
      end;
   end; {ComputeCRC}


procedure TDevice_Form.CreateTBL(Nomer_Vyzova:Integer);
const
 N64 = 61;//65;
type
{$A-}
    Tbl_type_array = record
      Part_1:array[1..241] of Byte;
      CRC_1:Word;
      Part_2:array[1..31] of Byte;
      CRC_2:Word;
      end;


TFileRec =  record
  YArray:array[1..N64-1] of single;
  P_isd:byte;
  CRC_1:Word;
  Composition_DEVICETYPE: byte;
  Converter_Table_Code: byte;
  Composition_RS: byte;
  Composition_Current: byte;
  Composition_IR_PORT: byte;
  Composition_IMP_OUT: byte;
  HMax: single;
  Serial_NUMBER1:char;
  Serial_NUMBER2:char;
  Serial_NUMBER3:char;
  Serial_NUMBER4:char;
  Composition_level : byte;
  L_0:Single;
  Reserved_Zone :array[1..12] of Byte;
  CRC_2:Word;

 end;
var
  CRC:Word;
  i_crc:Integer;
  FR_CRC: Tbl_type_array;         //. TBL-данные для расчепта CRС
// Y_array:array[0..N64] of single;
 X_array:array[1..N64] of single;
 X_Current, Y_Current: array of single;
 IL,N,i,j: Integer;
 id:integer;
 Y,Y1,X,X1,Y2,X2:double;
 StepX, StepX64,HMax:double;
 Qmax:double;
 P_isd:byte;
 TBLFile:File of tFileRec;
 TBLFile_with_CRC:File of Tbl_type_array;

 FR:TFileRec;
 s:string;
 FName:string;
 Zero_In_FR_Y:boolean;
begin
  if Nomer_Vyzova = 1 then
  begin
     if q_devices.fieldbyname('DeviceNumber').isnull then
      begin
       showmessage('Не задан номер прибора.');
       exit;
      end;
     if q_devices.fieldbyname('id_Converter').isnull then
      begin
       showmessage('Не задан тип акустического преобразователя.');
       exit;
      end;
     if ((q_devices.fieldbyname('CalcMode').asstring='FORMULA') and
       q_devices.fieldbyname('Create_Date').isnull) then
       begin
        showmessage('Расчет характеристики еще не был выполнен.');
        exit;
       end;
     if (
         (q_devices.fieldbyname('CalcMode').asstring<>'FORMULA') and
       Q_CHECK_USERMODE_NotAll_POINTS(q_devices.fieldbyname('ID').asinteger)
         ) then
      begin
       if MessageDlg('В задаваемой пользователем характеристике прибора заданы не все точки. Все равно создать tbl-файл?',
        mtConfirmation, [mbYes, mbNo],0) = mrNo then
       begin
          dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
          CheckFiles;
          q_devices.Edit;
          q_devices.fieldbyname('Need_TBL').asinteger:=1;
          q_devices.fieldbyname('TblFile').asstring:='';
          q_devices.post;
        exit;
       end
      end;

     if ((q_devices.fieldbyname('CalcMode').asstring='FORMULA')
         and dm.CheckNeedRecalc(q_devices.fieldbyname('ID').asinteger)
         //and dm.CheckNeedRecalc_New(q_devices)
         )
          then
          begin
        //   showmessage('Параметры или комплектация прибора были изменены, но перерасчет характеристики не был выполнен.');
           if  (MessageDlg('Параметры или комплектация прибора были изменены, но перерасчет характеристики не был выполнен. Выполнить перерасчет характеристики прямо сейчас?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                   begin
                    pcInputValues.ActivePageIndex:=2;
                    Update;
                    btnProcessingClick(nil);
                  end;
           exit;
        end;
     end;

 id:=q_devices.fieldbyname('ID').asinteger;

 Hmax:=GetParamValue('Hmax');
 GET_QH_SORTBYX;

 N:=q_QH_sortByX.recordcount;
 setlength(X_Current,N);
 setlength(Y_Current,N);
 q_QH_SortbyX.first; i:=0;
 while not q_QH_SortbyX.eof do
  begin
   Y_Current[i]:=q_QH_SortbyX.fieldbyname('Y_Value').asfloat;
   X_Current[i]:=q_QH_SortbyX.fieldbyname('X_Value').asfloat;
   q_QH_SortbyX.next;
   i:=i+1;
  end;
 //q_QH_SortbyX.Close;
 StepX64:=HMax/(N64-1);
 for i:=1 to N64-1 do
  begin
    X_array[i]:=StepX64*i;
    IL:=0;
    for j:=1 to N-2 do
     begin
      if ((X_Current[j]<=X_array[i]) and (X_array[i]<X_Current[j+1])) then
        begin
          IL:=j;
          break;
        end;
     end;
     if X_Current[IL+1]-X_Current[IL]<>0 then
      FR.YArray[i]:=Y_Current[IL]+(Y_Current[IL+1]-Y_Current[IL])/(X_Current[IL+1]-X_Current[IL])*(X_Array[i]-X_Current[IL])
       else
        FR.YArray[i]:=Y_Current[IL];
  end;

 FR.YArray[N64-1]:=Y_Current[N-1];
 Qmax:=FR.YArray[1];
 for i:=2 to N64-1 do
   if Qmax<FR.Yarray[i] then Qmax:=FR.Yarray[i];

  if RG_DeviceType.ItemIndex=0 then   // только для ЭХО-Р
 if Qmax>36000 then FR.P_isd:=5;
 if Qmax<=36000 then FR.P_isd:=4;
 if Qmax<= 3600 then FR.P_isd:=3;
 if Qmax<=  360 then FR.P_isd:=2;
 if Qmax<=  36 then FR.P_isd:=1;
 if Qmax<=  3.6 then FR.P_isd:=0;

                      // new 2015 03 17
 if RG_DeviceType.ItemIndex=1 then   // только для ЭХО-АС
   begin
    GET_GetQHMax;      // как определить наличие характеристики?
    if (getqhMax.FieldByName('qMax').asfloat>0) then  FR.P_isd := $00;  // если задана таблица U(H/Hmax)
    if (getqhMax.FieldByName('qMax').asfloat=0) then  FR.P_isd := $FF  ;// если не задана таблица U(H/Hmax)     
   end ;

 FR.CRC_1:=0;    // new 2015 03 17

 X_current:=nil;  Y_current:=nil;
 if RG_DeviceType.ItemIndex=0 then   // только для ЭХО-Р
   for i:=1 to N64-1 do
      FR.Yarray[i] :=FR.Yarray[i]/3600;

   Zero_In_FR_Y:=true;
   for i:=1 to N64-1 do
       Zero_In_FR_Y:=  Zero_In_FR_Y    and (FR.Yarray[i]=0.0);

   if   Zero_In_FR_Y then
    begin
     Showmessage('Формируемый tbl-файл содержит характеристику, заполненную нулями.  Пожалуйста, провертьте корректность задания характеристики.');
     Exit;
    end;



   FR.Composition_DEVICETYPE:=q_devices.fieldbyname('Composition_DEVICETYPE').asinteger+1;
   FR.Converter_Table_Code:=dm.Get_Table_Code(q_devices.fieldbyname('id_Converter').asinteger);
   FR.Composition_RS:=q_devices.fieldbyname('Composition_RS').asinteger;
  (* if (q_devices.fieldbyname('Composition_RS').asinteger = 0) then
       FR.Composition_RS:=0;
   *)
   FR.Composition_Current:=q_devices.fieldbyname('Composition_Current').asinteger;
   FR.Composition_IR_PORT:=q_devices.fieldbyname('Composition_IR_PORT').asinteger;
   FR.Composition_IMP_OUT:=q_devices.fieldbyname('Composition_IMP_OUT').asinteger;
   FR.Composition_Level:=q_devices.fieldbyname('Composition_Level').asinteger;
   FR.HMax:=HMAX;
   s:=Q_devices.fieldbyname('DeviceNumber').asstring;
   FR.Serial_NUMBER1:=#32;   FR.Serial_NUMBER2:=#32;   FR.Serial_NUMBER3:=#32;   FR.Serial_NUMBER3:=#32;
   if length(s)>=1 then FR.Serial_NUMBER1:=s[1];
   if length(s)>=2 then FR.Serial_NUMBER2:=s[2];
   if length(s)>=3 then FR.Serial_NUMBER3:=s[3];
   if length(s)>=4 then FR.Serial_NUMBER4:=s[4];

   FR.L_0:=q_devices.fieldbyname('L_0').AsFloat;

   (*
   ID	NAME	TABLE_CODE
   3	АП- 9	4
   4	АП-11	2
   5	АП-13	3
   1	АП-41	5
   6	АП-61	1
  2	АП-61В	0

  АП 9    0,12
  АП11    0,12
  АП13    -0.007
  АП41    0,0
  АП61,   -0.01
  АП61В   -0.001
     *)

  if cbConverter.text ='АП- 9' then  FR.L_0:= 0.12 +q_devices.fieldbyname('L_0').AsFloat;
  if cbConverter.text ='АП-11' then  FR.L_0:= 0.12 +q_devices.fieldbyname('L_0').AsFloat;
  if cbConverter.text ='АП-13' then  FR.L_0:= -0.007+q_devices.fieldbyname('L_0').AsFloat;
  if cbConverter.text ='АП-41' then  FR.L_0:= 0.0  +q_devices.fieldbyname('L_0').AsFloat;
  if cbConverter.text ='АП-61' then  FR.L_0:= -0.01 +q_devices.fieldbyname('L_0').AsFloat;
  if cbConverter.text ='АП-61В' then FR.L_0:= -0.01 +q_devices.fieldbyname('L_0').AsFloat;

  if (Abs(q_devices.fieldbyname('L_0').AsFloat)<0.001) then FR.L_0:=0;

   for i:=1 to 12 do FR.Reserved_Zone[i]:=i;
   FR.CRC_2:=0;

  if q_devices.fieldbyname('name').asstring='Расходомер' then
    FName:=extractfiledir(Application.exename)+'\TBL\Рас'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl'
    else
     if q_devices.fieldbyname('name').asstring='Уровнемер' then
      FName:=extractfiledir(Application.exename)+'\TBL\Ур'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl'
       else
          FName:= extractfiledir(Application.exename)+'\TBL\'+q_devices.fieldbyname('name').asstring+'_'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl';
  AssignFile(TBLFile, Fname); { File selected in dialog }
  Rewrite(TBLFile);
  write(TBLFile, FR);
  CloseFile(TBLFile);
  //showmessage('Табличный файл '+FName +' успешно  сохранен.');

  AssignFile(TBLFile_with_CRC, Fname); // Читаю файл для расчета CRC
  Reset(TBLFile_with_CRC);
  Read(TBLFile_with_CRC,FR_CRC);
  CloseFile(TBLFile_With_CRC);

    crc := $ffff;
   for i_crc:=1 to Length(FR_CRC.Part_1) do
     ComputeCRC(FR_CRC.part_1[i_CRC],crc);
   FR_CRC.CRC_1:=CRC;

    crc := $ffff;
   for i_crc:=1 to Length(FR_CRC.Part_2) do
     ComputeCRC(FR_CRC.part_2[i_CRC],crc);
   FR_CRC.CRC_2:=CRC;


  AssignFile(TBLFile_with_CRC, Fname); { File selected in dialog }
  Rewrite(TBLFile_with_CRC);
  write(TBLFile_with_CRC, FR_CRC);
  CloseFile(TBLFile_With_CRC);

  q_devices.edit;
//  q_devices.fieldbyname('Locked').asinteger:= 1;
  q_devices.fieldbyname('Need_Recalc').asinteger:=0;
  q_devices.fieldbyname('Need_TBL').asinteger:=0;
  q_devices.fieldbyname('TblFile').asstring:=extractfilename(fname);

  q_devices.post;


  dm.NEEDRecalc(0,q_devices.FieldByName('ID').ASINTEGER);
  dm.NEEDTBL(0,q_devices.FieldByName('ID').ASINTEGER);


  CheckLocked;
 // q_devices.edit;
  //q_devices.post;
 end;

procedure TDevice_Form.miLockClick(Sender: TObject);
begin
 q_devices.edit;
 q_devices.fieldbyname('Locked').asinteger:= 1;
 q_devices.post;
 CheckLocked;
end;

Function TDevice_Form.Q_CHECK_USERMODE_NotAll_POINTS(ID_Device:integer):boolean;
begin
 dm.q.close;
 dm.q.SQL.Clear;
 dm.q.SQL.Add(' select count(*) as N_Points from qh where device_id = :device_id and X_Value>0 ' );
 dm.q.ParamByName('Device_id').asinteger:=ID_Device;
 dm.q.ExecQuery;
 Result:=false;
 if  (q_qh.RecordCount-1)>dm.q.fieldbyname('N_Points').asinteger then Result:=true;
 dm.q.close;

end;

procedure TDevice_Form.miUnlockClick(Sender: TObject);
var FName, FullName: string;
begin
  if q_devices.fieldbyname('name').asstring='Расходомер' then
    FUllName:=extractfiledir(Application.exename)+'\TBL\Рас'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl'
    else
     if q_devices.fieldbyname('name').asstring='Уровнемер' then
      FullName:=extractfiledir(Application.exename)+'\TBL\Ур'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl'
       else
          FullName:= extractfiledir(Application.exename)+'\TBL\'+q_devices.fieldbyname('name').asstring+'_'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl';
 deletefile(Fullname);
 q_devices.edit;
 q_devices.fieldbyname('Locked').asinteger:= 0;
 q_devices.FieldByName('TblFile').asstring:='';
 q_devices.post;
 CheckLocked;
end;

procedure TDevice_Form.CheckLocked;  //Заблокирована ли запись?
begin
 tsDeviceAttribute.Enabled:=q_devices.fieldbyname('locked').asinteger<>1;
 tsParamGrid.Enabled:=q_devices.fieldbyname('locked').asinteger<>1;
 btnProcessing1.Enabled:=q_devices.fieldbyname('locked').asinteger<>1;
 btnProcessing.Enabled:=q_devices.fieldbyname('locked').asinteger<>1;
 tsQH.Enabled:=q_devices.fieldbyname('locked').asinteger<>1;
end;


procedure TDevice_Form.DbGridFrame1GridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
 if q_devices.FieldByName('Locked').asinteger=1 then Afont.Style:=[fsBold];
 if (q_devices.fieldbyname('DeviceNumber').isnull and (not q_devices.fieldbyname('Device_Parent_Id').isnull))
  then
   BackGround:=clMoneyGreen;
 if ((q_devices.fieldbyname('Params_are_Bad').asinteger=1) and (ansiUppercase(Column.FieldName) = 'DEVICENUMBER'))
  then  begin
         backGround:=clYellow;
//         Afont.Style:=[fsBold];
         Afont.Color:=clRed;
        end;
 if ((q_devices.fieldbyname('Need_Recalc').asinteger=1) and (ansiUppercase(Column.FieldName) = 'DEVICETYPENAME'))
  then  begin
         backGround:=clYellow;
         Afont.Style:=[fsitalic];
         Afont.Color:=clRed;
        end;


end;

procedure TDevice_Form.FormDestroy(Sender: TObject);
begin
  Calc.Free;
end;

procedure TDevice_Form.Button1Click(Sender: TObject);
begin
  GetQHCalcColumns;
end;

procedure TDevice_Form.GetGOSTTable;
const
 N6 = 6;
var
 Y_array:array[0..N6-1] of single;
 X_array:array[0..N6-1] of single;
 X_Current, Y_Current: array of single;
 IL,N,i,j: Integer;
 Y,Y1,X,X1,Y2,X2:double;
 StepX, StepX6,HMax:double;
 TBLFile:File of tFileRec;
 FR:TFileRec;

begin
 if q_devices.fieldbyname('typedevice_id').IsNull then exit;
 Hmax:=GetParamValue('Hmax');
 GET_QH_SORTbyX;
 //q_QH_SortByX.close;
 //q_QH_sortByX.Open;
 //q_QH_sortByX.Fetchall;
 N:=q_QH_sortByX.recordcount;
 if n=0 then exit;
 setlength(X_Current,N);
 setlength(Y_Current,N);
 q_qh_sortByX.first; i:=0;
 while not q_QH_sortByX.eof do
  begin
   Y_Current[i]:=q_QH_sortByX.fieldbyname('Y_Value').asfloat;
   X_Current[i]:=q_QH_sortByX.fieldbyname('X_Value').asfloat;
   q_qh_sortByX.next;
   i:=i+1;
  end;
 //q_QH_SortbyX.Close;
 StepX6:=HMax/(N6-1);
 for i:=0 to N6-1 do
  begin
    X_array[i]:=StepX6*i;
    IL:=0;
    for j:=1 to N-2 do
     begin
      if ((X_Current[j]<=X_array[i]) and (X_array[i]<X_Current[j+1])) then
        begin
          IL:=j;
          break;
        end;
     end;
     if X_Current[IL+1]-X_Current[IL]<>0 then
      Y_Array[i]:=Y_Current[IL]+(Y_Current[IL+1]-Y_Current[IL])/(X_Current[IL+1]-X_Current[IL])*(X_Array[i]-X_Current[IL])
       else
        Y_Array[i]:=Y_Current[IL];
  end;

 Y_Array[N6-1]:=Y_Current[N-1];
 Qmax:=Y_Array[0];   H_on_Qmax:=0; Q_ON_HMax:=0;
 for i:=1 to N6-1 do
   if Qmax<Y_array[i] then
    begin
    Qmax:=Y_array[i];  H_on_Qmax:=X_Array[i];
    end;
 Q_On_HMax:=Y_array[N6-1];

 if Qmax>36000 then Par_isd:=100;
 if Qmax<=36000 then Par_isd:=10;
 if Qmax<= 3600 then Par_isd:=1;
 if Qmax<=  360 then Par_isd:=0.1;
 if Qmax<=  36 then Par_isd:=0.01;
 if Qmax<=  3.6 then Par_isd:=0.001;

 X_current:=nil;  Y_current:=nil;

 GOSTTable.close;
 GOSTTable.clear;
 GostTable.open;
 GostTable.disablecontrols;
 for i:=0 to N6-1 do
  begin
   GostTable.append;
   GostTable.fieldbyname('X_Value').asfloat:=X_Array[i];
   GostTable.fieldbyname('Y_Value').asfloat:=Y_Array[i];
   if Y_array[i]<>0 then
    GOSTTABLE.fieldbyname('T_Counter').asfloat:=3600.0/Y_ARRAY[i]
     else GostTable.fieldbyname('T_Counter').asfloat:=0;
   GoSTTable.post;
  end;
  GostTable.Enablecontrols;
end;

procedure TDevice_Form.GetVisiblePointsTable_New(NVisiblePoints:integer);
//const
 //N6 = 6;
var
  N6:integer;
 Y_array:array of single;
 X_array:array of single;
 X_Current, Y_Current: array of single;
 N_Next,IL,N,i,j: Integer;
 Y,Y1,X,X1,Y2,X2:double;
 StepX, StepX6,HMax:double;
 TBLFile:File of tFileRec;
 FR:TFileRec;
 X_Prev,X_Next, Y_next, Y_Prev:double;
 YMax,Xmax:double;

begin
 n6:=nVisiblePoints;
 if q_devices.fieldbyname('typedevice_id').IsNull then exit;
 Hmax:=GetParamValue('Hmax');
 GET_QH_SORTbyX;
 //q_QH_SortByX.close;
 //q_QH_sortByX.Open;
 //q_QH_sortByX.Fetchall;
 N:=N6 ;
  setlength(X_Array,N);
 setlength(Y_Array,N);
 setlength(X_Current,N);
 setlength(Y_Current,N);
 q_qh_sortByX.first; i:=0;
 VisibLePointsTable.disablecontrols;
 VisibLePointsTable.first;
 while not VisibLePointsTable.eof do
  begin
   Y_Current[i]:=VisiblePointsTable.fieldbyname('Y_Value').asfloat;
   X_Current[i]:=VisiblePointsTable.fieldbyname('X_Value').asfloat;
   VisiblePointsTable.next;
   i:=i+1;
  end;
 StepX6:=HMax/(N6-1);
 X_Prev:=X_Current[0];Y_Prev:=Y_Current[0];
 for i:=1 to N6-1 do
  begin
    if ((x_Current[i]=0)) then
     begin
       N_Next:=0;
       for j:=i to N6-1 do
            if ((X_Current[j]<>0) ) then
             begin
              N_Next:=j; X_Next:=X_current[j];
              break;
             end;
       if n_Next<>0 then
        begin
         X_array[i]:=(X_Next-X_Prev)/(N_Next-i+1)+X_Prev;
         X_Prev:=X_Array[i];
        end;
     end
      else
       begin
        X_Array[i]:=X_Current[i];
        X_Prev:=X_Array[i];
       end;

  end;

   for i:=1 to N6-1 do
  begin
    if ((Y_Current[i]=0)) then
     begin
       N_Next:=0;
       for j:=i to N6-1 do
            if ((Y_Current[j]<>0)) then
             begin
              N_Next:=j; Y_Next:=Y_current[j];X_Next:=X_current[j];
              break;
             end;
       if n_Next<>0 then
        begin
         Y_array[i]:=(Y_Next-Y_Prev)/(N_Next-i+1)+Y_Prev;

         Y_Prev:=Y_Array[i];
        end;
     end
      else
       begin
        Y_Array[i]:=Y_Current[i];
        Y_Prev:=Y_Array[i];
       end;

  end;

 YMax:=Y_array[N6-1];
 XMax:=X_array[N6-1];
 X_current:=nil;  Y_current:=nil;

 VisiblePointsTable.first;

 for i:=0 to N6-1 do
  begin
   visiblepointstable.locate('I',i+1,[]);
   VisiblePointsTable.Edit;
   VisiblePointsTable.fieldbyname('X_Value').asfloat:=X_Array[i];
   VisiblePointsTable.fieldbyname('Y_Value').asfloat:=Y_Array[i];
   if Y_array[i]<>0 then
    VisiblePointsTable.fieldbyname('T_Counter').asfloat:=3600.0/Y_ARRAY[i]
      else VisiblePointsTable.fieldbyname('T_Counter').asfloat:=0;
     if Ymax<>0 then
        VisiblePointsTABLE.fieldbyname('Y_procent').asfloat:=100*VisiblePointsTABLE.Fieldbyname('Y_Value').asfloat/YMax
         else VisiblePointsTABLE.fieldbyname('Y_procent').asfloat:=0;
       if Xmax<>0 then
        VisiblePointsTABLE.fieldbyname('X_procent').asfloat:=100*VisiblePointsTABLE.Fieldbyname('X_Value').asfloat/Xmax
         else VisiblePointsTABLE.fieldbyname('X_procent').asfloat:=0;


   VisiblePointsTable.post;
  end;
  VisibLePointsTable.Enablecontrols;
X_Array:=nil; Y_array:=nil;
end;


procedure TDevice_Form.GetVisiblePointsTable;
var
 Nvisible :integer;
 Y_array:array of single;
 X_array: array of single;
 X_Current, Y_Current: array of single;
 N1,IL,N,i,j: Integer;
 Y,Y1,X,X1,Y2,X2:double;
 StepX, StepXVisible,HMax:double;
begin
  if q_deviceParams.active then
  begin
  if q_devices.fieldbyname('Typedevice_id').isnull then exit;
   q_DeviceParams.locate('ShortName','Np',[]);
   NVisible:=q_deviceParams.fieldbyname('Param_Value').asinteger;
  if ( q_devices.fieldbyname('CalcMode').asstring='USERTABLE') then
   begin
     VisibLePointsTable.DisableControls;
     VisiblePointsTable.close;
     VisiblePointsTable.clear;
     VisiblePointsTable.open;
     q_qh.First;
     n1:=0;
     while not q_qh.Eof do
     begin
       VisiblePointsTable.append;
       VisiblePointsTable.fieldbyname('I').value:=q_QH.fieldbyname('I').value;
       VisiblePointsTable.fieldbyname('X_Value').asfloat:=q_QH.fieldbyname('X_Value').asfloat;
       VisiblePointsTable.fieldbyname('Y_Value').asfloat:=q_QH.fieldbyname('Y_Value').asfloat;
       VisiblePointsTABLE.fieldbyname('T_Counter').asfloat:=q_QH.fieldbyname('T_Counter').asfloat;
       if GetQHMax.fieldbyname('Qmax').asfloat<>0 then
        VisiblePointsTABLE.fieldbyname('Y_procent').asfloat:=VisiblePointsTABLE.Fieldbyname('Y_Value').asfloat/GetQHMax.fieldbyname('Qmax').asfloat*100
         else VisiblePointsTABLE.fieldbyname('Y_procent').asfloat:=0;
       if GetQHMax.fieldbyname('Hmax').asfloat<>0 then
        VisiblePointsTABLE.fieldbyname('X_procent').asfloat:=VisiblePointsTABLE.Fieldbyname('X_Value').asfloat/GetQHMax.fieldbyname('Hmax').asfloat*100
         else VisiblePointsTABLE.fieldbyname('X_procent').asfloat:=0;
           VisiblePointsTable.post;
       q_qh.Next;
       n1:=n1+1;
     end;


      if N1>=1 then GetVisiblePointsTable_New(n1);
   end
   else
 begin
 Hmax:=GetParamValue('Hmax');
 GET_QH_SORTbyX;
 //q_QH_SortByX.close;
 //q_QH_sortByX.Open;
 //q_QH_sortByX.Fetchall;

 if NVisible<1 then exit;
 setlength(X_Array,NVisible); setlength(Y_Array,NVisible);

 N:=q_QH_sortByX.recordcount;
 if n=0 then exit;
 setlength(X_Current,N); setlength(Y_Current,N);

 q_qh_sortByX.first; i:=0;
 while not q_QH_sortByX.eof do
  begin
   Y_Current[i]:=q_QH_sortByX.fieldbyname('Y_Value').asfloat;
   X_Current[i]:=q_QH_sortByX.fieldbyname('X_Value').asfloat;
   q_qh_sortByX.next;
   i:=i+1;
  end;
 //q_QH_SortbyX.Close;
 StepXVisible:=HMax/(NVisible-1);
 for i:=0 to NVisible-1 do
  begin
    X_array[i]:=StepXVisible*i;
    IL:=0;
    for j:=1 to N-2 do
     begin
      if ((X_Current[j]<=X_array[i]) and (X_array[i]<X_Current[j+1])) then
        begin
          IL:=j;
          break;
        end;
     end;
     if X_Current[IL+1]-X_Current[IL]<>0 then
      Y_Array[i]:=Y_Current[IL]+(Y_Current[IL+1]-Y_Current[IL])/(X_Current[IL+1]-X_Current[IL])*(X_Array[i]-X_Current[IL])
       else
        Y_Array[i]:=Y_Current[IL];
  end;

 Y_Array[NVisible-1]:=Y_Current[N-1];
 Qmax:=Y_Array[0];   H_On_QMax:=0;
 for i:=1 to NVisible-1 do
   if Qmax<Y_array[i] then
    begin
     Qmax:=Y_array[i];  H_On_QMax:=X_Array[i];
    end;
 Q_On_HMax:=Y_array[NVisible-1];
 
 if Qmax>36000 then Par_isd:=100;
 if Qmax<=36000 then Par_isd:=10;
 if Qmax<= 3600 then Par_isd:=1;
 if Qmax<=  360 then Par_isd:=0.1;
 if Qmax<=  36 then Par_isd:=0.01;
 if Qmax<=  3.6 then Par_isd:=0.001;

 X_current:=nil;  Y_current:=nil;


 VisiblePointsTable.close;
 VisiblePointsTable.clear;
 VisiblePointsTable.open;
 for i:=0 to NVisible-1 do
  begin
   VisiblePointsTable.append;
   VisiblePointsTable.fieldbyname('I').value:=i+1;
   VisiblePointsTable.fieldbyname('X_Value').asfloat:=X_Array[i];
   VisiblePointsTable.fieldbyname('Y_Value').asfloat:=Y_Array[i];
   if Y_array[i]<>0 then
    VisiblePointsTABLE.fieldbyname('T_Counter').asfloat:=3600/Y_ARRAY[i]
     else VisiblePointsTable.fieldbyname('T_Counter').asfloat:=0;
   if GetQHMax.fieldbyname('Qmax').asfloat<>0 then
    VisiblePointsTABLE.fieldbyname('Y_procent').asfloat:=VisiblePointsTABLE.Fieldbyname('Y_Value').asfloat/GetQHMax.fieldbyname('Qmax').asfloat*100
     else VisiblePointsTABLE.fieldbyname('Y_procent').asfloat:=0;
   if GetQHMax.fieldbyname('Hmax').asfloat<>0 then
    VisiblePointsTABLE.fieldbyname('X_procent').asfloat:=VisiblePointsTABLE.Fieldbyname('X_Value').asfloat/GetQHMax.fieldbyname('Hmax').asfloat*100
     else VisiblePointsTABLE.fieldbyname('X_procent').asfloat:=0;
   VisiblePointsTable.post;
  end;
  X_Array:=nil;  Y_Array:=nil;
 end
end ;
VisibLePointsTable.EnableControls;
end;


procedure TDevice_Form.btnxlsReportClick(Sender: TObject);
var xlReport: TxlReport;
  xlreportparam: Txlreportparam;
  FName:string;

  MyDecimal: PChar;
  s:string;
  number : Array[0..3] of Byte;	//сеоийный номер, представленный в ASCII
  i : Byte;
  m : Word;
  p : Word;		// пароль как функция серийного номера

  ID: Integer;
begin
 inherited;
  if  q_devices.fieldbyname('CALCMODE').asstring='USERTABLE' then
   begin
    ID:=q_devices.fieldbyname('ID').AsInteger;
    q_devices.Prior;q_devices.Next;
    q_devices.Locate('ID',ID,[]);
    end;
  if q_devices.fieldbyname('DeviceNumber').isnull then
  begin
   showmessage('Не задан номер прибора.');
   exit;
  end;
  if q_devices.fieldbyname('id_Converter').isnull then
  begin
   showmessage('Не задан тип акустического преобразователя.');
   exit;
  end;

   if ((q_devices.fieldbyname('CalcMode').asstring='FORMULA')
     and dm.CheckNeedRecalc(q_devices.fieldbyname('ID').asinteger)
     //and dm.CheckNeedRecalc_New(q_devices)
     )
      then
      begin
     //  showmessage('Параметры или комплектация прибора были изменены, но перерасчет характеристики не был выполнен.');
       q_devices.edit;
       q_devices.FieldByName('TblFile').asstring:='';
       q_devices.fieldbyname('Need_recalc').asinteger:=1;
       q_devices.fieldbyname('Need_tbl').asinteger:=1;
       q_devices.post;

      if  (MessageDlg('Параметры или комплектация прибора были изменены, но перерасчет характеристики не был выполнен. Выполнить перерасчет характеристики прямо сейчас?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
         begin
           pcInputValues.ActivePageIndex:=2;
           Update;
           btnProcessingClick(nil);
         end;
       exit;
    end;

  if rgrg_Filter.itemindex=0 then
  begin
  if  dm.CheckNeedTbl(q_devices.fieldbyname('id').asinteger)  then
  //if  dm.CheckNeedTbl_New(q_devices)  then
   begin
   showmessage('Cначала следует сохранить tbl-файл.');
   exit;
   end;
  end;

  if rgRG_Filter.itemindex=1 then
  begin
  if dm.CheckNeedTbl(q_devices.fieldbyname('id').asinteger) then
  //if dm.CheckNeedTbl_New(q_devices) then
   begin
    if  application.MessageBox( pansiChar('Табличный файл не создан. Продолжить? '),
                  pchar(msg_warning), MB_YESNO or MB_ICONQUESTION) = idNo then  exit;
   end;
  end;

 if TSpeedbutton(sender).tag=1 then
  begin
   showdeviceinfo_form.RG_RS.ItemIndex:=RG_RS.ItemIndex;
   showdeviceinfo_form.RG_Current.ItemIndex:=RG_Current.ItemIndex;
   showdeviceinfo_form.RG_IR_Port.ItemIndex:=RG_IR_Port.ItemIndex;
   showdeviceinfo_form.RG_Level.ItemIndex:=RG_Level.ItemIndex;
   showdeviceinfo_form.RG_IMP_OUT.ItemIndex:=RG_IMP_OUT.ItemIndex;
   showdeviceinfo_form.Caption:='Комплектация прибора '+RG_Devicetype.Items[rg_devicetype.itemindex]+' №'+edDeviceNumber.Text;
   if showdeviceinfo_form.showmodal <> mrOK then exit;
  end; 


 GetGostTable;  GetVisiblePointsTable;

  MyDecimal:=StrAlloc(10);
  GetLocaleInfo( LOCALE_SYSTEM_DEFAULT, LOCALE_SDECIMAL,  MyDecimal, 10);
  if MyDecimal = '.' then  decimalseparator:='.';
  if MyDecimal = ',' then  decimalseparator:=',' ;

// if  q_devices.fieldbyname('CALCMODE').asstring='USERTABLE' then
 if  rgRG_filter.itemindex=1  then
  begin
   if ((q_qh.recordcount>=2)   and    (GetQHMax.fieldbyname('Qmax').asfloat<>0))
     then
   xlReport := TxlReport.CreateEx(Self, ExtractFilePath(Application.ExeName) +
                     '\excel\template_u.xls')
    else
      xlReport := TxlReport.CreateEx(Self, ExtractFilePath(Application.ExeName) +
                     '\excel\template_un.xls');
  end
  else
 xlReport := TxlReport.CreateEx(Self, ExtractFilePath(Application.ExeName) +
                     '\excel\template.xls');

 try
    q_deviceParams_xls.close;
    q_deviceParams_xls.parambyname('ID').asinteger:=q_devices.fieldbyname('ID').asinteger;
    q_deviceParams_xls.open;

     if  q_devices.fieldbyname('CALCMODE').asstring='USERTABLE' then
     begin
       begin
        if ((q_qh.recordcount>=2)   and    (GetQHMax.fieldbyname('Qmax').asfloat<>0))
          then
           begin
            xlReport.AddDataSet(GostTable, 'GostRange');
            xlReport.AddDataSet(VisiblePointsTable, 'QHRange');
           end;
       end
     end
         else
          begin
           xlReport.AddDataSet(GostTable, 'GostRange');
           xlReport.AddDataSet(VisiblePointsTable, 'QHRange');
          end;

    xlReport.AddDataSet(q_DeviceParams_XLS, 'ParamsRange');
    xlReport.AddDataSet(q_devices);

    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'dateReport';
    xlreportparam.value := formatdatetime('d mmm yyyy hh:mm', now);
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'HMax';
    xlreportparam.value := GetParamValue('Hmax');

    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Additive_Shift';
    xlreportparam.value := q_devices.fieldbyname('Additive_shift').value;

   // if  q_devices.fieldbyname('CALCMODE').asstring<>'USERTABLE' then
    if  rgRG_filter.itemindex=0  then
     begin
      xlreportparam := xlReport.Params.Add;
      xlreportparam.name := 'QMax';
      xlreportparam.value := QMax;
     // if  ((QMax<>Q_On_HMax) or  (GetParamValue('Hmax')<>H_On_QMax)) then
       begin
         xlreportparam := xlReport.Params.Add;
         xlreportparam.name := 'H_On_QMax';
         xlreportparam.value := H_On_QMax;
         xlreportparam := xlReport.Params.Add;
         xlreportparam.name := 'Q_On_HMax';
         xlreportparam.value := Q_On_HMax;
       end;
      xlreportparam := xlReport.Params.Add;
      xlreportparam.name := 'P_ISD';
      xlreportparam.value := Par_ISD;
     end;
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Params_are_bad';
    xlreportparam.value := q_devices.fieldbyname('Params_are_bad').text;

    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Composition1';
    xlreportparam.value :=' Блок тока: ' + RG_Current.Items[RG_Current.Itemindex];
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Composition2';
    xlreportparam.value :=' Блок RS: ' + RG_RS.Items[RG_RS.Itemindex];
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Composition3';
    xlreportparam.value := ' Блок уставок: ' + RG_Level.Items[RG_Level.Itemindex];
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Composition4';
    xlreportparam.value := ' ИК-порт: ' + RG_IR_PORT.Items[RG_IR_PORT.Itemindex];
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Composition5';
    xlreportparam.value := ' Импульсный выход: ' + RG_IMP_OUT.Items[RG_IMP_OUT.Itemindex];
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'DEVICETYPE';
    xlreportparam.value := RG_DEVICETYPE.Items[RG_DeviceType.itemindex];

    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Customer';
    xlreportparam.value := q_devices.fieldbyname('Customer').text;

    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'CreateDate';
    xlreportparam.value :=formatdatetime('dd.mm.yyyy',q_devices.fieldbyname('Create_Date').asdatetime);
    if ((q_devices.fieldbyname('Create_Date').isnull) or (q_devices.fieldbyname('Create_Date').asdatetime<encodedate(1995,1,1))) then
      xlreportparam.value := '';

    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'RecordDate';
    xlreportparam.value :=formatdatetime('dd.mm.yyyy',q_devices.fieldbyname('Record_Date').asdatetime);

    if ((not q_devices.fieldbyname('Sale_Date').isnull )  and
        (q_devices.fieldbyname('Sale_Date').asdatetime > q_devices.fieldbyname('Record_Date').asdatetime)) then
     begin
       xlreportparam.value :=formatdatetime('dd.mm.yyyy',q_devices.fieldbyname('Sale_Date').asdatetime);
     end;

    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'SaleDate';
    xlreportparam.value :=formatdatetime('dd.mm.yyyy',q_devices.fieldbyname('Sale_Date').asdatetime);
    if ((q_devices.fieldbyname('Sale_Date').isnull) or (q_devices.fieldbyname('Sale_Date').asdatetime<encodedate(1995,1,1))) then
      xlreportparam.value := '';
   s:=q_devices.fieldbyname('Devicenumber').asstring;
    number[0]:=byte(s[1]);   number[1]:=byte(s[2]);  number[2]:=byte(s[3]);     number[3]:=byte(s[4]);
   p := 0;
   m := 1;
   for i:=0 to 3 do
   begin
     p := p + (number[3-i]-$30)*( number[3-i]-$30)*m;
     m := m*10;
   end;
  p := p mod 10000;


  xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'p';
//    xlreportparam.value :=inttostr(p);
    if  p >= 1000 then  xlreportparam.value :=inttostr(p)
     else  if  p >= 100 then  xlreportparam.value :='0'+inttostr(p)
      else   if  p >= 10 then  xlreportparam.value :='00'+inttostr(p)
         else   if  p >= 1 then  xlreportparam.value :='0'+inttostr(p)
          else     if p = 0 then xlreportparam.value :='0000';

  

    FName:=extractfiledir(Application.exename)+'\XLS\'+q_devices.fieldbyname('name').asstring+'_'+
              q_devices.fieldbyname('deviceNumber').asstring+
              dm.excel_ext;
             //'.xls';
     deletefile( extractfiledir(Application.exename)+'\XLS\'+q_devices.fieldbyname('name').asstring+'_'+
              q_devices.fieldbyname('deviceNumber').asstring+'.xlsx');
     deletefile( extractfiledir(Application.exename)+'\XLS\'+q_devices.fieldbyname('name').asstring+'_'+
              q_devices.fieldbyname('deviceNumber').asstring+'.xls');

//   xlReport.options:=xlReport.Options+[xroAutoSave]+[xroHideExcel]+[xroNewInstance];
//   xlReport.Report(emptyparam,null,FName);

//    xlReport.Reportto('',FName);

   pnl2.Visible:=True;
   pnl2.Caption:='Подготовка протокола';
   Update;

   xlReport.Preview:=false;
   xlReport.Options:=[xroNewInstance,xroHideExcel];
   xlreport.MacroAfter:='QH_MACRO';
{ if  q_devices.fieldbyname('CALCMODE').asstring='USERTABLE' then
     begin
      xlreport.MacroAfter:='';//'QH_MACRO';
     end ;
 } xlReport.Reportto('',FName);
    pnl2.Caption:='Загрузка протокола в Excel'; update;
    xlReport.Free;

     if TSpeedbutton(sender).tag=1 then
      ShellExecute(Application.Handle, 'print', pchar(Fname), nil, nil, SW_hide)
      else    ShellExecute(Application.Handle, 'open', pchar(Fname), nil, nil, SW_showdefault);
  except
        on E: Exception do
          showmessage('Ошибка при вызове построителя отчета. Возможные причины:'+
                       'MS Excel находится в режиме ожидания ввода, '+
                       'доступ к VB-проекту не является доверенным, '+
                       'отчет по прибору уже открыт. Ошибка:' + E.Message);
 end;

 q_deviceParams_xls.close;
 decimalseparator:= '.';
 pnl2.Visible:=false;
 Update;
end;

procedure TDevice_Form.q_deviceParam_RGAfterOpen(DataSet: TDataSet);
begin
//rg_Material.visible:=q_deviceParam_rg.recordcount>0;
RG_Material.itemindex:=q_deviceParam_RG.fieldbyname('Param_Value').asinteger;
end;

procedure TDevice_Form.ds_deviceParam_RGDataChange(Sender: TObject;
  Field: TField);
begin
 RG_Material.itemindex:=q_deviceParam_RG.fieldbyname('Param_Value').asinteger;
end;

procedure TDevice_Form.RG_materialClick(Sender: TObject);
begin
if not q_deviceparams.Active then exit;
if q_deviceparams.locate('id', q_deviceparam_RG.fieldbyname('id').asinteger,[]) then
 begin
 q_deviceparams.Edit;
 q_deviceparams.fieldbyname('Param_Value').value := rg_material.itemindex;
 q_deviceparams.Post;
 end;
// q_deviceParam_RG.close;
 //q_deviceparam_RG.open;
end;

procedure TDevice_Form.QHGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
 begin
// if q_QH.state in [dsEdit] then q_QH.post;
 end;

end;

procedure TDevice_Form.N9Click(Sender: TObject);
begin
main.defaultType :=rgRG_Filter.ItemIndex;
main.actCreateDeviceExecute(nil);
end;

procedure TDevice_Form.miCloneDeviceClick(Sender: TObject);
var Id:integer;
begin
 dm.CloneDevice.ParamByName('Old_Device_ID').asinteger:=q_devices.fieldbyname('ID').asinteger;
 dm.CloneDevice.ExecProc;
 dm.CLoneDevice.transaction.CommitRetaining;
 id:=dm.CloneDevice.ParamByName('Device_ID').asinteger;
 q_devices.AfterScroll:=nil;
 q_devices.BeforeScroll:=nil;
 q_devices.close;
 q_devices.open;
 q_devices.Locate('ID',id,[]);
 q_devices.AfterScroll:=device_form.q_devicesAfterScroll;
 q_devices.BeforeScroll:=device_form.q_devicesBeforeScroll;
 q_devicesAfterScroll(nil);
 pcInputValuesChange(nil);
 if (q_devices.fieldbyname('CalcMode').asstring='FORMULA')  then  btnProcessingclick(nil);
 pcInputValues.activepageIndex:=0; 
end;

procedure TDevice_Form.N11Click(Sender: TObject);
begin
 if not q_devices.fieldbyname('device_parent_id').isnull then
  begin
   q_devices.AfterScroll:=nil;
   q_devices.BeforeScroll:=nil;
   q_devices.Locate('ID',q_devices.fieldbyname('device_parent_id').asinteger,[]);
   q_devices.AfterScroll:=device_form.q_devicesAfterScroll;
   q_devices.BeforeScroll:=device_form.q_devicesBeforeScroll;
   q_devicesAfterScroll(nil);
 end;

end;

procedure TDevice_Form.N12Click(Sender: TObject);
begin
  begin
   q_devices.AfterScroll:=nil;
   q_devices.BeforeScroll:=nil;
   q_devices.Locate('device_parent_ID',q_devices.fieldbyname('id').asinteger,[]);
   q_devices.AfterScroll:=device_form.q_devicesAfterScroll;
   q_devices.BeforeScroll:=device_form.q_devicesBeforeScroll;
   q_devicesAfterScroll(nil);
  end;

end;

procedure TDevice_Form.RG_CurrentClick(Sender: TObject);
begin
 if RG_IMP_OUT.ItemIndex=1 then
 begin
  if RG_Level.itemindex=3 then RG_Level.itemindex:=2;
 end;
 q_devices.edit;
 q_devices.fieldbyname('Composition_Current').asinteger:=  RG_Current.ItemIndex;
 q_devices.fieldbyname('Composition_RS').asinteger:=  RG_RS.ItemIndex;
 q_devices.fieldbyname('Composition_Level').asinteger:=  RG_Level.ItemIndex;
 q_devices.fieldbyname('Composition_DEVICETYPE').asinteger:=  RG_DEVICETYPE.ItemIndex;
 q_devices.fieldbyname('Composition_IR_PORT').asinteger:=  RG_IR_PORT.ItemIndex;
 q_devices.fieldbyname('Composition_IMP_OUT').asinteger:=  RG_IMP_OUT.ItemIndex;
 q_devices.post;

      //if  (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE') then
        begin
        dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
        dm.needRecalc(1,q_devices.FieldByName('ID').ASINTEGER);
        CheckFiles;
        q_devices.Edit;
        q_devices.fieldbyname('Need_TBL').asinteger:=1;
        q_devices.fieldbyname('Need_RECALC').asinteger:=1;
        q_devices.fieldbyname('TblFile').asstring:='';
        q_devices.post;
       end;
end;

procedure TDevice_Form.N14Click(Sender: TObject);
begin
    devicespanel.Visible:=true;
end;

procedure TDevice_Form.N15Click(Sender: TObject);
begin
    device_form.devicespanel.Visible:=false;
end;

procedure TDevice_Form.q_devicesPARAMS_ARE_BADGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 Text:=''; 
 if q_devicesPARAMS_ARE_BAD.asinteger=1 then Text:='Параметры заданы некорректно!'
end;

procedure TDevice_Form.q_QHT_COUNTERGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 if sender.asfloat=0 then text:=''
  else text:=formatfloat('0.00',sender.asfloat);
end;

procedure TDevice_Form.GOSTTABLET_COUNTERGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 if sender.asfloat=0 then text:=''
  else text:=formatfloat('0.00',sender.asfloat);
end;

procedure TDevice_Form.q_QHX_VALUEGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  DecimalSeparator:='.';
if ((q_devices.fieldbyname('CALCMODE').asstring='USERTABLE')
 and (q_QH.FieldByName('I').asinteger<>1))
 then
  begin
   if sender.asfloat=0 then text:=''
    else text:=formatfloat('0.000',sender.asfloat);
  end
   else text:=formatfloat('0.000',sender.asfloat);
end;

procedure TDevice_Form.q_QHY_VALUEGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin

  DecimalSeparator:='.';
if ((q_devices.fieldbyname('CALCMODE').asstring='USERTABLE')
   and (q_QH.FieldByName('I').asinteger<>1))
 then
  begin
   if sender.asfloat=0 then text:=''
    else text:=formatfloat('0.000',sender.asfloat);
  end
   else text:=formatfloat('0.000',sender.asfloat);
end;

procedure TDevice_Form.pcInputValuesChange(Sender: TObject);
begin
 Chart.RefreshDataSet(q_QH,Series1);
 GetGostTable;
 Chart.RefreshDataSet(GostTable,Series2);
 GetVisiblePointsTable;
 Chart.RefreshDataSet(VisiblePointsTable,Series3);
 Chart.RefreshDataSet(q_QH_Parent,Series4);
 if pcInputValues.ActivePageIndex=1 then
  begin
  q_deviceParams.First;   q_deviceParams.next;  q_deviceParams.next;
  q_deviceparams.FieldByName('Param_Value').focuscontrol;
//  paramgrid.Columns[3]. .Columns[3].
  end;
  q_QH.First;
end;


procedure TDevice_Form.CalcQMax_for_User_table;
var
 Y2,Y1, X2,X1:double;
 bFind2,bFind1:boolean;
begin
 if not (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE') then exit;
 Q_QH.DisableControls;
 q_QH.Last;
 if  ({(not q_qh.FieldByName('Y_Value').isnull) or} (q_qh.FieldByName('Y_Value').asfloat<>0))  then
  begin
    Q_QH.EnableControls;
   exit;
  end;
 bFind2:=false;bFind1:=false;
 while not q_qh.BOF do
  begin
    if (q_QH.fieldbyname('X_Value').asfloat<>0) and (q_QH.fieldbyname('Y_Value').asFloat<>0)
     and (not bFind2) then
      begin
       bFind2:=true;
       Y2:=q_QH.fieldbyname('Y_Value').asfloat;
       X2:=q_QH.fieldbyname('X_Value').asfloat;
       q_QH.prior;
      end
      else
      begin
       if (q_QH.fieldbyname('X_Value').asFloat<>0) and (q_QH.fieldbyname('Y_Value').asFloat<>0)
           and (not bFind1) then
        begin
         bFind1:=true;
         Y1:=q_QH.fieldbyname('Y_Value').asfloat;
         X1:=q_QH.fieldbyname('X_Value').asfloat;
         q_QH.prior;
       end
        else q_QH.prior
        end
  end;
  if bFind2 and bFind1 and (X2<>X1) then
   begin
    q_qh.last;
    q_QH.edit;
    q_QH.fieldbyname('Y_Value').asfloat:=(Y2-Y1)/(X2-X1)*(q_QH.fieldbyname('X_Value').asfloat-X2)+Y2;
    q_QH.post;
   end;
  GetQHCalcColumns;
  Q_QH.EnableControls;

 end;

procedure TDevice_Form.N17Click(Sender: TObject);
begin
 pcInputValues.ActivePageIndex:=2;
 pcInputValuesChange(nil);
 pcQH.ActivePageIndex:=1;
 pcQHChange(nil);
end;

procedure TDevice_Form.N18Click(Sender: TObject);
begin
 pcInputValues.ActivePageIndex:=2;
 pcInputValuesChange(nil);
 pcQH.ActivePageIndex:=0;
 pcQHChange(nil);
end;

procedure TDevice_Form.N19Click(Sender: TObject);
begin
 pcInputValues.ActivePageIndex:=1;
 pcInputValuesChange(nil);

 // pcQH.ActivePageIndex:=0;
end;

procedure TDevice_Form.QHGridExit(Sender: TObject);
begin
 if q_qh.state in [dsEdit] then q_QH.post
end;

procedure TDevice_Form.FloatField7GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
if ((q_devices.fieldbyname('CALCMODE').asstring='USERTABLE')
 and (VisiblePointsTable.FieldByName('I').asinteger<>1))
 then
  begin
   if sender.asfloat=0 then text:=''
    else text:=formatfloat('0.000',sender.asfloat);
  end
   else text:=formatfloat('0.000',sender.asfloat);
end;

procedure TDevice_Form.FloatField8GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
if ((q_devices.fieldbyname('CALCMODE').asstring='USERTABLE')
 and (VisiblePointsTable.FieldByName('I').asinteger<>1))
 then
  begin
   if sender.asfloat=0 then text:=''
    else text:=formatfloat('0.000',sender.asfloat);
  end
   else text:=formatfloat('0.000',sender.asfloat);

end;

procedure TDevice_Form.ds_devicesDataChange(Sender: TObject;
  Field: TField);
   var
  CurrentNomer:Integer;
  FTP_Code:LongInt;
begin
 miReplaceParent.enabled:=not q_devices.FieldByName('device_parent_id').isnull;
 pmReplaceParent.enabled:=miReplaceParent.enabled;
 miDeleteDevice.Enabled:= q_devices.FieldByName('Locked').asinteger<>1;

 if q_devices.State in [dsBrowse] then
  Calc_all;
 //2017.09.21
//  if q_devices.State in [dsBrowse] then
//  cbCanEditQH.Checked:=false;

  try
   currentnOMER:=    q_devices.fieldbyname('devicenumber').asinteger;
   FTP_CODE := round(ln(ln(currentnOMER+3))*10000000) mod 10000 ;
 (*  currentNomer :=currentNomer+2000;
   FTP_CODE :=(CurrentNomer*CurrentNomer);
   ftp_code:=ftp_code div 10;
   ftp_code :=ftp_code mod 10000;
   FTP_Code:=Round(ftp_code+sqrt(CurrentNomer*12.77)+9999) mod 10000;
  *)
   if FTP_Code<10 then ftp_code:=ftp_code+1000
    else
     begin
       if FTP_Code<100 then ftp_code:=ftp_code+2000
        else
         begin
          if FTP_Code<1000 then ftp_code:=ftp_code+3000

         end

     end;

   cxFTP_CODE.text:=inttostr(FTP_Code);
   except
    cxFTP_CODE.text :='';
  end;

end;

procedure TDevice_Form.miReplaceParentClick(Sender: TObject);
var
 id:integer;
begin
if (MessageDlg('Запись о приборе-"родителе" будет удалена, его номер будет назначен прибору-клону. Вы уверены?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    id:=q_devices.fieldbyname('ID').asinteger;
    dm.ParentReplace.ParamByName('Clone_ID').asinteger:=q_devices.fieldbyname('ID').asinteger;
    dm.ParentReplace.ParamByName('Parent_ID').asinteger:=q_devices.fieldbyname('Device_Parent_ID').asinteger;
    dm.ParentReplace.ParamByName('Parent_Number').asstring:=q_devices.fieldbyname('ParentDeviceNumber').asstring;
    dm.ParentReplace.ExecProc;
    dm.ParentReplace.transaction.CommitRetaining;
    q_devices.AfterScroll:=nil;
    q_devices.BeforeScroll:=nil;
    q_devices.Close;
    q_devices.Open;
    q_devices.locate('id', id,[]);
    q_devices.AfterScroll:=device_form.q_devicesAfterScroll;
    q_devices.BeforeScroll:=device_form.q_devicesBeforeScroll;
    q_devicesAfterScroll(nil);
    pcQHChange(nil);
  end;
end;

procedure TDevice_Form.q_devicesNAMEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
if not q_devices.FieldByName('device_parent_id').isnull then
  text:='(клон)'+q_devices.fieldbyname('Name').asstring
   else   text:=q_devices.fieldbyname('Name').asstring;
end;

procedure TDevice_Form.N3Click(Sender: TObject);
begin
 PCInputValues.TabIndex:=0;
end;

procedure TDevice_Form.ChartClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
MessageDlg('Вы указали на точку X = '+ formatfloat('0.000',Series.XValues[valueindex])+'   Y = '+
    formatfloat('0.000',series.YValues[valueindex]), mtInformation, [mbOk],0);
end;

procedure TDevice_Form.q_devicesCOMPOSITION_DEVICETYPEGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
 case   q_devicesCOMPOSITION_DEVICETYPE.asinteger of
  0: text:='ЭХО-Р';
  1: text:='ЭХО-АС';
 end;
end;

procedure TDevice_Form.q_devicesCalcFields(DataSet: TDataSet);
var FName, FullName: string;
begin
  if q_devices.fieldbyname('name').asstring='Расходомер' then
    FUllName:=extractfiledir(Application.exename)+'\TBL\Рас'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl'
    else
     if q_devices.fieldbyname('name').asstring='Уровнемер' then
      FullName:=extractfiledir(Application.exename)+'\TBL\Ур'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl'
       else
          FullName:= extractfiledir(Application.exename)+'\TBL\'+q_devices.fieldbyname('name').asstring+'_'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl';
 Fname:=Fullname;
 if fileexists(FullName) then
  begin
   delete(FullName,1, length(extractfiledir(Application.exename)+'\TBL\'));
   q_devices.FieldByName('TblFile').asstring:=FullName;
  end
   else q_devices.FieldByName('TblFile').asstring:='';
 //if dm.CheckNeedTbl(q_devices.fieldbyname('id').asinteger) then
{ if dm.CheckNeedTbl_New(q_devices) then
   begin
     q_devices.FieldByName('TblFile').asstring:='';
     if fileexists(FName) then
        try
          deletefile(Fname);
          except
         end;
   end;
}end;

procedure TDevice_Form.q_deviceparamsPARAM_VALUEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
if q_deviceparams.FieldByName('Name').asstring='Материал трубы' then
  text:=rg_material.items[rg_material.itemindex]
   else text:=q_deviceparamsPARAM_VALUE.asstring;
end;

procedure TDevice_Form.FloatField14GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 if q_deviceparams_xls.FieldByName('Name').asstring='Материал трубы' then
  text:=rg_material.items[rg_material.itemindex]
   else text:=q_deviceparams_xls.fieldbyname('PARAM_VALUE').asstring;    
end;

procedure TDevice_Form.SetColumn_attValues;
begin
 {
 if q_deviceParams.fieldbyname('Name').asstring='Материал трубы' then
   begin
       ParamGrid.columns[3].picklist.clear;
       ParamGrid.columns[3].keylist.clear;
       ParamGrid.columns[3].Autodropdown:=false;
       Paramgrid.columns[3].picklist.Add('Сталь'); Paramgrid.columns[3].keylist.Add('0');
       Paramgrid.columns[3].picklist.Add('Чугун'); Paramgrid.columns[3].keylist.Add('1');
       Paramgrid.columns[3].picklist.Add('Чугун с бетоном'); Paramgrid.columns[3].keylist.Add('2');
       Paramgrid.columns[3].picklist.Add('Бетон с засорением'); Paramgrid.columns[3].keylist.Add('3');
       Paramgrid.columns[3].picklist.Add('Бетон необработаннный'); Paramgrid.columns[3].keylist.Add('4');
       Paramgrid.columns[3].picklist.Add('Бетон'); Paramgrid.columns[3].keylist.Add('5');
       Paramgrid.columns[3].picklist.Add('Фарфор'); Paramgrid.columns[3].keylist.Add('6');
       Paramgrid.columns[3].Autodropdown:=true;
 end
  else
   begin
     ParamGrid.columns[3].Autodropdown:=false;
     ParamGrid.columns[3].picklist.clear;
     ParamGrid.columns[3].keylist.clear;
//     Paramgrid.columns[3]. DisplayText:=q_deviceparams.fieldbyname('Param_value').text;
   end;  }
end;

procedure TDevice_Form.ds_deviceparamsDataChange(Sender: TObject;
  Field: TField);
begin
 if q_deviceparams.FieldByName('Name').asstring='Материал трубы' then rg_material.Visible:=true
  else rg_material.Visible:=false;
  
end;

procedure TDevice_Form.q_devicesBeforePost(DataSet: TDataSet);
begin
 If dm.CheckNotUniqDeviceNumber1(edDeviceNumber.Text,edName.text, q_devices.fieldbyname('ID').asinteger) then
  begin
   Showmessage('Номер прибора должен быть уникальным! Измените номер прибора.');
   pcInputValues.ActivePageIndex:=0;
   edDeviceNumber.setfocus;
   q_devices.cancel;
  end;
end;

procedure TDevice_Form.pcInputValuesChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  If dm.CheckNotUniqDeviceNumber1(edDeviceNumber.Text,edName.text, q_devices.fieldbyname('ID').asinteger) then
  begin
   Showmessage('Номер прибора должен быть уникальным! Измените номер прибора.');
   pcInputValues.ActivePageIndex:=0;
   edDeviceNumber.setfocus;
   q_devices.cancel;
   allowchange:=false;
  end;
end;

procedure TDevice_Form.edDeviceNumberExit(Sender: TObject);
begin
   If dm.CheckNotUniqDeviceNumber1(edDeviceNumber.Text,edName.text, q_devices.fieldbyname('ID').asinteger) then
  begin
   Showmessage('Номер прибора должен быть уникальным! Измените номер прибора.');
   pcInputValues.ActivePageIndex:=0;
   edDeviceNumber.setfocus;
   q_devices.cancel;
  end;
  if  (OldDeviceNumber<>edDeviceNumber.text) then
        begin
        dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
        dm.needRecalc(1,q_devices.FieldByName('ID').ASINTEGER);
        CheckFiles;
        q_devices.Edit;
        q_devices.fieldbyname('Need_TBL').asinteger:=1;
        q_devices.fieldbyname('Need_RECALC').asinteger:=1;
        q_devices.fieldbyname('TblFile').asstring:='';
        q_devices.post;
       end;
end;

procedure TDevice_Form.cbConverterClick(Sender: TObject);
var id:integer;
begin
if cbConverter.ItemIndex  = -1 then exit;
 q_devices.edit;
 q_devices.fieldbyname('ConverterName').asstring:=  cbConverter.text;
 q_devices.fieldbyname('ID_Converter').asinteger:=  integer(cbConverter.Items.Objects[cbConverter.ItemIndex]);
 q_devices.post;

      //if  (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE') then
        begin
        dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
        dm.needRecalc(1,q_devices.FieldByName('ID').ASINTEGER);
        CheckFiles;
        q_devices.Edit;
        q_devices.fieldbyname('Need_TBL').asinteger:=1;
        q_devices.fieldbyname('Need_RECALC').asinteger:=1;
        q_devices.fieldbyname('TblFile').asstring:='';
        q_devices.post;
       end;

end;

procedure TDevice_Form.cbConverterExit(Sender: TObject);
var id:integer ;
begin
if cbConverter.ItemIndex  = -1 then exit;
 q_devices.edit;
 q_devices.fieldbyname('ConverterName').asstring:=  cbConverter.text;
 q_devices.fieldbyname('ID_Converter').asinteger:=  integer(cbConverter.Items.Objects[cbConverter.ItemIndex]);
 q_devices.post;

end;

procedure TDevice_Form.btnTypeDeviceClick(Sender: TObject);
var
 id_device:integer;
begin
 id_device := q_devices.fieldbyname('id').asinteger;
  with TSelectFrm.Create(Self) do
  try
    GetValueFromQueryText_ID('select ID, Name from DeviceTypes where id<>9 order by sortorder', 'Name', 'ID');
    if ShowModal = mrOK then begin
     q_devices.edit;
     q_devices.FieldByName('typedevice_id').asinteger:=ID;
     q_devices.post;
     dm.CHANGEDEVICETYPE.ParamByName('id_device').asinteger:=id_device;
     dm.CHANGEDEVICETYPE.ParamByName('new_deviceType_id').asinteger:=ID;
     dm.CHANGEDEVICETYPE.ExecProc;
     dm.CHANGEDEVICETYPE.Transaction.CommitRetaining;
     //if  (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE') then
        begin
        dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
        CheckFiles;
        q_devices.Edit;
        q_devices.fieldbyname('Need_TBL').asinteger:=1;
        q_devices.fieldbyname('TblFile').asstring:='';
        q_devices.post;
       end;

     end;
  finally
    Free;
  end;
    q_devices.AfterScroll:=nil;
    q_devices.BeforeScroll:=nil;
    q_devices.Close;
    q_devices.open;
    q_devices.locate('id', id_device,[]);
    updatedetailinfo;
    q_devices.AfterScroll:=q_devicesAfterScroll;
    q_devices.BeforeScroll:=q_devicesBeforeScroll;
    edDeviceNumber.SetFocus;
end;


Procedure TDevice_Form.updateDetailInfo;
begin
 cbTypeDevice.ItemIndex:=cbTypeDevice.Items.IndexOfObject(Tobject(q_devices.fieldbyname('TypeDevice_ID').asinteger));
 cbConverter.ItemIndex:=cbConverter.Items.IndexOfObject(Tobject(q_devices.fieldbyname('ID_Converter').asinteger));

 RG_Current.OnClick:=nil;
 RG_Level.OnClick:=nil;
 RG_RS.OnClick:=nil;
 RG_DeviceType.OnClick:=nil;
 RG_IR_PORT.OnClick:=nil;
 RG_IMP_OUT.OnClick:=nil;

 RG_RS.ItemIndex:=q_devices.fieldbyname('Composition_RS').asinteger;
 RG_Level.ItemIndex:=q_devices.fieldbyname('Composition_Level').asinteger;
 RG_Current.ItemIndex:=q_devices.fieldbyname('Composition_Current').asinteger;
 RG_IR_PORT.ItemIndex:=q_devices.fieldbyname('Composition_IR_PORT').asinteger;
 RG_IMP_OUT.ItemIndex:=q_devices.fieldbyname('Composition_IMP_OUT').asinteger;
 RG_DEVICETYPE.ItemIndex:=q_devices.fieldbyname('Composition_DEVICETYPE').asinteger;

 RG_Current.OnClick:=RG_Currentclick;
 RG_Level.OnClick:=RG_Currentclick;
 RG_RS.OnClick:=RG_Currentclick;
 RG_DeviceTYPE.OnClick:=RG_Currentclick;
 RG_IR_PORT.OnClick:=RG_Currentclick;
 RG_IMP_OUT.OnClick:=RG_Currentclick;

 setQHGridTitleAndMode;
 CheckLocked;
// GetQHCalcColumns;
 Get_getQHMax;//GetQHMax.Close; GetQHMax.open;
 Chart.RefreshDataSet(q_QH,Series1);
 GetGostTable; Chart.RefreshDataSet(GostTable,Series2);
 GetVisiblePointsTable;  Chart.RefreshDataSet(VisiblePointsTable,Series3);
 Chart.RefreshDataSet(q_QH_Parent,Series4);
 end;

procedure TDevice_Form.pmAddPointClick(Sender: TObject);
var i:integer;
begin
 dm.q.close;
 dm.q.SQL.Clear;
 dm.q.SQL.Add(' select max(I) as I_Max from qh where device_id = :device_id' );
 dm.q.ParamByName('Device_id').asinteger:=q_qh.fieldbyname('Device_id').asinteger;
 dm.q.ExecQuery;

 if (q_qh.eof or (q_qh.FieldByName('I').asinteger = dm.q.FieldByName('I_Max').asinteger)) then   begin
  showmessage('Только для промежуточных точек');   dm.q.close;
  exit;
  end;
 if (q_qh.Bof or (q_qh.FieldByName('I').asinteger=1)) then   begin
  showmessage('Только для промежуточных точек');     dm.q.close;
  exit;
  end;
 dm.q.close;
  i:=q_QH.fieldbyname('I').asinteger;
 dm.ADDPOINT_TO_QH.ParamByName('Id_Device').asinteger:=q_devices.fieldbyname('ID').asinteger;
 dm.ADDPOINT_TO_QH.ParamByName('Point_Number').asinteger:=q_QH.fieldbyname('I').asinteger;
 dm.Addpoint_TO_QH.ExecProc;
 dm.AddPoint_To_Qh.transaction.CommitRetaining;
 q_qh.close;
 q_qh.Open;
 q_deviceparams.close;
 q_deviceparams.open;
 q_qh.Locate('i',i,[]);
 dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
 checkfiles;
 q_devices.edit;
//  q_devices.fieldbyname('Locked').asinteger:= 1;
  q_devices.fieldbyname('Need_TBL').asinteger:=1;
  q_devices.fieldbyname('TblFile').asstring:='';

  q_devices.post;

   
end;

procedure TDevice_Form.pmDeletePointClick(Sender: TObject);
var i:integer;
begin
 dm.q.close;
 dm.q.SQL.Clear;
 dm.q.SQL.Add(' select max(I) as I_Max from qh where device_id = :device_id' );
 dm.q.ParamByName('Device_id').asinteger:=q_qh.fieldbyname('Device_id').asinteger;
 dm.q.ExecQuery;

 if (q_qh.eof or (q_qh.FieldByName('I').asinteger = dm.q.FieldByName('I_Max').asinteger)) then    begin
  showmessage('Только для промежуточных точек');   dm.q.close;
  exit;
  end;
 if (q_qh.Bof or (q_qh.FieldByName('I').asinteger=1))  then  begin
  showmessage('Только для промежуточных точек');     dm.q.close;
  exit;
  end;
 dm.q.close;
 i:=q_QH.fieldbyname('I').asinteger;
 dm.DELETEPOINT_FROM_QH.ParamByName('Id_Device').asinteger:=q_devices.fieldbyname('ID').asinteger;
 dm.DELETEPOINT_FROM_QH.ParamByName('Point_Number').asinteger:=q_QH.fieldbyname('I').asinteger;
 dm.DELETEPOINT_FROM_QH.ExecProc;
 dm.DELETEPOINT_FROM_QH.transaction.CommitRetaining;
 q_qh.close;
 q_qh.Open;
 q_deviceparams.close;
 q_deviceparams.open;
 q_qh.Locate('i',i,[]);
 dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
 CheckFiles;
 q_devices.Edit;
 q_devices.fieldbyname('Need_TBL').asinteger:=1;
 q_devices.fieldbyname('TblFile').asstring:='';
 q_devices.post;
 
end;

procedure TDevice_Form.edDeviceNumberKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then cbconverter.setfocus;
end;

procedure TDevice_Form.cbbCustomerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then rg_rs.setfocus;
end;

procedure TDevice_Form.cbbCustomerCloseUp(Sender: TObject; Accept: Boolean);
begin
  focuscontrol(RG_RS);

end;

procedure TDevice_Form.miCopyDeviceClick(Sender: TObject);
var Id:integer;
begin
 dm.CopyDevice.ParamByName('Old_Device_ID').asinteger:=q_devices.fieldbyname('ID').asinteger;
 dm.CopyDevice.ExecProc;
 dm.CopyDevice.transaction.CommitRetaining;
 id:=dm.CopyDevice.ParamByName('Device_ID').asinteger;
 q_devices.AfterScroll:=nil;
 q_devices.BeforeScroll:=nil;
 q_devices.close;
 q_devices.open;
 q_devices.Locate('ID',id,[]);

 q_devices.AfterScroll:=device_form.q_devicesAfterScroll;
 q_devices.BeforeScroll:=device_form.q_devicesBeforeScroll;
 pcInputValues.activepageIndex:=0;
 q_devicesAfterScroll(nil);
 pcInputValuesChange(nil);
 if (q_devices.fieldbyname('CalcMode').asstring='FORMULA') then  btnProcessingclick(nil);
  pcInputValues.activepageIndex:=0;
end;

procedure TDevice_Form.miCreateNew_UrovnemerClick(Sender: TObject);
var device_id: integer;
begin
 try
    dm.CreateNewDevice_new.ParamByName('Name').asstring:='Уровнемер';
    dm.CreateNewDevice_new.ParamByName('Composition_DeviceTYPE').asinteger:=1;
    dm.CreateNewDevice_New.ExecProc;
    dm.CreateNewDevice_New.transaction.CommitRetaining;
    q_devices.AfterScroll:=nil;
    q_devices.BeforeScroll:=nil;
    device_id:=dm.CreateNewDevice_New.ParamByName('Device_ID').asinteger;
//    device_form.hide;
    rgRG_Filter.ItemIndex:=1;
    miRefreshClick(nil);

    q_devices.Locate('ID',device_id,[]);
    updateDetailInfo;
    pcInputValues.ActivePageIndex:=0;
    DevicesPanel.visible:=false;
    windowstate:=wsMaximized;
//    show;
    q_devices.AfterScroll:=device_form.q_devicesAfterScroll;
    q_devices.BeforeScroll:=device_form.q_devicesBeforeScroll;
    edDeviceNumber.SetFocus;
    q_devicesAfterScroll(nil);
   except on E: Exception do
           showmessage('Ошибка при регистрации прибора в базе данных:' +E.Message);
  end;
end;

procedure TDevice_Form.miCreateNew_rashodomerClick(Sender: TObject);
var device_id: integer;
begin
 try
    dm.CreateNewDevice_new.ParamByName('Name').asstring:='Расходомер';
    dm.CreateNewDevice_new.ParamByName('Composition_DeviceTYPE').asinteger:=0;
    dm.CreateNewDevice_New.ExecProc;
    dm.CreateNewDevice_New.transaction.CommitRetaining;
    q_devices.AfterScroll:=nil;
    q_devices.BeforeScroll:=nil;
    device_id:=dm.CreateNewDevice_New.ParamByName('Device_ID').asinteger;
//    device_form.hide;
    rgRG_Filter.ItemIndex:=0;
    miRefreshClick(nil);

    q_devices.Locate('ID',device_id,[]);
    updateDetailInfo;
    pcInputValues.ActivePageIndex:=0;
    DevicesPanel.visible:=false;
    windowstate:=wsMaximized;
//    show;
    q_devices.AfterScroll:=device_form.q_devicesAfterScroll;
    q_devices.BeforeScroll:=device_form.q_devicesBeforeScroll;
    edDeviceNumber.SetFocus;
    q_devicesAfterScroll(nil);
   except on E: Exception do
           showmessage('Ошибка при регистрации прибора в базе данных:' +E.Message);
  end;
end;

procedure TDevice_Form.BitBtn1Click(Sender: TObject);
var device_id: integer;
begin
 try
    case rgRG_Filter.ItemIndex of
     0:dm.CreateNewDevice_new.ParamByName('Name').asstring:='Расходомер';
     1: dm.CreateNewDevice_new.ParamByName('Name').asstring:='Уровнемер';
    end;
    dm.CreateNewDevice_new.ParamByName('Composition_DeviceTYPE').asinteger:=rgRG_Filter.ItemIndex;
    dm.CreateNewDevice_New.ExecProc;
    dm.CreateNewDevice_New.transaction.CommitRetaining;
    q_devices.AfterScroll:=nil;
    q_devices.BeforeScroll:=nil;
    device_id:=dm.CreateNewDevice_New.ParamByName('Device_ID').asinteger;
//    device_form.hide;
    miRefreshClick(nil);

    q_devices.Locate('ID',device_id,[]);
    updateDetailInfo;
    pcInputValues.ActivePageIndex:=0;
    DevicesPanel.visible:=false;
    windowstate:=wsMaximized;
//    show;
    q_devices.AfterScroll:=device_form.q_devicesAfterScroll;
    q_devices.BeforeScroll:=device_form.q_devicesBeforeScroll;
    edDeviceNumber.SetFocus;
    q_devicesAfterScroll(nil);
   except on E: Exception do
           showmessage('Ошибка при регистрации прибора в базе данных:' +E.Message);
  end;
end;

procedure TDevice_Form.ParamGridExit(Sender: TObject);
var
   ID_D:Integer;
begin
 ID_D:= q_devices.fieldbyname('ID').asinteger ;
 CheckFiles;
 if
 (
 (q_devices.fieldbyname('CalcMode').asstring='FORMULA')
     and (dm.CheckNeedRecalc(q_devices.fieldbyname('ID').asinteger)
  //   and dm.CheckNeedRecalc_New(q_devices))
       or dm.CheckNeedTbl(q_devices.fieldbyname('ID').asinteger))
  //   or dm.CheckNeedTbl_New(q_devices)
      )  then
 begin
{  if q_devices.FieldByName('TblFile').asstring<>'' then
   begin
    q_devices.edit;
    q_devices.FieldByName('TblFile').asstring:='';
    q_devices.post;
   end; }
    //q_devices.Close;
    //q_devices.Open;
     if q_deviceparams.FieldByName('Name').asstring<>'Материал трубы' then q_devices.refresh;
 end;
end;


procedure TDevice_Form.CheckFiles;
var FullName: string;
begin
   if
 (
 (q_devices.fieldbyname('CalcMode').asstring='FORMULA')
     and (dm.CheckNeedRecalc(q_devices.fieldbyname('ID').asinteger)
       or dm.CheckNeedTbl(q_devices.fieldbyname('ID').asinteger) )
       )  then
 //  and dm.CheckNeedRecalc_New(q_devices))
 //      or dm.CheckNeedTbl_New(q_devices) )  then
 begin
  if q_devices.fieldbyname('name').asstring='Расходомер' then
    FUllName:=extractfiledir(Application.exename)+'\TBL\Рас'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl'
    else
     if q_devices.fieldbyname('name').asstring='Уровнемер' then
      FullName:=extractfiledir(Application.exename)+'\TBL\Ур'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl'
       else
          FullName:= extractfiledir(Application.exename)+'\TBL\'+q_devices.fieldbyname('name').asstring+'_'+q_devices.fieldbyname('deviceNumber').asstring+'.xls';
 deletefile(Fullname);
 if q_devices.fieldbyname('name').asstring='Расходомер' then
    FUllName:=extractfiledir(Application.exename)+'\XLS\Рас'+q_devices.fieldbyname('deviceNumber').asstring+'.xls'
    else
     if q_devices.fieldbyname('name').asstring='Уровнемер' then
      FullName:=extractfiledir(Application.exename)+'\XLS\Ур'+q_devices.fieldbyname('deviceNumber').asstring+'.xls'
       else
          FullName:= extractfiledir(Application.exename)+'\XLS\'+q_devices.fieldbyname('name').asstring+'_'+q_devices.fieldbyname('deviceNumber').asstring+'.xls';
 deletefile(Fullname);
end;
if
 (
  (q_devices.fieldbyname('CalcMode').asstring<>'FORMULA')
       and dm.CheckNeedTbl(q_devices.fieldbyname('ID').asinteger) 
       )  then
 //  and dm.CheckNeedRecalc_New(q_devices))
 //      or dm.CheckNeedTbl_New(q_devices) )  then
 begin
  if q_devices.fieldbyname('name').asstring='Расходомер' then
    FUllName:=extractfiledir(Application.exename)+'\TBL\Рас'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl'
    else
     if q_devices.fieldbyname('name').asstring='Уровнемер' then
      FullName:=extractfiledir(Application.exename)+'\TBL\Ур'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl'
       else
          FullName:= extractfiledir(Application.exename)+'\TBL\'+q_devices.fieldbyname('name').asstring+'_'+q_devices.fieldbyname('deviceNumber').asstring+'.xls';
 deletefile(Fullname);
 if q_devices.fieldbyname('name').asstring='Расходомер' then
    FUllName:=extractfiledir(Application.exename)+'\XLS\Рас'+q_devices.fieldbyname('deviceNumber').asstring+'.xls'
    else
     if q_devices.fieldbyname('name').asstring='Уровнемер' then
      FullName:=extractfiledir(Application.exename)+'\XLS\Ур'+q_devices.fieldbyname('deviceNumber').asstring+'.xls'
       else
          FullName:= extractfiledir(Application.exename)+'\XLS\'+q_devices.fieldbyname('name').asstring+'_'+q_devices.fieldbyname('deviceNumber').asstring+'.xls';
 deletefile(Fullname);
end;
end;

procedure TDevice_Form.BitBtn2Click(Sender: TObject);
var
 Y:double;
begin
 if q_devices.fieldbyname('Create_Date').isnull then
  begin
   showmessage('Расчет характеристики еще не был выполнен.');
   exit;
  end;
 if  (MessageDlg('Существующая характеристика будет удалена. Вы уверены?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
        Last_qetQHMax_ID:=-1;
        q_QH_SortByX.Close;
        q_devices.Edit;
        if q_devices.fieldbyname('Create_Date').isnull then q_devices.fieldbyname('Create_Date').asdatetime:=now;
        if not q_devices.fieldbyname('Sale_Date').isnull then q_devices.fieldbyname('Create_Date').asdatetime:=q_devices.fieldbyname('Sale_Date').asdatetime;
        q_devices.fieldbyname('Sale_Date').asdatetime:=now;
        q_DEVICES.FieldByName('Params_are_bad').asinteger:=0;
        q_devices.fieldbyname('Record_Date').asdatetime:=now;
        q_devices.fieldbyname('Need_Recalc').asinteger:=0;
        q_devices.fieldbyname('Need_TBL').asinteger:=1;
        q_devices.fieldbyname('Additive_shift').value:=AddSdvig.Value+q_devices.fieldbyname('Additive_shift').value;
        q_devices.post;
        dm.NEEDRecalc(0,q_devices.FieldByName('ID').ASINTEGER);
        dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
        //CreateQH_values;
        q_QH.DisableControls;
        q_QH.first; q_qh.next;
        q_QH.AfterPost:=nil;
        while not q_QH.eof do
         begin
          q_QH.Edit;
          Y:=Q_QH.fieldbyname('Y_Value').asfloat;
          Y:=Y-AddSdvig.Value;
          if y<0 then Y:=0;
          Q_QH.fieldbyname('Y_Value').asfloat:=Y;
          Q_QH.Post;
          q_Qh.next;
         end;
        q_QH.AfterPost:=q_QHafterpost;
        dm.tranDefault.CommitRetaining;
        if  (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE') then
         begin
          dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
          CheckFiles;
          q_devices.Edit;
          q_devices.fieldbyname('Need_TBL').asinteger:=1;
          q_devices.fieldbyname('TblFile').asstring:='';
          q_devices.post;
        end;
        q_QH.EnableControls;
        GetQHCalcColumns;
        GetGostTable;
        GetVisiblePointsTable;
        pcInputValues.ActivePageIndex:=2;
        Chart.RefreshDataSet(q_QH,Series1);
    // GetQHCalcColumns; // GetGostTable;
        Chart.RefreshDataSet(GostTable,Series2);
    // GetVisiblePointsTable;
        Chart.RefreshDataSet(VisiblePointsTable,Series3);

        if q_devices.fieldbyname('CalcMode').asstring='USERTABLE' then  pcQH.ActivePageIndex:=0
          else  pcQH.ActivePageIndex:=1;

        Chart.RefreshDataSet(q_QH_Parent,Series4);
        if q_devices.FieldByName('TblFile').asstring<>'' then
            DropTBLFile;
        Last_qetQHMax_ID:=-1;
        q_QH_SortByX.Close;
        Calc_all;
  end;
end;

procedure   TDevice_Form.DropTBLFile  ;
var FName, FullName: string;
begin
  if q_devices.fieldbyname('name').asstring='Расходомер' then
    FUllName:=extractfiledir(Application.exename)+'\TBL\Рас'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl'
    else
     if q_devices.fieldbyname('name').asstring='Уровнемер' then
      FullName:=extractfiledir(Application.exename)+'\TBL\Ур'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl'
       else
          FullName:= extractfiledir(Application.exename)+'\TBL\'+q_devices.fieldbyname('name').asstring+'_'+q_devices.fieldbyname('deviceNumber').asstring+'.tbl';
 deletefile(Fullname);
 q_devices.edit;
 //q_devices.fieldbyname('Locked').asinteger:= 0;
 q_devices.FieldByName('TblFile').asstring:='';
 q_devices.post;
end;

procedure TDevice_Form.Get_QH_SORTBYX;
 begin
//   q_QH_SortByX.Close;
 //  q_QH_SortByX.Open;
 //   q_QH_sortByX.Fetchall;
  //  Exit;
  if not q_QH_SortByX.Active then
   begin
    q_QH_sortByX.ParamByName('ID').asinteger:=q_devices.FieldByName('ID').AsInteger;
    q_QH_SortByX.Open;
    q_QH_sortByX.Fetchall;
   end
   else begin
          if q_QH_SortByX.FieldByName('DEVICE_ID').value <> q_devices.FieldByName('ID').value then
            begin
             q_QH_sortByX.Close;
             q_QH_sortByX.ParamByName('ID').asinteger:=q_devices.FieldByName('ID').AsInteger;
             q_QH_sortByX.Open;
             q_QH_sortByX.Fetchall;
            end
             //else q_QH_sortByX.first;
        end;
 end;

 procedure TDevice_Form.Get_GETQHMAX;
 begin
  if not  GetQHMax.Active then
   begin
    GetQHMax.ParamByName('ID').asinteger:=q_devices.FieldByName('ID').AsInteger;
    GetQHMax.Open;
    Last_qetQHMax_ID:=q_devices.FieldByName('ID').AsInteger;
    //q_QH_sortByX.Fetchall;
   end
   else begin
          if Last_qetQHMax_ID <> q_devices.FieldByName('ID').value then
            begin
             GetQHMax.Close;
             GetQHMax.ParamByName('ID').asinteger:=q_devices.FieldByName('ID').AsInteger;
             GetQHMax.Open;
             Last_qetQHMax_ID:=q_devices.FieldByName('ID').AsInteger;
            end
             //else q_QH_sortByX.first;
        end;
 end;


procedure TDevice_Form.btnGetHexClick(Sender: TObject);
begin
   if ((q_devices.fieldbyname('CalcMode').asstring='FORMULA')
     and dm.CheckNeedRecalc(q_devices.fieldbyname('ID').asinteger)
     //and dm.CheckNeedRecalc_New(q_devices)
     )
      then
      begin
     //  showmessage('Параметры или комплектация прибора были изменены, но перерасчет характеристики не был выполнен.');
       q_devices.edit;
       q_devices.FieldByName('TblFile').asstring:='';
       q_devices.post;
       if  (MessageDlg('Параметры или комплектация прибора были изменены, но перерасчет характеристики не был выполнен. Выполнить перерасчет характеристики прямо сейчас?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
         begin
           pcInputValues.ActivePageIndex:=2;
           Update;
           btnProcessingClick(nil);
         end;
       exit;
    end;
 CreateTBL(1);
// CreateTbl(2);
end;

procedure TDevice_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=caHide;
end;

procedure TDevice_Form.btncloseClick(Sender: TObject);
begin
 hide;
end;

procedure TDevice_Form.pnltopResize(Sender: TObject);
begin
 btnclose.left:=pnltop.width-20;
end;

procedure TDevice_Form.edDeviceNumberEnter(Sender: TObject);
begin
oldDeviceNumber:= q_devices.fieldbyname('DEVICENUMBER').asstring;
end;

procedure TDevice_Form.ChartMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
 var
  tmpx,tmpY:double;
begin
try
  With TChart(Sender).Series[0] do
    begin
      GetCursorValues(tmpX,tmpY);  { <-- get values under mouse cursor }
      if ((tmpx>=0) and (tmpY>=0)) then
       begin
        lblmouseX.caption:='X = '+FORMATFLOAT('0.0000',tmpx);
        lblmouseY.caption:='Y = '+FORMATFLOAT('0.000',tmpy);
       end
        else
          begin
        lblmouseX.caption:='';
        lblmouseY.caption:='';
       end;
    end;
  except

 end

end;

procedure TDevice_Form.GridFrameFieldComboNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
// newText:=GridFrame.FieldCombo.Items[0];
end;

procedure TDevice_Form.btnInListClick(Sender: TObject);
var i:Integer;
begin
  if not deviceListForm.VT.Active then deviceListForm.VT.Open;
 if deviceListForm.VT.locate('ID',q_devices.fieldbyname('ID').AsInteger,[]) then deviceListForm.VT.delete;
 deviceListForm.VT.Append;
 for i:=0 to q_devices.fields.count-1 do
        deviceListForm.VT.FieldByName(q_devices.Fields[i].FieldName).Value:=q_devices.Fields[i].value;
 deviceListForm.VT.Post;

 if deviceListForm.vt.fieldbyname('tblfile').asstring<>'' then
   copyfile(PChar(extractfilepath(Application.exename)+'\TBL\'+deviceListForm.VT.fieldbyname('tblFile').AsString),
            PChar(extractfilepath(Application.exename)+'\DeviceList\'+deviceListForm.VT.fieldbyname('tblFile').AsString),
            False);
 if deviceListForm.vt.fieldbyname('xlsfile').asstring<>'' then
   copyfile(PChar(extractfilepath(Application.exename)+'\xls\'+deviceListForm.VT.fieldbyname('xlsFile').AsString),
            PChar(extractfilepath(Application.exename)+'\DeviceList\'+deviceListForm.VT.fieldbyname('xlsFile').AsString),
            False);

 if sender = btnInList then q_devices.Next;
 deviceListForm.show;
end;

procedure TDevice_Form.N24Click(Sender: TObject);
begin
 DeviceListForm.show
end;


procedure TDevice_Form.RemoveAll(path: string);
var
  sr: TSearchRec;
begin
  if FindFirst(path + '\*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if sr.Attr and faDirectory = 0 then
      begin
        DeleteFile(path + '\' + sr.name);
      end
      else
      begin
        if pos('.', sr.name) <= 0 then
          RemoveAll(path + '\' + sr.name);
      end;
    until
      FindNext(sr) <> 0;
  end;
  FindClose(sr);
  //RemoveDirectory(PChar(path));
end;
procedure TDevice_Form.cbbCustomerClick(Sender: TObject);
begin
//if cbConverter.ItemIndex  = -1 then exit;
if (not q_devices.Active) then Exit;
 if (q_devices.State in [dsedit]) then
         begin
         q_devices.post;
         dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
         dm.needRecalc(1,q_devices.FieldByName('ID').ASINTEGER);
         CheckFiles;
         q_devices.Edit;
         q_devices.fieldbyname('Need_TBL').asinteger:=1;
         q_devices.fieldbyname('Need_RECALC').asinteger:=1;
         q_devices.fieldbyname('TblFile').asstring:='';
         q_devices.post;
        end;//
end;

procedure TDevice_Form.pnl2Click(Sender: TObject);
begin
 pnl2.Visible:=False;
end;                                       

procedure TDevice_Form.edt_L0Exit(Sender: TObject);
begin
 if (q_devices.State in [dsEdit]) then
  begin
   q_devices.post;
   dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
        dm.needRecalc(1,q_devices.FieldByName('ID').ASINTEGER);
        CheckFiles;
        q_devices.Edit;
        q_devices.fieldbyname('Need_TBL').asinteger:=1;
        q_devices.fieldbyname('Need_RECALC').asinteger:=1;
        q_devices.fieldbyname('TblFile').asstring:='';
        q_devices.post;

  end;
end;

procedure TDevice_Form.edt_L0KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
   begin
    if (q_devices.State in [dsEdit]) then q_devices.post;
     dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
        dm.needRecalc(1,q_devices.FieldByName('ID').ASINTEGER);
        CheckFiles;
        q_devices.Edit;
        q_devices.fieldbyname('Need_TBL').asinteger:=1;
        q_devices.fieldbyname('Need_RECALC').asinteger:=1;
        q_devices.fieldbyname('TblFile').asstring:='';
        q_devices.post;
     RG_RS.setfocus
   end;

end;

procedure TDevice_Form.chkL0Click(Sender: TObject);
begin
 gb_L0.visible:=chkL0.Checked;
// if GB_L0.Visible then focuscontrol(GB_L0)

end;

procedure TDevice_Form.cbCanEditQH_Click(Sender: TObject);
var
   old_devicetype_id:Integer;
begin
 //2017.09.21
 (* SetQHGridTitleAndMode;
  if cbCanEditQH.checked  then
  begin
   old_devicetype_id:=q_devices.FieldByName('typedevice_id').asinteger;
     q_devices.edit;
     q_devices.FieldByName('typedevice_id').asinteger:=8;
     q_devices.post;
     dm.CHANGEDEVICETYPE_TO_USERTABLE.ParamByName('id_device').asinteger:=q_devices.fieldbyname('id').AsInteger;
     dm.CHANGEDEVICETYPE_TO_USERTABLE.ParamByName('new_deviceType_id').asinteger:=8;
     dm.CHANGEDEVICETYPE_TO_USERTABLE.ParamByName('old_deviceType_id').asinteger:= old_devicetype_id ;
     dm.CHANGEDEVICETYPE_TO_USERTABLE.ExecProc;
     dm.CHANGEDEVICETYPE_TO_USERTABLE.Transaction.CommitRetaining;
     q_deviceparams.Close;
     q_deviceparams.Open;

     //if  (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE') then
        begin
        dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
        CheckFiles;
        q_devices.Edit;
        q_devices.fieldbyname('Need_TBL').asinteger:=1;
        q_devices.fieldbyname('TblFile').asstring:='';
        q_devices.post;
       end;
       cbCanEditQH.checked:=true;
   end
   *)
end;

procedure TDevice_Form.btnCanEditQHClick(Sender: TObject);
var
   old_devicetype_id:Integer;
begin
 if (MessageDlg('Внимание!!! Прибор будет помечен "водовод с заданной характеристикой". '+
                ' Ранее заданные параметры для расчета характеристики прибора будут удалены.'+
                '  Вы будете иметь возможность редактировать существующую таблицу характеристики Q(h) прибора.'+
                ' Операция необратима!  Вы уверены?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
          begin
            SetQHGridTitleAndMode ;
            QHGrid.ReadOnly:=True;
            pnlCanEditQh.Visible:=False;
            old_devicetype_id:=q_devices.FieldByName('typedevice_id').asinteger;
            q_devices.edit;
            q_devices.FieldByName('typedevice_id').asinteger:=8;
            q_devices.post;
            dm.CHANGEDEVICETYPE_TO_USERTABLE.ParamByName('id_device').asinteger:=q_devices.fieldbyname('id').AsInteger;
            dm.CHANGEDEVICETYPE_TO_USERTABLE.ParamByName('new_deviceType_id').asinteger:=8;
            dm.CHANGEDEVICETYPE_TO_USERTABLE.ParamByName('old_deviceType_id').asinteger:= old_devicetype_id ;
            dm.CHANGEDEVICETYPE_TO_USERTABLE.ExecProc;
            dm.CHANGEDEVICETYPE_TO_USERTABLE.Transaction.CommitRetaining;
            q_deviceparams.Close;
            q_deviceparams.Open;

            //if  (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE') then
                begin
                dm.NEEDTbl(1,q_devices.FieldByName('ID').ASINTEGER);
                CheckFiles;
                q_devices.Edit;
                q_devices.fieldbyname('Need_TBL').asinteger:=1;
                q_devices.fieldbyname('TblFile').asstring:='';
                q_devices.post;
               end;

               q_QH.first;
           (*    while not q_QH.eof do
                begin
                  q_QH.Edit;
                  q_QH.Post;
                  q_QH.Next;
                end;
               q_QH.first; *)
           end;
end;

end.


