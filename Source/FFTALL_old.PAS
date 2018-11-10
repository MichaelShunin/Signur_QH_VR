unit FFTALL_old;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, DB, DBTables, Spin, Buttons,
  Mask,
  tvc_u, Gauges,mdrv,FileBuff, Dbf;
const
 FFTPointArray: array[0..9] of longint =
    (8192,4096,2048,1024,512,256,128,64,32,16);
type
  TfftDialog = class(TForm)
    DataSource1: TDataSource;
    Gauge1: TGauge;
    ButtonOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    PartAll: TDBRadioGroup;
    SelectedSignal: TRadioGroup;
    SrednOrMap: TRadioGroup;
    VidFunc: TRadioGroup;
    PointFFT: TComboBox;
    Smesh: TComboBox;
    WinFunc: TComboBox;
    NSpectr: TEdit;
    StepFreq: TEdit;
    OneOrMany: TRadioGroup;
    Panel1: TPanel;
    Label12: TLabel;
    AoEdit: TEdit;
    Table1: TDbf;
    Table1SELECTSIGN: TFloatField;
    Table1PARTALL: TBooleanField;
    Table1BSHOWRESUL: TBooleanField;
    Table1SHOWWIN: TFloatField;
    Table1HEADWIN: TStringField;
    Table1PAGENAME: TStringField;
    Table1SIGNUMSRCA: TFloatField;
    Table1SIGNUMSRCB: TFloatField;
    Table1FILENAMEDE: TStringField;
    Table1RESULTTIP: TFloatField;
    GroupBox1: TGroupBox;
    ShowWin: TDBRadioGroup;
    PageName: TDBEdit;
    Label9: TLabel;
    HeadWin: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
{    File_Copy: TFileCopy;}
    procedure ShowWinChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure SpectrProcessing;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure PartAllClick(Sender: TObject);
    procedure OneOrManyClick(Sender: TObject);
    procedure PointFFTChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VidFuncExit(Sender: TObject);
    procedure SrednOrMapClick(Sender: TObject);
    procedure Table1_SelectsignalChange(Sender: TField);
    procedure SelectedSignalClick(Sender: TObject);
    procedure AoEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure VidFuncClick(Sender: TObject);
    procedure NSpectrChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ProcessingRec:TSourceRec;
    ReturnRec:TReturnRec;
    RetFile:file of TReturnRec;
    SpectrPar:TSpectrPar;
    bMessage:boolean;
{    iMageID:TDateTime;}
    FFTPoint:longint;
    NSpectrov:longint;
    Source_Handle:hWnd;
    App_Source_Handle:THandle;
    Copy_SourceFile,Copy_TargetFile:shortstring;

   procedure wmSetPartAll( var Message:TMessage ); message wm_SetPartall;
   procedure wmStartProcessing( var Message:TMessage ); message wm_StartProcessing;
  end;

var
  fftDialog: TfftDialog;

implementation

uses Config;
{uses Image;}
{$R *.DFM}

procedure TfftDialog.ShowWinChange(Sender: TObject);
begin
 case ShowWin.ItemIndex of
  0: begin
        Label9.Visible:=True;
        HeadWin.Visible:=True;
//        Label6.Visible:=True;
        PageName.Visible:=True;
       end;
  1: begin
        Label9.Visible:=False;
        HeadWin.Visible:=False;
//        Label6.Visible:=True;
        PageName.Visible:=True;
       end;
    end; {case}
end;

procedure TfftDialog.FormCreate(Sender: TObject);
var
    FF:File of TSpectrPar;
    FF1:file of TSourceRec;
    deltx:real;
    bsameDeltx:boolean;
    cCurve:integer;
