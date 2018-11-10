unit matlab_U;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, COMObj, ActiveX, variants, Mask, DBCtrls,
  ShellAPI,
  Gauges, DB, Dbf,
  tvc_u,  mdrv, FileBuff, Grids, DBGridEh, ComCtrls, DBClient, DBGrids,
  ImgList, Menus;
const
  NrezArray = 1023;

type
  TMainWin = class(TForm)
    processnew: TDbf;
    processnewSELECTSIGN: TFloatField;
    processnewPARTALL: TBooleanField;
    processnewBSHOWRESUL: TBooleanField;
    processnewSHOWWIN: TFloatField;
    processnewHEADWIN: TStringField;
    processnewPAGENAME: TStringField;
    processnewSIGNUMSRCA: TFloatField;
    processnewSIGNUMSRCB: TFloatField;
    processnewFILENAMEDE: TStringField;
    processnewRESULTTIP: TFloatField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    PartAll: TDBRadioGroup;
    SelectedSignal: TDBRadioGroup;
    ShowWin: TDBRadioGroup;
    Label6: TLabel;
    Label5: TLabel;
    HeadWin: TDBEdit;
    Gauge2: TGauge;
    Gauge1: TGauge;
    ButtonCancel: TBitBtn;
    ButtonOK: TBitBtn;
    PageName: TDBEdit;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    DBMemo2: TDBMemo;
    matlabfunc: TClientDataSet;
    matlabfuncFUNCNAME: TStringField;
    matlabfuncM_FILENAME: TStringField;
    matlabfuncDESCR: TStringField;
    DBGridEh2: TDBGridEh;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGridEh1: TDBGridEh;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    Label3: TLabel;
    mfile: TMemo;
    DBText1: TDBText;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    miSaveMFile: TMenuItem;
    meEnableEdit: TMenuItem;
    Splitter3: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure SendMatrixButClick(Sender: TObject);
    procedure RetMatrixButClick(Sender: TObject);
    procedure InvButClick(Sender: TObject);
    procedure SendDButClick(Sender: TObject);
    procedure GetDButClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure matlabfuncAfterPost(DataSet: TDataSet);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure miSaveMFileClick(Sender: TObject);
    procedure meEnableEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ProcessingRec: TSourceRec;
    ProcessingRecMinX, ProcessingRecMaxX, ProcessingRecMX: TSourceRec;
    ReturnRec: TReturnRec;
    FuncPar: TFuncPar;
    RetFile: file of TReturnRec;
    bMessage: boolean;
    Source_Handle: hWnd;
    App_Source_Handle: THandle;
    Copy_SourceFile, Copy_TargetFile: shortstring;
    procedure wmSetPartAll(var Message: TMessage); message wm_SetPartall;
    procedure wmStartProcessing(var Message: TMessage); message wm_StartProcessing;
    procedure FuncProc;
  end;

var
  MainWin: TMainWin;
  MatLabOLEWin : Variant;

implementation
{$R *.DFM}
uses
 config;
var
  RezArray: array[0..NRezArray] of single;
  cRezArray: integer;
  Shag: integer;
  GetRezRec, GetRezRec1: TGetRezRec;


procedure TMainWin.FormCreate(Sender: TObject);
var
  FF: file of TFuncPar;
  FF1: file of TSourceRec;
  s:string;
