unit Functime;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, DB, DBTables, Spin, Buttons,
  Mask,
  tvc_u, Gauges, mdrv, FileBuff, TabNotBk, Grids, DBGrids, ComCtrls, Dbf {, FileCopy};

const
  NrezArray = 1023;

type
  TFuncDialog = class(TForm)
    DataSource1: TDataSource;
    PartAll: TDBRadioGroup;
    SelectedSignal: TDBRadioGroup;
    Label5: TLabel;
    HeadWin: TDBEdit;
    Gauge2: TGauge;
    Gauge1: TGauge;
    ButtonOK: TBitBtn;
    ButtonCancel: TBitBtn;
    PageName: TDBEdit;
    Label6: TLabel;
    ShowWin: TDBRadioGroup;
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
    SelectFunc: TPageControl;
    TabSheet1: TTabSheet;
    Memo5: TMemo;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    Label13: TLabel;
    TabSheet3: TTabSheet;
    Memo6: TMemo;
    TabSheet4: TTabSheet;
    Label14: TLabel;
    Label15: TLabel;
    c1_Edit: TEdit;
    Label16: TLabel;
    C2_Edit: TEdit;
    TabSheet5: TTabSheet;
    Label17: TLabel;
    Sk_Sredn_Spin: TSpinEdit;
    bSkUsr: TCheckBox;
    TabSheet6: TTabSheet;
    Memo7: TMemo;
    TabSheet7: TTabSheet;
    Label18: TLabel;
    bDopZero: TCheckBox;
    Label10: TLabel;
    Button1: TButton;
    TabSheet8: TTabSheet;
    Chisl_Har: TRadioGroup;
    Label20: TLabel;
    Format_S_Edit: TEdit;
    TabSheet9: TTabSheet;
    Memo8: TMemo;
    Max_Cb: TCheckBox;
    Min_CB: TCheckBox;
    Mx_Cb: TCheckBox;
    procedure ShowWinChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FuncProc;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure PartAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure C1_EditExit(Sender: TObject);
    procedure bSkUsrClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    bOgran: boolean;
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
  end;

var
  FuncDialog: TFuncDialog;

implementation

uses Config;
{uses Image;}
{$R *.DFM}
var
  RezArray: array[0..NRezArray] of single;
  cRezArray: integer;
  Shag: integer;
  GetRezRec, GetRezRec1: TGetRezRec;

procedure TFuncDialog.ShowWinChange(Sender: TObject);
begin
  case ShowWin.ItemIndex of
    0: begin
        Label5.Visible := True;
        HeadWin.Visible := True;
        Label6.Visible := True;
        PageName.Visible := True; {
        ShowMessage('Пока не реализовано');
        ShowWin.ItemIndex:=1;
        Label5.Visible:=False;
        HeadWin.Visible:=False;
        Label6.Visible:=True;
        PageName.Visible:=True; }
      end;
    1: begin
        Label5.Visible := False;
        HeadWin.Visible := False;
        Label6.Visible := True;
        PageName.Visible := True;
        if (SelectFunc.TabIndex = 7)
          then
        begin
          if visible then MessageDlg('Обработка должна отображаться в новом окне! ', mtError, [mbOk], 0);
{           ShowWin.ItemIndex:=0;}
        end;
      end;
    2: begin
        Label5.Visible := False;
        HeadWin.Visible := False;
        Label6.Visible := false;
        PageName.Visible := False;
        if (SelectFunc.TabIndex = 7)
          then
        begin
          if visible then MessageDlg('Обработка должна отображаться в новом окне!! ', mtError, [mbOk], 0);
          exit;
 {          ShowWin.ItemIndex:=0;}
        end;
        if (partAll.ItemIndex = 1)
          then
        begin
          MessageDlg('Обработка части сигнала возможна при отображении результата на новой странице ',
            mtError, [mbOk], 0);
          PartAll.ItemIndex := 0; Partall.Update;
        end;
        if ((SelectFunc.TabIndex = 4) and (not bSkUsr.Checked))
          then
        begin
        {   MessageDlg('Усреднение допустимо на новую  страницу ', mtError, [mbOk], 0);}
          ShowWin.ItemIndex := 1;
        end;
      end; {2}
  end; {case}
end;

procedure TFuncDialog.FormCreate(Sender: TObject);
var
  FF: file of TFuncPar;
  FF1: file of TSourceRec;
begin
  table1.Open;
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
  C1_edit.Text := FloatToStrF(FuncPar.C1_Edit, ffFixed, 5, 2);
  c2_Edit.Text := FloatToStrF(FuncPar.c2_edit, ffFixed, 5, 2);
  Format_S_Edit.Text := FuncPar.Format_S;
  bSkUsr.Checked := FuncPar.bSkUsr;
  bDopZero.Checked := FuncPar.bDopZero;
  Sk_Sredn_Spin.Value := FuncPar.Sk_Sredn;
  SelectFunc.TabIndex := FuncPar.ActivePage;
  Chisl_Har.ItemIndex := FuncPar.Chisl_Har;
  Min_CB.Checked := FuncPar.MinCB;
  Max_CB.Checked := FuncPar.MaxCB;
  Mx_CB.Checked := FuncPar.MxCB;
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
      MessageDlg('Ой- ' + SourceFileName + ' I/O error.', mtError, [mbOk], 0);
      exit;
    end;
  end;
  Sk_Sredn_Spin.MaxValue := (ProcessingRec.PointEnd - ProcessingRec.PointStart) div 3;
  Source_Handle := ProcessingRec.Source_Handle;
  App_Source_Handle := ProcessingRec.App_Handle;
  Caption := Caption + {Mes_Ini.ReadString('FTime','s4',' для ')+} ' ' + ProcessingRec.Source_Caption + ' / ' +
    ProcessingRec.TekPageName;
  PartAll.Enabled := ProcessingRec.Auto <> 1;
  ShowWin.Enabled := ProcessingRec.Auto <> 1;
  SelectedSignal.Enabled := ProcessingRec.Auto <> 1;
  HeadWin.Enabled := ProcessingRec.Auto <> 1;
  PageName.Enabled := ProcessingRec.Auto <> 1;
  Label5.Visible := ProcessingRec.Auto <> 1;
  Label6.Visible := ProcessingRec.Auto <> 1;
  C1_EditExit(nil);
