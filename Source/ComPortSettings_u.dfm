object ComPortSettings_form: TComPortSettings_form
  Left = 199
  Top = 199
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072' '
  ClientHeight = 177
  ClientWidth = 312
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 297
    Height = 121
    Shape = bsFrame
  end
  object lbl1: TLabel
    Left = 39
    Top = 78
    Width = 146
    Height = 48
    Alignment = taRightJustify
    Caption = #1047#1072#1076#1072#1081#1090#1077' '#1085#1086#1084#1077#1088' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1086#1075#1086' '#1087#1086#1088#1090#1072':'#13#10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object OKBtn: TButton
    Left = 16
    Top = 140
    Width = 146
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100' '
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 167
    Top = 140
    Width = 138
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object se1: TSpinEdit
    Left = 192
    Top = 83
    Width = 55
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxValue = 127
    MinValue = 1
    ParentFont = False
    TabOrder = 2
    Value = 4
  end
  object chkAuto: TCheckBox
    Left = 52
    Top = 15
    Width = 217
    Height = 49
    Alignment = taLeftJustify
    Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1085#1086#1084#1077#1088#1072' '#1087#1086#1088#1090#1072' ('#1088#1077#1082#1086#1084#1077#1085#1076#1091#1077#1090#1089#1103')'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 3
    WordWrap = True
    OnClick = chkAutoClick
  end
end
