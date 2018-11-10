unit IMAGE_u;

interface

uses sysutils,WinTypes, WinProcs, Classes, Graphics, Messages,Forms, Controls, StdCtrls, Tabs,
  Dialogs,
  Buttons,  DBCtrls, DBTables, DB, Mask, Grids, DBGrids,
  FileBuff,
  tvc_U, DBLookup, Menus,
  Obzordlg,obzorka,
  Gauges,
  Movepane,
  printers, Spin,  ExtCtrls, TabNotBk, ComCtrls, RXSlider, IBCustomDataSet,
  IBQuery, IBTable, DBCtrlsEh, DBLookupEh, shellapi, common_f
{  ProcessF};

type

  TCursorLabel = class (TLabel)
    public
     pCursRec:Pointer;
    end;

  TCursorShape = class (TShape)
    public
     pCursRec:Pointer;
    end;

  TCursorRec = record
     id_Cursor_InCursorTable:longint;
     Cursor_Num:word;
     PointNum:longint;
     XStr:string[30];
     MemoStr:string[255];
     bXStr:boolean;
     bMemo:boolean;
     CursLabel:TCursorLabel;
     CursShape:tCursorShape;
   end;

  TImageForm = class(TCommonForm)
    TabSet: TTabSet;
    CurveDataSource: TDataSource;
    Sig_DataSource: TDataSource;
    GroupBox: TPanel;
    XPanel: TPanel;
    ViewMaxXDB: TDBText;
    ViewMinXDB: TDBText;
    XFon: TPanel;
    LeftXButton: TSpeedButton;
    XActive: TShape;
    RightXButton: TSpeedButton;
    UpPanel: TPanel;
    ViewPageDataSource: TDataSource;
    StylesDataSource: TDataSource;
    N310: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    X1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N3: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    FonPanel: TPanel;
    PaintBox: TPaintBox;
    MousLabel: TLabel;
    labelNameX: TLabel;
    Panel1: TPanel;
    Label9: TLabel;
    NameCurveShort: TDBEdit;
    DBNavigator1: TDBNavigator;
    ScaleRB: TRadioGroup;
    N20: TMenuItem;
    N21: TMenuItem;
    MultBox: TMovingPanel;
    Label2: TLabel;
    MultEdit: TEdit;
    Koef_Uvel: TBitBtn;
    Koef_Umen: TBitBtn;
    KoeffAllCheckBox: TCheckBox;
    Koef_Show: TBitBtn;
    Koef_Close: TBitBtn;
    MultRB: TRadioGroup;
    Label10: TLabel;
    ChanalBox: TMovingPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBCheckBox1: TDBCheckBox;
    CurveHeaderShort: TDBEdit;
    CurveHeader: TDBEdit;
    Label23: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    CurveLineWidth: TDBEdit;
    Label11: TLabel;
    ProcBox: TMovingPanel;
    ProcShowButton: TBitBtn;
    ProcClose: TBitBtn;
    Label12: TLabel;
    N22: TMenuItem;
    Bevel1: TBevel;
    Button1: TButton;
    N19: TMenuItem;
    XCursorTime: TLabel;
    CursorMenu: TPopupMenu;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    Panel_Povorot: TPanel;
    NewAlfa: TSpinEdit;
    Label6: TLabel;
    Povorot_Button: TButton;
    N28: TMenuItem;
    Button2: TButton;
    ShapeColor: TShape;
{    DBText2: TDBText;}
    ImageMemo: TDBMemo;
    DataSource1: TDataSource;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    DataSourceCurveSet: TDataSource;
    LabelForHint: TLabel;
    SliderS: TRxSlider;
    TabbedNotebook1: TTabbedNotebook;
    Label1: TLabel;
    ProcEdit: TEdit;
    ProcUvel: TBitBtn;
    ProcUmen: TBitBtn;
    ProcRB: TRadioGroup;
    Label7: TLabel;
    Label8: TLabel;
    XMaxEdit: TEdit;
    XMinEdit: TEdit;
    SaveAsEksp: TMenuItem;
    YX_menuItem: TMenuItem;
    N4: TMenuItem;
    ScaleX_Panel: TMovingPanel;
    ScaleX_Shape: TShape;
    ScaleX_Item: TMenuItem;
    DragShape: TShape;
    ScaleX_Label: TEdit;
    MinYLabel: TLabel;
    MaxYLabel: TLabel;
    PopupMenu_Scale: TPopupMenu;
    NE: TMenuItem;
    NI: TMenuItem;
    NPI: TMenuItem;
    NPE: TMenuItem;
    ScaleButton: TBitBtn;
    Check_Dopusk: TMenuItem;
    Grid_X: TMenuItem;
    Grid_Y: TMenuItem;
    ViewPage: TIBQuery;
    ViewPageVIEWPAGE: TIBStringField;
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
    Stylestable: TIBTable;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    ChanalBoxOK: TBitBtn;
    BitBtn5: TBitBtn;
    PB: TProgressBar;
    CurveDELTX: TFloatField;
    CurveVIEWPAGE: TIBStringField;
    N9: TMenuItem;
    PaintBox1: TPaintBox;
    Sig_TableDATETIMESTART: TFloatField;
    Sig_TableFiledat_ABS: TStringField;
    Sig_TableFILEDAT: TIBStringField;
{    sliderS: TTrackBar;}
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RightXButtonClick(Sender: TObject);
    procedure LeftXButtonClick(Sender: TObject);
    procedure XActiveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure XActiveMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure XActiveMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormActivate(Sender: TObject);
