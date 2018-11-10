unit DataLookupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LookupUnit, DB, Grids, DBGridEh, StdCtrls, ExtCtrls,
  IBCustomDataSet, IBQuery, DataUnit, DbGridUnit;

type
{ TDataLookupForm }

  TDataLookupForm = class(TLookupForm)
    ListQuery: TIBQuery;
  private
    //
  public
    class function LookupRecord(const Caption, SQL, StorageSection: string;
      ColumnInfos: array of TColumnInfo;
      const FieldName: string; Value: Variant): Variant; overload;
    class function LookupRecord(const Caption, SQL, StorageSection: string;
      ColumnInfos: array of TColumnInfo; const FieldName: string;
      var Value: Variant; var Values: Variant): Boolean; overload;
  end;

var
  DataLookupForm: TDataLookupForm;

function LookupLRoute(var LRouteID, StationID, ProductID,
  SenderID, OwnerID, ManufactID: Variant): Boolean;

function FillLookupLRoute(var LRouteID, StationID, ProductID,
  SenderID, OwnerID: Variant): Boolean;

function LookupAttribute(AttrId: Integer): Integer;
function LookupAttributeType(TypeId: Integer): Integer;
function LookupProduct(ProductId: Integer): Integer;
function LookupCompany(CompanyId: Integer): Integer;
function LookupProductGroup(GroupId: Integer): Integer;
function LookupTank(TankId: Integer): Integer;

function LookupStation(StationId: Integer): Integer; overload;
function LookupStation(var StationId: Integer; var StName: string): Boolean; overload;

function LookupBill(var BillId: Integer; var BillName: string): Boolean;
function LookupTrainCar(TrainId: Integer; var CarId: Integer; var CarNumber: string;
  var BillId: Integer; var BillName: string): Boolean;
function LookupAloneCar(Number: Integer; var CarId: Integer): Boolean;
function LookupCarType(var CTypeId: Integer): Boolean;

function LookupCountry(CountryId: Integer): Integer;

function LookupTrainCar2(TrainId: Integer; var Number, CarId: Integer): Boolean;
function LookupAloneCar2(var Number, CarId: Integer): Boolean;
function LookupExtraAttrO(QpoId: Integer; var AttrId: Integer): Boolean;
function LookupExtraAttrB(QpbId: Integer; var AttrId: Integer): Boolean;
function FillLookupExtraAttr(QpbId: Integer; var AttrId: Integer): Boolean;

function FillSelectDecStation(AStation: string; var AStationID: integer; var AStationName: string): Boolean;
function FillSelectDecSender(ASender: string; var ASenderID: integer; var ASenderName: string): Boolean;
function FillSelectDecOwner(AOwner: string; var AOwnerID: integer; var AOwnerName: string): Boolean;

function LookupForArrivInfo(var ProductID, OwnerID: integer; var StationName: string): Boolean;

function EmSelectRecip(AStation: string; var ARecipID: integer; var ARecipName: string): Boolean;
function EmSelectStationRecip(AStationID: integer; AStation: string;
  var ARecipID: integer; var ARecipName: string): Boolean;

implementation

uses MainUnit;

{$R *.dfm}

function LookupLRoute(var LRouteID, StationID, ProductID,
  SenderID, OwnerID, ManufactID: Variant): Boolean;
const
  ColumnInfos: array [0..4] of TColumnInfo =
  ( (FieldName: 'STATION_NAME'; Title: 'Станция'; Width: 120),
    (FieldName: 'PRODUCT_NAME'; Title: 'Груз'; Width: 120),
    (FieldName: 'SENDER_NAME'; Title: 'Отправитель'; Width: 120),
    (FieldName: 'OWNER_NAME'; Title: 'Получатель'; Width: 120),
    (FieldName: 'MANUFACT_NAME'; Title: 'Производитель'; Width: 120) );
var
  Values: Variant;
