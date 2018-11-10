object CommonData: TCommonData
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 527
  Top = 282
  Height = 256
  Width = 591
  object Database: TIBDatabase
    DatabaseName = 
      '172.16.11.10:C:\Projects\AppProjects\Other\TeachFor\exe\DB\FSACS' +
      '.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=J<{CC'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = ReadTransaction
    AllowStreamedConnected = False
    AfterConnect = DatabaseAfterConnect
    BeforeConnect = DatabaseBeforeConnect
    Left = 40
    Top = 6
  end
  object ReadTransaction: TIBTransaction
    DefaultDatabase = Database
    IdleTimer = 60000
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommitRetaining
    Left = 150
    Top = 10
  end
  object ManualTransaction: TIBTransaction
    AllowAutoStart = False
    DefaultDatabase = Database
    IdleTimer = 100000
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 328
    Top = 84
  end
  object ManualAutoStartTransaction: TIBTransaction
    DefaultDatabase = Database
    IdleTimer = 60000
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 108
    Top = 80
  end
  object ManualReadTransaction: TIBTransaction
    AllowAutoStart = False
    DefaultDatabase = Database
    IdleTimer = 100000
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'concurrency'
      'nowait')
    AutoStopAction = saCommit
    Left = 312
    Top = 18
  end
  object AnyQuery: TIBQuery
    Database = Database
    Transaction = ReadTransaction
    BufferChunks = 100
    SQL.Strings = (
      'select * from PRODUCTS')
    Left = 32
    Top = 142
  end
  object SQL: TIBSQL
    Database = Database
    Transaction = ReadTransaction
    Left = 168
    Top = 160
  end
  object UpdateQ: TIBSQL
    Database = Database
    Transaction = ManualAutoStartTransaction
    Left = 306
    Top = 172
  end
end
