object ProcessWaitForm: TProcessWaitForm
  Left = 427
  Top = 372
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1054#1078#1080#1076#1072#1085#1080#1077
  ClientHeight = 129
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 42
    Width = 316
    Height = 4
    Align = alTop
    BevelOuter = bvNone
    Color = 16776176
    TabOrder = 0
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 316
    Height = 42
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    Color = 14054755
    TabOrder = 1
    object lblComment: TLabel
      Left = 10
      Top = 24
      Width = 261
      Height = 16
      AutoSize = False
      Caption = #1048#1076#1077#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077', '#1087#1086#1076#1086#1078#1076#1080#1090#1077' '#1087#1086#1078#1072#1083#1091#1081#1089#1090#1072' ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblProcessName: TLabel
      Left = 8
      Top = 7
      Width = 101
      Height = 16
      Caption = 'lblProcessName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object Animate: TAnimate
    Left = 0
    Top = 46
    Width = 316
    Height = 55
    Align = alClient
    Active = True
    CommonAVI = aviCopyFiles
    StopFrame = 31
  end
  object pnlProgress: TPanel
    Left = 0
    Top = 101
    Width = 316
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object ProgressBar: TProgressBar
      Left = 7
      Top = 7
      Width = 299
      Height = 13
      TabOrder = 0
    end
  end
end
