object Devices_Form: TDevices_Form
  Left = 27
  Top = 98
  Width = 1081
  Height = 580
  Caption = #1040#1090#1088#1080#1073#1091#1090#1099' '#1080' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1088#1080#1073#1086#1088#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 409
    Top = 0
    Height = 515
    Color = clMedGray
    ParentColor = False
  end
  object CalcsPanel: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 515
    Align = alLeft
    TabOrder = 0
    inline DbGridFrame1: TDbGridFrame
      Left = 1
      Top = 1
      Width = 407
      Height = 513
      Align = alClient
      AutoScroll = False
      TabOrder = 0
      inherited Grid: TDBGridEh
        Left = 198
        Width = 209
        Height = 513
        AutoFitColWidths = False
        DataSource = ds_devices
        FooterFont.Height = -14
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TitleFont.Height = -14
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
        Height = 513
        inherited Label1: TLabel
          Left = 15
          Top = 138
        end
        inherited Label2: TLabel
          Left = 5
          Top = 30
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
          Height = 490
        end
        inherited Label4: TLabel
          Left = 5
          Top = 113
          Font.Height = -15
        end
        inherited Label5: TLabel
          Left = 15
          Top = 187
        end
        inherited FieldCombo: TDBComboBoxEh
          Left = 15
          Top = 158
          Width = 173
        end
        inherited ValueEdit: TDBEditEh
          Left = 15
          Top = 49
          Width = 138
        end
        inherited SearchCombo: TDBComboBoxEh
          Left = 15
          Top = 256
          Width = 173
        end
        inherited SimilarityTrack: TTrackBar
          Left = 10
          Top = 303
          Width = 183
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
            Left = 175
            Width = 19
            Height = 20
            OnClick = DbGridFrame1btnSearchCloseClick
          end
        end
        inherited SearchDirectionCompo: TDBComboBoxEh
          Left = 15
          Top = 207
          Width = 173
        end
        inherited ValueEdit2: TDBEditEh
          Left = 75
          Top = 49
          Width = 78
        end
      end
      inherited PopupMenu: TPopupMenu [2]
        Left = 178
        Top = 70
        object miDeleteCalculation: TMenuItem [0]
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1089#1095#1077#1090
          GroupIndex = 200
          OnClick = miDeleteCalculationClick
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
      inherited Image24: TImageList [3]
      end
    end
  end
  object Panel1: TPanel
    Left = 412
    Top = 0
    Width = 661
    Height = 515
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 659
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1088#1080#1073#1086#1088#1072' '#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1088#1072#1089#1095#1077#1090#1072
      Color = 8454143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object pcInputValues: TPageControl
      Left = 1
      Top = 17
      Width = 659
      Height = 445
      ActivePage = TabSheet1
      Align = alClient
      MultiLine = True
      TabOrder = 0
      OnChange = pcInputValuesChange
      object TabSheet2: TTabSheet
        Caption = #1058#1080#1087' '#1088#1072#1089#1095#1077#1090#1072' '#1080' '#1080#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        ImageIndex = 1
        DesignSize = (
          651
          393)
        object Label2: TLabel
          Left = 12
          Top = 10
          Width = 102
          Height = 16
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        end
        object Label3: TLabel
          Left = 5
          Top = 260
          Width = 68
          Height = 16
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
        end
        object edName: TDBEdit
          Left = 121
          Top = 5
          Width = 526
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          DataField = 'NAME'
          DataSource = ds_devices
          MaxLength = 63
          TabOrder = 0
        end
        object edDescr: TDBMemo
          Left = 118
          Top = 265
          Width = 520
          Height = 122
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataField = 'DESCR'
          DataSource = ds_devices
          MaxLength = 1023
          TabOrder = 1
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1058#1072#1073#1083#1080#1094#1072' 2'
        inline DbGridFrame2: TDbGridFrame
          Left = 0
          Top = 0
          Width = 651
          Height = 393
          Align = alClient
          AutoScroll = False
          TabOrder = 0
          inherited Grid: TDBGridEh
            Left = 198
            Width = 453
            Height = 393
            AllowedOperations = [alopUpdateEh]
            AllowedSelections = [gstRecordBookmarks]
            DataSource = ds_table2
            EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
            FooterFont.Height = -14
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDblClickOptimizeColWidth]
            ReadOnly = False
            TitleFont.Height = -14
            OnGetCellParams = DbGridFrame2GridGetCellParams
            Columns = <
              item
                Color = clSilver
                EditButtons = <>
                FieldName = 'NAME_RUS'
                Footers = <>
                Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088'|'#1060#1080#1079#1080#1095#1077#1089#1082#1080#1081' '#1089#1084#1099#1089#1083
                Width = 341
              end
              item
                Alignment = taCenter
                Color = clSilver
                EditButtons = <>
                FieldName = 'NAME_SHORT'
                Footers = <>
                Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088'|'#1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'CV_VALUE'
                Footers = <>
                Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088'|'#1047#1085#1072#1095#1077#1085#1080#1077
                Width = 141
              end
              item
                Color = clSilver
                EditButtons = <>
                FieldName = 'ED_IZM'
                Footers = <>
                Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088'|'#1045#1076'.'#1080#1079#1084#1077#1088#1077#1085#1080#1103
                Width = 214
              end>
            inherited ToolBtn: TSpeedButton
              Width = 25
              Height = 25
            end
          end
          inherited ToolPanel: TPanel
            Width = 198
            Height = 393
            inherited Label1: TLabel
              Left = 15
              Top = 138
            end
            inherited Label2: TLabel
              Left = 5
              Top = 30
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
              Height = 370
            end
            inherited Label4: TLabel
              Left = 5
              Top = 113
              Font.Height = -15
            end
            inherited Label5: TLabel
              Left = 15
              Top = 187
            end
            inherited FieldCombo: TDBComboBoxEh
              Left = 15
              Top = 158
              Width = 173
            end
            inherited ValueEdit: TDBEditEh
              Left = 15
              Top = 49
              Width = 138
            end
            inherited SearchCombo: TDBComboBoxEh
              Left = 15
              Top = 256
              Width = 173
            end
            inherited SimilarityTrack: TTrackBar
              Left = 10
              Top = 303
              Width = 183
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
                Left = 175
                Width = 19
                Height = 20
              end
            end
            inherited SearchDirectionCompo: TDBComboBoxEh
              Left = 15
              Top = 207
              Width = 173
            end
            inherited ValueEdit2: TDBEditEh
              Left = 75
              Top = 49
              Width = 78
            end
          end
          inherited PopupMenu: TPopupMenu [2]
            Left = 244
            Top = 148
          end
          inherited Image24: TImageList [3]
            Left = 330
            Top = 114
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1058#1072#1073#1083#1080#1094#1099' 4..6 '#1080' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1077' '#1087#1080#1090#1072#1085#1080#1103
        ImageIndex = 2
        inline FrameTable6: TDbGridFrame
          Left = 0
          Top = 442
          Width = 651
          Height = 138
          Align = alTop
          AutoScroll = False
          TabOrder = 0
          inherited Grid: TDBGridEh
            Left = 198
            Width = 453
            Height = 138
            AllowedOperations = [alopUpdateEh]
            EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
            FooterFont.Height = -14
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = False
            TitleFont.Height = -14
            VertScrollBar.VisibleMode = sbNeverShowEh
            Columns = <
              item
                Color = clSilver
                EditButtons = <>
                FieldName = 'NAME_RUS'
                Footers = <>
                Title.Caption = #1054#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1099#1077' '#1088#1072#1079#1084#1077#1088#1099' '#1079#1091#1073#1094#1086#1074' '#1080' '#1089#1087#1080#1086#1082'|'#1060#1080#1079#1080#1095#1077#1089#1082#1080#1081' '#1089#1084#1099#1089#1083
                Width = 218
              end
              item
                Alignment = taCenter
                Color = clSilver
                EditButtons = <>
                FieldName = 'NAME_SHORT'
                Footers = <>
                Title.Caption = #1054#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1099#1077' '#1088#1072#1079#1084#1077#1088#1099' '#1079#1091#1073#1094#1086#1074' '#1080' '#1089#1087#1080#1086#1082'|'#1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'CV_VALUE'
                Footers = <>
                Title.Caption = #1054#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1099#1077' '#1088#1072#1079#1084#1077#1088#1099' '#1079#1091#1073#1094#1086#1074' '#1080' '#1089#1087#1080#1086#1082'|'#1047#1085#1072#1095#1077#1085#1080#1077
                Width = 141
              end
              item
                Color = clSilver
                EditButtons = <>
                FieldName = 'ED_IZM'
                Footers = <>
                Title.Caption = #1054#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1099#1077' '#1088#1072#1079#1084#1077#1088#1099' '#1079#1091#1073#1094#1086#1074' '#1080' '#1089#1087#1080#1086#1082'|'#1045#1076'.'#1080#1079#1084#1077#1088#1077#1085#1080#1103
                Width = 214
              end>
            inherited ToolBtn: TSpeedButton
              Width = 25
              Height = 25
            end
          end
          inherited ToolPanel: TPanel
            Width = 198
            Height = 138
            inherited Label1: TLabel
              Left = 15
              Top = 138
            end
            inherited Label2: TLabel
              Left = 5
              Top = 30
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
              Height = 115
            end
            inherited Label4: TLabel
              Left = 5
              Top = 113
              Font.Height = -15
            end
            inherited Label5: TLabel
              Left = 15
              Top = 187
            end
            inherited FieldCombo: TDBComboBoxEh
              Left = 15
              Top = 158
              Width = 173
            end
            inherited ValueEdit: TDBEditEh
              Left = 15
              Top = 49
              Width = 138
            end
            inherited SearchCombo: TDBComboBoxEh
              Left = 15
              Top = 256
              Width = 173
            end
            inherited SimilarityTrack: TTrackBar
              Left = 10
              Top = 303
              Width = 183
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
                Left = 175
                Width = 19
                Height = 20
              end
            end
            inherited SearchDirectionCompo: TDBComboBoxEh
              Left = 15
              Top = 207
              Width = 173
            end
            inherited ValueEdit2: TDBEditEh
              Left = 75
              Top = 49
              Width = 78
            end
          end
          inherited PopupMenu: TPopupMenu [2]
            Left = 244
            Top = 148
          end
          inherited Image24: TImageList [3]
            Left = 330
            Top = 114
          end
        end
        inline FrameTable4: TDbGridFrame
          Left = 0
          Top = 0
          Width = 651
          Height = 137
          Align = alTop
          AutoScroll = False
          TabOrder = 1
          inherited Grid: TDBGridEh
            Left = 198
            Width = 453
            Height = 137
            AllowedOperations = [alopUpdateEh]
            EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
            FooterFont.Height = -14
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = False
            TitleFont.Height = -14
            VertScrollBar.VisibleMode = sbNeverShowEh
            Columns = <
              item
                Color = clSilver
                EditButtons = <>
                FieldName = 'NAME_RUS'
                Footers = <>
                Title.Caption = #1048#1079#1086#1083#1103#1094#1080#1103' '#1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1086#1075#1086' '#1087#1088#1086#1074#1086#1076#1072'|'#1060#1080#1079#1080#1095#1077#1089#1082#1080#1081' '#1089#1084#1099#1089#1083
                Width = 341
              end
              item
                Alignment = taCenter
                Color = clSilver
                EditButtons = <>
                FieldName = 'NAME_SHORT'
                Footers = <>
                Title.Caption = #1048#1079#1086#1083#1103#1094#1080#1103' '#1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1086#1075#1086' '#1087#1088#1086#1074#1086#1076#1072'|'#1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'CV_VALUE'
                Footers = <>
                Title.Caption = #1048#1079#1086#1083#1103#1094#1080#1103' '#1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1086#1075#1086' '#1087#1088#1086#1074#1086#1076#1072'|'#1047#1085#1072#1095#1077#1085#1080#1077
                Width = 141
              end
              item
                Color = clSilver
                EditButtons = <>
                FieldName = 'ED_IZM'
                Footers = <>
                Title.Caption = #1048#1079#1086#1083#1103#1094#1080#1103' '#1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1086#1075#1086' '#1087#1088#1086#1074#1086#1076#1072'|'#1045#1076'.'#1080#1079#1084#1077#1088#1077#1085#1080#1103
                Width = 214
              end>
            inherited ToolBtn: TSpeedButton
              Width = 25
              Height = 25
            end
          end
          inherited ToolPanel: TPanel
            Width = 198
            Height = 137
            inherited Label1: TLabel
              Left = 15
              Top = 138
            end
            inherited Label2: TLabel
              Left = 5
              Top = 30
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
              Height = 114
            end
            inherited Label4: TLabel
              Left = 5
              Top = 113
              Font.Height = -15
            end
            inherited Label5: TLabel
              Left = 15
              Top = 187
            end
            inherited FieldCombo: TDBComboBoxEh
              Left = 15
              Top = 158
              Width = 173
            end
            inherited ValueEdit: TDBEditEh
              Left = 15
              Top = 49
              Width = 138
            end
            inherited SearchCombo: TDBComboBoxEh
              Left = 15
              Top = 256
              Width = 173
            end
            inherited SimilarityTrack: TTrackBar
              Left = 10
              Top = 303
              Width = 183
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
                Left = 175
                Width = 19
                Height = 20
              end
            end
            inherited SearchDirectionCompo: TDBComboBoxEh
              Left = 15
              Top = 207
              Width = 173
            end
            inherited ValueEdit2: TDBEditEh
              Left = 75
              Top = 49
              Width = 78
            end
          end
          inherited PopupMenu: TPopupMenu [2]
            Left = 244
            Top = 148
          end
          inherited Image24: TImageList [3]
            Left = 330
            Top = 114
          end
        end
        inline DbGridFrame5: TDbGridFrame
          Left = 0
          Top = 137
          Width = 651
          Height = 184
          Align = alTop
          AutoScroll = False
          TabOrder = 2
          inherited Grid: TDBGridEh
            Left = 198
            Width = 453
            Height = 184
            AllowedOperations = [alopUpdateEh]
            EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
            FooterFont.Height = -14
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = False
            TitleFont.Height = -14
            VertScrollBar.VisibleMode = sbNeverShowEh
            Columns = <
              item
                Color = clSilver
                EditButtons = <>
                FieldName = 'NAME_RUS'
                Footers = <>
                Title.Caption = #1054#1073#1084#1086#1090#1086#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1076#1074#1080#1075#1072#1090#1077#1083#1103'|'#1060#1080#1079#1080#1095#1077#1089#1082#1080#1081' '#1089#1084#1099#1089#1083
                Width = 341
              end
              item
                Alignment = taCenter
                Color = clSilver
                EditButtons = <>
                FieldName = 'NAME_SHORT'
                Footers = <>
                Title.Caption = #1054#1073#1084#1086#1090#1086#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1076#1074#1080#1075#1072#1090#1077#1083#1103'|'#1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'CV_VALUE'
                Footers = <>
                Title.Caption = #1054#1073#1084#1086#1090#1086#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1076#1074#1080#1075#1072#1090#1077#1083#1103'|'#1047#1085#1072#1095#1077#1085#1080#1077
                Width = 141
              end
              item
                Color = clSilver
                EditButtons = <>
                FieldName = 'ED_IZM'
                Footers = <>
                Title.Caption = #1054#1073#1084#1086#1090#1086#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1076#1074#1080#1075#1072#1090#1077#1083#1103'|'#1045#1076'.'#1080#1079#1084#1077#1088#1077#1085#1080#1103
                Width = 214
              end>
            inherited ToolBtn: TSpeedButton
              Width = 25
              Height = 25
            end
          end
          inherited ToolPanel: TPanel
            Width = 198
            Height = 184
            inherited Label1: TLabel
              Left = 15
              Top = 138
            end
            inherited Label2: TLabel
              Left = 5
              Top = 30
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
              Height = 161
            end
            inherited Label4: TLabel
              Left = 5
              Top = 113
              Font.Height = -15
            end
            inherited Label5: TLabel
              Left = 15
              Top = 187
            end
            inherited FieldCombo: TDBComboBoxEh
              Left = 15
              Top = 158
              Width = 173
            end
            inherited ValueEdit: TDBEditEh
              Left = 15
              Top = 49
              Width = 138
            end
            inherited SearchCombo: TDBComboBoxEh
              Left = 15
              Top = 256
              Width = 173
            end
            inherited SimilarityTrack: TTrackBar
              Left = 10
              Top = 303
              Width = 183
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
                Left = 175
                Width = 19
                Height = 20
              end
            end
            inherited SearchDirectionCompo: TDBComboBoxEh
              Left = 15
              Top = 207
              Width = 173
            end
            inherited ValueEdit2: TDBEditEh
              Left = 75
              Top = 49
              Width = 78
            end
          end
          inherited PopupMenu: TPopupMenu [2]
            Left = 244
            Top = 148
          end
          inherited Image24: TImageList [3]
            Left = 330
            Top = 114
          end
        end
        inline DbGridFrame6: TDbGridFrame
          Left = 0
          Top = 321
          Width = 651
          Height = 121
          Align = alTop
          AutoScroll = False
          TabOrder = 3
          inherited Grid: TDBGridEh
            Left = 198
            Width = 453
            Height = 121
            AllowedOperations = [alopUpdateEh]
            EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
            FooterFont.Height = -14
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = False
            TitleFont.Height = -14
            VertScrollBar.VisibleMode = sbNeverShowEh
            Columns = <
              item
                Color = clSilver
                EditButtons = <>
                FieldName = 'NAME_RUS'
                Footers = <>
                Title.Caption = #1053#1072#1087#1088#1103#1078#1077#1085#1080#1077' '#1087#1080#1090#1072#1085#1080#1103'|'#1060#1080#1079#1080#1095#1077#1089#1082#1080#1081' '#1089#1084#1099#1089#1083
                Width = 341
              end
              item
                Alignment = taCenter
                Color = clSilver
                EditButtons = <>
                FieldName = 'NAME_SHORT'
                Footers = <>
                Title.Caption = #1053#1072#1087#1088#1103#1078#1077#1085#1080#1077' '#1087#1080#1090#1072#1085#1080#1103'|'#1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'CV_VALUE'
                Footers = <>
                Title.Caption = #1053#1072#1087#1088#1103#1078#1077#1085#1080#1077' '#1087#1080#1090#1072#1085#1080#1103'|'#1047#1085#1072#1095#1077#1085#1080#1077
                Width = 141
              end
              item
                Color = clSilver
                EditButtons = <>
                FieldName = 'ED_IZM'
                Footers = <>
                Title.Caption = #1053#1072#1087#1088#1103#1078#1077#1085#1080#1077' '#1087#1080#1090#1072#1085#1080#1103'|'#1045#1076'.'#1080#1079#1084#1077#1088#1077#1085#1080#1103
                Width = 214
              end>
            inherited ToolBtn: TSpeedButton
              Width = 25
              Height = 25
            end
          end
          inherited ToolPanel: TPanel
            Width = 198
            Height = 121
            inherited Label1: TLabel
              Left = 15
              Top = 138
            end
            inherited Label2: TLabel
              Left = 5
              Top = 30
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
              Height = 98
            end
            inherited Label4: TLabel
              Left = 5
              Top = 113
              Font.Height = -15
            end
            inherited Label5: TLabel
              Left = 15
              Top = 187
            end
            inherited FieldCombo: TDBComboBoxEh
              Left = 15
              Top = 158
              Width = 173
            end
            inherited ValueEdit: TDBEditEh
              Left = 15
              Top = 49
              Width = 138
            end
            inherited SearchCombo: TDBComboBoxEh
              Left = 15
              Top = 256
              Width = 173
            end
            inherited SimilarityTrack: TTrackBar
              Left = 10
              Top = 303
              Width = 183
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
                Left = 175
                Width = 19
                Height = 20
              end
            end
            inherited SearchDirectionCompo: TDBComboBoxEh
              Left = 15
              Top = 207
              Width = 173
            end
            inherited ValueEdit2: TDBEditEh
              Left = 75
              Top = 49
              Width = 78
            end
          end
          inherited PopupMenu: TPopupMenu [2]
            Left = 244
            Top = 148
          end
          inherited Image24: TImageList [3]
            Left = 330
            Top = 114
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'N6 '#1080' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1087#1088#1086#1074#1086#1076#1085#1080#1082#1086#1074' '#1087#1086' '#1087#1072#1079#1072#1084
        ImageIndex = 3
        inline FrameRPPP: TDbGridFrame
          Left = 309
          Top = 0
          Width = 309
          Height = 393
          Align = alLeft
          AutoScroll = False
          TabOrder = 0
          inherited Grid: TDBGridEh
            Left = 198
            Width = 111
            Height = 393
            AllowedOperations = [alopUpdateEh]
            EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
            FooterFont.Height = -14
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDblClickOptimizeColWidth]
            ReadOnly = False
            TitleFont.Height = -14
            VertScrollBar.VisibleMode = sbNeverShowEh
            Columns = <
              item
                Alignment = taCenter
                Color = clSilver
                EditButtons = <>
                FieldName = 'ARRAY_NUM'
                Footers = <>
                Title.Caption = ' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1087#1088#1086#1074#1086#1076#1085#1080#1082#1086#1074' '#1087#1086' '#1087#1072#1079#1072#1084'|'#1053#1086#1084#1077#1088
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'array_VALUE'
                Footers = <>
                Title.Caption = ' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1087#1088#1086#1074#1086#1076#1085#1080#1082#1086#1074' '#1087#1086' '#1087#1072#1079#1072#1084'|'#1047#1085#1072#1095#1077#1085#1080#1077
                Width = 141
              end>
            inherited ToolBtn: TSpeedButton
              Width = 25
              Height = 25
            end
          end
          inherited ToolPanel: TPanel
            Width = 198
            Height = 393
            inherited Label1: TLabel
              Left = 15
              Top = 138
            end
            inherited Label2: TLabel
              Left = 5
              Top = 30
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
              Height = 350
            end
            inherited Label4: TLabel
              Left = 5
              Top = 113
              Font.Height = -15
            end
            inherited Label5: TLabel
              Left = 15
              Top = 187
            end
            inherited FieldCombo: TDBComboBoxEh
              Left = 15
              Top = 158
              Width = 173
            end
            inherited ValueEdit: TDBEditEh
              Left = 15
              Top = 49
              Width = 138
            end
            inherited SearchCombo: TDBComboBoxEh
              Left = 15
              Top = 256
              Width = 173
            end
            inherited SimilarityTrack: TTrackBar
              Left = 10
              Top = 303
              Width = 183
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
                Left = 175
                Width = 19
                Height = 20
              end
            end
            inherited SearchDirectionCompo: TDBComboBoxEh
              Left = 15
              Top = 207
              Width = 173
            end
            inherited ValueEdit2: TDBEditEh
              Left = 75
              Top = 49
              Width = 78
            end
          end
          inherited PopupMenu: TPopupMenu [2]
            Left = 214
            Top = 132
          end
          inherited Image24: TImageList [3]
            Left = 330
            Top = 114
          end
        end
        inline DbGridFrame3: TDbGridFrame
          Left = 0
          Top = 0
          Width = 309
          Height = 393
          Align = alLeft
          AutoScroll = False
          TabOrder = 1
          inherited Grid: TDBGridEh
            Left = 198
            Width = 111
            Height = 393
            AllowedOperations = [alopUpdateEh]
            EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
            FooterFont.Height = -14
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDblClickOptimizeColWidth]
            ReadOnly = False
            TitleFont.Height = -14
            VertScrollBar.VisibleMode = sbNeverShowEh
            Columns = <
              item
                Alignment = taCenter
                Color = clSilver
                EditButtons = <>
                FieldName = 'ARRAY_NUM'
                Footers = <>
                Title.Caption = #1059#1095#1080#1090#1099#1074#1072#1077#1084#1099#1077' '#1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1077#1085#1085#1099#1077' '#1075#1072#1088#1084#1086#1085#1080#1095#1077#1089#1082#1080#1077'|'#1053#1086#1084#1077#1088
                Width = 87
              end
              item
                EditButtons = <>
                FieldName = 'ARRAY_VALUE'
                Footers = <>
                Title.Caption = #1059#1095#1080#1090#1099#1074#1072#1077#1084#1099#1077' '#1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1077#1085#1085#1099#1077' '#1075#1072#1088#1084#1086#1085#1080#1095#1077#1089#1082#1080#1077'|'#1047#1085#1072#1095#1077#1085#1080#1077
                Width = 141
              end>
            inherited ToolBtn: TSpeedButton
              Width = 25
              Height = 25
            end
          end
          inherited ToolPanel: TPanel
            Width = 198
            Height = 393
            inherited Label1: TLabel
              Left = 15
              Top = 138
            end
            inherited Label2: TLabel
              Left = 5
              Top = 30
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
              Height = 350
            end
            inherited Label4: TLabel
              Left = 5
              Top = 113
              Font.Height = -15
            end
            inherited Label5: TLabel
              Left = 15
              Top = 187
            end
            inherited FieldCombo: TDBComboBoxEh
              Left = 15
              Top = 158
              Width = 173
            end
            inherited ValueEdit: TDBEditEh
              Left = 15
              Top = 49
              Width = 138
            end
            inherited SearchCombo: TDBComboBoxEh
              Left = 15
              Top = 256
              Width = 173
            end
            inherited SimilarityTrack: TTrackBar
              Left = 10
              Top = 303
              Width = 183
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
                Left = 175
                Width = 19
                Height = 20
              end
            end
            inherited SearchDirectionCompo: TDBComboBoxEh
              Left = 15
              Top = 207
              Width = 173
            end
            inherited ValueEdit2: TDBEditEh
              Left = 75
              Top = 49
              Width = 78
            end
          end
          inherited PopupMenu: TPopupMenu [2]
            Left = 244
            Top = 148
          end
          inherited Image24: TImageList [3]
            Left = 330
            Top = 114
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = #1042#1093#1086#1076#1085#1086#1081' '#1092#1072#1081#1083
        ImageIndex = 4
        object inputFile: TDBMemo
          Left = 0
          Top = 0
          Width = 651
          Height = 393
          Align = alClient
          DataField = 'INPUTFILE'
          DataSource = ds_devices
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 462
      Width = 659
      Height = 52
      Align = alBottom
      TabOrder = 1
      object btnSaveInputData: TBitBtn
        Left = 17
        Top = 12
        Width = 243
        Height = 31
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        TabOrder = 0
        OnClick = miSaveEditClick
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
      object btnProcessing: TBitBtn
        Left = 287
        Top = 12
        Width = 163
        Height = 31
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1088#1072#1089#1095#1077#1090
        TabOrder = 1
        OnClick = btnProcessingClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00848484000000000000000000000000000000000000000000000000000000
          0000000000000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C60000000000C6C6C60000000000C6C6C6000000FF000000
          FF000000FF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
          C60000000000C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
          C60000000000C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
          C60000000000C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C60000000000000000000000000000000000000000000000
          000000000000C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C600000000000000000000000000FFFF000000000000FFFF
          000000000000C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C60000000000000000000000000000000000000000000000
          000000000000C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00848484000000000000000000000000000000000000000000000000000000
          0000000000000000000084848400FF00FF00FF00FF00FF00FF00}
      end
      object btnSaveOutput: TBitBtn
        Left = 473
        Top = 10
        Width = 245
        Height = 31
        Caption = #1058#1072#1073#1083#1080#1094#1072' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074
        TabOrder = 2
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF000000000000
          0000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0FF0000000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF0000FF0000C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0FF0000FF0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF0000FF0000C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0FF0000000000C0C0C0C0C0C0C0C0C0FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000000000C0C0C0C0C0C0FF0000FFCC99FF00
          00000000C0C0C0C0C0C0C0C0C0FF0000FFCC99FFCC99FF0000FF0000000000C0
          C0C0C0C0C0FF0000FFCC99FFCC99FF0000FF0000000000C0C0C0C0C0C0C0C0C0
          FF0000FFCC99FF0000000000C0C0C0C0C0C0FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000000000C0C0C0C0C0C0C0C0C0FF0000000000C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0FF0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF00000000
          00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0FF0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0FF0000C0C0C0C0C0C0C0C0C0C0C0C0FF0000000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF0000FF
          0000FF0000FF0000FF0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
      end
    end
  end
  object ds_devices: TDataSource
    DataSet = q_devices
    Left = 140
    Top = 372
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
    SQL.Strings = (
      'select d.*, DT.name as devicetypename, c.name as convertername'
      ' from devices D, deviceTypes DT, converters c'
      'where '
      'DT.ID = d.typedevice_id and'
      'c.id = d.id_converter'
      'order by d.create_date')
    UpdateObject = updateDevice
    Left = 40
    Top = 450
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
  end
  object MainMenu1: TMainMenu
    Left = 196
    Top = 200
    object miClose: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = miCloseClick
    end
    object N2: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090
      object miSaveEdit: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1088#1072#1074#1082#1091
        OnClick = miSaveEditClick
      end
      object miCreateNew: TMenuItem
      end
      object N5: TMenuItem
        Caption = #1050#1083#1086#1085#1080#1088#1086#1074#1072#1090#1100
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N3: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1089#1095#1077#1090
        OnClick = miDeleteCalculationClick
      end
    end
  end
  object updateDevice: TIBUpdateSQL
    ModifySQL.Strings = (
      'update  devices   set'
      ' name =:name,'
      ' descr = :descr,'
      ' device_number = :device_number,'
      ' create_date = :Create_Date,'
      ' sale_date = :sale_date,'
      ' customer = :customer,'
      ' id_converter = :id_converter'
      'where id  = :ID')
    DeleteSQL.Strings = (
      'delete from devices '
      'where id  = :ID')
    Left = 142
    Top = 450
  end
  object q_table2: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterPost = q_table2AfterPost
    DataSource = ds_devices
    SQL.Strings = (
      'select *  from calc_values CV,'
      'Parameters P'
      'where'
      'cv.calc_id = :ID'
      'and p.id=cv.param_ID'
      'and param_group='#39'TABLE2'#39
      'and p.used_in_calc_type containing :calc_TYPE'
      'order by p.image, p.image_pos'
      '')
    UpdateObject = updateTable2
    Left = 645
    Top = 290
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'calc_TYPE'
        ParamType = ptUnknown
      end>
  end
  object ds_table2: TDataSource
    DataSet = q_table2
    Left = 751
    Top = 274
  end
  object updateTable2: TIBUpdateSQL
    ModifySQL.Strings = (
      'update calc_values set'
      ' cv_value=:cv_value'
      'where'
      ' id = :id')
    Left = 833
    Top = 284
  end
  object ImageList1: TImageList
    Left = 537
    Top = 175
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000033333300333333003333
      3300333333003333330033333300333333003333330033333300333333003333
      3300333333003333330033333300000000000000000000000000663300006633
      0000663300006633000066330000663300006633000066330000663300006633
      0000663300006633000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      660033333300FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0033333300000000000000000000000000FF996600FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00663300000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      660033333300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0033333300000000000000000000000000FF996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00663300000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      66003333330000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000033333300000000000000000000000000FF996600FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00663300000000000000000000000000000000000000000000FF00
      0000FF000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      66003333330000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0033333300000000006633000066330000FF996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00663300000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000FF000000FFCC
      9900FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      66003333330000FFFF0000FFFF0000FFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003333330000000000FF663300FFFFFF00FF996600FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF0066330000000000000000000000000000FF000000FFCC9900FFCC
      9900FF000000FF000000000000000000000000000000FF000000FFCC9900FFCC
      9900FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      66003333330000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF00003333330000000000FF663300FFFFFF00FF996600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006633000000000000000000000000000000000000FF000000FFCC
      9900FF000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      66003333330000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF003333330000000000FF663300FFFFFF00FF996600FF99
      6600FF996600FF996600FF996600FF996600FF996600FF996600FF996600FF99
      6600FF996600663300000000000000000000000000000000000000000000FF00
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      660033333300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003333330000000000FF663300FFFFFF00FF996600FFFF
      FF0066330000FFFFFF00FFFFFF00FF996600FFFFFF0066330000FFFFFF00FFFF
      FF00FFFFFF006633000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      660033333300FF999900FF999900FF999900FF999900FF999900FF999900FF99
      9900FF999900FF9999003333330000000000FF663300FFFFFF00FF996600FF99
      660066330000FF996600FF996600FF996600FF99660066330000FF996600FF99
      6600FF9966006633000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      66003333330000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF003333330000000000FF663300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006633
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000033333300333333003333
      3300333333003333330033333300333333003333330033333300333333003333
      330033333300333333003333330000000000FF663300FF663300FF663300FF66
      3300FF663300FF663300FF663300FF663300FF663300FF663300FF6633006633
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF0000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFF83F0000
      8001C003F3DF00008001C003E7FF00008001C003E7FF00008001C003E7E70000
      8001000300C30000800100038181000080010003C300000080010003E7E70000
      80010003FFE7000080010003FFE700008001000FFBCF00008001000FFC1F0000
      FFFF000FFFFF0000FFFF000FFFFF000000000000000000000000000000000000
      000000000000}
  end
end
