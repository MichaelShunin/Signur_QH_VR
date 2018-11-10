unit ProcessWait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  ExtCtrls,ComCtrls, ActnList,  xlReport;

type
  TProcessWaitForm = class(TForm)
    Panel5: TPanel;
    TopPanel: TPanel;
    lblComment: TLabel;
    Animate: TAnimate;
    pnlProgress: TPanel;
    ProgressBar: TProgressBar;
    lblProcessName: TLabel;
    procedure TaxxiFormCreate(Sender: TObject);
  private
    procedure SetProcessName(const Value: string);
    { Private declarations }
  public
    procedure xlReportProgress(Report: TxlReport; const Position,
      Max: Integer);
    procedure xlReportProgress2(Report: TxlReport; const Position,
      Max: Integer; DataSource: TxlDataSource; const RecordCount: Integer);
    class function CreateAndShowWaitForm(AProcessName: string; AProgressVisible: boolean = False;
  AOwner: TComponent = nil; AParent: TWinControl = nil): TProcessWaitForm;
  public
    { Public declarations }
    procedure SetPos(APercentPos: double);
    property ProcessName: string write SetProcessName;
  end;

implementation
const
  sPleaseProccesWait = 'Подождите,  идет  процесс...';  

{$R *.dfm}

{ TProcessWaitForm }

procedure TProcessWaitForm.SetPos(APercentPos: double);
begin
  ProgressBar.Position := Round(ProgressBar.Max * APercentPos/100);
  Self.Update; 
end;

procedure TProcessWaitForm.SetProcessName(const Value: string);
begin
  lblProcessName.Caption := Value;
  Self.Update; 
end;

procedure TProcessWaitForm.xlReportProgress(Report: TxlReport;
  const Position, Max: Integer);
begin
  SetPos((Position*1.0)/(Max*1.0) * 100.0);
end;

procedure TProcessWaitForm.xlReportProgress2(Report: TxlReport;
  const Position, Max: Integer; DataSource: TxlDataSource;
  const RecordCount: Integer);
begin

end;

procedure TProcessWaitForm.TaxxiFormCreate(Sender: TObject);
begin
  inherited;
  lblComment.Caption := sPleaseProccesWait;
end;

class function TProcessWaitForm.CreateAndShowWaitForm(AProcessName: string; AProgressVisible: boolean = False;
  AOwner: TComponent = nil; AParent: TWinControl = nil): TProcessWaitForm;
begin
  Result := TProcessWaitForm.Create(AOwner);
  with Result do begin
//    if Assigned(AParent) then begin
//      FormStyle := fsNormal;
//      Parent := AParent;
//      Align := alTop;
//    end
//    else begin
//      FormStyle := fsStayOnTop;
//    end;
    ProcessName := AProcessName;
    pnlProgress.Visible := AProgressVisible;
    Show;
  end;
  Application.ProcessMessages;
end;

end.
