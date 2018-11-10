unit Y_x_form;

interface

uses sysutils,WinTypes, WinProcs, Classes, Graphics, Messages,Forms, Controls, StdCtrls, Tabs,
  Dialogs,
  Buttons,  DBCtrls, DBTables, DB, Mask, Grids, DBGrids,
  FileBuff,
  tvc_u, DBLookup, Menus,
  {Obzordlg,obzorka,} Gauges, Movepane,
  printers, Spin,  ExtCtrls, TabNotBk, RXSlider, ComCtrls
{  ProcessF};

type


  TYX_Form = class(TForm)
    SelectViewQuery: TQuery;
    SelectViewQueryView_Nomer: TIntegerField;
    SelectViewQueryView_Date: TDateField;
    SelectViewQueryView_Time: TTimeField;
    SelectViewQueryView_Header: TStringField;
    SelectViewQueryView_Author: TStringField;
    SelectViewQueryView_Memo: TMemoField;
    CurveDataSource: TDataSource;
    Sig_DataSource: TDataSource;
    Curve: TQuery;
    CurveView_Signal_Nomer: TIntegerField;
    CurveView_Nomer: TIntegerField;
    CurveSignal_Nomer: TIntegerField;
    CurveCurveHeaderShort: TStringField;
    CurveCurveHeader: TStringField;
    CurvePointStart: TIntegerField;
    CurvePointEnd: TIntegerField;
    CurveViewMaxX: TFloatField;
    CurveViewMaxY: TFloatField;
    CurveViewMinX: TFloatField;
    CurveViewMinY: TFloatField;
    CurveBViewMaxMinX: TBooleanField;
    CurveBViewMaxMinY: TBooleanField;
    CurveBPolyCreate: TBooleanField;
    CurvePolyPoint: TIntegerField;
    CurvePolyFile: TStringField;
    CurveColor: TIntegerField;
    CurveStyle: TSmallintField;
    CurveCurveWidth: TSmallintField;
    CurveCurveMemo: TMemoField;
    CurveCurveDate: TDateField;
    CurveCurveTime: TTimeField;
    CurveVisible: TBooleanField;
    StylesTable: TTable;
    StylesDataSource: TDataSource;
    CurveScaleStyle: TSmallintField;
    CurveViewMinYAll: TFloatField;
    CurveViewMaxYAll: TFloatField;
    SelectViewQueryLeft: TIntegerField;
    SelectViewQueryUp: TIntegerField;
    SelectViewQueryWidth: TIntegerField;
    SelectViewQueryHeight: TIntegerField;
    CurveHeight: TIntegerField;
    CurveWidth: TIntegerField;
    CurveSlider: TFloatField;
    CurveMult: TFloatField;
    CurvePSigTabRec: TIntegerField;
    CurveOldLeftPoint: TIntegerField;
    CurveBFastPolyCreate: TBooleanField;
    CurvePPolyY: TIntegerField;
    CurveOldRightPoint: TIntegerField;
    CurveViewPage: TStringField;
    CurveMultAll: TFloatField;
    SelectViewQueryView_Theme: TStringField;
    SelectViewQueryView_style: TSmallintField;
    N310: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    CurveAxisXStyle: TSmallintField;
    X1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Sig_Table: TTable;
    Sig_TableSignal_nomer: TIntegerField;
    Sig_TableEksp_Nomer: TIntegerField;
    Sig_TableDeltX: TFloatField;
    Sig_TableRazmX: TStringField;
    Sig_TableRazmY: TStringField;
    Sig_TableDate_Start: TDateField;
    Sig_TableTime_Start: TTimeField;
    Sig_TablePointAll: TIntegerField;
    Sig_TableBMaxMinY: TBooleanField;
    Sig_TableFileDat: TStringField;
    Sig_TableRezType: TSmallintField;
    Sig_TableRezlength: TSmallintField;
    Sig_TableA0: TFloatField;
    Sig_TableA1: TFloatField;
    Sig_TableA2: TFloatField;
    Sig_TableA3: TFloatField;
    Sig_TableMinY: TFloatField;
    Sig_TableMaxY: TFloatField;
    Sig_TableNameX: TStringField;
    SelectViewQueryEksp_Parent: TIntegerField;
    N20: TMenuItem;
    CurveColorFon: TIntegerField;
    CurveGridX: TIntegerField;
    CurveGridY: TIntegerField;
    N19: TMenuItem;
    N28: TMenuItem;
    DataSource1: TDataSource;
    Sig_TableEksp_Parent: TIntegerField;
    Sig_TableSignal_selected: TSmallintField;
    DataSourceCurveSet: TDataSource;
    Sig_TableChanal_Header: TStringField;
    Sig_TableNameY: TStringField;
    YX_NB: TTabbedNotebook;
    GroupBox: TPanel;
    XPanel: TPanel;
{    DBText1: TDBText;}
    ViewMaxXDB: TDBText;
    ViewMinXDB: TDBText;
    UpPanel: TPanel;
    MousLabel: TLabel;
    Gauge1: TGauge;
    Panel1: TPanel;
    Label9: TLabel;
{    DBText2: TDBText;}
    ScaleRB: TRadioGroup;
    NameCurveShort: TDBEdit;
    DBNavigator1: TDBNavigator;
    FonPanel: TPanel;
    PaintBox: TPaintBox;
    MinYLabel: TLabel;
    MaxYLabel: TLabel;
    ChanalBox: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label11: TLabel;
    ShapeColor: TShape;
    CurveHeaderShort: TDBEdit;
    CurveHeader: TDBEdit;
    CurveLineWidth: TDBEdit;
    DBLookupCombo1: TDBLookupCombo;
    BitBtn5: TBitBtn;
    ChanalBoxOK: TBitBtn;
    Button1: TButton;
    ColorEdit: TDBEdit;
    Button2: TButton;
    ImageMemo: TDBMemo;
    MultBox: TPanel;
    Label2: TLabel;
    Label10: TLabel;
    MultEdit: TEdit;
    Koef_Uvel: TBitBtn;
    Koef_Umen: TBitBtn;
    KoeffAllCheckBox: TCheckBox;
    Koef_Show: TBitBtn;
    Koef_Close: TBitBtn;
    MultRB: TRadioGroup;
    DBGrid1: TDBGrid;
    Set_X: TButton;
    Set_Y: TButton;
    DBNavigator2: TDBNavigator;
    Button3: TButton;
    MinXLabel: TLabel;
    MaxXLabel: TLabel;
    Slider_t: TRxSlider;
    N3: TMenuItem;
    N4: TMenuItem;
    Traektory: TMenuItem;
    N9: TMenuItem;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    Button4: TButton;
    Button5: TButton;
    Sig_TableFile_seek: TIntegerField;
    ScaleButton: TBitBtn;
    PopupMenu_Scale: TPopupMenu;
    NE: TMenuItem;
    NI: TMenuItem;
    NPI: TMenuItem;
    NPE: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSetClick(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
    procedure ChanalBoxOKClick(Sender: TObject);
    procedure NameCurveShortClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure CurveCurveHeaderShortGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ScaleRBClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure YPanelClick(Sender: TObject);
    procedure Koef_CloseClick(Sender: TObject);
    procedure Koef_UmenClick(Sender: TObject);
    procedure Koef_UvelClick(Sender: TObject);
    procedure Koef_ShowClick(Sender: TObject);
    procedure ChanalBoxShow(Sender: TObject);
{    procedure Proportional1Click(Sender: TObject);}
    procedure CurveViewMinXGetText(Sender: TField; var Text:string;
      DisplayText: Boolean);
    procedure CurveViewMaxXGetText(Sender: TField; var Text:string;
      DisplayText: Boolean);
    procedure Sig_TableNameXGetText(Sender: TField; var Text:string;
      DisplayText: Boolean);
    procedure N5Click(Sender: TObject);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N20Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure PaintBoxClick(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CurveColorGetText(Sender: TField; var Text:string;
      DisplayText: Boolean);
    procedure MenuItem2Click(Sender: TObject);
    procedure PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1Exit(Sender: TObject);
    procedure YX_NBChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure Set_XClick(Sender: TObject);
    procedure Set_YClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Slider_tChange(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure TraektoryClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure ScaleButtonClick(Sender: TObject);
    procedure NPEClick(Sender: TObject);
    procedure PopupMenu_ScalePopup(Sender: TObject);
    Public
        bView:boolean;
        SigTabRec:TSigTabRec;
        bImageAvailable:boolean;
        ViewNumber:longint;
        bOldCursor:boolean;
        CursorsList:TList;
        NAllCurveInPage:integer;
        NPageCurve,OldPageCurve,cPageCurve:integer;
        RightPoint,LeftPoint:longint;
        bNeedCreatepoly:boolean;
        YRectUp,YRectLast:integer;
        bSetCurveParam:boolean;
        RealXDimension:string[5];
        RealRazmahX:real;
    bStop:boolean;
        ScaleStyle:integer;     bCreateOver:boolean;
   procedure CreatePoly(Width,Height,LeftM,UpM:Word);
   Procedure ShowCurve(DrawCanvas:TCanvas;Width,Height:word);
   Procedure ShowPoint(DrawCanvas:TCanvas;Width,Height:word;PointN:longint;pmMode:TPenMode);
   Procedure Obnovlenie_Image(NewtabInd:longint);
   Procedure UpdateCurvePointStartEnd;
   procedure GetCurveParam;

  private
    { Private declarations }
    DelayTime:longint;
    FlagMove:boolean;
    XMouse:Integer;
    Delt:longint;
    BookMarkArr:array[0..cMaxViewPage-1] of TBookMark;
//    FileDat:TBufferedFile;
    FileDat:TFileStream;
    CellData:string;
    Status:integer;
    FirstResize:boolean;

    PaintWidth,PaintHeight:integer;
    Proc,Mult:Real;
    XOld:integer{word};
    OldMode:TPenMode;
    YLastMouse:integer;
    WhatDo:word;
    bRect:boolean;
    XRectLeft,XRectLast:integer;
    XRLeft,YRUp:real;
    TextXOld,TextYOld:string[20];
    bOnMouseDown:boolean;
    MinNastr,MaxNastr:real;
    ppolyX:pPolyArr;
    NYCurve:integer;
    OldSliderPoint:longint;
    pPolyY_ShowPoint:pPolyArr;
    {    }
    procedure UpdateMaxMinYLabel;
    Procedure OpenSignalArr;
    Procedure CloseSignalArr;
    {Обработка сообщений}
   procedure wmSetFon ( var Message:TMessage ); message wm_setFon;

  public
    { Public declarations }
    ImageID:TDateTime;
    XOldStr:shortstring;
    PointNumber,PointNumberLeft:longint;

    Procedure UpdateView(bRepaint:boolean;bRecalc:boolean);
  end;

var
  YX_Form: TYX_Form;

implementation
 uses Mdrv,Main_u,GetGWRez,{FuncProc,  FonDLG,}
      Open_eks,PageName,rez_dlg,
      export_f,cursors,audio_u,image_2,PrintSig,preview,
      Packet,save_New,scale_h;

{$R *.DFM}

procedure TYX_Form.FormCreate(Sender: TObject);
var i:word;
begin
  bView:=false;
  NYCurve:=1;
  bRect:=false;
  DelayTime:=0;
  bNeedCreatepoly:=true;
  ImageId:=Time;
  bSetCurveParam:=false;
  OldPageCurve:=-1;
  bCreateOver:=False;
  SelectViewQuery.SQL.Clear;
  ViewNumber:=ViewNum;
  SelectViewQuery.SQL.ADD('Select * from CurveSet where View_Nomer = ' +   intToStr ( ViewNumber));
  SelectViewQuery.Open;
  bStop:=true;
  Obnovlenie_Image(0);
  bImageAvailable:=True;
  Caption:=SelectViewQueryView_Header.Value;
  Top:=selectViewQueryUp.Value;
  Left:=selectViewQueryLeft.Value;
  Width:=selectViewQueryWidth.Value;
  Height:=selectViewQueryHeight.Value;
  PaintBox.Align:=alClient;
  LeftPoint:=CurvePointStart.Value; RightPoint:=CurvePointEnd.Value;
  bCreateOver:=True;
  PaintWidth:=PaintBox.Width;
  PaintHeight:=PaintBox.Height;
  YX_NB.PageIndex:=1;
  MaxXLabel.Left:=PaintBox.Width-MaxXLabel.Width;
  MaxXLabel.Top:=PaintBox.Height-MaxXLabel.Height;
  MinYLabel.Top:=PaintBox.Height-MinYLabel.Height*2;
  MinXLabel.Top:=PaintBox.Height-MinYLabel.Height;
  case  ScaleRb.ItemIndex of
  0:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton1.Glyph;
  1:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton2.Glyph;
  2:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton3.Glyph;
  3:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton4.Glyph;
 end;
 ScaleButton.NumGlyphs:=1;
 Get_Lang_Par({Lang_Ini,}self,'YX_Form');
{ Save_Lang_Par(Lang_Ini,self,'YX_Form');}

end;

Procedure TYX_Form.Obnovlenie_Image(NewtabInd:longint);
var i:word;
begin
{  ViewPage.Close; }Curve.Close;
{  ViewPage.SQL.Clear;
  ViewPage.SQL.ADD('Select distinct ViewPage  from Curve where View_Nomer = ' +   intToStr ( ViewNumber));
  ViewPage.Open;
 }
 (* Curve.SQL.Clear;
  Curve.SQL.ADD('Select * from Curve where View_Nomer = ' +   intToStr ( ViewNumber));
*)  Curve.Open;
  TabSetClick(Nil);
  ScaleRb.ItemIndex:=CurveScaleStyle.Value;
  ScaleStyle:=ScaleRb.ItemIndex;
end;

procedure TYX_Form.FormActivate(Sender: TObject);
begin
  ScaleRb.ItemIndex:=CurveScaleStyle.Value;ScaleStyle:=ScaleRb.ItemIndex;
  bImageAvailable:=True;
  MainForm.FFTButton.Enabled:=false;
  MainForm.FTButton.Enabled:=false;
  MainForm.ObzorkaButton.Enabled:=false;
  MainForm.AudioButton.Enabled:=false;
  MainForm.FiltrButton.Enabled:=false;
  MainForm.UserButton.Enabled:=false;
  MainForm.ActiveForm:=self;
  mainForm.MenuExport.Enabled:=false;
  MainForm.CursorsButton.Enabled:=false;
  MainForm.N4.Enabled:=true;
{  NameCurveShort.SetFocus;}
end;

procedure TYX_Form.FormResize(Sender: TObject);
begin
{   LabelNameX.Left:=XPanel.Width-LabelNameX.Width;
   LabelNameX.Top:=XPanel.Height-LabelNameX.Height;}
   MaxXLabel.Left:=PaintBox.Width-MaxXLabel.Width;
   MaxXLabel.Top:=PaintBox.Height-MaxXLabel.Height;
   MinYLabel.Top:=PaintBox.Height-MinYLabel.Height*2;
   MinXLabel.Top:=PaintBox.Height-MinYLabel.Height;
   bNeedCreatepoly:=True;
end;

Procedure TYX_Form.UpdateView(bRepaint:boolean;bRecalc:boolean);
var i:INTEGER;
begin
 if bRecalc then bNeedCreatepoly:=True;
 if bRepaint then PaintBoxPaint(nil);
end;

Procedure TYX_Form.UpdateCurvePointStartEnd;
var BookMark:TBookMark;
     Nomer:Longint;
begin
 BookMark:=Curve.GetBookmark;
 Curve.DisableControls;
 Try
  Curve.First;
  Curve.RequestLive:=true;
  CPageCurve:=0;
  while not Curve.EOF do
   begin
   Curve.Edit;
   CurveOldRightPoint.Value:=CurvePointEnd.Value;
   CurveOldLeftPoint.Value:=CurvePointStart.Value;
   if  CurvebPolyCreate.Value = true then
    begin
     if ((RightPoint-LeftPoint)=(CurveOldRightPoint.Value-CurveOldLeftPoint.Value))
      then
       begin
        if (((RightPoint < CurveOldRightPoint.Value) and (RightPoint > CurveOldLeftPoint.Value))
         or
           ((LeftPoint > CurveOldLeftPoint.Value) and (LeftPoint > CurveOldRightPoint.Value)) )
            then CurvebFastPolyCreate.Value:=True;
       end;
    end;
   CurvePointEnd.Value:=RightPoint;
   CurvePointStart.Value:=LeftPoint;
   CurveViewMinX.Value:=CurvePointStart.Value*SigTabRec.DeltX;
   CurveViewMaxX.Value:=CurvePointEnd.Value*SigTabRec.DeltX;
   CurvebViewMaxMinX.Value:=True;
   CurvebPolyCreate.Value:=false;
   Curve.Post;
   if CurveVisible.Value then inc(cPageCurve);
   Nomer:=CurveView_Signal_Nomer.Value;
   Curve.Next;
   if Nomer=CurveView_Signal_Nomer.Value then break;
   end;
   NPageCurve:=cPageCurve;
   Finally
    Curve.GotoBookMark(BookMark);
    Curve.EnableControls;
    Curve.FreeBookMark(BookMark);
 end;
end;

procedure TYX_Form.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
 MultEdit.Text:=FloatToStrF(CurveMult.Value,ffGeneral,FormatAll,FormatAfterPoint);
 Mult:=CurveMult.Value;
 MultEdit.Update;
 paintBoxPaint(DBNavigator1);
 updateMaxMinYLabel;
 MaxXLabel.BringToFront;
 MinXLabel.BringToFront;
 MaxYLabel.BringToFront;
 MinYLabel.BringToFront;

end;

procedure TYX_Form.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin
  if not bStop then
   begin
    MessageDlg(Mes_Ini.ReadString('YX_form','s1','Остановите просмотр в ')+Caption+'  ?',mtInformation,[mbOK], 0);
    action:=caNone;
    exit;
   end;
  bStop:=true;
  Whatdo:=mrYes;
  if not MainForm.Autosave.Checked then
   begin
   WhatDo:=MessageDlg(Mes_Ini.ReadString('YX_form','s2','Сохранить образ ')+
     Caption+'  ?',mtInformation,[mbYes, mbNo,mbCancel], 0);
   if WhatDo = mrCancel then
    begin
     Action:=caNone;
     exit;
    end;
   end;
  Action:=CAFree;
  MainForm.FFTButton.Enabled:=false;
  MainForm.FTButton.Enabled:=false;
  MainForm.ObzorkaButton.Enabled:=false;
  MainForm.AudioButton.Enabled:=false;
  MainForm.FiltrButton.Enabled:=false;
  MainForm.UserButton.Enabled:=false;
  mainForm.MenuExport.Enabled:=false;
  MainForm.CursorsButton.Enabled:=false;
  MainForm.N4.Enabled:=false;
 end;

procedure TYX_Form.TabSetClick(Sender: TObject);
begin
 bStop:=true;
 MousLabel.Caption:=Mes_Ini.ReadString('YX_form','s3',' выборка страниц');
 UpPanel.Update;
 if bCreateOver then CloseSignalArr;
 Sig_Table.Close;
 Curve.Close;
 Curve.Open;
 OpenSignalArr;
 bSetCurveParam:=False;
 Sig_Table.EnableControls;
 ScaleRb.ItemIndex:=CurveScaleStyle.Value;
 ScaleStyle:=ScaleRb.ItemIndex;
 LeftPoint:=CurvePointStart.Value; RightPoint:=CurvePointEnd.Value;
 if  ((CurveWidth.Value<>PaintBox.Width) or (CurveHeight.Value<>PaintBox.Height)) then
  bNeedCreatepoly:=True
  else
   if CurvebPolyCreate.Value<>true then
    bNeedCreatepoly:=True;
 if not bView then  UpdateView(true,false);
 MousLabel.Caption:=''; UpPanel.Update;
 Slider_T.MaxValue:=CurvePointEnd.Value;
 Slider_T.MinValue:=CurvePointStart.Value;
 OldSliderPoint:=-1;
 Slider_T.Value:=Slider_T.MinValue+(Slider_T.MaxValue-Slider_T.MinValue) div 2;
 Slider_TChange(nil);
end;

procedure TYX_Form.CreatePoly(Width,Height,LeftM,UpM:word);
var BookMark:TBookMark;
    pPolyY:pPolyArr;
    NPolyPoint:word;
    {FileIMage,}
    FileStreamt:TFileStream;
//    {FileIMage,}FileDat:TBufferedFile;
    NumMax,NumMin,i,j,k,Point1,Point2,PointStart,PointEnd:longint;
    Prosto:Boolean;
    Rez,TekMax,TekMin,r1,r2:Real;
    XStart,XOld,XTek:integer;
    cCurve,Shag,Tip:word;
    MaxX,MinX,MaxY,MinY:real;
    i1,i2:longint;
    Nomer:longint;
    Kx,Ky,A3,A1,A2,A0:real;
    RezInteger:Integer;RezLI:Longint;RezSingle:Single;
    MinInteger:Integer;MinLI:Longint;MinSingle:Single;
    MaxInteger:Integer;MaxLI:Longint;MaxSingle:Single;
    PromRez, PromMaxY,PromMinY:real;
    ViewMinY:real;
    MinYAll,MaxYAll:real;
    BufReal:pDataReal;
    BufLI:pBufferLInt;
    BufInteger:pDataW;
    nBufferPoint:longint;
    RR1:real;
    CVisibleCurve:integer;
    smeshen:word;
    bX:boolean;
begin
 bStop:=true;
 GetCurveParam;
{$R-}
 BookMark:=Curve.GetBookmark;
 Curve.DisableControls;
 Try
  Curve.First;  Curve.RequestLive:=true;
  cVisibleCurve:=0;
  for CCurve:=0 to Curve.RecordCount-1 do
  begin
    if CurveViewPage.Value<>'' then
     begin
         SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
         Curve.Edit;                     {Расчет и сохранение Poly}
        MinYAll:=CurveViewMinYAll.Value;
        MaxYAll:=CurveViewMaxYAll.Value;
        if MaxYall=MinYAll then maxYAll:=MinYAll+1;
        PointStart:=CurvePointStart.Value;PointEnd:=CurvePointEnd.Value;
        if PointStart=PointEnd then PointEnd:=PointStart+2;
        NPolyPoint:=PointEnd-PointStart;
        A3:=SigTabRec.A3;A2:=SigTabRec.A2;
        A1:=SigTabRec.A1;A0:=SigTabRec.A0;
        Tip:=SigTabRec.RezType;
        Shag:=cSizeRez[tip];
        Smeshen:=UpM;
        bx:=False;
        if CurveViewPage.Value='X' then
         begin
            ViewMinY:=CurveViewMinY.Value*CurveMult.Value;
            if (CurveViewMaxY.Value-CurveViewMinY.Value)<>0 then
            Ky:=Width/(CurveMult.Value*(CurveViewMaxY.Value-CurveViewMinY.Value))
             else Ky:=Width/(CurveMult.Value*(1));
            RR1:=Ky*ViewMinY;
            Smeshen:=LeftM;
            bx:=True;
            MaxXLabel.Caption:=FloatToStrF(CurveViewMaxY.Value*CurveMult.Value,ffGeneral,FormatAll,FormatAfterPoint);
            MinXLabel.Caption:=FloatToStrF(CurveViewMinY.Value*CurveMult.Value,ffGeneral,FormatAll,FormatAfterPoint);
            MinXLabel.Font.Color:=CurveColor.Value;
            MaxXLabel.Font.Color:=CurveColor.Value;
         end
          else
        case CurveScaleStyle.Value of
        0: begin
            ViewMinY:=CurveViewMinYAll.Value*CurveMultAll.Value;
            Ky:=Height/((MaxYAll-MinYAll)*CurveMultAll.Value);
            RR1:=Height+Ky*ViewMinY;
           end;
        1:begin
          if CurveViewMaxY.Value-CurveViewMinY.Value<>0 then
            Ky:=Height/(CurveMult.Value*(CurveViewMaxY.Value-CurveViewMinY.Value))
            else Ky:=Height/(CurveMult.Value*(1));
          ViewMinY:=CurveViewMinY.Value*CurveMult.Value;
          RR1:=Height+Ky*ViewMinY;
         end;
       2:  begin
            ViewMinY:=CurveViewMinY.Value*CurveMult.Value;
            if (CurveViewMaxY.Value-CurveViewMinY.Value)<>0 then
            Ky:=Height/NYCurve/(CurveMult.Value*(CurveViewMaxY.Value-CurveViewMinY.Value))
             else Ky:=Height/NYCurve/(CurveMult.Value*(1));
            RR1:=Height/NYCurve+Ky*ViewMinY+Height/NYCurve*cVisibleCurve;
           end;
       3:  begin
            ViewMinY:=CurveViewMinYAll.Value*CurveMultAll.Value;
            Ky:=Height/NYCurve/(CurveMultAll.Value*(MaxYAll-MinYAll));
            RR1:=Height/NYCurve+Ky*ViewMinY+Height/NYCurve*cVisibleCurve;
           end
       end; {case scaleStyle}
       (pSigTabRec(CurvepSigTabRec.Value))^.rr1:=rr1;
       (pSigTabRec(CurvepSigTabRec.Value))^.Ky:=Ky;
       K:=0;
       pPolyY:=pPolyArr(CurvepPolyY.Value);
       if pPolyY<>nil then Freemem(pPolyY,CurvePolyPoint.Value*Sizeof(Word)+Zapas);
       GetMem(pPolyY,NPolyPoint*SizeOf(Word)+Zapas);
       GetReadFileDat(FileDat,Status,SigTabRec);
       FileDat.position:=SigTabRec.Seek_Start+PointStart*cSizeRez[SigTabRec.RezType];
//       FileDat.Seek(SigTabRec.Seek_Start+PointStart*cSizeRez[SigTabRec.RezType]);
       if pointStart<>PointEnd then
        begin
            for i:=PointStart to PointEnd do
             begin
              case Tip of
                cRealLong,cAnyChanal,cSeismoReal:begin FileDat.Read(RezSingle,Shag);
//                  if BytesRead=0 then RezSingle:=0;
                         Rez:=RezSingle;end;
                cAllData,cWordLong,cSeismoWord:begin FileDat.Read(RezInteger,Shag);
//                  if BytesRead=0 then RezInteger:=0;
                    Rez:=RezInteger;end;
                cAllData18,cLong18,cSeismoLInt:begin FileDat.Read(RezLI,Shag);
//                  if BytesRead=0 then RezLI:=0;
                  Rez:=RezLI;end;
               end;
               Rez:=0;
              case Tip of
                cRealLong,cAnyChanal,cSeismoReal: Rez:=RezSingle;
                cAllData,cWordLong,cSeismoWord:Rez:=RezInteger;
                cAllData18,cLong18,cSeismoLInt:Rez:=RezLI;
               end;
              PromRez:=A0+Rez*A1;
              if A2<>0 then PromRez:=PromRez+Rez*Rez*A2;
              if A3<>0 then PromRez:=PromRez+Rez*Rez*Rez*A3;
              Rez:=PromRez;
              if bx then pPolyY^[k]:=trunc(-RR1+Rez*Ky)+Smeshen
                else pPolyY^[k]:=trunc(RR1-Rez*Ky)+Smeshen;
              inc(k);
            end ;
      end {PointStart<>PointEnd};
     if FileDat<>nil then begin {FileDat.Close;}FileDat.Destroy;end;
     CurvebPolyCreate.Value:=True;
     CurvePolyPoint.Value:=NPolyPoint;
    CurveWidth.Value:=Width;CurveHeight.Value:=Height;
     CurvepPolyY.Value:=longint(pPolyY);
     Curve.Post;
     if CurveViewPage.Value='Y' then inc(cVisibleCurve);
    end;
   Nomer:=CurveView_Signal_Nomer.Value;
   Curve.Next;
   if Nomer=CurveView_Signal_Nomer.Value then break;
  end; {перебор кривых }
  Finally
    Curve.GotoBookMark(BookMark);Curve.EnableControls;Curve.FreeBookMark(BookMark);
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 end;
{$R+}
bNeedCreatepoly:=false;
bOldCursor:=false;
end;

Procedure TYX_Form.ShowCurve(DrawCanvas:TCanvas;Width,Height:word);
label M2;
var
    pPolyY:pPolyArr;
    NPolyPoint:word;
    FileIMage:TBufferedFile;
    PointN,i:longint;
    WidthEllipse:shortInt;
    Smesh:integer;

Procedure InterpLine;
var i:word;
begin
{$R-}
for i:=1 to NPolyPoint-1 do DrawCanvas.LineTo(pPolyX^[i],pPolyY^[i]);
{$R+}
end;

begin
{$R-}
 if CurveVisible.Value=true then
   begin
   if CurvebPolyCreate.Value = True then
    begin   {Загрузка PolyY}
     NPolyPoint:=CurvePolyPoint.Value;
     if ((NPolyPoint=0) or
           (CurvepPolyY.Value = 0)) then
      begin
       FileIMage:=TBufferedFile.Create(CurvePolyFile.Value,4096);
       FileImage.Reset;
       NPolyPoint:=FileImage.FileSize div (SizeOf(Word));
       GetMem(pPolyY,NPolyPoint*SizeOf(Word)+Zapas);
       FileImage.Read(pPolyY^,NPolyPoint*SizeOf(Word),BytesRead);
       FileImage.Close;
       FileImage.Destroy;
       Curve.RequestLive:=True;Curve.Edit;
       CurvePolyPoint.Value:=NPolyPoint;
       CurvepPolyY.Value:=longint(pPolyY);
       Curve.Post;
      end
       else
        begin
         pPolyY:=pPolyArr(CurvepPolyY.Value);
        end;
     DrawCanvas.Pen.Color:=CurveColor.Value;
     DrawCanvas.Pen.Style:=psSolid;
     DrawCanvas.Pen.Width:=CurveCurveWidth.Value;
     WidthEllipse:=DrawCanvas.Pen.Width div 2;
     if WidthEllipse=0 then WidthEllipse:=1;
     DrawCanvas.MoveTo(pPolyX^[0],pPolyY^[0]);
     case CurveStyle.Value of
      1: {if NPolyPoint<Width then}
         for i:=1 to NPolyPoint-1 do
           begin
            DrawCanvas.LineTo(pPolyX^[i],pPolyY^[i-1]);
            DrawCanvas.LineTo(pPolyX^[i],pPolyY^[i]);
           end; {else InterPline;}
      2: {if NPolyPoint<Width then}
         for i:=0 to NPolyPoint-1 do
           begin
            DrawCanvas.Ellipse(pPolyX^[i]-WidthEllipse,
                pPolyY^[i]-WidthEllipse,pPolyX^[i]+WidthEllipse,pPolyY^[i]+WidthEllipse);
           end ;
{            else InterpLine;}
      3: {if NPolyPoint<Width then}
         for i:=0 to NPolyPoint-1 do
           begin
            DrawCanvas.Rectangle(pPolyX^[i]-WidthEllipse,
                pPolyY^[i]-WidthEllipse,pPolyX^[i]+WidthEllipse,pPolyY^[i]+WidthEllipse);
           end  ;
            {else InterpLine;}
      4: {if NPolyPoint<Width then}
         for i:=0 to NPolyPoint-1 do
           begin
            DrawCanvas.RoundRect(pPolyX^[i]-WidthEllipse,
                pPolyY^[i]-WidthEllipse,pPolyX^[i]+WidthEllipse,pPolyY^[i]+WidthEllipse,WidthEllipse,WidthEllipse);
           end;{
            else InterpLine;}
      else begin
          DrawCanvas.Pen.Style:=psSolid;
          case CurveStyle.Value of
           5:DrawCanvas.Pen.Style:=psSolid;
           6:DrawCanvas.Pen.Style:=psDash;
           7:DrawCanvas.Pen.Style:=psDot;
           8:DrawCanvas.Pen.Style:=psDashDot;
           9:DrawCanvas.Pen.Style:=psDashDotDot;
           10:begin
                {if NPolyPoint<Width then         }
                begin
                 for i:=0 to NPolyPoint-1 do
                 DrawCanvas.Rectangle(pPolyX^[i]-WidthEllipse,
                   pPolyY^[i]-WidthEllipse,pPolyX^[i]+WidthEllipse,pPolyY^[i]+WidthEllipse);
                DrawCanvas.Pen.Width:=1;
               end;
              end;
           11:begin
                {if NPolyPoint<Width then}
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
{     for i:=0 to NPolyPoint-1 do pPolyY^[i]:=pPolyY^[i]+Smesh;}
M2:
     DrawCanvas.Font.Color:=CurveColor.Value;
     DrawCanvas.Pen.Style:=psSolid;
     DrawCanvas.Pen.Width:=CurveCurveWidth.Value*2;
     OldMode:=DrawCanvas.Pen.Mode;
     DrawCanvas.Pen.Mode:=pmNot;
     PointN:=Slider_T.Value;
     try
      DrawCanvas.MoveTo(ppolyX^[PointN-Slider_T.MinValue]-CurveCurveWidth.Value*3,
                      ppolyY^[PointN-Slider_T.MinValue]-CurveCurveWidth.Value*3);
      DrawCanvas.LineTo(ppolyX^[PointN-Slider_T.MinValue]+CurveCurveWidth.Value*3,
                      ppolyY^[PointN-Slider_T.MinValue]+CurveCurveWidth.Value*3);
      DrawCanvas.MoveTo(ppolyX^[PointN-Slider_T.MinValue]+CurveCurveWidth.Value*3,
                      ppolyY^[PointN-Slider_T.MinValue]-CurveCurveWidth.Value*3);
      DrawCanvas.LineTo(ppolyX^[PointN-Slider_T.MinValue]-CurveCurveWidth.Value*3,
                      ppolyY^[PointN-Slider_T.MinValue]+CurveCurveWidth.Value*3);
     Finally
       DrawCanvas.Pen.Mode:=OldMode;
     end;

  end;
 end;
{$R+}
end;

Procedure TYX_Form.PaintBoxPaint(Sender: TObject);
var BookMark:TBookMark;
    cCurve:longint;
    nPolyPoint,Nomer:longint;
    DeltX,DeltY,X,y:word;
    pCursorRec:^TCursorRec;
    i:integer;
    FileIMage:TBufferedFile;
    pPolyY:pPolyArr;
begin
if bOnMouseDown then
 begin
   OldMode:=PaintBox.Canvas.Pen.Mode;
   PaintBox.Canvas.Pen.Mode:=pmNot;
   PaintBox.Canvas.Brush.style:=bsClear;
   PaintBox.Canvas.Rectangle(XRectLeft,YRectUp,XRectLast,YRectLast);
   PaintBox.Canvas.Pen.Mode:=OldMode;
   bOnMouseDown:=false;
 end;
 if bNeedCreatePoly then Createpoly(PaintBox.Width,PaintBox.Height,0,0);
 if ( ( (CurvepPolyY.Value=0))
     and (not FileExists(CurvePolyFile.Value) ) ) then
       CreatePoly(PaintBox.Width,PaintBox.Height,0,0);
 BookMark:=Curve.GetBookmark;
 Curve.DisableControls;
 Try
  Curve.First;
  cPageCurve:=0;
  for CCurve:=0 to Curve.RecordCount-1 do
   begin
    if ((CurveViewPage.Value='X'))then
     begin
     NPolyPoint:=CurvePolyPoint.Value;
     if ((NPolyPoint=0) or
           (CurvepPolyY.Value = 0)) then
      begin
       FileIMage:=TBufferedFile.Create(CurvePolyFile.Value,4096);
       FileImage.Reset;
       NPolyPoint:=FileImage.FileSize div (SizeOf(Word));
       GetMem(pPolyY,NPolyPoint*SizeOf(Word)+Zapas);
       FileImage.Read(pPolyY^,NPolyPoint*SizeOf(Word),BytesRead);
       FileImage.Close;
       FileImage.Destroy;
       Curve.RequestLive:=True;Curve.Edit;
       CurvePolyPoint.Value:=NPolyPoint;
       CurvepPolyY.Value:=longint(pPolyY);
       Curve.Post;
      end
       else
        begin
         pPolyY:=pPolyArr(CurvepPolyY.Value);
        end;
     pPolyX:=pPolyY;
     break;
     end;
    Nomer:=CurveView_Signal_Nomer.Value;
    Curve.Next;
    if Nomer=CurveView_Signal_Nomer.Value then break;
   end;
   NPageCurve:=cPageCurve;
   Finally
    Curve.GotoBookMark(BookMark);Curve.EnableControls;Curve.FreeBookMark(BookMark);
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 end;
 if Sender = DBNavigator1 then
  begin
   if CurveViewpage.Value='Y' then ShowCurve(PaintBox.Canvas,PaintBox.Width,PaintBox.Height)
  end
 else
   begin
 PaintBox.Canvas.Brush.style:=bsSolid;
 PaintBox.Canvas.Pen.Color:=CurveColorFon.Value;
 PaintBox.Canvas.Brush.Color:=CurveColorFon.Value;
 PaintBox.Canvas.FillRect(Rect(0,0,PaintBox.Width,PaintBox.Height));
 PaintBox.Canvas.Pen.style:=psDot ;
{ PaintBox.Canvas.Pen.Color:=clSilver;}
 if PaintBox.Canvas.Brush.color=clWhite then PaintBox.Canvas.Pen.Color:=clSilver
    else PaintBox.Canvas.Pen.Color:=clWhite;
 PaintBox.Canvas.Pen.Width:=1;
 if CurveGridX.Value<>0 then
  begin
   DeltX:=CurveGridX.Value;
   x:=DeltX;
   while x<PaintBox.Width do
    begin
     PaintBox.Canvas.MoveTo(x,0);
     PaintBox.Canvas.LineTo(x,PaintBox.Height);
     x:=X+Deltx;
    end;
  end;
 if CurveGridY.Value<>0 then
  begin
   Delty:=CurveGridY.Value;
   Y:=DeltY;
   while y<PaintBox.Height do
    begin
     PaintBox.Canvas.MoveTo(0,y);
     PaintBox.Canvas.LineTo(PaintBox.width,y);
     y:=y+Delty;
    end;
  end;
 PaintBox.Canvas.Pen.Color:=CurveColorFon.Value;
 BookMark:=Curve.GetBookmark;
 Curve.DisableControls;
 Try
  Curve.First;
  cPageCurve:=0;
  for CCurve:=0 to Curve.RecordCount-1 do
  begin
   if CurveViewpage.Value='Y' then ShowCurve(PaintBox.Canvas,PaintBox.Width,PaintBox.Height);
   Nomer:=CurveView_Signal_Nomer.Value;
   if CurveVisible.Value then inc(cPageCurve);
   Curve.Next;
   if Nomer=CurveView_Signal_Nomer.Value then break;
  end;
   NPageCurve:=cPageCurve;
   Finally
    Curve.GotoBookMark(BookMark);Curve.EnableControls;Curve.FreeBookMark(BookMark);
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 end;
 end;
 UpdateMaxMinYLabel;
end;



procedure TYX_Form.UpdateMaxMinYLabel;
var qq:string;
 begin
   MinYLabel.Top:=PaintBox.Height-MinYLabel.Height*2;
   MinYLabel.Font.Color:=CurveColor.Value;
   if ((CurveScaleStyle.value = 0) or (CurveScaleStyle.Value = 3)) then
    begin
     MinYLabel.Caption:=FloatToStrF(CurveMultAll.Value*(CurveViewMinYAll.Value-
     (CurveViewMaxYAll.Value-CurveViewMinYAll.Value)*CurveSlider.value),ffGeneral,FormatAll,FormatAfterPoint);
     MinYLabel.Font.Style:=[fsBold];
    end
    else
     begin
     MinYLabel.Caption:=FloatToStrF(CurveMult.Value*(CurveViewMinY.Value-
     (CurveViewMaxY.Value-CurveViewMinY.Value)*CurveSlider.value),ffGeneral,FormatAll,FormatAfterPoint);
     MinYLabel.Font.Style:=[];
     end;
   MaxYLabel.Font.Color:=CurveColor.Value;
   if ((CurveScaleStyle.value = 0)  or (CurveScaleStyle.value = 3)) then
    begin
     MaxYLabel.Caption:=FloatToStrF(CurveMultAll.Value*(CurveViewMaxYAll.Value-
        (CurveViewMaxYAll.Value-CurveViewMinYAll.Value)*CurveSlider.Value), ffGeneral,FormatAll,FormatAfterPoint);
     MaxYLabel.Font.Style:=[fsBold];
    end
    else
     begin
      MaxYLabel.Caption:=FloatToStrF(CurveMult.Value*(CurveViewMaxY.Value-
        (CurveViewMaxY.Value-CurveViewMinY.Value)*CurveSlider.value),ffGeneral,FormatAll,FormatAfterPoint) ;
      MaxYLabel.Font.Style:=[];
     end;
   if CurveViewPage.Value<>'Y' then
    begin
     MinYLabel.Visible:=false;
     MaxYLabel.Visible:=False;
    end
     else
      begin
      MinYLabel.Visible:=True;
      MaxYLabel.Visible:=True;
      MinYLabel.Update;
      MaxYLabel.update;
{      MinYLabel.BringToFront;
      MaxYLabel.BringToFront;}
      end;
   MinXLabel.Update;
   MaxXLabel.Update;
{   MinXLabel.BringToFront;
   MaxXLabel.BringToFront;}
   Sig_TableNameXGetText(nil,qq,true);
// Slider_T.Caption:=qq;
   Slider_T.Update;
 end;

procedure TYX_Form.ChanalBoxOKClick(Sender: TObject);
begin
 Curve.RequestLive:=True;
 if Curve.State = dsEdit then Curve.Post;
 ChanalBox.Visible:=False;
 PaintBox.Visible:=True;
 UpdateView(True,false);
end;

procedure TYX_Form.NameCurveShortClick(Sender: TObject);
begin
 ChanalBoxShow(Sender);
end;

procedure TYX_Form.ChanalBoxShow(Sender: TObject);
begin
 ChanalBox.Visible:=True;
 ChanalBox.Update;
 Curve.Edit;
end;

procedure TYX_Form.BitBtn5Click(Sender: TObject);
begin
 ChanalBox.Visible:=False;
 PaintBox.Visible:=True;
 NameCurveShort.Update;
end;

procedure TYX_Form.CurveCurveHeaderShortGetText(Sender: TField;
  var Text:string; DisplayText: Boolean);
begin
 NameCurveShort.Font.Color:=CurveColor.Value;
 Text:=CurveCurveHeaderShort.Value;
end;

procedure TYX_Form.ScaleRBClick(Sender: TObject);
var i:integer;
begin
 if ScaleStyle=ScaleRb.ItemIndex then exit
     else
 ScaleStyle:=ScaleRb.ItemIndex;
 bSetCurveParam:=false;
if bCreateOver then UpdateView(True,true);
updateMaxMinYLabel;
MaxXLabel.BringToFront;
MinXLabel.BringToFront;
MaxYLabel.BringToFront;
MinYLabel.BringToFront;

end;


Procedure TYX_Form.OpenSignalArr;
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
       Curve.Edit;Curve.RequestLive:=True;
{       Sig_Table.Close;Sig_Table.Open;}
       GetMem(pSignalRec,SizeOf(TSigTabRec));
       pSignalRec^.PointAll:=Sig_TablePointAll.Value;
       pSignalRec^.A0:=Sig_TableA0.Value;
       pSignalRec^.A1:=Sig_TableA1.Value;
       pSignalRec^.A2:=Sig_TableA2.Value;
       pSignalRec^.A3:=Sig_TableA3.Value;
       pSignalRec^.DeltX:=Sig_TableDeltX.Value;
       pSignalRec^.FileDat:=Sig_TableFileDat.Value;
       pSignalRec^.RezType:=Sig_TableRezType.Value;
       pSignalRec^.Seek_Start:=Sig_TableFile_seek.Value;
       pSignalRec^.bMaxMinY:=Sig_TablebMaxMinY.Value;
       pSignalRec^.MinY:=Sig_TableMinY.Value;
       pSignalRec^.MaxY:=Sig_TableMaxY.Value;
       pSignalRec^.DateTimeStart:=Sig_TableDate_Start.Value+Sig_TableTime_Start.Value;
       pSignalRec^.Eksp_Nomer:=Sig_TableEksp_Nomer.Value;
       pSignalRec^.RR1:=cPageCurve+1;pSignalRec^.Ky:=cPageCurve+1;
       CurvepSigTabRec.Value:=longint(pSignalRec);
       CurvepPolyY.Value:=longint(nil);

       if CurveVisible.Value then inc(cPageCurve);
       inc(NAllCurveInPage);
       Curve.Post;
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
 NPageCurve:=cPageCurve;
 Curve.First;
{ Curve.EnableControls;}
{ Sig_Table.Close;Sig_Table.Open;}
 SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 X1.Enabled:=(Sig_TableNameX.Value='t');
{ AudioItem.Enabled:=X1.Enabled;}
 N5.Checked:=False;  N6.Checked:=False;
 N7.Checked:=False;  N8.Checked:=False;
 case CurveAxisXStyle.Value of
  0:N5.Checked:=true;
  1:N6.Checked:=true;
  2:N7.Checked:=true;
  3:N8.Checked:=true;
 end;
end;

Procedure TYX_Form.CloseSignalArr;
var
 cCurve:longint;
 Nomer:longint;
 pSignalRec:pSigTabRec;
 pPolyY:pPolyArr;
 FileImage:TBufferedFile;
begin
   Curve.DisableControls;
   Gauge1.MinValue:=0;Gauge1.MaxValue:=NallCurveInPage;
   Gauge1.Visible:=True;
   Curve.First;Curve.RequestLive:=True;
   Sig_table.Close;
   for CCurve:=0 to Curve.RecordCount-1 do
      begin
       Gauge1.Progress:=cCurve;Gauge1.Update;
       Nomer:=CurveView_Signal_Nomer.Value;
       pSignalRec:=Pointer(CurvepSigTabRec.Value);
       if pSignalRec<>nil then FreeMem(pSignalRec,SizeOf(TSigTabRec));
       pPolyY:=pPolyArr(CurvepPolyY.Value);
       if ((pPolyY<>nil)) then
        begin
{         FileIMage:=TBufferedFile.Create(CurvePolyFile.Value,4096);FileImage.Rewrite;
         FileImage.Write(pPolyY^,CurvePolyPoint.Value*SizeOf(Word),BytesWrote);
         FileImage.Close;FileImage.Destroy;}
         DeletefIle(CurvePolyFile.Value);
         if pPolyY<>nil then Freemem(pPolyY,CurvePolyPoint.Value*Sizeof(Word)+Zapas);
        end;
       Curve.Edit;
       CurvepPolyY.Value:=longint(nil);
       CurvePolyPoint.Value:=0;
       CurvepSigTabRec.Value:=longint(nil);
       Curve.Post;
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
   Curve.EnableControls;
{   if pPolyX<>nil then Freemem(pPolyX,CurvePolyPoint.Value*Sizeof(Word)+Zapas);}
   Sig_table.Open;
   Gauge1.Visible:=false;
   Gauge1.Update;
end;

procedure TYX_Form.FormDestroy(Sender: TObject);
var i:integer;
begin
 if bCreateOver then CloseSignalArr;
 bImageAvailable:=false;
{ for i:=0 to ViewPage.RecordCount-1 do
    ViewPage.FreeBookMark(BookMarkArr[i]);
} selectViewQuery.RequestLive:=True;
 selectViewQuery.Edit;
 selectViewQueryUp.Value:=Top;selectViewQueryLeft.Value:=Left;
 selectViewQueryWidth.Value:=Width;selectViewQueryHeight.Value:=Height;
 selectViewQuery.Post;
 if WhatDo=mrNo then
  begin
   with OpenEksForm Do
    begin
    CurveDelTable.Close;
    CurveDelTable.MasterSource:=DataSourceCurveSet;
    CurveDelTable.Open;
    if CurveDelTable.RecordCount>0 then
    for i:=0 to CurveDelTable.RecordCount-1 do
     begin
     ss:=CurveDelTablePolyFile.Value;
     DeleteFile({stringaspchar(}ss);
     CurveDelTable.Next;
    end;
    CurveDelTable.Close;
    DeleteQuery.SQL.Clear;
    DeleteQuery.SQL.Add('Delete from Curve  where View_Nomer = '+IntToStr(ViewNumber));
    DeleteQuery.ExecSQL;
    DeleteQuery.SQL.Clear;
    DeleteQuery.SQL.Add('Delete from CurveSet  where View_Nomer = '+IntToStr(ViewNumber));
    DeleteQuery.ExecSQL;
    DeleteQuery.SQL.Clear;
    DeleteQuery.SQL.Add(
    'Delete from Eksp  where Eksp_Parent = '+IntToStr(SelectViewQueryEksp_Parent.Value)
            +' and Eksp_Proc = 1');
    DeleteQuery.ExecSQL;
   end;
 end;
end;

procedure TYX_Form.YPanelClick(Sender: TObject);
begin
 case ScaleRB.ItemIndex of
  1,2:Mult:=CurveMult.Value;
  0,3:Mult:=CurveMultAll.Value;
 end;
 MultEdit.Text:=FloatToStrF(Mult,ffGeneral,FormatAll,FormatAfterPoint);
 KoeffAllCheckBox.Enabled:=ScaleRB.ItemIndex>0;
 if Sender<>nil then
  begin
   MultBox.Visible:=True;
  end;
end;

procedure TYX_Form.Koef_CloseClick(Sender: TObject);
begin
 MultBox.Visible:=False;
 UpdateView(True,false);
end;

procedure TYX_Form.Koef_UmenClick(Sender: TObject);
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

procedure TYX_Form.Koef_UvelClick(Sender: TObject);
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

procedure TYX_Form.Koef_ShowClick(Sender: TObject);
var BookMark:TBookMark;
     cCurve,Nomer:Longint;
begin
 try
  Mult:=StrToFloat(MultEdit.Text);
 except
   on EConvertError do Mult:= CurveMult.Value;
  end;
 case ScaleRB.ItemIndex of
  1,2: begin
       if KoeffAllCheckBox.Checked then
        begin
         BookMark:=Curve.GetBookmark;
         Curve.DisableControls;
         Try
           Curve.First;
           cPageCurve:=0;
           for CCurve:=0 to Curve.RecordCount-1 do
            begin
             Curve.Edit;Curve.RequestLive:=True;
             CurveMult.Value:=Mult;
             Curve.Post;
             Nomer:=CurveView_Signal_Nomer.Value;
             if CurveVisible.Value then inc(cPageCurve);
             Curve.Next;
             if Nomer=CurveView_Signal_Nomer.Value then break;
            end;
            NPageCurve:=cPageCurve;
           Finally
           Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
           SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
         end; {try}
        end else
         begin
          Curve.Edit;Curve.RequestLive:=True;
          CurveMult.Value:=Mult;
          Curve.Post;
         end;
     end;
 0,3:begin
      BookMark:=Curve.GetBookmark;
      Curve.DisableControls;
      Try
        Curve.First;
        cPageCurve:=0;
        for CCurve:=0 to Curve.RecordCount-1 do
         begin
          Curve.Edit;Curve.RequestLive:=True;
          CurveMultAll.Value:=Mult;
          Curve.Post;
          Nomer:=CurveView_Signal_Nomer.Value;
          if CurveVisible.Value then inc(cPageCurve);
          Curve.Next;
          if Nomer=CurveView_Signal_Nomer.Value then break;
         end;
         NPageCurve:=cPageCurve;
        Finally
        Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
        SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
      end; {try}
     end;  {0}
   end; {case}
 bNeedCreatepoly:=true;
 UpdateView(True,True);
 UpdateMaxMinYLabel;
end;

procedure TYX_Form.CurveViewMinXGetText(Sender: TField;
  var Text:string; DisplayText: Boolean);
begin
 case CurveAxisXStyle.Value of
  0:Text:=DateTimeToStr(sigTabRec.DateTimeStart+CurvePointStart.Value*SigTabRec.Deltx/(24*3600));
  1:Text:=FloatToStrF(CurveViewMinX.Value,fffixed,FormatAll,FormatAfterPoint);
  2:Text:=FloatToStrF(CurveViewMinX.Value/60,fffixed,FormatAll,FormatAfterPoint);
  3:Text:=FloatToStrF(CurveViewMinX.Value/60/60,fffixed,FormatAll,FormatAfterPoint);
 end;
end;

procedure TYX_Form.CurveViewMaxXGetText(Sender: TField;
  var Text:string; DisplayText: Boolean);
begin
 case CurveAxisXStyle.Value of
  0:Text:=DateTimeToStr(sigTabRec.DateTimeStart+CurvePointEnd.Value*SigTabRec.Deltx/(24*3600));
  1:Text:=FloatToStrF(CurveViewMaxX.Value,fffixed,FormatAll,FormatAfterPoint);
  2:Text:=FloatToStrF(CurveViewMaxX.Value/60,fffixed,FormatAll,FormatAfterPoint);
  3:Text:=FloatToStrF(CurveViewMaxX.Value/60/60,fffixed,FormatAll,FormatAfterPoint);
 end;
end;

procedure TYX_Form.Sig_TableNameXGetText(Sender: TField;
  var Text:string; DisplayText: Boolean);
begin
 RealRazmahX:=0;
 if ((CurveViewMaxX.Value-CurveViewMinX.Value)<>0) then RealRazmahX:=(CurveViewMaxX.Value-CurveViewMinX.Value);
 RealXDimension:=Sig_TableRazmX.Value;
 case CurveAxisXStyle.Value of
  0:begin
     Text:='t';
     RealXDimension:='min';
     RealRazmahX:=RealRazmahX/60;
    end;
  1:begin
     Text:=Sig_TableNameX.Value;
     if text = 't' then begin Text:=Text+',s'; RealXDimension:='s'; end;
    end;
  2:begin
     Text:=Sig_TableNameX.Value;
     if text = 't' then begin Text:=Text+',min'; RealXDimension:='min'; end;
     RealRazmahX:=RealRazmahX/60;
    end;
  3:begin
     Text:=Sig_TableNameX.Value;
     if text = 't' then begin Text:=Text+',hour'; RealXDimension:='hour'; end;
     RealRazmahX:=RealRazmahX/3600;
    end;
 end;
end;

procedure TYX_Form.N5Click(Sender: TObject);
var BookMark:TBookMark;
    Nomer:Longint;
    cCurve:longint;
    qq:string;
begin
      BookMark:=Curve.GetBookmark;
      Curve.DisableControls;
      Try
        Curve.First;
        cPageCurve:=0;
        for CCurve:=0 to Curve.RecordCount-1 do
         begin
          Curve.Edit;Curve.RequestLive:=True;
          CurveAxisXStyle.Value:=(Sender as TMenuItem).Tag;
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
  N5.Checked:=False;  N6.Checked:=False;
  N7.Checked:=False;  N8.Checked:=False;
  case (Sender as TMenuItem).Tag of
  0:N5.Checked:=true;
  1:N6.Checked:=true;
  2:N7.Checked:=true;
  3:N8.Checked:=true;
 end;
 ViewMinXDb.Update;
 ViewMaxXDb.Update;
 Sig_TableNameXGetText(nil, qq,true);
//lider_T.Caption:=qq;
 Slider_T.Update;
end;

 procedure TYX_Form.wmSetFon( var Message:TMessage );
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
    FonPanel.Color:=FonDialog.FonColor.Brush.Color;
    FonDialog.Hide;
    PaintBox.Refresh;
    FonDialog.Show;
    bOldCursor:=false;
{    PaintBoxPaint(nil);    }
   inherited;
 end;

procedure TYX_Form.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var XR,Yr,YRC:real; FileDat:TBufferedFile;
  XStr:string[25];
  FirstLine,SecondLine : string[80];
begin
 if bOnMouseDown then exit;
 if (Screen.activeform= self) and ((MultBox.Visible or ChanalBox.Visible )) then exit;
 if ((x <0) or  (Y <0) or (X>PaintBox.Width) or (Y>PaintBox.Height) )  then
  begin
   PaintBoxMouseUp(nil,mbleft,[ssleft],0,0);
   exit;
  end;
 secondLine:='X= '+FloatToStrF(strToFloat(MinXLabel.Caption)+X/PaintBox.width*
          (strToFloat(MaxXLabel.Caption)-strToFloat(MinXLabel.Caption)),ffGeneral,FormatAll,FormatAfterPoint);
 SigtabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 if SigTabRec.Ky<>0 then Yr:=(SigTabRec.RR1-Y)/SigTabrec.Ky;
 if CurveViewPage.Value='Y' then FirstLine:='Y= '+FloatToStrF(Yr,ffGeneral,FormatAll,FormatAfterPoint)
  else FirstLine:='';
 MousLabel.Font.Color:=CurveColor.Value;
 ViewMinXDB.Update;ViewMaxXDb.Update;
 YlastMouse:=Y;
 OldMode:=PaintBox.Canvas.Pen.Mode;
 if  Shift = [ssLeft] then
  begin
   if bRect then
    begin
       PaintBox.Canvas.Pen.Mode:=pmNot;
       PaintBox.Canvas.Brush.style:=bsClear;
       PaintBox.Canvas.Rectangle(XRectLeft,YRectUp,XRectLast,YRectLast);
       XRectLast:=X;YRectLast:=Y;
       PaintBox.Canvas.Rectangle(XRectLeft,YRectUp,X,Y);
       XRectLast:=X;YRectLast:=Y;
       TextXOld:='   dX='+FloatToStrF((X-XRectLeft)/PaintBox.width*
          (strToFloat(MaxXLabel.Caption)-strToFloat(MinXLabel.Caption)),ffGeneral,FormatAll,FormatAfterPoint);
       TextYOld:='   dY='+FloatToStrF(abs(YR-YRUP),ffGeneral,FormatAll,FormatAfterPoint);
       FirstLine:=FirstLine+TextYOld;
       SecondLine:=SecondLine+TextXOld;
    end
     else
      begin
       brect:=true;
       PaintBox.Canvas.Brush.style:=bsClear;
       XRectLeft:=X;
       YRectUp:=Y;
       PaintBox.Canvas.Pen.Mode:=pmNot;
       PaintBox.Canvas.Rectangle(XRectLeft,YRectUp,X,Y);
       XRectLast:=X;YRectLast:=Y;
       XRLeft:=XR;
       YRUp:=YR;
       PointNumberLeft:=PointNumber;
      end;
  end;
 PaintBox.Canvas.Pen.Mode:=OldMode;
 MousLabel.Caption:=FirstLine+#10+#13+SecondLine;
 UpPanel.Update;
end;

procedure TYX_Form.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
  VK_Divide:begin
          YPanelClick(nil);
          Koef_UvelClick(nil);
          Koef_ShowClick(nil);
          Koef_CloseClick(nil);
          end;
  VK_Multiply:begin
          YPanelClick(nil);
          Koef_UmenClick(nil);
          Koef_ShowClick(nil);
          Koef_CloseClick(nil);
          end;
  vk_Space:begin
              bStop:=true;
           end;
  end;
end;


procedure TYX_Form.N20Click(Sender: TObject);
var InpStr:string;
begin
 inpStr:=InputBox(Mes_Ini.ReadString('YX_form','s4','Задайте новый заголовок окна'),
   Mes_Ini.ReadString('YX_form','s5','Заголовок:'), Caption);
 if inpStr=Caption then exit;
 Caption:=inpStr;
 update;
 SelectViewQuery.RequestLive:=True;
 SelectViewQuery.Edit;
 SelectViewQueryView_Header.Value:=InpStr;
 SelectViewQuery.Post;
end;


procedure TYX_Form.N22Click(Sender: TObject);
var DelayStr:string;
begin
 DelayStr:=intToStr(DelayTime);
 DelayStr:=InputBox(Mes_Ini.ReadString('YX_form','s6','Задайте временную задержку для быстрого просмотра'),
    Mes_Ini.ReadString('YX_form','s7', 'Задержка просмотра(мс):'), DelayStr);
 try
  DelayTime:=strToInt(DelayStr);
  except
   on EConvertError do DelayTime:= 0;
  end;
end;

procedure TYX_Form.Button1Click(Sender: TObject);
var BookMark:TBookMark;
     Nomer:Longint;
     CurveWidth:word;
     CurveStil:word;
     cCurve:Longint;
begin
  Curve.Edit;Curve.RequestLive:=True;Curve.Post;
  BookMark:=Curve.GetBookmark;
  Curve.DisableControls;
  Try
    CurveWidth:=CurveCurveWidth.Value;
    CurveStil:=CurveStyle.Value;
    Curve.First;
    cPageCurve:=0;
    for CCurve:=0 to Curve.RecordCount-1 do
     begin
      Curve.Edit;Curve.RequestLive:=True;
      CurveCurveWidth.Value:=CurveWidth;
      CurveStyle.Value:=CurveStil;
      Curve.Post;
      Nomer:=CurveView_Signal_Nomer.Value;
      if CurveVisible.Value then inc(cPageCurve);
      Curve.Next;
      if Nomer=CurveView_Signal_Nomer.Value then break;
     end;
     NPageCurve:=cPageCurve;
    Finally
    Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
  end; {try}
   PaintBox.Visible:=True;
{   PaintBoxPaint(nil);}
{   PaintBox.Update;}
end;

procedure TYX_Form.N19Click(Sender: TObject);
begin
 MainForm.N4Click(nil);
end;


procedure TYX_Form.PaintBoxClick(Sender: TObject);
var
   Msg: TMsg;
   TargetTime: LongInt;
   CurveNum,cCurve:integer;
   Nomer:longint;
 begin
 { get the maximum time to wait for a double-click message }
   TargetTime := GetTickCount+GetDoubleClickTime;
 { cycle until DblClick received or wait time run out }
   while GetTickCount<TargetTime do
   if PeekMessage(Msg, Handle, WM_LBUTTONDBLCLK, WM_LBUTTONDBLCLK, PM_NOREMOVE)
 then   Exit; { Double clicked }
{   MessageDlg('Single clicked', mtInformation, [mbOK], 0);}
 if bRect then exit;
 if ((ScaleRb.ItemIndex = 2) or (ScaleRb.ItemIndex = 3)) then
  begin
   CurveNum:=trunc(NYCurve/paintBox.Height*YLastMouse)+1;
   Curve.DisableControls;
   Curve.First;
   cCurve:=0;
   while not Curve.EOF do
     begin
       if CurveViewPage.Value='Y' then inc(cCurve);
       if cCurve=CurveNum then break;
       Nomer:=CurveView_Signal_Nomer.Value;
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
    NPageCurve:=cPageCurve;
    Curve.EnableControls;
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
    UpdateMaxMinYLabel;
  end;
 end;


procedure TYX_Form.N28Click(Sender: TObject);
var bookMark:tBookMark;
begin
 Curve.Edit; CurveVisible.Value:=not CurveVisible.Value; Curve.Post;
 UpdateView(True,False);
end;

procedure TYX_Form.Button2Click(Sender: TObject);
begin
 if FonDialog.ColorDialog.Execute then
   begin
    Curve.Edit;CurveColor.Value:=FonDialog.ColorDialog.Color;Curve.RequestLive:=True;Curve.Post;
    PaintBox.Visible:=True;
    UpdateView(True,false);
   end;
end;

procedure TYX_Form.CurveColorGetText(Sender: TField;
  var Text:string; DisplayText: Boolean);
begin
 ShapeColor.Brush.Color:=CurveColor.value;
end;


procedure TYX_Form.MenuItem2Click(Sender: TObject);
begin
 OpenEksForm.DeleteQuery.SQL.Clear;
{ if sender = MenuItem3 then OpenEksForm.DeleteQuery.SQL.ADD(
  'Update Signals set Signal_selected = 0 where Signal_Nomer = '+IntToStr(Sig_TableSignal_Nomer.Value));
}
{ if sender = N9 then OpenEksForm.DeleteQuery.SQL.ADD(
  'Update Signals set Signal_selected = 1 where Signal_Nomer = '+IntToStr(sig_TableSignal_Nomer.Value));
 OpenEksForm.DeleteQuery.ExecSQL;
}end;


procedure TYX_Form.PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 CurveNum1,CurveNum2:longint;
begin
 if bRect then
  begin
   bOnMouseDown:=true;
{   if Shift = [ssCtrl] then
    begin
    if ScaleRb.ItemIndex = 2 then
           begin
            CurveNum1:=trunc(NPageCurve/paintBox.Height*YRectUp);
            CurveNum2:=trunc(NPageCurve/paintBox.Height*YRectLast);
            if CurveNum1>CurveNum2 then
             begin
              CurveNum2:=trunc(NPageCurve/paintBox.Height*YRectUp);
              CurveNum1:=trunc(NPageCurve/paintBox.Height*YRectLast);
             end;
           end else begin
                      CurveNum1:=0;
                      CurveNum2:=NPageCurve-1;
                    end;
     MousLabel.Caption:='Создание Zoom-образа';MousLabel.Update;
     Curve.DisableControls;
     InsertZoom(Self,CurveNum1,CurveNum2,false,PointNumber,PointNumberLeft);
     Curve.EnableControls;
     MousLabel.Caption:=' ';MousLabel.Update;
    end;
}   bRect:=False;
 end
end;

procedure TYX_Form.PaintBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if bOnMouseDown then
 begin
   OldMode:=PaintBox.Canvas.Pen.Mode;
   PaintBox.Canvas.Pen.Mode:=pmNot;
   PaintBox.Canvas.Brush.style:=bsClear;
   PaintBox.Canvas.Rectangle(XRectLeft,YRectUp,XRectLast,YRectLast);
   PaintBox.Canvas.Pen.Mode:=OldMode;
   bOnMouseDown:=false;
 end
end;

procedure TYX_Form.GetCurveParam;
 var Status:integer;
     MinX,MaxX,MinY,MaxY:Real;
     MaxXAll,MinXAll,MinYAll,MaxYAll:real;
     i1,i2:longint;
     BookMark:TBookMark;
     cCurve:word;
     Nomer:longint;
    Procedure GetMaxMinYCurve;
    begin
      if  (CurvebViewMaxMinY.Value <> True )then
       begin    {определение мах мин по оси Y }
        if Curve.State<>dsEdit then Curve.Edit;
        GetMaxMinY(0,SigTabRec.PointAll-1,MinY,MaxY,i1,i2,Status,SigTabRec);
        CurveViewMinY.Value:=MinY; CurveViewMaxY.Value:=MaxY;
        CurvebViewMaxMinY.Value:=True;
       end;
    end;

begin
if  bSetCurveParam then exit;
if  (CurvebViewMaxMinX.Value <> True )then
 begin    {определение мах мин по оси X }
  GetMaxMinX(CurvePointStart.Value,CurvePointEnd.Value,MinXAll,MaxXAll,Status,SigTabRec);
  BookMark:=Curve.GetBookmark;
  Curve.DisableControls;
  Curve.First;
  for CCurve:=0 to Curve.RecordCount-1 do
     begin
      GetMaxMinX(CurvePointStart.Value,CurvePointEnd.Value,MinX,MaxX,Status,SigTabRec);
      if MinXAll>MinX then MinXAll:=MinX;
      if MaxXAll<MaxX then MaxXAll:=MaxX;
      Nomer:=CurveView_Signal_Nomer.Value;
      Curve.Next;
      if Nomer=CurveView_Signal_Nomer.Value then break;
    end;
  Try
       Curve.First;
       cPageCurve:=0;
       for CCurve:=0 to Curve.RecordCount-1 do
        begin
         Curve.Edit;Curve.RequestLive:=True;
         CurveViewMinX.Value:=MinXAll;
         CurveViewMaxX.Value:=MaxXAll;
         CurvebViewMaxMinX.Value:=true;
         Curve.Post;
         Nomer:=CurveView_Signal_Nomer.Value;
         if CurveVisible.Value then inc(cPageCurve);
         Curve.Next;
         if Nomer=CurveView_Signal_Nomer.Value then break;
        end;
        NPageCurve:=cPageCurve;
       Finally
          Curve.GotoBookMark(BookMark);  Curve.FreeBookMark(BookMark);
          SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
  end {try};
 end; {X}
 CASE ScaleRB.ItemIndex OF
 1:         {индивидуальный масштаб}
  begin
   GetMaxMinYCurve;
   Curve.Edit;Curve.RequestLive:=True;
   Curve.Post;
   BookMark:=Curve.GetBookmark;
   Curve.DisableControls;
   Try
     Curve.First;
     cPageCurve:=0;
     for CCurve:=0 to Curve.RecordCount-1 do
      begin
       Curve.Edit;Curve.RequestLive:=True;
       CurveScaleStyle.Value:=ScaleRb.ItemIndex;
       Curve.Post;
       Nomer:=CurveView_Signal_Nomer.Value;
       if CurveVisible.Value then inc(cPageCurve);
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
      NPageCurve:=cPageCurve;
     Finally
        Curve.GotoBookMark(BookMark);
        Curve.EnableControls;  Curve.FreeBookMark(BookMark);
        SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
     end;
  end;
  0,2,3:begin             {общий масштаб}
     BookMark:=Curve.GetBookmark;
{     Curve.DisableControls;}
     Try
      Curve.First;
      cPageCurve:=0;
      MaxYAll:=CurveViewMaxY.Value;   MinYAll:=CurveViewMinY.Value;
      for CCurve:=0 to Curve.RecordCount-1 do
      begin
       if  (CurvebViewMaxMinY.Value <> True )then
          begin    {определение мах мин по оси Y }
           Curve.Edit;Curve.RequestLive:=True;
           SigtabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
           GetMaxMinY(0,SigTabRec.PointAll-1,MinY,MaxY,i1,i2,Status,SigTabRec);
           CurveViewMinY.Value:=MinY; CurveViewMaxY.Value:=MaxY;
           CurvebViewMaxMinY.Value:=True;
           Curve.Post;
          end;
       if MaxYAll<CurveViewMaxY.Value then  MaxYAll:=CurveViewMaxY.Value;
       if MinYAll>CurveViewMinY.Value then MinYAll:=CurveViewMinY.Value;
       Nomer:=CurveView_Signal_Nomer.Value;
       if CurveVisible.Value then inc(cPageCurve);
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
      NPageCurve:=cPageCurve;
      Curve.First;
      for CCurve:=0 to Curve.RecordCount-1 do
      begin
       Curve.Edit;Curve.RequestLive:=True;
       CurveScaleStyle.Value:=ScaleRb.ItemIndex;
       CurveViewMinYAll.Value:=MinYAll; CurveViewMaxYAll.Value:=MaxYAll;
       Curve.Post;
       Nomer:=CurveView_Signal_Nomer.Value;
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
     Finally
        Curve.GotoBookMark(BookMark);
        Curve.EnableControls;  Curve.FreeBookMark(BookMark);
        SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
     end;
    end;
   END; {case}
  bSetCurveParam:=True;
end;

procedure TYX_Form.DBGrid1Exit(Sender: TObject);
begin
 if Curve.state <> dsEdit then Curve.Edit;
 Curve.Post;
end;

procedure TYX_Form.YX_NBChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
var
 Nomer:longint;
 bX_OK,bY_Ok:boolean;
begin
 bStop:=true;
 AllowChange:=true;
 if NewTab=0 then
 begin
{  LabelNameX.Left:=XPanel.Width-LabelNameX.Width;
  LabelNameX.Top:=XPanel.Height-LabelNameX.Height;}
  MinYLabel.Top:=PaintBox.Height-MinYLabel.Height;
  bX_OK:=false;bY_Ok:=false;
  Curve.DisableControls;
  Nomer:=CurveView_Signal_Nomer.Value;
  Curve.First;
  NYCurve:=0;
  while not Curve.EOF do
   begin
    if CurveViewPage.Value='X' then bX_OK:=true;
    if CurveViewPage.Value='Y' then begin bY_OK:=true;inc(NYCurve);end;
    Curve.Next;
   end;
  Curve.First;
  while not Curve.EOF do
   begin
    if CurveView_Signal_Nomer.Value=Nomer then break;
    Curve.Next;
   end;
  Curve.EnableControls;
  AllowChange:=bx_OK and bY_OK;
  if not AllowChange then
   MessageDlg(Mes_Ini.ReadString('YX_form','s8','Неправильно введена пометка каналов'),mtWarning,[mbOK], 0);
  bNeedCreatePoly:=AllowChange;
 end;

end;

procedure TYX_Form.Set_XClick(Sender: TObject);
var
 Nomer:longint;
begin
Curve.DisableControls;
Nomer:=CurveView_Signal_Nomer.Value;
Curve.First;
while not Curve.EOF do
 begin
  if CurveViewPage.Value='X' then
   begin
    Curve.Edit;
    CurveViewPage.Value:='';
    Curve.Post;
   end;
  if CurveView_Signal_Nomer.Value=Nomer then
   begin
    Curve.Edit;
    CurveViewPage.Value:='X';
    Curve.Post;
   end;
  Curve.Next;
 end;
Curve.First;
while not Curve.EOF do
 begin
  if CurveView_Signal_Nomer.Value=Nomer then break;
  Curve.Next;
 end;
Curve.EnableControls;
end;

procedure TYX_Form.Set_YClick(Sender: TObject);
var
 Nomer:longint;
begin
Curve.DisableControls;
Nomer:=CurveView_Signal_Nomer.Value;
Curve.First;
while not Curve.EOF do
 begin
  if CurveView_Signal_Nomer.Value=Nomer then
   begin
    Curve.Edit;
    CurveViewPage.Value:='Y';
    Curve.Post;
   end;
  Curve.Next;
 end;
Curve.First;
while not Curve.EOF do
 begin
  if CurveView_Signal_Nomer.Value=Nomer then break;
  Curve.Next;
 end;
Curve.EnableControls;
end;

procedure TYX_Form.Button3Click(Sender: TObject);
var
 Nomer:longint;
begin
Curve.DisableControls;
Nomer:=CurveView_Signal_Nomer.Value;
Curve.First;
while not Curve.EOF do
 begin
  if CurveView_Signal_Nomer.Value=Nomer then
   begin
    Curve.Edit;
    CurveViewPage.Value:='';
    Curve.Post;
   end;
  Curve.Next;
 end;
Curve.First;
while not Curve.EOF do
 begin
  if CurveView_Signal_Nomer.Value=Nomer then break;
  Curve.Next;
 end;
Curve.EnableControls;
end;

procedure TYX_Form.Slider_tChange(Sender: TObject);
var XR:real;        XStr:string;                qq:string;
   BookMark:TBookMark;
   cCurve:longint;  Nomer:Longint;
begin
 XR:=CurveViewMinX.Value+(Slider_T.Value-Slider_T.MinValue)*SigTabRec.DeltX;
 Sig_TablenameXGetText(nil,qq,true);
 if qq[1]<>'t' then XStr:=qq+'=';
 if qq='t,s' then XStr:='t,s=';
 if qq='t,min' then begin XR:=XR/60;XStr:='t,min=';end;
 if qq='t,hour' then begin XR:=XR/3600; XStr:='t,hour=';end;
 if qq='t' then
    begin
     XR:=SigTabRec.DateTimeStart+(XR)/24/3600;
     XStr:='t='+DateTimeToStr(XR);
    end
     else XStr:=XStr+floatToStrF(XR,ffNumber,FormatAll+3,FormatAfterPoint+2);
// Slider_T.Caption:=XStr+Mes_Ini.ReadString('YX_form','s9','   Отсчет № ' )+IntToStr(Slider_T.Value);
 if pPolyX<>nil then
  begin
    BookMark:=Curve.GetBookmark;
    Curve.DisableControls;
    Try
     Curve.First;
     cPageCurve:=0;
     for CCurve:=0 to Curve.RecordCount-1 do
     begin
      if CurveViewpage.Value='Y' then
       begin
        if OldSliderPoint>=0 then
         begin
         ShowPoint(PaintBox.Canvas,PaintBox.Width,PaintBox.Height,OldSliderPoint,pmNot);
         if (Traektory.Checked and (not bStop)) then
          begin
           PaintBox.Canvas.Pen.Color:=CurveColor.Value;
           PaintBox.Canvas.Pen.Width:=1;
           PaintBox.Canvas.Pen.Mode:=pmCopy;
{$R-}
           PaintBox.Canvas.MoveTo(pPolyX^[OldSliderPoint-Slider_T.MinValue],
                                  pPolyY_Showpoint^[OldSliderPoint-Slider_T.MinValue]);
           PaintBox.Canvas.LineTo(pPolyX^[Slider_T.Value-Slider_T.MinValue],
                                  pPolyY_Showpoint^[Slider_T.Value-Slider_T.MinValue]);
{R+}
          end;
         ShowPoint(PaintBox.Canvas,PaintBox.Width,PaintBox.Height,Slider_T.Value,pmNot);
         end
          else
           begin
            ShowPoint(PaintBox.Canvas,PaintBox.Width,PaintBox.Height,Slider_T.Value,pmNot);
           end;
       end;
      Nomer:=CurveView_Signal_Nomer.Value;
      if CurveVisible.Value then inc(cPageCurve);
      Curve.Next;
      if Nomer=CurveView_Signal_Nomer.Value then break;
     end;
      Finally
       Curve.GotoBookMark(BookMark);Curve.EnableControls;Curve.FreeBookMark(BookMark);
       SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
    end;
  end;
 OldSliderPoint:=Slider_T.Value;
end;

Procedure TYX_Form.ShowPoint(DrawCanvas:TCanvas;Width,Height:word;PointN:longint;pmMode:TPenMode);
label M2;
var
    pPolyY:pPolyArr;
    NPolyPoint:word;
    FileIMage:TBufferedFile;
    i:longint;
    WidthEllipse:shortInt;
    Smesh:integer;

begin
{$R-}
 if CurveVisible.Value=true then
   begin
   if CurvebPolyCreate.Value = True then
    begin   {Загрузка PolyY}
     NPolyPoint:=CurvePolyPoint.Value;
     if ((NPolyPoint=0) or
           (CurvepPolyY.Value = 0)) then
      begin
       FileIMage:=TBufferedFile.Create(CurvePolyFile.Value,4096);
       FileImage.Reset;
       NPolyPoint:=FileImage.FileSize div (SizeOf(Word));
       GetMem(pPolyY,NPolyPoint*SizeOf(Word)+Zapas);
       FileImage.Read(pPolyY^,NPolyPoint*SizeOf(Word),BytesRead);
       FileImage.Close;
       FileImage.Destroy;
       Curve.RequestLive:=True;Curve.Edit;
       CurvePolyPoint.Value:=NPolyPoint;
       CurvepPolyY.Value:=longint(pPolyY);
       Curve.Post;
      end
       else
        begin
         pPolyY:=pPolyArr(CurvepPolyY.Value);
        end;
     pPolyY_ShowPoint:=pPolyY;
     DrawCanvas.Pen.Color:=CurveColor.Value;
     DrawCanvas.Pen.Style:=psSolid;
     DrawCanvas.Pen.Width:=CurveCurveWidth.Value*2;
     OldMode:=DrawCanvas.Pen.Mode;
     DrawCanvas.Pen.Mode:=pmMODE;
     try
      DrawCanvas.MoveTo(ppolyX^[PointN-Slider_T.MinValue]-CurveCurveWidth.Value*3,
                      ppolyY^[PointN-Slider_T.MinValue]-CurveCurveWidth.Value*3);
      DrawCanvas.LineTo(ppolyX^[PointN-Slider_T.MinValue]+CurveCurveWidth.Value*3,
                      ppolyY^[PointN-Slider_T.MinValue]+CurveCurveWidth.Value*3);
      DrawCanvas.MoveTo(ppolyX^[PointN-Slider_T.MinValue]+CurveCurveWidth.Value*3,
                      ppolyY^[PointN-Slider_T.MinValue]-CurveCurveWidth.Value*3);
      DrawCanvas.LineTo(ppolyX^[PointN-Slider_T.MinValue]-CurveCurveWidth.Value*3,
                      ppolyY^[PointN-Slider_T.MinValue]+CurveCurveWidth.Value*3);
     Finally
       DrawCanvas.Pen.Mode:=OldMode;
     end;
     WidthEllipse:=DrawCanvas.Pen.Width div 2;
     if WidthEllipse=0 then WidthEllipse:=1;
  end;
 end;
{$R+}
end;


procedure TYX_Form.N3Click(Sender: TObject);
var i:longint;
begin
{ Slider_T.Value:=Slider_T.MinValue;}
if not bStop then
 begin
  Bstop:=true;
  Button4.caption:=Mes_Ini.ReadString('YX_form','s10','Оживить изображение');
  Button4.Update;
  exit;
 end;
 if Traektory.Checked then
  begin
   PaintBox.Canvas.Brush.style:=bsSolid;
   PaintBox.Canvas.Pen.Color:=CurveColorFon.Value;
   PaintBox.Canvas.Brush.Color:=CurveColorFon.Value;
   PaintBox.Canvas.FillRect(Rect(0,0,PaintBox.Width,PaintBox.Height));
  end;
 bStop:=false;
 Button4.caption:=Mes_Ini.ReadString('YX_form','s11','Стоп');
 Button4.Update;
 for i:=Slider_T.Value to Slider_T.MaxValue do
  begin
   Slider_T.Value:=i;
   if DelayTime>0 then delay(DelayTime);
   Application.ProcessMessages;
   if bStop then break;
  end;
 bStop:=true;
 Button4.caption:=Mes_Ini.ReadString('YX_form','s10','Оживить изображение');
 Button4.Update;
end;

procedure TYX_Form.N4Click(Sender: TObject);
var DelayStr:string;
begin
 DelayStr:=intToStr(DelayTime);
 DelayStr:=InputBox(Mes_Ini.ReadString('YX_form','s12','Задайте временную задержку для движения точки'),
   Mes_Ini.ReadString('YX_form','s13', 'Задержка просмотра(мс):'), DelayStr);
 try
  DelayTime:=strToInt(DelayStr);
  except
   on EConvertError do DelayTime:= 0;
  end;

end;

procedure TYX_Form.TraektoryClick(Sender: TObject);
begin
 Traektory.Checked:=not Traektory.Checked;
end;

procedure TYX_Form.CheckBox1Click(Sender: TObject);
begin
 Traektory.Checked:=CheckBox1.Checked;
end;

procedure TYX_Form.N9Click(Sender: TObject);
begin
   PaintBox.Canvas.Brush.style:=bsSolid;
   PaintBox.Canvas.Pen.Color:=CurveColorFon.Value;
   PaintBox.Canvas.Brush.Color:=CurveColorFon.Value;
   PaintBox.Canvas.FillRect(Rect(0,0,PaintBox.Width,PaintBox.Height));
end;

procedure TYX_Form.ScaleButtonClick(Sender: TObject);
begin
 Scale_Help_Form.ImForm:=nil;
 Scale_Help_Form.YXForm:=self;
 Scale_Help_Form.ShowModal;
end;

procedure TYX_Form.NPEClick(Sender: TObject);
begin
 SCaleMenuClick_YX(self,sender);
end;

procedure TYX_Form.PopupMenu_ScalePopup(Sender: TObject);
begin
 NE.Checked:=false;
 NI.Checked:=false;
 NPI.Checked:=false;
 NPE.Checked:=false;
 case ScaleRB.Itemindex of
  0:NE.Checked:=True;
  1:NI.Checked:=True;
  2:NPI.Checked:=True;
  3:NPE.Checked:=True;
 end;

end;

end.