begin
 Matlabfunc.LoadFromFile(extractfilepath(application.exename)+'matlabfunc.xml' );
  Processnew.Open;
  FuncPar.c1_edit := 1; FuncPar.c2_edit := 0;
  FuncPar.ActivePage := 0; FuncPar.Sk_Sredn := 1; FuncPar.bSkUsr := true;
  FuncPar.Format_s := '0.000000';
  FuncPar.Chisl_Har := 0;
  assignFile(FF, FuncParFile);
  try
    Reset(FF); Read(FF, FuncPar); CloseFile(FF);
  except
    on EInOutError do
      MessageDlg(FuncParFile + ' I/O error.', mtError, [mbOk], 0);
  end;
  Copy_SourceFile := SourceFileName;
  Copy_TargetFile := appconfig.TempDir + 'co_' + GetGuidStr + '.cfg';
  CopyFile(pchar(Copy_SourceFile), pchar(Copy_TargetFile), false);
  assignFile(FF1, Copy_TargetFile);
{  assignFile(FF1,SourceFileName);}
  try
    Reset(FF1); Read(FF1, ProcessingRec); CloseFile(FF1);
  except
    on EInOutError do
    begin
      MessageDlg('ќй- ' + SourceFileName + ' I/O error.', mtError, [mbOk], 0);
      exit;
    end;
  end;
  Source_Handle := ProcessingRec.Source_Handle;
  App_Source_Handle := ProcessingRec.App_Handle;
  Caption := Caption + {Mes_Ini.ReadString('FTime','s4',' дл€ ')+} ' ' + ProcessingRec.Source_Caption + ' / ' +
    ProcessingRec.TekPageName;
  PartAll.Enabled := ProcessingRec.Auto <> 1;
  ShowWin.Enabled := ProcessingRec.Auto <> 1;
  SelectedSignal.Enabled := ProcessingRec.Auto <> 1;
  HeadWin.Enabled := ProcessingRec.Auto <> 1;
  PageName.Enabled := ProcessingRec.Auto <> 1;
  Label5.Visible := ProcessingRec.Auto <> 1;
  Label6.Visible := ProcessingRec.Auto <> 1;
//  Save_Lang_Par(Lang_2_Ini,self,'FuncTime_Proc');
end;

procedure TMainWin.SendMatrixButClick(Sender: TObject);
VAR  MReal : OleVariant;
     MImage : OleVariant;
begin
   MReal := VarArrayCreate([0,3,0,3], varDouble);  //Creates 0..3,0..3 Array
   MImage:= VarArrayCreate([0,3,0,3], varDouble);  //Creates 0..3,0..3 Array
   { Col 1 }
(*   MReal[0,0]:= StrToFloat(Val11.Text);
   MReal[0,1]:= StrToFloat(Val12.Text);
   MReal[0,2]:= StrToFloat(Val13.Text);
   MReal[0,3]:= StrToFloat(Val14.Text);
   { Col 2 }
   MReal[1,0]:= StrToFloat(Val21.Text);
   MReal[1,1]:= StrToFloat(Val22.Text);
   MReal[1,2]:= StrToFloat(Val23.Text);
   MReal[1,3]:= StrToFloat(Val24.Text);
   { Col 3 }
   MReal[2,0]:= StrToFloat(Val31.Text);
   MReal[2,1]:= StrToFloat(Val32.Text);
   MReal[2,2]:= StrToFloat(Val33.Text);
   MReal[2,3]:= StrToFloat(Val34.Text);
   { Col 4 }
   MReal[3,0]:= StrToFloat(Val41.Text);
   MReal[3,1]:= StrToFloat(Val42.Text);
   MReal[3,2]:= StrToFloat(Val43.Text);
   MReal[3,3]:= StrToFloat(Val44.Text);
*)   MatLabOLEWin.PutFullMatrix( 'A','base',VarArrayRef(MReal),VarArrayRef(MImage));
end;

procedure TMainWin.RetMatrixButClick(Sender: TObject);
VAR  MReal : OleVariant;
     MImage : OleVariant;
begin
   MReal := VarArrayCreate([0,3,0,3], varDouble);  //Creates 0..3,0..3 Array
   MImage:= VarArrayCreate([0,3,0,3], varDouble);  //Creates 0..3,0..3 Array
   MatLabOLEWin.GetFullMatrix('A','base',VarArrayRef(MReal),VarArrayRef(MImage));
   { Col1 }
(*   Val11.Text:= FloatToStr(MReal[0,0]);
   Val12.Text:= FloatToStr(MReal[0,1]);
   Val13.Text:= FloatToStr(MReal[0,2]);
   Val14.Text:= FloatToStr(MReal[0,3]);
   { Col2 }
   Val21.Text:= FloatToStr(MReal[1,0]);
   Val22.Text:= FloatToStr(MReal[1,1]);
   Val23.Text:= FloatToStr(MReal[1,2]);
   Val24.Text:= FloatToStr(MReal[1,3]);
   { Col3 }
   Val31.Text:= FloatToStr(MReal[2,0]);
   Val32.Text:= FloatToStr(MReal[2,1]);
   Val33.Text:= FloatToStr(MReal[2,2]);
   Val34.Text:= FloatToStr(MReal[2,3]);
   { Col4 }
   Val41.Text:= FloatToStr(MReal[3,0]);
   Val42.Text:= FloatToStr(MReal[3,1]);
   Val43.Text:= FloatToStr(MReal[3,2]);
   Val44.Text:= FloatToStr(MReal[3,3]);
*)end;

