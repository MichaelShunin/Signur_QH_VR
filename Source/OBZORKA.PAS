unit Obzorka;

interface

uses sysutils,WinTypes, WinProcs, Classes, Graphics, Messages,Forms, Controls, StdCtrls, Tabs,
  Dialogs,printers,
  Buttons,  DBCtrls, DBTables, DB, Mask, Grids, DBGrids,
  FileBuff,
  tvc_U, DBLookup, Menus, Gauges, Movepane,  ExtCtrls,  RXSlider, IBQuery,
  IBCustomDataSet, ComCtrls, common_f;


type
  TObzorkaForm = class(TCommonForm)
    TabSet: TTabSet;
    CurveDataSource: TDataSource;
    Sig_DataSource: TDataSource;
    ViewPageDataSource: TDataSource;
    PopupMenu1: TPopupMenu;
    PopupMemu1: TMenuItem;
    N1: TMenuItem;
    ScrollBox1: TPanel;
    Panel1: TPanel;
    FonPanel: Tpanel;
    PaintBox: TPaintBox;
    Slider1: TRxSlider;
    Proportional1: TMenuItem;
    Convert_To_Image: TMenuItem;
    Panel2: TPanel;
    N3: TMenuItem;
    Label1: TLabel;
    CurveSetDataSource: TDataSource;
    TimeAll: TLabel;
    Panel3: TPanel;
    TimeStart: TLabel;
    TimeEnd: TLabel;
    N4: TMenuItem;
    LabelMouse: TLabel;
    N5: TMenuItem;
    N6: TMenuItem;
    MultBox: TPanel;
    Label2: TLabel;
    MultEdit: TEdit;
    Koef_Uvel: TBitBtn;
    Koef_Umen: TBitBtn;
{    Slider1: TTrackBar;}
    Koef_Show: TBitBtn;
    Koef_Close: TBitBtn;
    MultRB: TRadioGroup;
    Label6: TLabel;
    CurveSetParamBox: TPanel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    N7: TMenuItem;
    CursorTable: TTable;
    CursorTablePointNum: TIntegerField;
    CursorTableCursor_Num: TIntegerField;
    CursorTableXStr: TStringField;
    CursorTableId_Cursor: TIntegerField;
    CursorTableMemoStr: TStringField;
    CursorTableBXStr: TBooleanField;
    CursorTableBMemo: TBooleanField;
    UpdateCursorTable: TQuery;
    CursorMenu: TPopupMenu;
    N23: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N24: TMenuItem;
    N27: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    CursorTableId_Eksp_Parent: TIntegerField;
    CursorTableAxisXName: TStringField;
    ImageMemo: TDBMemo;
    Color_Map: TMenuItem;
    N10: TMenuItem;
    CursorTableDeltX: TFloatField;
    Curve: TIBDataSet;
    CurveVIEW_SIGNAL_NOMER: TIntegerField;
    CurveVIEW_NOMER: TIntegerField;
    CurveSIGNAL_NOMER: TIntegerField;
    CurveCURVEHEADERSHORT: TIBStringField;
    CurveCURVEHEADER: TIBStringField;
    CurvePOINTSTART: TIntegerField;
    CurvePOINTEND: TIntegerField;
    CurveVIEWMAXX: TFloatField;
    CurveVIEWMAXY: TFloatField;
    CurveVIEWMINX: TFloatField;
    CurveVIEWMINY: TFloatField;
    CurveBVIEWMAXMINX: TSmallintField;
    CurveBVIEWMAXMINY: TSmallintField;
    CurveBPOLYCREATE: TSmallintField;
    CurvePOLYPOINT: TIntegerField;
    CurvePOLYFILE: TIBStringField;
    CurveCOLOR: TIntegerField;
    CurveSTYLE: TSmallintField;
    CurveCURVEWIDTH: TSmallintField;
    CurveVIEWPAGE: TIBStringField;
    CurveCURVEMEMO: TMemoField;
    CurveCURVEDATE: TDateField;
    CurveCURVETIME: TDateField;
    CurveVISIBLE: TSmallintField;
    CurveSCALESTYLE: TSmallintField;
    CurveVIEWMINYALL: TFloatField;
    CurveVIEWMAXYALL: TFloatField;
    CurveWIDTH: TIntegerField;
    CurveHEIGHT: TIntegerField;
    CurveSLIDER: TFloatField;
    CurveMULT: TFloatField;
    CurveOLDLEFTPOINT: TIntegerField;
    CurveOLDRIGHTPOINT: TIntegerField;
    CurveBFASTPOLYCREATE: TSmallintField;
    CurvePSIGTABREC: TIntegerField;
    CurvePPOLYX: TIntegerField;
    CurvePPOLYY: TIntegerField;
    CurveMULTALL: TFloatField;
    CurveAXISXSTYLE: TSmallintField;
    CurveCOLORFON: TIntegerField;
    CurveGRIDX: TIntegerField;
    CurveGRIDY: TIntegerField;
    ViewPage: TIBQuery;
    ViewPageVIEWPAGE: TIBStringField;
    SelectViewQuery: TIBDataSet;
    SelectViewQueryVIEW_NOMER: TIntegerField;
    SelectViewQueryEKSP_PARENT: TIntegerField;
    SelectViewQueryVIEW_THEME: TIBStringField;
    SelectViewQueryVIEW_DATE: TDateField;
    SelectViewQueryVIEW_TIME: TDateField;
    SelectViewQueryVIEW_HEADER: TIBStringField;
    SelectViewQueryVIEW_AUTHOR: TIBStringField;
    SelectViewQueryVIEW_MEMO: TMemoField;
    SelectViewQueryLEFT_: TIntegerField;
    SelectViewQueryUP: TIntegerField;
    SelectViewQueryWIDTH: TIntegerField;
    SelectViewQueryHEIGHT: TIntegerField;
    SelectViewQueryVIEW_STYLE: TSmallintField;
    Sig_Table: TIBDataSet;
    Sig_TableSIGNAL_NOMER: TIntegerField;
    Sig_TableEKSP_NOMER: TIntegerField;
    Sig_TableEKSP_PARENT: TIntegerField;
    Sig_TableCHANAL_NOMER: TSmallintField;
    Sig_TableCHANAL_HEADER: TIBStringField;
    Sig_TableDELTX: TFloatField;
    Sig_TableNAMEX: TIBStringField;
    Sig_TableNAMEY: TIBStringField;
    Sig_TableRAZMX: TIBStringField;
    Sig_TableRAZMY: TIBStringField;
    Sig_TableMULTX: TFloatField;
    Sig_TableMULTY: TFloatField;
    Sig_TableMAXX: TFloatField;
    Sig_TableMAXY: TFloatField;
    Sig_TableMINX: TFloatField;
    Sig_TableMINY: TFloatField;
    Sig_TableDATE_START: TDateField;
    Sig_TableTIME_START: TTimeField;
    Sig_TablePOINTALL: TIntegerField;
    Sig_TableFILEDAT: TIBStringField;
    Sig_TableREZTYPE: TSmallintField;
    Sig_TableREZLENGTH: TSmallintField;
    Sig_TableA0: TFloatField;
    Sig_TableA1: TFloatField;
    Sig_TableA2: TFloatField;
    Sig_TableA3: TFloatField;
    Sig_TableSIGNALMEMO: TMemoField;
    Sig_TableSIGNAL_SELECTED: TSmallintField;
    Sig_TableFILE_SEEK: TIntegerField;
    Sig_TableBMAXMINX: TSmallintField;
    Sig_TableBMAXMINY: TSmallintField;
    ColorDialog: TColorDialog;
    PB: TProgressBar;
    BitBtn1: TBitBtn;
    Sig_Tablefiledat_abs: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSetClick(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
    procedure Slider1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure ShowKoef(Sender:TObject);
    procedure Koef_CloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Koef_ShowClick(Sender: TObject);
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
{    procedure N1Click(Sender: TObject);}
    procedure Proportional1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N7Click(Sender: TObject);
    procedure PaintBoxClick(Sender: TObject);
    procedure PaintBoxDblClick(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure CursorMenuPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Color_MapClick(Sender: TObject);
    procedure Convert_To_ImageClick(Sender: TObject);
    procedure Slider1Change(Sender: TObject);
    procedure CurveAfterPost(DataSet: TDataSet);
    procedure SelectViewQueryAfterPost(DataSet: TDataSet);
    procedure CurveAfterOpen(DataSet: TDataSet);
    procedure Sig_TableCalcFields(DataSet: TDataSet);

    Public

        SigTabRec:TSigTabRec;
        ActiveCurveEnd,ActiveCurveStart:longint;
        ViewNumber:longint;
        ActiveTimeStart,ActiveTimeEnd:TDateTime;
        CursorsList:TList;
        TimeMouseDT:TdateTime;
        XOldStr:string;
        PointNumber:longint;
        WhatDo:word;

   procedure CreatePoly(Width,Height,LeftM,UpM:Word);
   Procedure ShowCurve(DrawCanvas:TCanvas;Width,Height:word;i_Curve:integer);
   Procedure DrawCursor(Width,Height:word);
   procedure SetFon ( color:TColor);

  private
    { Private declarations }
    bsaveimage,FlagMove:boolean;
    Delt:longint; RightPoint,LeftPoint:longint;
    BookMarkArr:array[0..cMaxViewPage-1] of TBookMark;
    FileDat:TBufferedFile;
    Status:smallint;
    bCreateOver:boolean;
    {FirstResize:boolean;}
{    FirstIn:byte;}
    ScaleStyle:smallint;
    PaintWidth,PaintHeight:smallint;
    NPageCurve,OldPageCurve,cPageCurve:smallint;
    bSetCurveParam:boolean;
    Mult:Real;
    OldActiveCurveNum,ActiveCurveNum:longint;
    TimeMin,TimeMax:string;
    TimeMinDT,TimeMaxDT,DeltTDt:tDateTime;
    bNeedCreatePoly:boolean;
    NAllCurveInPage:word;

    PointNachalo,PointKonec:longint;
    FileColorImage_Name:string;
//    FileColorImage:TBufferedFile;
    FileColorImage:TFileStream;
    {    }
    Procedure UpdatePaint(Sender: TObject);
    Procedure UpdateActiveCurve;
    procedure GetCurveParam;
    Procedure UpdateView(bRepaint:boolean;bRecalc:boolean);
    Procedure OpenSignalArr;
    Procedure CloseSignalArr;
    Procedure UpdateTimeStartEndLabel;
    procedure ProcessingCursorForm(bWithGetLastN:boolean);


   procedure wmSetFon ( var Message:TMessage ); message wm_setFon;

   Procedure CloseCursorsList;
   procedure wmSetCursorsList( var Message:TMessage ); message wm_SetCursorsList;
   procedure wmAddCursorsList( var Message:TMessage ); message wm_AddCursorsList;
   procedure wmDeleteCursor( var Message:TMessage ); message wm_DeleteCursor;
   procedure wmShowCursor( var Message:TMessage ); message wm_ShowCursor;

  public
    { Public declarations }
  end;

var
  ObzorkaForm: TObzorkaForm;

implementation
 uses Mdrv,Main_f,GetGWRez,{FuncProc,}exp_f,image_u,cursors{preview,waitform},
  config, DM_dm;

{$R *.DFM}

procedure TObzorkaForm.FormCreate(Sender: TObject);
var i:word;
 MS,SS,DSS:string[2];
 H,M,S,DS:word;

begin
//  Get_Lang_Par({Lang_2_Ini,}self,'obzorka');
  Slider1.Align:=alRight;
  bSetCurveParam:=false;
  bNeedCreatePoly:=True;
  OldPageCurve:=-1;
  bCreateOver:=False;
  {FirstIn:=0; FirstResize:=true;}
{  MainForm.Status.Caption:='Select from CurveSet';MainForm.Status.Update;}
  ViewNumber:=ViewNum;
  SelectViewQuery.close;
  SelectViewQuery.parambyname('View_Nomer').asinteger:=ViewNum;
  SelectViewQuery.Open;

{  MainForm.Status.Caption:='Select ViewPage';MainForm.Status.Update;}
  ViewPage.SQL.Clear;
  ViewPage.SQL.ADD('Select distinct ViewPage  from Curve where View_Nomer = ' +   intToStr ( ViewNumber));
  ViewPage.Open;
  TabSet.Tabs.Clear;     {заполенение TabSet}
  i:=0;
  while not ViewPage.EOF do
   begin
    TabSet.Tabs.Add(ViewPageViewPage.Value);
    BookMarkArr[i]:=ViewPage.GetBookMark;
    ViewPage.Next;
    inc(i);
   end;

  ViewPage.First;
{  MainForm.Status.Caption:='Select Curve';MainForm.Status.Update;}
  Curve.close;
  Curve.ParamByName('View_Nomer').asinteger:=ViewNumber ;
  Curve.ParamByName('ViewPage').asstring:=ViewPage.fieldbyname('ViewPage').asstring ;
  Curve.Open;Curve.Fetchall;

  ScaleStyle:=2;
{  MainForm.Status.Caption:='Select Signal';MainForm.Status.Update;  }
  OpenSignalArr;                 

  Caption:=SelectViewQueryView_Header.Value;
  Height:=selectViewQueryHeight.Value;
  Top:=selectViewQueryUp.Value;
  Left:=selectViewQueryLeft_.Value;
  Width:=selectViewQueryWidth.Value;
  PaintBox.Align:=alClient;
{  ChanalBox.Align:=alLeft;}
  LeftPoint:=CurvePointStart.Value; RightPoint:=CurvePointEnd.Value;
{  MainForm.Status.Caption:='Find CurveParam';MainForm.Status.Update;}
  PaintWidth:=PaintBox.Width;
  PaintHeight:=PaintBox.Height;
  TabSet.TabIndex:=0;
  Label1.Visible:=False;
  bCreateOver:=True;
  DecodeTime(Time,H,M,S,DS);
  Str(M:1,MS);   if m<10 then MS:='0'+Ms;
  Str(S:1,SS);   if s<10 then sS:='0'+ss;
  Str(DS:1,DSS); if ds<10 then dss:='0'+dss;
  sleep(100);
  FileColorImage_Name:=dm.ActiveStoragepath+MS+SS+DSS+'.###';
{  Save_Lang_Par(Lang_2_Ini,self,'obzorka');}
  inherited;
end;

procedure TObzorkaForm.FormActivate(Sender: TObject);
begin
{  MainForm.Status.Caption:=' Обзорка';MainForm.Status.Update;}
  ScaleStyle:=CurveScaleStyle.Value;
  TabSet.UpDate;
  MainForm.FFTButton.Enabled:=false;
  MainForm.FTButton.Enabled:=False;
{  MainForm.FxButton.Enabled:=False;}
  MainForm.ObzorkaButton.Enabled:=False;
  MainForm.AudioButton.Enabled:=False;
  MainForm.FiltrButton.Enabled:=False;
  MainForm.UserButton.Enabled:=False;
  mainForm.MenuExport.Enabled:=false;
  MainForm.CursorsButton.Enabled:=true;
//  MainForm.N4.Enabled:=true;
  MainForm.ActiveForm:=self;
  ProcessingCursorForm(true);
end;

procedure TObzorkaForm.FormResize(Sender: TObject);
{var BookMark:TBookMark;}
begin
 if CurvepSigTabRec.Value=0 then exit;
// if not bCreateOver then
  begin
   if ((Width=selectViewQueryWidth.Value) and
      (Height=selectViewQueryHeight.Value)) then
      begin
       if CurvebPolyCreate.Value <> integer(true) then
         bNeedCreatePoly:=True;
      end
    else
   begin
    if  ((CurveWidth.Value=PaintBox.Width) and (CurveHeight.Value=PaintBox.Height)) then exit
     else
      begin  bNeedCreatePoly:=True;end;
   end;
 end;  
end;

Procedure TObzorkaForm.UpdateView(bRepaint:boolean;bRecalc:boolean);
begin
     if bRecalc then bNeedCreatePoly:=True;
     if bRepaint then PaintBoxPaint(nil);
     if NPageCurve<>0 then DeltTDT:=(TimeMaxDT-TimeMinDT)/NPageCurve;
     DrawCursor(PaintBox.width,PaintBox.Height);
end;


procedure TObzorkaForm.GetCurveParam;
 var Status:smallint;
     MinX,MaxX,MinY,MaxY:Real;
     MinYAll,MaxYAll:real;
     i1,i2:longint;
{     BookMark:TBookMark;}
     cCurve:word;
     Nomer:longint;

    Procedure GetMaxMinYCurve;
    begin
      if  (CurvebViewMaxMinY.Value <> integer(True) )then
       begin    {определение мах мин по оси Y }
        if Curve.State<>dsEdit then Curve.Edit;
        GetMaxMinY(0,SigTabRec.PointAll-1,MinY,MaxY,i1,i2,Status,SigTabRec);
        CurveViewMinY.Value:=MinY; CurveViewMaxY.Value:=MaxY;
        CurvebViewMaxMinY.Value:=integer(True);
       end;
    end;

begin
if  bSetCurveParam then exit;
if  (CurvebViewMaxMinX.Value <> integer(True) )then
 begin    {определение мах мин по оси X }
  Curve.Edit;{Curve.RequestLive:=True}
  GetMaxMinX(CurvePointStart.Value,CurvePointEnd.Value,MinX,MaxX,Status,SigTabRec);
  CurveViewMinX.Value:=MinX; CurveViewMaxX.Value:=MaxX;
  CurvebViewMaxMinX.Value:=integer(True);
 end;
             {общий масштаб}
{     BookMark:=Curve.GetBookmark;}
     Curve.DisableControls;
     Try
      Curve.First;  Curve.fetchall;
      cPageCurve:=0;
      MaxYAll:=CurveViewMaxY.Value;   MinYAll:=CurveViewMinY.Value;
      for CCurve:=0 to Curve.RecordCount-1 do
      begin
       if  (CurvebViewMaxMinY.Value <> integer(True) )then
       begin    {определение мах мин по оси Y }
           Curve.Edit;{Curve.RequestLive:=True;}
           SigtabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
           GetMaxMinY(0,SigTabRec.PointAll-1,MinY,MaxY,i1,i2,Status,SigTabRec);
           CurveViewMinY.Value:=MinY; CurveViewMaxY.Value:=MaxY;
           CurvebViewMaxMinY.Value:=integer(True);
           Curve.Post;
          end;
       if MaxYAll<CurveViewMaxY.Value then  MaxYAll:=CurveViewMaxY.Value;
       if MinYAll>CurveViewMinY.Value then MinYAll:=CurveViewMinY.Value;
       Nomer:=CurveView_Signal_Nomer.Value;
{       if CurveVisible.Value then }inc(cPageCurve);
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
      NPageCurve:=cPageCurve;
      Curve.First;
      for CCurve:=0 to Curve.RecordCount-1 do
      begin
       Curve.Edit;{Curve.RequestLive:=True;}
       CurveScaleStyle.Value:=2;
       CurveViewMinYAll.Value:=MinYAll; CurveViewMaxYAll.Value:=MaxYAll;
       CurveSlider.Value:=Slider1.Value{Position};
       Curve.Post;
       Nomer:=CurveView_Signal_Nomer.Value;
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
     Finally
{        Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);}
        SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
        {GetSignal;}
{        Sig_Table.Close;        Sig_Table.Open};
     end;
{ if Curve.State = dsEdit then
  begin
   Curve.RequestLive:=True;
   Curve.Post;
  end;}
  bSetCurveParam:=True;
  end;

procedure TObzorkaForm.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  Whatdo:=mrYes;
  if not MainForm.Autosave.Checked then
   begin
   WhatDo:=MessageDlg('Сохранить образ '+Caption+' ?',
     mtInformation,[mbYes, mbNo,mbCancel], 0);
   if WhatDo = mrCancel then
    begin
     Action:=caNone;
     exit;
    end;
   end;
   Action:=caFree;
   MainForm.CursorsButton.Enabled:=false;
//   MainForm.N4.Enabled:=false;
   MainForm.ActiveForm:=nil;
  end;

procedure TObzorkaForm.TabSetClick(Sender: TObject);
begin
 if bCreateOver then CloseSignalArr;
 Sig_Table.Close;
 Curve.Close;
 ViewPage.GotoBookMark(BookMarkArr[TabSet.TabIndex]);
 Curve.Open;
 OpenSignalArr;{Sig_Table.Open;}
 Slider1.UpDate;
 ScaleStyle:=CurveScaleStyle.Value;;
 LeftPoint:=CurvePointStart.Value; RightPoint:=CurvePointEnd.Value;
 if  ((CurveWidth.Value<>PaintBox.Width) or (CurveHeight.Value<>PaintBox.Height)) then
  bNeedCreatePoly:=True
  else
   if CurvebPolyCreate.Value<>integer(true) then bNeedCreatePoly:=True;
 ProcessingCursorForm(true);
 UpdateView(true,false);
end;

procedure TObzorkaForm.CreatePoly(Width,Height,LeftM,UpM:word);
var {BookMark:TBookMark;}
    pPolyX,pPolyY:pPolyArr;
    NPolyPoint:word;
//    {FileIMage,}FileDat:TBufferedFile;
    {FileIMage,}FileDat:TFileStream;
    NumMax,NumMin,i,j,k,Point1,Point2,PointStart,PointEnd:longint;
    Prosto:Boolean;
    Rez,TekMax,TekMin,r1,r2:Real;
    XStart,XOld,XTek:smallint;
    cCurve,Shag,Tip:word;
    MaxX,MinX,MaxY,MinY:real;
    i1,i2:longint;
    Nomer:longint;
    Kx,Ky,A3,A1,A2,A0,cr:real;
    RezInteger:smallint;RezLI:Longint;RezSingle:Single;
    MinInteger:smallint;MinLI:Longint;MinSingle:Single;
    MaxInteger:smallint;MaxLI:Longint;MaxSingle:Single;
    PromRez, PromMaxY,PromMinY:real;
    ViewMinY:real;
    MinYAll,MaxYAll:real;
    BufReal:pDataReal;
    BufLI:pBufferLInt;
    BufInteger:pDataW;
    nBufferPoint:longint;
    RR1:real;
    CVisibleCurve:smallint;
begin
 Cursor:=crHourGlass;
 bSaveImage:=false;
 GetCurveParam;
{$R-}
{ BookMark:=Curve.GetBookmark;}
 Curve.DisableControls;
 Try
  Curve.First;  Curve.Fetchall;
  cVisibleCurve:=0;
  for CCurve:=0 to Curve.RecordCount-1 do
   begin
       SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
       Curve.Edit;                     {Расчет и сохранение Poly}
       if  (CurvebViewMaxMinX.Value <> integer(True) )then
       begin    {определение мах мин по оси X }
        GetMaxMinX(CurvePointStart.Value,CurvePointEnd.Value,MinX,MaxX,Status,SigTabRec);
        CurveViewMinX.Value:=MinX; CurveViewMaxX.Value:=MaxX;
        CurvebViewMaxMinX.Value:=integer(True);
       end;
      CurveSlider.Value:=Slider1.Value;
      MinYAll:=CurveViewMinYAll.Value;
      MaxYAll:=CurveViewMaxYAll.Value;
      if MaxYall=MinYAll then maxYAll:=MinYAll+1;
      if (CurveViewMaxX.Value=CurveViewMinX.Value) then CurveViewMaxX.Value:=CurveViewMinX.Value+1;
      PointStart:=CurvePointStart.Value;PointEnd:=CurvePointEnd.Value;
      if PointStart=PointEnd then PointEnd:=PointStart+2;
      NPolyPoint:=PointEnd-PointStart;
      if NPolyPoint div Width <= 2 then begin Prosto:=true;end
                   else begin NPolyPoint:=2*Width;Prosto:=false;end;
      A3:=SigTabRec.A3;A2:=SigTabRec.A2;
      A1:=SigTabRec.A1;A0:=SigTabRec.A0;
      Tip:=SigTabRec.RezType;
      Shag:=cSizeRez[tip];
      Kx:=Width/(PointEnd-PointStart);
      if NPageCurve<>0 then
         begin
          ViewMinY:=CurveViewMinY.Value*CurveMult.Value;
          if Color_Map.Checked then Ky:=1024*CurveMult.Value/(CurveViewMaxY.Value-CurveViewMinY.Value)
                                else
           begin
           if (CurveMult.Value*(CurveViewMaxY.Value-CurveViewMinY.Value))=0 then Ky:=Height/NPageCurve
            else Ky:=Height/NPageCurve/(CurveMult.Value*(CurveViewMaxY.Value-CurveViewMinY.Value));
           end;
          RR1:=Height/NPageCurve+Ky*ViewMinY+Height/NPageCurve*cVisibleCurve;
         end
         else
          begin
           RR1:=Height+Ky*ViewMinY;
           if Color_Map.Checked then Ky:=512 else
             Ky:=Height+(CurveViewMaxY.Value-CurveViewMinY.Value);
          end;
     K:=0;
     pPolyX:=pPolyArr(CurvepPolyX.Value);
     pPolyY:=pPolyArr(CurvepPolyY.Value);
{      if not CurvebFastPolyCreate then
       begin
}        if pPolyX<>nil then Freemem(pPolyX,CurvePolyPoint.Value*Sizeof(Word)+Zapas);
        if pPolyY<>nil then Freemem(pPolyY,CurvePolyPoint.Value*Sizeof(Word)+Zapas);
        GetMem(pPolyX,NPolyPoint*SizeOf(Word)+Zapas);
        GetMem(pPolyY,NPolyPoint*SizeOf(Word)+Zapas);
        GetReadFileDat(FileDat,Status,SigTabRec);
        TimeAll.Caption:='CreatePoly '+IntToStr(CCurve);TimeAll.Update;
//        FileDat.Seek(SigTabrec.Seek_start+PointStart*cSizeRez[SigTabRec.RezType]);
         FileDat.Position:=(SigTabrec.Seek_start+PointStart*cSizeRez[SigTabRec.RezType]);
(*       end
        else
         begin
          if PointStart>CurveOldLeftPoint.Value then
           begin
           end
            else
             begin
             end;
         end;
 *)      if pointStart<>PointEnd then
      begin
      if Prosto then
          for i:=PointStart to PointEnd do
           begin
            pPolyX^[k]:=round((i-PointStart)*Kx)+LeftM;
            case Tip of
              cRealLong,cAnyChanal,cSeismoReal: begin FileDat.Read(RezSingle,Shag{,BytesRead});Rez:=RezSingle;end;
              cAllData,cWordLong,cSeismoWord:begin FileDat.Read(RezInteger,Shag{,BytesRead});Rez:=RezInteger;end;
              cAllData18,cLong18,cSeismoLInt:begin FileDat.Read(RezLI,Shag{,BytesRead});Rez:=RezLI;end;
             end;
            PromRez:=A0+Rez*A1;
            if A2<>0 then PromRez:=PromRez+Rez*Rez*A2;
            if A3<>0 then PromRez:=PromRez+Rez*Rez*Rez*A3;
            Rez:=PromRez;
{            FileDat.Status<>stOK then pPolyY^[k]:=10000
               else }
               if Color_Map.Checked then
                begin
                 cr:=(Rez-ViewMinY)*Ky;
                 if cr<0 then cr:=0;
                 if cr>1024 then cr:=1024;
                 pPolyY^[k]:=trunc(cr);
                end
                 else
                  pPolyY^[k]:=trunc(RR1-Rez*Ky)+UpM;
            if pPolyY^[k]>65000 then pPolyY^[k]:=0;
            inc(k);
          end else  {if Prosto}
             begin
                i:=PointStart; XStart:=0; XOld:=0;
                NBufferPoint:=2*round((PointEnd-PointStart)/Width);
                BufReal:=nil;BufLI:=nil;BufInteger:=nil;
                case Tip of
                 cRealLong,cAnyChanal,cSeismoReal: if MaxAvail>NBufferPoint*Shag then GetMem(BufReal,NBufferPoint*Shag);
                 cAllData,cWordLong,cSeismoWord: if MaxAvail>NBufferPoint*Shag then GetMem(BufInteger,NBufferPoint*Shag);
                 cAllData18,cLong18,cSeismoLInt: if MaxAvail>NBufferPoint*Shag then GetMem(BufLI,NBufferPoint*Shag);
                end;
                repeat
                 Point1:=i;
                 repeat
                   inc(i);
                   Xtek:=round((i-PointStart)*Kx);
                 until ((Xtek>XOld) or (i>=PointEnd));
                 Point2:=i-1;
                 case Tip of
                    cRealLong,cAnyChanal,cSeismoReal:
                      begin
                         if ((BufReal=nil) or ((Point2-Point1)>NBufferPoint) ) then
                          begin
                           FileDat.Read(MaxSingle,Shag{,BytesRead});MinSingle:=MaxSingle;
                           for j:=Point1+1 to Point2 do
                            begin
                             FileDat.Read(RezSingle,Shag{,BytesRead});
                             if MaxSingle<RezSingle then MaxSingle:=RezSingle;
                             if MinSingle>RezSingle then MinSingle:=RezSingle;
                            end;
                          end
                           else
                            begin
                             FileDat.Read(BufReal^[0],(Point2-Point1+1)*Shag{,BytesRead});
                             MaxSingle:=BufReal^[0];MinSingle:=MaxSingle;
                             {$I-}
                             for j:=1 to Point2-Point1 do
                              begin
                               if MaxSingle<BufReal^[j] then MaxSingle:=BufReal^[j];;
                               if MinSingle>BufReal^[j] then MinSingle:=BufReal^[j];
                              end;
                             {$I+}
                            end;
                          MaxY:=MaxSingle;MinY:=MinSingle;
                      end;
                    cAllData,cWordLong,cSeismoWord:
                     begin
                         if ((BufInteger=nil) or ((Point2-Point1)>NBufferPoint) ) then
                          begin
                           FileDat.Read(MaxInteger,Shag{,BytesRead});MinInteger:=MaxInteger;
                           for j:=Point1+1 to Point2 do
                            begin
                             FileDat.Read(RezInteger,Shag{,BytesRead});
                             if Maxinteger<Rezinteger then Maxinteger:=Rezinteger;
                             if Mininteger>Rezinteger then Mininteger:=Rezinteger;
                            end;
                          end
                           else
                            begin
                             FileDat.Read(BufInteger^[0],(Point2-Point1+1)*Shag{,BytesRead});
                             Maxinteger:=BufInteger^[0];Mininteger:=Maxinteger;
                             {$I-}
                             for j:=1 to Point2-Point1 do
                              begin
                               if Maxinteger<BufInteger^[j] then Maxinteger:=BufInteger^[j];;
                               if Mininteger>BufInteger^[j] then Mininteger:=BufInteger^[j];
                              end;
                             {$I+}
                            end;
                          MaxY:=Maxinteger;MinY:=Mininteger;
                      end;
                    cAllData18,cLong18,cSeismoLInt:
                     begin
 {                     FileDat.Read(MaxLI,Shag,BytesRead); MinLI:=MaxLI;
                      for j:=Point1+1 to Point2 do
                           begin
                             FileDat.Read(RezLI,Shag,BytesRead);
                             if MaxLI<RezLI then MaxLI:=RezLI;
                             if MinLI>RezLI then MinLI:=RezLI;
                           end;
  }                       if ((BufLI=nil) or ((Point2-Point1)>NBufferPoint) ) then
                          begin
                           FileDat.Read(MaxLI,Shag{,BytesRead});MinLI:=MaxLI;
                           for j:=Point1+1 to Point2 do
                            begin
                             FileDat.Read(RezLI,Shag{,BytesRead});
                             if MaxLI<RezLI then MaxLI:=RezLI;
                             if MinLI>RezLI then MinLI:=RezLI;
                            end;
                          end
                           else
                            begin
                             FileDat.Read(BufLI^[0],(Point2-Point1+1)*Shag{,BytesRead});
                             MaxLI:=BufLI^[0];MinLI:=MaxLI;
                             {$I-}
                             for j:=1 to Point2-Point1 do
                              begin
                               if MaxLI<BufLI^[j] then MaxLI:=BufLI^[j];;
                               if MinLI>BufLI^[j] then MinLI:=BufLI^[j];
                              end;
                             {$I+}
                            end;
                          MaxY:=MaxLI;MinY:=MinLI;
                    end;
                   end; {case}
                 if A1<>1 then
                  begin
                   PromMaxY:=A0+MaxY*A1;PromMinY:=A0+MinY*A1;
                  end
                   else
                    begin
                     PromMaxY:=A0+MaxY;PromMinY:=A0+MinY;
                    end;
                 if A2<>0 then
                  begin
                   PromMaxY:=PromMaxY+MaxY*MaxY*A2;PromMinY:=PromMinY+MinY*MinY*A2;
                  end;
                 if A3<>0 then
                  begin
                   PromMaxY:=PromMaxY+MaxY*MaxY*MaxY*A3;PromMinY:=PromMinY+MinY*MinY*MinY*A3;
                  end;
                 repeat
                   pPolyX^[XStart*2]:=XOld+LeftM;
                   pPolyX^[XStart*2+1]:=XOld+LeftM;
                   if Color_Map.Checked then
                    begin
                     cr:=(PromMinY-ViewMinY)*Ky;
                     if cr<0 then cr:=0;
                     if cr>1024 then cr:=1024;
                     pPolyY^[XStart*2]:=trunc(cr);
                     cr:=(PromMaxY-ViewMinY)*Ky;
                     if cr<0 then cr:=0;
                     if cr>1024 then cr:=1024;
                     pPolyY^[XStart*2+1]:=trunc(cr);
                    end
                     else
                       begin
                       pPolyY^[XStart*2]:=trunc(RR1-Ky*PromMinY)+UpM;
                       pPolyY^[XStart*2+1]:=trunc(RR1-Ky*PromMaxY)+UpM;
                   end;

                  if pPolyY^[XStart*2+1]>65000 then pPolyY^[XStart*2+1]:=0;
                  if pPolyY^[XStart*2]>65000 then pPolyY^[XStart*2]:=0;
                  inc(xold);
                  inc(Xstart);
                 until (Xold=xtek)  or (i>=PointEnd);
                 XOld:=XTek;
                until (i>=PointEnd) or (XStart>=Width);
                case Tip of
                 cRealLong,cAnyChanal,cSeismoReal: if BufReal<>nil then FreeMem(BufReal,NBufferPoint*Shag);
                 cAllData,cWordLong,cSeismoWord: if BufInteger<>nil then FreeMem(BufInteger,NBufferPoint*Shag);
                 cAllData18,cLong18,cSeismoLInt: if BufLI<>nil then FreeMem(BufLI,NBufferPoint*Shag);
                end;
               end;  {else Prosto}
    end {PointStart<>PointEnd};
   if FileDat<>nil then begin {FileDat.Close;}FileDat.Destroy;end;
   CurvebPolyCreate.Value:=integer(True);
   CurvePolyPoint.Value:=NPolyPoint;
   CurveWidth.Value:=Width;CurveHeight.Value:=Height;
   CurvepPolyX.Value:=longint(pPolyX);
   CurvepPolyY.Value:=longint(pPolyY);
   Curve.Post;
   if CurveVisible.Value =integer(true) then inc(cVisibleCurve);
   Nomer:=CurveView_Signal_Nomer.Value;
   Curve.Next;
   if Nomer=CurveView_Signal_Nomer.Value then break;
  end;
  Finally
{    Curve.GotoBookMark(BookMark);Curve.EnableControls;Curve.FreeBookMark(BookMark);}
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 end;
{$R+}
TimeAll.Caption:=' ';TimeAll.Update;
bNeedCreatePoly:=false;
Cursor:=crDefault;
end;

Procedure TObzorkaForm.ShowCurve(DrawCanvas:Tcanvas;Width,Height:word;i_Curve:integer);
label M2;
var
    pPolyX,pPolyY:pPolyArr;
    NPolyPoint:word;
//    FileIMage:TBufferedFile;
    FileIMage:TFileStream;
    i:longint;
    WidthEllipse:shortInt;
    Smesh:smallint;
    Min_Po_Y,Max_Po_Y,Shir_Zon:integer;
Procedure InterpLine;
var i:word;
begin
{$R-}
 for i:=1 to NPolyPoint-1 do DrawCanvas.LineTo(pPolyX^[i],pPolyY^[i]);
{$R+}
end;

begin
{$R-}
 if CurveVisible.Value=integer(true) then
   begin
   if CurvebPolyCreate.Value = integer(True) then
    begin   {Загрузка PolyX, PolyY}
     NPolyPoint:=CurvePolyPoint.Value;
     if ((NPolyPoint=0) or
         (CurvepPolyX.Value = 0) or (CurvepPolyY.Value = 0)) then
      begin
//       FileIMage:=TBufferedFile.Create(CurvePolyFile.Value,4096);
       FileIMage:=TFileStream.Create(CurvePolyFile.Value,fmopenread);
//       FileImage.Reset;
//       NPolyPoint:=FileImage.FileSize div (2*SizeOf(Word));
       NPolyPoint:=FileImage.Size div (2*SizeOf(Word));
       GetMem(pPolyX,NPolyPoint*SizeOf(Word)+Zapas);
       GetMem(pPolyY,NPolyPoint*SizeOf(Word)+Zapas);
       FileImage.Read(pPolyX^,NPolyPoint*SizeOf(Word){,BytesRead});
       FileImage.Read(pPolyY^,NPolyPoint*SizeOf(Word){,BytesRead});
//       FileImage.Close;
       FileImage.Destroy;
{       Curve.RequestLive:=True;}
       Curve.Edit;
       CurvePolyPoint.Value:=NPolyPoint;
       CurvepPolyX.Value:=longint(pPolyX);
       CurvepPolyY.Value:=longint(pPolyY);
       CurveSlider.Value:=ActiveCurveNum;
       Curve.Post;
      end
       else
        begin
         pPolyX:=pPolyArr(CurvepPolyX.Value);
         pPolyY:=pPolyArr(CurvepPolyY.Value);
        end;
     DrawCanvas.Pen.Color:=CurveColor.Value;
     if ActiveCurveNum=CurveView_Signal_Nomer.Value then
      begin
       if DrawCanvas.Pen.Color<>clRed  then  DrawCanvas.Pen.Color:=clRed
        else DrawCanvas.Pen.Color:=clNavy;
       TimeStart.Font.Color:=DrawCanvas.Pen.Color;
       TimeEnd.Font.Color:=DrawCanvas.Pen.Color;
       UpdateTimeStartEndLabel;
      end ;
     DrawCanvas.Pen.Style:=psSolid;
     DrawCanvas.Pen.Width:=CurveCurveWidth.Value;
     WidthEllipse:=DrawCanvas.Pen.Width div 2;
     if WidthEllipse=0 then WidthEllipse:=1;
    if Color_map.Checked then
    begin
        if NPageCurve<>0 then
         begin
          Min_po_Y:=round(Height/NPageCurve*i_Curve);
          Max_Po_Y:=round(Height/NPageCurve*(i_Curve+1));
         end
         else
          begin
          Min_po_Y:=0;
          Max_Po_Y:=Height;
          end;
     for i:=1 to NPolyPoint-1 do
             begin
             DrawCanvas.Brush.Color := ColorMap[pPolyY^[i]];
             DrawCanvas.FillRect(Rect(pPolyX^[i-1], Min_Po_Y, pPolyX^[i], Max_Po_Y));
            end;
    end
    else
    begin
     DrawCanvas.MoveTo(pPolyX^[0],pPolyY^[0]);
     case CurveStyle.Value of
      1: if NPolyPoint<Width then
         for i:=1 to NPolyPoint-1 do
           begin
            DrawCanvas.LineTo(pPolyX^[i],pPolyY^[i-1]);
            DrawCanvas.LineTo(pPolyX^[i],pPolyY^[i]);
           end else InterPline;
      2: if NPolyPoint<Width then
         for i:=0 to NPolyPoint-1 do
           begin
            DrawCanvas.Ellipse(pPolyX^[i]-WidthEllipse,
                pPolyY^[i]-WidthEllipse,pPolyX^[i]+WidthEllipse,pPolyY^[i]+WidthEllipse);
           end
            else InterpLine;
      3: if NPolyPoint<Width then
         for i:=0 to NPolyPoint-1 do
           begin
            DrawCanvas.Rectangle(pPolyX^[i]-WidthEllipse,
                pPolyY^[i]-WidthEllipse,pPolyX^[i]+WidthEllipse,pPolyY^[i]+WidthEllipse);
           end
            else InterpLine;
      4: if NPolyPoint<Width then
         for i:=0 to NPolyPoint-1 do
           begin
            DrawCanvas.RoundRect(pPolyX^[i]-WidthEllipse,
                pPolyY^[i]-WidthEllipse,pPolyX^[i]+WidthEllipse,pPolyY^[i]+WidthEllipse,WidthEllipse,WidthEllipse);
           end
            else InterpLine;
      else begin
          DrawCanvas.Pen.Style:=psSolid;
          case CurveStyle.Value of
           5:DrawCanvas.Pen.Style:=psSolid;
           6:DrawCanvas.Pen.Style:=psDash;
           7:DrawCanvas.Pen.Style:=psDot;
           8:DrawCanvas.Pen.Style:=psDashDot;
           9:DrawCanvas.Pen.Style:=psDashDotDot;
           10:begin
                if NPolyPoint<Width then
                begin
                 for i:=0 to NPolyPoint-1 do
                 DrawCanvas.Rectangle(pPolyX^[i]-WidthEllipse,
                   pPolyY^[i]-WidthEllipse,pPolyX^[i]+WidthEllipse,pPolyY^[i]+WidthEllipse);
                DrawCanvas.Pen.Width:=1;
               end;
              end;
           11:begin
                if NPolyPoint<Width then
                for i:=0 to NPolyPoint-1 do
                begin
                 DrawCanvas.Ellipse(pPolyX^[i]-WidthEllipse,
                  pPolyY^[i]-WidthEllipse,pPolyX^[i]+WidthEllipse,pPolyY^[i]+WidthEllipse);
                 DrawCanvas.Pen.Width:=1;
                end;
              end;
          end;
           InterpLine;
         end;
     end;
 end;
M2:
  end;
 end;
{$R+}
{Application.ProcessMessages;}
end;

Procedure TObzorkaForm.PaintBoxPaint(Sender: TObject);
var {BookMark:TBookMark;}
    cCurve:longint;
    Nomer:longint;
    DeltX,DeltY,X,y:word;
    Xi,Yi:integer;
    PixCol:TColor;
begin
 Cursor:=crHourGlass;
 if bNeedCreatepoly then CreatePoly(PaintBox.Width,PaintBox.Height,0,0);
 if (
   ((CurvepPolyX.Value=0) or (CurvepPolyY.Value=0))
     and (not FileExists(CurvePolyFile.Value) ) ) then
      CreatePoly(PaintBox.Width,PaintBox.Height,0,0);
 PaintBox.Canvas.Brush.Color:={PaintBox.Color}CurveColorFon.Value;
 PaintBox.Canvas.Pen.Color:=curveColorFon.Value;
 if Sender<>Slider1 then
   begin
{    PaintBox.Canvas.Rectangle(0,0,PaintBox.Width,PaintBox.Height);}
     PaintBox.Canvas.Brush.style:=bsSolid;
     PaintBox.Canvas.Brush.Color:=CurveColorFon.Value;
      PaintBox.Canvas.Pen.Color:=curveColorFon.Value;
      PaintBox.Canvas.FillRect(Rect(0,0,PaintBox.Width,PaintBox.Height));
      PaintBox.Canvas.Pen.style:=psDashDotDot ;
      PaintBox.Canvas.Pen.Color:=clSilver;
      if PaintBox.Canvas.Brush.color=clWhite then PaintBox.Canvas.Pen.Color:=clSilver
       else PaintBox.Canvas.Pen.Color:=clWhite;
      PaintBox.Canvas.Pen.Width:=1;
      DeltX:=CurveGridX.Value;
      if DeltX<>0 then
      begin
      X:=DeltX;
      while x<PaintBox.Width do
       begin
        PaintBox.Canvas.MoveTo(x,0);
        PaintBox.Canvas.LineTo(x,PaintBox.Height);
        x:=X+Deltx;
       end;
      end;
      DeltY:=CurveGridY.Value;
      if DeltY<>0 then
      begin
      Y:=Delty;
      while y<PaintBox.Height do
       begin
        PaintBox.Canvas.MoveTo(0,y);
        PaintBox.Canvas.LineTo(PaintBox.width,y);
        y:=y+Delty;
       end;
      end;
      PaintBox.Canvas.Pen.Color:=curveColorFon.Value;
   end;
 if Color_map.Checked and bSaveImage then
   begin
    FileColorIMage:=TFileStream.Create(FileColorImage_Name,fmOpenRead);
//    FileColorIMage:=TBufferedFile.Create(FileColorImage_Name,4096);
//    FileColorImage.Reset;
    for Xi:=0 to PaintBox.Width-1 do
     for Yi:=0 to PaintBox.Height-1 do
      begin
        FileColorImage.Read(PixCol,SizeOf(TColor){,BytesRead});
        PaintBox.Canvas.Pixels[Xi,Yi]:=PixCol;
      end;
//    FileColorImage.close;
    FileColorImage.Destroy;
  end
 else
 begin
 Curve.DisableControls;
 Try
  Curve.First;
  cPageCurve:=0;
  for CCurve:=0 to Curve.RecordCount-1 do
  begin
   ShowCurve(PaintBox.canvas,PaintBox.width,paintBox.Height,cCurve);
   Nomer:=CurveView_Signal_Nomer.Value;
   if CurveVisible.Value =integer(true) then inc(cPageCurve);
   Curve.Next;
   if Nomer=CurveView_Signal_Nomer.Value then break;
  end;
   NPageCurve:=cPageCurve;
   Finally
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
  end;
 end;
 if Color_map.Checked then
  begin
{  if not bSaveImage then
   begin
    FileColorIMage:=TFileStream.Create(FileColorImage_Name,fmcreate);
    for Xi:=0 to PaintBox.Width-1 do
      for Yi:=0 to PaintBox.Height-1 do
      begin
      PixCol:=PaintBox.Canvas.Pixels[Xi,Yi];
      FileColorImage.Write(PixCol,SizeOf(TColor));
     end;
    FileColorImage.Destroy;
    bSaveImage:=true;
   end;
}  end;

 case SelectViewQueryView_Style.Value of
 cTimeMap_View:
  begin
   TimeAll.Font.Name:='Tahoma';
   TimeAll.Caption:=TimeMin+'  '+'YMAX='+ FloatToStrF(CurveMult.Value*CurveViewMaxY.Value,ffGeneral,FormatAll,FormatAfterPoint)
    +' YMIN='+ FloatToStrF(CurveMult.Value*CurveViewMinY.Value,ffGeneral,FormatAll,FormatAfterPoint)+
     ' DT='+floatToStrF((CurvePointEnd.Value-CurvePointStart.Value)*SigTabRec.Deltx,ffGeneral,FormatAll,FormatAfterPoint)+
     '  '+ TimeMax;
  end;
 cFreqMap_View:
  begin
  TimeAll.Font.Name:='Courier New';
  TimeAll.Caption:=TimeMin+'  '+'Ymax='+ FloatToStrF(CurveMult.Value*CurveViewMaxY.Value,ffGeneral,FormatAll,FormatAfterPoint)+
    ' Ymin='+ FloatToStrF(CurveMult.Value*CurveViewMinY.Value,ffGeneral,FormatAll,FormatAfterPoint)+
    ' freq: 0..'+floatToStrF((CurvePointEnd.Value-CurvePointStart.Value)*
       SigTabRec.Deltx,ffGeneral,FormatAll,FormatAfterPoint)+
   ' Hz ('+ IntToStr(SigTabRec.PointAll)+' точек)  '+'  '+ TimeMax;
  end;
 cKxxMap_View:
  begin
  TimeAll.Font.Name:='Courier New';
  TimeAll.Caption:=TimeMin+'  '+'Ymax='+ FloatToStrF(CurveMult.Value*CurveViewMaxY.Value,ffGeneral,FormatAll,FormatAfterPoint)+
    ' Ymin='+ FloatToStrF(CurveMult.Value*CurveViewMinY.Value,ffGeneral,FormatAll,FormatAfterPoint)+
    ' dT='+floatToStrF((CurvePointEnd.Value-CurvePointStart.Value)*
       SigTabRec.Deltx,ffGeneral,FormatAll,FormatAfterPoint)+
   ' ('+ IntToStr(SigTabRec.PointAll)+' точек)  '+'  '+ TimeMax;
  end;
end;
DrawCursor(PaintBox.Width,paintBox.Height);
TimeAll.Update;
Tabset.UpDate;

Curve.EnableControls;
Cursor:=crDefault;
end;

Procedure TObzorkaForm.UpdatePaint(Sender: TObject);
var {BookMark:TBookMark;}
    cCurve:longint;
    Nomer:longint;
begin
 {Label1.Caption:=' ';Label1.Update;}
 PaintBox.Canvas.Brush.Color:=CurveColorFon.Value;{clSilver;}
 PaintBox.Canvas.Pen.Color:=curveColorFon.Value;
 Curve.DisableControls;
 Try
  Curve.First;
{  cPageCurve:=0;}
  for CCurve:=0 to Curve.RecordCount-1 do
  begin
   Nomer:=CurveView_Signal_Nomer.Value;
   if Nomer=OldActiveCurveNum then
    ShowCurve(PaintBox.Canvas,PaintBox.Width,paintBox.Height,ccurve);
   if Nomer=ActiveCurveNum then
    begin
     ShowCurve(PaintBox.Canvas,PaintBox.Width,paintBox.Height,ccurve);
     UpdateTimeStartEndLabel;
    end;
   {Curve.RequestLive:=True;}
   Curve.Edit;
   CurveSlider.Value:=ActiveCurveNum;
   Curve.Post;
   Curve.Next;
   if Nomer=CurveView_Signal_Nomer.Value then break;
{   inc(cPageCurve);}
  end;
{   NPageCurve:=cPageCurve;}
   Finally
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 end;
end;


Procedure TObzorkaForm.UpdateActiveCurve;
begin
 OldActiveCurveNum:=ActiveCurveNum;
 ActiveCurveNum:=Slider1.Value;
 UpdatePaint(Slider1);
end;

procedure TObzorkaForm.Slider1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 UpDateActiveCurve;
end;

Procedure TObzorkaForm.OpenSignalArr;
var
 cCurve:longint;
 Nomer:longint;
 pSignalRec:pSigTabRec;
begin
  { Curve.DisableControls;}Curve.First;
  Sig_Table.Close;Sig_Table.Open;
   cPageCurve:=0;           NAllCurveInPage:=0;
   for CCurve:=0 to Curve.RecordCount-1 do
      begin
       Nomer:=CurveView_Signal_Nomer.Value;
       if cCurve=0 then
          begin
           Slider1.MaxValue:=Nomer;
           Slider1.MinValue:=Nomer;
          end;
       Curve.Edit;{Curve.RequestLive:=True;}
{       Sig_Table.Close;Sig_Table.Open;}
       GetMem(pSignalRec,SizeOf(TSigTabRec));
       pSignalRec^.PointAll:=Sig_TablePointAll.Value;
       pSignalRec^.A0:=Sig_TableA0.Value;
       pSignalRec^.A1:=Sig_TableA1.Value;
       pSignalRec^.A2:=Sig_TableA2.Value;
       pSignalRec^.A3:=Sig_TableA3.Value;
       pSignalRec^.DeltX:=Sig_TableDeltX.Value;
       pSignalRec^.FileDat:=Sig_TableFileDat.Value;
       pSignalRec^.FileDat_abs:=Sig_TableFileDat_abs.Value;
       pSignalRec^.RezType:=Sig_TableRezType.Value;
       pSignalRec^.Seek_start:=Sig_TableFile_seek.Value;
       pSignalRec^.bMaxMinY:=boolean(Sig_TablebMaxMinY.Value);
       pSignalRec^.MinY:=Sig_TableMinY.Value;
       pSignalRec^.MaxY:=Sig_TableMaxY.Value;
       pSignalRec^.DateTimeStart:=Sig_TableDate_Start.Value+Sig_TableTime_Start.Value;
       pSignalRec^.Eksp_Nomer:=Sig_TableEksp_Nomer.Value;
       CurvepSigTabRec.Value:=longint(pSignalRec);
       CurvepPolyY.Value:=longint(nil);
       CurvepPolyX.Value:=longint(nil);
       {if CurveVisible.Value then }inc(cPageCurve);
       inc(NAllCurveInPage);
       Curve.Post;
       TimeMax:=DateTimeToStr(pSignalRec^.DateTimeStart+CurvePointEnd.Value*pSignalRec^.Deltx/(24*3600));
       TimeMaxDT:=pSignalRec^.DateTimeStart+CurvePointEnd.Value*pSignalRec^.Deltx/(24*3600);
       PointKonec:=CurvePointEnd.value;
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
     end;
 NPageCurve:=cPageCurve;
 Curve.First;
 SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 Slider1.Maxvalue:=Nomer;
 Slider1.MinValue:=CurveView_Signal_Nomer.Value;
 TimeMin:=DateTimeToStr(sigTabRec.DateTimeStart+CurvePointStart.Value*SigTabRec.Deltx/(24*3600));
 TimeMinDT:=sigTabRec.DateTimeStart+CurvePointStart.Value*SigTabRec.Deltx/(24*3600);
 PointNachalo:=CurvePointStart.value;
 Slider1.Value:=Slider1.Minvalue+(Slider1.Maxvalue-Slider1.Minvalue) div 2 ;
 ActiveCurveNum:=Slider1.Value;
 OldActiveCurveNum:=ActiveCurveNum;
end;

Procedure TObzorkaForm.CloseSignalArr;
var
 cCurve:longint;
 Nomer:longint;
 pSignalRec:pSigTabRec;
 pPolyX,pPolyY:pPolyArr;
 FileImage:TBufferedFile;
begin
   Curve.DisableControls;Curve.First;{Curve.RequestLive:=True;}
   PB.Min:=0;PB.Max:=NallCurveInPage;
   PB.Visible:=True;
   Sig_table.Close;
   for CCurve:=0 to Curve.RecordCount-1 do
      begin
       PB.Position:=cCurve;PB.Update;
       Nomer:=CurveView_Signal_Nomer.Value;
       pSignalRec:=Pointer(CurvepSigTabRec.Value);
       if pSignalRec<>nil then FreeMem(pSignalRec,SizeOf(TSigTabRec));
       pPolyX:=pPolyArr(CurvepPolyX.Value);
       pPolyY:=pPolyArr(CurvepPolyY.Value);
       if ((pPolyX<>nil) and (pPolyY<>nil)) then
        begin
{         FileIMage:=TBufferedFile.Create(CurvePolyFile.Value,fmCreate);FileImage.rewrite;
         FileImage.Write(pPolyX^,CurvePolyPoint.Value*SizeOf(Word),BytesWrote);
         FileImage.Write(pPolyY^,CurvePolyPoint.Value*SizeOf(Word),BytesWrote);
         FileImage.Close;FileImage.Destroy;}
         DeleteFile(pchar(CurvePolyFile.Value));
         if pPolyX<>nil then Freemem(pPolyX,CurvePolyPoint.Value*Sizeof(Word)+Zapas);
         if pPolyY<>nil then Freemem(pPolyY,CurvePolyPoint.Value*Sizeof(Word)+Zapas);
        end;
       Curve.Edit;
       CurvepPolyY.Value:=longint(nil);CurvepPolyX.Value:=longint(nil);
       CurvePolyPoint.Value:=0;
       CurvebPolyCreate.Value:=integer(false);
       CurvepSigTabRec.Value:=longint(nil);
       Curve.Post;
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
   Curve.EnableControls;
   Sig_table.Open;
   PB.Visible:=false;
{   PB.Update;}
end;



procedure TObzorkaForm.FormDestroy(Sender: TObject);
VAR I:smallint;
BEGIN
 CLOSESIGNALARR;
 FOR I:=0 TO VIEWPAGE.RECORDCOUNT-1 DO VIEWPAGE.FREEBOOKMARK(BOOKMARKARR[I]);
{ SELECTVIEWQUERY.REQUESTLIVE:=TRUE;}
 SELECTVIEWQUERY.EDIT;
 SELECTVIEWQUERYUP.VALUE:=TOP;SELECTVIEWQUERYLEFT_.VALUE:=LEFT;
 SELECTVIEWQUERYWIDTH.VALUE:=WIDTH;SELECTVIEWQUERYHEIGHT.VALUE:=HEIGHT;
 SELECTVIEWQUERY.POST;
 if WhatDo=mrNo then
  begin
     dm.q.SQL.Clear;
     dm.q.SQL.add('delete from curveset where view_nomer= :View_Nomer');
     dm.q.parambyname('View_Nomer').asinteger:=ViewNumber;
     dm.q.execsql;
     dm.q.Transaction.commitretaining;
     expform.CurvesetRefresh;

  end;
 DeleteFile(pchar(FileColorImage_Name));
 inherited;
end;

procedure TObzorkaForm.ShowKoef(Sender:TObject);
begin
 Mult:=CurveMult.Value;
 MultEdit.Text:=FloatToStrF(Mult,ffGeneral,FormatAll,FormatAfterPoint);
 if Sender<> nil then MultBox.Visible:=True;
end;

procedure TObzorkaForm.Koef_CloseClick(Sender: TObject);
begin
 MultBox.Visible:=False;
end;

procedure TObzorkaForm.Button1Click(Sender: TObject);
begin
 try
  Mult:=StrToFloat(MultEdit.Text);
 except
   on EConvertError do Mult:= CurveMult.Value;
  end;
 case MultRB.ItemIndex of
  0: Mult:=Mult*2;
  1: Mult:=Mult*5;
  2: Mult:=Mult*10;
 end;
 MultEdit.Text:=FloatToStrF(Mult,ffGeneral,FormatAll,FormatAfterPoint);
 MultEdit.Update;
end;

procedure TObzorkaForm.Button2Click(Sender: TObject);
begin
 try
  Mult:=StrToFloat(MultEdit.Text);
 except
   on EConvertError do Mult:= CurveMult.Value;
  end;
 case MultRB.ItemIndex of
  0: Mult:=Mult/2;
  1: Mult:=Mult/5;
  2: Mult:=Mult/10;
 end;
 MultEdit.Text:=FloatToStrF(Mult,ffGeneral,FormatAll,FormatAfterPoint);
 MultEdit.Update;
end;

procedure TObzorkaForm.Koef_ShowClick(Sender: TObject);
var {BookMark:TBookMark;}
     cCurve,Nomer:Longint;
begin
 try
  Mult:=StrToFloat(MultEdit.Text);
 except
   on EConvertError do Mult:= CurveMult.Value;
  end;
{  BookMark:=Curve.GetBookmark;}
      Curve.DisableControls;
      Try
        Curve.First;
        cPageCurve:=0;
        for CCurve:=0 to Curve.RecordCount-1 do
         begin
          Curve.Edit;{Curve.RequestLive:=True;}
          CurveMult.Value:=Mult;
          Curve.Post;
          Nomer:=CurveView_Signal_Nomer.Value;
          if CurveVisible.Value =integer(true) then inc(cPageCurve);
          Curve.Next;
          if Nomer=CurveView_Signal_Nomer.Value then break;
         end;
         NPageCurve:=cPageCurve;
        Finally
{        Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);}
        {GetSignal;}
        SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
      end; {try}

  {UpdateMaxMinYLabel;}
 bNeedCreatePoly:=True;{Createpoly;}
 PaintBoxPaint(nil);
 end;

