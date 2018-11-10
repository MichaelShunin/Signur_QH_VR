unit calculation_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  Menus, ComCtrls, ExtCtrls,  StdCtrls, DB,
  Buttons, TxFrame, DbGridUnit, IBCustomDataSet, IBQuery, IBUpdateSQL,
  DBCtrls, Mask, Grids, DBGrids,DBGridEh, IBSQL, rxStrUtils, utils, ImgList;

type
  TCalculation_Form = class(TForm)
    CalcsPanel: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    pcInputValues: TPageControl;
    TabSheet1: TTabSheet;
    DbGridFrame1: TDbGridFrame;
    DbGridFrame2: TDbGridFrame;
    ds_calc: TDataSource;
    q_calculations: TIBQuery;
    N1: TMenuItem;
    miDeleteCalculation: TMenuItem;
    TabSheet2: TTabSheet;
    CalcType: TRadioGroup;
    ObmotkaSchema: TRadioGroup;
    PazRotor: TRadioGroup;
    PazStator: TRadioGroup;
    ObmotkaSterghen: TRadioGroup;
    SteelRotor: TRadioGroup;
    SteelStator: TRadioGroup;
    TabSheet3: TTabSheet;
    edName: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    edDescr: TDBMemo;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    miClose: TMenuItem;
    N2: TMenuItem;
    miCreateNew: TMenuItem;
    miSaveEdit: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    updateCalc: TIBUpdateSQL;
    q_table2: TIBQuery;
    q_calculationsID: TIntegerField;
    q_calculationsID_ENGINE: TIntegerField;
    q_calculationsNAME: TIBStringField;
    q_calculationsCALC_DATE: TDateTimeField;
    q_calculationsCALC_TYPE: TIBStringField;
    q_calculationsPAZ_STATOR_TYPE: TSmallintField;
    q_calculationsPAZ_ROTOR_TYPE: TSmallintField;
    q_calculationsDESCR: TIBStringField;
    q_calculationsINPUTFILE: TIBStringField;
    q_calculationsOUTPUTFILE: TIBStringField;
    q_calculationsCALC_TYPE_NUM: TSmallintField;
    q_calculationsSTEEL_ROTOR: TSmallintField;
    q_calculationsSTEEL_STATOR: TSmallintField;
    q_calculationsOBMOTKA_SCHEMA: TSmallintField;
    q_calculationsOBMOTKA_STERGHEN: TSmallintField;
    q_calculationsENGINE_NAME: TIBStringField;
    ds_table2: TDataSource;
    updateTable2: TIBUpdateSQL;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    FrameTable6: TDbGridFrame;
    FrameTable4: TDbGridFrame;
    DbGridFrame5: TDbGridFrame;
    DbGridFrame6: TDbGridFrame;
    q_Table4: TIBQuery;
    ds_Table4: TDataSource;
    q_table5: TIBQuery;
    ds_table5: TDataSource;
    q_TableUmaxMin: TIBQuery;
    ds_TableUmaxMin: TDataSource;
    q_table6: TIBQuery;
    ds_table6: TDataSource;
    UpdateTable4: TIBUpdateSQL;
    UpdateTable5: TIBUpdateSQL;
    UpdateTable6: TIBUpdateSQL;
    updateTableUMaxMin: TIBUpdateSQL;
    FrameRPPP: TDbGridFrame;
    q_N6: TIBQuery;
    DS_N6: TDataSource;
    updateN6: TIBUpdateSQL;
    DbGridFrame3: TDbGridFrame;
    UpdateRPPP: TIBUpdateSQL;
    q_RPPP: TIBQuery;
    ds_RPPP: TDataSource;
    inputFile: TDBMemo;
    N5: TMenuItem;
    Panel2: TPanel;
    btnSaveInputData: TBitBtn;
    TabSheet6: TTabSheet;
    btnProcessing: TBitBtn;
    Timer1: TTimer;
    TabMainEngine: TTabSheet;
    pbMainEngine: TPaintBox;
    cbMainSizeMetric: TCheckBox;
    PageControl1: TPageControl;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    OutputFile: TDBMemo;
    ResultInfo: TLabel;
    TabSheet9: TTabSheet;
    btnSaveOutput: TBitBtn;
    q_calculationsOUTPUT_COUNT: TIntegerField;
    q_OutPutParam_NOFPOINT: TIBSQL;
    SG: TStringGrid;
    q_outputData_NOfPoint: TIBQuery;
    q_outputData_NOfPointCV_NUMBER: TIntegerField;
    q_outputData_NOfPointCV_VALUE_STR: TIBStringField;
    q_outputData_NOfPointCV_VALUE: TFloatField;
    q_outputData_NOfPointNAME_RUS: TIBStringField;
    q_outputData_NOfPointNAME_SHORT: TIBStringField;
    q_outputData_NOfPointED_IZM: TIBStringField;
    Splitter2: TSplitter;
    OutPutData: TMemo;
    Splitter3: TSplitter;
    ImageList1: TImageList;
    OutputData2: TMemo;
    procedure DbGridFrame1btnSearchCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miDeleteCalculationClick(Sender: TObject);
    procedure q_calculationsAfterDelete(DataSet: TDataSet);
    procedure q_calculationsAfterPost(DataSet: TDataSet);
    procedure miSaveEditClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure q_calculationsAfterOpen(DataSet: TDataSet);
    procedure q_calculationsAfterScroll(DataSet: TDataSet);
    procedure q_calculationsBeforeScroll(DataSet: TDataSet);
    procedure q_calculationsBeforeClose(DataSet: TDataSet);
    procedure DbGridFrame1GridGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure q_Table4AfterOpen(DataSet: TDataSet);
    procedure q_table6AfterOpen(DataSet: TDataSet);
    procedure q_table2AfterPost(DataSet: TDataSet);
    procedure N5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pcInputValuesChange(Sender: TObject);
    Procedure CreateInputFile;
    procedure btnProcessingClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure pbMainEnginePaint(Sender: TObject);
    procedure DbGridFrame2GridGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure cbMainSizeMetricClick(Sender: TObject);
    procedure OutputFileChange(Sender: TObject);
    procedure btnSaveOutputClick(Sender: TObject);
  private
    { Private declarations }
     // чтение выходного файла
     firstlineresult,lastLineresult:integer;
     NofPoints:integer;
    procedure GetAndSaveOutputParam_NOfPoint;
    procedure ShowOutputDataFromDB;
    Procedure ClearOutputDataINDB;
  public
    { Public declarations }
    // элементы данные
     // для хранения выбора пользователя
    itype,inum,ishow : Integer;
     // массив геометрических размеров
    s : array[0..8] of Word;
    // т.к. в результате прорисовки часто
    // используется целочисленное деление на 2,
    // то некоторые данные могут исказиться.
    // В частности, нечётные величины размеров
    // будут преобразованы к чётным. Для того
    // чтобы этого избежать введён следующий массив:
    sdub : array[0..8] of Word;
    // и соответствующая процедура MyDuble;
    // массив видимости элементов
    bVis : array[0..8] of bool;
    // переменные позиционирования изображения
    xstart,ystart,xend,xend2,yend : Word;
    procedure ChiefSizeASinchronMotorShow;
         // главные размеры асинхроного двигателя
     Procedure ChiefSizeASinchronMotorMetric;

      // прорисовка стрелок
     Procedure MyArrowUp(ix,iy : Integer;pbCanvas:TCanvas);    // вверх
     Procedure MyArrowDown(ix,iy : Integer;pbCanvas:TCanvas);  // вниз
     Procedure MyArrowRight(ix,iy : Integer;pbCanvas:TCanvas); // вправо
     Procedure MyArrowLeft(ix,iy : Integer;pbCanvas:TCanvas);  // влево
     Procedure MyArrowDownLeft(ix,iy : Integer;pbCanvas:TCanvas); // косая влево и вниз
     Procedure MyArrowUpRight(ix,iy : Integer;pbCanvas:TCanvas);  // косая вправо и вверх
  end;

