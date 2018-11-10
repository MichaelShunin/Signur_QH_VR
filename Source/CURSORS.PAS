unit CURSORS;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, DB, DBTables, ExtCtrls, StdCtrls, Menus,
  {UPrinGri, }DBCtrls,  TabNotBk, Spin,
  iMage_u, Gauges, Buttons, ComCtrls, IBCustomDataSet, IBTable,
  cxLookAndFeelPainters, cxButtons, DBGridEh, MemDS, VirtualTable  ;

type
  TCursors_Form = class(TForm)
    DS_Cursors: TDataSource;
    DS_CursChan: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DBGrid3: TDBGridEh;
    N4: TMenuItem;
    DeleteAllCursors: TMenuItem;
    Panel2: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    Panel3: TPanel;
    N6: TMenuItem;
    DS_Curs_Delt_Table: TDataSource;
    Cursors: TIBDataSet;
    CursorsID_CURSOR: TIntegerField;
    CursorsID_EKSP_PARENT: TIntegerField;
    CursorsAXISXNAME: TIBStringField;
    CursorsPOINTNUM: TIntegerField;
    CursorsCURSOR_NUM: TIntegerField;
    CursorsMEMOSTR: TIBStringField;
    CursorsDELTX: TFloatField;
    CursorsBXSTR: TSmallintField;
    CursorsBMEMO: TSmallintField;
    curschan: TIBDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Gauge1: TGauge;
    Point_Do: TSpinEdit;
    Point_Posle: TSpinEdit;
    Panel1: TPanel;
    CreateObzor: TcxButton;
    DBGridEh1: TDBGridEh;
    CURS_DELT_Table: TVirtualTable;
    CURS_DELT_TableCURS_DELT_NAME: TStringField;
    CURS_DELT_TableCURS_DELT_VALUE: TFloatField;
    CURS_DELT_TableCURS_DELT_RAZM: TStringField;
    Splitter2: TSplitter;
    Panel5: TPanel;
    DBGrid1: TDBGridEh;
    DBGrid2: TDBGridEh;
    Panel4: TPanel;
    btnDelete: TcxButton;
    ShowButton: TcxButton;
    CursorsXSTR: TIBStringField;
    procedure DelButtClick(Sender: TObject);
    Procedure GetCursorLastNumber(messHandle:THandle;bMess:boolean);
    procedure ShowButtonClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Cursors_MemoStrGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DeleteAllCursorsClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure TabbedNotebook1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure CreateObzorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Cursors_AfterOpen(DataSet: TDataset);
    procedure CursChan_AfterOpen(DataSet: TDataset);
    procedure CursorsAfterOpen(DataSet: TDataSet);
    procedure CursorsMEMOSTRGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CursorsBeforeClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    CursorLastNumber:word;
    ImForm:TImageForm;
    procedure DelCursor(id_Curs:Longint;MessHandle:Thandle);
    Procedure ShowCursor(id_Curs:longint);
    Procedure CursorsRefresh;
   procedure DelInCursChan(id_Curs:Longint);
    procedure CreateObzorka_FromCursors;

  end;

var
  Cursors_Form: TCursors_Form;

implementation
 uses main_f,obzorka,tvc_u,exp_f,{waitform,}mdrv, config, DM_dm;
{$R *.DFM}

Procedure TCursors_Form.CursorsRefresh;
begin
 Cursors.close;
 Cursors.open;
end;

procedure TCursors_Form.DelButtClick(Sender: TObject);
begin
 if MainForm.ActiveForm<>nil then DelCursor(CursorsID_Cursor.Value,MainForm.ActiveForm.Handle)
  else
   begin
   MessageDlg('Активизируйте окно с образом данных',mtError,[mbOK], 0);;
   end;
end;

