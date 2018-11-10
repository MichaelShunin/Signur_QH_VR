inherited BlueToothForm: TBlueToothForm
  Left = 100
  Top = 113
  Width = 737
  Height = 282
  Caption = #1056#1072#1073#1086#1090#1072' '#1089#1086' '#1089#1095#1080#1090#1099#1074#1072#1090#1077#1083#1077#1084
  Constraints.MinHeight = 150
  FormStyle = fsStayOnTop
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object pnButtons: TPanel [0]
    Left = 0
    Top = 0
    Width = 719
    Height = 49
    Align = alTop
    Constraints.MinWidth = 630
    TabOrder = 0
    DesignSize = (
      719
      49)
    object lbStrNum: TLabel
      Left = 583
      Top = 61
      Width = 69
      Height = 16
      Alignment = taCenter
      Anchors = [akTop, akRight]
      Caption = #1076#1083#1080#1085#1072' '#1092#1088'.'
      Visible = False
    end
    object lbStrInit: TLabel
      Left = 600
      Top = 90
      Width = 75
      Height = 16
      Alignment = taCenter
      Anchors = [akTop, akRight]
      Caption = #1085#1072#1095#1072#1083#1086' '#1092#1088'.'
      Visible = False
    end
    object btnGetArch: TBitBtn
      Left = 243
      Top = 2
      Width = 218
      Height = 33
      Hint = 
        #1047#1072#1075#1088#1091#1079#1082#1072' '#1087#1086' BlueTooth '#1092#1072#1081#1083#1086#1074' '#1072#1088#1093#1080#1074#1086#1074' '#1087#1088#1080#1073#1086#1088#1086#1074' '#1057#1080#1075#1085#1091#1088' '#1080#1079' '#1091#1089#1090#1088#1086#1081#1089#1090 +
        #1074#1072' '#13#10#1089#1095#1080#1090#1099#1074#1072#1085#1080#1103' '#1072#1088#1093#1080#1074#1085#1099#1093' '#1092#1072#1081#1083#1086#1074' '#1074' '#1082#1086#1084#1087#1100#1102#1090#1077#1088' '#1080' '#1087#1086#1084#1077#1097#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093' '#1087 +
        #1088#1080#1073#1086#1088#1086#1074' '#13#10#1057#1080#1075#1085#1091#1088' '#1074' '#1072#1088#1093#1080#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' "'#1057#1080#1075#1085#1091#1088' '#1073#1072#1079#1072' '#1076#1072#1085#1085#1099#1093'"'
      Caption = #1057#1095#1080#1090#1099#1074#1072#1085#1080#1077
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      OnClick = btnIdentificationClick
    end
    object btnIdentification: TBitBtn
      Left = 16
      Top = 2
      Width = 401
      Height = 33
      Hint = 
        #1054#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1079#1072#1075#1088#1091#1078#1077#1085#1085#1099#1093' '#1074' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086' '#1089#1095#1080#1090#1099#1074#1072#1085#1080#1103' '#13#10#1072#1088#1093 +
        #1080#1074#1085#1099#1093' '#1092#1072#1081#1083#1086#1074' '#1087#1088#1080#1073#1086#1088#1086#1074' '#1057#1080#1075#1085#1091#1088' '#1080' '#1089#1095#1080#1090#1099#1074#1072#1085#1080#1077' '#1076#1072#1085#1085#1099#1093' '#1074' '#1072#1088#1093#1080#1074' '#1057#1080#1075#1085#1091#1088
      Caption = #1057#1095#1080#1090#1099#1074#1072#1085#1080#1077' '#1080' '#1079#1072#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1074' '#1072#1088#1093#1080#1074' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnIdentificationClick
    end
    object btnArchH: TBitBtn
      Left = -2
      Top = 96
      Width = 147
      Height = 22
      Caption = #1087#1086#1095#1072#1089#1086#1074#1086#1081' '#1072#1088#1093#1080#1074' ('#1092#1088'.)'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object btnArchD: TBitBtn
      Left = 160
      Top = 96
      Width = 129
      Height = 22
      Caption = #1087#1086#1089#1091#1090#1086#1095#1085#1099#1081' '#1072#1088#1093#1080#1074' ('#1092#1088'.)'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object btnArchOnOffErr: TBitBtn
      Left = 301
      Top = 95
      Width = 140
      Height = 22
      Caption = #1072#1088#1093#1080#1074' '#1087#1077#1088#1077#1088#1099#1074#1086#1074
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
    object btnArchP: TBitBtn
      Left = 449
      Top = 95
      Width = 144
      Height = 22
      Caption = #1072#1088#1093#1080#1074' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
    end
    object btnLoadInfoFromDevice: TcxButton
      Left = 630
      Top = 5
      Width = 82
      Height = 26
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Visible = False
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
    object btnClear: TBitBtn
      Left = 475
      Top = 2
      Width = 218
      Height = 33
      Hint = 
        #1057#1090#1080#1088#1072#1085#1080#1103' '#1087#1072#1084#1103#1090#1080' '#1085#1072#1082#1086#1087#1080#1090#1077#1083#1103' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1089#1095#1080#1090#1099#1074#1072#1085#1080#1103' '#13#10#1072#1088#1093#1080#1074#1086#1074' '#1087#1088#1080#1073#1086 +
        #1088#1086#1074' '#1057#1080#1075#1085#1091#1088
      Caption = #1057#1090#1080#1088#1072#1085#1080#1077
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnIdentificationClick
    end
  end
  object pnInfo: TPanel [1]
    Left = 0
    Top = 49
    Width = 719
    Height = 24
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 73
    Width = 719
    Height = 166
    Align = alClient
    TabOrder = 2
    object PB: TGauge
      Left = 1
      Top = 1
      Width = 717
      Height = 19
      Align = alTop
      ForeColor = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Progress = 0
      Visible = False
    end
    object lb: TListBox
      Left = 1
      Top = 20
      Width = 717
      Height = 145
      Align = alClient
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Small Fonts'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited MainMenu: TMainMenu
    Left = 604
    Top = 44
    inherited miFile: TMenuItem
      Visible = False
    end
    inherited miHelp: TMenuItem
      Visible = False
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 80
    Top = 121
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer2Timer
    Left = 232
    Top = 161
  end
end