Procedure TObzorkaForm.UpdateTimeStartEndLabel;
var
 STR:TSigTabRec;
begin
case SelectViewQueryView_Style.Value of
 cTimeMap_View:
  begin
   TimeStart.Caption:= DateTimeToStr(sigTabRec.DateTimeStart+CurvePointStart.Value*SigTabRec.Deltx/(24*3600));
   TimeEnd.Caption:= DateTimeToStr(sigTabRec.DateTimeStart+CurvePointEnd.Value*SigTabRec.Deltx/(24*3600));
   ActiveCurveStart:=CurvePointStart.Value;
   ActiveCurveEnd:=CurvePointEnd.Value
  end;
 cFreqMap_View:
  begin
   STR:=(pSigTabRec(CurvepSigTabRec.Value))^;
   TimeStart.Caption:= DateTimeToStr(STR.DateTimeStart);
   TimeEnd.Caption:= DateTimeToStr(STR.DateTimeStart+
        2*CurvePointEnd.Value*(1/(2*STR.PointAll*STR.Deltx))/(24*3600));
   ActiveCurveStart:=CurvePointStart.Value;
   ActiveCurveEnd:=CurvePointEnd.Value;
   ActiveTimeStart:=STR.DateTimeStart;
   ActiveTimeEnd:=STR.DateTimeStart+
        2*CurvePointEnd.Value*(1/(2*STR.PointAll*STR.Deltx))/(24*3600);
  end;
 cKxxMap_View:
  begin
   STR:=(pSigTabRec(CurvepSigTabRec.Value))^;
   TimeStart.Caption:= DateTimeToStr(STR.DateTimeStart);
   TimeEnd.Caption:= DateTimeToStr(STR.DateTimeStart+
        2*CurvePointEnd.Value*(STR.Deltx)/(24*3600));
   ActiveCurveStart:=CurvePointStart.Value;
   ActiveCurveEnd:=CurvePointEnd.Value;
   ActiveTimeStart:=STR.DateTimeStart;
   ActiveTimeEnd:=STR.DateTimeStart+
        2*CurvePointEnd.Value*(STR.Deltx)/(24*3600);
  end;
