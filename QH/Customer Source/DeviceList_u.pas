unit DeviceList_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit, Menus, TxFrame, DbGridUnit, ExtCtrls, DB, MemDS,
  VirtualTable, StdCtrls, ShellAPI,DBGridEh,  DBCtrlsEh, Grids;

type
  TDeviceListForm = class(TMaximizedForm)
    pnl1: TPanel;
    GridFrame: TDbGridFrame;
    dsDS_VT: TDataSource;
    VT: TVirtualTable;
    mm1: TMainMenu;
    N1: TMenuItem;
    VTID: TIntegerField;
    VTNAME: TStringField;
    VTDEVICENUMBER: TStringField;
    VTTYPEDEVICE_ID: TIntegerField;
    VTCREATE_DATE: TDateField;
    VTSALE_DATE: TDateField;
    VTCUSTOMER: TStringField;
    VTDESCR: TStringField;
    VTID_CONVERTER: TIntegerField;
    VTLOCKED: TSmallintField;
    VTDEVICETYPENAME: TStringField;
    VTCONVERTERNAME: TStringField;
    VTCALCMODE: TStringField;
    VTVT_X_UNIT: TStringField;
    VTVT_X_NAME: TStringField;
    VTVT_X_SHORTNAME: TStringField;
    VTVT_Y_UNIT: TStringField;
    VTVT_Y_NAME: TStringField;
    VTVT_Y_SHORTNAME: TStringField;
    VTFORMULA: TStringField;
    VTDEVICE_PARENT_ID: TIntegerField;
    VTPARENTDEVICENUMBER: TStringField;
    VTPARAMS_ARE_BAD: TSmallintField;
    VTCOMPOSITION_CURRENT: TSmallintField;
    VTCOMPOSITION_RS: TSmallintField;
    VTCOMPOSITION_LEVEL: TSmallintField;
    VTCOMPOSITION_IR_PORT: TSmallintField;
    VTCOMPOSITION_DEVICETYPE: TSmallintField;
    VTCOMPOSITION_IMP_OUT: TSmallintField;
    VTTABLE_CODE: TSmallintField;
    VTRECORD_DATE: TDateTimeField;
    VTNEED_RECALC: TSmallintField;
    VTNEED_TBL: TSmallintField;
    VTtblfile: TStringField;
    VTxlsfile: TStringField;
    btn1: TButton;
    btn2: TButton;
    btn4: TButton;
    N2: TMenuItem;
    miDeleteAll: TMenuItem;
    N3: TMenuItem;
    miDeleteDevice: TMenuItem;
    N4: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure VTCalcFields(DataSet: TDataSet);
    procedure VTCOMPOSITION_DEVICETYPEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure VTNAMEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure VTBeforeDelete(DataSet: TDataSet);
    procedure btn2Click(Sender: TObject);
    procedure GridFrameGridGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure btnDeleteDeviceClick(Sender: TObject);
    procedure btnDeleteAllDeviceClick(Sender: TObject);
    procedure GridFrameGridDblClick(Sender: TObject);
    procedure miDeleteAllClick(Sender: TObject);
  private
    { Private declarations }
    bneedRefresh:Boolean;
  public
    { Public declarations }
  end;

var
  DeviceListForm: TDeviceListForm;

implementation

uses device_u, dm_u;

{$R *.dfm}

procedure TDeviceListForm.N1Click(Sender: TObject);
begin
  inherited;
 close;
end;

