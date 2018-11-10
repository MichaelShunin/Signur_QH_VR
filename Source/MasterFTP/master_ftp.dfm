object Form1: TForm1
  Left = 348
  Top = 185
  Width = 742
  Height = 266
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1088#1072#1081#1074#1077#1088#1072' signurdriverftp'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnContr: TPanel
    Left = 0
    Top = 0
    Width = 726
    Height = 77
    Align = alTop
    TabOrder = 0
    object btnLoad: TSpeedButton
      Left = 404
      Top = 4
      Width = 325
      Height = 69
      Caption = #1047#1040#1055#1056#1054#1057#1048#1058#1068' '#1054#1041#1053#1054#1042#1051#1045#1053#1048#1045' '#1040#1056#1061#1048#1042#1054#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnLoadClick
    end
    object lbInstr: TLabel
      Left = 16
      Top = 12
      Width = 78
      Height = 13
      Caption = #1058#1048#1055' '#1055#1056#1048#1041#1054#1056#1040
    end
    object lbSN: TLabel
      Left = 24
      Top = 48
      Width = 66
      Height = 13
      Caption = #1047#1040#1042'. '#1053#1054#1052#1045#1056
    end
    object cbInstr: TComboBox
      Left = 104
      Top = 4
      Width = 133
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ItemHeight = 19
      ItemIndex = 2
      ParentFont = False
      TabOrder = 0
      Text = #1040#1050#1056#1054#1053'-02-02'
      Items.Strings = (
        #1040#1050#1056#1054#1053'-01'
        #1040#1050#1056#1054#1053'-02-01'
        #1040#1050#1056#1054#1053'-02-02'
        #1069#1061#1054'-'#1056'-02'
        #1069#1061#1054'-'#1040#1057'-01')
    end
    object meSN: TMaskEdit
      Left = 104
      Top = 36
      Width = 133
      Height = 30
      EditMask = '00009;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 1
      Text = '7001'
    end
  end
  object pnMess: TPanel
    Left = 0
    Top = 168
    Width = 726
    Height = 59
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 256
    Top = 120
  end
end
