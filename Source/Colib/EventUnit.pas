unit EventUnit;

interface

uses
  SysUtils, Classes, IBDatabase;

type
  TDBEvent = (deInsert, deUpdate, deDelete, deReference);

  TDBNotifyEvent = procedure (const TableName: string; Event: TDBEvent; ID: Integer; LocalEvent: Boolean) of object;

procedure RegisterEventHandler(Handler: TDBNotifyEvent; const TableName: string; ID: Integer);
procedure UnregisterEventHandler(Handler: TDBNotifyEvent; const TableName: string; ID: Integer); overload;
procedure UnregisterEventHandler(Handler: TDBNotifyEvent); overload;
procedure PostLocalEvent(const TableName: string; Event: TDBEvent; ID: Integer; Handler: TDBNotifyEvent = nil);
procedure ShutdownEvents;

var
  AlertDataBase: TIBDataBase;
  LocalOnly: Boolean;

implementation

uses
  Contnrs, IBEvents;

type
{ TEventList }

  TEventList = class
  private
    FEvents: TIBEvents;
    FID: Integer;
    FSignaled: Boolean;
    Handlers: array of TDBNotifyEvent;
    procedure EventAlert(Sender: TObject; EventName: string; EventCount: LongInt; var CancelAlerts: Boolean);
  public
    constructor Create(const TableName: string; AID: Integer);
    destructor Destroy; override;
    procedure RegisterEventHandler(Handler: TDBNotifyEvent);
    procedure UnregisterEventHandler(Handler: TDBNotifyEvent);
    procedure PostEvent(const TableName: string; Event: TDBEvent; LocalEvent: Boolean; Handler: TDBNotifyEvent = nil);
    procedure Shutdown;
    property ID: Integer read FID;
  end;

{ TTableEventMan }

  TTableEventMan = class
  private
    FItems: TObjectList;
    FName: string;
    function FindID(ID: Integer): TEventList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RegisterEventHandler(Handler: TDBNotifyEvent; ID: Integer);
    procedure UnregisterEventHandler(Handler: TDBNotifyEvent; ID: Integer); overload;
    procedure UnregisterEventHandler(Handler: TDBNotifyEvent); overload;
    procedure PostEvent(Event: TDBEvent; ID: Integer; LocalEvent: Boolean; Handler: TDBNotifyEvent);
    procedure Shutdown;
    property Name: string read FNAme write FName;
  end;

{ TEventMan }

  TEventMan = class
  private
    FTableMans: TStrings;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RegisterEventHandler(Handler: TDBNotifyEvent; const TableName: string; ID: Integer);
    procedure UnregisterEventHandler(Handler: TDBNotifyEvent; const TableName: string; ID: Integer); overload;
    procedure UnregisterEventHandler(Handler: TDBNotifyEvent); overload;
    procedure PostEvent(const TableName: string; Event: TDBEvent; ID: Integer; LocalEvent: Boolean; Handler: TDBNotifyEvent);
    procedure Shutdown;
  end;

{ TEventList }

