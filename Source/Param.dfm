object PrmForm: TPrmForm
  Left = 246
  Top = 106
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1084#1086#1076#1077#1084#1085#1086#1081' '#1089#1074#1103#1079#1080
  ClientHeight = 150
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object lbNumber: TLabel
    Left = 10
    Top = 30
    Width = 179
    Height = 16
    Caption = #1087#1086#1083#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
  end
  object lbTone: TLabel
    Left = 59
    Top = 69
    Width = 126
    Height = 16
    Caption = #1090#1080#1087' '#1085#1072#1073#1086#1088#1072' '#1085#1086#1084#1077#1088#1072
  end
  object lbAccess: TLabel
    Left = 89
    Top = 108
    Width = 91
    Height = 16
    Caption = #1074#1099#1093#1086#1076' '#1074' '#1075#1086#1088#1086#1076
  end
  object cbTone: TComboBox
    Left = 197
    Top = 59
    Width = 139
    Height = 24
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 0
    Text = #1080#1084#1087#1091#1083#1100#1089#1085#1099#1081
    Items.Strings = (
      #1080#1084#1087#1091#1083#1100#1089#1085#1099#1081
      #1090#1086#1085#1072#1083#1100#1085#1099#1081)
  end
  object meNumber: TMaskEdit
    Left = 197
    Top = 20
    Width = 139
    Height = 21
    EditMask = '#9999999999999999999;1; '
    MaxLength = 20
    TabOrder = 1
    Text = '                    '
  end
  object cbAccess: TComboBox
    Left = 197
    Top = 98
    Width = 139
    Height = 24
    DropDownCount = 11
    ItemHeight = 16
    ItemIndex = 10
    TabOrder = 2
    Text = #1095#1077#1088#1077#1079' "9"'
    Items.Strings = (
      #1085#1072#1087#1088#1103#1084#1091#1102
      #1095#1077#1088#1077#1079' "0"'
      #1095#1077#1088#1077#1079' "1"'
      #1095#1077#1088#1077#1079' "2"'
      #1095#1077#1088#1077#1079' "3"'
      #1095#1077#1088#1077#1079' "4"'
      #1095#1077#1088#1077#1079' "5"'
      #1095#1077#1088#1077#1079' "6"'
      #1095#1077#1088#1077#1079' "7"'
      #1095#1077#1088#1077#1079' "8"'
      #1095#1077#1088#1077#1079' "9"')
  end
end
