unit DataUnit;

interface

uses
  Windows, SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, IB,
  IBSQL, ComCtrls, IBSQLMonitor, Messages, Dialogs, Variants, IniFiles,
  DBCtrlsEh,StdCtrls,Buttons,Controls, IBUpdateSQL, StorageUnit,
  Forms,DateUtils;


const

{cообщения}
  wm_ClosePlan = wm_user + 400;
  wm_ClosePersonCard = wm_user + 401;
  wm_ShowPersonCardAsForm = wm_user + 402;

  ID_DocKind_Spravka_Opis_Group = 29;

type

  TListColumnInfo = packed record
    Title: string;
    Width: Integer;
    Format: string;
  end;

  TColumnInfo = packed record
    FieldName: string;
    Title: string;
    Width: Integer;
    Format: string;
  end;

{ TCommonData }

  TCommonData = class(TDataModule)
    ReadTransaction: TIBTransaction;
    ManualTransaction: TIBTransaction;
    ManualReadTransaction: TIBTransaction;
    AnyQuery: TIBQuery;
    SQL: TIBSQL;
    UpdateQ: TIBSQL;
    ManualAutoStartTransaction: TIBTransaction;
    Database: TIBDatabase;
    WTran: TIBTransaction;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DatabaseBeforeConnect(Sender: TObject);
    procedure IBSQLMonitorSQL(EventText: String; EventTime: TDateTime);
    procedure DatabaseAfterConnect(Sender: TObject);
  public
    User_id    : integer;   // пользователь, выполнивший логин и работающий с приложением
    User_Name  : String;
    User_Login : String;
    User_Greetings: String;
    TemplateDir : String;
    User_LEVEL_SECURITY_CODES: string;
    PLF:TForm;  // форма со списком учащихся

    function GetFieldDescr(const AOrigin : String): String;
    function GetFieldDefault(const AOrigin : String): String;
    function  TryLogin(const UserName, UserPas : String) : Boolean;
    procedure GetStringsFromQuery(IBSQL: TIBSQL; Strings: TStrings; const SQL_TXT, StringField: string);
    procedure GetStringsObjectsFromQuery(IBSQL: TIBSQL; Strings: TStrings; const SQL_TXT, StringField, ObjectField: string);
    procedure GetStringsObjectsFromQuery_NoClear(IBSQL: TIBSQL; Strings: TStrings; const SQL_TXT, StringField, ObjectField: string);
    procedure GetDBComboBoxEhFromQuery(IBSQL: TIBSQL; DBComboBoxEh: TDBComboboxEh; const SQL_TXT, StringField, ObjectField: string);
    procedure GetStringsObjectsFromOpenQuery(IBSQL: TIBSQL; Strings: TStrings; StringField, ObjectField: string);

    function  Lookup(const TableName: String; const KeyFields: String; const KeyValues: Variant; const ResultFields: String): Variant;
    function  CreateDataSet(AOwner : TComponent;ReadOnly : Boolean = True) : TIBQuery;
    Function CheckNeedCampus(Id_Person:integer):boolean;
    Function CheckNeedInsurance(Id_Person:integer):boolean;
    function CheckRightsOnPerson(ID: integer): boolean;
    procedure FillUsers(Strings: TStrings);
 private
    FTextFile: Text;
    FDescrList   : TStringList;
    FDefaultList : TStringList;
    procedure  FillDescrList;
  end;


  Function GetTmpFile(ext : String) : String;
  function FormatDocNumber(Shbl : String;  IDDoc : Integer): String;
  Function WaitSaveModal: Boolean;
  function GetEdu_Year(DateStart: tdatetime; datefinish: tdatetime):string  ;

  var
  CommonData: TCommonData;
  AppVersion: string;




implementation

uses
  ExtraUnit, EventUnit, MainUnit, GFunctions, StrUtils, tfSecurity,
  mnUtils, SecurityUtils;

{$R *.dfm}

{ TCommonData  }

function TCommonData.CheckRightsOnPerson(ID: integer): boolean;
var
 msg:string;
 levels:TStringList;
 i:integer;
