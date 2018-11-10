unit act_AVR_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MenuForm_u, Menus, TxMenus, TxComCtrls, TxControls, TxExtCtrls,
  TxClasses, TxForms, ComCtrls, ExtCtrls, TxDB, DB, IBCustomDataSet,
  TxStdCtrls, StdCtrls, TxGrids,  Grids, DBGridEh, TxDBCtrls,
  DBCtrls, xlcOPack, xlProOPack, xlcClasses, xlEngine, xlReport, IBQuery,  ShellAPI,
  TxFrame, DbGridUnit,  IBUpdateSQL, Spin, dbf, CheckLst, DateUtils, utils,Clipbrd, mInword;

  const
  LngFiles: array[0..5] of String =
    ('Long.lng', 'Ukr.lng', 'Russ.lng', 'Ruble.lng', 'Rub.lng', 'Euro.lng');

type
  TActAVRForm = class(TMenuForm)
    N1: TMenuItem;
    ds_AVRLIST: TDataSource;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    D1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    D2: TDateTimePicker;
    btnShow: TButton;
    xlProPackage1: TxlProPackage;
    xlReport1: TxlReport;
    DbGridEH_AVR: TDbGridFrame;
    pmReport: TMenuItem;
    N4: TMenuItem;
    qAVRLIst: TIBQuery;
    qAVRLIST_update: TIBUpdateSQL;
    SD: TSaveDialog;
    Edit1: TEdit;
    Button2: TButton;
    Panel2: TPanel;
    Image1: TImage;
    MiScannerAct: TMenuItem;
    N7: TMenuItem;
    Rjynhjkm1: TMenuItem;
    mniCheckSignedAct: TMenuItem;
    clbID_1c: TCheckListBox;
    Splitter1: TSplitter;
    PopupMenuCLB: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    qAVRLIstIS_AUTO: TSmallintField;
    qAVRLIstID_1C: TIntegerField;
    qAVRLIstUSERNAME: TIBStringField;
    qAVRLIstUSERACTION: TDateTimeField;
    qAVRLIstID_ACCOUNT: TIntegerField;
    qAVRLIstID_ACCOUNT_ACT_DESCR: TIntegerField;
    qAVRLIstID_ACCOUNT_ACT: TIntegerField;
    qAVRLIstAC_BILL: TIBStringField;
    qAVRLIstVALUTA: TIBStringField;
    qAVRLIstMONEY_CONTRACT: TFloatField;
    qAVRLIstPLAN_FACT: TSmallintField;
    qAVRLIstBILL_START: TDateField;
    qAVRLIstBILL_FINISH: TDateField;
    qAVRLIstBILL_NUMBER: TIntegerField;
    qAVRLIstCASH_CHECK: TIBStringField;
    qAVRLIstCR_QUANTITY_CONTRACT: TIntegerField;
    qAVRLIstACCOUNT_FORM: TIBStringField;
    qAVRLIstBILL_INTERVAL: TSmallintField;
    qAVRLIstBILL_STATUS: TIBStringField;
    qAVRLIstPROVIDER_NAME: TIBStringField;
    qAVRLIstID_PROVIDER: TIntegerField;
    qAVRLIstLOW_ADDRESS: TIBStringField;
    qAVRLIstCASHIER_FIO: TIBStringField;
    qAVRLIstBILL_MONEY: TFloatField;
    qAVRLIstBILL_STATUS_DATE: TDateTimeField;
    qAVRLIstBILL_NUMBER_1C: TIntegerField;
    qAVRLIstADDRESS: TIBStringField;
    qAVRLIstID_ADDRESS: TIntegerField;
    qAVRLIstBOARD: TIBStringField;
    qAVRLIstMONEY_WORK: TFloatField;
    qAVRLIstMONEY_PENALTY: TFloatField;
    qAVRLIstMONEY_PAYMENT: TFloatField;
    qAVRLIstW_ID: TIntegerField;
    qAVRLIstW_NAME: TIBStringField;
    qAVRLIstDAY_ACTION: TDateField;
    qAVRLIstDAY_NIGHT: TIntegerField;
    qAVRLIstACT_STATUS: TIntegerField;
    qAVRLIstN_ZAMEN_IN_ACT: TIntegerField;
    qAVRLIstNUMBER_OTDELENIE: TIBStringField;
    qAVRLIstPAY_ATTENTION: TIntegerField;
    qAVRLIstDRIVER_FIO: TIBStringField;
    qAVRLIstID_AVR_TYPE: TIntegerField;
    grpAVR: TGroupBox;
    IWLabel: TLabel;
    lblactprepare_status: TLabel;
    Label37: TLabel;
    btnPrintAVR: TButton;
    cbAVR_SElected: TCheckBox;
    IWComboBox1: TComboBox;
    pnImage: TPanel;
    Image_act: TImage;
    edit_a_Bar: TEdit;
    nCopy: TSpinEdit;
    q_AVR_CONTENT: TIBQuery;
    q_AVR_CONTENTID: TIntegerField;
    q_AVR_CONTENTACT_CONTENT: TMemoField;
    q_AVR_CONTENTACT_CONTENT_2: TMemoField;
    q_AVR_CONTENTACT_CONTENT_2013: TMemoField;
    q_AVR_CONTENTACT_CONTENT_X5: TMemoField;
    AVR_update: TIBUpdateSQL;
    PopupMenuAccount_acts: TPopupMenu;
    N28: TMenuItem;
    N31: TMenuItem;
    N30: TMenuItem;
    N29: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N47: TMenuItem;
    mniN38: TMenuItem;
    pmActs_add_info_1: TMenuItem;
    N34: TMenuItem;
    pmActs_Refresh: TMenuItem;
    mnaccount_acts_to_Excel: TMenuItem;
    mniN39: TMenuItem;
    mniAddresToActs: TMenuItem;
    N41: TMenuItem;
    N40: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N48: TMenuItem;
    rgActStatus: TRadioGroup;
    Bevel1: TBevel;
    cbAvrSelect_status: TCheckBox;
    Button1: TButton;
    grpAVR1: TGroupBox;
    chklstLAVRActStatus: TCheckListBox;
    GroupBox1: TGroupBox;
    clbStatus_Filter: TCheckListBox;
    procedure N1Click(Sender: TObject);
    procedure GridActTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure TaxxiFormCreate(Sender: TObject);
    procedure qAVRLIstAfterPost(DataSet: TDataSet);
    procedure AVRLIstW_NAMEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure mniCheckSignedActClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure qAVRLIstDAY_NIGHTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DbGridEH_AVRGridGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure qAVRLIstW_NAMEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure edit_a_BarChange(Sender: TObject);
    procedure btnPrintAVRClick(Sender: TObject);
    procedure q_AVR_CONTENTAfterPost(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure pmReportClick(Sender: TObject);
  private
    { Private declarations }
    b_order: boolean;
  public
    { Public declarations }
    imgFName:string;
    IW: TInWord;

  procedure PrintAVR;
  function CreateAVRDoc(const Template : String; ID_act : Integer; var FN : String ; FnamePic:string ):  Boolean;

  end;

var
  ActAVRForm: TActAVRForm;

implementation

uses MainForm_u, DataModule, clientdionix_u, GetClient_u,
  setProviderForm_u, VisuCB, scanner_act_u, Chect_Act_U, Check_signedAct_U, WdUnit,
  BS_BF_u;

{$R *.dfm}

function TActAVRForm.CreateAVRDoc(const Template : String; ID_act : Integer; var FN : String ; FnamePic:string ):  Boolean;
var
  ext  : String;
  tmpl_fn   : String;
begin
  ext := 'DOC';
  tmpl_fn  := ExtractFilePath(Application.ExeName) + '\Templates\' +  Template;
  result := TWordModule.CreateDoc(tmpl_fn, ID_act,0,0, FN, IW,  FnamePic);
end;


procedure TActAVRForm.N1Click(Sender: TObject);
begin
  inherited;
  MainForm.show;
  MainForm.windowstate := wsNormal;
end;

procedure TActAVRForm.GridActTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var id: integer;
begin
  inherited;
end;


procedure TActAVRForm.TaxxiFormCreate(Sender: TObject);
var
 i:integer;
begin
  inherited;
  d1.date := incmonth(encodedate(yearof(now),monthOf(now),1),-1);
  d2.date := incmonth(encodedate(yearof(now),monthOf(now),1),0)-1;

  dm.GetStringsObjectsFromQuery(dm.work1, clbID_1C.Items, 'select R.id, R.low_address||'' (''||R.ID||'')''  as Name from  regcode_1c R  where (not(r.avr_type is  null)) order by r.low_address, r.id ', 'Name', 'ID');

  if clbID_1c.Items.Count>0 then
    for i:=0 to clbID_1c.Items.count-1 do
       clbID_1c.Checked[i]:=true;

  dm.GetStringsFromQuery(dm.work1, DBGridEh_AVR.Grid.Columns[0].KeyList,'select id as name from avr_type order by id ', 'Name');
  dm.GetStringsFromQuery(dm.work1, DBGridEh_AVR.Grid.Columns[0].PickList,'select Name_short as name from avr_type order by id ', 'Name') ;

   IWComboBox1.ItemIndex := 0;
  IW := TInWord.Create(Self);
  IW.Target := IWLabel;
  IW.LoadFromFile(extractfilepath(application.exename) + LngFiles[IWComboBox1.ItemIndex]);
  chklstLAVRActStatus.Checked[0]:=True;
  chklstLAVRActStatus.Checked[4]:=True;
  chklstLAVRActStatus.Checked[5]:=True;

  for i:=0 to clbStatus_Filter.Items.count-1 do clbStatus_Filter.checked[i]:=true;

  if Pos('NO_AVR_EDIT',dm.user.TextRight) >0 then grpAVR.Enabled:=False;


end;

procedure TActAVRForm.qAVRLIstAfterPost(DataSet: TDataSet);
begin
  inherited;
 qAVRLIst.Transaction.CommitRetaining;
end;

procedure TActAVRForm.AVRLIstW_NAMEGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
//if (Acts.FieldByName('w_id').IsNull or  (Acts.FieldByName('w_id').AsInteger=0))
//  then text:=Acts.FieldByName('w_name').asstring
//  else text:= Acts.FieldByName('w_name').asstring+' ('+ Acts.FieldByName('day_night').text+')';
end;

procedure TActAVRForm.Button2Click(Sender: TObject);
begin
  inherited;
  if length(edit1.text)<>12 then exit;
  //EssaisCB.show;

   EssaisCB.SEdit.Text:=edit1.text;
   EssaisCB.GetBarCode(Panel2, Image1,1);
end;

procedure TActAVRForm.N7Click(Sender: TObject);
begin
  inherited;
// check_actForm.show;
end;

procedure TActAVRForm.mniCheckSignedActClick(Sender: TObject);
begin
  inherited;
//  check_SignedactForm.show;
end;

procedure TActAVRForm.btnShowClick(Sender: TObject);
var
   ID_1c_s_name,ID_1c_s:string;
   ID_1c:Integer;
   i:Integer;
   ID_status_s:string;
begin
  inherited;
 ID_status_s:=','; ID_1c_s:=',';  id_1c_s_name:='';
  for i:=0 to clbID_1c.Items.count-1 do
   if clbID_1c.Checked[i] then
    begin
     id_1C_s :=id_1c_s+inttostr(integer(clbID_1c.Items.Objects[i]))+',';
     Id_1c_s_name:=id_1c_s_Name+clbID_1c.Items[i]+' ; '
    end  ;
 if (id_1c_s = ',' )   then begin
      ShowMessage('Не выбран ни один клиент');
      Exit;
    end;//

 if Length(ID_1c_s)>1000 then
     begin
       ShowMessage('Выбрано слишком много клиентов');
       Exit;
     end;

 for i:=0 to clbStatus_Filter.Items.count-1 do
   if clbStatus_Filter.Checked[i] then
     id_status_s :=id_status_s+inttostr(i)+',';
 if (id_status_s = ',' )   then begin
      ShowMessage('Не выбран ни один cтатус');
      Exit;
    end;//

     qAVRLIst.Close;
     qAVRLIst.ParamByName('D1').AsDateTime:=Trunc(D1.Date);
     qAVRLIst.ParamByName('D2').AsDateTime:=Trunc(D2.Date);
     qAVRLIst.ParamByName('ID1CLIST').Asstring:=id_1c_s;
     qAVRLIst.ParamByName('act_status_s').Asstring:=id_status_s;
     qAVRLIst.Open;

end;

procedure TActAVRForm.N2Click(Sender: TObject);
var
   i:Integer;
begin
  inherited;
  for i:=0 to clbID_1c.Items.count-1 do
   clbID_1c.Checked[i]:=true;
end;

procedure TActAVRForm.N3Click(Sender: TObject);
var
   i:Integer;
begin
  inherited;
  for i:=0 to clbID_1c.Items.count-1 do
   clbID_1c.Checked[i]:=false;
end;

procedure TActAVRForm.N5Click(Sender: TObject);
var
   i:Integer;
begin
  inherited;
 // for i:=0 to clbID_1c.Items.count-1 do
 // if clb_id.items[i].sel clbID_1c.Checked[i]:=false;
end;

procedure TActAVRForm.qAVRLIstDAY_NIGHTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
 case sender.asinteger of
    0: text := 'д';
    1: text := 'н';
    2: text := 'в';
    3: text := 'спец';
  end;
end;

procedure TActAVRForm.DbGridEH_AVRGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if Column.FieldName = 'ACT_STATUS' then
  begin
  if  qavrlist.fieldbyname('act_status').asinteger=1 then
     begin afont.color:=clred  end;
  if  qavrList.fieldbyname('act_status').asinteger=2 then
     begin afont.color:=clgreen  end;
  if  qavrList.fieldbyname('act_status').asinteger=3 then
     begin afont.color:=clblue  end;
  if  qavrList.fieldbyname('act_status').asinteger=4 then
     begin afont.color:=clpurple  end;
  if  qavrList.fieldbyname('act_status').asinteger=5 then
     begin
      afont.color:=clmaroon;
       AFont.Style:=[fsbold];
     end;
  end;

end;

procedure TActAVRForm.qAVRLIstW_NAMEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  text:='';
  if qAVRLIst.fieldbyname('w_id').AsInteger>0 then
  text:=qAVRLIst.fieldbyname('w_Name').Asstring+' ('+
        qAVRLIst.fieldbyname('day_night').text+ ') ' +FormatDateTime('dd.mm.yy',qAVRLIst.fieldbyname('day_action').AsDateTime);
end;

procedure TActAVRForm.edit_a_BarChange(Sender: TObject);
begin
  inherited;
 if length(edit_a_Bar.text)<>12 then exit;
    EssaisCB.SEdit.Text:=edit_a_bar.text;
   EssaisCB.GetBarCode(PniMage, Image_Act,2);
end;

procedure TActAVRForm.btnPrintAVRClick(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  if cbAVR_Selected.checked then

     for i := 0 to dbGridEh_AVR.Grid.selectedrows.Count - 1 do
        begin
           dbGrideH_AVR.grid.DataSource.DataSet.gotoBookmark(Pointer(DBGridEh_AVR.Grid.SelectedRows.Items[i]));
           if  chklstLAVRActStatus.Checked[qavrList.FieldByName('act_status').AsInteger] then
                   printAVR;
        end

    else
    begin
       if  chklstLAVRActStatus.Checked[qavrList.FieldByName('act_status').AsInteger] then
           printAVR
         else ShowMessage('Статус акта не назначен к печати');
     end;
  end;



procedure TActAVRForm.PrintAVR;
var
  id:integer;
 s_addr:string;
 ContentFileName:string;
 act_Template :string;

 act_content:string;
 FNamePic:string;
begin
  inherited;
  pnImage.Visible:=True;pnImage.Update;
  act_template := '';
  case   qAVRList.fieldbyname('ID_avr_type').asinteger of
  1:   begin
   Act_template:='actwork2010.doc';
   Act_Content:='ACT_CONTENT';
   end;
  2:   begin
    Act_template:='actwork2011.doc';
    Act_Content:='ACT_CONTENT_2';
   end;
  3:   begin
    Act_template:='actwork2013.doc';
    Act_Content:='ACT_CONTENT_2013';
   end;
  4:   begin
    Act_template:='actwork_X5.doc';
    Act_Content:='ACT_CONTENT_X5';
    end;
   5:   begin
    Act_template:='actwork_X5(2).doc';
    Act_Content:='ACT_CONTENT_X5';
    end;

   6:
   begin
    Act_template:='actwork_LUKOIL.doc'; //account_act_descr.fieldbyname('Act_Template_X5').asstring;
    Act_Content:='ACT_CONTENT_X5';
    end;

    7:
   begin
    Act_template:='actwork_GAZPROMNEFT.doc'; //account_act_descr.fieldbyname('Act_Template_X5').asstring;
    Act_Content:='ACT_CONTENT_X5';
    end;


   end;

  if act_Template='' then
    begin
     ShowMessage('Не известен тип акта');
     Exit;
    end;

  if not directoryexists(extractfilepath(application.exename)+'\Акты_работ') then
     CreateDir(extractfilepath(application.exename)+'\Акты_работ');
  s_addr:= '('+qAVRList.fieldbyname('NUMBER_OTDELENIE').AsString+')_'
          +qAVRList.fieldbyname('ADDRESS').AsString+'_('
          +qAVRList.fieldbyname('BOARD').AsString+')';

  if Length(S_addr)>90 then
              s_addr:=Copy(s_addr,1,90);

         S_addr:=changesymbol(S_addr,'/','_'); S_addr:=changesymbol(S_addr,'\','_'); S_addr:=changesymbol(S_addr,':','_'); S_addr:=changesymbol(S_addr,'''','_');
         S_addr:=changesymbol(S_addr,'*','_'); S_addr:=changesymbol(S_addr,'?','_'); S_addr:=changesymbol(S_addr,'.','_');  S_addr:=changesymbol(S_addr,'"','_');
         S_addr:=changesymbol(S_addr,'<','_'); S_addr:=changesymbol(S_addr,'>','_'); S_addr:=changesymbol(S_addr,'|','_');  S_addr:=changesymbol(S_addr,'%','_');


  ContentFileName := extractfilepath(application.exename) + 'Акты_работ\' +
        'ID1C_' + qAVRList.fieldbyname('ID_1C').asstring+
        '_BF_'+formatdatetime('ddmmyy', qAVRList.fieldbyname('Bill_Finish').asdatetime) +
        '_'+s_addr+
        '_(Addr_'+qAVRList.fieldbyname('id_address').AsString+')'+
       //  +'_'+VariantAct
         '.doc';

  lblactprepare_status.Caption:='генерация документа акта....'; lblactprepare_status.Update;
  id:= qAVRList.fieldbyname('ID_account_act').asinteger ;
 // FNamePic:= extractfilepath(application.exename) + 'TMPL\'+'Barcode.bmp';



  if dm.town_int<10 then
  Edit_a_Bar.text:=IntToStr(DM.Town_Int)+formatfloat('00000000000',qAVRList.fieldbyname('ID_account_act').asinteger)
   else
  Edit_a_Bar.text:=IntToStr(DM.Town_Int)+formatfloat('0000000000',qAVRList.fieldbyname('ID_account_act').asinteger)    ;

   if length(edit_a_Bar.text)=12 then
   begin;
    EssaisCB.SEdit.Text:=edit_a_bar.text;
    EssaisCB.GetBarCode(PniMage, Image_Act,2);
   end ;
   pnImage.Update;

  FNamePic:=ExtractFilePath(Application.ExeName)+'tmpl\a_'+ formatdatetime('yymmddhhmmss', now) + '.bmp';

  Clipboard.Assign(image_act.Picture);

  pnImage.Visible:=false;pnImage.Update;

  q_AVR_CONTENT.Close;
  q_AVR_CONTENT.ParamByName('id').AsInteger:=qAVRList.fieldbyname('ID_account_act').AsInteger;
  q_AVR_CONTENT.Open;

  if trim(q_AVR_content.fieldbyname(act_content).asstring)='' then
   begin
          if CreateAVRDoc( act_Template,
                      qAVRList.fieldbyname('ID_account_act').asinteger , ContentFileName, FNamePic)
             then
              begin
               lblactprepare_status.Caption:='сохранение документа акта....'; lblactprepare_status.Update;
               sleep(300);
               lblactprepare_status.Caption:='сохранение в базу документа акта....'; lblactprepare_status.Update;
               q_AVR_CONTENT.Edit;
               (q_avr_content.FieldByName(act_CONTENT) as TBlobField).LoadFromFile(ContentFileName);
               q_avr_content.Post;
               qAVRList.Edit;
               qAVRList.FieldByName('act_status').asinteger:=4;
             //  qAVRList.FieldByName('w_id_print').clear;
            //   qAVRList.FieldByName('day_night_print').clear;
            //   qAVRList.FieldByName('day_action_print').clear;
               qAVRList.Post;
              end;
    end
     else
     begin
       lblactprepare_status.Caption:='сохранение документа в файл...'; lblactprepare_status.Update;
       (q_avr_content.FieldByName(ACT_CONTENT) as TBlobField).SaveToFile(ContentFileName);
       sleep(300);
     end;
  lblactprepare_status.Caption:='печать, открытие документа акта....'; lblactprepare_status.Update;

 // if sender = btnPrintAct then
  begin
    ShellExecute(Handle, 'print', PChar(ContentFileName), nil, nil, SW_HIDE{SW_SHOW});
    sleep(500);
    if nCopy.Value=2 then begin ShellExecute(Handle, 'print', PChar(ContentFileName), nil, nil, SW_SHOW);
                              sleep(500); end;
    qAVRList.Edit;
    qAVRList.FieldByName('act_status').asinteger:=3;
    qAVRList.Post;
  end;


 lblactprepare_status.Caption:=''; lblactprepare_status.Update;

end;


procedure TActAVRForm.q_AVR_CONTENTAfterPost(DataSet: TDataSet);
begin
  inherited;
  q_AVR_CONTENT.Transaction.CommitRetaining;
end;

procedure TActAVRForm.Button1Click(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  if cbAvrSelect_status.checked then

     for i := 0 to dbGridEh_AVR.Grid.selectedrows.Count - 1 do
        begin
           dbGrideH_AVR.grid.DataSource.DataSet.gotoBookmark(Pointer(DBGridEh_AVR.Grid.SelectedRows.Items[i]));
           qAVRList.Edit;
           qAVRList.FieldByName('act_status').asinteger:=rgActStatus.ItemIndex;
           qAVRList.Post;
        end

    else
    begin
       qAVRList.Edit;
       qAVRList.FieldByName('act_status').asinteger:=rgActStatus.ItemIndex;
       qAVRList.Post;;
     end;
end;

procedure TActAVRForm.pmReportClick(Sender: TObject);
begin
  inherited;
 if Pos('NOACCOUNT',DM.User.TextRight)>0 then
   begin
     ShowMessage('Недостаточно прав....');
     Exit;
   end;
 if BS_BFForm = nil then
    BS_BFForm := TBS_BFForm.Create(self, UI);
  BS_BFForm.CustomizeForm(DM.User.ID);
  ShortDateFormat := 'dd.mm.yyyy';

  bs_BFForm.d1.Date:= IncMonth(qAVRLIst.Fieldbyname('Bill_start').asdatetime,-1);
    bs_BFForm.d2.Date:= IncMonth(qAVRLIst.Fieldbyname('Bill_start').asdatetime,3);

  bs_BFForm.Panel4.Visible:=true;
  bs_BFForm.Panel7.Visible:=true  ;
  BS_BFForm.searchstr.Text := trim(qAVRLIst.FieldByName('Cashier_FIO').AsString);
  BS_BFForm.Search_FromCurrentRec.checked := False;
  BS_BFForm.btnfindclick(nil);
  BS_BFForm.CategoriesGridDblClick(nil);
  BS_BFForm.accounts.locate('low_address;ac_Bill',vararrayof([(trim(qAVRLIst.FieldByName('low_address').AsString)),
                                                             trim(qAVRLIst.fieldByName('ac_Bill').AsString)]),[]);
  BS_BFForm.show;
 bs_bfForm.Rightdown_PC.TabIndex:=0 ;
    BS_BFForm.Rightdown_PC.OnChange(nil);
  bs_BFForm.Panel4.Visible:=false;
  bs_BFForm.Panel7.Visible:=false;
  BS_BFForm.all_accounts.Locate('Bill_start',VarArrayOf([qAVRLIst.Fieldbyname('Bill_start').asdatetime]),[]);

end;

end.
