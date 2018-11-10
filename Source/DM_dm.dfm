object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 178
  Top = 181
  Height = 501
  Width = 956
  object DB: TIBDatabase
    DatabaseName = 
      '127.0.0.1:C:\Projects\Other\signur\exe\Databases\_Default\Signur' +
      '.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = TA
    AllowStreamedConnected = False
    Left = 12
    Top = 8
  end
  object TA: TIBTransaction
    DefaultDatabase = DB
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 16
    Top = 56
  end
  object Devices: TIBQuery
    Database = DB
    Transaction = TA
    SQL.Strings = (
      'select * from devices')
    Left = 16
    Top = 112
  end
  object Create_Eksp_AFTERPROC: TIBStoredProc
    Database = DB
    Transaction = TA
    StoredProcName = 'CREATE_EKSP_AFTERPROC'
    Left = 116
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'EKSP_THEME'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'EKSP_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'EKSP_TIME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EKSP_HEADER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EKSP_AUTHOR'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'EKSP_MEMO'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'EKSP_SIGNALSOURCE'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'EKSP_PROC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EKSP_PARENT'
        ParamType = ptInput
      end>
  end
  object q: TIBQuery
    Database = DB
    Transaction = TA
    SQL.Strings = (
      '')
    Left = 368
    Top = 20
  end
  object CREATE_CURVESET: TIBStoredProc
    Database = DB
    Transaction = TA
    StoredProcName = 'CREATE_CURVESET'
    Left = 200
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'EKSP_PARENT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VIEW_THEME'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VIEW_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VIEW_TIME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VIEW_HEADER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VIEW_AUTHOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'LEFT_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'WIDTH'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'HEIGHT'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'VIEW_STYLE'
        ParamType = ptInput
      end>
  end
  object CREATE_CURVE: TIBStoredProc
    Database = DB
    Transaction = TA
    StoredProcName = 'CREATE_CURVE'
    Left = 120
    Top = 108
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'VIEW_NOMER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SIGNAL_NOMER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CURVEHEADERSHORT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CURVEHEADER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'POINTSTART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'POINTEND'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VIEWMAXX'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VIEWMAXY'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VIEWMINX'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VIEWMINY'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'BVIEWMAXMINX'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'BVIEWMAXMINY'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'BPOLYCREATE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'POLYPOINT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'POLYFILE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COLOR'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'STYLE'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'CURVEWIDTH'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VIEWPAGE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'CURVEDATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'CURVETIME'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'VISIBLE'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'SCALESTYLE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SLIDER'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MULT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPOLYX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPOLYY'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MULTALL'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'AXISXSTYLE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COLORFON'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'GRIDX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'GRIDY'
        ParamType = ptInput
      end>
  end
  object CREATE_CURSOR: TIBStoredProc
    Database = DB
    Transaction = TA
    StoredProcName = 'CREATE_CURSOR'
    Left = 368
    Top = 80
  end
  object CREATE_CURSCHAN: TIBStoredProc
    Database = DB
    Transaction = TA
    StoredProcName = 'CREATE_CURSCHAN'
    Left = 248
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'ID_CURSORS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IMAGE_CAPTION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PAGE_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHAN_NUM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CHAN_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALUE_'
        ParamType = ptInput
      end>
  end
  object CREATE_SIGNAL: TIBStoredProc
    Database = DB
    Transaction = TA
    StoredProcName = 'CREATE_SIGNAL'
    Left = 252
    Top = 108
  end
  object CREATE_EKSP: TIBStoredProc
    Database = DB
    Transaction = TA
    StoredProcName = 'CREATE_EKSP'
    Left = 300
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'EKSP_THEME'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'EKSP_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'EKSP_TIME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EKSP_HEADER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EKSP_AUTHOR'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'EKSP_MEMO'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'EKSP_SIGNALSOURCE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EKSP_SOURCEFILE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_DEVICE'
        ParamType = ptInput
      end>
  end
  object CREATE_CURVESET_MEMO: TIBStoredProc
    Database = DB
    Transaction = TA
    StoredProcName = 'CREATE_CURVESET_MEMO'
    Left = 352
    Top = 148
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'EKSP_PARENT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VIEW_THEME'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VIEW_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VIEW_TIME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VIEW_HEADER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VIEW_AUTHOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'LEFT_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'WIDTH'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'HEIGHT'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'VIEW_STYLE'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'VIEW_MEMO'
        ParamType = ptInput
      end>
  end
  object CREATE_CURVESET_TXT: TIBStoredProc
    Database = DB
    Transaction = TA
    StoredProcName = 'CREATE_CURVESET_TXT'
    Left = 496
    Top = 20
  end
  object SETEKSPPARAM: TIBStoredProc
    Database = DB
    Transaction = TA
    StoredProcName = 'SETEKSPPARAM'
    Left = 456
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'EKSP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PARAMGROUP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PARAMNAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PARAMVALUE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PARAMTYPE'
        ParamType = ptInput
      end>
  end
  object sql: TIBSQL
    Database = DB
    Transaction = TA
    Left = 508
    Top = 100
  end
  object CREATE_EKSP_AND_MODEMINFO: TIBStoredProc
    Database = DB
    Transaction = TA
    StoredProcName = 'CREATE_EKSP_AND_MODEMINFO'
    Left = 164
    Top = 272
  end
  object q_devices: TIBQuery
    Database = DB
    Transaction = TA
    SQL.Strings = (
      'select eksp_nomer as device_id,'
      ' sch_mode,'
      ' sch_day,'
      ' sch_time, '
      ' sch_action_mode'
      'from eksp where sch_mode>0 and hide=0')
    Left = 408
    Top = 280
  end
  object CREATE_EKSP_AND_DEVICEPARAM: TIBStoredProc
    Database = DB
    Transaction = TA
    StoredProcName = 'CREATE_EKSP_AND_DEVICEPARAM'
    Left = 660
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'EKSP_THEME'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'EKSP_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'EKSP_TIME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EKSP_HEADER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EKSP_AUTHOR'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'EKSP_MEMO'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'EKSP_SIGNALSOURCE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EKSP_SOURCEFILE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_DEVICE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MODEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ACCESS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHONE_NUMBER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TONE_PULSE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MODBUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MODBUS_ADDRESS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BDR'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'PARITYCONTROL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DEVICE_NUMBER'
        ParamType = ptInput
      end>
  end
  object Q1: TIBQuery
    Database = DB
    Transaction = TA
    Left = 600
    Top = 172
  end
  object QS: TIBSQL
    Database = DB
    ParamCheck = False
    Transaction = TA
    Left = 640
    Top = 344
  end
end
