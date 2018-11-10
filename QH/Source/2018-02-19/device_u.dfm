object Device_Form: TDevice_Form
  Left = 54
  Top = 92
  Width = 1300
  Height = 750
  BorderIcons = [biMinimize, biMaximize]
  Caption = #1055#1088#1080#1073#1086#1088#1099' '#1080' '#1080#1093' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 417
    Top = 0
    Width = 4
    Height = 691
    Color = clMedGray
    ParentColor = False
  end
  object DevicesPanel: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 691
    Align = alLeft
    Constraints.MinWidth = 50
    TabOrder = 0
    inline GridFrame: TDbGridFrame
      Left = 1
      Top = 67
      Width = 415
      Height = 623
      Align = alClient
      AutoScroll = False
      TabOrder = 0
      inherited Grid: TDBGridEh
        Left = 180
        Width = 235
        Height = 623
        AutoFitColWidths = False
        DataSource = ds_devices
        Font.Height = -15
        FooterFont.Height = -9
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        RowSizingAllowed = True
        TitleFont.Height = -15
        OnDblClick = btnInListClick
        OnGetCellParams = DbGridFrame1GridGetCellParams
        Columns = <
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'COMPOSITION_DEVICETYPE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1090#1080#1087
            Title.TitleButton = False
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'DEVICENUMBER'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1085#1086#1084#1077#1088
            Title.TitleButton = False
          end
          item
            EditButtons = <>
            FieldName = 'DEVICETYPENAME'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1090#1080#1087' '#1074#1086#1076#1086#1074#1086#1076#1072
            Title.TitleButton = False
            Width = 93
          end
          item
            EditButtons = <>
            FieldName = 'CONVERTERNAME'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1072#1082#1091#1089#1090#1080#1095'. '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1077#1083#1100
            Title.TitleButton = False
            Width = 83
          end
          item
            DisplayFormat = 'dd.mm.yy'
            EditButtons = <>
            FieldName = 'CREATE_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080'|'#1087#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1088#1072#1089#1095#1077#1090
            Title.TitleButton = False
            Width = 91
          end
          item
            DisplayFormat = 'dd.mm.yy'
            EditButtons = <>
            FieldName = 'SALE_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080'|'#1090#1077#1082#1091#1097#1080#1081' '#1088#1072#1089#1095#1077#1090
            Title.TitleButton = False
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'tblfile'
            Footers = <>
            Title.Caption = 'tbl-'#1092#1072#1081#1083
            Title.TitleButton = False
            Width = 264
          end
          item
            EditButtons = <>
            FieldName = 'CUSTOMER'
            Footers = <>
            Title.Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
            Title.TitleButton = False
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'PARENTDEVICENUMBER'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072' -"'#1088#1086#1076#1080#1090#1077#1083#1103'"'
            Title.TitleButton = False
            Width = 133
          end
          item
            EditButtons = <>
            FieldName = 'TABLE_CODE'
            Footers = <>
            Title.TitleButton = False
            Visible = False
          end>
      end
      inherited ToolPanel: TPanel
        Width = 180
        Height = 623
        inherited Label2: TLabel
          Font.Height = -12
        end
        inherited Bevel: TBevel
          Left = 176
          Top = 21
          Height = 602
        end
        inherited Label4: TLabel
          Font.Height = -12
        end
        inherited FieldCombo: TDBComboBoxEh
          Width = 145
          DropDownBox.Rows = 9
          DropDownBox.Sizable = True
          OnNotInList = GridFrameFieldComboNotInList
        end
        inherited ValueEdit: TDBEditEh
          Width = 121
        end
        inherited SearchCombo: TDBComboBoxEh
          Width = 145
        end
        inherited SimilarityTrack: TTrackBar
          Width = 151
        end
        inherited Panel1: TPanel
          Width = 180
          Height = 21
          Font.Height = -12
          inherited btnSearchClose: TSpeedButton
            Left = 145
          end
        end
        inherited SearchDirectionCompo: TDBComboBoxEh
          Width = 145
        end
        inherited ToolBar1: TToolBar
          Left = 162
        end
        inherited ValueEdit2: TDBEditEh
          Left = 80
        end
      end
      inherited PopupMenu: TPopupMenu
        Left = 178
        Top = 70
        object N22: TMenuItem [0]
          Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1073#1086#1088
          GroupIndex = 200
          OnClick = miLockClick
        end
        object N23: TMenuItem [1]
          Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1073#1086#1088
          GroupIndex = 200
          OnClick = miUnlockClick
        end
        object N21: TMenuItem [2]
          Caption = '-'
          GroupIndex = 200
        end
        object N12: TMenuItem [3]
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1088#1080#1073#1086#1088'-'#1082#1083#1086#1085' '
          GroupIndex = 200
          OnClick = N12Click
        end
        object N11: TMenuItem [4]
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1088#1080#1073#1086#1088'-'#1080#1089#1090#1086#1095#1085#1080#1082' '#1076#1083#1103' '#1082#1083#1086#1085#1072
          GroupIndex = 200
          OnClick = N11Click
        end
        object pmReplaceParent: TMenuItem [5]
          Caption = #1047#1072#1084#1077#1089#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1087#1088#1080#1073#1086#1088#1077'-"'#1088#1086#1076#1080#1090#1077#1083#1077'"'
          GroupIndex = 200
          OnClick = miReplaceParentClick
        end
        object N20: TMenuItem [6]
          Caption = '-'
          GroupIndex = 200
        end
        object pmDeleteDevice: TMenuItem [7]
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1087#1088#1080#1073#1086#1088#1077
          GroupIndex = 200
          OnClick = miDeleteDeviceClick
        end
        object N1: TMenuItem [8]
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
          Visible = False
        end
        inherited ExactMenuItem: TMenuItem
          GroupIndex = 200
          Visible = False
        end
        inherited PartialMenuItem: TMenuItem
          GroupIndex = 200
          Visible = False
        end
        inherited FuzzyMenuItem: TMenuItem
          GroupIndex = 200
          Visible = False
        end
        inherited EmptyMenuItem: TMenuItem
          GroupIndex = 200
          Visible = False
        end
        inherited NotEmptyMenuItem: TMenuItem
          GroupIndex = 200
          Visible = False
        end
        inherited RangeMenuItem: TMenuItem
          GroupIndex = 200
          Visible = False
        end
        inherited Separator2Item: TMenuItem
          Visible = False
        end
        inherited FilterMenuItem: TMenuItem
          Visible = False
        end
        inherited PrevMenuItem: TMenuItem
          Visible = False
        end
        inherited NextMenuItem: TMenuItem
          Visible = False
        end
      end
      inherited Image24: TImageList
        Left = 336
        Top = 156
      end
    end
    object dbnvgr1: TDBNavigator
      Left = 1
      Top = 46
      Width = 415
      Height = 21
      DataSource = ds_devices
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alTop
      TabOrder = 1
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 415
      Height = 45
      Align = alTop
      TabOrder = 2
      object rgRG_Filter: TRadioGroup
        Left = 1
        Top = 1
        Width = 253
        Height = 43
        Align = alLeft
        Caption = #1060#1080#1083#1100#1090#1088' '#1087#1088#1080#1073#1086#1088#1086#1074
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #1088#1072#1089#1093#1086#1076#1086#1084#1077#1088#1099
          #1091#1088#1086#1074#1085#1077#1084#1077#1088#1099)
        ParentFont = False
        TabOrder = 0
        OnClick = miRefreshClick
      end
      object btnInList: TButton
        Left = 267
        Top = 2
        Width = 91
        Height = 42
        Hint = #1047#1072#1087#1080#1089#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1087#1088#1080#1073#1086#1088#1072' '#1079#1072#1085#1086#1089#1080#1090#1089#1103' '#1074' '#1089#1087#1080#1089#1086#1082' '#1087#1088#1080#1073#1086#1088#1086#1074
        Caption = #1042#1085#1077#1089#1090#1080' '#1074' '#1089#1087#1080#1089#1086#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        WordWrap = True
        OnClick = btnInListClick
      end
    end
  end
  object ParamPanel: TPanel
    Left = 421
    Top = 0
    Width = 863
    Height = 691
    Align = alClient
    Caption = 'ParamPanel'
    Constraints.MinWidth = 30
    TabOrder = 1
    DesignSize = (
      863
      691)
    object pcInputValues: TPageControl
      Left = 1
      Top = 25
      Width = 861
      Height = 632
      ActivePage = tsDeviceAttribute
      Align = alClient
      Images = ImageList1
      TabHeight = 35
      TabOrder = 0
      OnChange = pcInputValuesChange
      OnChanging = pcInputValuesChanging
      OnExit = ParamGridExit
      object tsDeviceAttribute: TTabSheet
        Caption = #1040#1090#1088#1080#1073#1091#1090#1099' '#1087#1088#1080#1073#1086#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnExit = ParamGridExit
        DesignSize = (
          853
          587)
        object Label3: TLabel
          Left = 8
          Top = 337
          Width = 86
          Height = 16
          Alignment = taRightJustify
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
        end
        object Label2: TLabel
          Left = 39
          Top = 66
          Width = 102
          Height = 16
          Alignment = taRightJustify
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
          Visible = False
        end
        object Label4: TLabel
          Left = 36
          Top = 92
          Width = 105
          Height = 16
          Alignment = taRightJustify
          Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072':'
        end
        object Label5: TLabel
          Left = 59
          Top = 158
          Width = 82
          Height = 16
          Alignment = taRightJustify
          Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
        end
        object Label7: TLabel
          Left = 20
          Top = 115
          Width = 121
          Height = 32
          Alignment = taRightJustify
          Caption = #1040#1082#1091#1089#1090#1080#1095#1077#1089#1082#1080#1081' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1077#1083#1100':'
          WordWrap = True
        end
        object Label8: TLabel
          Left = 8
          Top = 311
          Width = 136
          Height = 16
          Alignment = taRightJustify
          Caption = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1088#1072#1089#1095#1077#1090':'
        end
        object Label9: TLabel
          Left = 265
          Top = 311
          Width = 109
          Height = 16
          Caption = #1058#1077#1082#1091#1097#1080#1081' '#1088#1072#1089#1095#1077#1090':'
        end
        object Label16: TLabel
          Left = 273
          Top = 92
          Width = 92
          Height = 20
          AutoSize = False
          Caption = '  '#8470' "'#1088#1086#1076#1080#1090#1077#1083#1103'"'
        end
        object DBText11: TDBText
          Left = 371
          Top = 92
          Width = 59
          Height = 16
          AutoSize = True
          Color = 16776176
          DataField = 'PARENTDEVICENUMBER'
          DataSource = ds_devices
          ParentColor = False
        end
        object Label6: TLabel
          Left = 8
          Top = 179
          Width = 97
          Height = 16
          Alignment = taRightJustify
          Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1072#1094#1080#1103':'
        end
        object Label1: TLabel
          Left = 488
          Top = 92
          Width = 206
          Height = 16
          Hint = #1050
          Caption = #1050#1086#1076' '#1080#1085#1090#1077#1088#1085#1077#1090'-'#1076#1086#1089#1090#1091#1087#1072' '#1082' '#1072#1088#1093#1080#1074#1091
        end
        object edDescr: TDBMemo
          Left = 98
          Top = 336
          Width = 700
          Height = 82
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataField = 'DESCR'
          DataSource = ds_devices
          MaxLength = 1023
          TabOrder = 16
        end
        object edName: TDBEdit
          Left = 146
          Top = 64
          Width = 652
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = clBtnFace
          DataField = 'NAME'
          DataSource = ds_devices
          Enabled = False
          TabOrder = 2
          Visible = False
        end
        object edDeviceNumber: TDBEdit
          Left = 146
          Top = 91
          Width = 129
          Height = 20
          AutoSize = False
          DataField = 'DEVICENUMBER'
          DataSource = ds_devices
          TabOrder = 3
          OnEnter = edDeviceNumberEnter
          OnExit = edDeviceNumberExit
          OnKeyDown = edDeviceNumberKeyDown
        end
        object edCreate_date: TDBDateTimeEditEh
          Left = 151
          Top = 311
          Width = 97
          Height = 22
          DataField = 'CREATE_DATE'
          DataSource = ds_devices
          EditButtons = <>
          Flat = True
          TabOrder = 14
          Visible = True
          EditFormat = 'DD.MM.YY'
        end
        object edSale_Date: TDBDateTimeEditEh
          Left = 380
          Top = 311
          Width = 97
          Height = 22
          DataField = 'SALE_DATE'
          DataSource = ds_devices
          EditButtons = <>
          Flat = True
          TabOrder = 15
          Visible = True
          EditFormat = 'DD.MM.YY'
        end
        object cbConverter: TComboBox
          Left = 146
          Top = 121
          Width = 235
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 4
          OnClick = cbConverterClick
          OnCloseUp = cbConverterCloseUp
          OnExit = cbConverterExit
        end
        object RG_DeviceType: TRadioGroup
          Left = 5
          Top = -2
          Width = 468
          Height = 37
          Caption = #1058#1080#1087' '#1087#1088#1080#1073#1086#1088#1072
          Columns = 3
          Enabled = False
          Items.Strings = (
            #1069#1061#1054'-'#1056
            #1069#1061#1054'-'#1040#1057)
          TabOrder = 0
          OnClick = RG_CurrentClick
        end
        object btnTypeDevice: TBitBtn
          Left = 394
          Top = 35
          Width = 107
          Height = 29
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          OnClick = btnTypeDeviceClick
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C0000000000000000000000000000
            000000001F7C1F7C0000000000001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7F00001F7C0000EF3DE07FEF3D00001F7C0000FF7F00000000FF7F00000000
            FF7F00001F7C0000E07FE07FE07F00001F7C0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7F00001F7C0000EF3DE07FEF3D00001F7C0000FF7F0000000000000000FF7F
            FF7F00001F7C1F7C0000000000001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7F00001F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00000000FF7F00000000
            000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7F0000FF7F
            FF7F00001F7C000000000000000000001F7C0000FF7F0000F75EFF7F0000FF7F
            00001F7C1F7C0000007C007C007C00001F7C0000FF7FFF7FFF7FFF7F00000000
            1F7C1F7C1F7C0000007C007C007C00001F7C0000000000000000000000001F7C
            1F7C1F7C1F7C0000007C007C007C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C000000000000000000001F7C1F7C000000000000000000000000
            00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F001F001F000000
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F0000001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C
            1F7C1F7C1F7C}
        end
        object cbTypeDevice: TComboBox
          Left = 8
          Top = 38
          Width = 374
          Height = 24
          BevelInner = bvNone
          BevelOuter = bvNone
          Style = csSimple
          Color = clBtnFace
          Enabled = False
          ItemHeight = 16
          TabOrder = 1
          OnCloseUp = cbTypeDeviceCloseUp
        end
        object RG_RS: TRadioGroup
          Left = 9
          Top = 193
          Width = 344
          Height = 56
          Caption = #1041#1083#1086#1082' RS'
          Columns = 3
          Items.Strings = (
            #1085#1077#1090
            'RS232'
            'RS485'
            'USB'
            'USB '#1080' RS232'
            'USB '#1080' RS485')
          TabOrder = 8
          OnClick = RG_CurrentClick
        end
        object RG_Level: TRadioGroup
          Left = 361
          Top = 193
          Width = 233
          Height = 56
          Caption = #1041#1083#1086#1082' '#1091#1089#1090#1072#1074#1086#1082
          Columns = 2
          Items.Strings = (
            #1085#1077#1090
            '1 '#1090#1086#1095#1082#1072
            '2 '#1090#1086#1095#1082#1080
            '3 '#1090#1086#1095#1082#1080)
          TabOrder = 9
          OnClick = RG_CurrentClick
        end
        object RG_Current: TRadioGroup
          Left = 10
          Top = 249
          Width = 87
          Height = 55
          Caption = #1041#1083#1086#1082' '#1090#1086#1082#1072
          Items.Strings = (
            #1085#1077#1090
            #1077#1089#1090#1100)
          TabOrder = 10
          OnClick = RG_CurrentClick
        end
        object RG_IR_Port: TRadioGroup
          Left = 108
          Top = 249
          Width = 87
          Height = 55
          Caption = #1048#1050'-'#1087#1086#1088#1090
          Items.Strings = (
            #1085#1077#1090
            #1077#1089#1090#1100)
          TabOrder = 11
          OnClick = RG_CurrentClick
        end
        object RG_IMP_OUT: TRadioGroup
          Left = 205
          Top = 249
          Width = 139
          Height = 55
          Caption = #1048#1084#1087#1091#1083#1100#1089#1085#1099#1081' '#1074#1099#1093#1086#1076
          Items.Strings = (
            #1085#1077#1090
            #1077#1089#1090#1100)
          TabOrder = 12
          OnClick = RG_CurrentClick
        end
        object cbbCUSTOMER: TDBComboBoxEh
          Left = 147
          Top = 152
          Width = 236
          Height = 24
          DataField = 'CUSTOMER'
          DataSource = ds_devices
          DropDownBox.AutoDrop = True
          DropDownBox.Rows = 15
          DropDownBox.Sizable = True
          EditButtons = <>
          TabOrder = 5
          Visible = True
          OnClick = cbbCustomerClick
          OnCloseUp = cbbCustomerCloseUp
          OnKeyDown = cbbCustomerKeyDown
        end
        object GB_L0: TGroupBox
          Left = 391
          Top = 139
          Width = 201
          Height = 47
          Caption = #1053#1077#1080#1079#1084#1077#1088#1103#1077#1084#1072#1103' '#1079#1086#1085#1072', Lo, '#1084
          TabOrder = 7
          Visible = False
          object edt_L0: TDBNumberEditEh
            Left = 24
            Top = 19
            Width = 121
            Height = 22
            DataField = 'L_0'
            DataSource = ds_devices
            DecimalPlaces = 3
            DisplayFormat = '0.000'
            EditButton.Style = ebsEllipsisEh
            EditButton.Visible = True
            EditButtons = <>
            Flat = True
            MaxValue = 1000.000000000000000000
            TabOrder = 0
            Visible = True
            OnExit = edt_L0Exit
            OnKeyDown = edt_L0KeyDown
          end
        end
        object chkL0: TCheckBox
          Left = 392
          Top = 120
          Width = 273
          Height = 17
          Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1085#1077#1080#1079#1084#1077#1088#1103#1077#1084#1086#1081' '#1079#1086#1085#1099
          TabOrder = 6
          OnClick = chkL0Click
        end
        object cxFTP_CODE: TcxTextEdit
          Left = 704
          Top = 92
          Width = 113
          Height = 24
          TabOrder = 17
        end
      end
      object tsParamGrid: TTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1088#1080#1073#1086#1088#1072
        ImageIndex = 1
        object Splitter2: TSplitter
          Left = 0
          Top = 411
          Width = 853
          Height = 3
          Cursor = crVSplit
          Align = alBottom
        end
        object ParamGrid: TDBGridEh
          Left = 0
          Top = 93
          Width = 853
          Height = 269
          Align = alClient
          AllowedOperations = [alopUpdateEh]
          DataSource = ds_deviceparams
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection, dghEnterAsTab, dghDialogFind]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnCellClick = ParamGridCellClick
          OnExit = ParamGridExit
          OnGetCellParams = ParamGridGetCellParams
          OnKeyDown = ParamGridKeyDown
          Columns = <
            item
              Alignment = taRightJustify
              Color = clBtnFace
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088'|'#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 332
            end
            item
              Alignment = taCenter
              Color = clBtnFace
              EditButtons = <>
              FieldName = 'DISPLAYNAME'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Footers = <>
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088'|..'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 60
            end
            item
              Alignment = taCenter
              Color = clBtnFace
              EditButtons = <>
              FieldName = 'UNIT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Footers = <>
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088'|'#1077#1076'. '#1080#1079#1084
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 51
            end
            item
              EditButtons = <>
              FieldName = 'PARAM_VALUE'
              Footers = <>
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088'|'#1079#1085#1072#1095#1077#1085#1080#1077
              Width = 89
            end>
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 853
          Height = 16
          Align = alTop
          TabOrder = 1
          object DBText1: TDBText
            Left = 220
            Top = 1
            Width = 42
            Height = 13
            Align = alLeft
            AutoSize = True
            Color = 16776176
            DataField = 'DEVICENUMBER'
            DataSource = ds_devices
            ParentColor = False
          end
          object DBText2: TDBText
            Left = 1
            Top = 1
            Width = 196
            Height = 14
            Align = alLeft
            Color = 16776176
            DataField = 'NAME'
            DataSource = ds_devices
            ParentColor = False
          end
          object Label10: TLabel
            Left = 197
            Top = 1
            Width = 23
            Height = 13
            Align = alLeft
            Caption = '   '#8470' '
          end
          object Label15: TLabel
            Left = 262
            Top = 1
            Width = 77
            Height = 13
            Align = alLeft
            Caption = '  '#8470' "'#1088#1086#1076#1080#1090#1077#1083#1103'"'
          end
          object DBText10: TDBText
            Left = 339
            Top = 1
            Width = 48
            Height = 13
            Align = alLeft
            AutoSize = True
            Color = 16776176
            DataField = 'PARENTDEVICENUMBER'
            DataSource = ds_devices
            ParentColor = False
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 16
          Width = 853
          Height = 77
          Align = alTop
          TabOrder = 2
          object DBText5: TDBText
            Left = 231
            Top = 10
            Width = 121
            Height = 14
            Alignment = taCenter
            Color = clSilver
            DataField = 'CALCMODE'
            DataSource = ds_devices
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label12: TLabel
            Left = 13
            Top = 36
            Width = 133
            Height = 13
            Alignment = taRightJustify
            Caption = #1044#1072#1090#1072' '#1087#1077#1088#1074#1080#1095#1085#1086#1075#1086' '#1088#1072#1089#1095#1077#1090#1072':'
          end
          object Label13: TLabel
            Left = 258
            Top = 36
            Width = 123
            Height = 13
            Caption = #1044#1072#1090#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1088#1072#1089#1095#1077#1090#1072':'
          end
          object btnProcessing: TBitBtn
            Left = 7
            Top = 2
            Width = 215
            Height = 28
            Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1091
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnProcessingClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888880000000000000008088888888888880808708708708
              7080808F08F08F08F08080888888888888808087087087087080808F08F08F08
              F080808888888888888080800000000088808080FFFFFFF08880808000000000
              8880808888888888888088000000000000088888888888888888}
          end
          object DBMemo1: TDBMemo
            Left = 1
            Top = 53
            Width = 851
            Height = 23
            Align = alBottom
            Color = 16776176
            DataField = 'FORMULA'
            DataSource = ds_devices
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object DBDateTimeEditEh1: TDBDateTimeEditEh
            Left = 155
            Top = 33
            Width = 97
            Height = 19
            DataField = 'CREATE_DATE'
            DataSource = ds_devices
            EditButtons = <>
            Flat = True
            TabOrder = 2
            Visible = True
            EditFormat = 'DD.MM.YY'
          end
          object DBDateTimeEditEh2: TDBDateTimeEditEh
            Left = 394
            Top = 34
            Width = 97
            Height = 19
            DataField = 'RECORD_DATE'
            DataSource = ds_devices
            EditButtons = <>
            Flat = True
            TabOrder = 3
            Visible = True
            EditFormat = 'DD.MM.YY'
          end
        end
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 414
          Width = 853
          Height = 130
          Align = alBottom
          AutoFitColWidths = True
          Color = 16776176
          DataSource = ds_conditions
          FixedColor = 10930928
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              EditButtons = <>
              FieldName = 'DISPLAYCONDITION'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1059#1089#1083#1086#1074#1080#1103' '#1082#1086#1088#1088#1077#1082#1090#1085#1086#1089#1090#1080' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
              Width = 501
            end>
        end
        object RG_material: TRadioGroup
          Left = 0
          Top = 362
          Width = 853
          Height = 49
          Align = alBottom
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083' '#1090#1088#1091#1073#1099
          Columns = 4
          Items.Strings = (
            #1057#1090#1072#1083#1100' '
            #1063#1091#1075#1091#1085
            #1063#1091#1075#1091#1085' '#1089' '#1073#1077#1090#1086#1085#1086#1084
            #1041#1077#1090#1086#1085' '#1089' '#1079#1072#1089#1086#1088#1077#1085#1080#1077#1084
            #1041#1077#1090#1086#1085' '#1085#1077#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1085#1099#1081
            #1041#1077#1090#1086#1085
            #1060#1072#1088#1092#1086#1088
            #1055#1083#1072#1089#1090#1080#1082)
          TabOrder = 4
          Visible = False
          OnClick = RG_materialClick
        end
        object DBMemo2: TDBMemo
          Left = 0
          Top = 544
          Width = 853
          Height = 43
          Align = alBottom
          Color = 16776176
          DataField = 'DISPLAYCONDITION'
          DataSource = ds_conditions
          ReadOnly = True
          TabOrder = 5
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072' Q(h)'
        ImageIndex = 2
        object pcQH: TPageControl
          Left = 0
          Top = 63
          Width = 853
          Height = 524
          ActivePage = tsQH
          Align = alClient
          MultiLine = True
          TabHeight = 35
          TabOrder = 0
          TabPosition = tpLeft
          OnChange = pcQHChange
          object tsQH: TTabSheet
            Caption = #1058#1072#1073#1083#1080#1094#1072
            object QHGrid: TDBGridEh
              Left = 0
              Top = 59
              Width = 810
              Height = 457
              Align = alClient
              AutoFitColWidths = True
              DataSource = DS_QH
              FixedColor = 16776176
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = 'MS Sans Serif'
              FooterFont.Style = []
              OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghEnterAsTab, dghDialogFind]
              ParentFont = False
              PopupMenu = pmMenu_QHGrid
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -15
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              UseMultiTitle = True
              OnExit = QHGridExit
              OnKeyDown = QHGridKeyDown
              Columns = <
                item
                  Alignment = taCenter
                  Color = clSilver
                  EditButtons = <>
                  FieldName = 'I'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #8470' '#1087#1087
                  Width = 47
                end
                item
                  EditButtons = <>
                  FieldName = 'X_VALUE'
                  Footers = <>
                  Title.Caption = 'H, '#1084
                  Width = 97
                end
                item
                  EditButtons = <>
                  FieldName = 'Y_VALUE'
                  Footers = <>
                  Title.Caption = 'Q, '#1082#1091#1073'.'#1084'/'#1095
                  Width = 88
                end
                item
                  Color = clMoneyGreen
                  EditButtons = <>
                  FieldName = 'X_PROCENT'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'H, %'
                  Width = 77
                end
                item
                  Color = clMoneyGreen
                  EditButtons = <>
                  FieldName = 'Y_PROCENT'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = 'Q, %'
                  Width = 89
                end
                item
                  Color = clMoneyGreen
                  EditButtons = <>
                  FieldName = 'T_COUNTER'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #1055#1077#1088#1080#1086#1076' '#1089#1095#1077#1090#1095#1080#1082#1072', '#1089
                  Width = 85
                end>
            end
            object pnDelAddPoint: TPanel
              Left = 0
              Top = 0
              Width = 810
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object btnAddPoint: TBitBtn
                Left = 14
                Top = 1
                Width = 143
                Height = 31
                Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1095#1082#1091
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = pmAddPointClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333333FF33333333FF333993333333300033377F3333333777333993333333
                  300033F77FFF3333377739999993333333333777777F3333333F399999933333
                  33003777777333333377333993333333330033377F3333333377333993333333
                  3333333773333333333F333333333333330033333333F33333773333333C3333
                  330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
                  993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
                  333333333337733333FF3333333C333330003333333733333777333333333333
                  3000333333333333377733333333333333333333333333333333}
                NumGlyphs = 2
              end
              object btnDeletePoint: TBitBtn
                Left = 163
                Top = 1
                Width = 143
                Height = 31
                Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1086#1095#1082#1091
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = pmDeletePointClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333FF33333333333330003333333333333777333333333333
                  300033FFFFFF3333377739999993333333333777777F3333333F399999933333
                  3300377777733333337733333333333333003333333333333377333333333333
                  3333333333333333333F333333333333330033333F33333333773333C3333333
                  330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
                  993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
                  333333377F33333333FF3333C333333330003333733333333777333333333333
                  3000333333333333377733333333333333333333333333333333}
                NumGlyphs = 2
              end
              object DBNavigator1: TDBNavigator
                Left = 376
                Top = 8
                Width = 168
                Height = 18
                DataSource = DS_QH
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                TabOrder = 2
              end
            end
            object pnlCanEditQh: TPanel
              Left = 0
              Top = 33
              Width = 810
              Height = 26
              Align = alTop
              TabOrder = 2
              object btnCanEditQH: TButton
                Left = 16
                Top = 2
                Width = 321
                Height = 20
                Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1088#1091#1095#1085#1086#1077' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099' Q(h)'
                TabOrder = 0
                OnClick = btnCanEditQHClick
              end
            end
          end
          object TabSheet5: TTabSheet
            Caption = #1043#1088#1072#1092#1080#1082
            ImageIndex = 1
            object Chart: TDBChart
              Left = 0
              Top = 0
              Width = 810
              Height = 516
              AutoRefresh = False
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Gradient.EndColor = 16777160
              Gradient.Visible = True
              Title.Text.Strings = (
                '')
              OnClickSeries = ChartClickSeries
              BottomAxis.ExactDateTime = False
              BottomAxis.Increment = 0.100000000000000000
              BottomAxis.Title.Caption = #1091#1088#1086#1074#1077#1085#1100', '#1084'                                                '
              LeftAxis.Title.Caption = #1088#1072#1089#1093#1086#1076
              View3D = False
              Align = alClient
              TabOrder = 0
              OnMouseMove = ChartMouseMove
              DesignSize = (
                810
                516)
              object lblMouseY: TLabel
                Left = 701
                Top = 477
                Width = 98
                Height = 16
                Alignment = taCenter
                Anchors = [akRight, akBottom]
                AutoSize = False
                Color = 16777088
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                WordWrap = True
              end
              object lblMouseX: TLabel
                Left = 600
                Top = 477
                Width = 98
                Height = 16
                Alignment = taCenter
                Anchors = [akRight, akBottom]
                AutoSize = False
                Color = 16777088
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                WordWrap = True
              end
              object Series1: TLineSeries
                Marks.ArrowLength = 8
                Marks.Visible = False
                DataSource = q_QH
                SeriesColor = clRed
                ShowInLegend = False
                InvertedStairs = True
                LinePen.Color = clRed
                LinePen.Width = 2
                Pointer.HorizSize = 2
                Pointer.InflateMargins = True
                Pointer.Style = psSmallDot
                Pointer.VertSize = 2
                Pointer.Visible = True
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                XValues.ValueSource = 'X_VALUE'
                YValues.DateTime = False
                YValues.Name = 'Y'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
                YValues.ValueSource = 'Y_VALUE'
              end
              object Series2: TPointSeries
                Marks.ArrowLength = 8
                Marks.Visible = True
                DataSource = GOSTTABLE
                SeriesColor = clGreen
                ShowInLegend = False
                ValueFormat = '#,##0.##'
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
                Pointer.Visible = True
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                XValues.ValueSource = 'X_VALUE'
                YValues.DateTime = False
                YValues.Name = 'Y'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
                YValues.ValueSource = 'Y_VALUE'
              end
              object Series3: TPointSeries
                Marks.ArrowLength = 8
                Marks.Visible = False
                DataSource = VisiblePointsTable
                SeriesColor = clBlue
                ShowInLegend = False
                Pointer.InflateMargins = True
                Pointer.Style = psCircle
                Pointer.Visible = True
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                XValues.ValueSource = 'X_VALUE'
                YValues.DateTime = False
                YValues.Name = 'Y'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
                YValues.ValueSource = 'Y_VALUE'
              end
              object Series4: TLineSeries
                Marks.ArrowLength = 8
                Marks.Visible = False
                DataSource = q_QH_Parent
                SeriesColor = clGray
                ShowInLegend = False
                InvertedStairs = True
                LinePen.Color = clSilver
                LinePen.Width = 2
                Pointer.HorizSize = 2
                Pointer.InflateMargins = True
                Pointer.Style = psCircle
                Pointer.VertSize = 2
                Pointer.Visible = False
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                XValues.ValueSource = 'X_VALUE'
                YValues.DateTime = False
                YValues.Name = 'Y'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
                YValues.ValueSource = 'Y_VALUE'
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = #1043#1088#1072#1076#1091#1080#1088#1086#1074#1086#1095#1085#1103' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1082#1072
            ImageIndex = 3
            object GostGrid: TDBGridEh
              Left = 0
              Top = 0
              Width = 810
              Height = 516
              Align = alClient
              AutoFitColWidths = True
              DataSource = ds_gosttable
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = 'MS Sans Serif'
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -15
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              UseMultiTitle = True
              Columns = <
                item
                  Color = clMoneyGreen
                  EditButtons = <>
                  FieldName = 'X_VALUE'
                  Footers = <>
                  Title.Caption = 'H, '#1084
                  Width = 128
                end
                item
                  Color = clMoneyGreen
                  EditButtons = <>
                  FieldName = 'Y_VALUE'
                  Footers = <>
                  Title.Caption = 'Q, '#1082#1091#1073'.'#1084'/'#1095
                  Width = 135
                end
                item
                  Color = clMoneyGreen
                  EditButtons = <>
                  FieldName = 'T_COUNTER'
                  Footers = <>
                  Title.Caption = #1055#1077#1088#1080#1086#1076' '#1089#1095#1077#1090#1095#1080#1082#1072', '#1089
                  Width = 213
                end>
            end
          end
          object TabSheet4: TTabSheet
            Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1086
            ImageIndex = 4
            object VisiblePointsGrid: TDBGridEh
              Left = 0
              Top = 0
              Width = 810
              Height = 516
              Align = alClient
              AutoFitColWidths = True
              DataSource = ds_visiblepointsTable
              FixedColor = 16776176
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = 'MS Sans Serif'
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghEnterAsTab, dghDialogFind]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -15
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              UseMultiTitle = True
              OnExit = QHGridExit
              OnKeyDown = QHGridKeyDown
              Columns = <
                item
                  Alignment = taCenter
                  Color = 16776176
                  EditButtons = <>
                  FieldName = 'I'
                  Footers = <>
                  Title.Caption = #8470' '#1087#1087
                  Title.Color = clBtnFace
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 41
                end
                item
                  Color = 16776176
                  EditButtons = <>
                  FieldName = 'X_VALUE'
                  Footers = <>
                  Title.Caption = 'H, '#1084
                  Title.Color = clBtnFace
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 97
                end
                item
                  Color = 16776176
                  EditButtons = <>
                  FieldName = 'Y_VALUE'
                  Footers = <>
                  Title.Caption = 'Q, '#1082#1091#1073'.'#1084'/'#1095
                  Title.Color = clBtnFace
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 89
                end
                item
                  Color = 16776176
                  EditButtons = <>
                  FieldName = 'X_PROCENT'
                  Footers = <>
                  Title.Caption = 'H, %'
                  Title.Color = clBtnFace
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 76
                end
                item
                  Color = 16776176
                  EditButtons = <>
                  FieldName = 'Y_PROCENT'
                  Footers = <>
                  Title.Caption = 'Q, %'
                  Title.Color = clBtnFace
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 89
                end
                item
                  Color = 16776176
                  EditButtons = <>
                  FieldName = 'T_COUNTER'
                  Footers = <>
                  Title.Caption = #1055#1077#1088#1080#1086#1076' '#1089#1095#1077#1090#1095#1080#1082#1072', '#1089
                  Title.Color = clBtnFace
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 85
                end>
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 853
          Height = 28
          Align = alTop
          TabOrder = 1
          object DBText3: TDBText
            Left = 220
            Top = 1
            Width = 42
            Height = 14
            Align = alLeft
            Color = 16776176
            DataField = 'DEVICENUMBER'
            DataSource = ds_devices
            ParentColor = False
          end
          object DBText4: TDBText
            Left = 1
            Top = 1
            Width = 196
            Height = 14
            Align = alLeft
            Color = 16776176
            DataField = 'NAME'
            DataSource = ds_devices
            ParentColor = False
          end
          object Label11: TLabel
            Left = 197
            Top = 1
            Width = 23
            Height = 13
            Align = alLeft
            Caption = '   '#8470' '
          end
          object DBText6: TDBText
            Left = 1
            Top = 15
            Width = 851
            Height = 12
            Align = alBottom
            Alignment = taCenter
            Color = clBtnFace
            DataField = 'PARAMS_ARE_BAD'
            DataSource = ds_devices
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label14: TLabel
            Left = 262
            Top = 1
            Width = 77
            Height = 13
            Align = alLeft
            Caption = '  '#8470' "'#1088#1086#1076#1080#1090#1077#1083#1103'"'
          end
          object DBText9: TDBText
            Left = 339
            Top = 1
            Width = 43
            Height = 14
            Align = alLeft
            Color = 16776176
            DataField = 'PARENTDEVICENUMBER'
            DataSource = ds_devices
            ParentColor = False
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 28
          Width = 853
          Height = 35
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Mnogitel: TLabel
            Left = 0
            Top = 22
            Width = 853
            Height = 13
            Align = alBottom
            Alignment = taCenter
            Visible = False
          end
          object lbl2: TLabel
            Left = 495
            Top = 6
            Width = 151
            Height = 26
            Alignment = taRightJustify
            Caption = #1056#1072#1085#1077#1077' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1072#1076#1076#1080#1090#1080#1074#1085#1099#1081' '#1089#1076#1074#1080#1075' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080':'
            WordWrap = True
          end
          object dbtxtadd: TDBText
            Left = 657
            Top = 8
            Width = 65
            Height = 17
            DataField = 'ADDITIVE_SHIFT'
            DataSource = ds_devices
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnProcessing1: TBitBtn
            Left = 1
            Top = 1
            Width = 218
            Height = 31
            Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1091
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnProcessingClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888880000000000000008088888888888880808708708708
              7080808F08F08F08F08080888888888888808087087087087080808F08F08F08
              F080808888888888888080800000000088808080FFFFFFF08880808000000000
              8880808888888888888088000000000000088888888888888888}
          end
          object BitBtn2: TBitBtn
            Left = 239
            Top = 1
            Width = 178
            Height = 31
            Caption = #1057#1076#1074#1080#1085#1091#1090#1100' '#1093#1072#1088'-'#1082#1091' '#1074#1085#1080#1079' '#1085#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = BitBtn2Click
          end
          object AddSdvig: TRxCalcEdit
            Left = 424
            Top = 7
            Width = 56
            Height = 20
            AutoSize = False
            DecimalPlaces = 3
            DisplayFormat = ',0.###'
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 2
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 657
      Width = 861
      Height = 33
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        861
        33)
      object btnXlsReport: TSpeedButton
        Left = 121
        Top = 3
        Width = 80
        Height = 29
        Hint = #1055#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083' '#1074' '#1092#1086#1088#1084#1072#1090#1077' Excel'
        Anchors = [akLeft]
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888888888888888888888800000000000000006666007777777706E
          EF0880E6666606EEF088880E66606EEF06088880E606EEF000088888006EEF08
          8888888806EEF008888888806EEF067088888806EEF0E6670888806EEF080E66
          70880FFFF08880EEEE0800000888880000088888888888888888}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnxlsReportClick
      end
      object SpeedButton1: TSpeedButton
        Tag = 1
        Left = 35
        Top = 3
        Width = 80
        Height = 29
        Hint = #1053#1072#1087#1077#1095#1072#1090#1072#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083' '#1074' '#1092#1086#1088#1084#1072#1090#1077' Excel'
        Anchors = [akLeft]
        Caption = #1055#1077#1095#1072#1090#1100' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888888888888888888888800000000000000006666007777777706E
          EF0880E6666606EEF088880E66606EEF06088880E606EEF000088888006EEF08
          8888888806EEF008888888806EEF067088888806EEF0E6670888806EEF080E66
          70880FFFF08880EEEE0800000888880000088888888888888888}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnxlsReportClick
      end
      object DBText7: TDBText
        Left = 296
        Top = 9
        Width = 87
        Height = 15
        Color = clSilver
        DataField = 'tblfile'
        DataSource = ds_devices
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4194432
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object btnSaveInputData: TBitBtn
        Left = -46
        Top = 3
        Width = 89
        Height = 29
        Hint = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1080' '#1082#1086#1084#1087#1083#1077#1082#1090#1072#1094#1080#1080' '#1087#1088#1080#1073#1086#1088#1072' '#1074' '#1072#1088#1093#1080#1074#1077
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = False
        OnClick = btnSaveInputDataClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000C0C0C0C0C0C0
          141414242424B5B5B5C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C06C6C6C0101010909090404045D5D5DC0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BBBBBB080808
          4B4B4B8686862A2A2A020202141414C0C0C0C0C0C0101010848484C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C02626260F0F0FFFFFFFCFCFCFA0A0A069696916161600
          00002E2E2E010101000000000000000000000000C0C0C0C0C0C0353535000000
          626262FFFFFFFEFEFEC2C2C29595954C4C4C0A0A0A373737030303F1F1F19999
          99666666000000C0C0C0C0C0C07C7C7C0B0B0B101010B2B2B2FFFFFFEBEBEBB0
          B0B0A3A3A3A7A7A70303039E9E9ECCCCCC999999666666000000C0C0C0C0C0C0
          C0C0C0434343020202373737E8E8E8F8F8F8FFFFFFDBDBDB2A2A2A2F2F2FCCCC
          CC999999666666000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0171717000000D5
          D5D5FAFAFAA3A3A39D9D9D050505CCCCCC999999666666000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C09191910000000E0E0E0C0C0C0B0B0B0E0E0E1D1D1DCCCC
          CC999999666666000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C02323230B0B0B00
          00005A5A5ADADADAF1F1F1FFFFFFCCCCCC999999666666000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000CCCCCCFFFFFFFFFFFFFFFFFFCCCC
          CC999999666666000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
          0000CCCCCC000000000000000000000000000000666666000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000050202FFFFFFCCCCCCCCCCCCCCCC
          CCFFFFFF000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
          0000FFFFFFCCCCCC666666666666666666CCCCCCFFFFFF000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0050202FFFFFFCCCCCCCCCCCCCCCC
          CCFFFFFF2E1212C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0000000000000000000000000090404C0C0C0C0C0C0}
      end
      object btnReport: TBitBtn
        Left = 71
        Top = -14
        Width = 90
        Height = 21
        Caption = 'HTML- '#1086#1090#1095#1077#1090
        TabOrder = 1
        Visible = False
        OnClick = btnReportClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000C0C0C0C0C0C0
          CE9642CE8E31D69E52C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0DEA652BD8639C0C0C0C0C0C0D69E52B579396B
          51316B51316B51316B51316B5131C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0EFAE42
          AD7942C0C0C0C0C0C06B5131C67931DE9639EFAE42F7B652DEB663EFAE426B51
          316B5131C0C0C0C0C0C0C0C0C0EFB64AAD7942C0C0C06B5131E79E31F79E39EF
          9631EF9E31F7A639F7BE52FFD773EFCF8CB579396B5131C0C0C0C0C0C0E7AE63
          DE9E296B5131F7A631EF9E31E79629E79629735131735131B57129F7B642FFD7
          6BF7D794B57939C0C0C0C0C0C0C0C0C0F7B639F7AE31EFA629E79629DE8E2984
          5129C0C0C0C0C0C0C0C0C0B57129F7AE39FFD76BDEB67BB57939C0C0C0C0C0C0
          E7B663F7B631EFA629E79621A561186B51316B51316B51316B51316B51316B51
          316B51316B51316B5131C0C0C0C0C0C0C0C0C0F7BE39EFAE29E79E21D67929D6
          7929D67929D67929D67929D67929D67929D67929D67929B57939C0C0C0C0C0C0
          C0C0C0C0C0C0F7C742EFAE29E79E21DE9621E79629E79629E79629E79629EF96
          31F79E39EFA642B57939C0C0C0C0C0C0EFCF94C0C0C0F7C742F7C742BD86296B
          4921C0C0C0C0C0C0B57129CE8E31EF9629EF9E31EF9E31B57939C0C0C0C0C0C0
          C0C0C0EFCF94C0C0C0F7C742E7AE396B51295A4129735131B57129E79E29E796
          29F7A639B57939C0C0C0C0C0C0C0C0C0C0C0C0D6BE8CE7CF8CC0C0C0F7DF8CE7
          B639B58621CE8E21E7A629E79E21EFA629EFA639B57939C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0D6BE8CD6BE8CE7D763E7D763F7D742F7B631EFAE29EFAE29EFA6
          31B57939C0C0C0D6BE8CC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0D6BE8CD6
          BE8CD6BE8CDEB652FFCF4AB57939B57939C0C0C0C0C0C0D6BE8CC0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0D6BE8CE7CF8CC0C0
          C0C0C0C0C0C0C0D6BE8CC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0E7CF8CE7CF8CD6BE8CC0C0C0}
      end
      object btnGetHex: TBitBtn
        Left = 221
        Top = 3
        Width = 72
        Height = 29
        Caption = 'tbl-'#1092#1072#1081#1083
        TabOrder = 2
        OnClick = btnGetHexClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000000000000000000000
          0000000000000000000000000000000000000000000000C0C0C0C0C0C0000000
          008080008080000000000000000000000000000000000000C0C0C0C0C0C00000
          00008080000000C0C0C0C0C0C000000000808000808000000000000000000000
          0000000000000000C0C0C0C0C0C0000000008080000000C0C0C0C0C0C0000000
          008080008080000000000000000000000000000000000000C0C0C0C0C0C00000
          00008080000000C0C0C0C0C0C000000000808000808000000000000000000000
          0000000000000000000000000000000000008080000000C0C0C0C0C0C0000000
          0080800080800080800080800080800080800080800080800080800080800080
          80008080000000C0C0C0C0C0C000000000808000808000000000000000000000
          0000000000000000000000000000008080008080000000C0C0C0C0C0C0000000
          008080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00008080000000C0C0C0C0C0C0000000008080000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000008080000000C0C0C0C0C0C0000000
          008080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00008080000000C0C0C0C0C0C0000000008080000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000008080000000C0C0C0C0C0C0000000
          008080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000C0C0C0C0C0C0000000008080000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0000000C0C0C0C0C0C0000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
      end
      object BitBtn1: TBitBtn
        Left = 534
        Top = 3
        Width = 86
        Height = 29
        Hint = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1085#1086#1074#1086#1075#1086' '#1087#1088#1080#1073#1086#1088#1072
        Anchors = [akTop, akRight]
        Caption = #1053#1086#1074#1099#1081' '#1087#1088#1080#1073#1086#1088
        TabOrder = 3
        OnClick = BitBtn1Click
      end
    end
    object pnltop: TPanel
      Left = 1
      Top = 1
      Width = 861
      Height = 24
      Align = alTop
      TabOrder = 2
      OnResize = pnltopResize
      DesignSize = (
        861
        24)
      object lbl1: TLabel
        Left = 1
        Top = 8
        Width = 859
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080' '#1087#1088#1080#1073#1086#1088#1072' '#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1088#1072#1089#1095#1077#1090#1072
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnDblClick = lbl1DblClick
      end
      object btnclose: TSpeedButton
        Left = 609
        Top = 0
        Width = 19
        Height = 15
        Hint = #1047#1072#1082#1088#1099#1090#1100' '
        Anchors = [akTop, akRight]
        Caption = #1061
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btncloseClick
      end
      object pb: TProgressBar
        Left = 1
        Top = 1
        Width = 859
        Height = 7
        Align = alTop
        Smooth = True
        TabOrder = 0
        Visible = False
      end
    end
    object pnl2: TPanel
      Left = 512
      Top = 32
      Width = 310
      Height = 121
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      OnClick = pnl2Click
    end
  end
  object Image24: TImageList
    Height = 24
    Width = 24
    Left = 32
    Top = 68
    Bitmap = {
      494C010101000400040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000429C4200087B
      0800107B10001084100010841000108410001084100010841000108C1000108C
      1000108C10000894080008940800089408000894080008940800009400000094
      000000840000429C420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042AD420010941000189C
      1800189C1800219C2100219C2100219C210021A5210021A5210021A5210021AD
      210018B5180018B5180018B5180010BD100010BD100008BD080008BD080000BD
      000000AD000000940000429C4200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008A5080018A5180021AD
      210029AD290029AD290031B5310031B5310031B5310031B5310031BD310029BD
      290029C6290021C6210021CE210018D6180018D6180010D6100008D6080008CE
      080000C6000000AD000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010AD100021AD210029B5
      290031B5310039B5390039BD390039BD390039BD390039BD390039C6390039C6
      390031CE310031D6310029D6290021DE210018DE180018DE180010DE100008D6
      080000CE000000B50000008C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010AD100021B5210031B5
      310039B5390042BD420042BD420042BD420042BD420042C6420063CE6300F7FF
      F700F7FFF70031D6310031DE310029DE290021E7210018E7180010E7100008DE
      080008D6080000BD000000940000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018AD180029B5290039B5
      390042BD42004ABD4A004ABD4A004ABD4A004ABD4A004AC64A00A5E7A500FFFF
      FF00FFFFFF00F7FFF70031DE310029E7290021E7210021E7210018E7180010DE
      100008D6080008BD080000940000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018AD180031B5310042BD
      42004ABD4A004ABD4A004ABD4A004ABD4A004AC64A004AC64A004ACE4A00F7FF
      F700FFFFFF00FFFFFF00EFFFEF0031E7310029E7290021E7210018E7180010DE
      100010D6100010BD100008940800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021B5210039BD390042BD
      42004ABD4A0052C6520052C6520052C652004AC64A004AC64A004ACE4A004ACE
      4A00F7FFF700FFFFFF00FFFFFF00EFFFEF0029E7290021E7210021DE210018DE
      180018D6180010BD100008940800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021B5210042BD42004ABD
      4A0052C6520052C6520052C6520052C6520052C6520052C652004AC64A004ACE
      4A0042CE4200F7FFF700FFFFFF00FFFFFF00EFFFEF0021DE210021DE210021D6
      210018CE180018BD180010941000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029B529004ABD4A0052C6
      520052C652005AC65A005AC65A0052C6520052C6520052C652004AC64A004ACE
      4A0042CE420039CE3900EFFFEF00FFFFFF00FFFFFF00EFFFEF0021D6210021CE
      210021CE210021B5210010941000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031B531004ABD4A005AC6
      5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFFFEF0021CE
      210029C6290021B5210010941000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031B5310052C652005AC6
      5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFFF
      EF0029BD290021AD2100188C1800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039BD39005AC65A0063C6
      6300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0029BD
      290029BD290029AD2900188C1800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042BD420063C663006BCE
      6B006BCE6B006BCE6B0063C663005AC65A005AC65A0052C652004ABD4A0042BD
      420039BD390031BD3100D6EFD600FFFFFF00FFFFFF00FFFFFF0029BD290029BD
      290031B5310029AD2900188C1800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042BD42006BCE6B0073CE
      730073CE73006BCE6B006BCE6B0063C663005AC65A0052C652004AC64A004ABD
      4A0042BD4200D6EFD600FFFFFF00FFFFFF00FFFFFF0029B5290029B5290029B5
      290031B5310029A5290018841800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004ABD4A0073CE73007BCE
      7B007BCE7B0073CE73006BCE6B0063C663005AC65A005AC65A0052C652004ABD
      4A00DEF7DE00FFFFFF00FFFFFF00FFFFFF0031B5310029B5290031B5310031B5
      310031B5310029A5290018841800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004ABD4A007BCE7B0084D6
      840084D684007BCE7B0073CE73006BCE6B0063C663005AC65A0052C65200DEF7
      DE00FFFFFF00FFFFFF00FFFFFF0039B5390031B5310031B5310031B5310031B5
      310031B5310029A5290018841800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052C6520084D6840094D6
      94008CD68C0084D6840073CE730073CE73006BCE6B0063C6630084D68400FFFF
      FF00FFFFFF00FFFFFF004ABD4A0042BD420042BD420039BD390039BD390031B5
      310031B5310029A5290018841800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005AC65A0094D694009CDE
      9C0094DE94008CD68C0084D684007BCE7B0073CE73006BCE6B0073CE7300D6EF
      D600F7FFF7005AC65A005AC65A0052C6520052BD52004ABD4A0042BD420039BD
      390031B5310021A5210010841000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005AC65A0094DE9400A5DE
      A5009CDE9C008CD68C0084D684007BCE7B0073CE730073CE73006BCE6B006BCE
      6B006BCE6B0063C6630063C663005AC65A0052C6520052C652004ABD4A0039BD
      390031B53100219C210010841000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BCE7B0084D6840094D6
      94008CD68C007BCE7B0073CE73006BCE6B006BCE6B0063C6630063C663005AC6
      5A005AC65A005AC65A0052C6520052C652004ABD4A004ABD4A0042BD420031B5
      310029AD2900189C18004A9C4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007BCE7B005AC6
      5A0052C652004ABD4A004ABD4A0042BD420042BD420039BD390042BD420039BD
      390039BD390039B5390031B5310031B5310031B5310029B5290029B5290021AD
      210018A518004AB54A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF00FFFFFF000000000000000000C0000300
      0000000000000000800001000000000000000000800001000000000000000000
      8000010000000000000000008000010000000000000000008000010000000000
      0000000080000100000000000000000080000100000000000000000080000100
      0000000000000000800001000000000000000000800001000000000000000000
      8000010000000000000000008000010000000000000000008000010000000000
      0000000080000100000000000000000080000100000000000000000080000100
      0000000000000000800001000000000000000000800001000000000000000000
      800001000000000000000000800001000000000000000000C000030000000000
      00000000FFFFFF00000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ImageList1: TImageList
    Left = 393
    Top = 143
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000FF000000FFCC
      9900FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FFCC9900FFCC
      9900FF000000FF000000000000000000000000000000FF000000FFCC9900FFCC
      9900FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FFCC
      9900FF000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000033333300333333003333
      3300333333003333330033333300333333003333330033333300333333003333
      3300333333003333330033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000663300006633
      0000663300006633000066330000663300006633000066330000663300006633
      0000663300006633000000000000000000000000000066666600666666006666
      660033333300FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF996600FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF006633000000000000000000000000000066666600666666006666
      660033333300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006633000000000000000000000000000066666600666666006666
      66003333330000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000800000008000000000000000000000000000FF996600FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF006633000000000000000000000000000066666600666666006666
      66003333330000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      80000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000800000008000000000006633000066330000FF996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006633000000000000000000000000000066666600666666006666
      66003333330000FFFF0000FFFF0000FFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      8000000000000000000000000000000000000000000000000000FF0000000000
      000080008000000000000000000000000000FF663300FFFFFF00FF996600FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF006633000000000000000000000000000066666600666666006666
      66003333330000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080008000000000000000000000000000000000000000000000000000FF00
      000000000000000000000000000000000000FF663300FFFFFF00FF996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006633000000000000000000000000000066666600666666006666
      66003333330000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000800000000000000000000000000000000000800080000000
      0000FF000000000000000000000000000000FF663300FFFFFF00FF996600FF99
      6600FF996600FF996600FF996600FF996600FF996600FF996600FF996600FF99
      6600FF9966006633000000000000000000000000000066666600666666006666
      660033333300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080008000000000000000000080008000000000000000
      000000000000FF0000000000000000000000FF663300FFFFFF00FF996600FFFF
      FF0066330000FFFFFF00FFFFFF00FF996600FFFFFF0066330000FFFFFF00FFFF
      FF00FFFFFF006633000000000000000000000000000066666600666666006666
      660033333300FF999900FF999900FF999900FF999900FF999900FF999900FF99
      9900FF999900FF99990033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000800000000000000000000000
      000000000000FF000000FF00000000000000FF663300FFFFFF00FF996600FF99
      660066330000FF996600FF996600FF996600FF99660066330000FF996600FF99
      6600FF9966006633000000000000000000000000000066666600666666006666
      66003333330000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000800000000000000000000000
      000000000000FF000000FF00000000000000FF663300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006633
      0000000000000000000000000000000000000000000033333300333333003333
      3300333333003333330033333300333333003333330033333300333333003333
      3300333333003333330033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF663300FF663300FF663300FF66
      3300FF663300FF663300FF663300FF663300FF663300FF663300FF6633006633
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF663300FFFFFF00FF663300FFFF
      FF00FFFFFF0066330000FFFFFF00FF663300FFFFFF00FFFFFF00FFFFFF006633
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF663300FF663300FF663300FF66
      3300FF66330066330000FF663300FF663300CC333300CC333300FF6633006633
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000F83F000000000000
      F3DF000000000000E7FF000000000000E7FF000000000000E7E7000000000000
      00C30000000000008181000000000000C300000000000000E7E7000000000000
      FFE7000000000000FFE7000000000000FBCF000000000000FC1F000000000000
      FFFF000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
      8001CFC37FFFC0038001CF8B40FFC0038001CF1B4CFFC0038001CF3B7F79C003
      8001CE3B4FB900038001C47B4FD700038001C0FF77EF00038001C1FB7BD70003
      8001C8FF7DBB00038001CC7F7E7900038001CE3F7E79000F8001CF1F7FFF000F
      FFFFCF8F7FFF000FFFFFFFFFFFFF000F00000000000000000000000000000000
      000000000000}
  end
  object MainMenu1: TMainMenu
    Left = 196
    Top = 200
    object miClose: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = miCloseClick
    end
    object N2: TMenuItem
      Caption = #1055#1088#1080#1073#1086#1088#1099
      object miRefresh: TMenuItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        OnClick = miRefreshClick
      end
      object miSaveEdit: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1088#1072#1074#1082#1091
        OnClick = btnSaveInputDataClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1088#1080#1073#1086#1088
        ShortCut = 113
        OnClick = N9Click
      end
      object miCreateNew_Urovnemer: TMenuItem
        Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1091#1088#1086#1074#1085#1077#1084#1077#1088
        OnClick = miCreateNew_UrovnemerClick
      end
      object miCreateNew_rashodomer: TMenuItem
        Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1088#1072#1089#1093#1086#1076#1086#1084#1077#1088
        OnClick = miCreateNew_rashodomerClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object miCopyDevice: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1073#1086#1088
        OnClick = miCopyDeviceClick
      end
      object miCloneDevice: TMenuItem
        Caption = #1050#1083#1086#1085#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1073#1086#1088
        OnClick = miCloneDeviceClick
      end
      object miReplaceParent: TMenuItem
        Caption = #1047#1072#1084#1077#1089#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1087#1088#1080#1073#1086#1088#1077'-'#1088#1086#1076#1080#1090#1077#1083#1077
        OnClick = miReplaceParentClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object miLock: TMenuItem
        Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1073#1086#1088
        Hint = #1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1088#1080#1073#1086#1088#1072
        OnClick = miLockClick
      end
      object miUnlock: TMenuItem
        Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1073#1086#1088
        Hint = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1088#1080#1073#1086#1088#1072
        OnClick = miUnlockClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object miDeleteDevice: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1087#1088#1080#1073#1086#1088#1077' - '#1074#1086#1079#1084#1086#1078#1085#1086' '#1095#1077#1088#1077#1079' '#1089#1087#1080#1089#1086#1082' '#1087#1088#1080#1073#1086#1088#1086#1074
        Enabled = False
        OnClick = miDeleteDeviceClick
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object N14: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1072#1088#1093#1080#1074
        ShortCut = 121
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #1057#1082#1088#1099#1090#1100' '#1072#1088#1093#1080#1074
        ShortCut = 122
        OnClick = N15Click
      end
      object N3: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1072#1090#1088#1080#1073#1091#1090#1099
        ShortCut = 123
        OnClick = N3Click
      end
    end
    object N16: TMenuItem
      Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      object N17: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100
        ShortCut = 114
        OnClick = N17Click
      end
      object N18: TMenuItem
        Caption = #1058#1072#1073#1083#1080#1094#1072' '#1079#1085#1072#1095#1077#1085#1080#1081
        ShortCut = 116
        OnClick = N18Click
      end
      object N19: TMenuItem
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '
        ShortCut = 118
        OnClick = N19Click
      end
    end
    object N24: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
      OnClick = N24Click
    end
  end
  object q_devices: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterDelete = q_devicesAfterDelete
    AfterOpen = q_devicesAfterOpen
    AfterPost = q_devicesAfterPost
    AfterScroll = q_devicesAfterScroll
    BeforeClose = q_devicesBeforeClose
    BeforePost = q_devicesBeforePost
    BeforeScroll = q_devicesBeforeScroll
    OnCalcFields = q_devicesCalcFields
    SQL.Strings = (
      'select '
      'D.ID,'
      '         D.NAME,'
      '         D.DEVICENUMBER,'
      '         D.TYPEDEVICE_ID,'
      '         D.CREATE_DATE,'
      '         D.SALE_DATE,'
      '         D.CUSTOMER,'
      '         D.DESCR,'
      '         D.ID_CONVERTER,'
      '         D.LOCKED,'
      '         D.RECORD_DATE,'
      '         D.DEVICE_PARENT_ID,'
      '         D.PARAMS_ARE_BAD,'
      '         D.COMPOSITION_CURRENT,'
      '         D.COMPOSITION_RS,'
      '         D.COMPOSITION_LEVEL,'
      '         D.COMPOSITION_IR_PORT,'
      '         D.COMPOSITION_DEVICETYPE,'
      '         D.COMPOSITION_IMP_OUT,'
      '         D.NEED_RECALC,'
      '         D.NEED_TBL,'
      '         D.ADDITIVE_SHIFT,'
      '         coalesce(D.L_0,0) as L_0,'
      
        '        DT.name as devicetypename, c.name as convertername, c.ta' +
        'ble_code,'
      'dt.calcmode, dt.vt_x_unit, dt.vt_x_name, dt.vt_x_shortname,'
      'dt.vt_y_unit, dt.vt_y_name, dt.vt_y_shortname,'
      'coalesce(d.need_recalc,0) as needrecalc,'
      'coalesce(d.need_tbl,0) as needtbl,'
      
        'dt.formula, (select deviceNumber from Devices where id   = d.dev' +
        'ice_parent_id) as ParentDeviceNumber'
      'from devices D'
      ' left join deviceTypes DT on DT.ID = d.typedevice_id'
      '  left join converters c  on   c.id = d.id_converter'
      'where  D.Typedevice_id=9'
      'order by d.deviceNumber desc')
    UpdateObject = updateDevice
    Left = 64
    Top = 386
    object q_devicesID: TIntegerField
      FieldName = 'ID'
      Origin = '"DEVICES"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_devicesNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"DEVICES"."NAME"'
      OnGetText = q_devicesNAMEGetText
      Size = 48
    end
    object q_devicesDEVICENUMBER: TIBStringField
      FieldName = 'DEVICENUMBER'
      Origin = '"DEVICES"."DEVICENUMBER"'
      Size = 16
    end
    object q_devicesTYPEDEVICE_ID: TIntegerField
      FieldName = 'TYPEDEVICE_ID'
      Origin = '"DEVICES"."TYPEDEVICE_ID"'
    end
    object q_devicesCREATE_DATE: TDateField
      FieldName = 'CREATE_DATE'
      Origin = '"DEVICES"."CREATE_DATE"'
    end
    object q_devicesSALE_DATE: TDateField
      FieldName = 'SALE_DATE'
      Origin = '"DEVICES"."SALE_DATE"'
    end
    object q_devicesCUSTOMER: TIBStringField
      FieldName = 'CUSTOMER'
      Origin = '"DEVICES"."CUSTOMER"'
      Size = 128
    end
    object q_devicesDESCR: TIBStringField
      FieldName = 'DESCR'
      Origin = '"DEVICES"."DESCR"'
      Size = 1024
    end
    object q_devicesID_CONVERTER: TIntegerField
      FieldName = 'ID_CONVERTER'
      Origin = '"DEVICES"."ID_CONVERTER"'
    end
    object q_devicesLOCKED: TSmallintField
      FieldName = 'LOCKED'
      Origin = '"DEVICES"."LOCKED"'
    end
    object q_devicesDEVICETYPENAME: TIBStringField
      FieldName = 'DEVICETYPENAME'
      Origin = '"DEVICETYPES"."NAME"'
      Size = 128
    end
    object q_devicesCONVERTERNAME: TIBStringField
      FieldName = 'CONVERTERNAME'
      Origin = '"CONVERTERS"."NAME"'
      Size = 64
    end
    object q_devicesCALCMODE: TIBStringField
      FieldName = 'CALCMODE'
      Origin = '"DEVICETYPES"."CALCMODE"'
      Size = 16
    end
    object q_devicesVT_X_UNIT: TIBStringField
      FieldName = 'VT_X_UNIT'
      Origin = '"DEVICETYPES"."VT_X_UNIT"'
      Size = 16
    end
    object q_devicesVT_X_NAME: TIBStringField
      FieldName = 'VT_X_NAME'
      Origin = '"DEVICETYPES"."VT_X_NAME"'
      Size = 64
    end
    object q_devicesVT_X_SHORTNAME: TIBStringField
      FieldName = 'VT_X_SHORTNAME'
      Origin = '"DEVICETYPES"."VT_X_SHORTNAME"'
      Size = 16
    end
    object q_devicesVT_Y_UNIT: TIBStringField
      FieldName = 'VT_Y_UNIT'
      Origin = '"DEVICETYPES"."VT_Y_UNIT"'
      Size = 16
    end
    object q_devicesVT_Y_NAME: TIBStringField
      FieldName = 'VT_Y_NAME'
      Origin = '"DEVICETYPES"."VT_Y_NAME"'
      Size = 64
    end
    object q_devicesVT_Y_SHORTNAME: TIBStringField
      FieldName = 'VT_Y_SHORTNAME'
      Origin = '"DEVICETYPES"."VT_Y_SHORTNAME"'
      Size = 16
    end
    object q_devicesFORMULA: TIBStringField
      FieldName = 'FORMULA'
      Origin = '"DEVICETYPES"."FORMULA"'
      Size = 1024
    end
    object q_devicesDEVICE_PARENT_ID: TIntegerField
      FieldName = 'DEVICE_PARENT_ID'
      Origin = 'DEVICES.DEVICE_PARENT_ID'
    end
    object q_devicesPARENTDEVICENUMBER: TIBStringField
      FieldName = 'PARENTDEVICENUMBER'
      Size = 16
    end
    object q_devicesPARAMS_ARE_BAD: TSmallintField
      FieldName = 'PARAMS_ARE_BAD'
      Origin = 'DEVICES.PARAMS_ARE_BAD'
      OnGetText = q_devicesPARAMS_ARE_BADGetText
    end
    object q_devicesCOMPOSITION_CURRENT: TSmallintField
      FieldName = 'COMPOSITION_CURRENT'
      Origin = 'DEVICES.COMPOSITION_CURRENT'
    end
    object q_devicesCOMPOSITION_RS: TSmallintField
      FieldName = 'COMPOSITION_RS'
      Origin = 'DEVICES.COMPOSITION_RS'
    end
    object q_devicesCOMPOSITION_LEVEL: TSmallintField
      FieldName = 'COMPOSITION_LEVEL'
      Origin = 'DEVICES.COMPOSITION_LEVEL'
    end
    object q_devicesCOMPOSITION_IR_PORT: TSmallintField
      FieldName = 'COMPOSITION_IR_PORT'
      Origin = 'DEVICES.COMPOSITION_IR_PORT'
    end
    object q_devicesCOMPOSITION_DEVICETYPE: TSmallintField
      FieldName = 'COMPOSITION_DEVICETYPE'
      Origin = 'DEVICES.COMPOSITION_DEVICETYPE'
      OnGetText = q_devicesCOMPOSITION_DEVICETYPEGetText
    end
    object q_devicesCOMPOSITION_IMP_OUT: TSmallintField
      FieldName = 'COMPOSITION_IMP_OUT'
      Origin = 'DEVICES.COMPOSITION_IMP_OUT'
    end
    object q_devicesTABLE_CODE: TSmallintField
      FieldName = 'TABLE_CODE'
      Origin = 'CONVERTERS.TABLE_CODE'
    end
    object q_devicestblfile: TStringField
      FieldKind = fkCalculated
      FieldName = 'tblfile'
      Size = 32
      Calculated = True
    end
    object q_devicesRECORD_DATE: TDateTimeField
      FieldName = 'RECORD_DATE'
      Origin = 'DEVICES.RECORD_DATE'
    end
    object q_devicesNEED_RECALC: TSmallintField
      FieldName = 'NEED_RECALC'
      Origin = '"DEVICES"."NEED_RECALC"'
    end
    object q_devicesNEED_TBL: TSmallintField
      FieldName = 'NEED_TBL'
      Origin = '"DEVICES"."NEED_TBL"'
    end
    object fltfld_devicesADDITIVE_SHIFT: TFloatField
      FieldName = 'ADDITIVE_SHIFT'
      Origin = '"DEVICES"."ADDITIVE_SHIFT"'
      DisplayFormat = '0.00'
    end
    object q_devicesL_0: TFloatField
      FieldName = 'L_0'
      Origin = '"DEVICES"."L_0"'
    end
  end
  object updateDevice: TIBUpdateSQL
    RefreshSQL.Strings = (
      
        'select d.*, DT.name as devicetypename, c.name as convertername, ' +
        'c.table_code,'
      'dt.calcmode, dt.vt_x_unit, dt.vt_x_name, dt.vt_x_shortname,'
      'dt.vt_y_unit, dt.vt_y_name, dt.vt_y_shortname,'
      'coalesce(d.need_recalc,0) as needrecalc,'
      'coalesce(d.need_tbl,0) as needtbl,'
      
        'dt.formula, (select deviceNumber from Devices where id   = d.dev' +
        'ice_parent_id) as ParentDeviceNumber'
      'from devices D'
      ' left join deviceTypes DT on DT.ID = d.typedevice_id'
      '  left join converters c  on   c.id = d.id_converter'
      'where  d.ID= :ID'
      'order by d.deviceNumber desc')
    ModifySQL.Strings = (
      'update  devices   set'
      ' name =:name,'
      ' descr = :descr,'
      ' devicenumber = :devicenumber,'
      ' create_date = :Create_Date,'
      ' sale_date = :sale_date,'
      ' customer = :customer,'
      ' id_converter = :id_converter,'
      ' typedevice_id = :Typedevice_id,'
      ' locked = :locked,'
      ' params_are_bad = :params_are_bad,'
      ' Composition_Level = :Composition_Level,'
      ' Composition_Current =:Composition_Current,'
      ' Composition_RS = :Composition_RS,'
      ' Composition_DEVICETYPE = :Composition_DEVICETYPE,'
      ' Composition_IMP_OUT =:Composition_IMP_OUT,'
      ' Composition_IR_PORT = :Composition_IR_PORT,'
      ' record_date = :Record_Date,'
      ' Need_Tbl = :Need_Tbl,'
      'Need_Recalc = :Need_Recalc,'
      'Additive_shift = :Additive_shift,'
      'L_0 = :L_0'
      'where id  = :ID')
    DeleteSQL.Strings = (
      'delete from devices '
      'where id  = :ID')
    Left = 166
    Top = 386
  end
  object ds_devices: TDataSource
    DataSet = q_devices
    OnDataChange = ds_devicesDataChange
    Left = 132
    Top = 452
  end
  object q_deviceparams: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterPost = q_deviceparamsAfterPost
    BeforePost = q_deviceparamsBeforePost
    DataSource = ds_devices
    SQL.Strings = (
      'select *  from deviceparams DPV,'
      'Parameters P'
      'where'
      'DPV.device_id = :ID'
      'and dpv.parameter_id = p.ID'
      ''
      'order by p.sorted'
      '')
    UpdateObject = updateDeviceParams
    Left = 455
    Top = 450
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object q_deviceparamsID: TIntegerField
      FieldName = 'ID'
      Origin = '"DEVICEPARAMS"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object q_deviceparamsDEVICE_ID: TIntegerField
      FieldName = 'DEVICE_ID'
      Origin = '"DEVICEPARAMS"."DEVICE_ID"'
      ReadOnly = True
    end
    object q_deviceparamsPARAMETER_ID: TIntegerField
      FieldName = 'PARAMETER_ID'
      Origin = '"DEVICEPARAMS"."PARAMETER_ID"'
      ReadOnly = True
    end
    object q_deviceparamsPARAM_VALUE: TFloatField
      FieldName = 'PARAM_VALUE'
      Origin = '"DEVICEPARAMS"."PARAM_VALUE"'
      OnGetText = q_deviceparamsPARAM_VALUEGetText
    end
    object q_deviceparamsNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"PARAMETERS"."NAME"'
      ReadOnly = True
      Required = True
      Size = 64
    end
    object q_deviceparamsUNIT: TIBStringField
      FieldName = 'UNIT'
      Origin = '"PARAMETERS"."UNIT"'
      ReadOnly = True
      Size = 16
    end
    object q_deviceparamsSHORTNAME: TIBStringField
      FieldName = 'SHORTNAME'
      Origin = '"PARAMETERS"."SHORTNAME"'
      ReadOnly = True
      Size = 8
    end
    object q_deviceparamsCHANGEABLE: TSmallintField
      FieldName = 'CHANGEABLE'
      Origin = '"PARAMETERS"."CHANGEABLE"'
      ReadOnly = True
    end
    object q_deviceparamsFORMAT: TIBStringField
      FieldName = 'FORMAT'
      Origin = '"PARAMETERS"."FORMAT"'
      ReadOnly = True
      Size = 16
    end
    object q_deviceparamsTYPEPARAM: TSmallintField
      FieldName = 'TYPEPARAM'
      Origin = '"PARAMETERS"."TYPEPARAM"'
      ReadOnly = True
    end
    object q_deviceparamsDISPLAYNAME: TIBStringField
      FieldName = 'DISPLAYNAME'
      Origin = 'PARAMETERS.DISPLAYNAME'
      ReadOnly = True
      Size = 8
    end
  end
  object ds_deviceparams: TDataSource
    DataSet = q_deviceparams
    OnDataChange = ds_deviceparamsDataChange
    Left = 447
    Top = 528
  end
  object updateDeviceParams: TIBUpdateSQL
    ModifySQL.Strings = (
      'update deviceparams set'
      ' param_value=:param_value'
      'where'
      ' id = :id')
    Left = 337
    Top = 148
  end
  object update_QH: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select *  from QH'
      'where'
      'QH.ID = :ID ')
    ModifySQL.Strings = (
      'update QH set'
      ' X_Value =:X_value,'
      ' Y_Value = :Y_Value,'
      ' Y_procent = :Y_procent,'
      ' X_Procent = :X_procent,'
      ' T_counter = :T_Counter'
      'where'
      ' id = :id')
    Left = 287
    Top = 558
  end
  object q_QH: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterPost = q_QHAfterPost
    BeforePost = q_QHBeforePost
    DataSource = ds_devices
    SQL.Strings = (
      'select *  from QH'
      'where'
      'QH.device_id = :ID'
      'order by QH.i'
      '')
    UpdateObject = update_QH
    Left = 621
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Size = 4
      end>
    object q_QHID: TIntegerField
      FieldName = 'ID'
      Origin = '"QH"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_QHDEVICE_ID: TIntegerField
      FieldName = 'DEVICE_ID'
      Origin = '"QH"."DEVICE_ID"'
    end
    object q_QHX_VALUE: TFloatField
      FieldName = 'X_VALUE'
      Origin = '"QH"."X_VALUE"'
      OnGetText = q_QHX_VALUEGetText
      DisplayFormat = '0.000'
    end
    object q_QHY_VALUE: TFloatField
      FieldName = 'Y_VALUE'
      Origin = '"QH"."Y_VALUE"'
      OnGetText = q_QHY_VALUEGetText
      DisplayFormat = '0.000'
    end
    object q_QHI: TIntegerField
      FieldName = 'I'
      Origin = '"QH"."I"'
      Required = True
    end
    object q_QHT_COUNTER: TFloatField
      FieldName = 'T_COUNTER'
      Origin = 'QH.T_COUNTER'
      OnGetText = q_QHT_COUNTERGetText
      DisplayFormat = '0.00'
    end
    object q_QHX_PROCENT: TFloatField
      FieldName = 'X_PROCENT'
      Origin = 'QH.X_PROCENT'
      DisplayFormat = '0.0'
    end
    object q_QHY_PROCENT: TFloatField
      FieldName = 'Y_PROCENT'
      Origin = 'QH.Y_PROCENT'
      DisplayFormat = '0.00'
    end
  end
  object DS_QH: TDataSource
    DataSet = q_QH
    Left = 301
    Top = 68
  end
  object q_conditions: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    DataSource = ds_devices
    SQL.Strings = (
      'select * from conditions'
      'where typedevice_id =:Typedevice_ID')
    Left = 241
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TYPEDEVICE_ID'
        ParamType = ptUnknown
        Size = 4
      end>
    object q_conditionsID: TIntegerField
      FieldName = 'ID'
      Origin = '"CONDITIONS"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_conditionsTYPEDEVICE_ID: TIntegerField
      FieldName = 'TYPEDEVICE_ID'
      Origin = '"CONDITIONS"."TYPEDEVICE_ID"'
    end
    object q_conditionsCONDITION: TIBStringField
      FieldName = 'CONDITION'
      Origin = '"CONDITIONS"."CONDITION"'
      Size = 1024
    end
    object q_conditionsVARS: TIBStringField
      FieldName = 'VARS'
      Origin = '"CONDITIONS"."VARS"'
      Size = 128
    end
    object q_conditionsDISPLAYCONDITION: TIBStringField
      FieldName = 'DISPLAYCONDITION'
      Origin = 'CONDITIONS.DISPLAYCONDITION'
      Size = 1024
    end
  end
  object ds_conditions: TDataSource
    AutoEdit = False
    DataSet = q_conditions
    Left = 317
    Top = 316
  end
  object q_formulas: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    DataSource = ds_devices
    SQL.Strings = (
      'select * from formulas'
      'where typedevice_id =:Typedevice_ID')
    Left = 365
    Top = 322
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TYPEDEVICE_ID'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object ds_formulas: TDataSource
    AutoEdit = False
    DataSet = q_formulas
    Left = 543
    Top = 188
  end
  object SD: TSaveDialog
    DefaultExt = 'tbl'
    Filter = '*.tbl'
    Left = 841
    Top = 534
  end
  object GetQHMax: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    SQL.Strings = (
      'select *  from GetQHMax(:ID)'
      ''
      '')
    Left = 927
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Size = 4
      end>
    object GetQHMaxQMAX: TFloatField
      FieldName = 'QMAX'
      Origin = 'GETQHMAX.QMAX'
      DisplayFormat = '0.000'
    end
    object GetQHMaxHMAX: TFloatField
      FieldName = 'HMAX'
      Origin = 'GETQHMAX.HMAX'
      DisplayFormat = '0.00'
    end
  end
  object GOSTTABLE: TVirtualTable
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end>
    Left = 769
    Top = 416
    Data = {03000100020049440300000000000000000000000000}
    object GOSTTABLEX_VALUE: TFloatField
      FieldName = 'X_VALUE'
      DisplayFormat = '0.000'
    end
    object GOSTTABLEY_VALUE: TFloatField
      FieldName = 'Y_VALUE'
      DisplayFormat = '0.000'
    end
    object GOSTTABLET_COUNTER: TFloatField
      FieldName = 'T_COUNTER'
      OnGetText = GOSTTABLET_COUNTERGetText
      DisplayFormat = '0.000'
    end
    object GOSTTABLEX_PROCENT: TFloatField
      FieldName = 'X_PROCENT'
    end
    object GOSTTABLEY_PROCENT: TFloatField
      FieldName = 'Y_PROCENT'
    end
  end
  object xlProPackage1: TxlProPackage
    About = 
      'ProOptionPack'#8482' 1.2 (build 122-D7)   - Copyright '#169' Afalina Co., L' +
      'td.'
    Left = 337
    Top = 392
  end
  object ds_gosttable: TDataSource
    AutoEdit = False
    DataSet = GOSTTABLE
    Left = 757
    Top = 532
  end
  object q_deviceParam_RG: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterOpen = q_deviceParam_RGAfterOpen
    DataSource = ds_devices
    SQL.Strings = (
      'select *  from deviceparams DPV,'
      'Parameters P'
      'where'
      'DPV.device_id = :ID'
      'and dpv.parameter_id = p.ID'
      'and p.rg_param =1'
      'order by p.sorted'
      '')
    Left = 235
    Top = 146
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Origin = '"DEVICEPARAMS"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'DEVICE_ID'
      Origin = '"DEVICEPARAMS"."DEVICE_ID"'
    end
    object IntegerField3: TIntegerField
      FieldName = 'PARAMETER_ID'
      Origin = '"DEVICEPARAMS"."PARAMETER_ID"'
    end
    object FloatField1: TFloatField
      FieldName = 'PARAM_VALUE'
      Origin = '"DEVICEPARAMS"."PARAM_VALUE"'
    end
    object IBStringField1: TIBStringField
      FieldName = 'NAME'
      Origin = '"PARAMETERS"."NAME"'
      Required = True
      Size = 64
    end
    object IBStringField2: TIBStringField
      FieldName = 'UNIT'
      Origin = '"PARAMETERS"."UNIT"'
      Size = 16
    end
    object IBStringField3: TIBStringField
      FieldName = 'SHORTNAME'
      Origin = '"PARAMETERS"."SHORTNAME"'
      Size = 8
    end
    object SmallintField1: TSmallintField
      FieldName = 'CHANGEABLE'
      Origin = '"PARAMETERS"."CHANGEABLE"'
    end
    object IBStringField4: TIBStringField
      FieldName = 'FORMAT'
      Origin = '"PARAMETERS"."FORMAT"'
      Size = 16
    end
    object SmallintField2: TSmallintField
      FieldName = 'TYPEPARAM'
      Origin = '"PARAMETERS"."TYPEPARAM"'
    end
  end
  object ds_GetQHMax: TDataSource
    AutoEdit = False
    DataSet = GetQHMax
    Left = 683
    Top = 450
  end
  object q_QH_SortByX: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    SQL.Strings = (
      'select *  from QH'
      'where'
      'QH.device_id = :ID'
      'order by QH.x_Value'
      '')
    Left = 389
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Size = 4
      end>
    object IntegerField4: TIntegerField
      FieldName = 'ID'
      Origin = '"QH"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'DEVICE_ID'
      Origin = '"QH"."DEVICE_ID"'
    end
    object FloatField2: TFloatField
      FieldName = 'X_VALUE'
      Origin = '"QH"."X_VALUE"'
      OnGetText = q_QHX_VALUEGetText
      DisplayFormat = '0.000'
    end
    object FloatField3: TFloatField
      FieldName = 'Y_VALUE'
      Origin = '"QH"."Y_VALUE"'
      OnGetText = q_QHY_VALUEGetText
      DisplayFormat = '0.000'
    end
    object IntegerField6: TIntegerField
      FieldName = 'I'
      Origin = '"QH"."I"'
      Required = True
    end
    object FloatField4: TFloatField
      FieldName = 'T_COUNTER'
      Origin = 'QH.T_COUNTER'
      OnGetText = q_QHT_COUNTERGetText
      DisplayFormat = '0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'X_PROCENT'
      Origin = 'QH.X_PROCENT'
      DisplayFormat = '0.0'
    end
    object FloatField6: TFloatField
      FieldName = 'Y_PROCENT'
      Origin = 'QH.Y_PROCENT'
      DisplayFormat = '0.00'
    end
  end
  object VisiblePointsTable: TVirtualTable
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end>
    Left = 561
    Top = 120
    Data = {03000100020049440300000000000000000000000000}
    object FloatField7: TFloatField
      FieldName = 'X_VALUE'
      OnGetText = FloatField7GetText
      DisplayFormat = '0.000'
    end
    object FloatField8: TFloatField
      FieldName = 'Y_VALUE'
      OnGetText = FloatField8GetText
      DisplayFormat = '0.000'
    end
    object FloatField9: TFloatField
      FieldName = 'T_COUNTER'
      OnGetText = GOSTTABLET_COUNTERGetText
      DisplayFormat = '0.000'
    end
    object FloatField10: TFloatField
      FieldName = 'X_PROCENT'
      DisplayFormat = '0.000'
    end
    object FloatField11: TFloatField
      FieldName = 'Y_PROCENT'
      DisplayFormat = '0.000'
    end
    object VisiblePointsTableI: TIntegerField
      FieldName = 'I'
      DisplayFormat = '0'
    end
  end
  object ds_visiblepointsTable: TDataSource
    AutoEdit = False
    DataSet = VisiblePointsTable
    Left = 251
    Top = 218
  end
  object q_QH_Parent: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterPost = q_QHAfterPost
    BeforePost = q_QHBeforePost
    DataSource = ds_devices
    SQL.Strings = (
      'select *  from QH'
      'where'
      'QH.device_id = :device_parent_ID'
      'order by QH.i'
      '')
    Left = 285
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'device_parent_ID'
        ParamType = ptUnknown
      end>
    object FloatField12: TFloatField
      FieldName = 'X_VALUE'
      Origin = '"QH"."X_VALUE"'
      OnGetText = q_QHX_VALUEGetText
      DisplayFormat = '0.000'
    end
    object FloatField13: TFloatField
      FieldName = 'Y_VALUE'
      Origin = '"QH"."Y_VALUE"'
      OnGetText = q_QHY_VALUEGetText
      DisplayFormat = '0.000'
    end
  end
  object q_deviceparams_XLS: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterPost = q_deviceparamsAfterPost
    BeforePost = q_deviceparamsBeforePost
    SQL.Strings = (
      'select *  from deviceparams DPV,'
      'Parameters P'
      'where'
      'DPV.device_id = :ID'
      'and dpv.parameter_id = p.ID'
      'and p.NotVisible_in_XLS is null'
      ''
      'order by p.sorted'
      '')
    Left = 71
    Top = 490
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object IntegerField7: TIntegerField
      FieldName = 'ID'
      Origin = '"DEVICEPARAMS"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField8: TIntegerField
      FieldName = 'DEVICE_ID'
      Origin = '"DEVICEPARAMS"."DEVICE_ID"'
    end
    object IntegerField9: TIntegerField
      FieldName = 'PARAMETER_ID'
      Origin = '"DEVICEPARAMS"."PARAMETER_ID"'
    end
    object FloatField14: TFloatField
      FieldName = 'PARAM_VALUE'
      Origin = '"DEVICEPARAMS"."PARAM_VALUE"'
      OnGetText = FloatField14GetText
    end
    object IBStringField5: TIBStringField
      FieldName = 'NAME'
      Origin = '"PARAMETERS"."NAME"'
      Required = True
      Size = 64
    end
    object IBStringField6: TIBStringField
      FieldName = 'UNIT'
      Origin = '"PARAMETERS"."UNIT"'
      Size = 16
    end
    object IBStringField7: TIBStringField
      FieldName = 'SHORTNAME'
      Origin = '"PARAMETERS"."SHORTNAME"'
      Size = 8
    end
    object SmallintField3: TSmallintField
      FieldName = 'CHANGEABLE'
      Origin = '"PARAMETERS"."CHANGEABLE"'
    end
    object IBStringField8: TIBStringField
      FieldName = 'FORMAT'
      Origin = '"PARAMETERS"."FORMAT"'
      Size = 16
    end
    object SmallintField4: TSmallintField
      FieldName = 'TYPEPARAM'
      Origin = '"PARAMETERS"."TYPEPARAM"'
    end
    object IBStringField9: TIBStringField
      FieldName = 'DISPLAYNAME'
      Origin = 'PARAMETERS.DISPLAYNAME'
      Size = 8
    end
  end
  object pmMenu_QHGrid: TPopupMenu
    Left = 688
    Top = 229
    object pmAddPoint: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1095#1082#1091
      OnClick = pmAddPointClick
    end
    object pmDeletePoint: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1086#1095#1082#1091
      OnClick = pmDeletePointClick
    end
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'QH2010'
    WriteAsText = False
    Left = 1083
    Top = 309
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'PARAMGRID'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      'DevicesPanel.<P>.Width'
      'DevicesPanel.GridFrame.Grid.<P>.Columns'
      'ParamPanel.pcInputValues.tsParamGrid.ParamGrid.<P>.Columns')
    Left = 963
    Top = 301
  end
end
