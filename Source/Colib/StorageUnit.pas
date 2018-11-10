unit StorageUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, IniFiles, Forms, Registry, Controls;


const
  OptionsSection = '.OPTIONS';

type
  //собственный класс для записи/чтения настроек
  TStorage = class(TObject)
  private
    FStorIni: TIniFile;
    FStorReg: TRegistryIniFile;
    FIniName: string;
  public
    function ReadString(const Section, Ident, Default: string): String;
    function ReadInteger(const Section, Ident: String; Default: Longint): Longint;
    function ReadBool(const Section, Ident: String; Default: Boolean): Boolean;
    procedure WriteString(const Section, Ident, Value: String);
    procedure WriteInteger(const Section, Ident: String; Value: Longint);
    procedure WriteBool(const Section, Ident: String; Value: Boolean);

    property IniName: string read FIniName;

    constructor Create;
    destructor Destroy; override;
  end;


{ IRememberable }

  IRememberable = interface
  ['{6FD7C61A-B218-4401-9719-F97FA06734BB}']
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string);
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string);
  end;

procedure InitStorage;

procedure SaveState(RootComponent: TComponent; const SectionName, Prefix: string);
procedure LoadState(RootComponent: TComponent; const SectionName, Prefix: string);

procedure SaveStateEx(RootComponent: TComponent; Storage: TStorage; const SectionName, Prefix: string);
procedure LoadStateEx(RootComponent: TComponent; Storage: TStorage; const SectionName, Prefix: string);

procedure SaveChildState(RootComponent: TComponent; const SectionName, Prefix: string);
procedure LoadChildState(RootComponent: TComponent; const SectionName, Prefix: string);

procedure SaveChildStateEx(RootComponent: TComponent; Storage: TStorage; const SectionName, Prefix: string);
procedure LoadChildStateEx(RootComponent: TComponent; Storage: TStorage; const SectionName, Prefix: string);

procedure SaveFormState(Form: TForm; const SectionName, Prefix: string);
procedure LoadFormState(Form: TForm; const SectionName, Prefix: string);

procedure SaveFormStateEx(Form: TForm; Storage: TStorage; const SectionName, Prefix: string);
procedure LoadFormStateEx(Form: TForm; Storage: TStorage; const SectionName, Prefix: string);

var
  Storage: TStorage;
  SuperUser: boolean;



implementation

uses
  Graphics, DBGridUnit, SHFolder, StorageDataUnit, MainUnit;

constructor TStorage.Create;
var
  S: string;