procedure TMainWin.InvButClick(Sender: TObject);
begin
   MatLabOLEWin.Execute('A = inv(A)');
end;

procedure TMainWin.SendDButClick(Sender: TObject);
begin
   MatLabOLEWin.Execute('D=23.45');
end;

procedure TMainWin.GetDButClick(Sender: TObject);
VAR MReal : OleVariant;
    MImage : OleVariant;
begin
   // Send d in case not already sent
   MatLabOLEWin.Execute('d=23.45');
   // Retrieve Single number example
   MReal  := VarArrayCreate([0,0], varDouble);  //Creates 0..0 Array or 1 Number
   MImage := VarArrayCreate([0,0], varDouble);
   MatLabOLEWin.GetFullMatrix('D','base',VarArrayRef(MReal),VarArrayRef(MImage));
//   GetDBut.Caption:= 'Retrived D = ' +FloatToStr(MReal[0]);    // Caption dispalys '23.45'
end;

procedure TMainWin.BitBtn1Click(Sender: TObject);
begin
//   MatLabOLEWin.Execute('demo');
end;

procedure TMainWin.wmSetPartAll(var Message: TMessage);
begin
  PartAll.ItemIndex := 0;
  PartAll.Update;
end;

procedure TMainWin.wmStartProcessing(var Message: TMessage);
begin
  ButtonOkClick(nil);
  inherited;
end;

procedure TMainWin.ButtonOKClick(Sender: TObject);
var FF: file of tFuncPar;
begin

  if Processnew.state = dsEdit then ProcessNew.Post;
  assignFile(FF, FuncParFile);
  try
    Rewrite(FF); write(FF, FuncPar); CloseFile(FF);
  except
    on EInOutError do
    begin
      MessageDlg(FuncParFile + ' I/O error.', mtError, [mbOk], 0);
      exit;
    end;
  end;
  ReturnRec.PartAll := ProcessnewPartAll.Value;
  ReturnRec.SelectSignal := ProcessnewSelectSign.asinteger;
  ReturnRec.Showresult := ProcessnewbShowresul.Value;
  ReturnRec.ShowWin := ProcessnewShowWin.asinteger;
  if ReturnRec.ShowWin = 2 then ReturnRec.PageName := ProcessingRec.TekPageName
  else ReturnRec.PageName := ProcessnewpageName.Value;
  ReturnRec.HeadWin := ProcessnewHeadWin.Value;
  ReturnRec.ProcRez_Type := cProcrez_is_Signal;
  ReturnRec.FName := ProcessingRec.FName;
  ReturnRec.Parent_Handle := Source_Handle;
  ButtonOk.Enabled := False;
  FuncProc;
  ButtonOk.Enabled := true;

end;

procedure TMainWin.ButtonCancelClick(Sender: TObject);
begin
 if bMessage then bMessage := False else close;
end;

procedure TMainWin.FuncProc;
var NPoint, I, k, k1, m1, j: longint; {IMG:TImageForm;}
  FF1: file of TSourceRec;
  PointFFT, cCurve: word;
  RezOld, Rez: single; Xpr, Dx, Mx, Rez1, R0, R1, R2, R3, R4, DI: real;
  FileProcRec: TFileStream;
  FileDest: TFileStream;
  FileSource, FileSource1, FileDestRead, FileDestWrite: TBufferedFile;
  MS, SS, DSS: string[2];
  H, M, S, DS: word;
  Status: integer;
  BufRez, BufRez1: pDataReal;
  ProcOldRec, ProcNESWRec: TSourceRec;
  Sum: real;
  FileText: textFile;
  FileText_Name: shortstring;
  NPoints, NSum, kSum: longint;
  Rez2 {,Rez3}: real;
  SumYi, SumXi, SumYiXi, Xi: real;
  YsvS, XsvS: string;
  cRezCurve, PointVsego: longint;
  Curve,NCurve:integer;
  mReal,MImage,
  InY, OutY : OleVariant;
  MLines:TStringlist;

  DeltX, DeltX_ ,
  PointY , PointY_ :OleVariant;

  OUT_FILE,
  NameY,
  NameX,
  StartTime, StartTime_ :OleVariant;

  OUTPLOT,OutNChan, OutNPoint:integer;

