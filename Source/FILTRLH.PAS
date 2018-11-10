unit Filtrlh;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, DB, DBTables, Spin, Buttons,
  Mask,
  tvc_U, Gauges,mdrv,FileBuff, Dbf;

const
 NrezArray = 4095;
type
  TBattervort = class(TForm)
    DataSource1: TDataSource;
    ShowWin: TDBRadioGroup;
    Label6: TLabel;
    PageName: TDBEdit;
    Label5: TLabel;                      
    HeadWin: TDBEdit;
    Gauge2: TGauge;
    Gauge1: TGauge;
    ButtonOK: TBitBtn;
    ButtonCancel: TBitBtn;
    SelectedSignal: TDBRadioGroup;
    PartAll: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    PorHF: TSpinEdit;
    FHF: TEdit;
    NachUch: TSpinEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    PorLF: TSpinEdit;
    FLF: TEdit;
    Image1: TImage;
    Label8: TLabel;
    Image2: TImage;
    Label9: TLabel;
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
    procedure ShowWinChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure Filtration;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure PartAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PorHFExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ProcessingRec:TSourceRec;
    ReturnRec:TReturnRec;
    RetFile:file of TReturnRec;
    FiltrPar:TFiltrPar;
    bMessage:boolean;
    Source_Handle:hWnd;
    App_Source_Handle:THandle;
    Copy_SourceFile:shortstring;
    Copy_TargetFile:shortstring;
   procedure wmSetPartAll( var Message:TMessage ); message wm_SetPartall;
   procedure wmStartProcessing( var Message:TMessage ); message wm_StartProcessing;
  end;

var
  Battervort: TBattervort;
  RezArray:array[0..NRezArray] of single;
  cRezArray:integer;
  Divider:longint;
  bMyReal:boolean;
implementation

uses Config;
{uses Image;}
{$R *.DFM}

procedure TBattervort.ShowWinChange(Sender: TObject);
begin
 case ShowWin.ItemIndex of
  0: begin
        Label5.Visible:=True;
        HeadWin.Visible:=True;
        Label6.Visible:=True;
        PageName.Visible:=True;{
        ShowMessage('ѕока не реализовано');
        ShowWin.ItemIndex:=1;
        Label5.Visible:=False;
        HeadWin.Visible:=False;
        Label6.Visible:=True;
        PageName.Visible:=True; }
       end;
  1: begin
        Label5.Visible:=False;
        HeadWin.Visible:=False;
        Label6.Visible:=True;
        PageName.Visible:=True;
       end;
  2: begin
        Label5.Visible:=False;
        HeadWin.Visible:=False;
        Label6.Visible:=false;
        PageName.Visible:=False;
        if (partAll.ItemIndex = 1)
         then
          begin
           MessageDlg(
           'ќбработка части сигнала возможна при отображении результата на новой странице ', mtError, [mbOk], 0);
           PartAll.ItemIndex:=0;Partall.Update;
          end;
     end; {2}
    end; {case}
end;

procedure TBattervort.FormCreate(Sender: TObject);
var
    FF:File of TFiltrPar;
    FF1:file of TSourceRec;