end;
 TimeStart.Update;
 TimeEnd.Update;
end;

procedure TObzorkaForm.PaintBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 Slider1.Value:=round(
  (Slider1.MaxValue-Slider1.MinValue+1)*y/PaintBox.Height+Slider1.MinValue);
 if Slider1.Value>Slider1.MaxValue then Slider1.Value:=Slider1.MaxValue;
 if Slider1.Value<Slider1.MinValue then Slider1.Value:=Slider1.MinValue;
 Slider1.Update;
 UpdateActiveCurve;
 end;

procedure TObzorkaForm.Proportional1Click(Sender: TObject);
var OldColor:longint;
begin
(* if MainForm.PrintDialog1.execute then
  begin
   oldColor:=PaintBox.Color;
   PaintBox.Color:=clwhite;
   Panel1.Color:=clwhite;
   Panel3.color:=clWhite;
   if Sender = Proportional1 then PrintScale:=poProportional
    else PrintScale:=poPrintToFit;
   PaintBoxPaint(nil);
   Label1.Caption:=Caption;
   Label1.Visible:=True;
   Panel1.Update;Panel3.Update;
   {Label1.Update;}
   Print;
   PaintBox.Color:=oldColor;
   Panel1.Color:=oldColor;
   Panel3.color:=oldColor;
   PaintBoxPaint(nil);
   Label1.Visible:=False;
   Panel1.Update;Panel3.Update;
  end;
*)
end;

