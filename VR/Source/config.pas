unit config;

interface

uses
 inifiles,forms,
 classes,
 IBDatabase,sysutils;

type
  TConfigurationManager = class
  public
    class function GetInstance: TConfigurationManager;

    destructor Destroy; override; // never call destructor directly!
  private
    FIniFile: TIniFile;
    constructor Create;
    function GetPath: string;
    function GetIniFile: TIniFile;
  public
    property IniFile: TIniFile read GetIniFile;
  end;

var
  SwitchTypes,etapstrings,ETAPstrings_Prm:TStringlist;
  
implementation
uses registry,windows;

{const
  REGPATH = 'Software\Epsylon Technologies\Transneft';
 }
var
  ConfigurationManager: TConfigurationManager;

constructor TConfigurationManager.Create;
begin
  inherited Create;
end;

destructor TConfigurationManager.Destroy;
begin
  if FIniFile <> nil then
    FIniFile.Free;
  inherited Destroy;
end;

class function TConfigurationManager.GetInstance: TConfigurationManager;
begin
 try
   if ConfigurationManager = nil then
    ConfigurationManager := TConfigurationManager.Create;
  Result := ConfigurationManager;
 except
 end; 
end;

function TConfigurationManager.GetIniFile: TIniFile;
begin
  if FIniFile = nil then
    FIniFile := TIniFile.Create(GetPath);
  Result := FIniFile;
end;

function TConfigurationManager.GetPath: string;
var
  Registry: TRegistry;
  cv: string;
begin
 Result:=extractfilepath(application.exename)+'QH.ini' ;
end;

initialization
finalization
  if ConfigurationManager <> nil then
    ConfigurationManager.Free;


end.