begin
//   Get_Lang_Par(self,'Filtr');
   Table1.open;
   FiltrPar.PorLF:=2;FiltrPar.FLF:=100;
   FiltrPar.PorHF:=2;FiltrPar.FHF:=10; FiltrPar.NachUchast:=0;
   assignFile(FF,FiltrParFile);
   try
     Reset(FF);Read(FF,FiltrPar);CloseFile(FF);
    except
       on EInOutError do
         MessageDlg(FiltrParFile +' I/O error.', mtError, [mbOk], 0);
      end;
  PorLF.Value:=FiltrPar.PorLF;
  PorHF.Value:=FiltrPar.PorHF;
  NachUch.Value:=FiltrPar.NachUchast;
  FHF.Text:=FloatToStrF(FiltrPar.FHF,ffFixed,5,2);
  FLF.Text:=FloatToStrF(FiltrPar.FLF,ffFixed,5,2);
{  Headwin.Text:='фильтр';
  PageName.Text:='фильтр';    }
  Copy_SourceFile:=SourceFileName;
  Copy_TargetFile:=appconfig.TempDir + 'flt_' + GetGuidStr + '.cfg';
{  File_Copy.Execute;}
  CopyFile(pchar(Copy_sourceFile),pchar(Copy_TargetFile), false);
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
  Source_Handle:=ProcessingRec.Source_Handle;
  App_Source_Handle:=ProcessingRec.App_Handle;
  NachUch.MaxValue:=ProcessingRec.PointAll div 3;
  Caption:=Caption+{Mes_Ini.ReadString('Filtr','s2',' дл€ ')+}' '+ProcessingRec.Source_Caption+ ' / '+
      ProcessingRec.TekPageName;
  PartAll.Enabled:=ProcessingRec.Auto <> 1;
  ShowWin.Enabled:=ProcessingRec.Auto <> 1;
  SelectedSignal.Enabled:=ProcessingRec.Auto <> 1;
  HeadWin.Enabled:=ProcessingRec.Auto <> 1;
  PageName.Enabled:=ProcessingRec.Auto <> 1;
  Label5.Visible:=ProcessingRec.Auto <> 1;
  Label6.Visible:=ProcessingRec.Auto <> 1;
  FHF.Hint:='„астота дискретизации исходного сигнала составл€ет '+Formatfloat('0.00,',1/ProcessingRec.deltx)+' √ц';
  FLF.Hint:='„астота дискретизации исходного сигнала составл€ет '+Formatfloat('0.00,',1/ProcessingRec.deltx)+' √ц';
  PorHFExit(nil);
{  Save_Lang_Par(Lang_2_Ini,self,'Filtr_Proc');}
end;

 Procedure TBattervort.Filtration;
 var I,j:longint;{IMG:TImageForm;}FF1:File Of TSourceRec;
     cCurve:word;
     Rez:single; Rez1:real; RezSinle:single;
     FileProcRec,FileDest:TFileStream;
     FileDest1:TFileStream;
     FileSource:TBufferedFile;
     MS,SS,DSS:string[2];
     H,M,S,DS:word;
     Status:integer;
  Wo,Betta,A12:double;
  A:array[1..5,2..10] of double;
  Ab:array[1..5,2..10] of double;
  B,Bs:array[0..2,1..5,2..10] of double;
  C,Cs:array[1..2,1..5,2..10] of double;
  N,K,Npor:word;
  Yn_2,Yn_1,Xn_2,Xn_1,Xn:Real;
  PointFiltr:longint;
  ProcOldRec:TSourceRec;
  Shag:integer;
  GetRezRec:TGetRezRec;
  s1:string;
  PointStartSource:integer;
 begin
  FileProcRec:=TFileStream.Create(ProcessingRec.FName,fmCreate);
//  FileProcRec.Rewrite;

 Gauge2.MinValue:=1;Gauge2.MaxValue:=ProcessingRec.NAllCurveInPage;
 bMessage:=true;
 assignFile(FF1,Copy_TargetFile);Reset(FF1);
 j:=0;
 ReturnRec.NSignal:=0;
 for CCurve:=1 to ProcessingRec.NAllCurveInPage do
  begin
   Gauge2.Progress:=CCurve;Gauge2.Update;
   Read(FF1,ProcessingRec);
   ProcOldRec:=ProcessingRec;
   if  ( (Returnrec.selectSignal = 2) or
        ((Returnrec.selectSignal = 1) and (ProcessingRec.KindCurve<=1)) or
        ((Returnrec.selectSignal = 0) and (ProcessingRec.KindCurve=0)) ) then
  begin
