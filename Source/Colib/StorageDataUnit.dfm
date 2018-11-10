object StorageData: TStorageData
  OldCreateOrder = True
  OnDestroy = DataModuleDestroy
  Left = 530
  Top = 196
  Height = 290
  Width = 344
  object Database: TIBDatabase
    Connected = True
    DatabaseName = 'localhost:C:\Projects\TeachFor\exe\DB\FSACS.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    AllowStreamedConnected = False
    Left = 44
    Top = 32
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
  object StorageQuery: TIBQuery
    Database = Database
    Transaction = ManualAutoStartTransaction
    BufferChunks = 1
    SQL.Strings = (
      'select ID, BODY from STORAGE')
    UpdateObject = StorageUpdate
    Left = 154
    Top = 20
    object StorageQueryID: TIntegerField
      FieldName = 'ID'
      Origin = '"STORAGE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StorageQueryBODY: TBlobField
      FieldName = 'BODY'
      Origin = '"STORAGE"."BODY"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object StorageUpdate: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select ID, BODY from STORAGE'
      'where ID = :ID')
    ModifySQL.Strings = (
      'update STORAGE set BODY = :BODY where ID = :ID')
    InsertSQL.Strings = (
      'insert into STORAGE(ID, BODY)'
      '  values(:ID, :BODY)')
    Left = 236
    Top = 18
  end
end
