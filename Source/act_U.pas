unit act_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MenuForm_u, Menus, TxMenus, TxComCtrls, TxControls, TxExtCtrls,
  TxClasses, TxForms, ComCtrls, ExtCtrls, TxDB, DB, IBCustomDataSet,
  TxStdCtrls, StdCtrls, TxGrids,  Grids, DBGridEh, TxDBCtrls,
  DBCtrls, xlcOPack, xlProOPack, xlcClasses, xlEngine, xlReport, IBQuery,
  TxFrame, DbGridUnit,  IBUpdateSQL, Spin, dbf, CheckLst;

const
 ACTS_SELECTsql = 'select ac.*, a.*, c.*,    '+
 ' (select min(cashier_fio) from app_carpets apc,  act_carpets acc '+
 ' where  '+
  '  acc.id_acts = ac.id_acts and  '+
  '  apc.ac_id = acc.ac_id) as cashier_fio, '+
 ' W.w_name,  W.curator_name, '+
 ' (select min(P.name) from  Providers P   where '+
 '  p.id = ac.id_provider) as Provider_name '+
 ' from acts ac JOIN clients C  ON C.d_id = AC.d_id '+
 '  JOIN ADDRESSES A  ON A.id_addresse = AC.id_address '+
 ' left JOIN WAYS W ON W.W_ID = AC.w_id  ';
type
  TActsForm = class(TMenuForm)
    N1: TMenuItem;
    GroupBox5: TGroupBox;
    DBGridEh1: TDBGridEh;
    ds_clientActs: TDataSource;
    transfer_carpets: TIBDataSet;
    ds_transfer_carpets: TDataSource;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    D1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    D2: TDateTimePicker;
    btnShow: TButton;
    WhatDate_RG: TRadioGroup;
    xlProPackage1: TxlProPackage;
    xlReport1: TxlReport;
    DbGridFrame: TDbGridFrame;
    miShowClient: TMenuItem;
    pmReport: TMenuItem;
    N4: TMenuItem;
    Acts: TIBQuery;
    ActsID_ACTS: TIntegerField;
    ActsACT_TYPE: TSmallintField;
    ActsACT_NUMBER: TIntegerField;
    ActsD_ID: TIntegerField;
    ActsID_ADDRESS: TIntegerField;
    ActsDAY_NIGHT: TSmallintField;
    ActsDAY_ACTION: TDateField;
    ActsW_ID: TIntegerField;
    ActsUSERNAME: TIBStringField;
    ActsCREATE_DATE: TDateTimeField;
    ActsPHONE: TIBStringField;
    ActsACT_STATUS: TSmallintField;
    ActsD_NAME: TIBStringField;
    ActsLOW_ADDRESS: TIBStringField;
    actstatus_update: TIBUpdateSQL;
    ActsADDRESS: TIBStringField;
    Actsactstatus: TStringField;
    Panel26: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    cr_quantity: TSpinEdit;
    btnUpdateCarpetInAct: TButton;
    btnDeleteCarpet: TButton;
    btnDeleteAct: TButton;
    ActsW_NAME: TIBStringField;
    ActsCASHIER_FIO: TIBStringField;
    miPrintAct: TMenuItem;
    ActsPROVIDER_NAME: TIBStringField;
    btnImportDBF_For_1C: TButton;
    Get_Acts_For_1C: TIBQuery;
    SD: TSaveDialog;
    RG_Act_Status: TRadioGroup;
    Button8: TButton;
    ActsACT_FOR_RENAME: TSmallintField;
    Button1: TButton;
    Sortby: TEdit;
    btnClearSort: TButton;
    lbOrder: TListBox;
    mniN2: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    ActsCURATOR_NAME: TIBStringField;
    Edit1: TEdit;
    Button2: TButton;
    ActsID_PROVIDER: TIntegerField;
    Panel2: TPanel;
    Image1: TImage;
    MiScannerAct: TMenuItem;
    N7: TMenuItem;
    miPrintSelected: TMenuItem;
    Rjynhjkm1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    IBQuery1: TIBQuery;
    IntegerField1: TIntegerField;
    SmallintField1: TSmallintField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    SmallintField2: TSmallintField;
    DateField1: TDateField;
    IntegerField5: TIntegerField;
    IBStringField1: TIBStringField;
    DateTimeField1: TDateTimeField;
    IBStringField2: TIBStringField;
    SmallintField3: TSmallintField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    StringField1: TStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    SmallintField4: TSmallintField;
    IBStringField9: TIBStringField;
    IntegerField6: TIntegerField;
    miPrintSelected_2: TMenuItem;
    miPrintSelected_3: TMenuItem;
    mniCheckSignedAct: TMenuItem;
    ActsD_TYPE: TIBStringField;
    ActsCOUNT_ACTIVE_AC_ID: TIntegerField;
    ActsINN: TIBStringField;
    ActsIS_E_DELIVERY: TSmallintField;
    N11: TMenuItem;
    mnipdfallAct: TMenuItem;
    mniPDFACT: TMenuItem;
    mniN12: TMenuItem;
    ActsCRM_CURATORS: TIBStringField;
    ActsW_CRM_CURATOR: TIBStringField;
    mniSvodStatus: TMenuItem;
    GroupBox1: TGroupBox;
    cbAddFilter: TCheckBox;
    cbAddFilter_Curator: TCheckBox;
    cbAddFilter_D_TYPE: TCheckBox;
    ClientD_Name: TEdit;
    Curator_Name: TEdit;
    D_TYPE: TEdit;
    chkType_KROME: TCheckBox;
    cbAddFilter_Provider: TCheckBox;
    cbProvider: TComboBox;
    ActsMAX_AC_LASTDAY: TDateField;
    qs: TIBQuery;
    mniN13: TMenuItem;
    ActsNOT_IN_ACT_REPORT: TSmallintField;
    ActsNOT_IN_SCHEDULE: TSmallintField;
    miSaveExcelSelected: TMenuItem;
    N12: TMenuItem;
    ActsID_1C: TIntegerField;
    ActsD1_SVOD: TDateField;
    ActsD2_SVOD: TDateField;
    btnSetSelectedActStatus: TButton;
    procedure N1Click(Sender: TObject);
    procedure ds_clientActsDataChange(Sender: TObject; Field: TField);
    procedure ActsACT_TYPEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure GridActTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure miShowClientClick(Sender: TObject);
    procedure GridActGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure btnShowClick(Sender: TObject);
    procedure TaxxiFormCreate(Sender: TObject);
    procedure miReportClick(Sender: TObject);
    procedure TDbGridFrame1GridGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure ActsAfterPost(DataSet: TDataSet);
    procedure ActsCalcFields(DataSet: TDataSet);
    procedure btnDeleteActClick(Sender: TObject);
    procedure btnDeleteCarpetClick(Sender: TObject);
    procedure btnUpdateCarpetInActClick(Sender: TObject);
    procedure miPrintActClick(Sender: TObject);
    procedure btnImportDBF_For_1CClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure ActsACT_STATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnClearSortClick(Sender: TObject);
    procedure lbOrderClick(Sender: TObject);
    procedure ActsW_NAMEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ActsDAY_NIGHTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure mniN2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MiScannerActClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure miPrintSelectedClick(Sender: TObject);
    procedure mniCheckSignedActClick(Sender: TObject);
    procedure ActsCOUNT_ACTIVE_AC_IDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure mnipdfallActClick(Sender: TObject);
    procedure mniPDFACTClick(Sender: TObject);
    procedure mniN12Click(Sender: TObject);
    procedure mniSvodStatusClick(Sender: TObject);
    procedure mniN13Click(Sender: TObject);
    procedure TaxxiFormActivate(Sender: TObject);
    procedure btnSetSelectedActStatusClick(Sender: TObject);
  private
    { Private declarations }
    b_order: boolean;
  public
    { Public declarations }
  end;