//    PointStartSource:=ProcessingRec.PointStart;
    if ReturnRec.PartAll then
     begin
      ProcessingRec.PointStart:=0;
      ProcessingRec.PointEnd:=Processingrec.PointAll-1;
     end;
     PointStartSource:=ProcessingRec.PointStart;
    if ((FiltrPar.FLF<>0) and (FiltrPar.FHF<>0 ))then
    PointFiltr:=(ProcessingRec.PointEnd-ProcessingRec.PointStart)*(FiltrPar.PorLf+FiltrPar.PorHF) div 2
     else
      begin
       if (FiltrPar.FLF<>0) then
        PointFiltr:=(ProcessingRec.PointEnd-ProcessingRec.PointStart)*(FiltrPar.PorHF) div 2
            else PointFiltr:=(ProcessingRec.PointEnd-ProcessingRec.PointStart)*(FiltrPar.PorLf) div 2
      end;
    Gauge1.MinValue:=0;Gauge1.MaxValue:=PointFiltr;
    Divider:=trunc(PointFiltr/15 +1);
    Gauge1.Progress:=Gauge1.MinValue; Gauge1.Update;
    PointFiltr:=0;
    ProcessingRec.FiledatDest:=ProcessingRec.StoragePath + 'f_' + GetGuidstr + '.Dat';

    {FLF}
       {расчет коэффициентов фильтра}
     if FiltrPar.FLF<>0 then { FlF }
      begin
      Wo:=1/ProcessingRec.DeltX / FiltrPar.FLF;
                                  {ПЃап§Ѓ™ д®Ђмва† ђЃ¶•в °лвм 2/4/6/8/10}
      for i:=1 to 5 do        {Р†бз•в ™Ѓндд®ж®•≠вЃҐ A[i,N]}
       for N:=2 to 10 do
        case N of
         2,4,6,8,10: A[i,N]:=2*cos(Pi*(2*i-1)/2/N);
        end;
      for k:=1 to 5 do       {Р†бз•в ™Ѓндд®ж®•≠вЃҐ B}
       for N:=2 to 10 do
        begin
         case N of
          2,4,6,8,10: B[0,k,N]:=1/(1+A[k,N]*Wo/PI+SQR(Wo/Pi));
          else B[0,k,N]:=0 ;
         end;
         B[1,k,N]:=2*B[0,k,N];
         B[2,k,N]:=B[0,K,N];
        end;
      for k:=1 to 5 do      {Р†бз•в ™Ѓндд®ж®•≠вЃҐ C}
       for N:=2 to 10 do
        begin
         case N of
          2,4,6,8,10:
           begin
            C[1,k,N]:=2*(1-SQR(Wo/Pi))*B[0,k,N];
            C[2,K,N]:=(1-A[k,N]*Wo/Pi+SQR(Wo/Pi))*B[0,k,N];
           end;
            else
             begin
              C[1,k,N]:=0; C[2,k,N]:=0;
             end;
         end;
        end;
    FileDest:=TFileStream.Create(ProcessingRec.FiledatDest,fmcreate);
//    FileDest.Rewrite;
    cRezArray:=0;
//    FileSource:=TBufferedFile.Create(ProcessingRec.FiledatSource,4096);
//    FileSource.Reset;
    bMyReal:=false;
    k:=1;N:=2;NPor:=FiltrPar.PorLF;
    Shag:=cSizeRez[ProcOldRec.RezType];
    GetRezRec.bSeek:=true;
    GetRezRec.Shag:=shag;

    GetRezRec.Point:=ProcessingRec.PointStart;
    GetRezRec.A0:=ProcOldRec.A0;
    GetRezRec.A1:=ProcOldRec.A1;
    GetRezRec.A2:=ProcOldRec.A2;
    GetRezRec.A3:=ProcOldRec.A3;
    GetRezRec.RezType:=ProcOldRec.RezType;
    GetRezRec.Seek_Start:=ProcOldRec.Seek_Start;
    repeat
     FileSource:=TBufferedFile.Create(ProcessingRec.FiledatSource,4096);
     FileSource.Reset;
      GetRezRec.FileDat:=FileSource;
     GetRezFromFile_New(GetRezRec{true,shag,FileSource,ProcessingRec.PointStart ,
                     ProcOldRec.A0,ProcOldRec.A1,ProcOldRec.A2,ProcOldRec.A3,
                     ProcOldRec.RezType,ProcessingRec.MaxY});
     ProcessingRec.MaxY:=GetRezRec.Rez;
     ProcessingRec.MinY:=ProcessingRec.MaxY;
     Rez:=ProcessingRec.MinY;
     Yn_2:=Rez;Xn_2:=Rez;
     {FileDest.Write(Rez,SizeOf(Rez),BytesWrote);}
     RezArray[cRezArray]:=Rez; inc(cRezArray);
     GetRezRec.bSeek:=false;
     GetRezRec.Point:=ProcessingRec.PointStart+1;
     GetRezFromFile_New(GetRezrec{false,shag,FileSource,ProcessingRec.PointStart+1 ,
                      ProcOldRec.A0,ProcOldRec.A1,ProcOldRec.A2,ProcOldRec.A3,
                      ProcOldRec.RezType,Rez1});
     Rez:=GetRezRec.Rez;
     if Rez< ProcessingRec.MinY then ProcessingRec.MinY:=Rez;
     if Rez> ProcessingRec.MaxY then ProcessingRec.MaxY:=Rez;
     Yn_1:=Rez;Xn_1:=Rez;
     {FileDest.Write(Rez,SizeOf(Rez),BytesWrote);}
     RezArray[cRezArray]:=Rez; inc(cRezArray);
     for i:=ProcessingRec.PointStart+2 to ProcessingRec.PointEnd do
      begin
       if bMyReal then
        FileSource.Read(Rez,sizeof(Single), bytesRead )
                  else
                  begin
                   GetRezRec.bSeek:=false;
                   GetRezRec.Point:=i;
                   GetRezFromFile_New(GetRezRec{false,shag,FileSource,i,
                     ProcOldRec.A0,ProcOldRec.A1,ProcOldRec.A2,ProcOldRec.A3,
                     ProcOldRec.RezType,Rez1});
                   Rez:=GetRezRec.Rez;
                   end;
       Xn:=Rez;
       Rez:=B[0,k,NPor]*Xn + B[1,k,NPor]*Xn_1 + B[2,k,NPor]*Xn_2 -
          C[1,k,NPor]*Yn_1 - C[2,k,NPor]*Yn_2;
       if Rez< ProcessingRec.MinY then ProcessingRec.MinY:=Rez;
       if Rez> ProcessingRec.MaxY then ProcessingRec.MaxY:=Rez;
     {  FileDest.Write(Rez,SizeOf(Rez),BytesWrote);}
       RezArray[cRezArray]:=Rez; inc(cRezArray);
       if cRezArray>NRezArray then
        begin
         FileDest.Write(RezArray,SizeOf(RezArray));
         cRezArray:=0;
        end;
       Yn_2:=Yn_1; Yn_1:=Rez;
       Xn_2:=Xn_1;Xn_1:=Xn;
       inc(PointFiltr);
       if PointFiltr mod Divider = 0 then
          begin Gauge1.Progress:=PointFiltr;Gauge1.Update;Application.ProcessMessages;end;
        if not bMessage then break;
       end; {i}
       if cRezArray<>0 then
        begin
         FileDest.Write(RezArray[0],SizeOf(single)*(cRezArray));
         cRezArray:=0;
        end;
       FileDest.destroy;
       FileSource.Close;

       FileSource.Destroy;
       N:=N+2;K:=K+1;

      if N<=FiltrPar.PorLF then
      begin