//  Save_Lang_Par(Lang_2_Ini,self,'FuncTime_Proc');
end;

procedure TFuncDialog.FuncProc;
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
 {    Max1,Max2,Max3,Min1,Min2,Min3:real;
 }
  function GetProcessPoint: Longint;
  begin
    case SelectFunc.TabIndex of
      0: GetProcessPoint := 2 * (ProcessingRec.PointEnd - ProcessingRec.PointStart);
      1, 2, 3, 4, 5: GetProcessPoint := ProcessingRec.PointEnd - ProcessingRec.PointStart;
      6: GetProcessPoint := (ProcessingRec.PointEnd - ProcessingRec.PointStart) div 2;
      7: GetProcessPoint := 2 * (ProcessingRec.PointEnd - ProcessingRec.PointStart);
      8: GetProcessPoint := 3 * (ProcessingRec.PointEnd - ProcessingRec.PointStart);
    end;
  end;

begin
  FileProcRec := TFileStream.Create(ProcessingRec.FName, fmCreate);
// FileProcRec.Rewrite;
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

//    ProcessingRec.FiledatDest:=appconfig.DataStoragePath+'rez_'+GetGuidstr+'.Dat';

      if FileDest = nil then
      begin
        ProcessingRec.FiledatDest := ProcessingRec.StoragePath + 'rez_' + GetGuidstr + '.Dat';
        FileDest := TFileStream.Create(ProcessingRec.FiledatDest, fmcreate);