procedure TObzorkaForm.BitBtn1Click(Sender: TObject);
begin
 if selectViewQuery.State = dsedit  then SelectViewQuery.Post;
 Caption:=SelectViewQueryView_Header.Value;
 Expmenuitem.Caption:=Caption;
 Mainmenuitem.Caption:=Caption;
 Update;
 CurveSetParamBox.Visible:=False;
end;

procedure TObzorkaForm.N3Click(Sender: TObject);
begin
 CurveSetParamBox.Visible:=True;
end;

procedure TObzorkaForm.N4Click(Sender: TObject);
var
  i:smallint;
  Img:TimageForm;
begin
for i:=0 to Application.ComponentCount-1 do
 if Application.Components[i] is TImageForm then
   begin
    IMG:=Application.Components[i] as TImageForm;
    if IMG.Sig_TableEKSP_NOMER.value = Sig_TableEksp_parent.value then
    begin
    if IMG.bImageAvailable then
     begin
      IMG.Show;
      SendMessage(IMG.Handle, wm_SetStartPoint,0,longint(Self));
      exit;
     end;
    end;
   end;
showmessage('Образ сигнала не открыт');   
end;

procedure TObzorkaForm.PaintBoxMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 if CurveViewMinX.Value<>CurveViewMaxX.Value then
   case SelectViewQueryView_Style.Value of
    cFreqMap_View:
     LabelMouse.Caption:='f='+
         floatToStrF(CurveViewMinX.Value+(x/PaintBox.Width*(CurveViewMaxX.Value-CurveViewMinX.Value)),
              ffGeneral,FormatAll,FormatAfterPoint)+' Hz';
     cTimeMap_View,cKxxMap_View:
      begin
       LabelMouse.Caption:='t='+
 {        DateTimeToStr(SigTabRec.DateTimeStart+(CurveViewMinX.Value+(x/PaintBox.Width*(CurveViewMaxX.Value-
                   CurveViewMinX.Value)))/24/3600);
}          formatdatetime('dd.mm.yy hh:mm:ss.dss',TimeMinDT+trunc(Y/PaintBox.Height*NPageCurve)*DeltTDT+
           (x/PaintBox.Width*(CurveViewMaxX.Value-CurveViewMinX.Value))/24/3600);
           TimeMouseDT:=TimeMinDT+trunc(Y/PaintBox.Height*NPageCurve)*DeltTDT+
           (x/PaintBox.Width*(CurveViewMaxX.Value-CurveViewMinX.Value))/24/3600;
           PointNumber:=PointNachalo+Trunc
           ( ( trunc(Y/PaintBox.Height*NPageCurve)*DeltTDT*24*3600+
           x/PaintBox.Width*(CurveViewMaxX.Value-CurveViewMinX.Value) )
                  /SigTabRec.DeltX);
      end;
   end
         else LabelMouse.Caption:='?';
  XoldStr:=LabelMouse.Caption;
{  LabelMouse.Caption:=LabelMouse.Caption+' Отсчет:'+IntToStr(PointNumber)+
      ' '+IntToStr(NPageCurve)+' '+IntToStr(PointNachalo)+' '+IntToStr(PointKonec);
}  LabelMouse.Update;
end;