procedure TCursors_Form.DelCursor(id_Curs:Longint;MessHandle:THandle);
var iD:integer;
begin
 cursors.Prior;
 id:=cursors.fieldbyname('ID_Cursor').asinteger;
 dm.q.SQL.Clear;
 dm.q.sqL.Add('Delete from Cursors where id_Cursor = '+IntToStr(id_curs));
 dm.q.ExecSql;
 dm.q.SQL.Clear;
 dm.q.sQL.Add('Delete from CursChan where id_Cursors = '+IntToStr(id_curs));
 dm.q.ExecSql;
 dm.q.Transaction.CommitRetaining;
 Cursors.Close;
 Cursors.Open;
 GetCursorLastNumber(Messhandle,true);
 PostMessage(MessHandle,wm_DeleteCursor,0,0);
 cursors.locate('id_Cursor',id,[]);
end;

procedure TCursors_Form.DelInCursChan(id_Curs:Longint);
begin
  dm.q.SQL.Clear;
  dm.q.sQL.Add('Delete from CursChan where id_Cursors = '+IntToStr(id_curs));
  dm.q.ExecSql;
  dm.q.Transaction.CommitRetaining;
 CursChan.Close;
 CursChan.Open;
end;

Procedure TCursors_Form.GetCursorLastNumber(messHandle:THandle;bMess:boolean);
var
 BookMark:TBookMark; Nomer,cLastCursors:word; cCursors:longint;
 Name1,Name2:String[15];
 Value1,Value2:real;
 Razm:string[6];
 id,i,j:integer;
 List1, List2:TStringList;
 T1,T2:tDatetime;
begin
  cursors.close;
  Cursors.Open;
  BookMark:=Cursors.GetBookmark;
  Cursors.DisableControls;
  Try
    Cursors.First; Cursors.FetchAll;
    Razm:=CursorsAxisXName.Value;
    if trim(Razm)='t' then Razm:='t,час';
    Name1:=IntToStr(CursorsCursor_Num.Value);
    Value1:=CursorsPointNum.Value*CursorsDeltx.Value;
    if bMess then SendMessage(messHandle,wm_setCursorsList,0,0);
    if bMess then SendMessage(messHandle,wm_AddCursorsList,0,0);
    cLastCursors:=0;
    for CCursors:=0 to Cursors.RecordCount-1 do
     begin
      Nomer:=Cursorsid_Cursor.Value;
      if CursorsCursor_Num.Value > cLastCursors then
        cLastCursors:=CursorsCursor_Num.Value;
      Cursors.Next;
      if Nomer=Cursorsid_Cursor.Value then break;
      if bMess then SendMessage(messHandle,wm_AddCursorsList,0,0);
     end;
     CursorLastNumber:=cLastCursors;
    Finally
   List1:=TStringList.create;
   List1.Sorted:=true;
   List2:=TStringList.create;
   List2.Sorted:=true;
   Cursors.First;
   while not cursors.eof do
    begin
     list1.add(Cursors.fieldbyname('Cursor_Num').asstring);
     list2.add(Cursors.fieldbyname('Cursor_Num').asstring);
     Cursors.next;
    end;
   Curs_Delt_Table.close;   Curs_Delt_Table.clear;
   for i:=0 to List1.Count-1 do
     for j:=i+1 to List1.Count-1 do
     begin
//       if i<>j then
        begin
         Cursors.locate('Cursor_Num', List1[i],[]);
         Value1:=CursorsPointNum.Value*CursorsDeltx.Value;
         {if cursorsdeltx.value = 3600 then }T1:=CursorsPointNum.Value;
//         if cursorsdeltx.value = 3600*24 then T1:=CursorsPointNum.Value*24;
         Cursors.locate('Cursor_Num', List2[j],[]);
         Value2:=CursorsPointNum.Value*CursorsDeltx.Value;
         {if cursorsdeltx.value = 3600 then }T2:=CursorsPointNum.Value;
//         if cursorsdeltx.value = 3600*24 then T2:=CursorsPointNum.Value*24;
         if not Curs_Delt_Table.active then Curs_Delt_Table.open;
         Curs_Delt_Table.Append;
         Curs_Delt_TableCurs_Delt_Name.Value:='X'+List1[j]+' - ' +'X'+List2[i];