begin
  Result := TDataLookupForm.LookupRecord('Выбор маршрута следования',
    'select L.LROUTE_ID, L.STATION_ID, L.PRODUCT_ID, L.SENDER_ID, L.OWNER_ID,'#13#10 +
    '    L.MANUFACT_ID, S.NAME as STATION_NAME, P.DESCR as PRODUCT_NAME,'#13#10 +
    '    CS.SHORT_NAME as SENDER_NAME, CO.SHORT_NAME as OWNER_NAME, CM.SHORT_NAME as MANUFACT_NAME'#13#10 +
    '  from LROUTES L'#13#10 +
    '  left join STATIONS S on (S.STATION_ID = L.STATION_ID)'#13#10 +
    '  left join PRODUCTS P on (P.ID = L.PRODUCT_ID)'#13#10 +
    '  left join COMPANIES CS on (CS.COMPANY_ID = L.SENDER_ID)'#13#10 +
    '  left join COMPANIES CO on (CO.COMPANY_ID = L.OWNER_ID)'#13#10 +
    '  left join COMPANIES CM on (CM.COMPANY_ID = L.MANUFACT_ID)'#13#10+
    '  order by S.NAME, P.ID, CO.NAME, CS.NAME, CM.NAME',
    'TDataLookup.LROUTES', ColumnInfos, 'LROUTE_ID', LRouteID, Values);
  if Result then
  begin
    StationID := Values[1];
    ProductID := Values[2];
    SenderID := Values[3];
    OwnerID := Values[4];
    ManufactID := Values[5];
  end
end;

function FillLookupLRoute(var LRouteID, StationID, ProductID,
  SenderID, OwnerID: Variant): Boolean;
const
  ColumnInfos: array [0..3] of TColumnInfo =
  ( (FieldName: 'STATION_NAME'; Title: 'Станция'; Width: 120),
    (FieldName: 'PRODUCT_NAME'; Title: 'Груз'; Width: 120),
    (FieldName: 'OWNER_NAME'; Title: 'Получатель'; Width: 120),
    (FieldName: 'SENDER_NAME'; Title: 'Отправитель'; Width: 120) );
var
  Values: Variant;
begin
  Result := TDataLookupForm.LookupRecord('Выбор маршрута следования',
    'select L.LROUTE_ID, L.STATION_ID, L.PRODUCT_ID, L.SENDER_ID, L.OWNER_ID,'#13#10 +
    '    S.NAME as STATION_NAME, P.DESCR as PRODUCT_NAME,'#13#10 +
    '    CS.SHORT_NAME as SENDER_NAME, CO.SHORT_NAME as OWNER_NAME'#13#10 +
    '  from FILL_LROUTES L'#13#10 +
    '  left join STATIONS S on (S.STATION_ID = L.STATION_ID)'#13#10 +
    '  left join FILL_PRODUCTS P on (P.ID = L.PRODUCT_ID)'#13#10 +
    '  left join COMPANIES CS on (CS.COMPANY_ID = L.SENDER_ID)'#13#10 +
    '  left join COMPANIES CO on (CO.COMPANY_ID = L.OWNER_ID)'#13#10 +
    '  order by S.NAME, P.ID, CO.NAME, CS.NAME',
    'TDataLookup.FLROUTES', ColumnInfos, 'LROUTE_ID', LRouteID, Values);
  if Result then
  begin
    StationID := Values[1];
    ProductID := Values[2];
    SenderID := Values[3];
    OwnerID := Values[4];
  end
end;


function LookupExtraAttrO(QpoId: Integer; var AttrId: Integer): Boolean;
const
  ColumnInfos: array [0..2] of TColumnInfo =
  ( (FieldName: 'NAME'; Title: 'Название'; Width: 80),
    (FieldName: 'DESCR'; Title: 'Описание'; Width: 180),
    (FieldName: 'TYPE_DESCR'; Title: 'Тип'; Width: 180) );
var
  Value, Values: Variant;
begin
  Value := Unassigned;
  Result := TDataLookupForm.LookupRecord('Выбор дополнительного атрибута',
    'select A.ID, A.NAME, A.DESCR, T.DESCR as TYPE_DESCR' +
    '  from ATTRIBUTES A' +
    '  left join ATTR_TYPES T on (T.ID = A.TYPE_ID)' +
    '  where not (A.ID in' +
    '              ( select ATTR_ID from QPO_SELECT_ATTR2(' + IntToStr(QpoId) + ', 0, ' + IntToStr(Integer(MainForm.ApplicationKind)) + ') )' +
    '            )',
    'TDataLookup.ATTRIBUTES.QP', ColumnInfos, 'ID', Value, Values);
  if Result then AttrId := Value;
