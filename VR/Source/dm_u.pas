unit dm_u;

interface

uses
  windows,forms,SysUtils, Classes, DB, IBDatabase, IBSQL, IBCustomDataSet,
  ImgList, Controls, IBStoredProc,tvc_u, IBTable, IBQuery,
  Graphics,Jpeg, utils;

const
 QUEST_DeleteCalc = 'Вы действительно хотите удалить информацию о приборе "%s"?';
 QUEST_CloseProgram = 'Вы действительно хотите  закончить работу с программой?';

{ QUEST_DeleteFunction = 'Вы действительно хотите удалить функцию %s (область обработки %s)?';
 QUEST_DeleteObject = 'Вы действительно хотите удалить информацию об объекте %s ?';
 QUEST_DeleteObjectType = 'Вы действительно хотите удалить информацию о типе объекта %s ?';
 QUEST_DeleteEksp = 'Вы действительно хотите удалить информацию об испытании  %s и всех связанных с ним результатах?';
 QUEST_DeleteStandard =  'Вы действительно хотите удалить информацию об уставке  %s ?';
 QUEST_DeleteProtocolType =  'Вы действительно хотите удалить информацию о типе протокола  %s ?';
 QUEST_DeleteProtocol = 'Вы действительно хотите удалить из архива протокол  %s ?';

 QUEST_DeleteAllEksp = 'Вы действительно хотите удалить из архива все показанные испытания ?';
}
 Msg_Warning = 'Предупреждение';

type

  TDM = class(TDataModule)
    DB: TIBDatabase;
    tranDefault: TIBTransaction;
    ImageList1: TImageList;
    ImageList2: TImageList;
    q: TIBSQL;
    ImageList3: TImageList;
    CLONENEWCALC: TIBStoredProc;
    qw: TIBQuery;
    clonedevice: TIBStoredProc;
    PARENTREPLACE: TIBStoredProc;
    SET_NEEDRECALC: TIBStoredProc;
    SET_NEEDTBL: TIBStoredProc;
    AnyQuery: TIBQuery;
    CHANGEDEVICETYPE: TIBStoredProc;
    ADDPOINT_TO_QH: TIBStoredProc;
    DELETEPOINT_FROM_QH: TIBStoredProc;
    copydevice: TIBStoredProc;
    CREATENEWDEVICE: TIBStoredProc;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
      FSelectCount: Integer;
  public
    { Public declarations }
    resultConnection:string;
      Excel_Ext:string;
 procedure GetStringsFromQuery(IBSQL: TIBSQL; Strings: TStrings; const StringField, ObjectField: string);
 procedure GetName_IDStringsFromQuery(IBSQL: TIBSQL; SQL:string;Strings: TStrings; const StringField, ObjectField: string);
 procedure ConnectToDatabase;
 procedure LinkDataModule(DataModule: TDataModule);
 procedure CheckTransaction;
 procedure RestartTransaction;
 procedure OnAppException(Sender: TObject; E: Exception);
 Function connection:string;
 procedure GetStringsFromIBSQL(IBSQL: TIBSQL; Strings: TStrings; const  SQL_TXT, StringField:string);
 procedure GetStringsFromIBSQLParam1(IBSQL: TIBSQL; Strings: TStrings; const  SQL_TXT, StringField,param1:string);
 Procedure GetActiveDevices;
 Procedure GetEksp(E_id:integer);
 function GetUniqueName(RootPath,extNamewithdot: string): string;
 Function ConvertBmpToJpeg(fname:string):boolean;
 Function GetDeviceNumber:string;
 Function CheckNotUniqDeviceNumber(NewDeviceNumber:string;Name:string):boolean;
 Function CheckNotUniqDeviceNumber1(NewDeviceNumber:string;Name:string; Id_device:integer):boolean;
 Function CheckNeedRecalc(Id_device:integer):boolean;
 Function CheckNeedTbl(Id_device:integer):boolean;
 Function CheckNeedTbl_New(Q_device:TIBQuery):boolean;
 Function CheckNeedREcalc_New(Q_device:TIBQuery):boolean;
 Procedure needTbl(status:integer; id:integer);
 Procedure needRecalc(status:integer; id:integer);
 Function Get_Table_Code(Id_converter:integer):integer;
end;

var
  DM: TDM;
  help_URL:string;
  Path_ReportFile:string;
  ReportURL_Home:string;
  Import_root:string;
  MaxCol_Input:integer;
  MaxLine_Input:integer;
  InputFileName:string;
  OutputFileName:string;
  FortranExeName:string;
implementation

uses config,main_u;

{$R *.dfm}

procedure TDM.OnAppException(Sender: TObject; E: Exception);
begin
{$IFDEF DEBUG}
  DebugMessage('EXCEPTION!!!: ' + E.Message);
{$ENDIF}
end;