var
  ActsForm: TActsForm;

implementation

uses MainForm_u, DataModule, clientdionix_u, GetClient_u,
  setProviderForm_u, VisuCB, scanner_act_u, Chect_Act_U, Check_signedAct_U;

{$R *.dfm}

procedure TActsForm.N1Click(Sender: TObject);
begin
  inherited;
  MainForm.show;
  MainForm.windowstate := wsNormal;
end;

procedure TActsForm.ds_clientActsDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  Transfer_carpets.close;
  Transfer_carpets.parambyname('id_acts').asinteger := acts.fieldbyname('id_acts').AsInteger;
  Transfer_carpets.open;
  RG_Act_Status.itemindex:=acts.fieldbyname('act_status').asinteger;
  edit1.text:='9'+formatfloat('0',acts.fieldbyname('act_type').asinteger)+formatfloat('00',acts.fieldbyname('id_provider').asinteger)+
  formatfloat('00000000',acts.fieldbyname('act_number').asinteger);
end;

procedure TActsForm.ActsACT_TYPEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  case ActsACT_TYPE.asinteger of
    0: text := 'передачи';
    1: text := 'возврата';
    2: text := 'утери';
    3: text := 'списания';  
    4: text := 'свод/завоз';
    5: text := 'свод/вывоз';
  end;

end;

procedure TActsForm.GridActTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var id: integer;
begin
  inherited;
end;

procedure TActsForm.miShowClientClick(Sender: TObject);
var
  y, m, d: word;
begin
  inherited;

  if ClientDionixForm = nil then
  begin
    MainForm.miClientsClick(nil);
    ClientDionixForm.pagecontrol.activepageindex := 6;
  end;
  if (not ((Sender=miPrintSelected) or (Sender=miPrintSelected_2) or (Sender=miPrintSelected_3) or
   (Sender = mnipdfallAct) or (Sender = mnipdfAct)  )) then ClientDionixForm.show;
  decodedate(now, y, m, d);
  ClientDionixForm.year_cb.ItemIndex := y - 2002;
  ClientDionixForm.month_cb.ItemIndex := m - 1;
  if not ClientDionixForm.DS.dataset.active then ClientDionixForm.DS.dataset.Open;
  ClientDionixForm.DS.dataset.locate('d_id', acts.FieldByName('d_id').AsInteger, []);
  if (not ((Sender=miPrintSelected) or (Sender=miPrintSelected_2) or
           (sender=miPrintSelected_3) or  (Sender=mnipdfallAct) or  (Sender=mnipdfAct)))
   then ClientDionixForm.btnshowscheduleClick(nil);
 if ((Sender=miPrintSelected) or (Sender=miPrintSelected_2) or (Sender=miPrintSelected_3)
  or (Sender = mnipdfallAct) or  (Sender=mnipdfAct))  then
  begin
   ClientDionixForm.ds_clientActs.DataSet.close;
   ClientDionixForm.ds_clientActs.DataSet.Open;
  end;
  ClientDionixForm.GridAct.datasource.dataset.locate('id_acts', acts.fieldbyname('id_acts').asinteger, []);
  ClientDionixForm.WindowState := wsnormal;
end;

procedure TActsForm.GridActGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  case ActsACT_TYPE.asinteger of
    0: background := clcream;
    1: background := clLtGray;
    2: background := clwhite;
  end;

end;

procedure TActsForm.btnShowClick(Sender: TObject);
var s:string;
ACTS_WHERE:string;
begin
  inherited;
