unit Exp_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, menu_f, Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls, Gauges,
  Buttons, Mask, Menus, DB, IBCustomDataSet,  ComCtrls,
   cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxEdit, cxDBData, cxLookAndFeelPainters, PropFilerEh, MemDS,
  VirtualTable, IBQuery, PropStorageEh, TeEngine, Series, TeeProcs, Chart,
  DbChart, DBCtrlsEh, cxMemo, DBGridEh, cxSpinEdit, cxDBEdit,
  cxDropDownEdit, cxMaskEdit, cxCheckBox, cxButtons, cxControls,
  cxContainer, cxTextEdit,
  cxGridCardView, cxGridDBCardView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses,  cxGridCustomView, cxGrid, cxGridCustomPopupMenu,
  cxGridPopupMenu,
    IBTable, shellapi, rxstrutils, IBSQL,
    cxImage,  math   ;

type
  TExpForm = class(TMenuForm)
    Panel_uP: TPanel;
    eksps: TIBDataSet;
    ds_eksp_theme: TDataSource;
    ekspsEKSP_NOMER: TIntegerField;
    ekspsEKSP_THEME: TIBStringField;
    ekspsEKSP_DATE: TDateField;
    ekspsEKSP_TIME: TTimeField;
    ekspsEKSP_HEADER: TIBStringField;
    ekspsEKSP_AUTHOR: TIBStringField;
    ekspsEKSP_MEMO: TMemoField;
    ekspsEKSP_SELECTED: TSmallintField;
    ekspsEKSP_PROC: TSmallintField;
    ekspsEKSP_PARENT: TIntegerField;
    ekspsID_UPLEVEL: TIntegerField;
    Signals: TIBDataSet;
    DS_Signals: TDataSource;
    Curveset: TIBDataSet;
    SignalsSIGNAL_NOMER: TIntegerField;
    SignalsEKSP_NOMER: TIntegerField;
    SignalsEKSP_PARENT: TIntegerField;
    SignalsCHANAL_NOMER: TSmallintField;
    SignalsCHANAL_HEADER: TIBStringField;
    SignalsDELTX: TFloatField;
    SignalsNAMEX: TIBStringField;
    SignalsNAMEY: TIBStringField;
    SignalsRAZMX: TIBStringField;
    SignalsRAZMY: TIBStringField;
    SignalsMULTX: TFloatField;
    SignalsMULTY: TFloatField;
    SignalsMAXX: TFloatField;
    SignalsMAXY: TFloatField;
    SignalsMINX: TFloatField;
    SignalsMINY: TFloatField;
    SignalsDATE_START: TDateField;
    SignalsTIME_START: TTimeField;
    SignalsPOINTALL: TIntegerField;
    SignalsBMAXMINX: TSmallintField;
    SignalsBMAXMINY: TSmallintField;
    SignalsFILEDAT: TIBStringField;
    SignalsREZTYPE: TSmallintField;
    SignalsREZLENGTH: TSmallintField;
    SignalsA0: TFloatField;
    SignalsA1: TFloatField;
    SignalsA2: TFloatField;
    SignalsA3: TFloatField;
    SignalsSIGNALMEMO: TMemoField;
    SignalsSIGNAL_SELECTED: TSmallintField;
    SignalsFILE_SEEK: TIntegerField;
    ds_CurveSet: TDataSource;
    CurvesetVIEW_STYLE: TIntegerField;
    ekspsEKSP_SOURCEFILE: TIBStringField;
    CurvesetVIEW_NOMER: TIntegerField;
    CurvesetVIEW_HEADER: TIBStringField;
    CurvesetVIEW_PAGE: TIBStringField;
    CurvesetTXTFILE: TIBStringField;
    CurvesetVIEW_MEMO: TMemoField;
    N3: TMenuItem;
    miAboutArchiev: TMenuItem;
    miClear: TMenuItem;
    qClear: TIBDataSet;
    N4: TMenuItem;
    N5: TMenuItem;
    PropStorageEh1: TPropStorageEh;
    ekspsEKSP_SIGNALSOURCE: TMemoField;
    ds_ekspParams: TDataSource;
    ekspParams: TIBDataSet;
    ekspParamsID: TIntegerField;
    ekspParamsEKSP_ID: TIntegerField;
    ekspParamsPARAMGROUP: TIBStringField;
    ekspParamsPARAMNAME: TIBStringField;
    ekspParamsPARAMVALUE: TIBStringField;
    ekspParamsPARAMTYPE: TIBStringField;
    ekspParamsPARAMIMAGE: TBlobField;
    ekspParamsEKSP_NOMER: TIntegerField;
    Panel5: TPanel;
    Label4: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    cxObjectMemo: TcxDBMemo;
    TabSheet2: TTabSheet;
    Panel6: TPanel;
    btnEdit: TcxButton;
    TabSheet3: TTabSheet;
    Splitter2: TSplitter;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    deltx: TcxDBTextEdit;
    cxDBMemo2: TcxDBMemo;
    cxDBTextEdit4: TcxDBTextEdit;
    cxButton1: TcxButton;
    DBGridEh1: TDBGridEh;
    TabSheet4: TTabSheet;
    GridImages: TDBGridEh;
    Curveset_GB: TGroupBox;
    Label11: TLabel;
    cxDBMemo3: TcxDBMemo;
    cxButton2: TcxButton;
    btnDeleteCurveset: TcxButton;
    AllCurveSet_CB: TCheckBox;
    btnShowImage: TcxButton;
    ImageTab: TTabSheet;
    DBGridEh2: TDBGridEh;
    Panel7: TPanel;
    btnPrintParamReport: TcxButton;
    Panel2: TPanel;
    Panel3: TPanel;
    btnDelete: TcxButton;
    btnCreateAndShowImage: TcxButton;
    AllThemeExp: TCheckBox;
    Panel1: TPanel;
    Panel8: TPanel;
    Label5: TLabel;
    cbTheme: TcxCheckBox;
    cxDBTextEdit1: TcxDBTextEdit;
    Label12: TLabel;
    cxButton3: TcxButton;
    Splitter1: TSplitter;
    miWindow: TMenuItem;
    Label10: TLabel;
    FileSource: TcxDBTextEdit;
    N1: TMenuItem;
    miAddSignurDevice: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Panel9: TPanel;
    eksp_header: TcxDBTextEdit;
    Label7: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    btnLoadInfoFromDevice: TcxButton;
    ekspsPOINTALL: TIntegerField;
    ekspsDELTX: TFloatField;
    miRefresh: TMenuItem;
    ekspsID_DEVICE: TIntegerField;
    ekspsDEVICE_NAME: TIBStringField;
    Label13: TLabel;
    objectslist: TcxDBComboBox;
    cxDBTextEdit2: TcxDBTextEdit;
    ekspsDEVICE_TYPE: TSmallintField;
    TabSheet5: TTabSheet;
    OnOff: TIBQuery;
    OnOffONOFF_EVENT: TDateTimeField;
    OnOffSTATUS: TSmallintField;
    ds_OnOff_F: TDataSource;
    DaysData: TIBQuery;
    DaysDataDAY_VALUE: TDateField;
    DaysDataS_VALUE: TFloatField;
    ds_DaysData_F: TDataSource;
    Hoursdata: TIBQuery;
    HoursdataHOUR_VALUE: TDateTimeField;
    HoursdataS_VALUE: TFloatField;
    ds_HoursData_F: TDataSource;
    OnOffEKSP_NOMER: TIntegerField;
    DaysDataEKSP_NOMER: TIntegerField;
    HoursdataEKSP_NOMER: TIntegerField;
    DaysDataD_VALUE: TFloatField;
    HoursdataD_VALUE: TFloatField;
    DaysData_F: TIBQuery;
    DateField1: TDateField;
    FloatField1: TFloatField;
    IntegerField1: TIntegerField;
    FloatField2: TFloatField;
    HoursData_F: TIBQuery;
    DateTimeField1: TDateTimeField;
    FloatField3: TFloatField;
    IntegerField2: TIntegerField;
    FloatField4: TFloatField;
    ekspsDATETIME_FINISH: TDateTimeField;
    ekspsDATETIME_START: TDateTimeField;
    Splitter4: TSplitter;
    ArchievPC: TPageControl;
    TabSheet8: TTabSheet;
    OnOffGrid: TDBGridEh;
    OnOff_Info: TcxMemo;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    DaysGrid: TDBGridEh;
    miCreateAndShowImage: TMenuItem;
    Panel4: TPanel;
    Label3: TLabel;
    cbDatabases: TComboBox;
    Panel11: TPanel;
    ChartPC: TPageControl;
    HoursChat_Tab: TTabSheet;
    onOff_Hours_Chart: TDBChart;
    DaysChat_Tab: TTabSheet;
    OnOff_VT_Chart: TVirtualTable;
    BarSeries3: TAreaSeries;
    mousePanel: TPanel;
    cxButton24Hours: TcxButton;
    cxButton30Days: TcxButton;
    cxButton6: TcxButton;
    On_VT: TVirtualTable;
    Off_VT: TVirtualTable;
    OnOff_VT: TVirtualTable;
    Off_VTLastEvent: TDateTimeField;
    On_VTLastEvent: TDateTimeField;
    OnOff_VTLastevent: TDateTimeField;
    OnOffLASTEVENT: TDateTimeField;
    ds_on_Off_VT: TDataSource;
    ONOFF_VT_onOff_Event: TDateTimeField;
    ON_OFF_VT_Status: TSmallintField;
    ekspsMODEM: TSmallintField;
    ekspsTONE_PULSE: TSmallintField;
    ekspsPHONE_NUMBER: TIBStringField;
    ekspsACCESS: TSmallintField;
    PageControl2: TPageControl;
    TabSheetMemo: TTabSheet;
    TabSheetModem: TTabSheet;
    cxDeviceMemo: TcxDBMemo;
    Label8: TLabel;
    Label_pulse: TLabel;
    Label16: TLabel;
    Phone_Number: TcxDBTextEdit;
    Access: TcxComboBox;
    Tone_Pulse: TRadioGroup;
    DBGrid: TDBGridEh;
    miHTML: TMenuItem;
    TabSheet9: TTabSheet;
    ekspsSCH_MODE: TSmallintField;
    ekspsSCH_DAY: TSmallintField;
    ekspsSCH_TIME: TTimeField;
    ekspsSCH_ACTION_MODE: TSmallintField;
    sch_mode: TDBComboBoxEh;
    Label19: TLabel;
    Panel12: TPanel;
    cxButton4: TcxButton;
    sch_panel: TPanel;
    Label18: TLabel;
    sch_action_mode: TDBComboBoxEh;
    Label15: TLabel;
    sch_time: TDBDateTimeEditEh;
    LabelDay: TLabel;
    sch_day: TDBComboBoxEh;
    ekspsSCH_CONNECTION_MODE: TSmallintField;
    Label17: TLabel;
    sch_connection_mode: TDBComboBoxEh;
    TabSheetModBus: TTabSheet;
    Label20: TLabel;
    modbus_address: TcxDBSpinEdit;
    lbBdr: TLabel;
    cxBDR: TDBComboBoxEh;
    lbParity: TLabel;
    Parity: TDBComboBoxEh;
    ekspsMODBUS_ADDRESS: TIBStringField;
    ekspsMODBUS: TSmallintField;
    ekspsBDR: TIntegerField;
    ekspsPARITYCONTROL: TSmallintField;
    ekspsDEVICE_NUMBER: TIntegerField;
    ekspsSTARTNUMBER_LARGEARCH: TIntegerField;
    Label21: TLabel;
    N2: TMenuItem;
    N6: TMenuItem;
    DBText1: TDBText;
    RG_Access: TRadioGroup;
    eksp_for_Load: TIBDataSet;
    IntegerField3: TIntegerField;
    IBStringField1: TIBStringField;
    DateField2: TDateField;
    TimeField1: TTimeField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    MemoField1: TMemoField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IBStringField4: TIBStringField;
    MemoField2: TMemoField;
    IntegerField6: TIntegerField;
    FloatField5: TFloatField;
    IntegerField7: TIntegerField;
    IBStringField5: TIBStringField;
    SmallintField3: TSmallintField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    IBStringField6: TIBStringField;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    SmallintField8: TSmallintField;
    TimeField2: TTimeField;
    SmallintField9: TSmallintField;
    SmallintField10: TSmallintField;
    IBStringField7: TIBStringField;
    SmallintField11: TSmallintField;
    IntegerField8: TIntegerField;
    SmallintField12: TSmallintField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    Label_Tone: TLabel;
    OnOffON_OFF_REASON_INT: TSmallintField;
    Off_VTOff_Reason_Int: TSmallintField;
    OnOff_VToff_reason_int: TSmallintField;
    Days_Chart: TDBChart;
    DaySeries: TAreaSeries;
    OnOff_Days_Chart: TDBChart;
 //   HourSeries: TAreaSeries;
    ekspsdd1: TDateTimeField;
    ekspsDD2: TDateTimeField;
    Signalsdd2: TDateTimeField;
    Signalsdd1: TDateTimeField;
    HoursData_FONOFF_EXISTS: TIntegerField;
    HoursData_Fcolor: TIntegerField;
    DaysData_FONOFF_EXISTS: TIntegerField;
    DaysData_Fcolor: TIntegerField;
    HoursData_VT: TVirtualTable;
    HoursData_VTHOUR_VALUE: TDateTimeField;
    HoursData_VTS_VALUE: TFloatField;
    HoursData_VTEKSP_NOMER: TIntegerField;
    HoursData_VTD_VALUE: TFloatField;
    HoursData_VTONOFF_EXISTS: TIntegerField;
    HoursData_VTColor: TIntegerField;
    HoursData_VTParent_HV: TDateTimeField;
    DaysData_VT: TVirtualTable;
    DaysData_VTS_VALUE: TFloatField;
    DaysData_VTEKSP_NOMER: TIntegerField;
    DaysData_VTD_VALUE: TFloatField;
    DaysData_VTONOFF_EXISTS: TIntegerField;
    DaysData_VTcolor: TIntegerField;
    DaysData_VTParent_DV: TDateTimeField;
    DaysData_VTDAY_VALUE: TDateTimeField;
    ds_OnOff: TDataSource;
    OnOff_New: TIBQuery;
    OnOff_NewFINISH: TDateTimeField;
    OnOff_NewSTATUS: TSmallintField;
    OnOff_NewON_OFF_REASON_INT: TSmallintField;
    N13: TMenuItem;
    Panel13: TPanel;
    Panel14: TPanel;
    DD1_H: TDateTimePicker;
    DD2_H: TDateTimePicker;
    Panel15: TPanel;
    btnLastDay: TSpeedButton;
    Label22: TLabel;
    Label23: TLabel;
    btnLastMonth: TSpeedButton;
    Label24: TLabel;
    DD1_D: TDateTimePicker;
    Label25: TLabel;
    DD2_D: TDateTimePicker;
    Label26: TLabel;
    DD1_OnOff: TDateTimePicker;
    Label27: TLabel;
    DD2_OnOff: TDateTimePicker;
    Panel16: TPanel;
    btnCreateHTMLReport: TSpeedButton;
    SpeedButton1: TSpeedButton;
    _cbLastData: TCheckBox;
    btnLast10Days: TSpeedButton;
    btnLast3Monthes: TSpeedButton;
    miBlueTooth: TMenuItem;
    ekspsBLUETOOTH: TSmallintField;
    ekspsBLUETOOTH_PIN: TIntegerField;
    TabSheetBlueTooth: TTabSheet;
    Label6: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    ekspsdevice_Interface: TSmallintField;
    ekspsINTERFACE_MODE: TSmallintField;
    ekspsVIA_MODEM: TSmallintField;
    cbVia_modem: TCheckBox;
    OnOff_NewSSTART: TDateTimeField;
    N14: TMenuItem;
    miCOM: TMenuItem;
    pgcHourData: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    HoursGrid: TDBGridEh;
    pgcDayData: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    btn1: TButton;
    Hours_Chart: TDBChart;
    HSeries: TAreaSeries;
    N15: TMenuItem;
    N16: TMenuItem;
    ekspsFTP_PASSWORD: TIntegerField;
    TabSheet12: TTabSheet;
    Label14: TLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    procedure miImportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ekspsBeforePost(DataSet: TDataSet);
    procedure ekspsAfterPost(DataSet: TDataSet);
    procedure cxButton3Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure ekspsAfterOpen(DataSet: TDataSet);
    procedure ekspsBeforeClose(DataSet: TDataSet);
    procedure cxButton1Click(Sender: TObject);
    procedure SignalsAfterPost(DataSet: TDataSet);
    procedure SignalsDELTXGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnCreateAndShowImageClick(Sender: TObject);
    procedure btnDeleteCurvesetClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure CurvesetAfterPost(DataSet: TDataSet);
    procedure CurvesetAfterOpen(DataSet: TDataSet);
    procedure CurvesetVIEW_STYLEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FileSourcePropertiesChange(Sender: TObject);
    procedure cbDatabasesChange(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure miAboutArchievClick(Sender: TObject);
    procedure miClearClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure cxDBImageDblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnPrintParamReportClick(Sender: TObject);
    procedure deltxDblClick(Sender: TObject);
    procedure mishowWinClick(Sender: TObject);
    procedure ekspsCalcFields(DataSet: TDataSet);
    procedure cxGrid1Enter(Sender: TObject);
    procedure miRefreshClick(Sender: TObject);
    procedure miAddSignurDeviceClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure objectslistPropertiesCloseUp(Sender: TObject);
    procedure btnLoadInfoFromDeviceClick(Sender: TObject);
    procedure WMCopyData(var m : TMessage); message WM_COPYDATA;
    procedure OnOffGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DD1Change(Sender: TObject);
    procedure ds_eksp_themeDataChange(Sender: TObject; Field: TField);
    procedure OnOFF_FAfterOpen(DataSet: TDataSet);
    procedure btnCreateHTMLReportClick(Sender: TObject);
    procedure ArchievPCChange(Sender: TObject);
    procedure cxButton24HoursClick(Sender: TObject);
    procedure cxButton30DaysClick(Sender: TObject);
    procedure OnOFF_FLASTEVENTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Days_ChartClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Hours_ChartClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGridEh3GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ON_OFF_VT_StatusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Tone_PulseClick(Sender: TObject);
    procedure ekspsAfterScroll(DataSet: TDataSet);
    procedure DBGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridCellClick(Column: TColumnEh);
    procedure miHTMLClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sch_modeChange(Sender: TObject);
    procedure modbus_addressPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure HoursdataAfterOpen(DataSet: TDataSet);
    procedure DaysDataAfterOpen(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure RG_AccessClick(Sender: TObject);
    procedure OnOff_VToff_reason_intGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure _cbLastDataClick(Sender: TObject);
    procedure SignalsCalcFields(DataSet: TDataSet);
    procedure HoursData_FCalcFields(DataSet: TDataSet);
    procedure DaysData_FCalcFields(DataSet: TDataSet);
    procedure HoursData_FAfterOpen(DataSet: TDataSet);
    procedure DaysData_FAfterOpen(DataSet: TDataSet);
    procedure OnOffONOFF_EVENTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure OnOff_NewON_OFF_REASON_INTGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FloatField2GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FloatField4GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure HoursData_FBeforeOpen(DataSet: TDataSet);
    procedure DaysData_FBeforeOpen(DataSet: TDataSet);
    procedure btnLastDayClick(Sender: TObject);
    procedure btnLastMonthClick(Sender: TObject);
    procedure btnLast10DaysClick(Sender: TObject);
    procedure btnLast3MonthesClick(Sender: TObject);
    procedure miBlueToothClick(Sender: TObject);
    procedure cbVia_modemClick(Sender: TObject);
    procedure ekspsINTERFACE_MODEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure miCOMClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgcDayDataChange(Sender: TObject);
    procedure pgcHourDataChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure HoursData_FAfterClose(DataSet: TDataSet);
    procedure N16Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure DaysData_FAfterClose(DataSet: TDataSet);
    procedure ChartPCChange(Sender: TObject);
  private
    { Private declarations }
    bneedrefresh:boolean ;
    s_on, s_Off, s_Total:tDatetime;
    asc_desc:boolean;
    currentObject:string;
    currentnOMER:INTEGER;
    bNeedChart:boolean;
    DayLast, HourLast:TDateTime;
    DayLastMax, HourLastMax:TDateTime;
    MinDay:TDateTime;
    MinHour:TDatetime;
  procedure InsertCurveSet;
  procedure Archieve_Reopen(eksp_nomer:integer);
  Procedure getHourDayLast;
  Procedure SetInterface_mode;

  public
    { Public declarations }
    inScheduleMode:boolean;
    GoodNumbers:boolean;

    Current_Channel:Integer;

   procedure CurvesetRefresh;
   procedure EkspRefresh;

   procedure CreateData;
   procedure btnLoadFTP(Sender: TObject);
  end;

var
  ExpForm: TExpForm;

implementation

uses Main_f, DM_dm, Import_f, IMAGE_u, tvc_u, config, Obzorka, Formtext,
  Audio_u, CURSORS, ArchievInfo_u, Picture_u, addSignurDevice_f,
  Import_signur, Master_new_u, master2013, import_signur_2, BlueTooth_f,
  ComPortSettings_u, master_ftp;

{$R *.dfm}

procedure TExpForm.miImportClick(Sender: TObject);
var
 id:integer;
begin
  inherited;
  AddSignurDeviceForm := TAddSignurDeviceForm.create(self);
  AddSignurDeviceForm.showmodal;
  windowstate:=wsNormal;
  id:=eksps.fieldbyname('Eksp_Nomer').asinteger;
  eksps.close;
  eksps.open;
  eksps.Locate('eksp_nomer',id,[]);
  freeandnil(AddSignurDeviceForm);
end;



procedure TExpForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption:=Program_Name+' / Архивные данные приборов';
//  eksps.close;
//  eksps.open;
  dd1_h.time:=encodetime(0,0,0,0);  dd2_h.time:=encodetime(0,0,0,0);
  dd1_d.time:=encodetime(0,0,0,0);  dd2_d.time:=encodetime(0,0,0,0);
  dd1_OnOff.time:=encodetime(0,0,0,0);  dd2_oNoFF.time:=encodetime(0,0,0,0);
  dd1_OnOff.Date:=trunc(now-365);;
  dd2_OnOff.Date:=trunc(now+1);
  dd1_D.Date:=trunc(now-365);;
  dd2_D.Date:=trunc(now+1);
  dd1_H.Date:=trunc(now-365);;
  dd2_H.Date:=trunc(now+1);

      HoursChat_Tab.TabVisible:=true;
      DaysChat_Tab.tabvisible:=false;

  DM.RemoveAll(ExtractFilePath(Application.ExeName)+'\Databases\_Default\Files');
  if not directoryexists(ExtractFilePath(Application.ExeName) +'Databases\_Default\Files') then
   mkdir(ExtractFilePath(Application.ExeName) +'Databases\_Default\Files');


end;

procedure TExpForm.ekspsBeforePost(DataSet: TDataSet);
begin
 inherited;
 eksps.FieldByName('modem').asinteger:=0;
 eksps.FieldByName('Via_modem').asinteger:=0;
 if cbVia_Modem.checked then
     begin
      eksps.FieldByName('modem').asinteger:=1;
      eksps.FieldByName('Via_modem').asinteger:=1;
      eksps.FieldByName('BDR').asinteger:=3;
     end;

 if RG_access.itemindex=1 then
     eksps.FieldByName('modbus').asinteger:=1 else
        eksps.FieldByName('modbus').asinteger:=0;
 if RG_access.itemindex=3 then
     eksps.FieldByName('BLUETOOTH').asinteger:=1 else
        eksps.FieldByName('BLUETOOTH').asinteger:=0;

   eksps.FieldByName('access').asinteger:=access.itemindex;
   eksps.FieldByName('tone_pulse').asinteger:=tone_pulse.itemindex;

   eksps.FieldByName('Interface_mode').asinteger:=rg_access.itemindex;

   if (Trim(eksps.fieldbyname('eksp_theme').AsString)='') then
          eksps.fieldbyname('eksp_theme').AsString:='-' ;

  // showmessage('post');
end;

procedure TExpForm.ekspsAfterPost(DataSet: TDataSet);
begin
  inherited;
  eksps.Transaction.CommitRetaining;
// showmessage('commit');
end;

procedure TExpForm.cxButton3Click(Sender: TObject);
var
 eksp_Theme:string;
 Eksp_Nomer:integer;
begin
  inherited;
  if eksps.state = dsEdit then
   begin
    if (cbTheme.checked {or (sender = cxButton3)})then
     begin
       dm.q.SQL.Clear;
       dm.q.SQL.add('select eksp_theme from eksp where Eksp_Nomer = :Eksp_Nomer');
       dm.q.parambyname('eksp_Nomer').asinteger:=eksps.fieldbyname('Eksp_Nomer').Asinteger;
       eksp_Nomer:=eksps.fieldbyname('Eksp_Nomer').Asinteger;
       dm.q.Open;
       eksp_Theme:=dm.q.fieldbyname('eksp_theme').asstring;

       dm.q.SQL.Clear;
       dm.q.SQL.add('Update eksp set eksp_theme  = :eksp_theme_New, eksp_signalsource = :eksp_signalsource_new where eksp_theme = :eksp_theme');
       dm.q.parambyname('eksp_theme').asstring:=Eksp_theme;
       dm.q.parambyname('eksp_theme_new').asstring:=cxdbTextEdit1.text;
       dm.q.parambyname('eksp_signalsource_new').asstring:=cxObjectmemo.text;
       dm.q.execsql;
       eksps.post;
       dm.q.Transaction.commitretaining;
       eksps.close;
       eksps.open;
       eksps.Locate('eksp_Nomer',eksp_nomer,[])
     end else
    eksps.post;
   end;
   dm.CreateSchedule;
end;

procedure TExpForm.btnDeleteClick(Sender: TObject);
var
i:integer;
Forms:TList;
dir:string;

procedure RemoveAll(path: string);
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
      RemoveDirectory(PChar(path));
    end;


begin
  inherited;
  if eksps.recordcount=0 then exit;
  Forms:=TList.create;
  for i:=Application.ComponentCount-1 downto 0 do
    begin
    if (Application.Components[i] is TImageForm )
        then Forms.add(TImageForm(Application.Components[i]));
    if (Application.Components[i] is TTextForm )
        then Forms.add(TTextForm(Application.Components[i]));
    if (Application.Components[i] is TObzorkaForm )
        then Forms.add(TObzorkaForm(Application.Components[i]));
    if (Application.Components[i] is TCursors_Form )
        then Forms.add(TCursors_Form(Application.Components[i]));
   end;

  for i:=0 to Forms.count-1 do
   begin
    TForm(Forms[i]).free;
   end;

  Mainform.activeForm:=self;

try
 if allthemeExp.checked then
 begin
 if MessageDlg('Вы действительно хотите удалить все записи об экспериментах темы : ' + eksps.fieldbyname('Eksp_Theme').AsString + '?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
 dm.q.SQL.Clear;
 dm.q.SQL.add('update eksp set hide=1 where eksp_theme = :eksp_theme');
 dm.q.parambyname('eksp_theme').asstring:=eksps.fieldbyname('Eksp_theme').AsString;
 dm.q.execsql;
 dm.q.Transaction.commitretaining;
 eksps.Close;
 end
 else
   if MessageDlg('Вы действительно хотите удалить из базы данных запись о приборе ' + eksps.fieldbyname('Eksp_Theme').AsString + ' / ' + eksps.fieldbyname('Eksp_header').AsString + '?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
 dm.q.SQL.Clear;
 dm.q.SQL.add('update eksp set hide=1 where eksp_nomer = :eksp_nomer');
 dm.q.parambyname('eksp_nomer').asinteger:=eksps.fieldbyname('Eksp_nomer').Asinteger;
 dm.q.execsql;
 dm.q.Transaction.commitretaining;

  if  MasterFTP_FORM=nil then  Application.CreateForm(TMasterFTP_FORM, MasterFTP_FORM);
  MasterFTP_FORM.Device_ID:=eksps.fieldbyname('eksp_nomer').asinteger;
  MasterFTP_FORM.DeviceType:=eksps.fieldbyname('device_type').asinteger;
  MasterFTP_FORM.pnmess.Caption:='';
  dm.GetStringsObjectsFromQuery(dm.sql, MasterFTP_FORM.cbInstr.Items,'select device_Name, id_Device from devices where not device_type is null order by DEVICE_name ', 'device_name', 'ID_Device');
  MasterFTP_FORM.cbInstr.ItemIndex:= MasterFTP_FORM.cbinstr.items.indexof(eksps.fieldbyname('device_Name').asstring);

   case MasterFTP_FORM.cbInstr.ItemIndex of
                0 :  dir := 'A1_'+eksps.fieldbyname('device_Number').asstring;
                1 :  dir := 'A1_'+eksps.fieldbyname('device_Number').asstring;
                2 :  dir := 'A2_'+eksps.fieldbyname('device_Number').asstring;
                4 :  dir := 'EQ_'+eksps.fieldbyname('device_Number').asstring;
                5 :  dir := 'EQ_'+eksps.fieldbyname('device_Number').asstring;
   end;
   RemoveAll(ExtractFilePath(Application.ExeName)+'\FTP_DATA\'+Dir);

 


 eksps.Close;
 finally
  eksps.Open;
 end;
end;

procedure TExpForm.ekspsAfterOpen(DataSet: TDataSet);
begin
  inherited;
 signals.Open;
 curveset.Open;
 ekspparams.open;
 dm.GetStringsFromQuery(dm.sql,Objectslist.Properties.Items,'select distinct eksp_theme as theme from eksp where (( eksp_proc = 0 ) or ( eksp_proc >2 ) )  and (id_uplevel=-1) and (Hide = 0)', 'theme');
 OnOff_new.Open;
 daysdata.open;
 Hoursdata.Open;
 CURRENTNOMER:=-1;
// daysdata_F.open;
// Hoursdata_F.Open;

 SetInterface_mode;

   ArchievPCChange(nil);
end;

procedure TExpForm.ekspsBeforeClose(DataSet: TDataSet);
begin
  inherited;
 signals.close;
 curveset.close;
 ekspparams.close;

 OnOff_new.Close;
 daysdata.Close;
 Hoursdata.Close;
// daysdata_F.Close;
// Hoursdata_F.Close;
end;

procedure TExpForm.cxButton1Click(Sender: TObject);
begin
  inherited;
  if Signals.state = dsEdit then Signals.post;
end;

procedure TExpForm.SignalsAfterPost(DataSet: TDataSet);
begin
  inherited;
 Signals.Transaction.CommitRetaining;
end;

procedure TExpForm.SignalsDELTXGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
try
 text:=formatfloat('0.0000',1/SignalsDELTX.Value);
 except
  text:=''
end
end;

procedure TExpForm.btnCreateAndShowImageClick(Sender: TObject);
var ImForm:TImageForm; p1,p2,p3,p4:integer;
    ObzForm:TObzorkaForm;
{    YXForm:TYX_Form;}
    IMG:TImageForm;
    IMG1:TObzorkaForm;
    IMG_T:TTextForm;
    I:word;
    deltx:double;
begin

 CreateData;
 cxButton24Hoursclick(nil);

 if eksps.recordcount=0 then exit;
    Screen.Cursor:=crHourGlass;
{    update;}
if ((sender =   btnCreateAndShowImage) or (sender =   miCreateAndShowImage)) then
  begin
   if signals.RecordCount=0 then
    begin
     showmessage('Предварительно необходимо выполнить загрузку архива данных прибора');
     Screen.Cursor:=crDefault;
     exit;
    end else
     InsertCurveSet;
  end;
 ViewNum:=Curveset.fieldbyname('View_Nomer').asinteger;
//    ViewNum:=CurveSetTableView_Nomer.Value;
 Screen.Cursor:=crHourGlass;
 for i:=0 to Application.ComponentCount-1 do
 begin
   if Application.Components[i] is  TTextForm then
      begin
       IMG_T:=Application.Components[i] as TTextForm;
       if (IMG_T.ViewNumber = ViewNum) then
        begin IMG_T.Show; WindowState:=wsminimized;Screen.Cursor:=crDefault;exit; end;
      end;
  if Application.Components[i] is  TImageForm then
     begin
      IMG:=Application.Components[i] as TImageForm;
      if (IMG.bImageAvailable and (IMG.ViewNumber = ViewNum)) then
       begin
        IMG.Show; WindowState:=wsminimized; Screen.Cursor:=crDefault;
        exit;
       end;
     end;
{  if Application.Components[i] is  TYX_Form then
     begin
      YXForm:=Application.Components[i] as TYX_Form;
      if (YXForm.bImageAvailable and (YXForm.ViewNumber = ViewNum)) then
       begin YXForm.Show; WindowState:=wsminimized;Screen.Cursor:=crDefault;exit; end;
     end;
 } if Application.Components[i] is  TObzorkaForm then
     begin
      IMG1:=Application.Components[i] as TObzorkaForm;
      if (IMG1.ViewNumber = ViewNum) then
       begin
        IMG1.Show;WindowState:=wsminimized;Screen.Cursor:=crDefault;
        exit;
       end;
     end;
 end;
 if not CurveSet.fieldbyname('View_Style').isnull then
 case CurveSet.fieldbyname('View_Style').Value of
   cNoMap_View: begin
                 Application.CreateForm(TIMageForm, ImageForm);
                 Signals.first;
                 deltx:=signals.fieldbyname('deltx').asfloat;
                 while not signals.eof do
                 begin
                  if deltx<>signals.fieldbyname('deltx').asfloat then
                   begin
                    ImageForm.RightXButtonClick(nil);
                    ImageForm.LeftxButtonClick(nil);
//     if sender =   btnCreateAndShowImage then   ImageForm.DivideOnDeltX;
                    break;
                   end;
                  signals.next;
                 end;
                 ImageForm.Show;
                 ImageForm.ShowProcBox(nil);
                 ImageForm.Proc_UvelClick(nil);
                 ImageForm.Proc_ShowClick(nil);
                 ImageForm.Proc_CloseClick(nil);;
                 Screen.Cursor:=crDefault;
                end;
   cTimeMap_View,cFreqMap_View,cKxxMap_View:
                begin
                 Application.CreateForm(TObzorkaForm, ObzForm);
                 ObzForm.Show;
                 Screen.Cursor:=crDefault;
                end;
   cY_X_View:
                begin
{                 Application.CreateForm(TYX_Form, YXForm);
                 YXForm.Show;
                 Screen.Cursor:=crDefault;
 }               end;
   cText_View:
                begin
                 PromFileName:=dm.activestoragepath+CurveSet.fieldbyname('TXTFile').asstring;
                 Application.CreateForm(TTextForm, IMG_T);
                 IMG_T.TextForm_Type:=cProcrez_is_Text;
                 IMG_T.ViewNumber:=ViewNum;
                 IMG_T.Caption:=Eksps.fieldbyname('Eksp_Theme').asstring+' '+CurveSet.fieldbyname('View_Header').asstring+' '+Eksps.fieldbyname('Eksp_Header').asstring;
                 IMG_T.Show;
                 Screen.Cursor:=crDefault;
                end;
 end
  else
   showmessage('Не удалось создать образ');
 {Hide;}

{    Last_Theme:=Eksp_ThemeEksp_Theme.Value;
    Last_Eksp:=Eksp_TableEksp_Nomer.Value;
    Last_NB_Page:=OpenEks_NB.PageIndex;
    LastVid_Eksp_RG:=Vid_Eksp_RG.ItemIndex;
}    Screen.Cursor:=crDefault;


//    Last_Theme:=Eksp_ThemeEksp_Theme.Value;
//    Last_Eksp:=Eksp_TableEksp_Nomer.Value;
//    Last_NB_Page:=OpenEks_NB.PageIndex;
//    LastVid_Eksp_RG:=Vid_Eksp_RG.ItemIndex;
end;

procedure TExpForm.InsertCurveSet;
var
 MS,SS,DSS:string[2];
 H,M,S,DS:word;
 i, id:word;
begin
 CurveSet.Close;CurveSet.Open;
 if Signals.RecordCount>0 then
 begin

{ View_Nomer, EKSP_PARENT ,VIEW_THEME ,
    VIEW_DATE    , VIEW_TIME    ,
    VIEW_HEADER  , VIEW_AUTHOR  ,
    LEFT_        , UP           ,
    WIDTH        , HEIGHT       ,
    VIEW_STYLE
 }
 dm.Create_CurveSet.ParamByName('EKSP_Parent').asinteger:=Eksps.fieldbyname('Eksp_Nomer').asinteger;
 dm.Create_CurveSet.ParamByName('View_Theme').asstring:=Eksps.fieldbyname('Eksp_Theme').asstring;
 dm.Create_CurveSet.ParamByName('View_Time').asdatetime:=time;
 dm.Create_CurveSet.ParamByName('View_Date').asdatetime:=now;
 dm.Create_CurveSet.ParamByName('View_header').asstring:=Eksps.fieldbyname('Eksp_theme').asstring+' '+Eksps.fieldbyname('Eksp_header').asstring;
 dm.Create_CurveSet.ParamByName('View_Author').asstring:=Eksps.fieldbyname('Eksp_Author').asstring;
// dm.Create_CurveSet.ParamByName('View_memo').asstring:='';
 dm.Create_CurveSet.ParamByName('View_style').asinteger:=cNoMap_View;
 dm.Create_CurveSet.ParamByName('Left_').asinteger:=10+Random(10);
 dm.Create_CurveSet.ParamByName('Up').asinteger:=10+Random(10);
 dm.Create_CurveSet.ParamByName('Height').asinteger:=400+Random(10);
 dm.Create_CurveSet.ParamByName('Width').asinteger:=600+Random(10);
 dm.Create_CurveSet.ExecProc;
 Id:=dm.Create_CurveSet.ParamByName('ID').asinteger;
 ViewNum:=ID;
(* CurveSet.Append;
 CurveSetView_Header.Value:=EkspsEksp_Header.Value;
{ if MainForm.item_niks.Checked then
   CurveSetView_Header.Value:=DateToStr(Eksp_TableEksp_Date.Value)+' '+
                                   TimeToStr(Eksp_TableEksp_Time.Value)+' '+
                                   Eksp_TableEksp_Header.Value;
} CurveSetView_Date.Value:=Now; CurveSetView_Time.Value:=Time;
 CurveSetView_Author.Value:=EkspsEksp_Author.Value;
 CurveSetView_Theme.Value:=EkspsEksp_Theme.Value;
 CurveSetView_Style.Value:=cNoMap_View;
 CurveSetUp.Value:=10+Random(10);CurveSetLeft_.Value:=10+Random(10);
 CurveSetWidth.Value:=500+Random(10);CurveSetHeight.Value:=320+Random(10);
 CurveSetEksp_Parent.Value:=EkspsEksp_Nomer.Value;
 CurveSet.Post;
*)
 Signals.First;Signals.FetchAll;Signals.First;
// Curve.Close;Curve.Open;
 for i:=0 to Signals.RecordCount-1 do
  begin

   dm.Create_Curve.ParamByName('View_Nomer').Value:= ID;
   dm.Create_Curve.ParamByName('Signal_Nomer').value:= SignalsSignal_Nomer.Value;
   dm.Create_Curve.ParamByName('CurveHeaderShort').value:= copy(SignalsNameY.Value,1,8);
   dm.Create_Curve.ParamByName('CurveHeader').value:= SignalsChanal_Header.Value;
   dm.Create_Curve.ParamByName('PointStart').value:= 0;
   if SignalsPointAll.Value > 30000 then dm.Create_Curve.ParamByName('PointEnd').value:=20000
    else  dm.Create_Curve.ParamByName('PointEnd').value:= SignalsPointAll.Value-1;

//dm.Create_Curve.ParamByName('PointEnd').value:= (SignalsPointAll.Value-1) div 100;


   dm.Create_Curve.ParamByName('ViewMaxX').value:= 0;
   dm.Create_Curve.ParamByName('ViewMaxY').value:= 0;
   dm.Create_Curve.ParamByName('ViewMinY').value:= 0;
   dm.Create_Curve.ParamByName('ViewMinX').value:= 0;
   dm.Create_Curve.ParamByName('bViewMaxMinX').value:= integer(false);
   dm.Create_Curve.ParamByName('bViewMaxMinY').value:= integer(false);
   dm.Create_Curve.ParamByName('bPolyCreate').value:= integer(false);
   dm.Create_Curve.ParamByName('PolyPoint').value:= 0;
//   dm.Create_Curve.ParamByName('PolyFile').value:=  dm.ActiveStoragepath+'cf'+GetGuidStr+'.Dat';
   dm.Create_Curve.ParamByName('PolyFile').value:=  {dm.ActiveStoragepath+}'cf'+GetGuidStr+'.Dat';

   dm.Create_Curve.ParamByName('COlor').value:= Colors[(i mod 16) +1];
   dm.Create_Curve.ParamByName('Style').value:= 1;//LineStyles[(i mod 16)+1];
   dm.Create_Curve.ParamByName('CurveWidth').value:= 2;//LineWidth[(i mod 16)+1];
   dm.Create_Curve.ParamByName('Visible').value:= integer(LineHide[(i mod 16)+1]);
   dm.Create_Curve.ParamByName('ViewPage').value:= 'Все данные';
   dm.Create_Curve.ParamByName('ScaleStyle').value:=2;
   dm.Create_Curve.ParamByName('CurveDate').value:=Now;
   dm.Create_Curve.ParamByName('CurveTime').value:=Time;
   dm.Create_Curve.ParamByName('Slider').value:=0;
   dm.Create_Curve.ParamByName('Mult').value:=1;
   dm.Create_Curve.ParamByName('MultAll').value:=1;
   dm.Create_Curve.ParamByName('pPolyX').value:=longint(nil);
   dm.Create_Curve.ParamByName('pPolyY').value:=longint(nil);
   dm.Create_Curve.ParamByName('AxisXStyle').value:=0;  {абс.время}
   dm.Create_Curve.ParamByName('ColorFon').value:=AppConfig.inifile.ReadInteger('system','FonColor',clskyblue);
   dm.Create_Curve.ParamByName('GridX').value:=0;
   dm.Create_Curve.ParamByName('GridY').value:=0;
   dm.Create_Curve.ExecProc;
   case i of
    0:   dm.Create_Curve.ParamByName('ViewPage').value:= 'часовые данные';
    1:   dm.Create_Curve.ParamByName('ViewPage').value:= 'суточные данные';
   end;
   dm.Create_Curve.ExecProc;
   Signals.Next;
 end;
 dm.Create_CurveSet.Transaction.CommitRetaining;
 curveset.close;
 curveset.open;
 curveset.Locate('view_nomer',id,[])
 end;
end;



procedure TExpForm.btnDeleteCurvesetClick(Sender: TObject);
begin
  inherited;
if allCurveSet_CB.checked then
 begin
 if MessageDlg('Вы действительно хотите удалить ВСЕ графики прибора : ' + eksps.fieldbyname('eksp_Header').AsString + '?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
 dm.q.SQL.Clear;
 dm.q.SQL.add('delete from curveset where eksp_parent = :eksp_parent');
 dm.q.parambyname('eksp_parent').asinteger:=eksps.fieldbyname('Eksp_nomer').Asinteger;
 dm.q.execsql;
 dm.q.Transaction.commitretaining;
 curveset.Close;
 curveset.Open;
 exit;
 end
 else
   if MessageDlg('Вы действительно хотите удалить график прибора ' + curveset.fieldbyname('View_Header').AsString + '/' + eksps.fieldbyname('Eksp_header').AsString + '?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  curveset.Delete;
  eksps.Transaction.CommitRetaining;
end;

procedure TExpForm.cxButton2Click(Sender: TObject);
begin
  inherited;
 if curveset.state = dsEdit then curveset.post;
end;

procedure TExpForm.CurvesetAfterPost(DataSet: TDataSet);
begin
  inherited;
  curveset.Transaction.CommitRetaining;
end;


procedure TExpForm.CurvesetRefresh;
var id:integer;
begin
  inherited;
  id:=curveset.fieldbyname('View_nomer').asinteger;
  curveset.close;
  curveset.open;
  Curveset.locate('View_Nomer',id,[]);
end;

procedure TExpForm.EkspRefresh;
var id:integer;
begin
  inherited;
  if Eksps.active then  id:=Eksps.fieldbyname('Eksp_nomer').asinteger;
  Eksps.close;
  Eksps.open;
  Eksps.locate('Eksp_Nomer',id,[]);
end;

procedure TExpForm.CurvesetAfterOpen(DataSet: TDataSet);
begin
  inherited;
 if dataset.active then
     Curveset_GB.Enabled:=dataset.recordcount>0;
end;

procedure TExpForm.CurvesetVIEW_STYLEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
 case CurvesetVIEW_STYLE.asinteger of
  cNoMap_View: Text:='Исходный образ';
  cTimeMap_View:Text:='Обзорка';
  cFreqMap_View:Text:='Спектральная карта';
  cKxxMap_View:Text:='Корреляционная карта';
  cY_X_View:Text:='Y-X образ';
  cText_View:Text:='Текст'
 end;
end;

procedure TExpForm.FileSourcePropertiesChange(Sender: TObject);
begin
  inherited;
 filesource.Hint:=filesource.Text;
end;

procedure TExpForm.cbDatabasesChange(Sender: TObject);
var
i:integer;
Forms:TList;
begin
  inherited;
  Forms:=TList.create;
  for i:=Application.ComponentCount-1 downto 0 do
    begin
    if (Application.Components[i] is TImageForm )
        then Forms.add(TImageForm(Application.Components[i]));
    if (Application.Components[i] is TTextForm )
        then Forms.add(TTextForm(Application.Components[i]));
    if (Application.Components[i] is TObzorkaForm )
        then Forms.add(TObzorkaForm(Application.Components[i]));
    if (Application.Components[i] is TCursors_Form )
        then Forms.add(TCursors_Form(Application.Components[i]));
   end;

  for i:=0 to Forms.count-1 do
   begin
    TForm(Forms[i]).free;
   end;

   MainForm.ActiveForm  := self;


  dm.ConnectToDatabase(expForm.cbDatabases.itemindex);
  expform.eksps.close;
  expform.eksps.open;
end;

procedure TExpForm.N3Click(Sender: TObject);
var Archievname:string;
begin
  inherited;
  Archievname:='';
  if InputQuery('Задайте имя нового архива экспериментов и сигналов:', 'Имя архива:', ArchievName) then
   begin
//    showmessage(Archievname);
    archievName:=copy(ArchievName,1,64);
    if archievName<>'' then
     begin
      archievName:=replacestr(archievName,' ','_');
      archievName:=replacestr(archievName,'/','_');
      archievName:=replacestr(archievName,'\','_');
      archievName:=replacestr(archievName,'|','_');
      archievName:=replacestr(archievName,':','_');
      archievName:=replacestr(archievName,'*','_');
      archievName:=replacestr(archievName,'?','_');
      archievName:=replacestr(archievName,'"','_');
      archievName:=replacestr(archievName,'<','_');
      archievName:=replacestr(archievName,'>','_');
      if dm.CheckArchievname(archievName) then
       begin
        showmessage('Архив с таким именем уже существует');
        exit;
       end;
//      showmessage('xcopy '+extractFilepath(Application.exename)+'Empty_Base '+dm.basepath+ArchievName+' /E  /I');
      winexec(pchar('xcopy '+extractFilepath(Application.exename)+'Empty_Base '+dm.basepath+ArchievName+' /E  /I'),0);
      dm.databases.Add(ArchievName);
      cbDatabases.items.add(ArchievName);
     end;
   end;


end;

procedure TExpForm.miAboutArchievClick(Sender: TObject);
var
 archeivInfoform:TArchievInfoform;
begin
  inherited;
  archeivInfoform:=TArchievInfoform.create(self);
  archeivInfoform.info.lines.loadFromfile(dm.Activepath+'description.txt');
  archeivInfoform.ArchievName.caption:=cbdatabases.Text;
  if archeivInfoForm.showmodal = mrOk then
   begin
    archeivInfoform.info.lines.savetofile(dm.Activepath+'description.txt');
   end ;
  archeivInfoform.Free;
end;

procedure TExpForm.miClearClick(Sender: TObject);
var filelist:TStringList;
    i:integer;
begin
  inherited;
 qClear.Close;
 qclear.Open;
 filelist:=TStringList.create;
 dm.ScanFiles(dm.ActiveStoragepath,'',Filelist);
 for i:=0 to Filelist.count-1 do
   if not qclear.locate('filename',Filelist[i],[])
//        then deletefile(dm.activestoragepath+Filelist[i]);
        then deletefile(dm.activestoragepath+Filelist[i]);
 filelist.Free;
 qclear.close;
end;

procedure TExpForm.N5Click(Sender: TObject);
begin
  inherited;
 mainform.close;
end;

procedure TExpForm.cxDBImageDblClick(Sender: TObject);
begin
  inherited;
  if  Pictureform=nil then  Application.CreateForm(TPictureform, Pictureform);
 PictureForm.show;
end;

procedure TExpForm.PageControl1Change(Sender: TObject);
begin
  inherited;
 ekspparams.Active:=Pagecontrol1.ActivePage=ImageTab;
 if not ekspparams.active then
  begin
     if Pictureform<>nil then
      pictureform.close;
  end;
end;

procedure TExpForm.btnPrintParamReportClick(Sender: TObject);
var
 HTMLText:string;
 SL:TstringList;
 imageFilename,HTMLFilename,HTMLPath:string;
begin
  inherited;
 if ekspparams.recordcount=0 then exit;
 HTMLPath:=ExtractFilePath(Application.exename)+'HTML\';

 HTMLFilename:=HTMLPath+'HTML_'+GetGuidstr+'.htm';
 HTMLText:=
'<HTML> <HEAD><TITLE>'+Program_Name+', Параметры сигнала '+
  Eksps.fieldbyname('Eksp_Theme').asstring+' '+Eksps.fieldbyname('Eksp_Header').asstring+
  ' </TITLE></HEAD> <BODY>';
  ekspparams.first;                 
  HTMLText:=HTMLText+'<BR><B> '+Eksps.fieldbyname('Eksp_Theme').asstring+' '+
                                  Eksps.fieldbyname('Eksp_Header').asstring+'</B><BR>'+
                       '<BR>';
  while not ekspparams.eof do
   begin
    if ekspparams.fieldbyname('Paramtype').asstring = 'Image' then
     begin
       ImageFilename:=HTMLPath+'image_'+GetGuidstr+'.jpg';
       ekspparamsParamImage.savetofile(ImageFilename);
       HTMLText:=HTMLText+
                 '<BR><B> '+ekspparams.fieldbyname('ParamName').asstring+'<BR></B> '+
                '<BR><IMG SRC = "'+Imagefilename+'" ALT = "'+ekspparams.fieldbyname('ParamName').asstring+'"></B><BR>';
     end;
    if ekspparams.fieldbyname('Paramtype').asstring = 'Number' then
        HTMLText:=HTMLText+'<BR><B> '+ekspparams.fieldbyname('ParamName').asstring+': '+ekspparams.fieldbyname('Paramvalue').asstring+' </B><BR>';
    ekspparams.Next;
   end;
   SL:=TStringList.Create;
   SL.Text:=HTMLText;
   SL.Savetofile(HTMLFileName);
   SL.Free;
   ShellExecute(Application.Handle, nil, pchar(HTMLFilename), nil, nil, SW_SHOW);
end;

procedure TExpForm.deltxDblClick(Sender: TObject);
var
 Freq,Dx:double;
 FreqS:string;
 Bookmark: TBookmark;

begin
  inherited;
  Freq:=1/SignalsDELTX.Value;
  FreqS:=deltx.Text;
  if InputQuery('Задайте частоту дискретизации','Частота дискретизации, Гц', FreqS)
   then
    begin
     try
      freq:=strtofloat(FreqS);
      dx:=1/Freq;
      except  on e:exception  do
       begin
        showmessage('Некорректное значение частоты '+e.message);
        exit;
       end;
      end;
     dm.q.SQL.Clear;
     dm.q.SQL.add(' update signals s set deltx = :deltx  where  s.eksp_nomer = :eksp_nomer');
     dm.q.parambyname('eksp_nomer').asinteger:=eksps.fieldbyname('Eksp_nomer').Asinteger;
     dm.q.parambyname('deltx').asfloat:=dx;
     dm.q.execsql;
     dm.q.Transaction.commitretaining;
     try
     Bookmark:=signals.GetBookmark;
     signals.close;
     signals.open;
     signals.GotoBookmark(Bookmark);
     finally
      signals.FreeBookmark(Bookmark);
    end;
   end;
end;

procedure TExpForm.mishowWinClick(Sender: TObject);
begin
  inherited;
  TForm(Tmenuitem(sender).tag).show;
  TForm(Tmenuitem(sender).tag).WindowState := wsNormal;
end;

procedure TExpForm.ekspsCalcFields(DataSet: TDataSet);
begin
  inherited;
 if ((eksps.FieldByName('modem').asinteger=0) and (eksps.FieldByName('modBus').asinteger=0)
  and (eksps.FieldByName('BLUETOOTH').asinteger=0)) then
  eksps.fieldbyname('Device_interface').asinteger:=0;
 if eksps.FieldByName('modem').asinteger=1 then eksps.fieldbyname('Device_interface').asinteger:=1  ;
 if eksps.FieldByName('modBus').asinteger=1 then eksps.fieldbyname('Device_interface').asinteger:=2  ;
 if eksps.FieldByName('BLUETOOTH').asinteger=1 then eksps.fieldbyname('Device_interface').asinteger:=3  ;
end;

procedure TExpForm.cxGrid1Enter(Sender: TObject);
begin
  inherited;
  if eksps.state = dsEdit then eksps.cancel;
end;

procedure TExpForm.miRefreshClick(Sender: TObject);
begin
  inherited;
 eksps.close;
 eksps.open;
end;

procedure TExpForm.miAddSignurDeviceClick(Sender: TObject);
var
 id:integer;
begin
  inherited;
  AddSignurDeviceForm := TAddSignurDeviceForm.create(self);
  IF AddSignurDeviceForm.showmodal=MRok THEN
  begin
   id:=AddSignurDeviceForm.ID;
   eksps.close;
   eksps.open;
   eksps.Locate('eksp_nomer',id,[]);
  end;
//  windowstate:=wsNormal;
  freeandnil(AddSignurDeviceForm);
end;

procedure TExpForm.N7Click(Sender: TObject);
begin
  inherited;
 PageControl1.ActivePage:=Tabsheet2;
 eksp_header.setfocus
end;

procedure TExpForm.btnEditClick(Sender: TObject);
var
 eksp_Theme:string;
 Eksp_Nomer:integer;
begin
  inherited;

 if eksps.state = dsEdit then     eksps.post;
 eksps.edit;
 eksps.post;
 if bneedrefresh then
   begin
   eksp_Nomer:=eksps.fieldbyname('eksp_Nomer').asinteger;
   eksps.close;
   eksps.open;
   eksps.Locate('eksp_nomer',eksp_nomer,[]);
   end;
  bneedrefresh:=false
end;

procedure TExpForm.objectslistPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  bNeedRefresh:=true;
end;

procedure TExpForm.btnLoadInfoFromDeviceClick(Sender: TObject);
var
 s:string;
 PhoneNmb:string;
 device_Number:Integer;
 DN:Integer;

 i:integer;

 adrlist:TStringList;
 Phone_Nomer:string;

 s15:string;
 ComPort:Byte;

begin
 if rg_Access.itemindex=3 then
  begin
   ShowMessage('Для прибора с доступом через BlueTooth используйте"Импорт с помощью BlueTooth');
   exit;
  end;
 GetHourDayLast;
 if  assigned(MasterNewForm) then  begin MasterNewform.Free;  MasternewForm:=nil; end;
 if  assigned(master2013Form) then  begin master2013Form.Free;  master2013Form:=nil; end;

 if TcxButton(sender).tag=1 then
 begin
  s:=extractfilepath(application.exename)+'GetSignurData.exe '+inttostr(handle);
  winexec(pchar(s), cmdShow);
 end;

  if Eksps.FieldByName('Via_modem').asinteger=1 then         // проверка на возможность работы
                                                             // с подключением нескольких приборов
       begin                                                      // все приборы с этим модемом должны иметь номера не менее 4000
        device_Number :=eksps.fieldbyname('Eksp_Nomer').AsInteger;
        Phone_nomer:=inttostr(eksps.fieldbyname('access').asinteger)+
                      ' '+inttostr(eksps.fieldbyname('tone_pulse').asinteger)+
                      ' '+eksps.fieldbyname('phone_number').asstring;
        eksps.AfterScroll:=nil;
        eksps.DisableControls;
        goodNumbers:=True;
        Eksps.First;
        while not eksps.eof do
        begin
          if ((Eksps.FieldByName('Via_modem').asinteger=1) and
              (Phone_Nomer = inttostr(eksps.fieldbyname('access').asinteger)+
                             ' '+inttostr(eksps.fieldbyname('tone_pulse').asinteger)+' '+
                                       eksps.fieldbyname('phone_number').asstring) )
           then
            goodNumbers:=goodNumbers and (eksps.FieldByName('device_Number').asinteger >=eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger);
          eksps.next;
        end;
        eksps.EnableControls;
        eksps.Locate('Eksp_nomer', device_number,[]);
        eksps.AfterScroll:=ekspsAfterScroll;
        ekspsAfterScroll(nil);
      end;

  if ((Eksps.FieldByName('Via_modem').asinteger=0) and (Eksps.FieldByName('Interface_Mode').asinteger =1 ))
      then                                                   // проверка на возможность работы
                                                             // с подключением нескольких приборов
                                                             // все приборы RS485должны иметь номера не менее 4000
      begin
       device_Number :=eksps.fieldbyname('Eksp_Nomer').AsInteger;
        eksps.AfterScroll:=nil;
        eksps.DisableControls;
        goodNumbers:=True;
        Eksps.First;
        while not eksps.eof do
        begin
          if
           (((Eksps.FieldByName('Via_modem').asinteger=0) and (Eksps.FieldByName('Interface_Mode').asinteger =1 ))

            )

           then
            goodNumbers:=goodNumbers and (eksps.FieldByName('device_Number').asinteger >=eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger);
          eksps.next;
        end;
        eksps.EnableControls;
        eksps.Locate('Eksp_nomer', device_number,[]);
        eksps.AfterScroll:=ekspsAfterScroll;
        ekspsAfterScroll(nil);
      end;

   if  ((Eksps.FieldByName('Via_modem').asinteger=0) and (Eksps.FieldByName('Interface_Mode').asinteger =0 )
                 and (eksps.FieldByName('Device_type').AsInteger = 3) )
      then                                                   // проверка на возможность работы
                                                             // с подключением RS232  c 2-мя каналами
                                                             // прибор должен иметь номер не менее 4000
      begin
       device_Number :=eksps.fieldbyname('Eksp_Nomer').AsInteger;
       goodNumbers:=(eksps.FieldByName('device_Number').asinteger >=eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger);
      end;


 if TcxButton(sender).tag=2 then
 begin
  if  (
       (eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger>0) and
        (eksps.FieldByName('device_Number').asinteger < eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger)
        )
        then
     begin  // РАБОТА СО СТАРЫМ ДРАЙВЕРОМ MasterNew
      if  MasterNewForm=nil then  Application.CreateForm(TMasterNewForm, MasterNewform);
      if MasterNewForm.Id_Device<>eksps.fieldbyname('eksp_nomer').asinteger then
       begin
        MasterNewForm.free;
        Application.CreateForm(TMasterNewForm, MasterNewform);
       end;
      MasterNewForm.InScheduleMode:=false;
      MasterNewForm.Id_Device:=eksps.fieldbyname('eksp_nomer').asinteger;
      MasterNewForm.DeviceType:=eksps.fieldbyname('device_type').asinteger;
      MasterNewForm.pnStatus.Caption:='';
      MasterNewForm.Targethandle:=handle;
      MasterNewForm.Remote:=rg_access.itemindex=1;
    //  MasterNewform.Prm.access:=access.ItemIndex;
      if  ((access.ItemIndex = -1) or  (access.ItemIndex = 10)) then MasterNewform.Prm.access:=0;
      if  (access.ItemIndex in [0,1,2,3,4,5,6,7,8,9]) then  MasterNewform.Prm.access:= access.ItemIndex+1;
      MasterNewForm.Prm.tone:=tone_pulse.itemindex;
      MasterNewform.Prm.PhoneNmb:=phone_number.Text;

      MasterNewForm.btnModem.Visible:= MasterNewForm.Remote ;
      if MasterNewForm.Remote then
        begin
         MasterNewform.Prm.Tone :=tone_pulse.itemindex;
    //     phoneNmb:='                    ';
         PhoneNmb:=phone_number.Text;
         phoneNmb:=delchars(Phonenmb,'-');
         phoneNmb:=delchars(Phonenmb,' ');
         phoneNmb:=delchars(Phonenmb,'.');
         phoneNmb:=delchars(Phonenmb,'(');
         phoneNmb:=delchars(Phonenmb,')');
         MasterNewForm.Prm.phoneNmb:=Phonenmb;
         while length( MasterNewform.prm.PhoneNmb)< 20 do
              MasterNewform.prm.PhoneNmb:= MasterNewform.prm.PhoneNmb+' ';
     //    MasterNewForm.Prm.Access:=access.ItemIndex;
         if  ((access.ItemIndex = -1) or  (access.ItemIndex = 10)) then MasterNewform.Prm.access:=0;
         if  (access.ItemIndex in [0,1,2,3,4,5,6,7,8,9]) then  MasterNewform.Prm.access:= access.ItemIndex+1;
         assignfile(MasterNewForm.ModemFile,'modem');
         rewrite(MasterNewForm.Modemfile);
         write(MasterNewForm.Modemfile,MasterNewform.Prm);
         closefile(MasterNewForm.ModemFile);
         MasterNewForm.btnModem.Visible:= MasterNewForm.Remote ;
        end
         else deletefile('modem');
      MasterNewForm.eksp_nomer:=eksps.fieldbyname('eksp_nomer').asinteger;
      try
       MasterNewForm.show;
       MasterNewForm.InScheduleMode:=InscheduleMode;
       if MasterNewForm.cbAlwaysOnTop.checked then MasterNewForm.FormStyle:=fsStayOnTop
        else MasterNewForm.Formstyle:=fsNormal;
        except

      end  ;  // РАБОТА СО СТАРЫМ ДРАЙВЕРОМ MasterNew окончена
   end;

  if eksps.FieldByName('device_Number').asinteger >= eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger then
  begin   // Работаем с драйвером master2013
   if  master2013Form=nil then  Application.CreateForm(Tmaster2013Form, master2013Form);
   if master2013Form.Id_Device<>eksps.fieldbyname('eksp_nomer').asinteger then
   begin
    master2013Form.free;
    Application.CreateForm(Tmaster2013Form, master2013Form);
   end;

   master2013Form.bArchive_May2011:=false;
   master2013Form.chkPacket_.checked:=false;

   master2013Form.bVia_RS232:=false;
   master2013Form.bVia_RS485:=false;

   
    if ((Eksps.FieldByName('Via_modem').asinteger=0) and (Eksps.FieldByName('Interface_Mode').asinteger in [0,2] )
           and (eksps.FieldByName('Device_type').AsInteger = 3) )     // работа с двухканальным прибором через RS232 без модема
        then
      begin
        master2013Form.bVia_RS232:=True;
        master2013Form.bArchive_May2011:=false;
        device_Number :=eksps.fieldbyname('Eksp_Nomer').AsInteger;
     //   eksps.DisableControls; eksps.AfterScroll:=nil;
        master2013Form.Modbus_Count:=0;  // для определения корректности списка (уникальные адреса modbus в списке)
        adrlist:=TStringList.Create;
        for i:=0 to 1000 do
         begin
           master2013Form.DeviceNumber_set[i]:=-1;master2013Form.Device_addR_set[i]:=-1;
         end;
       master2013Form.Modem_Count:=0;   // для определения размера списка
    //   eksps.First;
       master2013Form.DeviceList.Items.clear;
       master2013Form.lstDeviceList_DeviceType.Items.clear;
       master2013Form.lstDeviceList_ID.Items.clear;
       GoodNumbers:=True;
         begin
              master2013Form.Modem_Count:=master2013Form.Modem_Count+1;
              getHourDayLast;
              master2013Form.HourLast_set[master2013Form.Modem_Count-1]:=hourLast;
              master2013Form.DayLast_set[master2013Form.Modem_Count-1]:=DayLast;
              master2013Form.DeviceNumber_set[master2013Form.Modem_Count-1]:=eksps.fieldbyname('Eksp_Nomer').AsInteger;
              s15:=Trim(eksps.fieldbyname('eksp_header').asstring) ;
              if Length(s15)>15 then s15:=Copy(s15,1,15)+'..';
              while Length(s15)<=20 do s15:=' '+s15;  S15:=S15+' |';
              master2013Form.DeviceList.items.AddObject(' '+s15,TObject(0){strtoint(eksps.fieldbyname('Modbus_address').asstring))});
              master2013Form.lstDeviceListAll.items.AddObject(' '+s15,TObject(0){strtoint(eksps.fieldbyname('Modbus_address').asstring))});
              master2013Form.lstDeviceList_DeviceType.items.AddObject(' '+s15+' '+eksps.fieldbyname('Device_Type').asstring,TObject((eksps.fieldbyname('Device_Type').asinteger)));
              master2013Form.lstDeviceList_ID.items.AddObject(' '+s15+' '+eksps.fieldbyname('eksp_nomer').asstring,TObject((eksps.fieldbyname('Eksp_nomer').asinteger)));
           //   master2013Form.chkPacket_Mode.Enabled:=False;
              master2013Form.ModBus_Count:=master2013Form.Modbus_Count+1;
              master2013Form.addr_set[master2013Form.Modem_Count-1]:=0;//StrToInt(eksps.fieldbyname('Modbus_address').asstring);
              master2013Form.Device_addR_set[master2013Form.Modem_Count-1]:=master2013Form.addr_set[master2013Form.Modem_Count-1];
              GoodNumbers   := GoodNumbers and
                 (eksps.FieldByName('device_Number').asinteger >=eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger);
              if adrlist.IndexOf(eksps.fieldbyname('Modbus_address').asstring)=-1 then
                   adrlist.Add(eksps.fieldbyname('Modbus_address').asstring);
            end;

        eksps.EnableControls;
    //    eksps.Locate('Eksp_nomer', device_number,[]);
        eksps.AfterScroll:=ekspsAfterScroll;
    //    ekspsAfterScroll(nil);

        master2013Form.bBadListContent:=false;
        if (adrlist.Count<>master2013Form.Modem_Count) then
         begin
          master2013Form.bBadListContent:=true;
         end;
        adrlist.Destroy;

        master2013Form.bBadRSCount:=false;
        if (not (master2013Form.ModBus_Count in [master2013Form.Modem_Count-1,master2013Form.Modem_Count])) then
         begin
          // ShowMessage('в список могут быть включены приборы с ModBus  и не более одного прибора с RS-232');
          // exit;
          master2013Form.bBadListContent:=true;
         end;
         // запись файла с адресами

         AssignFile( master2013Form.File_addr_set,'addr_set');   Rewrite(master2013Form.File_Addr_set);
         HourLastMax:=0;DayLastMax:=0;
         for i := 0 to master2013Form.Modem_Count - 1 do
          begin
          Write(master2013Form.File_Addr_set,master2013Form.addr_set[i]);
          if master2013Form.HourLastMax<master2013Form.HourLast_set[i] then HourLastMax:= master2013Form.HourLast_set[i] ;
          if DayLastMax<master2013Form.DayLast_set[i] then DayLastMax:= master2013Form.DayLast_set[i] ;
          end;
         CloseFile(master2013Form.File_Addr_set);

         master2013Form.bArchive_May2011:=True;
         master2013Form.bGoodNumbers:=GoodNumbers;
         master2013Form.StartLargeArchive:= inttostr(eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger);

         master2013Form.HourLastMax:=HourLastMax;
         master2013Form.DayLastMax:=DayLastMax;
         master2013Form.access.ItemIndex:=access.ItemIndex;
         master2013Form.phone_number.text:=phone_number.text;
         master2013Form.rgtone_pulse.itemindex:=tone_pulse.itemindex;
         master2013Form.bVia_RS232:=true;
         master2013Form.bVia_RS485:=false;
         master2013Form.bRS232_2Chan:=True;
         master2013Form.chkPacket_Mode.enabled:=false;    // 2013.11 11         master2013Form.chkPacket_Mode.Checked:=True;
       end;



   if ((Eksps.FieldByName('Via_modem').asinteger=0) and (Eksps.FieldByName('Interface_Mode').asinteger=1))
        then
                       // проверка на возможность работы с подключением
                      // нескольких приборов через RS485 (Modbus)
      begin
        master2013Form.bArchive_May2011:=false;
        device_Number :=eksps.fieldbyname('Eksp_Nomer').AsInteger;
        eksps.DisableControls; eksps.AfterScroll:=nil;
        master2013Form.Modbus_Count:=0;  // для определения корректности списка (уникальные адреса modbus в списке)
        adrlist:=TStringList.Create;
        for i:=0 to 1000 do
         begin
           master2013Form.DeviceNumber_set[i]:=-1;master2013Form.Device_addR_set[i]:=-1;
         end;
       master2013Form.Modem_Count:=0;   // для определения размера списка
       eksps.First;
       master2013Form.DeviceList.Items.clear;
       master2013Form.lstDeviceList_DeviceType.Items.clear;
       master2013Form.lstDeviceList_ID.Items.clear;
       GoodNumbers:=true;
       while not eksps.eof do
       begin
          if   //((Eksps.FieldByName('Via_modem').asinteger=0) and (Eksps.FieldByName('Interface_Mode').asinteger=1))
              (((Eksps.FieldByName('Via_modem').asinteger=0) and (Eksps.FieldByName('Interface_Mode').asinteger =1 ))
            //   or
           //    ((Eksps.FieldByName('Via_modem').asinteger=0) and (Eksps.FieldByName('Interface_Mode').asinteger =0 )
            //     and (eksps.FieldByName('Device_type').AsInteger = 3) )
               )
           then
           begin
              master2013Form.Modem_Count:=master2013Form.Modem_Count+1;
              getHourDayLast;
              master2013Form.HourLast_set[master2013Form.Modem_Count-1]:=hourLast;
              master2013Form.DayLast_set[master2013Form.Modem_Count-1]:=DayLast;
              master2013Form.DeviceNumber_set[master2013Form.Modem_Count-1]:=eksps.fieldbyname('Eksp_Nomer').AsInteger;
              s15:=Trim(eksps.fieldbyname('eksp_header').asstring) ;
              if Length(s15)>15 then s15:=Copy(s15,1,15)+'..';
              while Length(s15)<=20 do s15:=' '+s15;  S15:=S15+' |';
              master2013Form.DeviceList.items.AddObject(' '+s15,TObject(strtoint(eksps.fieldbyname('Modbus_address').asstring)));
              master2013Form.lstDeviceListAll.items.AddObject(' '+s15,TObject(strtoint(eksps.fieldbyname('Modbus_address').asstring)));
              master2013Form.lstDeviceList_DeviceType.items.AddObject(' '+s15+' '+eksps.fieldbyname('Device_Type').asstring,TObject((eksps.fieldbyname('Device_Type').asinteger)));
              master2013Form.lstDeviceList_ID.items.AddObject(' '+s15+' '+eksps.fieldbyname('eksp_nomer').asstring,TObject((eksps.fieldbyname('Eksp_nomer').asinteger)));

               GoodNumbers   := GoodNumbers and
               (eksps.FieldByName('device_Number').asinteger >=eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger);


              master2013Form.ModBus_Count:=master2013Form.Modbus_Count+1;
              master2013Form.addr_set[master2013Form.Modem_Count-1]:=StrToInt(eksps.fieldbyname('Modbus_address').asstring);
              master2013Form.Device_addR_set[master2013Form.Modem_Count-1]:=master2013Form.addr_set[master2013Form.Modem_Count-1];
              if adrlist.IndexOf(eksps.fieldbyname('Modbus_address').asstring)=-1 then adrlist.Add(eksps.fieldbyname('Modbus_address').asstring);
            end;
          eksps.Next;
        end;
        eksps.EnableControls;
        eksps.Locate('Eksp_nomer', device_number,[]);
        eksps.AfterScroll:=ekspsAfterScroll;
        ekspsAfterScroll(nil);

        master2013Form.bBadListContent:=false;
        if (adrlist.Count<>master2013Form.Modem_Count) then
         begin
          // ShowMessage('В список могут быть включены приборы с ModBus  и не более одного прибора с RS-232.  Кроме того, адреса приборов в списке должна быть уникальны');
          // adrlist.Destroy;
          // exit;
          master2013Form.bBadListContent:=true;
         end;
        adrlist.Destroy;

        master2013Form.bBadRSCount:=false;
        if (not (master2013Form.ModBus_Count in [master2013Form.Modem_Count-1,master2013Form.Modem_Count])) then
         begin
          // ShowMessage('в список могут быть включены приборы с ModBus  и не более одного прибора с RS-232');
          // exit;
          master2013Form.bBadListContent:=true;
         end;
         // запись файла с адресами

         AssignFile( master2013Form.File_addr_set,'addr_set');   Rewrite(master2013Form.File_Addr_set);
         HourLastMax:=0;DayLastMax:=0;
         for i := 0 to master2013Form.Modem_Count - 1 do
          begin
          Write(master2013Form.File_Addr_set,master2013Form.addr_set[i]);
          if master2013Form.HourLastMax<master2013Form.HourLast_set[i] then HourLastMax:= master2013Form.HourLast_set[i] ;
          if DayLastMax<master2013Form.DayLast_set[i] then DayLastMax:= master2013Form.DayLast_set[i] ;
          end;
         CloseFile(master2013Form.File_Addr_set);

         master2013Form.bArchive_May2011:=True;

         master2013Form.bGoodNumbers:=GoodNumbers;
         master2013Form.StartLargeArchive:= inttostr(eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger);

         master2013Form.HourLastMax:=HourLastMax;
         master2013Form.DayLastMax:=DayLastMax;
         master2013Form.access.ItemIndex:=access.ItemIndex;
         master2013Form.phone_number.text:=phone_number.text;
         master2013Form.rgtone_pulse.itemindex:=tone_pulse.itemindex;
         master2013Form.bVia_RS485:=true;
         master2013Form.chkPacket_Mode.enabled:=True;    // вернул 2012.01.10
         master2013Form.chkPacket_Mode.Checked:=True;
       end;

   if Eksps.FieldByName('Via_modem').asinteger=1 then         // проверка на возможность работы с подключением
                                                              // нескольких приборов через модем
      begin
        master2013Form.bArchive_May2011:=false;
        master2013Form.chkPacket_Mode.Checked:=False;

        device_Number :=eksps.fieldbyname('Eksp_Nomer').AsInteger;
        Phone_nomer:=inttostr(eksps.fieldbyname('access').asinteger)+
                      ' '+inttostr(eksps.fieldbyname('tone_pulse').asinteger)+
                      ' '+eksps.fieldbyname('phone_number').asstring;
        eksps.DisableControls; eksps.AfterScroll:=nil;
        master2013Form.Modbus_Count:=0;  // для определения корректности списка (уникальные адреса modbus в списке)
        master2013Form.RSCount:=0;  // для определения корректности списка (не более одного прибора с RS232)
        adrlist:=TStringList.Create;
        for i:=0 to 1000 do
         begin
           master2013Form.DeviceNumber_set[i]:=-1;master2013Form.Device_addR_set[i]:=-1;
         end;
       master2013Form.Modem_Count:=0;   // для определения размера списка
       eksps.First;
       master2013Form.DeviceList.Items.clear;
       master2013Form.lstDeviceList_DeviceType.Items.clear;
       master2013Form.lstDeviceList_ID.Items.clear;
       GoodNumbers:=True;
       while not eksps.eof do
       begin
          if ((Eksps.FieldByName('Via_modem').asinteger=1) and
              (Phone_Nomer = inttostr(eksps.fieldbyname('access').asinteger)+
                                ' '+inttostr(eksps.fieldbyname('tone_pulse').asinteger)+
                                ' '+eksps.fieldbyname('phone_number').asstring) )
           then
           begin
              master2013Form.Modem_Count:=master2013Form.Modem_Count+1;
              getHourDayLast;
              master2013Form.HourLast_set[master2013Form.Modem_Count-1]:=hourLast;master2013Form.DayLast_set[master2013Form.Modem_Count-1]:=DayLast;
              master2013Form.DeviceNumber_set[master2013Form.Modem_Count-1]:=eksps.fieldbyname('Eksp_Nomer').AsInteger;
              
              if eksps.FieldByName('interface_mode').asinteger in [0,2] then
               begin
                master2013Form.RSCount:=master2013Form.RsCount+1;
                master2013Form.addr_set[master2013Form.Modem_Count-1]:=0;
                master2013Form.Device_addR_set[master2013Form.Modem_Count-1]:=0;
                s15:=Trim(eksps.fieldbyname('eksp_header').asstring);
                if Length(s15)>15 then s15:=Copy(s15,1,15)+'..';
                while Length(s15)<=20 do s15:=' '+s15;   S15:=S15+' |';
                master2013Form.DeviceList.items.addObject(' '+s15, TObject(0));
                master2013Form.lstDeviceListAll.items.addObject(' '+s15, TObject(0));
                master2013Form.lstDeviceList_DeviceType.items.AddObject(' '+s15+' '+eksps.fieldbyname('Device_Type').asstring,TObject((eksps.fieldbyname('Device_Type').asinteger)));
                master2013Form.lstDeviceList_ID.items.AddObject(' '+s15+' '+eksps.fieldbyname('eksp_nomer').asstring,TObject((eksps.fieldbyname('Eksp_nomer').asinteger)));

                if adrlist.IndexOf('0')=-1 then adrlist.Add('0');
               end;
              if eksps.FieldByName('interface_mode').asinteger =1 then
              begin
                master2013Form.ModBus_Count:=master2013Form.ModBus_Count+1;
                master2013Form.addr_set[master2013Form.Modem_Count-1]:=StrToInt(eksps.fieldbyname('Modbus_address').asstring);
                master2013Form.Device_addR_set[master2013Form.Modem_Count-1]:=master2013Form.addr_set[master2013Form.Modem_Count-1];
                s15:=Trim(eksps.fieldbyname('eksp_header').asstring) ;
                if Length(s15)>15 then s15:=Copy(s15,1,15)+'..';
                while Length(s15)<=20 do s15:=' '+s15; S15:=S15+' |';
                master2013Form.DeviceList.items.addObject(' '+s15,TObject(StrToInt(eksps.fieldbyname('Modbus_address').asstring)));
                master2013Form.lstDeviceListAll.items.addObject(' '+s15,TObject(StrToInt(eksps.fieldbyname('Modbus_address').asstring)));
                master2013Form.lstDeviceList_DeviceType.items.AddObject(' '+s15+' '+eksps.fieldbyname('Device_Type').asstring,TObject((eksps.fieldbyname('Device_Type').asinteger)));
                master2013Form.lstDeviceList_ID.items.AddObject(' '+s15+' '+eksps.fieldbyname('eksp_nomer').asstring,TObject((eksps.fieldbyname('Eksp_nomer').asinteger)));

                 GoodNumbers   := GoodNumbers and
                  (eksps.FieldByName('device_Number').asinteger >=eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger);


                if adrlist.IndexOf(eksps.fieldbyname('Modbus_address').asstring)=-1 then adrlist.Add(eksps.fieldbyname('Modbus_address').asstring);
              end;
           end;
         eksps.Next;
        end;
        eksps.EnableControls;
        eksps.Locate('Eksp_nomer', device_number,[]);
        eksps.AfterScroll:=ekspsAfterScroll;
        ekspsAfterScroll(nil);

        master2013Form.bBadListContent:=false;
        if (adrlist.Count<>master2013Form.Modem_Count) then
         begin
          // ShowMessage('В список могут быть включены приборы с ModBus  и не более одного прибора с RS-232.  Кроме того, адреса приборов в списке должна быть уникальны');
          // adrlist.Destroy;
          // exit;
          master2013Form.bBadListContent:=true;
         end;


        master2013Form.bBadRSCount:=false;
        if (not (master2013Form.RSCount in [0,1])) then
         begin
        //   ShowMessage('В список приборов может входить не более одного прибора с RS-232');
         //  exit;
             master2013Form.bBadRSCount :=true;
         end;

         if (not (master2013Form.ModBus_Count in [master2013Form.Modem_Count-1,master2013Form.Modem_Count])) then
         begin
          // ShowMessage('в список могут быть включены приборы с ModBus  и не более одного прибора с RS-232');
          // exit;
          master2013Form.bBadListContent:=true;
         end;

        AssignFile( master2013Form.File_addr_set,'addr_set');   Rewrite(master2013Form.File_Addr_set);
        HourLastMax:=0;DayLastMax:=0;
         for i := 0 to master2013Form.Modem_Count - 1 do
          begin
          Write(master2013Form.File_Addr_set,master2013Form.addr_set[i]);
          if HourLastMax<master2013Form.HourLast_set[i] then HourLastMax:= master2013Form.HourLast_set[i] ;
          if DayLastMax<master2013Form.DayLast_set[i] then DayLastMax:= master2013Form.DayLast_set[i] ;
          end;
         CloseFile(master2013Form.File_Addr_set);

         master2013Form.bArchive_May2011:=True;
         master2013Form.chkPacket_Mode.enabled:=true;// вернул 2012.01.10
         master2013Form.chkPacket_Mode.Checked:=true;// вернул 2012.01.10
         master2013Form.bGoodNumbers:=GoodNumbers;
         master2013Form.StartLargeArchive:= inttostr(eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger);

         master2013Form.HourLastMax:=HourLastMax;
         master2013Form.DayLastMax:=DayLastMax;
         master2013Form.access.ItemIndex:=access.ItemIndex;
         master2013Form.phone_number.text:=phone_number.text;
         master2013Form.rgtone_pulse.itemindex:=tone_pulse.itemindex;
         master2013Form.bVia_RS232:=true;
       end;



   master2013Form.Targethandle:=handle;
   master2013Form.Id_Device:=eksps.fieldbyname('eksp_nomer').asinteger;
   master2013Form.DeviceType:=eksps.fieldbyname('device_type').asinteger;
   master2013Form.eksp_nomer:=eksps.fieldbyname('eksp_nomer').asinteger;
   master2013Form.HourLast:=HourLast;
   master2013Form.DayLast:=DayLast;
   if  master2013Form.HourLastMax=0 then
     master2013Form.HourLastMax:=master2013Form.HourLast;
   if  master2013Form.DayLastMax=0 then
     master2013Form.DayLastMax:=master2013Form.DayLast;


   try
     master2013Form.BtnLocal.visible:=True;
     master2013Form.BtnModem.visible:=false;
     master2013Form.BtnModBus.visible:=false;
     master2013Form.BtnPrm.visible:=false;

     master2013Form.show;

     master2013Form.InScheduleMode:=InscheduleMode;
     master2013Form.btnLocalClick(Self);
     if cbVia_Modem.checked then
     begin
      AssignFile(master2013Form.FprmMD,master2013Form.path+REM_CONN_FILENAME);
      Rewrite(master2013Form.FprmMD);
      PhoneNmb:=phone_number.Text;
      phoneNmb:=delchars(Phonenmb,'-');
      phoneNmb:=delchars(Phonenmb,' ');
      phoneNmb:=delchars(Phonenmb,'.');
      phoneNmb:=delchars(Phonenmb,'(');
      phoneNmb:=delchars(Phonenmb,')');
      master2013Form.Prm.phoneNmb:=Phonenmb;
//     master2013Form.Prm.Access:=access.ItemIndex;
      if  ((access.ItemIndex = -1) or  (access.ItemIndex = 10)) then master2013form.Prm.access:=0;
      if  (access.ItemIndex in [0,1,2,3,4,5,6,7,8,9]) then  master2013form.Prm.access:= access.ItemIndex+1;
      prmMD.Tone := Tone_Pulse.ItemIndex=1;        //импульс-тон
      prmMD.PhoneNmb := Phonenmb;       // номер
      while length(prmMD.PhoneNmb)< 20 do
         prmMD.PhoneNmb:=prmMD.PhoneNmb+' ';
      while length( master2013form.prm.PhoneNmb)< 20 do
          master2013form.prm.PhoneNmb:= master2013form.prm.PhoneNmb+' ';
//      prmMD.Access := access.ItemIndex;         //выход в город
      if  ((access.ItemIndex = -1) or  (access.ItemIndex = 10)) then prmMD.access:=0;
      if  (access.ItemIndex in [0,1,2,3,4,5,6,7,8,9]) then  PrmMD.access:= access.ItemIndex+1;
      Write(master2013Form.FprmMD,prmMD);
      CloseFile(master2013Form.FprmMD);
      master2013Form.BtnLocal.visible:=false;
      master2013Form.BtnModem.visible:=true;
      master2013Form.BtnModBus.visible:=false;
      master2013Form.BtnPrm.visible:=false;
      master2013Form.btnModemClick(Self);
    end;
    if rg_access.itemindex=1 then
    begin
      AssignFile(master2013Form.FprmMB,master2013Form.path+MB_CONN_FILENAME);
      Rewrite(master2013Form.FprmMB);
      prmMB.Addr := ModBus_Address.Value;              //адрес
      prmMB.Bdr := cxBdr.ItemIndex;               //скорость
      prmMB.Parity :=Parity.ItemIndex;            //контрольный бит не используется
      Write(master2013Form.FprmMB,prmMB);
      CloseFile(master2013Form.FprmMB);
      master2013Form.BtnLocal.visible:=false;
      master2013Form.BtnModem.visible:=false;
      master2013Form.BtnModBus.visible:=true;
      master2013Form.BtnPrm.visible:=false;
      master2013Form.btnModBusClick(Self)
    end;
    master2013Form.lstDeviceListAll.Items.Assign(master2013Form.DeviceList.Items);
    master2013Form.Eksp_Header:=eksps.fieldbyname('eksp_header').asstring;
    master2013Form.chkPacket_.Checked:=master2013Form.chkPacket_Mode.Checked;
    master2013Form.chkPacket_Mode.OnClick:=master2013Form.chkPacket_ModeClick;
    master2013Form.OnShow(nil);
    if master2013Form.cbAlwaysOnTop.checked then master2013Form.FormStyle:=fsStayOnTop
       else master2013Form.Formstyle:=fsNormal;
     except
    end
   end  ;

  end;
end;



procedure TExpform.WMCopyData(var m : TMessage);
Var
    FName:string;
    CD:TCopyDataStruct;
    RecToTransfer:TRecToTransfer;
    s:string;
    ID:integer;
  nPoints:integer;
  FDD: TFileStream;
  i,j:integer;
  LastValue:double;
  maxDt,minDt,dt1,dt2:tDatetime;
  maxHt,minHt:tDatetime;
  DataSingle_D: array of single;
  DataSingle_H: array of single;

  Current_Eksp_Nomer, eksp_nom_fromDevice:integer;
begin

 CD:=PCopyDataStruct(m.LParam)^;

 currentnOMER:=-1;

try
// Eksps.DisableControls;
 RecToTransfer.fname:=PRecToTransfer(cd.lpData)^.fname;
 RecToTransfer.otherdata:=PRecToTransfer(cd.lpData)^.otherdata;
 RecToTransfer.typeoffile:=PRecToTransfer(cd.lpData)^.TypeOffile;
 RecToTransfer.mult_k:=PRecToTransfer(cd.lpData)^.mult_k;
 Fname:=PRecToTransfer(PCopyDataStruct(m.LParam)^.lpData)^.fname;
 eksp_nom_fromDevice:=PRecToTransfer(PCopyDataStruct(m.LParam)^.lpData)^.otherData;
 Current_eksp_Nomer:=Eksps.fieldbyname('eksp_nomer').asinteger;
 eksp_for_load.Close;
 eksp_for_load.ParamByName('eksp_nomer').asinteger:= eksp_nom_fromDevice;
 eksp_for_load.Open;
      except  on e:exception  do
       begin
        showmessage('Некорректный обмен данными (прием файла обмена)'+e.message);
         Eksps.EnableControls;
        exit;
       end;
 end;

if recToTransfer.typeoffile=0 then
 begin    // в файле сразу все архивы (старый драйвер).
    try
     Import_Signur_Form:=TImport_Signur_Form.create(self);
     Import_Signur_Form.fname:=fname;
     Import_Signur_Form.caption:=fname;
     Import_Signur_Form.Device_type:=eksp_for_load.fieldbyname('Device_type').asinteger;
     Import_Signur_Form.eksp_nomer:=eksp_for_Load.fieldbyname('eksp_Nomer').asinteger;

     Import_Signur_Form.miloadDataclick(nil);
     dm.q.Transaction.commitretaining;
           except  on e:exception  do
           begin
            showmessage('Некорректный прием данных Сигнур (Import_Signur) '+e.message);
            dm.q.Transaction.RollbackRetaining;
            Eksps.EnableControls;
           end;
          end;
     Import_Signur_Form.free;
 end;



if recToTransfer.typeoffile in [1,2,3,4,5] then
 begin    // в файле почасовые данные
 // Panel4.Caption:='Пришел файл  данных'+fname;
    try
     Import_Signur_Form2:=TImport_Signur_Form2.create(self);
     Import_Signur_Form2.fname:=fname;

     Import_Signur_Form2.Device_type_string:=eksp_for_load.fieldbyname('Device_Name').asstring;
     Import_Signur_Form2.Device_type:=eksp_for_load.fieldbyname('Device_type').asinteger;
     Import_Signur_Form2.eksp_nomer:=eksp_for_Load.fieldbyname('eksp_Nomer').asinteger;
     Import_Signur_Form2.typeoffile :=recToTransfer.typeoffile   ;
     Import_Signur_Form2.Channel :=Current_Channel ;
     Import_Signur_Form2.mult_k :=recToTransfer.mult_k ;
     Import_Signur_Form2.HourLast :=recToTransfer.Hourlast;
     Import_Signur_Form2.DayLast :=recToTransfer.Daylast;
     Import_Signur_Form2.miloadDataclick(nil);
        dm.q.Transaction.CommitRetaining;
           except  on e:exception  do
           begin
             dm.q.Transaction.RollbackRetaining;
            showmessage('Некорректный прием данных Сигнур (Import_Signur_2) '+e.message);
            Eksps.EnableControls;
           end;
          end;
     Import_Signur_Form2.free;
 end;

 if ( (recToTransfer.typeoffile =0) or
 //      (recToTransfer.typeoffile in[4,5]))  then      //коррекция файлов gemis
       (recToTransfer.typeoffile in[1,2,3,4,5]))  then      //коррекция файлов gemis
 begin

    try
    Panel1.Caption:='Обновление данных';
    ChartPC.Visible:=False;
    Update;
    Archieve_Reopen (Eksp_Nom_FromDevice);

    id:=Eksp_Nom_FromDevice;

    Daysdata.last;
    dm.q.SQL.Clear;
    dm.q.SQL.add(' update eksp set eksp_date = :eksp_Date, eksp_Time = :eksp_Time '+
                  ' where eksp_Nomer = :eksp_Nomer');
    // выбор дат начала и конца, опираясь на DaysData
     dt1:=daysdata.fieldbyname('day_value').asdatetime;
     DaysData.First;
     dt2:=daysdata.fieldbyname('day_value').asdatetime;
     maxDt:=max(dt1,dt2)+1;
     minDt:=min(dt1,dt2);

    // выбор дат начала и конца, опираясь на HoursData  (могут отличаться от DaysData)
     HoursData.last;
     dt1:=Hoursdata.fieldbyname('hour_value').asdatetime;
     HoursData.First;
     dt2:=Hoursdata.fieldbyname('hour_value').asdatetime;
     maxHt:=max(dt1,dt2)+1;
     minHt:=min(dt1,dt2);

    //выбор дат начала и конца,
     MaxDt:=max(MaxDT,MaxHT);
     MinDt:=min(MinDT,MinHT);
     if minDt=0 then MinDt:=MaxDt-31;

     dm.q.paramByName('eksp_date').asdatetime:=minDt;
     dm.q.paramByName('eksp_time').asdatetime:=encodetime(0,0,0,0);
     dm.q.paramByName('eksp_nomer').asinteger:=id;
     dm.q.ExecSQL;
     dm.q.Transaction.CommitRetaining;


    if (not eksps.Active) then
       eksps.open;
     eksps.Locate('eksp_nomer',id,[]);
//       eksps.enablecontrols;

     dm.q.SQL.Clear;
     dm.q.SQL.add(' update signals set PointAll = :PointAll, '+
                  ' Date_Start = :date_Start, Time_Start = :Time_start, '+
                  ' dateTimestart=:dateTimestart '+
                  ' where signal_Nomer = :signal_Nomer');

     signals.first;
     NPoints:=trunc((maxDt-minDt)*3600*24/signals.fieldbyname('deltx').asfloat)+1;
     dm.q.parambyname('signal_Nomer').asinteger:=Signals.fieldbyname('Signal_Nomer').asinteger;
     dm.q.parambyname('PointAll').asinteger:=NPoints;
     dm.q.parambyname('Date_Start').asDatetime:=minDt;//trunc(eksps.fieldbyname('Datetime_start').asdatetime);
     dm.q.parambyname('Time_Start').asDatetime:=0;//eksps.fieldbyname('Datetime_start').asdatetime-trunc(eksps.fieldbyname('Datetime_start').asdatetime);
     dm.q.parambyname('DateTimeStart').asfloat:=dm.q.parambyname('Date_Start').asDatetime{+dm.q.parambyname('Time_Start').asDatetime};
     dm.q.execsql;

     setlength(DataSingle_H, NPoints+1);
     deletefile(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring);
     for i:=0 to NPoints-1 do DataSingle_H[i]:=0;

     HoursData.DisableControls;
     HoursData.first;
     while not Hoursdata.eof do
      begin
       j:=round
        ( {1+}
        (HoursData.fieldbyname('Hour_Value').asfloat-dm.q.parambyname('Date_Start').asfloat)*24.0
         );

        if ((j >=0) and (j<= NPoints)) then
          DataSingle_H[j]:=HoursData.fieldbyname('D_Value').asfloat;
       HoursData.Next;
      end;
     HoursData.EnableControls;

     FDD := TFileStream.Create(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring, fmCreate);
     FDD.write(datasingle_H[0], sizeof(DataSingle_H) * NPoints);
     FDD.destroy;

     signals.Next;
     NPoints:=1+trunc((maxDt-
         trunc(minDt))*3600*24/signals.fieldbyname('deltx').asfloat);
     dm.q.parambyname('signal_Nomer').asinteger:=Signals.fieldbyname('Signal_Nomer').asinteger;
     dm.q.parambyname('PointAll').asinteger:=NPoints;
     dm.q.parambyname('Date_Start').asDatetime:=minDt;//trunc(eksps.fieldbyname('Datetime_start').asdatetime);
     dm.q.parambyname('Time_Start').asDatetime:=0;//eksps.fieldbyname('Datetime_start').asdatetime-trunc(eksps.fieldbyname('Datetime_start').asdatetime);
     dm.q.parambyname('DateTimeStart').asfloat:=dm.q.parambyname('Date_Start').asDatetime{+dm.q.parambyname('Time_Start').asDatetime};
     dm.q.execsql;


     setlength(DataSingle_D, NPoints+1);
     deletefile(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring);
     for i:=0 to NPoints-1 do DataSingle_D[i]:=0;

     DaysData.DisableControls;
     DaysData.first;
     while not Daysdata.eof do
      begin
       j:={1+}round
        (
        (DaysData.fieldbyname('Day_Value').asfloat-dm.q.parambyname('Date_Start').asfloat)
         );
        if ((j >=0) and (j<= NPoints)) then
           DataSingle_D[j]:=DaysData.fieldbyname('D_Value').asfloat;
       DaysData.Next;
      end;
     Daysdata.EnableControls;

     FDD := TFileStream.Create(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring, fmCreate);
     FDD.write(datasingle_D[0], sizeof(DataSingle_D) * NPoints);

     FDD.destroy;

     dm.q.Transaction.commitretaining;

        except  on e:exception  do
           begin
            showmessage('Некорректная обработка принятых данных '+e.message);
            Eksps.EnableControls;
    //        exit;
           end;

      end;  //try
        
    Panel1.Caption:='';
    ChartPC.Visible:=True;
    Update;
 end;
end;

procedure TExpForm.OnOffGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
{  if OnOffGrid.DataSource.DataSet.active then
   begin
    if OnOffGrid.DataSource.DataSet.fieldbyname('status').asinteger=0 then
      background := clsilver
   end
}end;

procedure TExpForm.DD1Change(Sender: TObject);
begin
  inherited;
 HOURSDATA_F.CLOSE;    DaysData_F.CLOSE;
 Archieve_Reopen(eksps.fieldbyname('eksp_Nomer').asinteger);
 ArchievPCChange(NIL);
end;

procedure TExpForm.Archieve_Reopen(eksp_Nomer:integer);
begin
 try
 bneedchart:=false;

 DaysData_f.disablecontrols;
 HoursData_F.DisableControls;
 OnOff.DisableControls;

   IF eksp_nomer<>currentnOMER then
    begin
     DaysData_F.close;
     HoursData_F.close;
    end;

 if (
 (DaysData_f.parambyname('DD1').AsDate<>trunc(dd1_D.date)
  ) or
 (DaysData_f.parambyname('DD2').AsDate<>trunc(dd2_D.date))
 )
  THEN DaysData_F.close;

 IF not DaysData_F.Active  then
      begin
        DaysData_F.parambyname('Eksp_Nomer_in').asinteger:=Eksp_Nomer;
        DaysData_f.parambyname('DD1').asdatetime:=trunc(dd1_D.date);
        DaysData_f.parambyname('DD2').asdatetime:=trunc(dd2_D.date);//+1;
        DaysData_F.open;
      end;
(* DaysData_F.close;
 DaysData_F.parambyname('Eksp_Nomer').asinteger:=Eksp_Nomer;
 DaysData_f.parambyname('DD1').asdatetime:=trunc(dd1_D.date);
 DaysData_f.parambyname('DD2').asdatetime:=trunc(dd2_D.date)+1;
 DaysData_F.open;
*)

 if (
 (HoursData_f.parambyname('DD1').AsDate<>trunc(dd1_h.date)
  ) or
 (hOURSData_f.parambyname('DD2').AsDate<>(trunc(dd2_h.date)+1))
 )
  THEN HoursData_F.close;

 
 IF not hOURSData_F.Active  then
      begin
   //HoursData_F.close;
  HoursData_F.parambyname('Eksp_Nomer_IN').asinteger:=eksp_Nomer;
  HoursData_f.parambyname('DD1').asdatetime:=trunc(dd1_H.date);
  HoursData_f.parambyname('DD2').asdatetime:=trunc(dd2_H.date)+1;
  HoursData_F.open;
   end;

 OnOff_new.close;
 OnOff_new.open;
 Hours_chart.bottomaxis.Automatic:=true;
 Days_chart.bottomaxis.Automatic:=true;
 bneedchart:=true;
 finally
  DaysData_f.enablecontrols;
  HoursData_F.enableControls;
  OnOff_new.enableControls;
  bneedchart:=true;
 end;
 SpeedButton2Click(nil);

end;

procedure TExpForm.ds_eksp_themeDataChange(Sender: TObject; Field: TField);
var
  FTP_PASSWORD:Integer;
  FTP_CODE:Integer;
  current_number:integer    ;
begin

  currentnOMER:=-1;//eksps.fieldbyname('eksp_NOMER').asINTEGER;
   inherited;
 pgcDayData.Visible:= eksps.FieldByName('Device_type').asinteger=3;
 pgcHourData.Visible:= eksps.FieldByName('Device_type').asinteger=3;
 if eksps.FieldByName('Device_type').asinteger<>3 then
  begin
   pgcDayData.ActivePageIndex:=0;
   pgcHourData.ActivePageIndex:=0;
  end;
  currentObject:=eksps.fieldbyname('eksp_theme').asstring;
  currentnOMER:=eksps.fieldbyname('eksp_NOMER').asINTEGER;


  current_number:=eksps.fieldbyname('device_number').asINTEGER;
  FTP_CODE := round(ln(ln(current_number+3))*10000000) mod 10000 ;

    if FTP_Code<10 then ftp_code:=ftp_code+1000
    else
     begin
       if FTP_Code<100 then ftp_code:=ftp_code+2000
        else
         begin
          if FTP_Code<1000 then ftp_code:=ftp_code+3000

         end  ;
     end;    
  FTP_PASSWORD:=eksps.fieldbyname('FTP_PASSWORD').asINTEGER;

   MainForm.btnLoadFTP.Visible:=FTP_CODE=FTP_PASSWORD;
   N16.Visible:= FTP_CODE=FTP_PASSWORD;


 mousePanel.Caption:='';mousePanel.Update;
End;



procedure TExpForm.OnOFF_FAfterOpen(DataSet: TDataSet);
var
 Start,DT2:tDatetime;
 i,status:integer;
begin
  inherited;
 OnOff_Info.Text:='';
 OnOff_VT.disablecontrols;
 S_Off:=0;
 S_On:=0;
 s_Total:=0;

 OnOff.first;
 On_VT.Active:=true;    On_VT.Clear;
 Off_VT.Active:=true;   Off_VT.Clear;
 while not OnOff.eof do
   begin
    status:=OnOff.FieldByName('status').asinteger;
    case status of
        0: Off_VT.AppendRecord([OnOff.fieldbyname('OnOff_Event').asdatetime,0,
                                OnOff.fieldbyname('LastEvent').asdatetime,
                                OnOff.fieldbyname('On_Off_Reason_int').value]);
        1:  On_VT.AppendRecord([OnOff.fieldbyname('OnOff_Event').asdatetime,1,OnOff.fieldbyname('LastEvent').asdatetime]);
    end;
    OnOff.next;
  end;

  OnOff_VT.Active:=true;    OnOFF_VT.Clear;
  On_VT.first;Off_VT.first;
  while not ON_VT.EOF do
     begin
     if (On_VT.fieldbyname('OnOff_Event').asdatetime <
                    Off_VT.fieldbyname('OnOff_Event').asdatetime) then
       begin
        OnOff_VT.AppendRecord([Off_VT.fieldbyname('OnOff_Event').asdatetime,0,
                               On_VT.fieldbyname('LastEvent').asdatetime,
                               Off_VT.fieldbyname('Off_Reason_int').value]);
        OnOff_VT.AppendRecord([On_VT.fieldbyname('OnOff_Event').asdatetime,1,
                               Off_VT.fieldbyname('LastEvent').asdatetime]);
       end
       else
       begin
        OnOff_VT.AppendRecord([On_VT.fieldbyname('OnOff_Event').asdatetime,1,On_VT.fieldbyname('LastEvent').asdatetime]);
        OnOff_VT.AppendRecord([Off_VT.fieldbyname('OnOff_Event').asdatetime,0,
                               Off_VT.fieldbyname('LastEvent').asdatetime,
                               Off_VT.fieldbyname('Off_Reason_Int').value]);
       end;
      ON_VT.next;
      Off_VT.next;
     end;

     if not OFF_VT.EOF then
       OnOff_VT.AppendRecord([Off_VT.fieldbyname('OnOff_Event').asdatetime,
                              0,Off_VT.fieldbyname('LastEvent').asdatetime,
                               Off_VT.fieldbyname('Off_Reason_Int').value]);

    OnOff_VT.first;
 (*   19.12.2008
   OnOFF_VT_chart.Active:=true;      OnOff_VT_Chart.Clear;

    i:=1;
    while not OnOff_VT.eof do
      begin
       status:=OnOff_VT.FieldByName('status').asinteger;
       if status=0 then
        begin
         OnOff_VT_Chart.AppendRecord([OnOff_VT.fieldbyname('OnOff_Event').asdatetime+2/3600/24/i,0]);
         OnOff_VT_Chart.AppendRecord([OnOff_VT.fieldbyname('OnOff_Event').asdatetime+1/3600/24/i,1]);
        end;
       if status=1 then
        begin
         OnOff_VT_Chart.AppendRecord([OnOff_VT.fieldbyname('OnOff_Event').asdatetime+2/3600/24/i,1]);
         OnOff_VT_Chart.AppendRecord([OnOff_VT.fieldbyname('OnOff_Event').asdatetime+1/3600/24/i,0]);
        end;
       OnOff_VT.next;
       i:=i+1;
    end;
   OnOff_VT.first;
 *)
 OnOff.Last;
 Start:=OnOff.fieldbyname('OnOff_Event').asdatetime;
 while not OnOff.BOF do
  begin
   status:=OnOff.FieldByName('status').asinteger;
   if status=1 then
    begin
     OnOff.prior;
     DT2:=OnOff.fieldbyname('OnOff_Event').asdatetime;
     S_on:=S_On+(dt2-start);
    end;
   if status=0 then
    begin
     OnOff.prior;
     DT2:=OnOff.fieldbyname('OnOff_Event').asdatetime;
     S_off:=S_off+(dt2-start);
    end;
   s_total:=s_total+(dt2-start);
   start:=dt2;
  end;

 OnOff_VT.Enablecontrols;
 if s_Total=0 then OnOff_Info.Text:=''
  else
  begin
   OnOff_info.lines.add('общее время: '+formatfloat('0.00',s_total)+' суток');
   OnOff_info.lines.add(' в т.ч. время включений: '+formatfloat('0.00',s_On)+' суток ('+formatfloat('0.00',S_on/S_Total*100)+'%)');
   OnOff_info.lines.add(' в т.ч. время выключений: '+formatfloat('0.00',s_Off)+' суток ('+formatfloat('0.00',S_off/S_Total*100)+'%)');
  end;
// onOff_VT.active:=true;

(* 19.12.2008 OnOff_Hours_chart.RefreshDataset(ONOFF_VT_chart,OnOff_Hours_chart.Series[0]);
 OnOff_Days_chart.RefreshDataset(ONOFF_VT_chart,OnOff_Days_chart.Series[0]);
  *)
end;

procedure TExpForm.btnCreateHTMLReportClick(Sender: TObject);
var
  HTML: TStringList;
  i:integer;
  HTMLFileName:string;
 function SpaceReplace(Value: string): string;
  begin
    if Value <> '' then
      Result := Value
    else
      Result := '&nbsp;';
  end;
 function CreateHtmlReportHeader(ReportHeader:string;Grid:TDBGridEh): string;
  var
    I: Integer;
      summa_d:double;
  begin
//    HTML := TStringList.create;
    try
      HTML.Add('<HTML><HEAD><TITLE>');
      HTML.Add(ReportHeader);
      HTML.Add('</TITLE><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"><HEAD>');
      HTML.Add('<BODY>');
 {     HTML.Add(ReportHeader+'<BR>');
      HTML.Add('<BR>');
      HTML.Add('Объект:  ' + eksps.fieldbyname('EKSP_Theme').text + '<BR>');
      HTML.Add('Примечание к объекту:  ' + cxObjectMemo.text + '<BR><BR>');
      HTML.Add('<BR>');
      HTML.Add('Прибор: ' + eksps.FieldByName('Device_Name').asstring+'  '+eksps.FieldByName('eksp_header').asstring+'<BR>');
      HTML.Add('Ответственный: ' + eksps.FieldByName('eksp_author').text+'<BR>');
      HTML.Add('Примечание к прибору:' + cxDeviceMemo.text+'<BR>');
      HTML.Add('Интервал запроса к архиву данных: c ' + formatdatetime('dd.mm.yyyy',dd1.Date)+' по '+
                                                        formatdatetime('dd.mm.yyyy',dd2.Date)+'<BR>');
      HTML.Add('<BR>');
  }    HTML.Add('<BR>  Отчет по прибору '+eksps.fieldbyname('Device_Name').text+
                                          '   № '+eksps.fieldbyname('Device_Number').text+' '+
                                          eksps.fieldbyname('Eksp_Header').text+'<BR>');
       if trim(cxDeviceMemo.text)<>'' then HTML.Add('     Примечание к прибору:  ' + cxDeviceMemo.text + '<BR>');
       if (trim(eksps.fieldbyname('EKSP_Theme').text)+trim(cxObjectMemo.text)<>'') then
        begin
         HTML.Add('<BR>');
         HTML.Add('Прибор установлен на объекте:  ' + eksps.fieldbyname('EKSP_Theme').text + '<BR>');
         if trim(cxObjectMemo.text)<>'' then HTML.Add('     Примечание к объекту:  ' + cxobjectMemo.text + '<BR>');
        end;
     if Grid=OnOffGrid then   HTML.Add('<BR> За период c ' + formatdatetime('dd.mm.yyyy',dd1_OnOFF.Date)+' по '+
                                                        formatdatetime('dd.mm.yyyy',dd2_OnOFF.Date)+' 00:00 <BR>');
     if Grid=DaysGrid then
      begin

       HTML.Add('<BR> За период c ' + formatdatetime('dd.mm.yyyy',dd1_D.Date)+' по '+
                                                        formatdatetime('dd.mm.yyyy',dd2_D.Date)+'  <BR>');

    //       HTML.Add('<BR> За период c ' + formatdatetime('dd.mm.yyyy',dd1_D.Date)+' 00:00  по '+
    //                                                    formatdatetime('dd.mm.yyyy',dd2_D.Date+1)+' 00:00  <BR>') ;



        if eksps.FieldByName('device_type').asinteger=3 then
                HTML.Add('<BR>Данные по каналу '+ IntToStr(pgcDayData.ActivePageIndex+1)+'<BR>');
      end;
     if Grid=HoursGrid then
      begin
      HTML.Add('<BR> За период c ' + formatdatetime('dd.mm.yyyy',dd1_H.Date)+' по '+
                                                        formatdatetime('dd.mm.yyyy',dd2_H.Date+1)+' 00:00 <BR>');
      if eksps.FieldByName('device_type').asinteger=3 then
                HTML.Add('<BR>Данные по каналу '+ IntToStr(pgcHourData.ActivePageIndex+1)+'<BR>');
      end;
     if Grid<>OnOffGrid then
      begin
        Grid.DataSource.DataSet.DisableControls;
        Grid.DataSource.DataSet.First;
        summa_D:=Grid.DataSource.DataSet.fieldbyname('s_Value').asfloat;
        Grid.DataSource.DataSet.last;

       { while not Grid.DataSource.DataSet.eof do
         begin
          summa_d:=summa_d+Grid.DataSource.DataSet.fieldbyname('D_Value').asfloat;
          Grid.DataSource.DataSet.Next;
         end;  }
        Grid.DataSource.DataSet.EnableControls;
        HTML.Add('<BR>Учтенный объем за период '+ formatfloat('0.000',Summa_d-Grid.DataSource.DataSet.fieldbyname('s_Value').asfloat) + ' куб.м <BR><BR>');

      end  ;

     finally
      result := html.Text;
    end;
  end;

  function CreateHtmlReportTable_Values(Grid:TDBGridEh): string;
  var
    I: Integer;
    summa_d:double;
  begin
    try
//      HTML.Add('<P><table border=1 cellspacing=0 cellpadding=2 bordercolor=#808080 width="100%">');
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
              begin
              if ((Grid = HoursGrid) or (Grid=OnOffGrid)) then
              HTML.Add(Format('<TD align=center nowrap> %s</TD>',
               [formatdatetime('dd.mm.yyyy hh:mm', Grid.DataSource.DataSet.fieldbyname(Grid.columns[i].fieldname).asdatetime)]))
               else
                HTML.Add(Format('<TD align=center nowrap> %s</TD>',
                [formatdatetime('dd.mm.yyyy 00:00', Grid.DataSource.DataSet.fieldbyname(Grid.columns[i].fieldname).asdatetime)]));
               //HTML.Add(Format('<TD align=center nowrap> %s</TD>',
               //[SpaceReplace(Grid.DataSource.DataSet.fieldbyname(Grid.columns[i].fieldname).AsString)]));
               end;
             if Grid.Columns[i].alignment=taLeftJustify then
              HTML.Add(Format('<TD align=left nowrap> %s</TD>',
               [SpaceReplace(Grid.DataSource.DataSet.fieldbyname(Grid.columns[i].fieldname).text)]));
        end;
        HTML.Add('</TR>');
        Grid.DataSource.DataSet.next;
      end;
      HTML.Add('</TABLE>');


      HTML.Add('<p align=left style="font-size:9pt">Отчет сформирован ' + FormatDateTime('d/m/yyyy h:nn', Now));

      HTML.Add('</BODY></HTML>');
    finally
      result := html.Text;
    end;
  end;

  function CreateHtmlReportTable_Values_LastData(Grid:TDBGridEh; RecCount_Max:integer): string;
  var
    I: Integer;
    summa_d:double;
    RecCount:integer;
  begin
    try
      HTML.Add('<p align=left style="font-size:9pt">Примечание: в таблицу значений включены только  ' + inttostr(RecCount_Max)+' последних отсчета данных' );
       HTML.Add('  <BR>');
    
      HTML.Add('<P><table border=1 cellspacing=0 cellpadding=2 bordercolor=#808080 >');
  // первая строка таблицы
      HTML.Add('<TR>');
      for i := 0 to Grid.Columns.Count - 1 do
          HTML.Add('<TD align=center nowrap bgColor=#FFFFCC >' + Grid.Columns[i].Title.Caption + '</TD>');
      HTML.Add('</TR>');
      Grid.DataSource.DataSet.first;
      RecCount:=0;
      while not Grid.DataSource.DataSet.eof do
      begin
        HTML.Add('  <TR>');
        for i := 0 to Grid.Columns.Count - 1 do
        begin
             if Grid.Columns[i].alignment=taRightJustify then
              HTML.Add(Format('<TD align=right nowrap> %s</TD>',
               [SpaceReplace(Grid.DataSource.DataSet.fieldbyname(Grid.columns[i].fieldname).text)]));
             if Grid.Columns[i].alignment=taCenter then
              begin
              if ((Grid = HoursGrid) or (Grid=OnOffGrid)) then
              HTML.Add(Format('<TD align=center nowrap> %s</TD>',
               [formatdatetime('dd.mm.yyyy hh:mm', Grid.DataSource.DataSet.fieldbyname(Grid.columns[i].fieldname).asdatetime)]))
               else             
               HTML.Add(Format('<TD align=center nowrap> %s</TD>',
               [formatdatetime('dd.mm.yyyy 00:00', Grid.DataSource.DataSet.fieldbyname(Grid.columns[i].fieldname).asdatetime)]));
              end;
             if Grid.Columns[i].alignment=taLeftJustify then
              HTML.Add(Format('<TD align=left nowrap> %s</TD>',
               [SpaceReplace(Grid.DataSource.DataSet.fieldbyname(Grid.columns[i].fieldname).text)]));
        end;
        HTML.Add('</TR>');
        RecCount:=RecCount+1;
        if RecCount>=RecCount_max then break;
        Grid.DataSource.DataSet.next;
      end;
      HTML.Add('</TABLE>');
        HTML.Add('<p align=left style="font-size:9pt">Отчет сформирован ' + FormatDateTime('d/m/yyyy h:nn', Now));
       HTML.Add('</BODY></HTML>');
    finally
      result := html.Text;
    end;
  end;        // CreateHtmlReportTable_Values_LastData



begin
   HTML := TStringList.create;
   case ArchievPC.TabIndex of
    0:begin
       CreateHtmlReportHeader('Отчет об истории включений-выключений',OnOffGrid);
       HTML.Add('<BR>');
 //      for i:=0 to OnOff_Info.lines.count-1 do HTML.Add(OnOff_Info.lines[i]+'<BR>');
       CreateHtmlReportTable_Values(OnOffGrid);
      end;
    1:begin
       DD1_OnOff.Date:=DD1_H.Date;
       DD2_OnOff.Date:=DD2_H.Date;
       CreateHtmlReportHeader('Отчет по часовым значениям',HoursGrid);
      if _cbLastData.checked then   CreateHtmlReportTable_Values_LastData(HoursGrid,24)
       else  CreateHtmlReportTable_Values(HoursGrid);
      end;
    2:begin
       DD1_OnOff.Date:=DD1_H.Date;
       DD2_OnOff.Date:=DD2_H.Date;
       CreateHtmlReportHeader('Отчет по суточным данным',DaysGrid);
      if _cbLastData.checked then   CreateHtmlReportTable_Values_LastData(DaysGrid,31)
       else  CreateHtmlReportTable_Values(DaysGrid);
      end;
   end;
   HTMLFilename:=ExtractFilePath(Application.exename)+'HTML\'+GetGuidstr+'.htm';

   HTML.SaveToFile(HTMLFileName);
   ShellExecute(Application.Handle, nil, pchar(HTMLFilename), nil, nil, SW_SHOW);
   HTML.Free;
end;

procedure TExpForm.ArchievPCChange(Sender: TObject);
begin
  inherited;
 if ArchievPC.TabIndex>0 then
 ChartPC.TabIndex:=ArchievPC.TabIndex-1;
 case ArchievPC.TabIndex of
  0,1: begin
      HoursChat_Tab.TabVisible:=true;
      DaysChat_Tab.tabvisible:=false;
      cxButton24Hoursclick(nil);
      _cbLastData.Caption:='Последние сутки';
      mousepanel.caption:='';mousepanel.update;
     end;
  2: begin
      HoursChat_Tab.TabVisible:=false;
      DaysChat_Tab.tabvisible:=true;
      cxButton30Daysclick(nil);
      _cbLastData.Caption:='Последний месяц';
      mousepanel.caption:='';mousepanel.update;
     end;
 end;
 hours_chart.LeftAxis.Automatic:=true;
 days_chart.LeftAxis.Automatic:=true;
end;

procedure TExpForm.cxButton24HoursClick(Sender: TObject);
begin
  inherited;
try
 if Sender<>nil then ArchievPC.TabIndex:=1;
 ChartPC.TabIndex:=0;


   IF    HoursData_F.parambyname('Eksp_Nomer_IN').asinteger<>currentnOMER then
    begin
     HoursData_F.close;
    end;

  if (
   (HoursData_f.parambyname('DD1').AsDate<>trunc(dd1_h.date)
    ) or
   (hOURSData_f.parambyname('DD2').AsDate<>(trunc(dd2_h.date)+1))
   )
   THEN HoursData_F.close;


 IF not hOURSData_F.Active  then
     begin
     HoursData_F.parambyname('Eksp_Nomer_IN').asinteger:=cURRENTNomer;
     HoursData_f.parambyname('DD1').asdatetime:=trunc(dd1_H.date);
     HoursData_f.parambyname('DD2').asdatetime:=trunc(dd2_H.date)+1;
     HoursData_F.open;
    end;


//  HoursData_F.Close;
//  HoursData_F.Open;

  if _cbLastData.Checked then
 begin
   Hours_chart.bottomaxis.Automatic:=false;
   hours_chart.BottomAxis.Minimum:=0;
   hours_chart.BottomAxis.Maximum:= hoursdata_F.fieldbyname('Hour_Value').asdatetime+1/12;
   hours_chart.BottomAxis.Minimum:= hoursdata_F.fieldbyname('Hour_Value').asdatetime-1-1/12;
   end
  else   Hours_chart.bottomaxis.Automatic:=true;


 except  on e:exception  do
       begin
 //       showmessage('Ошибка '+e.message);
        exit;
       end;
 end;

end;

procedure TExpForm.cxButton30DaysClick(Sender: TObject);
begin
  inherited;
try
  if Sender<>nil then  ArchievPC.TabIndex:=2;
  ChartPC.TabIndex:=1;

  
//   IF  DaysData_F.parambyname('Eksp_Nomer_IN').asinteger<>currentnOMER then
   begin
     DaysData_F.close;
    end;

   if (
   (DaysData_f.parambyname('DD1').AsDate<>trunc(dd1_D.date)
      ) or
   (DaysData_f.parambyname('DD2').AsDate<>trunc(dd2_D.date))
     )
  THEN DaysData_F.close;

  IF not DaysData_F.Active  then
      begin
        DaysData_F.parambyname('Eksp_Nomer_IN').asinteger:=currentnOMER;
        DaysData_f.parambyname('DD1').asdatetime:=trunc(dd1_D.date);
        DaysData_f.parambyname('DD2').asdatetime:=trunc(dd2_D.date);//+1;
        DaysData_F.open;
      end;

// DaysData_f.close;
// Daysdata_f.Open;

 if _cbLastData.Checked then
 begin
  Days_chart.bottomaxis.Automatic:=false;
  Days_chart.BottomAxis.Minimum:=0;
  Days_chart.BottomAxis.Maximum:= Daysdata_F.fieldbyname('day_Value').asdatetime+1;
  Days_chart.BottomAxis.Minimum:= Daysdata_F.fieldbyname('Day_Value').asdatetime-31;
 end else Days_chart.bottomaxis.Automatic:=true;
// dayseries.RefreshSeries;
 Days_chart.update;

(*  19.12.2008
 if cbLastData.Checked then
 begin
 OnOff_Days_Chart.bottomaxis.Automatic:=false;
 onOff_Days_Chart.BottomAxis.Minimum:=0;
 onOff_Days_Chart.BottomAxis.Minimum:=Days_chart.BottomAxis.Minimum;
 onOff_Days_Chart.BottomAxis.Maximum:=Days_chart.BottomAxis.Maximum;
 end
  else ONOff_Days_chart.bottomaxis.Automatic:=true;;
 ONOff_Days_chart.update;
  *)
  except  on e:exception  do
       begin
//        showmessage('Ошибка '+e.message);
        exit;
       end;
 end;

end;

procedure TExpForm.OnOFF_FLASTEVENTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
{    ifjrjyxfys
FieldByName('status').asinteger=1 then text:='вкл';
  if OnOff_F.FieldByName('status').asinteger=0 then text:='выкл';
  if OnOff_F.FieldByName('ONOff_Event').asdatetime =
    OnOff_F.FieldByName('LastEvent').asdatetime  then text:='посл.чтение';
}end;

procedure TExpForm.Days_ChartClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
 archievPC.TabIndex:=2;
 mousepanel.Caption:='      дата='+formatdatetime('dd.mm.yy',series.XValue[valueIndex]+0.5)+' расход='+
                               formatfloat('0.00',series.YValue[valueIndex]);
 DaysData_VT.Locate('Day_Value',series.XValue[valueIndex],[]);
 DaysData_F.Locate('Day_Value', DaysData_VT.fieldbyname('Parent_DV').Value,[]);
 DaysData_F.Locate('Day_Value',series.XValue[valueIndex],[]);  

end;

procedure TExpForm.Hours_ChartClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
 archievPC.TabIndex:=1;
  mousepanel.Caption:='       время='+formatdatetime('dd.mm.yy hh:mm',series.XValue[valueIndex]+0.5/24.0)+' расход='+
                               formatfloat('0.00',series.YValue[valueIndex]);
 //HoursData_F.Locate('Hour_Value',series.XValue[valueIndex],[]);

 HoursData_VT.Locate('Hour_Value',series.XValue[valueIndex],[]);
 HoursData_F.Locate('Hour_Value', HoursData_VT.fieldbyname('Parent_HV').Value,[]);
 HoursData_F.Locate('Hour_Value',series.XValue[valueIndex],[]);


end;

procedure TExpForm.SpeedButton2Click(Sender: TObject);
begin
  inherited;

  hours_chart.LeftAxis.Automatic:=true;
   hours_chart.refresh;
 //  HourSeries.refreshSeries;

  Hours_chart.leftaxis.Automatic:=false;

   if hours_chart.LeftAxis.Minimum<0 then
      begin
       if hours_chart.Series[0].MinYValue=hours_chart.LeftAxis.Minimum then
          hours_chart.LeftAxis.Minimum:= 1.05*Hours_chart.LeftAxis.Minimum;
  //     hours_chart.LeftAxis.Minimum:= 1.05*Hours_chart.LeftAxis.Minimum;
      end
       else hours_chart.LeftAxis.Minimum:=0;

   if hours_chart.Series[0].MaxYValue=hours_chart.LeftAxis.Maximum then
      hours_chart.LeftAxis.Maximum:= 1.05*Hours_chart.LeftAxis.Maximum;

 //  Hours_chart.LeftAxis.AutomaticMinimum:=True;
 //  Hours_chart.LeftAxis.AutomaticMaximum:=True;


   Hours_chart.Refresh;
  
Days_chart.LeftAxis.Automatic:=true;
   Days_chart.refresh;
 //  Dayseries.refreshSeries;

  Days_chart.leftaxis.Automatic:=false;

   if Days_chart.LeftAxis.Minimum<0 then
      begin
       if Days_chart.Series[0].MinYValue=Days_chart.LeftAxis.Minimum then
          Days_chart.LeftAxis.Minimum:= 1.05*Days_chart.LeftAxis.Minimum;
  //     Days_chart.LeftAxis.Minimum:= 1.05*Days_chart.LeftAxis.Minimum;
      end
       else Days_chart.LeftAxis.Minimum:=0;

   if Days_chart.Series[0].MaxYValue=Days_chart.LeftAxis.Maximum then
      Days_chart.LeftAxis.Maximum:= 1.05*Days_chart.LeftAxis.Maximum;

 //  Days_chart.LeftAxis.AutomaticMinimum:=True;
 //  Days_chart.LeftAxis.AutomaticMaximum:=True;


   Days_chart.Refresh;

end;

procedure TExpForm.DBGridEh3GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if onoff_VT.fieldbyname('status').asinteger=0 then
    background := clsilver
end;

procedure TExpForm.ON_OFF_VT_StatusGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if OnOff_VT.FieldByName('status').isnull then text:='вкл';
  if OnOff_VT.FieldByName('status').asinteger=0 then text:='выкл';
  if OnOff_VT.FieldByName('ONOff_Event').asdatetime =
    OnOff_VT.FieldByName('LastEvent').asdatetime  then text:='посл.чтение';
  if OnOff_VT.FieldByName('status').asinteger=1 then text:='вкл';
end;

procedure TExpForm.Tone_PulseClick(Sender: TObject);
begin
  inherited;
// eksps.edit;
 Label_tone.Visible:=tone_pulse.ItemIndex=1;
 Label_pulse.Visible:=tone_pulse.ItemIndex=0;
 if ((tone_pulse.itemindex=0) and (rg_access.itemindex=1)) then
  begin
   if pos('+',phone_number.Text)>0 then
    begin
     showmessage('В номере могут быть только цифры');
    end;
  end;
end;

procedure TExpForm.ekspsAfterScroll(DataSet: TDataSet);
begin
  inherited;
 SetInterface_mode;
 DaysData_F.Close; // ??? //
 archieve_reopen(eksps.fieldbyname('eksp_Nomer').asinteger);
 ArchievPCChange(nil);
end;

Procedure TExpForm.SetInterface_mode;
 begin
 rg_access.OnClick:=nil; cbVia_modem.OnClick:=nil;
 rg_access.ItemIndex:=eksps.fieldbyname('Interface_mode').asinteger;
 cbVia_Modem.checked:= eksps.fieldbyname('Via_modem').asinteger=1;

 TabsheetModem.tabvisible:= cbVia_Modem.checked;
 TabsheetModBus.tabvisible:=rg_access.ItemIndex=1;
 TabsheetBlueTooth.tabvisible:=rg_access.ItemIndex=3;
 if TabsheetModem.tabvisible then  PageControl2.ActivePage:=TabSheetModem;
 if TabsheetModbus.tabvisible then  PageControl2.ActivePage:=TabSheetModBus;
 if TabsheetBlueTooth.tabvisible then  PageControl2.ActivePage:=TabSheetBlueTooth;
 access.ItemIndex:=eksps.FieldByName('access').asinteger;
 tone_pulse.ItemIndex:=eksps.FieldByName('tone_pulse').asinteger;
 rg_access.OnClick:=rg_accessClick;cbVia_modem.OnClick:=cbVia_modemClick;
 cxBDR.Enabled:=true;  Parity.Enabled:=true;
 if cbVia_Modem.checked then
  begin
    cxBDR.Enabled:=False;  Parity.Enabled:=false;
    if ((cxbdr.ItemIndex<>0) or (Parity.ItemIndex<>0)) then
    begin
      eksps.edit;
      cxbdr.ItemIndex:=0;
      Parity.ItemIndex:=0;
      eksps.post;
    end;
  end;
 end;

procedure TExpForm.DBGridTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var i:integer;
    eksp_nom: integer;
 s:string;
begin
  inherited;
 { eksp_nom:=Eksps.fieldbyname('Eksp_Nomer').asinteger;
  eksps.close;
  for i:=0 to DBGrid.Columns.Count-1 do DBGrid.Columns[i].Title.SortMarker:=smNoneEh;
  for i:=0 to eksps.selectsql.count-1 do
   begin
     s:=ANSIUppercase(eksps.selectsql[i]);
     if pos('ORDER BY',s)>0 then
      begin
       asc_desc :=not asc_desc;
       if asc_desc then
        s:='ORDER BY '+Column.FieldName+' asc '
         else         s:='ORDER BY '+Column.FieldName+' desc ';
       eksps.selectsql[i]:=s;
        if asc_desc then column.Title.SortMarker:=smUpEh
         else column.Title.SortMarker:=smDownEh;
       break;
      end;
   end;
   eksps.Open;
   eksps.locate('eksp_nomer',eksp_nom,[]);  }
end;

procedure TExpForm.DBGridGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  inherited;
 if ((column.FieldName='EKSP_HEADER') and (eksps.FieldByName('device_Number').asinteger >= eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger))
  then
     begin
      Afont.Color:=clPurple;
      Afont.Style := [fsBold];
     end;
 if (column.FieldName='INTERFACE_MODE')
  then
     begin
      if eksps.fieldbyname('VIA_Modem').asinteger=1 then Afont.Color:=clblue;
      if eksps.fieldbyname('Interface_mode').asinteger=1 then Afont.Style := [fsBold];
     end;

end;

procedure TExpForm.DBGridCellClick(Column: TColumnEh);
begin
  inherited;
  splitter1.width:=splitter1.width+1;
  dbgrid.update;
  splitter1.width:=splitter1.width-1;
  dbgrid.update ;

  ArchievPCChange(nil);
end;


procedure TExpform.CreateData;
Var
    FName:string;
    CD:TCopyDataStruct;
    RecToTransfer:TRecToTransfer;
    s:string;
    ID:integer;
  nPoints:integer;
  FDD: TFileStream;
  i,j:integer;
  LastValue:double;
  maxDt,minDt,dt1,dt2:tDatetime;
  maxHt,minHt:tDatetime;
  DataSingle_D: array of single;
  DataSingle_H: array of single;

  Current_Eksp_Nomer, eksp_nom_fromDevice:integer;
begin
 //sleep(1000);

 try

 id:=eksps.fieldbyname('eksp_Nomer').asinteger;
 Daysdata.last;

 dm.q.SQL.Clear;
 dm.q.SQL.add(' update eksp set eksp_date = :eksp_Date, eksp_Time = :eksp_Time '+
              ' where eksp_Nomer = :eksp_Nomer');

// выбор дат начала и конца, опираясь на DaysData
 dt1:=daysdata.fieldbyname('day_value').asdatetime;
 DaysData.First;
 dt2:=daysdata.fieldbyname('day_value').asdatetime;
 maxDt:=max(dt1,dt2)+1;
 minDt:=min(dt1,dt2);

// выбор дат начала и конца, опираясь на HoursData  (могут отличаться от DaysData)
 HoursData.last;
 dt1:=Hoursdata.fieldbyname('hour_value').asdatetime;
 HoursData.First;
 dt2:=Hoursdata.fieldbyname('hour_value').asdatetime;
 maxHt:=max(dt1,dt2)+1;
 minHt:=min(dt1,dt2);

//выбор дат начала и конца,
 MaxDt:=max(MaxDT,MaxHT);
 MinDt:=min(MinDT,MinHT);
 if minDt=0 then MinDt:=MaxDt-31;

 dm.q.paramByName('eksp_date').asdatetime:=minDt;
 dm.q.paramByName('eksp_time').asdatetime:=encodetime(0,0,0,0);
 dm.q.paramByName('eksp_nomer').asinteger:=id;
 dm.q.ExecSQL;
 dm.q.Transaction.CommitRetaining;

 bneedChart:=false;
// eksps.close;   eksps.open;
// eksps.Locate('eksp_nomer',id,[]);
// bneedChart:=true;

 dm.q.SQL.Clear;
 dm.q.SQL.add(' update signals set PointAll = :PointAll, '+
              ' Date_Start = :date_Start, Time_Start = :Time_start, '+
              ' dateTimestart=:dateTimestart '+
              ' where signal_Nomer = :signal_Nomer');

 signals.first;
// NPoints:=trunc((eksps.fieldbyname('Datetime_Finish').asfloat-trunc(eksps.fieldbyname('Datetime_start').asfloat))*3600*24/signals.fieldbyname('deltx').asfloat)+1;
 NPoints:=trunc((maxDt-minDt)*3600*24/signals.fieldbyname('deltx').asfloat)+1;
 dm.q.parambyname('signal_Nomer').asinteger:=Signals.fieldbyname('Signal_Nomer').asinteger;
 dm.q.parambyname('PointAll').asinteger:=NPoints-24*2;
 dm.q.parambyname('Date_Start').asDatetime:=minDt+1;//trunc(eksps.fieldbyname('Datetime_start').asdatetime);
 dm.q.parambyname('Time_Start').asDatetime:=0;//eksps.fieldbyname('Datetime_start').asdatetime-trunc(eksps.fieldbyname('Datetime_start').asdatetime);
 dm.q.parambyname('DateTimeStart').asfloat:=dm.q.parambyname('Date_Start').asDatetime{+dm.q.parambyname('Time_Start').asDatetime};
 dm.q.execsql;
// DataSingle_H := nil;
 setlength(DataSingle_H, NPoints+1);
 deletefile(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring);
 for i:=0 to NPoints-1 do DataSingle_H[i]:=0;

 HoursData.DisableControls;
 HoursData.first;
 while not Hoursdata.eof do
  begin
   j:=round
    ( {1+}
    (HoursData.fieldbyname('Hour_Value').asfloat-dm.q.parambyname('Date_Start').asfloat)*24.0
     );
    if ((j >=0) and (j<= NPoints)) then
      DataSingle_H[j]:=HoursData.fieldbyname('D_Value').asfloat;
   HoursData.Next;
  end;
 HoursData.EnableControls;
 FDD := TFileStream.Create(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring, fmCreate);
 FDD.write(datasingle_H[1], sizeof(DataSingle_H) * NPoints);
 FDD.destroy;

 signals.Next;
 NPoints:=1+trunc((maxDt-
     trunc(minDt))*3600*24/signals.fieldbyname('deltx').asfloat);
 dm.q.parambyname('signal_Nomer').asinteger:=Signals.fieldbyname('Signal_Nomer').asinteger;
 dm.q.parambyname('PointAll').asinteger:=NPoints-3;
 dm.q.parambyname('Date_Start').asDatetime:=minDt+1;//trunc(eksps.fieldbyname('Datetime_start').asdatetime);
 dm.q.parambyname('Time_Start').asDatetime:=0;//eksps.fieldbyname('Datetime_start').asdatetime-trunc(eksps.fieldbyname('Datetime_start').asdatetime);
 dm.q.parambyname('DateTimeStart').asfloat:=dm.q.parambyname('Date_Start').asDatetime{+dm.q.parambyname('Time_Start').asDatetime};
 dm.q.execsql;

// DataSingle_D := nil;
 setlength(DataSingle_D, NPoints+1);
 deletefile(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring);
 for i:=0 to NPoints-1 do DataSingle_D[i]:=0;

 DaysData.DisableControls;
 DaysData.first;
 while not Daysdata.eof do
  begin
   j:={1+}round
    (
    (DaysData.fieldbyname('Day_Value').asfloat-dm.q.parambyname('Date_Start').asfloat)
     );
    if ((j >=0) and (j<= NPoints)) then
       DataSingle_D[j]:=DaysData.fieldbyname('D_Value').asfloat;
   DaysData.Next;
  end;
 Daysdata.EnableControls;
 FDD := TFileStream.Create(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring, fmCreate);
 FDD.write(datasingle_D[0], sizeof(DataSingle_D) * NPoints-2);

 FDD.destroy;

 dm.q.Transaction.commitretaining;
 bneedChart:=false;
 eksps.disablecontrols;
 eksps.close; eksps.open;
// eksps.locate('eksp_nomer',id,[]);
 Current_eksp_Nomer:=ID;
 //Eksps.fieldbyname('eksp_nomer').asinteger;
 eksps.locate('eksp_nomer', Current_eksp_Nomer,[]);
 eksps.enablecontrols;
 bneedChart:=true;
 
 // datasingle_H:=nil;
// datasingle_D:=nil;
      except  on e:exception  do
       begin
        showmessage('Некорректная обработка принятых данных '+e.message);
//        exit;
       end;
      end;
end;


procedure TExpForm.miHTMLClick(Sender: TObject);
var
 s:string;
begin
  inherited;
  s:=extractfilepath(Application.exename)+'HTML\Signur.mht';
  ShellExecute(Application.Handle, nil, pchar(s), nil, nil, SW_SHOW);

end;

procedure TExpForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
 miClearClick(nil);
 dm.CreateSchedule;
end;

procedure TExpForm.sch_modeChange(Sender: TObject);
var i:integer;
begin
  inherited;
 if not eksps.active then exit;
 if SCH_mode.Value = null then exit;
 sch_panel.Visible:=(integer(SCH_mode.Value) >0);
 Labelday.Visible:=(integer(SCH_mode.Value) >=2);
 sch_day.Visible:=Labelday.Visible;

 sch_day.KeyItems.clear;
 sch_day.Items.Clear;
 case integer(SCH_mode.Value) of
  2: begin
      LabelDay.Caption:='День недели';
      for i:=1 to 7 do
       sch_day.KeyItems.add(inttostr(i));
       Sch_Day.Items.add('Воскресенье');
      Sch_Day.Items.add('Понедельник');
      Sch_Day.Items.add('Вторник');
      Sch_Day.Items.add('Среда');
      Sch_Day.Items.add('Четверг');
      Sch_Day.Items.add('Пятница');
      Sch_Day.Items.add('Суббота');
      sch_day.Value:=eksps.fieldbyname('sch_day').asinteger;
      end;
  3: begin
      LabelDay.Caption:='День месяца';
      for i:=1 to 28 do
       begin
        sch_day.KeyItems.add(inttostr(i));
        sch_day.Items.add(inttostr(i))
       end;
     sch_day.Value:=eksps.fieldbyname('sch_day').asinteger;
     end;
 end;
end;

procedure TExpForm.modbus_addressPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
 if ((displayvalue > 247) or (displayValue<1)) then errortext:='Ошибка ввода адреса. Адреc должен быть в пределах от 1 до 247';
end;

procedure TExpForm.HoursdataAfterOpen(DataSet: TDataSet);
begin
  inherited;
// HourLast:=HoursData.fieldbyname('Hour_Value').asdatetime;
end;

procedure TExpForm.DaysDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
// DayLast:=DaysData.fieldbyname('Day_Value').asdatetime;
end;

procedure TExpForm.N2Click(Sender: TObject);
var
   dir:string;

   procedure RemoveAll(path: string);
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
      RemoveDirectory(PChar(path));
    end;


begin
  inherited;
try
 if MessageDlg('Вы действительно хотите удалить из базы данных архивные данные прибора '+ eksps.fieldbyname('Eksp_Header').AsString+
       '? Будут удалены суточные данные в интервале дат с '+formatdatetime('dd.mm.yyyy',dd1_D.Date)+' по '+formatdatetime('dd.mm.yyyy',dd2_D.Date)+
       ', часовые данные  в интервале дат с '+formatdatetime('dd.mm.yyyy',dd1_H.Date)+' по '+formatdatetime('dd.mm.yyyy',dd2_H.Date)+
      ', данные  включений/выключений в интервале дат с '+formatdatetime('dd.mm.yyyy',dd1_OnOff.Date)+' по '+formatdatetime('dd.mm.yyyy',dd2_OnOff.Date),
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
 dm.q.SQL.Clear;
 dm.q.SQL.add('delete from hoursdata where eksp_nomer = :eksp_nomer and hour_value between :d1 and :d2');
 dm.q.parambyname('eksp_nomer').asinteger:=eksps.fieldbyname('Eksp_nomer').Asinteger;
 dm.q.parambyname('d1').asdatetime:=dd1_H.date;
 dm.q.parambyname('d2').asdatetime:=dd2_H.date;
 dm.q.execsql;
  dm.q.SQL.Clear;
 dm.q.SQL.add('delete from daysdata where eksp_nomer = :eksp_nomer and day_value between :d1 and :d2');
 dm.q.parambyname('eksp_nomer').asinteger:=eksps.fieldbyname('Eksp_nomer').Asinteger;
 dm.q.parambyname('d1').asdatetime:=dd1_D.date;
 dm.q.parambyname('d2').asdatetime:=dd2_D.date;
 dm.q.execsql;
   dm.q.SQL.Clear;
 dm.q.SQL.add('delete from On_Off where eksp_nomer = :eksp_nomer and OnOff_event between :d1 and :d2');
 dm.q.parambyname('eksp_nomer').asinteger:=eksps.fieldbyname('Eksp_nomer').Asinteger;
 dm.q.parambyname('d1').asdatetime:=dd1_OnOff.date;
 dm.q.parambyname('d2').asdatetime:=dd2_OnOff.date;
 dm.q.execsql;

    dm.q.SQL.Clear;
 dm.q.SQL.add('delete from On_Off where eksp_nomer = :eksp_nomer and OnOff_event >= :d1');
 dm.q.parambyname('eksp_nomer').asinteger:=eksps.fieldbyname('Eksp_nomer').Asinteger;
 dm.q.parambyname('d1').asdatetime:=trunc(now)+1;
 dm.q.execsql;

     dm.q.SQL.Clear;
 dm.q.SQL.add('delete from daysdata where eksp_nomer = :eksp_nomer and day_value >= :d1');
 dm.q.parambyname('eksp_nomer').asinteger:=eksps.fieldbyname('Eksp_nomer').Asinteger;
 dm.q.parambyname('d1').asdatetime:=trunc(now)+1;
 dm.q.execsql;

   dm.q.SQL.Clear;
  dm.q.SQL.add('delete from hoursdata where eksp_nomer = :eksp_nomer and hour_value >=:d1 ');
 dm.q.parambyname('eksp_nomer').asinteger:=eksps.fieldbyname('Eksp_nomer').Asinteger;
 dm.q.parambyname('d1').asdatetime:=trunc(now)+1;
 dm.q.execsql;

 dm.q.Transaction.commitretaining;

 if  MasterFTP_FORM=nil then  Application.CreateForm(TMasterFTP_FORM, MasterFTP_FORM);
  MasterFTP_FORM.Device_ID:=eksps.fieldbyname('eksp_nomer').asinteger;
  MasterFTP_FORM.DeviceType:=eksps.fieldbyname('device_type').asinteger;
  MasterFTP_FORM.pnmess.Caption:='';
  dm.GetStringsObjectsFromQuery(dm.sql, MasterFTP_FORM.cbInstr.Items,'select device_Name, id_Device from devices where not device_type is null order by DEVICE_name ', 'device_name', 'ID_Device');
  MasterFTP_FORM.cbInstr.ItemIndex:= MasterFTP_FORM.cbinstr.items.indexof(eksps.fieldbyname('device_Name').asstring);

   case MasterFTP_FORM.cbInstr.ItemIndex of
                0 :  dir := 'A1_'+eksps.fieldbyname('device_Number').asstring;
                1 :  dir := 'A1_'+eksps.fieldbyname('device_Number').asstring;
                2 :  dir := 'A2_'+eksps.fieldbyname('device_Number').asstring;
                4 :  dir := 'EQ_'+eksps.fieldbyname('device_Number').asstring;
                5 :  dir := 'EQ_'+eksps.fieldbyname('device_Number').asstring;
   end;
   RemoveAll(ExtractFilePath(Application.ExeName)+'\FTP_DATA\'+Dir);


   currentnOMER:=-1;
 Archieve_reopen(eksps.fieldbyname('eksp_Nomer').asinteger);
 ArchievPCChange(NIL);
 finally
  eksps.Open;
 end;

 


end;

procedure TExpForm.RG_AccessClick(Sender: TObject);
begin
  inherited;
 if ((RG_Access.itemindex=1) and

     {(
     ((eksps.FieldByName('device_number').asinteger < eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger)
     and  (0 < eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger))
         or

     (0 = eksps.FieldByName('STARTNUMBER_LARGEARCH').asinteger)

     )}
     (
     (eksps.fieldbyname('ID_device').asinteger=15) and
     (eksps.FieldByName('device_number').asinteger < 4000)
     )
      ) then
  RG_Access.ItemIndex:=0;
 TabsheetModem.TabVisible:=cbVia_modem.checked;
 TabsheetModbus.TabVisible:=rg_Access.itemindex=1;
// TabsheetBlueTooth.TabVisible:=rgAccess.itemindex=3;
 case rg_Access.itemindex of
  0: if cbVia_modem.checked then Pagecontrol2.ActivePage:=TabsheetModem else Pagecontrol2.ActivePage:=TabsheetMemo;
  1: Pagecontrol2.ActivePage:=TabsheetModbus;
  2: begin Pagecontrol2.ActivePage:=TabsheetMemo; cbVia_modem.checked:=False;end;

  //3: Pagecontrol1.ActivePage:=TabsheetBlueTooth;
 end;
 btnEditClick(nil);
end;

(*
procedure TExpform.WMCopyData(var m : TMessage);
Var
    FName:string;
    CD:TCopyDataStruct;
    RecToTransfer:TRecToTransfer;
    s:string;
    ID:integer;
  nPoints:integer;
  FDD: TFileStream;
  i,j:integer;
  LastValue:double;
  maxDt,minDt,dt1,dt2:tDatetime;
  maxHt,minHt:tDatetime;
  DataSingle_D: array of single;
  DataSingle_H: array of single;

  Current_Eksp_Nomer, eksp_nom_fromDevice:integer;
begin
 //sleep(1000);
 CD:=PCopyDataStruct(m.LParam)^;
// s:=inttostr(integer(cd.lpData));
try
 RecToTransfer.fname:=PRecToTransfer(cd.lpData)^.fname;
 RecToTransfer.otherdata:=PRecToTransfer(cd.lpData)^.otherdata;
 RecToTransfer.typeoffile:=PRecToTransfer(cd.lpData)^.TypeOffile;
 RecToTransfer.mult_k:=PRecToTransfer(cd.lpData)^.mult_k;
 Fname:=PRecToTransfer(PCopyDataStruct(m.LParam)^.lpData)^.fname;
 eksp_nom_fromDevice:=PRecToTransfer(PCopyDataStruct(m.LParam)^.lpData)^.otherData;
 Current_eksp_Nomer:=Eksps.fieldbyname('eksp_nomer').asinteger;
 if  Current_eksp_Nomer<> eksp_nom_FromDevice then
   begin
    eksps.AfterScroll:=nil;
    eksps.locate('eksp_nomer', eksp_nom_FromDevice,[]);
    eksps.afterscroll:=ekspsafterscroll;
   end
 //  25 сент.  postmessage(m.wparam,wm_close,0,0) ;
      except  on e:exception  do
       begin
        showmessage('Некорректный обмен данными '+e.message);
        exit;
       end;
      end;
// application.ProcessMessages;
// update;
if recToTransfer.typeoffile=0 then
 begin    // в файле сразу все архивы (старый драйвер).
    try
     Import_Signur_Form:=TImport_Signur_Form.create(self);
     Import_Signur_Form.fname:=fname;
     Import_Signur_Form.caption:=fname;
     Import_Signur_Form.Device_type:=eksps.fieldbyname('Device_type').asinteger;
     Import_Signur_Form.eksp_nomer:=eksps.fieldbyname('eksp_Nomer').asinteger;
     Import_Signur_Form.miloadDataclick(nil);
           except  on e:exception  do
           begin
            showmessage('Некорректный прием данных Сигнур '+e.message);
           end;
          end;
     Import_Signur_Form.free;
 end;

if recToTransfer.typeoffile in [1,2,3,4,5] then
 begin    // в файле почасовые данные
 // Panel4.Caption:='Пришел файл  данных'+fname;
    try
     Import_Signur_Form2:=TImport_Signur_Form2.create(self);
     Import_Signur_Form2.fname:=fname;
 //   label4.caption:=fname;
 //   label4.Update;
     Import_Signur_Form2.Device_type_string:=eksps.fieldbyname('Device_Name').asstring;
     Import_Signur_Form2.Device_type:=eksps.fieldbyname('Device_type').asinteger;
     Import_Signur_Form2.eksp_nomer:=eksps.fieldbyname('eksp_Nomer').asinteger;
     Import_Signur_Form2.typeoffile :=recToTransfer.typeoffile   ;
     Import_Signur_Form2.mult_k :=recToTransfer.mult_k ;
     Import_Signur_Form2.miloadDataclick(nil);
           except  on e:exception  do
           begin
            showmessage('Некорректный прием данных Сигнур '+e.message);
           end;
          end;
     Import_Signur_Form2.free;
 end;

//коррекция файлов gemis
    try
     Archieve_Reopen;

    id:=eksps.fieldbyname('eksp_Nomer').asinteger;
    Daysdata.last;
    dm.q.SQL.Clear;
    dm.q.SQL.add(' update eksp set eksp_date = :eksp_Date, eksp_Time = :eksp_Time '+
                  ' where eksp_Nomer = :eksp_Nomer');
    // выбор дат начала и конца, опираясь на DaysData
     dt1:=daysdata.fieldbyname('day_value').asdatetime;
     DaysData.First;
     dt2:=daysdata.fieldbyname('day_value').asdatetime;
     maxDt:=max(dt1,dt2)+1;
     minDt:=min(dt1,dt2);

    // выбор дат начала и конца, опираясь на HoursData  (могут отличаться от DaysData)
     HoursData.last;
     dt1:=Hoursdata.fieldbyname('hour_value').asdatetime;
     HoursData.First;
     dt2:=Hoursdata.fieldbyname('hour_value').asdatetime;
     maxHt:=max(dt1,dt2)+1;
     minHt:=min(dt1,dt2);

    //выбор дат начала и конца,
     MaxDt:=max(MaxDT,MaxHT);
     MinDt:=min(MinDT,MinHT);
     if minDt=0 then MinDt:=MaxDt-31;

     dm.q.paramByName('eksp_date').asdatetime:=minDt;
     dm.q.paramByName('eksp_time').asdatetime:=encodetime(0,0,0,0);
     dm.q.paramByName('eksp_nomer').asinteger:=id;
     dm.q.ExecSQL;
     dm.q.Transaction.CommitRetaining;

     eksps.close;   eksps.open;
     eksps.Locate('eksp_nomer',id,[]);


     dm.q.SQL.Clear;
     dm.q.SQL.add(' update signals set PointAll = :PointAll, '+
                  ' Date_Start = :date_Start, Time_Start = :Time_start, '+
                  ' dateTimestart=:dateTimestart '+
                  ' where signal_Nomer = :signal_Nomer');

     signals.first;
    // NPoints:=trunc((eksps.fieldbyname('Datetime_Finish').asfloat-trunc(eksps.fieldbyname('Datetime_start').asfloat))*3600*24/signals.fieldbyname('deltx').asfloat)+1;
     NPoints:=trunc((maxDt-minDt)*3600*24/signals.fieldbyname('deltx').asfloat)+1;
     dm.q.parambyname('signal_Nomer').asinteger:=Signals.fieldbyname('Signal_Nomer').asinteger;
     dm.q.parambyname('PointAll').asinteger:=NPoints;
     dm.q.parambyname('Date_Start').asDatetime:=minDt;//trunc(eksps.fieldbyname('Datetime_start').asdatetime);
     dm.q.parambyname('Time_Start').asDatetime:=0;//eksps.fieldbyname('Datetime_start').asdatetime-trunc(eksps.fieldbyname('Datetime_start').asdatetime);
     dm.q.parambyname('DateTimeStart').asfloat:=dm.q.parambyname('Date_Start').asDatetime{+dm.q.parambyname('Time_Start').asDatetime};
     dm.q.execsql;
    // DataSingle_H := nil;
     setlength(DataSingle_H, NPoints+1);
     deletefile(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring);
     for i:=0 to NPoints-1 do DataSingle_H[i]:=0;

     HoursData.DisableControls;
     HoursData.first;
     while not Hoursdata.eof do
      begin
       j:=round
        ( {1+}
        (HoursData.fieldbyname('Hour_Value').asfloat-dm.q.parambyname('Date_Start').asfloat)*24.0
         );
    //   DataSingle[j]:=HoursData.fieldbyname('S_Value').asfloat;
        if ((j >=0) and (j<= NPoints)) then
          DataSingle_H[j]:=HoursData.fieldbyname('D_Value').asfloat;
       HoursData.Next;
      end;
     HoursData.EnableControls;

     FDD := TFileStream.Create(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring, fmCreate);
     FDD.write(datasingle_H[0], sizeof(DataSingle_H) * NPoints);
     FDD.destroy;

     signals.Next;
     NPoints:=1+trunc((maxDt-
         trunc(minDt))*3600*24/signals.fieldbyname('deltx').asfloat);
     dm.q.parambyname('signal_Nomer').asinteger:=Signals.fieldbyname('Signal_Nomer').asinteger;
     dm.q.parambyname('PointAll').asinteger:=NPoints;
     dm.q.parambyname('Date_Start').asDatetime:=minDt;//trunc(eksps.fieldbyname('Datetime_start').asdatetime);
     dm.q.parambyname('Time_Start').asDatetime:=0;//eksps.fieldbyname('Datetime_start').asdatetime-trunc(eksps.fieldbyname('Datetime_start').asdatetime);
     dm.q.parambyname('DateTimeStart').asfloat:=dm.q.parambyname('Date_Start').asDatetime{+dm.q.parambyname('Time_Start').asDatetime};
     dm.q.execsql;

    // DataSingle_D := nil;
     setlength(DataSingle_D, NPoints+1);
     deletefile(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring);
     for i:=0 to NPoints-1 do DataSingle_D[i]:=0;

     DaysData.DisableControls;
     DaysData.first;
     while not Daysdata.eof do
      begin
       j:={1+}round
        (
        (DaysData.fieldbyname('Day_Value').asfloat-dm.q.parambyname('Date_Start').asfloat)
         );
    //   DataSingle[j]:=DaysData.fieldbyname('S_Value').asfloat;
        if ((j >=0) and (j<= NPoints)) then
           DataSingle_D[j]:=DaysData.fieldbyname('D_Value').asfloat;
       DaysData.Next;
      end;
     Daysdata.EnableControls;

     FDD := TFileStream.Create(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring, fmCreate);
     FDD.write(datasingle_D[0], sizeof(DataSingle_D) * NPoints);

     FDD.destroy;

     Current_eksp_Nomer:=Eksps.fieldbyname('eksp_nomer').asinteger;

     dm.q.Transaction.commitretaining;
     eksps.close; eksps.open;


     eksps.locate('eksp_nomer', Current_eksp_Nomer,[]);

    // datasingle_H:=nil;   datasingle_D:=nil;
          except  on e:exception  do
           begin
            showmessage('Некорректная обработка принятых данных '+e.message);
    //        exit;
           end;
      end;  //try
end;
*)


procedure TExpForm.OnOff_VToff_reason_intGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
 if ((OnOff_VT.FieldByName('status').isnull) or
    (OnOff_VT.FieldByName('status').asinteger=1)) then text:='' //'вкл';
     else
      begin
       text:=OnOff_VT.Fieldbyname('Off_Reason_int').asstring ;
       case OnOff_VT.Fieldbyname('Off_Reason_int').asinteger of
      {  0: text:='';
        1..5:text:= 'Ошибка памяти';
        6..11:text:= 'Ошибка таймера';
        12:text:= 'Не установлены часы';
        13:text:= 'Температура вне диапазона';
        14:text:= 'Нет эхо-сигнала';
        15:text:= 'Переполнение';     }
          0:    Text:=' Отключение питания';
          1..5: Text:= 'Ошибка памяти';
          6..11:Text:= 'Ошибка таймера';
          12:   Text:= 'Не установлены часы';
          13:   Text:=  ' t < -100 градусов';
          14:   Text:= 'Нет эхо-сигнала';
          15:   Text:= 'Переполнение';
          16:   Text:= 'Дефект питания';
          17:   Text:= ' t > +100 градусов';
          18:   Text:= 'к.з. питания АП';
        end;
      end;
end;


procedure TExpForm._cbLastDataClick(Sender: TObject);
begin
  inherited;
 ArchievPCChange(nil);
end;

procedure TExpForm.SignalsCalcFields(DataSet: TDataSet);
begin
  inherited;
  signals.FieldByName('dd1').ASDATETIME:=DD1_OnOff.Date;
  signals.FieldByName('dd2').ASDATETIME:=DD2_OnOff.Date;
end;

Procedure TExpForm.getHourDayLast;
 begin
  dm.q.close;
  dm.q.SQL.Clear;
  dm.q.SQL.add('select max(Hour_Value) as hourlast from HoursData where Eksp_Nomer = :Eksp_Nomer and hour_value < :t1');
  dm.q.parambyname('eksp_Nomer').asinteger:=eksps.fieldbyname('Eksp_Nomer').Asinteger;
  dm.q.parambyname('t1').asdatetime:=now;
  dm.q.Open;
  if dm.q.fieldbyname('HourLast').isnull then HourLast:=0 else HourLast:=dm.q.fieldbyname('hourlast').value;
  dm.q.close;
  dm.q.SQL.Clear;
  dm.q.SQL.add('select max(day_Value) as daylast from daysData where Eksp_Nomer = :Eksp_Nomer and day_value < :t1');
  dm.q.parambyname('eksp_Nomer').asinteger:=eksps.fieldbyname('Eksp_Nomer').Asinteger;
  dm.q.parambyname('t1').asdatetime:=now;
  dm.q.Open;
  if dm.q.fieldbyname('daylast').isnull then dayLast:=0 else DayLast:=dm.q.fieldbyname('daylast').value;
 end;

procedure TExpForm.HoursData_FCalcFields(DataSet: TDataSet);
begin
  inherited;
 if HoursData_f.FieldByName('OnOff_Exists').asinteger>0 then  HoursData_f.FieldByName('Color').asinteger:=clred
  else  HoursData_f.FieldByName('Color').asinteger:=clMoneyGreen;
end;

procedure TExpForm.DaysData_FCalcFields(DataSet: TDataSet);
begin
  inherited;
  if DaysData_f.FieldByName('OnOff_Exists').asinteger>0 then  DaysData_f.FieldByName('Color').asinteger:=clred
  else  DaysData_f.FieldByName('Color').asinteger:=clSkyBlue;
end;

procedure TExpForm.HoursData_FAfterOpen(DataSet: TDataSet);
var LastHour:TDatetime; cl:integer;
begin
  inherited;
 //CAPTION:=IntToStr(currentnOMER) ;
 HoursData_F.DisableControls;


//  Hourseries.RefreshSeries;

  HoursData_VT.Close;
 HoursData_VT.Clear;
  HoursData_VT.open;

  HSeries.Clear;

 HoursData_F.Last;
 LastHour:=0;
 HoursData_VT.disablecontrols;

(*  if (eksps.fieldbyname('DEVICE_TYPE').asinteger=1) then   // ЭХО-АС
   begin
      HourSeries.YValues.ValueSource:='S_VALUE';
   end
    else
    begin
      HourSeries.YValues.ValueSource:='D_VALUE';         // ЭХО-Р АКРОН
    end;
  *)

if HoursData_F.RecordCount>2 then
 begin
  While not HoursData_F.bof do
     begin
      if not HoursData_F.FieldByName('Hour_Value').isnull then
      begin
      if LastHour=0 then
      begin
        HoursData_VT.Append;
        HoursData_VT.FieldByName('Hour_Value').value:=HoursData_F.FieldByName('Hour_Value').asdatetime-0.01/24.0-0.5/24;
        HoursData_VT.FieldByName('D_Value').value:=0;
        HoursData_VT.FieldByName('S_Value').value:=HoursData_F.FieldByName('S_Value').value;
        HoursData_VT.FieldByName('Color').value:=clwhite;
        HoursData_VT.FieldByName('Parent_HV').value:=HoursData_F.FieldByName('Hour_Value').asdatetime;
        HoursData_VT.Post;
        LastHour:=HoursData_F.FieldByName('Hour_Value').asdatetime;

        if (eksps.fieldbyname('DEVICE_TYPE').asinteger=1) then   // ЭХО-АС
               HSeries.AddXY(HoursData_VT.FieldByName('Hour_Value').asdatetime,
                             HoursData_F.FieldByName('s_Value').value,
                             HoursData_VT.FieldByName('Color').value )
            else                           // ЭХО-Р АКРОН
            HSeries.AddXY(HoursData_VT.FieldByName('Hour_Value').asdatetime,
                          HoursData_VT.FieldByName('d_Value').asfloat,
                          HoursData_VT.FieldByName('Color').value );
      end;
      if ((HoursData_F.FieldByName('Hour_Value').asdatetime-LastHour)>1.1/24.0) then
       begin
        HoursData_VT.Append;
        HoursData_VT.FieldByName('Hour_Value').value:=Lasthour+1.0/24.0 -0.5/24;
        HoursData_VT.FieldByName('Parent_HV').value:=HoursData_F.FieldByName('Hour_Value').asdatetime;
        HoursData_VT.FieldByName('D_Value').value:=0;
        HoursData_VT.FieldByName('S_Value').value:=HoursData_F.FieldByName('S_Value').value;
        HoursData_VT.FieldByName('Color').value:=HoursData_F.FieldByName('Color').value;
        HoursData_VT.Post;
        Cl:=clYellow;

        if (eksps.fieldbyname('DEVICE_TYPE').asinteger=1) then   // ЭХО-АС
               HSeries.AddXY(HoursData_VT.FieldByName('Hour_Value').asdatetime,
                             HoursData_F.FieldByName('s_Value').asfloat,
                             HoursData_VT.FieldByName('Color').value )
            else                           // ЭХО-Р АКРОН
            HSeries.AddXY(HoursData_VT.FieldByName('Hour_Value').asdatetime,
                          HoursData_VT.FieldByName('d_Value').asfloat,
                          HoursData_VT.FieldByName('Color').value );


       end;
       HoursData_VT.Append;
       HoursData_VT.FieldByName('Hour_Value').value:=HoursData_F.FieldByName('Hour_Value').asdatetime-0.5/24;
       HoursData_VT.FieldByName('Parent_HV').value:=HoursData_F.FieldByName('Hour_Value').asdatetime;
       HoursData_VT.FieldByName('D_Value').value:=HoursData_F.FieldByName('D_Value').value;
        HoursData_VT.FieldByName('S_Value').value:=HoursData_F.FieldByName('S_Value').value;
       if cl=clyellow then HoursData_VT.FieldByName('Color').value:=clyellow
         else HoursData_VT.FieldByName('Color').value:=HoursData_F.FieldByName('Color').value;
       if LastHour=HoursData_F.FieldByName('Hour_Value').asdatetime then
        begin
          LastHour:=1+HoursData_F.FieldByName('Hour_Value').asdatetime  ;
          HoursData_VT.FieldByName('D_Value').value:=0;
        end;
       cl:=0;
       HoursData_VT.Post;

        if (eksps.fieldbyname('DEVICE_TYPE').asinteger=1) then   // ЭХО-АС
               HSeries.AddXY(HoursData_VT.FieldByName('Hour_Value').asdatetime,
                             HoursData_F.FieldByName('s_Value').value,
                             HoursData_VT.FieldByName('Color').value )
            else                           // ЭХО-Р АКРОН
            HSeries.AddXY(HoursData_VT.FieldByName('Hour_Value').asdatetime,
                          HoursData_VT.FieldByName('d_Value').asfloat,
                          HoursData_VT.FieldByName('Color').value );

       LastHour:=HoursData_F.FieldByName('Hour_Value').value;
     end  ;
     HoursData_F.prior;
     end;
     HoursData_VT.Append;
     HoursData_VT.FieldByName('Hour_Value').value:=HoursData_F.FieldByName('Hour_Value').asdatetime+0.5/24;
     HoursData_VT.FieldByName('Parent_HV').value:=HoursData_F.FieldByName('Hour_Value').asdatetime;
     HoursData_VT.FieldByName('D_Value').value:=0;
     HoursData_VT.FieldByName('S_Value').value:=HoursData_F.FieldByName('S_Value').value;
     HoursData_VT.FieldByName('Color').value:=HoursData_F.FieldByName('Color').value;
     HoursData_VT.Post;

        if (eksps.fieldbyname('DEVICE_TYPE').asinteger=1) then   // ЭХО-АС
               HSeries.AddXY(HoursData_VT.FieldByName('Hour_Value').asdatetime,
                             HoursData_F.FieldByName('s_Value').asfloat,
                             HoursData_VT.FieldByName('Color').value )
            else                           // ЭХО-Р АКРОН
            HSeries.AddXY(HoursData_VT.FieldByName('Hour_Value').asdatetime,
                          HoursData_VT.FieldByName('d_Value').asfloat,
                          HoursData_VT.FieldByName('Color').value );


     Hours_Chart.Visible:=True;
 end ;
 // ELSE
 // HoursData_vt.Open;

  Hours_Chart.Visible:=True;
  HoursData_F.EnableControls  ;
  HoursData_VT.enablecontrols;

  HSeries.refreshSeries;
  Hours_Chart.Refresh;
  Hours_Chart.UPDATE   ;

end;

procedure TExpForm.DaysData_FAfterOpen(DataSet: TDataSet);
var LastDay:TDatetime; cl:integer;
begin
  inherited;
DaysData_F.DisableControls;
DaysData_VT.Close;
DaysData_VT.open;
DaysData_VT.Clear;
dayseries.RefreshSeries;
DaysData_F.Last;
LastDay:=0;   DaysData_VT.disablecontrols;

if (eksps.fieldbyname('DEVICE_TYPE').asinteger=1) then   // ЭХО-АС
   begin
      DaySeries.YValues.ValueSource:='S_VALUE';
   end
    else
    begin
      DaySeries.YValues.ValueSource:='D_VALUE';
    end;
if DaysData_F.recordCount>=2 then
begin
While not DaysData_F.bof do
 begin
  if LastDay=0 then
  begin
    DaysData_VT.Append;
    DaysData_VT.FieldByName('Day_Value').value:=DaysData_F.FieldByName('Day_Value').asdatetime-0.01-0.5;
    DaysData_VT.FieldByName('D_Value').value:=0;
    DaysData_VT.FieldByName('S_Value').value:=DaysData_F.FieldByName('S_Value').value;
    DaysData_VT.FieldByName('Color').value:=clwhite;
    DaysData_VT.FieldByName('Parent_DV').value:=DaysData_F.FieldByName('Day_Value').asdatetime;
    DaysData_VT.Post;
    LastDay:=DaysData_F.FieldByName('Day_Value').asdatetime;
  end;
  if ((DaysData_F.FieldByName('Day_Value').asdatetime-LastDay)>1.1) then
   begin
    DaysData_VT.Append;
    DaysData_VT.FieldByName('Day_Value').value:=LastDay+0.5;
    DaysData_VT.FieldByName('S_Value').value:=DaysData_F.FieldByName('S_Value').value;
    DaysData_VT.FieldByName('Parent_DV').value:=DaysData_F.FieldByName('Day_Value').asdatetime;
    DaysData_VT.FieldByName('D_Value').value:=0;
    DaysData_VT.FieldByName('Color').value:=DaysData_F.FieldByName('Color').value;
    DaysData_VT.Post;
    Cl:=clYellow;
   end;
   DaysData_VT.Append;
   DaysData_VT.FieldByName('Day_Value').value:=DaysData_F.FieldByName('Day_Value').asdatetime-0.5;
   DaysData_VT.FieldByName('Parent_DV').value:=DaysData_F.FieldByName('Day_Value').asdatetime;
   DaysData_VT.FieldByName('S_Value').value:=DaysData_F.FieldByName('S_Value').value;
   DaysData_VT.FieldByName('D_Value').value:=DaysData_F.FieldByName('D_Value').value;
   if cl=clyellow then DaysData_VT.FieldByName('Color').value:=clyellow
     else DaysData_VT.FieldByName('Color').value:=DaysData_F.FieldByName('Color').value;

   if LastDay=DaysData_F.FieldByName('Day_Value').asdatetime then
        begin
          LastDay:=1.1+DaysData_F.FieldByName('Day_Value').asdatetime;  ;
           DaysData_VT.FieldByName('D_Value').value:=0;
        end;

   cl:=0;
   DaysData_VT.Post;
   LastDay:=DaysData_F.FieldByName('Day_Value').value;
   DaysData_F.prior;
  end;
  DaysData_VT.Append;
  DaysData_VT.FieldByName('Day_Value').value:=DaysData_F.FieldByName('Day_Value').asdatetime+0.5;
  DaysData_VT.FieldByName('Parent_DV').value:=DaysData_F.FieldByName('Day_Value').asdatetime;
  DaysData_VT.FieldByName('D_Value').value:=0;
  DaysData_VT.FieldByName('Color').value:=DaysData_F.FieldByName('Color').value;
  DaysData_VT.FieldByName('S_Value').value:=DaysData_F.FieldByName('S_Value').value;
  DaysData_VT.Post;
  dAYS_Chart.Visible:=True;

 end
  else DaysData_VT.Open;
  dAYS_Chart.Visible:=TRUE;

 DaysData_F.EnableControls ;
 DaysData_VT.enablecontrols;
 DaySeries.refreshSeries;
 Days_Chart.Refresh;
 Days_Chart.Update;
end;

procedure TExpForm.OnOffONOFF_EVENTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
    if OnOff.FieldByName('status').isnull then text:='вкл';
  if OnOff.FieldByName('status').asinteger=0 then text:='выкл';
  if OnOff.FieldByName('ONOff_Event').asdatetime =
    OnOff.FieldByName('LastEvent').asdatetime  then text:='посл.чтение';
  if OnOff.FieldByName('status').asinteger=1 then text:='вкл';
end;

procedure TExpForm.OnOff_NewON_OFF_REASON_INTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  Text:=' Отключение питания';
  if (eksps.FieldByName('DEvice_type').AsInteger in [0,1]) then
  begin
  if ((OnOff_new.FieldByName('status').isnull) or
    (OnOff_new.FieldByName('status').asinteger=1)) then text:='' //'вкл';
     else
      begin
       text:=OnOff_new.Fieldbyname('On_Off_Reason_int').asstring ;
       case OnOff_new.Fieldbyname('On_Off_Reason_int').asinteger of
           0:    Text:=' Отключение питания';
          1..5: Text:= 'Ошибка памяти';
          6..11:Text:= 'Ошибка таймера';
          12:   Text:= 'Не установлены часы';
          13:   Text:=  ' t < -100 градусов';
          14:   Text:= 'Нет эхо-сигнала';
          15:   Text:= 'Переполнение';
          16:   Text:= 'Дефект питания';
          17:   Text:= ' t > +100 градусов';
          18:   Text:= 'к.з. питания АП';
        end;
      end;
    end;  
end;

procedure TExpForm.FloatField2GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
 if  daysdata_f.FieldByName('Day_Value').isnull then text:='' else
 begin
 {if (daysdata_f.FieldByName('Day_Value').value=MinDay) then
   text:='' else
  }  begin
     if  daysdata_f.FieldByName('D_Value').isnull then  text:='' else
     text:=formatfloat('0.000',daysdata_f.FieldByName('D_Value').value);
    end
  end
end;

procedure TExpForm.FloatField4GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if  Hoursdata_f.FieldByName('Hour_Value').isnull then text:='' else
 begin
  {if (hoursdata_f.FieldByName('Hour_Value').value=MinHour) then
   text:='' else
   } begin
     if Hoursdata_f.FieldByName('D_Value').isnull then text:='' else
     text:=formatfloat('0.000',Hoursdata_f.FieldByName('D_Value').value);
    end
  end  
end;

procedure TExpForm.HoursData_FBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  HoursData_F.ParamByName('Eksp_Nomer_IN').asinteger:=eksps.fieldbyname('eksp_nomer').AsInteger;
  HoursData_F.ParamByName('DD1').asdatetime:=Trunc(dd1_H.date);
  HoursData_F.ParamByName('DD2').asdatetime:=Trunc(dd2_H.date)+1;
  HoursData_F.ParamByName('ID_DEVICE_IN').asinteger:=0;
  if eksps.FieldByName('Device_type').AsInteger=3 then
        HoursData_F.ParamByName('ID_DEVICE_IN').asinteger:= pgcHourData.ActivePageIndex+1;

(*  if eksps.FieldByName('Device_type').AsInteger=3 then
   begin
    HoursData_F.SQL[3]:=' and dd1.id_device = hd.id_device  ';
    HoursData_F.SQL[12]:=' and hd.id_device = '+inttostr(pgcHourData.ActivePageIndex+1)
   end
   else
    begin
      HoursData_F.SQL[3]:=' ';
     HoursData_F.SQL[12]:=' and hd.id_device is null';
    end ;
  *)
  dm.q1.close;
  dm.q1.SQL.Clear;
  dm.q1.SQL.add('select min(hour_value) as minHour from hoursdata where eksp_nomer = :eksp_nomer and hour_Value between :DD1 and :DD2');
  dm.q1.parambyname('eksp_Nomer').asinteger:=eksps.fieldbyname('Eksp_Nomer').Asinteger;
  dm.q1.parambyname('DD1').asdatetime:=Trunc(dd1_H.date);
  dm.q1.parambyname('DD2').asdatetime:=trunc(dd2_H.date)+1;
  dm.q1.Open;
  if dm.q1.fieldbyname('Minhour').isnull then MinHour:=0 else
      MinHour:=dm.q1.fieldbyname('Minhour').asdatetime;
  dm.q1.close   ;



end;

procedure TExpForm.DaysData_FBeforeOpen(DataSet: TDataSet);
begin
  inherited;
 (*   if eksps.FieldByName('Device_type').AsInteger=3 then

    begin
    DaysData_F.SQL[2]:=' and dd1.id_device = dd.id_device  ';
    DaysData_F.SQL[12]:=' and id_device = '+inttostr(pgcDayData.ActivePageIndex+1)
    end
   else
    begin
     DaysData_F.SQL[2]:=' ';
     DaysData_F.SQL[12]:=' and id_device is null';
    end;
 *)

  DAysData_F.ParamByName('Eksp_Nomer_IN').asinteger:=eksps.fieldbyname('eksp_nomer').AsInteger;
  DaysData_F.ParamByName('DD1').asdatetime:=Trunc(dd1_d.date);
  DaysData_F.ParamByName('DD2').asdatetime:=Trunc(dd2_d.date);//+1;
  DaysData_F.ParamByName('ID_DEVICE_IN').asinteger:=0;
  if eksps.FieldByName('Device_type').AsInteger=3 then
        DaysData_F.ParamByName('ID_DEVICE_IN').asinteger:= pgcDayData.ActivePageIndex+1;

  dm.q1.close;
  dm.q1.SQL.Clear;
  dm.q1.SQL.add('select min(day_value) as MinDay from daysdata where eksp_nomer = :eksp_nomer and day_Value between :DD1 and :DD2');
  dm.q1.parambyname('eksp_Nomer').asinteger:=eksps.fieldbyname('Eksp_Nomer').Asinteger;
  dm.q1.parambyname('DD1').asdatetime:=Trunc(dd1_D.date);
  dm.q1.parambyname('DD2').asdatetime:=trunc(dd2_D.date);//+1;
  dm.q1.Open;
  if dm.q1.fieldbyname('MinDay').isnull then MinDay:=0 else
     MinDay:=dm.q1.fieldbyname('MinDay').asdatetime;
  dm.q1.close;
//  DaysData_F.ParamByName('Eksp_Nomer').asinteger:=eksps.fieldbyname('eksp_nomer').AsInteger;

end;

procedure TExpForm.btnLastDayClick(Sender: TObject);
begin
  inherited;
DD2_H.DateTime:=now;
DD1_H.DateTime:=now-1;
DD1Change(nil);
end;

procedure TExpForm.btnLastMonthClick(Sender: TObject);
begin
  inherited;
DD2_D.Date:=now;
DD1_d.Date:=incmonth(now,-1);
DD1Change(nil);
end;

procedure TExpForm.btnLast10DaysClick(Sender: TObject);
begin
  inherited;
DD2_H.DateTime:=now;
DD1_H.DateTime:=now-10;
DD1Change(nil);
end;

procedure TExpForm.btnLast3MonthesClick(Sender: TObject);
begin
  inherited;
 DD2_D.Date:=now;
 DD1_d.Date:=incmonth(now,-3);
 DD1Change(nil);
end;

procedure TExpForm.miBlueToothClick(Sender: TObject);
begin
  inherited;
 BlueToothForm.show;
end;

procedure TExpForm.cbVia_modemClick(Sender: TObject);
begin
  inherited;
  TabsheetModem.TabVisible:=cbVia_modem.checked;
  if rg_Access.itemindex =2 then cbVia_modem.Checked:=false;
 if  cbVia_modem.checked  then
   begin
    Pagecontrol2.ActivePage:=TabsheetModem;
   end
  else
   begin
   TabsheetModem.TabVisible:=cbVia_modem.checked;
   TabsheetModbus.TabVisible:=rg_Access.itemindex=1;
   // TabsheetBlueTooth.TabVisible:=rgAccess.itemindex=3;
   case rg_Access.itemindex of
    0: Pagecontrol2.ActivePage:=TabsheetMemo;
    1: Pagecontrol2.ActivePage:=TabsheetModbus;
    2: cbVia_modem.Checked:=False;// Pagecontrol2.ActivePage:=TabsheetBlueTooth;
  //3: Pagecontrol2.ActivePage:=TabsheetBlueTooth;
   end;
  end;

  parity.enabled:=not cbVia_modem.checked;
  cxbdr.enabled:= not cbVia_modem.checked;
  btnEditClick(nil);
end;

procedure TExpForm.ekspsINTERFACE_MODEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  text:='';
  if  eksps.FieldByName('Via_modem').asinteger=1 then
   begin
   Text:=text+'модем ';
    {if eksps.FieldByName('tone_pulse').asinteger=1 then
    text:=text+' модем (T)'+eksps.fieldbyname('phone_number').asstring
    else text:=text+' модем (И)'+eksps.fieldbyname('phone_number').asstring;}
   end;
  case eksps.fieldbyname('Interface_mode').asinteger of
   0:text:=text+'RS232   ';
   1:text:=tEXT+'MB '+eksps.fieldbyname('ModBus_address').asstring;
   2:text:=tEXT+'USB';
  end;
end;

procedure TExpForm.miCOMClick(Sender: TObject);
begin
  inherited;
 if ComPortSettings_form.ShowModal = mrOK then
  begin
   if ComPortSettings_form.chkAuto.Checked then miCOM.Caption:='Настройка интерфейса  (Auto)'
     else miCOM.Caption:='Настройка интерфейса  (COM'+inttostr(ComPortSettings_form.se1.Value)+')';
  end;
end;

procedure TExpForm.FormShow(Sender: TObject);
begin
  inherited;
   if ComPortSettings_form.chkAuto.Checked then miCOM.Caption:='Настройка интерфейса  (Auto)'
     else miCOM.Caption:='Настройка интерфейса  (COM'+inttostr(ComPortSettings_form.se1.Value)+')';
end;

procedure TExpForm.pgcDayDataChange(Sender: TObject);
begin
  inherited;
  HoursData_F.Close;
  DAYSDATA_F.CLOSE;
  Archieve_Reopen(eksps.fieldbyname('Eksp_nomer').asinteger);
//  Archieve_Reopen(eksps.fieldbyname('Eksp_nomer').asinteger);
  ArchievPCChange(nil);
 end;

procedure TExpForm.pgcHourDataChange(Sender: TObject);
begin
  inherited;
  HoursData_F.Close;
  DaysData_F.Close;
  Archieve_Reopen(eksps.fieldbyname('Eksp_nomer').asinteger);
//  Archieve_Reopen(eksps.fieldbyname('Eksp_nomer').asinteger);
  ArchievPCChange(nil);
end;

procedure TExpForm.btn1Click(Sender: TObject);
var
  FN:string;
begin
  inherited;
  try
 eksp_for_load.Close;
 eksp_for_load.ParamByName('eksp_nomer').asinteger:= eksps.fieldbyname('eksp_nomer').asinteger;
 eksp_for_load.Open;
 Import_Signur_Form:=TImport_Signur_Form.create(self);
     Import_Signur_Form.fname:='C:\D\fbyte';
     Import_Signur_Form.caption:='C:\D\fbyte';
     Import_Signur_Form.Device_type:=eksp_for_load.fieldbyname('Device_type').asinteger;
     Import_Signur_Form.eksp_nomer:=eksp_for_Load.fieldbyname('eksp_Nomer').asinteger;


     Import_Signur_Form.miloadDataclick(nil);
     dm.q.Transaction.commitretaining;
           except  on e:exception  do
           begin
            showmessage('Некорректный прием данных Сигнур (Import_Signur) '+e.message);
            dm.q.Transaction.RollbackRetaining;
            Eksps.EnableControls;
           end;
          end;
     Import_Signur_Form.free;
end;

procedure TExpForm.HoursData_FAfterClose(DataSet: TDataSet);
begin
  inherited;
 Hours_Chart.Visible:=False;
end;


procedure TExpForm.btnLoadFTP(Sender: TObject);
var
 s:string;
 PhoneNmb:string;
 device_Number:Integer;
 DN:Integer;

 i:integer;

 adrlist:TStringList;
 Phone_Nomer:string;

 s15:string;
 ComPort:Byte;

begin

 GetHourDayLast;
 if  assigned(masterFTP_Form) then  begin masterFTP_Form.Free;  masterFTP_Form:=nil; end;

 if TcxButton(sender).tag=1 then
 begin
  s:=extractfilepath(application.exename)+'GetSignurData.exe '+inttostr(handle);
  winexec(pchar(s), cmdShow);
 end;

  if  MasterFTP_FORM=nil then  Application.CreateForm(TMasterFTP_FORM, MasterFTP_FORM);
      if MasterFTP_FORM.Device_ID<>eksps.fieldbyname('eksp_nomer').asinteger then
       begin
        MasterFTP_FORM.free;
        Application.CreateForm(TMasterFTP_FORM, MasterFTP_FORM);
       end;
      MasterFTP_FORM.Device_ID:=eksps.fieldbyname('eksp_nomer').asinteger;
      MasterFTP_FORM.DeviceType:=eksps.fieldbyname('device_type').asinteger;
      MasterFTP_FORM.pnmess.Caption:='';
      dm.GetStringsObjectsFromQuery(dm.sql, MasterFTP_FORM.cbInstr.Items,'select device_Name, id_Device from devices where not device_type is null order by DEVICE_name ', 'device_name', 'ID_Device');
      MasterFTP_FORM.cbInstr.ItemIndex:= MasterFTP_FORM.cbinstr.items.indexof(eksps.fieldbyname('device_Name').asstring);
      MasterFTP_FORM.meSN.text:=  eksps.fieldbyname('device_Number').asstring;
      MasterFTP_FORM.Targethandle:=handle;
      masterFTP_Form.HourLast:=HourLast;
      masterFTP_Form.DayLast:=DayLast;
      masterFTP_Form.Caption:= eksps.fieldbyname('device_Name').asstring+'  № '+ eksps.fieldbyname('device_Number').asstring;

      masterFTP_Form.eksp_nomer:=eksps.fieldbyname('eksp_nomer').asinteger;
      try
       masterFTP_Form.show;
       masterFTP_Form.btnLoadClick(nil);
       if masterFTP_Form.cbAlwaysOnTop.checked then masterFTP_Form.FormStyle:=fsStayOnTop
        else masterFTP_Form.Formstyle:=fsNormal;
        except
       
      end  ;



end;


procedure TExpForm.N16Click(Sender: TObject);
begin
  inherited;
 btnLoadFTP(MainForm.btnLoadFTP);
end;

procedure TExpForm.N15Click(Sender: TObject);
begin
  inherited;
 // btnLoadInfoFromDeviceClick(ExpForm.btnLoadInfoFromDevice)
   btnLoadInfoFromDeviceClick(MainForm.btnLoadInfoFromDevice);
end;

procedure TExpForm.DaysData_FAfterClose(DataSet: TDataSet);
begin
  inherited;
 dAYS_Chart.Visible:=False;
end;

procedure TExpForm.ChartPCChange(Sender: TObject);
begin
  inherited;
 //mousePanel.Caption:='';mousePanel.Update;
end;

end.