begin
//  Get_Lang_Par({Lang_2_Ini,}self,'FFT_Proc');
  table1.Open;
  Copy_SourceFile:=SourceFileName;
  Copy_TargetFile:=appconfig.TempDir+'coFFT_' + GetGuidStr +'.cfg';
  CopyFile(pchar(Copy_sourceFile),pchar(Copy_TargetFile),false);

  assignFile(FF1,Copy_TargetFile);
   try
     Reset(FF1);Read(FF1,ProcessingRec);CloseFile(FF1);
    except
       on EInOutError do
       begin
         MessageDlg(SourceFileName+' I/O error.', mtError, [mbOk], 0);
         exit;
       end;
   end;
{  ImageId:=ProcessingRec.IMageId;}


  Source_Handle:=ProcessingRec.Source_Handle;
  App_Source_Handle:=ProcessingRec.App_Handle;

   SpectrPar.VidFunc:=2;SpectrPar.PointFFT:=1024;
   SpectrPar.WindowFunc:=0;SpectrPar.OneOrMany:=0;
   SpectrPar.Smesh:=512;SpectrPar.SrednOrMap:=0;
   SpectrPar.SelectedSignal:=0;
   SpectrPar.Ao:=0.000001;
   assignFile(FF,SpectrParFileName);
   try
     Reset(FF);Read(FF,SpectrPar);CloseFile(FF);
    except
       on EInOutError do
         MessageDlg(SpectrParFile +' I/O error.', mtError, [mbOk], 0);
      end;


  Smesh.Text:=IntToStr(SpectrPar.Smesh);
  OneOrMany.ItemIndex:=SpectrPar.OneOrMany;
  AoEdit.Text:=FloattoStrF(SpectrPar.ao,fffixed,9,7);
  SrednOrMap.ItemIndex:=SpectrPar.SrednOrMap;
  VidFunc.ItemIndex:=SpectrPar.VidFunc;
  WinFunc.ItemIndex:=SpectrPar.WindowFunc;
  PointFFT.ItemIndex:=SpectrPar.PointFFT;
  SelectedSignal.ItemIndex:=SpectrPar.SelectedSignal;
//  Caption:=Caption+' для '+ProcessingRec.Source_Caption+ ' / '+ProcessingRec.TekPageName;
  PartAll.Enabled:=ProcessingRec.Auto <> 1;
  ShowWin.Enabled:=ProcessingRec.Auto <> 1;
  SelectedSignal.Enabled:=ProcessingRec.Auto <> 1;
  HeadWin.Enabled:=ProcessingRec.Auto <> 1;
  PageName.Enabled:=ProcessingRec.Auto <> 1;
//  Label11.Visible:=ProcessingRec.Auto <> 1;
  Label9.Visible:=ProcessingRec.Auto <> 1;
  OneOrManyClick(nil);
  SrednOrMapClick(nil);
  VidFuncExit(nil);
  PointFFTChange(nil);
  VidFuncClick(nil);
 ShowwinChange(nil);
 bsamedeltX:=true;
 assignFile(FF1,Copy_TargetFile);Reset(FF1);
 deltx:=ProcessingRec.deltx;
 for CCurve:=1 to ProcessingRec.NAllCurveInPage do
  begin
     Read(FF1,Processingrec);
     bsamedeltx:=bsamedeltx and (deltx=ProcessingRec.deltx);
     deltx:=processingrec.deltx;
  end;
  if not bsameDeltX then
   begin
    selectedsignal.itemindex:=0;
    selectedsignal.enabled:=false;
    Reset(FF1);
    for CCurve:=1 to ProcessingRec.NAllCurveInPage do
    begin
      Read(FF1,Processingrec);
      if processingrec.kindcurve=0 then break;
    end;
   end;
  CloseFile(FF1);

//  Save_Lang_Par(Lang_2_Ini,self,'FFT_Proc');

end;

 Procedure TfftDialog.SpectrProcessing;
 var
     Prom_Seek,PointStart,I,j:longint;FF1:File Of TSourceRec;
     cCurve:word;
//     Rez:single;
//     Rez1:real;
     FileProcRec,FileDest:TFilestream;
     FileSource:TBufferedFile;