(*    procedure ZoomProcChange(Sender: TObject);
    procedure ZoomProcError(Sender: TObject; ErrorCode: Word; ErrorMsg: String);
*)    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSetClick(Sender: TObject);
{    procedure TableOrGraphClick(Sender: TObject);}
(*    procedure RezTableGetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer);
*)    procedure PaintBoxPaint(Sender: TObject);
    procedure ChanalBoxOKClick(Sender: TObject);
    procedure NameCurveShortClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure CurveCurveHeaderShortGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ScaleRBClick(Sender: TObject);
    procedure SliderSMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftShowClick(Sender: TObject);
    procedure RightShowClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure YPanelClick(Sender: TObject);
    procedure Koef_CloseClick(Sender: TObject);
    procedure ObzorkaButtonClick(Sender: TObject);
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
    procedure ShowProcBox(Sender: TObject);
    procedure Proc_CloseClick(Sender: TObject);
    procedure Proc_ShowClick(Sender: TObject);
    procedure Proc_UvelClick(Sender: TObject);
    procedure Proc_UmenClick(Sender: TObject);
    procedure Call_ProcClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    Procedure DeleteCurve;
    Procedure DeleteCurveFiles;
    procedure BitBtn2Click(Sender: TObject);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LeftXButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RightXButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure XFonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N22Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    Procedure HideOldCursor;
    procedure PaintBoxClick(Sender: TObject);
    procedure PaintBoxDblClick(Sender: TObject);
    Procedure CloseCursorsList;
    procedure N23Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure PaintBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure PaintBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure CursorMenuPopup(Sender: TObject);
    procedure AudioItemClick(Sender: TObject);
    procedure Povorot_ButtonClick(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure SliderSChange(Sender: TObject);
    procedure PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure XMinEditExit(Sender: TObject);
    procedure XMaxEditExit(Sender: TObject);
    procedure SaveAsEkspClick(Sender: TObject);
    procedure YX_menuItemClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure TabSetMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ScaleX_ItemClick(Sender: TObject);
    procedure ScaleX_LabelClick(Sender: TObject);
    procedure ScaleX_LabelExit(Sender: TObject);
    procedure Scale_menuItemClick(Sender: TObject);
    procedure NPEClick(Sender: TObject);
    procedure Check_DopuskClick(Sender: TObject);
    procedure Grid_YClick(Sender: TObject);
    procedure Grid_XClick(Sender: TObject);
    procedure PopupMenu_ScalePopup(Sender: TObject);
    procedure CurveAfterPost(DataSet: TDataSet);
    procedure SelectViewQueryAfterPost(DataSet: TDataSet);
    procedure CurveAfterOpen(DataSet: TDataSet);
    procedure N9Click(Sender: TObject);
    procedure Sig_TableCalcFields(DataSet: TDataSet);
    Public
        bOborotNul:boolean;
        bOnlyStart,bView:boolean;
        SigTabRec:TSigTabRec;
        SigTabRecGrad,SigTabRecOborot:TSigTabRec;
        bImageAvailable:boolean;
        ViewNumber:longint;
        bOldCursor:boolean;
        CursorsList:TList;
        NAllCurveInPage:integer;
        NPageCurve,OldPageCurve,cPageCurve:integer;
//      RightPoint,LeftPoint:longint;
        RightX,LeftX:double;
        bLeftShow,bRightShow:boolean;
        bNeedCreatepoly:boolean;
        LastObzForm:tObzorkaForm;
        YRectUp,YRectLast:integer;
        bSetCurveParam:boolean;
        RealXDimension:string[5];
        RealRazmahX:real;
        CurveNum1,CurveNum2:longint;
        bOnMouseDown:boolean;
        Status:integer;
    OldMode:TPenMode;
    XOld:integer{word};
    YLastMouse:integer;
    bRect:boolean;
    XRectLeft,XRectLast:integer;
    XRLeft,YRUp:real;
    TextXOld,TextYOld:string[20];
    TextMinX,TextMaxX:string[20];
    ScaleStyle:integer;
    bCreateOver:boolean;
    CursorRec:TCursorRec;
   procedure CreatePoly(Width,Height,LeftM,UpM:Word);
   Procedure ShowCurve(DrawCanvas:TCanvas;Width,Height:word);
   Procedure DrawCursor(CursorRec:TCursorRec;bWithLabel:boolean;Width:word);
   Procedure Obnovlenie_Image(NewtabInd:longint);
   Procedure UpdateCurvePointStartEnd;
{   procedure GetCurveParam;}
   Procedure SetXActive;
   Procedure getCursorParam(X:integer;Var XStr:string;var XR:double);
   Procedure AppendInCursChan(IdCursor:Longint;CursNum:integer);
   procedure DivideOnDeltX;

  private
    { Private declarations }
    DelayTime:longint;
    FlagMove:boolean;
    XMouse:Integer;
    Delt:longint;
    BookMarkArr:array[0..cMaxViewPage-1] of TBookMark;
    File_Dat:TBufferedFile;
//    FileDat:TFileStream;
    CellData:string;
    FirstResize:boolean;
    PaintWidth,PaintHeight:integer;
    Proc,Mult:Real;
    WhatDo:word;
    MinNastr,MaxNastr:real;
    Grad:real;Oborot:real;
    HtmlFileName,SpectrImagefilename,SIgnalImagefilename:string;
    {    }
    procedure UpdateMaxMinYLabel;
    Procedure UpdateSliderS;
    Procedure OpenSignalArr;
    Procedure CloseSignalArr;
   procedure ProcessingCursorForm(bWithGetLastN:boolean);
    {Обработка сообщений}
   procedure wmSetStartPoint ( var Message:TMessage ); message wm_setStartPoint;
   procedure wmGridXY ( var Message:TMessage ); message wm_setFon;
   procedure wmEndProcessin( var Message:TMessage ); message wm_EndProcessing;
   procedure wmEXPORT( var Message:TMessage ); message wm_EXPORT;
   procedure wmSetCursorsList( var Message:TMessage ); message wm_SetCursorsList;
   procedure wmAddCursorsList( var Message:TMessage ); message wm_AddCursorsList;
   procedure wmDeleteCursor( var Message:TMessage ); message wm_DeleteCursor;
   procedure wmShowCursor( var Message:TMessage ); message wm_ShowCursor;
   procedure wmSetCursorFromObzorka( var Message:TMessage ); message wm_SetCursorFromObzorka;
   procedure wmSetCursorFromAudio( var Message:TMessage ); message wm_SetCursorFromAudio;
   procedure wmNextChan_FromAudio( var Message:TMessage ); message wm_NextChan_FromAudio;
   procedure wmPrevChan_FromAudio( var Message:TMessage ); message wm_PrevChan_FromAudio;
   procedure wmDelCursorFromObzorka( var Message:TMessage ); message wm_DelCursorFromObzorka;


  public
    { Public declarations }
    ImageID:TDateTime;
    XOldStr:shortstring;
    PointNumber,PointNumberLeft:longint;
    bExport,bStopExport:boolean;
    bNotClose:boolean;

   procedure SetFon ( color:TColor);

    Procedure UpdateView(bRepaint:boolean;bRecalc:boolean);
procedure SetCursorFromAudio(ImForm:TForm;bRepaint:boolean);
procedure EXportSigToFile( ImForm:TForm ; bWithoutExportForm:boolean );
procedure Make_Povorot(ImForm:TForm);
Procedure InsertRez(ReturnRec:TReturnRec;Nomer_View:longint;bInsertCurve:boolean;
                     Eksp_ProcValue:longint;CrossWin_NewEksp:word);
Procedure InserCurve(ImForm:TForm;bShow:boolean);
Procedure CreateObzorka(ImForm:TForm);
procedure InsertZoom(ImForm:TForm;ImForm_Dest:TForm;CurveN1,CurveN2:longint;
                     bY_X:boolean;PRight,PLeft:longint;bAltZoom:boolean;
                     bDropAltZoom:boolean;
                     CurveSetNum:longint);

procedure GetCurveParam(ImForm:TForm);
//procedure PacketEXportSigToFile( PackForm:TForm ;Fname:shortstring );
procedure CallProcessing(Sender: TObject;var CrossWin_Rec:TCrossWin_rec);
procedure CallStyleForm(ImForm:TForm);
Procedure UpdatePointStartEnd(ImForm:TForm);
procedure PaintBox_MouseMove(ImForm:TForm;Sender: TObject; Shift: TShiftState;
     X, Y: Integer);
procedure DrawAxisY(Paintbox:TPaintBox;H1,H2:word;CurveColor,FonColor:TColor;Max,min:real;
                    PaintBox_G:TPaintBox;bGridY:boolean);
procedure DrawGridY(H1,H2:word;Max,min:real;PaintBox_G:TCanvas{PaintBox};LP,Wdth:word);
procedure GetCurveMaxMinY(ImForm:TForm;var MaxY,MinY:real);
procedure Save_As_Eksp(ImForm:TForm;Sender: TObject);
procedure ScalemenuClick(ImForm:TForm;Sender: TObject);
procedure ScalemenuClick_YX(ImForm:TForm;Sender: TObject);
Procedure DragDrop_in_Image(ImForm:TForm;Sender,Source:TObject;x,y:integer;FonColor:TColor);

procedure FindSignal(Sender: TObject);

  end;

var
  ImageForm: TImageForm;

implementation
 uses
Mdrv,

GetGWRez,
 //FuncProc,
 //FonDLG,
//      Open_eks,
PageName,
 //rez_dlg,
   export_f,
//cursors,
audio_u,
//PrintSig,
//preview,
  //    Packet
  {,save_New}{,setstyle}
   Main_f,
 Scale_h, 
  //level_f,
  //check_db,
  //checkKey
   Exp_f, DM_dm, Save_new, Cursors,
   Setstyle,
   config, Formtext,
  Dialog_GetParam;

{$R *.DFM}


procedure ParamInfo(
         Complexity:pchar;   // Сложность записи Comp
         Amplituda:pchar;   // Амплитуда сигнала А
         Steepness:pchar;   // Крутизна спада спектра P-волны
         FHigh_07_Hz:pchar; // Верхняя частота спектра (на уровне 0,7) fв, Гц
          Flow_07_Hz:pchar;  // Нижняя частота спектра (на уровне 0,7) fн,Гц
         Fmax_P_Hz:pchar;   // Частота максимума спектра на участке P-волны Fmax,Гц
         ImageSpectr:pchar; // имя файла с картинкой рассчитанных спектров
         ImageSource:pchar; // имя файла с картинкой исходного сигнала
          T_Ist: pchar;      // время источника сигнала
          a3:pchar;
         a2:pchar;
        a1:pchar);
{       NPointsFFT:integer;   // Количество отсчетов в спектре
        DirectoryName:string;// имя каталога, в котором сохранены файлы
        FileDatDest_Signal:string;// имя файла (File of single) со спектром исходного сигнала (одного сигнала
        FileDatDest_Noise:string; // имя файла (File of single)со спектром   шума
        FileDatDest_Signal_Noise:string}  // имя файла (File of single) со спектром разности сигнал-шум

           cdecl;      external 'ParamInfo_dll' ;

procedure TImageForm.FormCreate(Sender: TObject);
var i:word;
begin
//  Get_Lang_Par({Lang_2_Ini,}self,'Image');
  stylestable.close;
  stylestable.open;
  TabbedNoteBook1.PageIndex:=0;
  sliders.align:=alRight;
  bView:=false;bExport:=false; bStopExport:=false; bRect:=false;
  DelayTime:=0;
  bNeedCreatepoly:=true;
  ImageId:=Time;
  bSetCurveParam:=false;
  OldPageCurve:=-1;
  bCreateOver:=False;
  ViewNumber:=ViewNum;
//  SelectViewQuery.SQL.ADD('Select * from CurveSet where View_Nomer = ' +   intToStr ( ViewNumber));
  SelectViewQuery.close;
  SelectViewQuery.parambyname('View_Nomer').asinteger:=ViewNum;
  SelectViewQuery.Open;
  bOnlystart:=true;
  Obnovlenie_Image(0);
  bOnlystart:=false;
  bImageAvailable:=True;
  Caption:=SelectViewQueryView_Header.Value;
  Top:=selectViewQueryUp.Value;
  Left:=selectViewQueryLeft_.Value;
  Width:=selectViewQueryWidth.Value;
  Height:=selectViewQueryHeight.Value;
  PaintBox.Align:=alClient;
//LeftPoint:=CurvePointStart.Value; RightPoint:=CurvePointEnd.Value;
  LeftX:=CurvePointStart.Value*CurveDeltX.asfloat;
  RightX:=CurvePointEnd.Value*CurveDeltX.asfloat;
  bCreateOver:=True;
  PaintWidth:=PaintBox.Width;
  PaintHeight:=PaintBox.Height;
//  case  ScaleRb.ItemIndex of
//  0:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton1.Glyph;
//  1:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton2.Glyph;
//  2:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton3.Glyph;
//  3:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton4.Glyph;
// end;
 ScaleButton.NumGlyphs:=1;
{ Check_Dopusk.Visible:=GemisWin_Version<>0;}
 SaveAsEksp.Enabled:=true;//GemisWin_Version<>0;
 SaveAsEksp.Enabled:=true;//GemisWin_Version<>0;
{ ScaleButton.Update;}
{      OpenEksForm.CurveTableColorFon.Value:=FonDialog.FonColor.Brush.Color;}
{ Save_Lang_Par(Lang_2_Ini,self,'ImageForm');}
  inherited;
end;

Procedure TImageForm.Obnovlenie_Image(NewtabInd:longint);
var i:word;
begin
  ViewPage.Close; Curve.Close;
  ViewPage.SQL.Clear;
  ViewPage.SQL.ADD('Select distinct ViewPage  from Curve where View_Nomer = ' +   intToStr ( ViewNumber));
  ViewPage.Open;
  TabSet.Tabs.Clear;     {заполнение TabSet}
  i:=0;
  while not ViewPage.EOF do
   begin
    TabSet.Tabs.Add(ViewPageViewPage.Value);
    BookMarkArr[i]:=ViewPage.GetBookMark;
    ViewPage.Next;
    inc(i);
   end;
  ViewPage.First;
  Curve.close;
  Curve.ParamByName('View_Nomer').asinteger:=ViewNumber ;
  Curve.ParamByName('ViewPage').asstring:=ViewPage.fieldbyname('ViewPage').asstring ;
//  Curve.SQL.Clear;
//  Curve.SQL.ADD('Select * from Curve where View_Nomer = ' +   intToStr ( ViewNumber)+ ' and ViewPage = "'+ViewPageViewPage.Value +'"');
  Curve.Open;Curve.Fetchall;
//  FonDialog.FonColor.Brush.Color:=CurveColorFon.Value;
  if NewTabInd<TabSet.Tabs.Count then  TabSet.TabIndex:=NewTabInd else TabSet.TabIndex:=0;
  ScaleRb.ItemIndex:=CurveScaleStyle.Value;
  ScaleStyle:=ScaleRb.ItemIndex;
//  SliderS.Value:=trunc(SliderS.MaxValue-(CurveSlider.Value+0.5)*(SliderS.MaxValue-SliderS.MinValue));
  SliderS.Value:=trunc(CurveSlider.Value*100+50);
  Xactive.Hint:=FloatToStrF((CurvePointEnd.Value - CurvePointStart.Value)*100/SigTabRec.PointAll,
                  ffFixed,3,2)+'%';
  Proc:=(CurvePointEnd.Value - CurvePointStart.Value)*100/SigTabRec.PointAll;
  ProcessingCursorForm(true);
  Grid_X.Checked:=CurveGridX.Value<>0;
  Grid_Y.Checked:=CurveGridY.Value<>0;
  expform.curvesetRefresh;
end;

procedure TImageForm.FormActivate(Sender: TObject);
var qq:string;
begin
  ScaleRb.ItemIndex:=CurveScaleStyle.Value;ScaleStyle:=ScaleRb.ItemIndex;
  bImageAvailable:=True;
//  MainForm.FFTButton.Enabled:=True;
//  MainForm.MATLABButton.Enabled:=True;

  MainForm.FTButton.Enabled:=True;
  MainForm.ObzorkaButton.Enabled:=True;
//  MainForm.AudioButton.Enabled:=True;

  //  MainForm.FiltrButton.Enabled:=True;
//  MainForm.UserButton.Enabled:=True;

  MainForm.ActiveForm:=self;
  mainForm.MenuExport.Enabled:=True;
//  MainForm.CursorsButton.Enabled:=True;

//  MainForm.FindSignalButton.Enabled:=True;
  NameCurveShort.SetFocus;
  ProcessingCursorForm(True);
  Sig_TableNameXGetText(nil,qq,false);
//  FonDialog.FonColor.Brush.Color:=CurveColorFon.Value;
end;

procedure TImageForm.FormResize(Sender: TObject);
begin
   RightXButton.Left:=XPanel.Width-SliderS.Width;
   LabelNameX.Left:=PaintBox.Width-LabelNameX.Width+PaintBox1.Width;
   LabelNameX.Top:=PaintBox.Height-LabelNameX.Height;
   if SigTabRec.PointAll<>0 then XActive.Width:=round((0.0+RightXButton.Left{-YPanel.Width})*
   (CurvePointEnd.Value-CurvePointStart.Value+0.0)/SigTabRec.PointAll);
   if SigTabRec.PointAll<>0 then XActive.Left:=round((0.0+RightXButton.Left-LeftXButton{YPanel}.Width)*
      (0.0+CurvePointStart.Value)/(0.0+SigTabRec.PointAll))+LeftXButton.Width;
   if XActive.Width<4 then XActive.Width:=4;
   if CurvebPolyCreate.Value <> integer(true) then bNeedCreatepoly:=True;
   if  ((CurveWidth.Value=PaintBox.Width) and
     (CurveHeight.Value=PaintBox.Height)) then exit
     else bNeedCreatepoly:=True;
   MinYLabel.Top:=PaintBox.Height-MinYLabel.Height;
 end;

Procedure TImageForm.UpdateView(bRepaint:boolean;bRecalc:boolean);
var i:INTEGER;
begin
 if bOnlyStart then exit;
 if bRecalc then bNeedCreatepoly:=True;
 if bRepaint then PaintBoxPaint(nil);
 for i:=0 to ComponentCount-1 do
  begin
   if Components[i] is tCursorShape then
    begin
     if TCursorShape(Components[i]).Visible then TCursorShape(Components[i]).BringToFront;
    end;
   if Components[i] is tCursorLabel then
    begin
     if TCursorLabel(Components[i]).Visible then TCursorLabel(Components[i]).BringToFront;
    end;
  end;
end;

Procedure TImageForm.UpdateCurvePointStartEnd;
begin
 UpdatePointStartEnd(self);
end;

Procedure TImageForm.SetXActive;
begin
 XActive.Left:=round((RightXButton.Left-LeftXButton.Width+0.0)*
      (LeftX/CurveDeltX.asfloat+0.0)/(0.0+SigTabRec.PointAll))+LeftXButton.Width;
 XActive.Width:=round((RightXButton.Left-LeftXButton.Width+0.0)*
       (RightX/CurveDeltX.asfloat+0.0)/(0.0+SigTabRec.PointAll))+
      LeftXButton.Width -XActive.Left;
 if XActive.Width<4 then XActive.Width:=4;
end;

procedure TImageForm.RightXButtonClick(Sender: TObject);
Label M1;
begin
M1: Delt:= (CurvePointEnd.Value - CurvePointStart.Value) div 3;
 if  Delt + CurvePointEnd.Value < SigTabRec.PointAll then
     begin
     LeftX:=(CurvePointStart.Value+ Delt)*CurveDeltX.asfloat;
     RightX:=(CurvePointEnd.Value+DElt)*CurveDeltX.asfloat;
     end
      else
       begin
         if CurvePointEnd.Value =  SigTabRec.PointAll then exit;
         LeftX:=(SigTabRec.PointAll-Delt*2)*CurveDeltX.asfloat;
         RightX:=(SigTabRec.PointAll)*CurveDeltX.asfloat;
         bRightShow:=False;
       end;
 UpDateCurvePointStartEnd;

 UpdateView(true,true);
 if bRightShow then
  begin
   Application.ProcessMessages;
   if delayTime<>0 then sleep(DelayTime);
   goto m1;
  end;
 end;

procedure TImageForm.LeftXButtonClick(Sender: TObject);
label M1;
begin
M1: Delt:= (CurvePointEnd.Value - CurvePointStart.Value) div 3;
 if  CurvePointStart.Value -  Delt > 0 then
     begin
     LeftX:=(CurvePointStart.Value - Delt)*CurveDeltX.asfloat;
     RightX:=(CurvePointEnd.Value - DElt)*CurveDeltX.asfloat;
     end
      else
       begin
         if CurvePointStart.Value =  0 then exit;
         LeftX:=0;
         RightX:=Delt*2*CurveDeltX.asfloat;
         bLeftShow:=false;
       end;
 UpDateCurvePointStartEnd;
 UpdateView(True,true);
 if bLeftShow then
  begin
   Application.ProcessMessages;
   if delayTime<>0 then sleep(DelayTime);
   goto m1;
  end;
end;

procedure TImageForm.XActiveMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 FLagMove:=True;
 LeftX:=CurvePointStart.Value*CurveDeltX.asfloat;
 RightX:=CurvePointEnd.Value*CurveDeltX.asfloat;
 Delt:=trunc((RightX-LeftX)/CurveDeltX.asfloat);
 XMouse:=X;
end;


procedure TImageForm.XActiveMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FLagMove:=False;
  LeftX:=round((XActive.Left-LeftXButton{YPanel}.Width+0.0)*SigTabRec.PointAll/(RightXButton.Left-
     LeftXBUtton{YPanel}.Width+0.0))*CurveDeltX.asfloat;
  if LeftX<0 then LeftX:=0;
  RightX:=LeftX+Delt*CurveDeltX.asfloat;
  UpdateCurvePointStartEnd;
  XActive.Update;
  UPdateView(true,True);
end;

procedure TImageForm.XActiveMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
  var DeltMouse:Integer;
begin
 if not FlagMove then exit;
 DeltMouse:=X-XMouse;
 if  Shift = [ssCtrl] +  [ssleft]   then
   begin
   if X> (XActive.Width div 2 )then
     begin
      XMouse:=X;
      XActive.Width:=XActive.Width+DeltMouse;
      if XActive.Width < 5 then XActive.Width:=5;
      if XActive.Left+XActive.Width>RightXButton.Left then XActive.Width:=RightXButton.Left-XActive.Left;
      if XActive.Left+XActive.Width>RightXButton.Left then XActive.Width:=RightXButton.Left-XActive.Left;
     end
                     else
     begin
      XActive.Width:=XActive.Width-DeltMouse;
      XActive.Left:=XActive.Left+DeltMouse;
      if XActive.Width < 4 then XActive.Width:=4;
      if XActive.Left < LeftXButton{YPanel}.Width then XActive.Left:=LeftXButton{YPanel}.Width;
      if XActive.Left+XActive.Width>RightXButton.Left then XActive.Width:=RightXButton.Left-XActive.Left;
      XMouse:=X-DeltMouse;
     end;
    Delt:=round((XActive.Width+0.0)*SigTabRec.PointAll/(RightXButton.Left-LeftXButton{YPanel}.Width+0.0));
    end
    else
  begin          {просто перемещение XActive}
   XActive.Left:=XActive.Left+DeltMouse;
   if XActive.Left < LeftXButton{YPanel}.Width then XActive.Left:=leftXButton{YPanel}.Width;
   if XActive.Left > RightXButton.Left-XActive.Width then XActive.Left:= RightXButton.Left-XActive.Width;
  end;
 XActive.Update;
end;

procedure TImageForm.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
var maxY,MinY:real;
begin
// MultEdit.Text:=FloatToStrF(CurveMult.Value,ffGeneral,FormatAll,FormatAfterPoint);
 Mult:=CurveMult.Value;
 MultEdit.Update;
 paintBoxPaint(DBNavigator1);
 UpdateCurvePointStartEnd;
end;

procedure TImageForm.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin
 if bLeftShow or bRightShow then
    begin
    MessageDlg('Окно нельзя закрыть до завершения быстрого просмотра',mtError,[mbOK], 0);
    Action:=caNone;
    exit;
  end;

 if bNotClose then
  begin
    MessageDlg('Окно нельзя закрыть до закрытия окна создания нового сигнала',mtError,[mbOK], 0);
    Action:=caNone;
    exit;
  end;
 if bExport then
  begin
   if MessageDlg('Прервать экспорт?',mtInformation,
     [mbYes, mbNo], 0) = mrYes then
      begin
       bStopExport:=true;
       bExport:=false;
      end;
   Action:=caNone;
   exit;
  end ;
  Whatdo:=mrNo;
{  Whatdo:=mrYes;
  if not MainForm.Autosave.Checked then
   begin
   WhatDo:=MessageDlg('Сохранить образ '+
       Caption+'  ?',mtInformation,[mbYes, mbNo,mbCancel], 0);
   if WhatDo = mrCancel then
    begin
     Action:=caNone;
     exit;
    end;
   end;
 }  if WhatDo = mrNo then
    begin
     dm.q.SQL.Clear;
     dm.q.SQL.add('delete from curveset where view_nomer= :View_Nomer');
     dm.q.parambyname('View_Nomer').asinteger:=ViewNumber;
     dm.q.execsql;
     dm.q.Transaction.commitretaining;
     expform.CurvesetRefresh;
    end;

  MainForm.ActiveForm:=nil;
  MainForm.FFTButton.Enabled:=false;
  MainForm.FTButton.Enabled:=false;
  MainForm.MATLABButton.Enabled:=false;
  MainForm.ObzorkaButton.Enabled:=false;
  MainForm.AudioButton.Enabled:=false;
  MainForm.FiltrButton.Enabled:=false;
  MainForm.UserButton.Enabled:=false;
  mainForm.MenuExport.Enabled:=false;
  MainForm.CursorsButton.Enabled:=false;
  MainForm.FindSignalButton.Enabled:=false;

//  MainForm.N4.Enabled:=false;
//  MainForm.Print_Item.Enabled:=false;
  Screen.Cursor:=crDefault;
  Action:=CAFree;
 end;

procedure TImageForm.TabSetClick(Sender: TObject);
begin
 MousLabel.Caption:=' Selection Pages..'; UpPanel.Update;
 if bCreateOver then CloseSignalArr;
 Sig_Table.Close;
 Curve.Close;
 ViewPage.GotoBookMark(BookMarkArr[TabSet.TabIndex]);
 Curve.Open;Curve.fetchall;
 OpenSignalArr;
 bSetCurveParam:=False;
 Sig_Table.EnableControls;
 ScaleRb.ItemIndex:=CurveScaleStyle.Value;
 ScaleStyle:=ScaleRb.ItemIndex;
 LeftX:=CurvePointStart.Value*CurveDeltX.asfloat;
 RightX:=CurvePointEnd.Value*CurveDeltX.asfloat;
 SetXActive;
 XActive.Update;
 if  ((CurveWidth.Value<>PaintBox.Width) or (CurveHeight.Value<>PaintBox.Height)) then
  bNeedCreatepoly:=True
  else
   if CurvebPolyCreate.Value<>integer(true) then
    bNeedCreatepoly:=True;
 ProcessingCursorForm(True);
 if not bView then  UpdateView(true,false);
 if Pos('~',ViewPageViewPage.Value) <>1 then
  begin
   Panel_Povorot.Width:=1;
   Panel_Povorot.Visible:=false;
  end else
   begin
    if UpPanel.Width div 3 > 185 then Panel_Povorot.Width:=185 else Panel_Povorot.Width:=UpPanel.Width div 3;
    Panel_Povorot.Visible:=true;
   end;
 MousLabel.Caption:=''; UpPanel.Update;
{ Tabset.BeginDrag(false);}
 expform.CurvesetRefresh; 
end;

procedure TImageForm.CreatePoly(Width,Height,LeftM,UpM:word);
var BookMark:TBookMark;
    pPolyX,pPolyY:pPolyArr;
    NPolyPoint:word;
//    {FileIMage,}FileDat:TBufferedFile;
    {FileIMage,}File_Dat:TFileStream;
    NumMax,NumMin,i,j,k,Point1,Point2,PointStart,PointEnd:longint;
    Prosto:Boolean;
    Rez,TekMax,TekMin,r1,r2:Real;
    XStart,XOld,XTek:integer;
    cCurve,Shag,Tip:word;
    MaxX,MinX,MaxY,MinY:real;
    i1,i2:longint;
    Nomer:longint;
    Kx,Ky,A3,A1,A2,A0:real;
    Rez_Integer:word;RezLI:integer;RezSingle:Single;
    MinInteger:word;MinLI:integer;MinSingle:Single;
    MaxInteger:word;MaxLI:integer;MaxSingle:Single;
    PromRez, PromMaxY,PromMinY:real;
    ViewMinY:real;
    MinYAll,MaxYAll:real;
    BufReal:pDataReal;
    BufLI:pBufferLInt;
    BufInteger:pDataW;
    nBufferPoint:longint;
    RR1:real;
    CVisibleCurve:integer;
    schitano:integer;
    TotalMinX:real; // тотальный минимум между кривыми, найденный через SigTabRec.datetimestart
    TotalMaxX:real; // тотальный максимум между кривыми, найденный через SigTabRec.datetimestart и SigTabRec.pointAll
    ShiftPointX:real;  // сдвиг в точках по X для данной кривой Curve
                       // определяется через (SigTabRec.datetimestart - TotalMinX)*Width/(ViemaxX-ViewMinX)
                       // shiftpointX определеяется для каждой кривой индивидуально
begin
if bonlystart then exit;
Screen.Cursor:=crHourGlass;
GetCurveParam(self);
{$R-}
 BookMark:=Curve.GetBookmark;
 Curve.DisableControls;
 Curve.first;
 SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 TotalMinX:=SigTabRec.DateTimeStart;
 TotalMaxX:=SigTabRec.DateTimeStart+SigTabRec.pointAll*SigTabRec.Deltx/24.0/3600.0;
 Curve.next;
 while not Curve.eof do
  begin
   SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
   if TotalMinX>SigTabRec.DateTimeStart then TotalMinX:=SigTabRec.DateTimeStart;
   if TotalMaxX<SigTabRec.DateTimeStart +SigTabRec.pointall*sigtabrec.deltx/24.0/3600.0 then TotalMaXX:=SigTabRec.DateTimeStart+SigTabRec.pointall*SigTabRec.Deltx/24.0/3600.0;
    Curve.next;
  end;

 Try
  Curve.First;  //Curve.RequestLive:=true;
  cVisibleCurve:=0;
  for CCurve:=0 to Curve.RecordCount-1 do
   begin
       SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
       SigTabRec.TotalMinX:=TotalMinx;
       SigTabRec.TotalMaxX:=TotalMaxx;
       SigTabRec.totalPointAll:=round(((TotalMaxX-TotalMinX)*24*60*60)/SigTabRec.deltX);
       Curve.Edit;                     {Расчет и сохранение Poly}
//       if  (CurvebViewMaxMinX.Value <> integer(True) )then
       begin    {определение мах мин по оси X }
        GetMaxMinX(CurvePointStart.Value,CurvePointEnd.Value,MinX,MaxX,Status,SigTabRec);
        CurveViewMinX.Value:=MinX; CurveViewMaxX.Value:=MaxX;
        CurvebViewMaxMinX.Value:=integer(True);
       end;
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
      ShiftPointX:=(SigTabRec.datetimestart - SigTabRec.TotalMinX)*Width/(CurveViewMaxX.Value-CurveViewMinX.value);

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
     2:begin
        if NPageCurve<>0 then
         begin
          ViewMinY:=CurveViewMinY.Value*CurveMult.Value;
          if (CurveViewMaxY.Value-CurveViewMinY.Value)<>0 then
          Ky:=Height/NPageCurve/(CurveMult.Value*(CurveViewMaxY.Value-CurveViewMinY.Value))
           else Ky:=Height/NPageCurve/(CurveMult.Value*(1));
          RR1:=Height/NPageCurve+Ky*ViewMinY+Height/NPageCurve*cVisibleCurve;
         end
         else
          begin
           RR1:=Height+Ky*ViewMinY;
           Ky:=Height+(CurveViewMaxY.Value-CurveViewMinY.Value);
          end;
      end;
     3:begin
        if NPageCurve<>0 then
         begin
          ViewMinY:=CurveViewMinYAll.Value*CurveMultAll.Value;
          Ky:=Height/NPageCurve/(CurveMultAll.Value*(MaxYAll-MinYAll));
          RR1:=Height/NPageCurve+Ky*ViewMinY+Height/NPageCurve*cVisibleCurve;
         end
         else
          begin
           RR1:=Height+Ky*ViewMinY;
           Ky:=Height+(MaxYAll-MinYAll);
          end;
      end;
     end; {case scaleStyle}
     (pSigTabRec(CurvepSigTabRec.Value))^.rr1:=rr1;
     (pSigTabRec(CurvepSigTabRec.Value))^.Ky:=Ky;
     K:=0;
     pPolyX:=pPolyArr(CurvepPolyX.Value);
     pPolyY:=pPolyArr(CurvepPolyY.Value);
     if pPolyX<>nil then Freemem(pPolyX,CurvePolyPoint.Value*Sizeof(Word)+Zapas);
     if pPolyY<>nil then Freemem(pPolyY,CurvePolyPoint.Value*Sizeof(Word)+Zapas);
     GetMem(pPolyX,NPolyPoint*SizeOf(Word)+Zapas);
     GetMem(pPolyY,NPolyPoint*SizeOf(Word)+Zapas);
     GetReadFileDat( File_Dat,Status,SigTabRec);
     if not (bLeftShow or bRightShow ) then
         begin
          MousLabel.Caption:='CreatePoly '+IntToStr(CCurve);UpPanel.Update;
         end;
     File_Dat.position:=SigTabRec.Seek_Start+PointStart*cSizeRez[SigTabRec.RezType];
//     FileDat.Seek(SigTabRec.Seek_Start+PointStart*cSizeRez[SigTabRec.RezType]);
     if pointStart<>PointEnd then
      begin
      if Prosto then
          for i:=PointStart to PointEnd do
           begin
            pPolyX^[k]:=round(((i-PointStart)*Kx)+LeftM+ShiftPointX);
            case Tip of
              cRealLong,cAnyChanal,cSeismoReal: begin File_Dat.Read(RezSingle,Shag{,BytesRead});Rez:=RezSingle;end;
              cAllData,cWordLong,cSeismoWord:
               begin
                File_Dat.Read(Rez_Integer,Shag{,BytesRead});
                if rez_integer>=$8000 then
                 rez_integer:=$FFFF-rez_integer;
               end;
              cAllData18,cLong18,cSeismoLInt:begin File_Dat.Read(RezLI,Shag{,BytesRead});Rez:=RezLI;end;
             end;
//             Rez:=0;
            case Tip of
              cRealLong,cAnyChanal,cSeismoReal: Rez:=RezSingle;
              cAllData,cWordLong,cSeismoWord:Rez:=smallint(Rez_Integer);
              cAllData18,cLong18,cSeismoLInt:Rez:=RezLI;
             end;
            PromRez:=A0+Rez*A1;
            if A2<>0 then PromRez:=PromRez+Rez*Rez*A2;
            if A3<>0 then PromRez:=PromRez+Rez*Rez*Rez*A3;
            Rez:=PromRez;
            pPolyY^[k]:=trunc(RR1-Rez*Ky)+UpM;
            if pPolyY^[k]>65000 then pPolyY^[k]:=0;
            inc(k);
          end else  {if Prosto}
             begin
                i:=PointStart; XStart:=0; XOld:=0;
                NBufferPoint:=2*round((PointEnd-PointStart)/Width);
                BufReal:=nil;BufLI:=nil;BufInteger:=nil;
               repeat
                Point1:=i;
                 repeat
                   inc(i);
                   Xtek:=round((i-PointStart)*Kx);
                 until ((Xtek>XOld) or (i>=PointEnd));
                 Point2:=i-1;
                 MaxSingle:=1;MinSingle:=0;RezSingle:=0;
                 case Tip of
                    cRealLong,cAnyChanal,cSeismoReal:
                      begin
                         if ((BufReal=nil) or ((Point2-Point1)>NBufferPoint) ) then
                          begin
                           File_Dat.Read(MaxSingle,Shag{,BytesRead});
//                           if BytesRead=0 then MaxSingle:=0;
                           MinSingle:=MaxSingle;
                           for j:=Point1+1 to Point2 do
                            begin
                             File_Dat.Read(RezSingle,Shag{,BytesRead});
//                             if BytesRead=0 then RezSingle:=0;
                             if MaxSingle<RezSingle then MaxSingle:=RezSingle;
                             if MinSingle>RezSingle then MinSingle:=RezSingle;
                            end;
                          end
                           else
                            begin
                             File_Dat.Read(BufReal^[0],(Point2-Point1+1)*Shag{,BytesRead});
//                             if Bytesread=0 then Bufreal^[0]:=0;
                             MaxSingle:=BufReal^[0];MinSingle:=MaxSingle;
                             {$I-}
                             for j:=1 to Point2-Point1 do
                              begin
//                               if Bytesread=0 then BufReal^[j]:=0;
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
                           File_Dat.Read(MaxInteger,Shag{,BytesRead});
                           if Maxinteger>=$8000 then
                             maxinteger:=$FFFF-Maxinteger;
//                           if BytesRead=0 then MaxInteger:=0;
                           MinInteger:=MaxInteger;
                           for j:=Point1+1 to Point2 do
                            begin
                             File_Dat.Read(Rez_Integer,Shag{,BytesRead});
                             if rez_integer>=$8000 then
                                  rez_integer:=$FFFF-rez_integer;
                             if j=Point1+1 then
                              begin
                               MinInteger:=Rez_Integer;
                               MaxInteger:=Rez_Integer;
                              end;
//                             if BytesRead=0 then RezInteger:=0;
                             if Maxinteger<Rez_integer then Maxinteger:=Rez_integer;
                             if Mininteger>Rez_integer then Mininteger:=Rez_integer;
                            end;
                          end
                           else
                            begin
                             File_Dat.Read(BufInteger^[0],(Point2-Point1+1)*Shag{,BytesRead});
  //                           if BytesRead=0 then BufInteger^[0]:=0;
                             Maxinteger:=BufInteger^[0];Mininteger:=Maxinteger;
                             {$I-}
                             for j:=1 to Point2-Point1 do
                              begin
                               if BytesRead=0 then BufInteger^[j]:=0;
                               if Maxinteger<BufInteger^[j] then Maxinteger:=BufInteger^[j];;
                               if Mininteger>BufInteger^[j] then Mininteger:=BufInteger^[j];
                              end;
                             {$I+}
                            end;
                          MaxY:=Maxinteger;MinY:=Mininteger;
                      end;
                    cAllData18,cLong18,cSeismoLInt:
                     begin
                      if ((BufLI=nil) or ((Point2-Point1)>NBufferPoint) ) then
                          begin
                           File_Dat.Read(MaxLI,Shag{,BytesRead});
//                           if BytesRead=0 then MaxLI:=0;
                           MinLI:=MaxLI;
                           for j:=Point1+1 to Point2 do
                            begin
                             File_Dat.Read(RezLI,Shag{,BytesRead});
//                             if BytesRead=0 then RezLI:=0;
                             if MaxLI<RezLI then MaxLI:=RezLI;
                             if MinLI>RezLI then MinLI:=RezLI;
                            end;
                          end
                           else
                            begin
                             File_Dat.Read(BufLI^[0],(Point2-Point1+1)*Shag{,BytesRead});
//                             if BytesRead=0 then BufLI^[0]:=0;
                             MaxLI:=BufLI^[0];MinLI:=MaxLI;
                             {$I-}
                             for j:=1 to Point2-Point1 do
                              begin
                               if BytesRead=0 then BufLI^[j]:=0;
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
                   pPolyX^[XStart*2]:=round(XOld+LeftM+ShiftPointX);
                   pPolyX^[XStart*2+1]:=round(XOld+LeftM+ShiftPointX);
                   pPolyY^[XStart*2]:=trunc(RR1-Ky*PromMinY)+UpM;
                   pPolyY^[XStart*2+1]:=trunc(RR1-Ky*PromMaxY)+UpM;
                   if pPolyY^[XStart*2+1]>65000 then pPolyY^[XStart*2+1]:=0;
                   if pPolyY^[XStart*2]>65000 then pPolyY^[XStart*2]:=0;

                   inc(xold);
                   inc(Xstart);
                 until (Xold=xtek)  or (i>=PointEnd);
                 XOld:=XTek;
                until (i>=PointEnd) or (XStart>=Width);
               end;  {else Prosto}
    end {PointStart<>PointEnd};
   if File_Dat<>nil then File_Dat.Destroy;
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

    try
    Curve.GotoBookMark(BookMark);Curve.EnableControls;Curve.FreeBookMark(BookMark);
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
    except
    end;
 end;
{$R+}
if not (bLeftShow or bRightShow ) then
   begin MousLabel.Caption:=' ';UpPanel.Update; end;
bNeedCreatepoly:=false;
bOldCursor:=false;
Screen.Cursor:=crDefault;
end;

Procedure TImageForm.ShowCurve(DrawCanvas:TCanvas;Width,Height:word);
label M2;
var
    pPolyX,pPolyY:pPolyArr;
    NPolyPoint:word;
    FileIMage:TBufferedFile;
    i:longint;
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
 if CurveVisible.Value=integer(true) then
   begin
  {$R-}
   if CurvebPolyCreate.Value =integer(false) then
     try
       Createpoly(PaintBox.Width,PaintBox.Height,0,0);
      except
      end;
   if CurvebPolyCreate.Value = integer(True) then
    begin   {Загрузка PolyX, PolyY}
     NPolyPoint:=CurvePolyPoint.Value;
     if ((NPolyPoint=0) or
         (CurvepPolyX.Value = 0) or (CurvepPolyY.Value = 0)) then
      begin
       FileIMage:=TBufferedFile.Create(CurvePolyFile.Value,4096);
       FileImage.Reset;
       NPolyPoint:=FileImage.FileSize div (2*SizeOf(Word));
       GetMem(pPolyX,NPolyPoint*SizeOf(Word)+Zapas);
       GetMem(pPolyY,NPolyPoint*SizeOf(Word)+Zapas);
       FileImage.Read(pPolyX^,NPolyPoint*SizeOf(Word),bytesRead);
       FileImage.Read(pPolyY^,NPolyPoint*SizeOf(Word),BytesRead);
       FileImage.Close;
       FileImage.Destroy;
       //Curve.RequestLive:=True;
       Curve.Edit;
       CurvePolyPoint.Value:=NPolyPoint;
       CurvepPolyX.Value:=longint(pPolyX);
       CurvepPolyY.Value:=longint(pPolyY);
       Curve.Post;
      end
       else
        begin
         pPolyX:=pPolyArr(CurvepPolyX.Value);
         pPolyY:=pPolyArr(CurvepPolyY.Value);
        end;
     Smesh:=trunc(CurveSlider.Value*Height);
     case CurveScaleStyle.Value of
      2,3: if NPageCurve<>0 then
         Smesh:=trunc(CurveSlider.Value*(Height/NPageCurve))   ;
     end;
     for i:=0 to NPolyPoint-1 do
       begin
        if smesh > pPolyY^[i] then
         begin
          pPolyY^[i]:=0;
          bNeedcreatePoly:=true;
         end else
         pPolyY^[i]:=pPolyY^[i]-Smesh;
       end;
     DrawCanvas.Pen.Color:=CurveColor.Value;
     DrawCanvas.Pen.Style:=psSolid;
     DrawCanvas.Pen.Width:=CurveCurveWidth.Value;
     WidthEllipse:=DrawCanvas.Pen.Width div 2;
     if WidthEllipse=0 then WidthEllipse:=1;
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
     for i:=0 to NPolyPoint-1 do pPolyY^[i]:=pPolyY^[i]+Smesh;
M2:
  end;
{$R+}

 end;
end;

Procedure TImageForm.PaintBoxPaint(Sender: TObject);
var BookMark:TBookMark;
    cCurve:longint;
    Nomer:longint;
    H1,H2,DeltX,DeltY,X,y:word;
    pCursorRec:^TCursorRec;
    i:integer;
    MaxY,MinY:real;
begin
  if not bImageAvailable then exit;
{$IFDEF HASP}
  GetHaspCode(  SC_2,  ph2_1, ph2_2, ph2_3, ph2_4 );
  if not ((ph2_1=Cs2_p1) and
                   (ph2_2=Cs2_p2) and
                   (ph2_3=Cs2_p3) and
                   (ph2_4=Cs2_p4))
                     then
                     begin
                      ShowMessage('HASP KEY not found');
                      exit;
                     end;

 {$ENDIF}
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
{ bOnlystart:=false;}
 if (
   ((CurvepPolyX.Value=0) or (CurvepPolyY.Value=0))
     and (not FileExists(CurvePolyFile.Value) ) ) then
       begin
        try
         CreatePoly(PaintBox.Width,PaintBox.Height,0,0);
         except
          exit;
         end;
       end;
 if ((Sender = DBNavigator1) and (CurveGridY.Value=0)) then
   ShowCurve(PaintBox.Canvas,PaintBox.Width,PaintBox.Height)
 else
   begin
{ MaxYLabel.Visible:=ScaleStyle<>0;
 MinYLabel.Visible:=ScaleStyle<>0;}
 PaintBox.Canvas.Brush.style:=bsSolid;
 PaintBox.Canvas.Pen.Color:=CurveColorFon.Value;
 PaintBox.Canvas.Brush.Color:=CurveColorFon.Value;
{ PaintBox.Canvas.Brush.Color:=CurveColorFon.Value;}
 PaintBox.Canvas.FillRect(Rect(0,0,PaintBox.Width,PaintBox.Height));
 PaintBox.Canvas.Pen.style:=psDot ;
 {PaintBox.Canvas.Pen.Color:=clSilver;}
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
(*   Delty:=CurveGridY.Value;
   Y:=DeltY;
   while y<PaintBox.Height do
    begin
     PaintBox.Canvas.MoveTo(0,y);
     PaintBox.Canvas.LineTo(PaintBox.width,y);
     y:=y+Delty;
    end;*)
    case scaleStyle of
     0,1:begin
          GetCurveMaxMinY(self,MaxY,MinY);
          DrawGridY(0,PaintBox.Height,MaxY,MinY,paintBox.Canvas,0,PaintBox.Width);
         end;
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
   if CurveVisible.Value =integer(true) then
    begin
       H1:=0;H2:=PaintBox1.Height;
       case ScaleStyle of
        2,3:
         begin
          if NPageCurve>1 then
          begin
           H1:=trunc(PaintBox.Height/NPageCurve*cPageCurve);
           H2:=trunc(PaintBox.Height/NPageCurve*(cPageCurve+1));
          end;
         end;
       end;
       GetCurveMaxMinY(self,MaxY,MinY);
       case ScaleStyle of
        2,3:DrawAxisY(PaintBox1,H1,H2,
                          CurveColor.Value,CurveColorFon.Value,MaxY,MinY,PaintBox,CurveGridY.Value<>0);
       end ;
   ShowCurve(PaintBox.Canvas,PaintBox.Width,PaintBox.Height);
  (* if ScaleStyle<>2 then*)
   Nomer:=CurveView_Signal_Nomer.Value;
      inc(cPageCurve);
    end;
   Curve.Next;
   if Nomer=CurveView_Signal_Nomer.Value then break;
  end;
   NPageCurve:=cPageCurve;
   if NPageCurve=0 then NPageCurve:=1;
   Finally
    Curve.GotoBookMark(BookMark);Curve.EnableControls;Curve.FreeBookMark(BookMark);
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 end;
 end;
 GetCurveMaxMinY(self,MaxY,MinY);
 case ScaleStyle of
  0,1:begin
       DrawAxisY(PaintBox1,0,PaintBox1.Height,
                    CurveColor.Value,CurveColorFon.Value,MaxY,MinY,PaintBox,false);
      if (Sender = DBNavigator1) then   ShowCurve(PaintBox.Canvas,PaintBox.Width,PaintBox.Height)
      end;
 end ;
 XCursorTime.Caption:='';XCursorTime.Update;

 UpdateSliderS;
{ if ScaleStyle=2 then }
UpdateMaxMinYLabel;
{ UpdateCurvePointStartEnd;}
 if CursorsList<>nil then
  begin
   for i:=0 to CursorsList.Count-1 do
    begin
     pCursorRec:=CursorsList.Items[i];
     if ((pCursorRec^.PointNum<LeftX/CurveDeltX.asfloat) or (pCursorRec^.PointNum>RightX/CurveDeltX.asfloat)) then
      begin
       pCursorRec^.CursLabel.Visible:=False;
       pCursorRec^.CursShape.Visible:=False;
      end else
       DrawCursor(pCursorRec^,true,paintBox.Width);
    end;
  end;

  

end;


Procedure TImageForm.UpdateSliderS;
begin
// SliderS.Value:=trunc(SliderS.MaxValue-(CurveSlider.Value+0.5)*(SliderS.MaxValue-SliderS.MinValue));
 SliderS.Value:=trunc(100*CurveSlider.Value+50);
 SliderS.Update;
end;

procedure TImageForm.UpdateMaxMinYLabel;
var qq:string;
 begin
   MinYLabel.Font.Color:=CurveColor.Value;
   ShapeColor.Brush.Color:=CurveColor.value;
   if ((CurveScaleStyle.value = 0) or (CurveScaleStyle.value = 3) )then
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
{   MinYLabel.Update;
   MaxYLabel.Font.Color:=CurveColor.Value;}
   if ((CurveScaleStyle.value = 0) or (CurveScaleStyle.value = 3))  then
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
{   MaxYLabel.Update;}
   LabelNameX.Update;
   Sig_TableNameXGetText(nil, qq,true);
   LabelNameX.Caption:=qq;
   PaintBox1.Hint:=NameCurveShort.Text+'  min='+MinYLabel.Caption+' max='+MaxYLabel.Caption;
{   PaintBox1.ShowHint:=true;}
 end;


procedure TImageForm.ChanalBoxOKClick(Sender: TObject);
begin
// Curve.RequestLive:=True;
 if Curve.State = dsEdit then Curve.Post;
 ChanalBox.Visible:=False;
 PaintBox.Visible:=True;
 UpdateView(True,false);
end;

procedure TImageForm.NameCurveShortClick(Sender: TObject);
begin
 ChanalBoxShow(Sender);
end;

procedure TImageForm.ChanalBoxShow(Sender: TObject);
begin
 if bOldCursor then HideOldCursor;
 ChanalBox.Visible:=True;
 ChanalBox.Update;
 Curve.Edit;
end;

procedure TImageForm.BitBtn5Click(Sender: TObject);
begin
 ChanalBox.Visible:=False;
 PaintBox.Visible:=True;
 NameCurveShort.Update;
end;

procedure TImageForm.CurveCurveHeaderShortGetText(Sender: TField;
  var Text:string; DisplayText: Boolean);
begin
 NameCurveShort.Font.Color:=CurveColor.Value;
 Text:=CurveCurveHeaderShort.Value;
end;

procedure TImageForm.ScaleRBClick(Sender: TObject);
var i:integer;
begin
{ case  ScaleRb.ItemIndex of
  0:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton1.Glyph;
  1:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton2.Glyph;
  2:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton3.Glyph;
  3:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton4.Glyph;
 end;
 ScaleButton.NumGlyphs:=1;
 ScaleButton.Update;
} if ScaleStyle=ScaleRb.ItemIndex then exit
     else
 ScaleStyle:=ScaleRb.ItemIndex;
 bSetCurveParam:=false;
if bCreateOver then UpdateView(True,true);
end;

procedure TImageForm.SliderSMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var BookMark:TBookMark;
     cCurve,Nomer:Longint;
begin
 case ScaleRB.ItemIndex of
  1,2,3: begin
       Curve.Edit; //Curve.RequestLive:=True;
//       CurveSlider.Value:=(SliderS.MaxValue-SliderS.Value)/(SliderS.MaxValue-SliderS.MinValue)-0.5;
       CurveSlider.Value:=(-50+SliderS.Value)/(SliderS.MaxValue-SliderS.MinValue);
       Curve.Post;
     end;
 0:begin
      BookMark:=Curve.GetBookmark;
      Curve.DisableControls;
      Try
        Curve.First;
        cPageCurve:=0;
        for CCurve:=0 to Curve.RecordCount-1 do
         begin
          Curve.Edit;//Curve.RequestLive:=True;
//          CurveSlider.Value:=(SliderS.MaxValue-SliderS.Value)/(SliderS.MaxValue-SliderS.MinValue)-0.5;
          CurveSlider.Value:=(-50+SliderS.Value)/(SliderS.MaxValue-SliderS.MinValue);
          Curve.Post;
          Nomer:=CurveView_Signal_Nomer.Value;
          if CurveVisible.Value =integer(true) then inc(cPageCurve);
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
     end;  {0}
   end; {case}
{ PaintBoxPaint(nil);}
 UpdateMaxMinYLabel;
 UpdateView(true,false);
 SliderS.Hint:=FloatToStrF(CurveSlider.Value*200,ffGeneral,FormatAll,FormatAfterPoint)+'%';
end;

Procedure TImageForm.OpenSignalArr;
var
 cCurve:longint;
 Nomer:longint;
 pSignalRec:pSigTabRec;
begin
  { Curve.DisableControls;}Curve.First;
  Sig_Table.Close;Sig_Table.Open;
  SigTabRecGrad.FileDat:='';
  SigTabRecOborot.FileDat:='';
  cPageCurve:=0;           NAllCurveInPage:=0;
  for CCurve:=0 to Curve.RecordCount-1 do
      begin
       Nomer:=CurveView_Signal_Nomer.Value;
       Curve.Edit;//Curve.RequestLive:=True;
{       Sig_Table.Close;Sig_Table.Open;}
       GetMem(pSignalRec,SizeOf(TSigTabRec));
       pSignalRec^.PointAll:=Sig_TablePointAll.Value;
       pSignalRec^.A0:=Sig_TableA0.Value;
       pSignalRec^.A1:=Sig_TableA1.Value;
       pSignalRec^.A2:=Sig_TableA2.Value;
       pSignalRec^.A3:=Sig_TableA3.Value;
       pSignalRec^.DeltX:=Sig_TableDeltX.Value;
//       pSignalRec^.FileDat:=Sig_TableFileDat.Value;
       pSignalRec^.FileDat:=Sig_TableFileDat.Value;
       pSignalRec^.FileDat_abs:=Sig_TableFileDat_abs.Value;
       pSignalRec^.Seek_Start:=Sig_TableFile_Seek.Value;
       pSignalRec^.RezType:=Sig_TableRezType.Value;
       pSignalRec^.bMaxMinY:=Sig_TablebMaxMinY.Value=integer(true);;
       pSignalRec^.MinY:=Sig_TableMinY.Value;
       pSignalRec^.MaxY:=Sig_TableMaxY.Value;
{       pSignalRec^.DateTimeStart:=Sig_TableDate_Start.Value+Sig_TableTime_Start.Value;}
       pSignalRec^.DateTimeStart:=Sig_TableDateTimeStart.Value;  
       pSignalRec^.Eksp_Nomer:=Sig_TableEksp_Nomer.Value;
       pSignalRec^.RR1:=cPageCurve+1;pSignalRec^.Ky:=cPageCurve+1;
       CurvepSigTabRec.Value:=longint(pSignalRec);
       CurvepPolyY.Value:=longint(nil);
       CurvepPolyX.Value:=longint(nil);
       if CurveVisible.Value =integer(true) then inc(cPageCurve);
       inc(NAllCurveInPage);
       Curve.Post;
{       if pos('СТД_Об',TabSet.Tabs[Tabset.TabIndex])>0 then
        begin
         if cCurve=4 then SigTabRecGrad:=pSignalRec^;
         if cCurve=5 then SigTabRecOborot:=pSignalRec^;
        end;}
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
 NPageCurve:=cPageCurve;
 if NPageCurve=0 then NPageCurve:=1;

 Curve.First;
{ Curve.EnableControls;}
{ Sig_Table.Close;Sig_Table.Open;}
 SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 X1.Enabled:=pos('t',Sig_TableNameX.Value)=1;
{ AudioItem.Enabled:=X1.Enabled;}
 N5.Checked:=False;  N6.Checked:=False;
 N7.Checked:=False;  N8.Checked:=False;
 case CurveAxisXStyle.Value of
  0:N5.Checked:=true;
  1:N6.Checked:=true;
  2:N7.Checked:=true;
  3:N8.Checked:=true;
 end;
 YX_MenuItem.Enabled:=((NAllCurveInPage>1) and
    ((CurvePointEnd.Value-CurvePointStart.Value)<32000));
end;

Procedure TImageForm.CloseSignalArr;
var
 cCurve:longint;
 Nomer:longint;
 pSignalRec:pSigTabRec;
 pPolyX,pPolyY:pPolyArr;
 FileImage:TBufferedFile;
begin
   Curve.DisableControls;
   PB.Min:=0;PB.Max:=NallCurveInPage;
   PB.Visible:=True;
   Curve.First; //Curve.RequestLive:=True;
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
{         FileIMage:=TBufferedFile.Create(CurvePolyFile.Value,4096); FileImage.Rewrite;
         FileImage.Write(pPolyX^,CurvePolyPoint.Value*SizeOf(Word),BytesWrote);
         FileImage.Write(pPolyY^,CurvePolyPoint.Value*SizeOf(Word),BytesWrote);
         FileImage.Close;           FileImage.Destroy;
 }        if pPolyX<>nil then Freemem(pPolyX,CurvePolyPoint.Value*Sizeof(Word)+Zapas);
         if pPolyY<>nil then Freemem(pPolyY,CurvePolyPoint.Value*Sizeof(Word)+Zapas);
         DeleteFile(pansiChar(CurvePolyFile.Value));
        end;
       Curve.Edit;
       CurvepPolyY.Value:=longint(nil);CurvepPolyX.Value:=longint(nil);
       CurvePolyPoint.Value:=0;
       CurvepSigTabRec.Value:=longint(nil);
       Curve.Post;
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
   Curve.EnableControls;
   Sig_table.Open;
   PB.Visible:=false;
   PB.Update;
end;


procedure TImageForm.LeftShowClick(Sender: TObject);
begin
 bLeftShow:=True;
 bRightShow:=False;
 LeftXButtonClick(Sender);
end;

procedure TImageForm.RightShowClick(Sender: TObject);
begin
 bLeftShow:=False;
 bRightShow:=True;
 RightXButtonClick(Sender);
end;

procedure TImageForm.SpeedButton2Click(Sender: TObject);
begin
 bLeftShow:=False;
 bRightShow:=False;
end;

procedure TImageForm.FormDestroy(Sender: TObject);
var i:integer;
{     CheckF:TCheck_Db_Form;}

begin
 if bCreateOver then
   CloseSignalArr;
 bImageAvailable:=false;
 for i:=0 to ViewPage.RecordCount-1 do
    ViewPage.FreeBookMark(BookMarkArr[i]);
// selectViewQuery.RequestLive:=True;
 selectViewQuery.Edit;
 selectViewQueryUp.Value:=Top;selectViewQueryLeft_.Value:=Left;
 selectViewQueryWidth.Value:=Width;selectViewQueryHeight.Value:=Height;
 selectViewQuery.Post;
 CloseCursorsList;
 if WhatDo=mrNo then
  begin
    sleep(500);
//    Eksp_Parent_Number:=SelectViewQueryEksp_Parent.Value;
    postMessage(mainForm.Handle, wm_Check_DB,0,ViewNumber);
 end;
 inherited 
end;

procedure TImageForm.YPanelClick(Sender: TObject);
begin
 case ScaleRB.ItemIndex of
  1,2:Mult:=CurveMult.Value;
  0,3:Mult:=CurveMultAll.Value;
 end;
 MultEdit.Text:=FloatToStrF(Mult,ffGeneral,FormatAll,FormatAfterPoint);
 KoeffAllCheckBox.Enabled:=ScaleRB.ItemIndex>0;
 if Sender<>nil then
  begin
   if bOldCursor then HideOldCursor;
   MultBox.Visible:=True;
  end;
end;

procedure TImageForm.Koef_CloseClick(Sender: TObject);
begin
 MultBox.Visible:=False;
 UpdateView(True,false);
end;

procedure TImageForm.ObzorkaButtonClick(Sender: TObject);
begin
 CreateObzorka(Self);
end;

procedure TImageForm.Koef_UmenClick(Sender: TObject);
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

procedure TImageForm.Koef_UvelClick(Sender: TObject);
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

procedure TImageForm.Koef_ShowClick(Sender: TObject);
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
             Curve.Edit;//Curve.RequestLive:=True;
             CurveMult.Value:=Mult;
             Curve.Post;
             Nomer:=CurveView_Signal_Nomer.Value;
             if CurveVisible.Value =integer(true) then inc(cPageCurve);
             Curve.Next;
             if Nomer=CurveView_Signal_Nomer.Value then break;
            end;
            NPageCurve:=cPageCurve;
            if NPageCurve=0 then NPageCurve:=1;

           Finally
           Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
           SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
         end; {try}
        end else
         begin
          Curve.Edit;//Curve.RequestLive:=True;
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
          Curve.Edit;//Curve.RequestLive:=True;
          CurveMultAll.Value:=Mult;
          Curve.Post;
          Nomer:=CurveView_Signal_Nomer.Value;
          if CurveVisible.Value = integer(true) then inc(cPageCurve);
          Curve.Next;
          if Nomer=CurveView_Signal_Nomer.Value then break;
         end;
         NPageCurve:=cPageCurve;
         if NPageCurve=0 then NPageCurve:=1;
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


procedure TImageForm.CurveViewMinXGetText(Sender: TField;
  var Text:string; DisplayText: Boolean);
begin
 case CurveAxisXStyle.Value of
//  0:Text:=DateTimeToStr(sigTabRec.DateTimeStart+CurvePointStart.Value*CurveDeltX.asfloat/(24*3600));
  0:Text:=formatdatetime('dd.mm.yy hh:mm',sigTabRec.DateTimeStart+CurvePointStart.Value*CurveDeltX.asfloat/(24*3600));
  1:Text:=FloatToStrF(CurveViewMinX.Value,fffixed,FormatAll,FormatAfterPoint);
  2:Text:=FloatToStrF(CurveViewMinX.Value/60,fffixed,FormatAll,FormatAfterPoint);
  3:Text:=FloatToStrF(CurveViewMinX.Value/60/60,fffixed,FormatAll,FormatAfterPoint);
 end;
 TextMinX:=Text;
end;

procedure TImageForm.CurveViewMaxXGetText(Sender: TField;
  var Text:string; DisplayText: Boolean);
begin
 case CurveAxisXStyle.Value of
//  0:Text:=DateTimeToStr(sigTabRec.DateTimeStart+CurvePointEnd.Value*CurveDeltX.asfloat/(24*3600));
  0:Text:=formatdatetime('dd.mm.yy hh:mm',sigTabRec.DateTimeStart+CurvePointEnd.Value*CurveDeltX.asfloat/(24*3600));
  1:Text:=FloatToStrF(CurveViewMaxX.Value,fffixed,FormatAll,FormatAfterPoint);
  2:Text:=FloatToStrF(CurveViewMaxX.Value/60,fffixed,FormatAll,FormatAfterPoint);
  3:Text:=FloatToStrF(CurveViewMaxX.Value/60/60,fffixed,FormatAll,FormatAfterPoint);
 end;
 TextMaxX:=Text;
end;

procedure TImageForm.Sig_TableNameXGetText(Sender: TField;
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
     XMinEdit.Text:=FloatToStrF(CurveViewMinX.Value/60,ffGeneral,FormatAll,FormatAfterPoint);
     XMaxEdit.Text:=FloatToStrF(CurveViewMaxX.Value/60,ffGeneral,FormatAll,FormatAfterPoint);
//     XMinEdit.Text:=formatdatetime('dd.mm.yy hh:mm',CurveViewMinX.Value/60,ffGeneral,FormatAll,FormatAfterPoint);
//     XMaxEdit.Text:=formatdatetime('dd.mm.yy hh:mm',CurveViewMaxX.Value/60,ffGeneral,FormatAll,FormatAfterPoint);
    end;
  1:begin
     Text:=Sig_TableNameX.Value;
     if text = 't' then begin Text:=Text+',s'; RealXDimension:='s'; end;
     XMinEdit.Text:=FloatToStrF(CurveViewMinX.Value,ffGeneral,FormatAll,FormatAfterPoint);
     XMaxEdit.Text:=FloatToStrF(CurveViewMaxX.Value,ffGeneral,FormatAll,FormatAfterPoint);
    end;
  2:begin
     Text:=Sig_TableNameX.Value;
     if text = 't' then begin Text:=Text+',min'; RealXDimension:='min'; end;
     RealRazmahX:=RealRazmahX/60;
     XMinEdit.Text:=FloatToStrF(CurveViewMinX.Value/60,ffGeneral,FormatAll,FormatAfterPoint);
     XMaxEdit.Text:=FloatToStrF(CurveViewMaxX.Value/60,ffGeneral,FormatAll,FormatAfterPoint);
    end;
  3:begin
     Text:=Sig_TableNameX.Value;
     if text = 't' then begin Text:=Text+',hour'; RealXDimension:='hour'; end;
     RealRazmahX:=RealRazmahX/3600;
     XMinEdit.Text:=FloatToStrF(CurveViewMinX.Value/3600,ffGeneral,FormatAll,FormatAfterPoint);
     XMaxEdit.Text:=FloatToStrF(CurveViewMaxX.Value/3600,ffGeneral,FormatAll,FormatAfterPoint);
    end;
 end;
LabelForHint.ShowHint:=false;
if CurveGridX.Value<>0 then
 begin
     LabelForHint.Hint:='Step of a grid on Х ='+
      FloatToStrF(CurveGridX.Value/PaintBox.Width*RealRazmahX,ffGeneral,FormatAll,FormatAfterPoint)
                         +' '+RealXDimension;
     LabelForHint.ShowHint:=true;
 end;
ScaleX_Label.Text:=FloatToStrF(ScaleX_Shape.Width/PaintBox.Width*RealRazmahX,
  ffGeneral,FormatAll,FormatAfterPoint)+' '+RealXDimension;
ScaleX_Label.Update;
end;

procedure TImageForm.N5Click(Sender: TObject);
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
          Curve.Edit; //Curve.RequestLive:=True;
          CurveAxisXStyle.Value:=(Sender as TMenuItem).Tag;
          Curve.Post;
          Nomer:=CurveView_Signal_Nomer.Value;
          if CurveVisible.Value =integer(true) then inc(cPageCurve);
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
 LabelNameX.Caption:=qq;
 LabelNameX.Update;
end;

procedure TImageForm.wmSetStartPoint ( var Message:TMessage );
 var obzForm:TObzorkaForm;
begin
   obzForm:=Pointer(Message.lParam);
   if ((SigTabRec.Eksp_Nomer=ObzForm.SelectViewQueryEksp_Parent.Value) or
       (SelectViewQueryEksp_Parent.Value=ObzForm.SelectViewQueryEksp_Parent.Value) )
         then
    begin
     Show;
    case ObzForm.SelectViewQueryView_Style.Value of
     cTimeMap_View:
      begin
       LeftX:=ObzForm.ActiveCurveStart*CurveDeltX.asfloat;
       RightX:=ObzForm.ActiveCurveEnd*CurveDeltX.asfloat;
      end;
     cFreqMap_View,cKxxMap_View:
      begin
       LeftX:=round((ObzForm.ActiveTimeStart - SigTabRec.DateTimeStart)*(24*3600) / CurveDeltX.asfloat)*CurveDeltX.asfloat;
       RightX:=round((ObzForm.ActiveTimeEnd-SigTabRec.DateTimeStart)*(24*3600)/CurveDeltX.asfloat)*CurveDeltX.asfloat;
      end;
    end;
     if LeftX>SigTabRec.PointAll*CurveDeltX.asfloat then LeftX:=0;
     if RightX>SigTabRec.PointAll*CurveDeltX.asfloat then RightX:=(Sigtabrec.PointAll-1)*CurveDeltX.asfloat;
     UpdateCurvePointStartEnd;
     UpdateView(true,true);
    end;
   inherited;

 end;

 procedure TImageForm.wmGridXY( var Message:TMessage );
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
          if {FonDialog.bGridX.Checked }Grid_X.Checked then CurveGridX.Value:=75{FonDialog.XValue.Value }else
            CurveGridX.Value:=0;
          if {FonDialog.bGridY.Checked }Grid_Y.Checked then CurveGridY.Value:=1{FonDialog.YValue.Value }else
            CurveGridY.Value:=0    ;

          if message.lParam<>0 then CurveColorFon.Value:=message.lParam;
          Curve.Post;
          Nomer:=CurveView_Signal_Nomer.Value;
          if CurveVisible.Value =integer(true) then inc(cPageCurve);
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
    if Message.lParam>0 then
     begin
      PaintBox.Canvas.Brush.Color:=message.lparam;
      FonPanel.Color:=message.lParam;
//      FonDialog.Hide;
      UpdateView(true,false);{PaintBoxPaint(nil);}
//      FonDialog.Show;
     end else       UpdateView(True,false);{PaintBoxPaint(nil)}
    bOldCursor:=false;
   inherited;

 end;

 procedure TImageForm.SetFon( color:TColor );
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
          if CurveVisible.Value =integer(true) then inc(cPageCurve);
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

    bOldCursor:=false;
 end;

procedure TImageForm.Proc_UmenClick(Sender: TObject);
begin
 try
  Proc:=StrToFloat(ProcEdit.Text);
 except
   on EConvertError do Proc:= 30;
  end;
 case ProcRB.ItemIndex of
  0: Proc:=Proc/2;
  1: Proc:=Proc/5;
  2: Proc:=Proc/10;
 end;
 ProcEdit.Text:=FloatToStrF(Proc,ffGeneral,4,2);
 ProcEdit.Update;
end;

procedure TImageForm.Proc_UvelClick(Sender: TObject);
begin
 try
  Proc:=StrToFloat(ProcEdit.Text);
 except
   on EConvertError do Proc:= 30;
  end;
 case ProcRB.ItemIndex of
  0: Proc:=Proc*2;
  1: Proc:=Proc*5;
  2: Proc:=Proc*10;
 end;
 if Proc>100 then Proc:=100;
 ProcEdit.Text:=FloatToStrF(Proc,ffGeneral,4,2);
 ProcEdit.Update;
end;

procedure TImageForm.Proc_ShowClick(Sender: TObject);
var CenterPoint,DeltL:Longint;
begin
case TabbedNoteBook1.pageIndex of
0:begin
 try
  Proc:=StrToFloat(ProcEdit.Text);
 except
   on EConvertError do Proc:= 30;
  end;
 if Proc>=99.99 then
  begin
   LeftX:=0;RightX:=SigTabRec.PointAll*CurveDeltX.asfloat;
  end
   else
    begin
     CenterPoint:= CurvePointStart.value+((CurvePointEnd.Value-CurvePointStart.Value) div 2 );
     DeltL:=round(SigTabRec.PointAll*Proc/100/2);
     LeftX:=(CenterPoint-DeltL)*CurveDeltX.asfloat; if LeftX<0 then LeftX:=0;
     RightX:=(CenterPoint+DeltL)*CurveDeltX.asfloat; if RightX>SigTabRec.PointAll*CurveDeltX.asfloat then RightX:=SigTabRec.PointAll*CurveDeltX.asfloat ;
    end;
 end;
 1:begin
   XMinEditExit(nil);
   XMaxEditExit(nil);
   LeftX:=round(MinNastr/CurveDeltX.asfloat)*CurveDeltX.asfloat;
   RightX:=round(MaxNastr/CurveDeltX.asfloat)*CurveDeltX.asfloat;
   end;
  end;
 Proc:=(RightX-LeftX)/SigTabRec.PointAll*100*CurveDeltX.asfloat;
 ProcEdit.Text:=FloatToStrF(Proc,ffGeneral,4,2);
 UpdateCurvePointStartEnd;
 UpdateView(true,true);
 end;

procedure TImageForm.ShowProcBox(Sender: TObject);
begin
 LeftX:=CurvePointStart.Value*CurveDeltX.asfloat;
 RightX:=CurvePointEnd.Value*CurveDeltX.asfloat;
 Proc:=(RightX-LeftX)/SigTabRec.PointAll*100/CurveDeltX.asfloat;
 ProcEdit.Text:=FloatToStrF(Proc,ffGeneral,4,2);
 if sender<>nil then
  begin
   if bOldCursor then HideOldCursor;
   ProcBox.Visible:=True;
  end;
  KeyPreview:=false;
end;

procedure TImageForm.Proc_CloseClick(Sender: TObject);
begin
 if sender <>nil then
  begin
   ProcBox.Visible:=False;
   UpdateView(True,False)
  end;
 KeyPreview:=true;
 TabbedNoteBook1.PageIndex:=0;
end;

procedure TImageForm.Call_ProcClick(Sender: TObject);
var CrossWin_Rec:tCrossWin_Rec;
begin
 CallProcessing(sender,CrossWin_Rec);
end;

procedure TImageForm.wmEndProcessin( var Message:TMessage );
Label m1;
var
 i,j:word;
 pReturnRec:^TReturnRec;
 pNameDialog:TPageNameDialog;
 begin
   pReturnRec:=Pointer(Message.lParam);
   if Handle<>pReturnRec^.Parent_Handle then exit;
   case pReturnRec^.ProcRez_Type of
    cProcRez_is_Signal,cProcRez_is_FreqMAP,cProcRez_is_KxxMap:
     begin
      if preturnRec^.ShowWin=1 then
       begin
      M1:  for i:=0 to TabSet.Tabs.Count-1 do
         begin
          if pReturnRec^.PageName = TabSet.Tabs[i] then
           begin
             Application.CreateForm(TPageNameDialog, PNameDialog);
            PNameDialog.pagenameList.Items.Clear;
            for j:=0 to TabSet.Tabs.Count-1 do
              PNameDialog.pageNameList.Items.add(Tabset.Tabs[j]);
            PNameDialog.pageNameEdit.Text:=pReturnRec^.pageName;
            PNameDialog.ShowModal ;
            pReturnRec^.pageName:=PNameDialog.pageNameEdit.Text;
            pNameDialog.Free;
            goto M1;
           end;
         end
       end;
      if pReturnRec^.ShowWin>0 then
        for i:=0 to ViewPage.RecordCount-1 do ViewPage.FreeBookMark(BookMarkArr[i]);
{      InsertRezToSignalsTable(pReturnrec^);}
     AppConfig.IniFile.WriteInteger('system','FonColor',CurveColorFon.Value);

      InsertRez(pReturnRec^,CurveView_Nomer.Value,True,1,0);
      if pReturnRec^.ShowWin>0 then
       begin
        Obnovlenie_Image(TabSet.TabIndex);
{        UpdateView(True,true);}
        if pReturnRec^.ShowWin=2 then
         begin
{          UpdateView(True,true);        }
          UpdateCurvePointStartEnd;
          UpdateView(True,true);
         end{ else         UpdateView(True,true)};
       end;
     end;  {cProcRez_is_Signal}
     cProcRez_is_Text,cProcRez_is_Nothing:
      begin
       InsertRez(pReturnRec^,CurveView_Nomer.Value,True,1,0);
      end;
   end; {Case}
   inherited;
 end;

{
Procedure TImageForm.InsertRezToSignalsTable(ReturnRec:TReturnRec);
begin
  InsertRez(ReturnRec,CurveView_Nomer.Value,True);
 end;
 }
procedure TImageForm.N11Click(Sender: TObject);
begin
 if Pos('~',TabSet.Tabs[tabSet.TabIndex])=1 then
    begin
       Showmessage ('На странице поворота осей операция не применима!');
      exit;
    end;
 if NAllCurveInPage > 1 then
  begin
   DeleteCurve;
   TabsetClick(nil);
 end else
      begin
       Showmessage ('На странице единственная кривая!');
      end;
end;

Procedure TImageForm.DeleteCurve;
begin
   DeleteCurveFiles;
   Curve.Delete;
   Curve.Close;Curve.Open;Curve.fetchall;
  end;

Procedure TImageForm.DeleteCurveFiles;
var ss:string;
var
     pPolyX,pPolyY:pPolyArr;pSignalRec:pointer;
  begin
//   Curve.RequestLive:=True;
   ss:=CurvePolyFile.Value;
   Deletefile(pAnsiChar(ss));
{   if SigTabRec.Eksp_Nomer = 0 then
      Deletefile(SigTabRec.FileDat);}
   pPolyX:=pPolyArr(CurvepPolyX.Value);
   pPolyY:=pPolyArr(CurvepPolyY.Value);
   if pPolyX<>nil then Freemem(pPolyX,CurvePolyPoint.Value*Sizeof(Word)+Zapas);
   if pPolyY<>nil then Freemem(pPolyY,CurvePolyPoint.Value*Sizeof(Word)+Zapas);
   pSignalRec:=Pointer(CurvepSigTabRec.Value);
   if pSignalRec<>nil then FreeMem(pSignalRec,SizeOf(TSigTabRec));
  end;

procedure TImageForm.N12Click(Sender: TObject);
var
 cCurve:word;Nomer:Longint;
 i:word;
begin
 if Tabset.Tabs.Count>1 then
  begin
      {Curve.DisableControls;}
    for i:=0 to ViewPage.RecordCount-1 do ViewPage.FreeBookMark(BookMarkArr[i]);
    Try
     Curve.First;
     for CCurve:=0 to Curve.RecordCount-1 do
      begin
       deleteCurveFiles;
       Nomer:=CurveView_Signal_Nomer.Value;
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;  {??}
      end;
      Finally
      end; {try}
 dm.q.sql.Clear;
 dm.q.sql.Add('Delete from Curve where View_Nomer = :View_Nomer and ViewPage = :ViewPage ');
 dm.q.parambyname('View_Nomer').asinteger:=ViewNumber;
 dm.q.parambyname('ViewPage').asstring := Tabset.Tabs[tabset.tabindex];
 dm.q.execSQL;
 dm.q.Transaction.CommitRetaining;

  Obnovlenie_Image(TabSet.TabIndex);
  UpdateView(True,true);
  end else
      begin
       Showmessage ('В окне единственная страница!');
      end;
end;

procedure TImageForm.BitBtn2Click(Sender: TObject);
begin
 Call_ProcClick(sender);
end;

Procedure TImageForm.HideOldCursor;
  begin
     OldMode:=PaintBox.Canvas.Pen.Mode;
     PaintBox.Canvas.Pen.Mode:=pmNot;
     PaintBox.Canvas.MoveTo(XOld,PaintBox.Height-5);
     PaintBox.Canvas.LineTo(XOld,PaintBox.Height);
     PaintBox.Canvas.Pen.Mode:=OldMode;
     XCursorTime.Caption:='';
     XCursorTime.Update;
     bOldCursor:=False;
  end;

Procedure TImageForm.getCursorParam(X:integer; Var XStr:String;Var XR:double);
var
 dss:string; {t,tsek:double;}
 XRT, t, tSek:TDateTime;
 begin
 PointNumber:=0;
 if CurveViewMinX.Value<>CurveViewMaxX.Value then
  begin
   XR:=CurveViewMinX.Value+(x*(CurveViewMaxX.Value-CurveViewMinX.Value)/PaintBox.Width);

  PointNumber:=Round((x/PaintBox.Width*(CurveViewMaxX.Value-
                       CurveViewMinX.Value)/(CurveDeltX.asfloat/24/3600))+CurvePointStart.Value);

   if LabelNameX.Caption[1]<>'t' then XStr:=LabelNameX.Caption+'=';
   if LabelNameX.Caption='t,s' then XStr:='t,s=';
   if LabelNameX.Caption='t,min' then begin XR:=XR/60;XStr:='t,min=';end;
   if LabelNameX.Caption='t,hour' then begin XR:=XR/3600; XStr:='t,hour=';end;
   if LabelNameX.Caption='t' then
    begin

{     XR:=(pSigTabRec(CurvepSigTabRec.Value))^.DateTimeStart+
         (CurveViewMinX.Value+x*(CurveViewMaxX.Value-
               CurveViewMinX.Value)/PaintBox.Width)/24.0/3600.0;
     t:=(pSigTabRec(CurvepSigTabRec.Value))^.DateTimeStart+
         (CurveViewMinX.Value+x*(CurveViewMaxX.Value-
               CurveViewMinX.Value)/PaintBox.Width)/24.0/3600.0;
     tSek:=t*24*3600;
     dss:=formatfloat('0.000',tsek-trunc(tsek));
     delete(dss,1,1);
     XStr:='t='+formatdatetime('hh:mm:ss',XR)+dss;
 }

    XRT:=(pSigTabRec(CurvepSigTabRec.Value))^.DateTimeStart+(PointNumber+0.0)*CurveDeltX.asfloat/3600.0/24.0;
    t:=XRT;
    tSek:=t*24.0*3600.0;
    dss:=formatfloat('0.000',tsek-trunc(tsek));
    delete(dss,1,1);
//    XStr:='t='+formatdatetime('hh:mm:ss',XRT)+dss{+' '+formatfloat('0.0000000',CurveDeltX.asfloat)};
    XStr:='t='+formatdatetime('dd.mm.yy hh:mm',XRT){+dss{+' '+formatfloat('0.0000000',CurveDeltX.asfloat)};
    end
     else XStr:=XStr+floatToStrF(XR,ffGeneral,FormatAll,FormatAfterPoint);
//  PointNumber:=Round((x/PaintBox.Width*(CurveViewMaxX.Value-
//                       CurveViewMinX.Value)/CurveDeltX.asfloat))+CurvePointStart.Value;
  end
  else
    begin XStr:='?'; XR:=0; end;
end;

procedure TImageForm.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var XR:double;Yr,YRC:real; File_Dat:TBufferedFile;
  XStr:string;
  FirstLine,SecondLine : string[80];
begin
 if not bImageAvailable then exit;

 if bOnMouseDown then exit;
 if (Screen.activeform= self) and ((MultBox.Visible or ChanalBox.Visible or ProcBox.Visible)) then exit;
 if ((x <0) or  (Y <0) or (X>PaintBox.Width) or (Y>PaintBox.Height) )  then
  begin
   PaintBoxMouseUp(nil,mbleft,[ssleft],0,0);
   exit;
  end;
 GetCursorParam(X,XStr,XR);
 SigtabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 if SigTabRec.Ky<>0 then Yr:=(SigTabRec.RR1-Y)/SigTabrec.Ky;
 FirstLine:=XStr+'  Y= '+FloatToStrF(Yr,ffGeneral,FormatAll,FormatAfterPoint);
 File_Dat:=TBufferedFile.Create(SigTabRec.FileDat_abs,1024);
 File_Dat.Reset;
 GetRezFromFile(File_Dat,PointNumber,SigTabRec.A0,SigTabRec.A1,SigTabRec.A2,SigTabRec.A3,
                 SigTabRec.RezType,YrC,Status,SigTabRec.Seek_Start);
 File_Dat.Close;
 File_Dat.Destroy;
 SecondLine:='Отсчет № '+IntToStr(PointNumber)+' Y='+FloatToStrF(YrC,ffGeneral,FormatAll,FormatAfterPoint);
 MousLabel.Font.Color:=CurveColor.Value;
 if bOldCursor then HideOldcursor;
 OldMode:=PaintBox.Canvas.Pen.Mode;
 PaintBox.Canvas.Pen.Mode:=pmNot;
 PaintBox.Canvas.MoveTo(X,PaintBox.Height-5);
 PaintBox.Canvas.Lineto(X,PaintBox.Height);
 PaintBox.Canvas.Pen.Mode:=OldMode;
 XCursorTime.Caption:=XStr;
 XCursorTime.Left:=X-(XCursorTime.Width div 2);
 XCursorTime.Update;
 bOldCursor:=true;
 XOld:=X;
 XOldStr:=XStr;
 ViewMinXDB.Update;ViewMaxXDb.Update;
 YlastMouse:=Y;
 OldMode:=PaintBox.Canvas.Pen.Mode;
 MousLabel.DragMode:=dmManual;
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
       if LabelNameX.Caption='t' then
         TextXOld:='   dt='+FloatToStrF(abs(XR-XRLeft)*24*60,ffGeneral,7,4)+' мин'
          else TextXOld:='   dX='+FloatToStrF(abs(XR-XRLeft),ffGeneral,FormatAll,FormatAfterPoint);
       TextYOld:='   dY='+FloatToStrF(abs(YR-YRUP),ffGeneral,FormatAll,FormatAfterPoint);
       FirstLine:=FirstLine+TextXOld;
       SecondLine:=SecondLine+TextYOld;
        MousLabel.DragMode:=dmAutomatic;
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
 MousLabel.Caption:=FirstLine{+#10+#13+SecondLine};
 UpPanel.Update;
end;

procedure TImageForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
    vk_Space:begin
              bLeftShow:=False;
              bRightShow:=False;

           end;
  vk_Right:begin
              bLeftShow:=False;
              if  Shift = [ssCtrl] then   bRightShow:=True;
              RightXButtonClick(sender);
           end;
  vk_Left:begin
              bRightShow:=False;
              if  Shift = [ssCtrl] then   bLeftShow:=True;
              LeftXButtonClick(sender);
           end;
  Vk_Up:begin
          ShowProcBox(nil);
          Proc_UvelClick(nil);
          Proc_ShowClick(nil);
          Proc_CloseClick(nil);
         end;
  Vk_Down:begin
          ShowProcBox(nil);
          Proc_UmenClick(nil);
          Proc_ShowClick(nil);
          Proc_CloseClick(nil);
         end;
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
  end;
end;

procedure TImageForm.LeftXButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if ( ssCTrl in Shift ) then
  begin
   bleftShow:=True;
   bRightShow:=False;
   LeftXButtonClick(Sender);
  end;
end;

procedure TImageForm.RightXButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if (ssCtrl in Shift) then
  begin
   bleftShow:=false;
   bRightShow:=true;
   RightXButtonClick(Sender);
   end;
end;


procedure TImageForm.N20Click(Sender: TObject);
var InpStr:string;
begin
 inpStr:=InputBox('Задайте новый заголовок окна',
                  'Заголовок:', Caption);
 if inpStr=Caption then exit;
 Caption:=inpStr;
 MainmenuItem.Caption:=caption;
 ExpmenuItem.Caption:=caption;
 update;
// SelectViewQuery.RequestLive:=True;
 SelectViewQuery.Edit;
 SelectViewQueryView_Header.Value:=copy(InpStr,1,50);
 SelectViewQuery.Post;
 expform.CurvesetRefresh
end;

procedure TImageForm.N21Click(Sender: TObject);
var InpStr:string;
    Nomer:Longint;
    cCurve:word;
begin
 inpStr:=InputBox('Задайте новое наименование страницы',
                  'Страница:', TabSet.Tabs[TabSet.TabIndex]);
 if inpstr=TabSet.Tabs[TabSet.TabIndex] then exit;
 dm.q.sql.Clear;
 dm.q.sql.Add('update CURVE set ViewPage=:new_ViewPage ' +
              ' where View_Nomer= :View_Nomer and ViewPage=:old_ViewPage');
 dm.q.parambyname('new_ViewPage').asstring:=copy(inpStr,1,20);
 dm.q.parambyname('old_ViewPage').asstring:=TabSet.Tabs[TabSet.TabIndex];
 dm.q.parambyname('View_Nomer').asinteger:=ViewNumber;
 dm.q.execSQL;
 dm.q.Transaction.CommitRetaining;
 Obnovlenie_Image(TabSet.TabIndex);
end;

procedure TImageForm.XFonMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if sender <> XFon  then exit;
 Delt:=round((RightX-LeftX)/CurveDeltX.asfloat);
 if (x>(XActive.Left+(XActive.Width div 2)))  then
  begin
   RightX:=round((X-LeftXButton.Width+0.0)*(SigTabRec.PointAll+0.0)/(RightXButton.Left-
     LeftXBUtton.Width+0.0))*CurveDeltX.asfloat;
   if RightX>SigTabRec.PointAll*CurveDeltX.asfloat then RightX:=SigTabRec.PointAll*CurveDeltX.asfloat;
   if Shift <> [ssCtrl]+[ssleft] then LeftX:=RightX-Delt*CurveDeltX.asfloat;
   if LeftX<0 then LeftX:=0;
  end;
 if (x<=(XActive.Left+(XActive.Width div 2)))  then
  begin
   LeftX:=round((X-LeftXButton.Width+0.0)*(SigTabRec.PointAll+0.0)/(RightXButton.Left-
     LeftXBUtton.Width+0.0))*CurveDeltX.asfloat;
   if LeftX<0 then LeftX:=0;
   if Shift <> [ssCtrl]+[ssleft] then RightX:=LeftX+Delt*CurveDeltX.asfloat;
   if RightX>SigTabRec.PointAll*CurveDeltX.asfloat then RightX:=SigTabRec.PointAll*CurveDeltX.asfloat;
  end;
  Delt:=round((RightX-LeftX)/CurveDeltX.asfloat);
  UpdateCurvePointStartEnd;
  XActive.Update;
  UPdateView(true,True);
end;

procedure TImageForm.N22Click(Sender: TObject);
var DelayStr:string;
begin
 DelayStr:=intToStr(DelayTime);
 DelayStr:=InputBox(
  'Задайте временную задержку для быстрого просмотра',
  'Задержка просмотра(мс):', DelayStr);
 try
  DelayTime:=strToInt(DelayStr);
  except
   on EConvertError do DelayTime:= 0;
  end;
end;

procedure TImageForm.Button1Click(Sender: TObject);
var BookMark:TBookMark;
     Nomer:Longint;
     CurveWidth:word;
     CurveStil:word;
     cCurve:Longint;
begin
  Curve.Edit; //Curve.RequestLive:=True;
  Curve.Post;
  BookMark:=Curve.GetBookmark;
  Curve.DisableControls;
  Try
    CurveWidth:=CurveCurveWidth.Value;
    CurveStil:=CurveStyle.Value;
    Curve.First;
    cPageCurve:=0;
    for CCurve:=0 to Curve.RecordCount-1 do
     begin
      Curve.Edit;//Curve.RequestLive:=True;
      CurveCurveWidth.Value:=CurveWidth;
      CurveStyle.Value:=CurveStil;
      Curve.Post;
      Nomer:=CurveView_Signal_Nomer.Value;
      if CurveVisible.Value =integer(true) then inc(cPageCurve);
      Curve.Next;
      if Nomer=CurveView_Signal_Nomer.Value then break;
     end;
     NPageCurve:=cPageCurve;
     if NPageCurve=0 then NPageCurve:=1;

    Finally
    Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
  end; {try}
   PaintBox.Visible:=True;
   PaintBoxPaint(nil);
{   PaintBox.Update;}
end;

procedure TImageForm.N19Click(Sender: TObject);
begin
 if colordialog.execute then
  setfon(colordialog.Color);
end;

 procedure TImageForm.wmeXPORT( var Message:TMessage );
 begin
  if bExport then begin inherited;exit;end;
  bExport:=true; bStopExport:=false;
  ExportSigToFile(Self,false);
  inherited;
  bExport:=false;
 end;

 procedure TImageForm.PaintBoxClick(Sender: TObject);
var
   Msg: TMsg;
   TargetTime: LongInt;
   CurveNum,ccCurve,cCurve:integer;
   Nomer:longint;
   maxY,minY:real;
 begin
 { get the maximum time to wait for a double-click message }
   TargetTime := GetTickCount+GetDoubleClickTime;
 { cycle until DblClick received or wait time run out }
   while GetTickCount<TargetTime do
   if PeekMessage(Msg, Handle, WM_LBUTTONDBLCLK, WM_LBUTTONDBLCLK, PM_NOREMOVE)
 then   Exit; { Double clicked }
{   MessageDlg('Single clicked', mtInformation, [mbOK], 0);}
 if bRect then exit;
 if ((ScaleRb.ItemIndex = 2) or (ScaleRB.ItemIndex = 3)) then
  begin
   CurveNum:=trunc(NPageCurve/paintBox.Height*YLastMouse);
   Curve.DisableControls;
   Curve.First;     ccCurve:=0;
   for CCurve:=0 to Curve.RecordCount-1 do
     begin
{       if ccCurve=CurveNum then break;}
       Nomer:=CurveView_Signal_Nomer.Value;
       if CurveVisible.Value =integer(true) then
        begin
         if ccCurve=CurveNum then break;
         inc(ccCurve);
        end;
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
    NPageCurve:=cPageCurve;
    if NPageCurve=0 then NPageCurve:=1;

    Curve.EnableControls;
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;

    UpdateMaxMinYLabel;
    UpdateSliderS;
    UpdateCurvePointStartEnd;
    GetCurveMaxMinY(self,MaxY,MinY);
    case ScaleStyle of
     1:DrawAxisY(PaintBox1,0,PaintBox1.Height,
                       CurveColor.Value,CurveColorFon.Value,MaxY,MinY,PaintBox,CurveGridY.Value<>0);
    end ;

  end;
 { GroupBox.BeginDrag(false);
  PaintBox.Cursor:=crArrow;  }
 end;

Procedure TImageForm.AppendInCursChan(IdCursor:Longint;CursNum:integer);
var
    File_Dat:TBufferedFile;
    YR:Real;
    BookMark:TBookMark;
    cCurve:word;
    Nomer:Longint;
    s:string;
begin
  Grad:=0;Oborot:=0;
//  CursChan.Open;
  BookMark:=Curve.GetBookmark;
  Curve.DisableControls;
  Try
    Curve.First;
    for CCurve:=0 to Curve.RecordCount-1 do
     begin
      dm.Create_Curschan.ParamByName('Id_Cursors').value:=idCursor;
      dm.Create_Curschan.ParamByName('Chan_Num').value:=cCurve+1;
      dm.Create_Curschan.ParamByName('Chan_Name').value:=CurveCurveHeaderShort.Value;
      dm.Create_Curschan.ParamByName('Page_name').value:=Tabset.Tabs[Tabset.TabIndex];
      dm.Create_Curschan.ParamByName('Image_caption').value:=caption;
      SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
      File_Dat:=TBufferedFile.Create(SigTabRec.FileDat_abs,1024);
      File_Dat.Reset;
      GetRezFromFile(File_Dat,PointNumber,SigTabRec.A0,SigTabRec.A1,SigTabRec.A2,SigTabRec.A3,
                 SigTabRec.RezType,Yr,Status,SigTabRec.Seek_Start);
      File_Dat.Close;
      File_Dat.Destroy;
      dm.Create_Curschan.ParamByName('Value_').value:=YR;
      if cCurve=4 then Grad:=YR;
      if cCurve=5 then Oborot:=YR;
      dm.Create_Curschan.execproc;
      Nomer:=CurveView_Signal_Nomer.Value;
      Curve.Next;
      if Nomer=CurveView_Signal_Nomer.Value then break;
     end;
     NPageCurve:=cPageCurve;
     if NPageCurve=0 then NPageCurve:=1;

    Finally
    dm.CREATE_CURSCHAN.Transaction.CommitRetaining;
    Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
  end; {try}
(*  if pos('СТД_Об',TabSet.Tabs[Tabset.TabIndex])>0 then
   begin
    CursorTable.Open;
    if CursorTable.FindKey([idcursor]) then
     begin
      CursorTable.Edit;
      s:='';
      if CursNum<5 then s:=inttostr(CursNum)+'-1'
       else
        begin
         if CursNum<9 then s:=inttostr(CursNum-4)+'-2';
        end;
      CursorTableMemoStr.Value:=s+' '+FormatFloat('0',Oborot)+':'+FormatFloat('0',Grad)+' ';
      CursorRec.MemoStr:=CursorTableMemoStr.Value;
      CursorTablebMemo.Value:=true;
      CursorTable.Post;
     end;
    CursorTable.Close;
   end;
*)
 end;

procedure TImageForm.PaintBoxDblClick(Sender: TObject);
var
    idCursor:Longint;
begin
  if boborotnul then exit;
//  while not curve.Bof do Curve.Prior;
  if cursors_form=nil then Cursors_form:=TCursors_Form.Create(mainForm);
  Cursors_Form.Cursors.Close;
  Cursors_Form.Cursors.ParamByName('id_eksp_Parent_Param').asinteger :=SelectViewQueryEksp_Parent.Value;
  Cursors_Form.Cursors.ParamByName('AxisxName_Param').asString:=Sig_TableNameX.Value;
  Cursors_Form.Cursors.Open;
  Cursors_Form.GetCursorLastNumber(0,false);

  dm.Create_Cursor.ParamByName('Id_Eksp_Parent').value:=SelectViewQueryEksp_Parent.Value;
  dm.Create_Cursor.ParamByName('AxisXName').value:=Sig_TableNameX.Value;
  dm.Create_Cursor.ParamByName('PointNum').value:=PointNumber;
  dm.Create_Cursor.ParamByName('DeltX').value:=CurveDeltX.asfloat;
  dm.Create_Cursor.ParamByName('XStr').value:=XOldStr;
  dm.Create_Cursor.ParamByName('MemoStr').value:='';
  dm.Create_Cursor.ParamByName('bMemo').value:=integer(false);dm.Create_Cursor.ParamByName('bXStr').value:=integer(false);
  dm.Create_Cursor.ParamByName('Cursor_Num').value:=Cursors_Form.CursorLastNumber+1;
  CursorRec.PointNum:=PointNumber;
  CursorRec.XStr:=XOldStr;
  CursorRec.Cursor_Num:=Cursors_Form.CursorLastNumber+1;
  dm.Create_Cursor.ExecProc;
  IdCursor:=dm.Create_Cursor.ParamByName('ID').asinteger;
  dm.Create_Cursor.Transaction.CommitRetaining;
  Cursors_Form.cursorsRefresh;
  AppendInCursChan(IdCursor,CursorRec.Cursor_Num);
  dm.Create_Cursor.Transaction.CommitRetaining;
  Cursors_Form.GetCursorLastNumber(Handle,true);
end;

Procedure TImageForm.CloseCursorsList;
var
 i:integer;
 pCursRec:^TCursorRec;
begin
try
 if CursorsList<>nil then
  begin
   for i:=0 to CursorsList.Count-1 do
    begin
     pCursRec:=CursorsList.Items[i];
     pCursRec^.CursLabel.Destroy;
     pCursRec^.CursShape.Destroy;
     dispose(pCursRec);
    end;
  Freeandnil(CursorsList);

  end;
 except
 end;
 end;

procedure TImageForm.wmSetCursorsList( var Message:TMessage );
begin
 CloseCursorsList;
 CursorsList:=TList.Create;
 inherited;
end;

procedure TImageForm.wmAddCursorsList( var Message:TMessage );
var
 i:integer;
 pCursRec:^TCursorRec;
begin
 if CursorsList<>nil then
  begin
   new(pCursRec);
   pCursRec^.Cursor_Num:=Cursors_Form.CursorsCursor_num.Value;
   pCursRec^.id_Cursor_InCursorTable:=Cursors_Form.Cursorsid_Cursor.Value;
   pCursRec^.XStr:=Cursors_Form.CursorsXStr.Value;
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
   pCursRec^.CursLabel.Font.Style:=[fsBold];
   pCursRec^.CursLabel.Font.Color:=clRed;
   pCursRec^.CursLabel.Hint:=pCursRec^.XStr;
   pCursRec^.CursLabel.ShowHint:=true;
   pCursRec^.CursLabel.pCursRec:=pCursRec;
   pCursRec^.CursLabel.PopupMenu:=CursorMenu;
   pCursRec^.CursShape:=TCursorShape.Create(Self);
   pCursRec^.CursShape.Parent:=FonPanel;
   pCursRec^.CursShape.Visible:=false;
   pCursRec^.CursShape.DragMode:=dmAutomatic;
   pCursRec^.CursShape.Left:=0;pCursRec^.CursShape.Width:=2;
   pCursRec^.CursShape.Top:=2;pCursRec^.CursShape.Height:=PaintBox.Width-1;
   pCursRec^.CursShape.Pen.Mode:=pmNot;
   pCursRec^.CursShape.Cursor:=crSizeWE;
   pCursRec^.CursShape.pCursRec:=pCursRec;
   CursorsList.Add(pCursRec);
  end;
 inherited;
end;

procedure TImageForm.wmDeleteCursor( var Message:TMessage );
begin
 PaintBoxPaint(nil);
 inherited;
end;

procedure TImageForm.wmShowCursor( var Message:TMessage );
var LP,RP:Longint;
begin
   if ((Message.lParam < LeftX/CurveDeltX.asfloat) or (Message.lParam > RightX/CurveDeltX.asfloat)) then
   begin
    Show;
    LP:=Message.lParam - round((RightX- leftX)/CurveDeltX.asfloat)div 2;
    RP:=Message.lParam + round((Rightx- leftx)/CurveDeltX.asfloat) div 2;
    if LP<0 then LP:=0;
    if RP>SigTabRec.PointAll then RP:=Sigtabrec.PointAll-1;
    LeftX:=LP*CurveDeltX.asfloat;RightX:=RP*CurveDeltX.asfloat;
    UpdateCurvePointStartEnd;
    UpdateView(true,true);
  end;
 inherited;
end;

Procedure TImageForm.DrawCursor(CursorRec:TCursorRec;bWithLabel:boolean;Width:word);
var
    XCoord:Word;
begin
 if CursorRec.Cursor_Num = 0 then exit;
     XCoord:=0;
     if Leftx<>Rightx then
      XCoord:=round((CursorRec.PointNum-Leftx/CurveDeltX.asfloat)*(Width+0.0)/((Rightx-Leftx)/CurveDeltX.asfloat));
     if bWithLabel then
      begin
       CursorRec.CursLabel.Left:=XCoord+1+PaintBox1.Width;
       CursorRec.CursLabel.Color:=CurveColorFon.Value;
       CursorRec.CursLabel.Visible:=True;
       CursorRec.CursShape.Left:=XCoord+PaintBox1.Width;
       CursorRec.CursShape.Height:=PaintBox.Height;
       CursorRec.CursShape.Visible:=True;
      end;
end;

procedure TImageForm.ProcessingCursorForm(bWithGetLastN:boolean);
begin
if not assigned(Cursors_Form) then Cursors_form:=TCursors_form.create(Mainform);
if ((Cursors_Form.Cursors.ParamByName('id_eksp_Parent_Param').asinteger <>SelectViewQueryEksp_Parent.Value) or
  (Cursors_Form.Cursors.ParamByName('AxisxName_Param').asString<>Sig_TableNameX.Value)) then
   begin;
    Cursors_Form.Cursors.Close;
    Cursors_Form.Cursors.ParamByName('id_eksp_Parent_Param').asinteger :=SelectViewQueryEksp_Parent.Value;
    Cursors_Form.Cursors.ParamByName('AxisxName_Param').asString:=Sig_TableNameX.Value;
    Cursors_Form.Cursors.Open;
   end;
if bWithGetLastN then Cursors_Form.GetCursorLastNumber(Handle,true);
{  if Cursors_Form.FormStyle=fsStayOnTop then Cursors_Form.Show;}
 Cursors_Form.CreateObzor.Enabled:=true;
 Cursors_Form.Point_Do.MaxValue:=SigTabRec.PointAll-1;
 Cursors_Form.Point_Posle.MaxValue:=SigTabRec.PointAll-1;

end;

procedure TImageForm.N23Click(Sender: TObject);
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
   dm.q.SQL.Clear;
//   if CursRec.bXStr then bXStrStr:='"True"' else bXStrStr:='"false"';
//   if CursRec.bMemo then bMemoStr:='"True"' else bMemoStr:='"false"';
   dm.q.SQL.ADD('Update Cursors set bXStr = '+inttostr(integer(CursRec.bXStr))+
    ', bMemo = ' + inttostr(integer(CursRec.bMemo))+
          ' where Id_Cursor = '+IntToStr(CursRec.id_Cursor_InCursorTable));
   dm.q.ExecSQL;
   dm.q.Transaction.CommitRetaining;
   Cursors_Form.CursorsRefresh;
end;

procedure TImageForm.N26Click(Sender: TObject);
var CursRec:TCursorRec;
 s1:aNSIstring;
begin
{   ProcessingCursorForm(False);}
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
   dm.q.SQL.Clear;
   dm.q.SQL.ADD('Update Cursors set  bMemo = '+inttostr(integer(true))+', memoStr = '
       +':MemoStr  where Id_Cursor = '+IntToStr(CursRec.id_Cursor_InCursorTable));
   dm.q.ParamByName('memostr').asstring:=cursrec.MemoStr;
   dm.q.ExecSQL;
   dm.q.transaction.CommitRetaining;
   cursors_form.CursorsRefresh;
end;

procedure TImageForm.N24Click(Sender: TObject);
var CursRec:TCursorRec;
begin
{   ProcessingCursorForm(False);}
   CursRec:=TCursorRec(TCursorLabel(CursorMenu.PopupComponent).pCursRec^);
   Cursors_Form.DelCursor(CursRec.id_Cursor_InCursorTable,Handle);
   UpdateView(True,false);
end;

procedure TImageForm.N27Click(Sender: TObject);
var CursRec:TCursorRec;
begin
{   ProcessingCursorForm(False);}
   CursRec:=TCursorRec(TCursorLabel(CursorMenu.PopupComponent).pCursRec^);
   Cursors_Form.ShowCursor(CursRec.id_Cursor_InCursorTable);
end;

procedure TImageForm.PaintBoxDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
  var XR:double;r1,r2:single;
begin
 if not (MainForm.ActiveForm is TImageForm)  then begin Accept:=false; exit;end;
 Accept:= ((Source is TcursorShape) or
  ((Source is TShape) and (TShape(Source).Name = 'DragShape'))
 {   or (Source is TLabel) }or (Source is TTabSet));
 if not Accept then exit;
 if ((Source is TShape) and (TShape(Source).Name = 'DragShape'))  then
  begin

(*{   ScaleX_Panel.Width:=X+2;
   TShape(Source).Left:=X-8;
   ScaleX_Panel.Update;
}   if X-63<ScaleX_Panel.Left then
     begin
      ScaleX_Label.Text:='?'
     end
      else
  *)     begin
       ScaleX_Panel.Width:=X-ScaleX_Panel.Left+37;
       if ScaleX_Panel.Width<25 then ScaleX_Panel.Width:=25;
       ScaleX_Shape.Width:=ScaleX_Panel.Width-6;
       DragShape.Left:=ScaleX_Panel.Width-8;
       ScaleX_Label.Text:=FloatToStrF(ScaleX_Shape.Width/PaintBox.Width*RealRazmahX,
         ffGeneral,FormatAll,FormatAfterPoint)+' '+RealXDimension;
         exit;
       end;
  end;
 if (Source is TcursorShape) then
  begin
   GetCursorParam(X,XOldStr,XR);
   MousLabel.Caption:=XOldStr+chr(10)+chr(13)+' Point № '+IntToStr(PointNumber);
  end else
   begin
    if (mainForm.ActiveForm = self) then
     begin Accept:=false; exit;end;
    r1:=CurveDeltX.asfloat;
    r2:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveDeltX.asfloat;
    if r1<>r2  then begin Accept:=false; exit;end;
   end;
end;

procedure TImageForm.PaintBoxDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var r1,r2:single; cCurve,Nomer:longint; BookMark,BookMark1:TBookMark;
cn1,cn2:longint;
oldMemo:string;
begin
if not (MainForm.ActiveForm is TImageForm)  then  exit;
DragDrop_in_Image(self,Sender,Source,x,y,CurveColorFon.Value);
(*if Source is TCursorShape then
 begin
 with source as tCursorShape do
  begin
   Left:=x;
   TCursorRec(pCursrec^).CursLabel.Left:=X;
   TCursorRec(pCursrec^).PointNum:=Round((x/PaintBox.Width*(CurveViewMaxX.Value-
                       CurveViewMinX.Value)/CurveDeltX.asfloat))+CurvePointStart.Value;
   PointNumber:= TCursorRec(pCursrec^).PointNum;
   dm.q.UpdateCursorTable.SQL.Clear;
   dm.q.SQL.ADD('Update Cursors set XStr = "'+XOldStr+'", PointNum = ' + intToStr( PointNumber)+
          ' where Id_Cursor = '+IntToStr(TCursorRec(pCursrec^).id_Cursor_InCursorTable));
   dm.q.ExecSQL;
   Cursors_Form.DelInCursChan(TCursorRec(pCursrec^).id_Cursor_InCursorTable);
   CursorRec:=TCursorRec(pCursrec^);
   AppendInCursChan(TCursorRec(pCursrec^).id_Cursor_InCursorTable);
   Cursors_Form.Cursors.Close;
   Cursors_Form.Cursors.Open;
   if Cursors_Form.Visible then Cursors_Form.ShowCursor(TCursorRec(pCursrec^).id_Cursor_InCursorTable);
   TCursorRec(pCursrec^).CursLabel.Caption:=intToStr(TCursorRec(pCursrec^).Cursor_Num);
   TCursorRec(pCursrec^).CursLabel.Hint:=XOldStr;
   TCursorRec(pCursrec^).MemoStr:=CursorRec.MemoStr;
   if TCursorRec(pCursrec^).bXStr then TCursorRec(pCursrec^).CursLabel.Caption:=TCursorRec(pCursrec^).CursLabel.Caption+
           chr(10)+chr(13)+XoldStr;
   if TCursorRec(pCursrec^).bMemo then TCursorRec(pCursrec^).CursLabel.Caption:=TCursorRec(pCursrec^).CursLabel.Caption+
           chr(10)+chr(13)+TCursorRec(pCursrec^).MemoStr;
   exit;
  end;
 end;

 if ((Source is TLabel) and (TLabel(Source).Caption='Канал')) then
 begin
  if (mainForm.ActiveForm = self) then exit;
  r1:=CurveDeltX.asfloat;
  r2:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveDeltX.asfloat;
  if r1<>r2 then exit;
  InserCurve(Self,true);
 end;
 if ((Source is TLabel) and (TLabel(Source).Name='MousLabel')) then
 begin
  if (mainForm.ActiveForm = self) then exit;
  r1:=CurveDeltX.asfloat;
  r2:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveDeltX.asfloat;
  if r1<>r2 then exit;
  BookMark:=TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.GetBookmark;
  TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.DisableControls;
  Cn1:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveNum1;
  cn2:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveNum2;
  Try
     TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.First;
     TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.First;
     cCurve:=0;
     while not TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.EOF do
{     for CCurve:=0 to TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.RecordCount-1 do}
      begin
      if ((cCurve >=Cn1) and
          (cCurve <=cn2))then
       begin
        if TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveVisible.Value then
        begin
        BookMark1:=TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.GetBookmark;
        InsertZoom(TIMAGEFORM(MAINFORM.ACTIVEFORM),cCurve,cCurve,false,
                    TIMAGEFORM(MAINFORM.ACTIVEFORM).PointNumberLeft,
                    TIMAGEFORM(MAINFORM.ACTIVEFORM).PointNumber,
                                             false,true,ViewNumber);
        TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.GotoBookMark(BookMark1);
        end;
       end;
       Nomer:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveView_Signal_Nomer.Value;
       TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.Next;
       inc(cCurve);
{       if Nomer=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveView_Signal_Nomer.Value then break;}
      end;
    Finally
     TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.GotoBookMark(BookMark);
     TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.EnableControls;
     TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.FreeBookMark(BookMark);
     TIMAGEFORM(MAINFORM.ACTIVEFORM).SigTabRec:=(pSigTabRec(TIMAGEFORM(MAINFORM.ACTIVEFORM).CurvepSigTabRec.Value))^;
   end; {try}
  TIMAGEFORM(MAINFORM.ACTIVEFORM).Show;
  Obnovlenie_Image(TabSet.TabIndex);
  Show;
{  Createpoly(PaintBox.Width,PaintBox.Height,0,0);}
{  UpdateView(True,true);}
{  Createpoly(PaintBox.Width,PaintBox.Height,0,0);}
  UpdateCurvePointStartEnd;
  UpdateView(True,true);
 end;

 if (Source is TTabSet)  then
 begin
  if (mainForm.ActiveForm = self) then exit;
  r1:=CurveDeltX.asfloat;
  r2:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveDeltX.asfloat;
  if r1<>r2 then exit;
  with TIMAGEFORM(MAINFORM.ACTIVEFORM) do
  begin
   BookMark:=Curve.GetBookmark;
   Curve.DisableControls;
   Try
     Curve.First;
     for CCurve:=0 to Curve.RecordCount-1 do
      begin
       if CurveVisible.Value then InserCurve(Self,false);
       Nomer:=CurveView_Signal_Nomer.Value;
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
     Finally
     Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
     SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
   end; {try}
  end;
  TIMAGEFORM(MAINFORM.ACTIVEFORM).Show;
  Obnovlenie_Image(TabSet.TabIndex);
  Show;
  UpdateView(True,True);
 end;
*)
end;

procedure TImageForm.wmSetCursorFromObzorka( var Message:TMessage );
 var obzForm:TObzorkaForm;
 begin
   obzForm:=Pointer(Message.lParam);
   if (((SigTabRec.Eksp_Nomer=ObzForm.SelectViewQueryEksp_Parent.Value) or
       (SelectViewQueryEksp_Parent.Value=ObzForm.SelectViewQueryEksp_Parent.Value) )
        and (Sig_TableNameX.Value='t')  and
         (ObzForm.SelectViewQueryView_Style.Value = cTimeMap_View))
         then
    begin
      Cursors_Form.GetCursorLastNumber(Handle,true);
      UpdateView(True,false);
    end;
   inherited;
 end;


 procedure TImageForm.wmDelCursorFromObzorka( var Message:TMessage );
 var
obzForm:TObzorkaForm;
      i:longint;
      id_Curs:Longint;
 begin
   obzForm:=Pointer(Message.lParam);
   if (((SigTabRec.Eksp_Nomer=ObzForm.SelectViewQueryEksp_Parent.Value) or
       (SelectViewQueryEksp_Parent.Value=ObzForm.SelectViewQueryEksp_Parent.Value) )
        and (Sig_TableNameX.Value='t')  and
         (ObzForm.SelectViewQueryView_Style.Value = cTimeMap_View))
         then
    begin
       Cursors_Form.GetCursorLastNumber(Handle,true);
       UpdateView(True,false);
    end;
   inherited;
 end;

procedure TImageForm.FormShow(Sender: TObject);
begin
 ProcessingCursorForm(true);
end;

procedure TImageForm.CursorMenuPopup(Sender: TObject);
begin
ProcessingCursorForm(false);
end;

procedure TImageForm.AudioItemClick(Sender: TObject);
var
 AudioForm:TAudioForm;
begin
 Application.CreateForm(TAudioForm, AudioForm);
 AudioForm.SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 AudioForm.Messhandle:=Handle;
 AudioForm.Caption:=Caption+' '+Tabset.Tabs[Tabset.TabIndex]+' '+CurveCurveHeaderShort.Value;
 AudioForm.SourceSignal.Caption:='Канал '+CurveCurveHeaderShort.Value;
 UpdateMaxMinYLabel;
 AudioForm.MaxOnCurve:=strtOfLOAT(MaxYLabel.Caption);
 AudioForm.MinOnCurve:=strtOfLOAT(MinYLabel.Caption);
// WindowState:=wsMinimized;
 AudioForm.ShowModal;
end;

 procedure TImageForm.wmSetCursorFromAudio( var Message:TMessage );
 begin
   PointNumber:=Message.lParam;
   SetCursorFromAudio(TImageForm(Self),true);
   inherited;
 end;

 procedure TImageForm.wmNextChan_FromAudio( var Message:TMessage );
 begin
  Curve.Next;
  DBNavigator1Click(nil, nbNext);
  UpdateMaxMinYLabel;
  TAudioForm(Pointer(message.lParam)).SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
  TAudioForm(Pointer(message.lParam)).Caption:=Caption+' '+Tabset.Tabs[Tabset.TabIndex]+' '+CurveCurveHeaderShort.Value;
  TAudioForm(Pointer(message.lParam)).SourceSignal.Caption:='Канал '+  CurveCurveHeaderShort.Value;
  TAudioForm(Pointer(message.lParam)).MaxOnCurve:=strtOfLOAT(MaxYLabel.Caption);
  TAudioForm(Pointer(message.lParam)).MinOnCurve:=strtOfLOAT(MinYLabel.Caption);
  inherited;
 end;

 procedure TImageForm.wmPrevChan_FromAudio( var Message:TMessage );
 begin
  Curve.Prior;
  DBNavigator1Click(nil, nbPrior);
  UpdateMaxMinYLabel;
  TAudioForm(Pointer(message.lParam)).SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
  TAudioForm(Pointer(message.lParam)).Caption:=Caption+' '+Tabset.Tabs[Tabset.TabIndex]+' '+CurveCurveHeaderShort.Value;
  TAudioForm(Pointer(message.lParam)).SourceSignal.Caption:='Канал '+ CurveCurveHeaderShort.Value;
  TAudioForm(Pointer(message.lParam)).MaxOnCurve:=strtOfLOAT(MaxYLabel.Caption);
  TAudioForm(Pointer(message.lParam)).MinOnCurve:=strtOfLOAT(MinYLabel.Caption);
  inherited;
 end;

procedure TImageForm.Povorot_ButtonClick(Sender: TObject);
begin
  Make_Povorot(Self);
end;

procedure TImageForm.N28Click(Sender: TObject);
var bookMark:tBookMark;
begin
 Curve.Edit; CurveVisible.Value:=not CurveVisible.Value; Curve.Post;
 UpdateView(True,False);
end;

procedure TImageForm.Button2Click(Sender: TObject);
begin
 if ColorDialog.Execute then
   begin
    Curve.Edit;CurveColor.Value:=ColorDialog.Color;Curve.Post;
    PaintBox.Visible:=True;
    UpdateView(True,false);
   end;
end;


procedure TImageForm.N32Click(Sender: TObject);
begin
 (*OpenEksForm.DeleteQuery.SQL.Clear;
 if Sender = n32 then OpenEksForm.DeleteQuery.SQL.ADD(
  'Update eksp set Eksp_selected = 1 where Eksp_Nomer = '+IntToStr(Sig_TableEksp_Nomer.Value));
 if sender = n33 then OpenEksForm.DeleteQuery.SQL.ADD(
  'Update eksp set Eksp_selected = 0 where Eksp_Nomer = '+IntToStr(Sig_TableEksp_Nomer.Value));
 OpenEksForm.DeleteQuery.ExecSQL;
*) {N31Click(nil);}
end;

procedure TImageForm.MenuItem2Click(Sender: TObject);
begin
// OpenEksForm.DeleteQuery.SQL.Clear;
end;

procedure TImageForm.SliderSChange(Sender: TObject);
begin
 SliderS.Hint:=FloatToStrF((SliderS.MaxValue-SliderS.Value)/(SliderS.MaxValue-SliderS.Minvalue)-0.5,
    ffGeneral,FormatAll,FormatAfterPoint);
end;

procedure TImageForm.PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if bRect then
  begin
   bOnMouseDown:=true;
   if ((ScaleRb.ItemIndex = 2) or (ScaleRB.ItemIndex = 3)) then
          begin
           CurveNum1:=trunc(NAllCurveInPage/paintBox.Height*YRectUp);  {NPageCurve}
           CurveNum2:=trunc(NAllCurveInPage/paintBox.Height*YRectLast);
           if CurveNum1>CurveNum2 then
            begin
             CurveNum2:=trunc(NAllCurveInPage/paintBox.Height*YRectUp);
             CurveNum1:=trunc(NAllCurveInPage/paintBox.Height*YRectLast);
            end;
          end else begin
                     CurveNum1:=0;
                     CurveNum2:=NAllCurveInPage-1;
                   end;
   if ((Shift = [ssCtrl]) or (Shift = [ssAlt])) then
    begin
     MousLabel.Caption:='Creating Zoom-image';MousLabel.Update;
     Curve.DisableControls;
     InsertZoom(Self,Self,CurveNum1,CurveNum2,false,PointNumber,PointNumberLeft,(Shift = [ssAlt]),false,0);
     Curve.EnableControls;
     MousLabel.Caption:=' ';MousLabel.Update;
    end;
   bRect:=False;
 end
end;

procedure TImageForm.PaintBoxMouseDown(Sender: TObject;
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

procedure TImageForm.XMinEditExit(Sender: TObject);
var tt:string; NP:longint;
begin
 try
  MinNastr:=StrToFloat(XMinEdit.Text);
 except
   on EconvertError do
    begin
     Sig_TableNameXGetText(nil,tt,false);
     exit;
    end;
  end;
 case CurveAxisXStyle.Value of
  0,2:MinNastr:=MinNastr*60;
  3:MinNastr:=MinNastr*3600;
 end;
 NP:=round(MinNastr/CurveDeltX.asfloat);
 if ((NP<0) or (NP>Rightx/CurveDeltX.asfloat)) then
  begin
     Sig_TableNameXGetText(nil,tt,false);
     exit;
  end;
 end;

procedure TImageForm.XMaxEditExit(Sender: TObject);
var tt:string; NP:Longint;
begin
 try
  maxNastr:=StrToFloat(XmaxEdit.Text);
 except
   on EconvertError do
    begin
     Sig_TableNameXGetText(nil,tt,false);
     exit;
    end;
  end;
 case CurveAxisXStyle.Value of
  0,2:maxNastr:=maxNastr*60;
  3:maxNastr:=maxNastr*3600;
 end;
 NP:=round(maxNastr/CurveDeltX.asfloat);
 if ( (NP<Leftx/CurveDeltX.asfloat) or (NP>SigTabRec.PointAll))then
  begin
     Sig_TableNameXGetText(nil,tt,false);
     exit;
  end;

end;

procedure TImageForm.SaveAsEkspClick(Sender: TObject);
begin
 Save_As_Eksp(Self,sender);
end;

procedure TImageForm.YX_menuItemClick(Sender: TObject);
begin
     Curve.DisableControls;
     PointNumberLeft:=CurvePointStart.Value;
     PointNumber:=CurvePointEnd.Value;
     InsertZoom(Self,Self,0,NPageCurve-1,true,PointNumber,PointNumberLeft,false,false,0);
     Curve.EnableControls;
end;

procedure TImageForm.N4Click(Sender: TObject);
begin
 CallStyleForm(Self);
end;

procedure TImageForm.TabSetMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 if shift = [ssleft] then Tabset.begindrag(false);
end;

procedure TImageForm.ScaleX_ItemClick(Sender: TObject);
begin
 ScaleX_Item.Checked:=not ScaleX_Item.Checked;
 ScaleX_Panel.Visible:=ScaleX_Item.Checked;
end;

procedure TImageForm.ScaleX_LabelClick(Sender: TObject);
begin
 ScaleX_Label.Text:=FloatToStrF(ScaleX_Shape.Width/PaintBox.Width*RealRazmahX,
  ffGeneral,FormatAll,FormatAfterPoint);
end;

procedure TImageForm.ScaleX_LabelExit(Sender: TObject);
var sc_X:real; Wwwidth:real;
begin
 try
  Sc_X:=StrToFloat(ScaleX_Label.Text);
 except
   on EConvertError do
    begin
    ScaleX_Label.Text:=FloatToStrF(ScaleX_Shape.Width/PaintBox.Width*RealRazmahX,
  ffGeneral,FormatAll,FormatAfterPoint);
    exit;
    end;
  end;
  wwWidth:=PaintBox.Width*SC_X/RealRazmahX;
  if ((wwWidth > 400) or (WWWidth <55)) then
   begin
    ScaleX_Label.Text:=FloatToStrF(ScaleX_Shape.Width/PaintBox.Width*RealRazmahX,
       ffGeneral,FormatAll,FormatAfterPoint)+RealXDimension;
    exit;
   end;
  ScaleX_Shape.Width:=round(PaintBox.Width*SC_X/RealRazmahX);
  ScaleX_Panel.Width:=ScaleX_Shape.Width+6;
  DragShape.Left:=ScaleX_Shape.Width-5;
  ScaleX_Label.Text:=FloatToStrF(ScaleX_Shape.Width/PaintBox.Width*RealRazmahX,
       ffGeneral,FormatAll,FormatAfterPoint)+RealXDimension;
end;

procedure TImageForm.Scale_menuItemClick(Sender: TObject);
begin
 Scale_Help_Form.ImForm:=self;
// Scale_Help_Form.YXForm:=nil;
 Scale_Help_Form.ShowModal;
end;

procedure TImageForm.NPEClick(Sender: TObject);
begin
 ScaleMenuClick(self,sender);
end;

procedure TImageForm.Check_DopuskClick(Sender: TObject);
begin
(* if Level_Form.Running then
    MessageDlg(Mes_Ini.ReadString('Image','s16','Окно допускового контроля занято поиском')
         ,mtError,[mbOK], 0)
  else
   begin
    Level_Form.ImForm:=Self;
    Level_Form.iFirst:=CurvePointStart.Value;
    Level_Form.Button2.Visible:=false;
    Level_Form.Button4.Visible:=false;
    Level_Form.Show;
   end;
*)end;

procedure TImageForm.Grid_YClick(Sender: TObject);
begin
 Grid_Y.Checked:=not Grid_Y.Checked;
 SendMessage(Handle, wm_SetFon,0,0);
 UpdateView(True,false);
end;

procedure TImageForm.Grid_XClick(Sender: TObject);
begin
 Grid_X.Checked:=not Grid_X.Checked;
 SendMessage(Handle, wm_SetFon,0,0);
 UpdateView(True,false);
end;

procedure TImageForm.PopupMenu_ScalePopup(Sender: TObject);
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


Procedure TImageForm.SetCursorFromAudio(ImForm:TForm;bRepaint:boolean);
   begin
    with ImForm as TIMageForm do
     begin
      if LabelNameX.Caption='t,s' then XOldStr:='t,s='+
        floatToStrF({CurveViewMinX.Value+}PointNumber*CurveDeltX.asfloat,ffGeneral,FormatAll,FormatAfterPoint);
      if LabelNameX.Caption='t,min' then XOldStr:='t,min='+
        floatToStrF(({CurveViewMinX.Value+}PointNumber*CurveDeltX.asfloat)/60,ffGeneral,FormatAll,FormatAfterPoint);
      if LabelNameX.Caption='t,hour' then XOldStr:='t,hour='+
        floatToStrF(({CurveViewMinX.Value+}PointNumber*CurveDeltX.asfloat)/3600,ffGeneral,FormatAll,FormatAfterPoint);
      if LabelNameX.Caption='t' then XOldStr:='t='+
        DateTimeToStr(SigTabRec.DateTimeStart+(PointNumber*CurveDeltX.asfloat)/24/3600);
      PaintBoxDblClick(nil);
      if bRepaint then UpdateView(True,false);
    end;
   end;

 procedure TImageForm.EXportSigToFile( ImForm:TForm; bWithoutExportForm:boolean );
type
{$A-}

  TExpLongShapka = record
    bMaxMinExistAll, bMaxMinExist: boolean;
    rMaxX, rMinX, rMaxY, rMinY: single;
    ActChanal: byte; {  ЄвЁў­л© Є ­ « -    ­г¬Ґа жЁп ®в 0}
    NChanal: byte; { бЄ®«мЄ® ўбҐЈ® Є ­ «®ў. „«п ®¤­®Є ­ «м­®Ј® - 1, ¤«п 2-е Є ­ «®ў - 2  Ё в.¤. }
    lPointStart, lPointEnd, lPointAll: longInt;
    rTimeStart: single;
    shTimeFormat: shortint;
    rClock: single; {з бв®в  ¤ЁбЄаҐвЁ§ жЁЁ ѓж}
    bCreated: boolean;
    scAxisX, scAxisY: TAxisStr; {®Ў®§­ зҐ­ЁҐ ®бҐ©}
    ScFile: TFileNameStr;
    TipData: byte;
    LADC: longint;
    MaxRez: single;
    scHeader: THeaderStr;
    AbsTime: tDateTimeRec_Gemis;
    fText: tFileNameStr;
    pPrimech: PrimechPtr;
  end;

{$A+}

 var
  Shap1:TExpLongShapka;
  Rez:single; Rez1:real;
  FileDest:TFileStream;FileSource:TBufferedFile;
//  FileDestTxt:text;
  Point,Chan,i:Longint;
  BookMark:TBookMark;
  Nomer:Longint;
  cCurve:Longint;
  Status:integer;
  FormatS_X,FormatS_Y:shortstring;
  s,ss:string;
  Strings:TStringList;
 begin
   SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
   if (bWithoutExportForm or (Export_Form.ShowModal = mrOK)) then
    begin
    with Shap1 do
     begin
       bMaxMinExistAll:=false;
       bMaxMinExist:=False;
       rMaxX:=0;rMinX:=0;rMaxY:=0;rMinY:=0;
       ActChanal:=0;
       case Export_Form.Active_Visible.ItemIndex of
        0: NChanal:=1;
        1: NChanal:=TImageForm(ImForm).NPageCurve;
        2: NChanal:=TImageForm(ImForm).NAllCurveInPage;
       end;
       lPointStart:=0;
       case Export_Form.Part_All.ItemIndex of
        0:begin
           lPointAll:=SigTabRec.PointAll;
           decodeDate(SigTabRec.DateTimeStart,AbsTime.Year,AbsTime.Month,AbsTime.Day);
           decodeTime(SigTabRec.DateTimeStart,AbsTime.Hour,AbsTime.Minute,AbsTime.Second,absTime.Sec100);
          end;
        1:begin
           lPointAll:=CurvePointEnd.Value-CurvePointStart.Value;
           decodeDate(SigTabRec.DateTimeStart+CurvePointStart.Value*CurveDeltX.asfloat/(24*3600),
                AbsTime.Year,AbsTime.Month,AbsTime.Day);
           decodeTime(SigTabRec.DateTimeStart+CurvePointStart.Value*CurveDeltX.asfloat/(24*3600),
                 AbsTime.Hour,AbsTime.Minute,AbsTime.Second,absTime.Sec100);
          end;
       end;
       lPointEnd:=lPointAll-1;
       rTimeStart:=0;
       shTimeFormat:=0;
       rClock:=1/CurveDeltX.asfloat;
       bCreated:=false;
       scAxisX:=LabelNameX.Caption;
       scAxisY:=CurveCurveHeaderShort.Value;
       ScFile:=extractfilename(Export_Form.FileName.caption);
       TipData:=cRealLong;
       LADC:=512;
       MaxRez:=1;
       scHeader:=scFile;
       fText:='';
     end;  {with}
   PB.min:=0;PB.Max:=Shap1.lPointAll*Shap1.NChanal;
   PB.Visible:=True;
   case Export_Form.SaveDialog.FilterIndex of
   1:  // lng
   begin
   if Fileexists(Export_Form.FileName.caption) then FileDest:=TFileStream.Create(Export_Form.FileName.Caption,fmOpenwrite)
    else FileDest:=TFileStream.Create(Export_Form.FileName.Caption,fmCreate);
   FileDest.write(Shap1,SizeOf(TExpLongShapka));
   FileDest.write(Shap1.pPrimech,SizeOf(TPrimech));
   if Shap1.NChanal=1 then
    begin
     FileSource:=TBufferedFile.Create(SigTabRec.FileDat_abs,8192);
     FileSource.Reset;
     if ((SigTabRec.RezType=cRealLong) and
              (SigTabRec.A0=0) and (SigTabRec.A1=1) and
              (SigTabRec.A2=0) and (SigTabRec.A3=0) ) then
              begin
                 case Export_Form.Part_All.ItemIndex of
                  0:FileSource.seek(SigTabRec.Seek_Start+0);
                  1:FileSource.seek(SigTabRec.Seek_Start+CurvePointStart.Value*sizeof(single));
                  end;
                for i:=0 to Shap1.lPointAll-1 do
                 begin
                  Filesource.Read(Rez,sizeOf(Rez),bytesRead);
{                  Rez:=Rez1;  }
                  FileDest.Write(rez,sizeof(rez));
                  if ((i mod (1+(Shap1.lPointAll div 30)) =0) ) then
                   begin PB.Position:=i; Application.ProcessMessages;end;
                  if bStopExport then break;
                 end
               end
               else
     for i:=0 to Shap1.lPointAll-1 do
     begin
      case Export_Form.Part_All.ItemIndex of
       0:GetRezFromFile(FileSource,i,
                     SigTabRec.A0,SigTabRec.A1,SigTabRec.A2,SigTabRec.A3,
                     SigTabRec.RezType,Rez1,Status,SigTabRec.Seek_Start);
       1:GetRezFromFile(FileSource,i+CurvePointStart.Value,
                     SigTabRec.A0,SigTabRec.A1,SigTabRec.A2,SigTabRec.A3,
                     SigTabRec.RezType,Rez1,Status,SigTabRec.Seek_Start);
       end;
      Rez:=Rez1;
      FileDest.Write(rez,sizeof(rez));
      if ((i mod (1+(Shap1.lPointAll div 30)) =0) ) then begin PB.Position:=i; Application.ProcessMessages;end;
      if bStopExport then break;
     end;
      FileSource.Close;FileSource.destroy;
    end
     else
     begin
      BookMark:=Curve.GetBookmark;
      Curve.DisableControls;
      Try
        Curve.First;
        cPageCurve:=0;
        for CCurve:=0 to Curve.RecordCount-1 do
         begin
         if ((Export_Form.Active_visible.ItemIndex = 2)  or
              ((Export_Form.Active_visible.ItemIndex =1) and  (CurveVisible.Value =integer(true)))) then
         begin
          SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
          FileSource:=TBufferedFile.Create(SigTabRec.FileDat_abs,8192);
          FileSource.Reset;
          if ((SigTabRec.RezType=cRealLong) and
              (SigTabRec.A0=0) and (SigTabRec.A1=1) and
              (SigTabRec.A2=0) and (SigTabRec.A3=0) ) then
              begin
                 case Export_Form.Part_All.ItemIndex of
                  0:FileSource.seek(SigTabRec.Seek_Start+0);
                  1:FileSource.seek(SigTabRec.Seek_Start+CurvePointStart.Value*sizeof(single));
                  end;
                for i:=0 to Shap1.lPointAll-1 do
                 begin
                  Filesource.Read(Rez,sizeOf(Rez),bytesRead);                {  Rez:=Rez1;}
                  FileDest.Write(rez,sizeof(rez));
                  if ((i mod (1+(Shap1.lPointAll div 30)) =0) ) then
                   begin PB.Position:=cCurve*Shap1.lpointAll+i; Application.ProcessMessages;end;
                  if bStopExport then break;
                 end;
                end
               else
                for i:=0 to Shap1.lPointAll-1 do
                 begin
                 case Export_Form.Part_All.ItemIndex of
                  0:GetRezFromFile(FileSource,i,
                                SigTabRec.A0,SigTabRec.A1,SigTabRec.A2,SigTabRec.A3,
                                SigTabRec.RezType,Rez1,Status,SigTabRec.Seek_Start);
                  1:GetRezFromFile(FileSource,i+CurvePointStart.Value,
                                SigTabRec.A0,SigTabRec.A1,SigTabRec.A2,SigTabRec.A3,
                                SigTabRec.RezType,Rez1,Status,SigTabRec.Seek_Start);
                  end;
                  Rez:=Rez1;
                  FileDest.Write(rez,sizeof(rez));
                  if ((i mod (1+(Shap1.lPointAll div 30)) =0) ) then
                   begin PB.Position:=cCurve*Shap1.lpointAll+i; Application.ProcessMessages;end;
                  if bStopExport then break;
                 end;
          FileSource.Close;FileSource.destroy;
          end;
          Nomer:=CurveView_Signal_Nomer.Value;
          if CurveVisible.Value =integer(true) then inc(cPageCurve);
          Curve.Next;
          if Nomer=CurveView_Signal_Nomer.Value then break;
          if bStopExport then break;
         end;
         NPageCurve:=cPageCurve;
         if NPageCurve=0 then NPageCurve:=1;

        Finally
        Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
        SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
      end; {try}
     end;
//   FileDest. .Close;
   FileDest.Destroy;
   if bStopExport then
    begin
     deletefile(pAnsiChar(Export_Form.FileName.caption));
{     if pos('.',Export_Form.FileEdit.Text)=0 then
      begin
        ss:=Export_Form.FileName+'.lng';
       deletefile(pAnsiChar(ss));
      end
      else begin
            ss:=Export_Form.FileEdit.Text;
            deleteFile(ss);
           end;}
    end;
   end;
  2:   {Ascii}
   begin
    FormatS_X:=Export_Form.FormatxEdit.Text;
    FormatS_Y:=Export_Form.FormatYEdit.Text;
{    if pos('.',Export_Form.FileEdit.Text)=0 then assignFile(FileDestTxt,ExportFile.FileName)
     else AssignFile(FiledestTxt,Export_Form.FileEdit.Text);
    Rewrite(FileDestTxt);                                   }
    Strings:=TStringlist.create;
    if Export_Form.bheader.Checked then
     begin
      Strings.add(Caption+' '+TabSet.Tabs[Tabset.TabIndex]);
      Strings.add(DateTimeToStr(SigTabRec.DateTimeStart));
      Strings.add('Delt X = '+FormatFloat(FormatS_X,CurveDeltX.asfloat)+' ('+ Shap1.scAxisX+')');
      Strings.add('N channels: '+inttostr(Shap1.NChanal));
      Strings.add('Points per Channel: '+inttostr(Shap1.lPointAll));
      Strings.add('-----------------------------------------');
     end;
    if Shap1.NChanal=1 then
     begin
      if Export_Form.bheader.Checked then
      begin
         if Export_Form.bNumber.Checked then Strings.add('Point # ');
         if Export_Form.bX_value.Checked then Strings.add('      X ');
         Strings.add('    '+Shap1.scAxisY);
      end;
      FileSource:=TBufferedFile.Create(SigTabRec.FileDat_abs,4096);
      FileSource.Reset;
      for i:=0 to Shap1.lPointAll-1 do
       begin
       case Export_Form.Part_All.ItemIndex of
        0:begin
           GetRezFromFile(FileSource,i,
                      SigTabRec.A0,SigTabRec.A1,SigTabRec.A2,SigTabRec.A3,
                      SigTabRec.RezType,Rez1,Status,SigTabRec.Seek_Start);
           Point:=i;
           end;
        1:begin
           GetRezFromFile(FileSource,i+CurvePointStart.Value,
                      SigTabRec.A0,SigTabRec.A1,SigTabRec.A2,SigTabRec.A3,
                      SigTabRec.RezType,Rez1,Status,SigTabRec.Seek_Start);
           Point:=i+CurvePointStart.Value;
           end;
        end;
       Rez:=Rez1;
       s:='';
       if Export_Form.bNumber.Checked then s:=formatfloat('#########',Point)+'  ';
       if Export_Form.bX_value.Checked then s:=s+FormatFloat(FormatS_X,Point*CurveDeltX.asfloat);
       if Rez>=0 then
               s:=s+'   '+FormatFloat(FormatS_Y,Rez1)
          else s:=s+'  '+FormatFloat(FormatS_Y,Rez1);
       Strings.add(s);
       if ((i mod (1+(Shap1.lPointAll div 100)) =0) ) then begin PB.position:=i; Application.ProcessMessages;end;
       if bStopExport then break;
      end;
      FileSource.Close;FileSource.destroy;
    end
      else
      begin
       BookMark:=Curve.GetBookmark;
       Curve.DisableControls;
       s:='';
       if Export_Form.bheader.Checked then
       begin
        if Export_Form.bNumber.Checked then s:='Point # ';
        if Export_Form.bX_value.Checked then s:=s+'      X ';
        Strings.add(s+'    Y[i]');
       end;
       Try
       for i:=0 to Shap1.lPointAll-1 do
        begin
         case Export_Form.Part_All.ItemIndex of
          0:Point:=i;
          1:Point:=i+CurvePointStart.Value;
         end;
         s:='';
         if Export_Form.bNumber.Checked then s:=s+formatfloat('#########',Point)+'  ';
         if Export_Form.bX_value.Checked then s:=s+FormatFloat(FormatS_X,Point*CurveDeltX.asfloat);
         Curve.First;
         cPageCurve:=0;
         for CCurve:=0 to Curve.RecordCount-1 do
         begin
         if ((Export_Form.Active_visible.ItemIndex = 2)  or
              ((Export_Form.Active_visible.ItemIndex =1) and  (CurveVisible.Value=integer(true) ))) then
          begin
           SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
           FileSource:=TBufferedFile.Create(SigTabRec.FileDat_abs,4096);
           FileSource.Reset;
            case Export_Form.Part_All.ItemIndex of
             0:GetRezFromFile(FileSource,i,
                           SigTabRec.A0,SigTabRec.A1,SigTabRec.A2,SigTabRec.A3,
                           SigTabRec.RezType,Rez1,Status,SigTabRec.Seek_Start);
             1:GetRezFromFile(FileSource,i+CurvePointStart.Value,
                           SigTabRec.A0,SigTabRec.A1,SigTabRec.A2,SigTabRec.A3,
                           SigTabRec.RezType,Rez1,Status,SigTabRec.Seek_Start);
           end;
           Rez:=Rez1;
           if Rez>=0 then s:=s+'   '+FormatFloat(FormatS_Y,Rez1)
            else s:=s+'  '+FormatFloat(FormatS_Y,Rez1);
           FileSource.Close;FileSource.destroy;
           end;
           Nomer:=CurveView_Signal_Nomer.Value;
           Curve.Next;
           if Nomer=CurveView_Signal_Nomer.Value then break;
           if bStopExport then break;
          end;
          Strings.add(s);
          if ((i mod (1+(Shap1.lPointAll div 100)) =0) ) then begin PB.Position:=i; Application.ProcessMessages;end;
          if bStopExport then break;
         end;
         Finally
         Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
         SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
       end; {try}
      end;
     Strings.SaveToFile(Export_Form.filename.caption);
    if bStopExport then
    begin
     deletefile(pAnsiChar(export_form.filename.caption));
{     if pos('.',Export_Form.FileEdit.Text)=0 then
      begin
       ss:=Export_Form.FileEdit.Text+'.gwt';
       deletefile(ss);
      end
      else
       begin
         ss:=Export_Form.FileEdit.Text;
        deleteFile(ss);
       end;        }
    end;
   end;
  end {case};
  end;
  PB.Visible:=false;
  bStopExport:=false;
  bExport:=false;
end;

procedure TImageForm.Make_Povorot(ImForm:TForm);
var
 Bookmark:tBookmark;
 Nomer:Longint;
 cCurve:word;
 Rez1,Rez2,Rez3,Rez4:single;
 Alfa:real;
 FileSource1,FileSource2,FileDest2,FileDest1:tbUFFEREDfILE;
 J:LONGINT;
 Stroka:shortstring;
begin
(* With ImForm as TImageForm do
 begin
 BookMark:=Curve.GetBookmark;
 Curve.DisableControls;
 Try
  Curve.First;
  SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
  FileSource1:=TBufferedFile.Create(SigTabRec.FileDat,8192);
  FileSource1.Reset;
  Curve.Next;
  SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
  FileSource2:=TBufferedFile.Create(SigTabRec.FileDat,8192);
  FileSource2.Reset;
  Curve.Next;
  SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
  FileDest1:=TBufferedFile.Create(SigTabRec.FileDat,8192);
  FileDest1.Rewrite;
  Curve.Next;
  SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
  FileDest2:=TBufferedFile.Create(SigTabRec.FileDat,8192);
  FileDest2.Rewrite;
  Alfa:=2*Pi/360*NewAlfa.Value;
  PB.MinValue:=0;PB.MaxValue:=SigTabRec.PointAll-1;
  PB.Visible:=True;
  for j:=0 to SigTabRec.PointAll-1 do
   begin
     FileSource1.Read(Rez1,SizeOf(rez1),bytesRead);
     FileSource2.Read(Rez2,SizeOf(rez2),BytesRead);
    { Rez3:=Rez1*Sin(Alfa)+Rez2*Cos(Alfa);
     Rez4:=Rez1*Sin(Alfa)-Rez2*Cos(Alfa);}
     Rez3:=Rez1*cos(Alfa)+Rez2*Sin(Alfa);
     Rez4:=-Rez1*Sin(Alfa)+Rez2*Cos(Alfa);
     FileDest1.Write(Rez3,SizeOf(Rez3),BytesWrote);
     FileDest2.Write(Rez4,SizeOf(Rez4),BytesWrote);
     if j mod 1000 =0 then begin  PB.Progress:=j;PB.Update; Application.ProcessMessages;end;
   end;
  PB.Visible:=false;
  FileSource1.Close;FileSource2.Close;FileDest1.Close;FileDest2.Close;
  FileDest2.Free;FileDest1.Free;FileSource1.Free;FileSource2.Free;
 Finally
    Curve.GotoBookMark(BookMark);Curve.EnableControls;Curve.FreeBookMark(BookMark);
    SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
 end;
 Stroka:=Mes_Ini.ReadString('Image_2','s1','~Поворот осей(')+intToStr(NewAlfa.Value)+')';
 OpenEksForm.DeleteQuery.sql.Clear;
 OpenEksForm.DeleteQuery.sql.Add('update CURVE set ViewPage="'+Stroka+'"'+
' where View_Nomer= '+intToStr(ViewNumber)+' and ViewPage="'+TabSet.Tabs[TabSet.TabIndex]+'"');
 OpenEksForm.DeleteQuery.execSQL;
  TabSet.Tabs[TabSet.TabIndex]:=Stroka;
  j:=TabSet.TabIndex;
  bView:=true;
  Obnovlenie_Image(j);
  bView:=false;
  UpdateView(True,True);
 end;
*)
end;

Procedure TImageForm.InsertRez(ReturnRec:TReturnRec;Nomer_View:longint;bInsertCurve:boolean;
                    Eksp_ProcValue:longint;CrossWin_NewEksp:word);
var
 FileProcRec:TFileStream;
 ProcessingRec:TSourceRec;
 cSignal:word;
 Nomer_Eksp,SNomer,PointE:longint;
 NameY,Head:string[80];
 NewTextForm:TTextForm;
 NewImageForm:TImageForm;
 NewObzorkaForm:TObzorkaForm;
 id:integer;
 s:string;

begin
  FileProcRec:=TFileStream.Create(ReturnRec.FName, fmOpenRead);
//  FileProcRec.Reset;
  ExpForm.Signals.Close;ExpForm.Signals.Open;
  Nomer_Eksp:=0;
  if ((returnrec.ShowWin=0) and
   (ReturnRec.ProcRez_Type<>cProcRez_is_Nothing)) then
  begin
   with ExpForm do
   begin
     dm.Create_CurveSet.ParamByName('View_Header').value:=ReturnRec.HeadWin;
     dm.Create_CurveSet.ParamByName('View_Date').value:=Now;
     dm.Create_CurveSet.ParamByName('View_Time').value:=Time;
     dm.Create_CurveSet.ParamByName('View_Author').value:=EkspsEksp_Author.Value;
     dm.Create_CurveSet.ParamByName('View_Theme').value:=EkspsEksp_Theme.Value;
     dm.Create_CurveSet.ParamByName('View_Style').value:=ReturnRec.ProcRez_Type;
     dm.Create_CurveSet.ParamByName('Up').value:=10+Random(10);
     dm.Create_CurveSet.ParamByName('Left_').value:=10+Random(10);
     dm.Create_CurveSet.ParamByName('Width').value:=500+Random(10);
     dm.Create_CurveSet.ParamByName('Height').value:=330+Random(10);
     FileProcRec.Read(ProcessingRec,SizeOf(TSourceRec));
    // FileProcRec.Seek(0);
     if ProcessingRec.Eksp_Nomer = -1 then
     begin
      Nomer_Eksp:=dm.GetFreeExpID;
      dm.Create_CurveSet.ParamByName('Eksp_Parent').value:=Nomer_Eksp;
     end
      else
        dm.Create_CurveSet.ParamByName('Eksp_Parent').value:=ProcessingRec.Eksp_Parent;
 dm.Create_CurveSet.ExecProc;
 Id:=dm.Create_CurveSet.ParamByName('ID').asinteger;

  Nomer_View:=ID;
  expform.CurvesetRefresh;
 end;
 end;
 FileProcRec.Read(ProcessingRec,SizeOf(TSourceRec));
 FileProcRec.Position:=0;
 case  ReturnRec.ProcRez_Type of
  cProcRez_is_Nothing:
    begin
      FileProcRec.Read(ProcessingRec,SizeOf(TSourceRec));
      {FileProcRec.Close;}FileProcRec.Destroy;
      s:=ReturnRec.FName;
      deletefile(pchar(s));
      PromFileName:=ProcessingRec.FileDatDest;
      Application.CreateForm(TTextForm, NewTextForm);
      NewTextForm.TextForm_Type:=cProcrez_is_Nothing;
      NewTextForm.Caption:=ReturnRec.HeadWin+' '+ProcessingRec.Header_Eksp;
      NewTextForm.Show;
    end;
  cProcRez_is_Text:
    begin
//      ExpForm.CurveTable.Close;OpenEksForm.CurveTable.Open;
      FileProcRec.Read(ProcessingRec,SizeOf(TSourceRec));
      dm.q.sql.clear;
      dm.q.sql.add('update curveset set txtfile = :txtFile where View_nomer = :View_Nomer');
      s:=ProcessingRec.FileDatDest;
      delete(s,1,length(dm.activestoragepath));
      dm.q.ParamByName('TXTFile').asstring:=s;//ProcessingRec.FileDatDest;
      dm.q.ParamByName('View_Nomer').asinteger:=ID;
      dm.q.execsql;
      dm.q.transaction.CommitRetaining;
      expform.eksprefresh;
      expform.curvesetrefresh;
      bInsertcurve:=false;

{      OpenEksForm.CurveTable.Append;
      OpenEksForm.CurveTableView_Nomer.Value:= Nomer_View;
      OpenEksForm.CurveTablePolyFile.Value:=  ProcessingRec.FileDatDest;
      OpenEksForm.CurveTable.Post;
      OpenEksForm.CurveTable.Close;
}
      {FileProcRec.Close;}FileProcRec.Destroy;
     s:= ReturnRec.FName;
     deletefile(Pchar(s));

      ViewNum:=Nomer_View;
      PromFileName:=ProcessingRec.FileDatDest;
      Application.CreateForm(TTextForm, NewTextForm);
      NewTextForm.TextForm_Type:=cProcrez_is_Text;
      NewTextForm.ViewNumber:=Nomer_View;
      NewTextForm.Caption:=ReturnRec.HeadWin+' '+ProcessingRec.Header_Eksp;
      NewTextForm.Show;
    end;
   cProcRez_is_Signal,cProcRez_is_FreqMAP,cProcRez_is_KxxMap:
    begin
     if ProcessingRec.Eksp_nomer<>-1 then
     begin
//      Nomer_Eksp:=DM.getfreeExpID;
      with ExpForm do
        begin
  //       Eksp_Table.Append;
  //       dm.Create_Eksp.ParamByName('Eksp_Nomer').value:=Nomer_Eksp;
         dm.Create_Eksp_AfterProc.ParamByName('Eksp_Header').value:=ReturnRec.PageName+'|'+ProcessingRec.Header_Eksp;
         dm.Create_Eksp_AfterProc.ParamByName('Eksp_Date').value:=Now;
         dm.Create_Eksp_AfterProc.ParamByName('Eksp_Time').value:=Time;
         dm.Create_Eksp_AfterProc.ParamByName('Eksp_Author').value:=ProcessingRec.Author;
         if ReturnRec.Showwin<>255 then dm.Create_Eksp_AfterProc.ParamByName('Eksp_Theme').value:='f('+ProcessingRec.Theme_Eksp+')'
          else dm.Create_Eksp_AfterProc.ParamByName('Eksp_Theme').value:=ProcessingRec.Theme_Eksp;
         if CrossWin_NewEksp=1 then
          begin
           dm.Create_Eksp_AfterProc.ParamByName('Eksp_Header').value:=ProcessingRec.Header_Eksp;
           dm.Create_Eksp_AfterProc.ParamByName('Eksp_Theme').value:=ProcessingRec.Theme_Eksp;
          end;
         dm.Create_Eksp_AfterProc.ParamByName('Eksp_memo').asstring:='';
         dm.Create_Eksp_AfterProc.ParamByName('Eksp_SignalSource').asstring:='';
         dm.Create_Eksp_AfterProc.ParamByName('Eksp_Proc').value:=Eksp_ProcValue;
         dm.Create_Eksp_AfterProc.ParamByName('Eksp_Parent').value:=ProcessingRec.Eksp_Parent;
         dm.Create_Eksp_AfterProc.execproc;
         Nomer_Eksp:=dm.Create_Eksp_AfterProc.parambyname('ID').asinteger;
       end;
     end else
        Nomer_Eksp:=ProcessingRec.Eksp_nomer;

//    OpenEksForm.Signals.Close;OpenEksForm.Signals.Open;
    if bInsertCurve then
     begin
//      expForm.CurveTable.Close;OpenEksForm.CurveTable.Open;
     end;
//    SNomer:=OpenEksForm.Signals.RecordCount;


    for cSignal:=1 to ReturnRec.NSignal do
    begin
     FileProcRec.Read(ProcessingRec,SizeOf(TSourceRec));

//     OpenEksForm.Signals.Append;
      dm.Create_Signal.ParamByName('Eksp_Nomer').value:= Nomer_Eksp;
      if ProcessingRec.Eksp_Parent<>-1 then  dm.Create_Signal.ParamByName('Eksp_Parent').value:= ProcessingRec.Eksp_Parent
       else  dm.Create_Signal.ParamByName('Eksp_Parent').value:= Nomer_Eksp;
      dm.Create_Signal.ParamByName('Chanal_Nomer').value:= cSignal;
      dm.Create_Signal.ParamByName('Chanal_Header').value:= ProcessingRec.NameY;
      dm.Create_Signal.ParamByName('DeltX').value:= ProcessingRec.DeltX;
      dm.Create_Signal.ParamByName('NameY').value:= ProcessingRec.NameY;
      dm.Create_Signal.ParamByName('NameX').value:= ProcessingRec.NameX;
      dm.Create_Signal.ParamByName('RazmX').value:= ProcessingRec.RazmX;
      dm.Create_Signal.ParamByName('RazmY').value:= ProcessingRec.RazmY;
      dm.Create_Signal.ParamByName('MultX').value:= 1;
      dm.Create_Signal.ParamByName('MultY').value:= 1;
      dm.Create_Signal.ParamByName('MaxX').value:= 1;
      dm.Create_Signal.ParamByName('MaxY').value:= ProcessingRec.MaxY;
      dm.Create_Signal.ParamByName('MinX').value:=0;
      dm.Create_Signal.ParamByName('MinY').value:= ProcessingRec.MinY;
      dm.Create_Signal.ParamByName('Date_Start').value:= trunc(ProcessingRec.DateTimeStart) ;
      dm.Create_Signal.ParamByName('Time_Start').value:= ProcessingRec.DateTimeStart-trunc(ProcessingRec.DateTimeStart) ;
      dm.Create_Signal.ParamByName('DateTimeStart').value:= ProcessingRec.DateTimeStart;
      dm.Create_Signal.ParamByName('PointAll').value:= ProcessingRec.PointAll;
      dm.Create_Signal.ParamByName('BMaxMinX').value:= integer(false);
      dm.Create_Signal.ParamByName('BMaxMinY').value:= integer(true);
      dm.Create_Signal.ParamByName('RezType').value:= ProcessingRec.RezType;
      dm.Create_Signal.ParamByName('File_Seek').value:= ProcessingRec.Seek_start;
      dm.Create_Signal.ParamByName('Rezlength').value:= cSizeRez[ProcessingRec.RezType];
      dm.Create_Signal.ParamByName('A0').value:= ProcessingRec.a0;
      dm.Create_Signal.ParamByName('A1').value:= ProcessingRec.a1;
      dm.Create_Signal.ParamByName('A2').value:= ProcessingRec.a2;
      dm.Create_Signal.ParamByName('A3').value:= ProcessingRec.a3;
      s:=ProcessingRec.FileDatdest;
      delete(s,1,length(dm.activestoragepath));
      dm.Create_Signal.ParamByName('FileDat').value:= s;//ProcessingRec.FileDatdest;
     NameY:= dm.Create_Signal.ParamByName('NameY').Value;
     Head:=  dm.Create_Signal.ParamByName('Chanal_Header').Value;
     PointE:=  dm.Create_Signal.ParamByName('PointAll').Value-1;
     dm.Create_Signal.execproc;

     if bInsertCurve then
     begin
        dm.Create_Curve.ParamByName('View_Nomer').value:= Nomer_View;
        dm.Create_Curve.ParamByName('Signal_Nomer').value:= dm.Create_Signal.parambyname('ID').asinteger;
        dm.Create_Curve.ParamByName('CurveHeaderShort').value:= copy(NameY,1,8);
        dm.Create_Curve.ParamByName('CurveHeader').value:= Head;
        dm.Create_Curve.ParamByName('PointEnd').value:= PointE;
        dm.Create_Curve.ParamByName('PointStart').value:= 0;
        dm.Create_Curve.ParamByName('ViewMaxX').value:= 0;
        dm.Create_Curve.ParamByName('ViewMaxY').value:= 0;
        dm.Create_Curve.ParamByName('ViewMinY').value:= 0;
        dm.Create_Curve.ParamByName('ViewMinX').value:= 0;
        dm.Create_Curve.ParamByName('bViewMaxMinX').value:= integer(false);
        dm.Create_Curve.ParamByName('bViewMaxMinY').value:= integer(false);
        dm.Create_Curve.ParamByName('bPolyCreate').value:= integer(false);
        dm.Create_Curve.ParamByName('PolyPoint').value:= 0;
//        dm.Create_Curve.ParamByName('PolyFile').value:=  dm.ActiveStoragepath+'cf'+GetGuidstr+'.Dat';
        dm.Create_Curve.ParamByName('PolyFile').value:=  'cf'+GetGuidstr+'.Dat';
//        dm.Create_Curve.ParamByName('PolyFile').value:=  appConfig.DataStoragePath+'cf'+GetGuidstr+'.Dat';
        dm.Create_Curve.ParamByName('COlor').value:= ProcessingRec.TekColor;
        dm.Create_Curve.ParamByName('Style').value:= 5;
        dm.Create_Curve.ParamByName('CurveWidth').value:= 1;
        dm.Create_Curve.ParamByName('ViewPage').value:= ReturnRec.PageName;
        dm.Create_Curve.ParamByName('ScaleStyle').value:=2;
        dm.Create_Curve.ParamByName('CurveDate').value:=Now;
        dm.Create_Curve.ParamByName('CurveTime').value:=Time;
        dm.Create_Curve.ParamByName('Slider').value:=0;
        dm.Create_Curve.ParamByName('Mult').value:=1;
        dm.Create_Curve.ParamByName('Visible').asinteger:=integer(true);
        dm.Create_Curve.ParamByName('MultAll').value:=1;
        dm.Create_Curve.ParamByName('pPolyX').value:=longint(nil);
        dm.Create_Curve.ParamByName('pPolyY').value:=longint(nil);
        if pos('t',ProcessingRec.NameX)=1 then
                begin
                 dm.Create_Curve.ParamByName('AxisXStyle').value:=CurveAxisXStyle.Value  {sek};
                end
                 else
                  dm.Create_Curve.ParamByName('AxisXStyle').value:=1  {sek};
        dm.Create_Curve.ParamByName('ColorFon').value:=AppConfig.Inifile.ReadInteger('system','FonColor',clGray);
        dm.Create_Curve.ParamByName('GridX').value:=0;
        dm.Create_Curve.ParamByName('GridY').value:=0;
        dm.Create_Curve.Execproc;
      end;
//     inc(SNomer);
    end;
//    if bInsertCurve then OpenEksForm.CurveTable.Close;
//    OpenEksForm.Signals.Close;

     dm.Create_Eksp.transaction.CommitRetaining;
     expform.eksprefresh;
     expform.curvesetrefresh;
     {FileProcRec.Close;}FileProcRec.Destroy;
     s:= ReturnRec.FName;
     deletefile(Pchar(s));
     if ReturnRec.Showwin=0 then
      begin
       ViewNum:=Nomer_View;
       case ReturnRec.ProcRez_Type of
        cProcRez_is_Signal:
               begin
                Application.CreateForm(TIMageForm, NewImageForm);
                NewImageForm.Show;
               end;
           cProcRez_is_FreqMAP,cProcRez_is_TimeMap,cProcRez_is_KxxMap:
               begin
                Application.CreateForm(TObzorkaForm, NewObzorkaForm);
                NewObzorkaForm.Show;
               end;
        end;
      end;
    end;
 end; {case ProcRez_Type}
 s:= ReturnRec.FName;
 deleteFile(pchar(s));
// User_Form.FormStyle:=fsstayOnTop;
// User_Form.Update;
end;

Procedure TImageForm.InserCurve(ImForm:TForm;bShow:boolean);
begin
with ImForm as TImageForm do
begin
   dm.Create_Curve.ParamByName('Visible').value:= integer(true);
   dm.Create_Curve.ParamByName('View_Nomer').value:= ViewNumber;
   dm.Create_Curve.ParamByName('Signal_Nomer').value:= TImageForm(mainForm.ActiveForm).CurveSignal_Nomer.Value;
   dm.Create_Curve.ParamByName('CurveHeaderShort').value:= TImageForm(mainForm.ActiveForm).CurveCurveHeaderShort.value;
   dm.Create_Curve.ParamByName('CurveHeader').value:= TImageForm(mainForm.ActiveForm).CurveCurveHeader.Value;
   dm.Create_Curve.ParamByName('PointEnd').value:= ROUND(Rightx/CurveDeltX.asfloat);
   dm.Create_Curve.ParamByName('PointStart').value:= dm.Create_Curve.ParamByName('PointEnd').value/2;//ROUND(Leftx/CurveDeltX.asfloat);
   dm.Create_Curve.ParamByName('ViewMaxX').value:= 0;
   dm.Create_Curve.ParamByName('ViewMaxY').value:= 0;
   dm.Create_Curve.ParamByName('ViewMinY').value:= 0;
   dm.Create_Curve.ParamByName('ViewMinX').value:= 0;
   dm.Create_Curve.ParamByName('bViewMaxMinX').value:= false;
   dm.Create_Curve.ParamByName('bViewMaxMinY').value:= false;
   dm.Create_Curve.ParamByName('bPolyCreate').value:= false;
   dm.Create_Curve.ParamByName('PolyPoint').value:= 0;
//   dm.Create_Curve.ParamByName('PolyFile').value:=  appconfig.DataStoragePath+'cf'+GetGuidStr+'.Dat';
//   dm.Create_Curve.ParamByName('PolyFile').value:=  dm.ActiveStoragepath+'cf'+GetGuidStr+'.Dat';
   dm.Create_Curve.ParamByName('PolyFile').value:=  'cf'+GetGuidStr+'.Dat';
   dm.Create_Curve.ParamByName('COlor').value:= TImageForm(mainForm.ActiveForm).CurveColor.Value;
   dm.Create_Curve.ParamByName('Style').value:= TImageForm(mainForm.ActiveForm).CurveStyle.Value;
   dm.Create_Curve.ParamByName('CurveWidth').value:= TImageForm(mainForm.ActiveForm).CurveCurveWidth.Value;
   dm.Create_Curve.ParamByName('ViewPage').value:= TabSet.Tabs[tabSet.TabIndex];
   dm.Create_Curve.ParamByName('ScaleStyle').value:=ScaleRb.ItemIndex;
   dm.Create_Curve.ParamByName('CurveDate').value:=Now;
   dm.Create_Curve.ParamByName('CurveTime').value:=Time;
   dm.Create_Curve.ParamByName('Slider').value:=TImageForm(mainForm.ActiveForm).CurveSlider.Value;
   dm.Create_Curve.ParamByName('Mult').value:=TImageForm(mainForm.ActiveForm).CurveMult.Value;
   dm.Create_Curve.ParamByName('MultAll').value:=TImageForm(mainForm.ActiveForm).CurveMultAll.value;
   dm.Create_Curve.ParamByName('pPolyX').value:=longint(nil);
   dm.Create_Curve.ParamByName('pPolyY').value:=longint(nil);
   dm.Create_Curve.ParamByName('AxisXStyle').value:=TImageForm(mainForm.ActiveForm).CurveAxisXStyle.value;
   dm.Create_Curve.ParamByName('ColorFon').value:=TImageForm(mainForm.ActiveForm).PaintBox.Canvas.Brush.Color;
   dm.Create_Curve.ParamByName('GridX').value:=CurveGridX.Value;
   dm.Create_Curve.ParamByName('GridY').value:=CurveGridY.Value;
   dm.Create_Curve.ExecProc;
   dm.Create_Curve.Transaction.CommitRetaining;
  if bShow then
    begin
     Obnovlenie_Image(TImageForm(ImForm).TabSet.TabIndex);
(*     Show;
     UpdateView(True,True);*)
    end;
end;
end;


procedure TImageForm.CreateObzorka(ImForm:TForm);
var
 MS,SS,DSS:string[2];
 H,M,S,DS:word;
 id,i:word;
 StartPoint,DeltPoint:longint;

 Nomer:longint;
 NCurve:longint;
 ObzDialog:TObzorDialog;

procedure UstCurveObzor(ImForm:TForm;Index:integer;NMaxCurve:longint);
var
 NCurv:longint;
 begin
  with ImForm as TImageForm do
  begin
  StartPoint:=ROUND(LeftX/CurveDeltX.asfloat); DeltPoint:=ROUND((Rightx-Leftx)/CurveDeltX.asfloat);
  NCurv:=0;
  PB.Max:=Sig_TablePointAll.Value-1;
  PB.Min:=StartPoint;
  PB.Position:=StartPoint;
  PB.Visible:=true;
  repeat
    dm.Create_Curve.ParamByName('Visible').value:= integer(true);
    dm.Create_Curve.ParamByName('View_Nomer').value:= ID;
    dm.Create_Curve.ParamByName('Signal_Nomer').value:= Sig_TableSignal_Nomer.Value;
    dm.Create_Curve.ParamByName('CurveHeaderShort').value:=CurveCurveHeaderShort.Value;
    dm.Create_Curve.ParamByName('CurveHeader').value:= CurveCurveHeader.Value;
    dm.Create_Curve.ParamByName('PointStart').value:= StartPoint;
    dm.Create_Curve.ParamByName('PointEnd').value:= StartPoint+DeltPoint;
    dm.Create_Curve.ParamByName('ViewMaxX').value:= CurveViewMaxX.Value;
    dm.Create_Curve.ParamByName('ViewMaxY').value:= CurveViewMaxY.Value;
    dm.Create_Curve.ParamByName('ViewMinY').value:= CurveViewMinY.Value;
    dm.Create_Curve.ParamByName('ViewMinX').value:= CurveViewMinX.Value;
    dm.Create_Curve.ParamByName('bViewMaxMinX').value:= true;
    dm.Create_Curve.ParamByName('bViewMaxMinY').value:= True;
    dm.Create_Curve.ParamByName('bPolyCreate').value:= false;
    dm.Create_Curve.ParamByName('PolyPoint').value:= 0;
    dm.Create_Curve.ParamByName('AxisXStyle').value:=0;
//    dm.Create_Curve.ParamByName('PolyFile').value:=  AppConfig.DataStoragePath+'cf'+GetGuidStr+'.Dat';
//    dm.Create_Curve.ParamByName('PolyFile').value:=  dm.ActiveStoragepath+'cf'+GetGuidStr+'.Dat';
    dm.Create_Curve.ParamByName('PolyFile').value:=  'cf'+GetGuidStr+'.Dat';
    dm.Create_Curve.ParamByName('COlor').value:= CurveColor.Value;
    dm.Create_Curve.ParamByName('Style').value:= 5;
    dm.Create_Curve.ParamByName('CurveWidth').value:= 1;
    dm.Create_Curve.ParamByName('ColorFon').value:=AppConfig.inifile.ReadInteger('system','FonColor',clskyblue);
    dm.Create_Curve.ParamByName('GridX').value:=0;
    dm.Create_Curve.ParamByName('GridY').value:=0;
    if Index=1 then
     dm.Create_Curve.ParamByName('ViewPage').value:= CurveCurveHeaderShort.Value+' - '+intToStr(NCurv div NMaxCurve)
      else dm.Create_Curve.ParamByName('ViewPage').value:= CurveCurveHeaderShort.Value;
    dm.Create_Curve.ParamByName('ScaleStyle').value:=2;
    dm.Create_Curve.ParamByName('CurveDate').value:=Now;
    dm.Create_Curve.ParamByName('CurveTime').value:=Time;
    dm.Create_Curve.ParamByName('Slider').value:=0;
    dm.Create_Curve.ParamByName('Mult').value:=CurveMult.Value;
    dm.Create_Curve.ParamByName('MultAll').value:=CurveMultAll.Value;
    dm.Create_Curve.ParamByName('pPolyX').value:=longint(nil);
    dm.Create_Curve.ParamByName('pPolyY').value:=longint(nil);
    dm.Create_Curve.ExecProc;
    PB.Position:=StartPoint;PB.Update;
    StartPoint:=StartPoint+DeltPoint;
    inc(NCurv);
    if ((Index=0) and (NCurv =NMaxCurve)) then break;
  until StartPoint>Sig_TablePointAll.Value-1;
  PB.Visible:=false;PB.Update;
 end;

end;

begin
 with ImForm as TImageForm do
  begin
  NCurve:=0;
  StartPoint:=round(LeftX/CurveDeltX.asfloat); DeltPoint:=round((RightX-LeftX)/CurveDeltX.asfloat);
  repeat
    StartPoint:=StartPoint+DeltPoint;
    inc(nCurve);
  until StartPoint>Sig_TablePointAll.Value-1;
 if NCurve<3 then
  begin
   ShowMessage('В "обзорке" cлишком мало кривых, увеличьте временное разрешение');
   exit;
  end;
 Application.CreateForm(TObzorDialog,ObzDialog);
 ObzDialog.SpinEdit1.MaxValue:=NCurve; ObzDialog.SpinEdit1.MinValue:=3;
 ObzDialog.SpinEdit1.Value:=NCurve;
 ObzDialog.Label6.Caption:=intToStr(NCurve);
 ObzDialog.Header.Text:='Обзорка: '+ExpForm.CurveSet.fieldbyname('View_Header').asstring;
 if ObzDialog.ShowModal <> mrOK then exit;
// ExpForm.CurveSetTable.Close;ExpForm.CurveSetTable.Open;

 dm.Create_CurveSet.ParamByName('EKSP_Parent').asinteger:=SelectViewQueryEksp_Parent.Value;
 dm.Create_CurveSet.ParamByName('View_Theme').asstring:='Обзорка ';
 dm.Create_CurveSet.ParamByName('View_Time').asdatetime:=time;
 dm.Create_CurveSet.ParamByName('View_Date').asdatetime:=now;
 dm.Create_CurveSet.ParamByName('View_header').asstring:=ObzDialog.Header.Text;
 dm.Create_CurveSet.ParamByName('View_Author').asstring:=ObzDialog.Author.Text;
// dm.Create_CurveSet.ParamByName('View_memo').asstring:='';
 dm.Create_CurveSet.ParamByName('View_style').asinteger:=cTimeMap_View;
 dm.Create_CurveSet.ParamByName('Left_').asinteger:=15+Random(10);
 dm.Create_CurveSet.ParamByName('Up').asinteger:=10+Random(10);
 dm.Create_CurveSet.ParamByName('Height').asinteger:=330+Random(10);
 dm.Create_CurveSet.ParamByName('Width').asinteger:=450+Random(10);
 dm.Create_CurveSet.ExecProc;
 Id:=dm.Create_CurveSet.ParamByName('ID').asinteger;
 case ObzDialog.ChanalGroup.ItemIndex of
   0:
   begin
    UstCurveObzor(ImForm,ObzDialog.RadioGroup1.ItemIndex,ObzDialog.SpinEdit1.Value);
   end;
  1:
   begin
    Curve.First;
    for i:=0 to Curve.RecordCount-1 do
    begin
     if CurveVisible.Value =integer(true) then UstCurveObzor(ImForm,ObzDialog.RadioGroup1.ItemIndex,ObzDialog.SpinEdit1.Value);
     Nomer:=CurveView_Signal_Nomer.Value;
     Curve.Next;
     if Nomer=CurveView_Signal_Nomer.Value then break;
    end;
   end;
  2:
   begin
    Curve.First;
    for i:=0 to Curve.RecordCount-1 do
    begin
     UstCurveObzor(ImForm,ObzDialog.RadioGroup1.ItemIndex,ObzDialog.SpinEdit1.Value);
     Nomer:=CurveView_Signal_Nomer.Value;
     Curve.Next;
     if Nomer=CurveView_Signal_Nomer.Value then break;
    end;
   end;
  end;
  ObzDialog.Free;
  dm.Create_CurveSet.Transaction.CommitRetaining;
  expform.CurvesetRefresh;
  ViewNum:=ID;
  Application.CreateForm(TObzorkaForm, LastObzForm);
  LastObzForm.Show;
 end;
 end;


procedure  TImageForm.InsertZoom(ImForm:TForm;ImForm_Dest:TForm;CurveN1,CurveN2:longint;
                     bY_X:boolean;PRight,PLeft:longint;
                     bAltZoom:boolean;
                     bDropAltZoom:boolean;
                     CurveSetNum:longint);
var
 MS,SS,DSS:string[2];
 H,M,S,DS:word;
 cCurve,ii,jj:longint;
 ImaForm:TImageForm;
// YX_F:TYX_Form;
 Nomer,NPoint,RezSize:Longint;
 Nomer_eksp,Nomer_Sig:longint;
 FName:string;
 FileDest,FileSource:TFileStream;
 Theme,Header,Author:string;
begin
(*
 begin
    if (bAltZoom or bDropAltZoom) then
    begin  {создание записи в Eksp.Db}
    OpenEksForm.Eksps.Open;
    OpenEksForm.Eksps.Last;
    Nomer_Eksp:=OpenEksForm.EkspsEksp_Nomer.Value+1;
    OpenEksForm.query_max_eksp_nom.close;OpenEksForm.query_max_eksp_nom.Open;
    if nomer < OpenEksForm.Query_Max_Eksp_NomMAXofEksp_nomer.Value+1
       then Nomer:= OpenEksForm.Query_Max_Eksp_NomMAXofEksp_nomer.Value+1;
    OpenEksForm.query_max_eksp_nom.Close;
    OpenEksForm.Eksps.First;
    while not OpenEksForm.Eksps.EOF do
     begin
      if OpenEksForm.EkspsEksp_Nomer.Value = TImageForm(ImForm).Sig_TableEksp_Nomer.Value then break;
      OpenEksForm.Eksps.Next;
     end;
    Theme:=OpenEksForm.EkspsEksp_Theme.value;
    Header:=OpenEksForm.EkspsEksp_Header.Value;
    Author:=OpenEksForm.EkspsEksp_Author.Value;
    with OpenEksForm do
      begin
       Eksp_Table.Append;
       Eksp_TableEksp_Nomer.Value:=Nomer_Eksp;
       Eksp_TableEksp_Header.Value:=Mes_Ini.ReadString('Image_2','s5','часть от ')+Header;
       Eksp_TableEksp_Date.Value:=Now; Eksp_TableEksp_Time.Value:=Time;
       Eksp_TableEksp_Author.Value:=Author;
       Eksp_TableEksp_Theme.Value:='@@@@_##';
       Eksp_TableEksp_Proc.Value:=1;
       Eksp_TableEksp_Parent.Value:=TImageForm(ImForm).SelectViewQueryEksp_Parent.Value;
       if GemisWin_Version in [0] then
        begin
         Eksp_Tableid_upLevel.Value:=-2;
         Eksp_TableEksp_Theme.Value:='Demo_Data'+chr(7);
        end;
       Eksp_Table.Post;
     end;
    OpenEksForm.Eksps.Close;
    end; {AltZoom}
    if not bDropAltZoom then
    begin
    OpenEksForm.CurveSetTable.Close;OpenEksForm.CurveSetTable.Open;
    OpenEksForm.CurveSetTable.Append;
    OpenEksForm.CurveSetTableView_Header.Value:=TImageForm(ImForm).SelectViewQueryView_Header.value;
    OpenEksForm.CurveSetTableView_Date.Value:=Now;
    OpenEksForm.CurveSetTableView_Time.Value:=Time;
    OpenEksForm.CurveSetTableView_Author.Value:=TImageForm(ImForm).SelectViewQueryView_Author.Value;
    OpenEksForm.CurveSetTableView_Theme.Value:=TImageForm(ImForm).TabSet.Tabs[TImageForm(ImForm).TabSet.Tabindex];
    if bY_X then OpenEksForm.CurveSetTableView_Style.Value:=cY_X_View
     else OpenEksForm.CurveSetTableView_Style.Value:=cNoMap_View;
    OpenEksForm.CurveSetTableUp.Value:=10+Random(20);
    OpenEksForm.CurveSetTableLeft.Value:=10+Random(20);
    OpenEksForm.CurveSetTableWidth.Value:=450+Random(20);
    OpenEksForm.CurveSetTableHeight.Value:=330+Random(20);
//    OpenEksForm.CurveSetTableEksp_Parent.Value:=SigTabRec.Eksp_Nomer;
    OpenEksForm.CurveSetTableEksp_Parent.Value:=TImageForm(ImForm).SelectViewQueryEksp_Parent.Value;
    OpenEksForm.CurveSetTable.Post;
    end;
    OpenEksForm.CurveTable.Close;OpenEksForm.CurveTable.Open;
    TImageForm(ImForm).Curve.First;
    for CCurve:=0 to TImageForm(ImForm).Curve.RecordCount-1 do
     begin
      if (
          ((not MainForm.Zoom_For_Visible.Checked ) and (cCurve>=CurveN1) and (cCurve<=CurveN2 ))
          or
          (MainForm.Zoom_For_Visible.Checked  and (cCurve>=CurveN1) and (cCurve<=CurveN2 )
              and TImageForm(ImForm).CurveVisible.Value)
            )
            then
      begin
      OpenEksForm.CurveTable.Append;
     if PLeft<PRight then
       begin
        OpenEksForm.CurveTablePointStart.Value:= PLeft;
        OpenEksForm.CurveTablePointEnd.Value:= PRight;
        end
         else
          begin
           OpenEksForm.CurveTablePointStart.Value:= PRight;
           OpenEksForm.CurveTablePointEnd.Value:= PLeft;
          end;
      PLeft:=OpenEksForm.CurveTablePointStart.Value;
      pRight:=OpenEksForm.CurveTablePointEnd.Value;
      if (bAltZoom or bDropAltZoom ) then
       begin
        OpenEksForm.CurveTablePointStart.Value:= 0;
        OpenEksForm.CurveTablePointEnd.Value:= abs(pright-pleft);
        {сщздание файла}
        DecodeTime(Time,H,M,S,DS);
        Npoint:=OpenEksForm.CurveTablePointEnd.Value-OpenEksForm.CurveTablePointStart.Value;
        RezSize:=cSizeRez[pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.RezType];
        DElay(110);
        Str(M:1,MS);   if m<10 then MS:='0'+Ms;
        Str(S:1,SS);   if s<10 then sS:='0'+ss;
        Str(DS:1,DSS); if ds<10 then dss:='0'+dss;
        FName:=  GemisWin_Dat_Path+'sf'+MS+SS+DSS+'.Dat';
        FileDest:=TFileStream.Create(Fname,fmCreate);
        FileSource:=TFileStream.Create(pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.FileDat,fmOpenRead);
        ii:=pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.seek_start;
{$I-}
        if ((FileSource.Size-pLeft*RezSize) > NPoint*RezSize)
         then
          begin
           FileSource.Position:=pLeft*RezSize+ii;
           FileDest.CopyFrom(FileSource,OpenEksForm.CurveTablePointEnd.Value{NPoint}*RezSize);
          end
           else
            begin
             if FileSource.Size>PLeft*RezSize then  NPoint:=((FileSource.Size-PLeft*RezSize) div RezSize) +1;
            end;
{$I+}
        {вставка в Signals.Db c nomerom nomer_Sig}
        OpenEksForm.Signals.Open;
        OpenEksForm.Signals.Append;
        {if bDropAltZoom then Nomer_Eksp:=Sig_TableEksp_Nomer.Value;}
        OpenEksForm.SignalsEksp_Nomer.Value:= Nomer_Eksp;
        OpenEksForm.SignalsEksp_Parent.Value:= TImageForm(ImForm).SelectViewQueryEksp_Parent.Value;
        OpenEksForm.SignalsChanal_Nomer.Value:= cCurve;
        OpenEksForm.SignalsChanal_Header.Value:= TImageForm(ImForm).CurveCurveHeader.Value;
        OpenEksForm.SignalsDeltX.Value:= pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.DeltX;
        OpenEksForm.SignalsNameY.Value:= TImageForm(ImForm).Sig_TableNameY.Value;
        OpenEksForm.SignalsNameX.Value:= TImageForm(ImForm).Sig_TableNameX.Value;
        OpenEksForm.SignalsRazmX.Value:= TImageForm(ImForm).Sig_TableRazmX.Value;
        OpenEksForm.SignalsRazmY.Value:= TImageForm(ImForm).Sig_TableRazmY.Value;;
        OpenEksForm.SignalsMultX.Value:= 1;
        OpenEksForm.SignalsMultY.Value:= 1;
        OpenEksForm.SignalsMaxX.Value:= 1;
        OpenEksForm.SignalsMaxY.Value:= 1;
        OpenEksForm.SignalsMinX.Value:=0;
        OpenEksForm.SignalsMinY.Value:= 0;
        if TImageForm(ImForm).Sig_TableNameX.Value='t' then
         begin
        OpenEksForm.SignalsDate_Start.Value:= pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.DateTimeStart+
          pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.DeltX*PLeft/(24*60*60);
        OpenEksForm.SignalsTime_Start.Value:= pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.DateTimeStart+
             pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.DeltX*PLeft/(24*60*60)-
                      trunc(pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.DateTimeStart +
                           pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.DeltX*PLeft/(24*60*60));
         end
          else
           begin
            OpenEksForm.SignalsDate_Start.Value:= pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.DateTimeStart;
            OpenEksForm.SignalsTime_Start.Value:= pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.DateTimeStart-
                          trunc(pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.DateTimeStart);
           end;
        OpenEksForm.SignalsPointAll.readOnly:=false;
        OpenEksForm.SignalsPointAll.Value:= NPoint;
        OpenEksForm.SignalsBMaxMinX.Value:= false;
        OpenEksForm.SignalsBMaxMinY.Value:= false;
        OpenEksForm.SignalsRezType.Value:= pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.RezType;
        OpenEksForm.SignalsFile_Seek.Value:= 0{pSigTabRec(CurvepSigTabRec.Value)^.Seek_Start};
        OpenEksForm.SignalsRezlength.Value:= cSizeRez[pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.RezType];
        OpenEksForm.SignalsA0.Value:= pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.a0;
        OpenEksForm.SignalsA1.Value:= pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.a1;
        OpenEksForm.SignalsA2.Value:= pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.a2;
        OpenEksForm.SignalsA3.Value:= pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value)^.a3;
        OpenEksForm.SignalsFileDat.Value:= FName;
{        OpenEksForm.SignalsSignal_Nomer.Value:=OpenEksForm.Signals.RecordCount;}
        OpenEksForm.Signals.Post;
        Nomer_Sig:=OpenEksForm.SignalsSignal_Nomer.Value;
        OpenEksForm.Signals.close;
       end;
      if bDropAltZoom then OpenEksForm.CurveTableView_Nomer.Value:=CurveSetNum
      else OpenEksForm.CurveTableView_Nomer.Value:= OpenEksForm.CurveSetTableView_Nomer.Value;
      if (bAltZoom or bDropAltZoom )then
        OpenEksForm.CurveTableSignal_Nomer.Value:= Nomer_Sig
         else OpenEksForm.CurveTableSignal_Nomer.Value:= TImageForm(ImForm).CurveSignal_Nomer.Value;
     OpenEksForm.CurveTableCurveHeaderShort.Value:= TImageForm(ImForm).CurveCurveHeaderShort.Value;
     OpenEksForm.CurveTableCurveHeader.Value:= TImageForm(ImForm).CurveCurveHeader.Value;
      OpenEksForm.CurveTableViewMaxX.Value:= 0;
      OpenEksForm.CurveTableViewMaxY.Value:= 0;
      OpenEksForm.CurveTableViewMinY.Value:= 0;
      OpenEksForm.CurveTableViewMinX.Value:= 0;
      OpenEksForm.CurveTablebViewMaxMinX.Value:= false;
      OpenEksForm.CurveTablebViewMaxMinY.Value:= false;
      OpenEksForm.CurveTablebPolyCreate.Value:= false;
      OpenEksForm.CurveTablePolyPoint.Value:= 0;
      DecodeTime(Time,H,M,S,DS);
      DElay(110);
      Str(M:1,MS);   if m<10 then MS:='0'+Ms;
      Str(S:1,SS);   if s<10 then sS:='0'+ss;
      Str(DS:1,DSS); if ds<10 then dss:='0'+dss;
      OpenEksForm.CurveTablePolyFile.Value:=  GemisWin_dat_Path+'cf'+MS+SS+DSS+'.Dat';
      OpenEksForm.CurveTableCOlor.Value:= TImageForm(ImForm).CurveColor.Value;
      OpenEksForm.CurveTableStyle.Value:= TImageForm(ImForm).CurveStyle.Value;
      OpenEksForm.CurveTableCurveWidth.Value:= TImageForm(ImForm).CurveCurveWidth.value;
      if bY_X then
       case cCurve of
         0: OpenEksForm.CurveTableViewPage.Value:= 'X';
         1: OpenEksForm.CurveTableViewPage.Value:= 'Y';
          else OpenEksForm.CurveTableViewPage.Value:='';
       end         else OpenEksForm.CurveTableViewPage.Value:=
          TImageForm(ImForm_Dest).TabSet.Tabs[TImageForm(ImForm_Dest).TabSet.TabIndex];
      OpenEksForm.CurveTableScaleStyle.Value:=2;
      OpenEksForm.CurveTableCurveDate.Value:=Now; OpenEksForm.CurveTableCurveTime.Value:=Time;
      OpenEksForm.CurveTableSlider.Value:=0;
      OpenEksForm.CurveTableMult.Value:=1;OpenEksForm.CurveTableMultAll.Value:=1;
      OpenEksForm.CurveTablepPolyX.Value:=longint(nil);OpenEksForm.CurveTablepPolyY.Value:=longint(nil);
      OpenEksForm.CurveTableAxisXStyle.Value:=TImageForm(ImForm).CurveAxisXStyle.Value;
      OpenEksForm.CurveTableColorFon.Value:=FonDialog.FonColor.Brush.Color;
          {TImageForm(mainForm.ActiveForm).PaintBox.Canvas.Brush.Color;}
      {CurveColorFon.Value;}
      OpenEksForm.CurveTableGridX.Value:=TImageForm(ImForm).CurveGridX.Value;
      OpenEksForm.CurveTableGridY.Value:=TImageForm(ImForm).CurveGridY.Value;
      OpenEksForm.CurveTable.Post;
      end;
      Nomer:=TImageForm(ImForm).CurveView_Signal_Nomer.Value;
      TImageForm(ImForm).Curve.Next;
      if Nomer=TImageForm(ImForm).CurveView_Signal_Nomer.Value then break;
    end;
    TImageForm(ImForm).NPageCurve:=CurveN2-CurveN1+1;
   if TImageForm(ImForm).NPageCurve=0 then TImageForm(ImForm).NPageCurve:=1;

    TImageForm(imform).SigTabRec:=(pSigTabRec(TImageForm(imform).CurvepSigTabRec.Value))^;
    ViewNum:=OpenEksForm.CurveSetTableView_Nomer.Value;
  end;
 if not bDropAltZoom then
 begin
 if bY_X then begin Application.CreateForm(TYX_Form, YX_F);YX_F.Show;end
      else
        begin Application.CreateForm(TIMageForm, ImaForm); ImaForm.Show; end;
*)end;

procedure TImageForm.GetCurveParam(ImForm:TForm);
 var Status:integer;
     MinX,MaxX,MinY,MaxY:Real;
     MaxXAll,MinXAll,MinYAll,MaxYAll:real;
     i1,i2:longint;
     BookMark:TBookMark;
     cCurve:word;
     Nomer:longint;
     ptrTo:integer;
    Procedure GetMaxMinYCurve;
    begin
      with ImForm as TImageForm do
      begin
      if  (CurvebViewMaxMinY.Value <> integer(True) )then
       begin    {определение мах мин по оси Y }
        if Curve.State<>dsEdit then Curve.Edit;
        GetMaxMinY(0,SigTabRec.PointAll-1,MinY,MaxY,i1,i2,Status,SigTabRec);
        CurveViewMinY.Value:=MinY; CurveViewMaxY.Value:=MaxY;
        CurvebViewMaxMinY.Value:=integer(True);
       end;
     end;
    end;

begin
with ImForm as TImageForm do
begin
if  bSetCurveParam then exit;
if  (CurvebViewMaxMinX.Value <> integer(True) )then
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
         Curve.Edit;//Curve.RequestLive:=True;
         CurveViewMinX.Value:=MinXAll;
         CurveViewMaxX.Value:=MaxXAll;
         CurvebViewMaxMinX.Value:=integer(true);
         Curve.Post;
         Nomer:=CurveView_Signal_Nomer.Value;
         if CurveVisible.Value =integer(true) then inc(cPageCurve);
         Curve.Next;
         if Nomer=CurveView_Signal_Nomer.Value then break;
        end;
        NPageCurve:=cPageCurve;
        if NPageCurve=0 then NPageCurve:=1;

       Finally
          Curve.GotoBookMark(BookMark);  Curve.FreeBookMark(BookMark);
          SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
  end {try};
 end; {X}
 CASE ScaleRB.ItemIndex OF
 1:         {индивидуальный масштаб}
  begin
   GetMaxMinYCurve;
   Curve.Edit;//Curve.RequestLive:=True;
   Curve.Post;
   BookMark:=Curve.GetBookmark;
   Curve.DisableControls;
   Try
     Curve.First;
     cPageCurve:=0;
     for CCurve:=0 to Curve.RecordCount-1 do
      begin
       Curve.Edit;//Curve.RequestLive:=True;
       CurveScaleStyle.Value:=ScaleRb.ItemIndex;
       CurveSlider.Value:=(SliderS.MaxValue-SliderS.Value)/(SliderS.MaxValue-SliderS.Minvalue)-0.5;
       Curve.Post;
       Nomer:=CurveView_Signal_Nomer.Value;
       if CurveVisible.Value =integer(true) then inc(cPageCurve);
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
      NPageCurve:=cPageCurve;
      if NPageCurve=0 then NPageCurve:=1;

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
       if  (CurvebViewMaxMinY.Value <> integer(True) )then
          begin    {определение мах мин по оси Y }
           Curve.Edit;//Curve.RequestLive:=True;
           ptrTo:=Curve.fieldbyname('pSigTabRec').asinteger;
           SigtabRec:=(pSigTabRec(Curve.fieldbyname('pSigTabRec').asinteger))^;
           GetMaxMinY(0,SigTabRec.PointAll-1,MinY,MaxY,i1,i2,Status,SigTabRec);
           CurveViewMinY.Value:=MinY; CurveViewMaxY.Value:=MaxY;
           CurvebViewMaxMinY.Value:=integer(True);
           Curve.Post;
          end;
       if MaxYAll<CurveViewMaxY.Value then  MaxYAll:=CurveViewMaxY.Value;
       if MinYAll>CurveViewMinY.Value then MinYAll:=CurveViewMinY.Value;
       Nomer:=CurveView_Signal_Nomer.Value;
       if CurveVisible.Value =integer(true) then inc(cPageCurve);
       Curve.Next;
       if Nomer=CurveView_Signal_Nomer.Value then break;
      end;
      NPageCurve:=cPageCurve;
      if NPageCurve=0 then NPageCurve:=1;

      Curve.First;
      for CCurve:=0 to Curve.RecordCount-1 do
      begin
       Curve.Edit;//Curve.RequestLive:=True;
       CurveScaleStyle.Value:=ScaleRb.ItemIndex;
       CurveViewMinYAll.Value:=MinYAll; CurveViewMaxYAll.Value:=MaxYAll;
       CurveSlider.Value:=(SliderS.MaxValue-SliderS.Value)/(SliderS.MaxValue-SliderS.MinValue)-0.5;;
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
end;

(*procedure PacketEXportSigToFile( PackForm:TForm;Fname:phar );
 var
  Shap1:TLongShapka;
  Rez:single; Deltx,Rez1:real;
  FileDest,FileSource:TBufferedFile;
  FileDestTxt:text;
  Point,Chan,i:Longint;
  A0,A1,A2,A3:real;RezType:byte;
  Nomer:Longint;
  cCurve:Longint;
  Status:integer;
  FormatS_X,FormatS_Y:phar;
 begin
  with PackForm as Tpacket_Form do
   begin
    with Shap1 do
     begin
       bMaxMinExistAll:=false;
       bMaxMinExist:=False;
       rMaxX:=0;rMinX:=0;rMaxY:=0;rMinY:=0;
       ActChanal:=0;
       NChanal:=EkspSignals.RecordCount;
       lPointStart:=0;
       lPointAll:=EkspSignalsPointAll.Value;
       decodeDate(EkspSignalsDate_Start.Value,AbsTime.Year,AbsTime.Month,AbsTime.Day);
       decodeTime(EkspSignalsTime_Start.Value,AbsTime.Hour,AbsTime.Minute,AbsTime.Second,absTime.Sec100);
       lPointEnd:=lPointAll-1;
       rTimeStart:=0;
       shTimeFormat:=0;
       rClock:=1/EkspsignalsDeltX.Value;
       bCreated:=false;
       scAxisX:=EkspsIGNALSNameX.Value;
       scAxisY:=EkspSignalsNameY.Value;
       ScFile:=Fname;
       TipData:=cRealLong;
       LADC:=512;
       MaxRez:=1;
       scHeader:=scFile;
       fText:='';
     end;  {with}
   PB.MinValue:=0;PB.MaxValue:=Shap1.lPointAll*Shap1.NChanal;
   PB.Visible:=True;
   case FilterComboBox1.ItemIndex of
   0:
   begin
   if pos('.',Shap1.scFile)=0 then Fname:=Shap1.scFile+'.lng'
    else Fname:=Shap1.scfile;
   FileDest:=TBufferedFile.Create(fname,4096);
   FileDest.Rewrite;
   FileDest.write(Shap1,SizeOf(TLongShapka),bytesWrote);
   FileDest.write(Shap1.pPrimech,SizeOf(TPrimech),byteswrote);
   EkspSignals.First;
   cCurve:=0;
   while not EkspSignals.EOF  do
         begin
          FileSource:=TBufferedFile.Create(EkspSignalsFileDat.value,8192);
          FileSource.Reset;
          A0:=EkspSignalsA0.Value;A1:=EkspSignalsA1.Value;
          A2:=EkspSignalsA2.Value;A3:=EkspSignalsA3.Value;
          RezType:=EkspSignalsRezType.Value;
          if ((RezType=cRealLong) and
              (A0=0) and (A1=1) and (A2=0) and (A3=0) ) then
              begin
                FileSource.seek(0);
                for i:=0 to Shap1.lPointAll-1 do
                 begin
                  Filesource.Read(Rez,sizeOf(Rez),bytesRead);
                  FileDest.Write(rez,sizeof(rez),byteswrote);
                  if ((i mod (1+(Shap1.lPointAll div 30)) =0) ) then
                   begin PB.Progress:=cCurve*Shap1.lpointAll+i; Application.ProcessMessages;end;
                  if bStopExport then break;
                 end;
                end
               else
                for i:=0 to Shap1.lPointAll-1 do
                 begin
                  GetRezFromFile(FileSource,i,A0,A1,A2,A3,RezType,Rez1,Status,EkspSignalsFile_Seek.Value);
                  Rez:=Rez1;
                  FileDest.Write(rez,sizeof(rez),byteswrote);
                  if ((i mod (1+(Shap1.lPointAll div 30)) =0) ) then
                   begin PB.Progress:=cCurve*Shap1.lpointAll+i; Application.ProcessMessages;end;
                  if bStopExport then break;
                end;
          FileSource.Close;FileSource.destroy;
          EkspSignals.Next;
          inc(cCurve);
          if bStopExport then break;
         end;
   FileDest.Close;FileDest.Destroy;
   end;
  1:   {Ascii}
   begin
    PB.MaxValue:=Shap1.lPointAll;
    FormatS_X:=FormatxEdit.Text;
    FormatS_Y:=FormatYEdit.Text;
    if pos('.',Shap1.scFile)=0 then Fname:=shap1.scfile+'.gwt'
     else Fname:=Shap1.scfile;
    AssignFile(FiledestTxt,Fname);
    Rewrite(FileDestTxt);
    if bheader.Checked then
     begin
      writeln(Filedesttxt,For_EkspTableEksp_Theme.Value+' '+For_EkspTableEksp_Header.Value);
      writeln(FileDestTxt,DateTimeToStr(EkspSignalsDate_Start.Value+EkspSignalsTime_Start.Value));
      writeln(FileDestTxt,'Delt X = ',FormatFloat(FormatS_X,EkspSignalsDeltX.Value)+' ('+ Shap1.scAxisX+')');
      writeln(FileDestTxt,'N channels: ',Shap1.NChanal);
      writeln(FileDestTxt,'Points per Channel: ',Shap1.lPointAll);
      writeln(FileDestTxt,'-----------------------------------------');
     end;
    if bheader.Checked then
    begin
     if bNumber.Checked then write(FileDestTxt,'Point # ');
     if bX_value.Checked then write(FileDestTxt,'      X ');
     writeln(FileDestTxt,'    Y[i]');
    end;
    deltx:=EkspSignalsDeltX.Value;
    for i:=0 to Shap1.lPointAll-1 do
     begin
      Point:=i;
      if bNumber.Checked then write(FileDestTxt,Point:9,'  ');
      if bX_value.Checked then write(FileDestTxt,FormatFloat(FormatS_X,Point*DeltX));
      EkspSignals.First;
      while not EkspSignals.EOF do
      begin
       FileSource:=TBufferedFile.Create(EkspSignalsFileDat.Value,4096);
       FileSource.Reset;
       A0:=EkspSignalsA0.Value;A1:=EkspSignalsA1.Value;
       A2:=EkspSignalsA2.Value;A3:=EkspSignalsA3.Value;
       RezType:=EkspSignalsRezType.Value;
       GetRezFromFile(FileSource,i,A0,A1,A2,A3,RezType,Rez1,Status,EkspSignalsFile_Seek.Value);
       Rez:=Rez1;
       if Rez>=0 then Write(FiledestTxt,'   ',FormatFloat(FormatS_Y,Rez1))
        else Write(FiledestTxt,'  ',FormatFloat(FormatS_Y,Rez1));
       FileSource.Close;FileSource.destroy;
       EkspSignals.Next;
       if bstopexport then break;
      end;
      Writeln(FiledestTxt);
      if ((i mod (1+(Shap1.lPointAll div 100)) =0) ) then begin PB.Progress:=i; Application.ProcessMessages;end;
      if bstopexport then break;
     end;
   CloseFile(FiledestTxt);
  end;
end; {case}
if bStopExport then deletefile(Fname);
PB.Visible:=false;
end;
end;
  *)

procedure TImageForm.CallProcessing(Sender: TObject;var CrossWin_Rec:TCrossWin_rec);
var
 ProcessingRec:TSourceRec;
 FF1:File of TSourceRec;
 pSigTabRecActive:longint;
 BookMark:TBookMark;
 Nomer:Longint;
 CCurve:word;
 FName:string[80];
 ExeName:string[80];
 i:byte;
 pCharBuf: array [0..255] of char;
// SourceFileName:string;
Datetimestart:TDateTime;
begin
{with ImForm as TImageForm do
 begin}
//      sleep(100);
      FName:=appconfig.TempDir+'CP_'+GetGuidStr+'.cfg';
//      FName:=appconfig.DataStoragePath+'CP_'+GetGuidStr+'.cfg';
      CrossWin_Rec.Fname:=Fname;
      CrossWin_Rec.NVisibleCurve:=0;
      if Sender<>nil then assignFile(FF1,SourceFileName)
       else assignFile(FF1,CrossWin_Rec.Fname);
      Rewrite(FF1);
//      FF1:=TFileStream.Create(
      pSigTabRecActive:=CurvepSigTabRec.Value;
      BookMark:=Curve.GetBookmark;
      Curve.DisableControls;
      Curve.First;

      for CCurve:=0 to Curve.RecordCount-1 do
         begin
          SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
          if cCurve=0 then       DateTimeStart:=SigTabRec.DateTimeStart;
          ProcessingRec.NAllCurveInPage:=NallCurveInPage;
          CrossWin_Rec.NAllCurveInPage:=NallCurveInPage;
          ProcessingRec.PointStart:=round(LeftX/CurveDeltX.asfloat);
          ProcessingRec.PointEnd:=round(RightX/CurveDeltX.asfloat);
          ProcessingRec.PointAll:=SigTabRec.PointAll;
          CrossWin_Rec.PointStart:=round(LeftX/CurveDeltX.asfloat);
          CrossWin_Rec.PointEnd:=round(RightX/CurveDeltX.asfloat);
          CrossWin_Rec.PointAll:=SigTabRec.PointAll;
          ProcessingRec.A0:=SigTabRec.A0;ProcessingRec.A1:=SigTabRec.A1;
          ProcessingRec.A2:=SigTabRec.A2;ProcessingRec.A3:=SigTabRec.A3;
          ProcessingRec.DeltX:=CurveDeltX.asfloat;
          CrossWin_Rec.DeltX:=CurveDeltX.asfloat;
          ProcessingRec.FileDatSource:=dm.activeStoragePath+SigTabRec.FileDat;
          ProcessingRec.RezType:=SigTabRec.RezType;
          ProcessingRec.Seek_Start:=SigTabRec.Seek_Start;
          ProcessingRec.DateTimeStart:=DateTimeStart;//SigTabRec.DateTimeStart;
          CrossWin_rec.TextMinX:=TextMinX;
          CrossWin_rec.TextMaxX:=TextMaxX;
          ProcessingRec.NameY:=CurveCurveHeaderShort.Value;
          ProcessingRec.NameX:=Sig_TableNameX.Value;
          CrossWin_Rec.NameX:=Sig_TableNameX.Value;
          ProcessingRec.RazmX:=Sig_TableRazmX.Value;
          CrossWin_Rec.RazmX:=Sig_TableRazmX.Value;
          ProcessingRec.RazmY:=Sig_TableRazmY.Value;
          ProcessingRec.Eksp_Nomer:=Sig_TableEksp_nomer.Value;
          ProcessingRec.Eksp_Parent:=SelectViewQueryEksp_Parent.Value;
          ProcessingRec.FName:=FName;
          ProcessingRec.Param:=0;
          ProcessingRec.Auto:=0;
          ProcessingRec.TekPageName:= Tabset.Tabs[Tabset.TabIndex];
          CrossWin_Rec.TekPageName:= Tabset.Tabs[Tabset.TabIndex];
          ProcessingRec.TekColor:=CurveColor.Value;
          ProcessingRec.App_Handle:=Application.Handle;
          ProcessingRec.Source_Handle:=Handle;
          ProcessingRec.Source_Caption:=Caption;
          ProcessingRec.StoragePath:=dm.ActiveStoragepath;
          CrossWin_Rec.StoragePath:=dm.ActiveStoragepath;
          CrossWin_Rec.Source_Caption:=Caption;
//          ExpForm.Eksps.Open;
          ExpForm.Eksps.locate('Eksp_Nomer',ProcessingRec.Eksp_Nomer,[]);
          ProcessingRec.Theme_Eksp:=ExpForm.EkspsEksp_Theme.value;
          ProcessingRec.Header_Eksp:=ExpForm.EkspsEksp_Header.Value;
          ProcessingRec.Author:=ExpForm.EkspsEksp_Author.Value;
          CrossWin_Rec.Theme_Eksp:=ExpForm.EkspsEksp_Theme.value;
          CrossWin_Rec.Header_Eksp:=ExpForm.EkspsEksp_Header.Value;
          CrossWin_Rec.Author:=ExpForm.EkspsEksp_Author.Value;
//          ExpForm.Eksps.Close;
          if CurveVisible.Value = integer(true) then
           begin
            ProcessingRec.KindCurve:=1;
            inc(CrossWin_Rec.NVisibleCurve);
           end else ProcessingRec.KindCurve:=2;
          if pSigTabRecActive=CurvepSigTabRec.Value then ProcessingRec.KindCurve:=0;
          write(FF1,ProcessingRec);
          Nomer:=CurveView_Signal_Nomer.Value;
          Curve.Next;
          if Nomer=CurveView_Signal_Nomer.Value then break;
         end;
        Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
        SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
        closeFile(FF1);
  ExeName:='';
  if ((Sender<> nil) and (Sender is TButton)) then
   begin
     case TButton(Sender).Tag  of
      1: ExeName:=AppConfig.IniFile.ReadString('Button','Filtr_Exe','');
      2: ExeName:=AppConfig.IniFile.ReadString('Button','FFT_Exe','');
      3: ExeName:=AppConfig.IniFile.ReadString('Button','F(t)_Exe','');
      4: ExeName:=AppConfig.IniFile.ReadString('Button','User_Exe','');
      5: ExeName:=AppConfig.IniFile.ReadString('Button','2_ch_Exe','');
      10: ExeName:=AppConfig.IniFile.ReadString('Button','MATLAB_Exe','MATLAB_P.exe');
{     6: begin
          ExeName:=User_Form.Exe_Names[User_Form.ListBox1.itemindex]+'.exe';
         end;
 }   end;
    for i:=1 to Length(exeName) do PCharBuf[i]:=ExeName[i];
    StrPCopy(pCharBuf, ExeName);
    if ExeName<>'' then WinExec(pCharBuf,sw_showNormal)
     else MessageDlg('Не задан файл для программы обработки',mtError,[mbOK], 0);;
  end;
// end;{with}
 end;



procedure TImageForm.CallStyleForm(ImForm:TForm);
var
 SetStyleForm:TSetStyle_Form;
 BookMark:TBookMark;
 Nomer:longint;
 cCurve:integer;
begin
Application.CreateForm(TSetStyle_Form,SetStyleform);
SetStyleForm.ApplyButton.Visible:=true;
if SetStyleForm.ShowModal=mrYes then
 begin
   BookMark:=Curve.GetBookmark;
   Curve.DisableControls;
   Try
    Curve.First;
    cPageCurve:=0;
    for CCurve:=0 to Curve.RecordCount-1 do
    begin
     {Curve.RequestLive:=true;}Curve.Edit;
     CurveColor.Value:=SetStyleForm.ColorsTMP[((cCurve) mod 16)+1];
     CurveCurveWidth.Value:=SetStyleForm.LineWidthTMP[((cCurve) mod 16)+1];
     CurveStyle.Value:=SetStyleForm.LineStylesTMP[((cCurve) mod 16)+1];
     CurveVisible.Value:=integer(SetStyleForm.LineHideTMP[((cCurve) mod 16)+1]);
     Curve.post;
     Nomer:=CurveView_Signal_Nomer.Value;
     if CurveVisible.Value =integer(true) then inc(cPageCurve);
     Curve.Next;
     if Nomer=CurveView_Signal_Nomer.Value then break;
    end;
     NPageCurve:=cPageCurve;
     if NPageCurve=0 then NPageCurve:=1;

     Finally
      Curve.GotoBookMark(BookMark);Curve.EnableControls;Curve.FreeBookMark(BookMark);
      SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
     updateView(True,false);
  end;
 end;
SetStyleForm.Free;
end;


Procedure TImageForm.UpdatePointStartEnd(ImForm:TForm);
var BookMark:TBookMark;
     Nomer:Longint;
begin
with ImForm as TImageForm do
begin
 BookMark:=Curve.GetBookmark;
 Curve.DisableControls;
 Try
  Curve.First;
//  Curve.RequestLive:=true;
  CPageCurve:=0;
  while not Curve.EOF do
   begin
   Curve.Edit;
   CurveOldRightPoint.Value:=CurvePointEnd.Value;
   CurveOldLeftPoint.Value:=CurvePointStart.Value;
   if  CurvebPolyCreate.Value = integer(true)  then
    begin
     if (round((RightX-LeftX)/CurveDeltX.asfloat)=(CurveOldRightPoint.Value-CurveOldLeftPoint.Value))
      then
       begin
        if ((round((RightX)/CurveDeltX.asfloat) < CurveOldRightPoint.Value) and (round(RightX/CurveDeltX.asfloat) > CurveOldLeftPoint.Value))
         or
           ((round(LeftX/CurveDeltX.asfloat) > CurveOldLeftPoint.Value) and ((round(LeftX/CurveDeltX.asfloat) > CurveOldRightPoint.Value)) )
            then CurvebFastPolyCreate.Value:=integer(True);
       end;
    end;
   CurvebPolyCreate.Value:=integer(((CurvePointEnd.Value=round(RightX/CurveDeltX.asfloat)) and
                             (CurvePointStart.Value=round(LeftX/CurveDeltX.asfloat))));
   CurvePointEnd.Value:=round(RightX/CurveDeltX.asfloat);
   CurvePointStart.Value:=round(LeftX/CurveDeltX.asfloat);
   CurveViewMinX.Value:=CurvePointStart.Value*CurveDeltX.asfloat;
   CurveViewMaxX.Value:=CurvePointEnd.Value*CurveDeltX.asfloat;
   CurvebViewMaxMinX.Value:=integer(True);
   Curve.Post;
   if CurveVisible.Value =integer(true) then inc(cPageCurve);
   Nomer:=CurveView_Signal_Nomer.Value;
   Curve.Next;
   if Nomer=CurveView_Signal_Nomer.Value then break;
   end;
   NPageCurve:=cPageCurve;
   if NPageCurve=0 then NPageCurve:=1;
   Finally
    Curve.GotoBookMark(BookMark);
    Curve.EnableControls;
    Curve.FreeBookMark(BookMark);
 end;
 Xactive.Hint:=FloatToStrF((CurvePointEnd.Value - CurvePointStart.Value)*100/SigTabRec.PointAll,
  ffFixed,3,2)+'%';
SetXActive;
XActive.Update;
YX_MenuItem.Enabled:=((NAllCurveInPage>1) and
    ((CurvePointEnd.Value-CurvePointStart.Value)<32000));
end;
end;

procedure TImageForm.GetCurveMaxMinY(ImForm:TForm;var MaxY,MinY:real);
begin
with ImForm as TImageForm do
  begin
   if ((CurveScaleStyle.value = 0) or (CurveScaleStyle.value = 3) )then
     MinY:=CurveMultAll.Value*(CurveViewMinYAll.Value-
     (CurveViewMaxYAll.Value-CurveViewMinYAll.Value)*CurveSlider.value)
    else
     MinY:=CurveMult.Value*(CurveViewMinY.Value-
     (CurveViewMaxY.Value-CurveViewMinY.Value)*CurveSlider.value);
   if ((CurveScaleStyle.value = 0) or (CurveScaleStyle.value = 3))  then
     MaxY:=CurveMultAll.Value*(CurveViewMaxYAll.Value-
        (CurveViewMaxYAll.Value-CurveViewMinYAll.Value)*CurveSlider.Value)
    else
      MaxY:=CurveMult.Value*(CurveViewMaxY.Value-
        (CurveViewMaxY.Value-CurveViewMinY.Value)*CurveSlider.value);
 end;
end;

procedure TImageForm.PaintBox_MouseMove(ImForm:TForm;Sender: TObject; Shift: TShiftState;
     X, Y: Integer);
var XR:double;Yr,YRC,Yrc1:real;
    File_Dat:TBufferedFile;
    XStr:string;
    FirstLine,SecondLine : string[80];
begin
with ImForm as TImageForm do
begin
    bOborotNul:=false;
    if bOnMouseDown then exit;
    SecondLine:='';FirstLine:='';
    if (Screen.activeform= ImForm) and ((MultBox.Visible or ChanalBox.Visible or ProcBox.Visible)) then exit;
    if ((x <0) or  (Y <0) or (X>PaintBox.Width) or (Y>PaintBox.Height) )  then
     begin
      PaintBoxMouseUp(nil,mbleft,[ssleft],0,0);
      exit;
     end;
    GetCursorParam(X,XStr,XR);
    SigtabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
    if SigTabRec.Ky<>0 then Yr:=(SigTabRec.RR1-Y)/SigTabrec.Ky;
    FirstLine:=XStr+'  Y= '+FloatToStrF(Yr,ffGeneral,FormatAll,FormatAfterPoint);
    try
     File_Dat:=TBufferedFile.Create(SigTabRec.FileDat_abs,1024);
     File_Dat.Reset;
     GetRezFromFile(File_Dat,PointNumber,SigTabRec.A0,SigTabRec.A1,SigTabRec.A2,SigTabRec.A3,
                    SigTabRec.RezType,YrC,Status,SigTabRec.Seek_Start);
     SecondLine:='Point № '+IntToStr(PointNumber)+' Y='+FloatToStrF(YrC,ffGeneral,FormatAll,FormatAfterPoint);
     finally
       File_Dat.Close;    File_Dat.Destroy;
    end;
(*    if pos('СТД_Об',TabSet.Tabs[Tabset.TabIndex])>0 then
        begin
           if SigTabRecGrad.FileDat<>'' then
            begin
             try
             FileDat:=TBufferedFile.Create(SigTabRecGrad.FileDat,1024);        FileDat.Reset;
             GetRezFromFile(FileDat,PointNumber,SigTabRecGrad.A0,SigTabRecGrad.A1,SigTabRecGrad.A2,SigTabRecGrad.A3,
                          SigTabRecGrad.RezType,YrC1,Status,SigTabRecGrad.Seek_Start);
             FirstLine:=FirstLine+' гр='+FormatFloat('0',Yrc1);
             finally
               FileDat.Close;    FileDat.Destroy;
             end;{try}
            end;
           if SigTabRecOborot.FileDat<>'' then
            begin
             try
             FileDat:=TBufferedFile.Create(SigTabRecOborot.FileDat,1024); FileDat.Reset;
             GetRezFromFile(FileDat,PointNumber,SigTabRecOborot.A0,SigTabRecOborot.A1,SigTabRecOborot.A2,SigTabRecOborot.A3,
                           SigTabRecOborot.RezType,YrC1,Status,SigTabRecOborot.Seek_Start);
             SecondLine:=SecondLine+' оборот='+FormatFloat('0',Yrc1);
             bOborotnul:=YRC1=0;
             finally
              FileDat.Close;    FileDat.Destroy;
             end;{try}
            end;
     end;*)

    MousLabel.Font.Color:=CurveColor.Value;
    if bOldCursor then HideOldcursor;
    OldMode:=PaintBox.Canvas.Pen.Mode;
    PaintBox.Canvas.Pen.Mode:=pmNot;
    PaintBox.Canvas.MoveTo(X,PaintBox.Height-5);
    PaintBox.Canvas.Lineto(X,PaintBox.Height);
    PaintBox.Canvas.Pen.Mode:=OldMode;
    XCursorTime.Caption:=XStr;
    XCursorTime.Left:=X-(XCursorTime.Width div 2);
    XCursorTime.Update;
    bOldCursor:=true;
    XOld:=X;
    XOldStr:=XStr;
    ViewMinXDB.Update;ViewMaxXDb.Update;
    YlastMouse:=Y;
    OldMode:=PaintBox.Canvas.Pen.Mode;
    MousLabel.DragMode:=dmManual;
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
          if LabelNameX.Caption='t' then
            TextXOld:='   dt='+FloatToStrF(abs(XR-XRLeft)*24*60,ffGeneral,7,4)+'min'
             else TextXOld:='   dX='+FloatToStrF(abs(XR-XRLeft),ffGeneral,FormatAll,FormatAfterPoint);
          TextYOld:='   dY='+FloatToStrF(abs(YR-YRUP),ffGeneral,FormatAll,FormatAfterPoint);
          FirstLine:=FirstLine+TextXOld;
          SecondLine:=SecondLine+TextYOld;
           MousLabel.DragMode:=dmAutomatic;
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
    MousLabel.Caption:=FirstLine{+#10+#13+SecondLine};
    UpPanel.Update;
   end;
end;


procedure TImageForm.DrawAxisY(Paintbox:TPaintBox;H1,H2:word;CurveColor,FonColor:TColor;Max,min:real;
                    PaintBox_G:TPaintBox;bGridY:boolean);
var
n,SmeshLine,BottomLine,Old,OldShtrih:longint;
Delt,Logdelt:real;
Mult,MinVal:real;   MinValue:real;
bText:boolean;
begin
 if Max=min then exit;
 bText:=H2-H1>22;
with PaintBox do
  begin
  Color:=FonColor;
  Canvas.Font.Size:=7;Canvas.Font.name:='Small Fonts';
  Canvas.Brush.style:=bsSolid;
  Canvas.Brush.Color:=FonColor;
  Canvas.Pen.Style := psClear;
{  Canvas.Pen.Color := color;}
  Canvas.Rectangle(0,H1,width,H2);
  Canvas.Pen.Color := CurveColor;
  Canvas.Brush.style:=bsClear;
  Canvas.Font.Color := Curvecolor;
  Canvas.Pen.Style := psSolid;
  Canvas.Moveto(Width-6,H1+6);
  Canvas.Lineto(Width-4,H1);Canvas.LineTo(Width-2,H1+6);
  Canvas.Moveto(Width-4,H1);Canvas.Lineto(Width-4,H2);
 Delt:=Max-Min;
 logDelt:=round(ln(Delt)/ln(10));
 if LogDelt<0 then Mult:= 1/exp((logDelt*ln(10))) else
   Mult:=1/exp((logDelt*ln(10)));
 Delt:=exp(logDelt*ln(10))/10;
 if delt=0 then exit;
 if Min=0 then
  begin
   MinValue:=Delt;
   BottomLine:=H1+round(H2-H1-MinValue/(Max-Min)*(H2-H1))
  end;
 if Min>0 then
  begin
   MinValue:=0;
   while MinValue<Min do
    MinValue:=MinValue+Delt;
   BottomLine:=H1+round(H2-H1-(MinValue-Min)/(Max-Min)*(H2-H1))
  end;
 if Min<0 then
  begin
   MinValue:=0;
   while MinValue>Min do
    MinValue:=MinValue-Delt;
   MinValue:=MinValue+Delt;
   BottomLine:=H1+round(H2-H1-(MinValue-Min)/(Max-Min)*(H2-H1))
  end;
 Old:=0;OldShtrih:=0;
 SmeshLine:=Canvas.textHeight('0')*2;
 if bGridY then
  begin
   PaintBox_G.Canvas.Pen.style:=psDot ;
   PaintBox_G.Canvas.Pen.Width:=1;
   if PaintBox.Canvas.Brush.Color=clWhite then PaintBox_G.Canvas.Pen.Color:=clSilver
    else PaintBox_G.Canvas.Pen.Color:=clWhite;
  end;
 n:=0;
 while MinValue<Max do
 begin
   if (abs(BottomLine-Old)>SmeshLine) then
    begin
    if (abs(BottomLine-H1)>SmeshLine) then
     begin
      if MinValue<=0 then
       begin
        if n=0 then begin if bText then Canvas.TextOut(0,BottomLine-round(Canvas.textHeight('0')),
               '- '+formatFloat('0.0',abs(MinValue*Mult))) end
                else
               begin
                if bText then Canvas.TextOut(0,BottomLine-round(Canvas.textHeight('0')/2),
               '- '+formatFloat('0.0',abs(MinValue*Mult)))
               end;
       end
       else
        begin
         if n=0 then
          begin
           if bText then Canvas.TextOut(4,BottomLine-round(Canvas.textHeight('0')),formatFloat('0.0',MinValue*Mult));end
          else begin
                 if bText then Canvas.TextOut(4,BottomLine-round(Canvas.textHeight('0')/2),formatFloat('0.0',MinValue*Mult));
               end;
        end;
      inc(n);
     end;
     Old:=BottomLine;
     Canvas.Moveto(Width-5,BottomLine);Canvas.Lineto(Width-1,BottomLine);
     if bGridY then
      begin
      if PaintBox.Canvas.Brush.Color=clWhite then PaintBox_G.Canvas.Pen.Color:=clSilver
       else PaintBox_G.Canvas.Pen.Color:=clWhite;
       PaintBox_G.Canvas.Moveto(0,BottomLine);
       PaintBox_G.Canvas.Lineto(PaintBox_G.Width,BottomLine);
      end;
     OldShtrih:=BottomLine;
    end;
   MinValue:=MinValue+Delt;
   BottomLine:=H1+round(H2-H1-(MinValue-Min)/(Max-Min)*(H2-H1));
 end;
 if n>0 then
  begin
   if Mult<>1 then
   begin
    Canvas.Font.Size:=Canvas.Font.Size;
    Canvas.TextOut(0,H1+3,'х10');
    if bText then Canvas.TextOut(Canvas.TextWidth('х10'),H1,formatFloat('0',logDelt));
    Canvas.Font.Size:=Canvas.Font.Size+2;
   end;
  end;
 if n<2 then
  begin
    PaintBox_G.Canvas.Font.Name:='Small Fonts';
    PaintBox_G.Canvas.Font.Size:=7;
    PaintBox_G.Canvas.Font.Color:=CurveColor;
    PaintBox_G.Canvas.Brush.Color:=FonColor;
    PaintBox_G.Canvas.Brush.Style:=bsClear;
    PaintBox_G.Canvas.Pen.Width:=1;
    PaintBox_G.Canvas.Pen.Style:=psSolid;
    if bText then
     begin
      if n=0 then PaintBox.Canvas.TextOut(0,H2-Canvas.textHeight('0'),
                             formatFloat('0.0E+0',Min));
      PaintBox_G.Canvas.TextOut(0,H1,formatFloat('0.0E+0',Max));
     end;
  end;
 end;{with}
end;

procedure TImageForm.DrawGridY(H1,H2:word;Max,min:real;PaintBox_G:TCanvas{PaintBox};LP,Wdth:word);
var
SmeshLine,BottomLine,Old:longint;
Delt,Logdelt:real;
Mult,MinVal:real;   MinValue:real;
begin
 if Max=min then exit;
 if (H2-H1)>350 then
   begin
    PaintBox_G.Font.Size:=8;PaintBox_G.Font.name:='Arial';
   end
    else
     begin
       PaintBox_G.Font.Size:=6;PaintBox_G.Font.name:='Small Fonts';
     end;
 Delt:=Max-Min;
 logDelt:=round(ln(Delt)/ln(10));
 if LogDelt<0 then Mult:= 1/exp((logDelt*ln(10))) else
   Mult:=1/exp((logDelt*ln(10)));
 Delt:=exp(logDelt*ln(10))/10;
 if delt=0 then exit;
 if Min=0 then
  begin
   MinValue:=Delt;
   BottomLine:=H1+round(H2-H1-MinValue/(Max-Min)*(H2-H1))
  end;
 if Min>0 then
  begin
   MinValue:=0;
   while MinValue<Min do     MinValue:=MinValue+Delt;
   BottomLine:=H1+round(H2-H1-(MinValue-Min)/(Max-Min)*(H2-H1))
  end;
 if Min<0 then
  begin
   MinValue:=0;
   while MinValue>Min do     MinValue:=MinValue-Delt;
   MinValue:=MinValue+Delt;
   BottomLine:=H1+round(H2-H1-(MinValue-Min)/(Max-Min)*(H2-H1))
  end;
 Old:=0;
 SmeshLine:=PaintBox_G.textHeight('0')*2;
 PaintBox_G.Pen.style:=psDot ;
{PaintBox_G.Pen.Color:=clred;}
 if PaintBox_G.Brush.Color=clWhite then PaintBox_G.Pen.Color:=clSilver
    else PaintBox_G.Pen.Color:=clWhite;
 while MinValue<Max do
 begin
   if (abs(BottomLine-Old)>SmeshLine) then
    begin
    if (abs(BottomLine-H1)>SmeshLine) then
     begin
     Old:=BottomLine;
     PaintBox_G.Moveto(LP{0},BottomLine);
     PaintBox_G.Lineto({PaintBox_G.Width}wdth,BottomLine);
    end;
    end;
   MinValue:=MinValue+Delt;
   BottomLine:=H1+round(H2-H1-(MinValue-Min)/(Max-Min)*(H2-H1));
 end;
end;

procedure TImageForm.Save_As_Eksp(ImForm:TForm;Sender: TObject);
begin
(* Save_New_Form.Part_All.Enabled:=true;
 Save_New_Form.Active_Visible.Enabled:=true;
 Save_New_Form.Edit2.Text:=Caption;
 Save_New_Form.Edit1.Text:=Tabset.Tabs[Tabset.Tabindex];
 if Save_New_Form.ShowModal=mrOK then
  begin
   Export_Form.Part_All:=Save_New_Form.Part_All;
   Export_Form.Active_Visible:=Save_New_Form.Active_Visible;
   Export_Form.FilterComboBox1.ItemIndex :=0;
   Export_Form.FileEdit.Text:=GemisWin_exe_Path+'$$___$$.lng';
   ExportSigToFile(ImForm,true);
   OpenEksForm.Show;
   OpenEksForm.ImportToBase(GemisWin_exe_Path+'$$___$$.lng',Save_New_Form.Edit1.Text,
          false,false,false);
{          Import_form.bSrazu.Checked,Import_form.DopCorrection.Checked,false)}
   OpenEksForm.Eksp_Table.Edit;
   OpenEksForm.Eksp_TableEksp_Header.Value:=Save_New_Form.Edit2.Text;
   OpenEksForm.Eksp_Table.Post;
   OpenEksForm.Close;
   DeleteFile(GemisWin_exe_Path+'$$___$$.lng');
   Show;
  end;
*)
end;

procedure TImageForm.ScalemenuClick(ImForm:TForm;Sender: TObject);
begin
// with ImForm as TImageForm do
// begin
 if sender = NE then ScaleRB.Itemindex:=0;
 if sender = NI then ScaleRB.Itemindex:=1;
 if sender = NPI then ScaleRB.Itemindex:=2;
 if sender = NPE then ScaleRB.Itemindex:=3;
 case  ScaleRb.ItemIndex of
  0:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton1.Glyph;
  1:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton2.Glyph;
  2:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton3.Glyph;
  3:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton4.Glyph;
 end;
 ScaleButton.NumGlyphs:=1;
 if ScaleStyle<>ScaleRb.ItemIndex then
        begin
         ScaleStyle:=ScaleRb.ItemIndex;
         bSetCurveParam:=false;
         if bCreateOver then UpdateView(True,true);
        end;
//  end;

 end;

procedure TImageForm.ScalemenuClick_YX(ImForm:TForm;Sender: TObject);
begin
(* with ImForm as TYX_Form do
 begin
 if sender = NE then ScaleRB.Itemindex:=0;
 if sender = NI then ScaleRB.Itemindex:=1;
 if sender = NPI then ScaleRB.Itemindex:=2;
 if sender = NPE then ScaleRB.Itemindex:=3;
 case  ScaleRb.ItemIndex of
  0:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton1.Glyph;
  1:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton2.Glyph;
  2:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton3.Glyph;
  3:ScaleButton.Glyph:=Scale_Help_Form.SpeedButton4.Glyph;
 end;
 ScaleButton.NumGlyphs:=1;
 if ScaleStyle<>ScaleRb.ItemIndex then
        begin
         ScaleStyle:=ScaleRb.ItemIndex;
         bSetCurveParam:=false;
         if bCreateOver then UpdateView(True,true);
        end;
  end;
*)end;

Procedure TImageForm.DragDrop_in_Image(ImForm:TForm;Sender,Source:TObject;x,y:integer;FonColor:TColor);
var r1,r2:single; cCurve,Nomer:longint; BookMark,BookMark1:TBookMark;
    cn1,cn2:longint;
    oldMemo:string;
begin
  if Source is TCursorShape then
   begin
   with source as tCursorShape do
    begin
{     x:=X-PaintBox1.Width;}
     Left:=x;
     TCursorRec(pCursrec^).CursLabel.Left:=X+PaintBox1.Width;
     TCursorRec(pCursrec^).PointNum:=Round((x/PaintBox.Width*(CurveViewMaxX.Value-
                         CurveViewMinX.Value)/CurveDeltX.asfloat))+CurvePointStart.Value;
     PointNumber:= TCursorRec(pCursrec^).PointNum;
     dm.q.SQL.Clear;
     dm.q.SQL.ADD('Update Cursors set XStr = :XOldStr, PointNum = ' + intToStr( PointNumber)+
            ' where Id_Cursor = '+IntToStr(TCursorRec(pCursrec^).id_Cursor_InCursorTable));
     dm.q.parambyname('XOldStr').asstring:=XOldStr;
     dm.q.ExecSQL;
     dm.q.Transaction.CommitRetaining;
     Cursors_Form.DelInCursChan(TCursorRec(pCursrec^).id_Cursor_InCursorTable);
     CursorRec:=TCursorRec(pCursrec^);
     AppendInCursChan(TCursorRec(pCursrec^).id_Cursor_InCursorTable,TCursorRec(pCursrec^).Cursor_Num);
     Cursors_Form.Cursors.Close;
     Cursors_Form.Cursors.Open;
     if Cursors_Form.Visible then Cursors_Form.ShowCursor(TCursorRec(pCursrec^).id_Cursor_InCursorTable);
     TCursorRec(pCursrec^).CursLabel.Caption:=intToStr(TCursorRec(pCursrec^).Cursor_Num);
     TCursorRec(pCursrec^).CursLabel.Hint:=XOldStr;
     TCursorRec(pCursrec^).MemoStr:=CursorRec.MemoStr;
     if TCursorRec(pCursrec^).bXStr then TCursorRec(pCursrec^).CursLabel.Caption:=TCursorRec(pCursrec^).CursLabel.Caption+
             chr(10)+chr(13)+XoldStr;
     if TCursorRec(pCursrec^).bMemo then TCursorRec(pCursrec^).CursLabel.Caption:=TCursorRec(pCursrec^).CursLabel.Caption+
             chr(10)+chr(13)+TCursorRec(pCursrec^).MemoStr;
    Cursors_Form.GetCursorLastNumber(0,false);         
     exit;
    end;
   end;
//   exit;
   if (Source is TTabSet)  then
   begin
    if (mainForm.ActiveForm = ImForm{self}) then exit;
    r1:=CurveDeltX.asfloat;
    r2:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveDeltX.asfloat;
    if r1<>r2 then exit;
    with TIMAGEFORM(MAINFORM.ACTIVEFORM) do
    begin
     BookMark:=Curve.GetBookmark;
     Curve.DisableControls;
     Try
       Curve.First;
       for CCurve:=0 to Curve.RecordCount-1 do
        begin
         if CurveVisible.Value =integer(true) then
          InserCurve(ImForm{Self},false);
         Nomer:=CurveView_Signal_Nomer.Value;
         Curve.Next;
         if Nomer=CurveView_Signal_Nomer.Value then break;
        end;
       Finally
       Curve.GotoBookMark(BookMark); Curve.EnableControls;  Curve.FreeBookMark(BookMark);
       SigTabRec:=(pSigTabRec(CurvepSigTabRec.Value))^;
     end; {try}
    end;
    Obnovlenie_Image(TImageForm(ImForm).TabSet.TabIndex);
//    FonDialog.FonColor.Brush.Color:=FonColor;
//    SendMessage(ImForm.Handle, wm_SetFon,0,-1);
   end;
   exit;
  if ((Source is TLabel) and (TLabel(Source).Name='Label9')) then
   begin
    if (mainForm.ActiveForm = ImForm) then exit;
    r1:=CurveDeltX.asfloat;
    r2:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveDeltX.asfloat;
    if r1<>r2 then exit;
    InserCurve(ImForm,true);
   end;
   if ((Source is TLabel) and (TLabel(Source).Name='MousLabel')) then
   begin
    if (mainForm.ActiveForm = ImForm) then exit;
    r1:=CurveDeltX.asfloat;
    r2:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveDeltX.asfloat;
    if r1<>r2 then exit;
    BookMark:=TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.GetBookmark;
    TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.DisableControls;
    Cn1:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveNum1;
    cn2:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveNum2;
    Try
       TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.First;
       TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.First;
       cCurve:=0;
       while not TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.EOF do
  {     for CCurve:=0 to TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.RecordCount-1 do}
        begin
        if ((cCurve >=Cn1) and
            (cCurve <=cn2))then
         begin
          if TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveVisible.Value =integer(true) then
          begin
          BookMark1:=TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.GetBookmark;
          InsertZoom(TIMAGEFORM(MAINFORM.ACTIVEFORM),ImForm,cCurve,cCurve,false,
                      TIMAGEFORM(MAINFORM.ACTIVEFORM).PointNumberLeft,
                      TIMAGEFORM(MAINFORM.ACTIVEFORM).PointNumber,
                                               false,true,ViewNumber);
          TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.GotoBookMark(BookMark1);
          end;
         end;
         Nomer:=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveView_Signal_Nomer.Value;
         TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.Next;
         inc(cCurve);
  {       if Nomer=TIMAGEFORM(MAINFORM.ACTIVEFORM).CurveView_Signal_Nomer.Value then break;}
        end;
      Finally
       TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.GotoBookMark(BookMark);
       TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.EnableControls;
       TIMAGEFORM(MAINFORM.ACTIVEFORM).Curve.FreeBookMark(BookMark);
       TIMAGEFORM(MAINFORM.ACTIVEFORM).SigTabRec:=(pSigTabRec(TIMAGEFORM(MAINFORM.ACTIVEFORM).CurvepSigTabRec.Value))^;
     end; {try}
//  TIMAGEFORM(MAINFORM.ACTIVEFORM).Show;
    TImageForm(ImForm).Obnovlenie_Image(TImageForm(ImForm).TabSet.TabIndex);
{    Show;}
   TImageForm(ImForm).UpdateCurvePointStartEnd;
   TImageForm(ImForm).UpdateView(True,true);
//    FonDialog.FonColor.Brush.Color:=FonColor;
//    SendMessage(ImForm.Handle, wm_SetFon,0,-1);
   end;
end;

procedure TImageForm.CurveAfterPost(DataSet: TDataSet);
begin
 curve.Transaction.CommitRetaining;
end;

procedure TImageForm.SelectViewQueryAfterPost(DataSet: TDataSet);
begin
 SelectViewQuery.transaction.CommitRetaining
end;

procedure TImageForm.CurveAfterOpen(DataSet: TDataSet);
begin
 curve.fetchall;
 stylestable.open;
end;

procedure TImageForm.DivideOnDeltX;
var delTX:double;
begin
 Curve.first;
 while not Curve.Eof do
  begin
   deltx:=Sig_Table.fieldbyname('DeltX').asfloat;
   dm.Create_Curve.ParamByName('View_Nomer').value:= Curve.fieldbyname('View_Nomer').value;
   dm.Create_Curve.ParamByName('Signal_Nomer').value:= Curve.fieldByName('Signal_Nomer').value;
   dm.Create_Curve.ParamByName('CurveHeaderShort').value:= Curve.FieldByName('CurveHeaderShort').value;
   dm.Create_Curve.ParamByName('CurveHeader').value:= Curve.FieldByName('CurveHeader').value;
   dm.Create_Curve.ParamByName('PointEnd').value:= Curve.FieldByName('PointEnd').value;
   dm.Create_Curve.ParamByName('PointStart').value:= Curve.FieldByName('PointStart').value;
   dm.Create_Curve.ParamByName('ViewMaxX').value:=Curve.fieldbyname('ViewMaxX').value;
   dm.Create_Curve.ParamByName('ViewMaxY').value:=Curve.fieldbyname('ViewMaxY').value;
   dm.Create_Curve.ParamByName('ViewMinY').value:=Curve.fieldbyname('ViewMinY').value;
   dm.Create_Curve.ParamByName('ViewMinX').value:=Curve.fieldbyname('ViewMinX').value;
   dm.Create_Curve.ParamByName('bViewMaxMinX').value:=Curve.fieldbyname('bViewMaxMinX').value;
   dm.Create_Curve.ParamByName('bViewMaxMinY').value:=Curve.fieldbyname('bViewMaxMinY').value;
   dm.Create_Curve.ParamByName('bPolyCreate').value:=Curve.fieldbyname('bPolyCreate').value;
   dm.Create_Curve.ParamByName('PolyPoint').value:=Curve.fieldbyname('PolyPoint').value;
   dm.Create_Curve.ParamByName('PolyFile').value:=  dm.ActiveStoragepath+'cf'+GetGuidstr+'.Dat';
   dm.Create_Curve.ParamByName('COlor').value:=Curve.fieldbyname('COlor').value;
   dm.Create_Curve.ParamByName('Style').value:=Curve.fieldbyname('Style').value;
   dm.Create_Curve.ParamByName('CurveWidth').value:=Curve.fieldbyname('CurveWidth').value;
   if pos('t',Sig_TableNameX.Value)=1 then dm.Create_Curve.ParamByName('ViewPage').value:='Fd='+formatfloat('0.00',1/deltx)
    else dm.Create_Curve.ParamByName('ViewPage').value:='DeltX='+formatfloat('0.00000',deltx);
   dm.Create_Curve.ParamByName('ScaleStyle').value:=Curve.fieldbyname('ScaleStyle').value;
   dm.Create_Curve.ParamByName('CurveDate').value:=Now;
   dm.Create_Curve.ParamByName('CurveTime').value:=Time;
   dm.Create_Curve.ParamByName('Slider').value:=Curve.fieldbyname('Slider').value;
   dm.Create_Curve.ParamByName('Mult').value:=Curve.fieldbyname('Mult').value;
   dm.Create_Curve.ParamByName('Visible').asinteger:=integer(true);
   dm.Create_Curve.ParamByName('MultAll').value:=Curve.fieldbyname('MultAll').value;
   dm.Create_Curve.ParamByName('pPolyX').value:=longint(nil);
   dm.Create_Curve.ParamByName('pPolyY').value:=longint(nil);
   dm.Create_Curve.ParamByName('AxisXStyle').value:=Curve.fieldbyname('AxisXStyle').value;  {sek}
   dm.Create_Curve.ParamByName('ColorFon').value:=Curve.fieldbyname('ColorFon').value;
   dm.Create_Curve.ParamByName('GridX').value:=Curve.fieldbyname('GridX').value;
   dm.Create_Curve.ParamByName('GridY').value:=Curve.fieldbyname('GridY').value;
   dm.Create_Curve.Execproc;
   Curve.Next;
  end;
  dm.Create_Curve.Transaction.CommitRetaining;
  Obnovlenie_Image(0);
end;

procedure TImageForm.N9Click(Sender: TObject);
var Image:tImage;
begin
 Image:=TImage.create(self);
 Image.height:=GroupBox.height;
 Image.width:=width;
// GroupBox.lock;
// Image.Canvas.CopyRect();
 GroupBox.paintto(Image.Canvas,0,0);
// GroupBox.canvas.Unlock;
 Image.Picture.SaveToFile('C:\image.bmp');
 Image.Destroy;
end;

procedure TImageForm.FindSignal(Sender: TObject);

type
  TParamInfo_Proc = procedure(
        a1:pchar;
        a2:pchar;
        a3:pchar;
        T_Ist: pchar;      // время источника сигнала
        ImageSource:pchar; // имя файла с картинкой исходного сигнала
        ImageSpectr:pchar; // имя файла с картинкой рассчитанных спектров
        Fmax_P_Hz:pchar;   // Частота максимума спектра на участке P-волны Fmax,Гц
        Flow_07_Hz:pchar;  // Нижняя частота спектра (на уровне 0,7) fн,Гц
        FHigh_07_Hz:pchar; // Верхняя частота спектра (на уровне 0,7) fв, Гц
        Steepness:pchar;   // Крутизна спада спектра P-волны
        Amplituda:pchar;   // Амплитуда сигнала А
        Complexity:pchar   // Сложность записи Comp
{        NPointsFFT:integer;   // Количество отсчетов в спектре
        DirectoryName:string;// имя каталога, в котором сохранены файлы
        FileDatDest_Signal:string;// имя файла (File of single) со спектром исходного сигнала (одного сигнала
        FileDatDest_Noise:string; // имя файла (File of single)со спектром   шума
        FileDatDest_Signal_Noise:string}) ; // имя файла (File of single) со спектром разности сигнал-шум

  //               external 'ParamInfo_dll' ;


var
    Image:tImage;
    FileSource:TBufferedFile;
    BufRez_Signal: pDataReal;
    BufRez_Signal_Noise: pDataReal;
    BufRez_Noise: pDataReal;
   SpectrPar:TSpectrPar;
    pCursorRec:^TCursorRec;
    pCursorRec1:^TCursorRec;
    pCursorRec2:^TCursorRec;
    pCursorRec3:^TCursorRec;
    BufRez1: pDataReal;
 FileDest:TFileStream;
 NameY_Signal, Head_Signal,
 NameY_Signal_Noise, Head_Signal_Noise,
 NameY_Noise, Head_Noise,
 FileDatDest_Signal,FileDatDest_Noise,FileDatDest_Signal_Noise:string;
ID_Signal,ID_Noise,ID_Signal_Noise:integer;
 F,F05,FMax,i,Nomer_Eksp:Integer;
 PointE:integer;
 N_For_Noise,FFTPOINT:integer;
 PageName:string;
 HTMLText:string;
 SL:TstringList;
 HTMLPath:string;
 max:double ;
 stepF:double;
 status:integer;
 Rez,SigMax:real;
 N5Sek,N25Sek:integer;
 Sum5Sek,Sum25Sek:double;
 e_nomer:integer;
 ID:Integer;
        Fmax_P_Hz:string;
        Flow_07_Hz:string;
        FHigh_07_Hz:string;
        Steepness:string;
        Amplituda:string;
        Compexity:string;
        T_Ist:string;
        a1:pchar;
        a2:pchar;
        a3:pchar;
        T_Ist_DT:double;

        dll_Handle:THandle;
  ParamInfoProc: TParamInfo_Proc;

begin
 e_nomer:=Sig_TableEksp_nomer.Value;
 If DialogGetParam.showModal = mrOk then
 begin
     FFTPOINT:=strtoint(DialogGetParam.PointFFT.text);
     N_For_Noise:=strtoint(DialogGetParam.N_For_Noice.Text);
     if not DialogGetParam.useActiveCurve_CB.checked then Curve.Last;
     if cursorslist=nil then
      begin
       showmessage('Поиск сигнала выполняется при установленных курсорах');
       exit;
      end;
     if cursorslist.count<2 then
      begin
       showmessage('Должно быть не менее двух курсоров');
       exit;
      end;

     SpectrPar.VidFunc:=2;SpectrPar.PointFFT:=FFTPOINT;
     SpectrPar.WindowFunc:=DialogGetParam.WinFunc.ItemIndex;
     SpectrPar.OneOrMany:=0;
     SpectrPar.Smesh:=(FFTPOINT div 2);SpectrPar.SrednOrMap:=0;
     SpectrPar.SelectedSignal:=0;
     SpectrPar.Ao:=0.000001;
     pCursorRec1:=nil;
     pCursorRec2:=nil;
     pCursorRec3:=nil;

     pCursorRec:=CursorsList.Items[0];
     for i:=0 to CursorsList.count-1 do
      begin
       pCursorRec:=CursorsList.Items[i];
       if pCursorRec^.Cursor_Num=1 then    pCursorRec1:=CursorsList.Items[i];
       if pCursorRec^.Cursor_Num=2 then    pCursorRec2:=CursorsList.Items[i];
       if pCursorRec^.Cursor_Num=3 then    pCursorRec3:=CursorsList.Items[i];
      end;
  T_Ist:='';
 if CurveViewMinX.Value<>CurveViewMaxX.Value then
  begin

    T_ist_DT:=(pSigTabRec(CurvepSigTabRec.Value))^.DateTimeStart+
      (pCursorRec1.PointNum+0.0)*CurveDeltX.asfloat/3600.0/24.0;
//    T_Ist:=Formatdatetime('dd.mm.yyyy HH:mm:ss.dss',T_ist_Dt);
    T_Ist:=Formatdatetime('HH',T_ist_Dt);
  end;

     FileSource:=TBufferedFile.Create(Sig_table.fieldbyname('Filedat_abs').asstring,8192);
     FileSource.Reset;

     GetMem(BufRez_Signal_Noise,((FFTPOINT )+Zapas) *SizeOf(Single) );
     GetMem(BufRez_Signal,((FFTPOINT )+Zapas) *SizeOf(Single) );
     GetMem(BufRez_Noise,((FFTPOINT )+Zapas) *SizeOf(Single) );

     for i:=0 to  (FFTPOINT div 2) do BufRez_Signal^[i]:=0;
    // for i:=0 to  (FFTPOINT) do BufRez_Signal_Noise^[i]:=0;
     for i:=0 to  (FFTPOINT) do BufRez_Noise^[i]:=0;

     GetSpectr(FileSource,SpectrPar.VidFunc, SpectrPar.WindowFunc,SpectrPar.Ao,
                       pCursorRec1^.PointNum,FFTPOINT,
                      0,1,0,0, cRealLong,BufRez_Signal,0);

// поиск максимума сигнала
     GetRezFromFile(FileSource,pCursorRec1^.PointNum,0,1,0,0,cRealLong,SigMax,Status,0);
     for i:=0 to pCursorRec2^.PointNum-pCursorRec1^.PointNum do
     begin
      GetRezFromFile(FileSource,pCursorRec1^.PointNum+i,0,1,0,0,cRealLong,Rez,Status,0);
      if SigMax<Rez then SigMax:=Rez;
     end;

//поиск коэффициента сложности
     N5Sek:=round(5/Sig_Table.fieldbyname('Deltx').asfloat);
     N25sek:=round(25/Sig_Table.fieldbyname('Deltx').asfloat);
     Sum5Sek:=0;
     for i:=0 to N5Sek-1 do
     begin
      GetRezFromFile(FileSource,pCursorRec1^.PointNum+i,0,1,0,0,cRealLong,Rez,Status,0);
      Sum5Sek:=Sum5Sek+abs(Rez);
     end;
     Sum25Sek:=0;
     for i:=N5Sek to N25Sek-1 do
     begin
      GetRezFromFile(FileSource,pCursorRec1^.PointNum+i,0,1,0,0,cRealLong,Rez,Status,0);
      Sum25Sek:=Sum25Sek+abs(Rez);
     end;


     for I:=1 to N_For_Noise do
      GetSpectr(FileSource,SpectrPar.VidFunc, SpectrPar.WindowFunc,SpectrPar.Ao,
                       pCursorRec1^.PointNum-FFTPOINT*I,FFTPOINT,
                      0,1,0,0, cRealLong,BufRez_Noise,0);

     for i:=0 to  (FFTPOINT) do BufRez_Noise^[i]:=BufRez_Noise^[i]/N_For_Noise;
     for i:=0 to  (FFTPOINT div 2) do BufRez_Signal_Noise^[i]:=BufRez_Signal^[i]-BufRez_Noise^[i];

     FiledatDest_Noise:={dm.ActiveStoragepath + }'sf_N' + GetGuidStr +'.Dat';
     FileDest:=TFileStream.Create(dm.ActiveStoragepath+FiledatDest_Noise,fmCreate);
     FileDest.Write(BufRez_Noise^[0],(FFTPOINT div 2)*SizeOf(Single));
     FileDest.destroy;//Close;

     FiledatDest_Signal_Noise:={dm.ActiveStoragepath + }'sf_S_N' + GetGuidStr +'.Dat';
     FileDest:=TFileStream.Create(dm.ActiveStoragepath+FiledatDest_Signal_Noise,fmCreate);
     FileDest.Write(BufRez_Signal_Noise^[0],(FFTPOINT div 2)*SizeOf(Single));
     FileDest.destroy;//Close;

     FiledatDest_Signal:={dm.ActiveStoragepath + }'sf_S' + GetGuidStr +'.Dat';
     FileDest:=TFileStream.Create(dm.ActiveStoragepath+FiledatDest_Signal,fmCreate);
     FileDest.Write(BufRez_Signal^[0],(FFTPOINT div 2)*SizeOf(Single));
     FileDest.destroy;//Close;


     dm.Create_Eksp_AfterProc.ParamByName('Eksp_Header').value:='Поиск сигнала, расчет спектра';
     dm.Create_Eksp_AfterProc.ParamByName('Eksp_Date').value:=Now;
     dm.Create_Eksp_AfterProc.ParamByName('Eksp_Time').value:=Time;
     dm.Create_Eksp_AfterProc.ParamByName('Eksp_Author').value:=Program_Name;
     dm.Create_Eksp_AfterProc.ParamByName('Eksp_Theme').value:='Спектр';
     dm.Create_Eksp_AfterProc.ParamByName('Eksp_memo').asstring:='';
     dm.Create_Eksp_AfterProc.ParamByName('Eksp_SignalSource').asstring:='';
     dm.Create_Eksp_AfterProc.ParamByName('Eksp_Proc').value:=1;
     dm.Create_Eksp_AfterProc.ParamByName('Eksp_Parent').value:=Sig_TableEksp_nomer.Value;;
     dm.Create_Eksp_AfterProc.execproc;
     Nomer_Eksp:=dm.Create_Eksp_AfterProc.parambyname('ID').asinteger;

  StepF:=(1/Sig_Table.fieldbyname('Deltx').asfloat)/FFTPOINT;

          dm.Create_Signal.ParamByName('Eksp_Nomer').value:= Nomer_Eksp;
          dm.Create_Signal.ParamByName('Eksp_Parent').value:= Nomer_Eksp;
          dm.Create_Signal.ParamByName('DeltX').value:=(1/Sig_Table.fieldbyname('Deltx').asfloat)/FFTPOINT;
          dm.Create_Signal.ParamByName('NameX').value:= 'f, Hz';
          dm.Create_Signal.ParamByName('RazmX').value:= 'Hz';
          dm.Create_Signal.ParamByName('RazmY').value:= '.';
          dm.Create_Signal.ParamByName('MultX').value:= 1;
          dm.Create_Signal.ParamByName('MultY').value:= 1;
          dm.Create_Signal.ParamByName('MaxX').value:= 1;
          dm.Create_Signal.ParamByName('MaxY').value:= 1;
          dm.Create_Signal.ParamByName('MinX').value:=0;
          dm.Create_Signal.ParamByName('MinY').value:= 0;
          dm.Create_Signal.ParamByName('Date_Start').value:= 0 ;
          dm.Create_Signal.ParamByName('Time_Start').value:= 0 ;
          dm.Create_Signal.ParamByName('DateTimeStart').value:= 0;//ProcessingRec.DateTimeStart;//unc(ProcessingRec.DateTimeStart) ;
          dm.Create_Signal.ParamByName('PointAll').value:= (FFTPOINT div 2);//ProcessingRec.PointAll;
          dm.Create_Signal.ParamByName('BMaxMinX').value:= integer(false);
          dm.Create_Signal.ParamByName('BMaxMinY').value:= integer(false);
          dm.Create_Signal.ParamByName('RezType').value:= cRealLong;
          dm.Create_Signal.ParamByName('File_Seek').value:= 0;
          dm.Create_Signal.ParamByName('Rezlength').value:= cSizeRez[cRealLong];
          dm.Create_Signal.ParamByName('A0').value:= 0;
          dm.Create_Signal.ParamByName('A1').value:= 1;
          dm.Create_Signal.ParamByName('A2').value:= 0;
          dm.Create_Signal.ParamByName('A3').value:= 0;
          PointE:=  (dm.Create_Signal.ParamByName('PointAll').Value-1)*2/3;

          dm.Create_Signal.ParamByName('Chanal_Nomer').value:= 1;
          dm.Create_Signal.ParamByName('Chanal_Header').value:= 's-n '+Curve.Fieldbyname('CurveHeaderShort').asstring ;
          dm.Create_Signal.ParamByName('NameY').value:= 's-n '+Curve.Fieldbyname('CurveHeaderShort').asstring;
          dm.Create_Signal.ParamByName('FileDat').value:= FileDatdest_Signal_Noise;
          NameY_Signal_Noise:= dm.Create_Signal.ParamByName('NameY').Value;
          Head_Signal_Noise:=  dm.Create_Signal.ParamByName('Chanal_Header').Value;
          dm.Create_Signal.execproc;
          ID_Signal_Noise:=dm.Create_Signal.parambyname('ID').asinteger;

          dm.Create_Signal.ParamByName('Chanal_Nomer').value:= 2;
          dm.Create_Signal.ParamByName('Chanal_Header').value:= 's '+Curve.Fieldbyname('CurveHeaderShort').asstring ;
          dm.Create_Signal.ParamByName('NameY').value:= 's '+Curve.Fieldbyname('CurveHeaderShort').asstring;
          dm.Create_Signal.ParamByName('FileDat').value:= FileDatdest_Signal;
          NameY_Signal:= dm.Create_Signal.ParamByName('NameY').Value;
          Head_Signal:=  dm.Create_Signal.ParamByName('Chanal_Header').Value;
          dm.Create_Signal.execproc;
          ID_Signal:=dm.Create_Signal.parambyname('ID').asinteger;

          dm.Create_Signal.ParamByName('Chanal_Nomer').value:= 3;
          dm.Create_Signal.ParamByName('Chanal_Header').value:= 'n '+Curve.Fieldbyname('CurveHeaderShort').asstring ;
          dm.Create_Signal.ParamByName('NameY').value:= 'n: '+Curve.Fieldbyname('CurveHeaderShort').asstring;
          dm.Create_Signal.ParamByName('FileDat').value:= FileDatdest_noise;
          NameY_Noise:= dm.Create_Signal.ParamByName('NameY').Value;
          Head_Noise:=  dm.Create_Signal.ParamByName('Chanal_Header').Value;
          dm.Create_Signal.execproc;
          ID_Noise:=dm.Create_Signal.parambyname('ID').asinteger;


        dm.Create_Curve.ParamByName('View_Nomer').value:= Curve.fieldbyname('View_Nomer').value;
        dm.Create_Curve.ParamByName('PointEnd').value:= PointE;
        dm.Create_Curve.ParamByName('PointStart').value:= 0;
        dm.Create_Curve.ParamByName('ViewMaxX').value:= 0;
        dm.Create_Curve.ParamByName('ViewMaxY').value:= 0;
        dm.Create_Curve.ParamByName('ViewMinY').value:= 0;
        dm.Create_Curve.ParamByName('ViewMinX').value:= 0;
        dm.Create_Curve.ParamByName('bViewMaxMinX').value:= integer(false);
        dm.Create_Curve.ParamByName('bViewMaxMinY').value:= integer(false);
        dm.Create_Curve.ParamByName('bPolyCreate').value:= integer(false);
        dm.Create_Curve.ParamByName('PolyPoint').value:= 0;
//        dm.Create_Curve.ParamByName('PolyFile').value:=  dm.ActiveStoragepath+'cf'+GetGuidstr+'.Dat';
        dm.Create_Curve.ParamByName('PolyFile').value:=  'cf'+GetGuidstr+'.Dat';
        dm.Create_Curve.ParamByName('Style').value:= 5;
        dm.Create_Curve.ParamByName('ViewPage').value:= 'A(f):'+
              Curve.Fieldbyname('CurveHeaderShort').asstring+' начало:'+
              FormatFloat('0.000',pCursorRec1^.PointNum*Sig_Table.fieldbyname('Deltx').asfloat)+
              ','+Sig_Table.fieldbyname('RazmX').asstring;
        dm.Create_Curve.ParamByName('ScaleStyle').value:=0;
        dm.Create_Curve.ParamByName('CurveDate').value:=Now;
        dm.Create_Curve.ParamByName('CurveTime').value:=Time;
        dm.Create_Curve.ParamByName('Slider').value:=0;
        dm.Create_Curve.ParamByName('Mult').value:=1;
        dm.Create_Curve.ParamByName('Visible').asinteger:=integer(true);
        dm.Create_Curve.ParamByName('MultAll').value:=1;
        dm.Create_Curve.ParamByName('pPolyX').value:=longint(nil);
        dm.Create_Curve.ParamByName('pPolyY').value:=longint(nil);
        dm.Create_Curve.ParamByName('AxisXStyle').value:=1;  {sek}
        dm.Create_Curve.ParamByName('ColorFon').value:=AppConfig.Inifile.ReadInteger('system','FonColor',clGray);
        dm.Create_Curve.ParamByName('GridX').value:=0;
        dm.Create_Curve.ParamByName('GridY').value:=0;

        dm.Create_Curve.ParamByName('COlor').value:= clblue;//curve.fieldbyname('Color').value;
        dm.Create_Curve.ParamByName('CurveWidth').value:= 3;
        dm.Create_Curve.ParamByName('Signal_Nomer').value:= ID_Signal_Noise;
        dm.Create_Curve.ParamByName('CurveHeaderShort').value:= copy(NameY_Signal_noise,1,8);
        dm.Create_Curve.ParamByName('CurveHeader').value:= Head_Signal_Noise;
        dm.Create_Curve.Execproc;

        dm.Create_Curve.ParamByName('COlor').value:= curve.fieldbyname('Color').value;
        dm.Create_Curve.ParamByName('CurveWidth').value:= 1;
        dm.Create_Curve.ParamByName('Signal_Nomer').value:= ID_Signal;
        dm.Create_Curve.ParamByName('CurveHeaderShort').value:= copy(NameY_Signal,1,8);
        dm.Create_Curve.ParamByName('CurveHeader').value:= Head_Signal;
        dm.Create_Curve.Execproc;

        dm.Create_Curve.ParamByName('COlor').value:= clPurple;//ccurve.fieldbyname('Color').value;
        dm.Create_Curve.ParamByName('CurveWidth').value:= 1;
        dm.Create_Curve.ParamByName('Signal_Nomer').value:= ID_Noise;
        dm.Create_Curve.ParamByName('CurveHeaderShort').value:= copy(NameY_Noise,1,8);
        dm.Create_Curve.ParamByName('CurveHeader').value:= Head_Noise;
        dm.Create_Curve.Execproc;

        dm.Create_Eksp.transaction.CommitRetaining;
        expform.eksprefresh;
        expform.curvesetrefresh;

     HTMLPath:=ExtractFilePath(Application.exename)+'HTML\';
     SpectrImagefilename:=HTMLPath+'image_Spectr_'+GetGuidstr+'.bmp';
     signalImagefilename:=HTMLPath+'image_Signal_'+GetGuidstr+'.bmp';
     HTMLFilename:=HTMLPath+'HTML_'+GetGuidstr+'.htm';
     Mouslabel.caption:='';
     Image:=TImage.create(self); Image.height:=GroupBox.height; Image.width:=width;
     GroupBox.paintto(Image.Canvas,0,0);
     Image.Picture.SaveToFile(signalImagefilename);

    dm.SetEkspParam.ParamByName('Eksp_ID').value:=e_nomer;
    dm.SetEkspParam.ParamByName('ParamGroup').value:= 'Параметры техногенных источников';
    dm.SetEkspParam.ParamByName('ParamTYPE').value:= 'Image';


     Image.Destroy;

     PageName:=dm.Create_Curve.ParamByName('ViewPage').value;
     Obnovlenie_Image(TabSet.TabIndex);

     for i:=0 to Tabset.Tabs.Count-1 do
       if tabset.Tabs[i]=Pagename then  Tabset.TabIndex:=i;

     Image:=TImage.create(self);  Image.height:=GroupBox.height;  Image.width:=width;
     GroupBox.paintto(Image.Canvas,0,0);
     Image.Picture.SaveToFile(SpectrImagefilename);
     Image.Destroy;

    dm.SetEkspParam.ParamByName('Eksp_ID').value:=e_nomer;
    dm.SetEkspParam.ParamByName('ParamGroup').value:= 'Параметры техногенных источников';
    dm.SetEkspParam.ParamByName('ParamTYPE').value:= 'Image';
    dm.SetEkspParam.ParamByName('ParamValue').value:= 'см.график';
    dm.SetEkspParam.ParamByName('ParamName').value:= 'Сигнал';
    dm.SetEkspParam.Execproc;
    Id:=dm.SetEkspParam.ParamByName('ID').value;
    dm.SetEkspParam.transaction.CommitRetaining;

    expform.ekspparams.Close;    expform.ekspparams.open;
    expform.ekspparams.locate('ID', id,[]);
    expform.ekspparams.edit;
    dm.ConvertBmpToJpeg(SignalImagefilename);
    expform.ekspparamsPARAMIMAGE.LoadFromFile(ChangeFileExt(SignalImagefilename,'.jpg'));
    expform.ekspparams.post;

    dm.SetEkspParam.ParamByName('ParamName').value:= 'Спектр';
    dm.SetEkspParam.Execproc;
    Id:=dm.SetEkspParam.ParamByName('ID').value;
    dm.SetEkspParam.transaction.CommitRetaining;

    expform.ekspparams.Close;    expform.ekspparams.open;
    expform.ekspparams.locate('ID', id,[]);
    expform.ekspparams.edit;
    dm.ConvertBmpToJpeg(SpectrImagefilename);
    expform.ekspparamsPARAMIMAGE.LoadFromFile(ChangeFileExt(SpectrImagefilename,'.jpg'));
    expform.ekspparams.post;

     HTMLText:=
    '<HTML> <HEAD><TITLE>'+Program_Name+', распознавание параметров сигнала '+Caption+' </TITLE></HEAD> <BODY>'+
    '<H4 ALIGN=LEFT><A NAME="AI">'+
    'Параметры распознавания источников</A></H4></P>'+
    '<BR><B>Исходный сигнал</B><BR>'+
    caption+
    '<BR><IMG SRC = "'+ChangeFileExt(SignalImagefilename,'.jpg')+'" ALT = "'+caption+'">'+
    '<BR><B> Рассчитанный спектр от 1-го курсора </B>'+
    '<BR><IMG SRC = "'+ChangeFileExt(SpectrImagefilename,'.jpg')+'" ALT="Спектр"'+
    '<BR><BR><B>Результат расчета параметров</B>';
    max:=BufRez_Signal_Noise^[0];
    FMax:=0;
    for i:=0 to  (FFTPOINT div 2) do
     if Max<BufRez_Signal_Noise^[i] then begin Max:=BufRez_Signal_Noise^[i];FMax:=i;end;
    HTMLText:=HTMLText+
    '<BR>1. Частота  максимума спектра на участке P-волны Fmax, Гц: '+
     FormatFloat('0.0000',Fmax*StepF);

    Fmax_P_Hz:=FormatFloat('0.0000000000000',Fmax*StepF);
    dm.SetEkspParam.ParamByName('ParamTYPE').value:= 'Number';
    dm.SetEkspParam.ParamByName('ParamValue').value:= FormatFloat('0.0000',Fmax*StepF);
    dm.SetEkspParam.ParamByName('ParamName').value:= 'Частота  максимума спектра на участке P-волны Fmax,Гц';
    dm.SetEkspParam.Execproc;

    F:=0;
    for i:=0 to  (FFTPOINT div 2) do
     if BufRez_Signal_Noise^[i]>0.7*Max then begin F:=i;break;end;

    HTMLText:=HTMLText+
    '<BR>2. Нижняя частота спектра (на уровне 0,7) fн, Гц : '+formatfloat('0.0000',F*StepF);


    Flow_07_Hz:=formatfloat('0.00000000000',F*StepF);
    dm.SetEkspParam.ParamByName('ParamValue').value:= FormatFloat('0.0000',F*StepF);
    dm.SetEkspParam.ParamByName('ParamName').value:= 'Нижняя частота спектра (на уровне 0,7) fн,Гц';
    dm.SetEkspParam.Execproc;

    F:=0;
    for i:=(FFTPOINT div 2) downto 0 do
     if BufRez_Signal_Noise^[i]>0.7*Max then begin F:=i;break;end;
    HTMLText:=HTMLText+
    '<BR>3. Верхняя частота спектра (на уровне 0,7) fв, Гц : '+formatfloat('0.0000',F*StepF);

    FHigh_07_Hz:=formatfloat('0.000000000000',F*StepF);
    dm.SetEkspParam.ParamByName('ParamValue').value:= FormatFloat('0.0000',F*StepF);
    dm.SetEkspParam.ParamByName('ParamName').value:= 'Верхняя частота спектра (на уровне 0,7) fв, Гц ';
    dm.SetEkspParam.Execproc;

    F05:=0;
    for i:=(FFTPOINT div 2) downto 0   do
     if BufRez_Signal_Noise^[i]>0.5*Max then begin F05:=i;break;end;

   dm.SetEkspParam.ParamByName('ParamName').value:= 'Крутизна спада спектра P-волны';
  Steepness:='';
   try
     HTMLText:=HTMLText+
    '<BR>4. Крутизна спада спектра P-волны: '+
    Formatfloat('0.0000',1/Ln(10)*( ln(Max)-ln(Max/2) ) / abs( (Fmax-F05)*StepF) ) ;
    Steepness:=Formatfloat('0.000000000000',1/Ln(10)*( ln(Max)-ln(Max/2) ) / abs( (Fmax-F05)*StepF) );
    dm.SetEkspParam.ParamByName('ParamValue').value:= Formatfloat('0.0000',1/Ln(10)*( ln(Max)-ln(Max/2) ) / abs( (Fmax-F05)*StepF) ) ;
 except
  HTMLText:=HTMLText+
    '<BR>4. Крутизна спада спектра P-волны: не определена';

  dm.SetEkspParam.ParamByName('ParamValue').value:= 'не определена' ;
  end;
  dm.SetEkspParam.Execproc;

  HTMLText:=HTMLText+
    '<BR>5. Амплитуда сигнала А,: '+Formatfloat('0.00000', SigMax);

  Amplituda:=Formatfloat('0.00000000000', SigMax);
  dm.SetEkspParam.ParamByName('ParamValue').value:= Formatfloat('0.00000', SigMax) ;
  dm.SetEkspParam.ParamByName('ParamName').value:= 'Амплитуда сигнала А';
  dm.SetEkspParam.Execproc;


  dm.SetEkspParam.ParamByName('ParamName').value:= 'Сложность записи Comp';
  if Sum25sek<>0 then
     begin
     HTMLText:=HTMLText+'<BR>6. Сложность записи Comp,: '+formatfloat('0.00000', Sum5sek/Sum25sek);
     dm.SetEkspParam.ParamByName('ParamValue').value:= formatfloat('0.00000', Sum5sek/Sum25sek) ;
     Compexity:=formatfloat('0.000000000000000', Sum5sek/Sum25sek);
     end
     else
      begin
       HTMLText:=HTMLText+
       '<BR>6. Сложность записи Comp,: рассчитать не удается из-за нуля в знаменателе';
       dm.SetEkspParam.ParamByName('ParamValue').value:= 'рассчитать не удается из-за нуля в знаменателе' ;
       Compexity:='';
       end;

   dm.SetEkspParam.Execproc;
   dm.SetEkspParam.transaction.CommitRetaining;

   HTMLText:=HTMLText+ '</BODY></HTML>';

   SL:=TStringList.Create;
   SL.Text:=HTMLText;
   SL.Savetofile(HTMLFileName);
   SL.Free;
   ShellExecute(Application.Handle, nil, pchar(HTMLFilename), nil, nil, SW_SHOW);

   Freemem(BufRez_Noise);
   Freemem(BufRez_Signal_Noise);
   Freemem(BufRez_Signal);

   expform.ekspparams.Close;   expform.ekspparams.open;
   expform.ekspparams.Close;   expform.ekspparams.open;


   a1:='1';
   a2:='2';
   a3:='3';


try
  if AppConfig.inifile.Readstring('Paraminfo','Status','')='Y' then
  begin
   dll_handle:=loadlibrary('Paraminfo_dll.dll');
   if dll_Handle >= 32 then { if <=32 - error ! }
   begin
    @ParamInfoProc := GetProcAddress(dll_Handle, pchar('ParamInfo'));
    if assigned(ParamInfoProc) then
      ParamInfoProc(
           pchar(a1),
           pchar(a2),
           pchar(a3),
           pchar(T_Ist),
           pchar(ChangeFileExt(SignalImagefilename,'.jpg')),
           pchar(ChangeFileExt(SpectrImagefilename,'.jpg')),
           pchar(Fmax_P_Hz),
           pchar(Flow_07_Hz),
           pchar(FHigh_07_Hz),
           pchar(Steepness),
           pchar(Amplituda),
           pchar(Compexity){,
           (FFTPOINT div 2),
           dm.ActiveStoragepath,
           FileDatDest_Signal,
           FileDatDest_Noise,
           FileDatDest_Signal_Noise });

       end;
(*
      ParamInfo(
           pchar(Compexity)   ,
           pchar(Amplituda)   ,
           pchar(Steepness),
           pchar(FHigh_07_Hz),
           pchar(Flow_07_Hz),
           pchar(Fmax_P_Hz),
           pchar(ChangeFileExt(SpectrImagefilename,'.jpg')),
           pchar(ChangeFileExt(SignalImagefilename,'.jpg')),
           pchar(T_Ist),
           pchar(a3),
           pchar(a2),
           pchar(a1)(*,

           pchar(a1),
           pchar(a2),
           pchar(a3),
           pchar(T_Ist),
           pchar(ChangeFileExt(SignalImagefilename,'.jpg')),
           pchar(ChangeFileExt(SpectrImagefilename,'.jpg')),
           pchar(Fmax_P_Hz),
           pchar(Flow_07_Hz),
           pchar(FHigh_07_Hz),
           pchar(Steepness),
           pchar(Amplituda),
           pchar(Compexity)*)
           {,
           (FFTPOINT div 2),
           dm.ActiveStoragepath,
           FileDatDest_Signal,
           FileDatDest_Noise,
           FileDatDest_Signal_Noise }
    end;
 finally
 freelibrary(dll_handle);
 end;
 end; 
end;

procedure TImageForm.Sig_TableCalcFields(DataSet: TDataSet);
begin
 sig_Table.fieldbyname('Filedat_abs').asstring:=dm.activestoragepath+sig_Table.fieldbyname('Filedat').asstring;
end;

end.



