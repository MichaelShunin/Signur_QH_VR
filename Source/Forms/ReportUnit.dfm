object ReportForm: TReportForm
  Left = 225
  Top = 110
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1086#1090#1095#1077#1090#1072
  ClientHeight = 193
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnShow = FormShow
  DesignSize = (
    460
    193)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 155
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 0
    DesignSize = (
      460
      155)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 441
      Height = 57
      AutoSize = False
      Caption = 
        #1057#1077#1081#1095#1072#1089' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1077' '#1087#1086#1076#1075#1086#1090#1072#1074#1083#1080#1074#1072#1077#1090' '#1086#1090#1095#1077#1090'. '#1053#1072' '#1076#1072#1085#1085#1086#1084' '#1080#1085#1076#1080#1082#1072#1090#1086#1088#1077' '#1074#1099' ' +
        #1084#1086#1078#1077#1090#1077' '#1085#1072#1073#1083#1102#1076#1072#1090#1100' '#1089#1090#1077#1087#1077#1085#1100' '#1075#1086#1090#1086#1074#1085#1086#1089#1090#1080' '#1086#1090#1095#1077#1090#1072'. '#1045#1089#1083#1080' '#1074#1099' '#1093#1086#1090#1080#1090#1077' '#1087#1088#1077#1088#1074 +
        #1072#1090#1100' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1091' '#1086#1090#1095#1077#1090#1072', '#1090#1086' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' ['#1054#1090#1084#1077#1085#1072']. '#1055#1086#1089#1083#1077' '#1089#1086#1079#1076#1072#1085#1080 +
        #1103' '#1086#1090#1095#1077#1090#1072' '#1076#1072#1085#1085#1072#1103' '#1092#1086#1088#1084#1072' '#1079#1072#1082#1088#1086#1077#1090#1089#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080'.'
      WordWrap = True
    end
    object ProgressLabel: TLabel
      Left = 8
      Top = 104
      Width = 441
      Height = 13
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = #1054#1073#1088#1072#1073#1072#1090#1099#1074#1072#1077#1090#1089#1103' '#1079#1072#1087#1080#1089#1100' '#8470'0'
    end
    object Label2: TLabel
      Left = 8
      Top = 128
      Width = 41
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1086':'
    end
    object Label3: TLabel
      Left = 128
      Top = 128
      Width = 109
      Height = 13
      Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100':'
    end
    object Label4: TLabel
      Left = 296
      Top = 128
      Width = 102
      Height = 13
      Caption = #1055#1088#1086#1075#1085#1086#1079' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
    end
    object StartLabel: TLabel
      Left = 56
      Top = 128
      Width = 44
      Height = 13
      Caption = '00:00:00'
    end
    object TimeLabel: TLabel
      Left = 248
      Top = 128
      Width = 28
      Height = 13
      Caption = '00:00'
    end
    object FinishLabel: TLabel
      Left = 408
      Top = 128
      Width = 44
      Height = 13
      Caption = '00:00:00'
    end
    object ProgressBar: TProgressBar
      Left = 8
      Top = 80
      Width = 441
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object CancelBtn: TButton
    Left = 384
    Top = 162
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object ProgressTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = ProgressTimerTimer
    Left = 8
    Top = 160
  end
end
