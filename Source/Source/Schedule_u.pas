unit Schedule_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, menu_f, Menus, DB, IBCustomDataSet, IBQuery,dateutils, ExtCtrls,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls, TxFrame, DbGridUnit,
  DBCtrls, Grids, DBGridEh, IBUpdateSQL;

type
  TScheduleForm = class(TMenuForm)
    miRecreateSchedule: TMenuItem;
    N1: TMenuItem;
    schedule: TIBQuery;
    scheduleID: TIntegerField;
    scheduleEKSP_NOMER: TIntegerField;
    scheduleACTION_DATE: TDateTimeField;
    scheduleACTION_MODE: TSmallintField;
    scheduleMAX_VALUE: TFloatField;
    scheduleCURRENT_VALUE: TFloatField;
    scheduleLOG: TIBStringField;
    scheduleEKSP_HEADER: TIBStringField;
    Panel1: TPanel;
    DbGridFrame3: TDbGridFrame;
    ds_schedule: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    D1: TDateTimePicker;
    D2: TDateTimePicker;
    btnShowSchedule: TcxButton;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    N2: TMenuItem;
    N3: TMenuItem;
    scheduleSCH_MODE: TSmallintField;
    Timer1: TTimer;
    cbSchedule: TCheckBox;
    auto_sch: TIBQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    DateTimeField1: TDateTimeField;
    SmallintField1: TSmallintField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    SmallintField2: TSmallintField;
    update_Auto_SCH: TIBUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure miRecreateScheduleClick(Sender: TObject);
    procedure btnShowScheduleClick(Sender: TObject);
    procedure scheduleACTION_MODEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure N3Click(Sender: TObject);
    procedure DbGridFrame3GridGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure cbScheduleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure SaveLog(Msg: string);
   procedure SaveCurrentValue(Current_Value:double);
   procedure SaveMaxValue(Max_Value:double);
  end;

var
  ScheduleForm: TScheduleForm;

implementation

uses DM_dm, config, Main_f, Exp_f, Master_new_u, master2;

{$R *.dfm}

procedure TScheduleForm.FormCreate(Sender: TObject);
begin
  inherited;
  d1.date:=now-30;
  d2.date:=now+7;
end;


procedure TScheduleForm.miRecreateScheduleClick(Sender: TObject);
begin
  inherited;
dm.CreateSchedule;
btnShowScheduleClick(nil);
end;

procedure TScheduleForm.btnShowScheduleClick(Sender: TObject);
begin
  inherited;
 schedule.close;
 Schedule.parambyname('D1').asdatetime:=d1.date;
 Schedule.parambyname('D2').asdatetime:=d2.date;
 schedule.open;
  schedule.fetchall;
  schedule.last;
  schedule.first;
end;

procedure TScheduleForm.scheduleACTION_MODEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  case scheduleACTION_MODE.asinteger of
     0: text:='чтение текущих';
     1: text:='чтение максимальных';
//     2: text:='чтение текущих и максимальных';
     2: text:='чтение архива';
  end;
end;

procedure TScheduleForm.N3Click(Sender: TObject);
begin
  inherited;
  dm.q.SQL.clear;
  dm.q.sql.Add(' delete from schedule where action_date < :D and log is null ');
  dm.q.Parambyname('d').asdatetime:=now;
  dm.q.ExecSQL;
  dm.q.Transaction.CommitRetaining;
  btnShowscheduleclick(nil);
end;

procedure TScheduleForm.DbGridFrame3GridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if  not schedule.FieldByName('Log').isnull then
   begin
    if  schedule.FieldByName('Log').asstring<>'ОК' then AFont.color:=clred;
   end;

  case schedule.FieldByName('Sch_mode').asinteger of
     1: BackGround:=clwhite;
     2: BackGround:=clMoneyGreen;
     3: BackGround:=clCream;
  end;

end;

procedure TScheduleForm.Timer1Timer(Sender: TObject);
begin
  inherited;
  mainform.StatusBar.Panels[0].Text:='автообращения включены';
  mainform.StatusBar.update;
  if auto_sch.Active then exit;
  auto_sch.close;
  auto_sch.ParamByName('d1').asdatetime:=now-5.0/24.0/60.0;
  auto_sch.ParamByName('d2').asdatetime:=now+5.0/24.0/60.0;
  auto_sch.open;
  while not auto_sch.eof do
   begin
    if auto_sch.fieldbyname('action_date').asdatetime<=now then
    begin
      ExpForm.eksps.locate( 'eksp_nomer',auto_sch.fieldbyname('eksp_nomer').AsInteger,[]);
      ExpForm.inSchedulemode:=true;
      ExpForm.btnLoadInfoFromDeviceclick(mainform.btnLoadInfoFromDevice);
      if MasterNewForm<>nil then
       begin
        case auto_sch.fieldbyname('action_mode').asinteger of
         0: masternewform.btnIdentClick(masternewform.btnInst);
         1: masternewform.btnIdentClick(masternewform.btnMax);
         2: masternewform.btnIdentClick(masternewform.btnArch);
        end;
       end;
      if Master2Form<>nil then
       begin
       end;
      ExpForm.inSchedulemode:=false;
    end;
    application.ProcessMessages;
    auto_sch.next;
   end;
  auto_sch.close;
  btnShowScheduleClick(nil); 
end;

procedure TScheduleForm.cbScheduleClick(Sender: TObject);
begin
  inherited;
 timer1.Enabled:=cbSchedule.Checked;
 if timer1.Enabled then  mainform.StatusBar.Panels[0].Text:='автообращения включены'
  else  mainform.StatusBar.Panels[0].Text:='автообращения отключены';
 mainform.StatusBar.update;
end;

procedure TScheduleForm.SaveLog(Msg: string);
begin
 auto_sch.edit;
 auto_sch.fieldbyname('log').asstring:=Msg;
 auto_sch.post;
 auto_sch.transaction.CommitRetaining;
end;

procedure TScheduleForm.SaveCurrentValue(Current_Value:double);
begin
 auto_sch.edit;
 auto_sch.fieldbyname('log').asstring:='ОК';
 auto_sch.fieldbyname('Current_Value').value:=Current_Value;
 auto_sch.post;
 auto_sch.transaction.CommitRetaining;
end;

procedure TScheduleForm.SaveMaxValue(Max_Value:double);
begin
 auto_sch.edit;
 auto_sch.fieldbyname('log').asstring:='ОК';
 auto_sch.fieldbyname('Max_Value').Value:=Max_Value;
 auto_sch.post;
 auto_sch.transaction.CommitRetaining;
end;

end.
