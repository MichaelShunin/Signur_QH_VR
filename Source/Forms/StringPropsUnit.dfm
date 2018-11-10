object StringPropForm: TStringPropForm
  Left = 285
  Top = 219
  Width = 474
  Height = 113
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1089#1087#1080#1089#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object NameLabel: TLabel
    Left = 8
    Top = 12
    Width = 144
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1087#1080#1089#1082#1072' '#1085#1072' '#1092#1086#1088#1084#1077':'
  end
  object IdentLabel: TLabel
    Left = 8
    Top = 44
    Width = 128
    Height = 13
    Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1074' '#1086#1090#1095#1077#1090#1077':'
  end
  object OKBtn: TButton
    Left = 384
    Top = 8
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelBtn: TButton
    Left = 384
    Top = 40
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object NameEdit: TEdit
    Left = 160
    Top = 10
    Width = 209
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 2
  end
  object IdentEdit: TEdit
    Left = 160
    Top = 40
    Width = 209
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 3
  end
end
