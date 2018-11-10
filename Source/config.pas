unit Config;

interface

uses
  IniFiles, Forms, Classes, IBDatabase, SysUtils;

const
  VERSION_DATE = '5.05.2004';
type


  // конфигурационная информация приложения
  TConfigurationManager = class
  public
    constructor Create;
    destructor Destroy; override;
  private
    FIniFile: TIniFile;
    FLocalized: Boolean;
    FConfirmSaveReports: Boolean;
    FReportDelay: Integer;
    FSaveLocalization: Boolean;
    function GetIniPath: string;
    function GetDir(const Section, Key, DefaultValue: string): string;
    function GetTempDir: string;
    procedure CheckKeyExists(const Section, Key, DefaultValue: string);
    function GetResourceDir: string;
    function GetDataPath: string;
    function GetDataStoragePath: string;
    procedure InitTaxxiVersion;
    function GetTemplatesDir: string;
  public
    property IniFile: TIniFile read FIniFile;
    property TempDir: string read GetTempDir;
    procedure SaveDataPath(Path: string);
    property ResourceDir: string read GetResourceDir;
    property DataPath: string read GetDataPath write savedatapath;
    property DataStoragePath: string read GetDataStoragePath;
    procedure GetDatabaseList(Strings: TStrings);
    function GetDatabaseProp(const Index: Integer; var Path, UserName,
      Password: string): Boolean;
    property Localized: Boolean read FLocalized;
    property SaveLocalization: Boolean read FSaveLocalization; // сохранять ли ресурсы в папку с локализацией
    property ConfirmSaveReports: Boolean read FConfirmSaveReports;
    property ReportDelay: Integer read FReportDelay;
    property TemplatesDir: string read GetTemplatesDir;
  end;

var
  AppConfig: TConfigurationManager;

implementation

uses
  Windows {, PfoStrings};

procedure TConfigurationManager.CheckKeyExists(const Section, Key,
  DefaultValue: string);
begin
  if not IniFile.ValueExists(Section, Key) then
    IniFile.WriteString(Section, Key, DefaultValue);
end;

constructor TConfigurationManager.Create;
begin
  inherited;
  FIniFile := TIniFile.Create(GetIniPath);
  FLocalized := FIniFile.ValueExists('LANGDIR', 'DIR');
  FSaveLocalization := FIniFile.ReadBool('LANGDIR', 'Save', False);
  FConfirmSaveReports := FIniFile.ReadBool('GENERAL', 'ConfirmSaveReports', False);
  FReportDelay := FIniFile.ReadInteger('GENERAL', 'DelayOpenReports', 0);

  InitTaxxiVersion;
end;

destructor TConfigurationManager.Destroy;
begin
  FIniFile.Free;
  inherited;
end;

procedure TConfigurationManager.GetDatabaseList(Strings: TStrings);
var
  i: Integer;
  Value: string;
  Position: Integer;
begin
  Strings.Clear;
  if IniFile.SectionExists('DB.LIST') then
    IniFile.ReadSectionValues('DB.LIST', Strings);
  for i := 0 to Strings.Count - 1 do
  begin
    Value := Strings.Strings[i];
    Position := Pos('=', Value);
    if Position <> 0 then
    begin
      Value := Copy(Value, Position + 1, Length(Value));
      Strings.Strings[i] := Value;
    end;
  end;
end;

function TConfigurationManager.GetDatabaseProp(const Index: Integer;
  var Path, UserName, Password: string): Boolean;
var
  Strings: TStringList;
  Key: string;
begin
  Result := False;
  Strings := TStringList.Create;
  try
    IniFile.ReadSection('DB.LIST', Strings);
    if Index > Strings.Count - 1 then
      Exit;
    Key := Strings.Strings[Index];
  finally
    Strings.Free;
  end;

  if not IniFile.ValueExists('DB.SETTINGS', Key + '.Path') then
    raise Exception.CreateFmt('Некорректный файл настройки ', ['Unable to find "' + '[DB.SETTINGS] ' + Key + '.Path".'])
  else
    Path := IniFile.ReadString('DB.SETTINGS', Key + '.Path', '');

  if not IniFile.ValueExists('DB.SETTINGS', Key + '.Username') then
    raise Exception.CreateFmt('Некорректный файл настройки ', ['Unable to find "' + '[DB.SETTINGS] ' + Key + '.Username".'])
  else
    UserName := IniFile.ReadString('DB.SETTINGS', Key + '.Username', '');

  if not IniFile.ValueExists('DB.SETTINGS', Key + '.Password') then
    raise Exception.CreateFmt('Некорректный файл настройки ', ['Unable to find "' + '[DB.SETTINGS] ' + Key + '.Password".'])
  else
    Password := IniFile.ReadString('DB.SETTINGS', Key + '.Password', '');
  Result := True;
end;

function TConfigurationManager.GetDir(const Section, Key,
  DefaultValue: string): string;
var
  CurrentDir: string;
begin
  CheckKeyExists(Section, Key, DefaultValue);
  Result := IniFile.ReadString(Section, Key, DefaultValue);
  CurrentDir := GetCurrentDir;
  try
    SetCurrentDir(ExtractFileDir(Application.ExeName));
    Result := ExcludeTrailingBackslash(ExtractFilePath(ExpandFileName(ExcludeTrailingBackslash(Result) + '\test.txt'))) + '\';
    if not DirectoryExists(Result) then
      ForceDirectories(Result);
    if not DirectoryExists(Result) then
      raise Exception.CreateFmt('Не могу создать каталог', [Result]);
  finally
    SetCurrentDir(CurrentDir);
  end;
end;

function TConfigurationManager.GetResourceDir: string;
begin
  Result := GetDir('LANGDIR', 'Dir', 'lang\eng');
end;

function TConfigurationManager.GetDataStoragePath: string;
begin
  Result := GetDir('DATASTORAGE', 'Dir', 'DB_DAT\DATA');
end;

function TConfigurationManager.GetDataPath: string;
begin
  Result := GetDir('DataPath', 'Dir', 'data');
end;

function TConfigurationManager.GetIniPath: string;
begin
  Result := ChangeFileExt(Application.ExeName, '.ini');
end;

function TConfigurationManager.GetTempDir: string;
begin
  Result := GetDir('DIR', 'Temp', 'Temp');
end;

procedure TConfigurationManager.InitTaxxiVersion;
begin
end;

function TConfigurationManager.GetTemplatesDir: string;
begin
  Result := ExtractFilePath(Application.ExeName) + '\Templates\';
end;

procedure TConfigurationManager.SaveDataPath(Path: string);
begin
//  dataPath:=Path;
  inifile.writestring('DataPath', 'Dir', Path);
end;


initialization
  AppConfig := TConfigurationManager.Create;

finalization
  if AppConfig <> nil then
    AppConfig.Free;
end.