var
  Calculation_Form: TCalculation_Form;

implementation

uses dm_u, main_u, createNewcalc_u, cloneNewcalc_u;

{$R *.dfm}

procedure TCalculation_Form.DbGridFrame1btnSearchCloseClick(
  Sender: TObject);
begin
  DbGridFrame1.btnSearchCloseClick(Sender);

end;

procedure TCalculation_Form.FormShow(Sender: TObject);
begin
 q_calculations.close;
 q_calculations.open;
end;

procedure TCalculation_Form.miDeleteCalculationClick(Sender: TObject);
begin
 if  application.MessageBox( pansiChar( format( QUEST_DeleteCalc,[q_calculations.fieldbyname('Name').asstring])),
                  pchar(msg_warning), MB_YESNO or MB_ICONQUESTION) = idYes
            then q_calculations.delete;
end;

procedure TCalculation_Form.q_calculationsAfterDelete(DataSet: TDataSet);
begin
 q_calculations.Transaction.CommitRetaining;
end;

procedure TCalculation_Form.q_calculationsAfterPost(DataSet: TDataSet);
begin
   q_calculations.Transaction.CommitRetaining;
end;

procedure TCalculation_Form.miSaveEditClick(Sender: TObject);
begin
 q_calculationsBeforeScroll(q_calculations);

 if (q_calculations.State in [dsedit]) then q_calculations.post;
 if (q_table2.State in [dsEdit]) then q_table2.post;
 if (q_table4.State in [dsEdit]) then q_table4.post;
 if (q_table5.State in [dsEdit]) then q_table5.post;
 if (q_table6.State in [dsEdit]) then q_table6.post;
 if (q_tableUmaxMin.State in [dsEdit]) then q_tableUmaxMin.post;
 if (q_N6.State in [dsEdit]) then q_N6.post;
 if (q_RPPP.State in [dsEdit]) then q_RPPP.post;
 CreateInputFile;

end;

procedure TCalculation_Form.miCloseClick(Sender: TObject);
begin
 miSaveEditClick(nil);
 close
end;

procedure TCalculation_Form.q_calculationsAfterOpen(DataSet: TDataSet);
begin
 calcType.ItemIndex:=q_calculations.fieldbyname('Calc_Type_Num').asinteger;
 PazRotor.ItemIndex:=q_calculations.fieldbyname('Paz_Rotor_Type').asinteger;
 PazStator.ItemIndex:=q_calculations.fieldbyname('Paz_Stator_Type').asinteger;
 SteelStator.ItemIndex:=q_calculations.fieldbyname('Steel_Stator').asinteger;
 SteelRotor.ItemIndex:=q_calculations.fieldbyname('Steel_Rotor').asinteger;
 ObmotkaSchema.ItemIndex:=q_calculations.fieldbyname('Obmotka_Schema').asinteger;
 ObmotkaSterghen.ItemIndex:=q_calculations.fieldbyname('Obmotka_Sterghen').asinteger;
 q_table2.open;
 q_table4.open;
 q_table5.open;
 q_table6.open;
 q_tableUMaxMin.open;
 q_n6.open;
 q_rppp.open;
 q_OutPutData_NOfPoint.open
end;

procedure TCalculation_Form.q_calculationsAfterScroll(DataSet: TDataSet);
begin
 calcType.ItemIndex:=q_calculations.fieldbyname('Calc_Type_Num').asinteger;
 PazRotor.ItemIndex:=q_calculations.fieldbyname('Paz_Rotor_Type').asinteger;
 PazStator.ItemIndex:=q_calculations.fieldbyname('Paz_Stator_Type').asinteger;
 SteelStator.ItemIndex:=q_calculations.fieldbyname('Steel_Stator').asinteger;
 SteelRotor.ItemIndex:=q_calculations.fieldbyname('Steel_Rotor').asinteger;
 ObmotkaSchema.ItemIndex:=q_calculations.fieldbyname('Obmotka_Schema').asinteger;
 ObmotkaSterghen.ItemIndex:=q_calculations.fieldbyname('Obmotka_Sterghen').asinteger;
 if pcInputValues.ActivePage=TabMainEngine then pbMainEngine.Repaint  ;
 ShowOutputDataFromDB;
