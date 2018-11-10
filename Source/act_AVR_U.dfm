inherited ActAVRForm: TActAVRForm
  Left = 20
  Top = 82
  Width = 1210
  Height = 715
  Caption = #1056#1077#1077#1089#1090#1088' '#1072#1082#1090#1086#1074' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited beUnderMenu: TBevel
    Top = 153
    Width = 1194
  end
  object Splitter1: TSplitter [1]
    Left = 0
    Top = 148
    Width = 1194
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Color = 4259584
    ParentColor = False
  end
  inherited StatusBar: TStatusBar
    Top = 637
    Width = 1194
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 0
    Width = 1194
    Height = 148
    Align = alTop
    BevelOuter = bvNone
    Caption = '`'
    TabOrder = 1
    DesignSize = (
      1194
      148)
    object Label1: TLabel
      Left = 12
      Top = 2
      Width = 112
      Height = 13
      Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1076#1072#1090' '#1089#1095#1077#1090#1072' c '
    end
    object Label2: TLabel
      Left = 234
      Top = 5
      Width = 18
      Height = 13
      Caption = ' '#1076#1086' '
    end
    object DBNavigator1: TDBNavigator
      Left = 498
      Top = 4
      Width = 140
      Height = 18
      DataSource = ds_AVRLIST
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      TabOrder = 0
    end
    object D1: TDateTimePicker
      Left = 128
      Top = -1
      Width = 103
      Height = 24
      Date = 38022.500923368040000000
      Time = 38022.500923368040000000
      TabOrder = 1
    end
    object D2: TDateTimePicker
      Left = 253
      Top = 2
      Width = 103
      Height = 24
      Date = 38022.500923368040000000
      Time = 38022.500923368040000000
      TabOrder = 2
    end
    object btnShow: TButton
      Left = 371
      Top = 2
      Width = 83
      Height = 21
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      TabOrder = 3
      OnClick = btnShowClick
    end
    object Edit1: TEdit
      Left = 642
      Top = 3
      Width = 249
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = 'Edit1'
      Visible = False
      OnChange = Button2Click
    end
    object Button2: TButton
      Left = 901
      Top = 4
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Button2'
      TabOrder = 5
      Visible = False
      OnClick = Button2Click
    end
    object Panel2: TPanel
      Left = 985
      Top = 0
      Width = 206
      Height = 46
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 6
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 206
        Height = 46
        Align = alClient
        AutoSize = True
      end
    end
    object clbID_1c: TCheckListBox
      Left = 168
      Top = 33
      Width = 1020
      Height = 111
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = 4
      ItemHeight = 13
      PopupMenu = PopupMenuCLB
      TabOrder = 7
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 23
      Width = 160
      Height = 121
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1072#1082#1090#1099' '#1089#1086' '#1089#1090#1072#1090#1091#1089#1086#1084
      TabOrder = 8
      object clbStatus_Filter: TCheckListBox
        Left = 2
        Top = 15
        Width = 156
        Height = 104
        Align = alClient
        ItemHeight = 13
        Items.Strings = (
          #1089#1086#1079#1076#1072#1085
          #1087#1077#1088#1077#1076#1072#1085' '#1085#1072' '#1087#1086#1076#1087#1080#1089#1100
          #1087#1086#1076#1087#1080#1089#1072#1085
          #1085#1072#1087#1077#1095#1072#1090#1072#1085
          #1089#1086#1093#1088#1072#1085#1077#1085' '#1074' '#1092#1072#1081#1083
          #1087#1086#1076#1075#1086#1090#1086#1074#1083#1077#1085' '#1082' '#1087#1077#1095#1072#1090#1080)
        TabOrder = 0
      end
    end
  end
  inline DbGridEH_AVR: TDbGridFrame [4]
    Left = 0
    Top = 155
    Width = 966
    Height = 482
    Align = alClient
    AutoScroll = False
    TabOrder = 2
    inherited Grid: TDBGridEh
      Left = 160
      Width = 806
      Height = 482
      AllowedOperations = [alopUpdateEh]
      AllowedSelections = [gstRecordBookmarks, gstAll]
      AutoFitColWidths = False
      ColumnDefValues.AutoDropDown = True
      DataSource = ds_AVRLIST
      FooterFont.Color = clBlack
      FooterFont.Height = -10
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ReadOnly = False
      TitleFont.Color = clBlack
      TitleFont.Height = -10
      OnGetCellParams = DbGridEH_AVRGridGetCellParams
      Columns = <
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'ID_AVR_TYPE'
          Footers = <>
          KeyList.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7')
          PickList.Strings = (
            '-'#1085#1077#1090' '#1072#1082#1090#1072'-'
            '1(2010)'
            '2(2011)'
            #1057#1041'(2013)'
            'X5'
            'X5(2)'
            #1051#1091#1082#1086#1081#1083
            #1043#1072#1079#1087#1088#1086#1084#1085#1077#1092#1090#1100)
          ReadOnly = True
          Title.Caption = #1058#1080#1087' '#1072#1082#1090#1072
          Width = 83
        end
        item
          EditButtons = <>
          FieldName = 'LOW_ADDRESS'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1057#1095#1077#1090'|'#1102#1088'.'#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 121
        end
        item
          DisplayFormat = 'dd.mm.yy'
          EditButtons = <>
          FieldName = 'BILL_START'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1057#1095#1077#1090'| '#1089
          Width = 82
        end
        item
          DisplayFormat = 'dd.mm.yy'
          EditButtons = <>
          FieldName = 'BILL_FINISH'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1057#1095#1077#1090'| '#1087#1086
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'ID_1C'
          Footers = <>
          Title.Caption = #1057#1095#1077#1090'|'#1082#1086#1076' 1C'
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'ADDRESS'
          Footer.Value = #1074#1089#1077#1075#1086' '#1087#1086' '#1072#1076#1088#1077#1089#1072#1084
          Footer.ValueType = fvtStaticText
          Footers = <>
          ReadOnly = True
          Title.Caption = #1072#1076#1088#1077#1089' '
          Width = 129
        end
        item
          EditButtons = <>
          FieldName = 'BOARD'
          Footer.FieldName = 'ID_ACCOUNT'
          Footer.ValueType = fvtCount
          Footers = <>
          ReadOnly = True
          Title.Caption = #1074#1099#1074#1077#1089#1082#1072
          Width = 106
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'NUMBER_OTDELENIE'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1085#1086#1084#1077#1088' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
          Width = 51
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'ACT_STATUS'
          Footers = <>
          KeyList.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5')
          NotInKeyListIndex = 0
          PickList.Strings = (
            #1089#1086#1079#1076#1072#1085
            #1087#1077#1088#1077#1076#1072#1085' '#1085#1072' '#1087#1086#1076#1087#1080#1089#1100
            #1087#1086#1076#1087#1080#1089#1072#1085
            #1085#1072#1087#1077#1095#1072#1090#1072#1085
            #1089#1086#1093#1088#1072#1085#1077#1085' '#1074' '#1092#1072#1081#1083
            #1087#1086#1076#1075#1086#1090#1086#1074#1083#1077#1085' '#1082' '#1087#1077#1095#1072#1090#1080)
          ReadOnly = True
          Title.Caption = #1089#1090#1072#1090#1091#1089
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'W_NAME'
          Footers = <>
          Title.Caption = #1087#1077#1095#1072#1090#1100' '#1076#1083#1103' '#1084#1072#1088#1096#1088#1091#1090#1072
          Width = 105
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'MONEY_PAYMENT'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1057#1091#1084#1084#1072' '#1074' '#1072#1082#1090#1077', '#1088#1091#1073'|'#1082' '#1086#1087#1083#1072#1090#1077
          Width = 44
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'MONEY_WORK'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1057#1091#1084#1084#1072' '#1074' '#1072#1082#1090#1077', '#1088#1091#1073'|.'#1079#1072' '#1088#1072#1073#1086#1090#1099
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'PROVIDER_NAME'
          Footers = <>
          Title.Caption = #1087#1086#1089#1090#1072#1074#1097#1080#1082
          Width = 86
        end>
      inherited ToolBtn: TSpeedButton
        Width = 16
        Height = 16
      end
    end
    inherited ToolPanel: TPanel
      Width = 160
      Height = 482
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
        Height = 467
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
      object pmReport: TMenuItem [0]
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1095#1077#1090
        GroupIndex = 200
        OnClick = pmReportClick
      end
      object N4: TMenuItem [1]
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
      Left = 200
      Top = 116
    end
  end
  object grpAVR: TGroupBox
    Left = 966
    Top = 155
    Width = 228
    Height = 482
    Align = alRight
    TabOrder = 3
    DesignSize = (
      228
      482)
    object IWLabel: TLabel
      Left = 166
      Top = 470
      Width = 40
      Height = 13
      Caption = 'IWLabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblactprepare_status: TLabel
      Left = 2
      Top = 244
      Width = 3
      Height = 13
      Anchors = [akTop]
      Caption = '.'
      Color = 8454143
      ParentColor = False
      WordWrap = True
    end
    object Label37: TLabel
      Left = 139
      Top = 6
      Width = 65
      Height = 13
      Caption = #1069#1082#1079#1077#1084#1087#1083#1103#1088#1099
    end
    object Bevel1: TBevel
      Left = 14
      Top = 190
      Width = 196
      Height = 3
      Style = bsRaised
    end
    object btnPrintAVR: TButton
      Left = 15
      Top = 11
      Width = 105
      Height = 32
      Caption = #1055#1077#1095#1072#1090#1100' '#1040#1082#1090#1072' '#1074#1099#1087'. '#1088#1072#1073#1086#1090
      TabOrder = 0
      WordWrap = True
      OnClick = btnPrintAVRClick
    end
    object cbAVR_SElected: TCheckBox
      Left = 16
      Top = 48
      Width = 137
      Height = 17
      Caption = #1087#1077#1095#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093
      TabOrder = 1
    end
    object IWComboBox1: TComboBox
      Left = 13
      Top = 466
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 3
      TabOrder = 2
      Text = #1056#1091#1073#1083#1100' - '#1087#1086'-'#1088#1091#1089#1089#1082#1080' :)'
      Visible = False
      Items.Strings = (
        #1043#1088#1080#1074#1085#1103' - '#1087#1086'-'#1091#1082#1088#1072#1080#1085#1089#1082#1080
        #1043#1088#1085' - '#1087#1086'-'#1091#1082#1088#1072#1080#1085#1089#1082#1080
        #1043#1088#1080#1074#1085#1103' - '#1087#1086'-'#1088#1091#1089#1089#1082#1080
        #1056#1091#1073#1083#1100' - '#1087#1086'-'#1088#1091#1089#1089#1082#1080' :)'
        #1056' - '#1087#1086'-'#1088#1091#1089#1089#1082#1080
        #1045#1074#1088#1086' - '#1087#1086'-'#1091#1082#1088#1072#1080#1085#1089#1082#1080)
    end
    object pnImage: TPanel
      Left = 0
      Top = 359
      Width = 217
      Height = 130
      TabOrder = 3
      object Image_act: TImage
        Left = 1
        Top = 18
        Width = 216
        Height = 71
      end
      object edit_a_Bar: TEdit
        Left = 7
        Top = 100
        Width = 165
        Height = 21
        TabOrder = 0
        Visible = False
        OnChange = edit_a_BarChange
      end
    end
    object nCopy: TSpinEdit
      Left = 160
      Top = 23
      Width = 44
      Height = 22
      MaxValue = 2
      MinValue = 1
      TabOrder = 4
      Value = 1
    end
    object rgActStatus: TRadioGroup
      Left = 8
      Top = 199
      Width = 185
      Height = 105
      Caption = #1047#1072#1076#1072#1090#1100' '#1089#1090#1072#1090#1091#1089' '#1072#1082#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        #1089#1086#1079#1076#1072#1085
        #1087#1077#1088#1077#1076#1072#1085' '#1085#1072' '#1087#1086#1076#1087#1080#1089#1100
        #1087#1086#1076#1087#1080#1089#1072#1085
        #1085#1072#1087#1077#1095#1072#1090#1072#1085
        #1089#1086#1093#1088#1072#1085#1077#1085' '#1074' '#1092#1072#1081#1083
        #1087#1086#1076#1075#1086#1090#1086#1074#1083#1077#1085' '#1082' '#1087#1077#1095#1072#1090#1080)
      ParentFont = False
      TabOrder = 5
    end
    object cbAvrSelect_status: TCheckBox
      Left = 8
      Top = 304
      Width = 209
      Height = 17
      Caption = #1089#1090#1072#1090#1091#1089' '#1076#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object Button1: TButton
      Left = 16
      Top = 328
      Width = 177
      Height = 25
      Caption = #1047#1072#1076#1072#1090#1100' '#1089#1090#1072#1090#1091#1089'  '#1072#1082#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = Button1Click
    end
    object grpAVR1: TGroupBox
      Left = 8
      Top = 66
      Width = 209
      Height = 113
      Caption = #1055#1077#1095#1072#1090#1100' '#1072#1082#1090#1086#1074' '#1089#1086' '#1089#1090#1072#1090#1091#1089#1086#1084
      TabOrder = 8
      object chklstLAVRActStatus: TCheckListBox
        Left = 2
        Top = 15
        Width = 205
        Height = 96
        Align = alClient
        ItemHeight = 13
        Items.Strings = (
          #1089#1086#1079#1076#1072#1085
          #1087#1077#1088#1077#1076#1072#1085' '#1085#1072' '#1087#1086#1076#1087#1080#1089#1100
          #1087#1086#1076#1087#1080#1089#1072#1085
          #1085#1072#1087#1077#1095#1072#1090#1072#1085
          #1089#1086#1093#1088#1072#1085#1077#1085' '#1074' '#1092#1072#1081#1083
          #1087#1086#1076#1075#1086#1090#1086#1074#1083#1077#1085' '#1082' '#1087#1077#1095#1072#1090#1080)
        TabOrder = 0
      end
    end
  end
  inherited MainMenu: TMainMenu
    Left = 408
    Top = 292
    inherited miFile: TMenuItem
      object MiScannerAct: TMenuItem [0]
        Caption = #1057#1082#1072#1085#1077#1088' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1072' '#1076#1083#1103' '#1072#1082#1090#1086#1074' '#1079#1072#1074#1086#1079#1072', '#1074#1099#1074#1086#1079#1072', '#1091#1090#1077#1088#1080
      end
      inherited miClose: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
      end
    end
    object N1: TMenuItem
      Caption = '   '#1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102'  '
      OnClick = N1Click
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
  object ds_AVRLIST: TDataSource
    DataSet = qAVRLIst
    Left = 761
    Top = 309
  end
  object xlProPackage1: TxlProPackage
    About = 
      'ProOptionPack'#8482' 1.2 (build 122-D7)   - Copyright '#169' Afalina Co., L' +
      'td.'
    Left = 200
    Top = 332
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
  object qAVRLIst: TIBQuery
    Database = DM.db
    Transaction = DM.tranDefault
    AfterPost = qAVRLIstAfterPost
    SQL.Strings = (
      'select  ID_avr_Type,  IS_AUTO,'
      '    ID_1C,'
      '    USERNAME,'
      '    USERACTION,'
      '    ID_ACCOUNT,'
      '    ID_ACCOUNT_ACT_DESCR,'
      '    ID_ACCOUNT_ACT,'
      '    AC_BILL,'
      '    VALUTA,'
      '    MONEY_CONTRACT,'
      '    PLAN_FACT,'
      '    BILL_START,'
      '    BILL_FINISH,'
      '    BILL_NUMBER,'
      '    CASH_CHECK,'
      '    CR_QUANTITY_CONTRACT,'
      '    ACCOUNT_FORM,'
      '    BILL_INTERVAL,'
      '    BILL_STATUS,'
      '    PROVIDER_NAME,'
      '    ID_PROVIDER,'
      '    LOW_ADDRESS,'
      '    CASHIER_FIO,'
      '    BILL_MONEY,'
      '    BILL_STATUS_DATE,'
      '    BILL_NUMBER_1C,'
      '    ADDRESS,'
      '    ID_ADDRESS,'
      '    BOARD,'
      '    MONEY_WORK,'
      '    MONEY_PENALTY,'
      '    MONEY_PAYMENT,'
      '    W_ID,'
      '    W_NAME,'
      '    DAY_ACTION,'
      '    DAY_NIGHT,'
      '    ACT_STATUS,'
      '    N_ZAMEN_IN_ACT,'
      '    NUMBER_OTDELENIE,'
      '    PAY_ATTENTION,'
      '    DRIVER_FIO'
      '     from ACCOUNT_AVR_ID1C_LIST (:ID1cList, :d1, :d2)'
      'where :act_status_S containing '#39','#39'||act_status||'#39','#39
      'order by'
      'low_address, ID_1c,  bill_start, address')
    UpdateObject = qAVRLIST_update
    Left = 409
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID1cList'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'd1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'd2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'act_status_S'
        ParamType = ptUnknown
      end>
    object qAVRLIstIS_AUTO: TSmallintField
      FieldName = 'IS_AUTO'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."IS_AUTO"'
    end
    object qAVRLIstID_1C: TIntegerField
      FieldName = 'ID_1C'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."ID_1C"'
    end
    object qAVRLIstUSERNAME: TIBStringField
      FieldName = 'USERNAME'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."USERNAME"'
      Size = 32
    end
    object qAVRLIstUSERACTION: TDateTimeField
      FieldName = 'USERACTION'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."USERACTION"'
    end
    object qAVRLIstID_ACCOUNT: TIntegerField
      FieldName = 'ID_ACCOUNT'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."ID_ACCOUNT"'
    end
    object qAVRLIstID_ACCOUNT_ACT_DESCR: TIntegerField
      FieldName = 'ID_ACCOUNT_ACT_DESCR'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."ID_ACCOUNT_ACT_DESCR"'
    end
    object qAVRLIstID_ACCOUNT_ACT: TIntegerField
      FieldName = 'ID_ACCOUNT_ACT'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."ID_ACCOUNT_ACT"'
    end
    object qAVRLIstAC_BILL: TIBStringField
      FieldName = 'AC_BILL'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."AC_BILL"'
      Size = 16
    end
    object qAVRLIstVALUTA: TIBStringField
      FieldName = 'VALUTA'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."VALUTA"'
      Size = 3
    end
    object qAVRLIstMONEY_CONTRACT: TFloatField
      FieldName = 'MONEY_CONTRACT'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."MONEY_CONTRACT"'
    end
    object qAVRLIstPLAN_FACT: TSmallintField
      FieldName = 'PLAN_FACT'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."PLAN_FACT"'
    end
    object qAVRLIstBILL_START: TDateField
      FieldName = 'BILL_START'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."BILL_START"'
    end
    object qAVRLIstBILL_FINISH: TDateField
      FieldName = 'BILL_FINISH'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."BILL_FINISH"'
    end
    object qAVRLIstBILL_NUMBER: TIntegerField
      FieldName = 'BILL_NUMBER'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."BILL_NUMBER"'
    end
    object qAVRLIstCASH_CHECK: TIBStringField
      FieldName = 'CASH_CHECK'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."CASH_CHECK"'
      Size = 16
    end
    object qAVRLIstCR_QUANTITY_CONTRACT: TIntegerField
      FieldName = 'CR_QUANTITY_CONTRACT'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."CR_QUANTITY_CONTRACT"'
    end
    object qAVRLIstACCOUNT_FORM: TIBStringField
      FieldName = 'ACCOUNT_FORM'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."ACCOUNT_FORM"'
      Size = 16
    end
    object qAVRLIstBILL_INTERVAL: TSmallintField
      FieldName = 'BILL_INTERVAL'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."BILL_INTERVAL"'
    end
    object qAVRLIstBILL_STATUS: TIBStringField
      FieldName = 'BILL_STATUS'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."BILL_STATUS"'
      Size = 16
    end
    object qAVRLIstPROVIDER_NAME: TIBStringField
      FieldName = 'PROVIDER_NAME'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."PROVIDER_NAME"'
      Size = 32
    end
    object qAVRLIstID_PROVIDER: TIntegerField
      FieldName = 'ID_PROVIDER'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."ID_PROVIDER"'
    end
    object qAVRLIstLOW_ADDRESS: TIBStringField
      FieldName = 'LOW_ADDRESS'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."LOW_ADDRESS"'
      Size = 128
    end
    object qAVRLIstCASHIER_FIO: TIBStringField
      FieldName = 'CASHIER_FIO'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."CASHIER_FIO"'
      Size = 48
    end
    object qAVRLIstBILL_MONEY: TFloatField
      FieldName = 'BILL_MONEY'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."BILL_MONEY"'
    end
    object qAVRLIstBILL_STATUS_DATE: TDateTimeField
      FieldName = 'BILL_STATUS_DATE'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."BILL_STATUS_DATE"'
    end
    object qAVRLIstBILL_NUMBER_1C: TIntegerField
      FieldName = 'BILL_NUMBER_1C'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."BILL_NUMBER_1C"'
    end
    object qAVRLIstADDRESS: TIBStringField
      FieldName = 'ADDRESS'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."ADDRESS"'
      Size = 256
    end
    object qAVRLIstID_ADDRESS: TIntegerField
      FieldName = 'ID_ADDRESS'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."ID_ADDRESS"'
    end
    object qAVRLIstBOARD: TIBStringField
      FieldName = 'BOARD'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."BOARD"'
      Size = 128
    end
    object qAVRLIstMONEY_WORK: TFloatField
      FieldName = 'MONEY_WORK'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."MONEY_WORK"'
    end
    object qAVRLIstMONEY_PENALTY: TFloatField
      FieldName = 'MONEY_PENALTY'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."MONEY_PENALTY"'
    end
    object qAVRLIstMONEY_PAYMENT: TFloatField
      FieldName = 'MONEY_PAYMENT'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."MONEY_PAYMENT"'
    end
    object qAVRLIstW_ID: TIntegerField
      FieldName = 'W_ID'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."W_ID"'
    end
    object qAVRLIstW_NAME: TIBStringField
      FieldName = 'W_NAME'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."W_NAME"'
      OnGetText = qAVRLIstW_NAMEGetText
      Size = 48
    end
    object qAVRLIstDAY_ACTION: TDateField
      FieldName = 'DAY_ACTION'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."DAY_ACTION"'
    end
    object qAVRLIstDAY_NIGHT: TIntegerField
      FieldName = 'DAY_NIGHT'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."DAY_NIGHT"'
      OnGetText = qAVRLIstDAY_NIGHTGetText
    end
    object qAVRLIstACT_STATUS: TIntegerField
      FieldName = 'ACT_STATUS'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."ACT_STATUS"'
    end
    object qAVRLIstN_ZAMEN_IN_ACT: TIntegerField
      FieldName = 'N_ZAMEN_IN_ACT'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."N_ZAMEN_IN_ACT"'
    end
    object qAVRLIstNUMBER_OTDELENIE: TIBStringField
      FieldName = 'NUMBER_OTDELENIE'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."NUMBER_OTDELENIE"'
      Size = 32
    end
    object qAVRLIstPAY_ATTENTION: TIntegerField
      FieldName = 'PAY_ATTENTION'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."PAY_ATTENTION"'
    end
    object qAVRLIstDRIVER_FIO: TIBStringField
      FieldName = 'DRIVER_FIO'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."DRIVER_FIO"'
      Size = 64
    end
    object qAVRLIstID_AVR_TYPE: TIntegerField
      FieldName = 'ID_AVR_TYPE'
      Origin = '"ACCOUNT_AVR_ID1C_LIST"."ID_AVR_TYPE"'
    end
  end
  object qAVRLIST_update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select act_status from account_acts'
      'where id = :id_account_act')
    ModifySQL.Strings = (
      
        'update account_acts  set act_status = :act_status  where id = :i' +
        'd_account_act')
    DeleteSQL.Strings = (
      'delete from acts where ID_acts = :id_acts')
    Left = 772
    Top = 64
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
  object PopupMenuCLB: TPopupMenu
    Left = 384
    Top = 56
    object N2: TMenuItem
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100'  '#1074#1089#1077
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1057#1085#1103#1090#1100' '#1087#1086#1084#1077#1090#1082#1080' '#1091' '#1074#1089#1077#1093
      OnClick = N3Click
    end
  end
  object q_AVR_CONTENT: TIBQuery
    Database = DM.db
    Transaction = DM.tranDefault
    AfterPost = q_AVR_CONTENTAfterPost
    SQL.Strings = (
      
        'select ID, act_content, act_content_2,act_content_2013, act_cont' +
        'ent_X5'
      'from account_acts'
      'where'
      'id = :ID')
    UpdateObject = AVR_update
    Left = 880
    Top = 471
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object q_AVR_CONTENTID: TIntegerField
      FieldName = 'ID'
      Origin = '"ACCOUNT_ACTS"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_AVR_CONTENTACT_CONTENT: TMemoField
      FieldName = 'ACT_CONTENT'
      Origin = '"ACCOUNT_ACTS"."ACT_CONTENT"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object q_AVR_CONTENTACT_CONTENT_2: TMemoField
      FieldName = 'ACT_CONTENT_2'
      Origin = '"ACCOUNT_ACTS"."ACT_CONTENT_2"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object q_AVR_CONTENTACT_CONTENT_2013: TMemoField
      FieldName = 'ACT_CONTENT_2013'
      Origin = '"ACCOUNT_ACTS"."ACT_CONTENT_2013"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object q_AVR_CONTENTACT_CONTENT_X5: TMemoField
      FieldName = 'ACT_CONTENT_X5'
      Origin = '"ACCOUNT_ACTS"."ACT_CONTENT_X5"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object AVR_update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select  *'
      
        ' from avr_on_date_status345_id(:ID_IN, :d_ACCOUNT, :d_SCH, :w_id' +
        ', :DN) ')
    ModifySQL.Strings = (
      'update  account_acts set '
      ' act_status = :act_status,'
      ' w_id = :w_id_print,'
      ' day_action = :day_action_print,'
      ' day_night = :day_night_print'
      'where '
      'id = :OLD_id')
    DeleteSQL.Strings = (
      'delete from account_acts where id = :old_id')
    Left = 892
    Top = 393
  end
  object PopupMenuAccount_acts: TPopupMenu
    Left = 628
    Top = 257
    object N28: TMenuItem
      Caption = #1057#1090#1072#1090#1091#1089' '#1072#1082#1090#1072
      object N31: TMenuItem
        Tag = 2
        Caption = #1055#1086#1076#1087#1080#1089#1072#1085
      end
      object N30: TMenuItem
        Tag = 1
        Caption = #1055#1077#1088#1077#1076#1072#1085' '#1085#1072' '#1087#1086#1076#1087#1080#1089#1100
      end
      object N29: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1085
      end
      object N38: TMenuItem
        Tag = 3
        Caption = #1053#1072#1087#1077#1095#1072#1090#1072#1085
      end
      object N39: TMenuItem
        Tag = 4
        Caption = #1057#1086#1093#1088#1072#1085#1077#1085' '#1074' '#1092#1072#1081#1083
      end
      object N47: TMenuItem
        Tag = 5
        Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1083#1077#1085' '#1082' '#1087#1077#1095#1072#1090#1080
      end
    end
    object mniN38: TMenuItem
      Caption = #1057#1085#1103#1090#1100' '#1087#1086#1084#1077#1090#1082#1091'  *  ("'#1054#1073#1088#1072#1090#1080#1090#1100' '#1074#1085#1080#1084#1072#1085#1080#1077'")'
    end
    object pmActs_add_info_1: TMenuItem
      Caption = #1047#1072#1076#1072#1090#1100' '#8470' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
    end
    object N34: TMenuItem
      Caption = #1047#1072#1076#1072#1090#1100' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object pmActs_Refresh: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    end
    object mnaccount_acts_to_Excel: TMenuItem
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074'  Excel'
    end
    object mniN39: TMenuItem
      Caption = '-'
    end
    object mniAddresToActs: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1102#1097#1080#1077' '#1072#1076#1088#1077#1089#1072' '#1074' '#1089#1087#1080#1089#1086#1082
    end
    object N41: TMenuItem
      Caption = '-'
    end
    object N40: TMenuItem
      Caption = #1044#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1079#1072#1087#1080#1089#1077#1081' '#1047#1040#1044#1040#1058#1068' '#1057#1058#1040#1058#1059#1057' '#1040#1050#1058#1040
      object N42: TMenuItem
        Tag = 2
        Caption = #1055#1086#1076#1087#1080#1089#1072#1085
      end
      object N43: TMenuItem
        Tag = 1
        Caption = #1055#1077#1088#1077#1076#1072#1085' '#1085#1072' '#1087#1086#1076#1087#1080#1089#1100
      end
      object N44: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1085
      end
      object N45: TMenuItem
        Tag = 3
        Caption = #1053#1072#1087#1077#1095#1072#1090#1072#1085
      end
      object N46: TMenuItem
        Tag = 4
        Caption = #1057#1086#1093#1088#1072#1085#1077#1085' '#1074' '#1092#1072#1081#1083
      end
      object N48: TMenuItem
        Tag = 5
        Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1083#1077#1085' '#1082' '#1087#1077#1095#1072#1090#1080
      end
    end
  end
end