//         Curs_Delt_TableCurs_Delt_Value.Value:=(Value2-Value1);
         Curs_Delt_TableCurs_Delt_Value.Value:=T1-T2;
         Curs_Delt_TableCurs_Delt_Razm.Value:=Razm;
         Curs_Delt_Table.Post;
        end;
     end;
  if Curs_Delt_Table.active then Curs_Delt_Table.first;
  list1.Free;
  List2.Free;
  Cursors.GotoBookMark(BookMark); Cursors.EnableControls;  Cursors.FreeBookMark(BookMark);
 end; {try}
end;

procedure TCursors_Form.ShowButtonClick(Sender: TObject);
begin
 if MainForm.ActiveForm=nil then
  begin
   MessageDlg('Активизируйте окно с образом данных',
     mtError,[mbOK], 0);;
   exit;
  end;
 if ((MainForm.ActiveForm is TImageForm) {or (mainForm.ActiveForm is TobzorkaForm )}) then
     PostMessage(MainForm.ActiveForm.Handle,wm_ShowCursor,0,CursorsPointNum.Value);
end;

procedure TCursors_Form.N3Click(Sender: TObject);
begin
 N3.Checked:=not n3.Checked;
 if N3.Checked then Cursors_Form.FormStyle:=fsStayOnTop
   else Cursors_Form.FormStyle:=fsNormal;
end;

procedure TCursors_Form.FormActivate(Sender: TObject);
begin
 DBGrid1.setFocus;
 N3.Checked := Cursors_Form.FormStyle=fsStayOnTop;
end;

Procedure TCursors_Form.ShowCursor(id_Curs:longint);
var  Nomer, cCursors:longint;
begin
  Cursors.Close;Cursors.Open;
  Cursors.DisableControls;
  Try
    Cursors.First;
    for CCursors:=0 to Cursors.RecordCount-1 do
     begin
      Nomer:=Cursorsid_Cursor.Value;
      if Nomer=id_curs then break;
      Cursors.Next;
      if Nomer=Cursorsid_Cursor.Value then break;
     end;
    Finally
    Cursors.EnableControls;
  end; {try}
  Show;
end;

procedure TCursors_Form.Cursors_MemoStrGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 if CursorsbMemo.Value =integer(true)  then  Text:=CursorsMemoStr.Value else Text:='';
end;

procedure TCursors_Form.DeleteAllCursorsClick(Sender: TObject);
var  Nomer, cCursors:longint;
begin
  Cursors.DisableControls;

  dm.q.SQL.Clear;
  dm.q.sqL.Add('Delete from Cursorsn where id_Eksp_Parent =:eksp_Parent and and AxisXName = :axisXName');
  dm.q.ParamByName('eksp_Parent').asinteger:=Cursors.fieldbyname('ID_Eksp_Parent').asinteger;
  dm.q.ParamByName('AxisXName').asstring:=Cursors.fieldbyname('AxisXName').asstring;
  dm.q.ExecSql;
  dm.q.Transaction.CommitRetaining;
  Cursors.Close;
  Cursors.Open;
 if MainForm.ActiveForm<>nil then
 begin
  if ((MainForm.ActiveForm is TImageForm) {or (mainForm.ActiveForm is TobzorkaForm )}) then
     GetCursorLastNumber(MainForm.ActiveForm.Handle,true)
             else GetCursorLastNumber(0,false);
  if ((MainForm.ActiveForm is TImageForm) {or (mainForm.ActiveForm is TobzorkaForm )})
      then PostMessage(MainForm.ActiveForm.Handle,wm_DeleteCursor,0,0);
 end
  else
   begin
   MessageDlg('Активизируйте окно с образом данных',mtError,[mbOK], 0);;
   end;
 Cursors.EnableControls;

end;

