object DbGridFrame: TDbGridFrame
  Left = 0
  Top = 0
  Width = 526
  Height = 240
  AutoScroll = False
  TabOrder = 0
  object Grid: TDBGridEh
    Left = 115
    Top = 25
    Width = 411
    Height = 215
    Align = alClient
    AllowedOperations = []
    AllowedSelections = []
    ColumnDefValues.Title.TitleButton = True
    DataSource = DataSource
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    HorzScrollBar.Tracking = True
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghClearSelection, dghAutoSortMarking, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight]
    PopupMenu = PopupMenu
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    VertScrollBar.Tracking = True
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnColEnter = GridColEnter
    OnColumnMoved = GridColumnMoved
    OnDblClick = GridDblClick
    OnExit = GridExit
    OnKeyDown = FrameKeyDown
    OnKeyPress = GridKeyPress
    OnSortMarkingChanged = GridSortMarkingChanged
    object ToolBtn: TSpeedButton
      Left = 1
      Top = 1
      Width = 20
      Height = 20
      Hint = #1055#1072#1085#1077#1083#1100' '#1087#1086#1080#1089#1082#1072' (Ctrl+S)'
      AllowAllUp = True
      GroupIndex = 1
      Flat = True
      NumGlyphs = 2
      PopupMenu = PopupMenu
      OnClick = ToolBtnClick
    end
  end
  object ToolPanel: TPanel
    Left = 0
    Top = 25
    Width = 115
    Height = 215
    Align = alLeft
    BevelOuter = bvNone
    Constraints.MinWidth = 60
    TabOrder = 0
    Visible = False
    DesignSize = (
      115
      215)
    object Label1: TLabel
      Left = 4
      Top = 50
      Width = 89
      Height = 13
      Caption = #1055#1086#1083#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072':'
      PopupMenu = PopupMenu
    end
    object Label2: TLabel
      Left = 4
      Top = 8
      Width = 51
      Height = 13
      Caption = #1047#1085#1072#1095#1077#1085#1080#1077':'
      PopupMenu = PopupMenu
    end
    object Label3: TLabel
      Left = 4
      Top = 92
      Width = 61
      Height = 13
      Caption = #1042#1080#1076' '#1087#1086#1080#1089#1082#1072':'
      PopupMenu = PopupMenu
    end
    object SimilarityLabel: TLabel
      Left = 4
      Top = 138
      Width = 47
      Height = 13
      Caption = #1057#1093#1086#1076#1089#1090#1074#1086
      PopupMenu = PopupMenu
    end
    object Bevel: TBevel
      Left = 111
      Top = 0
      Width = 4
      Height = 215
      Align = alRight
      Style = bsRaised
    end
    object Label4: TLabel
      Left = 96
      Top = 138
      Width = 8
      Height = 13
      Caption = '%'
      PopupMenu = PopupMenu
    end
    object SetFilterBtn: TSpeedButton
      Left = 67
      Top = 164
      Width = 20
      Height = 20
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' (Ctrl+P)'
      Anchors = [akTop, akRight]
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SetFilterBtnClick
    end
    object PrevBtn: TSpeedButton
      Left = 68
      Top = 3
      Width = 20
      Height = 20
      Hint = #1048#1089#1082#1072#1090#1100' '#1087#1088#1077#1076#1099#1076#1091#1097#1091#1102' (Ctrl+Up)'
      Anchors = [akTop, akRight]
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = PrevBtnClick
    end
    object NextBtn: TSpeedButton
      Left = 88
      Top = 3
      Width = 20
      Height = 20
      Hint = #1048#1089#1082#1072#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1091#1102' (Ctrl+Down)'
      Anchors = [akTop, akRight]
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = NextBtnClick
    end
    object CancelFilterBtn: TSpeedButton
      Left = 87
      Top = 164
      Width = 20
      Height = 20
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' (Ctrl+P)'
      Anchors = [akTop, akRight]
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = CancelFilterBtnClick
    end
    object AllBtn: TSpeedButton
      Left = 88
      Top = 26
      Width = 20
      Height = 20
      Hint = #1048#1089#1082#1072#1090#1100' '#1087#1086' '#1074#1089#1077#1084#1091' (Ctrl+Right)'
      Anchors = [akTop, akRight]
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = AllBtnClick
    end
    object FieldCombo: TComboBox
      Left = 4
      Top = 67
      Width = 103
      Height = 21
      Hint = #1055#1086#1083#1077', '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1089#1083#1077#1076#1091#1077#1090' '#1074#1099#1087#1086#1083#1085#1103#1090#1100' '#1087#1086#1080#1089#1082
      BevelKind = bkFlat
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      PopupMenu = PopupMenu
      TabOrder = 1
      OnKeyDown = FrameKeyDown
      OnKeyPress = KeyPressRouter
    end
    object ValueEdit: TEdit
      Left = 4
      Top = 25
      Width = 81
      Height = 21
      Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
      Anchors = [akLeft, akTop, akRight]
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 0
      OnKeyDown = FrameKeyDown
      OnKeyPress = KeyPressRouter
    end
    object SearchCombo: TComboBox
      Left = 4
      Top = 109
      Width = 103
      Height = 21
      Hint = #1050#1088#1080#1090#1077#1088#1080#1081', '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1086#1090#1073#1080#1088#1072#1102#1090#1089#1103' '#1079#1072#1087#1080#1089#1080
      BevelKind = bkFlat
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      ItemIndex = 1
      PopupMenu = PopupMenu
      TabOrder = 2
      Text = #1055#1086#1076#1089#1090#1088#1086#1082#1072
      OnKeyDown = FrameKeyDown
      OnKeyPress = KeyPressRouter
      Items.Strings = (
        #1057' '#1085#1072#1095#1072#1083#1072
        #1055#1086#1076#1089#1090#1088#1086#1082#1072
        #1058#1086#1095#1085#1086
        #1057#1093#1086#1078#1080#1077
        #1055#1091#1089#1090#1099#1077
        #1053#1077#1087#1091#1089#1090#1099#1077)
    end
    object SimilaritySpinEdit: TSpinEdit
      Left = 54
      Top = 135
      Width = 43
      Height = 22
      MaxValue = 100
      MinValue = 0
      TabOrder = 3
      Value = 70
      OnKeyDown = FrameKeyDown
      OnKeyPress = KeyPressRouter
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    OnResize = TopPanelResize
    object Navigator: TDBNavigator
      Left = 57
      Top = 0
      Width = 469
      Height = 25
      DataSource = DataSource
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alClient
      Flat = True
      Hints.Strings = (
        #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1087#1077#1088#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
        #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
        #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
        #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1079#1072#1087#1080#1089#1080
        #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
        #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
        #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
        #1047#1072#1087#1086#1084#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        #1054#1073#1085#1086#1074#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100)
      ConfirmDelete = False
      TabOrder = 0
    end
    object ExtraPanel: TPanel
      Left = 0
      Top = 0
      Width = 57
      Height = 25
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      DesignSize = (
        57
        25)
      object FormEditBtn: TSpeedButton
        Left = 0
        Top = 0
        Width = 57
        Height = 25
        Hint = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1092#1086#1088#1084#1091' '#1076#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
        AllowAllUp = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        GroupIndex = 1
        Flat = True
        Glyph.Data = {
          D6000000424DD60000000000000076000000280000000C0000000C0000000100
          0400000000006000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          0000D77777777777000000000000000700000DDDDDDDDD07000000D000000D07
          00000DDDDDDDDD07000000D00D000D0700000DDDDDDDDD07000000D0000DDD07
          00000DDDDDDDDD07000000000000000D0000DDDDDDDDDDDD0000}
      end
    end
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 172
    Top = 56
    object RefreshMenuItem: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1074#1099#1073#1086#1088#1082#1091
      OnClick = RefreshMenuItemClick
    end
    object SelectColumnMenuItem: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1083#1086#1085#1086#1082'...'
      ShortCut = 16468
      OnClick = SelectColumnMenuItemClick
    end
    object ToolMenuItem: TMenuItem
      AutoCheck = True
      Caption = #1055#1072#1085#1077#1083#1100' '#1087#1086#1080#1089#1082#1072
      ShortCut = 16467
      OnClick = ToolMenuItemClick
    end
    object Separator1Item: TMenuItem
      Caption = '-'
    end
    object CopyToClipItem: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16451
      OnClick = CopyToClipItemClick
    end
    object CutToClipItem: TMenuItem
      Caption = #1042#1099#1088#1077#1079#1072#1090#1100
      ShortCut = 16472
      OnClick = CutToClipItemClick
    end
    object PasteFromClipItem: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      ShortCut = 16470
      OnClick = PasteFromClipItemClick
    end
    object Separator2Item: TMenuItem
      Caption = '-'
    end
    object SaveSettingsItem: TMenuItem
      Caption = #1060#1080#1082#1089#1072#1094#1080#1103
      OnClick = SaveSettingsItemClick
    end
  end
  object DataSource: TDataSource
    Left = 176
    Top = 96
  end
end
