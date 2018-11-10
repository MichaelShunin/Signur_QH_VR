object PrmForm: TPrmForm
  Left = 406
  Top = 265
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1084#1086#1076#1077#1084#1085#1086#1081' '#1089#1074#1103#1079#1080
  ClientHeight = 139
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object lbNumber: TLabel
    Left = 8
    Top = 24
    Width = 73
    Height = 13
    Caption = #1087#1086#1083#1085#1099#1081' '#1085#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbTone: TLabel
    Left = 24
    Top = 64
    Width = 56
    Height = 13
    Caption = #1090#1080#1087' '#1085#1072#1073#1086#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbAccess: TLabel
    Left = 8
    Top = 104
    Width = 72
    Height = 13
    Caption = #1074#1099#1093#1086#1076' '#1074' '#1075#1086#1088#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object meNumber: TMaskEdit
    Left = 104
    Top = 16
    Width = 144
    Height = 24
    EditMask = '#9999999999999999999;1; '
    MaxLength = 20
    TabOrder = 0
    Text = '                    '
  end
  object cbTone: TComboBox
    Left = 104
    Top = 56
    Width = 145
    Height = 24
    ItemHeight = 16
    TabOrder = 1
    OnChange = cbToneChange
    Items.Strings = (
      #1080#1084#1087#1091#1083#1100#1089#1085#1099#1081' '
      #1090#1086#1085#1072#1083#1100#1085#1099#1081)
  end
  object cbAccess: TComboBox
    Left = 104
    Top = 96
    Width = 145
    Height = 24
    ItemHeight = 16
    TabOrder = 2
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
