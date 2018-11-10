inherited ArchievInfoForm: TArchievInfoForm
  Left = 212
  Top = 161
  BorderStyle = bsDialog
  Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1072#1088#1093#1080#1074#1072
  ClientHeight = 376
  ClientWidth = 592
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 344
    Width = 592
    Height = 32
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 192
      Top = 3
      Width = 105
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 356
      Top = 3
      Width = 105
      Height = 25
      TabOrder = 1
      Kind = bkOK
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 32
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 4
      Width = 82
      Height = 16
      Caption = #1048#1084#1103' '#1072#1088#1093#1080#1074#1072':'
    end
    object ArchievName: TStaticText
      Left = 100
      Top = 4
      Width = 481
      Height = 20
      AutoSize = False
      BevelOuter = bvRaised
      BorderStyle = sbsSunken
      Caption = 'ArchievName'
      Color = clInactiveCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 32
    Width = 592
    Height = 312
    Align = alClient
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1072#1088#1093#1080#1074#1072
    TabOrder = 2
    object Info: TMemo
      Left = 2
      Top = 18
      Width = 588
      Height = 292
      Align = alClient
      Lines.Strings = (
        '')
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