end;

procedure TCalculation_Form.q_calculationsBeforeScroll(DataSet: TDataSet);
begin
try
 if (q_calculations.State in [dsedit]) then q_calculations.post;
 q_calculations.edit;
 q_calculations.fieldbyname('Calc_Type_Num').asinteger :=  calcType.ItemIndex;
 case   q_calculations.fieldbyname('Calc_Type_Num').asinteger of
  0: q_calculations.fieldbyname('Calc_Type').asstring:='CHECK';
  1: q_calculations.fieldbyname('Calc_Type').asstring:='OPTIM';
  2: q_calculations.fieldbyname('Calc_Type').asstring:='CHCK_CIRCLE';
 end;
 q_calculations.fieldbyname('Paz_Rotor_Type').asinteger:= PazRotor.ItemIndex;
 q_calculations.fieldbyname('Paz_Stator_Type').asinteger:=PazStator.ItemIndex;
 q_calculations.fieldbyname('Steel_Stator').asinteger:=SteelStator.ItemIndex ;
 q_calculations.fieldbyname('Steel_Rotor').asinteger:=  SteelRotor.ItemIndex;
 q_calculations.fieldbyname('Obmotka_Schema').asinteger:=  ObmotkaSchema.ItemIndex;
 q_calculations.fieldbyname('Obmotka_Sterghen').asinteger:=ObmotkaSterghen.ItemIndex;
 q_calculations.post;
     except on E: Exception do
           showmessage('Ошибка при сохранении расчета в базу данных:' +E.Message);
 end;
end;

procedure TCalculation_Form.q_calculationsBeforeClose(DataSet: TDataSet);
begin
q_table2.close;
q_table4.close;
q_table5.close;
q_table6.close;
q_tableUMaxMin.close;
q_n6.close;
q_rppp.close;
q_OutPutData_NOfPoint.close;
end;

procedure TCalculation_Form.DbGridFrame1GridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
 if q_calculations.fieldbyname('Calc_Type_Num').asinteger =0 then Afont.color:=clRed;
 if q_calculations.fieldbyname('Calc_Type_Num').asinteger =1 then AFont.Color:=clBlue;
end;

procedure TCalculation_Form.q_Table4AfterOpen(DataSet: TDataSet);
begin
 frametable4.Visible:= q_table4.recordcount>0
end;

procedure TCalculation_Form.q_table6AfterOpen(DataSet: TDataSet);
begin
 frametable6.Visible:= q_table6.recordcount>0
end;

procedure TCalculation_Form.q_table2AfterPost(DataSet: TDataSet);
begin
 dm.tranDefault.CommitRetaining
end;

procedure TCalculation_Form.N5Click(Sender: TObject);
var
 ID_Calc:integer;
begin
 If CloneNewCalc_Form.showmodal = mrOK then
  begin
   try
    dm.CloneNEWCALC.ParamByName('Calc_Name').asstring:=CloneNewCalc_form.edCalcName.text;
    dm.CloneNEWCALC.ParamByName('Calc_id').asinteger:=q_calculations.fieldbyname('id').asinteger;
    dm.CloneNEWCALC.ParamByName('Calc_Descr').asstring:=CloneNewCalc_form.edCalcDescr.text;
    dm.CloneNewCalC.ExecProc;
    dm.CloneNEWCALC.transaction.CommitRetaining;
    id_calc:=dm.CloneNEWCALC.ParamByName('ID_Calculation').asinteger;
    calculation_form.show;
    calculation_form.q_calculations.close;
    calculation_form.q_calculations.open;
    calculation_form.q_calculations.Locate('ID',id_calc,[]);
    pcInputValues.ActivePageIndex:=0;
    except on E: Exception do
           showmessage('Ошибка при добавлении расчета в базу данных:' +E.Message);
    end;
   end;
end;

procedure TCalculation_Form.FormCreate(Sender: TObject);
begin
 pcInputValues.ActivePageIndex:=0;
end;

procedure TCalculation_Form.pcInputValuesChange(Sender: TObject);
begin
 miSaveEditClick(nil);
end;

procedure TCalculation_Form.CreateInputFile;
var
 TXT:TStringList;
 C:integer;
 LN,LV,CN,CV:integer;
 S:string;
 Name_In_File:string;
 i,L:integer;
 Value_In_File:string;

procedure insertIntoTXT(L:integer;C:integer;s:string);
var ss:string;
    ii:integer;
 begin
  if ((L=0) or (C=0)) then exit;
  ss:=TXT[L-1];
  for ii:=1 to length(s) do ss[c+ii-1]:=s[ii];
  TXT[L-1]:=ss;
 end;

procedure insertIntoTXT1(L:integer;C:integer;s:string);
var ss:string;
    ii:integer;
 begin
  if ((L=0) or (C=0)) then exit;
  ss:=TXT[L-1];
  for ii:=length(s) downto 1 do
    ss[c-(length(s)-ii)]:=s[ii];
  TXT[L-1]:=ss;
 end;

Procedure SetParamToFile(q:TIBQuery);
begin
   q.first;
  while not q.eof do
   begin
   insertIntoTXT(q.fieldbyname('File_Line_Name').asinteger,
                 q.fieldbyname('File_Col_Name').asinteger,
                 q.fieldbyname('NAME_IN_FILE').asstring);
   Value_In_File:=formatfloat(q.fieldbyname('Format').asstring, q.fieldbyname('CV_Value').asfloat);
   if pos('.',Value_In_File)=0 then Value_In_File:=Value_In_File +'.';
   insertIntoTXT(q.fieldbyname('File_Line_VALUE').asinteger,
                 q.fieldbyname('File_Col_VALUE').asinteger,
                   Value_In_File) ;
    q.Next;
   end;
end;

begin

 try
  TXT:=TstringList.create;