procedure TCursors_Form.N6Click(Sender: TObject);
begin
 N6.Checked:=not N6.Checked;
 if N6.Checked then
  begin
   Panel3.Align:=alTop;
   Panel1.Align:=alClient;
  end
   else
    begin
     Panel1.Align:=alBottom;
     Panel3.Align:=alClient;
    end;
end;

procedure TCursors_Form.TabbedNotebook1Change(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
 CreateObzor.Enabled:=((NewTab=2) and (MainForm.ActiveForm is TImageForm));
end;

procedure TCursors_Form.CreateObzorClick(Sender: TObject);
begin
 if not (MainForm.ActiveForm is TImageForm ) then
  begin
   MessageDlg('Активизируйте окно образа эксперимента',mtError,[mbOK], 0);;
   exit;
  end;
ImForm:=TImageForm(MainForm.ActiveForm);
if ((Point_Do.Value+Point_Posle.Value)<10) then
 begin
   MessageDlg('Увеличьте ширину зоны',mtError,[mbOK], 0);;
   exit;
  end;
 try
  appconfig.IniFile.WriteInteger('Cursors','Point_do',Point_Do.Value);
   appconfig.IniFile.WriteInteger('Cursors','Point_Posle',Point_Posle.Value);
 except
 end;
 CreateObzorka_FromCursors;
end;


procedure TCursors_Form.CreateObzorka_FromCursors;
var
 MS,SS,DSS:string[2];
 H,M,S,DS:word;
 i:word;
 StartPoint,DeltPoint:longint;
 BookMark:TBookMark;
 cCursors,Nomer:longint;
 NCurve:longint;
 LastObzForm:tObzorkaForm;
 OldViewNum:longint;
 AutoSave_Old:boolean;
 Nomer_Eksp:longint;
 ImaForm:TImageForm;
begin
(*  NCurve:=0;
  BookMark:=Cursors.GetBookmark;
  Cursors.DisableControls;
  Try
    Cursors.First;
    for CCursors:=0 to Cursors.RecordCount-1 do
     begin
      Nomer:=Cursorsid_Cursor.Value;
      Cursors.Next;
      inc(NCurve);
      if Nomer=Cursorsid_Cursor.Value then break;
     end;
    Finally
   Cursors.GotoBookMark(BookMark); Cursors.EnableControls;  Cursors.FreeBookMark(BookMark);
  end; {try}
  if NCurve<1 then
  begin
   Cursors.GotoBookMark(BookMark); Cursors.EnableControls;  Cursors.FreeBookMark(BookMark);
//   ShowMessage(Mes_Ini.ReadString('Cursors','s4','Должен быть хотя бы один курсор'));
   ShowMessage('Должно быть хотя бы одни курсор');
   exit;
  end;
   {создание записи в Eksp.Db}
   OpenEksForm.Eksps.Open;
   OpenEksForm.Eksps.Last;
   Nomer_Eksp:=OpenEksForm.EkspsEksp_Nomer.Value+1;
   OpenEksForm.Eksps.First;
   with OpenEksForm do
      begin
       Eksp_Table.Append;
       Eksp_TableEksp_Nomer.Value:=Nomer_Eksp;
       Eksp_TableEksp_Header.Value:=iMfORM.CurveCurveHeader.Value;
       Eksp_TableEksp_Date.Value:=iMfORM.Sig_TableDate_Start.Value;
       Eksp_TableEksp_Time.Value:=ImForm.Sig_TableTime_Start.Value;
       Eksp_TableEksp_Author.Value:=ImForm.SelectViewQueryView_Author.Value;
       Eksp_TableEksp_Theme.Value:='Selection from '+ImForm.Caption;
       Eksp_TableEksp_Proc.Value:=0;
       Eksp_TableEksp_Parent.Value:=Nomer_Eksp;
       if GemisWin_Version in [0] then
        begin
         Eksp_Tableid_upLevel.Value:=-2;
         Eksp_TableEksp_Theme.Value:='Demo-Data'+chr(7);
        end;
       Eksp_Table.Post;
     end;
    OpenEksForm.Eksps.Close;
    OpenEksForm.CurveSetTable.Close;OpenEksForm.CurveSetTable.Open;
    OpenEksForm.CurveSetTable.Append;
    OpenEksForm.CurveSetTableView_Header.Value:='Selection from '+
                 ImForm.SelectViewQueryView_Header.value+' '+ImForm.CurveCurveHeader.Value;;
    OpenEksForm.CurveSetTableView_Date.Value:=Now;
    OpenEksForm.CurveSetTableView_Time.Value:=Time;
    OpenEksForm.CurveSetTableView_Author.Value:=ImForm.SelectViewQueryView_Author.Value;
    OpenEksForm.CurveSetTableView_Theme.Value:=ImForm.CurveCurveHeader.Value;
    OpenEksForm.CurveSetTableView_Style.Value:=cNoMap_View;
    OpenEksForm.CurveSetTableUp.Value:=10+Random(20);
    OpenEksForm.CurveSetTableLeft.Value:=10+Random(20);
    OpenEksForm.CurveSetTableWidth.Value:=450+Random(20);
    OpenEksForm.CurveSetTableHeight.Value:=330+Random(20);
    OpenEksForm.CurveSetTableEksp_Parent.Value:=Nomer_Eksp;
    OpenEksForm.CurveSetTable.Post;
    ViewNum:=OpenEksForm.CurveSetTableView_Nomer.Value;
    OpenEksForm.CurveSetTable.Close;
    OpenEksForm.CurveTable.Close;OpenEksForm.CurveTable.Open;
    OpenEksForm.Signals.Open;
    BookMark:=Cursors.GetBookmark;
    Cursors.DisableControls;
    Try
     Cursors.First;
     Gauge1.MinValue:=0;Gauge1.MaxValue:=NCurve-1;Gauge1.Progress:=0;
     Gauge1.Visible:=true;
     for CCursors:=0 to Cursors.RecordCount-1 do
      begin
      StartPoint:=CursorsPointNum.Value-Point_Do.Value;
      if StartPoint<0 then StartPoint:=0;
      DeltPoint:=Point_Do.Value+Point_Posle.Value;
      OpenEksForm.Signals.Append;
      OpenEksForm.SignalsEksp_Nomer.Value:= Nomer_Eksp;
      OpenEksForm.SignalsEksp_Parent.Value:= Nomer_Eksp{SelectViewQueryEksp_Parent.Value};
      OpenEksForm.SignalsChanal_Nomer.Value:= cCursors;
      OpenEksForm.SignalsChanal_Header.Value:= IntToStr(cCursors+1)+' '+ImForm.CurveCurveHeader.Value;
      OpenEksForm.SignalsDeltX.Value:= pSigTabRec(ImForm.CurvepSigTabRec.Value)^.DeltX;
      OpenEksForm.SignalsNameY.Value:= ImForm.Sig_TableNameY.Value;
      OpenEksForm.SignalsNameX.Value:= ImForm.Sig_TableNameX.Value;
      OpenEksForm.SignalsRazmX.Value:= ImForm.Sig_TableRazmX.Value;
      OpenEksForm.SignalsRazmY.Value:= ImForm.Sig_TableRazmY.Value;;
      OpenEksForm.SignalsMultX.Value:= 1;
      OpenEksForm.SignalsMultY.Value:= 1;
      OpenEksForm.SignalsMaxX.Value:= 1;
      OpenEksForm.SignalsMaxY.Value:= 1;
      OpenEksForm.SignalsMinX.Value:=0;
      OpenEksForm.SignalsMinY.Value:= 0;
      OpenEksForm.SignalsDate_Start.Value:= pSigTabRec(ImForm.CurvepSigTabRec.Value)^.DateTimeStart;
      OpenEksForm.SignalsTime_Start.Value:= pSigTabRec(ImForm.CurvepSigTabRec.Value)^.DateTimeStart;
      OpenEksForm.SignalsPointAll.readOnly:=false;
      OpenEksForm.SignalsPointAll.Value:= DeltPoint;
      OpenEksForm.SignalsBMaxMinX.Value:= false;
      OpenEksForm.SignalsBMaxMinY.Value:= false;
      OpenEksForm.SignalsRezType.Value:= pSigTabRec(ImForm.CurvepSigTabRec.Value)^.RezType;
      OpenEksForm.SignalsFile_Seek.Value:= StartPoint*cSizeRez[ImForm.SigTabRec.RezType]+
                            pSigTabRec(ImForm.CurvepSigTabRec.Value)^.Seek_Start;
      OpenEksForm.SignalsRezlength.Value:= cSizeRez[pSigTabRec(ImForm.CurvepSigTabRec.Value)^.RezType];
      OpenEksForm.SignalsA0.Value:= pSigTabRec(ImForm.CurvepSigTabRec.Value)^.a0;
      OpenEksForm.SignalsA1.Value:= pSigTabRec(ImForm.CurvepSigTabRec.Value)^.a1;
      OpenEksForm.SignalsA2.Value:= pSigTabRec(ImForm.CurvepSigTabRec.Value)^.a2;
      OpenEksForm.SignalsA3.Value:= pSigTabRec(ImForm.CurvepSigTabRec.Value)^.a3;
      OpenEksForm.SignalsFileDat.Value:= pSigTabRec(ImForm.CurvepSigTabRec.Value)^.Filedat;
      OpenEksForm.Signals.Post;
      OpenEksForm.CurveTable.Append;
      OpenEksForm.CurveTablePointStart.Value:= 0;
      OpenEksForm.CurveTablePointEnd.Value:= DeltPoint;
      OpenEksForm.CurveTableView_Nomer.Value:= ViewNum;
      OpenEksForm.CurveTableSignal_Nomer.Value:= OpenEksForm.SignalsSignal_Nomer.Value;
      OpenEksForm.CurveTableCurveHeaderShort.Value:= copy(intToStr(cCursors+1)+' '+ImForm.CurveCurveHeaderShort.Value,1,8);
      OpenEksForm.CurveTableCurveHeader.Value:= intToStr(cCursors+1)+' '+ImForm.CurveCurveHeader.Value;
      OpenEksForm.CurveTableViewMaxX.Value:= 0;
      OpenEksForm.CurveTableViewMaxY.Value:= 0;
      OpenEksForm.CurveTableViewMinY.Value:= 0;
      OpenEksForm.CurveTableViewMinX.Value:= 0;
      OpenEksForm.CurveTablebViewMaxMinX.Value:= false;
      OpenEksForm.CurveTablebViewMaxMinY.Value:= false;
      OpenEksForm.CurveTablebPolyCreate.Value:= false;
      OpenEksForm.CurveTablePolyPoint.Value:= 0;
      DecodeTime(Time,H,M,S,DS);         DElay(110);
      Str(M:1,MS);   if m<10 then MS:='0'+Ms;
      Str(S:1,SS);   if s<10 then sS:='0'+ss;
      Str(DS:1,DSS); if ds<10 then dss:='0'+dss;
      OpenEksForm.CurveTablePolyFile.Value:=  GemisWin_dat_Path+'cf'+MS+SS+DSS+'.Dat';
      OpenEksForm.CurveTableCOlor.Value:= ImForm.CurveColor.Value;
      OpenEksForm.CurveTableStyle.Value:= ImForm.CurveStyle.Value;
      OpenEksForm.CurveTableCurveWidth.Value:= ImForm.CurveCurveWidth.value;
      OpenEksForm.CurveTableViewPage.Value:='Select from Bookmark';
      OpenEksForm.CurveTableScaleStyle.Value:=3;
      OpenEksForm.CurveTableCurveDate.Value:=Now;
      OpenEksForm.CurveTableCurveTime.Value:=Time;
      OpenEksForm.CurveTableSlider.Value:=0;
      OpenEksForm.CurveTableMult.Value:=1;
      OpenEksForm.CurveTableMultAll.Value:=1;
      OpenEksForm.CurveTablepPolyX.Value:=longint(nil);
      OpenEksForm.CurveTablepPolyY.Value:=longint(nil);
      OpenEksForm.CurveTableAxisXStyle.Value:=ImForm.CurveAxisXStyle.Value;
      OpenEksForm.CurveTableColorFon.Value:=ImForm.CurveColorFon.Value;
      OpenEksForm.CurveTableGridX.Value:=ImForm.CurveGridX.Value;
      OpenEksForm.CurveTableGridY.Value:=ImForm.CurveGridY.Value;
      OpenEksForm.CurveTable.Post;
      Gauge1.Progress:=Gauge1.Progress+1;
      Nomer:=Cursorsid_Cursor.Value;
      Cursors.Next;
      if Nomer=Cursorsid_Cursor.Value then break;
     end;
     Gauge1.Visible:=false;
    Finally
   Cursors.GotoBookMark(BookMark); Cursors.EnableControls;  Cursors.FreeBookMark(BookMark);
  end; {try}
   OpenEksForm.Signals.close;
   Application.CreateForm(TIMageForm, ImaForm);
   ImaForm.Show;
*)
end;


procedure TCursors_Form.FormCreate(Sender: TObject);
begin
//  Get_Lang_Par({Lang_Ini,}self,'Cursors');
  Point_Do.Value := AppConfig.IniFile.ReadInteger('Cursors','Point_do',100);
  Point_Posle.Value := AppConfig.IniFile.ReadInteger('Cursors','Point_Posle',300);
  Left:=AppConfig.IniFile.Readinteger('Cursors','Left',100);
  Height:=AppConfig.IniFile.Readinteger('Cursors','Height',295);
  Top:=AppConfig.IniFile.Readinteger('Cursors','Top',100);
  Width:=AppConfig.IniFile.Readinteger('Cursors','Width',380);
//  Panel_Report.Visible:=AppConfig.IniFile.Readstring('APB','APB','7368_no')='7368';
{  Save_Lang_Par(Lang_Ini,self,'Cursors_Form');}
 Tabsheet1.TabVisible:=false;
end;

procedure TCursors_Form.FormResize(Sender: TObject);
begin
AppConfig.IniFile.writeinteger('Cursors','Left',Left);
AppConfig.IniFile.writeinteger('Cursors','Height',Height);
AppConfig.IniFile.writeinteger('Cursors','Top',Top);
AppConfig.IniFile.writeinteger('Cursors','Width',Width);
end;

procedure TCursors_Form.Cursors_AfterOpen(DataSet: TDataset);
begin
// Panel_Report.Visible:=(AppConfig.IniFile.Readstring('APB','APB','7368_no')='7368') and
//                        ((Cursors.RecordCount>3) and (Cursors.RecordCount<9));
// Ob_RepPanel.Visible:=Panel_Report.Visible;
end;

procedure TCursors_Form.CursChan_AfterOpen(DataSet: TDataset);
var s:string;
begin
{ s:=CursChanImage_caption.Value;
 if pos('СТД_Об ',S)=1 then
  begin
   delete(s,1,8);
   delete(s,pos('.',s),length(s)-pos('.',s)+1);
   etap.text:=s;
  end;}
end;

procedure TCursors_Form.CursorsAfterOpen(DataSet: TDataSet);
begin
 Cursors.FetchAll;
 curschan.open;
end;

procedure TCursors_Form.CursorsMEMOSTRGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 if CursorsbMemo.Value =integer(true)  then  Text:=CursorsMemoStr.Value else Text:='';
end;

procedure TCursors_Form.CursorsBeforeClose(DataSet: TDataSet);
begin
curschan.close;
end;

end.
