unit device_u_temp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TxFrame, DbGridUnit, DB, IBCustomDataSet,
  IBUpdateSQL, IBQuery, Menus, ImgList, Buttons, Mask, DBCtrls, ComCtrls,
  DBCtrlsEh, Grids, DBGridEh, TeEngine, Series, TeeProcs, Chart, DbChart, utils, shellapi, rxstrutils;

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
    N3: TMenuItem;
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
    DbGridFrame1: TDbGridFrame;
    miDeleteCalculation: TMenuItem;
    N1: TMenuItem;
    Splitter1: TSplitter;
    ParamPanel: TPanel;
    Label1: TLabel;
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
    edCustomer: TDBEdit;
    edCreate_date: TDBDateTimeEditEh;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edSale_Date: TDBDateTimeEditEh;
    cbTypeDevice: TComboBox;
    cbConverter: TComboBox;
    PageControl1: TPageControl;
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
    Chart: TDBChart;
    Series1: TLineSeries;
    Panel5: TPanel;
    Panel1: TPanel;
    btnProcessing: TBitBtn;
    btnGetHex: TBitBtn;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
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
    procedure N3Click(Sender: TObject);
    procedure ParamGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ParamGridCellClick(Column: TColumnEh);
    procedure ParamGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure q_deviceparamsBeforePost(DataSet: TDataSet);
    procedure q_deviceparamsAfterPost(DataSet: TDataSet);
    procedure q_QHBeforePost(DataSet: TDataSet);
    procedure q_QHAfterPost(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);
    procedure Label1DblClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure btnProcessingClick(Sender: TObject);
    procedure btnGetHexClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure DbGridFrame1GridGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure SetQHGridTitleAndMode;
   procedure CheckLocked;
   Function GetParamValue(ParamShortName:string):double;
   procedure CreateQH_Values;
   Function CheckParams:boolean;
 end;

var
  Device_Form: TDevice_Form;

implementation

uses dm_u,pascalc, pasfunc;



{$R *.dfm}

var Calc : TPasCalc;


procedure ProcessProc;
begin
  // Perform messages processing
  Application.ProcessMessages;
end;

procedure TDevice_Form.FormCreate(Sender: TObject);
begin
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
end;

procedure TDevice_Form.FormShow(Sender: TObject);
begin
 q_devices.close;
 q_devices.open;
end;

procedure TDevice_Form.q_devicesAfterDelete(DataSet: TDataSet);
begin
q_devices.Transaction.CommitRetaining;
end;

procedure TDevice_Form.q_devicesAfterOpen(DataSet: TDataSet);
begin
 cbTypeDevice.ItemIndex:=cbTypeDevice.Items.IndexOfObject(Tobject(q_devices.fieldbyname('TypeDevice_ID').asinteger));
 cbConverter.ItemIndex:=cbConverter.Items.IndexOfObject(Tobject(q_devices.fieldbyname('ID_Converter').asinteger));
 q_deviceparams.open;
 q_QH.Open;
 setQHGridTitleAndMode;
 CheckLocked;
 q_conditions.Open;
end;

procedure TDevice_Form.q_devicesAfterPost(DataSet: TDataSet);
begin
q_devices.Transaction.CommitRetaining;
end;

procedure TDevice_Form.q_devicesAfterScroll(DataSet: TDataSet);
begin
 cbTypeDevice.ItemIndex:=cbTypeDevice.Items.IndexOfObject(Tobject(q_devices.fieldbyname('TypeDevice_ID').asinteger));
 cbConverter.ItemIndex:=cbConverter.Items.IndexOfObject(Tobject(q_devices.fieldbyname('ID_Converter').asinteger));
 setQHGridTitleAndMode;
 CheckLocked;
end;

procedure TDevice_Form.q_devicesBeforeClose(DataSet: TDataSet);
begin
q_deviceparams.close;
q_QH.close;
q_conditions.close;
end;

procedure TDevice_Form.q_devicesBeforeScroll(DataSet: TDataSet);
begin
try
 if (q_devices.State in [dsedit]) then q_devices.post;
 q_devices.edit;
 q_devices.fieldbyname('TypeDevice_ID').asinteger:=  integer(cbTypeDevice.Items.Objects[cbTypeDevice.ItemIndex]);
 q_devices.fieldbyname('ID_Converter').asinteger:=  integer(cbConverter.Items.Objects[cbConverter.ItemIndex]);
 q_devices.post;
     except on E: Exception do
           showmessage('Ошибка при сохранении расчета в базу данных:' +E.Message);
 end;
end;

procedure TDevice_Form.btnSaveInputDataClick(Sender: TObject);
begin
 q_devicesBeforeScroll(q_devices);
 if (q_devices.State in [dsedit]) then q_devices.post;
 if (q_deviceparams.State in [dsEdit]) then q_deviceparams.post;
 if (q_QH.state in [dsEdit]) then q_QH.post;