//      FileDest.Rewrite;
        cRezCurve := 0;
      end;
      ProcessingRec.Seek_Start := cRezCurve * (ProcessingRec.PointEnd - ProcessingRec.PointStart + 1) * SizeOf(Single);
      inc(cRezCurve);
      cRezArray := 0;
      FileSource := TBufferedFile.Create(ProcessingRec.FiledatSource, 4096);
      FileSource.Reset;
      case SelectFunc.TabIndex of
        0: {x-mx}
          begin
            Rez := 0;
            for i := ProcessingRec.PointStart to ProcessingRec.PointEnd do
            begin
              GetRezFromFile(FileSource, i,
                ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3,
                ProcOldRec.RezType, Rez1, Status, ProcoldRec.Seek_start);
              Rez := Rez + Rez1;
              if ((i - ProcessingRec.PointStart) mod 1250 = 0) then
              begin
                Gauge1.Progress := i - ProcessingRec.PointStart; Gauge1.Update; Application.ProcessMessages;
                if not bMessage then break;
              end;
            end;
            Mx := Rez / (ProcessingRec.PointEnd - ProcessingRec.PointStart + 1);
            for i := ProcessingRec.PointStart to ProcessingRec.PointEnd do
            begin
              GetRezFromFile(FileSource, i,
                ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                Status, ProcoldRec.Seek_start);
              Rez := Rez1 - Mx;
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
                Gauge1.Progress := i - ProcessingRec.PointStart +
                  (ProcessingRec.PointEnd - ProcessingRec.PointStart);
                Gauge1.Update; Application.ProcessMessages;
                if not bMessage then break;
              end;
            end; {i}
          end; {Case PageIndex = 0}
        1: begin {Производная}
            DI := 12 * ProcessingRec.DeltX;
            i := ProcessingRec.PointStart;
            GetRezFromFile(FileSource, i + 0, ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType,
              R0, Status, ProcoldRec.Seek_start);
            GetRezFromFile(FileSource, i + 1, ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType,
              R1, Status, ProcoldRec.Seek_start);
            GetRezFromFile(FileSource, i + 2, ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType,
              R2, Status, ProcoldRec.Seek_start);
            GetRezFromFile(FileSource, i + 3, ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType,
              R3, Status, ProcoldRec.Seek_start);
            Rez := (-3 * R0 + 4 * R1 - R2) * 6 / DI;
            FileDest.Write(Rez, SizeOf(Rez));
            ProcessingRec.MinY := Rez; ProcessingRec.MaxY := Rez;
            Rez := (-3 * R1 + 4 * R2 - R3) * 6 / DI;
            if ProcessingRec.MaxY < Rez then ProcessingRec.MaxY := Rez;
            if ProcessingRec.MinY > Rez then ProcessingRec.MinY := Rez;
            FileDest.Write(Rez, SizeOf(Rez));
            for i := ProcessingRec.PointStart + 2 to ProcessingRec.PointEnd - 2 do
            begin
              GetRezFromFile(FileSource, i - 2, ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType,
                R0, Status, ProcoldRec.Seek_start);
              GetRezFromFile(FileSource, i - 1, ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType,
                R1, Status, ProcoldRec.Seek_start);
              GetRezFromFile(FileSource, i + 1, ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType,
                R3, Status, ProcoldRec.Seek_start);
              GetRezFromFile(FileSource, i + 2, ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType,
                R4, Status, ProcoldRec.Seek_start);
              Rez := (R0 - 8 * R1 + 8 * R3 - R4) / DI;
              if ProcessingRec.MaxY < Rez then ProcessingRec.MaxY := Rez;
              if ProcessingRec.MinY > Rez then ProcessingRec.MinY := Rez;
              FileDest.Write(Rez, SizeOf(Rez));
              if ((i - ProcessingRec.PointStart) mod 1000 = 0) then
              begin
                Gauge1.Progress := i - ProcessingRec.PointStart;
                Gauge1.Update; Application.ProcessMessages;
                if not bMessage then break;
              end;
            end; {i}
            GetRezFromFile(FileSource, ProcessingRec.PointEnd - 3, ProcOldRec.A0, ProcOldRec.A1,
              ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, R0, Status, ProcoldRec.Seek_start);
            GetRezFromFile(FileSource, ProcessingRec.PointEnd - 2, ProcOldRec.A0, ProcOldRec.A1,
              ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, R1, Status, ProcoldRec.Seek_start);
            GetRezFromFile(FileSource, ProcessingRec.PointEnd - 1, ProcOldRec.A0, ProcOldRec.A1,
              ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, R2, Status, ProcoldRec.Seek_start);
            GetRezFromFile(FileSource, ProcessingRec.PointEnd - 0, ProcOldRec.A0, ProcOldRec.A1,
              ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, R3, Status, ProcoldRec.Seek_start);
            Rez := (R0 - 4 * R1 + 3 * R2) * 6 / DI;
            FileDest.Write(Rez, SizeOf(Rez));
            if ProcessingRec.MaxY < Rez then ProcessingRec.MaxY := Rez;
            if ProcessingRec.MinY > Rez then ProcessingRec.MinY := Rez;
            Rez := (R1 - 4 * R2 + 3 * R3) * 6 / DI;
            if ProcessingRec.MaxY < Rez then ProcessingRec.MaxY := Rez;
            if ProcessingRec.MinY > Rez then ProcessingRec.MinY := Rez;
            FileDest.Write(Rez, SizeOf(Rez));
          end; {Производная}
        2: begin {Интеграл}
            GetRezFromFile(FileSource, ProcessingRec.PointStart, ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2,
              ProcOldRec.A3, ProcOldRec.RezType, Rez1, Status, ProcoldRec.Seek_start);
            Rez := Rez1 * ProcessingRec.DeltX;
            ProcessingRec.MinY := Rez; ProcessingRec.MaxY := Rez;
            FileDest.Write(Rez, SizeOf(Rez));
            Xpr := Rez1;
            DI := Rez;
            for i := ProcessingRec.PointStart + 1 to ProcessingRec.PointEnd do
            begin
              XPr := Rez1;
              GetRezFromFile(FileSource, i, ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2,
                ProcOldRec.A3, ProcOldRec.RezType, Rez1, Status, ProcoldRec.Seek_start);
              Rez := DI + ((Rez1 + XPr) / 2) * ProcessingRec.DeltX;
              DI := Rez;
              if ProcessingRec.MaxY < Rez then ProcessingRec.MaxY := Rez;
              if ProcessingRec.MinY > Rez then ProcessingRec.MinY := Rez;
              FileDest.Write(Rez, SizeOf(Rez));
              if ((i - ProcessingRec.PointStart) mod 1000 = 0) then
              begin
                Gauge1.Progress := i - ProcessingRec.PointStart;
                Gauge1.Update; Application.ProcessMessages;
                if not bMessage then break;
              end;
            end; {i}
          end;
        3: begin {x*c1+c2}
            for i := ProcessingRec.PointStart to ProcessingRec.PointEnd do
            begin
              GetRezFromFile(FileSource, i,
                ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                Status, ProcoldRec.Seek_start);
              Rez := Rez1 * FuncPar.C1_Edit + FuncPar.c2_edit;
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
          end;
        4: if FuncPar.bSkUsr then
          begin {f= ck.усреднение}
            Sum := 0; ksum := 0;
            NSum := FuncPar.Sk_Sredn;
            for i := ProcessingRec.PointStart to ProcessingRec.PointStart + (NSum div 2) - 1 do
            begin
              GetRezFromFile(FileSource, i,
                ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                Status, ProcoldRec.Seek_start);
              Sum := Sum + Rez1;
              Inc(KSum);
              Rez := Sum / KSum;
              if i = ProcessingRec.PointStart then
              begin
                ProcessingRec.MinY := Rez;
                ProcessingRec.MaxY := Rez;
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
            end;
            Sum := 0;
            for i := ProcessingRec.PointStart to ProcessingRec.PointStart + NSum - 1 do
            begin
              GetRezFromFile(FileSource, i,
                ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                Status, ProcoldRec.Seek_start);
              Sum := Sum + Rez1;
            end;
            for i := ProcessingRec.PointStart + (Nsum div 2) to ProcessingRec.PointEnd - (NSum div 2) do
            begin
              GetRezFromFile(FileSource, i + (NSum div 2),
                ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                Status, ProcoldRec.Seek_start);
              Sum := Sum + Rez1;
              GetRezFromFile(FileSource, i - (NSum div 2),
                ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                Status, ProcoldRec.Seek_start);
              Sum := Sum - Rez1;
              Rez := Sum / NSum;
              if ProcessingRec.MaxY < Rez then ProcessingRec.MaxY := Rez;
              if ProcessingRec.MinY > Rez then ProcessingRec.MinY := Rez;
              FileDest.Write(Rez, SizeOf(Rez));
              if ((i - ProcessingRec.PointStart) mod 1000 = 0) then
              begin
                Gauge1.Progress := i - ProcessingRec.PointStart;
                Gauge1.Update; Application.ProcessMessages;
                if not bMessage then break;
              end;
            end;
            KSum := NSum;
            for i := ProcessingRec.PointEnd - (NSum div 2) to ProcessingRec.PointEnd do
            begin
              GetRezFromFile(FileSource, i - (Nsum div 2),
                ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                Status, ProcoldRec.Seek_start);
              Sum := Sum - Rez1;
              if KSum <> 0 then Rez := Sum / (Ksum) else Rez := Rez1;
              dec(KSum);
              if ProcessingRec.MaxY < Rez then ProcessingRec.MaxY := Rez;
              if ProcessingRec.MinY > Rez then ProcessingRec.MinY := Rez;
              FileDest.Write(Rez, SizeOf(Rez));
              if ((i - ProcessingRec.PointStart) mod 1000 = 0) then
              begin
                Gauge1.Progress := i - ProcessingRec.PointStart;
                Gauge1.Update; Application.ProcessMessages;
                if not bMessage then break;
              end;
            end;
          end
          else
          begin {f=усреднение}
            Sum := 0; KSum := 0;
            NSum := FuncPar.Sk_Sredn;
            i := ProcessingRec.PointStart;
            while i < ProcessingRec.PointEnd - NSum do
            begin
              Sum := 0;
              for j := i to i + NSum - 1 do
              begin
                GetRezFromFile(FileSource, j,
                  ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                  Status, ProcoldRec.Seek_start);
                Sum := Sum + Rez1;
                if ((j - ProcessingRec.PointStart) mod 1000 = 0) then
                begin
                  Gauge1.Progress := j - ProcessingRec.PointStart;
                  Gauge1.Update; Application.ProcessMessages;
                  if not bMessage then break;
                end;
              end; {for j:= i to i+NSum-1}
              Rez := Sum / NSum;
              inc(kSum);
              i := i + NSum;
              if kSum = 0 then
              begin
                ProcessingRec.MinY := Rez;
                ProcessingRec.MaxY := Rez;
              end else
              begin
                if ProcessingRec.MaxY < Rez then ProcessingRec.MaxY := Rez;
                if ProcessingRec.MinY > Rez then ProcessingRec.MinY := Rez;
              end;
              FileDest.Write(Rez, SizeOf(Rez));
            end; {While}
            ProcessingRec.DeltX := ProcessingRec.DeltX * NSum;
            ProcessingRec.PointAll := kSum;
            ProcessingRec.PointEnd := ProcessingRec.PointStart + KSum - 1;
          end;
        5: begin {f=abs(f)}
            for i := ProcessingRec.PointStart to ProcessingRec.PointEnd do
            begin
              GetRezFromFile(FileSource, i,
                ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                Status, ProcoldRec.Seek_start);
              Rez := abs(Rez1);
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
          end;
        6: if bDopZero.Enabled then
          begin {автокорреляция через БПФ}
            NPoints := ProcessingRec.PointEnd - ProcessingRec.PointStart;
            if NPoints <= 8 then PointFFT := 8;
            if NPoints <= 16 then PointFFT := 16;
            if NPoints <= 32 then PointFFT := 32;
            if NPoints <= 64 then PointFFT := 64;
            if NPoints <= 128 then PointFFT := 128;
            if NPoints <= 256 then PointFFT := 256;
            if NPoints <= 1024 then PointFFT := 1024;
            if NPoints <= 2048 then PointFFT := 2048;
            if NPoints <= 4096 then PointFFT := 4096;
            if NPoints <= 8192 then PointFFT := 8192;
            try
              GetMem(BufRez, PointFFT * sizeOf(Single) + Zapas);
            except
              MessageDlg(' не достаточно памяти для расчета спектра ', mtError, [mbOk], 0);
              break;
            end;
            try
              GetMem(BufRez1, PointFFT * sizeOf(Single) + Zapas);
            except
              MessageDlg(' не достаточно памяти для расчета спектра ', mtError, [mbOk], 0);
              break;
            end;
            for i := 0 to PointFFT - 1 do BufRez^[i] := 0;
            for i := 0 to PointFFT - 1 do BufRez1^[i] := 0;
            Shag := cSizeRez[ProcOldRec.RezType];
            GetRezRec.bSeek := true;
            GetRezRec.Seek_Start := ProcOldRec.Seek_Start;
            GetRezRec.Shag := shag;
            GetRezRec.FileDat := FileSource;
            GetRezRec.Point := ProcessingRec.PointStart;
            GetRezRec.A0 := ProcOldRec.A0;
            GetRezRec.A1 := ProcOldRec.A1;
            GetRezRec.A2 := ProcOldRec.A2;
            GetRezRec.A3 := ProcOldRec.A3;
            GetRezRec.RezType := ProcOldRec.RezType;
            for i := ProcessingRec.PointStart to ProcessingRec.PointEnd do
            begin
              GetRezFromFile_New(GetRezRec {FileSource,i,
                         ProcOldRec.A0,ProcOldRec.A1,ProcOldRec.A2,ProcOldRec.A3,
                         ProcOldRec.RezType,Rez1,Status});
              GetRezRec.bSeek := false;
              inc(GetRezRec.Point);
              BufRez^[i - ProcessingRec.PointStart] := GetRezRec.Rez;
            end;
            if not bDopZero.Checked then PointFFT := PointFFT div 2;
            BPF(PointFFT, false, BufRez, BufRez1);
            for i := 0 to PointFFT - 1 do
            begin
              BufRez^[i] := (BufRez^[i] * BufRez^[i] + BufRez1^[i] * BufRez1^[i]) {/ProcessingRec.DeltX};
              BufRez1^[i] := 0;
            end;
            BPF(PointFFT, true, BufRez, BufRez1);
{      if BufRez^[0]<>0 then BufRez^[0]:=BufRez^[0]*2 else BufRez^[0]:=1;}
            ProcessingRec.MinY := BufRez^[0] / 2;
            ProcessingRec.MaxY := ProcessingRec.MinY;
            Npoint := PointFFT div 2;
            for i := 0 to Npoint do
            begin
              Rez := BufRez^[i] / 2;
              FileDest.Write(Rez, SizeOf(Rez));
              if ProcessingRec.MaxY < Rez then ProcessingRec.MaxY := Rez;
              if ProcessingRec.MinY > Rez then ProcessingRec.MinY := Rez;
            end;
            if not bDopZero.Checked then PointFFT := PointFFT * 2;
            FreeMem(BufRez, PointFFT * sizeOf(Single) + Zapas);
            FreeMem(BufRez1, PointFFT * sizeOf(Single) + Zapas);
            Dec(NPoint, 2);
          end
          else
          begin {автокорреляция по определению }
            Shag := cSizeRez[ProcOldRec.RezType];
            GetRezRec.bSeek := true;
            GetRezRec.Shag := shag;
            GetRezRec.FileDat := FileSource;
            GetRezRec.Point := ProcessingRec.PointStart;
            GetRezRec.A0 := ProcOldRec.A0;
            GetRezRec.A1 := ProcOldRec.A1;
            GetRezRec.A2 := ProcOldRec.A2;
            GetRezRec.A3 := ProcOldRec.A3;
            GetRezRec.RezType := ProcOldRec.RezType;
            GetRezRec.Seek_Start := ProcOldRec.Seek_Start;
            FileSource1 := TBufferedFile.Create(ProcessingRec.FiledatSource, 4096);
            FileSource1.Reset;
            Rez := 0; k1 := 0;
            for i := ProcessingRec.PointStart to ProcessingRec.PointEnd do
            begin
              GetRezFromFile_New(GetRezRec {FileSource,i,
                       ProcOldRec.A0,ProcOldRec.A1,ProcOldRec.A2,ProcOldRec.A3,
                       ProcOldRec.RezType,Rez1,Status});
              GetRezRec.bSeek := false;
              inc(GetRezRec.Point);
              Rez := Rez + GetRezRec.Rez;
            end;
            Mx := Rez / (ProcessingRec.PointEnd - ProcessingRec.PointStart + 1);
            NPoint := (ProcessingRec.PointEnd - ProcessingRec.PointStart) div 2;
            for k := 0 to NPoint - 1 do
            begin
              Rez := 0; M1 := 0;
              GetRezRec.bSeek := true;
              GetRezRec.Shag := shag;
              GetRezRec.FileDat := FileSource;
              GetRezRec.Point := ProcessingRec.PointStart;
              GetRezRec.A0 := ProcOldRec.A0; GetRezRec.A1 := ProcOldRec.A1;
              GetRezRec.A2 := ProcOldRec.A2; GetRezRec.A3 := ProcOldRec.A3;
              GetRezRec.RezType := ProcOldRec.RezType;
              GetRezRec.Seek_Start := ProcOldRec.Seek_Start;
              GetRezRec1 := GetRezRec;
              GetRezRec1.FileDat := FileSource1;
              for i := ProcessingRec.PointStart to ProcessingRec.PointEnd - K do
              begin
                GetRezRec.Point := i;
                GetRezRec1.Point := i + K;
                GetRezFromFile_New(GetRezRec {FileSource,i,
                       ProcOldRec.A0,ProcOldRec.A1,ProcOldRec.A2,ProcOldRec.A3,
                       ProcOldRec.RezType,Rez1,Status});
                GetRezFromFile_New(GetRezRec1 {FileSource,i+k,
                       ProcOldRec.A0,ProcOldRec.A1,ProcOldRec.A2,ProcOldRec.A3,
                       ProcOldRec.RezType,Rez2,Status});
                GetRezRec.bSeek := false;
                GetRezRec.bSeek := false;
                Rez := Rez + (GetRezRec.Rez - Mx) * (GetRezRec1.Rez - Mx);
                inc(m1);
                inc(k1);

              end;
              if M1 <> 0 then Rez := Rez / M1;
              if bOgran then begin NPoint := k; Break; end;
{      FileDest.Write(Rez,SizeOf(Rez),BytesWrote);}
              RezArray[cRezArray] := Rez; inc(cRezArray);
              if cRezArray > NRezArray then
              begin
                FileDest.Write(RezArray, SizeOf(RezArray));
                cRezArray := 0;
              end;
              if K = 0 then
              begin
                ProcessingRec.MinY := Rez; ProcessingRec.MaxY := Rez;
              end else
              begin
                if ProcessingRec.MaxY < Rez then ProcessingRec.MaxY := Rez;
                if ProcessingRec.MinY > Rez then ProcessingRec.MinY := Rez;
              end;
              Gauge1.Progress := K;
              Gauge1.Update; Application.ProcessMessages;
              if not bMessage then break;
            end;
            FileSource1.Close; FileSource1.Destroy;
            if cRezArray <> 0 then
            begin
              FileDest.Write(RezArray[0], SizeOf(single) * (cRezArray));
              cRezArray := 0;
            end;
          end;
        7: {числ.х-ки}
          begin
            if FileText_Name = '' then
            begin
              ProcessingRec.FiledatDest := ProcessingRec.StoragePath + 'tf' + GetGuidStr + '.txt';
              FileText_Name := ProcessingRec.FiledatDest;
              assignFile(FileText, FileText_Name); Rewrite(FileText);
              Writeln(FileText, 'Числовые характеристики');
              Writeln(FileText, Chisl_Har.Items.strings[Chisl_Har.ItemIndex]);
              Writeln(FileText, ProcessingRec.Source_Caption + '  ' + ProcessingRec.TekPageName);
            end else ProcessingRec.FiledatDest := FileText_Name;
            case Chisl_Har.ItemIndex of
              0:
                begin
                  Mx := 0;
                  for i := ProcessingRec.PointStart to ProcessingRec.PointEnd do
                  begin
                    GetRezFromFile(FileSource, i,
                      ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3,
                      ProcOldRec.RezType, Rez1, Status, ProcoldRec.Seek_start);
                    Mx := Mx + Rez1;
                    if ((i - ProcessingRec.PointStart) mod 1250 = 0) then
                    begin
                      Gauge1.Progress := i - ProcessingRec.PointStart; Gauge1.Update; Application.ProcessMessages;
                      if not bMessage then break;
                    end;
                  end;
                  Mx := Mx / (ProcessingRec.PointEnd - ProcessingRec.PointStart + 1);
                  Dx := 0;
                  for i := ProcessingRec.PointStart to ProcessingRec.PointEnd do
                  begin
                    GetRezFromFile(FileSource, i,
                      ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                      Status, ProcoldRec.Seek_start);
                    Dx := Dx + (Rez1 - Mx) * (Rez1 - Mx);
                    if i = ProcessingRec.PointStart then
                    begin
                      ProcessingRec.MinY := Rez1; ProcessingRec.MaxY := Rez1;
                    end else
                    begin
                      if ProcessingRec.MaxY < Rez1 then ProcessingRec.MaxY := Rez1;
                      if ProcessingRec.MinY > Rez1 then ProcessingRec.MinY := Rez1;
                    end;
                    if ((i - ProcessingRec.PointStart) mod 1000 = 0) then
                    begin
                      Gauge1.Progress := i - ProcessingRec.PointStart +
                        (ProcessingRec.PointEnd - ProcessingRec.PointStart);
                      Gauge1.Update; Application.ProcessMessages;
                      if not bMessage then break;
                    end;
                  end; {i}
                  Dx := Dx / (ProcessingRec.PointEnd - ProcessingRec.PointStart + 1);
                  Writeln(FileText, ProcessingRec.NameY + '  ' + ProcessingRec.RazmY);
                  Writeln(FileText, 'Mx=', FormatFloat(FuncPar.Format_S, Mx), '  Dx=', FormatFloat(FuncPar.Format_S, Dx),
                    '  RMS=', FormatFloat(FuncPar.Format_S, sqrt(Dx)), '   Max=', FormatFloat(FuncPar.Format_S, ProcessingRec.MaxY),
                    ' Min=', FormatFloat(FuncPar.Format_S, ProcessingRec.MinY));
                end;
              1, 2:
                begin
                  SumYiXi := 0;
                  SumYi := 0;
                  SumXi := 0;
                  for i := ProcessingRec.PointStart to ProcessingRec.PointEnd do
                  begin
                    GetRezFromFile(FileSource, i,
                      ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3,
                      ProcOldRec.RezType, Rez1, Status, ProcoldRec.Seek_start);
                    Xi := i * ProcOldRec.DeltX;
                    SumXi := SumXi + Xi;
                    SumYi := SumYi + Rez1;
                    SumYiXi := SumYiXi + Rez1 * Xi;
                    if ((i - ProcessingRec.PointStart) mod 1250 = 0) then
                    begin
                      Gauge1.Progress := i - ProcessingRec.PointStart; Gauge1.Update; Application.ProcessMessages;
                      if not bMessage then break;
                    end;
                  end;
                  if SumXi <> 0 then Ysvs := FormatFloat(FuncPar.Format_S, SumYiXi / SumXi) else YsvS := '?';
                  if SumYi <> 0 then XsvS := FormatFloat(FuncPar.Format_S, SumYiXi / SumYi) else XsvS := '?';
                  if Chisl_Har.ItemIndex = 1 then
                    Writeln(FileText, ProcessingRec.NameY + '  Ysv=', YsvS, '  ' + ProcessingRec.RazmY)
                  else Writeln(FileText, ProcessingRec.NameX + '  Xsv=', XsvS, '  ' + ProcessingRec.RazmX);
                end;
            end;
            ReturnRec.ProcRez_Type := cProcrez_is_Text;
            ReturnRec.HeadWin:=Chisl_har.Items[Chisl_har.itemindex];
          end; {Case PageIndex = 7}
        8: begin {Межканальная статистика}
            if CRezCurve = 1 then
            begin
              PointVsego := 0;
              ProcessingRec.DateTimeStart := ProcessingRec.DateTimeStart + ProcessingRec.DeltX * ProcessingRec.PointStart / (24 * 3600);
              ProcessingRec.PointAll := ProcessingRec.PointEnd - ProcessingRec.PointStart + 1;
              ProcessingRec.PointStart := 0; ProcessingRec.PointEnd := ProcessingRec.PointAll - 1;
              ProcessingRec.A0 := 0; ProcessingRec.A1 := 1; ProcessingRec.A2 := 0; ProcessingRec.A3 := 0;
              ProcessingRec.RezType := cRealLong;
              ProcessingRec.Seek_Start := 0;
              if max_Cb.Checked then
              begin
                ProcessingRecMaxX := ProcessingRec;
                for i := ProcessingRecMaxX.PointStart to ProcessingRecMaxX.PointEnd do
                begin
                  GetRezFromFile(FileSource, i,
                    ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                    Status, ProcoldRec.Seek_start);
                  Rez := Rez1;
                  if i = ProcessingRecMaxX.PointStart then
                  begin
                    ProcessingRecMaxX.MinY := Rez; ProcessingRecMaxX.MaxY := Rez;
                  end else
                  begin
                    if ProcessingRecMaxX.MaxY < Rez then ProcessingRecMaxX.MaxY := Rez;
                    if ProcessingRecMaxX.MinY > Rez then ProcessingRecMaxX.MinY := Rez;
                  end;
                  FileDest.Write(Rez, SizeOf(Rez));
                  inc(PointVsego);
                  if ((PointVsego mod 3000) = 0) then
                  begin
                    Gauge1.Progress := PointVsego;
                    Application.ProcessMessages;
                    if not bMessage then break;
                  end;
                end; {i}
              end; {Max_CB.Checked}
              if min_Cb.Checked then
              begin
                ProcessingRecMinx := ProcessingRec;
                ProcessingRecMinx.seek_Start := PointVsego * SizeOf(RezOld);
                for i := ProcessingRecMinX.PointStart to ProcessingRecMinX.PointEnd do
                begin
                  GetRezFromFile(FileSource, i,
                    ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                    Status, ProcoldRec.Seek_start);
                  Rez := Rez1;
                  if i = ProcessingRecMinX.PointStart then
                  begin
                    ProcessingRecMinX.MinY := Rez; ProcessingRecMinX.MaxY := Rez;
                  end else
                  begin
                    if ProcessingRecMinX.MaxY < Rez then ProcessingRecMinX.MaxY := Rez;
                    if ProcessingRecMinX.MinY > Rez then ProcessingRecMinX.MinY := Rez;
                  end;
                  FileDest.Write(Rez, SizeOf(Rez));
                  inc(PointVsego);
                  if ((PointVsego mod 3000) = 0) then
                  begin
                    Gauge1.Progress := PointVsego;
                    Gauge1.Update; Application.ProcessMessages;
                    if not bMessage then break;
                  end;
                end; {i}
              end; {Min_CB.Checked}
              if mx_Cb.Checked then
              begin
                ProcessingRecMx := ProcessingRec;
                ProcessingRecMx.seek_Start := PointVsego * SizeOf(RezOld);
                for i := ProcessingRecMX.PointStart to ProcessingRecMX.PointEnd do
                begin
                  GetRezFromFile(FileSource, i,
                    ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                    Status, ProcoldRec.Seek_start);
                  Rez := Rez1;
                  if i = ProcessingRecMX.PointStart then
                  begin
                    ProcessingRecMX.MinY := Rez; ProcessingRecMX.MaxY := Rez;
                  end else
                  begin
                    if ProcessingRecMX.MaxY < Rez then ProcessingRecMX.MaxY := Rez;
                    if ProcessingRecMX.MinY > Rez then ProcessingRecMX.MinY := Rez;
                  end;
                  FileDest.Write(Rez, SizeOf(Rez));
                  inc(PointVsego);
                  if ((PointVsego mod 3000) = 0) then
                  begin
                    Gauge1.Progress := PointVsego;
                    Gauge1.Update; Application.ProcessMessages;
                    if not bMessage then break;
                  end;
                end; {i}
              end; {Mx_CB.Checked}
