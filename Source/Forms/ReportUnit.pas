unit ReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, xlReport, xlcClasses, DB,
  IBCustomDataSet, IBQuery;

type
{ TReportForm }

  TCustomReportProgress = procedure (AutoMax, AutoProgress: Integer; var Max, Progress: Integer) of object;

  TReportForm = class(TForm)
    Panel1: TPanel;
    CancelBtn: TButton;
    ProgressBar: TProgressBar;
    Label1: TLabel;
    ProgressLabel: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StartLabel: TLabel;
    TimeLabel: TLabel;
    FinishLabel: TLabel;
    ProgressTimer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ProgressTimerTimer(Sender: TObject);
  private
    FCustomProgress: TCustomReportProgress;
    FBreak: Boolean;
    FReport: TxlReport;
    FReportName, FOtherRepFileName: string;
    FStart: TDateTime;
    procedure ReportProgress(Report: TxlReport; const Position, Max: Integer;
      DataSource: TxlDataSource; const RecordCount: Integer);
    procedure ReportBreak(Report: TxlReport; var IsBreak: boolean);
    procedure WMUser(var Msg: TMessage); message WM_USER;
    procedure UpdateTimes;
    procedure HeaderDataSourcesGetDataSourceInfo(DataSource: TxlDataSource;
      var FieldCount: Integer);
    procedure HeaderDataSourcesGetFieldInfo(DataSource: TxlDataSource;
      const FieldIndex: Integer; var FieldName: string;
      var FieldType: TxlDataType);
    procedure HeaderDataSourcesGetRecord(DataSource: TxlDataSource;
      const RecNo: Integer; var Values: OleVariant; var Eof: Boolean);
  public
    class function DoReport(Report: TxlReport; CustomProgress: TCustomReportProgress = nil;
      HeaderInfo: TStrings = nil; const ReportName: string = ''; const OtherRepFileName: string = ''): string;
    class function DoReport2(Report: TxlReport; CustomProgress: TCustomReportProgress;
      const Headers: string; const ReportName: string = ''; const OtherRepFileName: string = ''): string;
    class procedure CleanupReportDir;
  end;

implementation

uses
  DateUtils, MainUnit, DataUnit;

{$R *.dfm}

{ TReportForm }

class function TReportForm.DoReport2(Report: TxlReport; CustomProgress: TCustomReportProgress;
  const Headers: string; const ReportName: string; const OtherRepFileName: string): string;
var
  HeaderInfo: TStrings;
  RangesQuery: TIBQuery;
  NameField: TField;
begin
  RangesQuery := TIBQuery.Create(nil);
  try
    RangesQuery.Transaction := CommonData.ReadTransaction;
    RangesQuery.SQL.Text := 'select NAME from STRING_LIST where (SUBJECT = :SUBJECT) group by NAME';
    RangesQuery.ParamByName('SUBJECT').AsString := Headers;
    RangesQuery.Open;
    try
      NameField := RangesQuery.Fields[0];
      HeaderInfo := TStringList.Create;
      try
        while not RangesQuery.Eof do
        begin
          HeaderInfo.Add(Headers + '=' + NameField.AsString);
          RangesQuery.Next;
        end;
        Result := DoReport(Report, CustomProgress, HeaderInfo, ReportName, OtherRepFileName);
      finally
        HeaderInfo.Free;
      end;
    finally
      RangesQuery.Close;
    end;
  finally
    RangesQuery.Free;
  end;
end;

class function TReportForm.DoReport(Report: TxlReport; CustomProgress: TCustomReportProgress;
  HeaderInfo: TStrings; const ReportName: string; const OtherRepFileName: string): string;
var
  Form: TReportForm;
  xlDataSource: TxlDataSource;
  Query: TIBQuery;
  I: Integer;
  AliasName, InfoName, RangeName: string;
  P, P1: PChar;
  HeaderSources: TList;