//  s:='*********************************************************************************';
//  TXT.Add(s);
   for L:=1 to MaxLine_Input do
    begin
     s:='';
     for C:=1 to MaxCol_Input do   s:=s+' ';
     TXT.Add(s);
    end;

  dm.qw.close;
  dm.qw.sql.Text:='select * from Parameters p where not p.param_group containing :p';
  dm.qw.parambyname('p').asstring:='TABLE';
  dm.qw.open;

  dm.qw.locate('PARAM_GROUP','PAZSTATOR',[]);
  L:=0 ;
  for i:=0 to PazStator.Items.count-1 do
   begin
     insertIntoTXT(dm.qw.fieldbyname('File_Line_Name').asinteger+L,
                    dm.qw.fieldbyname('File_Col_Name').asinteger,
                    dm.qw.fieldbyname('NAME_IN_FILE').asstring+' '+ANSIUPPERCASE(PazStator.items[i]));
     if i=PAZStator.ItemIndex then  Value_In_File:='1' else Value_In_File:='0';
     insertIntoTXT(dm.qw.fieldbyname('File_Line_VALUE').asinteger+L,
                   dm.qw.fieldbyname('File_Col_VALUE').asinteger,
                   Value_In_File);
     L:=L+2;
   end;

  dm.qw.locate('PARAM_GROUP','PAZROTOR',[]);
    L:=0 ;
  for i:=0 to PazRotor.Items.count-1 do
   begin
     insertIntoTXT(dm.qw.fieldbyname('File_Line_Name').asinteger+L,
                   dm.qw.fieldbyname('File_Col_Name').asinteger,
                   dm.qw.fieldbyname('NAME_IN_FILE').asstring+' '+ANSIUPPERCASE(PazRotor.items[i]));
     if i=PAZRotor.ItemIndex then  Value_In_File:='1' else Value_In_File:='0';
     insertIntoTXT(dm.qw.fieldbyname('File_Line_VALUE').asinteger+L,
                   dm.qw.fieldbyname('File_Col_VALUE').asinteger,
                   Value_In_File);
     L:=l+2;
   end;

  dm.qw.locate('PARAM_GROUP','CALCTYPE',[]);
    L:=0 ;
  for i:=0 to CALCTYPE.Items.count-1 do
   begin
     insertIntoTXT(dm.qw.fieldbyname('File_Line_Name').asinteger+L,
                   dm.qw.fieldbyname('File_Col_Name').asinteger,
                   dm.qw.fieldbyname('NAME_IN_FILE').asstring+' '+ANSIUPPERCASE(CALCTYPE.items[i])+' РАСЧЕТ');
     if i=CALCTYPE.ItemIndex then  Value_In_File:='1' else Value_In_File:='0';
     insertIntoTXT(dm.qw.fieldbyname('File_Line_VALUE').asinteger+L,
                   dm.qw.fieldbyname('File_Col_VALUE').asinteger,
                   Value_In_File);
     L:=l+2;
   end;
  
  dm.qw.locate('PARAM_GROUP','OBMOTKASTERGHEN',[]);
  insertIntoTXT(dm.qw.fieldbyname('File_Line_Name').asinteger,
                   dm.qw.fieldbyname('File_Col_Name').asinteger,
                   dm.qw.fieldbyname('NAME_IN_FILE').asstring);
   if ObmotkaSterghen.ItemIndex=1 then  Value_In_File:='1' else Value_In_File:='0';
   insertIntoTXT(dm.qw.fieldbyname('File_Line_VALUE').asinteger,
                   dm.qw.fieldbyname('File_Col_VALUE').asinteger,
                   Value_In_File);

   dm.qw.locate('PARAM_GROUP','OBMOTKASCHEMA',[]);
  insertIntoTXT(dm.qw.fieldbyname('File_Line_Name').asinteger,
                   dm.qw.fieldbyname('File_Col_Name').asinteger,
                   dm.qw.fieldbyname('NAME_IN_FILE').asstring);
   if ObmotkaSCHEMA.ItemIndex=1 then  Value_In_File:='1' else Value_In_File:='0';
   insertIntoTXT(dm.qw.fieldbyname('File_Line_VALUE').asinteger,
                   dm.qw.fieldbyname('File_Col_VALUE').asinteger,
                   Value_In_File);

   dm.qw.locate('PARAM_GROUP','STEELSTATOR',[]);
  insertIntoTXT(dm.qw.fieldbyname('File_Line_Name').asinteger,
                   dm.qw.fieldbyname('File_Col_Name').asinteger,
                   dm.qw.fieldbyname('NAME_IN_FILE').asstring);
   Value_In_File := inttostr(STEELSTATOR.ItemIndex+1);
   insertIntoTXT(dm.qw.fieldbyname('File_Line_VALUE').asinteger,
                   dm.qw.fieldbyname('File_Col_VALUE').asinteger,
                   Value_In_File);

  dm.qw.locate('PARAM_GROUP','STEELROTOR',[]);
  insertIntoTXT(dm.qw.fieldbyname('File_Line_Name').asinteger,
                   dm.qw.fieldbyname('File_Col_Name').asinteger,
                   dm.qw.fieldbyname('NAME_IN_FILE').asstring);
   Value_In_File := inttostr(STEELROTOR.ItemIndex+1);
   insertIntoTXT(dm.qw.fieldbyname('File_Line_VALUE').asinteger,
                   dm.qw.fieldbyname('File_Col_VALUE').asinteger,
                   Value_In_File);

  dm.qw.locate('PARAM_GROUP','N6',[]);
  insertIntoTXT(dm.qw.fieldbyname('File_Line_Name').asinteger,
                   dm.qw.fieldbyname('File_Col_Name').asinteger,
                   dm.qw.fieldbyname('NAME_IN_FILE').asstring);
  q_N6.first;
  C:=0;
  while not q_N6.Eof do
   begin
    Value_In_File:=q_n6.fieldbyname('ARRAY_VALUE').asstring;
    insertIntoTXT1(dm.qw.fieldbyname('File_Line_VALUE').asinteger,
                   dm.qw.fieldbyname('File_Col_VALUE').asinteger+c,
                   Value_In_File) ;
    c:=c+4;
    q_n6.next;
   end;
