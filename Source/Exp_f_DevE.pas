unit Exp_f_DevE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, menu_f, Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls, Gauges,
  Buttons, Mask, Menus, DB, IBCustomDataSet,  ComCtrls,
   cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxEdit, cxDBData, cxGridCardView, cxGridDBCardView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxLookAndFeelPainters, cxButtons, cxCheckBox, cxDBEdit,
  cxContainer, cxTextEdit, cxMemo, IBTable, shellapi, rxstrutils, IBSQL,
   IBQuery, cxImage, cxMaskEdit, math,
  cxDropDownEdit, DBGridEh, PropFilerEh, PropStorageEh, TeEngine, Series,
  TeeProcs, Chart, DbChart, MemDS, VirtualTable, cxRadioGroup;

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
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
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
    HoursData: TIBQuery;
    HoursDataHOUR_VALUE: TDateTimeField;
    HoursDataS_VALUE: TFloatField;
    ds_HoursData_F: TDataSource;
    OnOffEKSP_NOMER: TIntegerField;
    DaysDataEKSP_NOMER: TIntegerField;
    HoursDataEKSP_NOMER: TIntegerField;
    DaysDataD_VALUE: TFloatField;
    HoursDataD_VALUE: TFloatField;
    DaysData_F: TIBQuery;
    DateField1: TDateField;
    FloatField1: TFloatField;
    IntegerField1: TIntegerField;
    FloatField2: TFloatField;
    Panel10: TPanel;
    Label6: TLabel;
    Label14: TLabel;
    DD1: TDateTimePicker;
    DD2: TDateTimePicker;
    HoursData_F: TIBQuery;
    DateTimeField1: TDateTimeField;
    FloatField3: TFloatField;
    IntegerField2: TIntegerField;
    FloatField4: TFloatField;
    ekspsDATETIME_FINISH: TDateTimeField;
    ekspsDATETIME_START: TDateTimeField;
    btnCreateHTMLReport: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Splitter4: TSplitter;
    ArchievPC: TPageControl;
    TabSheet8: TTabSheet;
    Splitter3: TSplitter;
    OnOffGrid: TDBGridEh;
    OnOff_Info: TcxMemo;
    TabSheet10: TTabSheet;
    HoursGrid: TDBGridEh;
    TabSheet11: TTabSheet;
    DaysGrid: TDBGridEh;
    miCreateAndShowImage: TMenuItem;
    Panel4: TPanel;
    Label3: TLabel;
    cbDatabases: TComboBox;
    Panel11: TPanel;
    ChartPC: TPageControl;
    TabSheet12: TTabSheet;
    Hours_Chart: TDBChart;
    BarSeries1: TAreaSeries;
    onOff_Hours_Chart: TDBChart;
    TabSheet13: TTabSheet;
    Days_Chart: TDBChart;
    AreaSeries1: TAreaSeries;
    OnOff_VT_Chart: TVirtualTable;
    BarSeries3: TAreaSeries;
    OnOff_Days_Chart: TDBChart;
    AreaSeries2: TAreaSeries;
    mousePanel: TPanel;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
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
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    cxDeviceMemo: TcxDBMemo;
    Label8: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Phone_Number: TcxDBTextEdit;
    modem: TDBCheckBox;
    Access: TcxComboBox;
    Tone_Pulse: TRadioGroup;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    DBGridEh3: TDBGridEh;
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
    procedure DS_SignalsDataChange(Sender: TObject; Field: TField);
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
    procedure Hours_ChartAfterDraw(Sender: TObject);
    procedure Days_ChartAfterDraw(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
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
    procedure modemClick(Sender: TObject);
    procedure Tone_PulseClick(Sender: TObject);
    procedure ekspsAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    bneedrefresh:boolean ;
    s_on, s_Off, s_Total:tDatetime;
  procedure InsertCurveSet;
  procedure Archieve_Reopen;
  public
    { Public declarations }
   procedure CurvesetRefresh;
   procedure EkspRefresh;
  end;

var
  ExpForm: TExpForm;

implementation

uses Main_f, DM_dm, Import_f, IMAGE_u, tvc_u, config, Obzorka, Formtext,
  Audio_u, CURSORS, ArchievInfo_u, Picture_u, addSignurDevice_f,
  Import_signur, Master_new_u;

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
  dd1.time:=encodetime(0,0,0,0);
  dd1.Date:=trunc(now-365);;
  dd2.Date:=trunc(now+1);
end;

procedure TExpForm.ekspsBeforePost(DataSet: TDataSet);
begin
  inherited;
   eksps.FieldByName('access').asinteger:=access.itemindex;
   eksps.FieldByName('tone_pulse').asinteger:=tone_pulse.itemindex;
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
    if (cbTheme.checked or (sender = cxButton3))then
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
end;

procedure TExpForm.btnDeleteClick(Sender: TObject);
var
i:integer;
Forms:TList;
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
 eksps.Open;
 exit;
 end
 else
   if MessageDlg('Вы действительно хотите удалить из базы данных запись о приборе ' + eksps.fieldbyname('Eksp_Theme').AsString + ' / ' + eksps.fieldbyname('Eksp_header').AsString + '?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
 dm.q.SQL.Clear;
 dm.q.SQL.add('update eksp set hide=1 where eksp_nomer = :eksp_nomer');
 dm.q.parambyname('eksp_nomer').asinteger:=eksps.fieldbyname('Eksp_nomer').Asinteger;
 dm.q.execsql;
 dm.q.Transaction.commitretaining;
 eksps.Close;
 eksps.Open;
end;

procedure TExpForm.ekspsAfterOpen(DataSet: TDataSet);
begin
  inherited;
 signals.Open;
 curveset.Open;
 ekspparams.open;
 dm.GetStringsFromQuery(dm.sql,Objectslist.Properties.Items,'select distinct eksp_theme as theme from eksp where (( eksp_proc = 0 ) or ( eksp_proc >2 ) )  and (id_uplevel=-1) ', 'theme');
 OnOff.Open;
 daysdata.open;
 Hoursdata.Open;
 daysdata_F.open;
 Hoursdata_F.Open;
 access.ItemIndex:=eksps.FieldByName('access').asinteger;
 tone_pulse.ItemIndex:=eksps.FieldByName('tone_pulse').asinteger
end;

procedure TExpForm.ekspsBeforeClose(DataSet: TDataSet);
begin
  inherited;
 signals.close;
 curveset.close;
 ekspparams.close;
 OnOff.Close;
 daysdata.Close;
 Hoursdata.Close;
 daysdata_F.Close;
 Hoursdata_F.Close;
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
   dm.Create_Curve.ParamByName('ViewPage').value:= 'Исходный сигнал';
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
  id:=Eksps.fieldbyname('Eksp_nomer').asinteger;
  Eksps.close;
  Eksps.open;
  Eksps.locate('Eksp_Nomer',id,[]);
end;

procedure TExpForm.CurvesetAfterOpen(DataSet: TDataSet);
begin
  inherited;
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

procedure TExpForm.DS_SignalsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
// Fd_DbText.Properties.ReadOnly:=true;
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
// if not signals.active then signals.open;
 eksps.fieldbyname('Datetime_Finish').asdatetime:=
  eksps.fieldbyname('eksp_date').asdatetime+{
  eksps.fieldbyname('eksp_Time').asdatetime+}
      eksps.fieldbyname('PointAll').asinteger*eksps.fieldbyname('DeltX').asfloat/24/3600.0;
(* eksps.fieldbyname('Eksp_Datetime_Start').asdatetime:=
    eksps.fieldbyname('eksp_date').asdatetime{+
    eksps.fieldbyname('eksp_Time').asdatetime };
*)
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
  windowstate:=wsNormal;
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
begin
 if TcxButton(sender).tag=1 then
 begin
  s:=extractfilepath(application.exename)+'GetSignurData.exe '+inttostr(handle);
  winexec(pchar(s), cmdShow);
 end;
 if TcxButton(sender).tag=2 then
 begin
  if  MasterNewForm=nil then  Application.CreateForm(TMasterNewForm, MasterNewform);
  MasterNewForm.Targethandle:=handle;
  MasterNewForm.Remote:=modem.checked;
  MasterNewform.Prm.access:=access.ItemIndex;
  MasterNewForm.Prm.tone:=tone_pulse.itemindex;
  MasterNewform.Prm.PhoneNmb:=phone_number.Text;
  MasterNewForm.btnModem.Visible:= MasterNewForm.Remote ;
//        Rewrite(Fprm);
//      prm.Tone := False;        //импульсный набор
//      prm.PhoneNmb := '';       //нет номера
//      prm.Access := 10;         //выход в город через 9
//      Write(Fprm,prm);
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
     MasterNewForm.Prm.Access:=access.ItemIndex;
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
   if MasterNewForm.cbAlwaysOnTop.checked then MasterNewForm.FormStyle:=fsStayOnTop
  else MasterNewForm.Formstyle:=fsNormal;
  except
  end
 end

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
 //sleep(1000);
 CD:=PCopyDataStruct(m.LParam)^;
// s:=inttostr(integer(cd.lpData));
try
 RecToTransfer.fname:=PRecToTransfer(cd.lpData)^.fname;
 RecToTransfer.otherdata:=PRecToTransfer(cd.lpData)^.otherdata;
 Fname:=PRecToTransfer(PCopyDataStruct(m.LParam)^.lpData)^.fname;
 eksp_nom_fromDevice:=PRecToTransfer(PCopyDataStruct(m.LParam)^.lpData)^.otherData;
 Current_eksp_Nomer:=Eksps.fieldbyname('eksp_nomer').asinteger;
 eksps.locate('eksp_nomer', eksp_nom_FromDevice,[]);
 postmessage(m.wparam,wm_close,0,0) ;
      except  on e:exception  do
       begin
        showmessage('Некорректный обмен данными '+e.message);
        exit;
       end;
      end;
// application.ProcessMessages;
// update;

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
//        exit;
       end;
      end;
// Import_Signur_Form.showmodal;
 Import_Signur_Form.free;

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
(* lastvalue:=DataSingle[0];
 for i:=1 to NPoints-1 do
  begin
   if DataSingle[i]=0 then DataSingle[i]:=lastvalue;
   lastvalue:=DataSingle[i];
  end;
*)
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
(* lastvalue:=DataSingle[0];
 for i:=1 to NPoints-1 do
  begin
   if DataSingle[i]=0 then DataSingle[i]:=lastvalue;
   lastvalue:=DataSingle[i];
  end;
  *)
 FDD := TFileStream.Create(dm.ActiveStoragepath + signals.fieldbyname('Filedat').asstring, fmCreate);
 FDD.write(datasingle_D[0], sizeof(DataSingle_D) * NPoints);

 FDD.destroy;

 dm.q.Transaction.commitretaining;
 eksps.close; eksps.open;

 Current_eksp_Nomer:=Eksps.fieldbyname('eksp_nomer').asinteger;
 eksps.locate('eksp_nomer', Current_eksp_Nomer,[]);

// datasingle_H:=nil;
// datasingle_D:=nil;
      except  on e:exception  do
       begin
        showmessage('Некорректная обработка принятых данных '+e.message);
//        exit;
       end;
      end;
end;

procedure TExpForm.OnOffGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if OnOffGrid.DataSource.DataSet.fieldbyname('status').asinteger=0 then
    background := clsilver
end;

procedure TExpForm.DD1Change(Sender: TObject);
begin
  inherited;
 Archieve_Reopen;
end;

procedure TExpForm.Archieve_Reopen;
begin
 DaysData_F.close;
 DaysData_F.parambyname('Eksp_Nomer').asinteger:=eksps.fieldbyname('eksp_Nomer').asinteger;
 DaysData_f.parambyname('DD1').asdatetime:=trunc(dd1.date);
 DaysData_f.parambyname('DD2').asdatetime:=trunc(dd2.date)+1;
 DaysData_F.open;
 HoursData_F.close;
 HoursData_F.parambyname('Eksp_Nomer').asinteger:=eksps.fieldbyname('eksp_Nomer').asinteger;
 HoursData_f.parambyname('DD1').asdatetime:=trunc(dd1.date);
 HoursData_f.parambyname('DD2').asdatetime:=trunc(dd2.date)+1;
 HoursData_F.open;
 OnOff.close;
 OnOff.open;
 Hours_chart.bottomaxis.Automatic:=true;
 Days_chart.bottomaxis.Automatic:=true;
end;

procedure TExpForm.ds_eksp_themeDataChange(Sender: TObject; Field: TField);
begin
  inherited;
 archieve_reopen;
 Tone_pulse.Enabled:=modem.checked;
 Phone_number.Enabled:=modem.checked;
 Access.Enabled:=modem.checked;


end;

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
        0: Off_VT.AppendRecord([OnOff.fieldbyname('OnOff_Event').asdatetime,0,OnOff.fieldbyname('LastEvent').asdatetime]);
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
        OnOff_VT.AppendRecord([Off_VT.fieldbyname('OnOff_Event').asdatetime,0,On_VT.fieldbyname('LastEvent').asdatetime]);
        OnOff_VT.AppendRecord([On_VT.fieldbyname('OnOff_Event').asdatetime,1,Off_VT.fieldbyname('LastEvent').asdatetime]);
       end
       else
       begin
        OnOff_VT.AppendRecord([On_VT.fieldbyname('OnOff_Event').asdatetime,1,On_VT.fieldbyname('LastEvent').asdatetime]);
        OnOff_VT.AppendRecord([Off_VT.fieldbyname('OnOff_Event').asdatetime,0,Off_VT.fieldbyname('LastEvent').asdatetime]);
       end;
      ON_VT.next;
      Off_VT.next;
     end;

     if not OFF_VT.EOF then
       OnOff_VT.AppendRecord([Off_VT.fieldbyname('OnOff_Event').asdatetime,0,Off_VT.fieldbyname('LastEvent').asdatetime]);


(*    OnOff_VT_Grid.Active:=true;    OnOFF_VT_Grid.Clear;
    OnOff_VT.last ;
    while not OnOff_VT.BOF do
     begin
      OnOff_VT_Grid.AppendRecord([OnOff_VT.fieldbyname('OnOff_Event').asdatetime,
                                  OnOff_VT.fieldbyname('status').asinteger,
                                  OnOff_VT.fieldbyname('LastEvent').asdatetime]);
      OnOff_VT.prior;
     end;
  *)
    OnOff_VT.first;
    OnOFF_VT_chart.Active:=true;      OnOff_VT_Chart.Clear;

 {        OnOff_VT_Chart.AppendRecord([OnOff_VT.fieldbyname('OnOff_Event').asdatetime+1/3600/24,0]);
         OnOff_VT_Chart.AppendRecord([OnOff_VT.fieldbyname('OnOff_Event').asdatetime,0]);

    OnOff_VT.next;

  }
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
   OnOff_info.lines.add('общее время:'+formatfloat('0.00',s_total)+' суток');
   OnOff_info.lines.add(' в т.ч. время включений:'+formatfloat('0.00',s_On)+' суток ('+formatfloat('0.00',S_on/S_Total*100)+'%)');
   OnOff_info.lines.add(' в т.ч. время выключений:'+formatfloat('0.00',s_Off)+' суток ('+formatfloat('0.00',S_off/S_Total*100)+'%)');
  end;
// onOff_VT.active:=true;
 OnOff_Hours_chart.RefreshDataset(ONOFF_VT_chart,OnOff_Hours_chart.Series[0]);
 OnOff_Days_chart.RefreshDataset(ONOFF_VT_chart,OnOff_Days_chart.Series[0]);
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


  function CreateHtmlReportHeader(ReportHeader:string): string;
  var
    I: Integer;
  begin
//    HTML := TStringList.create;
    try
      HTML.Add('<HTML><HEAD><TITLE>');
      HTML.Add(ReportHeader);
      HTML.Add('</TITLE><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"><HEAD>');
      HTML.Add('<BODY>');
      HTML.Add(ReportHeader+'<BR>');
      HTML.Add('<BR>');
      HTML.Add('Объект:  ' + eksps.fieldbyname('EKSP_Theme').text + '<BR>');
      HTML.Add('Примечание к объекту:  ' + cxObjectMemo.text{eksps.FieldByName('eksp_signalsource').text} + '<BR><BR>');
      HTML.Add('<BR>');
      HTML.Add('Прибор: ' + eksps.FieldByName('Device_Name').asstring+'  '+eksps.FieldByName('eksp_header').asstring+'<BR>');
      HTML.Add('Ответственный: ' + eksps.FieldByName('eksp_author').text+'<BR>');
      HTML.Add('Примечание к прибору:' + cxDeviceMemo.text{eksps.FieldByName('EKSP_MEMO').text}+'<BR>');
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
      HTML.Add('<p align=left style="font-size:9pt">Отчет сформирован ' + FormatDateTime('d/m/yyyy h:nn', Now));
      HTML.Add('</BODY></HTML>');
    finally
      result := html.Text;
    end;
  end;

begin
   HTML := TStringList.create;
   case ArchievPC.TabIndex of
    0:begin
       CreateHtmlReportHeader('Отчет об истории включений-выключений');
       HTML.Add('<BR>');
       for i:=0 to OnOff_Info.lines.count-1 do HTML.Add(OnOff_Info.lines[i]+'<BR>');
       CreateHtmlReportTable_Values(OnOffGrid);
      end;
    1:begin
       CreateHtmlReportHeader('Отчет по часовым значениям');
       CreateHtmlReportTable_Values(HoursGrid);
      end;
    2:begin
       CreateHtmlReportHeader('Отчет по среднесуточным данным');
       CreateHtmlReportTable_Values(DaysGrid);
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
end;

procedure TExpForm.Hours_ChartAfterDraw(Sender: TObject);
begin
  inherited;
try
 OnOff_Hours_Chart.bottomaxis.Automatic:=true;
 onOff_Hours_Chart.BottomAxis.Minimum:=0;
 onOff_Hours_Chart.BottomAxis.Maximum:=hours_chart.BottomAxis.Maximum;
 onOff_Hours_Chart.BottomAxis.Minimum:=hours_chart.BottomAxis.Minimum;
// onOff_Hours_Chart.BottomAxis.Minimum:=hours_chart.BottomAxis.Minimum;
 OnOff_Hours_Chart.bottomaxis.Automatic:=false;
   except  on e:exception  do
       begin
//        showmessage('Ошибка '+e.message);
        exit;
       end;
 end;
end;

procedure TExpForm.Days_ChartAfterDraw(Sender: TObject);
begin
  inherited;
try
 OnOff_Days_Chart.bottomaxis.Automatic:=true;
 onOff_Days_Chart.BottomAxis.Minimum:=0;
 onOff_days_Chart.BottomAxis.Maximum:=Days_chart.BottomAxis.Maximum;
 onOff_Days_Chart.BottomAxis.Minimum:=Days_chart.BottomAxis.Minimum;
// onOff_Days_Chart.BottomAxis.Minimum:=Days_chart.BottomAxis.Minimum;
 OnOff_Days_Chart.bottomaxis.Automatic:=false;
   except  on e:exception  do
       begin
 //       showmessage('Ошибка '+e.message);
        exit;
       end;
 end;
end;

procedure TExpForm.cxButton4Click(Sender: TObject);
begin
  inherited;
try
 ArchievPC.TabIndex:=1;
 ChartPC.TabIndex:=0;

 Hours_chart.bottomaxis.Automatic:=true;
 hours_chart.BottomAxis.Minimum:=0;
 hours_chart.BottomAxis.Maximum:= hoursdata_F.fieldbyname('Hour_Value').asdatetime+1/12;
 hours_chart.BottomAxis.Minimum:= hoursdata_F.fieldbyname('Hour_Value').asdatetime-1-1/12;
 Hours_chart.bottomaxis.Automatic:=false;
 Hours_chart.Update;
 onOff_Hours_Chart.BottomAxis.Minimum:=0;
 onOff_Hours_Chart.BottomAxis.Minimum:=hours_chart.BottomAxis.Minimum;
 onOff_Hours_Chart.BottomAxis.Maximum:=hours_chart.BottomAxis.Maximum;
 OnOff_Hours_Chart.bottomaxis.Automatic:=false;
   except  on e:exception  do
       begin
 //       showmessage('Ошибка '+e.message);
        exit;
       end;
 end;
end;

procedure TExpForm.cxButton5Click(Sender: TObject);
begin
  inherited;
try
  ArchievPC.TabIndex:=2;
  ChartPC.TabIndex:=1;
 Days_chart.bottomaxis.Automatic:=true;
 Days_chart.BottomAxis.Minimum:=0;
 Days_chart.BottomAxis.Maximum:= Daysdata_F.fieldbyname('day_Value').asdatetime+1;
 Days_chart.BottomAxis.Minimum:= Daysdata_F.fieldbyname('Day_Value').asdatetime-31;
 Days_chart.bottomaxis.Automatic:=false;
 Days_chart.Update;
 onOff_Days_Chart.BottomAxis.Minimum:=0;
 onOff_Days_Chart.BottomAxis.Minimum:=Days_chart.BottomAxis.Minimum;
 onOff_Days_Chart.BottomAxis.Maximum:=Days_chart.BottomAxis.Maximum;
 OnOff_Days_Chart.bottomaxis.Automatic:=false;
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
{    if OnOff_F.FieldByName('status').asinteger=1 then text:='вкл';
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
 DaysData_F.Locate('Day_Value',series.XValue[valueIndex],[]);
 mousepanel.Caption:='      t='+formatdatetime('dd.mm hh:mm',series.XValue[valueIndex])+' Y='+
                               formatfloat('0.00',series.YValue[valueIndex]);
end;

procedure TExpForm.Hours_ChartClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
 archievPC.TabIndex:=1;
 HoursData_F.Locate('Hour_Value',series.XValue[valueIndex],[]);
 mousepanel.Caption:='       t='+formatdatetime('dd.mm hh:mm',series.XValue[valueIndex])+' Y='+
                               formatfloat('0.00',series.YValue[valueIndex]);
end;

procedure TExpForm.SpeedButton2Click(Sender: TObject);
begin
  inherited;
 hours_chart.LeftAxis.Automatic:=true;
 days_chart.LeftAxis.Automatic:=true;

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

procedure TExpForm.modemClick(Sender: TObject);
begin
  inherited;
 Tone_pulse.Enabled:=modem.checked;
 Phone_number.Enabled:=modem.checked;
 Access.Enabled:=modem.checked;
end;

procedure TExpForm.Tone_PulseClick(Sender: TObject);
begin
  inherited;
 eksps.edit;
end;

procedure TExpForm.ekspsAfterScroll(DataSet: TDataSet);
begin
  inherited;
 access.ItemIndex:=eksps.FieldByName('access').asinteger;
 tone_pulse.ItemIndex:=eksps.FieldByName('tone_pulse').asinteger;
end;

end.