end;

function LookupExtraAttrB(QpbId: Integer; var AttrId: Integer): Boolean;
const
  ColumnInfos: array [0..2] of TColumnInfo =
  ( (FieldName: 'NAME'; Title: 'Название'; Width: 80),
    (FieldName: 'DESCR'; Title: 'Описание'; Width: 180),
    (FieldName: 'TYPE_DESCR'; Title: 'Тип'; Width: 180) );
var
  Value, Values: Variant;
begin
  Value := Unassigned;
  Result := TDataLookupForm.LookupRecord('Выбор дополнительного атрибута',
    'select A.ID, A.NAME, A.DESCR, T.DESCR as TYPE_DESCR' +
    '  from ATTRIBUTES A' +
    '  left join ATTR_TYPES T on (T.ID = A.TYPE_ID)' +
    '  where not (A.ID in' +
    '              ( select ATTR_ID from QPB_SELECT_ATTR(' + IntToStr(QpbId) + ', 0) )' +
    '            )',
    'TDataLookup.ATTRIBUTES.QP', ColumnInfos, 'ID', Value, Values);
  if Result then AttrId := Value;
end;

function FillLookupExtraAttr(QpbId: Integer; var AttrId: Integer): Boolean;
const
  ColumnInfos: array [0..2] of TColumnInfo =
  ( (FieldName: 'NAME'; Title: 'Название'; Width: 80),
    (FieldName: 'DESCR'; Title: 'Описание'; Width: 180),
    (FieldName: 'TYPE_DESCR'; Title: 'Тип'; Width: 180) );
var
  Value, Values: Variant;
begin
  Value := Unassigned;
  Result := TDataLookupForm.LookupRecord('Выбор дополнительного атрибута',
    'select A.ID, A.NAME, A.DESCR, T.DESCR as TYPE_DESCR' +
    '  from ATTRIBUTES A' +
    '  left join ATTR_TYPES T on (T.ID = A.TYPE_ID)' +
    '  where not (A.ID in' +
    '              ( select ATTR_ID from FILL_QPB_SELECT_ATTR(' + IntToStr(QpbId) + ') )' +
    '            )',
    'TDataLookup.FATTRIBUTES.QP', ColumnInfos, 'ID', Value, Values);
  if Result then AttrId := Value;
end;


function LookupAttribute(AttrId: Integer): Integer;
const
  ColumnInfos: array [0..2] of TColumnInfo =
  ( (FieldName: 'NAME'; Title: 'Название'; Width: 80),
    (FieldName: 'DESCR'; Title: 'Описание'; Width: 180),
    (FieldName: 'TYPE_DESCR'; Title: 'Тип'; Width: 180) );
begin
  Result := TDataLookupForm.LookupRecord('Выбор атрибута',
    'select A.ID, A.NAME, A.DESCR, ATT.DESCR as TYPE_DESCR' +
    '  from ATTRIBUTES A' +
    '  left join ATTR_TYPES ATT on ATT.ID = A.TYPE_ID',
    'TDataLookup.ATTRIBUTES', ColumnInfos, 'ID', AttrId);
end;

function LookupAttributeType(TypeId: Integer): Integer;
const
  ColumnInfos: array [0..5] of TColumnInfo =
  ( (FieldName: 'DESCR'; Title: 'Описание'; Width: 100),
    (FieldName: 'RAW_NAME'; Title: 'Тип'; Width: 80),
    (FieldName: 'MIN_VALUE'; Title: 'Минимум'; Width: 64),
    (FieldName: 'MAX_VALUE'; Title: 'Максимум'; Width: 64),
    (FieldName: 'DEFAULT_VALUE'; Title: 'По умолчанию'; Width: 64),
    (FieldName: 'VALUE_PRECISION'; Title: 'Точность'; Width: 64) );
begin
  Result := TDataLookupForm.LookupRecord('Выбор типа атрибута',
    'select ID, DESCR, RAW_NAME, MIN_VALUE, MAX_VALUE,' +
    '  DEFAULT_VALUE, VALUE_PRECISION' +
    '  from ATTR_TYPE_LIST',
    'TDataLookup.ATTR_TYPES', ColumnInfos, 'ID', TypeId);