//        FileDest.Close;
              FileDest.Destroy;
            end {cRezCurve=1}
            else
            begin
              FileDestRead := TBufferedFile.Create(ProcessingRec.FiledatDest, 4096);
              FileDestRead.Reset;
              FileDestWrite := TBufferedFile.Create(ProcessingRec.FiledatDest, 4096);
              FileDestWrite.Reset;
              PointVsego := 0;
              if max_Cb.Checked then
              begin
                for i := ProcessingRecMaxX.PointStart to ProcessingRecMaxX.PointEnd do
                begin
                  GetRezFromFile(FileSource, i,
                    ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                    Status, ProcoldRec.Seek_start);
                  FileDestRead.Read(RezOld, sizeof(RezOld), BytesRead);
                  Rez := Rez1;
                  if RezOld > Rez then Rez := RezOld;
                  if ProcessingRecMaxX.MaxY < Rez then ProcessingRecMaxX.MaxY := Rez;
                  if ProcessingRecMaxX.MinY > Rez then ProcessingRecMaxX.MinY := Rez;
                  FileDestWrite.Write(Rez, SizeOf(Rez), BytesWrote);
                  inc(PointVsego);
                  if ((PointVsego mod 3000) = 0) then
                  begin
                    Gauge1.Progress := PointVsego;
                    Gauge1.Update; Application.ProcessMessages;
                    if not bMessage then break;
                  end;
                end; {i}
              end; {Max_CB.Checked}
              if min_Cb.Checked then
              begin
                for i := ProcessingRecMinX.PointStart to ProcessingRecMinX.PointEnd do
                begin
                  GetRezFromFile(FileSource, i,
                    ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                    Status, ProcoldRec.Seek_start);
                  FileDestRead.Read(RezOld, sizeof(RezOld), BytesRead);
                  Rez := Rez1;
                  if RezOld < Rez then Rez := RezOld;
                  if ProcessingRecMinX.MaxY < Rez then ProcessingRecMinX.MaxY := Rez;
                  if ProcessingRecMinX.MinY > Rez then ProcessingRecMinX.MinY := Rez;
                  FileDestWrite.Write(Rez, SizeOf(Rez), BytesWrote);
                  inc(PointVsego);
                  if ((PointVsego mod 3000) = 0) then
                  begin
                    Gauge1.Progress := PointVsego;
                    Application.ProcessMessages;
                    if not bMessage then break;
                  end;
                end; {i}
              end; {Min_CB.Checked}
              if mx_Cb.Checked then
              begin
                for i := ProcessingRecMx.PointStart to ProcessingRecMx.PointEnd do
                begin
                  GetRezFromFile(FileSource, i,
                    ProcOldRec.A0, ProcOldRec.A1, ProcOldRec.A2, ProcOldRec.A3, ProcOldRec.RezType, Rez1,
                    Status, ProcoldRec.Seek_start);
                  FileDestRead.Read(RezOld, sizeof(RezOld), BytesRead);
                  Rez := Rez1;
                  Rez := (RezOld * (cRezCurve - 1) + Rez1) / cRezCurve;
                  if ProcessingRecMx.MaxY < Rez then ProcessingRecMx.MaxY := Rez;
                  if ProcessingRecMx.MinY > Rez then ProcessingRecMx.MinY := Rez;
                  FileDestWrite.Write(Rez, SizeOf(Rez), BytesWrote);
                  inc(PointVsego);
                  if ((PointVsego mod 3000) = 0) then
                  begin
                    Gauge1.Progress := PointVsego;
                    Application.ProcessMessages;
                    if not bMessage then break;
                  end;
                end; {i}
              end; {Mx_CB.Checked}
              FileDestRead.Close; FileDestRead.Destroy;
              FileDestWrite.Close; FileDestWrite.Destroy;
            end; {else cRezCurve=1}
          end; {8}
      end; {Case PageIndex}
      if FileSource <> nil then
      begin
        FileSource.Close; FileSource.Destroy; FileSource := nil;
      end;
{ FileDest.Close;    FileDest.Destroy;}
      if SelectFunc.TabIndex = 6 then
      begin
        ProcessingRec.PointEnd := ProcessingRec.PointStart + NPoint;
        bOgran := false;
      end;
      ProcessingRec.DateTimeStart := ProcessingRec.DateTimeStart + ProcessingRec.DeltX * ProcessingRec.PointStart / (24 * 3600);
      ProcessingRec.PointAll := ProcessingRec.PointEnd - ProcessingRec.PointStart + 1;
      ProcessingRec.PointStart := 0; ProcessingRec.PointEnd := ProcessingRec.PointAll - 1;
      ProcessingRec.A0 := 0; ProcessingRec.A1 := 1; ProcessingRec.A2 := 0; ProcessingRec.A3 := 0;
      ProcessingRec.RezType := cRealLong;
{  ProcessingRec.Seek_Start:=0;}
      if SelectFunc.TabIndex <> 8 then
        FileProcRec.Write(ProcessingRec, SizeOf(TSourceRec));
      inc(ReturnRec.NSignal);
    end;
    if (SelectFunc.TabIndex <> 8) then
    begin