procedure TObzorkaForm.N5Click(Sender: TObject);
var InpStr:string;
begin
 inpStr:=InputBox('Задайте новый заголовок окна',
                   'Заголовок:', Caption);
 if inpStr=Caption then exit;
 Caption:=inpStr;
 update;
{ SelectViewQuery.RequestLive:=True;}
 SelectViewQuery.Edit;
 SelectViewQueryView_Header.Value:=InpStr;
 SelectViewQuery.Post;
end;

procedure TObzorkaForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
  VK_Divide:begin
          ShowKoef(nil);
          Button1Click(nil);
          Koef_ShowClick(nil);
          {Koef_CloseClick(nil);}
          end;
  VK_Multiply:begin
          ShowKoef(nil);
          Button2Click(nil);
          Koef_ShowClick(nil);
          {Koef_CloseClick(nil);       }
          end;
  end;
end;


 procedure TObzorkaForm.SetFon( color:TColor );
 var BookMark:TBookMark;
     cCurve,Nomer:Longint;
 begin
      BookMark:=Curve.GetBookmark;
      Curve.DisableControls;
      Try
        Curve.First;
        cPageCurve:=0;
        for CCurve:=0 to Curve.RecordCount-1 do
         begin
          Curve.Edit; //ve.RequestLive:=True;
          CurveColorFon.Value:=color;
          Curve.Post;
          Nomer:=CurveView_Signal_Nomer.Value;
          if (CurveVisible.Value =integer(true)) then inc(cPageCurve);
          Curve.Next;
          if Nomer=CurveView_Signal_Nomer.Value then break;
         end;
         NPageCurve:=cPageCurve;
         if NPageCurve=0 then NPageCurve:=1;

        Finally
        Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
        {GetSignal;}
        SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
      end; {try}
    PaintBox.Canvas.Brush.Color:=color;
    FonPanel.Color:=color;
    UpdateView(true,false);{PaintBoxPaint(nil);}