begin
  inherited;
  //в любом случае создаем ini-файл и заполняем содержимое из базы
  S := ExtractFilePath(Application.ExeName);
  if (S[Length(S)]<>'\') then S := S + '\';
  FIniName := S +  'Storage.ini';
  DeleteFile(FIniName);
  FStorIni := TIniFile.Create(FIniName);
  BaseToStorageIni(FIniName);
  //если обычный пользователь, то еще создаем обьект реестра
  if not SuperUser
    then FStorReg := TRegistryIniFile.Create('Software\Epsylon Technologies\' + ChangeFileExt(ExtractFileName(Application.ExeName), ''));
end;

destructor TStorage.Destroy;
begin
  FStorIni.Free;
  if not SuperUser then FStorReg.Free;
  inherited;
end;

function TStorage.ReadString(const Section, Ident, Default: string): String;
begin
  if SuperUser
  then Result := FStorIni.ReadString(Section, Ident, Default)
  else begin
    if FStorReg.ValueExists(Section, Ident)
      then Result := FStorReg.ReadString(Section, Ident, Default)
      else Result := FStorIni.ReadString(Section, Ident, Default);
  end;
end;

function TStorage.ReadInteger(const Section, Ident: String; Default: Longint): Longint;
begin
  if SuperUser
  then Result := FStorIni.ReadInteger(Section, Ident, Default)
  else begin
    if FStorReg.ValueExists(Section, Ident)
      then Result := FStorReg.ReadInteger(Section, Ident, Default)
      else Result := FStorIni.ReadInteger(Section, Ident, Default);
  end;
end;

function TStorage.ReadBool(const Section, Ident: String; Default: Boolean): Boolean;
begin
  if SuperUser
  then Result := FStorIni.ReadBool(Section, Ident, Default)
  else begin
    if FStorReg.ValueExists(Section, Ident)
      then Result := FStorReg.ReadBool(Section, Ident, Default)
      else Result := FStorIni.ReadBool(Section, Ident, Default);
  end;
end;

procedure TStorage.WriteString(const Section, Ident, Value: String);
begin
  if SuperUser
    then FStorIni.WriteString(Section, Ident, Value)
    else FStorReg.WriteString(Section, Ident, Value);
end;

procedure TStorage.WriteInteger(const Section, Ident: String; Value: Longint);
begin
  if SuperUser
    then FStorIni.WriteInteger(Section, Ident, Value)
    else FStorReg.WriteInteger(Section, Ident, Value);
end;

procedure TStorage.WriteBool(const Section, Ident: String; Value: Boolean);
begin
  if SuperUser
    then FStorIni.WriteBool(Section, Ident, Value)
    else FStorReg.WriteBool(Section, Ident, Value);
end;



procedure InitStorage;
begin
  Storage := TStorage.Create;
end;


procedure SaveChildStateEx(RootComponent: TComponent; Storage: TStorage; const SectionName, Prefix: string);
var
  I: Integer;
  C: TComponent;
  IR: IRememberable;
  S: string;
begin
  for I := 0 to RootComponent.ComponentCount - 1 do
  begin
    C := RootComponent.Components[I];
    //для вложенных форм и фреймов вызываем рекурсивно
    if (C is TFrame) or (C is TForm) then begin
      S := SectionName + '\' + C.Name;
      if C.GetInterface(IRememberable, IR) then IR.SaveState(Storage, S, Prefix);
      SaveChildStateEx(C, Storage, S, Prefix);
    end;
  end;
end;

procedure LoadChildStateEx(RootComponent: TComponent; Storage: TStorage; const SectionName, Prefix: string);
var
  I: Integer;
  C: TComponent;
  IR: IRememberable;
  S: string;
begin
  for I := 0 to RootComponent.ComponentCount - 1 do
  begin
    C := RootComponent.Components[I];
    if (C is TFrame) or (C is TForm) then begin
      //для вложенных форм и фреймов вызываем рекурсивно
      S := SectionName + '\' + C.Name;
      if C.GetInterface(IRememberable, IR) then IR.LoadState(Storage, S, Prefix);
      LoadChildStateEx(C, Storage, S, Prefix);
    end;
  end;
end;

procedure SaveChildState(RootComponent: TComponent; const SectionName, Prefix: string);
begin
  try
    SaveChildStateEx(RootComponent, Storage, SectionName, Prefix);
  except
    on E: Exception do Application.HandleException(E);
  end;
end;

procedure LoadChildState(RootComponent: TComponent; const SectionName, Prefix: string);
begin
  try
    if (RootComponent is TWinControl) then LoadChildStateEx(RootComponent, Storage, SectionName, Prefix);
  except
    on E: Exception do Application.HandleException(E);
  end;
end;

procedure SaveState(RootComponent: TComponent; const SectionName, Prefix: string);
begin
  SaveStateEx(RootComponent, Storage, SectionName, Prefix);
end;

procedure LoadState(RootComponent: TComponent; const SectionName, Prefix: string);
begin
  LoadStateEx(RootComponent, Storage, SectionName, Prefix);
end;

procedure SaveStateEx(RootComponent: TComponent; Storage: TStorage; const SectionName, Prefix: string);
var
  IR: IRememberable;
begin
  try
    if RootComponent.GetInterface(IRememberable, IR) then
    begin
      IR.SaveState(Storage, SectionName, Prefix);
    end;
    SaveChildStateEx(RootComponent, Storage, SectionName, Prefix);
  except
    on E: Exception do Application.HandleException(E);
  end;
end;

procedure LoadStateEx(RootComponent: TComponent; Storage: TStorage; const SectionName, Prefix: string);
var
  IR: IRememberable;
begin
  try
    if RootComponent.GetInterface(IRememberable, IR) then
    begin
      IR.LoadState(Storage, SectionName, Prefix);
    end;
    LoadChildStateEx(RootComponent, Storage, SectionName, Prefix);
  except
    on E: Exception do Application.HandleException(E);
  end;
end;

procedure SaveFormState(Form: TForm; const SectionName, Prefix: string);
var
  IR: IRememberable;
begin
  if (Form.Owner<>nil) and (Form.Owner<>MainForm) and (Form.Owner<>Application) then exit; //чтобы не срабатывало для дочерних форм
  SaveFormStateEx(Form, Storage, SectionName, Prefix);
  if Form.GetInterface(IRememberable, IR) then
  begin
    IR.SaveState(Storage, SectionName, Prefix);
  end;
  if not (Form is TMainForm) then SaveChildStateEx(Form, Storage, SectionName, Prefix); //для главной формы не вызываем
end;

procedure LoadFormState(Form: TForm; const SectionName, Prefix: string);
var
  IR: IRememberable;
begin
  if (Form.Owner<>nil) and (Form.Owner<>MainForm) and (Form.Owner<>Application) then exit; //чтобы не срабатывало для дочерних форм
  LoadFormStateEx(Form, Storage, SectionName, Prefix);
  if Form.GetInterface(IRememberable, IR) then
  begin
    IR.LoadState(Storage, SectionName, Prefix);
  end;
  LoadChildStateEx(Form, Storage, SectionName, Prefix);
end;

procedure SaveFormStateEx(Form: TForm; Storage: TStorage; const SectionName, Prefix: string);
var
  XWindowState: TWindowState;

  procedure WriteIntProp(const PropName: string; PropValue: Integer);
  begin
    Storage.WriteInteger(SectionName, Prefix + PropName, PropValue);
  end;

begin
  if Form.BorderStyle = bsSizeable then begin
    if (Form.WindowState = wsMinimized)
      then XWindowState := wsMaximized
      else XWindowState := Form.WindowState;
    WriteIntProp('WindowState', Integer(XWindowState));
  end;
  if Form.WindowState = wsNormal then
  begin
    WriteIntProp('Left', Form.Left);
    WriteIntProp('Top', Form.Top);
    if Form.BorderStyle = bsSizeable then
    begin
      WriteIntProp('Width', Form.Width);
      WriteIntProp('Height', Form.Height);
    end;
  end;
  Storage.WriteInteger(SectionName, Prefix + 'Font.Color', Form.Font.Color);
  Storage.WriteString(SectionName, Prefix + 'Font.Name', Form.Font.Name);
  Storage.WriteInteger(SectionName, Prefix + 'Font.Size', Form.Font.Size);
  Storage.WriteInteger(SectionName, Prefix + 'Font.Style', Byte(Form.Font.Style));
end;

procedure LoadFormStateEx(Form: TForm; Storage: TStorage; const SectionName, Prefix: string);

  function ReadIntProp(const PropName: string; PropValue: Integer): Integer;
  begin
    Result := Storage.ReadInteger(SectionName, Prefix + PropName, PropValue);
  end;

var
  L, T, W, H: Integer;
  Font: TFont;
begin
  if Form.BorderStyle = bsSizeable
    then Form.WindowState := TWindowState(ReadIntProp('WindowState', Integer(Form.WindowState)));
  if Form.WindowState = wsNormal then
  begin
    L := ReadIntProp('Left', Form.Left);
    T := ReadIntProp('Top', Form.Top);
    if Form.BorderStyle = bsSizeable then
    begin
      W := ReadIntProp('Width', Form.Width);
      H := ReadIntProp('Height', Form.Height);
    end else
    begin
      W := Form.Width;
      H := Form.Height;
    end;
    Form.SetBounds(L, T, W, H);
  end;
  Font := TFont.Create;
  try
    Font.Assign(Form.Font);

    Font.Color := Storage.ReadInteger(SectionName, Prefix + 'Font.Color', Font.Color);
    Font.Name := Storage.ReadString(SectionName, Prefix + 'Font.Name', Font.Name);
    Font.Size := Storage.ReadInteger(SectionName, Prefix + 'Font.Size', Font.Size);
    Font.Style := TFontStyles(Byte(Storage.ReadInteger(SectionName, Prefix + 'Font.Style', Byte(Font.Style))));

    Form.Font := Font;
  finally
    Font.Free;
  end;
end;

initialization;
finalization
  Storage.Free;
end.
