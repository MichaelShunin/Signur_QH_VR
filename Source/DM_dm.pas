unit DM_dm;

interface

uses
  windows,SysUtils, forms,Classes, DB, IBDatabase, inifiles, IBCustomDataSet, IBQuery,
  IBStoredProc,  Graphics,Jpeg, IBSQL,dateutils;


 const
//  Program_Name = 'Gemis ISGI';
  Program_Name = 'Сигнур база данных';
type

  TDM = class(TDataModule)              
    DB: TIBDatabase;
    TA: TIBTransaction;
    Devices: TIBQuery;
    Create_Eksp_AFTERPROC: TIBStoredProc;
    q: TIBQuery;
    CREATE_CURVESET: TIBStoredProc;
    CREATE_CURVE: TIBStoredProc;
    CREATE_CURSOR: TIBStoredProc;
    CREATE_CURSCHAN: TIBStoredProc;
    CREATE_SIGNAL: TIBStoredProc;
    CREATE_EKSP: TIBStoredProc;
    CREATE_CURVESET_MEMO: TIBStoredProc;
    CREATE_CURVESET_TXT: TIBStoredProc;
    SETEKSPPARAM: TIBStoredProc;
    sql: TIBSQL;
    CREATE_EKSP_AND_MODEMINFO: TIBStoredProc;
    q_devices: TIBQuery;
    CREATE_EKSP_AND_DEVICEPARAM: TIBStoredProc;
    Q1: TIBQuery;
    QS: TIBSQL;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    db_path:string;
    BasePath:string;   // основной каталог с подкаталогами баз данных
    ActiveStoragepath:string; // текущий рабочий каталог базы данных
    Activepath:string; // текущий рабочий каталог базы данных
    databases:TStringList;  // список баз данных, включая Empty
    Descriptions:TStringList; // список описаний баз данных, включая Empty

    procedure ConnectToDatabase; overload;
    procedure ConnectToDatabase(Index: Integer); overload;
    procedure DisconnectFromDatabase;
    Function GetFreeExpID: integer;
    Function GetDeviceCode(Device_num:integer; Device_Type: char): integer;
    procedure ScanDir(StartDir: string; Mask: string; List: TStrings);
    procedure ScanFiles(StartDir: string; Mask: string; List: TStrings);
    Function CheckArchievName(s:string):boolean; // true, если такое имя уже есть
    Function ConvertBmpToJpeg(fname:string):boolean;
    procedure GetStringsFromQuery(IBSQL: TIBSQL; Strings: TStrings; const SQL_TXT, StringField: string);
    procedure GetStringsObjectsFromQuery(IBSQL: TIBSQL; Strings: TStrings; const SQL_TXT, StringField, ObjectField: string);
    procedure checkNewPROCEDURE_2016;
    procedure checkNewFild;
    procedure checkNewFild_2014;
   Procedure CreateSchedule;
   procedure RemoveAll(path: string);

  end;

var
  DM: TDM;

implementation

uses config, tvc_u;

{$R *.dfm}

procedure TDM.ConnectToDatabase(Index: Integer);
var
  Path, UserName, Password: string;
begin

    db.Connected := False;
    if db_path='' then
    db.DatabaseName := '127.0.0.1:'+basePath+databases[index]+'\signur.gdb'
     else db.databasename:=db_path;

    db.Params.Clear;
    db.Params.Add('user_name=SYSDBA'{ + UserName});
    db.Params.Add('password=masterkey'{ + Password});
    db.Params.Add('lc_ctype=WIN1251');
    db.Connected := True;
    tA.StartTransaction;
    ActiveStoragePath:=basePath+databases[index]+'\Files\';
    ActivePath:=basePath+databases[index]+'\';

end;

// подключение к БД

procedure TDM.ConnectToDatabase;
var
  Ini: TIniFile;
begin
  db.Connected := False;
  Ini := AppConfig.IniFile;

  if Ini <> nil then
  begin
    db.DatabaseName := Ini.ReadString('DB', 'Path', '');
    db.Params.Clear;
    db.Params.Add('user_name=' + Ini.ReadString('DB', 'Username', ''));
    db.Params.Add('password=' + Ini.ReadString('DB', 'Password', ''));
    db.Params.Add('lc_ctype=WIN1251');
  end;

  db.Connected := True;
  ta.StartTransaction;