//    bOldCursor:=false;
 end;

 procedure TObzorkaForm.wmSetFon( var Message:TMessage );
 var BookMark:TBookMark;
     cCurve,Nomer:Longint;
 begin
(*      BookMark:=Curve.GetBookmark;
      Curve.DisableControls;
      Try
        Curve.First;
        cPageCurve:=0;
        for CCurve:=0 to Curve.RecordCount-1 do
         begin
          Curve.Edit;Curve.RequestLive:=True;
          if FonDialog.bGridX.Checked then CurveGridX.Value:=FonDialog.XValue.Value else
            CurveGridX.Value:=0;
          if FonDialog.bGridY.Checked then CurveGridY.Value:=FonDialog.YValue.Value else
            CurveGridY.Value:=0    ;
          CurveColorFon.Value:=FonDialog.FonColor.Brush.Color;
          Curve.Post;
          Nomer:=CurveView_Signal_Nomer.Value;
          if CurveVisible.Value then inc(cPageCurve);
          Curve.Next;
          if Nomer=CurveView_Signal_Nomer.Value then break;
         end;
         NPageCurve:=cPageCurve;
        Finally
        Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
        {GetSignal;}
        SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
      end; {try}
    PaintBox.Canvas.Brush.Color:=FonDialog.FonColor.Brush.Color;
    PaintBox.Refresh;
{    PaintBoxPaint(nil);    }
   inherited;
*) end;

procedure TObzorkaForm.N7Click(Sender: TObject);
begin
// mainForm.n4Click(nil);
 if colordialog.execute then
  setfon(colordialog.Color);

end;

procedure TObzorkaForm.PaintBoxClick(Sender: TObject);
var
   Msg: TMsg;
   TargetTime: LongInt;
 begin
 { get the maximum time to wait for a double-click message }
   TargetTime := GetTickCount+GetDoubleClickTime;
 { cycle until DblClick received or wait time run out }
   while GetTickCount<TargetTime do
   if PeekMessage(Msg, Handle{TWinControl(PaintBox).Handle}, WM_LBUTTONDBLCLK, WM_LBUTTONDBLCLK, PM_NOREMOVE)
 then   Exit; { Double clicked }
{   MessageDlg('Single clicked', mtInformation, [mbOK], 0);}
 end;

procedure TObzorkaForm.ProcessingCursorForm(bWithGetLastN:boolean);
begin
if Cursors_Form=nil then Cursors_Form:=TCursors_form.create(Mainform);
if ((Cursors_Form.Cursors.ParamByName('id_Eksp_Parent_Param').asinteger <>SelectViewQueryEksp_Parent.Value) or
  (Cursors_Form.Cursors.ParamByName('AxisXName_Param').asString<>Sig_TableNameX.Value)) then
   begin;
    Cursors_Form.Cursors.Close;
    Cursors_Form.Cursors.ParamByName('id_Eksp_Parent_Param').asinteger :=SelectViewQueryEksp_Parent.Value;
    Cursors_Form.Cursors.ParamByName('AxisXName_Param').asString:=Sig_TableNameX.Value;
    Cursors_Form.Cursors.Open;
   end;
 if bWithGetLastN then Cursors_Form.GetCursorLastNumber(Handle,true);
 Cursors_Form.CreateObzor.Enabled:=false;
end;

Procedure TObzorkaForm.CloseCursorsList;
var
 i:smallint;
 pCursRec:^TCursorRec;