begin
  Form := TReportForm.Create(Application);
  try
    Form.FReportName := ReportName;
    Form.FOtherRepFileName := OtherRepFileName;
    Report.OnProgress2 := Form.ReportProgress;
    Report.OnBreak := Form.ReportBreak;
    Form.FReport := Report;
    Form.FCustomProgress := CustomProgress;
    Form.FinishLabel.Caption := '';
    Form.TimeLabel.Caption := '';

    HeaderSources := TList.Create;
    try
      if HeaderInfo <> nil then for I := 0 to HeaderInfo.Count - 1 do
      begin
        AliasName := HeaderInfo.Names[I];
        if AliasName <> 'HeaderQuery' then
        begin
          InfoName := HeaderInfo.ValueFromIndex[I];
          xlDataSource := Report.DataSources.Add;
          HeaderSources.Add(xlDataSource);
          Query := TIBQuery.Create(Form);
          Query.Transaction := CommonData.ReadTransaction;
          xlDataSource.Tag := Integer(Query);

          P := PChar(InfoName);
          P1 := StrScan(P, '@');
          if P1 = nil then RangeName := InfoName else
          begin
            SetString(RangeName, P, P1 - P);
            InfoName := string(P1 + 1);
          end;

          xlDataSource.Alias := RangeName;
          xlDataSource.Range := RangeName;
          Query.SQL.Text := 'select IS_ACTIVE, ITEM, ITEM2 from STRING_LIST where (NAME = :NAME) and (SUBJECT = :SUBJECT) order by ORDER_ID';
          Query.ParamByName('SUBJECT').AsString := AliasName;
          Query.ParamByName('NAME').AsString := InfoName;
          xlDataSource.OnGetDataSourceInfo := Form.HeaderDataSourcesGetDataSourceInfo;
          xlDataSource.OnGetFieldInfo := Form.HeaderDataSourcesGetFieldInfo;
          xlDataSource.OnGetRecord := Form.HeaderDataSourcesGetRecord;
        end;
      end;

      Form.ShowModal;

      for I := 0 to HeaderSources.Count - 1 do TxlDataSource(HeaderSources[I]).Free;
    finally
      HeaderSources.Free;
    end;

    Result := Form.FReportName;
  finally
    Form.Free;
  end;
end;

procedure TReportForm.HeaderDataSourcesGetDataSourceInfo(
  DataSource: TxlDataSource; var FieldCount: Integer);
begin
  FieldCount := 3;
  TIBQuery(DataSource.Tag).Open;
end;

procedure TReportForm.HeaderDataSourcesGetFieldInfo(
  DataSource: TxlDataSource; const FieldIndex: Integer;
  var FieldName: string; var FieldType: TxlDataType);
begin
  FieldName := 'ITEM';
  if FieldIndex > 0 then FieldName := FieldName + IntToStr(FieldIndex);
  FieldType := xdString;
end;

procedure TReportForm.HeaderDataSourcesGetRecord(
  DataSource: TxlDataSource; const RecNo: Integer;
  var Values: OleVariant; var Eof: Boolean);
var
  Query: TIBQuery;
  IsActiveField, ItemField, Item2Field: TField;
begin
  Query := TIBQuery(DataSource.Tag);
  IsActiveField := Query.Fields[0];
  ItemField := Query.Fields[1];
  Item2Field := Query.Fields[2];

  while not Query.Eof and (IsActiveField.AsInteger <> 1) do Query.Next;
  Eof := Query.Eof;

  if not Eof then
  begin
    Values[0] := ItemField.AsString;
    Values[1] := ItemField.AsString;
    Values[2] := Item2Field.AsString;
    Query.Next;
  end;
end;

procedure TReportForm.UpdateTimes;
var
  FCurrent, FExpected: TDateTime;
  Delta: TDateTime;
begin
  FCurrent := Now;
  Delta := FCurrent - FStart;
  if ProgressBar.Position = 0 then FExpected := FCurrent
  else FExpected := FStart + Delta * ProgressBar.Max / ProgressBar.Position;
  FinishLabel.Caption := FormatDateTime('hh:nn:ss', FExpected, MainForm.FormatSettings);
  TimeLabel.Caption := Format('%.2d:%.2d', [MinutesBetween(FStart, FCurrent), SecondsBetween(FStart, FCurrent) mod 60]);
end;

procedure TReportForm.ReportProgress(Report: TxlReport; const Position, Max: Integer;
  DataSource: TxlDataSource; const RecordCount: Integer);
