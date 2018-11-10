object WaitForm: TWaitForm
  Left = 236
  Top = 112
  BorderStyle = bsDialog
  Caption = #1042#1099#1087#1086#1083#1085#1103#1102#1090#1089#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
  ClientHeight = 93
  ClientWidth = 288
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    288
    93)
  PixelsPerInch = 96
  TextHeight = 13
  object InfoLabel: TLabel
    Left = 0
    Top = 0
    Width = 288
    Height = 33
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'InfoLabel'
    Layout = tlCenter
  end
  object ProgressBar: TProgressBar
    Left = 0
    Top = 33
    Width = 288
    Height = 24
    Align = alTop
    TabOrder = 0
  end
  object CloseBtn: TButton
    Left = 208
    Top = 64
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
end