end;

procedure TDevice_Form.miRefreshClick(Sender: TObject);
begin
 q_devices.close;
 q_devices.open;
end;

procedure TDevice_Form.miCloseClick(Sender: TObject);
begin
close;
end;

procedure TDevice_Form.cbTypeDeviceCloseUp(Sender: TObject);
begin
 q_devices.edit;
 q_devices.fieldbyname('DeviceTypeName').asstring:=  cbTypeDevice.text;
 q_devices.post;
end;

procedure TDevice_Form.cbConverterCloseUp(Sender: TObject);
begin
 q_devices.edit;
 q_devices.fieldbyname('ConverterName').asstring:=  cbConverter.text;
 q_devices.post;
end;

procedure TDevice_Form.N3Click(Sender: TObject);
begin
 if  application.MessageBox( pansiChar( format( QUEST_DeleteCalc,[q_devices.fieldbyname('Name').asstring])),
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
  end
end;

procedure TDevice_Form.ParamGridCellClick(Column: TColumnEh);
begin
 ParamGrid.Columns[3].ReadOnly:=q_deviceparams.FieldByName('CHANGEABLE').asinteger=0;
end;

procedure TDevice_Form.ParamGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
ParamGrid.Columns[3].ReadOnly:=q_deviceparams.FieldByName('CHANGEABLE').asinteger=0;
end;

procedure TDevice_Form.q_deviceparamsBeforePost(DataSet: TDataSet);
begin
 if q_deviceparams.fieldbyname('Format').asstring='0' then
  q_deviceparams.fieldbyname('param_value').value:=round(q_deviceparams.fieldbyname('param_value').value);
end;

procedure TDevice_Form.q_deviceparamsAfterPost(DataSet: TDataSet);
begin
 dm.tranDefault.CommitRetaining;
 q_QH.close;q_QH.open;
end;

procedure TDevice_Form.SetQHGridTitleAndMode;
begin
 QHGrid.columns[1].title.Caption:=q_devices.fieldbyname('VT_X_Name').asstring+'|'+q_devices.fieldbyname('VT_X_Unit').asstring;
 QHGrid.columns[2].title.Caption:=q_devices.fieldbyname('VT_Y_Name').asstring+'|'+q_devices.fieldbyname('VT_Y_Unit').asstring;
 QHGrid.readonly:=not (q_devices.fieldbyname('CALCMODE').asstring='USERTABLE');
 Chart.BottomAxis.Title.Caption:=q_devices.fieldbyname('VT_X_Name').asstring+','+q_devices.fieldbyname('VT_X_Unit').asstring;
 Chart.LeftAxis.Title.Caption:=q_devices.fieldbyname('VT_Y_Name').asstring+','+q_devices.fieldbyname('VT_Y_Unit').asstring;
 Chart.RefreshDataSet(q_QH,Series1);
end;

procedure TDevice_Form.q_QHBeforePost(DataSet: TDataSet);
begin
  if q_QH.fieldbyname('X_Value').asfloat > GetParamValue('Hmax')
   then q_QH.fieldbyname('X_Value').asfloat:= GetParamValue('Hmax');
end;

Function TDevice_Form.GetParamValue(ParamShortName:string):double;
begin
 q_Deviceparams.disablecontrols;
 if q_Deviceparams.Locate('ShortName',ParamShortName,[])
  then result:=q_deviceparams.fieldbyname('Param_Value').Value;
  q_Deviceparams.enablecontrols;
end;

procedure TDevice_Form.q_QHAfterPost(DataSet: TDataSet);
begin
 dm.tranDefault.CommitRetaining;
end;

procedure TDevice_Form.PageControl1Change(Sender: TObject);
begin
 Chart.RefreshDataSet(q_QH,Series1);
end;

procedure TDevice_Form.Label1DblClick(Sender: TObject);
begin
 if ParamPanel.width<50 then ParamPanel.width:=width *3 div 4
  else ParamPanel.width:=45;
end;

procedure TDevice_Form.btnReportClick(Sender: TObject);
var
  HTML: TStringList;
  i:integer;
  QHImageFilename,HTMLFileName:string;
  Image:TImage;

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
      HTML.Add('Прибор:  ' + q_devices.fieldbyname('Name').text + '<BR>');
      HTML.Add('Номер прибора:  ' + q_devices.fieldbyname('DeviceNumber').text + '<BR><BR>');
      HTML.Add('Дата создания:  ' + formatdatetime('dd.mm.yyyy',q_devices.fieldbyname('Create_Date').asdatetime) + '<BR>');
//      HTML.Add('<BR>');
      HTML.Add('Тип водовода: ' + cbTypeDevice.text+'<BR>');
      HTML.Add('Тип акустического преобразователя: ' + cbConverter.text+'<BR>');
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
   HTML := TStringList.create;
   CreateHtmlReportHeader('---------');
//   HTML.Add('<BR>');
   CreateHtmlReportTable_Values(ParamGrid);
   CreateHtmlReportTable_Values(QHGrid);
   QHImagefilename:=ExtractFilePath(Application.exename)+'HTML\QH_'+GetGuidstr+'.bmp';
   Image:=TImage.create(self); Image.height:=Chart.height; Image.width:=Chart.width;
   Chart.paintto(Image.Canvas,0,0);
   Image.Picture.SaveToFile(QHImagefilename);
   dm.ConvertBmpToJpeg(QHImagefilename);
   HTML.Add('<BR><IMG SRC = "'+ChangeFileExt(QHImagefilename,'.jpg')+'" ALT="Характеристика"<BR>');
   HTML.Add('<p align=left style="font-size:9pt">Отчет сформирован ' + FormatDateTime('d/m/yyyy h:nn', Now));
   HTML.Add('</BODY></HTML>');
   HTMLFilename:=ExtractFilePath(Application.exename)+'HTML\'+GetGuidstr+'.htm';
   HTML.SaveToFile(HTMLFileName);
   ShellExecute(Application.Handle, nil, pchar(HTMLFilename), nil, nil, SW_SHOW);
   HTML.Free;
end;

procedure TDevice_Form.btnProcessingClick(Sender: TObject);
begin
 if CheckParams   // если параметры корректны, считает характристику
  then  CreateQH_values;
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
begin
 //
 if (q_deviceparams.State in [dsEdit]) then q_deviceparams.post;
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
       showmessage('Не выполнено условие:'+q_Conditions.fieldbyname('Condition').asstring);
       Result:=false;
      end;
    end;
   vars.Free;
   Calc.ClearVars;
   q_Conditions.Next;
  end;
end;

procedure TDevice_Form.CreateQH_Values;  // рассчитывает характеристику.
//Сначала считает значения по X,
//полагая их равномерно распределенными по оси от 0 до HMax
var
 Hmax:double;
 i,N:integer;
 step:double;
 x:double;
begin
if (q_deviceparams.State in [dsEdit]) then q_deviceparams.post;
q_QH.disablecontrols;
q_QH.FetchAll;
Hmax:=GetParamValue('Hmax');
N:=q_QH.recordcount;
q_QH.First;
i:=0;
Step:=HMax/(N-1);
while not q_QH.eof do
 begin
  q_QH.edit;
  x:=Step*i;
  q_QH.FieldByName('X_Value').AsFloat:=strtofloat(formatfloat('0.00',x));
  q_QH.post;
  q_qh.Next;
  i:=i+1;
 end;
 q_QH.enablecontrols;
 Chart.RefreshDataSet(q_QH,Series1);
 if q_devices.fieldbyname('CalcMode').asstring='USERTABLE' then exit;

end;
procedure TDevice_Form.btnGetHexClick(Sender: TObject);
var
 Y_array:array[0..63] of single;
 X_array:array[0..63] of single;
 X_Current: array of single;
 N,i, N64:Integer;
 Y,Y1,X,X1,Y2,X2:double;
 StepX, StepX64,HMax:double;
begin
 Hmax:=GetParamValue('Hmax');
 N:=q_QH.recordcount;
 setlength(X_Current,N);
 i:=0;
 StepX:=HMax/(N-1);
 for i:=0 to N-1 do
 begin
  x:=StepX*i;
  X_Current[i]:=strtofloat(formatfloat('0.00',x));
 end;
 i:=0;
 N64:=64;
 StepX64:=HMax/(N64-1);
 for i:=0 to N64-1 do
  begin
    X_array[i]:=StepX64*i;
  end;
  X_current:=nil;
end;

procedure TDevice_Form.N6Click(Sender: TObject);
begin
 q_devices.edit;
 q_devices.fieldbyname('Locked').asinteger:= 1;
 q_devices.post;
 CheckLocked;
end;

procedure TDevice_Form.N7Click(Sender: TObject);
begin
 q_devices.edit;
 q_devices.fieldbyname('Locked').asinteger:= 0;
 q_devices.post;
 CheckLocked;
end;

procedure TDevice_Form.CheckLocked;  //Заблокирована ли запись?
begin
 tsDeviceAttribute.Enabled:=q_devices.fieldbyname('locked').asinteger<>1;
 tsParamGrid.Enabled:=q_devices.fieldbyname('locked').asinteger<>1;
 tsQH.Enabled:=q_devices.fieldbyname('locked').asinteger<>1;
end;


procedure TDevice_Form.DbGridFrame1GridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
 if q_devices.FieldByName('Locked').asinteger=1 then Afont.Style:=[fsBold]
end;

procedure TDevice_Form.FormDestroy(Sender: TObject);
begin
  Calc.Free;
end;

end.