//        FileDest:=TFileStream.Create(ProcessingRec.FiledatDest,fmOpenRead);
//        cRezArray:=0;
//        FileSource:=TBufferedFile.Create(ProcessingRec.FiledatDest,4096);
//        FileSource.Reset;

        FileDest:=TFileStream.Create(ProcessingRec.FiledatDest,fmOpenRead);
     s1:=ProcessingRec.StoragePath + inttostr(N)+'s_' + GetGuidstr + '.Dat';
     FileDest1:=TFileStream.Create(s1,fmCreate);
     FileDest1.CopyFrom(FileDest,0);
     FileDest1.Destroy;

     FileDest.destroy;


        FileSource:=TBufferedFile.Create(s1,4096);
        FileSource.Reset;

        ProcessingRec.FiledatDest:=ProcessingRec.StoragePath + inttostr(N)+'_' + GetGuidstr + '.Dat';
        FileDest:=TFileStream.Create(ProcessingRec.FiledatDest,fmCreate);

        ProcOldRec.RezType:=cRealLong;
        ProcOldRec.Seek_start:=0;
        Shag:=cSizeRez[ProcOldRec.RezType];
        ProcOldRec.A0:=0;
        ProcOldRec.A1:=1;
        ProcOldRec.A2:=0;ProcOldRec.A3:=0;
        Shag:=cSizeRez[ProcOldRec.RezType];
        GetRezRec.bSeek:=true;
        GetRezRec.Shag:=shag;
        GetRezRec.FileDat:=FileSource;
{        GetRezRec.Point:=ProcessingRec.PointStart;}
        GetRezRec.A0:=ProcOldRec.A0;
        GetRezRec.A1:=ProcOldRec.A1;
        GetRezRec.A2:=ProcOldRec.A2;
        GetRezRec.A3:=ProcOldRec.A3;
        GetRezRec.RezType:=ProcOldRec.RezType;
        GetRezRec.Seek_Start:=0;
        bMyReal:=true;
        ProcessingRec.PointAll:=ProcessingRec.PointEnd-ProcessingRec.PointStart;
        ProcessingRec.PointStart:=0;
        ProcessingRec.PointEnd:=ProcessingRec.PointAll-1;
        GetRezRec.Point:=ProcessingRec.PointStart;