//     FileDest.Close;
      if filedest<>nil then  FileDest.Destroy;
      FiledEst := nil;
    end;

  end; {cCurve}
  if FileText_Name <> '' then CloseFile(FileText);
  closeFile(FF1);
  if SelectFunc.TabIndex = 8 then
  begin
    ReturnRec.NSignal := 0;
    if Max_CB.Checked then
    begin
      ProcessingRecMaxX.NameY := 'Max';
      ProcessingRecMaxX.TekColor := clBlue;
      FileProcRec.Write(ProcessingRecMaxX, SizeOf(TSourceRec));
      inc(ReturnRec.NSignal);
    end;
    if Min_CB.Checked then
    begin
      ProcessingRecMinX.NameY := 'Min';
      ProcessingRecMinX.TekColor := clGreen;
      FileProcRec.Write(ProcessingRecMinX, SizeOf(TSourceRec));
      inc(ReturnRec.NSignal);
    end;
    if Max_CB.Checked then
    begin
      ProcessingRecMX.NameY := 'Mx';
      ProcessingRecMX.TekColor := clRed;
      FileProcRec.Write(ProcessingRecMx, SizeOf(TSourceRec));
      inc(ReturnRec.NSignal);
    end;
  end;
// FileProcRec.Close;
  FileProcRec.Destroy;
  if bMessage then
  begin
    assignFile(RetFile, ReturnFileName);
    Rewrite(RetFile); write(RetFile, ReturnRec);
    CloseFile(retFile);
    PostMessage(App_Source_Handle, wm_EndProcessing_Gl_2004, Source_Handle, 0);
  end;