//  outClose:string;
//  OutText:string;
  OutFileName:string;

  MatLab_AllText:string;
  MatLab_FirstPart:string;
  MatLab_SecondPart:string;

  function GetProcessPoint: Longint;
  begin
       GetProcessPoint := ProcessingRec.PointEnd - ProcessingRec.PointStart;
  end;

begin

if fileexists(matlabfunc.FieldByName('m_filename').asstring) then
   begin
    MLines:=TStringlist.create;
    mlines.loadfromfile(matlabfunc.FieldByName('m_filename').asstring)
    end
    else
     begin
      showmessage('Ќет подготовленного m-файла');
      exit;
     end;

  MatLabOLEWin:= CreateOLEObject('Matlab.Application');

  FileProcRec := TFileStream.Create(ProcessingRec.FName, fmCreate);
  FileDest := nil;
  Gauge2.MinValue := 1; Gauge2.MaxValue := ProcessingRec.NAllCurveInPage;
  bMessage := true;
  assignFile(FF1, Copy_TargetFile); Reset(FF1);
  j := 0;
  ReturnRec.NSignal := 0;
  FileText_name := '';
  sleep(100);
  DecodeTime(Time, H, M, S, DS);
  Str(M: 1, MS); if m < 10 then MS := '0' + Ms;
  Str(S: 1, SS); if s < 10 then sS := '0' + ss;
  Str(DS: 1, DSS); if ds < 10 then dss := '0' + dss;

  NCurve:=0;
  for CCurve := 1 to ProcessingRec.NAllCurveInPage do
  begin
    Gauge2.Progress := CCurve; Gauge2.Update;
    Read(FF1, ProcessingRec);
    ProcOldRec := ProcessingRec;
    if ((Returnrec.selectSignal = 2) or
      ((Returnrec.selectSignal = 1) and (ProcessingRec.KindCurve <= 1)) or
      ((Returnrec.selectSignal = 0) and (ProcessingRec.KindCurve = 0))) then
    begin
     NCurve:=NCurve+1;
    end;
  end; {cCurve}

  if ReturnRec.PartAll then
      begin
        ProcessingRec.PointStart := 0;
        ProcessingRec.PointEnd := Processingrec.PointAll - 1;
      end;

  MatLabOLEWin.Execute('IN_NCHAN='+inttostr(nCurve));
  MatLabOLEWin.Execute('IN_NPOINTMAX='+inttostr(GetProcessPoint));
  MatLabOLEWin.Execute('OUT_NCHAN='+inttostr(nCurve));
  MatLabOLEWin.Execute('OUT_NPOINT='+inttostr(GetProcessPoint));
  MatLabOLEWin.Execute('OUT_PLOT=0');

// далее необходимо заполнить массив структур
// array[1..InNChan] of tSourceRec
// и этот массив передать в MatLab

  Reset(FF1);

  inY := VarArrayCreate([0,GetProcessPoint, 0,ncurve-1], varDouble);  //Creates 0..3,0..3 Array
  OutY := VarArrayCreate([0,GetProcessPoint, 0, ncurve-1], varDouble);  //Creates 0..3,0..3 Array

  DeltX := VarArrayCreate([0,ncurve-1], varDouble);
  DeltX_ := VarArrayCreate([0,ncurve-1], varDouble);
  PointY := VarArrayCreate([0,ncurve-1], varDouble);
  PointY_ := VarArrayCreate([0,ncurve-1], varDouble);
  NameY := VarArrayCreate([0,ncurve-1], varVariant);
  NameX := VarArrayCreate([0,ncurve-1], varVariant);
  StartTime := VarArrayCreate([0,ncurve-1], varDouble);
  StartTime_ := VarArrayCreate([0,ncurve-1], varDouble);