{}      end;
     if not bMessage then break;
    until N>FiltrPar.PorLF;
    end;



    {FHF}
       {расчет коэффициентов фильтра}

     if FiltrPar.FHF<>0 then { FlF }
      begin
       Wo:=1/ProcessingRec.DeltX/FiltrPar.FHF;
                                   {ПЃап§Ѓ™ д®Ђмва† ђЃ¶•в °лвм 2/4/6/8/10}
       for i:=1 to 5 do        {Р†бз•в ™Ѓндд®ж®•≠вЃҐ A[i,N]}
        for N:=2 to 10 do
         case N of
          2,4,6,8,10: A[i,N]:=2*cos(Pi*(2*i-1)/2/N);
         end;
       for k:=1 to 5 do       {Р†бз•в ™Ѓндд®ж®•≠вЃҐ B}
        for N:=2 to 10 do
         begin
          case N of
           2,4,6,8,10: B[0,k,N]:=1/(1+A[k,N]*Wo/PI+SQR(Wo/Pi));
           else B[0,k,N]:=0 ;
          end;
          B[1,k,N]:=2*B[0,k,N];
          B[2,k,N]:=B[0,K,N];
         end;
       for k:=1 to 5 do      {Р†бз•в ™Ѓндд®ж®•≠вЃҐ C}
        for N:=2 to 10 do
         begin
          case N of
           2,4,6,8,10:
            begin
             C[1,k,N]:=2*(1-SQR(Wo/Pi))*B[0,k,N];
             C[2,K,N]:=(1-A[k,N]*Wo/Pi+SQR(Wo/Pi))*B[0,k,N];
            end;
             else
              begin
               C[1,k,N]:=0; C[2,k,N]:=0;
              end;
          end;
         end;

      for k:=1 to 5 do       {Р†бз•в ™Ѓндд®ж®•≠вЃҐ Bs ® Cs}
       for N:=2 to 10 do
        begin
         case N of
          2,4,6,8,10:
           begin
            Bs[0,k,N]:=(Wo/Pi)*(Wo/Pi)*B[0,k,N];
            Bs[1,k,N]:=-2*Bs[0,k,N];
            Bs[2,k,N]:=Bs[0,k,N];
            Cs[1,k,N]:=C[1,k,N];
            Cs[2,k,N]:=C[2,k,N];
         end
            else
             begin
              Bs[0,k,N]:=0;
              Bs[1,k,N]:=0;
              Bs[2,k,N]:=0;
              Cs[1,k,N]:=0;
              Cs[2,k,N]:=0;
             end;
         end;
        end;
      for k:=1 to 5 do       {ѓЃ§ђ•≠† ™Ѓндд®ж®•≠вЃҐ B ® C ≠† ™Ѓндд®ж®•≠вл Bs ® Cs}
       for N:=2 to 10 do
        begin
            B[0,k,N]:=Bs[0,k,N];
            B[1,k,N]:=Bs[1,k,N];
            B[2,k,N]:=Bs[2,k,N];
            C[1,k,N]:=Cs[1,k,N];
            C[2,k,N]:=Cs[2,k,N];
        end;

    if FiltrPar.FLF=0 then
     begin
      FileDest:=TFileStream.Create(ProcessingRec.FiledatDest,fmcreate);
//      FileDest.Rewrite;
     FileSource:=TBufferedFile.Create(ProcessingRec.FiledatSource,4096);
     FileSource.Reset;
      cRezArray:=0;
       ProcOldRec.RezType:=ProcessingRec.RezType;
      ProcOldRec.Seek_Start:=ProcessingRec.Seek_Start;
      ProcOldRec.A0:=ProcessingRec.A0;
      ProcOldRec.A1:=ProcessingRec.A1;
      ProcOldRec.A2:=ProcessingRec.A2;
      ProcOldRec.A3:=ProcessingRec.A3;
      bMyReal:=false;
      Shag:=cSizeRez[ProcOldRec.RezType];
     end   else
      begin
        FileDest:=TFileStream.Create(ProcessingRec.FiledatDest,fmOpenRead);

     s1:=ProcessingRec.StoragePath + inttostr(N)+'s_' + GetGuidstr + '.Dat';

     FileDest1:=TFileStream.Create(s1,fmCreate);
     FileDest1.CopyFrom(FileDest,0);
     FileDest1.Destroy;

     FileDest.destroy;


        FileSource:=TBufferedFile.Create(s1,4096);
        FileSource.Reset;

        ProcessingRec.FiledatDest:=ProcessingRec.StoragePath + 'l_' + GetGuidstr + '.Dat';
        FileDest:=TFileStream.Create(ProcessingRec.FiledatDest,fmCreate);

        ProcOldRec.RezType:=cRealLong;
        ProcOldRec.Seek_Start:=0;
        ProcOldRec.A0:=0;  ProcOldRec.A1:=1; ProcOldRec.A2:=0;ProcOldRec.A3:=0;
        bMyReal:=true;
        Shag:=cSizeRez[ProcOldRec.RezType];
{}        ProcessingRec.PointAll:=ProcessingRec.PointEnd-ProcessingRec.PointStart;
        ProcessingRec.PointStart:=0;
        ProcessingRec.Seek_Start:=0; {???}
        ProcessingRec.PointEnd:=ProcessingRec.PointAll-1;

  {}
      end;
    k:=1;N:=2;NPor:=FiltrPar.PorHF;
    repeat
