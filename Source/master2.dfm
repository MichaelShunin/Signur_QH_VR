object Master2Form: TMaster2Form
  Left = 307
  Top = 92
  AutoScroll = False
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1080#1073#1086#1088#1086#1084
  ClientHeight = 102
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 14
  object Gauge: TGauge
    Left = 0
    Top = 85
    Width = 644
    Height = 17
    Align = alBottom
    BackColor = clActiveBorder
    BorderStyle = bsNone
    Color = clBlue
    ForeColor = clNavy
    ParentColor = False
    Progress = 0
    ShowText = False
  end
  object pnStatus: TPanel
    Left = 0
    Top = 51
    Width = 644
    Height = 20
    Align = alTop
    Color = 16777088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnButtons: TPanel
    Left = 0
    Top = 71
    Width = 644
    Height = 28
    Align = alTop
    TabOrder = 1
    Visible = False
    object CurrentScriptStage: TLabel
      Left = 496
      Top = 9
      Width = 3
      Height = 14
    end
    object btnArchP: TcxButton
      Left = 2
      Top = 4
      Width = 75
      Height = 21
      Caption = #1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnArchPClick
    end
    object btnArchH: TcxButton
      Left = 81
      Top = 4
      Width = 69
      Height = 21
      Caption = #1087#1086#1095#1072#1089#1086#1074#1086#1081
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnArchHClick
    end
    object btnArchD: TcxButton
      Left = 152
      Top = 4
      Width = 69
      Height = 21
      Caption = #1087#1086#1089#1091#1090#1086#1095#1085#1099#1081
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnArchDClick
    end
    object btnArchOn: TcxButton
      Left = 222
      Top = 4
      Width = 69
      Height = 21
      Caption = #1074#1082#1083#1102#1095#1077#1085#1080#1081
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnArchOnClick
    end
    object btnArchOff: TcxButton
      Left = 291
      Top = 4
      Width = 69
      Height = 21
      Caption = #1086#1090#1082#1083#1102#1095#1077#1085#1080#1081
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnArchOffClick
    end
    object btnArchErr: TcxButton
      Left = 373
      Top = 4
      Width = 90
      Height = 21
      Caption = #1072#1088#1093#1080#1074' '#1089#1086#1073#1099#1090#1080#1081
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnArchErrClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 29
    Align = alTop
    TabOrder = 2
    DesignSize = (
      644
      29)
    object btnLocal: TSpeedButton
      Left = 0
      Top = 3
      Width = 22
      Height = 23
      GroupIndex = 1
      Down = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
        0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnLocalClick
    end
    object btnModem: TSpeedButton
      Left = 24
      Top = 3
      Width = 22
      Height = 23
      Hint = #1088#1072#1079#1088#1077#1096#1080#1090#1100' '#1089#1074#1103#1079#1100' '#1095#1077#1088#1077#1079' '#1084#1086#1076#1077#1084
      GroupIndex = 1
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        003333377777777777F3333091111111103333F7F3F3F3F3F7F3311098080808
        10333777F737373737F313309999999910337F373F3F3F3F3733133309808089
        03337FFF7F7373737FFF1000109999901000777777FFFFF77777701110000000
        111037F337777777F3373099901111109990373F373333373337330999999999
        99033373FFFFFFFFFF7333310000000001333337777777777733333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnModemClick
    end
    object btnModbus: TSpeedButton
      Left = 48
      Top = 3
      Width = 22
      Height = 23
      Hint = #1088#1072#1088#1077#1096#1080#1090#1100' '#1089#1074#1103#1079#1100' '#1095#1077#1088#1077#1079' MODBUS'
      GroupIndex = 1
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
        00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
        00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
        03FF33337FFF77777333333300000333333F3333777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnModbusClick
    end
    object btnPrm: TSpeedButton
      Left = 78
      Top = 5
      Width = 24
      Height = 17
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnPrmClick
    end
    object cbAlwaysOnTop: TCheckBox
      Left = 531
      Top = 6
      Width = 110
      Height = 14
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1042#1089#1077#1075#1076#1072' '#1085#1072#1074#1077#1088#1093#1091
      TabOrder = 0
      Visible = False
      OnClick = cbAlwaysOnTopClick
    end
    object btnIdent: TcxButton
      Left = 105
      Top = 1
      Width = 100
      Height = 25
      Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = btnIdentClick
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
    end
    object btnInst: TcxButton
      Left = 112
      Top = 1
      Width = 197
      Height = 25
      Caption = #1058#1077#1082#1091#1097#1080#1077
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnInstClick
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
    end
    object btnMax: TcxButton
      Left = 313
      Top = 1
      Width = 100
      Height = 25
      Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1077
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      OnClick = btnMaxClick
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
    end
    object BitBtn1: TcxButton
      Left = 320
      Top = 1
      Width = 205
      Height = 25
      Caption = #1063#1080#1090#1072#1090#1100' '#1074#1089#1105
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn1Click
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
    end
    object btnLoadInfoFromDevice: TcxButton
      Left = 560
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
      TabOrder = 5
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
  object Panel2: TPanel
    Left = 0
    Top = 29
    Width = 644
    Height = 22
    Align = alTop
    TabOrder = 3
    DesignSize = (
      644
      22)
    object lbStrNum: TLabel
      Left = 415
      Top = 5
      Width = 65
      Height = 14
      Alignment = taCenter
      Anchors = [akTop, akRight]
      Caption = ' '#1095#1080#1089#1083#1086' '#1089#1090#1088#1086#1082
      Visible = False
    end
    object lbStrInit: TLabel
      Left = 502
      Top = 7
      Width = 89
      Height = 14
      Alignment = taCenter
      Anchors = [akTop, akRight]
      Caption = #1085#1072#1095#1072#1090#1100' '#1089#1086' '#1089#1090#1088#1086#1082#1080
      Visible = False
    end
    object btnTable: TcxButton
      Left = 0
      Top = 0
      Width = 133
      Height = 20
      Caption = #1079#1072#1075#1088#1091#1079#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 0
      OnClick = btnTableClick
      LookAndFeel.Kind = lfStandard
    end
    object btnSetDT: TcxButton
      Left = 142
      Top = 0
      Width = 124
      Height = 20
      Caption = #1091#1089#1090'. '#1076#1072#1090#1091' '#1080' '#1074#1088#1077#1084#1103
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 1
      OnClick = btnSetDTClick
      LookAndFeel.Kind = lfStandard
    end
    object meStrNum: TMaskEdit
      Left = 491
      Top = -3
      Width = 34
      Height = 27
      Anchors = [akTop, akRight]
      EditMask = '99;0; '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      Text = '8'
      Visible = False
    end
    object meStrInit: TMaskEdit
      Left = 597
      Top = -2
      Width = 39
      Height = 27
      Anchors = [akTop, akRight]
      EditMask = '9999;0; '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      TabOrder = 3
      Text = '1'
      Visible = False
    end
  end
  object ScriptTimer: TTimer
    Enabled = False
    OnTimer = ScriptTimerTimer
    Left = 370
    Top = 24
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 312
    Top = 32
  end
end
