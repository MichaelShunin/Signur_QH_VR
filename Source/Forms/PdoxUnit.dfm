object LegacyData: TLegacyData
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 390
  Top = 164
  Height = 275
  Width = 304
  object PdoxDatabase: TDatabase
    AliasName = 'TN'
    DatabaseName = 'PdoxFlow'
    SessionName = 'PdoxSession'
    Left = 16
    Top = 8
  end
  object NotificationTable: TTable
    OnCalcFields = NotificationTableCalcFields
    DatabaseName = 'PdoxFlow'
    SessionName = 'PdoxSession'
    TableName = 'OUWED.DB'
    Left = 88
    Top = 8
    object NotificationTableDatuw: TDateField
      FieldName = 'Datuw'
    end
    object NotificationTableWuw: TStringField
      FieldName = 'Wuw'
      Size = 5
    end
    object NotificationTablePut: TStringField
      FieldName = 'Put'
      Size = 4
    end
    object NotificationTableD1: TDateField
      FieldName = 'D1'
    end
    object NotificationTableWr1: TStringField
      FieldName = 'Wr1'
      Size = 5
    end
    object NotificationTableD2: TDateField
      FieldName = 'D2'
    end
    object NotificationTableWr2: TStringField
      FieldName = 'Wr2'
      Size = 5
    end
    object NotificationTableD3: TDateField
      FieldName = 'D3'
    end
    object NotificationTableWr3: TStringField
      FieldName = 'Wr3'
      Size = 5
    end
    object NotificationTableBr1: TStringField
      FieldName = 'Br1'
      Size = 2
    end
    object NotificationTableBr2: TStringField
      FieldName = 'Br2'
      Size = 2
    end
    object NotificationTableBr3: TStringField
      FieldName = 'Br3'
      Size = 2
    end
    object NotificationTablePriem: TStringField
      FieldName = 'Priem'
      Size = 30
    end
    object NotificationTableSdat: TStringField
      FieldName = 'Sdat'
      Size = 30
    end
    object NotificationTableMetka: TStringField
      FieldName = 'Metka'
      Size = 1
    end
    object NotificationTableP1: TStringField
      FieldName = 'P1'
      Size = 1
    end
    object NotificationTableGdpam: TStringField
      FieldName = 'Gdpam'
      Size = 10
    end
    object NotificationTableTw: TSmallintField
      FieldName = 'Tw'
    end
    object NotificationTableFlag: TStringField
      FieldName = 'Flag'
      Size = 1
    end
    object NotificationTableRez: TStringField
      FieldName = 'Rez'
      Size = 3
    end
    object NotificationTableWuwX: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'WuwX'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
      Calculated = True
    end
    object NotificationTableWr1X: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Wr1X'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
      Calculated = True
    end
    object NotificationTableWr2X: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Wr2X'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
      Calculated = True
    end
  end
  object NotificationSource: TDataSource
    DataSet = NotificationTable
    Left = 88
    Top = 56
  end
  object NakladTable: TTable
    OnCalcFields = NakladTableCalcFields
    DatabaseName = 'PdoxFlow'
    SessionName = 'PdoxSession'
    IndexFieldNames = 'Keypzd;Keynakl'
    TableName = 'OSN.DB'
    Left = 168
    Top = 8
    object NakladTableKeypzd: TFloatField
      FieldName = 'Keypzd'
    end
    object NakladTableKeynakl: TFloatField
      FieldName = 'Keynakl'
    end
    object NakladTableNakl: TStringField
      FieldName = 'Nakl'
      Size = 13
    end
    object NakladTableBalans: TStringField
      FieldName = 'Balans'
      Size = 25
    end
    object NakladTableSt: TStringField
      FieldName = 'St'
      Size = 6
    end
    object NakladTableOtp: TStringField
      FieldName = 'Otp'
      Size = 7
    end
    object NakladTableOn: TStringField
      FieldName = 'On'
      Size = 25
    end
    object NakladTablePol: TStringField
      FieldName = 'Pol'
      Size = 7
    end
    object NakladTablePn: TStringField
      FieldName = 'Pn'
      Size = 25
    end
    object NakladTableDotg: TDateField
      FieldName = 'Dotg'
    end
    object NakladTableGruz: TSmallintField
      FieldName = 'Gruz'
    end
    object NakladTableNpw: TSmallintField
      FieldName = 'Npw'
    end
    object NakladTableKol: TSmallintField
      FieldName = 'Kol'
    end
    object NakladTableWes: TFloatField
      FieldName = 'Wes'
    end
    object NakladTableP1: TStringField
      FieldName = 'P1'
      Size = 1
    end
    object NakladTableOp: TStringField
      FieldName = 'Op'
      Size = 3
    end
    object NakladTableNdog: TStringField
      FieldName = 'Ndog'
      Size = 10
    end
    object NakladTableMlist: TStringField
      FieldName = 'Mlist'
      Size = 8
    end
    object NakladTableGtd: TStringField
      FieldName = 'Gtd'
      Size = 30
    end
    object NakladTableDzakr: TStringField
      FieldName = 'Dzakr'
      Size = 6
    end
    object NakladTableD1: TDateField
      FieldName = 'D1'
    end
    object NakladTableW: TStringField
      FieldName = 'W'
      Size = 5
    end
    object NakladTableNpz: TSmallintField
      FieldName = 'Npz'
    end
    object NakladTableKols: TSmallintField
      FieldName = 'Kols'
    end
    object NakladTableWtt: TStringField
      FieldName = 'Wtt'
      Size = 30
    end
    object NakladTableNrazr: TStringField
      FieldName = 'Nrazr'
      Size = 6
    end
    object NakladTableKp: TStringField
      FieldName = 'Kp'
      Size = 7
    end
    object NakladTableKpn: TStringField
      FieldName = 'Kpn'
      Size = 25
    end
    object NakladTableKpl: TStringField
      FieldName = 'Kpl'
      Size = 7
    end
    object NakladTableKpln: TStringField
      FieldName = 'Kpln'
      Size = 25
    end
    object NakladTableArenda: TStringField
      FieldName = 'Arenda'
      Size = 1
    end
    object NakladTableGruzNam: TStringField
      FieldKind = fkCalculated
      FieldName = 'GruzNam'
      Calculated = True
    end
    object NakladTableWX: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'WX'
      Calculated = True
    end
    object NakladTableSTATION_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATION_NAME'
      Calculated = True
    end
  end
  object NakladSource: TDataSource
    DataSet = NakladTable
    Left = 168
    Top = 56
  end
  object StationTable: TTable
    DatabaseName = 'PdoxFlow'
    SessionName = 'PdoxSession'
    IndexFieldNames = 'Naim'
    TableName = 'SPSTAN.DB'
    Left = 16
    Top = 56
    object StationTableKod: TStringField
      FieldName = 'Kod'
      Size = 6
    end
    object StationTableNaim: TStringField
      FieldName = 'Naim'
    end
    object StationTableKnaim: TStringField
      FieldName = 'Knaim'
      Size = 15
    end
    object StationTableKodgd: TStringField
      FieldName = 'Kodgd'
      Size = 2
    end
  end
  object NaklTable: TTable
    DatabaseName = 'PdoxFlow'
    SessionName = 'PdoxSession'
    IndexFieldNames = 'Nakl'
    TableName = 'OSN.DB'
    Left = 16
    Top = 112
    object NaklTableKeypzd: TFloatField
      FieldName = 'Keypzd'
    end
    object NaklTableKeynakl: TFloatField
      FieldName = 'Keynakl'
    end
    object NaklTableNakl: TStringField
      FieldName = 'Nakl'
      Size = 13
    end
    object NaklTableBalans: TStringField
      FieldName = 'Balans'
      Size = 25
    end
    object NaklTableSt: TStringField
      FieldName = 'St'
      Size = 6
    end
    object NaklTableOtp: TStringField
      FieldName = 'Otp'
      Size = 7
    end
    object NaklTableOn: TStringField
      FieldName = 'On'
      Size = 25
    end
    object NaklTablePol: TStringField
      FieldName = 'Pol'
      Size = 7
    end
    object NaklTablePn: TStringField
      FieldName = 'Pn'
      Size = 25
    end
    object NaklTableDotg: TDateField
      FieldName = 'Dotg'
    end
    object NaklTableGruz: TSmallintField
      FieldName = 'Gruz'
    end
    object NaklTableNpw: TSmallintField
      FieldName = 'Npw'
    end
    object NaklTableKol: TSmallintField
      FieldName = 'Kol'
    end
    object NaklTableWes: TFloatField
      FieldName = 'Wes'
    end
    object NaklTableP1: TStringField
      FieldName = 'P1'
      Size = 1
    end
    object NaklTableOp: TStringField
      FieldName = 'Op'
      Size = 3
    end
    object NaklTableNdog: TStringField
      FieldName = 'Ndog'
      Size = 10
    end
    object NaklTableMlist: TStringField
      FieldName = 'Mlist'
      Size = 8
    end
    object NaklTableGtd: TStringField
      FieldName = 'Gtd'
      Size = 30
    end
    object NaklTableDzakr: TStringField
      FieldName = 'Dzakr'
      Size = 6
    end
    object NaklTableD1: TDateField
      FieldName = 'D1'
    end
    object NaklTableW: TStringField
      FieldName = 'W'
      Size = 5
    end
    object NaklTableNpz: TSmallintField
      FieldName = 'Npz'
    end
    object NaklTableKols: TSmallintField
      FieldName = 'Kols'
    end
    object NaklTableWtt: TStringField
      FieldName = 'Wtt'
      Size = 30
    end
    object NaklTableNrazr: TStringField
      FieldName = 'Nrazr'
      Size = 6
    end
    object NaklTableKp: TStringField
      FieldName = 'Kp'
      Size = 7
    end
    object NaklTableKpn: TStringField
      FieldName = 'Kpn'
      Size = 25
    end
    object NaklTableKpl: TStringField
      FieldName = 'Kpl'
      Size = 7
    end
    object NaklTableKpln: TStringField
      FieldName = 'Kpln'
      Size = 25
    end
    object NaklTableArenda: TStringField
      FieldName = 'Arenda'
      Size = 1
    end
  end
  object TankCarsUTable: TTable
    DatabaseName = 'PdoxFlow'
    SessionName = 'PdoxSession'
    IndexFieldNames = 'Datuw;Wuw;Nom;Cist'
    TableName = 'OUWWC.DB'
    Left = 88
    Top = 160
    object TankCarsUTableDatuw: TDateField
      FieldName = 'Datuw'
    end
    object TankCarsUTableWuw: TStringField
      FieldName = 'Wuw'
      Size = 5
    end
    object TankCarsUTableNom: TSmallintField
      FieldName = 'Nom'
    end
    object TankCarsUTableCist: TStringField
      FieldName = 'Cist'
      Size = 8
    end
    object TankCarsUTableKeypzd: TFloatField
      FieldName = 'Keypzd'
    end
    object TankCarsUTablePzdkr: TFloatField
      FieldName = 'Pzdkr'
    end
    object TankCarsUTableKeynakl: TFloatField
      FieldName = 'Keynakl'
    end
    object TankCarsUTableD1: TDateField
      FieldName = 'D1'
    end
    object TankCarsUTableW: TStringField
      FieldName = 'W'
      Size = 5
    end
    object TankCarsUTableNpz: TSmallintField
      FieldName = 'Npz'
    end
    object TankCarsUTableNakl: TStringField
      FieldName = 'Nakl'
      Size = 13
    end
    object TankCarsUTableDos: TFloatField
      FieldName = 'Dos'
    end
    object TankCarsUTableTlf: TStringField
      FieldName = 'Tlf'
      Size = 15
    end
    object TankCarsUTableSt: TStringField
      FieldName = 'St'
      Size = 6
    end
    object TankCarsUTableStn: TStringField
      FieldName = 'Stn'
      Size = 15
    end
    object TankCarsUTableOt: TStringField
      FieldName = 'Ot'
      Size = 7
    end
    object TankCarsUTablePol: TStringField
      FieldName = 'Pol'
      Size = 7
    end
    object TankCarsUTableGruz: TSmallintField
      FieldName = 'Gruz'
    end
    object TankCarsUTableGruzn: TStringField
      FieldName = 'Gruzn'
      Size = 6
    end
    object TankCarsUTableTip: TStringField
      FieldName = 'Tip'
      Size = 3
    end
    object TankCarsUTableWzliw: TSmallintField
      FieldName = 'Wzliw'
    end
    object TankCarsUTableBrutto: TFloatField
      FieldName = 'Brutto'
    end
    object TankCarsUTableWoda: TFloatField
      FieldName = 'Woda'
    end
    object TankCarsUTableNetto: TFloatField
      FieldName = 'Netto'
    end
    object TankCarsUTableWzliwf: TSmallintField
      FieldName = 'Wzliwf'
    end
    object TankCarsUTableV: TFloatField
      FieldName = 'V'
    end
    object TankCarsUTableBruttof: TFloatField
      FieldName = 'Bruttof'
    end
    object TankCarsUTableNettof: TFloatField
      FieldName = 'Nettof'
    end
    object TankCarsUTablePkg: TFloatField
      FieldName = 'Pkg'
    end
    object TankCarsUTableWodaf: TFloatField
      FieldName = 'Wodaf'
    end
    object TankCarsUTableSliw: TStringField
      FieldName = 'Sliw'
      Size = 1
    end
    object TankCarsUTableSliw1: TStringField
      FieldName = 'Sliw1'
      Size = 2
    end
    object TankCarsUTableSliwn: TStringField
      FieldName = 'Sliwn'
      Size = 15
    end
    object TankCarsUTableRz: TSmallintField
      FieldName = 'Rz'
    end
    object TankCarsUTableP1: TStringField
      FieldName = 'P1'
      Size = 1
    end
    object TankCarsUTablePl: TFloatField
      FieldName = 'Pl'
    end
    object TankCarsUTableKeyact: TFloatField
      FieldName = 'Keyact'
    end
    object TankCarsUTableNakt: TSmallintField
      FieldName = 'Nakt'
    end
    object TankCarsUTableDakt: TDateField
      FieldName = 'Dakt'
    end
    object TankCarsUTableOtpn: TStringField
      FieldName = 'Otpn'
      Size = 25
    end
    object TankCarsUTablePoln: TStringField
      FieldName = 'Poln'
      Size = 25
    end
    object TankCarsUTableOst: TFloatField
      FieldName = 'Ost'
    end
    object TankCarsUTableNa: TSmallintField
      FieldName = 'Na'
    end
    object TankCarsUTableWidost: TStringField
      FieldName = 'Widost'
      Size = 15
    end
    object TankCarsUTableDatuw1: TDateField
      FieldName = 'Datuw1'
    end
    object TankCarsUTableWuw1: TStringField
      FieldName = 'Wuw1'
      Size = 5
    end
    object TankCarsUTableNu: TSmallintField
      FieldName = 'Nu'
    end
    object TankCarsUTableWid: TStringField
      FieldName = 'Wid'
      Size = 1
    end
    object TankCarsUTableZ1: TStringField
      FieldName = 'Z1'
      Size = 1
    end
    object TankCarsUTableWidakt: TStringField
      FieldName = 'Widakt'
      Size = 1
    end
    object TankCarsUTableNakt1: TSmallintField
      FieldName = 'Nakt1'
    end
    object TankCarsUTableWidunew: TStringField
      FieldName = 'Widunew'
      Size = 1
    end
    object TankCarsUTableNunew: TSmallintField
      FieldName = 'Nunew'
    end
    object TankCarsUTableDatpam: TDateField
      FieldName = 'Datpam'
    end
    object TankCarsUTableNpam: TStringField
      FieldName = 'Npam'
      Size = 10
    end
    object TankCarsUTableMh: TSmallintField
      FieldName = 'Mh'
    end
    object TankCarsUTableMm: TSmallintField
      FieldName = 'Mm'
    end
    object TankCarsUTableNpernakl: TStringField
      FieldName = 'Npernakl'
      Size = 13
    end
    object TankCarsUTableNdog: TStringField
      FieldName = 'Ndog'
      Size = 10
    end
    object TankCarsUTableMlist: TStringField
      FieldName = 'Mlist'
      Size = 8
    end
    object TankCarsUTableSmena: TStringField
      FieldName = 'Smena'
      Size = 1
    end
    object TankCarsUTableGtd: TStringField
      FieldName = 'Gtd'
      Size = 30
    end
    object TankCarsUTableWnakl: TStringField
      FieldName = 'Wnakl'
      Size = 1
    end
    object TankCarsUTableDatsmena: TDateField
      FieldName = 'Datsmena'
    end
    object TankCarsUTableSm: TStringField
      FieldName = 'Sm'
      Size = 1
    end
    object TankCarsUTableNarush: TStringField
      FieldName = 'Narush'
      Size = 25
    end
    object TankCarsUTableArenda: TStringField
      FieldName = 'Arenda'
      Size = 1
    end
  end
  object PdoxSession: TSession
    KeepConnections = False
    SessionName = 'PdoxSession'
    Left = 16
    Top = 160
  end
  object BasePassTable: TTable
    DatabaseName = 'PdoxFlow'
    SessionName = 'PdoxSession'
    IndexFieldNames = 'Keypzd;Keynakl;Cist'
    TableName = 'OUWWC.DB'
    Left = 168
    Top = 160
    object DateField1: TDateField
      FieldName = 'Datuw'
    end
    object StringField1: TStringField
      FieldName = 'Wuw'
      Size = 5
    end
    object SmallintField1: TSmallintField
      FieldName = 'Nom'
    end
    object StringField2: TStringField
      FieldName = 'Cist'
      Size = 8
    end
    object FloatField1: TFloatField
      FieldName = 'Keypzd'
    end
    object FloatField2: TFloatField
      FieldName = 'Pzdkr'
    end
    object FloatField3: TFloatField
      FieldName = 'Keynakl'
    end
    object DateField2: TDateField
      FieldName = 'D1'
    end
    object StringField3: TStringField
      FieldName = 'W'
      Size = 5
    end
    object SmallintField2: TSmallintField
      FieldName = 'Npz'
    end
    object StringField4: TStringField
      FieldName = 'Nakl'
      Size = 13
    end
    object FloatField4: TFloatField
      FieldName = 'Dos'
    end
    object StringField5: TStringField
      FieldName = 'Tlf'
      Size = 15
    end
    object StringField6: TStringField
      FieldName = 'St'
      Size = 6
    end
    object StringField7: TStringField
      FieldName = 'Stn'
      Size = 15
    end
    object StringField8: TStringField
      FieldName = 'Ot'
      Size = 7
    end
    object StringField9: TStringField
      FieldName = 'Pol'
      Size = 7
    end
    object SmallintField3: TSmallintField
      FieldName = 'Gruz'
    end
    object StringField10: TStringField
      FieldName = 'Gruzn'
      Size = 6
    end
    object StringField11: TStringField
      FieldName = 'Tip'
      Size = 3
    end
    object SmallintField4: TSmallintField
      FieldName = 'Wzliw'
    end
    object FloatField5: TFloatField
      FieldName = 'Brutto'
    end
    object FloatField6: TFloatField
      FieldName = 'Woda'
    end
    object FloatField7: TFloatField
      FieldName = 'Netto'
    end
    object SmallintField5: TSmallintField
      FieldName = 'Wzliwf'
    end
    object FloatField8: TFloatField
      FieldName = 'V'
    end
    object FloatField9: TFloatField
      FieldName = 'Bruttof'
    end
    object FloatField10: TFloatField
      FieldName = 'Nettof'
    end
    object FloatField11: TFloatField
      FieldName = 'Pkg'
    end
    object FloatField12: TFloatField
      FieldName = 'Wodaf'
    end
    object StringField12: TStringField
      FieldName = 'Sliw'
      Size = 1
    end
    object StringField13: TStringField
      FieldName = 'Sliw1'
      Size = 2
    end
    object StringField14: TStringField
      FieldName = 'Sliwn'
      Size = 15
    end
    object SmallintField6: TSmallintField
      FieldName = 'Rz'
    end
    object StringField15: TStringField
      FieldName = 'P1'
      Size = 1
    end
    object FloatField13: TFloatField
      FieldName = 'Pl'
    end
    object FloatField14: TFloatField
      FieldName = 'Keyact'
    end
    object SmallintField7: TSmallintField
      FieldName = 'Nakt'
    end
    object DateField3: TDateField
      FieldName = 'Dakt'
    end
    object StringField16: TStringField
      FieldName = 'Otpn'
      Size = 25
    end
    object StringField17: TStringField
      FieldName = 'Poln'
      Size = 25
    end
    object FloatField15: TFloatField
      FieldName = 'Ost'
    end
    object SmallintField8: TSmallintField
      FieldName = 'Na'
    end
    object StringField18: TStringField
      FieldName = 'Widost'
      Size = 15
    end
    object DateField4: TDateField
      FieldName = 'Datuw1'
    end
    object StringField19: TStringField
      FieldName = 'Wuw1'
      Size = 5
    end
    object SmallintField9: TSmallintField
      FieldName = 'Nu'
    end
    object StringField20: TStringField
      FieldName = 'Wid'
      Size = 1
    end
    object StringField21: TStringField
      FieldName = 'Z1'
      Size = 1
    end
    object StringField22: TStringField
      FieldName = 'Widakt'
      Size = 1
    end
    object SmallintField10: TSmallintField
      FieldName = 'Nakt1'
    end
    object StringField23: TStringField
      FieldName = 'Widunew'
      Size = 1
    end
    object SmallintField11: TSmallintField
      FieldName = 'Nunew'
    end
    object DateField5: TDateField
      FieldName = 'Datpam'
    end
    object StringField24: TStringField
      FieldName = 'Npam'
      Size = 10
    end
    object SmallintField12: TSmallintField
      FieldName = 'Mh'
    end
    object SmallintField13: TSmallintField
      FieldName = 'Mm'
    end
    object StringField25: TStringField
      FieldName = 'Npernakl'
      Size = 13
    end
    object StringField26: TStringField
      FieldName = 'Ndog'
      Size = 10
    end
    object StringField27: TStringField
      FieldName = 'Mlist'
      Size = 8
    end
    object StringField28: TStringField
      FieldName = 'Smena'
      Size = 1
    end
    object StringField29: TStringField
      FieldName = 'Gtd'
      Size = 30
    end
    object StringField30: TStringField
      FieldName = 'Wnakl'
      Size = 1
    end
    object DateField6: TDateField
      FieldName = 'Datsmena'
    end
    object StringField31: TStringField
      FieldName = 'Sm'
      Size = 1
    end
    object StringField32: TStringField
      FieldName = 'Narush'
      Size = 25
    end
    object StringField33: TStringField
      FieldName = 'Arenda'
      Size = 1
    end
  end
  object OtTable: TTable
    DatabaseName = 'PdoxFlow'
    SessionName = 'PdoxSession'
    IndexFieldNames = 'Kod'
    TableName = 'OT.DB'
    Left = 88
    Top = 112
    object OtTableKod: TStringField
      FieldName = 'Kod'
      Size = 7
    end
    object OtTableKnaim: TStringField
      FieldName = 'Knaim'
      Size = 25
    end
    object OtTableOt: TStringField
      FieldName = 'Ot'
      Size = 1
    end
    object OtTablePol: TStringField
      FieldName = 'Pol'
      Size = 1
    end
  end
  object PolTable: TTable
    DatabaseName = 'PdoxFlow'
    SessionName = 'PdoxSession'
    IndexFieldNames = 'Kod'
    TableName = 'POL.DB'
    Left = 168
    Top = 112
    object PolTableKod: TStringField
      FieldName = 'Kod'
      Size = 7
    end
    object PolTableKnaim: TStringField
      FieldName = 'Knaim'
      Size = 25
    end
    object PolTableOt: TStringField
      FieldName = 'Ot'
      Size = 1
    end
    object PolTablePol: TStringField
      FieldName = 'Pol'
      Size = 1
    end
  end
end