//«аполнение входного массива matLab
  Curve:=0;
  for CCurve := 1 to ProcessingRec.NAllCurveInPage do
  begin
    Gauge2.Progress := CCurve; Gauge2.Update;
    Read(FF1, ProcessingRec);
    ProcOldRec := ProcessingRec;
    if ((Returnrec.selectSignal = 2) or
      ((Returnrec.selectSignal = 1) and (ProcessingRec.KindCurve <= 1)) or
      ((Returnrec.selectSignal = 0) and (ProcessingRec.KindCurve = 0))) then
    begin
      if ReturnRec.PartAll then
      begin
        ProcessingRec.PointStart := 0;
        ProcessingRec.PointEnd := Processingrec.PointAll - 1;
      end;
      Gauge1.MinValue := 0; Gauge1.MaxValue := GetProcessPoint;
      Gauge1.Progress := 0; Gauge1.Update;
      ProcessingRec.Seek_Start := cRezCurve * (ProcessingRec.PointEnd - ProcessingRec.PointStart + 1) * SizeOf(Single);
      inc(cRezCurve);
      cRezArray := 0;
      FileSource := TBufferedFile.Create(ProcessingRec.FiledatSource, 4096);
      FileSource.Reset;
      for i := ProcessingRec.PointStart to ProcessingRec.PointEnd do
            begin
              GetRezFromFile(FileSource, i,
                ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                Status, ProcoldRec.Seek_start);
              try
               inY[i-ProcessingRec.PointStart, Curve ]:= Rez1;
               except
               end;
            end; {i}
     DeltX[cCurve-1]:=ProcessingRec.DeltX;
     PointY[cCurve-1]:=ProcessingRec.PointEnd- ProcessingRec.PointStart;
     NameY[cCurve-1]:=ProcessingRec.NameY;
     MatLabOLEWin.PutCharArray( 'NAMEY['+inttostr(cCurve-1)+']','base',NameY[cCurve-1]);
     NameX[cCurve-1]:=ProcessingRec.NameX;
     MatLabOLEWin.PutCharArray( 'NAMEX['+inttostr(cCurve-1)+']','base',NameX[cCurve-1]);
     StartTime[cCurve-1]:=ProcessingRec.DateTimeStart+ ProcessingRec.PointStart*ProcessingRec.DeltX;
     Curve:=Curve+1;
     if FileSource <> nil then
     begin
        FileSource.Close; FileSource.Destroy; FileSource := nil;
     end;
   end;
   if filedest<>nil then  FileDest.Destroy;
   FiledEst := nil;

  end; {cCurve}

// передача массива данных дл€ обработки
  MatLabOLEWin.PutFullMatrix( 'IN_Y','base',VarArrayRef(InY),VarArrayRef(outY));
  MatLabOLEWin.PutFullMatrix( 'IN_DELTX','base',VarArrayRef(DeltX),VarArrayRef(DeltX_));
  MatLabOLEWin.PutFullMatrix( 'IN_POINTY','base',VarArrayRef(PointY),VarArrayRef(PointY_));
  MatLabOLEWin.PutFullMatrix( 'IN_STARTTIME','base',VarArrayRef(StartTime),VarArrayRef(StartTime_));

  MatLabOLEWin.PutFullMatrix( 'OUT_DELTX','base',VarArrayRef(DeltX),VarArrayRef(DeltX_));
  MatLabOLEWin.PutFullMatrix( 'OUT_POINTY','base',VarArrayRef(PointY),VarArrayRef(PointY_));
  MatLabOLEWin.PutFullMatrix( 'OUT_STARTTIME','base',VarArrayRef(StartTime),VarArrayRef(StartTime_));

  MatLabOLEWin.PutCharArray( 'OUT_FILE','base','');


  DeltX := VarArrayCreate([0,ncurve-1], varDouble);  DeltX_ := VarArrayCreate([0,ncurve-1], varDouble);
  PointY := VarArrayCreate([0,ncurve-1], varDouble); PointY_ := VarArrayCreate([0,ncurve-1], varDouble);
  NameY := VarArrayCreate([0,ncurve-1], varVariant); NameX := VarArrayCreate([0,ncurve-1], varVariant);
  StartTime := VarArrayCreate([0,ncurve-1], varDouble); StartTime_ := VarArrayCreate([0,ncurve-1], varDouble);


  MatLab_AllText:=MLines.Text;
  MLines.free;

  MatLab_FirstPart:=copy(MatLab_AllText,1,pos('%SECOND PART',MATLAB_ALLTEXT));
  MatLab_SecondPart:=MatLab_AllText;
  Delete(Matlab_SecondPart,1,pos('%SECOND PART',MATLAB_ALLTEXT)-1);

