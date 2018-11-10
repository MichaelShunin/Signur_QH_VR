object masterFTP_Form: TmasterFTP_Form
  Left = 341
  Top = 172
  Width = 788
  Height = 122
  BorderIcons = []
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' FTP-'#1089#1077#1088#1074#1077#1088#1086#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge: TGauge
    Left = 0
    Top = 9
    Width = 772
    Height = 9
    Align = alTop
    BackColor = 15461355
    BorderStyle = bsNone
    Color = clBlue
    ForeColor = clNavy
    ParentColor = False
    Progress = 0
    ShowText = False
  end
  object pnContr: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 9
    Align = alTop
    TabOrder = 0
    Visible = False
    DesignSize = (
      772
      9)
    object btnLoad: TSpeedButton
      Left = 24
      Top = 4
      Width = 377
      Height = 29
      Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1072#1088#1093#1080#1074#1086#1074' '#1089' FTP-'#1089#1077#1088#1074#1077#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnLoadClick
    end
    object lbInstr: TLabel
      Left = 360
      Top = 36
      Width = 78
      Height = 13
      Caption = #1058#1048#1055' '#1055#1056#1048#1041#1054#1056#1040
      Visible = False
    end
    object lbSN: TLabel
      Left = 368
      Top = 12
      Width = 66
      Height = 13
      Caption = #1047#1040#1042'. '#1053#1054#1052#1045#1056
      Visible = False
    end
    object cbInstr: TComboBox
      Left = 448
      Top = 31
      Width = 133
      Height = 23
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ItemHeight = 15
      ParentFont = False
      TabOrder = 0
      Text = #1040#1050#1056#1054#1053'-02-02'
      Items.Strings = (
        #1040#1050#1056#1054#1053'-01'
        #1040#1050#1056#1054#1053'-02-01'
        #1040#1050#1056#1054#1053'-02-02'
        #1040#1050#1056#1054#1053'-02-03'
        #1069#1061#1054'-'#1056'-02'
        #1069#1061#1054'-'#1040#1057'-01')
    end
    object meSN: TMaskEdit
      Left = 448
      Top = 4
      Width = 133
      Height = 24
      Enabled = False
      EditMask = '00009;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 1
      Text = '7001'
      Visible = False
    end
    object cbAlwaysOnTop: TCheckBox
      Left = 388
      Top = 6
      Width = 108
      Height = 14
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1042#1089#1077#1075#1076#1072' '#1085#1072#1074#1077#1088#1093#1091
      TabOrder = 2
      Visible = False
    end
  end
  object pnMess: TPanel
    Left = 0
    Top = 52
    Width = 772
    Height = 31
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 10485760
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object btnCancel: TButton
      Left = 712
      Top = 3
      Width = 51
      Height = 20
      Hint = 
        #1054#1090#1084#1077#1085#1072' '#1089#1077#1072#1085#1089#1072' '#1089#1074#1103#1079#1080' '#1089' '#1089#1077#1088#1074#1077#1088#1086#1084', '#1085#1072#1087#1088#1080#1084#1077#1088','#13#10' '#1074' '#1089#1083#1091#1095#1072#1077' '#1076#1086#1083#1075#1086#1075#1086' '#1086#1078#1080 +
        #1076#1072#1085#1080#1077'  '#1086#1090#1074#1077#1090#1072' '#1080#1083#1080' '#1087#1086#1090#1077#1088#1080' '#13#10#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103' '#1089' '#1089#1077#1088#1074#1077#1088#1086#1084' '#1074' '#1093#1086#1076#1077' '#1091#1078#1077'  '#1085#1072#1095 +
        #1072#1074#1096#1077#1075#1086#1089#1103#13#10' '#1087#1088#1086#1094#1077#1089#1089#1072' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1076#1072#1085#1085#1099#1093'.'
      Caption = #1054#1090#1084#1077#1085#1072
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnCancelClick
    end
  end
  object pnStatus: TPanel
    Left = 0
    Top = 25
    Width = 772
    Height = 27
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 10485760
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object mm: TMemo
    Left = 0
    Top = 18
    Width = 772
    Height = 7
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 3
    Visible = False
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 280
    Top = 16
  end
  object Timerclose: TTimer
    Enabled = False
    Interval = 3500
    OnTimer = TimercloseTimer
    Left = 416
    Top = 16
  end
end
