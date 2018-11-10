object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 366
  Top = 199
  Height = 252
  Width = 464
  object DB: TIBDatabase
    DatabaseName = 'C:\GEMISWIN\2004\db\GEMIS.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    Left = 12
    Top = 8
  end
  object TA: TIBTransaction
    DefaultDatabase = DB
    Left = 16
    Top = 56
  end
end
