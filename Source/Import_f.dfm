inherited ImportForm: TImportForm
  Left = 167
  Top = 190
  Width = 838
  Height = 361
  Caption = #1048#1084#1087#1086#1088#1090' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1072#1083#1100#1085#1099#1093' '#1076#1072#1085#1085#1099#1093
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Panel2: TPanel [0]
    Left = 0
    Top = 0
    Width = 830
    Height = 296
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LV: TListView
      Left = 1
      Top = 90
      Width = 828
      Height = 186
      Align = alClient
      Columns = <
        item
          Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
          Width = 250
        end
        item
          Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          Width = 165
        end
        item
          Alignment = taRightJustify
          Caption = #1050#1072#1085#1072#1083#1099
          Width = 65
        end
        item
          Alignment = taRightJustify
          Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100'. c'#1077#1082
          Width = 140
        end
        item
          Alignment = taRightJustify
          Caption = #1063#1072#1089#1090#1086#1090#1072' '#1076#1080#1089#1082#1088', '#1043#1094
          Width = 140
        end
        item
          AutoSize = True
          Caption = #1054' '#1089#1080#1075#1085#1072#1083#1077
        end>
      Ctl3D = False
      FlatScrollBars = True
      GridLines = True
      HideSelection = False
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 828
      Height = 89
      Align = alTop
      BorderStyle = bsSingle
      Constraints.MinWidth = 275
      TabOrder = 0
      DesignSize = (
        824
        85)
      object Label1: TLabel
        Left = 7
        Top = 7
        Width = 45
        Height = 16
        Caption = #1058#1077#1084#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 364
        Top = 7
        Width = 71
        Height = 16
        Caption = #1057#1090#1072#1085#1094#1080#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 50
        Top = 58
        Width = 102
        Height = 16
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 32
        Width = 146
        Height = 16
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1089#1080#1075#1085#1072#1083#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxButton2: TcxButton
        Left = 714
        Top = 7
        Width = 101
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = cxButton2Click
        LookAndFeel.Kind = lfStandard
      end
      object cxButton1: TcxButton
        Left = 714
        Top = 51
        Width = 101
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 1
        OnClick = cxButton1Click
        LookAndFeel.Kind = lfStandard
      end
      object memo: TEdit
        Left = 156
        Top = 56
        Width = 534
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 1024
        TabOrder = 2
      end
      object SignalSource: TEdit
        Left = 156
        Top = 29
        Width = 534
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 1024
        TabOrder = 3
      end
      object Theme: TComboBox
        Left = 52
        Top = 4
        Width = 305
        Height = 24
        DropDownCount = 10
        ItemHeight = 16
        TabOrder = 4
      end
      object Author: TComboBox
        Left = 440
        Top = 4
        Width = 189
        Height = 24
        DropDownCount = 10
        ItemHeight = 16
        TabOrder = 5
      end
    end
    object LB1: TListBox
      Left = 324
      Top = 86
      Width = 113
      Height = 175
      ItemHeight = 16
      MultiSelect = True
      TabOrder = 1
      Visible = False
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 276
      Width = 828
      Height = 19
      Panels = <
        item
          Width = 300
        end>
    end
  end
  inherited MainMenu: TMainMenu
    Left = 116
    Top = 128
    inherited miFile: TMenuItem
      Visible = False
    end
    inherited miHelp: TMenuItem
      Visible = False
    end
    object N3: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082
      OnClick = ImportClick
    end
  end
  object OD: TOpenDialog
    Filter = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1089#1087#1099#1090#1072#1085#1080#1081' (*.lcr)|*.lcr|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Options = [ofReadOnly, ofHideReadOnly, ofShowHelp, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1059#1082#1072#1078#1080#1090#1077' '#1092#1072#1081#1083'('#1099') '#1089' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072#1084#1080' '#1080#1089#1087#1099#1090#1072#1085#1080#1081
    Left = 184
    Top = 108
  end
end
