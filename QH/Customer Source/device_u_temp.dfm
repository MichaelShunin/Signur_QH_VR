object Device_Form: TDevice_Form
  Left = 43
  Top = 87
  Width = 968
  Height = 571
  Caption = #1055#1088#1080#1073#1086#1088#1099' '#1080' '#1080#1093' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 293
    Top = 0
    Height = 506
    Align = alRight
    Color = clMedGray
    ParentColor = False
  end
  object DevicesPanel: TPanel
    Left = 0
    Top = 0
    Width = 293
    Height = 506
    Align = alClient
    Constraints.MinWidth = 50
    TabOrder = 0
    inline DbGridFrame1: TDbGridFrame
      Left = 1
      Top = 1
      Width = 291
      Height = 504
      Align = alClient
      AutoScroll = False
      TabOrder = 0
      inherited Grid: TDBGridEh
        Left = 198
        Width = 93
        Height = 504
        AutoFitColWidths = False
        DataSource = ds_devices
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OnGetCellParams = DbGridFrame1GridGetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 86
          end
          item
            EditButtons = <>
            FieldName = 'DEVICENUMBER'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1085#1086#1084#1077#1088
            Width = 71
          end
          item
            EditButtons = <>
            FieldName = 'DEVICETYPENAME'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1090#1080#1087' '#1074#1086#1076#1086#1074#1086#1076#1072
            Width = 115
          end
          item
            EditButtons = <>
            FieldName = 'CONVERTERNAME'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1072#1082#1091#1089#1090#1080#1095'. '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1077#1083#1100
            Width = 103
          end
          item
            DisplayFormat = 'dd.mm.yy'
            EditButtons = <>
            FieldName = 'CREATE_DATE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1076#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
            Width = 112
          end
          item
            DisplayFormat = 'dd.mm.yy'
            EditButtons = <>
            FieldName = 'SALE_DATE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1076#1072#1090#1072' '#1087#1088#1086#1076#1072#1078#1080
            Width = 133
          end
          item
            EditButtons = <>
            FieldName = 'CUSTOMER'
            Footers = <>
            Title.Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
            Width = 133
          end>
        inherited ToolBtn: TSpeedButton
          Width = 25
          Height = 25
        end
      end
      inherited ToolPanel: TPanel
        Width = 198
        Height = 504
        inherited Label1: TLabel
          Left = 15
          Top = 138
        end
        inherited Label2: TLabel
          Left = 5
          Top = 30
          Width = 51
          Height = 16
          Font.Height = -15
        end
        inherited Label3: TLabel
          Left = 15
          Top = 236
        end
        inherited SimilarityLabel: TLabel
          Left = 15
          Top = 286
        end
        inherited Bevel: TBevel
          Left = 193
          Top = 23
          Width = 5
          Height = 481
        end
        inherited Label4: TLabel
          Left = 5
          Top = 113
          Width = 145
          Height = 16
          Font.Height = -15
        end
        inherited Label5: TLabel
          Left = 15
          Top = 187
        end
        inherited FieldCombo: TDBComboBoxEh
          Left = 15
          Top = 158
          Width = 178
        end
        inherited ValueEdit: TDBEditEh
          Left = 15
          Top = 49
          Width = 149
        end
        inherited SearchCombo: TDBComboBoxEh
          Left = 15
          Top = 256
          Width = 178
        end
        inherited SimilarityTrack: TTrackBar
          Left = 10
          Top = 303
          Width = 186
          Height = 40
        end
        inherited FilterCheck: TCheckBox
          Left = 15
          Top = 84
          Width = 168
          Height = 21
        end
        inherited Panel1: TPanel
          Width = 198
          Height = 23
          Font.Height = -15
          inherited btnSearchClose: TSpeedButton
            Left = 179
            Width = 19
            Height = 20
          end
        end
        inherited SearchDirectionCompo: TDBComboBoxEh
          Left = 15
          Top = 207
          Width = 178
        end
        inherited ToolBar1: TToolBar
          Left = 162
        end
        inherited ValueEdit2: TDBEditEh
          Left = 98
          Top = 49
          Width = 78
        end
      end
      inherited TaxxiFrameAgent: TTaxxiFrameAgent
        inherited TaxxiDBEditEhAgent1: TTaxxiDBEditEhAgent [0]
        end
      end
      inherited PopupMenu: TPopupMenu
        Left = 178
        Top = 70
        object miDeleteCalculation: TMenuItem [0]
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1089#1095#1077#1090
          GroupIndex = 200
        end
        object N1: TMenuItem [1]
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
    end
  end
  object ParamPanel: TPanel
    Left = 296
    Top = 0
    Width = 664
    Height = 506
    Align = alRight
    Caption = 'ParamPanel'
    Constraints.MinWidth = 30
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 662
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080' '#1087#1088#1080#1073#1086#1088#1072' '#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1088#1072#1089#1095#1077#1090#1072
      Color = 8454143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      OnDblClick = Label1DblClick
    end
    object pcInputValues: TPageControl
      Left = 1
      Top = 17
      Width = 662
      Height = 436
      ActivePage = tsParamGrid
      Align = alClient
      Images = ImageList1
      TabOrder = 0
      object tsDeviceAttribute: TTabSheet
        Caption = #1040#1090#1088#1080#1073#1091#1090#1099' '#1087#1088#1080#1073#1086#1088#1072
        DesignSize = (
          654
          405)
        object Label3: TLabel
          Left = 68
          Top = 202
          Width = 68
          Height = 16
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
        end
        object Label2: TLabel
          Left = 34
          Top = 10
          Width = 102
          Height = 16
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        end
        object Label4: TLabel
          Left = 31
          Top = 42
          Width = 105
          Height = 16
          Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072':'
        end
        object Label5: TLabel
          Left = 54
          Top = 136
          Width = 82
          Height = 16
          Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
        end
        object Label6: TLabel
          Left = 41
          Top = 68
          Width = 95
          Height = 16
          Caption = #1058#1080#1087' '#1074#1086#1076#1086#1074#1086#1076#1072':'
        end
        object Label7: TLabel
          Left = 15
          Top = 90
          Width = 121
          Height = 32
          Caption = #1040#1082#1091#1089#1090#1080#1095#1077#1089#1082#1080#1081' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1077#1083#1100':'
          WordWrap = True
        end
        object Label8: TLabel
          Left = 43
          Top = 169
          Width = 93
          Height = 16
          Caption = #1044#1072#1090#1072' '#1074#1099#1087#1091#1089#1082#1072':'
        end
        object Label9: TLabel
          Left = 281
          Top = 169
          Width = 95
          Height = 16
          Caption = #1044#1072#1090#1072' '#1087#1088#1086#1076#1072#1078#1080':'
        end
        object edDescr: TDBMemo
          Left = 144
          Top = 199
          Width = 502
          Height = 197
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataField = 'DESCR'
          DataSource = ds_devices
          MaxLength = 1023
          TabOrder = 0
        end
        object edName: TDBEdit
          Left = 144
          Top = 5
          Width = 502
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'NAME'
          DataSource = ds_devices
          TabOrder = 1
        end
        object edDeviceNumber: TDBEdit
          Left = 144
          Top = 37
          Width = 255
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          DataField = 'DEVICENUMBER'
          DataSource = ds_devices
          TabOrder = 2
        end
        object edCustomer: TDBEdit
          Left = 144
          Top = 131
          Width = 502
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'CUSTOMER'
          DataSource = ds_devices
          TabOrder = 3
        end
        object edCreate_date: TDBDateTimeEditEh
          Left = 144
          Top = 166
          Width = 119
          Height = 22
          DataField = 'CREATE_DATE'
          DataSource = ds_devices
          EditButtons = <>
          Flat = True
          TabOrder = 4
          Visible = True
          EditFormat = 'DD.MM.YY'
        end
        object edSale_Date: TDBDateTimeEditEh
          Left = 390
          Top = 166
          Width = 119
          Height = 22
          DataField = 'SALE_DATE'
          DataSource = ds_devices
          EditButtons = <>
          Flat = True
          TabOrder = 5
          Visible = True
          EditFormat = 'DD.MM.YY'
        end
        object cbTypeDevice: TComboBox
          Left = 144
          Top = 65
          Width = 502
          Height = 24
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          ItemHeight = 0
          TabOrder = 6
          OnCloseUp = cbTypeDeviceCloseUp
        end
        object cbConverter: TComboBox
          Left = 144
          Top = 98
          Width = 502
          Height = 24
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 0
          TabOrder = 7
          OnCloseUp = cbConverterCloseUp
        end
      end
      object tsParamGrid: TTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1088#1080#1073#1086#1088#1072' '#1080' '#1074#1086#1076#1086#1074#1086#1076#1072
        ImageIndex = 1
        object Splitter2: TSplitter
          Left = 0
          Top = 326
          Width = 654
          Height = 4
          Cursor = crVSplit
          Align = alBottom
        end
        object ParamGrid: TDBGridEh
          Left = 0
          Top = 92
          Width = 654
          Height = 234
          Align = alClient
          AutoFitColWidths = True
          DataSource = ds_deviceparams
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnCellClick = ParamGridCellClick
          OnGetCellParams = ParamGridGetCellParams
          OnKeyDown = ParamGridKeyDown
          Columns = <
            item
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088'|'#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 297
            end
            item
              Alignment = taCenter
              EditButtons = <>
              FieldName = 'SHORTNAME'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088'|..'
              Width = 82
            end
            item
              Alignment = taCenter
              EditButtons = <>
              FieldName = 'UNIT'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088'|'#1077#1076'. '#1080#1079#1084
              Width = 63
            end
            item
              EditButtons = <>
              FieldName = 'PARAM_VALUE'
              Footers = <>
              Title.Caption = #1079#1085#1072#1095#1077#1085#1080#1077
              Width = 79
            end>
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 654
          Height = 20
          Align = alTop
          TabOrder = 1
          object DBText1: TDBText
            Left = 268
            Top = 1
            Width = 241
            Height = 18
            Align = alLeft
            Color = 16776176
            DataField = 'DEVICENUMBER'
            DataSource = ds_devices
            ParentColor = False
          end
          object DBText2: TDBText
            Left = 1
            Top = 1
            Width = 241
            Height = 18
            Align = alLeft
            Color = 16776176
            DataField = 'NAME'
            DataSource = ds_devices
            ParentColor = False
          end
          object Label10: TLabel
            Left = 242
            Top = 1
            Width = 26
            Height = 18
            Align = alLeft
            Caption = '   '#8470' '
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 20
          Width = 654
          Height = 72
          Align = alTop
          TabOrder = 2
          object DBText5: TDBText
            Left = 284
            Top = 12
            Width = 149
            Height = 18
            Alignment = taCenter
            Color = clSilver
            DataField = 'CALCMODE'
            DataSource = ds_devices
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object btnProcessing: TBitBtn
            Left = 8
            Top = 8
            Width = 225
            Height = 25
            Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1091
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
            Top = 40
            Width = 652
            Height = 31
            Align = alBottom
            Color = 16776176
            DataField = 'FORMULA'
            DataSource = ds_devices
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 330
          Width = 654
          Height = 75
          Align = alBottom
          AutoFitColWidths = True
          Color = 16776176
          DataSource = ds_conditions
          FixedColor = 10930928
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              EditButtons = <>
              FieldName = 'CONDITION'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1059#1089#1083#1086#1074#1080#1103' '#1082#1086#1088#1088#1077#1082#1090#1085#1086#1089#1090#1080' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
              Width = 542
            end>
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072' Q(h)'
        ImageIndex = 2
        object PageControl1: TPageControl
          Left = 0
          Top = 20
          Width = 654
          Height = 385
          ActivePage = tsQH
          Align = alClient
          MultiLine = True
          TabOrder = 0
          TabPosition = tpLeft
          OnChange = PageControl1Change
          object tsQH: TTabSheet
            Caption = #1058#1072#1073#1083#1080#1094#1072
            object QHGrid: TDBGridEh
              Left = 0
              Top = 0
              Width = 626
              Height = 336
              Align = alClient
              AutoFitColWidths = True
              DataSource = DS_QH
              Flat = True
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -13
              FooterFont.Name = 'MS Sans Serif'
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              UseMultiTitle = True
              Columns = <
                item
                  Alignment = taCenter
                  Color = clSilver
                  EditButtons = <>
                  FieldName = 'I'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #8470' '#1087#1087
                  Width = 58
                end
                item
                  DisplayFormat = '0.00'
                  EditButtons = <>
                  FieldName = 'X_VALUE'
                  Footers = <>
                  Title.Caption = 'X_Value'
                  Width = 166
                end
                item
                  DisplayFormat = '0.00'
                  EditButtons = <>
                  FieldName = 'Y_VALUE'
                  Footers = <>
                  Title.Caption = 'Y_Value'
                  Width = 162
                end>
            end
            object Panel5: TPanel
              Left = 0
              Top = 336
              Width = 626
              Height = 29
              Align = alBottom
              TabOrder = 1
            end
          end
          object TabSheet5: TTabSheet
            Caption = #1043#1088#1072#1092#1080#1082
            ImageIndex = 1
            object Chart: TDBChart
              Left = 0
              Top = 0
              Width = 626
              Height = 365
              AutoRefresh = False
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Gradient.EndColor = 16777160
              Gradient.Visible = True
              Title.Text.Strings = (
                '')
              Title.Visible = False
              BottomAxis.ExactDateTime = False
              BottomAxis.Increment = 0.100000000000000000
              BottomAxis.Title.Caption = #1091#1088#1086#1074#1077#1085#1100', '#1084
              LeftAxis.Title.Caption = #1088#1072#1089#1093#1086#1076
              View3D = False
              Align = alClient
              TabOrder = 0
              object Series1: TLineSeries
                Marks.ArrowLength = 8
                Marks.Visible = False
                DataSource = q_QH
                SeriesColor = clRed
                ShowInLegend = False
                InvertedStairs = True
                Pointer.HorizSize = 2
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
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
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 654
          Height = 20
          Align = alTop
          TabOrder = 1
          object DBText3: TDBText
            Left = 268
            Top = 1
            Width = 241
            Height = 18
            Align = alLeft
            Color = 16776176
            DataField = 'DEVICENUMBER'
            DataSource = ds_devices
            ParentColor = False
          end
          object DBText4: TDBText
            Left = 1
            Top = 1
            Width = 241
            Height = 18
            Align = alLeft
            Color = 16776176
            DataField = 'NAME'
            DataSource = ds_devices
            ParentColor = False
          end
          object Label11: TLabel
            Left = 242
            Top = 1
            Width = 26
            Height = 16
            Align = alLeft
            Caption = '   '#8470' '
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 453
      Width = 662
      Height = 52
      Align = alBottom
      TabOrder = 1
      object btnSaveInputData: TBitBtn
        Left = 17
        Top = 12
        Width = 168
        Height = 31
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 0
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
        Left = 199
        Top = 12
        Width = 154
        Height = 31
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1086#1090#1095#1077#1090
        TabOrder = 1
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
        Left = 367
        Top = 12
        Width = 178
        Height = 31
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' HEX-'#1092#1072#1081#1083
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
    Left = 329
    Top = 191
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
      object N3: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1087#1088#1080#1073#1086#1088#1077
        OnClick = N3Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N6: TMenuItem
        Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1087#1088#1080#1073#1086#1088#1077
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1087#1080#1089#1080' '#1086' '#1087#1088#1080#1073#1086#1088#1077
        OnClick = N7Click
      end
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
    BeforeScroll = q_devicesBeforeScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select d.*, DT.name as devicetypename, c.name as convertername,'
      'dt.calcmode, dt.vt_x_unit, dt.vt_x_name, dt.vt_x_shortname,'
      'dt.vt_y_unit, dt.vt_y_name, dt.vt_y_shortname,'
      'dt.formula'
      ''
      ' from devices D, deviceTypes DT, converters c'
      'where '
      'DT.ID = d.typedevice_id and'
      'c.id = d.id_converter'
      'order by d.create_date')
    UpdateObject = updateDevice
    Left = 56
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
      Size = 48
    end
    object q_devicesDEVICENUMBER: TIBStringField
      FieldName = 'DEVICENUMBER'
      Origin = '"DEVICES"."DEVICENUMBER"'
      Required = True
      Size = 16
    end
    object q_devicesTYPEDEVICE_ID: TIntegerField
      FieldName = 'TYPEDEVICE_ID'
      Origin = '"DEVICES"."TYPEDEVICE_ID"'
      Required = True
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
      Required = True
      Size = 128
    end
    object q_devicesCONVERTERNAME: TIBStringField
      FieldName = 'CONVERTERNAME'
      Origin = '"CONVERTERS"."NAME"'
      Required = True
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
  end
  object updateDevice: TIBUpdateSQL
    ModifySQL.Strings = (
      'update  devices   set'
      ' name =:name,'
      ' descr = :descr,'
      ' devicenumber = :devicenumber,'
      ' create_date = :Create_Date,'
      ' sale_date = :sale_date,'
      ' customer = :customer,'
      ' id_converter = :id_converter,'
      'typedevice_id = :Typedevice_id,'
      'locked = :locked'
      'where id  = :ID')
    DeleteSQL.Strings = (
      'delete from devices '
      'where id  = :ID')
    Left = 158
    Top = 386
  end
  object ds_devices: TDataSource
    DataSet = q_devices
    Left = 156
    Top = 308
  end
  object q_deviceparams: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterPost = q_deviceparamsAfterPost
    BeforePost = q_deviceparamsBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_devices
    SQL.Strings = (
      'select *  from deviceparams DPV,'
      'Parameters P'
      'where'
      'DPV.device_id = :ID'
      'and dpv.parameter_id = p.ID'
      'order by p.sorted'
      '')
    UpdateObject = updateDeviceParams
    Left = 453
    Top = 226
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
      Required = True
    end
    object q_deviceparamsDEVICE_ID: TIntegerField
      FieldName = 'DEVICE_ID'
      Origin = '"DEVICEPARAMS"."DEVICE_ID"'
    end
    object q_deviceparamsPARAMETER_ID: TIntegerField
      FieldName = 'PARAMETER_ID'
      Origin = '"DEVICEPARAMS"."PARAMETER_ID"'
    end
    object q_deviceparamsPARAM_VALUE: TFloatField
      FieldName = 'PARAM_VALUE'
      Origin = '"DEVICEPARAMS"."PARAM_VALUE"'
    end
    object q_deviceparamsNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"PARAMETERS"."NAME"'
      Required = True
      Size = 64
    end
    object q_deviceparamsUNIT: TIBStringField
      FieldName = 'UNIT'
      Origin = '"PARAMETERS"."UNIT"'
      Size = 16
    end
    object q_deviceparamsSHORTNAME: TIBStringField
      FieldName = 'SHORTNAME'
      Origin = '"PARAMETERS"."SHORTNAME"'
      Size = 8
    end
    object q_deviceparamsCHANGEABLE: TSmallintField
      FieldName = 'CHANGEABLE'
      Origin = '"PARAMETERS"."CHANGEABLE"'
    end
    object q_deviceparamsFORMAT: TIBStringField
      FieldName = 'FORMAT'
      Origin = '"PARAMETERS"."FORMAT"'
      Size = 16
    end
    object q_deviceparamsTYPEPARAM: TSmallintField
      FieldName = 'TYPEPARAM'
      Origin = '"PARAMETERS"."TYPEPARAM"'
    end
  end
  object ds_deviceparams: TDataSource
    DataSet = q_deviceparams
    Left = 623
    Top = 242
  end
  object updateDeviceParams: TIBUpdateSQL
    ModifySQL.Strings = (
      'update deviceparams set'
      ' param_value=:param_value'
      'where'
      ' id = :id')
    Left = 377
    Top = 252
  end
  object update_QH: TIBUpdateSQL
    ModifySQL.Strings = (
      'update QH set'
      ' X_Value =:X_value,'
      ' Y_Value = :Y_Value'
      'where'
      ' id = :id')
    Left = 761
    Top = 180
  end
  object q_QH: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterPost = q_QHAfterPost
    BeforePost = q_QHBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_devices
    SQL.Strings = (
      'select *  from QH'
      'where'
      'QH.device_id = :ID'
      'order by QH.i'
      '')
    UpdateObject = update_QH
    Left = 661
    Top = 234
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
    end
    object q_QHY_VALUE: TFloatField
      FieldName = 'Y_VALUE'
      Origin = '"QH"."Y_VALUE"'
    end
    object q_QHI: TIntegerField
      FieldName = 'I'
      Origin = '"QH"."I"'
      Required = True
    end
  end
  object DS_QH: TDataSource
    DataSet = q_QH
    Left = 727
    Top = 226
  end
  object q_conditions: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_devices
    SQL.Strings = (
      'select * from conditions'
      'where typedevice_id =:Typedevice_ID')
    Left = 273
    Top = 316
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Typedevice_ID'
        ParamType = ptUnknown
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
  end
  object ds_conditions: TDataSource
    AutoEdit = False
    DataSet = q_conditions
    Left = 317
    Top = 316
  end
end
