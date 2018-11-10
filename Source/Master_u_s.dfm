object MasterForm: TMasterForm
  Left = 285
  Top = 180
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1080#1073#1086#1088#1086#1084
  ClientHeight = 144
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000330000000000000000000000033303303303300000000000000
    0003303330333003003300000000000000033003330330002333000000000000
    0030000033003033333000000000000033333330000003330003330000000803
    33333333333333300233330000000F033333333333333302333BB03000004F83
    33333333333333333BB003BB00004FF3333333333333B33BB0033BBB00004FF3
    33333333B3BB3BB0033BBBB000004FF83B333B3B3B3BBBB03BBBBB0300F04FFF
    33B3B3B3BBBBBBBBBBBB00330FF04FFF8B3B3333BBBBBBBBBB0033330FF044FF
    F8BBB03033BBBBB330333330FFF444FFF8BB0BB3003B330003333330FF44444F
    F88B3BBB300000033333B33FFF44444FFF3BB0BBB3000333B33BB38FF4444444
    FF003B0BB333333BBBBBB3FFF44444444FF00030BBBBBBBBBBBBBBFF44444444
    0000000303BBB3300000BFF444444400000000000000000000000FF444440000
    0000000000000000000000444444000000000000000000000000000044440000
    0000000000000000000000000444000000000000000000000000000000040000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFF1FFFFF8003FFFC0000FFF800007FF800007FE000003F0000
    001F0000001F0000000F00000007000000070000000000000000000000000000
    00000000000000000000000000000000000000000000000000000000000000C0
    00000FE01F003FFFFF80FFFFFFC0FFFFFFF0FFFFFFF8FFFFFFFEFFFFFFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Gauge: TGauge
    Left = 0
    Top = 80
    Width = 538
    Height = 15
    Align = alTop
    BackColor = clInactiveBorder
    BorderStyle = bsNone
    Color = clActiveCaption
    ForeColor = clNavy
    ParentColor = False
    Progress = 0
    ShowText = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 40
    Align = alTop
    TabOrder = 0
    object btnInst: TcxButton
      Left = 134
      Top = 0
      Width = 135
      Height = 40
      Caption = #1058#1077#1082#1091#1097#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnInstClick
      LookAndFeel.Kind = lfStandard
    end
    object btnMax: TcxButton
      Left = 268
      Top = 0
      Width = 135
      Height = 40
      Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnMaxClick
      LookAndFeel.Kind = lfStandard
    end
    object btnIdent: TcxButton
      Left = 0
      Top = 0
      Width = 135
      Height = 40
      Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnIdentClick
      LookAndFeel.Kind = lfStandard
    end
    object btnArch: TcxButton
      Left = 402
      Top = 0
      Width = 135
      Height = 40
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1072#1088#1093#1080#1074#1099' '#1074' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093
      Caption = #1040#1088#1093#1080#1074#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnArchClick
      LookAndFeel.Kind = lfStandard
    end
  end
  object pnStatus: TPanel
    Left = 0
    Top = 40
    Width = 538
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object btnLoadInfoFromDevice: TcxButton
    Left = 386
    Top = 94
    Width = 145
    Height = 29
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnLoadInfoFromDeviceClick
    LookAndFeel.Kind = lfStandard
  end
  object cbAlwaysOnTop: TCheckBox
    Left = 8
    Top = 120
    Width = 169
    Height = 17
    Caption = #1042#1089#1077#1075#1076#1072' '#1085#1072#1074#1077#1088#1093#1091
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = cbAlwaysOnTopClick
  end
  object cbRepeatedRead: TCheckBox
    Left = 8
    Top = 96
    Width = 233
    Height = 17
    Caption = #1053#1077#1087#1088#1077#1088#1099#1074#1085#1099#1081' '#1086#1087#1088#1086#1089' '#1090#1077#1082#1091#1097#1080#1093
    TabOrder = 4
    OnClick = cbRepeatedReadClick
  end
  object cbRepeated: TComboBox
    Left = 232
    Top = 96
    Width = 105
    Height = 24
    ItemHeight = 16
    ItemIndex = 1
    TabOrder = 5
    Text = '10 '#1089#1077#1082
    OnClick = cbRepeatedClick
    Items.Strings = (
      '5 '#1089#1077#1082
      '10 '#1089#1077#1082
      '30 '#1089#1077#1082
      '1 '#1084#1080#1085)
  end
  object SaveDialog: TSaveDialog
    Left = 32
    Top = 48
  end
  object Timer: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = TimerTimer
    Left = 344
    Top = 56
  end
end
