unit PdoxUnit;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
{ TLegacyData }

  TLegacyData = class(TDataModule)
    PdoxDatabase: TDatabase;
    NotificationTable: TTable;
    NotificationTableDatuw: TDateField;
    NotificationTableWuw: TStringField;
    NotificationTablePut: TStringField;
    NotificationTableD1: TDateField;
    NotificationTableWr1: TStringField;
    NotificationTableD2: TDateField;
    NotificationTableWr2: TStringField;
    NotificationTableD3: TDateField;
    NotificationTableWr3: TStringField;
    NotificationTableBr1: TStringField;
    NotificationTableBr2: TStringField;
    NotificationTableBr3: TStringField;
    NotificationTablePriem: TStringField;
    NotificationTableSdat: TStringField;
    NotificationTableMetka: TStringField;
    NotificationTableP1: TStringField;
    NotificationTableGdpam: TStringField;
    NotificationTableTw: TSmallintField;
    NotificationTableFlag: TStringField;
    NotificationTableRez: TStringField;
    NotificationSource: TDataSource;
    NotificationTableWuwX: TDateTimeField;
    NotificationTableWr1X: TDateTimeField;
    NotificationTableWr2X: TDateTimeField;
    NakladTable: TTable;
    NakladTableKeypzd: TFloatField;
    NakladTableKeynakl: TFloatField;
    NakladTableNakl: TStringField;
    NakladTableBalans: TStringField;
    NakladTableSt: TStringField;
    NakladTableOtp: TStringField;
    NakladTableOn: TStringField;
    NakladTablePol: TStringField;
    NakladTablePn: TStringField;
    NakladTableDotg: TDateField;
    NakladTableGruz: TSmallintField;
    NakladTableNpw: TSmallintField;
    NakladTableKol: TSmallintField;
    NakladTableWes: TFloatField;
    NakladTableP1: TStringField;
    NakladTableOp: TStringField;
    NakladTableNdog: TStringField;
    NakladTableMlist: TStringField;
    NakladTableGtd: TStringField;
    NakladTableDzakr: TStringField;
    NakladTableD1: TDateField;
    NakladTableW: TStringField;
    NakladTableNpz: TSmallintField;
    NakladTableKols: TSmallintField;
    NakladTableWtt: TStringField;
    NakladTableNrazr: TStringField;
    NakladTableKp: TStringField;
    NakladTableKpn: TStringField;
    NakladTableKpl: TStringField;
    NakladTableKpln: TStringField;
    NakladTableArenda: TStringField;
    NakladTableGruzNam: TStringField;
    NakladTableWX: TDateTimeField;
    NakladSource: TDataSource;
    StationTable: TTable;
    StationTableKod: TStringField;
    StationTableNaim: TStringField;
    StationTableKnaim: TStringField;
    StationTableKodgd: TStringField;
    NaklTable: TTable;
    NaklTableKeypzd: TFloatField;
    NaklTableKeynakl: TFloatField;
    NaklTableNakl: TStringField;
    NaklTableBalans: TStringField;
    NaklTableSt: TStringField;
    NaklTableOtp: TStringField;
    NaklTableOn: TStringField;
    NaklTablePol: TStringField;
    NaklTablePn: TStringField;
    NaklTableDotg: TDateField;
    NaklTableGruz: TSmallintField;
    NaklTableNpw: TSmallintField;
    NaklTableKol: TSmallintField;
    NaklTableWes: TFloatField;
    NaklTableP1: TStringField;
    NaklTableOp: TStringField;
    NaklTableNdog: TStringField;
    NaklTableMlist: TStringField;
    NaklTableGtd: TStringField;
    NaklTableDzakr: TStringField;
    NaklTableD1: TDateField;
    NaklTableW: TStringField;
    NaklTableNpz: TSmallintField;
    NaklTableKols: TSmallintField;
    NaklTableWtt: TStringField;
    NaklTableNrazr: TStringField;
    NaklTableKp: TStringField;
    NaklTableKpn: TStringField;
    NaklTableKpl: TStringField;
    NaklTableKpln: TStringField;
    NaklTableArenda: TStringField;
    TankCarsUTable: TTable;
    TankCarsUTableDatuw: TDateField;
    TankCarsUTableWuw: TStringField;
    TankCarsUTableNom: TSmallintField;
    TankCarsUTableCist: TStringField;
    TankCarsUTableKeypzd: TFloatField;
    TankCarsUTablePzdkr: TFloatField;
    TankCarsUTableKeynakl: TFloatField;
    TankCarsUTableD1: TDateField;
    TankCarsUTableW: TStringField;
    TankCarsUTableNpz: TSmallintField;
    TankCarsUTableNakl: TStringField;
    TankCarsUTableDos: TFloatField;
    TankCarsUTableTlf: TStringField;
    TankCarsUTableSt: TStringField;
    TankCarsUTableStn: TStringField;
    TankCarsUTableOt: TStringField;
    TankCarsUTablePol: TStringField;
    TankCarsUTableGruz: TSmallintField;
    TankCarsUTableGruzn: TStringField;
    TankCarsUTableTip: TStringField;
    TankCarsUTableWzliw: TSmallintField;
    TankCarsUTableBrutto: TFloatField;
    TankCarsUTableWoda: TFloatField;
    TankCarsUTableNetto: TFloatField;
    TankCarsUTableWzliwf: TSmallintField;
    TankCarsUTableV: TFloatField;
    TankCarsUTableBruttof: TFloatField;
    TankCarsUTableNettof: TFloatField;
    TankCarsUTablePkg: TFloatField;
    TankCarsUTableWodaf: TFloatField;
    TankCarsUTableSliw: TStringField;
    TankCarsUTableSliw1: TStringField;
    TankCarsUTableSliwn: TStringField;
    TankCarsUTableRz: TSmallintField;
    TankCarsUTableP1: TStringField;
    TankCarsUTablePl: TFloatField;
    TankCarsUTableKeyact: TFloatField;
    TankCarsUTableNakt: TSmallintField;
    TankCarsUTableDakt: TDateField;
    TankCarsUTableOtpn: TStringField;
    TankCarsUTablePoln: TStringField;
    TankCarsUTableOst: TFloatField;
    TankCarsUTableNa: TSmallintField;
    TankCarsUTableWidost: TStringField;
    TankCarsUTableDatuw1: TDateField;
    TankCarsUTableWuw1: TStringField;
    TankCarsUTableNu: TSmallintField;
    TankCarsUTableWid: TStringField;
    TankCarsUTableZ1: TStringField;
    TankCarsUTableWidakt: TStringField;
    TankCarsUTableNakt1: TSmallintField;
    TankCarsUTableWidunew: TStringField;
    TankCarsUTableNunew: TSmallintField;
    TankCarsUTableDatpam: TDateField;
    TankCarsUTableNpam: TStringField;
    TankCarsUTableMh: TSmallintField;
    TankCarsUTableMm: TSmallintField;
    TankCarsUTableNpernakl: TStringField;
    TankCarsUTableNdog: TStringField;
    TankCarsUTableMlist: TStringField;
    TankCarsUTableSmena: TStringField;
    TankCarsUTableGtd: TStringField;
    TankCarsUTableWnakl: TStringField;
    TankCarsUTableDatsmena: TDateField;
    TankCarsUTableSm: TStringField;
    TankCarsUTableNarush: TStringField;
    TankCarsUTableArenda: TStringField;
    NakladTableSTATION_NAME: TStringField;
    PdoxSession: TSession;
    BasePassTable: TTable;
    DateField1: TDateField;
    StringField1: TStringField;
    SmallintField1: TSmallintField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    DateField2: TDateField;
    StringField3: TStringField;
    SmallintField2: TSmallintField;
    StringField4: TStringField;
    FloatField4: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    SmallintField3: TSmallintField;
    StringField10: TStringField;
    StringField11: TStringField;
    SmallintField4: TSmallintField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    SmallintField5: TSmallintField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    SmallintField6: TSmallintField;
    StringField15: TStringField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    SmallintField7: TSmallintField;
    DateField3: TDateField;
    StringField16: TStringField;
    StringField17: TStringField;
    FloatField15: TFloatField;
    SmallintField8: TSmallintField;
    StringField18: TStringField;
    DateField4: TDateField;
    StringField19: TStringField;
    SmallintField9: TSmallintField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    SmallintField10: TSmallintField;
    StringField23: TStringField;
    SmallintField11: TSmallintField;
    DateField5: TDateField;
    StringField24: TStringField;
    SmallintField12: TSmallintField;
    SmallintField13: TSmallintField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    DateField6: TDateField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    OtTable: TTable;
    PolTable: TTable;
    OtTableKod: TStringField;
    OtTableKnaim: TStringField;
    OtTableOt: TStringField;
    OtTablePol: TStringField;
    PolTableKod: TStringField;
    PolTableKnaim: TStringField;
    PolTableOt: TStringField;
    PolTablePol: TStringField;
    procedure NotificationTableCalcFields(DataSet: TDataSet);
    procedure NakladTableCalcFields(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    function GetStationName(const StationCode: string): string;
    function GetNaklOwnerName(const Nakl: string): string;
    function GetNaklSent(const Nakl: string): TDateTime;
    function GetNaklKeys(const Nakl: string; var KeyPzd, KeyNakl: Currency): Boolean;
    function GetTrainInfo(Train: Word; Arrival: TDateTime; var OwnerName: string;
      var Sent: TDateTime): Boolean;
    function GetOtName(const CompanyCode: string): string;
    function GetPolName(const CompanyCode: string): string;
  end;

var
  LegacyData: TLegacyData;

function StrToTimeX(const S: string): TDateTime;

implementation

uses
  DateUtils, Variants, DataUnit;

{$R *.dfm}

function StrToTimeX(const S: string): TDateTime;
var
  S1: string;
begin
  Result := 0;
  if Length(S) = 5 then
  begin
    S1 := S;
    S1[3] := TimeSeparator;
    Result := StrToTimeDef(S1, Result);
  end;
end;

procedure TLegacyData.NotificationTableCalcFields(DataSet: TDataSet);
begin
  NotificationTableWuwX.AsDateTime :=
    NotificationTableDatuw.AsDateTime +
    StrToTimeX(NotificationTableWuw.AsString);
  NotificationTableWr1X.AsDateTime :=
    NotificationTableD1.AsDateTime +
    StrToTimeX(NotificationTableWr1.AsString);
  NotificationTableWr2X.AsDateTime :=
    NotificationTableD2.AsDateTime +
    StrToTimeX(NotificationTableWr2.AsString);
end;

procedure TLegacyData.NakladTableCalcFields(DataSet: TDataSet);
begin
  NakladTableGruzNam.AsString := CommonData.GetProductDescr(NakladTableGruz.AsInteger);
  NakladTableWX.AsDateTime := NakladTableD1.AsDateTime + StrToTimeX(NakladTableW.AsString);
  NakladTableSTATION_NAME.AsString := GetStationName(NakladTableSt.AsString);
end;

function TLegacyData.GetStationName(const StationCode: string): string;
begin
  StationTable.Open;
  try
    if StationTable.Locate('Kod', StationCode, [])
      then Result := StationTableNaim.AsString
      else Result := '';
  finally
    StationTable.Close;
  end;
end;

function TLegacyData.GetOtName(const CompanyCode: string): string;
begin
  OtTable.Open;
  try
    if OtTable.Locate('Kod', CompanyCode, [])
      then Result := OtTableKnaim.AsString
      else Result := '';
  finally
    OtTable.Close;
  end;
end;

function TLegacyData.GetPolName(const CompanyCode: string): string;
begin
  PolTable.Open;
  try
    if PolTable.Locate('Kod', CompanyCode, [])
      then Result := PolTableKnaim.AsString
      else Result := '';
  finally
    PolTable.Close;
  end;
end;

function TLegacyData.GetNaklOwnerName(const Nakl: string): string;
begin
  NaklTable.Open;
  try
    if NaklTable.Locate('Nakl', Nakl, [])
      then Result := NaklTableOn.AsString
      else Result := '';
  finally
    NaklTable.Close;
  end;
end;

function TLegacyData.GetNaklSent(const Nakl: string): TDateTime;
begin
  NaklTable.Open;
  try
    if NaklTable.Locate('Nakl', Nakl, [])
      then Result := NaklTableDotg.AsDateTime
      else Result := 0;
  finally
    NaklTable.Close;
  end;
end;

function TLegacyData.GetNaklKeys(const Nakl: string; var KeyPzd, KeyNakl: Currency): Boolean;
begin
  NaklTable.Open;
  try
    Result := NaklTable.Locate('Nakl', Nakl, []);
    if Result then
    begin
      KeyPzd := NaklTableKeypzd.AsCurrency;
      KeyNakl := NaklTableKeynakl.AsCurrency;
    end;
  finally
    NaklTable.Close;
  end;
end;

function TLegacyData.GetTrainInfo(Train: Word; Arrival: TDateTime;
  var OwnerName: string; var Sent: TDateTime): Boolean;
begin
  NaklTable.Open;
  try
    Result := NaklTable.Locate('D1;W;Npz', VarArrayOf(
        [DateOf(Arrival), FormatDateTime('hh.nn', Arrival), Train]), []);
    if Result then
    begin
      OwnerName := NaklTableOn.AsString;
      Sent := NaklTableDotg.AsDateTime;
    end;
  finally
    NaklTable.Close;
  end;
end;

procedure TLegacyData.DataModuleDestroy(Sender: TObject);
begin
  PdoxDatabase.Connected := False;
  PdoxSession.Active := False;
  PdoxSession.SessionName := '';
  PdoxDatabase.SessionName := '';

  PdoxDatabase.Free;
end;

end.
