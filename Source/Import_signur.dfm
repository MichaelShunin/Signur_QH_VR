inherited Import_Signur_Form: TImport_Signur_Form
  Left = 313
  Top = 248
  Width = 375
  Height = 142
  Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' '#1087#1088#1080#1073#1086#1088#1086#1074' '#1057#1080#1075#1085#1091#1088
  PixelsPerInch = 96
  TextHeight = 13
  inherited MainMenu: TMainMenu
    Left = 92
    Top = 16
    object miLoadData: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093
      OnClick = miLoadDataClick
    end
  end
  object q: TIBSQL
    Database = DM.DB
    Transaction = DM.TA
    Left = 24
    Top = 7
  end
end
