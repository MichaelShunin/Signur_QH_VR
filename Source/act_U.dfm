inherited ActsForm: TActsForm
  Left = 563
  Top = 223
  Width = 1398
  Height = 651
  Caption = #1056#1077#1077#1089#1090#1088' '#1072#1082#1090#1086#1074
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited beUnderMenu: TBevel
    Width = 1382
  end
  inherited StatusBar: TStatusBar
    Top = 573
    Width = 1382
  end
  object GroupBox5: TGroupBox [2]
    Left = 1232
    Top = 119
    Width = 150
    Height = 454
    Align = alRight
    Caption = #1040#1082#1090' '#1076#1083#1103' '#1082#1086#1074#1088#1086#1074
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 146
      Height = 126
      Align = alClient
      AutoFitColWidths = True
      DataSource = ds_transfer_carpets
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clBlack
      FooterFont.Height = -10
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghDblClickOptimizeColWidth]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -10
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CR_SIZE'
          Footers = <>
          Title.Caption = #1088#1072#1079#1084#1077#1088
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'CR_QUANTITY'
          Footers = <>
          Title.Caption = #1082#1086#1083'-'#1074#1086
          Width = 44
        end>
    end
    object Panel26: TPanel
      Left = 2
      Top = 141
      Width = 146
      Height = 311
      Align = alBottom
      TabOrder = 1
      object Label6: TLabel
        Left = 1
        Top = 1
        Width = 144
        Height = 13
        Align = alTop
        Caption = #1055#1088#1072#1074#1082#1072' '#1072#1082#1090#1072
      end
      object Label7: TLabel
        Left = 3
        Top = 19
        Width = 34
        Height = 13
        Caption = #1050#1086#1083'-'#1074#1086
      end
      object cr_quantity: TSpinEdit
        Left = 46
        Top = 15
        Width = 39
        Height = 22
        MaxValue = 100
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
      object btnUpdateCarpetInAct: TButton
        Left = 91
        Top = 15
        Width = 48
        Height = 21
        Caption = #1055#1088#1072#1074#1082#1072
        TabOrder = 1
        OnClick = btnUpdateCarpetInActClick
      end
      object btnDeleteCarpet: TButton
        Left = 13
        Top = 39
        Width = 121
        Height = 17
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1086#1074#1077#1088
        TabOrder = 2
        OnClick = btnDeleteCarpetClick
      end
      object btnDeleteAct: TButton
        Left = 13
        Top = 59
        Width = 121
        Height = 16
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1072#1082#1090
        TabOrder = 3
        OnClick = btnDeleteActClick
      end
      object RG_Act_Status: TRadioGroup
        Left = 7
        Top = 76
        Width = 136
        Height = 176
        Caption = #1057#1090#1072#1090#1091#1089' '#1072#1082#1090#1072
        Items.Strings = (
          #1089#1086#1079#1076#1072#1085' '
          #1085#1077' '#1089#1086#1079#1076#1072#1085
          #1087#1086#1076#1087#1080#1089#1072#1085
          #1085#1077' '#1087#1086#1076#1087#1080#1089#1072#1085
          #1085#1072#1087#1077#1095#1072#1090#1072#1085
          #1087#1077#1088#1077#1076#1072#1085' '#1085#1072' '#1087#1086#1076#1087#1080#1089#1100
          #1089#1098#1077#1093#1072#1083
          #1085#1077' '#1086#1092#1086#1088#1084#1083#1077#1085
          #1096#1090#1072#1084#1087
          #1086#1089#1090#1072#1085#1086#1074#1083#1077#1085
          #1088#1077#1082#1083#1072#1084#1072
          #1089#1086#1093#1088'.Excel'
          #1077'-'#1087#1086#1076#1087#1080#1089#1100)
        TabOrder = 4
      end
      object Button8: TButton
        Left = 20
        Top = 254
        Width = 104
        Height = 20
        Caption = #1047#1072#1076#1072#1090#1100' '#1089#1090#1072#1090#1091#1089
        TabOrder = 5
        OnClick = Button8Click
      end
      object btnSetSelectedActStatus: TButton
        Left = 21
        Top = 277
        Width = 104
        Height = 30
        Caption = #1047#1072#1076#1072#1090#1100' '#1089#1090#1072#1090#1091#1089' '#1076#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1072#1082#1090#1086#1074
        TabOrder = 6
        WordWrap = True
        OnClick = btnSetSelectedActStatusClick
      end
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 2
    Width = 1382
    Height = 117
    Align = alTop
    BevelOuter = bvNone
    Caption = '`'
    TabOrder = 2
    DesignSize = (
      1382
      117)
    object Label1: TLabel
      Left = 102
      Top = 2
      Width = 84
      Height = 13
      Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1076#1072#1090'  c '
    end
    object Label2: TLabel
      Left = 174
      Top = 25
      Width = 18
      Height = 13
      Caption = ' '#1076#1086' '
    end
    object DBNavigator1: TDBNavigator
      Left = 308
      Top = 25
      Width = 80
      Height = 18
      DataSource = ds_clientActs
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      TabOrder = 0
    end
    object D1: TDateTimePicker
      Left = 193
      Top = -1
      Width = 103
      Height = 24
      Date = 38022.500923368040000000
      Time = 38022.500923368040000000
      TabOrder = 1
    end
    object D2: TDateTimePicker
      Left = 193
      Top = 22
      Width = 103
      Height = 24
      Date = 38022.500923368040000000
      Time = 38022.500923368040000000
      TabOrder = 2
    end
    object btnShow: TButton
      Left = 308
      Top = 2
      Width = 83
      Height = 21
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      TabOrder = 3
      OnClick = btnShowClick
    end
    object WhatDate_RG: TRadioGroup
      Left = 3
      Top = -2
      Width = 95
      Height = 44
      Caption = #1044#1072#1090#1072
      ItemIndex = 0
      Items.Strings = (
        #1072#1082#1090#1072
        #1087#1086#1076#1075#1086#1090#1086#1074#1082#1080)
      TabOrder = 4
    end
    object btnImportDBF_For_1C: TButton
      Left = 401
      Top = 2
      Width = 126
      Height = 21
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' dbf-'#1092#1072#1081#1083
      TabOrder = 5
      OnClick = btnImportDBF_For_1CClick
    end
    object Button1: TButton
      Left = 1130
      Top = 6
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 6
      OnClick = btnShowClick
    end
    object Sortby: TEdit
      Left = 588
      Top = 56
      Width = 629
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object btnClearSort: TButton
      Left = 1101
      Top = 32
      Width = 108
      Height = 16
      Anchors = [akTop, akRight]
      Caption = #1057#1073#1088#1086#1089' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080
      TabOrder = 8
      OnClick = btnClearSortClick
    end
    object lbOrder: TListBox
      Left = 1221
      Top = 0
      Width = 161
      Height = 117
      Hint = #1044#1083#1103' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1087#1086#1083#1103' '#1074' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1091' '#1082#1083#1080#1082#1085#1080#1090#1077' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102' '#1087#1086#1083#1103
      Align = alRight
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = lbOrderClick
    end
    object Edit1: TEdit
      Left = 688
      Top = 83
      Width = 249
      Height = 21
      TabOrder = 10
      Text = 'Edit1'
      Visible = False
      OnChange = Button2Click
    end
    object Button2: TButton
      Left = 955
      Top = 84
      Width = 75
      Height = 21
      Caption = 'Button2'
      TabOrder = 11
      Visible = False
      OnClick = Button2Click
    end
    object Panel2: TPanel
      Left = 541
      Top = 0
      Width = 206
      Height = 46
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 12
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 206
        Height = 46
        Align = alClient
        AutoSize = True
      end
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 45
      Width = 575
      Height = 71
      Caption = #1044#1086#1087'. '#1092#1080#1083#1100#1090#1088#1099
      TabOrder = 13
      object cbAddFilter: TCheckBox
        Left = 7
        Top = 15
        Width = 208
        Height = 14
        Caption = #1085#1072#1079#1074#1072#1085#1080#1077' '#1082#1083#1080#1077#1085#1090#1072
        TabOrder = 0
      end
      object cbAddFilter_Curator: TCheckBox
        Left = 7
        Top = 32
        Width = 208
        Height = 14
        Caption = #1083#1086#1075#1080#1089#1090'-'#1082#1091#1088#1072#1090#1086#1088' '#1084#1072#1088#1096#1088#1091#1090#1072
        TabOrder = 1
      end
      object cbAddFilter_D_TYPE: TCheckBox
        Left = 7
        Top = 51
        Width = 208
        Height = 11
        Caption = #1090#1080#1087' '#1082#1083#1080#1077#1085#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4194432
        Font.Height = -10
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object ClientD_Name: TEdit
        Left = 120
        Top = 9
        Width = 254
        Height = 21
        TabOrder = 3
      end
      object Curator_Name: TEdit
        Left = 159
        Top = 29
        Width = 215
        Height = 21
        TabOrder = 4
      end
      object D_TYPE: TEdit
        Left = 103
        Top = 49
        Width = 198
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4194432
        Font.Height = -10
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = #1050#1051#1048#1053#1048#1053#1043
      end
      object chkType_KROME: TCheckBox
        Left = 307
        Top = 51
        Width = 61
        Height = 17
        Caption = #1082#1088#1086#1084#1077' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4194432
        Font.Height = -10
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object cbAddFilter_Provider: TCheckBox
        Left = 392
        Top = 10
        Width = 123
        Height = 17
        Caption = #1087#1086#1089#1090#1072#1074#1097#1080#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10485760
        Font.Height = -10
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object cbProvider: TComboBox
        Left = 387
        Top = 29
        Width = 183
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10485760
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 8
        Text = 'cbProvider'
      end
    end
  end
  inline DbGridFrame: TDbGridFrame [4]
    Left = 0
    Top = 119
    Width = 1232
    Height = 454
    Align = alClient
    AutoScroll = False
    TabOrder = 3
    inherited Grid: TDBGridEh
      Left = 160
      Width = 1072
      Height = 454
      AllowedOperations = [alopUpdateEh]
      AllowedSelections = [gstRecordBookmarks, gstAll]
      AutoFitColWidths = False
      ColumnDefValues.AutoDropDown = True
      DataSource = ds_clientActs
      FooterFont.Color = clBlack
      FooterFont.Height = -10
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ReadOnly = False
      SumList.Active = True
      TitleFont.Color = clBlack
      TitleFont.Height = -10
      OnGetCellParams = TDbGridFrame1GridGetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'D_NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1050#1083#1080#1077#1085#1090'|'#1053#1072#1079#1074#1072#1085#1080#1077
          Title.TitleButton = False
          Width = 111
        end
        item
          EditButtons = <>
          FieldName = 'LOW_ADDRESS'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1050#1083#1080#1077#1085#1090'|'#1070#1088'.'#1085#1072#1079#1074#1072#1085#1080#1077
          Title.TitleButton = False
          Width = 112
        end
        item
          EditButtons = <>
          FieldName = 'D_TYPE'
          Footers = <>
          Title.Caption = #1050#1083#1080#1077#1085#1090'|'#1058#1080#1087
          Width = 91
        end
        item
          EditButtons = <>
          FieldName = 'PROVIDER_NAME'
          Footers = <>
          Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          Title.TitleButton = False
          Width = 89
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'COUNT_ACTIVE_AC_ID'
          Footers = <>
          Title.Caption = #1082#1083#1080#1077#1085#1090' '#1072#1082#1090#1080#1074#1077#1085
          Title.Orientation = tohVertical
          Width = 32
        end
        item
          DisplayFormat = 'dd.mm.yy'
          EditButtons = <>
          FieldName = 'MAX_AC_LASTDAY'
          Footers = <>
          Title.Caption = #1076#1072#1090#1072' '#1086#1089#1090#1072#1085#1086#1074#1082#1080' '#1089#1087#1094#1092' '#1082#1083#1080#1077#1085#1090#1072
          Width = 53
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'IS_E_DELIVERY'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          NotInKeyListIndex = 0
          ReadOnly = True
          Title.Caption = 'e-'#1076#1086#1089#1090#1072#1074#1082#1072
          Title.Color = 11075069
          Title.Orientation = tohVertical
          Title.TitleButton = False
          Width = 27
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'NOT_IN_ACT_REPORT'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          NotInKeyListIndex = 0
          ReadOnly = True
          Title.Caption = #1085#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1074' '#1086#1090#1095#1077#1090#1072#1093
          Title.Color = clWhite
          Title.Orientation = tohVertical
          Title.TitleButton = False
          Width = 27
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'ACT_FOR_RENAME'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          NotInKeyListIndex = 0
          ReadOnly = True
          Title.Caption = #1087#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1085
          Title.Color = clAqua
          Title.Orientation = tohVertical
          Title.TitleButton = False
          Width = 24
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'NOT_IN_SCHEDULE'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          NotInKeyListIndex = 0
          ReadOnly = True
          Title.Caption = #1074#1085#1077' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
          Title.Color = 8454016
          Title.Orientation = tohVertical
          Title.TitleButton = False
          Width = 24
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'ACT_TYPE'
          Footer.Value = #1074#1089#1077#1075#1086
          Footer.ValueType = fvtStaticText
          Footers = <>
          ReadOnly = True
          Title.Caption = #1040#1082#1090'|'#1090#1080#1087
          Title.TitleButton = False
          Width = 59
        end
        item
          Alignment = taLeftJustify
          EditButtons = <>
          FieldName = 'ACT_STATUS'
          Footers = <>
          Title.Caption = #1040#1082#1090'| '#1089#1090#1072#1090#1091#1089
          Title.TitleButton = False
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'ACT_NUMBER'
          Footer.FieldName = 'ACT_NUMBER'
          Footer.ValueType = fvtCount
          Footers = <>
          ReadOnly = True
          Title.Caption = #1040#1082#1090'|'#1085#1086#1084#1077#1088
          Title.TitleButton = False
          Width = 41
        end
        item
          DisplayFormat = 'dd.mm.yy'
          EditButtons = <>
          FieldName = 'DAY_ACTION'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1040#1082#1090'|'#1076#1072#1090#1072' ('#1089')'
          Title.TitleButton = False
          Width = 46
        end
        item
          DisplayFormat = 'dd.mm.yy'
          EditButtons = <>
          FieldName = 'D2_SVOD'
          Footers = <>
          Title.Caption = #1040#1082#1090'|'#1076#1072#1090#1072' ('#1087#1086')'
        end
        item
          EditButtons = <>
          FieldName = 'ADDRESS'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1076#1083#1103' '#1072#1076#1088#1077#1089#1072
          Title.TitleButton = False
          Width = 160
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'W_NAME'
          Footers = <>
          Title.Caption = #1052#1072#1088#1096#1088#1091#1090
          Title.TitleButton = False
          Width = 61
        end
        item
          EditButtons = <>
          FieldName = 'CURATOR_NAME'
          Footers = <>
          Title.Caption = #1050#1091#1088#1072#1090#1086#1088' '#1084#1072#1088#1096#1088#1091#1090#1072'|'#1086#1090' '#1083#1086#1075#1080#1089#1090#1086#1074
          Title.TitleButton = False
          Width = 132
        end
        item
          EditButtons = <>
          FieldName = 'W_CRM_CURATOR'
          Footers = <>
          Title.Caption = #1050#1091#1088#1072#1090#1086#1088' '#1084#1072#1088#1096#1088#1091#1090#1072'| '#1086#1090' '#1082#1083#1080#1077#1085#1090#1089#1082#1086#1075#1086' '#1086#1090#1076#1077#1083#1072
          Width = 144
        end
        item
          EditButtons = <>
          FieldName = 'CASHIER_FIO'
          Footers = <>
          Title.Caption = #1050#1072#1089#1089#1080#1088
          Title.TitleButton = False
          Width = 81
        end
        item
          EditButtons = <>
          FieldName = 'ID_1C'
          Footers = <>
          Title.Caption = #1082#1086#1076' '#1089#1095#1077#1090#1072' 1'#1057
        end
        item
          EditButtons = <>
          FieldName = 'USERNAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1083#1077#1085'|'#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          Title.TitleButton = False
          Width = 73
        end
        item
          DisplayFormat = 'dd.mm.yy hh:mm'
          EditButtons = <>
          FieldName = 'CREATE_DATE'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1083#1077#1085'|'#1076#1072#1090#1072
          Title.TitleButton = False
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'INN'
          Footers = <>
          Title.Caption = #1048#1053#1053
          Title.TitleButton = False
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'CRM_CURATORS'
          Footers = <>
          Title.Caption = 'CRM-'#1082#1091#1088#1072#1090#1086#1088
          Width = 100
        end>
      inherited ToolBtn: TSpeedButton
        Width = 16
        Height = 16
      end
    end
    inherited ToolPanel: TPanel
      Width = 160
      Height = 454
      inherited Label1: TLabel
        Left = 10
        Top = 91
      end
      inherited Label2: TLabel
        Left = 3
        Top = 20
        Font.Height = -9
      end
      inherited Label3: TLabel
        Left = 10
        Top = 156
      end
      inherited SimilarityLabel: TLabel
        Left = 10
        Top = 189
      end
      inherited Bevel: TBevel
        Top = 15
        Width = 3
        Height = 439
      end
      inherited Label4: TLabel
        Left = 3
        Top = 75
        Font.Height = -9
      end
      inherited Label5: TLabel
        Left = 10
        Top = 124
      end
      inherited FieldCombo: TDBComboBoxEh
        Left = 10
        Top = 104
        Width = 114
      end
      inherited ValueEdit: TDBEditEh
        Left = 10
        Top = 33
        Width = 91
      end
      inherited SearchCombo: TDBComboBoxEh
        Left = 10
        Top = 169
        Width = 114
      end
      inherited SimilarityTrack: TTrackBar
        Left = 7
        Top = 200
        Width = 121
        Height = 27
      end
      inherited FilterCheck: TCheckBox
        Left = 10
        Top = 55
        Width = 111
        Height = 14
      end
      inherited Panel1: TPanel
        Width = 160
        Height = 15
        Font.Height = -9
        inherited btnSearchClose: TSpeedButton
          Left = 115
          Width = 13
          Height = 13
        end
      end
      inherited SearchDirectionCompo: TDBComboBoxEh
        Left = 10
        Top = 137
        Width = 114
      end
      inherited ValueEdit2: TDBEditEh
        Left = 50
        Top = 33
        Width = 51
      end
    end
    inherited PopupMenu: TPopupMenu
      Left = 216
      object miShowClient: TMenuItem [0]
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1082#1083#1080#1077#1085#1090#1072
        GroupIndex = 200
        OnClick = miShowClientClick
      end
      object mniN2: TMenuItem [1]
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072' '#1074' '#1072#1082#1090#1077
        GroupIndex = 200
        OnClick = mniN2Click
      end
      object miPrintAct: TMenuItem [2]
        Caption = #1053#1072#1087#1077#1095#1072#1090#1072#1090#1100' '#1072#1082#1090
        GroupIndex = 200
        OnClick = miPrintActClick
      end
      object mniPDFACT: TMenuItem [3]
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' pdf  '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1072#1082#1090#1072'  ('#1076'.'#1073'. '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085' UDC-'#1087#1088#1080#1085#1090#1077#1088')'
        GroupIndex = 200
        OnClick = mniPDFACTClick
      end
      object pmReport: TMenuItem [4]
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1099#1073#1086#1088#1082#1077' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072
        GroupIndex = 200
        OnClick = miReportClick
      end
      object N4: TMenuItem [5]
        Caption = '-'
        GroupIndex = 200
      end
      inherited SelectColumnMenuItem: TMenuItem
        GroupIndex = 200
      end
      inherited ToolMenuItem: TMenuItem
        GroupIndex = 200
      end
      inherited Separator1Item: TMenuItem
        GroupIndex = 200
      end
      inherited ExactMenuItem: TMenuItem
        GroupIndex = 200
      end
      inherited PartialMenuItem: TMenuItem
        GroupIndex = 200
      end
      inherited FuzzyMenuItem: TMenuItem
        GroupIndex = 200
      end
      inherited EmptyMenuItem: TMenuItem
        GroupIndex = 200
      end
      inherited NotEmptyMenuItem: TMenuItem
        GroupIndex = 200
      end
      inherited RangeMenuItem: TMenuItem
        GroupIndex = 200
      end
    end
    inherited Image24: TImageList
      Left = 272
      Top = 124
    end
  end
  inherited MainMenu: TMainMenu
    Left = 408
    Top = 292
    inherited miFile: TMenuItem
      object MiScannerAct: TMenuItem [0]
        Caption = #1057#1082#1072#1085#1077#1088' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1072' '#1076#1083#1103' '#1072#1082#1090#1086#1074' '#1079#1072#1074#1086#1079#1072', '#1074#1099#1074#1086#1079#1072', '#1091#1090#1077#1088#1080
        OnClick = MiScannerActClick
      end
      inherited miClose: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
      end
    end
    object N1: TMenuItem
      Caption = '   '#1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102'  '
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '   '#1054#1090#1095#1077#1090#1099'    '
      object N5: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1099#1073#1086#1088#1082#1077' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072
        OnClick = miReportClick
      end
      object N3: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1088#1077#1077#1089#1090#1088#1091' '#1072#1082#1090#1086#1074' '#1074' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1077' '#1087#1086' '#1072#1074#1090#1086#1088#1072#1084' '#1072#1082#1090#1086#1074
        OnClick = N3Click
      end
      object N6: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1088#1077#1077#1089#1090#1088#1091' '#1072#1082#1090#1086#1074' '#1074' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1077' '#1087#1086' '#1082#1091#1088#1072#1090#1086#1088#1072#1084' '#1084#1072#1088#1096#1088#1091#1090#1086#1074
        OnClick = N6Click
      end
      object mniN12: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1089#1090#1072#1090#1091#1089#1072#1084' '#1072#1082#1090#1086#1074
        OnClick = mniN12Click
      end
      object mniSvodStatus: TMenuItem
        Caption = #1057#1074#1086#1076#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1087#1086' '#1089#1090#1072#1090#1091#1089#1072#1084' '#1072#1082#1090#1086#1074
        OnClick = mniSvodStatusClick
      end
      object mniN13: TMenuItem
        Caption = 
          #1057#1074#1086#1076#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1087#1086' '#1089#1090#1072#1090#1091#1089#1072#1084' '#1072#1082#1090#1086#1074' ('#1079#1072#1074#1086#1079#1099', '#1074#1099#1074#1086#1079#1099', '#1087#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103',' +
          ' '#1091#1090#1077#1088#1080'....)'
        OnClick = mniN13Click
      end
    end
    object N8: TMenuItem
      Caption = '   '#1055#1077#1095#1072#1090#1100' '#1080' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1075#1077' '#1072#1082#1090#1086#1074'  '
      object N9: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100' '#1072#1082#1090#1072
        OnClick = miPrintActClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object miPrintSelected: TMenuItem
        Caption = #1052#1072#1089#1089#1086#1074#1072#1103' '#1087#1077#1095#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1082#1090#1086#1074' 1 '#1101#1082#1079
        OnClick = miPrintSelectedClick
      end
      object miPrintSelected_2: TMenuItem
        Caption = #1052#1072#1089#1089#1086#1074#1072#1103' '#1087#1077#1095#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1082#1090#1086#1074' 2 '#1101#1082#1079
        OnClick = miPrintSelectedClick
      end
      object miPrintSelected_3: TMenuItem
        Caption = #1052#1072#1089#1089#1086#1074#1072#1103' '#1087#1077#1095#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1082#1090#1086#1074' 3 '#1101#1082#1079
        OnClick = miPrintSelectedClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object mnipdfallAct: TMenuItem
        Caption = 
          #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' pdf  '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1072#1082#1090#1086#1074'  ('#1076'.'#1073'. '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085' UD' +
          'C-'#1087#1088#1080#1085#1090#1077#1088')'
        OnClick = mnipdfallActClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object miSaveExcelSelected: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' Excel  '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1072#1082#1090#1086#1074
        OnClick = miPrintSelectedClick
      end
    end
    object Rjynhjkm1: TMenuItem
      Caption = '    '#1050#1086#1085#1090#1088#1086#1083#1100'   '
      object N7: TMenuItem
        Caption = #1050#1086#1085#1090#1088#1086#1083#1100'  '#1085#1072#1083#1080#1095#1080#1103' '#1072#1082#1090#1086#1074' '#1076#1083#1103' '#1079#1072#1074#1086#1079#1072'/'#1074#1099#1074#1086#1079#1072
        OnClick = N7Click
      end
      object mniCheckSignedAct: TMenuItem
        Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1085#1072#1083#1080#1095#1080#1103' '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1093' '#1072#1082#1090#1086#1074
        OnClick = mniCheckSignedActClick
      end
    end
  end
  object ds_clientActs: TDataSource
    DataSet = Acts
    OnDataChange = ds_clientActsDataChange
    Left = 489
    Top = 285
  end
  object transfer_carpets: TIBDataSet
    Database = DM.db
    Transaction = DM.tranDefault
    SelectSQL.Strings = (
      
        'select ac.id_act_carpets,  cr.cr_size, ac.quantity as cr_quantit' +
        'y'
      ' from  Carpets CR,  act_carpets AC'
      'where ac.id_acts =:id_acts'
      'and CR.CR_ID=ac.cr_id ')
    Left = 540
    Top = 192
  end
  object ds_transfer_carpets: TDataSource
    AutoEdit = False
    DataSet = transfer_carpets
    Left = 377
    Top = 210
  end
  object xlProPackage1: TxlProPackage
    About = 
      'ProOptionPack'#8482' 1.2 (build 122-D7)   - Copyright '#169' Afalina Co., L' +
      'td.'
    Left = 72
    Top = 140
  end
  object xlReport1: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    DataSources = <>
    Preview = False
    Params = <>
    Left = 268
    Top = 332
  end
  object Acts: TIBQuery
    Database = DM.db
    Transaction = DM.tranDefault
    AfterPost = ActsAfterPost
    OnCalcFields = ActsCalcFields
    SQL.Strings = (
      'select *  from Get_act_Day_action(:DA1,:DA2) where id_acts>0'
      ''
      ''
      'order by '
      'day_action '
      'desc')
    UpdateObject = actstatus_update
    Left = 593
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DA2'
        ParamType = ptUnknown
      end>
    object ActsID_ACTS: TIntegerField
      FieldName = 'ID_ACTS'
      Origin = '"ACTS"."ID_ACTS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ActsACT_TYPE: TSmallintField
      FieldName = 'ACT_TYPE'
      Origin = '"ACTS"."ACT_TYPE"'
      Required = True
      OnGetText = ActsACT_TYPEGetText
    end
    object ActsACT_NUMBER: TIntegerField
      FieldName = 'ACT_NUMBER'
      Origin = '"ACTS"."ACT_NUMBER"'
      Required = True
    end
    object ActsD_ID: TIntegerField
      FieldName = 'D_ID'
      Origin = '"ACTS"."D_ID"'
    end
    object ActsID_ADDRESS: TIntegerField
      FieldName = 'ID_ADDRESS'
      Origin = '"ACTS"."ID_ADDRESS"'
    end
    object ActsDAY_NIGHT: TSmallintField
      FieldName = 'DAY_NIGHT'
      Origin = '"ACTS"."DAY_NIGHT"'
      OnGetText = ActsDAY_NIGHTGetText
    end
    object ActsDAY_ACTION: TDateField
      FieldName = 'DAY_ACTION'
      Origin = '"ACTS"."DAY_ACTION"'
    end
    object ActsW_ID: TIntegerField
      FieldName = 'W_ID'
      Origin = '"ACTS"."W_ID"'
    end
    object ActsUSERNAME: TIBStringField
      FieldName = 'USERNAME'
      Origin = '"ACTS"."USERNAME"'
      Size = 16
    end
    object ActsCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
      Origin = '"ACTS"."CREATE_DATE"'
    end
    object ActsPHONE: TIBStringField
      FieldName = 'PHONE'
      Origin = '"ACTS"."PHONE"'
      Size = 128
    end
    object ActsACT_STATUS: TSmallintField
      FieldName = 'ACT_STATUS'
      Origin = '"ACTS"."ACT_STATUS"'
      OnGetText = ActsACT_STATUSGetText
    end
    object ActsD_NAME: TIBStringField
      FieldName = 'D_NAME'
      Origin = '"CLIENTS"."D_NAME"'
      Size = 128
    end
    object ActsLOW_ADDRESS: TIBStringField
      FieldName = 'LOW_ADDRESS'
      Origin = '"CLIENTS"."LOW_ADDRESS"'
      Size = 128
    end
    object ActsADDRESS: TIBStringField
      FieldName = 'ADDRESS'
      Origin = '"ADDRESSES"."ADDRESS"'
      Required = True
      Size = 256
    end
    object Actsactstatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'actstatus'
      Size = 32
      Calculated = True
    end
    object ActsW_NAME: TIBStringField
      FieldName = 'W_NAME'
      Origin = '"WAYS"."W_NAME"'
      OnGetText = ActsW_NAMEGetText
      Size = 32
    end
    object ActsCASHIER_FIO: TIBStringField
      FieldName = 'CASHIER_FIO'
      Size = 48
    end
    object ActsPROVIDER_NAME: TIBStringField
      FieldName = 'PROVIDER_NAME'
      Size = 32
    end
    object ActsACT_FOR_RENAME: TSmallintField
      FieldName = 'ACT_FOR_RENAME'
      Origin = '"ACTS"."ACT_FOR_RENAME"'
    end
    object ActsCURATOR_NAME: TIBStringField
      FieldName = 'CURATOR_NAME'
      Origin = '"WAYS"."CURATOR_NAME"'
      Size = 32
    end
    object ActsID_PROVIDER: TIntegerField
      FieldName = 'ID_PROVIDER'
      Origin = '"ACTS"."ID_PROVIDER"'
    end
    object ActsD_TYPE: TIBStringField
      FieldName = 'D_TYPE'
      Origin = '"GET_ACT_DAY_ACTION"."D_TYPE"'
      Size = 32
    end
    object ActsCOUNT_ACTIVE_AC_ID: TIntegerField
      FieldName = 'COUNT_ACTIVE_AC_ID'
      Origin = '"GET_ACT_DAY_ACTION"."COUNT_ACTIVE_AC_ID"'
      OnGetText = ActsCOUNT_ACTIVE_AC_IDGetText
    end
    object ActsINN: TIBStringField
      FieldName = 'INN'
      Origin = '"GET_ACT_DAY_ACTION"."INN"'
      Size = 127
    end
    object ActsIS_E_DELIVERY: TSmallintField
      FieldName = 'IS_E_DELIVERY'
      Origin = '"GET_ACT_DAY_ACTION"."IS_E_DELIVERY"'
    end
    object ActsCRM_CURATORS: TIBStringField
      FieldName = 'CRM_CURATORS'
      Origin = '"GET_ACT_DAY_ACTION"."CRM_CURATORS"'
      Size = 256
    end
    object ActsW_CRM_CURATOR: TIBStringField
      FieldName = 'W_CRM_CURATOR'
      Origin = '"GET_ACT_DAY_ACTION"."W_CRM_CURATOR"'
      Size = 32
    end
    object ActsMAX_AC_LASTDAY: TDateField
      FieldName = 'MAX_AC_LASTDAY'
      Origin = '"GET_ACT_DAY_ACTION"."MAX_AC_LASTDAY"'
    end
    object ActsNOT_IN_ACT_REPORT: TSmallintField
      FieldName = 'NOT_IN_ACT_REPORT'
      Origin = '"GET_ACT_DAY_ACTION"."NOT_IN_ACT_REPORT"'
    end
    object ActsNOT_IN_SCHEDULE: TSmallintField
      FieldName = 'NOT_IN_SCHEDULE'
      Origin = '"GET_ACT_DAY_ACTION"."NOT_IN_SCHEDULE"'
    end
    object ActsID_1C: TIntegerField
      FieldName = 'ID_1C'
      Origin = '"GET_ACT_DAY_ACTION"."ID_1C"'
    end
    object ActsD1_SVOD: TDateField
      FieldName = 'D1_SVOD'
      Origin = '"GET_ACT_DAY_ACTION"."D1_SVOD"'
    end
    object ActsD2_SVOD: TDateField
      FieldName = 'D2_SVOD'
      Origin = '"GET_ACT_DAY_ACTION"."D2_SVOD"'
    end
  end
  object actstatus_update: TIBUpdateSQL
    ModifySQL.Strings = (
      
        'update acts set act_status = :act_status  where id_acts = :id_ac' +
        'ts')
    DeleteSQL.Strings = (
      'delete from acts where ID_acts = :id_acts')
    Left = 788
    Top = 344
  end
  object Get_Acts_For_1C: TIBQuery
    Database = DM.db
    Transaction = DM.tranDefault
    AfterPost = ActsAfterPost
    OnCalcFields = ActsCalcFields
    SQL.Strings = (
      'select * from get_acts_for_1C(:d1, :d2)')
    Left = 665
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'd1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'd2'
        ParamType = ptUnknown
      end>
  end
  object SD: TSaveDialog
    DefaultExt = 'dbf'
    Filter = '*.dbf'
    InitialDir = 'c:\'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = #1059#1082#1072#1078#1080#1090#1077' '#1080#1084#1103' '#1076#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1092#1072#1081#1083#1072' '#1074#1099#1075#1088#1091#1079#1082#1080
    Left = 560
    Top = 152
  end
  object IBQuery1: TIBQuery
    Database = DM.db
    Transaction = DM.tranDefault
    AfterPost = ActsAfterPost
    OnCalcFields = ActsCalcFields
    SQL.Strings = (
      'select ac.*, a.*, c.*,'
      '(select min(cashier_fio) from app_carpets apc,  act_carpets acc'
      ' where'
      '   acc.id_acts = ac.id_acts and'
      '   apc.ac_id = acc.ac_id) as cashier_fio,'
      'W.w_name,  W.curator_name,'
      ''
      '(select min(P.name) from  Providers P   where'
      '   p.id = ac.id_provider) as Provider_name'
      '  from acts ac JOIN clients C  ON C.d_id = AC.d_id'
      '   JOIN ADDRESSES A  ON A.id_addresse = AC.id_address'
      '   left JOIN WAYS W ON W.W_ID = AC.w_id'
      '  where ac.day_actiOn between :DA1 and :DA2'
      ''
      ''
      'order by '
      'ac.day_action '
      'desc')
    Left = 985
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DA2'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'ID_ACTS'
      Origin = '"ACTS"."ID_ACTS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'ACT_TYPE'
      Origin = '"ACTS"."ACT_TYPE"'
      Required = True
      OnGetText = ActsACT_TYPEGetText
    end
    object IntegerField2: TIntegerField
      FieldName = 'ACT_NUMBER'
      Origin = '"ACTS"."ACT_NUMBER"'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'D_ID'
      Origin = '"ACTS"."D_ID"'
    end
    object IntegerField4: TIntegerField
      FieldName = 'ID_ADDRESS'
      Origin = '"ACTS"."ID_ADDRESS"'
    end
    object SmallintField2: TSmallintField
      FieldName = 'DAY_NIGHT'
      Origin = '"ACTS"."DAY_NIGHT"'
      OnGetText = ActsDAY_NIGHTGetText
    end
    object DateField1: TDateField
      FieldName = 'DAY_ACTION'
      Origin = '"ACTS"."DAY_ACTION"'
    end
    object IntegerField5: TIntegerField
      FieldName = 'W_ID'
      Origin = '"ACTS"."W_ID"'
    end
    object IBStringField1: TIBStringField
      FieldName = 'USERNAME'
      Origin = '"ACTS"."USERNAME"'
      Size = 16
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'CREATE_DATE'
      Origin = '"ACTS"."CREATE_DATE"'
    end
    object IBStringField2: TIBStringField
      FieldName = 'PHONE'
      Origin = '"ACTS"."PHONE"'
      Size = 128
    end
    object SmallintField3: TSmallintField
      FieldName = 'ACT_STATUS'
      Origin = '"ACTS"."ACT_STATUS"'
      OnGetText = ActsACT_STATUSGetText
    end
    object IBStringField3: TIBStringField
      FieldName = 'D_NAME'
      Origin = '"CLIENTS"."D_NAME"'
      Size = 128
    end
    object IBStringField4: TIBStringField
      FieldName = 'LOW_ADDRESS'
      Origin = '"CLIENTS"."LOW_ADDRESS"'
      Size = 128
    end
    object IBStringField5: TIBStringField
      FieldName = 'ADDRESS'
      Origin = '"ADDRESSES"."ADDRESS"'
      Required = True
      Size = 256
    end
    object StringField1: TStringField
      FieldKind = fkCalculated
      FieldName = 'actstatus'
      Size = 32
      Calculated = True
    end
    object IBStringField6: TIBStringField
      FieldName = 'W_NAME'
      Origin = '"WAYS"."W_NAME"'
      OnGetText = ActsW_NAMEGetText
      Size = 32
    end
    object IBStringField7: TIBStringField
      FieldName = 'CASHIER_FIO'
      Size = 48
    end
    object IBStringField8: TIBStringField
      FieldName = 'PROVIDER_NAME'
      Size = 32
    end
    object SmallintField4: TSmallintField
      FieldName = 'ACT_FOR_RENAME'
      Origin = '"ACTS"."ACT_FOR_RENAME"'
    end
    object IBStringField9: TIBStringField
      FieldName = 'CURATOR_NAME'
      Origin = '"WAYS"."CURATOR_NAME"'
      Size = 32
    end
    object IntegerField6: TIntegerField
      FieldName = 'ID_PROVIDER'
      Origin = '"ACTS"."ID_PROVIDER"'
    end
  end
  object qs: TIBQuery
    Database = DM.db
    Transaction = DM.tranDefault
    Left = 568
    Top = 424
  end
end