begin
// проверка на доступ к уровню обучения
 if USER_LEVEL_SECURITY_CODES='ALL' then
  begin
     result := true;
     exit;
  end;
  if application.Title = 'АСУ Отдела Международного Сотрудничества' then
   begin
      result := true;
     exit;
   end;
  anyQuery.close;
  anyQuery.sql.Text:='select LEVEL_security_code from GETPERSONCURRENTLEVEL_security('+inttostr(ID)+')';
  anyquery.open;
 if anyQuery.FieldByName('LEVEL_security_code').asstring='NEW' then
  begin
     result:=pos('NEW', USER_LEVEL_SECURITY_CODES)>0;
     anyQuery.close;
     if not Result then
     begin
      Showmessage('Вам не выданы права на работу с учащимся данного уровня обучения');
      exit;
     end;
     exit;
  end
   else
  begin
  Levels:=TStringList.create;
  Levels.commatext:=anyQuery.FieldByName('LEVEL_security_code').asstring;
  Result:=false;
  for i:=0 to levels.count-1 do
     if LEVELS[i]<>'NEW' then
      if pos(Levels[i], USER_LEVEL_SECURITY_CODES)<>0 then Result:=true;
  Levels.destroy;
  anyquery.close;
  if not Result then
   begin
    Showmessage('Вам не выданы права на работу с учащимся данного уровня обучения');
    exit;
   end;
  end;
end;

procedure TCommonData.DataModuleCreate(Sender: TObject);
var
  MS, LS: DWORD;
begin
  FDescrList := TStringList.Create;
  FDefaultList := TStringList.Create;
  if ExtraUnit.GetFileVersion(Application.ExeName, MS, LS) then
  begin
    AppVersion := ExtraUnit.FormatVersion(MS, LS);
  end;
  EventUnit.AlertDataBase := Database;

  TemplateDir := ExtractFileDir(ParamStr(0)) + '\templates\';

end;

procedure TCommonData.DataModuleDestroy(Sender: TObject);
begin
  ShutdownEvents;
  EventUnit.AlertDataBase := nil;
  if ManualTransaction.Active then ManualTransaction.Commit;
  if ManualAutoStartTransaction.Active then ManualAutoStartTransaction.Commit;
  if ManualReadTransaction.Active then ManualReadTransaction.Commit;
  if ReadTransaction.Active then ReadTransaction.Commit;
  DataBase.Close();
  FDescrList.Free;
  FDefaultList.Free;
end;

procedure TCommonData.DatabaseBeforeConnect(Sender: TObject);
var
  XKey: boolean;
begin
{  XKey:=MainForm.SQLMonitor;
  if XKey then begin
    AssignFile(FTextFile, ChangeFileExt(Application.ExeName, '.log'));
    Rewrite(FTextFile);
    Database.TraceFlags:=[tfQPrepare,tfQExecute,tfQFetch,tfConnect, tfTransact];
  end
  else begin
    Database.TraceFlags:=[];
  end;
  IBSQLMonitor.Enabled:=XKey;}
end;

procedure TCommonData.IBSQLMonitorSQL(EventText: String;
  EventTime: TDateTime);
var
  S: string;
begin
//  S:= FormatDateTime('hh:mm:ss', EventTime) + ' ------ ' + EventText;
//  Writeln(FTextFile, S);
end;

procedure  TCommonData.FillDescrList;
var
  Origin : String;
  S : String;