//  tranLog.StartTransaction;
end;


procedure TDM.DataModuleCreate(Sender: TObject);
begin
  if db.connected then db.connected := false;

  BasePath:=extractFilePath(Application.exename)+'databases\';
  Databases:=TStringList.create;
  scandir(BasePath,'',DataBases);

//  db.Connected := true;
//  ta.StartTransaction;
end;

procedure TDM.ScanDir(StartDir: string; Mask: string; List: TStrings);
var
  SearchRec: TSearchRec;
begin
  if Mask = '' then
    Mask := '*.*';
  if StartDir[Length(StartDir)] <> '\' then
    StartDir := StartDir + '\';
  if FindFirst(StartDir + Mask, faAnyFile, SearchRec) = 0 then
  begin
    repeat Application.ProcessMessages;
      if (SearchRec.Attr and faDirectory) <> faDirectory then
        begin
        {List.Add(StartDir + SearchRec.Name) }
        end
      else if (SearchRec.Name <> '..') and (SearchRec.Name <> '.') then begin
//        List.Add(StartDir + SearchRec.Name + '\');
        if ansiUppercase(searchRec.Name)<>'EMPTY' then List.Add( SearchRec.Name);
//      ScanDir(StartDir + SearchRec.Name + '\', Mask, List);
        end;
   until FindNext(SearchRec) <> 0;
  FindClose(SearchRec);
 end;
end;


procedure TDM.ScanFiles(StartDir: string; Mask: string; List: TStrings);
var
  SearchRec: TSearchRec;
begin
  if Mask = '' then
    Mask := '*.*';
  if StartDir[Length(StartDir)] <> '\' then
    StartDir := StartDir + '\';
  if FindFirst(StartDir + Mask, faAnyFile, SearchRec) = 0 then
  begin
    repeat Application.ProcessMessages;
      if (SearchRec.Attr and faDirectory) <> faDirectory then
        List.Add({StartDir + }SearchRec.Name);
   until FindNext(SearchRec) <> 0;
  FindClose(SearchRec);
 end;
end;

procedure TDM.DisconnectFromDatabase;
begin
  if tA.Active then
  begin
    tA.Rollback;
    tA.Active := False;
  end;

{  if tranLog.Active then
  begin
    tranLog.Rollback;
    tranLog.Active := False;
  end;
 }
  if db.Connected then
    db.Connected := False;
end;

Function TDM.GetFreeExpID: integer;
begin
 q.close;
 q.sql.clear;
 q.sql.text:='select ID from GetFreeExp_ID';
 q.Open;
 result:=q.fieldbyname('id').asinteger;
 q.close;
end;

Function TDM.GetDeviceCode(Device_num:integer; Device_Type: char): integer;
begin
 q.close;
 q.sql.clear;
 q.sql.text:='select Eksp_nomer from eksp where device_Number = :device_number and Hide = 0 and id_device = :id_device';
 q.parambyname('device_number').asinteger:=device_num;
 // (0 - Акрон, 1 - ЭХО-Р, 2 - ЭХО-АС),
 if device_type = '0' then  q.parambyname('ID_device').asinteger:=15; //  ' АКРОН  15
 if device_type = '1' then  q.parambyname('ID_device').asinteger:=13; //  ' ЭХО-Р 13
 if device_type = '2' then  q.parambyname('ID_device').asinteger:=14; //  ' ЭХО-С 14
 q.Open;
 result:=q.fieldbyname('Eksp_nomer').asinteger;
 q.close;
end;

Function TDM.CheckArchievName(s:string):boolean;
var
 i:integer;
 begin
 result:=false;
 for i:=0 to databases.count-1 do
  if ansiuppercase(databases[i])=ansiUppercase(s) then
   begin
    result:=true;
    exit;
   end;
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

procedure TDM.GetStringsFromQuery(IBSQL: TIBSQL; Strings: TStrings; const SQL_TXT, StringField: string);
begin
//  CheckTransaction;
  with IBSQL, Strings do
  begin
    Clear;
    if Open then Close;
    SQL.clear;
    SQL.add(sql_TXT);