//     FileSource:=TBufferedFile.Create(ProcessingRec.FiledatSource,4096);
//     FileSource.Reset;

     GetRezRec.bSeek:=true;
     GetRezRec.Shag:=shag;
     GetRezRec.FileDat:=FileSource;
     GetRezRec.Point:=ProcessingRec.PointStart;
     GetRezRec.A0:=ProcOldRec.A0;
     GetRezRec.A1:=ProcOldRec.A1;
     GetRezRec.A2:=ProcOldRec.A2;
     GetRezRec.A3:=ProcOldRec.A3;
     GetRezRec.RezType:=ProcOldRec.RezType;
     GetRezRec.Seek_Start:=ProcOldRec.Seek_Start;
     GetRezFromFile_New(GetRezRec{True,Shag,FileSource,ProcessingRec.PointStart ,
                     ProcOldRec.A0,ProcOldRec.A1,ProcOldRec.A2,ProcOldRec.A3,
                     ProcOldRec.RezType,ProcessingRec.MaxY});
     ProcessingRec.MaxY:=0;
     ProcessingRec.MinY:=ProcessingRec.MaxY;
     Rez:=ProcessingRec.MinY;
     Yn_2:=Rez;Xn_2:=Rez;
{     FileDest.Write(Rez,SizeOf(Rez),BytesWrote);}
     RezArray[cRezarray]:=Rez; inc(cRezArray);
     GetRezRec.bSeek:=false;
     GetRezFromFile_New(GetRezRec{False,Shag,FileSource,ProcessingRec.PointStart+1 ,
                      ProcOldRec.A0,ProcOldRec.A1,ProcOldRec.A2,ProcOldRec.A3,
                      ProcOldRec.RezType,Rez1});
     Rez1:=0;
     Rez:=Rez1;
     if Rez< ProcessingRec.MinY then ProcessingRec.MinY:=Rez;
     if Rez> ProcessingRec.MaxY then ProcessingRec.MaxY:=Rez;
     Yn_1:=Rez;Xn_1:=Rez;
{     FileDest.Write(Rez,SizeOf(Rez),BytesWrote);}
     RezArray[cRezarray]:=Rez; inc(cRezArray);
     for i:=ProcessingRec.PointStart+2 to ProcessingRec.PointEnd do
      begin
       if bMyReal then
        FileSource.Read(Rez,sizeof(Single),bytesRead)
                  else
                  begin
                   GetRezRec.Point:=i;
                   GetRezFromFile_New(GetRezRec{false,Shag,FileSource,i,
                     ProcOldRec.A0,ProcOldRec.A1,ProcOldRec.A2,ProcOldRec.A3,
                     ProcOldRec.RezType,Rez1});
                    Rez:=GetRezRec.Rez;
                   end;
       Xn:=Rez;
       Rez:=B[0,k,NPor]*Xn + B[1,k,NPor]*Xn_1 + B[2,k,NPor]*Xn_2 -
          C[1,k,NPor]*Yn_1 - C[2,k,NPor]*Yn_2;
       Yn_2:=Yn_1; Yn_1:=Rez;
       Xn_2:=Xn_1;Xn_1:=Xn;
       if ((i-ProcessingRec.PointStart+2)<NachUch.Value)  then Rez:=0;
       if Rez< ProcessingRec.MinY then ProcessingRec.MinY:=Rez;
       if Rez> ProcessingRec.MaxY then ProcessingRec.MaxY:=Rez;
