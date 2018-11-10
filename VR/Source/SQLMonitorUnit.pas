unit SQLMonitorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit, IBSQLMonitor, StdCtrls, ExtCtrls,
  IB;

type
  TSQLMonitor = class(TMaximizedForm)
    Panel1: TPanel;
    chbOnOff: TCheckBox;
    chbStayOnTop: TCheckBox;
    Button1: TButton;
    memoText: TMemo;
    Button2: TButton;
    SaveDialog: TSaveDialog;
    IBSQLMonitor: TIBSQLMonitor;
    GroupBox1: TGroupBox;
    chbFetch: TCheckBox;
    chbPrepare: TCheckBox;
    chbTransaction: TCheckBox;
    procedure chbOnOffClick(Sender: TObject);
    procedure chbStayOnTopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure IBSQLMonitorSQL(EventText: String; EventTime: TDateTime);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure chbFetchClick(Sender: TObject);
    procedure chbPrepareClick(Sender: TObject);
    procedure chbTransactionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure Open;
  end;

var
  SQLMonitor: TSQLMonitor;

implementation

uses Dm_u;

{$R *.dfm}

procedure TSQLMonitor.chbOnOffClick(Sender: TObject);
begin
  inherited;
  IBSQLMonitor.Enabled := chbOnOff.Checked;
  if chbOnOff.Checked then begin
    DM.DB.TraceFlags:=[tfQExecute];
    if chbFetch.checked then  DM.DB.TraceFlags:=DM.DB.TraceFlags +   [tfQFetch];
    if chbPrepare.checked then  DM.DB.TraceFlags:=DM.DB.TraceFlags +   [tfQPrepare];
    if chbTransaction.checked then  DM.DB.TraceFlags:=DM.DB.TraceFlags +   [tfTransact];
   end
   else begin
    DM.DB.TraceFlags:=[];
  end;
  IBSQLMonitor.Enabled:=chbOnOff.Checked;
end;

procedure TSQLMonitor.chbStayOnTopClick(Sender: TObject);
begin
  inherited;
  if chbStayOnTop.Checked then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;

class procedure TSQLMonitor.Open;
begin
  if not Assigned(SQLMonitor) then
    SQLMonitor := TSQLMonitor.Create(Application);
  SQLMonitor.Show;
end;

procedure TSQLMonitor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TSQLMonitor.FormDestroy(Sender: TObject);
begin
  inherited;
  SQLMonitor := nil;
end;

procedure TSQLMonitor.IBSQLMonitorSQL(EventText: String;
  EventTime: TDateTime);
var s:string;
begin
  inherited;
  memoText.Lines.Add('');
  s:=EventText;
  delete(s,1,pos(']',s)+2);
  memoText.Lines.Add(FormatDateTime('HH:mm:ss', Eventtime)+'  '+s);
  //memoText.Update;
end;

procedure TSQLMonitor.Button1Click(Sender: TObject);
begin
  inherited;
 memotext.clear;
end;

procedure TSQLMonitor.Button2Click(Sender: TObject);
begin
  inherited;
 if savedialog.Execute = true then
  begin
   MemoText.lines.SaveToFile(savedialog.filename);
  end;
end;

procedure TSQLMonitor.chbFetchClick(Sender: TObject);
begin
  inherited;
 chbOnOffclick(nil);
end;

procedure TSQLMonitor.chbPrepareClick(Sender: TObject);
begin
  inherited;
 chbOnOffclick(nil);
end;

procedure TSQLMonitor.chbTransactionClick(Sender: TObject);
begin
  inherited;
 chbOnOffclick(nil);
end;

end.
