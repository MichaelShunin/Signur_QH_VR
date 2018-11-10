object HelloForm: THelloForm
  Left = 187
  Top = 248
  BorderIcons = []
  BorderStyle = bsNone
  BorderWidth = 1
  Caption = #1055#1088#1080#1074#1077#1090#1089#1090#1074#1080#1077
  ClientHeight = 47
  ClientWidth = 411
  Color = clRed
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object NameLabel: TLabel
    Left = 16
    Top = 8
    Width = 377
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'NameLabel'
    Color = clRed
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Timer: TTimer
    Interval = 2000
    OnTimer = TimerTimer
    Left = 264
  end
end
