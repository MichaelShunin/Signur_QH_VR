object CreateNewDevice_Form: TCreateNewDevice_Form
  Left = 105
  Top = 115
  BorderStyle = bsDialog
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1087#1088#1080#1073#1086#1088#1072
  ClientHeight = 240
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 112
    Width = 95
    Height = 16
    Caption = #1058#1080#1087' '#1074#1086#1076#1086#1074#1086#1076#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 5
    Top = 285
    Width = 86
    Height = 16
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 85
    Top = 270
    Width = 82
    Height = 16
    Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 42
    Top = 230
    Width = 121
    Height = 32
    Alignment = taRightJustify
    Caption = #1040#1082#1091#1089#1090#1080#1095#1077#1089#1082#1080#1081' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1077#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object Label6: TLabel
    Left = 13
    Top = 42
    Width = 105
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Bevel1: TBevel
    Left = 7
    Top = 166
    Width = 449
    Height = 2
    Visible = False
  end
  object Label7: TLabel
    Left = 0
    Top = 227
    Width = 467
    Height = 13
    Align = alBottom
    Alignment = taCenter
    Caption = #1058#1080#1087' '#1087#1088#1080#1073#1086#1088#1072' '#1080' '#1074#1086#1076#1086#1074#1086#1076#1072' '#1074' '#1076#1072#1083#1100#1085#1077#1081#1096#1077#1084' '#1085#1077' '#1088#1077#1076#1072#1082#1090#1080#1088#1091#1077#1090#1089#1103'!'
    Color = 8454143
    ParentColor = False
    Visible = False
  end
  object cbTypeDevice: TComboBox
    Left = 158
    Top = 119
    Width = 288
    Height = 21
    AutoDropDown = True
    Style = csDropDownList
    DropDownCount = 12
    ItemHeight = 13
    TabOrder = 1
    Visible = False
    OnChange = cbTypeDeviceChange
  end
  object edDescr: TMemo
    Left = 9
    Top = 307
    Width = 447
    Height = 110
    MaxLength = 1023
    ScrollBars = ssBoth
    TabOrder = 4
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 49
    Top = 185
    Width = 74
    Height = 24
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 153
    Top = 69
    Width = 244
    Height = 25
    Caption = #1047#1072#1076#1072#1085#1080#1077' '#1082#1086#1084#1087#1083#1077#1082#1090#1072#1094#1080#1080' '#1080' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
    TabOrder = 6
    Visible = False
    OnClick = BitBtn2Click
    Kind = bkOK
  end
  object cbCustomer: TComboBox
    Left = 171
    Top = 268
    Width = 288
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object cbConverter: TComboBox
    Left = 171
    Top = 240
    Width = 288
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    Visible = False
  end
  object edDeviceNumber: TEdit
    Left = 164
    Top = 44
    Width = 149
    Height = 24
    MaxLength = 63
    TabOrder = 0
    Visible = False
    OnExit = edDeviceNumberExit
  end
  object edDeviceName: TComboBox
    Left = 13
    Top = 3
    Width = 446
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 7
    Visible = False
    OnClick = edDeviceNameClick
    Items.Strings = (
      #1056#1072#1089#1093#1086#1076#1086#1084#1077#1088
      #1059#1088#1086#1074#1085#1077#1084#1077#1088)
  end
  object RG_DeviceType: TRadioGroup
    Left = 8
    Top = 2
    Width = 311
    Height = 38
    Caption = #1058#1080#1087' '#1087#1088#1080#1073#1086#1088#1072
    Columns = 3
    Items.Strings = (
      #1069#1061#1054'-'#1056
      #1069#1061#1054'-'#1040#1057)
    TabOrder = 8
    Visible = False
    OnClick = RG_DeviceTypeClick
  end
  object Button1: TButton
    Left = 176
    Top = 189
    Width = 60
    Height = 20
    Caption = #1069#1061#1054'-'#1056
    TabOrder = 9
  end
  object Button2: TButton
    Left = 299
    Top = 189
    Width = 61
    Height = 20
    Caption = #1069#1061#1054'-'#1040#1057
    TabOrder = 10
  end
end
