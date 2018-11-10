inherited Import_Signur_Form2: TImport_Signur_Form2
  Left = 313
  Top = 248
  Width = 634
  Height = 142
  Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' '#1087#1088#1080#1073#1086#1088#1086#1074' '#1057#1080#1075#1085#1091#1088' ('#1076#1088#1072#1081#1074#1077#1088' 2)'
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton [0]
    Left = 272
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
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
