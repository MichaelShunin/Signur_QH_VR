object ShowDeviceInfo_Form: TShowDeviceInfo_Form
  Left = 237
  Top = 199
  BorderStyle = bsDialog
  Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1072#1094#1080#1103' '#1087#1088#1080#1073#1086#1088#1072
  ClientHeight = 174
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 45
    Top = 124
    Width = 100
    Height = 40
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 167
    Top = 124
    Width = 263
    Height = 40
    Caption = #1055#1077#1095#1072#1090#1100' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn2Click
    Kind = bkOK
  end
  object RG_RS: TRadioGroup
    Left = 2
    Top = 5
    Width = 303
    Height = 55
    Caption = #1041#1083#1086#1082' RS'
    Columns = 3
    Items.Strings = (
      #1085#1077#1090
      'RS232'
      'RS485'
      'USB'
      'USB '#1080' RS232'
      'USB '#1080' RS485')
    TabOrder = 2
  end
  object RG_Current: TRadioGroup
    Left = 3
    Top = 60
    Width = 134
    Height = 55
    Caption = #1041#1083#1086#1082' '#1090#1086#1082#1072
    Items.Strings = (
      #1085#1077#1090
      #1077#1089#1090#1100)
    TabOrder = 3
  end
  object RG_IR_Port: TRadioGroup
    Left = 155
    Top = 60
    Width = 133
    Height = 55
    Caption = #1048#1050'-'#1087#1086#1088#1090
    Items.Strings = (
      #1085#1077#1090
      #1077#1089#1090#1100)
    TabOrder = 4
  end
  object RG_Level: TRadioGroup
    Left = 320
    Top = 5
    Width = 138
    Height = 55
    Caption = #1041#1083#1086#1082' '#1091#1089#1090#1072#1074#1086#1082
    Columns = 2
    Items.Strings = (
      #1085#1077#1090
      '1 '#1090#1086#1095#1082#1072
      '2 '#1090#1086#1095#1082#1080
      '3 '#1090#1086#1095#1082#1080)
    TabOrder = 5
  end
  object RG_IMP_OUT: TRadioGroup
    Left = 302
    Top = 60
    Width = 156
    Height = 55
    Caption = #1048#1084#1087#1091#1083#1100#1089#1085#1099#1081' '#1074#1099#1093#1086#1076
    Items.Strings = (
      #1085#1077#1090
      #1077#1089#1090#1100)
    TabOrder = 6
  end
end