end;

function LookupProduct(ProductId: Integer): Integer;
const
  ColumnInfos: array [0..2] of TColumnInfo =
  ( (FieldName: 'ID'; Title: 'Код'; Width: 64),
    (FieldName: 'DESCR'; Title: 'Описание'; Width: 180),
    (FieldName: 'GROUP_DESCR'; Title: 'Группа'; Width: 180) );
begin
  Result := TDataLookupForm.LookupRecord('Выбор груза',
    'select P.ID, P.DESCR, PG.DESCR as GROUP_DESCR' +
    '  from PRODUCTS P' +
    '  left join PR_GROUPS PG on PG.GROUP_ID = P.GROUP_ID',
    'TDataLookup.PRODUCTS', ColumnInfos, 'ID', ProductId);
end;

function LookupCompany(CompanyId: Integer): Integer;
const
  ColumnInfos: array [0..2] of TColumnInfo =
  ( (FieldName: 'SHORT_NAME'; Title: 'Краткое наим.'; Width: 150),
    (FieldName: 'NAME'; Title: 'Наименование'; Width: 150),
    (FieldName: 'ADD_CODE'; Title: 'Код UDBD'; Width: 100));
begin
  Result := TDataLookupForm.LookupRecord('Выбор организации',
    'select COMPANY_ID, SHORT_NAME, NAME, ADD_CODE' +
    '  from COMPANIES' +
    '  order by SHORT_NAME', 
    'TDataLookup.COMPANIES', ColumnInfos, 'COMPANY_ID', CompanyId);
end;

function LookupProductGroup(GroupId: Integer): Integer;
const
  ColumnInfos: array [0..1] of TColumnInfo =
  ( (FieldName: 'NAME'; Title: 'Название'; Width: 100),
    (FieldName: 'DESCR'; Title: 'Описание'; Width: 200) );
begin
  Result := TDataLookupForm.LookupRecord('Выбор группы грузов',
    'select GROUP_ID, NAME, DESCR' +
    '  from PR_GROUPS',
    'TDataLookup.PR_GROUPS', ColumnInfos, 'GROUP_ID', GroupId);
end;

function LookupTank(TankId: Integer): Integer;
const
  ColumnInfos: array [0..1] of TColumnInfo =
  ( (FieldName: 'TANK_ID'; Title: 'Номер'; Width: 80),
    (FieldName: 'NAME'; Title: 'Название'; Width: 280) );
begin
  Result := TDataLookupForm.LookupRecord('Выбор резервуара',
    'select T.TANK_ID, T.NAME' +
    '  from TANKS T',
    'TDataLookup.TANKS', ColumnInfos, 'TANK_ID', TankId);
end;

function LookupStation(StationId: Integer): Integer;
var
  StName: string;
begin
  LookupStation(StationId, StName);
  Result := StationId;
end;

function LookupStation(var StationId: Integer; var StName: string): Boolean; overload;
const
  ColumnInfos: array [0..3] of TColumnInfo =
  ( (FieldName: 'STATION_ID'; Title: 'Код'; Width: 80; Format: '000000'),
    (FieldName: 'RROAD_ID'; Title: 'Код ж/д'; Width: 80; Format: '000'),
    (FieldName: 'NAME'; Title: 'Название'; Width: 280),
    (FieldName: 'SHORT_NAME'; Title: 'Сокращенно'; Width: 100) );
var
  Value, Values: Variant;
begin
  Value := StationId;
  Result := TDataLookupForm.LookupRecord('Выбор станции',
    'select S.STATION_ID, S.RROAD_ID, S.NAME, S.SHORT_NAME' +
    '  from STATIONS S',
    'TDataLookup.STATIONS', ColumnInfos, 'STATION_ID', Value, Values);
  if Result then
  begin
    StationId := Value;
    if not VarIsNull(Values[2]) then StName := Values[2];
  end;
end;

