object PrmModbusForm: TPrmModbusForm
  Left = 453
  Top = 313
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1077#1090#1080' MODBUS'
  ClientHeight = 102
  ClientWidth = 229
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbAddr: TLabel
    Left = 56
    Top = 16
    Width = 95
    Height = 13
    Caption = #1072#1076#1088#1077#1089' ('#1086#1090' 1 '#1076#1086' 247)'
  end
  object lbBdr: TLabel
    Left = 56
    Top = 48
    Width = 81
    Height = 13
    Caption = #1089#1082#1086#1088#1086#1089#1090#1100', '#1073#1080#1090'/'#1089
  end
  object lbParity: TLabel
    Left = 56
    Top = 80
    Width = 87
    Height = 13
    Caption = #1082#1086#1085#1090#1088#1086#1083#1100#1085#1099#1081' '#1073#1080#1090
  end
  object meAddr: TMaskEdit
    Left = 176
    Top = 8
    Width = 47
    Height = 21
    EditMask = '999;0; '
    MaxLength = 3
    TabOrder = 0
    Text = '1'
  end
  object cbBdr: TComboBox
    Left = 176
    Top = 40
    Width = 49
    Height = 21
    ItemHeight = 13
    ItemIndex = 3
    TabOrder = 1
    Text = '9600'
    Items.Strings = (
      '1200'
      '2400'
      '4800'
      '9600')
  end
  object cbParity: TComboBox
    Left = 176
    Top = 72
    Width = 49
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = #1085#1077#1090
    Items.Strings = (
      #1085#1077#1090
      #1095#1077#1090'.'
      #1085#1077#1095#1077#1090'.')
  end
end