//  acts//.close;
Acts.Close;
  Acts.SQL.Text:= ' select * '; //ACTS_SELECTsql;
   case WhatDate_RG.ItemIndex of
    0: acts_WHERE := 'from Get_act_Day_action (:DA1,:DA2) where id_acts>0 ';
    1: acts_WHERE := 'from Get_act_Create_Date(:DA1,:DA2) where id_acts>0 ';
  end;
  if (cbAddFilter.checked and (trim(ClientD_Name.Text)<>'')) then
   begin
   ACTS_WHERE := aCTS_WHERE+' and Upper(D_Name) containing :D_Name ';
   end  ;
  if (cbAddFilter_cURATOR.checked and (trim(CURATOR_NAME.Text)<>'')) then
   begin
    ACTS_WHERE := aCTS_WHERE+' and Upper(cURATOR_NAME) containing :cURATOR_NAME ';
   end  ;
  if (cbAddFilter_D_TYPE.checked and (trim(D_TYPE.Text)<>'')) then
   begin
    if chkType_KROME.Checked then ACTS_WHERE := aCTS_WHERE+' and (not (Upper(D_TYPE) containing :D_TYPE)) '
     else ACTS_WHERE := aCTS_WHERE+' and Upper(D_TYPE) containing :D_TYPE ';
   end  ;
  if (cbAddFilter_Provider.checked and (cbProvider.itemindex<>0)) then
   begin
   ACTS_WHERE := aCTS_WHERE+' and ID_Provider = :id_Provider ';
   end  ;

  Acts.SQL.Add(ACTS_WHERE);
  Acts.SQL.Add('Order by');


  if Sortby.hint<>'' then
  Acts.SQL.Add(SortBy.Hint) else  Acts.SQL.Add('Day_action');
  Acts.SQL.Add('desc');

  acts.ParamByName('DA1').asdatetime := trunc(D1.date);
  acts.ParamByName('DA2').asdatetime := trunc(D2.date)+1-0.000001;
  if (cbAddFilter.checked and (trim(ClientD_Name.Text)<>'')) then
   begin
   acts.ParamByName('D_Name').asstring := AnsiUppercase(trim(ClientD_Name.Text));
   end  ;
  if (cbAddFilter_cURATOR.checked and (trim(CURATOR_NAME.Text)<>'')) then
   begin
    acts.ParamByName('cURATOR_NAME').asstring := AnsiUppercase(trim(Curator_Name.Text));
   end  ;
  if (cbAddFilter_D_TYPE.checked and (trim(D_TYPE.Text)<>'')) then
   begin
    acts.ParamByName('D_TYPE').asstring := AnsiUppercase(trim(D_TYPE.Text));
   end  ;
  if (cbAddFilter_Provider.checked and (cbProvider.itemindex<>0)) then
   begin
     acts.ParamByName('ID_Provider').asinteger := integer(cbProvider.items.Objects[cbProvider.itemindex]);
   end  ;

  acts.open;
end;

procedure TActsForm.TaxxiFormCreate(Sender: TObject);
var
 i:integer;
begin
  inherited;
  d1.date := trunc(now) - 7;
  d2.date := trunc(now)+1;
  lbOrder.Items.Clear;
  for i:=0 to dbGridFrame.Grid.columns.Count-1 do
   begin
    lbOrder.Items.add(dbGridFrame.Grid.columns[i].Title.Caption);
   end;
(* dm.GetStringsObjectsFromQuery(dm.work1, cbProvider.Items, 'select distinct Name, ID from Providers order by name', 'Name', 'ID');
 cbProvider.items.InsertObject(0,'любой',TObject(-1));
 cbProvider.itemindex:=0;
  *)
end;

procedure TActsForm.miReportClick(Sender: TObject);
var xlReport: TxlReport;
  xlreportparam: Txlreportparam;
begin
  xlReport := TxlReport.CreateEx(Self, ExtractFilePath(Application.ExeName)
    + '\Templates\RegistryActs.xls');
  try
    xlReport.AddDataSet(Acts, 'ActsRange');
    xlReport.AddDataSet(Transfer_Carpets, 'Transfer_CarpetsRange');
    xlreport.DataSources[1].MasterSourceName := 'Acts';
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'dateReport';
    xlreportparam.value := formatdatetime('dd mmm yyyy hh:mm', now);
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Header';
    xlreportparam.value := 'Дата ' + WhatDate_RG.items[whatDate_RG.Itemindex] +
      ' c ' + formatdatetime('dd mmm yyyy', d1.date) + ' по ' + formatdatetime('dd mmm yyyy', d2.date);
    xlReport.Report(False);

  finally
    xlReport.Free;
  end

end;

procedure TActsForm.TDbGridFrame1GridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  case ActsACT_TYPE.asinteger of
    0: background := clcream;
    1: background := clskyBlue;
    2: background := clwhite;
  end;

    if acts.fieldbyname('act_type').asinteger =4 then
   begin
    AFont.Color:=clRed;
    AFont.Style:=[fsBold];
   end;
 if acts.fieldbyname('act_type').asinteger =5 then
   begin
    AFont.Color:=clblue;
    AFont.Style:=[fsBold];
   end;
   

  if ((acts.fieldbyname('w_id').asinteger=0) and
       (acts.fieldbyname('act_type').asinteger<2)) then
   begin
    afont.color:=clPurple;
    if ansiUppercase(column.fieldname)='PROVIDER_NAME' then
     begin
      background:=clyellow;
      if Acts.fieldbyname('act_for_Rename').asinteger=1 then  background:=clAqua;
     end; 
   end;
  if acts.fieldbyname('act_type').asinteger=2 then
   begin
    afont.color:=clgreen;
   end;
  if ((Column.FieldName='ACT_FOR_RENAME') and (acts.fieldbyname('act_for_rename').asinteger=1)) then
   begin
    background:=clAqua;
   end;

   if ansiUppercase(column.fieldname)='IS_E_DELIVERY' then
     begin
      if Acts.fieldbyname('IS_E_DELIVERY').asinteger=1 then  background:=clYellow;
     end;
 
  if Pos('READONLY',dm.user.TextRight) >0 then
      begin
       // pnlOtmena.Visible:=False;
        GroupBox5.Enabled:=False;
       // ts1.Enabled:=False;
      end;