constructor TEventList.Create(const TableName: string; AID: Integer);
begin
  inherited Create;
  FID := AID;
  if (AlertDataBase <> nil) and not LocalOnly then
  begin
    FEvents := TIBEvents.Create(nil);
    FEvents.AutoRegister := False;
    FEvents.Database := AlertDataBase;
    FEvents.Events.Text := Format('%0:sI%1:.8x'#13#10'%0:sU%1:.8x'#13#10'%0:sD%1:.8x'#13#10'%0:sR%1:.8x'#13#10, [TableName, ID]);
    FEvents.OnEventAlert := EventAlert;
    FEvents.RegisterEvents;
  end;
end;

destructor TEventList.Destroy;
begin
  Shutdown;
  inherited Destroy;
end;

procedure TEventList.EventAlert(Sender: TObject; EventName: string; EventCount: LongInt; var CancelAlerts: Boolean);
var
  TableName: string;
  Event: TDBEvent;
  ID: Integer;
begin
  CancelAlerts := False;
  if Length(EventName) = 15 then
  begin
    TableName := Copy(EventName, 1, 6);
    case EventName[7] of
      'I': Event := deInsert;
      'U': Event := deUpdate;
      'D': Event := deDelete;
      'R': Event := deReference;
      else Exit;
    end;
    ID := StrToIntDef('$' + Copy(EventName, 8, 8), 0);
    if ID = Self.ID then PostEvent(TableName, Event, False);
  end;
end;

procedure TEventList.RegisterEventHandler(Handler: TDBNotifyEvent);
var
  L: Integer;
begin
  L := Length(Handlers);
  SetLength(Handlers, L + 1);
  Handlers[L] := Handler;
end;

procedure TEventList.UnregisterEventHandler(Handler: TDBNotifyEvent);
var
  L, I: Integer;
  M1, M2: TMethod;
begin
  M1 := TMethod(Handler);
  L := Length(Handlers);
  for I := L - 1 downto 0 do
  begin
    M2 := TMethod(Handlers[I]);
    if (M1.Code = M2.Code) and (M1.Data = M2.Data) then
    begin
      Move(@Handlers[I + 1], @Handlers[I], (L - I) * SizeOf(TDBNotifyEvent));
      Dec(L);
    end;
  end;
  SetLength(Handlers, L);
end;

procedure TEventList.PostEvent(const TableName: string; Event: TDBEvent; LocalEvent: Boolean; Handler: TDBNotifyEvent);
var
  I: Integer;
  M1, M2: TMethod;
  CurrentHandler: TDBNotifyEvent;
begin
  if LocalEvent then
  begin
    FSignaled := True;
  end else
  begin
    if FSignaled then
    begin
      FSignaled := False;
      Exit;
    end;
  end;

  M1 := TMethod(Handler);
  for I := 0 to Length(Handlers) - 1 do
  begin
    CurrentHandler := Handlers[I];
    M2 := TMethod(CurrentHandler);
    if (M1.Code <> M2.Code) or (M1.Data <> M2.Data) then
    begin
      CurrentHandler(TableName, Event, ID, LocalEvent);
    end;
  end;
end;

procedure TEventList.Shutdown;
begin
  if FEvents <> nil then
  begin
    FEvents.UnRegisterEvents;
    FEvents.Free;
    FEvents := nil;
  end;
end;

{ TTableEventMan }

constructor TTableEventMan.Create;
begin
  inherited Create;
  FItems := TObjectList.Create;
end;

destructor TTableEventMan.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

function TTableEventMan.FindID(ID: Integer): TEventList;
var
  I: Integer;
begin
  for I := 0 to FItems.Count - 1 do
  begin
    Result := TEventList(FItems[I]);
    if Result.ID = ID then Exit;
  end;
  Result := nil;
end;

procedure TTableEventMan.RegisterEventHandler(Handler: TDBNotifyEvent; ID: Integer);
var
  Item: TEventList;
begin
  Item := FindID(ID);
  if Item = nil then
  begin
    Item := TEventList.Create(Name, ID);
    FItems.Add(Item);
  end;
  Item.RegisterEventHandler(Handler);
end;

procedure TTableEventMan.UnregisterEventHandler(Handler: TDBNotifyEvent; ID: Integer);
var
  Item: TEventList;
begin
  Item := FindID(ID);
  if Item <> nil then Item.UnregisterEventHandler(Handler);
end;

procedure TTableEventMan.UnregisterEventHandler(Handler: TDBNotifyEvent);
var
  I: Integer;
begin
  for I := 0 to FItems.Count - 1 do TEventList(FItems[I]).UnregisterEventHandler(Handler);
end;

procedure TTableEventMan.PostEvent(Event: TDBEvent; ID: Integer; LocalEvent: Boolean; Handler: TDBNotifyEvent);
var
  Item: TEventList;
begin
  Item := FindID(ID);
  if Item <> nil then Item.PostEvent(Name, Event, LocalEvent, Handler);
end;

procedure TTableEventMan.Shutdown;
var
  I: Integer;
begin
  for I := 0 to FItems.Count - 1 do TEventList(FItems[I]).Shutdown;
end;

{ TEventMan }

constructor TEventMan.Create;
begin
  inherited Create;
  FTableMans := TStringList.Create;
end;

destructor TEventMan.Destroy;
var
  I: Integer;
begin
  if FTableMans <> nil then
  begin
    for I := 0 to FTableMans.Count - 1 do FTableMans.Objects[I].Free;
    FTableMans.Free;
  end;
  inherited Destroy;
end;

procedure TEventMan.RegisterEventHandler(Handler: TDBNotifyEvent; const TableName: string; ID: Integer);
var
  Index: Integer;
  FTableMan: TTableEventMan;
begin
  Index := FTableMans.IndexOf(TableName);
  if Index = -1 then
  begin
    FTableMan := TTableEventMan.Create;
    FTableMan.Name := TableName;
    FTableMans.AddObject(TableName, FTableMan);
  end else FTableMan := TTableEventMan(FTableMans.Objects[Index]);
  FTableMan.RegisterEventHandler(Handler, ID);
end;

procedure TEventMan.UnregisterEventHandler(Handler: TDBNotifyEvent; const TableName: string; ID: Integer);
var
  Index: Integer;
begin
  Index := FTableMans.IndexOf(TableName);
  if Index <> -1 then
  begin
    TTableEventMan(FTableMans.Objects[Index]).UnregisterEventHandler(Handler, ID);
  end;
end;

procedure TEventMan.UnregisterEventHandler(Handler: TDBNotifyEvent);
var
  I: Integer;
begin
  for I := 0 to FTableMans.Count - 1 do
  begin
    TTableEventMan(FTableMans.Objects[I]).UnregisterEventHandler(Handler);
  end;
end;

procedure TEventMan.PostEvent(const TableName: string; Event: TDBEvent; ID: Integer; LocalEvent: Boolean; Handler: TDBNotifyEvent);
var
  Index: Integer;
begin
  Index := FTableMans.IndexOf(TableName);
  if Index <> -1 then
  begin
    TTableEventMan(FTableMans.Objects[Index]).PostEvent(Event, ID, LocalEvent, Handler);
  end;
end;

procedure TEventMan.Shutdown;
var
  I: Integer;
begin
  for I := 0 to FTableMans.Count - 1 do
  begin
    TTableEventMan(FTableMans.Objects[I]).Shutdown;
  end;
end;

var
  FEventMan: TEventMan;

procedure RegisterEventHandler(Handler: TDBNotifyEvent; const TableName: string; ID: Integer);
begin
  if FEventMan = nil then FEventMan := TEventMan.Create;
  FEventMan.RegisterEventHandler(Handler, TableName, ID);
end;

procedure UnregisterEventHandler(Handler: TDBNotifyEvent; const TableName: string; ID: Integer);
begin
  if FEventMan <> nil then FEventMan.UnregisterEventHandler(Handler, TableName, ID);
end;

procedure UnregisterEventHandler(Handler: TDBNotifyEvent);
begin
  if FEventMan <> nil then FEventMan.UnregisterEventHandler(Handler);
end;

procedure PostEvent(const TableName: string; Event: TDBEvent; ID: Integer; LocalEvent: Boolean; Handler: TDBNotifyEvent);
begin
  if FEventMan <> nil then FEventMan.PostEvent(TableName, Event, ID, LocalEvent, Handler);
end;

procedure PostLocalEvent(const TableName: string; Event: TDBEvent; ID: Integer; Handler: TDBNotifyEvent);
begin
  PostEvent(TableName, Event, ID, True, Handler);
  if ID <> 0 then PostEvent(TableName, Event, 0, True, Handler);
end;

procedure ShutdownEvents;
begin
  if FEventMan <> nil then FEventMan.Shutdown;
end;

initialization
finalization
  if FEventMan <> nil then
  begin
    FEventMan.Free;
    FEventMan := nil;
  end;
end.
