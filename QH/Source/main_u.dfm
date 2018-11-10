object main: Tmain
  Left = 105
  Top = 136
  Width = 606
  Height = 356
  Caption = #1056#1072#1089#1095#1077#1090' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080' '#1088#1072#1089#1093#1086#1076#1086#1084#1077#1088#1086#1074' '#1057#1080#1075#1085#1091#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 588
    Height = 27
    ButtonHeight = 23
    Caption = 'ToolBar1'
    HotImages = DM.ImageList1
    Images = DM.ImageList1
    TabOrder = 0
    object ExitButton: TToolButton
      Left = 0
      Top = 2
      Hint = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
      Action = FileExit1
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton6: TToolButton
      Left = 23
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 31
      Top = 2
      Width = 1
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 32
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 43
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 40
      Top = 2
      Action = actArchiev
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton1: TToolButton
      Left = 63
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 71
      Top = 2
      Action = actCreateDevice
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton9: TToolButton
      Left = 94
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 41
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 102
      Top = 2
      Action = Action_UserGuide
    end
  end
  object MainMenu1: TMainMenu
    Images = DM.ImageList1
    Left = 184
    Top = 40
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object SQL1: TMenuItem
        Caption = 'SQL-'#1084#1086#1085#1080#1090#1086#1088
        OnClick = SQL1Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object ExitItem: TMenuItem
        Action = FileExit1
        Caption = #1042#1099#1093#1086#1076
      end
    end
    object N2: TMenuItem
      Caption = #1055#1088#1080#1073#1086#1088#1099
      object miCreateCalculation: TMenuItem
        Action = actCreateDevice
        SubMenuImages = DM.ImageList1
      end
      object OpenItem: TMenuItem
        Action = actArchiev
      end
    end
    object N3: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N4: TMenuItem
        Action = Action_About
        Caption = #1054' '#1089#1080#1089#1090#1077#1084#1077
      end
      object N7: TMenuItem
        Action = Action_UserGuide
        Caption = #1056#1091#1082#1086#1074#1086#1076#1089#1090#1074#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      end
    end
  end
  object ActionList1: TActionList
    Images = DM.ImageList1
    Left = 92
    Top = 60
    object FileExit1: TFileExit
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit|Quits the application'
      ImageIndex = 44
    end
    object Action_UserGuide: TAction
      Caption = 'Action1'
      Hint = #1056#1091#1082#1086#1074#1086#1076#1089#1090#1074#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ImageIndex = 41
      Visible = False
      OnExecute = Action_UserGuideExecute
    end
    object Action_About: TAction
      Caption = 'Action_About'
      OnExecute = Action_AboutExecute
    end
    object actCreateDevice: TAction
      Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1087#1088#1080#1073#1086#1088#1072
      Hint = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1088#1080#1073#1086#1088
      ImageIndex = 7
      OnExecute = actCreateDeviceExecute
    end
    object actArchiev: TAction
      Caption = #1040#1088#1093#1080#1074' '#1087#1088#1080#1073#1086#1088#1086#1074
      ImageIndex = 47
      OnExecute = actArchievExecute
    end
  end
end