//     1  -5   7 -11  13 -17
//     1  -5   7  13 -11 -17
//   1  -5 7  13 -11-17
  dm.qw.locate('PARAM_GROUP','RPPP',[]);
  insertIntoTXT(dm.qw.fieldbyname('File_Line_Name').asinteger,
                   dm.qw.fieldbyname('File_Col_Name').asinteger,
                   dm.qw.fieldbyname('NAME_IN_FILE').asstring);
  q_RPPP.first;
  C:=0;
  while not q_RPPP.Eof do
   begin
    Value_In_File:=q_RPPP.fieldbyname('ARRAY_VALUE').asstring;
    insertIntoTXT1(dm.qw.fieldbyname('File_Line_VALUE').asinteger,
                   dm.qw.fieldbyname('File_Col_VALUE').asinteger+c,
                   Value_In_File) ;
    c:=c+4;
    q_RPPP.next;
   end;

  dm.qw.close;

   setParamToFile(q_Table2);
   setParamToFile(q_Table4);
   setParamToFile(q_Table5);
   setParamToFile(q_Table6);
   setParamToFile(q_TableUmaxMin);


  q_calculations.edit;

  for i:=0 to txt.count-1 do txt[i]:=trimright(txt[i]);
  InputFile.Lines.assign(TXT);
  q_calculations.post;
  txt.savetofile(extractFilePath(application.exename)+InputFileName);
  TXT.Destroy;
  except on E: Exception do
           showmessage('Ошибка при создании входного файла:' +E.Message);
  end;
end;

procedure TCalculation_Form.btnProcessingClick(Sender: TObject);
begin
 try
 deletefile(OutputFileName);
 ClearOutputDataINDB;

 misaveeditClick(nil);

 winexec(pansichar( extractfilepath(application.exename)+FortranExename{+
          ' '+InputFileName+' '+OutputFileName}),sw_showNormal) ;

 timer1.Enabled:=true;
 except on E: Exception do
           showmessage('Ошибка при вызове расчетной программы:' +E.Message);
  end;
end;


procedure TCalculation_Form.Timer1Timer(Sender: TObject);
begin
 if fileexists(Outputfilename) then
  begin
   timer1.Enabled:=false;
   misaveeditclick(nil);
   q_calculations.edit;
   OutputFile.Lines.loadfromfile(OutputFileName);
   q_calculations.post;
   pcInputValues.ActivePageIndex:=5;
   OutputFileChange(nil);
    ShowOutputDataFromDB;
    btnSaveOutputClick(nil);
  end;
end;

// главные размеры асинхроного двигателя
procedure TCalculation_Form.ChiefSizeASinchronMotorShow;
begin
 //  MyDuble(true); // запоминает исходные значения
   // s[0] - ls
   s[0]:=round(s[0]/2); // половина
   // s[1] - d
   // s[2] - lr
   s[2]:=round(s[2]/2); // половина
   // s[3] - Dв
   // s[4] - Dкл
   // s[5] - D
   // s[6] - Dн
   // s[7] - a
   // s[8] - b
   s[8]:=round(s[8]/2); // половина

   // рисуем линиями
   with pbMainEngine.Canvas do
   begin
      // основание (пьедестал)
      MoveTo(xstart+20,yend);
      LineTo(xstart+20,yend-s[3]);
      LineTo(xend-20,yend-s[3]);
      LineTo(xend-20,yend);
      // ротор
      Rectangle(xend2-s[2],yend-s[3],xend2+s[2],yend-s[5]+s[1]);
      // левый прямоугольник
      Rectangle(xend2-s[2]-s[7],yend-s[4]-s[8],xend2-s[2],yend-s[4]+s[8]);
      // правый прямоугольник
      Rectangle(xend2+s[2]+s[7],yend-s[4]-s[8],xend2+s[2],yend-s[4]+s[8]);
      // статор
      Rectangle(xend2-s[0],yend-s[6],xend2+s[0],yend-s[5]);
   end; // with

 //  MyDuble(false); // возвращаем исходные значения
end;


// главные размеры асинхроного двигателя
procedure TCalculation_Form.ChiefSizeASinchronMotorMetric;
var
  ibuf : Integer; // переменная промежуточного хранения
begin
//   MyDuble(true); // запоминает исходные значения
   // s[0] - ls
//   s[0]:=round(s[0]/2); // половина
   // s[1] - d (delta)
   // s[2] - lr
//   s[2]:=round(s[2]/2); // половина
   // s[3] - Dв
   // s[4] - Dкл
   // s[5] - D
   // s[6] - Dн
   // s[7] - a
   // s[8] - b
