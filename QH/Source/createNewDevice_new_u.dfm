object CreateNewDevice_Form_new: TCreateNewDevice_Form_new
  Left = 237
  Top = 199
  BorderStyle = bsDialog
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1087#1088#1080#1073#1086#1088#1072
  ClientHeight = 127
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 120
  TextHeight = 16
  object BitBtn1: TBitBtn
    Left = 31
    Top = 41
    Width = 123
    Height = 49
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 190
    Top = 41
    Width = 161
    Height = 49
    Caption = #1069#1061#1054' - '#1056
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn2Click
    Kind = bkOK
  end
  object BitBtn3: TBitBtn
    Left = 386
    Top = 41
    Width = 162
    Height = 49
    Caption = #1069#1061#1054' - '#1040#1057
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn3Click
    Kind = bkOK
  end
end