procedure TDeviceListForm.VTCalcFields(DataSet: TDataSet);
var FName, FullName: string;
begin
  if VT.fieldbyname('name').asstring='Расходомер' then
    FUllName:=extractfiledir(Application.exename)+'\xls\Расходомер_'+VT.fieldbyname('deviceNumber').asstring+'.xls'
    else
     if VT.fieldbyname('name').asstring='Уровнемер' then
      FullName:=extractfiledir(Application.exename)+'\xls\Уровнемер_'+VT.fieldbyname('deviceNumber').asstring+'.xls'
       else
          FullName:= extractfiledir(Application.exename)+'\xls\'+VT.fieldbyname('name').asstring+'_'+VT.fieldbyname('deviceNumber').asstring+'.xls';
 Fname:=Fullname;
 if fileexists(FullName) then
  begin
   delete(FullName,1, length(extractfiledir(Application.exename)+'\XLS\'));
   VT.FieldByName('xlsFile').asstring:=FullName;
  end
   else VT.FieldByName('xlsFile').asstring:='';

end;

procedure TDeviceListForm.VTCOMPOSITION_DEVICETYPEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if VT.recordcount=0 then text:='' else
 case   VTCOMPOSITION_DEVICETYPE.asinteger of
  0: text:='ЭХО-Р';
  1: text:='ЭХО-АС';
 end;
end;

procedure TDeviceListForm.VTNAMEGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if VT.recordcount=0 then text:='' else
if not VT.FieldByName('device_parent_id').isnull then
  text:='(клон)'+VT.fieldbyname('Name').asstring
   else   text:=VT.fieldbyname('Name').asstring;
end;

procedure TDeviceListForm.btn1Click(Sender: TObject);
begin
  inherited;
  VT.First;
  while not VT.Eof do
   begin
     DeleteFile(ExtractFilePath(Application.exename)+'\Devicelist\'+VT.fieldbyname('tblFile').AsString);
     DeleteFile(ExtractFilePath(Application.exename)+'\Devicelist\'+VT.fieldbyname('xlsFile').AsString);
     VT.Next;
   end;
 VT.clear;
end;

procedure TDeviceListForm.btn4Click(Sender: TObject);
begin
  inherited;
   if VT.recordcount>0  then VT.Delete;
end;




procedure TDeviceListForm.VTBeforeDelete(DataSet: TDataSet);
begin
  inherited;
 DeleteFile(ExtractFilePath(Application.exename)+'\Devicelist\'+VT.fieldbyname('tblFile').AsString);
 DeleteFile(ExtractFilePath(Application.exename)+'\Devicelist\'+VT.fieldbyname('xlsFile').AsString);
end;

procedure TDeviceListForm.btn2Click(Sender: TObject);
begin
  inherited;
 shellexecute(Handle,nil,PChar(ExtractFilePath(Application.exename)+'\Devicelist'),nil,nil,SW_SHOWNORMAL);
end;

procedure TDeviceListForm.GridFrameGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
 if VT.FieldByName('Locked').asinteger=1 then Afont.Style:=[fsBold];
end;

procedure TDeviceListForm.btnDeleteDeviceClick(Sender: TObject);
begin
  inherited;
 if VT.FieldByName('Locked').asinteger=1 then
  begin
   ShowMessage('Прибор c номером "' +VT.Fieldbyname('DeviceNumber').asstring+'" (код записи в архиве '+VT.fieldbyname('ID').asstring +') заблокирован. Удалить заблокированный прибор нельзя.');
   exit;
  end;
 if (Sender=miDeleteAll) then
  begin
    if Device_Form.q_devices.Locate('ID', VT.fieldbyname('ID').asinteger,[]) then
                 begin
                  Device_Form.q_devices.delete;
                  end
                  else
                  begin
                    if not DM.q.Transaction.InTransaction then DM.q.Transaction.StartTransaction;
                    DM.q.Close;
                    DM.q.SQL.Text:='delete from devices  where id  = :ID ';
                    DM.q.ParamByName('ID').asinteger:=VT.fieldbyname('ID').AsInteger;
                    DM.q.ExecQuery;
                    DM.q.Transaction.CommitRetaining;
                    bNeedRefresh:=True;
                  end;
   DeleteFile(ExtractFilePath(Application.exename)+'\tbl\'+VT.fieldbyname('tblFile').AsString);
   DeleteFile(ExtractFilePath(Application.exename)+'\xls\'+VT.fieldbyname('xlsFile').AsString);
   VT.delete;
  end
 else
 begin
  if application.MessageBox( pansiChar( 'ВНИМАНИЕ!!!! Операция удаления прибора из архива необратима. '+
  'Вы действительно хотите удалить из архива информацию о приборе "'+
                VT.fieldbyname('DeviceNumber').asstring+ '" (код записи в архиве '+VT.fieldbyname('ID').asstring +
                ') и связанных с ним tbl- и xls-файлах?'),
                  pchar(msg_warning), MB_YESNO or MB_ICONQUESTION) = idYes
            then
             begin
              if Device_Form.q_devices.Locate('ID', VT.fieldbyname('ID').asinteger,[]) then
                 begin
                   Device_Form.q_devices.delete;
                  end
                  else
                  begin
                    if not DM.q.Transaction.InTransaction then DM.q.Transaction.StartTransaction;
                    DM.q.Close;
                    DM.q.SQL.Text:='delete from devices  where id  = :ID ';
                    DM.q.ParamByName('ID').asinteger:=VT.fieldbyname('ID').AsInteger;
                    DM.q.ExecQuery;
                    DM.q.Transaction.CommitRetaining;
                    bNeedRefresh:=True;
                  end;
              DeleteFile(ExtractFilePath(Application.exename)+'\tbl\'+VT.fieldbyname('tblFile').AsString);
              DeleteFile(ExtractFilePath(Application.exename)+'\xls\'+VT.fieldbyname('xlsFile').AsString);
              VT.delete;
             end
  end;
 end;

procedure TDeviceListForm.btnDeleteAllDeviceClick(Sender: TObject);
begin
  inherited;
  if application.MessageBox( pansiChar( 'ВНИМАНИЕ!!!! Операция удаления приборов из архива необратима. '+
  ' Вы действительно хотите удалить из архива информацию о содержащихся в списке приборах и связанных с ними tbl- и xls-файлах?'),
                  pchar(msg_warning), MB_YESNO or MB_ICONQUESTION) = idYes
                   then
                   begin
                     BneedRefresh:=False;
                    VT.Last;
                    while not VT.Bof do
                     begin
                      if VT.FieldByName('Locked').asinteger=1  then VT.prior
                       else btnDeleteDeviceClick(miDeleteAll);
                     end;
                   if VT.recordcount>0 then
                    ShowMessage('В списке остались только заблокированные приборы');
                   if bneedRefresh then Device_Form.q_devices.Refresh;
                   end;
end;

procedure TDeviceListForm.GridFrameGridDblClick(Sender: TObject);
begin
  inherited;
//  GridFrame.GridDblClick(Sender);
  Device_Form.q_devices.Locate('ID', VT.fieldbyname('ID').AsInteger,[])
end;

procedure TDeviceListForm.miDeleteAllClick(Sender: TObject);
begin
  inherited;
  btnDeleteAllDeviceClick(miDeleteAll);
end;

end.