//     Status:integer;
     BufRez: pDataReal;
     ProcOldRec:TSourceRec;
 begin
 IF (MaxAvail < 5*(FFTPoint+Zapas)*SizeOf(Single) ) then
  begin
   MessageDlg(' не достаточно памяти для расчета спектра ',
      mtError, [mbOk], 0);
   exit;
  end;
 GetMem(BufRez,((FFTPoint div 2)+Zapas) *SizeOf(Single) );
 bMessage:=true;
 ReturnRec.NSignal:=0;
 assignFile(FF1,Copy_TargetFile);Reset(FF1);
 for CCurve:=1 to ProcessingRec.NAllCurveInPage do
  begin
     for i:=0 to (FFTPoint div 2) -1  do BufRez^[i]:=0;
     Read(FF1,Processingrec);
     case SelectedSignal.ItemIndex of
      0: if  (ProcessingRec.KindCurve<>0 ) then Continue;
      1: if  (ProcessingRec.KindCurve>1 ) then Continue;
     end;
     ProcOldRec:=ProcessingRec;
     if ReturnRec.NSignal=0 then
      begin
       FileProcRec:=TFileStream.Create(ProcessingRec.FName, fmCreate);
//       FileProcRec.Rewrite
      end;
     if SelectedSignal.ItemIndex>0 then inc(ReturnRec.NSignal);

     FileSource:=TBufferedFile.Create(ProcessingRec.FiledatSource,4096);
     FileSource.Reset;

     if ReturnRec.PartAll then
         begin
          ProcessingRec.PointStart:=0;
          ProcessingRec.PointEnd:=Processingrec.PointAll-1;
         end;
     PointStart:=ProcessingRec.PointStart;
     if SpectrPar.OneOrMany = 0 then NSpectrov:=1;
     Gauge1.MinValue:=0;Gauge1.MaxValue:=NSpectrov;
     Gauge1.Progress:=Gauge1.MinValue; Gauge1.Update;

     for j:=0  to NSpectrov-1 do
     begin
        Gauge1.Progress:=j; Gauge1.Update;
        if not bMessage then break;
        ProcessingRec.DateTimeStart:=ProcOldRec.DateTimeStart+
                 ProcOldRec.DeltX*PointStart/(24*3600);
        ProcessingRec.PointAll:=FFTPoint div 2;
        ProcessingRec.PointStart:=0;ProcessingRec.PointEnd:=ProcessingRec.PointAll-1;
        ProcessingRec.A0:=0;ProcessingRec.A1:=1;ProcessingRec.A2:=0;ProcessingRec.A3:=0;
        ProcessingRec.Seek_Start:=ProcOldRec.Seek_Start;
        ProcessingRec.RezType:=cRealLong;
        ProcessingRec.DeltX:=1/ProcOldRec.DeltX/FFTPoint;
        ProcessingRec.NameX:='f,Гц';
        ProcessingRec.RazmX:='Hz';
        ProcessingRec.RazmY:= ' ';
        case SpectrPar.VidFunc of
         0:ProcessingRec.NameY:=ProcessingRec.NameY+' '+'Re';
         1:ProcessingRec.NameY:=ProcessingRec.NameY+' '+'Im';
         2:ProcessingRec.NameY:=ProcessingRec.NameY+' '+'Am';
         3:ProcessingRec.NameY:=ProcessingRec.NameY+' '+'Ф';
         4:ProcessingRec.NameY:=ProcessingRec.NameY+' '+'Lg(A)';
         5:ProcessingRec.NameY:=ProcessingRec.NameY+' '+'20Lg(A)';
         6:begin
            ProcessingRec.NameY:=ProcessingRec.NameY+' '+'Kxx';
            ProcessingRec.DeltX:=ProcOldRec.DeltX;
            ProcessingRec.NameX:=ProcOldRec.NameX;
            ProcessingRec.RazmX:=ProcOldRec.RazmX;
           end;
         7:begin
            ProcessingRec.NameY:=ProcessingRec.NameY+' '+'Rxx';
            ProcessingRec.DeltX:=ProcOldRec.DeltX;
            ProcessingRec.NameX:=ProcOldRec.NameX;
            ProcessingRec.RazmX:=ProcOldRec.RazmX;
           end;
        end;
        Application.ProcessMessages;
        GetSpectr(FileSource,SpectrPar.VidFunc, SpectrPar.WindowFunc,SpectrPar.Ao,
                  PointStart,FFTPoint,
                  ProcOldRec.A0,ProcOldRec.A1,
                  ProcOldRec.A2,ProcOldRec.A3,
                  ProcOldRec.RezType,BufRez,ProcOldRec.Seek_Start);
        if ((SpectrPar.OneOrMany = 1) and (SpectrPar.SrednOrMap<>1)) then
         begin
          ProcessingRec.NameY:=IntToStr(j)+' '+ProcessingRec.NameY;