//    IBSQL.ParamByName('HT_ID').asinteger:=HT_ID;
    ExecQuery;
    while not Eof do
    begin
      Add(Trim(FieldByName(StringField).AsString) {,
        TObject(FieldByName(ObjectField).AsInteger)});
      Next;
    end;
  end;
end;

procedure TDM.GetStringsObjectsFromQuery(IBSQL: TIBSQL; Strings: TStrings; const SQL_TXT, StringField, ObjectField: string);
begin
//  CheckTransaction;
  with IBSQL, Strings do
  begin
    Clear;
    if Open then Close;
    SQL.clear;
    SQL.add(sql_TXT);
    ExecQuery;
    while not Eof do
    begin
      AddObject(Trim(FieldByName(StringField).AsString) ,
        TObject(FieldByName(ObjectField).AsInteger));
      Next;
    end;
  end;
end;

procedure TDM.checkNewFild;
var i:integer;
 bNeedBluetooth_Fields:boolean;
 bNeedFTP_Password_Field:boolean;
begin
 //20.05.2010
      qs.SQL.clear;
      qs.sql.Add(' CREATE OR ALTER trigger daysdata_bi for DAYSDATA  ');
      qs.sql.Add('  active before insert position 0    ');
      qs.sql.Add('  AS                                 ');
      qs.sql.Add('  declare variable max_d_value date; ');
      qs.sql.Add('  BEGIN                              ');
      qs.sql.Add('    IF (NEW.ID_DAYSDATA IS NULL) THEN ');
      qs.sql.Add('      NEW.ID_DAYSDATA = GEN_ID(GEN_DAYSDATA_ID,1); ');
      qs.sql.Add('      select max(day_value) from daysdata where    ');
      qs.sql.Add('            day_value<new.day_value and eksp_nomer = new.eksp_nomer  ');
      qs.sql.Add('             into :max_d_value;        ');
      qs.sql.Add('      select s_value from daysdata     ');
      qs.sql.Add('      where eksp_nomer = new.eksp_nomer ');
      qs.sql.Add('         and day_value = :max_d_value into new.d_value; ');
      qs.sql.Add('    if (not (new.d_value is null)) then new.d_value = new.s_value - new.d_value; ');
      qs.sql.Add('  END');
      qs.ExecQuery;           ;
      qs.Transaction.CommitRetaining;

      qs.SQL.clear;
      qs.sql.Add(' CREATE OR ALTER trigger hoursdata_bi for HOURSDATA  ');
      qs.sql.Add(' active before insert position 0   ');
      qs.sql.Add(' AS   ');
      qs.sql.Add(' declare variable max_hour_value timestamp;  ');
      qs.sql.Add(' BEGIN   ');
      qs.sql.Add('  IF (NEW.ID_HOURSDATA IS NULL) THEN   ');
      qs.sql.Add(' NEW.ID_HOURSDATA = GEN_ID(GEN_HOURSDATA_ID,1);  ');
      qs.sql.Add('   new.d_value = null;   ');
      qs.sql.Add('   select max(hd.hour_value) from hoursdata hd   ');
      qs.sql.Add('   where   ');
      qs.sql.Add('   hd.hour_value<new.hour_value and hd.eksp_nomer = new.eksp_nomer   ');
      qs.sql.Add('     into :max_hour_value;   ');
      qs.sql.Add('  select s_value from hoursdata   ');
      qs.sql.Add('  where eksp_nomer = new.eksp_nomer and hour_value = :max_hour_value   ');
      qs.sql.Add('             into new.d_value;   ');
      qs.sql.Add('  if (not (new.d_value is null)) then new.d_value = new.s_value - new.d_value;   ');
      qs.sql.Add(' END');
      qs.ExecQuery;           ;
      qs.Transaction.CommitRetaining;

      for i:=1 to 6 do
      begin
       QS.SQL.Clear;
       QS.sql.loadfromfile(ExtractFilePath(Application.exename)+'\SQL\script2013_'+inttostr(i)+'.sql');
       qs.ExecQuery;           ;
       qs.Transaction.CommitRetaining;
      end;
      for i:=0 to 5 do
      begin
       QS.SQL.Clear;
       QS.sql.loadfromfile(ExtractFilePath(Application.exename)+'\SQL\script2013_data_'+inttostr(i)+'.sql');
       qs.ExecQuery;           ;
       qs.Transaction.CommitRetaining;
      end;

   bNeedBluetooth_Fields:=true;
   bNeedFTP_Password_Field:=True;

  q.SQL.clear;  //
  q.sql.Add(' select * from eksp where eksp_nomer < 100 ');
  q.open;
  for i:=0 to q.fieldcount-1  do
   begin
    if q.Fields[i].FullName = 'BLUETOOTH' then   bNeedBluetooth_Fields:=false;
    if q.Fields[i].FullName = 'FTP_PASSWORD' then   bNeedFTP_Password_Field:=false;
   end;
  q.close;
    
  if bNeedBluetooth_Fields then
   begin
      q.SQL.clear;
      q.sql.Add(' ALTER TABLE EKSP ADD BLUETOOTH SMALLINT DEFAULT 0 ');
      q.ExecSQL          ;
      q.SQL.clear;
      q.sql.Add(' ALTER TABLE EKSP ADD BLUETOOTH_PIN integer DEFAULT 0 ');
      q.ExecSQL           ;
      q.Transaction.CommitRetaining;
   end;

   if bNeedFTP_Password_Field then
   begin
      q.SQL.clear;
      q.sql.Add(' ALTER TABLE EKSP ADD FTP_PASSWORD INTEGER ');
      q.ExecSQL          ;
      q.Transaction.CommitRetaining;
   end;

   if bNeedBluetooth_Fields then
   begin
      q.SQL.clear;
      q.sql.Add(' update EKSP set BlueTooth = 0, BlueTooth_PIN=0 ');
      q.ExecSQL   ;
      q.Transaction.CommitRetaining;
   end;

     // измененени типа поля в Daysdata b Hoursdata на doubleprecision вместо float

    q.SQL.Text:=' update RDB$FIELDS set RDB$FIELD_TYPE = 27, RDB$FIELD_LENGTH = 8, RDB$CHARACTER_LENGTH = NULL where RDB$FIELD_NAME = :RDB_FIELDNAME';
    q.ParamByName('RDB_FIELDNAME').Value:= 'RDB$928';
    q.ExecSQL;
    q.transaction.commitretaining;
    q.SQL.Text:=' update RDB$FIELDS set RDB$FIELD_TYPE = 27, RDB$FIELD_LENGTH = 8, RDB$CHARACTER_LENGTH = NULL where RDB$FIELD_NAME = :RDB_FIELDNAME';
    q.ParamByName('RDB_FIELDNAME').Value:= 'RDB$929';
    q.ExecSQL;
    q.transaction.commitretaining;
    q.SQL.Text:=' update RDB$FIELDS set RDB$FIELD_TYPE = 27, RDB$FIELD_LENGTH = 8, RDB$CHARACTER_LENGTH = NULL where RDB$FIELD_NAME = :RDB_FIELDNAME';
    q.ParamByName('RDB_FIELDNAME').Value:= 'RDB$890';
    q.ExecSQL;
    q.transaction.commitretaining;



