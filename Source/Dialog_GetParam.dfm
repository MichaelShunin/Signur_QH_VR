object DialogGetParam: TDialogGetParam
  Left = 358
  Top = 281
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072
  ClientHeight = 188
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Label4: TLabel
    Left = 10
    Top = 86
    Width = 175
    Height = 29
    AutoSize = False
    Caption = #1042#1077#1089#1086#1074#1072#1103' '#1092#1091#1085#1082#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Times New Roman Cyr'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 368
    Height = 24
    AutoSize = False
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1095#1077#1082' '#1074' '#1074#1099#1073#1086#1088#1082#1077' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1089#1087#1077#1082#1090#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Times New Roman Cyr'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 12
    Top = 51
    Width = 366
    Height = 32
    AutoSize = False
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1099#1073#1086#1088#1086#1082' '#1076#1083#1103' '#1091#1089#1088#1077#1076#1085#1077#1085#1080#1103' '#1089#1087#1077#1082#1090#1088#1072' '#1096#1091#1084#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Times New Roman Cyr'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object WinFunc: TComboBox
    Left = 152
    Top = 85
    Width = 369
    Height = 28
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -17
    Font.Name = 'System'
    Font.Style = []
    ItemHeight = 20
    ItemIndex = 0
    ParentFont = False
    TabOrder = 0
    Text = 'Rectangular'
    Items.Strings = (
      'Rectangular'
      'Hanning;'
      'Hamming;'
      'Kaiser-Bessel'
      'Flat Top'
      'Blackman-Harris'
      'Barlett'
      'Triangle '
      'Minimum 4-term Blackman-Harris')
  end
  object PointFFT: TComboBox
    Left = 378
    Top = 7
    Width = 143
    Height = 28
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -17
    Font.Name = 'System'
    Font.Style = []
    ItemHeight = 20
    ItemIndex = 3
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '1024'
    Items.Strings = (
      '8192'
      '4096'
      '2048'
      '1024'
      '512'
      '256'
      '128'
      '64'
      '32'
      '16')
  end
  object N_For_Noice: TComboBox
    Left = 378
    Top = 50
    Width = 143
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -17
    Font.Name = 'System'
    Font.Style = []
    ItemHeight = 20
    ItemIndex = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '1'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8')
  end
  object BitBtn1: TBitBtn
    Left = 296
    Top = 153
    Width = 82
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 136
    Top = 153
    Width = 82
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    Kind = bkCancel
  end
  object UseActiveCurve_CB: TCheckBox
    Left = 12
    Top = 124
    Width = 301
    Height = 17
    Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1072#1082#1090#1080#1074#1085#1091#1102' '#1082#1088#1080#1074#1091#1102
    TabOrder = 5
  end
end