//исполнение первой части M-файла - определение числа выходных точек,каналов, шага дискретизации, времени начала сигнала

  MatLabOLEWin.Execute(Matlab_FirstPart);

//получение описани€ массивов результата
  MReal  := VarArrayCreate([0,0], varDouble); MImage := VarArrayCreate([0,0], varDouble);
  MatLabOLEWin.GetFullMatrix('OUT_NPOINT','base',VarArrayRef(MReal),VarArrayRef(MImage));
  OutNPoint := mreal[0];
  MatLabOLEWin.GetFullMatrix('OUT_NCHAN','base',VarArrayRef(MReal),VarArrayRef(MImage));
  OutNchan := mreal[0];
  DeltX := VarArrayCreate([0,OutNChan-1], varDouble);DeltX_ := VarArrayCreate([0,OutNChan], varDouble);
  MatLabOLEWin.GetFullMatrix('OUT_DELTX','base',VarArrayRef(DeltX),VarArrayRef(DeltX_));
  PointY := VarArrayCreate([0,OutNChan-1], varDouble);PointY_ := VarArrayCreate([0,OutNChan-1], varDouble);
  MatLabOLEWin.GetFullMatrix('OUT_POINTY','base',VarArrayRef(PointY),VarArrayRef(PointY_));
  StartTime := VarArrayCreate([0,OutNChan-1], varDouble);  StartTime_ := VarArrayCreate([0,OutNChan-1], varDouble);
  MatLabOLEWin.GetFullMatrix('OUT_STARTTIME','base',VarArrayRef(StartTime),VarArrayRef(StartTime_));

  //получение описание результатат

  NameY := VarArrayCreate([0,OutNChan-1], varVariant);
  for cCurve:=1 to OutNChan do
   MatLabOLEWin.PutCharArray('OUT_NAMEY_'+inttostr(cCurve),'base','y'+Inttostr(CCurve));

  NameX := VarArrayCreate([0,OutNChan-1], varVariant);
  MatLabOLEWin.PutCharArray('OUT_NAMEX'+inttostr(cCurve),'base','x');

  MatLabOLEWin.Execute('OUT_Y=ones('+inttostr(OUTNPOINT)+','+Inttostr(OutnChan)+')');;

//исполнение второй части M-файла - определение выходного массива и наименований по каналам
  MatLabOLEWin.Execute(Matlab_SecondPart);

  inY := VarArrayCreate([0,outNPoint-1, 0,outNChan-1], varDouble);
  OutY := VarArrayCreate([0,outNPoint-1, 0, outNChan-1], varDouble);

  MatLabOLEWin.GetFullMatrix( 'OUT_Y','base',VarArrayRef(InY),VarArrayRef(outY));
  for cCurve:=1 to OutNChan do
   nameY[CCurve-1]:=MatLabOLEWin.GetCharArray('OUT_NAMEY_'+inttostr(CCurve),'base');

  nameX[0]:=MatLabOLEWin.GetCharArray('OUT_NAMEX','base');

  MReal  := VarArrayCreate([0,0], varDouble); MImage := VarArrayCreate([0,0], varDouble);
  MatLabOLEWin.GetFullMatrix('OUT_PLOT','base',VarArrayRef(MReal),VarArrayRef(MImage));
  OutPLOT := mreal[0];

  OUT_FILE:=MatLabOLEWin.GetCharArray('OUT_FILE','base');
  outFilename:=Out_File;
  if Out_File<>'' then
   begin
     ShellExecute(Application.Handle, nil, pchar(OUTFILEName), nil, nil, SW_SHOW);
   end;