begin
 if CursorsList<>nil then
  begin
   for i:=0 to CursorsList.Count-1 do
    begin
     pCursRec:=CursorsList.Items[i];
     pCursRec^.CursLabel.Destroy;
     pCursRec^.CursShape.Destroy;
     dispose(pCursRec);
    end;
  CursorsList.Free;
  end;
 end;

procedure TObzorkaForm.wmSetCursorsList( var Message:TMessage );
begin
 CloseCursorsList;
 CursorsList:=TList.Create;
 inherited;
end;

procedure TObzorkaForm.wmAddCursorsList( var Message:TMessage );
var
 i:smallint;
 pCursRec:^TCursorRec;
begin
 if CursorsList<>nil then
  begin
   new(pCursRec);
   pCursRec^.Cursor_Num:=Cursors_Form.CursorsCursor_num.Value;
   pCursRec^.id_Cursor_InCursorTable:=Cursors_Form.Cursorsid_Cursor.Value;
   if Copy(Cursors_Form.CursorsXStr.Value,1,2)='t=' then
    pCursRec^.XStr:=Copy(Cursors_Form.CursorsXStr.Value,
                        Pos(' ',Cursors_Form.CursorsXStr.Value)+1,8)
    else pCursRec^.XStr:=Cursors_Form.CursorsXStr.Value;
   pCursRec^.MemoStr:=Cursors_Form.CursorsMemoStr.Value;
   pCursRec^.bXStr:=boolean(Cursors_Form.CursorsbXStr.Value);
   pCursRec^.bMemo:=boolean(Cursors_Form.CursorsbMemo.Value);
   pCursRec^.PointNum:=Cursors_Form.CursorsPointNum.Value;
   pCursRec^.CursLabel:=TCursorLabel.Create(Self);
   pCursRec^.CursLabel.Parent:=FonPanel;
   pCursRec^.CursLabel.Visible:=false;
   pCursRec^.CursLabel.Left:=0;
   pCursRec^.CursLabel.Top:=1;{pCursRec^.CursLabel.Height:=10;}
   pCursRec^.CursLabel.AutoSize:=True;
   pCursRec^.CursLabel.WordWrap:=True;
   pCursRec^.CursLabel.TransParent:=false;
   pCursRec^.CursLabel.Caption:=IntToStr(pCursRec^.Cursor_Num);
   if pCursRec^.bXStr then pCursRec^.CursLabel.Caption:=pCursRec^.CursLabel.Caption+chr(10)+Chr(13)+pCursRec^.XStr;
   if pCursRec^.bMemo then pCursRec^.CursLabel.Caption:=pCursRec^.CursLabel.Caption+chr(10)+Chr(13)+pCursRec^.MemoStr;
{   pCursRec^.CursLabel.Font.Style:=[fsBold];}
   pCursRec^.CursLabel.Font.Color:=clPurple;
   pCursRec^.CursLabel.Font.Name:='Times New Roman Cyr';pCursRec^.CursLabel.Font.Size:=8;
   pCursRec^.CursLabel.Hint:=pCursRec^.XStr;
   pCursRec^.CursLabel.ShowHint:=true;
   pCursRec^.CursLabel.pCursRec:=pCursRec;
   pCursRec^.CursLabel.PopupMenu:=CursorMenu;
   pCursRec^.CursShape:=TCursorShape.Create(Self);
   pCursRec^.CursShape.Parent:=FonPanel;
   pCursRec^.CursShape.Visible:=false;
{   pCursRec^.CursShape.DragMode:=dmAuto;}
   pCursRec^.CursShape.Left:=0;pCursRec^.CursShape.Width:=2;
   pCursRec^.CursShape.Top:=2;pCursRec^.CursShape.Height:=PaintBox.Width-1;
   pCursRec^.CursShape.Pen.Mode:=pmNot;
{   pCursRec^.CursShape.Cursor:=crSizeWE;}
   pCursRec^.CursShape.pCursRec:=pCursRec;
   CursorsList.Add(pCursRec);
  end;
 inherited;
end;

procedure TObzorkaForm.wmDeleteCursor( var Message:TMessage );
begin
 PaintBoxPaint(nil);
 inherited;
end;

procedure TObzorkaForm.wmShowCursor( var Message:TMessage );
var LP,RP:Longint;
begin
 UpdateView(true,true);
 inherited;
end;

procedure TObzorkaForm.PaintBoxDblClick(Sender: TObject);
var
    idCursor:Longint;
    CursorRec:TCursorRec;
    i:longint;
begin
 case SelectViewQueryView_Style.Value of
  cFreqMap_View,cKxxmap_View :
   begin
    MessageDlg('курсор не устанавливается для спектральной или корреляц. карты'
     , mtInformation,[mbOk], 0);
    exit;
   end;
  end;

  Cursors_Form.Cursors.Close;
  Cursors_Form.Cursors.ParamByName('id_eksp_Parent_Param').asinteger :=SelectViewQueryEksp_Parent.Value;
  Cursors_Form.Cursors.ParamByName('AxisxName_Param').asString:=Sig_TableNameX.Value;
  Cursors_Form.Cursors.Open;
  Cursors_Form.GetCursorLastNumber(0,false);

  dm.Create_Cursor.ParamByName('Id_Eksp_Parent').value:=SelectViewQueryEksp_Parent.Value;
  dm.Create_Cursor.ParamByName('AxisXName').value:=Sig_TableNameX.Value;
  dm.Create_Cursor.ParamByName('PointNum').value:=PointNumber;
  dm.Create_Cursor.ParamByName('DeltX').value:=SigTabRec.Deltx;
  dm.Create_Cursor.ParamByName('XStr').value:=XOldStr;
  dm.Create_Cursor.ParamByName('MemoStr').value:='';
  dm.Create_Cursor.ParamByName('bMemo').value:=integer(false);
  dm.Create_Cursor.ParamByName('bXStr').value:=integer(N9.Checked);
  dm.Create_Cursor.ParamByName('Cursor_Num').value:=Cursors_Form.CursorLastNumber+1;
  CursorRec.PointNum:=PointNumber;
  CursorRec.XStr:=XOldStr;
  CursorRec.Cursor_Num:=Cursors_Form.CursorLastNumber+1;
  dm.Create_Cursor.ExecProc;
  IdCursor:=dm.Create_Cursor.ParamByName('ID').asinteger;
  dm.Create_Cursor.Transaction.CommitRetaining;
  Cursors_Form.cursorsRefresh;
//  AppendInCursChan(IdCursor,CursorRec.Cursor_Num);
  dm.Create_Cursor.Transaction.CommitRetaining;
  Cursors_Form.GetCursorLastNumber(Handle,true);

  for i:=0 to Application.ComponentCount-1 do
   if Application.Components[i] is TImageForm then
     begin
{      IMG:=Application.Components[i] as TImageForm;}
      if (Application.Components[i] as TImageForm).bImageAvailable then
       begin
        SendMessage((Application.Components[i] as TImageForm).Handle, wm_SetCursorFromObzorka,0,longint(Self));
       end;
     end;
end;

Procedure TObzorkaForm.DrawCursor(Width,Height:word);
var
 i:word;
 CursRec:TCursorRec;
begin
 for i:=0 to ComponentCount-1 do
  begin
   if Components[i] is tCursorShape then
    begin
     CursRec:=TCursorRec(TCursorShape(Components[i]).pCursRec^);
     if CursRec.Cursor_num = 0 then continue;

     TCursorShape(Components[i]).Top:=
      round((Height / NPageCurve)*
           (((CursRec.PointNum-PointNachalo)*NPageCurve) div (PointKonec-PointNachalo)));
     TCursorShape(Components[i]).Left:=
       trunc(Width/(CurvePointEnd.value-CurvePointStart.Value)*
         ((CursRec.PointNum-PointNachalo) Mod ((PointKonec-PointNachalo) div NpageCurve)));
     TCursorShape(Components[i]).Height:=trunc(Height/NPageCurve);
     TCursorShape(Components[i]).Visible:=true;
    end;
   if Components[i] is tCursorLabel then
    begin
    CursRec:=TCursorRec(TCursorLabel(Components[i]).pCursRec^);
    if CursRec.Cursor_num = 0 then continue;
    TCursorLabel(Components[i]).Top:=
      round((Height/NPageCurve)*
             (((CursRec.PointNum-PointNachalo)*NPageCurve) div (PointKonec-PointNachalo)))-2;
    TCursorLabel(Components[i]).Left:=
       trunc(Width/(CurvePointEnd.value-CurvePointStart.Value)*
         ((CursRec.PointNum-PointNachalo) Mod ((PointKonec-PointNachalo) div NpageCurve)))+2;
    TCursorLabel(Components[i]).Color:=CurveColorFon.Value;
    TCursorLabel(Components[i]).Transparent:=N8.Checked;
    TCursorLabel(Components[i]).Visible:=True;
    end;
  end;
 end;

procedure TObzorkaForm.N23Click(Sender: TObject);
var CursRec:TCursorRec;
    bXstrStr,bMemoStr:string;
begin
{   ProcessingCursorForm(false);}
   CursRec:=TCursorRec(TCursorLabel(CursorMenu.PopupComponent).pCursRec^);
   if sender = TmenuItem(N23) then CursRec.bXStr:=not CursRec.bXStr;
   if sender = TmenuItem(N25) then CursRec.bMemo:=not CursRec.bMemo;
   TCursorRec(TCursorLabel(CursorMenu.PopupComponent).pCursRec^):=CursRec;
   TCursorLabel(CursorMenu.PopupComponent).Caption:=intToStr(CursRec.Cursor_Num);
   if CursRec.bXStr then TCursorLabel(CursorMenu.PopupComponent).Caption:=TCursorLabel(CursorMenu.PopupComponent).Caption+
           chr(10)+chr(13)+CursRec.XStr;
   if CursRec.bMemo then TCursorLabel(CursorMenu.PopupComponent).Caption:=TCursorLabel(CursorMenu.PopupComponent).Caption+
           chr(10)+chr(13)+CursRec.MemoStr;
{   TCursorLabel(CursorMenu.PopupComponent).Update;}
   UpdateCursorTable.SQL.Clear;
   if CursRec.bXStr then bXStrStr:='"True"' else bXStrStr:='"false"';
   if CursRec.bMemo then bMemoStr:='"True"' else bMemoStr:='"false"';
   UpdateCursorTable.SQL.Clear;
   UpdateCursorTable.SQL.ADD('Update Cursors set bXStr = '+bXStrStr+', bMemo = ' + bMemoStr+
          ' where Id_Cursor = '+IntToStr(CursRec.id_Cursor_InCursorTable));
   UpDateCursorTable.ExecSQL;
end;

procedure TObzorkaForm.N26Click(Sender: TObject);
var CursRec:TCursorRec;
     s1:ANSISTRING;
begin
{   ProcessingCursorForm(false);}
   CursRec:=TCursorRec(TCursorLabel(CursorMenu.PopupComponent).pCursRec^);
   s1:=CursRec.MemoStr;
   if not InputQuery('Примечание к курсору',
                      'Примечание:',s1) then exit;
   CursRec.MemoStr:=s1;
   CursRec.bMemo:=true;
   TCursorRec(TCursorLabel(CursorMenu.PopupComponent).pCursRec^):=CursRec;
   TCursorLabel(CursorMenu.PopupComponent).Caption:=intToStr(CursRec.Cursor_Num);
   if CursRec.bXStr then TCursorLabel(CursorMenu.PopupComponent).Caption:=TCursorLabel(CursorMenu.PopupComponent).Caption+
           chr(10)+chr(13)+CursRec.XStr;
   if CursRec.bMemo then TCursorLabel(CursorMenu.PopupComponent).Caption:=TCursorLabel(CursorMenu.PopupComponent).Caption+
           chr(10)+chr(13)+CursRec.MemoStr;
{   TCursorLabel(CursorMenu.PopupComponent).Update;}
   UpdateCursorTable.SQL.Clear;
   UpdateCursorTable.SQL.Clear;
   UpdateCursorTable.SQL.ADD('Update Cursors set  bMemo = "true" , memoStr = "'
       +CursRec.MemoStr+'" where Id_Cursor = '+IntToStr(CursRec.id_Cursor_InCursorTable));
   UpDateCursorTable.ExecSQL;
