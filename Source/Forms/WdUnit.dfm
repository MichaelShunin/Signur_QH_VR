object WordModule: TWordModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 481
  Top = 310
  Height = 158
  Width = 150
  object wa: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 16
    Top = 40
  end
end