begin
  FDescrList.Clear;
  AnyQuery.SQL.Text :='select F.RDB$RELATION_NAME, F.RDB$FIELD_NAME, F.RDB$DESCRIPTION ,F.RDB$DEFAULT_SOURCE from ' +
                      'RDB$RELATION_FIELDS F where not (F.RDB$DESCRIPTION is NULL and  RDB$DEFAULT_SOURCE is NULL) ';
  AnyQuery.Open;
  while not AnyQuery.Eof do
  begin
    Origin := AnsiUpperCase('"'+ Trim(AnyQuery.Fields[0].AsString) + '"."' + Trim(AnyQuery.Fields[1].AsString));
    if not AnyQuery.Fields[2].IsNull then
      FDescrList.Add(Origin + '"=' + Trim(AnyQuery.Fields[2].AsString));
    if not AnyQuery.Fields[3].IsNull then
    begin
      S :=  Trim(AnsiReplaceText( AnyQuery.Fields[3].AsString, 'DEFAULT', ''));
      if (S > '') and (S[1] = '''') and (S[Length(S)] = '''') then S :=  Copy(S, 2 ,  Length(S) -2);
      FDefaultList.Add(Origin + '"=' + S);
    end;
    AnyQuery.Next;
  end;
  AnyQuery.Close;
end;

function TCommonData.GetFieldDescr(const AOrigin : String): String;
begin
  Result := FDescrList.Values[AnsiUpperCase(AOrigin)];
end;

function TCommonData.GetFieldDefault(const AOrigin : String): String;
begin
  Result := FDefaultList.Values[AnsiUpperCase(AOrigin)];
end;


procedure TCommonData.DatabaseAfterConnect(Sender: TObject);
begin
  if not ReadTransaction.Active then ReadTransaction.StartTransaction;
  FillDescrList;
end;

function  TCommonData.TryLogin(const UserName, UserPas : String) : Boolean;
begin
  AnyQuery.Close;
  AnyQuery.SQL.Text := 'select  * from USERS where U_LOGIN=:LOGIN and U_PASSWORD=:PAS';
  AnyQuery.ParamByName('LOGIN').AsString := UserName;
  AnyQuery.ParamByName('PAS').AsString := UserPas;
  AnyQuery.Open;
  Result := not AnyQuery.IsEmpty;
  if Result then
  begin
    if dmSecurity = nil  then
      Application.CreateForm(TdmSecurity, dmSecurity);
    User_id := AnyQuery['U_ID'];
    User_Name := AnyQuery['NAME'];
    User_Greetings:=AnyQuery['GREETINGS'];
    User_Level_Security_Codes := AnyQuery.fieldbyname('LEVEL_SECURITY_CODES').asstring;

    User_Login := AnyQuery['U_LOGIN'];
    SuperUser := Boolean(AnyQuery.FindField('SUPER_USER').AsInteger); //пишем в глоб. переменную модуля StorageUnit
    if SuperUser then MainForm.Caption := MainForm.Caption + ' (сохранение настроек форм в базе)'; 
    dmSecurity.Init(User_id);
  end;
end;

procedure TCommonData.FillUsers(Strings: TStrings);
begin
  Strings.Clear;
  AnyQuery.Close;
  AnyQuery.SQL.Text := 'select U_LOGIN from USERS where U_Login<>'''' order by U_LOGIN ';
  AnyQuery.Open;
  while not AnyQuery.EOF do begin
    Strings.Add(AnyQuery.FindField('U_LOGIN').AsString);
    AnyQuery.Next;
  end;
end;

procedure TCommonData.GetStringsFromQuery(IBSQL: TIBSQL; Strings: TStrings; const SQL_TXT, StringField: string);
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

procedure TCommonData.GetStringsObjectsFromQuery(IBSQL: TIBSQL; Strings: TStrings; const SQL_TXT, StringField, ObjectField: string);
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

procedure TCommonData.GetStringsObjectsFromOpenQuery(IBSQL: TIBSQL; Strings: TStrings; StringField, ObjectField: string);
begin
//  CheckTransaction;
  with IBSQL, Strings do
  begin
    Clear;
    while not Eof do
    begin
      AddObject(Trim(FieldByName(StringField).AsString) ,
        TObject(FieldByName(ObjectField).AsInteger));
      Next;
    end;
  end;
end;


procedure TCommonData.GetStringsObjectsFromQuery_NoClear(IBSQL: TIBSQL; Strings: TStrings; const SQL_TXT, StringField, ObjectField: string);
begin
//  CheckTransaction;
  with IBSQL, Strings do
  begin
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

procedure TCommonData.GetDBComboBoxEhFromQuery
 (IBSQL: TIBSQL; DBComboBoxEh: TDBComboboxEh; const SQL_TXT, StringField, ObjectField: string);

begin
  with IBSQL, DBComboboxEh do
  begin
    Items.Clear;
    if Open then Close;
    SQL.clear;
    SQL.add(sql_TXT);
    ExecQuery;
    while not Eof do
    begin
      Items.AddObject(Trim(FieldByName(StringField).AsString) ,
        TObject(FieldByName(ObjectField).AsInteger));
      KeyItems.Add(Trim(FieldByName(ObjectField).Asstring));
      Next;
    end;
  end;
end;

function  TCommonData.Lookup(const TableName: String; const KeyFields: String; const KeyValues: Variant; const ResultFields: String): Variant;
var
  q : TDataSet;
  i : integer;
  ResultFields_ : string;
begin
  q :=  AnyQuery;
  If pos('SELECT ',AnsiUpperCase(TableName)) > 0 then
    AnyQuery.SQL.Text := TableName
  Else
    AnyQuery.SQL.Text := GenerateSQLText(TableName, ResultFields, KeyFields, skSelect);

  AnyQuery.Params.ParamValues[KeyFields] := KeyValues;
  q.Open;
  if q.IsEmpty then
    result := Unassigned
  else
  begin
    if pos('SELECT ',AnsiUpperCase(TableName)) > 0 then
    begin
      result := q[ResultFields];
    end else
    begin
      ResultFields_ := '';
      for i:=0 to q.Fields.Count -1 do  ResultFields_ := ResultFields_ + q.Fields[i].FieldName + ';';
      SetLength(ResultFields_,Length(ResultFields_)-1);
      result := q[ResultFields_];
    end;
  end;
  q.Close;
end;


Function TCommonData.CheckNeedCampus(Id_Person:integer):boolean;
begin
  AnyQuery.SQL.Text :='select campus_status from persons where id = '+inttostr(id_Person);
  AnyQuery.Open;
  result:=anyQuery.fieldbyname('campus_status').asinteger = 1;
  AnyQuery.Close;
end;

Function TCommonData.CheckNeedInsurance(Id_Person:integer):boolean;
begin
  AnyQuery.SQL.Text :='select Insurance_status from persons where id = '+inttostr(id_Person);
  AnyQuery.Open;
  result:=anyQuery.fieldbyname('Insurance_status').asinteger = 1;
  AnyQuery.Close;
end;


Function GetTmpFile(ext : String) : String; // ext включает точку , например, .xls
var
  guid : TGUID;
begin
  //showmessage('before ExtractFileDir  '+ParamStr(0)  + '\temp\');
  result := ExtractFileDir(ParamStr(0))  + '\temp\';
  //showmessage('before ForceDirectories  '+result);

  try
   ForceDirectories(result);
   except
  end;
  CreateGUID(guid);
  result := result + GUIDToString(Guid) +  ext;
end;

function FormatDocNumber(Shbl : String;  IDDoc : Integer): String;
  var
    NmbPart : String;
  begin
     if Shbl = '-' then  result:=' ' else
      begin
       if Shbl = '' then Shbl := '[0000N]';
       NmbPart := ExtractString('[','N]', Shbl);
       Shbl := AnsiReplaceStr(Shbl, '[' + NmbPart + 'N]',  FormatFloat(NmbPart,IdDoc) );
       result := FormatDateTime(Shbl, now);
      end;
  end;

function  TCommonData.CreateDataSet(AOwner : TComponent;ReadOnly : Boolean = True) : TIBQuery;
begin
  Result := TIBQuery.Create(AOwner);
  Result.Database := Database;
  If ReadOnly then
    Result.Transaction := ReadTransaction
  Else
    Result.Transaction := ManualAutoStartTransaction;
end;

function WaitSaveModal: Boolean;
var
  frm : TForm;
  lbl : TLabel;
const
  frmText ='Документ  был открыт для редактирования.'#13 +
           'Завершив редактирование,  ЗАКРОЙТЕ ДОКУМЕНТ и нажмите "ОК".' + #13 +
           'Документ  будет сохранен  в системе.' + #13  +
           'Если Вы не  планируете сохранять  изменения в открытом документе нажмите "Отмена"';
begin
  frm := CreateSimpleForm(TLabel, [bkOK,bkCancel]);
  lbl :=  frm.Controls[0] as TLabel;
  frm.Caption := Application.Title;
  lbl.Caption := frmText;
//  lbl.Font.Size :=  12;
//  lbl.Font.Style := [fsBold];
  lbl.Alignment := taCenter;
  lbl.Layout := tlCenter;
  lbl.WordWrap := True;
  result := frm.ShowModal =  mrOk;
  frm.Free;
end;

function GetEdu_Year(DateStart: tdatetime; datefinish: tdatetime):string  ;
var Year1:string; Year2:string;
begin
 if yearOf(DateStart) = YearOf(dateFinish) then
  begin
   result:=copy(inttostr(yearof(DateStart)-1),3,2)+'/'+copy(inttostr(yearof(DateFinish)),3,2){+' +год'};
  end
   else
    begin
    result:=copy(inttostr(yearof(DateStart)),3,2)+'/'+copy(inttostr(yearof(DateFinish)),3,2){+' год'};
   end;
end;






end.