var
  ProgressMax: Integer;
  ProgressPosition: Integer;
begin
  ProgressMax := Max;
  ProgressPosition := Position;
  if Assigned(FCustomProgress) then FCustomProgress(Max, Position, ProgressMax, ProgressPosition);
  ProgressBar.Max := ProgressMax;
  ProgressBar.Position := ProgressPosition;
  UpdateTimes;
  // ProgressTimer.Enabled := True;
  if RecordCount = -1 then ProgressLabel.Caption := ''
  else ProgressLabel.Caption := Format('Обрабатывается запись №%d', [RecordCount]);
  Update;
  Application.ProcessMessages;
end;

procedure TReportForm.ReportBreak(Report: TxlReport; var IsBreak: boolean);
begin
  IsBreak := FBreak;
end;

procedure TReportForm.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_USER, 0, 0);
end;

procedure TReportForm.CancelBtnClick(Sender: TObject);
begin
  FBreak := True;
  CancelBtn.Enabled := False;
end;

procedure TReportForm.WMUser(var Msg: TMessage);
var
  TemplateFileName, ReportFileName, S: string;
  L: Integer;
  ExtReport, SavedTemplateName: string;
begin
  try
    TemplateFileName := MainForm.TemplateDir;

    L := Length(TemplateFileName);
    if (L > 1) and not (TemplateFileName[L] in ['/', '\'])
      then TemplateFileName := TemplateFileName + '\';
    TemplateFileName := TemplateFileName + FReport.XLSTemplate;

    ExtReport := FReportName;
    if FReportName = '' then
    begin
      if FOtherRepFileName<>''
      then ReportFileName := FOtherRepFileName
      else begin
        ReportFileName := MainForm.ReportDir;

        L := Length(ReportFileName);
        if (L > 1) and not (ReportFileName[L] in ['/', '\'])
          then ReportFileName := ReportFileName + '\';

        FReport.TempPath := ReportFileName;
        FReport.Options := FReport.Options + [xroUseTemp];

        ReportFileName := ReportFileName + ChangeFileExt(FReport.XLSTemplate, '');

        while True do
        begin
          S := ReportFileName + '@' + FormatDateTime('yyyymmddhhnnss', Now) + '.xls';
          if not FileExists(S) then
          begin
            ReportFileName := S;
            Break;
          end;
        end;
      end;
      FReportName := ReportFileName;
    end;

    SavedTemplateName := FReport.XLSTemplate;
    FReport.XLSTemplate := TemplateFileName;
    try
      FStart := Now;
      StartLabel.Caption := FormatDateTime('hh:nn:ss', FStart, MainForm.FormatSettings);
      FReport.ReportTo(ExtReport, ReportFileName);
    finally
      FReport.XLSTemplate := SavedTemplateName;
    end;
  finally
    Close;
  end;
end;

procedure TReportForm.ProgressTimerTimer(Sender: TObject);
begin
  UpdateTimes;
  Update;
end;

class procedure TReportForm.CleanupReportDir;
var
  SR: TSearchRec;
  S, S1: string;
  P: PChar;
  D1, D2: Integer;
  Y, M, D: Word;
  L: Integer;
begin
  S1 := MainForm.ReportDir;
  L := Length(S1);
  if (L > 1) and not (S1[L] in ['/', '\']) then S1 := S1 + '\';
  S := S1 + '*.xls';

  FindFirst(S, faAnyFile, SR);
  repeat
    if CompareText(ExtractFileExt(SR.Name), '.xls') = 0 then
    begin
      S := ChangeFileExt(ExtractFileName(SR.Name), '');
      P := StrScan(PChar(S), '@');
      if (P <> nil) and (StrLen(P + 1) = 14) then
      begin
        SetString(S, P + 1, 8);
        D1 := StrToIntDef(S, 0);
        if D1 <> 0 then
        begin
          DecodeDate(Date, Y, M, D);
          D2 := Y * 10000 + M * 100 + D;
          if D1 < D2 then
          begin
            if not DeleteFile(S1 + SR.Name) then { ignore errors here} ;
          end;
        end;
      end;
    end;
  until FindNext(SR) <> 0;
end;

end.
