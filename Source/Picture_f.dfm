object Form1: TForm1
  Left = 183
  Top = 244
  Width = 783
  Height = 540
  Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1077#1085#1085#1086#1077' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object cxDBImage1: TcxDBImage
    Left = 0
    Top = 41
    Width = 772
    Height = 456
    Align = alClient
    DataBinding.DataField = 'PARAMIMAGE'
    Properties.GraphicClassName = 'TBitmap'
    Properties.Stretch = True
    Style.Color = clBtnFace
    Style.Shadow = True
    TabOrder = 0
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      775
      41)
    object btnEdit: TcxButton
      Left = 576
      Top = 6
      Width = 181
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
    end
  end
end