//       FileDest.Write(Rez,SizeOf(Rez));
       RezArray[cRezarray]:=Rez; inc(cRezArray);
       if cRezArray>NRezArray then
        begin
         FileDest.Write(RezArray,SizeOf(RezArray));
         cRezArray:=0;
        end;
       inc(PointFiltr);
       if PointFiltr mod Divider = 0 then
         begin Gauge1.Progress:=PointFiltr;Gauge1.Update;Application.ProcessMessages;end;
       if not bMessage then break;
      end; {i}
      if cRezArray<>0 then
        begin
         FileDest.Write(RezArray[0],SizeOf(single)*cRezArray);
         cRezArray:=0;
        end;

      FileSource.Close;
      FileDest.Destroy;FileSource.Destroy;
      N:=N+2;K:=K+1;

      if N<=FiltrPar.PorHF then
      begin
{        FileDest:=TFileStream.Create(ProcessingRec.FiledatDest,fmOpenRead);
        FileSource:=TBufferedFile.Create(ProcessingRec.FiledatDest,4096);
        FileSource.Reset;
 }
        FileDest:=TFileStream.Create(ProcessingRec.FiledatDest,fmOpenRead);
     s1:=ProcessingRec.StoragePath + inttostr(N)+'s_' + GetGuidstr + '.Dat';
     FileDest1:=TFileStream.Create(s1,fmCreate);
     FileDest1.CopyFrom(FileDest,0);
     FileDest1.Destroy;

     FileDest.destroy;


        FileSource:=TBufferedFile.Create(s1,4096);
        FileSource.Reset;

        ProcessingRec.FiledatDest:=ProcessingRec.StoragePath + inttostr(N)+'_' + GetGuidstr + '.Dat';
        FileDest:=TFileStream.Create(ProcessingRec.FiledatDest,fmCreate);


        ProcOldRec.RezType:=cRealLong;
        ProcOldRec.Seek_Start:=0;
        ProcOldRec.A0:=0;
        ProcOldRec.A1:=1;
        ProcOldRec.A2:=0;ProcOldRec.A3:=0;
        bMyReal:=true;
        Shag:=cSizeRez[ProcOldRec.RezType];
        GetRezRec.bSeek:=true;
        GetRezRec.Shag:=shag;
        GetRezRec.FileDat:=FileSource;
        GetRezRec.A0:=ProcOldRec.A0;
        GetRezRec.A1:=ProcOldRec.A1;
        GetRezRec.A2:=ProcOldRec.A2;
        GetRezRec.A3:=ProcOldRec.A3;
        GetRezRec.RezType:=ProcOldRec.RezType;
        GetRezRec.Seek_Start:=ProcOldRec.Seek_Start;
        ProcessingRec.PointAll:=ProcessingRec.PointEnd-ProcessingRec.PointStart;
        ProcessingRec.PointStart:=0;
        ProcessingRec.PointEnd:=ProcessingRec.PointAll-1;
        GetRezRec.Point:=ProcessingRec.PointStart;
      end;
     if not bMessage then break;
    until N>FiltrPar.PorHF;
    end;
//    ProcessingRec.DateTimeStart:=ProcessingRec.DateTimeStart+ProcessingRec.DeltX*ProcessingRec.PointStart/(24*3600);
    ProcessingRec.DateTimeStart:=ProcessingRec.DateTimeStart+ProcessingRec.DeltX*PointStartSource/(24*3600);
    ProcessingRec.PointAll:=ProcessingRec.PointEnd-ProcessingRec.PointStart+1;
    ProcessingRec.PointStart:=0;ProcessingRec.PointEnd:=ProcessingRec.PointAll-1;
    ProcessingRec.A0:=0;ProcessingRec.A1:=1;ProcessingRec.A2:=0;ProcessingRec.A3:=0;
    ProcessingRec.RezType:=cRealLong;
    ProcessingRec.Seek_Start:=0;
    FileProcRec.Write(ProcessingRec,SizeOf(TSourceRec));
    inc(ReturnRec.NSignal);
 end;
end;
 closeFile(FF1);
 FileProcRec.Destroy;
     {в этом месте надо вставить код дл€ сливани€ результата фильтрации в один файл
      c одновременным изменением Seek_Start и FileDatDest}