end;


procedure TDM.checkNewFild_2014;
var i:integer;
 bNeedBluetooth_Fields:boolean;
begin
 //10.07.2014
     for i:=0 to 7 do
      begin
       QS.SQL.Clear;
       QS.sql.loadfromfile(ExtractFilePath(Application.exename)+'\SQL\devices_2014_'+inttostr(i)+'.sql');
       qs.ExecQuery;           ;
       qs.Transaction.CommitRetaining;
      end;
end;


procedure TDM.checkNewProcedure_2016;
begin
 //21.11.2016


 QS.SQL.Clear;
 QS.sql.loadfromfile(ExtractFilePath(Application.exename)+'\SQL\GETDAYSDATA.sql');
 qs.ExecQuery;           ;
 qs.Transaction.CommitRetaining;

  QS.SQL.Clear;
 QS.sql.loadfromfile(ExtractFilePath(Application.exename)+'\SQL\GETHOURSDATA.sql');
 qs.ExecQuery;           ;
 qs.Transaction.CommitRetaining;
end;


procedure TDM.RemoveAll(path: string);
    var
      sr: TSearchRec;
    begin
      if FindFirst(path + '\*.*', faAnyFile, sr) = 0 then
      begin
        repeat
          if sr.Attr and faDirectory = 0 then
          begin
            DeleteFile(path + '\' + sr.name);
          end
          else
          begin
            if pos('.', sr.name) <= 0 then
              RemoveAll(path + '\' + sr.name);
          end;
        until
          FindNext(sr) <> 0;
      end;
      FindClose(sr);
      RemoveDirectory(PChar(path));
 end;




procedure TDM.CreateSchedule;
var
 date: tDatetime;
 NDays:integer;
begin
  inherited;
  q.SQL.clear;
  q.sql.Add(' execute procedure delete_schedule');
  q.ExecSQL;
  q.Transaction.CommitRetaining;

  NDays:=AppConfig.inifile.ReadInteger('SCHEDULE','NDAYS',32);
  q_devices.close;
  q_devices.open;
  while not q_devices.eof do
   begin
    date := trunc(now);
    q.SQL.clear;
    q.sql.add('insert into schedule (EKSP_NOMER,ACTION_DATE,ACTION_MODE) values (:device_id,:ACTION_DATE,:ACTION_MODE)');
    q.parambyname('device_id').asinteger:=q_devices.fieldbyname('Device_id').asinteger;
    q.parambyname('action_mode').asinteger:=q_devices.fieldbyname('sch_action_mode').asinteger;
    repeat  // перебираю дни
     case q_devices.fieldbyname('sch_mode').asinteger of
{     1 - ежедневно, в заданный час
      2 - еженедельно, в заданный день недели и заданный час
      3 - ежемесячно в заданный день месяца в заданный час }
      1: begin
          q.parambyname('action_date').asdatetime:=q_devices.fieldbyname('sch_time').asdatetime+date;
          if q.parambyname('action_date').asdatetime > now then
           begin
            q.ExecSQL;
            q.Transaction.CommitRetaining;
           end;
         end;
      2: if dayofweek(date)=q_devices.fieldbyname('sch_day').asinteger then
           begin
            q.parambyname('action_date').asdatetime:=q_devices.fieldbyname('sch_time').asdatetime+date;
            if q.parambyname('action_date').asdatetime > now then
             begin
              q.ExecSQL;
              q.Transaction.CommitRetaining;
             end;
           end;
      3: if dateutils.dayOfTheMonth(date)=q_devices.fieldbyname('sch_day').asinteger then
           begin
            q.parambyname('action_date').asdatetime:=q_devices.fieldbyname('sch_time').asdatetime+date;
            if q.parambyname('action_date').asdatetime > now then
             begin
              q.ExecSQL;
              q.Transaction.CommitRetaining;
             end;
           end;
     end;
     date:=date+1;
    until date > trunc(now)+NDays;
    q_devices.next;
   end;
end;

var
 p:pstring;
begin
 {регистрации глобальных сообщений Windows}
(* p:=newstr('wm_ENDIMPORT_NO_Tabl_GL');
 wm_endImport_No_Tabl_Gl:=RegisterWindowMessage(pChar(p));
 disposeStr(p);

 p:=newstr('wm_endProcessing_Gl_2004');
 wm_endProcessing_Gl_2004:=RegisterWindowMessage(pChar(p));
 disposeStr(p);

 p:=newstr('wm_ENDIMPORT_GL');
 wm_endImport_Gl:=RegisterWindowMessage(pChar(p));
 disposeStr(p);

 p:=newstr('wm_ENDMeasIMPORT_NO_Tabl_GL');
 wm_endMeasImport_No_Tabl_Gl:=RegisterWindowMessage(pChar(p));
 disposeStr(p);

 p:=newstr('wm_ENDMeasIMPORT_GL');
 wm_endMeasImport_Gl:=RegisterWindowMessage(pChar(p));
 disposeStr(p);

 p:=newstr('wm_ENDMeas_GL');
 wm_endMeas_Gl:=RegisterWindowMessage(pChar(p));
 disposeStr(p);

 p:=newstr('wm_setUserCursor_GL');
 wm_setUserCursor_GL:=RegisterWindowMessage(pChar(p));
 disposeStr(p);

  *)


end.

