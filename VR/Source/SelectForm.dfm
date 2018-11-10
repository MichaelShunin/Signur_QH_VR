object SelectFrm: TSelectFrm
  Left = 457
  Top = 162
  Width = 405
  Height = 417
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1074#1086#1076#1086#1074#1086#1076#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 255
    Width = 397
    Height = 128
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 224
      Top = 94
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 96
      Top = 94
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object Memo1: TMemo
      Left = 0
      Top = 0
      Width = 397
      Height = 89
      Align = alTop
      Alignment = taCenter
      Color = 8454143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        #1057#1084#1077#1085#1072' '#1074#1086#1076#1086#1074#1086#1076#1072' '#1087#1088#1080#1074#1077#1076#1077#1090' '#1082' '#1091#1076#1072#1083#1077#1085#1080#1102
        ' '#1088#1072#1085#1077#1077' '#1089#1086#1079#1076#1072#1085#1085#1086#1081' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
        #1080' '#1074#1089#1077#1093' '#1088#1072#1085#1077#1077'  '#1079#1072#1076#1072#1085#1085#1099#1093' '
        #1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1074#1086#1076#1086#1074#1086#1076#1072'.  ')
      ParentFont = False
      TabOrder = 2
    end
  end
  object ListBox1: TListBox
    Left = 0
    Top = 0
    Width = 397
    Height = 255
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 1
    OnDblClick = ListBox1DblClick
  end
end
