object CreateNewcalc_Form: TCreateNewcalc_Form
  Left = 176
  Top = 209
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1088#1072#1089#1095#1077#1090#1072
  ClientHeight = 228
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 6
    Top = 11
    Width = 125
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'  '#1088#1072#1089#1095#1077#1090#1072':'
  end
  object Label1: TLabel
    Left = 73
    Top = 34
    Width = 58
    Height = 13
    Caption = #1044#1074#1080#1075#1072#1090#1077#1083#1100':'
  end
  object Label3: TLabel
    Left = 14
    Top = 58
    Width = 117
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1082' '#1088#1072#1089#1095#1077#1090#1091':'
  end
  object edCalcName: TEdit
    Left = 142
    Top = 5
    Width = 265
    Height = 21
    MaxLength = 63
    TabOrder = 0
  end
  object cbEngine: TComboBox
    Left = 142
    Top = 29
    Width = 265
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object edCalcDescr: TMemo
    Left = 6
    Top = 77
    Width = 403
    Height = 115
    MaxLength = 1023
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 76
    Top = 198
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 184
    Top = 198
    Width = 183
    Height = 25
    Caption = #1047#1072#1076#1072#1085#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
    TabOrder = 4
    Kind = bkOK
  end
end