function LookupBill(var BillId: Integer; var BillName: string): Boolean; overload;
const
  ColumnInfos: array [0..3] of TColumnInfo =
  ( (FieldName: 'NUMBER'; Title: 'Накладная'; Width: 100),
    (FieldName: 'TRAIN_NUMBER'; Title: 'Поезд|Номер'; Width: 80; Format: '0000'),
    (FieldName: 'TRAIN_ARRIVAL'; Title: 'Поезд|Дата'; Width: 80; Format: 'dd.mm.yyyy'),
    (FieldName: 'MASTER_NUMBER'; Title: 'Основная'; Width: 100) );
var
  Value, Values: Variant;
begin
  Value := BillId;
  Result := TDataLookupForm.LookupRecord('Выбор накладной',
    'select B.BILL_ID, B.NUMBER, T.NUMBER as TRAIN_NUMBER,' +
    '  cast(T.ARRIVAL as date) as TRAIN_ARRIVAL, M.NUMBER as MASTER_NUMBER' +
    '  from WAYBILLS B' +
    '  left join IN_TRAINS T on T.TRAIN_ID = B.TRAIN_ID' +
    '  left join WAYBILLS M on B.MASTER_ID = M.BILL_ID',
    'TDataLookup.WAYBILLS', ColumnInfos, 'BILL_ID', Value, Values);
  if Result then
  begin
    BillId := Value;
    if not VarIsNull(Values[1]) then BillName := Values[1];
  end;
end;

function LookupTrainCar(TrainId: Integer; var CarId: Integer; var CarNumber: string;
  var BillId: Integer; var BillName: string): Boolean;
const
  ColumnInfos: array [0..3] of TColumnInfo =
  ( (FieldName: 'NUMBER'; Title: 'Номер в/ц'; Width: 100; Format: '00000000'),
    (FieldName: 'TRAIN_NUMBER'; Title: 'Поезд|Номер'; Width: 80; Format: '0000'),
    (FieldName: 'TRAIN_ARRIVAL'; Title: 'Поезд|Дата'; Width: 80; Format: 'dd.mm.yyyy'),
    (FieldName: 'BILL_NUMBER'; Title: 'Накладная'; Width: 100) );
var
  Value, Values: Variant;
begin
  Value := CarId;
  Result := TDataLookupForm.LookupRecord('Выбор пришедшей в/ц',
    'select C.CAR_ID, C.NUMBER, C.BILL_ID, T.NUMBER as TRAIN_NUMBER,' +
    '  cast(T.ARRIVAL as date) as TRAIN_ARRIVAL, B.NUMBER as BILL_NUMBER' +
    '  from IN_CARS C' +
    '  left join IN_TRAINS T on T.TRAIN_ID = C.TRAIN_ID' +
    '  left join WAYBILLS B on B.BILL_ID = C.BILL_ID' +
    '  where C.TRAIN_ID = ' + IntToStr(TrainId),
    'TDataLookup.IN_TRAIN.IN_CARS', ColumnInfos, 'CAR_ID', Value, Values);
  if Result then
  begin
    CarId := Value;
    if not VarIsNull(Values[1]) then CarNumber := Values[1];
    if not VarIsNull(Values[2]) then BillId := Values[2];
    if not VarIsNull(Values[5]) then BillName := Values[5];
  end;
end;

function LookupAloneCar2(var Number, CarId: Integer): Boolean;
const
  ColumnInfos: array [0..3] of TColumnInfo =
  ( (FieldName: 'NUMBER'; Title: 'Номер в/ц'; Width: 100; Format: '00000000'),
    (FieldName: 'TRAIN_NUMBER'; Title: 'Поезд|Номер'; Width: 80; Format: '0000'),
    (FieldName: 'TRAIN_DATE'; Title: 'Поезд|Дата'; Width: 80; Format: 'dd.mm.yyyy'),
    (FieldName: 'TRAIN_TIME'; Title: 'Поезд|Время'; Width: 60; Format: 'hh:nn'));
var
  Value, Values: Variant;