procedure TDM.GetName_IDStringsFromQuery(IBSQL: TIBSQL; SQL:string;Strings: TStrings; const StringField, ObjectField: string);
begin
  CheckTransaction;
  if IBSQL.Open then IBSQL.Close;
  IBSQL.SQL.text:=sql;
  with IBSQL, Strings do
  begin
    Clear;
    if Open then Close;
    ExecQuery;
    while not Eof do
    begin
      AddObject(Trim(FieldByName(StringField).AsString),
        TObject(FieldByName(ObjectField).AsInteger));
      Next;
    end;
  end;
end;

procedure TDM.GetStringsFromQuery(IBSQL: TIBSQL; Strings: TStrings; const StringField, ObjectField: string);
begin
  CheckTransaction;
  if IBSQL.Open then IBSQL.Close;
  with IBSQL, Strings do
  begin
    Clear;
    if Open then Close;
    ExecQuery;
    while not Eof do
    begin
      AddObject(Trim(FieldByName(StringField).AsString),
        TObject(FieldByName(ObjectField).AsInteger));
      Next;
    end;
  end;
end;






procedure TDM.ConnectToDatabase;
begin
  if not db.Connected then
  begin
    db.Connected := True;
{$IFDEF DEBUG}
  DebugMessage('Database connected');
{$ENDIF}
  end;

 // exit;

  if not tranDefault.Active then
  begin
    ReStartTransaction;
  {$IFDEF DEBUG}
    DebugMessage('Transaction started');
  {$ENDIF}
  end;
end;

procedure TDM.LinkDataModule(DataModule: TDataModule);
var
  i: Integer;
begin
  with DataModule do
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TIBCustomDataset then
      with (Components[i] as TIBCustomDataset) do
      begin
        Transaction := tranDefault;
        Database := db;
      end;
      if Components[i] is TIBSQL then
      with (Components[i] as TIBSQL) do
      begin
        Transaction := tranDefault;
        Database := db;
      end;
    end;
end;

procedure TDM.CheckTransaction;
begin
  inc(FSelectCount);
  if FSelectCount > MAX_SELECT_IN_TRANSACTION then
  begin
    RestartTransaction;
    FSelectCount := 0;
  end;
end;

procedure TDM.RestartTransaction;
begin

  if DM.tranDefault.active then DM.tranDefault.Commit;
  DM.tranDefault.StartTransaction;
  FSelectCount := 0;

end;

procedure TDM.DataModuleCreate(Sender: TObject);
const
  DB_SECTION = 'DB.ARM';
begin
{$IFDEF DEBUG}
  DebugMessage('On datamodule create event started');
{$ENDIF}
  Application.OnException := OnAppException;
  with db, TConfigurationManager.GetInstance.IniFile do
  begin
    if Connected then Connected := False;
    Help_URL:=ReadString('HELP','URL','help.htm');