if bMessage then
 begin
  assignFile(RetFile,ReturnFileName);
  Rewrite(RetFile);write(RetFile,ReturnRec);
  CloseFile(retFile);
  PostMessage(App_Source_Handle, wm_EndProcessing_Gl_2004,Source_Handle,0);
end;
end;

procedure TBattervort.ButtonCancelClick(Sender: TObject);
begin
if bMessage then bMessage:=False else close;
end;

procedure TBattervort.ButtonOKClick(Sender: TObject);
var FF:file of tFiltrPar;
begin
  if Table1.state = dsEdit then Table1.Post;
  FiltrPar.PorLF:=PorLF.Value;
  FiltrPar.PorHF:=PorHF.Value;
  FiltrPar.NachUchast:=NachUch.Value;
  FiltrPar.FHF:=StrToFloat(FHF.Text);
  FiltrPar.FLF:=StrToFloat(FLF.Text);
  if ((FiltrPar.FLF<FiltrPar.FHF) and (FiltrPar.FLF<>0 ) and (FiltrPar.FHF<>0)) then
    begin
     MessageDlg('„астота среза ‘Ќ„ < частоты среза ‘¬„ ', mtError, [mbOk], 0);
     exit;
    end;
  if ((FiltrPar.FLF=0) and (FiltrPar.FHF=0)) then
    begin
     MessageDlg('частоты среза не заданы ', mtError, [mbOk], 0);
     exit;
    end;
  if ((FiltrPar.FLF>0.5/ProcessingRec.DeltX ) or
       (FiltrPar.FHF>0.5/ProcessingRec.DeltX ) ) then
    begin
     MessageDlg('частота среза более половины частоты дискретизации ( '+
         FloatToStrF(0.5/ProcessingRec.DeltX,ffFixed,5,2)+'Hz)', mtError, [mbOk], 0);
     exit;
    end;
  assignFile(FF,FiltrParFile);
  try
    Rewrite(FF);write(FF,FiltrPar);CloseFile(FF);
   except
      on EInOutError do
        begin
        MessageDlg(FiltrParFile +' I/O error.', mtError, [mbOk], 0);
        exit;
        end;
     end;
   ReturnRec.PartAll:=Table1PartAll.Value;
   ReturnRec.SelectSignal:=Table1SelectSign.asinteger;
   ReturnRec.Showresult:=Table1bShowresul.Value;
   ReturnRec.ShowWin:=Table1ShowWin.asinteger;
   if ReturnRec.ShowWin = 2 then ReturnRec.PageName:=ProcessingRec.TekPageName
    else ReturnRec.PageName:=Table1pageName.Value;
   ReturnRec.HeadWin:=Table1HeadWin.Value;
   ReturnRec.ProcRez_Type:={cProcrez_is_freqmap;}cProcrez_is_Signal;
   ReturnRec.FName:=ProcessingRec.FName;
   ReturnRec.Parent_Handle:=Source_Handle;
   ButtonOk.Enabled:=False;
   Filtration;
   close;
end;


procedure TBattervort.PartAllClick(Sender: TObject);
begin
   if ((partAll.ItemIndex = 1) and (ShowWin.ItemIndex=2))
      then
       begin
        MessageDlg(
         'ќбработка части сигнала возможна при отображении результата на новой странице '
         , mtError, [mbOk], 0);
        postMessage(Handle,wm_Setpartall,0,0);
       end;
end;

procedure TBattervort.wmSetPartAll( var Message:TMessage );
begin
   PartAll.ItemIndex:=0;
   PartAll.Update;
end;

procedure TBattervort.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
 DeleteFile(pchar(Copy_TargetFile));
end;

procedure TBattervort.PorHFExit(Sender: TObject);
begin
 if Table1.state<>dsEdit then Table1.Edit;
 Table1HeadWin.Value:='‘ильтр: ¬„('+IntToStr(PorHF.Value)+')= '+FHF.Text+
               ' Ќ„('+IntToStr(PorLF.Value)+')='+FLF.Text+ '√ц';
 Table1PageName.Value:='¬„='+
   FHF.Text+'  Ќ„='+FLF.Text+ 'Hz';
 Table1.Post;
end;

procedure TBattervort.FormActivate(Sender: TObject);
begin
 if ProcessingRec.Param = 1  then
   PostMessage(Handle,wm_StartProcessing,0,0);
end;

procedure TBattervort.wmStartProcessing( var Message:TMessage );
begin
 ButtonOkClick(nil);
 inherited;
end;

end.