begin
  Value := CarId;
  Result := TDataLookupForm.LookupRecord('Выбор в/ц для подачи',
    'select C.CAR_ID, C.NUMBER, C.TRAIN_ID, T.NUMBER as TRAIN_NUMBER, T.ARRIVAL,'#13#10 +
    '    cast(T.ARRIVAL as date) as TRAIN_DATE,'#13#10 +
    '    cast(T.ARRIVAL as time) as TRAIN_TIME,'#13#10 +
    '    C.PORDER_ID, C.CTYPE_ID, CT.NAME as TYPE_NAME,'#13#10 +
    '    P.DT_P, N.DT_B, C.WEIGHT_BB, C.WEIGHT_BN, C.REMAINDER, C.OWNERSHIP,'#13#10 +
    '    C.WEIGHT_OB, C.WEIGHT_ON, C.UPLOAD_B, B.NUMBER as BILL_NUMBER'#13#10 +
    '  from IN_CARS C'#13#10 +
    '  left join NOTIFICATIONS N on (N.NOTIF_ID = C.NOTIF_ID)'#13#10 +
    '  left join PLACEMENTS P on (P.PLAC_ID = N.PLAC_ID)'#13#10 +
    '  left join CAR_TYPES CT on (CT.CTYPE_ID = C.CTYPE_ID)'#13#10 +
    '  left join IN_TRAINS T on (T.TRAIN_ID = C.TRAIN_ID)'#13#10 +
    '  left join WAYBILLS B on (B.BILL_ID = C.BILL_ID)'#13#10 +
    '  where (C.NOTIF_ID is null) or (CAR_ID = ' + IntToStr(CarId) + ')',
    'TDataLookup.IN_CARS.NOTIFICATION', ColumnInfos, 'CAR_ID', Value, Values);
  if Result then
  begin
    CarId := Value;
    Number := Values[1];
  end;
end;

function LookupAloneCar(Number: Integer; var CarId: Integer): Boolean;
const
  ColumnInfos: array [0..2] of TColumnInfo =
  ( (FieldName: 'NUMBER'; Title: 'Номер в/ц'; Width: 100; Format: '00000000'),
    (FieldName: 'TRAIN_NUMBER'; Title: 'Поезд|Номер'; Width: 80; Format: '0000'),
    (FieldName: 'TRAIN_ARRIVAL'; Title: 'Поезд|Дата'; Width: 80; Format: 'dd.mm.yyyy'));
var
  Value, Values: Variant;
begin
  Value := 0;
  Result := TDataLookupForm.LookupRecord('Выбор в/ц без документов',
    'select C.CAR_ID, C.NUMBER, T.NUMBER as TRAIN_NUMBER,' +
    '    cast(T.ARRIVAL as date) as TRAIN_ARRIVAL' +
    '  from IN_CARS C' +
    '  left join IN_TRAINS T on (T.TRAIN_ID = C.TRAIN_ID)' +
    '  where (C.BILL_ID is null) and (C.NUMBER = ' + IntToStr(Number) + ')',
    'TDataLookup.IN_CARS.ALONE', ColumnInfos, 'CAR_ID', Value, Values);
  if Result then CarId := Value;
end;

function LookupTrainCar2(TrainId: Integer; var Number, CarId: Integer): Boolean;
const
  ColumnInfos: array [0..1] of TColumnInfo =
  ( (FieldName: 'NUMBER'; Title: 'Номер в/ц'; Width: 100; Format: '00000000'),
    (FieldName: 'BILL_NUMBER'; Title: 'Накладная'; Width: 100) );
var
  Value, Values: Variant;
begin
  Value := Number;
  Result := TDataLookupForm.LookupRecord('Прибывшие в/ц',
    'select C.CAR_ID, C.NUMBER, B.NUMBER as BILL_NUMBER' +
    '  from IN_CARS C' +
    '  left join WAYBILLS B on (C.BILL_ID = B.BILL_ID)' +
    '  where (C.TRAIN_ID = ' + IntToStr(TrainId) + ')',
    'TDataLookup.IN_CARS.IN_TRAINS', ColumnInfos, 'NUMBER', Value, Values);
  if Result then
  begin
    Number := Value;
    CarId := Values[0];
  end;
end;

function LookupCarType(var CTypeId: Integer): Boolean;
const
  ColumnInfos: array [0..1] of TColumnInfo =
  ( (FieldName: 'NAME'; Title: 'Тип в/ц'; Width: 100),
    (FieldName: 'VOLUME'; Title: 'Объем'; Width: 100) );
var
  Value, Values: Variant;