end;

procedure TFuncDialog.ButtonCancelClick(Sender: TObject);
begin
  if bMessage then bMessage := False else close;
end;

procedure TFuncDialog.ButtonOKClick(Sender: TObject);
var FF: file of tFuncPar;
begin
  if ((SelectFunc.TabIndex = 7) and (ShowWin.ItemIndex <> 0))
    then
  begin
    if visible then MessageDlg('Обработка должна отображаться в новом окне', mtError, [mbOk], 0);
    exit;
  end;
  if ((SelectFunc.TabIndex = 8) and
    (not (Max_Cb.Checked or Min_CB.Checked or MX_CB.Checked)))
    then
  begin
    MessageDlg('Должна быть выбрана хотя бы одна характеристика', mtError, [mbOk], 0);
    exit;
  end;

  if Table1.state = dsEdit then Table1.Post;
  FuncPar.ActivePage := SelectFunc.TabIndex;
  FuncPar.C1_edit := StrToFloat(C1_edit.Text);
  FuncPar.c2_eDIT := StrToFloat(c2_edit.Text);
  FuncPar.Sk_Sredn := Sk_Sredn_Spin.Value;
  FuncPar.bskUsr := bSkUsr.Checked;
  FuncPar.bDopZero := bDopZero.Checked;
  FuncPar.Format_S := Format_S_Edit.Text;
  FuncPar.Chisl_Har := Chisl_Har.ItemIndex;
  FuncPar.MinCB := Min_CB.Checked;
  FuncPar.MaxCB := Max_CB.Checked;
  FuncPar.MxCB := Mx_CB.Checked;
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
  ReturnRec.PartAll := Table1PartAll.Value;
  ReturnRec.SelectSignal := Table1SelectSign.asinteger;
  ReturnRec.Showresult := Table1bShowresul.Value;
  ReturnRec.ShowWin := Table1ShowWin.asinteger;
  if ReturnRec.ShowWin = 2 then ReturnRec.PageName := ProcessingRec.TekPageName
  else ReturnRec.PageName := Table1pageName.Value;
  ReturnRec.HeadWin := Table1HeadWin.Value;
  ReturnRec.ProcRez_Type := cProcrez_is_Signal;
  ReturnRec.FName := ProcessingRec.FName;
  ReturnRec.Parent_Handle := Source_Handle;
  ButtonOk.Enabled := False;
  FuncProc;
  close;
