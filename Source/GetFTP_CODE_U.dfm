object Form1: TForm1
  Left = 407
  Top = 237
  Width = 497
  Height = 194
  Caption = #1057#1080#1075#1085#1091#1088' - '#1088#1072#1089#1095#1077#1090' '#1082#1086#1076#1072' '#1080#1085#1090#1077#1088#1085#1077#1090'-'#1076#1086#1089#1090#1091#1087#1072' '#1082' '#1072#1088#1093#1080#1074#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 20
    Width = 135
    Height = 13
    Caption = #1047#1072#1074#1086#1076#1089#1082#1086#1081' '#1085#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072
  end
  object Label2: TLabel
    Left = 256
    Top = 20
    Width = 178
    Height = 13
    Cursor = crHandPoint
    Hint = #1050#1083#1080#1082#1085#1080#1090#1077' '#1076#1083#1103' '#1079#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103' '#1082#1086#1076#1072' '#1074' '#1073#1091#1092#1077#1088#1077' '#1086#1073#1084#1077#1085#1072' Windows'
    Caption = #1050#1086#1076' '#1076#1083#1103' '#1080#1085#1090#1077#1088#1085#1077#1090' '#1076#1086#1089#1090#1091#1087#1072' '#1082' '#1072#1088#1093#1080#1074#1091
    ParentShowHint = False
    ShowHint = True
    OnClick = Label2Click
  end
  object cxCurrentNomer: TcxSpinEdit
    Left = 24
    Top = 44
    Width = 161
    Height = 33
    ParentFont = False
    Properties.MaxValue = 999999.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Properties.OnChange = cxSpinEdit1PropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -21
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 0
    Value = 1
  end
  object Button1: TButton
    Left = 184
    Top = 104
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object cxFTP_CODE: TcxTextEdit
    Left = 256
    Top = 44
    Width = 177
    Height = 33
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -21
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 2
  end
end
