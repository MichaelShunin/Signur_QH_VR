object Master2Form: TMaster2Form
  Left = 277
  Top = 137
  AutoScroll = False
  Caption = 'SignurDriver2 Test'
  ClientHeight = 453
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Gauge: TGauge
    Left = 0
    Top = 384
    Width = 715
    Height = 28
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
    Top = 412
    Width = 715
    Height = 41
    Align = alBottom
    Alignment = taRightJustify
    TabOrder = 0
    object btnTable: TBitBtn
      Left = 0
      Top = 0
      Width = 169
      Height = 41
      Caption = #1079#1072#1075#1088#1091#1079#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnTableClick
    end
    object btnSetDT: TBitBtn
      Left = 168
      Top = 0
      Width = 161
      Height = 41
      Caption = #1091#1089#1090'. '#1076#1072#1090#1091' '#1080' '#1074#1088#1077#1084#1103
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnSetDTClick
    end
  end
  object pnButtons: TPanel
    Left = 0
    Top = 0
    Width = 715
    Height = 137
    Align = alTop
    TabOrder = 1
    DesignSize = (
      715
      137)
    object lbStrNum: TLabel
      Left = 600
      Top = 32
      Width = 65
      Height = 14
      Alignment = taCenter
      Anchors = [akTop, akRight]
      Caption = ' '#1095#1080#1089#1083#1086' '#1089#1090#1088#1086#1082
    end
    object btnModem: TSpeedButton
      Left = 192
      Top = 96
      Width = 169
      Height = 41
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
    object btnPrm: TSpeedButton
      Left = 528
      Top = 96
      Width = 185
      Height = 41
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
    object lbStrInit: TLabel
      Left = 579
      Top = 9
      Width = 89
      Height = 14
      Alignment = taCenter
      Anchors = [akTop, akRight]
      Caption = #1085#1072#1095#1072#1090#1100' '#1089#1086' '#1089#1090#1088#1086#1082#1080
    end
    object btnLocal: TSpeedButton
      Left = 0
      Top = 96
      Width = 193
      Height = 41
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
    object btnModbus: TSpeedButton
      Left = 360
      Top = 96
      Width = 169
      Height = 41
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
    object btnIdent: TBitBtn
      Left = 0
      Top = 0
      Width = 145
      Height = 49
      Caption = #1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1103
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnIdentClick
    end
    object btnInst: TBitBtn
      Left = 144
      Top = 0
      Width = 145
      Height = 49
      Caption = #1090#1077#1082#1091#1097#1080#1077
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnInstClick
    end
    object btnMax: TBitBtn
      Left = 288
      Top = 0
      Width = 145
      Height = 49
      Caption = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1077
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnMaxClick
    end
    object btnArchH: TBitBtn
      Left = 0
      Top = 48
      Width = 145
      Height = 49
      Caption = #1087#1086#1095#1072#1089#1086#1074#1086#1081' '#1072#1088#1093#1080#1074
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnArchHClick
    end
    object btnArchD: TBitBtn
      Left = 144
      Top = 48
      Width = 145
      Height = 49
      Caption = #1087#1086#1089#1091#1090#1086#1095#1085#1099#1081' '#1072#1088#1093#1080#1074
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnArchDClick
    end
    object btnArchOn: TBitBtn
      Left = 288
      Top = 48
      Width = 145
      Height = 49
      Caption = #1072#1088#1093#1080#1074' '#1074#1082#1083#1102#1095#1077#1085#1080#1081
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnArchOnClick
    end
    object btnArchOff: TBitBtn
      Left = 432
      Top = 48
      Width = 145
      Height = 49
      Caption = #1072#1088#1093#1080#1074' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1081
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btnArchOffClick
    end
    object btnArchP: TBitBtn
      Left = 432
      Top = 0
      Width = 145
      Height = 49
      Caption = #1072#1088#1093#1080#1074' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = btnArchPClick
    end
    object meStrNum: TMaskEdit
      Left = 674
      Top = 24
      Width = 37
      Height = 26
      Anchors = [akTop, akRight]
      EditMask = '99;0; '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      TabOrder = 8
      Text = '8'
    end
    object btnArchErr: TBitBtn
      Left = 576
      Top = 48
      Width = 137
      Height = 49
      Caption = #1072#1088#1093#1080#1074' '#1089#1086#1073#1099#1090#1080#1081
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = btnArchErrClick
    end
    object meStrInit: TMaskEdit
      Left = 674
      Top = 0
      Width = 39
      Height = 26
      Anchors = [akTop, akRight]
      EditMask = '9999;0; '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      TabOrder = 10
      Text = '1'
    end
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 8
    Top = 160
  end
end