//ѕолучение выходного массива matLab

  for CCurve := 1 to OutNChan do
  begin
    Gauge2.Progress := CCurve; Gauge2.Update;
    ProcessingRec.PointStart := 0;
    ProcessingRec.PointEnd := PointY[CCurve-1]-1;//OutNPoint - 1;
    Gauge1.MinValue := 0; Gauge1.MaxValue := GetProcessPoint;
    Gauge1.Progress := 0; Gauge1.Update;
    ProcessingRec.FiledatDest := ProcessingRec.StoragePath + 'rez_' + GetGuidstr + '.Dat';
    FileDest := TFileStream.Create(ProcessingRec.FiledatDest, fmcreate);
    ProcessingRec.Seek_Start := 0;
    ProcessingRec.TekColor:=Colors[(cCurve mod 16) +1];
    for i := ProcessingRec.PointStart to ProcessingRec.PointEnd do
      begin
              rez:=0;
              try
               Rez:=InY[i-ProcessingRec.PointStart, cCurve-1 ];
               except
              end;
              if i = ProcessingRec.PointStart then
                begin
                  ProcessingRec.MinY := Rez; ProcessingRec.MaxY := Rez;
                end else
                 begin
                  if ProcessingRec.MaxY < Rez then ProcessingRec.MaxY := Rez;
                  if ProcessingRec.MinY > Rez then ProcessingRec.MinY := Rez;
                 end;
              FileDest.Write(Rez, SizeOf(Rez));
              if ((i - ProcessingRec.PointStart) mod 1000 = 0) then
                begin
                  Gauge1.Progress := i - ProcessingRec.PointStart;
                  Gauge1.Update; Application.ProcessMessages;
                  if not bMessage then break;
                end;
       end; {i}
    ProcessingRec.DateTimeStart := StartTime[CCurve-1];
    ProcessingRec.PointAll := OutNPoint;
    ProcessingRec.PointStart := 0; ProcessingRec.PointEnd := ProcessingRec.PointAll - 1;
    ProcessingRec.A0 := 0; ProcessingRec.A1 := 1; ProcessingRec.A2 := 0; ProcessingRec.A3 := 0;
    ProcessingRec.RezType := cRealLong;

    ProcessingRec.NameX:=NameX[0];
    ProcessingRec.NameY:=NameY[cCurve-1];

    FileProcRec.Write(ProcessingRec, SizeOf(TSourceRec));
    inc(ReturnRec.NSignal);
    FileDest.Destroy;
  end; {cCurve}

  FileProcRec.Destroy;


  if bMessage then
  begin
    assignFile(RetFile, ReturnFileName);
    Rewrite(RetFile); write(RetFile, ReturnRec);
    CloseFile(retFile);
    PostMessage(App_Source_Handle, wm_EndProcessing_Gl_2004, Source_Handle, 0);
  end;

 IF OUTPLOT=0 then close;
 Gauge2.Progress := 0; Gauge2.Update;
 Gauge1.Progress := 0; Gauge1.Update;

end;


procedure TMainWin.matlabfuncAfterPost(DataSet: TDataSet);
begin
  Matlabfunc.savetofile('matlabfunc.xml',dfXML);
end;

procedure TMainWin.DataSource2DataChange(Sender: TObject; Field: TField);
begin
 try
  if fileexists(extractfilepath(application.exename)+'matlab\'+ matlabfunc.FieldByName('m_filename').asstring) then
   mfile.lines.loadfromfile(extractfilepath(application.exename)+'matlab\'+ matlabfunc.FieldByName('m_filename').asstring)
   else mfile.lines.clear;
 except
 end;
 if not Processnew. active then Processnew.open;
 if Processnew.state <> dsEdit then Processnew.Edit;
 ProcessnewHeadWin.Value := matlabfunc.FieldByName('funcname').asstring ;
 ProcessnewPageName.Value := matlabfunc.FieldByName('funcname').asstring ;
 Processnew.post;
 meEnableEdit.checked:=false;
 mfile.ReadOnly:=not meEnableEdit.checked;
 if mfile.readonly then mfile.color:=clsilver

end;

procedure TMainWin.miSaveMFileClick(Sender: TObject);
begin
 if trim(mfile.Lines.text)<>'' then
   mfile.lines.savetofile(extractfilepath(application.exename)+'matlab\'+matlabfunc.FieldByName('m_filename').asstring)
end;

procedure TMainWin.meEnableEditClick(Sender: TObject);
begin
 mfile.ReadOnly:=not meEnableEdit.checked;
 if mfile.readonly then mfile.color:=clsilver
  else mfile.color:=clwhite;
end;

end.