//          sleep(100);
//          DecodeTime(Time,H,M,S,DS);
//          Str(M:1,MS);   if m<10 then MS:='0'+Ms;
//          Str(S:1,SS);   if s<10 then sS:='0'+ss;
//          Str(DS:1,DSS); if ds<10 then dss:='0'+dss;
          ProcessingRec.FiledatDest:=ProcessingRec.StoragePath + 'sf_' + GetGuidStr +'.Dat';
          inc(ReturnRec.NSignal);
          FileDest:=TFileStream.Create(ProcessingRec.FiledatDest,fmCreate);
//          FileDest.Rewrite;
          processingRec.MinY:=BufRez^[0];processingRec.MaxY:=BufRez^[0];
          for i:=1 to (FFTPoint div 2) -1  do
           begin
            if processingRec.MinY > BufRez^[i] then processingRec.MinY := BufRez^[i];
            if processingRec.MaxY < BufRez^[i] then processingRec.MaxY := BufRez^[i];
           end;
          FileDest.Write(BufRez^[0],(FFTPoint div 2)*SizeOf(Single){,BytesWrote});
          FileDest.destroy;//Close;
          Prom_Seek:=ProcessingRec.Seek_Start;
{##?}          ProcessingRec.Seek_Start:=0;
          FileProcRec.Write(ProcessingRec,SizeOf(TSourceRec));
          ProcessingRec.Seek_Start:=Prom_Seek;
          for i:=0 to (FFTPoint div 2) -1  do BufRez^[i]:=0;
         end;
       PointStart:=PointStart+SpectrPar.Smesh;
      end;
        if ((SpectrPar.OneOrMany = 0) or
            ((SpectrPar.OneOrMany = 1) and (SpectrPar.Srednormap = 1)) ) then
         begin
          if ((SpectrPar.OneOrMany = 1) and (SpectrPar.Srednormap = 1))  then
           for i:=0 to (FFTPoint div 2) -1  do BufRez^[i]:=BufRez^[i]/NSpectrov;
          if SelectedSignal.ITemIndex=0 then ReturnRec.NSignal:=1;
//          sleepdelay(100);
//          DecodeTime(Time,H,M,S,DS);
//          Str(M:1,MS);   if m<10 then MS:='0'+Ms;
//          Str(S:1,SS);   if s<10 then sS:='0'+ss;
//          Str(DS:1,DSS); if ds<10 then dss:='0'+dss;
          ProcessingRec.FiledatDest:=ProcessingRec.storagepath + 'sf_' + GetGuidStr +'.Dat';
          FileDest:=TFileStream.Create(ProcessingRec.FiledatDest, fmCreate);
//          FileDest.Rewrite;
          processingRec.MinY:=BufRez^[0];processingRec.MaxY:=BufRez^[0];
          for i:=1 to (FFTPoint div 2) -1  do
           begin
            if processingRec.MinY > BufRez^[i] then processingRec.MinY := BufRez^[i];
            if processingRec.MaxY < BufRez^[i] then processingRec.MaxY := BufRez^[i];
           end;
          FileDest.Write(BufRez^[0],(FFTPoint div 2)*SizeOf(Single));
          FileDest.Destroy;
          Prom_Seek:=ProcessingRec.Seek_Start;
{##?}          ProcessingRec.Seek_Start:=0;
          FileProcRec.Write(ProcessingRec,SizeOf(TSourceRec));
          ProcessingRec.Seek_Start:=Prom_Seek;
         end;
end;
//FileProcRec.Close;
FileProcRec.Destroy;
closeFile(FF1);
FreeMem(BufRez,((FFTPoint div 2)+Zapas) *SizeOf(Single) );
if bMessage then
 begin
  assignFile(RetFile,ReturnFileName);
  Rewrite(RetFile);write(RetFile,ReturnRec);
  CloseFile(retFile);
  PostMessage(App_Source_Handle, wm_EndProcessing_Gl_2004,Source_Handle,0);
end;
end;

procedure TfftDialog.ButtonCancelClick(Sender: TObject);
begin
if bMessage then bMessage:=False else close;
end;

procedure TfftDialog.ButtonOKClick(Sender: TObject);
var FF:file of tSpectrPar;
begin
  if NSpectrov<=0 then
   begin
    ShowMessage('Количество рассчитываемых спектров должно быть больше нуля.'+
    ' Для исправления измените число отсчетов в выборке или смещение между ними.');
    exit;
  end;
  if Table1.state = dsEdit then Table1.Post;
  SpectrPar.VidFunc:=VidFunc.ItemIndex;
  SpectrPar.WindowFunc:=WinFunc.ItemIndex;
  SpectrPar.PointFFT:=PointFFT.ItemIndex;
  SpectrPar.OneOrMany:=OneOrMany.ItemIndex;
  SpectrPar.Smesh:=StrToInt(Smesh.Text);
  SpectrPar.SrednOrMap:=SrednOrMap.ItemIndex;
  SpectrPar.SelectedSignal:=SelectedSignal.ItemIndex;
  Spectrpar.Ao:=StrToFloat(AoEdit.Text);
  assignFile(FF,SpectrParFile);
  try
    Rewrite(FF);write(FF,SpectrPar);CloseFile(FF);
   except
      on EInOutError do
        begin
        MessageDlg(SpectrParFile +' I/O error.', mtError, [mbOk], 0);
        exit;
        end;
     end;
   ReturnRec.PartAll:=Table1PartAll.Value;
   ReturnRec.SelectSignal:=0;
   ReturnRec.Showresult:=Table1bShowresul.Value;
   ReturnRec.ShowWin:=Table1ShowWin.asinteger;
   ReturnRec.PageName:=Table1pageName.Value;
   ReturnRec.HeadWin:=Table1HeadWin.Value;
   if ((SpectrPar.OneOrMany=1) and (ReturnRec.ShowWin=0)) then
    case SpectrPar.SrednOrMap of
     1: ReturnRec.ProcRez_Type:=cProcrez_is_Signal;
     0,2:   case SpectrPar.VidFunc of
             0,1,2,3,4,5:ReturnRec.ProcRez_Type:=cProcrez_is_FreqMap ;
             6,7:ReturnRec.ProcRez_Type:=cProcrez_is_KxxMap ;
            end;
    end
      else ReturnRec.ProcRez_Type:=cProcrez_is_Signal ;
   ReturnRec.FName:=ProcessingRec.FName;
   ReturnRec.Parent_Handle:=Source_Handle;
   ButtonOk.Enabled:=False;
   SpectrProcessing;
   close;
end;


procedure TfftDialog.PartAllClick(Sender: TObject);
begin
  PointfftChange(sender);
end;

procedure TfftDialog.wmSetPartAll( var Message:TMessage );
begin
   PartAll.ItemIndex:=0;
   PartAll.Update;
end;

procedure TfftDialog.OneOrManyClick(Sender: TObject);
begin
  SrednOrMap.Visible:=OneOrMany.ItemIndex>0;
  case OneOrMany.ItemIndex of
  0: begin
        Label7.Visible:=false;
        Smesh.Visible:=false;
{        Label10.Visible:=false;
        Nspectr.Visible:=false;}
       end;
  1: begin
        Label7.Visible:=true;
        Smesh.Visible:=true;
        Label10.Visible:=true;
        NSpectr.Visible:=True;
       end;
    end; {case}


end;

procedure TfftDialog.PointFFTChange(Sender: TObject);
begin
 FFTPoint:=FFTPointArray[PointFFT.ItemIndex];
 if ProcessingRec.DeltX*FFTPoint =0 then exit;
 StepFreq.Text:=FloatToStrF(1/ProcessingRec.DeltX/FFTPoint,ffFixed,5,4);
 case VidFunc.ItemIndex of
  6,7:StepFreq.Text:=FloatToStrF(ProcessingRec.DeltX,ffFixed,5,4);
 end;
 if Smesh.text='' then exit;
 SpectrPar.Smesh:=StrToInt(Smesh.Text);
 IF SpectrPar.Smesh =0 THEN sPECTRpAR.sMESH:=1;
 case PartAll.ItemIndex of
  0:  case OneOrMany.ItemIndex of
       0: if (ProcessingRec.PointAll>=FFTPoint)  then NSpectrov:=1 else NSpectrov:=0;
//       1:NSpectrov:=(ProcessingRec.PointAll-FFTPoint) div SpectrPar.Smesh;
       1:NSpectrov:=(ProcessingRec.PointAll{-FFTPoint}) div SpectrPar.Smesh;
      end;
  1:  case OneOrMany.ItemIndex of
       0:if ((ProcessingRec.PointEnd-ProcessingRec.PointStart)>=FFTPoint) then NSpectrov:=1 else NSpectrov:=0;
       1:NSpectrov:=((ProcessingRec.PointEnd-ProcessingRec.PointStart){-FFTPoint})
                    div SpectrPar.Smesh;
       end;
 end;
 NSpectr.Text:=IntToStr(NSpectrov);
 NSpectr.Update;
{ if NSpectrov<1 then
   ShowMessage('Задайте значение смещения или числа точек так, чтобы число спектров было больше нуля');}
end;

procedure TfftDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
 DeleteFile(pchar(Copy_TargetFile));
end;

procedure TfftDialog.VidFuncExit(Sender: TObject);
begin
 if Table1.state<>dsEdit then Table1.Edit;
 Table1PageName.Value:=VidFunc.Items[VidFunc.ItemIndex]+'('+IntTostr(FFTPointArray[PointFFT.ItemIndex])+')';
 Table1.Post;
 SrednOrMapClick(nil);
end;

procedure TfftDialog.SrednOrMapClick(Sender: TObject);
begin
 if selectedSignal.ItemIndex<>0 then
  SrednOrMap.ItemIndex:=1;
 if Table1.state<>dsEdit then Table1.Edit;
 case OneOrMany.ItemIndex of
  0:Table1HeadWin.Value:=VidFunc.Items[VidFunc.ItemIndex]+' '+'('+IntTostr(FFTPointArray[PointFFT.ItemIndex])+')';
  1:Table1HeadWin.Value:=VidFunc.Items[VidFunc.ItemIndex]+' '+SrednOrMap.Items[SrednOrMap.ItemIndex]+
       '('+IntTostr(FFTPointArray[PointFFT.ItemIndex])+')';
 end;
 Table1.Post;
end;

procedure TfftDialog.Table1_SelectsignalChange(Sender: TField);
begin
 if  Table1Selectsign.Value>0 then
  begin
   SrednOrMap.ItemIndex:=1;
   SrednOrMapClick(nil);
  end;
end;

procedure TfftDialog.SelectedSignalClick(Sender: TObject);
begin
 if SelectedSignal.ItemIndex>0 then
  begin
   SrednOrMap.ItemIndex:=1;
   SrednOrMapClick(nil);
  end;
end;

procedure TfftDialog.AoEditExit(Sender: TObject);
var Ao:double;
begin
 try
  Ao:=StrToFloat(AoEdit.Text);
 except
   on EConvertError do Ao:= Spectrpar.Ao;
 end;
 if Ao<=0 then
  begin
   MessageDlg('Ao должно быть более 0 !',mtError, [mbOk], 0);
   Ao:=SpectrPar.Ao;
  end;
 Aoedit.Text:=FloatToStrF(Ao,ffFixed,9,7);
 SpectrPar.Ao:=Ao;
 AoEdit.Update;
end;

procedure TFFTDialog.wmStartProcessing( var Message:TMessage );
begin
 ButtonOkClick(nil);
 inherited;
end;

procedure TfftDialog.FormActivate(Sender: TObject);
begin
 if ProcessingRec.Param = 1  then
   PostMessage(Handle,wm_StartProcessing,0,0);
end;

procedure TfftDialog.VidFuncClick(Sender: TObject);
begin
 case VidFunc.ItemIndex of
  0,1,2,3,4,5:
   begin
        Label8.Caption:='f=';
        Label3.Caption:='Hz';
   end;
  6,7: begin
        Label8.Caption:='x=';
        Label3.Caption:=ProcessingRec.RazmX;
       end;
  end;
  PointFFTChange(nil);
  VidFuncExit(nil);
end;

procedure TfftDialog.NSpectrChange(Sender: TObject);
begin
 if strToFloat(NSpectr.text)<1 then
  begin
  end;
end;

end.