//   s[8]:=round(s[8]/2); // половина
   with pbMainEngine.Canvas do
   begin
      MoveTo(xend2-s[0],yend-s[6]);
      LineTo(xend2-s[0],yend-s[6]-25);
      MoveTo(xend2+s[0],yend-s[6]);
      LineTo(xend2+s[0],yend-s[6]-25);
      MoveTo(xend2-s[0],yend-s[6]-20);
      LineTo(xend2+s[0],yend-s[6]-20);
      MyArrowLeft(xend2-s[0],yend-s[6]-20,pbMainEngine.Canvas);
      MyArrowRight(xend2+s[0],yend-s[6]-20,pbMainEngine.Canvas);
      // ls
      TextOut(xend2-5,yend-s[6]-35,'ls');
      MoveTo(xend2-s[0],yend-s[6]);
      LineTo(xend2+s[0],yend-s[5]);
      MoveTo(xend2+s[0],yend-s[6]);
      LineTo(xend2-s[0],yend-s[5]);
      // диагональки статора
      MoveTo(xend2,yend-s[5]-13);
      LineTo(xend2,yend-s[5]+s[1]+13);
      MyArrowUp(xend2,yend-s[5]+s[1],pbMainEngine.Canvas);
      MyArrowDown(xend2,yend-s[5],pbMainEngine.Canvas);
      // d
      TextOut(xend2-12,yend-s[5]-15,'d');
      MoveTo(xend2-s[2],yend-s[5]+s[1]);
      LineTo(xend2+s[2],yend-s[3]);
      MoveTo(xend2+s[2],yend-s[5]+s[1]);
      LineTo(xend2-s[2],yend-s[3]);
      // диагональки ротора
      MoveTo(xend2+s[0],yend-s[6]);
      LineTo(xend,yend-s[6]);
      MoveTo(xend-5,yend-s[6]);
      LineTo(xend-5,yend);
      MyArrowUp(xend-5,yend-s[6],pbMainEngine.Canvas);
      MyArrowDown(xend-5,yend,pbMainEngine.Canvas);
      // Dн
      ibuf:=round(s[6]/2);
      TextOut(xend,yend-ibuf-3,'Dн');
      MoveTo(xend2+s[0],yend-s[5]);
      LineTo(xend-25,yend-s[5]);
      MoveTo(xend-30,yend-s[5]);
      LineTo(xend-30,yend);
      MyArrowUp(xend-30,yend-s[5],pbMainEngine.Canvas);
      MyArrowDown(xend-30,yend,pbMainEngine.Canvas);
      // D
      ibuf:=round(s[5]/2);
      TextOut(xend-25,yend-ibuf-3,'D');
      MoveTo(xend2-s[2]-s[7],yend-s[4]-s[8]);
      LineTo(xend2-s[2]-s[7]-25,yend-s[4]-s[8]);
      MoveTo(xend2-s[2]-s[7]-20,yend-s[4]-s[8]);
      LineTo(xend2-s[2]-s[7]-20,yend-s[4]+s[8]);
      MoveTo(xend2-s[2]-s[7],yend-s[4]+s[8]);
      LineTo(xend2-s[2]-s[7]-25,yend-s[4]+s[8]);
      MyArrowUp(xend2-s[2]-s[7]-20,yend-s[4]-s[8],pbMainEngine.Canvas);
      MyArrowDown(xend2-s[2]-s[7]-20,yend-s[4]+s[8],pbMainEngine.Canvas);
      // b
      TextOut(xend2-s[2]-s[7]-30,yend-s[4]-5,'b');
      MoveTo(xstart+20,yend-s[3]);
      LineTo(xstart,yend-s[3]);
      MoveTo(xstart+5,yend-s[3]-20);
      LineTo(xstart+5,yend+20);
      MyArrowUp(xstart+5,yend,pbMainEngine.Canvas);
      MyArrowDown(xstart+5,yend-s[3],pbMainEngine.Canvas);
      // Dв
      TextOut(xstart-19,yend-15,'Dв');
      MoveTo(xend2-s[2]-s[7]-7,yend-s[4]);
      LineTo(xend-40,yend-s[4]);
      MoveTo(xend-45,yend-s[4]);
      LineTo(xend-45,yend);
      MyArrowUp(xend-45,yend-s[4],pbMainEngine.Canvas);
      MyArrowDown(xend-45,yend,pbMainEngine.Canvas);
      // Dкл
      ibuf:=round(s[4]/2);
      TextOut(xend-42,yend-ibuf-5,'Dкл');
      MoveTo(xend2-s[2],yend-s[3]-10);
      LineTo(xend2+s[2],yend-s[3]-10);
      MyArrowLeft(xend2-s[2],yend-s[3]-10,pbMainEngine.Canvas);
      MyArrowRight(xend2+s[2],yend-s[3]-10,pbMainEngine.Canvas);
      // lr
      TextOut(xend2-3,yend-s[3]-24,'lr');
      MoveTo(xend2-s[2],yend-s[4]-s[8]);
      LineTo(xend2-s[2],yend-s[4]-s[8]-25);
      MoveTo(xend2-s[2]-s[7],yend-s[4]-s[8]);
      LineTo(xend2-s[2]-s[7],yend-s[4]-s[8]-25);
      MoveTo(xend2-s[2]+17,yend-s[4]-s[8]-20);
      LineTo(xend2-s[2]-s[7]-17,yend-s[4]-s[8]-20);
      MyArrowLeft(xend2-s[2],yend-s[4]-s[8]-20,pbMainEngine.Canvas);
      MyArrowRight(xend2-s[2]-s[7],yend-s[4]-s[8]-20,pbMainEngine.Canvas);
      // a
      TextOut(xend2-s[2]-s[7],yend-s[4]-s[8]-35,'a');
      MoveTo(xstart,yend);
      LineTo(xend,yend);
      // основание
   end;
 //MyDuble(false); // возвращаем исходные значения
  // MyVisibleProc; // видимость компонентов
   // вывод наименований на экран
  { Label5.Caption:='ls';
   Label6.Caption:='d';
   Label7.Caption:='lr';
   Label8.Caption:='Dв';
   Label9.Caption:='Dкл';
   Label10.Caption:='D';
   Label11.Caption:='Dн';
   Label12.Caption:='a';
   Label13.Caption:='b';
}
end;


procedure TCalculation_Form.pbMainEnginePaint(Sender: TObject);
var
   // файл из которого считываются
   // геометрические размеры
   f : TStrings;
   // счётчик
   i : Shortint;
   ID_Calc_V:integer;
   ss:double;
begin
  // настройка позиционирования изображения
try
  ID_Calc_V:=q_table2.fieldbyname('ID').asinteger;
  q_table2.First;
  while not q_table2.eof do
   begin
    if q_table2.fieldbyname('Image').asinteger=1 then
     s[q_table2.fieldbyname('image_pos').asinteger-1]:=q_table2.fieldbyname('cv_value').value*10;
    q_table2.next;
   end;
  q_table2.locate('ID',ID_Calc_V,[]);
  ss:=s[0]     ;

 try
  for i:=0 to 8 do
   if ss<>0 then  s[i]:=round(s[i]*250/ss);
   except
 end;

 except on E: Exception do
           showmessage('Ошибка при отрисовке основных размеров:' +E.Message);
 end;
   // s[0] - ls
   // s[1] - d (delta)
   // s[2] - lr
   // s[3] - Dв
   // s[4] - Dкл
   // s[5] - D
   // s[6] - Dн
   // s[7] - a
   // s[8] - b

  xstart:=60; // крайняя левая координата по оси x
  ystart:=60; // крайняя верхняя координата по оси y
  xend:=pbMainEngine.Width-60;  // крайняя правая координата по оси x
  xend2:=30+round(xend/2); // середина по оси x
  yend:=pbMainEngine.Height-60;  // крайняя нижняя координата по оси y



  // сделаем белый холст.
  pbMainEngine.Color:=RGB(255,255,255);
  pbMainEngine.Canvas.Rectangle(0,pbMainEngine.Height,pbMainEngine.Width,0);

  pbMainEngine.Canvas.Pen.Width:=3;
  ChiefSizeASinchronMotorShow;
  pbMainEngine.Canvas.Pen.Width:=1;
  if cbMainSizemetric.checked then        ChiefSizeASinchronMotorMetric;
 end;

 // стрелка вверх