end;

procedure TObzorkaForm.N24Click(Sender: TObject);
var CursRec:TCursorRec;
    i:longint;
begin
{   ProcessingCursorForm(False);}
   CursRec:=TCursorRec(TCursorLabel(CursorMenu.PopupComponent).pCursRec^);
   TimeMouseDT:=TimeMinDT+(CursRec.PointNum-PointNachalo)*SigTabRec.DeltX/24/3600;
   Cursors_Form.DelCursor(CursRec.id_Cursor_InCursorTable,Handle);
{   UpdateView(True,False);}
   for i:=0 to Application.ComponentCount-1 do
   if Application.Components[i] is TImageForm then
     begin
{      IMG:=Application.Components[i] as TImageForm;}
      if (Application.Components[i] as TImageForm).bImageAvailable then
       begin
        SendMessage((Application.Components[i] as TImageForm).Handle, wm_DelCursorFromObzorka,0,longint(Self));
        ProcessingCursorForm(False);
{        show;}
       end;
     end;

end;

procedure TObzorkaForm.N27Click(Sender: TObject);
var CursRec:TCursorRec;
begin
{   ProcessingCursorForm(False);}
   CursRec:=TCursorRec(TCursorLabel(CursorMenu.PopupComponent).pCursRec^);
   Cursors_Form.ShowCursor(CursRec.id_Cursor_InCursorTable);
end;

procedure TObzorkaForm.N8Click(Sender: TObject);
begin
 N8.Checked:=not N8.Checked;
 DrawCursor(PaintBox.Width,PaintBox.Height);
end;

procedure TObzorkaForm.N9Click(Sender: TObject);
begin
 N9.Checked:=not N9.Checked;
end;



procedure TObzorkaForm.CursorMenuPopup(Sender: TObject);
begin
 ProcessingCursorForm(false);
end;

procedure TObzorkaForm.FormShow(Sender: TObject);
begin
 ProcessingCursorForm(true);
end;

procedure TObzorkaForm.Color_MapClick(Sender: TObject);
begin
  Color_Map.Checked:=not Color_Map.Checked;
  UpdateView(true,true);
end;

procedure TObzorkaForm.Convert_To_ImageClick(Sender: TObject);
var
 MS,SS,DSS:string[2];
 H,M,S,DS:word;
 cCurve:longint;
 ImaForm:TImageForm;
 Nomer,NPoint,RezSize:Longint;
 Nomer_eksp,Nomer_Sig:longint;
 FName:string;
 FileDest,FileSource:TFileStream;
 Theme,Header,Author:string;
 Date:TDateTime;
// FrmWait:TForm_Wait;
begin
(*    if Sender<>nil then
     begin
//      Application.CreateForm(TForm_Wait,FrmWait);
//      FrmWait.Show;
     end;
   {создание записи в Eksp.Db}
    OpenEksForm.Eksps.Open;
    OpenEksForm.Eksps.Last;
    Nomer_Eksp:=OpenEksForm.EkspsEksp_Nomer.Value+1;
    OpenEksForm.Eksps.First;
    while not OpenEksForm.Eksps.EOF do
     begin
      if OpenEksForm.EkspsEksp_Nomer.Value = Sig_TableEksp_Nomer.Value then break;
      OpenEksForm.Eksps.Next;
     end;
    Theme:=OpenEksForm.EkspsEksp_Theme.value;
    Header:=OpenEksForm.EkspsEksp_Header.Value;
    Author:=OpenEksForm.EkspsEksp_Author.Value;
    Date:=OpenEksForm.EkspsEksp_Date.Value;
    with OpenEksForm do
      begin
       Eksp_Table.Append;
       Eksp_TableEksp_Nomer.Value:=Nomer_Eksp;
       Eksp_TableEksp_Header.Value:=CurveCurveHeader.Value;
       Eksp_TableEksp_Date.Value:=OpenEksForm.EkspsEksp_Date.Value;
       Eksp_TableEksp_Time.Value:=OpenEksForm.EkspsEksp_Time.Value;
       Eksp_TableEksp_Author.Value:=Author;
       Eksp_TableEksp_Theme.Value:='Select from  '+Header;
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
    OpenEksForm.CurveSetTableView_Header.Value:='Image From '+SelectViewQueryView_Header.value;
    OpenEksForm.CurveSetTableView_Date.Value:=Now;
    OpenEksForm.CurveSetTableView_Time.Value:=Time;
    OpenEksForm.CurveSetTableView_Author.Value:=SelectViewQueryView_Author.Value;
    OpenEksForm.CurveSetTableView_Theme.Value:=Header{TabSet.Tabs[TabSet.Tabindex]};
    OpenEksForm.CurveSetTableView_Style.Value:=cNoMap_View;
    OpenEksForm.CurveSetTableUp.Value:=10+Random(20);
    OpenEksForm.CurveSetTableLeft.Value:=10+Random(20);
    OpenEksForm.CurveSetTableWidth.Value:=450+Random(20);
    OpenEksForm.CurveSetTableHeight.Value:=330+Random(20);
    OpenEksForm.CurveSetTableEksp_Parent.Value:=Nomer_Eksp{SelectViewQueryEksp_Parent.Value};
    OpenEksForm.CurveSetTable.Post;
    ViewNum:=OpenEksForm.CurveSetTableView_Nomer.Value;
    OpenEksForm.CurveSetTable.Close;
    OpenEksForm.CurveTable.Close;OpenEksForm.CurveTable.Open;
    Curve.Close;Curve.Open;{Curve.First;}
    OpenEksForm.Signals.Open;
    for CCurve:=0 to Curve.RecordCount-1 do
     begin
      OpenEksForm.Signals.Append;
      OpenEksForm.SignalsEksp_Nomer.Value:= Nomer_Eksp;
      OpenEksForm.SignalsEksp_Parent.Value:= Nomer_Eksp{SelectViewQueryEksp_Parent.Value};
      OpenEksForm.SignalsChanal_Nomer.Value:= cCurve;
      OpenEksForm.SignalsChanal_Header.Value:= IntToStr(cCurve)+' '+CurveCurveHeader.Value;
      OpenEksForm.SignalsDeltX.Value:= pSigTabRec(CurvepSigTabRec.Value)^.DeltX;
      OpenEksForm.SignalsNameY.Value:= Sig_TableNameY.Value;
      OpenEksForm.SignalsNameX.Value:= Sig_TableNameX.Value;
      OpenEksForm.SignalsRazmX.Value:= Sig_TableRazmX.Value;
      OpenEksForm.SignalsRazmY.Value:= Sig_TableRazmY.Value;;
      OpenEksForm.SignalsMultX.Value:= 1;
      OpenEksForm.SignalsMultY.Value:= 1;
      OpenEksForm.SignalsMaxX.Value:= 1;
      OpenEksForm.SignalsMaxY.Value:= 1;
      OpenEksForm.SignalsMinX.Value:=0;
      OpenEksForm.SignalsMinY.Value:= 0;
      OpenEksForm.SignalsDate_Start.Value:= pSigTabRec(CurvepSigTabRec.Value)^.DateTimeStart;
      OpenEksForm.SignalsTime_Start.Value:= pSigTabRec(CurvepSigTabRec.Value)^.DateTimeStart;
      OpenEksForm.SignalsPointAll.readOnly:=false;
      OpenEksForm.SignalsPointAll.Value:= CurvePointEnd.Value-CurvePointStart.Value;;
      OpenEksForm.SignalsBMaxMinX.Value:= false;
      OpenEksForm.SignalsBMaxMinY.Value:= false;
      OpenEksForm.SignalsRezType.Value:= pSigTabRec(CurvepSigTabRec.Value)^.RezType;
      OpenEksForm.SignalsFile_Seek.Value:= CurvePointStart.Value*cSizeRez[SigTabRec.RezType]+
                            pSigTabRec(CurvepSigTabRec.Value)^.Seek_Start;
      OpenEksForm.SignalsRezlength.Value:= cSizeRez[pSigTabRec(CurvepSigTabRec.Value)^.RezType];
      OpenEksForm.SignalsA0.Value:= pSigTabRec(CurvepSigTabRec.Value)^.a0;
      OpenEksForm.SignalsA1.Value:= pSigTabRec(CurvepSigTabRec.Value)^.a1;
      OpenEksForm.SignalsA2.Value:= pSigTabRec(CurvepSigTabRec.Value)^.a2;
      OpenEksForm.SignalsA3.Value:= pSigTabRec(CurvepSigTabRec.Value)^.a3;
      OpenEksForm.SignalsFileDat.Value:= pSigTabRec(CurvepSigTabRec.Value)^.Filedat;
      OpenEksForm.Signals.Post;
      Nomer_Sig:=OpenEksForm.SignalsSignal_Nomer.Value;
      OpenEksForm.CurveTable.Append;
      OpenEksForm.CurveTablePointStart.Value:= 0;
      OpenEksForm.CurveTablePointEnd.Value:= CurvePointEnd.Value-CurvePointStart.Value;
      OpenEksForm.CurveTableView_Nomer.Value:= ViewNum;
      OpenEksForm.CurveTableSignal_Nomer.Value:= OpenEksForm.SignalsSignal_Nomer.Value;
      OpenEksForm.CurveTableCurveHeaderShort.Value:= intToStr(cCurve+1)+' '+CurveCurveHeaderShort.Value;
      OpenEksForm.CurveTableCurveHeader.Value:= intToStr(cCurve+1)+' '+CurveCurveHeader.Value;
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
      OpenEksForm.CurveTableCOlor.Value:= CurveColor.Value;
      OpenEksForm.CurveTableStyle.Value:= CurveStyle.Value;
      OpenEksForm.CurveTableCurveWidth.Value:= CurveCurveWidth.value;
      OpenEksForm.CurveTableViewPage.Value:=Mes_Ini.ReadString('Obzorka','s9','Образ из обзорки');
      OpenEksForm.CurveTableScaleStyle.Value:=3;
      OpenEksForm.CurveTableCurveDate.Value:=Now;
      OpenEksForm.CurveTableCurveTime.Value:=Time;
      OpenEksForm.CurveTableSlider.Value:=0;
      OpenEksForm.CurveTableMult.Value:=1;
      OpenEksForm.CurveTableMultAll.Value:=1;
      OpenEksForm.CurveTablepPolyX.Value:=longint(nil);
      OpenEksForm.CurveTablepPolyY.Value:=longint(nil);
      OpenEksForm.CurveTableAxisXStyle.Value:=CurveAxisXStyle.Value;
      OpenEksForm.CurveTableColorFon.Value:=FonDialog.FonColor.Brush.Color;
      OpenEksForm.CurveTableGridX.Value:=CurveGridX.Value;
      OpenEksForm.CurveTableGridY.Value:=CurveGridY.Value;
      OpenEksForm.CurveTable.Post;
      Nomer:=CurveView_Signal_Nomer.Value;
      Curve.Next;
      if Nomer=CurveView_Signal_Nomer.Value then
        break;
    end;
   OpenEksForm.Signals.close;
   Curve.First;
   SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
   Application.CreateForm(TIMageForm, ImaForm);
   if sender<>nil then FrmWait.Close;
   ImaForm.Show;
*)
end;


procedure TObzorkaForm.Slider1Change(Sender: TObject);
begin
 updateactivecurve;
end;

procedure TObzorkaForm.CurveAfterPost(DataSet: TDataSet);
begin
 Curve.transaction.CommitRetaining
end;

procedure TObzorkaForm.SelectViewQueryAfterPost(DataSet: TDataSet);
begin
 SelectViewQuery.transaction.CommitRetaining   ;
 expform.curvesetRefresh;
end;

procedure TObzorkaForm.CurveAfterOpen(DataSet: TDataSet);
begin
curve.fetchall;
end;

procedure TObzorkaForm.Sig_TableCalcFields(DataSet: TDataSet);
begin
 sig_Table.fieldbyname('Filedat_abs').asstring:=dm.activestoragepath+sig_Table.fieldbyname('Filedat').asstring;
end;

end.