end;


procedure TFuncDialog.PartAllClick(Sender: TObject);
begin
  if ((partAll.ItemIndex = 1) and (ShowWin.ItemIndex = 2))
    then
  begin
    MessageDlg(
      'Обработка части сигнала возможна при отображении результата на новой странице '
      , mtError, [mbOk], 0);
    postMessage(Handle, wm_Setpartall, 0, 0);
  end;
  case partAll.ItemIndex of
    0: bDopZero.Enabled := ProcessingRec.PointAll <= 8192;
    1: begin
        bDopZero.Enabled := (ProcessingRec.PointEnd - ProcessingRec.PointStart) <= 8192;
        Sk_Sredn_Spin.MaxValue := (ProcessingRec.PointEnd - ProcessingRec.PointStart) div 3;
      end;
  end;
  Button1.Enabled := not bDopZero.Enabled;
  Label10.Visible := not bDopZero.Enabled;
end;

procedure TFuncDialog.wmSetPartAll(var Message: TMessage);
begin
  PartAll.ItemIndex := 0;
  PartAll.Update;
end;

procedure TFuncDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  DeleteFile(pchar(Copy_TargetFile));
end;

procedure TFuncDialog.C1_EditExit(Sender: TObject);
begin
  if Table1.state <> dsEdit then Table1.Edit;
  ButtonOK.Enabled := true;
  SelectedSignal.Enabled := ProcessingRec.Auto <> 1;
  case SelectFunc.TabIndex of
    0: begin
        Table1HeadWin.Value := 'F=F-M[f]';
        Table1PageName.Value := 'F=F-M[f]'; ;
      end;
    1: begin
        Table1HeadWin.Value := 'Производная от F';
        Table1PageName.Value := 'Производная от F';
      end;
    2: begin
        Table1HeadWin.Value := 'Интеграл от F';
        Table1PageName.Value := 'Интеграл от F';
      end;
    3: begin
        Table1HeadWin.Value := 'F*' + c1_edit.Text + '+' + c2_Edit.text;
        Table1PageName.Value := 'F=F*' + c1_edit.Text + '+' + c2_Edit.text; ;
      end;
    4: begin
        if bSkUsr.checked then Table1HeadWin.Value := 'Ск.усреднение(' +
          IntToStr(Sk_sredn_Spin.Value) + ')'
        else
        begin
          Table1HeadWin.Value := 'Усреднение(' + IntToStr(Sk_sredn_Spin.Value) + ')';
          if ShowWin.ItemIndex = 2 then ShowWin.ItemIndex := 1;
        end;
        if bSkUsr.checked then Table1PageName.Value :=
          'Ск. усреднение(' + IntToStr(Sk_sredn_Spin.Value) + ')'
        else
        begin
          Table1PageName.Value := 'Усреднение(' + IntToStr(Sk_sredn_Spin.Value) + ')';
          if ShowWin.ItemIndex = 2 then ShowWin.ItemIndex := 1;
        end;
      end;
    5: begin
        Table1HeadWin.Value := 'F=abs(F)';
        Table1PageName.Value := 'F=abs(F)'; ;
      end;
    6: begin
        Table1HeadWin.Value := 'F=Kxx';
        Table1PageName.Value := 'F=Kxx'; ;
      end;
    7: begin
        Table1HeadWin.Value := 'Числовые характеристики';
        Table1PageName.Value := 'Числовые характеристики';
      end;
    8: begin
        Table1HeadWin.Value := 'Межканальная статистика';
        Table1PageName.Value := 'Межканальная статистика';
      end;
  end;
  Table1.Post;
  PartAllClick(nil);
end;

procedure TFuncDialog.bSkUsrClick(Sender: TObject);
begin
  if not bSkUsr.Checked then
  begin
    if ShowWin.ItemIndex = 2 then ShowWin.ItemIndex := 1;
  end;
end;

procedure TFuncDialog.wmStartProcessing(var Message: TMessage);
begin
  ButtonOkClick(nil);
  inherited;
end;

procedure TFuncDialog.FormActivate(Sender: TObject);
begin
  if ProcessingRec.Param = 1 then
    PostMessage(Handle, wm_StartProcessing, 0, 0);
end;

procedure TFuncDialog.Button1Click(Sender: TObject);
begin
  bOgran := true;
end;

end.