begin
  Value := CTypeId;
  Result := TDataLookupForm.LookupRecord('Выбор типа вагоноцистерны',
    'select CTYPE_ID, NAME, VOLUME' +
    '  from CAR_TYPES',
    'TDataLookup.CAR_TYPES', ColumnInfos, 'CTYPE_ID', Value, Values);
  if Result then CTypeId := Value;
end;

function LookupCountry(CountryId: Integer): Integer;
const
  ColumnInfos: array [0..2] of TColumnInfo =
  ( (FieldName: 'NUMBER'; Title: 'Код'; Width: 80),
    (FieldName: 'NAME'; Title: 'Название'; Width: 280),
    (FieldName: 'SHORT_NAME'; Title: 'Сокращенно'; Width: 180) );
begin
  Result := TDataLookupForm.LookupRecord('Выбор страны',
    'select C.COUNTRY_ID, C.NUMBER, C.NAME' +
    '  from COUNTRIES C',
    'TDataLookup.COUNTRIES', ColumnInfos, 'COUNTRY_ID', CountryId);
end;

function FillSelectDecStation(AStation: string; var AStationID: integer; var AStationName: string): Boolean;
const
  ColumnInfos: array [0..1] of TColumnInfo =
  ( (FieldName: 'NAME'; Title: 'Название'; Width: 280),
    (FieldName: 'STATION_CODE'; Title: 'Код'; Width: 100) );
var
  Value, Values: Variant;
begin
  Result := TDataLookupForm.LookupRecord('Выбор станции, соответствующей <'+AStation+'>',
    'select S.STATION_ID, S.NAME, S.STATION_CODE' +
    '  from STATIONS S order by S.NAME',
    'TDataLookup.DECSTATIONS', ColumnInfos, 'STATION_ID', Value, Values);
  if Result then begin
    AStationID:=Value;
    AStationName:=Values[1];
  end;
end;

function FillSelectDecSender(ASender: string; var ASenderID: integer; var ASenderName: string): Boolean;
const
  ColumnInfos: array [0..3] of TColumnInfo =
  ( (FieldName: 'SHORT_NAME'; Title: 'Краткое наим.'; Width: 150),
    (FieldName: 'NAME'; Title: 'Наименование'; Width: 150),
    (FieldName: 'RAILROAD_CODE'; Title: 'Код Ж/Д'; Width: 70),
    (FieldName: 'OKPO_CODE'; Title: 'Код ОКПО'; Width: 70));
var
  Value, Values: Variant;
begin
  Result := TDataLookupForm.LookupRecord('Выбор отправителя, соответствующего <'+ASender+'>',
    'select COMPANY_ID, NAME, SHORT_NAME, RAILROAD_CODE, OKPO_CODE' +
    '  from COMPANIES' +
    '  where FILL_IS_SENDER=1' +
    '  order by SHORT_NAME',
    'TDataLookup.DECSENDER', ColumnInfos, 'COMPANY_ID', Value, Values);
  if Result then begin
    ASenderID:=Value;
    ASenderName:=Values[1];
  end;
end;

function FillSelectDecOwner(AOwner: string; var AOwnerID: integer; var AOwnerName: string): Boolean;
const
  ColumnInfos: array [0..3] of TColumnInfo =
  ( (FieldName: 'SHORT_NAME'; Title: 'Краткое наим.'; Width: 150),
    (FieldName: 'NAME'; Title: 'Наименование'; Width: 150),
    (FieldName: 'RAILROAD_CODE'; Title: 'Код Ж/Д'; Width: 70),
    (FieldName: 'OKPO_CODE'; Title: 'Код ОКПО'; Width: 70));
var
  Value, Values: Variant;
begin
  Result := TDataLookupForm.LookupRecord('Выбор получателя, соответствующего <'+AOwner+'>',
    'select COMPANY_ID, NAME, SHORT_NAME, RAILROAD_CODE, OKPO_CODE' +
    '  from COMPANIES' +
    '  where FILL_IS_OWNER=1' +
    '  order by SHORT_NAME',
    'TDataLookup.DECOWNER', ColumnInfos, 'COMPANY_ID', Value, Values);
  if Result then begin
    AOwnerID:=Value;
    AOwnerName:=Values[1];
  end;
end;