//   db.DatabaseName := extractfilepath(application.exename)+'db\QH.gdb';//ReadString(DB_SECTION, 'DB', '');
   db.DatabaseName := changesymbol('127.0.0.1:'+extractfilepath(application.exename)+'db\VR.gdb','\','/');
   Import_Root:=   ReadString('Import','Root' , GetCurrentDir);

   Excel_Ext:=ReadString('Excel','ext','.--xls');
{$IFDEF DEBUG}
    DebugMessage('Database name is: ' +  DatabaseName);
{$ENDIF}
    Params.Clear;
    Params.Add('user_name=SYSDBA');// + ReadString(DB_SECTION, 'Username', ''));
    Params.Add('password=masterkey');// + ReadString(DB_SECTION, 'password', ''));
    Params.Add('lc_ctype=WIN1251');
{$IFDEF DEBUG}
    DebugMessage('Params is: ' + Params.Text);
{$ENDIF}
 end;
  resultconnection:=connection;
end;

Function TDM.connection:string;
begin
try
result:='';
if not DB.connected then
  begin
   ConnectToDatabase;
 //  Settings.Close;
 //  Settings.Open;
 //  Settings.Close;
  end;
 except on E: Exception do
           result:='Ошибка при соединении с базой данных. Проверьте корректность пути к базе данных в ini-файле и наличия работающего сервера базы данных. ' +E.Message;
end;
end;

procedure TDM.GetStringsFromIBSQL(IBSQL: TIBSQL; Strings: TStrings; const  SQL_TXT, StringField:string);
begin
  CheckTransaction;
  with IBSQL, Strings do
  begin
    Clear;
    if Open then Close;
    sql.clear;
    sql.add(sql_TXT);
    ExecQuery;
    while not Eof do
    begin
      Add((FieldByName(StringField).AsString));
      Next;
    end;
  end;
end;

procedure TDM.GetStringsFromIBSQLParam1(IBSQL: TIBSQL; Strings: TStrings; const  SQL_TXT, StringField,Param1:string);
begin
  CheckTransaction;
  with IBSQL, Strings do
  begin
    Clear;
    if Open then Close;
    sql.clear;
    sql.add(sql_TXT);
    params[0].value:=param1;
    ExecQuery;
    while not Eof do
    begin
      Add((FieldByName(StringField).AsString));
      Next;
    end;
  end;
end;


Procedure TDM.GetActiveDevices;
begin
end;

Procedure TDM.GetEksp(E_id:integer);
begin
end;

function TDM.GetUniqueName(RootPath,extNamewithdot: string): string;
var
  X: TSearchRec;
   s:string;
begin
  Randomize;                                         
  s:=extnamewithdot;
  if s='' then s:='.doc';
  s:='~%d'+s;
  repeat
    FmtStr(Result, s, [Random(9999999)]);
    Result:={RootPath+}Result;
  until FindFirst(RootPath+Result, faAnyFile, X) <> 0;
end;

Function TDM.ConvertBmpToJpeg(fname:string):boolean;
var
   Bmp:TBitMap;
   Jpeg:TJpegImage;
   FJpegName:string;
begin
     Bmp:=TBitMap.Create( );
     Jpeg:=TJpegImage.Create();
     Bmp.LoadFromFile(fname);
     Jpeg.Assign(Bmp);
     FJpegName:=ChangeFileExt(fname,'.jpg');
     Jpeg.SaveToFile(FJpegName);
     DeleteFile(fname);

     Bmp.FreeImage();
     Jpeg.Free();
     result:=true;
end;


Function TDM.GetDeviceNumber:string;
 var cnt:integer;
begin
 QW.close;
 qw.sql.clear;
 qw.sql.Text:='select count(*) as cnt from devices ';
 qw.open;
 cnt:=qw.fieldbyname('cnt').asinteger;
 if cnt >=999 then result:=inttostr(cnt);
 if cnt < 999 then result := '0'+inttostr(cnt);
 if cnt <  99 then result := '00'+inttostr(cnt);
 if cnt <   9 then result := '000'+inttostr(cnt);
end;

Function TDM.CheckNotUniqDeviceNumber(NewDeviceNumber:string;Name:string):boolean;
begin
 QW.close;
 qw.sql.clear;
 qw.sql.Text:='select count(*) as cnt from devices where DeviceNumber =:DeviceNumber and Name = :Name';
 qw.Parambyname('DeviceNumber').asstring:=NewDeviceNumber;
 qw.Parambyname('name').asstring:=Name;
 qw.open;
 result:=qw.fieldbyname('cnt').asinteger>0;
end;

Function TDM.CheckNotUniqDeviceNumber1(NewDeviceNumber:string;Name:string; Id_device:integer):boolean;
begin
 QW.close;
 qw.sql.clear;
 qw.sql.Text:='select count(*) as cnt from devices where id<>:ID and DeviceNumber =:DeviceNumber and Name = :Name';
 qw.Parambyname('DeviceNumber').asstring:=NewDeviceNumber;
 qw.Parambyname('name').asstring:=Name;
 qw.Parambyname('id').asinteger:=id_device;
 qw.open;
 result:=qw.fieldbyname('cnt').asinteger>0;
end;


Function TDM.CheckNeedRecalc(Id_device:integer):boolean;
begin
 QW.close;
 qw.sql.clear;
 qw.sql.Text:='select need_recalc from devices where id=:ID';
 qw.Parambyname('id').asinteger:=id_device;
 qw.open;
 result:=qw.fieldbyname('need_recalc').asinteger=1;
end;

Function TDM.Get_Table_Code(Id_converter:integer):integer;
begin
 QW.close;
 qw.sql.clear;
 qw.sql.Text:='select table_code  from converters  where id=:ID';
 qw.Parambyname('id').asinteger:=id_converter;
 qw.open;
 result:=qw.fieldbyname('table_code').asinteger;
  QW.close;
end;

Function TDM.CheckNeedTbl(Id_device:integer):boolean;
begin
 QW.close;
 qw.sql.clear;
 qw.sql.Text:='select need_tbl from devices where id=:ID';
 qw.Parambyname('id').asinteger:=id_device;
 qw.open;
 result:=qw.fieldbyname('need_tbl').asinteger=1;
 QW.close;
end;

Function TDM.CheckNeedTbl_New(Q_device:TIBQuery):boolean;
begin
 {QW.close;
 qw.sql.clear;
 qw.sql.Text:='select need_tbl from devices where id=:ID';
 qw.Parambyname('id').asinteger:=id_device;
 qw.open;  }
 result:=q_Device.fieldbyname('need_tbl').asinteger=1;
end;
Function TDM.CheckNeedRecalc_New(Q_device:TIBQuery):boolean;
begin
 {QW.close;
 qw.sql.clear;
 qw.sql.Text:='select need_recalc from devices where id=:ID';
 qw.Parambyname('id').asinteger:=id_device;
 qw.open;  }
 result:=q_Device.fieldbyname('need_recalc').asinteger=1;
end;

Procedure TDM.needTbl(status:integer; id:integer);
begin
  set_needTbl.parambyname('status').asinteger := status;
  set_needTbl.parambyname('id').asinteger := id;
  set_needTbl.ExecProc ;
  set_needtbl.transaction.CommitRetaining;
end ;

Procedure TDM.needRecalc(status:integer; id:integer);
begin
  set_needRecalc.parambyname('status').asinteger := status;
  set_needRecalc.parambyname('id').asinteger := id;
  set_needrecalc.ExecProc ;
  set_needRecalc.transaction.CommitRetaining;
end ;
end.