end;

procedure TActsForm.ActsAfterPost(DataSet: TDataSet);
begin
  inherited;
 acts.Transaction.CommitRetaining;
end;

procedure TActsForm.ActsCalcFields(DataSet: TDataSet);
begin
  inherited;
  case acts.FieldByName('act_status').asinteger of
   0: acts.FieldByName('actstatus').asstring:='создан (напечатан)';
   1: acts.FieldByName('actstatus').asstring:='не создан';
   2: acts.FieldByName('actstatus').asstring:='подписан';
   3: acts.FieldByName('actstatus').asstring:='не подписан';
   4:acts.FieldByName('actstatus').asstring:='напечатан';
   5:acts.FieldByName('actstatus').asstring:='передан на подпись';
   6:acts.FieldByName('actstatus').asstring:='съехал';
   7:acts.FieldByName('actstatus').asstring:='не оформлен';
   8:acts.FieldByName('actstatus').asstring:='штамп';
   9:acts.FieldByName('actstatus').asstring:='остановлен';
   10:acts.FieldByName('actstatus').asstring:='реклама';
   11: acts.FieldByName('actstatus').asstring:='сохр.Excel'  ;
   12:acts.FieldByName('actstatus').asstring:='е-подпись';
  end;
end;

procedure TActsForm.btnDeleteActClick(Sender: TObject);
begin
  inherited;
 if MessageDlg('Вы уверены?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  acts.Delete;
  acts.transaction.commitretaining;
end;

procedure TActsForm.btnDeleteCarpetClick(Sender: TObject);
var Bookmark:TBookMark;
begin
  inherited;
 if MessageDlg('Вы уверены?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  try
    if dm.work.Transaction.intransaction then dm.work.Transaction.rollback;
    if transfer_carpets.recordcount=1 then
     begin
      acts.Delete;
      acts.transaction.commitretaining;
     end
     else
     begin
     dm.work.Transaction.starttransaction;
     dm.work.Close;
     dm.work.SQL.clear;
     dm.work.SQL.add('delete from act_carpets where ID_act_carpets = :id');
     dm.work.parambyname('id').AsInteger := transfer_carpets.FieldByName('id_act_carpets').AsInteger;
     dm.work.execquery;
     dm.work.Transaction.commit;
     Bookmark:=acts.GetBookmark;
     acts.close;
     btnShowClick(nil);
     acts.GotoBookmark(Bookmark);
     acts.freeBookmark(Bookmark);
    end;
  except
    on E: Exception do ShowMessage('Удалении ковра из акта. Error:' + E.Message);
  end;
end;

procedure TActsForm.btnUpdateCarpetInActClick(Sender: TObject);
var Bookmark:TBookMark;
    Bookmark1:TBookMark;
begin
  inherited;
  try
    if dm.work.Transaction.intransaction then dm.work.Transaction.rollback;
    Bookmark1:=transfer_carpets.GetBookmark;
    dm.work.Transaction.starttransaction;
    dm.work.Close;
    dm.work.SQL.clear;
    dm.work.SQL.add('update act_carpets set quantity = :quantity where ID_act_carpets = :id');
    dm.work.parambyname('id').AsInteger := transfer_carpets.FieldByName('id_act_carpets').AsInteger;
    dm.work.parambyname('quantity').AsInteger := cr_quantity.value;
    dm.work.execquery;
    dm.work.Transaction.commit;
    Bookmark:=acts.GetBookmark;
    acts.close;
    btnShowClick(nil);
    acts.GotoBookmark(Bookmark);
    transfer_carpets.gotobookmark(Bookmark1);
    acts.FreeBookmark(Bookmark);
    transfer_carpets.Freebookmark(Bookmark1);
  except
    on E: Exception do ShowMessage('Правка количества ковра в акте. Error:' + E.Message);
  end;
end;

procedure TActsForm.miPrintActClick(Sender: TObject);
begin
  inherited;
   miShowClientClick(nil);
   ClientDionixForm.mniShowActClick(nil);
   show;
end;

procedure TActsForm.btnImportDBF_For_1CClick(Sender: TObject);
var
 Filename:string;
 DBF:TDBF;
begin
  inherited;
  if sd.Execute then
  begin
   Get_Acts_For_1C.close;
   Get_Acts_For_1C.ParamByName('D1').asdatetime := trunc(D1.date);
   Get_Acts_For_1C.ParamByName('D2').asdatetime := trunc(D2.date)+1-0.000001;
   Get_Acts_For_1C.open;
   //dbf.copyfrom(Get_acts_for_1c,sd.filename,false,4);
   DBF:=TDBF.create(self);
   dbf.copyfrom(Get_acts_for_1c,sd.filename,false,4);
   DBF.destroy;

   showmessage('Выгрузка в файл '+sd.filename+' выполнена');
   Get_Acts_For_1C.close;
  end;
end;

procedure TActsForm.Button8Click(Sender: TObject);
var
 id:integer;
begin
  inherited;
 try
    if dm.work.Transaction.intransaction then dm.work.Transaction.rollback;
    dm.work.Transaction.starttransaction;
    dm.work.Close;
    dm.work.SQL.clear;
    dm.work.SQL.add('Update acts set act_status = :act_status where ID_acts = :id_acts');
    dm.work.parambyname('id_acts').AsInteger := acts.FieldByName('id_acts').AsInteger;
    dm.work.parambyname('act_status').AsInteger := RG_Act_status.itemindex;
    dm.work.execquery;
    id:=dm.work.parambyname('id_acts').AsInteger ;
    dm.work.Transaction.commit;
    acts.close;
    acts.open;
    acts.locate('id_acts',id,[]);
  except
    on E: Exception do ShowMessage('Правка статуса. Error:' + E.Message);
  end;
end;

procedure TActsForm.ActsACT_STATUSGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
 inherited;
 case sender.AsInteger of
  0:text:='создан';
  1:text:='не создан';
  2:text:='подписан';
  3:text:='не подписан';
  4:text:='напечатан';
  5:text:='передан на подпись';
  6:text:='съехал';
  7:text:='не оформлен';
  8:text:='штамп';
  9:text:='остановлен';
  10:text:='реклама';
    11: text:='сохр.Excel'  ;
   12:text:='е-подпись';
 end;
end;
procedure TActsForm.btnClearSortClick(Sender: TObject);
begin
  inherited;
 Sortby.text:='';
 SortBy.Hint:='';
end;

procedure TActsForm.lbOrderClick(Sender: TObject);
var
 s:string;
begin
  inherited;
 s:='';
 if DbGridFrame.Grid.Columns[lbOrder.itemindex].FieldName='PROVIDER_NAME' then
  s:='ID_PROVIDER';
 if DbGridFrame.Grid.Columns[lbOrder.itemindex].FieldName='W_NAME' then
  s:='W_ID';
 if DbGridFrame.Grid.Columns[lbOrder.itemindex].FieldName='CASHIER_FIO' then exit;
 SortBy.Text:=SortBy.Text+lbOrder.items[lbOrder.itemindex]+';';
 if s='' then s:=DbGridFrame.Grid.Columns[lbOrder.itemindex].FieldName;
 if SortBy.Hint<>'' then  SortBy.hint:=SortBy.Hint+', '+s
  else SortBy.hint:=s;
end;

procedure TActsForm.ActsW_NAMEGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
if (Acts.FieldByName('w_id').IsNull or  (Acts.FieldByName('w_id').AsInteger=0))
  then text:=Acts.FieldByName('w_name').asstring
  else text:= Acts.FieldByName('w_name').asstring+' ('+ Acts.FieldByName('day_night').text+')';
end;

procedure TActsForm.ActsDAY_NIGHTGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  case Acts.fieldbyname('DAY_NIGHT').asinteger of
    0: text := 'д';
    1: text := 'н';
    2: text := 'в';
    3: text := 'спец';
  end;
end;

procedure TActsForm.mniN2Click(Sender: TObject);
var
  id_provider:Integer;
  id,actNum:Integer;
begin
  inherited;
 SetProviderForm := TSetProviderForm.create(self);
  if SetProviderForm.showmodal = mrOk then
  begin
   id_provider:=setProviderform.Providers.fieldbyname('ID').asinteger;
    try
    dm.Get_actNum.Close;
    dm.Get_actNum.ParamByName('act_Type').asinteger :=  acts.FieldByName('Act_Type').AsInteger;
    dm.Get_actNum.ParamByName('id_provider').asinteger := id_pROVIDER;
    dm.Get_actNum.Open;

    actnum:=dm.Get_actNum.fieldbyname('act_num').asinteger;

    if dm.work.Transaction.intransaction then dm.work.Transaction.rollback;
    dm.work.Transaction.starttransaction;
    dm.work.Close;
    dm.work.SQL.clear;
    dm.work.SQL.add('Update acts set ID_Provider = :ID_Provider , act_Number = :act_number  where ID_acts = :id_acts');
    dm.work.parambyname('id_acts').AsInteger := acts.FieldByName('id_acts').AsInteger;
    dm.work.parambyname('ID_provider').AsInteger := id_provider;
    dm.work.parambyname('act_number').AsInteger := actNum;
    dm.work.execquery;
    id:=dm.work.parambyname('id_acts').AsInteger ;
    dm.work.Transaction.commit;
    acts.close;
    btnshowclick(nil);
    acts.locate('id_acts',id,[]);
  except
    on E: Exception do ShowMessage('Правка поставщика. Error:' + E.Message);
  end;
  end;
  SetProviderForm.free;
end;

procedure TActsForm.N3Click(Sender: TObject);
var xlReport: TxlReport;
  xlreportparam: Txlreportparam;
begin
  inherited;
 DM.q.Close;
 DM.q.SQL.clear;
 DM.q.sql.add(
 ' select  NOT_IN_SCHEDULE, NOT_IN_ACT_REPORT, user_info, act_type, act_status_str, low_address, act_number, W_NAME,  D_TYPE, CLIENT_IS_ACTIVE, MAX_AC_LASTDAY, '+
 '       PROVIDER_NAME, ACT_DATE, LOW_ADDRESS, ACC_BILL, CONTRACT_NUMBER, w_crm_curator,  ADDRESS, act_create_date,  CR_INFO, w_curator , CRM_CURATORS'+
 '  from get_acts_for_report_aug2014(:d1,:d2) '+
 '  order by '+
 '    NOT_IN_ACT_REPORT, user_info, act_type, act_status_str, low_address, act_number ');

 statusbar.Panels[1].Text := 'подготовка отчета, выполнение запроса'; statusbar.update;
 DM.q.ParamByName('D1').asdatetime:=trunc(d1.date)    ;
 DM.q.ParamByName('D2').asdatetime:=trunc(d2.date)    ;
 DM.q.Open;
 xlReport := TxlReport.CreateEx(Self, ExtractFilePath(Application.ExeName) + '\Templates\acts_report_aug2014.xls');
  try
   // xlreport.MacroAfter:='Macros_After';
    xlReport.AddDataSet(DM.q, 'actsrange');
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'dateReport';
    xlreportparam.value := 'Отчет подготовлен:'+formatdatetime('dd mmm yyyy hh:mm', now);
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Header';
    xlreportparam.value := 'Отчет по актам с датами актов с '+formatdatetime('dd.mm.yyyy', d1.Date)+' по '+formatdatetime('dd.mm.yyyy', d2.Date);
    statusbar.Panels[1].Text := 'подготовка отчета'; statusbar.update;
    xlReport.Report(False);
  finally
    xlReport.Free;
  end;
  DM.q.close;
  statusbar.Panels[1].Text := ''; statusbar.update;
end;

procedure TActsForm.N6Click(Sender: TObject);
var xlReport: TxlReport;
  xlreportparam: Txlreportparam;
begin
  inherited;
 DM.q.Close;
 DM.q.SQL.clear;
 DM.q.sql.add(
 ' select NOT_IN_ACT_REPORT, Not_in_schedule, w_curator, act_type, act_status_str, low_address, act_number, W_NAME, D_TYPE, CLIENT_IS_ACTIVE, MAX_AC_LASTDAY,'+
 '       PROVIDER_NAME, ACT_DATE, LOW_ADDRESS, ACC_BILL, CONTRACT_NUMBER, w_crm_curator,  ADDRESS, act_create_date,  CR_INFO, user_info,  CRM_CURATORS '+
 '  from get_acts_for_report_aug2014(:d1,:d2) '+
 '  order by '+
 '    NOT_IN_ACT_REPORT , w_curator, act_type, act_status_str, low_address, act_number ');

 statusbar.Panels[1].Text := 'подготовка отчета, выполнение запроса'; statusbar.update;
 DM.q.ParamByName('D1').asdatetime:=trunc(d1.date)    ;
 DM.q.ParamByName('D2').asdatetime:=trunc(d2.date)    ;
 DM.q.Open;
 xlReport := TxlReport.CreateEx(Self, ExtractFilePath(Application.ExeName) + '\Templates\acts_report_aug2014_wCurator.xls');
  try
   // xlreport.MacroAfter:='Macros_After';
    xlReport.AddDataSet(DM.q, 'actsrange');
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'dateReport';
    xlreportparam.value := 'Отчет подготовлен:'+formatdatetime('dd mmm yyyy hh:mm', now);
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Header';
    xlreportparam.value := 'Отчет по актам с датами акта с '+formatdatetime('dd.mm.yyyy', d1.Date)+' по '+formatdatetime('dd.mm.yyyy', d2.Date);
    statusbar.Panels[1].Text := 'подготовка отчета'; statusbar.update;
    xlReport.Report(False);
  finally
    xlReport.Free;
  end;
  DM.q.close;
  statusbar.Panels[1].Text := ''; statusbar.update;
end;

procedure TActsForm.Button2Click(Sender: TObject);
begin
  inherited;
  if length(edit1.text)<>12 then exit;
  //EssaisCB.show;

   EssaisCB.SEdit.Text:=edit1.text;
   EssaisCB.GetBarCode(Panel2, Image1,1);
end;

procedure TActsForm.MiScannerActClick(Sender: TObject);
begin
  inherited;
  if not(Assigned(Scanner_act)) then Scanner_act:=TScanner_act.Create(Application);
  Scanner_act.show;
end;

procedure TActsForm.N7Click(Sender: TObject);
begin
  inherited;
{ if (not (Assigned(check_actForm))) then
  begin
   Check_actForm:=TCheck_ActForm. .create(Owner);
  end
 } check_actForm.show;
end;

procedure TActsForm.miPrintSelectedClick(Sender: TObject);
var ID_acts:Integer;
i:Integer;
s:string;
begin
  inherited;
  ID_acts:=DbGridFrame.Grid.DataSource.DataSet.FieldByName('id_acts').asinteger;
  try
//  DbGridFrame.Grid.DataSource.DataSet.disablecontrols;
   for i := 0 to DbGridFrame.Grid.selectedrows.Count - 1 do
    begin
      DbGridFrame.Grid.DataSource.DataSet.gotoBookmark(Pointer(DbGridFrame.Grid.SelectedRows.Items[i]));
      miShowClientClick(miPrintSelected);
      if Sender = miPrintSelected then ClientDionixForm.mniShowActClick(miPrintSelected);
      if Sender = miSaveExcelSelected then ClientDionixForm.mniShowActClick(miSaveExcelSelected);
      if Sender = miPrintSelected_2 then  ClientDionixForm.mniShowActClick(miPrintSelected_2);
      if Sender = miPrintSelected_3 then   ClientDionixForm.mniShowActClick(miPrintSelected_3);

      if ((Sender = miPrintSelected) or (Sender = miPrintSelected_2) or  (Sender = miPrintSelected_3) or (Sender = miSaveExcelSelected))
       then  begin
         if (DbGridFrame.Grid.DataSource.DataSet.FieldByName('act_status').asinteger=0)
          then
          begin
            if not dm.work.Transaction.intransaction then dm.work.Transaction.starttransaction;
            dm.work.Close;
            dm.work.SQL.clear;
            dm.work.SQL.add('Update acts set act_status = :act_status where ID_acts = :id_acts');
            dm.work.parambyname('id_acts').AsInteger := acts.FieldByName('id_acts').AsInteger;
            dm.work.parambyname('act_status').AsInteger := 5; //RG_Act_status.itemindex;
            if Sender = miSaveExcelSelected then  dm.work.parambyname('act_status').AsInteger :=11;
            dm.work.execquery;
            dm.work.Transaction.CommitRetaining;
           end;
        end;
    end;
    MessageBeep(MB_ICONEXCLAMATION);
    showmessage('Все выделенные акты обработаны и записаны в каталог  '+extractfilepath(application.exename) + 'xls');
   finally
 //  DbGridFrame.Grid.DataSource.DataSet.enablecontrols;
  end;

  Acts.Close;
  Acts.Open;
   acts.Locate('id_acts', ID_acts, []);

end;

procedure TActsForm.mniCheckSignedActClick(Sender: TObject);
begin
  inherited;
  check_SignedactForm.show;
end;

procedure TActsForm.ActsCOUNT_ACTIVE_AC_IDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
 text:='';
 if  Acts.FieldByName('count_active_ac_id').AsInteger>0 then text:='да';
end;

procedure TActsForm.mnipdfallActClick(Sender: TObject);
var ID_acts:Integer;
i:Integer;
s:string;
begin
  inherited;
  ID_acts:=DbGridFrame.Grid.DataSource.DataSet.FieldByName('id_acts').asinteger;
  try
//  DbGridFrame.Grid.DataSource.DataSet.disablecontrols;
   for i := 0 to DbGridFrame.Grid.selectedrows.Count - 1 do
    begin
      DbGridFrame.Grid.DataSource.DataSet.gotoBookmark(Pointer(DbGridFrame.Grid.SelectedRows.Items[i]));
      miShowClientClick(mnipdfallAct);
      ClientDionixForm.mniShowActClick(mnipdfallAct);
    end;
    MessageBeep(MB_ICONEXCLAMATION);
    showmessage('Все выделенные акты сохранены как PDF-файлы в папке '+dm.pdfFolder );
   finally
 //  DbGridFrame.Grid.DataSource.DataSet.enablecontrols;
  end;

  Acts.Close;
  Acts.Open;
   acts.Locate('id_acts', ID_acts, []);


end;

procedure TActsForm.mniPDFACTClick(Sender: TObject);
begin
  inherited;
 miShowClientClick(mnipdfAct);
 ClientDionixForm.mniShowActClick(mnipdfAct);
end;

procedure TActsForm.mniN12Click(Sender: TObject);
var xlReport: TxlReport;
  xlreportparam: Txlreportparam;
begin
  inherited;
 DM.q.Close;
 DM.q.SQL.clear;
 DM.q.sql.add(
 ' select  not_In_act_report, Not_In_schedule, w_curator, act_type, act_status_str, low_address, act_number, W_NAME, '+
// ' select   w_curator, act_type, act_status_str, low_address, act_number, W_NAME, '+
 '       PROVIDER_NAME, ACT_DATE, LOW_ADDRESS, ACC_BILL, CONTRACT_NUMBER, w_crm_curator, ADDRESS, act_create_date, '+
 '  CR_INFO, user_info,  CRM_CURATORS , Client_is_active, Max_ac_LastDay, d_TYPE '+
 '  from get_acts_for_report_aug2014(:d1,:d2) '+
 '  order by '+
 '   not_In_act_report,  act_status_str, act_Type , low_address, act_number ');

 statusbar.Panels[1].Text := 'подготовка отчета, выполнение запроса'; statusbar.update;
 DM.q.ParamByName('D1').asdatetime:=trunc(d1.date)    ;
 DM.q.ParamByName('D2').asdatetime:=trunc(d2.date)    ;
 DM.q.Open;
 xlReport := TxlReport.CreateEx(Self, ExtractFilePath(Application.ExeName) + '\Templates\acts_report_aug2014_status.xls');
  try
   // xlreport.MacroAfter:='Macros_After';
    xlReport.AddDataSet(DM.q, 'actsrange');
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'dateReport';
    xlreportparam.value := 'Отчет подготовлен:'+formatdatetime('dd mmm yyyy hh:mm', now);
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Header';
    xlreportparam.value := 'Отчет по статусам  актов с датами актов '+formatdatetime('dd.mm.yyyy', d1.Date)+' по '+formatdatetime('dd.mm.yyyy', d2.Date);
    statusbar.Panels[1].Text := 'подготовка отчета'; statusbar.update;
    xlReport.Report(False);
  finally
    xlReport.Free;
  end;
  DM.q.close;
  statusbar.Panels[1].Text := ''; statusbar.update;

end;

procedure TActsForm.mniSvodStatusClick(Sender: TObject);
var xlReport: TxlReport;
  xlreportparam: Txlreportparam;
begin
  inherited;
 DM.q.Close;
 DM.q.SQL.clear;
 DM.q.sql.add( ' select * from get_act_Svod_with_Procent(:D1, :D2)');

 statusbar.Panels[1].Text := 'подготовка отчета, выполнение запроса 1'; statusbar.update;
 DM.q.ParamByName('D1').asdatetime:=trunc(d1.date)    ;
 DM.q.ParamByName('D2').asdatetime:=trunc(d2.date)    ;
 DM.q.Open;

 qs.Close;
 qs.SQL.clear;
 //qs.sql.add( ' select * from get_act_Svod_with_Procent_Total(:D1, :D2)');
 qs.sql.add( ' select * from GET_ACT_SVOD_WITH_PROC_TOTAL_N(:D1, :D2)');

 statusbar.Panels[1].Text := 'подготовка отчета, выполнение запроса 2'; statusbar.update;
 qs.ParamByName('D1').asdatetime:=trunc(d1.date)    ;
 qs.ParamByName('D2').asdatetime:=trunc(d2.date)    ;
 qs.Open;


 xlReport := TxlReport.CreateEx(Self, ExtractFilePath(Application.ExeName) + '\Templates\acts_report_aug2014_SVOD_status.xls');
  try
   // xlreport.MacroAfter:='Macros_After';
    xlReport.AddDataSet(DM.q, 'actsrange');
     xlReport.AddDataSet(qs, 'totalrange');

    xlreportparam := xlReport.Params.Add;

    xlreportparam.name := 'dateReport';
    xlreportparam.value := 'Отчет подготовлен:'+formatdatetime('dd mmm yyyy hh:mm', now);
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Header';
    xlreportparam.value := 'Сводный Отчет по статусам  актов с датами актов '+formatdatetime('dd.mm.yyyy', d1.Date)+' по '+formatdatetime('dd.mm.yyyy', d2.Date);
    statusbar.Panels[1].Text := 'подготовка отчета'; statusbar.update;
    xlReport.Report(False);
  finally
    xlReport.Free;
  end;
  DM.q.close;
  statusbar.Panels[1].Text := ''; statusbar.update;

end;

procedure TActsForm.mniN13Click(Sender: TObject);
var xlReport: TxlReport;
  xlreportparam: Txlreportparam;
begin
  inherited;
 DM.q.Close;
 DM.q.SQL.clear;
 DM.q.sql.add(
 '   select  ga.act_status_str, '+
 ' sum(ga.vyvoz_active) as vyvoz_active,  sum(ga.vyvoz_stopped) as vyvoz_stopped,  '+
 ' sum(ga.vyvoz_active_rename) as vyvoz_active_rename,  sum(ga.vyvoz_stopped_rename) as vyvoz_stopped_rename, '+
 ' sum(ga.zavoz_active) as zavoz_active,  sum(ga.zavoz_stopped) as zavoz_stopped,   '+
 ' sum(ga.zavoz_active_rename) as zavoz_active_rename,  sum(ga.zavoz_stopped_rename) as zavoz_stopped_rename, '+
 '  sum(ga.uterya_active) as uterya_active,  sum(ga.uterya_stopped) as uterya_stopped,  '+
 ' sum(ga.spisanie_active) as spisanie_active,  sum(ga.spisanie_Stopped) as spisanie_stopped   '+
 ' from   GET_ACTS_SVOD_active_stopped (:d1, :d2) ga     '+
 '  WHERE GA.not_in_act_report = 0 '+
 ' group by  ga.act_status_str');

 statusbar.Panels[1].Text := 'подготовка отчета, выполнение запроса'; statusbar.update;
 DM.q.ParamByName('D1').asdatetime:=trunc(d1.date)    ;
 DM.q.ParamByName('D2').asdatetime:=trunc(d2.date)    ;
 DM.q.Open;
 xlReport := TxlReport.CreateEx(Self, ExtractFilePath(Application.ExeName) + '\Templates\acts_svod_2016_status.xls');
  try
   // xlreport.MacroAfter:='Macros_After';
    xlReport.AddDataSet(DM.q, 'actsrange');
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'dateReport';
    xlreportparam.value := 'Отчет подготовлен:'+formatdatetime('dd mmm yyyy hh:mm', now);
    xlreportparam := xlReport.Params.Add;
    xlreportparam.name := 'Header';
    xlreportparam.value := 'Сводный отчет по статусам актов с датами актов '+formatdatetime('dd.mm.yyyy', d1.Date)+' по '+formatdatetime('dd.mm.yyyy', d2.Date);
    statusbar.Panels[1].Text := 'подготовка отчета'; statusbar.update;
    xlReport.Report(False);
  finally
    xlReport.Free;
  end;
  DM.q.close;
  statusbar.Panels[1].Text := ''; statusbar.update;

end;

procedure TActsForm.TaxxiFormActivate(Sender: TObject);
begin
  inherited;
 if cbProvider.itemindex<1 then
  begin
 dm.GetStringsObjectsFromQuery(dm.work1, cbProvider.Items, 'select distinct Name, ID from Providers order by name', 'Name', 'ID');
 cbProvider.items.InsertObject(0,'любой',TObject(-1));
 cbProvider.itemindex:=0;
  end; 
end;

procedure TActsForm.btnSetSelectedActStatusClick(Sender: TObject);
var
 i, id_start,id:integer;
 act_status_index:Integer;
begin
  inherited;
 try
   act_status_index:=RG_Act_status.itemindex;
   id_start:= DbGridFrame.Grid.datasource.dataset.FieldByName('id_acts').AsInteger;

  dbGridFrame.grid.DataSource.DataSet.disablecontrols;
   for i := 0 to dbGridFrame.grid.selectedrows.Count - 1 do
    begin
      dbGridFrame.grid.DataSource.DataSet.gotoBookmark(Pointer(dbGridFrame.grid.SelectedRows.Items[i]));
      if dm.work.Transaction.intransaction then dm.work.Transaction.rollback;
      dm.work.Transaction.starttransaction;
      dm.work.Close;
      dm.work.SQL.clear;
      dm.work.SQL.add('Update acts set act_status = :act_status where ID_acts = :id_acts');
      dm.work.parambyname('id_acts').AsInteger := dbGridFrame.grid.datasource.dataset.FieldByName('id_acts').AsInteger;
      dm.work.parambyname('act_status').AsInteger := RG_Act_status.itemindex;
      dm.work.execquery;
      dm.work.Transaction.commit;
    end;
    dbGridFrame.grid.DataSource.DataSet.enablecontrols;
    dbGridFrame.grid.datasource.dataset.close;
    dbGridFrame.grid.datasource.dataset.open;
    dbGridFrame.grid.datasource.dataset.locate('id_acts',id_start,[]);
  except
    on E: Exception do ShowMessage('Правка статуса. Error:' + E.Message);
  end;

end;

end.