function LookupForArrivInfo(var ProductID, OwnerID: integer; var StationName: string): Boolean;
const
  ColumnInfos: array [0..2] of TColumnInfo =
  ( (FieldName: 'STATION_NAME'; Title: 'Станция'; Width: 150),
    (FieldName: 'PRODUCT_NAME'; Title: 'Груз'; Width: 150),
    (FieldName: 'OWNER_NAME'; Title: 'Получатель'; Width: 150));
var
  Value, Values: Variant;
begin
  Result := TDataLookupForm.LookupRecord('Выбор станции-груза-получателя',
    'select distinct S.STATION_ID, S.NAME as STATION_NAME,' +
    '  P.ID, P.DESCR as PRODUCT_NAME, O.COMPANY_ID, O.SHORT_NAME as OWNER_NAME' +
    ' from LROUTES L' +
    '  left join STATIONS S on S.STATION_ID = L.STATION_ID' +
    '  left join PRODUCTS P on P.ID = L.PRODUCT_ID' +
    '  left join COMPANIES O on O.COMPANY_ID = L.OWNER_ID' +
    ' order by S.NAME, P.DESCR, O.SHORT_NAME',
    'TDataLookup.ARRIVINFO', ColumnInfos, 'ID', Value, Values);
  if Result then begin
    ProductID:=Value;
    OwnerID:=Values[4];
    StationName:=Values[1];
  end;
end;

function EmSelectRecip(AStation: string; var ARecipID: integer; var ARecipName: string): Boolean;
const
  ColumnInfos: array [0..1] of TColumnInfo =
  ( (FieldName: 'SHORT_NAME'; Title: 'Краткое наим.'; Width: 150),
    (FieldName: 'NAME'; Title: 'Наименование'; Width: 150));
var
  Value, Values: Variant;
begin
  Result := TDataLookupForm.LookupRecord('Выберите получателя для станции <'+AStation+'>',
    'select COMP_ID, SHORT_NAME, NAME' +
    ' from EM_COMPANIES' +
    ' where IS_RECIPIENT=1' +
    ' order by SHORT_NAME',
    'TDataLookup.EMSELRECIP', ColumnInfos, 'COMP_ID', Value, Values);
  if Result then begin
    ARecipID:=Value;
    ARecipName:=Values[1];
  end;
end;

function EmSelectStationRecip(AStationID: integer; AStation: string;
  var ARecipID: integer; var ARecipName: string): Boolean;
const
  ColumnInfos: array [0..1] of TColumnInfo =
  ( (FieldName: 'SHORT_NAME'; Title: 'Краткое наим.'; Width: 150),
    (FieldName: 'NAME'; Title: 'Наименование'; Width: 150));
var
  Value, Values: Variant;
begin
  Result := TDataLookupForm.LookupRecord('Выберите получателя для станции <'+AStation+'>',
    'select SR.RECIPIENT_ID, C.SHORT_NAME, C.NAME' +
    ' from EM_STATIONS_RECIP SR' +
    ' left join EM_COMPANIES C on C.COMP_ID=SR.RECIPIENT_ID' +
    ' where STATION_ID=' + IntToStr(AStationID) +
    ' order by C.SHORT_NAME',
    'TDataLookup.EMSELSTATIONRECIP', ColumnInfos, 'RECIPIENT_ID', Value, Values);
  if Result then begin
    ARecipID:=Value;
    ARecipName:=Values[1];
  end;
end;



{ TDataLookupForm }

class function TDataLookupForm.LookupRecord(const Caption, SQL, StorageSection: string;
  ColumnInfos: array of TColumnInfo;
  const FieldName: string; Value: Variant): Variant;
var
  Values: Variant;
begin
  Result := Value;
  if LookupRecord(Caption, SQL, StorageSection, ColumnInfos, FieldName, Value, Values)
  then Result := Value;
end;

class function TDataLookupForm.LookupRecord(const Caption, SQL, StorageSection: string;
  ColumnInfos: array of TColumnInfo; const FieldName: string;
  var Value: Variant; var Values: Variant): Boolean;
var
  Form: TDataLookupForm;
begin
  Form := TDataLookupForm.Create(Application);
  try
    Form.ListQuery.SQL.Text := SQL;
    Result := Form.DoLookupRecord(Caption, StorageSection, ColumnInfos, FieldName, Value, Values);
  finally
    Form.Free;
  end;
end;

end.
