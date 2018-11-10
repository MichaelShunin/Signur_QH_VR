inherited AddSignurDeviceForm: TAddSignurDeviceForm
  Left = 162
  Top = 155
  BorderStyle = bsSingle
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1087#1088#1080#1073#1086#1088#1072
  ClientHeight = 334
  ClientWidth = 535
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 7
    Top = 86
    Width = 126
    Height = 13
    Caption = #1055#1088#1080#1087#1080#1089#1072#1085' '#1082' '#1086#1073#1098#1077#1082#1090#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 7
    Top = 112
    Width = 97
    Height = 13
    Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 7
    Top = 10
    Width = 93
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [3]
    Left = 7
    Top = 37
    Width = 80
    Height = 13
    Caption = #1058#1080#1087' '#1087#1088#1080#1073#1086#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [4]
    Left = 7
    Top = 61
    Width = 110
    Height = 13
    Caption = #1047#1072#1074#1086#1076#1089#1082#1086#1081' '#1085#1086#1084#1077#1088':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxButton1: TcxButton [5]
    Left = 83
    Top = 303
    Width = 82
    Height = 19
    Anchors = []
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfStandard
  end
  object btnSave: TcxButton [6]
    Left = 240
    Top = 302
    Width = 122
    Height = 21
    Anchors = []
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    OnClick = btnSaveClick
    LookAndFeel.Kind = lfStandard
  end
  object eksp_header: TcxTextEdit [7]
    Left = 137
    Top = 10
    Width = 362
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object Theme: TcxComboBox [8]
    Left = 137
    Top = 86
    Width = 362
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  object Author: TcxComboBox [9]
    Left = 137
    Top = 110
    Width = 362
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
  end
  object Device_CB: TcxComboBox [10]
    Left = 137
    Top = 36
    Width = 362
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Properties.DropDownListStyle = lsEditFixedList
    TabOrder = 5
  end
  object PageControl1: TPageControl [11]
    Left = 6
    Top = 174
    Width = 519
    Height = 117
    ActivePage = TabSheetMemo
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
    object TabSheetMemo: TTabSheet
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ImageIndex = 2
      object memo: TcxMemo
        Left = 0
        Top = 0
        Width = 511
        Height = 89
        Align = alClient
        Lines.Strings = (
          '')
        Properties.ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheetModem: TTabSheet
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1084#1086#1076#1077#1084#1085#1086#1081' '#1089#1074#1103#1079#1080
      DesignSize = (
        511
        89)
      object Label8: TLabel
        Left = 152
        Top = 57
        Width = 134
        Height = 13
        Caption = #1050#1086#1076' '#1076#1083#1103' '#1074#1099#1093#1086#1076#1072' "'#1074' '#1075#1086#1088#1086#1076'":'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 9
        Top = -1
        Width = 99
        Height = 26
        Caption = #1055#1086#1083#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1076#1083#1103' '#1085#1072#1073#1086#1088#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label_Tone: TLabel
        Left = 5
        Top = 24
        Width = 254
        Height = 13
        Caption = #1085#1072#1087#1088#1080#1084#1077#1088', +7 495 362 32 00  '#1080#1083#1080' +7 8617 85 6390'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        ParentFont = False
        Visible = False
      end
      object Label_pulse: TLabel
        Left = 4
        Top = 24
        Width = 221
        Height = 13
        Caption = #1085#1072#1087#1088#1080#1084#1077#1088', 84953623200  '#1080#1083#1080' 88617856390'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Tone_Pulse: TRadioGroup
        Left = 2
        Top = 40
        Width = 126
        Height = 46
        Caption = #1053#1072#1073#1086#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #1080#1084#1087#1091#1083#1100#1089#1085#1099#1081
          #1090#1086#1085#1072#1083#1100#1085#1099#1081)
        ParentFont = False
        TabOrder = 0
        OnClick = Tone_PulseClick
      end
      object Access: TcxComboBox
        Left = 289
        Top = 54
        Width = 210
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Properties.DropDownListStyle = lsEditFixedList
        Properties.DropDownRows = 11
        Properties.Items.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          #1087#1088#1103#1084#1086#1081' '#1074#1099#1093#1086#1076)
        TabOrder = 1
      end
      object Phone_Number: TcxTextEdit
        Left = 158
        Top = 2
        Width = 345
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Properties.MaxLength = 20
        TabOrder = 2
      end
    end
    object TabSheetMOdbus: TTabSheet
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' ModBus'
      ImageIndex = 1
      object Label9: TLabel
        Left = 52
        Top = 3
        Width = 79
        Height = 26
        Alignment = taRightJustify
        Caption = #1040#1076#1088#1077#1089' '#1087#1088#1080#1073#1086#1088#1072' (1..127):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object lbBdr: TLabel
        Left = 46
        Top = 31
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = #1057#1082#1086#1088#1086#1089#1090#1100', '#1073#1080#1090'/'#1089':'
      end
      object lbParity: TLabel
        Left = 40
        Top = 56
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1099#1081' '#1073#1080#1090':'
      end
      object ModBus_address: TcxSpinEdit
        Left = 137
        Top = 3
        Width = 66
        Height = 21
        Properties.MaxValue = 127.000000000000000000
        Properties.MinValue = 1.000000000000000000
        Properties.OnValidate = modbus_addressPropertiesValidate
        TabOrder = 0
        Value = 1
      end
      object cbBDR: TcxComboBox
        Left = 135
        Top = 28
        Width = 69
        Height = 21
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '1200'
          '2400'
          '4800'
          '9600')
        TabOrder = 1
        Text = '9600'
      end
      object cbParity: TcxComboBox
        Left = 135
        Top = 54
        Width = 69
        Height = 21
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #1085#1077#1090
          #1095#1077#1090'.'
          #1085#1077#1095#1077#1090'.')
        TabOrder = 2
        Text = #1085#1077#1090
      end
    end
    object TabSheetBlueTooth: TTabSheet
      Caption = 'PIN-'#1082#1086#1076
      ImageIndex = 3
      object Label7: TLabel
        Left = 44
        Top = 3
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = 'PIN-'#1082#1086#1076' '#1087#1088#1080#1073#1086#1088#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object BLUETOOTH_PIN: TcxSpinEdit
        Left = 137
        Top = 3
        Width = 66
        Height = 21
        Properties.MaxValue = 9999.000000000000000000
        Properties.OnValidate = modbus_addressPropertiesValidate
        TabOrder = 0
      end
    end
    object ts1: TTabSheet
      Caption = #1048#1085#1090#1077#1088#1085#1077#1090'-'#1076#1086#1089#1090#1091#1087
      ImageIndex = 4
      object Label10: TLabel
        Left = 28
        Top = 3
        Width = 101
        Height = 39
        Alignment = taRightJustify
        Caption = #1050#1086#1076' '#1076#1083#1103' '#1080#1085#1090#1077#1088#1085#1077#1090'-'#1076#1086#1089#1090#1091#1087#1072' '#1082' '#1072#1088#1093#1080#1074#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object cxFTP_PASSWORD: TcxMaskEdit
        Left = 139
        Top = 13
        Width = 158
        Height = 19
        AutoSize = False
        Properties.BeepOnError = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        TabOrder = 0
        Text = '0'
      end
    end
  end
  object device_Number: TcxMaskEdit [12]
    Left = 139
    Top = 61
    Width = 314
    Height = 19
    AutoSize = False
    Properties.BeepOnError = True
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d+'
    Properties.MaxLength = 0
    TabOrder = 7
  end
  object rgAccess: TRadioGroup [13]
    Left = 5
    Top = 132
    Width = 348
    Height = 42
    Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089' '#1087#1088#1080#1073#1086#1088#1072
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'RS-232'
      'RS485(Modbus)'
      'USB')
    TabOrder = 8
    OnClick = rgAccessClick
  end
  object cbVia_modem: TCheckBox [14]
    Left = 367
    Top = 141
    Width = 103
    Height = 32
    Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1084#1086#1076#1077#1084
    TabOrder = 9
    WordWrap = True
    OnClick = cbVia_modemClick
  end
  inherited MainMenu: TMainMenu
    Left = 360
    Top = 49
    inherited miFile: TMenuItem
      Visible = False
    end
    inherited miHelp: TMenuItem
      Visible = False
    end
    object N3: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082
      Visible = False
    end
  end
end