// вершина стрелки находитсяв точке с
// координатами (ix,iy);
procedure TCalculation_Form.MyArrowUp(ix, iy: Integer; pbCanvas:TCanvas);
begin
   with pbCanvas do
   begin
      // граница области заливки
      MoveTo(ix,iy);
      LineTo(ix-4,iy+8);
      LineTo(ix+4,iy+8);
      LineTo(ix,iy);
      // заливка
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix-2,iy+6,RGB(255,255,255),fsSurface);
      FloodFill(ix+2,iy+6,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// стрелка вниз
// вершина стрелки находитсяв точке с
// координатами (ix,iy);
procedure TCalculation_Form.MyArrowDown(ix, iy: Integer; pbCanvas:TCanvas);
begin
   with pbCanvas do
   begin
      // граница области заливки
      MoveTo(ix,iy);
      LineTo(ix-4,iy-8);
      LineTo(ix+4,iy-8);
      LineTo(ix,iy);
      // заливка
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix-2,iy-6,RGB(255,255,255),fsSurface);
      FloodFill(ix+2,iy-6,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// стрелка влево
// вершина стрелки находитсяв точке с
// координатами (ix,iy);
procedure TCalculation_Form.MyArrowLeft(ix, iy: Integer; pbCanvas:TCanvas);
begin
   with pbCanvas do
   begin
      // граница области заливки
      MoveTo(ix,iy);
      LineTo(ix+8,iy-4);
      LineTo(ix+8,iy+4);
      LineTo(ix,iy);
      // заливка
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix+6,iy-2,RGB(255,255,255),fsSurface);
      FloodFill(ix+6,iy+2,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// стрелка вправо
// вершина стрелки находитсяв точке с
// координатами (ix,iy);
procedure TCalculation_Form.MyArrowRight(ix, iy: Integer; pbCanvas:TCanvas);
begin
   with pbCanvas do
   begin
      // граница области заливки
      MoveTo(ix,iy);
      LineTo(ix-8,iy-4);
      LineTo(ix-8,iy+4);
      LineTo(ix,iy);
      // заливка
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix-6,iy-2,RGB(255,255,255),fsSurface);
      FloodFill(ix-6,iy+2,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// наклонная стрелка влево и вниз
// вершина стрелки находитсяв точке с
// координатами (ix,iy);
procedure TCalculation_Form.MyArrowDownLeft(ix, iy: Integer; pbCanvas:TCanvas);
begin
   with pbCanvas do
   begin
      // граница области заливки
      MoveTo(ix,iy);
      LineTo(ix+8,iy-2);
      LineTo(ix+2,iy-8);
      LineTo(ix,iy);
      // заливка
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix+6,iy-3,RGB(255,255,255),fsSurface);
      FloodFill(ix+3,iy-5,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;

// наклонная стрелка вправо и верх
// вершина стрелки находитсяв точке с
// координатами (ix,iy);
procedure TCalculation_Form.MyArrowUpRight(ix, iy: Integer; pbCanvas:TCanvas);
begin
   with pbCanvas do
   begin
      // граница области заливки
      MoveTo(ix,iy);
      LineTo(ix-8,iy+2);
      LineTo(ix-2,iy+8);
      LineTo(ix,iy);
      // заливка
      Brush.Color:=RGB(0,0,0);
      FloodFill(ix-6,iy+3,RGB(255,255,255),fsSurface);
      FloodFill(ix-3,iy+5,RGB(255,255,255),fsSurface);
      Brush.Color:=RGB(255,255,255);
   end;
end;


procedure TCalculation_Form.DbGridFrame2GridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
if column.FieldName='CV_VALUE' then
 if  q_table2.fieldbyname('Image').asinteger=1 then  background:=clyellow;

end;

procedure TCalculation_Form.cbMainSizeMetricClick(Sender: TObject);
begin
pbMainEngine.Repaint
end;

procedure TCalculation_Form.OutputFileChange(Sender: TObject);
var
 s:string;
 i,j:integer;
begin
 REsultInfo.visible:=true;
 OutputData.lines.clear;
 for i:=0 to outputfile.Lines.count-1 do
  begin
   s:=ansiupperCase(trim(outputfile.Lines[i]));
   if pos('СВОДНАЯ ТАБЛИЦА',s)>0  then
    begin
     REsultInfo.visible:=false;
     FirstLineResult:=i+3;
     for j:=i+2 to outputfile.Lines.count-1 do
      begin
       s:=ansiupperCase(trim(outputfile.Lines[j]));
       OutputData.lines.add(s);
       if pos('****************',s)>0  then
         begin
         LastLineResult:=j;
         NofPoints:=(LastLineresult-Firstlineresult-6) div 7;
         break;
         end;
       end;
      break;
     end;
  end;
 if (not REsultInfo.visible) then OutputData.lines.insert(0,'------------Сводная таблица------------');
 OutputData2.Lines.clear;
 for i:=LastLineresult+3 to LastLineResult+2+15 do
  begin
    s:=ansiupperCase(trim(outputfile.Lines[i]));
    OutputData2.lines.add(s);
  end;
  btnSaveOutput.Enabled:=not REsultInfo.visible ;
end;

procedure TCalculation_Form.btnSaveOutputClick(Sender: TObject);
begin
 if  not  (q_calculations.State in [dsedit]) then q_calculations.edit;
 q_calculations.fieldbyname('output_Count').asinteger:=NofPoints;
 q_calculations.post;
 ClearOutputDataInDB;

 q_OutPutParam_NOfPoint.close;
 q_OutPutParam_NOfPoint.ExecQuery;

 while not q_OutPutParam_NOfPoint.eof do
  begin
   GetAndSaveOutputParam_NOfPoint;
   q_OutPutParam_NOfPoint.next;
  end;
  q_calculations.Transaction.CommitRetaining;
  q_OutPutData_NOfPoint.close;
  q_OutPutData_NOfPoint.open;

 // if btnSaveOutput.enabled then btnSaveOutputClick(nil)  ;
  ShowOutputDataFromDB;
end;

procedure TCalculation_Form.ShowOutputDataFromDB;
var
 ParamOld:string;
 R,C:integer;
begin
 if not q_OutPutData_NOfPoint.Active then q_OutPutData_NOfPoint.open;
 q_OutPutData_NOfPoint.fetchall;
 sg.visible:= ((q_OutPutData_NOfPoint.RecordCount>0) and (q_calculations.fieldbyname('Output_Count').asinteger>0));
 if not sg.visible then exit;
 sg.ColCount:=q_calculations.fieldbyname('Output_Count').asinteger+3;
 sg.RowCount:=q_OutPutData_NOfPoint.RecordCount div q_calculations.fieldbyname('Output_Count').asinteger;//+1;
 sg.cells[0,0]:='Наименование';
 sg.cells[1,0]:='Обозначение';
 sg.cells[2,0]:='Ед.изм.';
 for c:=1 to  q_calculations.fieldbyname('Output_Count').asinteger do
    sg.cells[c+2,0]:=inttostr(c);
 c:=2   ;
 r:=1;
  sg.cells[0,r]:=q_outputData_NOfPoint.fieldbyname('Name_Rus').asstring;
 sg.cells[1,r]:=q_outputData_NOfPoint.fieldbyname('Name_Short').asstring;
 sg.cells[2,r]:=q_outputData_NOfPoint.fieldbyname('Ed_Izm').asstring;
 ParamOld := q_outputData_NOfPoint.fieldbyname('Name_Rus').asstring ;
 while not q_OutPutData_NOfPoint.eof do
  begin
   if  q_outputData_NOfPoint.fieldbyname('Name_Rus').asstring = ParamOld then
     begin
       c:=c+1;
     end
      else
       begin
        c:=3;
        r:=r+1;
        ParamOld := q_outputData_NOfPoint.fieldbyname('Name_Rus').asstring ;
        sg.cells[0,r]:=q_outputData_NOfPoint.fieldbyname('Name_Rus').asstring;
        sg.cells[1,r]:=q_outputData_NOfPoint.fieldbyname('Name_Short').asstring;
        sg.cells[2,r]:=q_outputData_NOfPoint.fieldbyname('Ed_Izm').asstring;
       end;
   sg.cells[c,r]:=q_outputData_NOfPoint.fieldbyname('CV_Value_Str').asstring;
   q_OutPutData_NOfPoint.Next;
  end
end;

procedure TCalculation_Form.GetAndSaveOutputParam_NOfPoint;
var
 i,j,Row, Col :integer;
 StartRowInList :integer;
 OutputValueStr: string;
 s, s1:string;
 begin
 try
  Col:= q_OutPutParam_NOfPoint.fieldbyname('outputColumn').asinteger  ;
  StartRowInList:=1+(q_OutPutParam_NOfPoint.fieldbyname('OutputLine').asinteger-1)*(1+NOfPoints);
  for Row:=StartRowInList+1 to StartRowInList+NofPoints do
   begin
     s:= trim(OutPutData.Lines[Row]);
     if s<>'' then
      begin
         s1:='';
          for j:=1 to length(s)-1 do
               if ((s[j]<>' ') or ((s[j]=' ') and (s[j+1]<>' '))) then s1:=s1+s[j];
         OutputValueStr:=extractword(Col,s1,[' ']);
     //    memo1.lines.add(q_OutPutParam_NOfPoint.fieldbyname('id').asstring+' '+OutputValuestr);
         dm.qw.close;
         dm.qw.sql.Text:='insert into calc_values (CALC_ID ,      PARAM_ID ,    CV_NUMBER ,    CV_VALUE_STR ,  CV_VALUE ) '+
                         ' values (:CALC_ID ,  :PARAM_ID ,   :CV_NUMBER , :CV_VALUE_STR , :CV_VALUE)';
         dm.qw.parambyname('calc_Id').asinteger:=q_calculations.fieldbyname('id').asinteger;
         dm.qw.parambyname('param_ID').asinteger:=q_OutPutParam_NOfPoint.fieldbyname('id').asinteger;
         dm.qw.parambyname('cv_Number').asinteger:=row-StartRowInList+1;
         dm.qw.parambyname('cv_Value_STR').asstring:=OutputValueStr;
         if OutputValueStr = 'NAN' then  dm.qw.parambyname('cv_Value').value:=null
          else
           if OutputValueStr = 'INFINITY' then  dm.qw.parambyname('cv_Value').value:=null
            else
             begin
              OutputValuestr:=changesymbol(OutputValuestr,'.',decimalseparator);
              dm.qw.parambyname('cv_Value').asfloat:=strtofloat(OutputValuestr);
             end;
         dm.qw.ExecSQL;
      end;
   end;
    except on E: Exception do
           showmessage('Ошибка при сохранении результатов в базу данных:' +E.Message);
 end;
end;

Procedure TCalculation_Form.ClearOutputDataINDB;
begin
 dm.qw.close;
 dm.qw.sql.Text:='delete from calc_values where calc_id = :calc_id and Param_id in (select Id from Parameters where in_out = :in_Out)';
 dm.qw.parambyname('calc_Id').asinteger:=q_calculations.fieldbyname('id').asinteger;
 dm.qw.parambyname('in_out').asstring:='OUT';
 dm.qw.ExecSQL;
end;

end.
