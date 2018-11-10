object CreateNewDevice_Form_new: TCreateNewDevice_Form_new
  Left = 777
  Top = 199
  BorderStyle = bsDialog
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1087#1088#1080#1073#1086#1088#1072
  ClientHeight = 103
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 8
    Width = 124
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1080#1073#1086#1088#1072':'
  end
  object Label2: TLabel
    Left = 56
    Top = 32
    Width = 134
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072' ('#1076#1072#1090#1095#1080#1082#1072'): '
  end
  object BitBtn1: TBitBtn
    Left = 25
    Top = 58
    Width = 100
    Height = 40
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 154
    Top = 58
    Width = 295
    Height = 40
    Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1073#1086#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn2Click
    Kind = bkOK
  end
  object edDevice_name: TEdit
    Left = 216
    Top = 8
    Width = 225
    Height = 21
    MaxLength = 64
    TabOrder = 2
  end
  object edDevice_Number: TEdit
    Left = 216
    Top = 32
    Width = 225
    Height = 21
    MaxLength = 32
    TabOrder = 3
  end
end
