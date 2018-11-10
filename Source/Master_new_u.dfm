object MasterNewForm: TMasterNewForm
  Left = 192
  Top = 185
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1080#1073#1086#1088#1086#1084
  ClientHeight = 79
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge: TGauge
    Left = 0
    Top = 57
    Width = 706
    Height = 12
    Align = alTop
    BackColor = clInactiveBorder
    BorderStyle = bsNone
    Color = clAppWorkSpace
    ForeColor = clNavy
    ParentColor = False
    Progress = 0
    ShowText = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 4
    Width = 706
    Height = 29
    Align = alTop
    Constraints.MinWidth = 430
    TabOrder = 0
    DesignSize = (
      706
      29)
    object btnModem: TSpeedButton
      Left = 5
      Top = 1
      Width = 31
      Height = 23
      Hint = #1086#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1077#1088#1077#1076#1072#1095#1091' '#1076#1072#1085#1085#1099#1093' '#1084#1086#1076#1077#1084#1086#1084' '
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003B3000000000
        003B37F77777777777F73BB09111111110BB3777F3F3F3F3F777311098080808
        10B33777F7373737377313309999999910337F373F3F3F3F3733133309808089
        03337F3373737373733313333099999033337FFFF7FFFFF7FFFFB011B0000000
        BBBB7777777777777777B01110BBBBB0BBBB77F37777777777773011108BB333
        333337F337377F3FFFF33099111BB3010033373F33777F77773F331999100101
        11033373FFF77773337F33300099991999033337773FFFF33373333BB7100199
        113333377377773FF7F333BB333BB7011B33337733377F7777FF3BB3333BB333
        3BB3377333377F33377FBB33333BB33333BB7733333773333377}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnModem_Click
    end
    object btnIdent: TcxButton
      Left = 47
      Top = 0
      Width = 93
      Height = 27
      Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = btnIdentClick
      LookAndFeel.Kind = lfStandard
    end
    object cbAlwaysOnTop: TCheckBox
      Left = 438
      Top = 6
      Width = 108
      Height = 14
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1042#1089#1077#1075#1076#1072' '#1085#1072#1074#1077#1088#1093#1091
      TabOrder = 5
      Visible = False
      OnClick = cbAlwaysOnTopClick
    end
    object btnInst: TcxButton
      Left = 79
      Top = 0
      Width = 150
      Height = 27
      Caption = #1058#1077#1082#1091#1097#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnInstClick
      LookAndFeel.Kind = lfStandard
    end
    object btnMax: TcxButton
      Left = 239
      Top = 0
      Width = 93
      Height = 27
      Caption = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = btnMaxClick
      LookAndFeel.Kind = lfStandard
    end
    object btnArch: TcxButton
      Left = 249
      Top = 0
      Width = 150
      Height = 27
      Caption = #1040#1088#1093#1080#1074#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnArchClick
      LookAndFeel.Kind = lfStandard
    end
    object btnLoadInfoFromDevice: TcxButton
      Left = 644
      Top = 2
      Width = 73
      Height = 23
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Visible = False
      OnClick = btnLoadInfoFromDeviceClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000808
        08000808080008080800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000808
        0800FFFFFF00ADADAD000808080008080800FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000808080008080800080808000808
        0800FFFFFF0084848400848484000808080008080800FF00FF00FF00FF00FF00
        FF00FF00FF000808080008080800FF00FF0008080800FFFFFF00FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF00FF00FF00FF00
        FF00FF00FF0008080800CECECE0008080800CECECE00FFFFFF00FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF00080808000808
        08000808080008080800FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF0008080800FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
        0000FFFFFF0000000000000000008484840008080800FF00FF0008080800FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
        0000FFFFFF0084848400000000008484840008080800FF00FF0008080800FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF00080808000808
        08000808080008080800FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF00FF00FF00FF00
        FF00FF00FF0008080800CECECE0008080800CECECE00FFFFFF00FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF00FF00FF00FF00
        FF00FF00FF000808080008080800FF00FF0008080800FFFFFF00FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0008080800FFFFFF00FFFFFF000000
        000000000000FFFFFF00848484008484840008080800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0008080800FFFFFF00FFFFFF00FFFF
        FF000000000000000000FFFFFF008484840008080800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000808080008080800080808000808
        08000808080008080800080808000808080008080800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfStandard
    end
  end
  object pnStatus: TPanel
    Left = 0
    Top = 33
    Width = 706
    Height = 24
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 4
    Align = alTop
    TabOrder = 2
    Visible = False
    object cbRepeated: TComboBox
      Left = 424
      Top = 3
      Width = 66
      Height = 21
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 0
      Text = '10 '#1089#1077#1082
      Items.Strings = (
        '5 '#1089#1077#1082
        '10 '#1089#1077#1082
        '30 '#1089#1077#1082
        '1 '#1084#1080#1085)
    end
    object cbRepeatedRead: TCheckBox
      Left = 2
      Top = 6
      Width = 285
      Height = 14
      Caption = #1053#1077#1087#1088#1077#1088#1099#1074#1085#1099#1081' '#1086#1087#1088#1086#1089' '#1090#1077#1082#1091#1097#1080#1093' c '#1080#1085#1090#1077#1088#1074#1072#1083#1086#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = cbRepeatedReadClick
    end
  end
  object SaveDialog: TSaveDialog
    Left = 136
    Top = 40
  end
  object Timer: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = TimerTimer
    Left = 288
    Top = 37
  end
end
