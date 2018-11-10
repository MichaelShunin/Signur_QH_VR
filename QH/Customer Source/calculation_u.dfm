object Calculation_Form: TCalculation_Form
  Left = -24
  Top = 117
  Width = 1036
  Height = 622
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1088#1072#1089#1095#1077#1090#1072
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
    Left = 366
    Top = 0
    Height = 557
    Color = clMedGray
    ParentColor = False
  end
  object CalcsPanel: TPanel
    Left = 0
    Top = 0
    Width = 366
    Height = 557
    Align = alLeft
    TabOrder = 0
    inline DbGridFrame1: TDbGridFrame
      Left = 1
      Top = 1
      Width = 364
      Height = 555
      Align = alClient
      AutoScroll = False
      TabOrder = 0
      inherited Grid: TDBGridEh
        Left = 198
        Width = 166
        Height = 555
        AutoFitColWidths = False
        DataSource = ds_calc
        FooterFont.Height = -14
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TitleFont.Height = -14
        OnGetCellParams = DbGridFrame1GridGetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1056#1072#1089#1095#1077#1090'|'#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 86
          end
          item
            DisplayFormat = 'dd.mm hh:mm'
            EditButtons = <>
            FieldName = 'CALC_DATE'
            Footers = <>
            Title.Caption = #1056#1072#1089#1095#1077#1090'|'#1076#1072#1090#1072
            Width = 112
          end
          item
            EditButtons = <>
            FieldName = 'ENGINE_NAME'
            Footers = <>
            Title.Caption = #1076#1074#1080#1075#1072#1090#1077#1083#1100
            Width = 86
          end
          item
            EditButtons = <>
            FieldName = 'CALC_TYPE'
            Footers = <>
            Title.Caption = #1090#1080#1087' '#1088#1072#1089#1095#1077#1090#1072
            Width = 37
          end>
        inherited ToolBtn: TSpeedButton
          Width = 25
          Height = 25
        end
      end
      inherited ToolPanel: TPanel
        Width = 198
        Height = 555
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
          Height = 532
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
          Width = 173
          Height = 19
        end
        inherited ValueEdit: TDBEditEh
          Left = 15
          Top = 49
          Width = 138
          Height = 19
        end
        inherited SearchCombo: TDBComboBoxEh
          Left = 15
          Top = 256
          Width = 173
          Height = 19
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
          Height = 19
        end
        inherited ValueEdit2: TDBEditEh
          Left = 75
          Top = 49
          Width = 78
          Height = 19
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
    end
  end
  object Panel1: TPanel
    Left = 369
    Top = 0
    Width = 659
    Height = 557
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 657
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1088#1072#1089#1095#1077#1090#1072
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
      Width = 657
      Height = 487
      ActivePage = TabSheet4
      Align = alClient
      MultiLine = True
      TabOrder = 0
      OnChange = pcInputValuesChange
      object TabSheet2: TTabSheet
        Caption = #1058#1080#1087' '#1088#1072#1089#1095#1077#1090#1072' '#1080' '#1080#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        ImageIndex = 1
        DesignSize = (
          649
          414)
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
        object CalcType: TRadioGroup
          Left = 5
          Top = 33
          Width = 156
          Height = 80
          Caption = #1058#1080#1087' '#1088#1072#1089#1095#1077#1090#1072
          ItemIndex = 1
          Items.Strings = (
            #1087#1086#1074#1077#1088#1086#1095#1085#1099#1081
            #1086#1087#1090#1080#1084#1080#1079#1072#1094#1080#1086#1085#1085#1099#1081)
          TabOrder = 0
        end
        object ObmotkaSchema: TRadioGroup
          Left = 7
          Top = 119
          Width = 232
          Height = 47
          Caption = #1057#1093#1077#1084#1072' '#1074#1082#1083#1102#1095#1077#1085#1080#1103' '#1086#1073#1084#1086#1090#1082#1080
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            #1079#1074#1077#1079#1076#1072
            #1090#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082)
          TabOrder = 1
        end
        object PazRotor: TRadioGroup
          Left = 166
          Top = 33
          Width = 287
          Height = 80
          Caption = #1055#1072#1079#1099' '#1088#1086#1090#1086#1088#1072
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            #1086#1074#1072#1083#1100#1085#1099#1081' '
            #1082#1088#1091#1075#1083#1099#1081' '
            #1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1099#1081
            #1087#1086#1083#1091#1086#1074#1072#1083#1100#1085#1099#1081)
          TabOrder = 2
        end
        object PazStator: TRadioGroup
          Left = 458
          Top = 33
          Width = 287
          Height = 80
          Caption = #1055#1072#1079#1099' '#1089#1090#1072#1090#1086#1088#1072
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            #1090#1088#1072#1087#1077#1094#1077#1080#1076#1072#1083#1100#1085#1099#1081
            #1087#1086#1083#1091#1086#1074#1072#1083#1100#1085#1099#1081
            #1086#1074#1072#1083#1100#1085#1099#1081
            #1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1099#1081' ')
          TabOrder = 3
        end
        object ObmotkaSterghen: TRadioGroup
          Left = 245
          Top = 119
          Width = 231
          Height = 47
          Caption = #1057#1090#1077#1088#1078#1085#1077#1074#1072#1103' '#1086#1073#1084#1086#1090#1082#1072' '#1089#1090#1072#1090#1086#1088#1072
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            #1053#1077#1090
            #1044#1072)
          TabOrder = 4
        end
        object SteelRotor: TRadioGroup
          Left = 5
          Top = 167
          Width = 354
          Height = 94
          Caption = #1052#1072#1088#1082#1072' '#1089#1090#1072#1083#1080' '#1089#1077#1088#1076#1077#1095#1085#1080#1082#1072' '#1088#1086#1090#1086#1088#1072
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            '1212 - 0.50 '#1084#1084
            '2013 - 0.50 '#1084#1084
            '2214 - 0.50 '#1084#1084
            '2412 - 0.50 '#1084#1084
            '2421 - 0.35 '#1084#1084
            '2421 - 0.18 '#1084#1084)
          TabOrder = 5
        end
        object SteelStator: TRadioGroup
          Left = 373
          Top = 167
          Width = 372
          Height = 94
          Caption = #1052#1072#1088#1082#1072' '#1089#1090#1072#1083#1080' '#1089#1077#1088#1076#1077#1095#1085#1080#1082#1072' '#1089#1090#1072#1090#1086#1088#1072
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            '1212 - 0.50 '#1084#1084
            '2013 - 0.50 '#1084#1084
            '2214 - 0.50 '#1084#1084
            '2412 - 0.50 '#1084#1084
            '2421 - 0.35 '#1084#1084
            '2421 - 0.18 '#1084#1084)
          TabOrder = 6
        end
        object edName: TDBEdit
          Left = 121
          Top = 5
          Width = 620
          Height = 21
          DataField = 'NAME'
          DataSource = ds_calc
          MaxLength = 63
          TabOrder = 7
        end
        object edDescr: TDBMemo
          Left = 118
          Top = 265
          Width = 800
          Height = 325
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataField = 'DESCR'
          DataSource = ds_calc
          MaxLength = 1023
          TabOrder = 8
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1058#1072#1073#1083#1080#1094#1072' 2'
        inline DbGridFrame2: TDbGridFrame
          Left = 0
          Top = 0
          Width = 649
          Height = 414
          Align = alClient
          AutoScroll = False
          TabOrder = 0
          inherited Grid: TDBGridEh
            Left = 198
            Width = 451
            Height = 414
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
            Height = 414
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
              Height = 391
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
          inherited TaxxiFrameAgent: TTaxxiFrameAgent
            inherited TaxxiDBEditEhAgent1: TTaxxiDBEditEhAgent [0]
            end
          end
          inherited PopupMenu: TPopupMenu
            Left = 244
            Top = 148
          end
          inherited Image24: TImageList
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
          Width = 649
          Height = 138
          Align = alTop
          AutoScroll = False
          TabOrder = 0
          inherited Grid: TDBGridEh
            Left = 198
            Width = 451
            Height = 138
            AllowedOperations = [alopUpdateEh]
            DataSource = ds_table6
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
              Height = 115
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
          inherited TaxxiFrameAgent: TTaxxiFrameAgent
            inherited TaxxiDBEditEhAgent1: TTaxxiDBEditEhAgent [0]
            end
          end
          inherited PopupMenu: TPopupMenu
            Left = 244
            Top = 148
          end
          inherited Image24: TImageList
            Left = 330
            Top = 114
          end
        end
        inline FrameTable4: TDbGridFrame
          Left = 0
          Top = 0
          Width = 649
          Height = 137
          Align = alTop
          AutoScroll = False
          TabOrder = 1
          inherited Grid: TDBGridEh
            Left = 198
            Width = 451
            Height = 137
            AllowedOperations = [alopUpdateEh]
            DataSource = ds_Table4
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
              Height = 114
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
          inherited TaxxiFrameAgent: TTaxxiFrameAgent
            inherited TaxxiDBEditEhAgent1: TTaxxiDBEditEhAgent [0]
            end
          end
          inherited PopupMenu: TPopupMenu
            Left = 244
            Top = 148
          end
          inherited Image24: TImageList
            Left = 330
            Top = 114
          end
        end
        inline DbGridFrame5: TDbGridFrame
          Left = 0
          Top = 137
          Width = 649
          Height = 184
          Align = alTop
          AutoScroll = False
          TabOrder = 2
          inherited Grid: TDBGridEh
            Left = 198
            Width = 451
            Height = 184
            AllowedOperations = [alopUpdateEh]
            DataSource = ds_table5
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
              Height = 161
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
          inherited TaxxiFrameAgent: TTaxxiFrameAgent
            inherited TaxxiDBEditEhAgent1: TTaxxiDBEditEhAgent [0]
            end
          end
          inherited PopupMenu: TPopupMenu
            Left = 244
            Top = 148
          end
          inherited Image24: TImageList
            Left = 330
            Top = 114
          end
        end
        inline DbGridFrame6: TDbGridFrame
          Left = 0
          Top = 321
          Width = 649
          Height = 121
          Align = alTop
          AutoScroll = False
          TabOrder = 3
          inherited Grid: TDBGridEh
            Left = 198
            Width = 451
            Height = 121
            AllowedOperations = [alopUpdateEh]
            DataSource = ds_TableUmaxMin
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
              Height = 98
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
          inherited TaxxiFrameAgent: TTaxxiFrameAgent
            inherited TaxxiDBEditEhAgent1: TTaxxiDBEditEhAgent [0]
            end
          end
          inherited PopupMenu: TPopupMenu
            Left = 244
            Top = 148
          end
          inherited Image24: TImageList
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
          Height = 414
          Align = alLeft
          AutoScroll = False
          TabOrder = 0
          inherited Grid: TDBGridEh
            Left = 198
            Width = 111
            Height = 414
            AllowedOperations = [alopUpdateEh]
            DataSource = ds_RPPP
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
            Height = 414
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
              Height = 391
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
              Width = 173
              Height = 19
            end
            inherited ValueEdit: TDBEditEh
              Left = 15
              Top = 49
              Width = 138
              Height = 19
            end
            inherited SearchCombo: TDBComboBoxEh
              Left = 15
              Top = 256
              Width = 173
              Height = 19
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
              Height = 19
            end
            inherited ValueEdit2: TDBEditEh
              Left = 75
              Top = 49
              Width = 78
              Height = 19
            end
          end
          inherited TaxxiFrameAgent: TTaxxiFrameAgent
            inherited TaxxiDBEditEhAgent1: TTaxxiDBEditEhAgent [0]
            end
          end
          inherited PopupMenu: TPopupMenu
            Left = 214
            Top = 132
          end
          inherited Image24: TImageList
            Left = 330
            Top = 114
          end
        end
        inline DbGridFrame3: TDbGridFrame
          Left = 0
          Top = 0
          Width = 309
          Height = 414
          Align = alLeft
          AutoScroll = False
          TabOrder = 1
          inherited Grid: TDBGridEh
            Left = 198
            Width = 111
            Height = 414
            AllowedOperations = [alopUpdateEh]
            DataSource = DS_N6
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
            Height = 414
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
              Height = 391
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
              Width = 173
              Height = 19
            end
            inherited ValueEdit: TDBEditEh
              Left = 15
              Top = 49
              Width = 138
              Height = 19
            end
            inherited SearchCombo: TDBComboBoxEh
              Left = 15
              Top = 256
              Width = 173
              Height = 19
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
              Height = 19
            end
            inherited ValueEdit2: TDBEditEh
              Left = 75
              Top = 49
              Width = 78
              Height = 19
            end
          end
          inherited TaxxiFrameAgent: TTaxxiFrameAgent
            inherited TaxxiDBEditEhAgent1: TTaxxiDBEditEhAgent [0]
            end
          end
          inherited PopupMenu: TPopupMenu
            Left = 244
            Top = 148
          end
          inherited Image24: TImageList
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
          Width = 757
          Height = 567
          Align = alClient
          DataField = 'INPUTFILE'
          DataSource = ds_calc
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
      object TabSheet6: TTabSheet
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1089#1095#1077#1090#1072
        ImageIndex = 5
        object ResultInfo: TLabel
          Left = 0
          Top = 0
          Width = 649
          Height = 32
          Align = alTop
          Alignment = taCenter
          Caption = 
            #1042#1099#1093#1086#1076#1085#1099#1077' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1085#1077' '#1087#1086#1083#1091#1095#1077#1085#1099'. '#1042#1077#1088#1086#1103#1090#1085#1086', '#1074#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1085#1077#1082#1086#1088#1088 +
            #1077#1082#1090#1085#1099' '#1080#1083#1080' '#1088#1072#1089#1095#1077#1090' '#1077#1097#1077' '#1085#1077' '#1074#1099#1087#1086#1083#1085#1077#1085
          Color = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          WordWrap = True
        end
        object PageControl1: TPageControl
          Left = 0
          Top = 32
          Width = 649
          Height = 382
          ActivePage = TabSheet7
          Align = alClient
          Images = ImageList1
          TabOrder = 0
          object TabSheet7: TTabSheet
            Caption = #1042#1099#1093#1086#1076#1085#1086#1081' '#1092#1072#1081#1083
            object OutputFile: TDBMemo
              Left = 0
              Top = 0
              Width = 874
              Height = 521
              Align = alClient
              DataField = 'OUTPUTFILE'
              DataSource = ds_calc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 0
              OnChange = OutputFileChange
            end
          end
          object TabSheet8: TTabSheet
            Caption = #1042#1099#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
            ImageIndex = 1
            object Splitter3: TSplitter
              Left = 0
              Top = 347
              Width = 641
              Height = 4
              Cursor = crVSplit
              Align = alBottom
            end
            object OutPutData: TMemo
              Left = 0
              Top = 0
              Width = 641
              Height = 347
              Align = alClient
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Courier New'
              Font.Style = []
              Lines.Strings = (
                'OutputData')
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 0
            end
          end
          object TabSheet9: TTabSheet
            Caption = #1058#1072#1073#1083#1080#1094#1072' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074
            ImageIndex = 2
            object Splitter2: TSplitter
              Left = 0
              Top = 208
              Width = 641
              Height = 7
              Cursor = crVSplit
              Align = alBottom
            end
            object SG: TStringGrid
              Left = 0
              Top = 0
              Width = 641
              Height = 208
              Align = alClient
              FixedColor = 16776176
              FixedCols = 3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Courier New'
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowSelect]
              ParentFont = False
              TabOrder = 0
              ColWidths = (
                214
                75
                51
                74
                82)
              RowHeights = (
                24
                24
                24
                24
                24)
            end
            object OutputData2: TMemo
              Left = 0
              Top = 215
              Width = 641
              Height = 136
              Align = alBottom
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Courier New'
              Font.Style = []
              Lines.Strings = (
                'OutputData')
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 1
            end
          end
        end
      end
      object TabMainEngine: TTabSheet
        Caption = #1043#1083#1072#1074#1085#1099#1077' '#1088#1072#1079#1084#1077#1088#1099
        ImageIndex = 6
        object pbMainEngine: TPaintBox
          Left = 0
          Top = 0
          Width = 754
          Height = 529
          Align = alClient
          Color = clActiveBorder
          ParentColor = False
          ParentShowHint = False
          ShowHint = False
          OnPaint = pbMainEnginePaint
        end
        object cbMainSizeMetric: TCheckBox
          Left = 2
          Top = 5
          Width = 152
          Height = 23
          Caption = #1087#1086#1082#1072#1079#1072#1090#1100' '#1088#1072#1079#1084#1077#1088#1099
          Color = clWhite
          ParentColor = False
          TabOrder = 0
          OnClick = cbMainSizeMetricClick
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 504
      Width = 657
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
        OnClick = btnSaveOutputClick
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
  object ds_calc: TDataSource
    DataSet = q_calculations
    Left = 116
    Top = 372
  end
  object q_calculations: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterDelete = q_calculationsAfterDelete
    AfterOpen = q_calculationsAfterOpen
    AfterPost = q_calculationsAfterPost
    AfterScroll = q_calculationsAfterScroll
    BeforeClose = q_calculationsBeforeClose
    BeforeScroll = q_calculationsBeforeScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select c.*, e.name as engine_name'
      ' from calculations C, engines E'
      'where '
      'c.ID_ENGINE = e.id'
      'order by calc_date desc')
    UpdateObject = updateCalc
    Left = 40
    Top = 370
    object q_calculationsID: TIntegerField
      FieldName = 'ID'
      Origin = 'CALCULATIONS.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_calculationsID_ENGINE: TIntegerField
      FieldName = 'ID_ENGINE'
      Origin = 'CALCULATIONS.ID_ENGINE'
    end
    object q_calculationsNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'CALCULATIONS.NAME'
      Size = 64
    end
    object q_calculationsCALC_DATE: TDateTimeField
      FieldName = 'CALC_DATE'
      Origin = 'CALCULATIONS.CALC_DATE'
    end
    object q_calculationsCALC_TYPE: TIBStringField
      FieldName = 'CALC_TYPE'
      Origin = 'CALCULATIONS.CALC_TYPE'
      Size = 16
    end
    object q_calculationsPAZ_STATOR_TYPE: TSmallintField
      FieldName = 'PAZ_STATOR_TYPE'
      Origin = 'CALCULATIONS.PAZ_STATOR_TYPE'
    end
    object q_calculationsPAZ_ROTOR_TYPE: TSmallintField
      FieldName = 'PAZ_ROTOR_TYPE'
      Origin = 'CALCULATIONS.PAZ_ROTOR_TYPE'
    end
    object q_calculationsDESCR: TIBStringField
      FieldName = 'DESCR'
      Origin = 'CALCULATIONS.DESCR'
      Size = 1024
    end
    object q_calculationsINPUTFILE: TIBStringField
      FieldName = 'INPUTFILE'
      Origin = 'CALCULATIONS.INPUTFILE'
      Size = 8192
    end
    object q_calculationsOUTPUTFILE: TIBStringField
      FieldName = 'OUTPUTFILE'
      Origin = 'CALCULATIONS.OUTPUTFILE'
      Size = 16384
    end
    object q_calculationsCALC_TYPE_NUM: TSmallintField
      FieldName = 'CALC_TYPE_NUM'
      Origin = 'CALCULATIONS.CALC_TYPE_NUM'
    end
    object q_calculationsSTEEL_ROTOR: TSmallintField
      FieldName = 'STEEL_ROTOR'
      Origin = 'CALCULATIONS.STEEL_ROTOR'
    end
    object q_calculationsSTEEL_STATOR: TSmallintField
      FieldName = 'STEEL_STATOR'
      Origin = 'CALCULATIONS.STEEL_STATOR'
    end
    object q_calculationsOBMOTKA_SCHEMA: TSmallintField
      FieldName = 'OBMOTKA_SCHEMA'
      Origin = 'CALCULATIONS.OBMOTKA_SCHEMA'
    end
    object q_calculationsOBMOTKA_STERGHEN: TSmallintField
      FieldName = 'OBMOTKA_STERGHEN'
      Origin = 'CALCULATIONS.OBMOTKA_STERGHEN'
    end
    object q_calculationsENGINE_NAME: TIBStringField
      FieldName = 'ENGINE_NAME'
      Origin = 'ENGINES.NAME'
      Size = 64
    end
    object q_calculationsOUTPUT_COUNT: TIntegerField
      FieldName = 'OUTPUT_COUNT'
      Origin = 'CALCULATIONS.OUTPUT_COUNT'
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
        Action = main.actCreateCalc
      end
      object N5: TMenuItem
        Caption = #1050#1083#1086#1085#1080#1088#1086#1074#1072#1090#1100
        OnClick = N5Click
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
  object updateCalc: TIBUpdateSQL
    ModifySQL.Strings = (
      'update  calculations  set'
      ' name =:name,'
      ' descr = :descr,'
      ' Calc_Type_Num = :calc_Type_Num,'
      ' Paz_Stator_Type  = :Paz_stator_Type,'
      ' Paz_Rotor_Type = :Paz_Rotor_Type,'
      ' STEEL_ROTOR = :STEEL_ROTOR,'
      ' STEEL_STATOR  = :Steel_Stator,'
      ' OBMOTKA_SCHEMa  =   :OBMOTKA_SCHEMa,'
      ' OBMOTKA_STERGHEN  =:OBMOTKA_STERGHEN  ,'
      ' InputFile = :InputFile,'
      ' OutputFile = :OutputFile,'
      ' Output_Count =:Output_Count'
      'where id  = :ID')
    DeleteSQL.Strings = (
      'delete from calculations '
      'where id  = :ID')
    Left = 78
    Top = 370
  end
  object q_table2: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterPost = q_table2AfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_calc
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
    Left = 613
    Top = 458
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
    Left = 655
    Top = 458
  end
  object updateTable2: TIBUpdateSQL
    ModifySQL.Strings = (
      'update calc_values set'
      ' cv_value=:cv_value'
      'where'
      ' id = :id')
    Left = 697
    Top = 460
  end
  object q_Table4: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterOpen = q_Table4AfterOpen
    AfterPost = q_table2AfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_calc
    SQL.Strings = (
      'select * from calc_values CV,'
      'Parameters P'
      'where'
      'cv.calc_id = :ID'
      'and p.id=cv.param_ID'
      'and param_group='#39'TABLE4'#39
      'and p.used_in_calc_type containing :calc_TYPE'
      '')
    UpdateObject = UpdateTable4
    Left = 599
    Top = 406
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
  object ds_Table4: TDataSource
    DataSet = q_Table4
    Left = 641
    Top = 408
  end
  object q_table5: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterPost = q_table2AfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_calc
    SQL.Strings = (
      'select * from calc_values CV,'
      'Parameters P'
      'where'
      'cv.calc_id = :ID'
      'and p.id=cv.param_ID'
      'and param_group='#39'TABLE5'#39
      'and p.used_in_calc_type containing :calc_TYPE'
      '')
    UpdateObject = UpdateTable5
    Left = 749
    Top = 190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'calc_TYPE'
        ParamType = ptUnknown
      end>
  end
  object ds_table5: TDataSource
    DataSet = q_table5
    Left = 819
    Top = 204
  end
  object q_TableUmaxMin: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterPost = q_table2AfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_calc
    SQL.Strings = (
      'select * from calc_values CV,'
      'Parameters P'
      'where'
      'cv.calc_id = :ID'
      'and p.id=cv.param_ID'
      'and param_group='#39'TABLEUMAXMIN'#39
      'and p.used_in_calc_type containing :calc_TYPE'
      '')
    UpdateObject = updateTableUMaxMin
    Left = 775
    Top = 266
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
  object ds_TableUmaxMin: TDataSource
    DataSet = q_TableUmaxMin
    Left = 823
    Top = 266
  end
  object q_table6: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterOpen = q_table6AfterOpen
    AfterPost = q_calculationsAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_calc
    SQL.Strings = (
      'select * from calc_values CV,'
      'Parameters P'
      'where'
      'cv.calc_id = :ID'
      'and p.id=cv.param_ID'
      'and param_group='#39'TABLE6'#39
      'and p.used_in_calc_type containing :calc_TYPE'
      '')
    UpdateObject = UpdateTable6
    Left = 777
    Top = 334
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
  object ds_table6: TDataSource
    DataSet = q_table6
    Left = 867
    Top = 340
  end
  object UpdateTable4: TIBUpdateSQL
    ModifySQL.Strings = (
      'update calc_values set'
      ' cv_value=:cv_value'
      'where'
      ' id = :id')
    Left = 691
    Top = 410
  end
  object UpdateTable5: TIBUpdateSQL
    ModifySQL.Strings = (
      'update calc_values set'
      ' cv_value=:cv_value'
      'where'
      ' id = :id')
    Left = 867
    Top = 206
  end
  object UpdateTable6: TIBUpdateSQL
    ModifySQL.Strings = (
      'update calc_values set'
      ' cv_value=:cv_value'
      'where'
      ' id = :id')
    Left = 821
    Top = 336
  end
  object updateTableUMaxMin: TIBUpdateSQL
    ModifySQL.Strings = (
      'update calc_values set'
      ' cv_value=:cv_value'
      'where'
      ' id = :id')
    Left = 871
    Top = 268
  end
  object q_N6: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterPost = q_table2AfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_calc
    SQL.Strings = (
      '                                       select * from N6'
      'where'
      'N6.id_calc = :ID'
      'and n6.arraytype='#39'N6'#39
      'order by n6.array_num'
      '')
    UpdateObject = updateN6
    Left = 843
    Top = 454
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object DS_N6: TDataSource
    DataSet = q_N6
    Left = 805
    Top = 454
  end
  object updateN6: TIBUpdateSQL
    ModifySQL.Strings = (
      'update n6 set'
      ' array_value=:array_value'
      'where'
      'id=:id')
    Left = 769
    Top = 454
  end
  object UpdateRPPP: TIBUpdateSQL
    ModifySQL.Strings = (
      'update n6 set'
      ' array_value=:array_value'
      'where'
      'id=:id')
    Left = 803
    Top = 400
  end
  object q_RPPP: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterPost = q_table2AfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_calc
    SQL.Strings = (
      '  select * from N6'
      'where'
      'N6.id_calc = :ID'
      'and n6.arraytype='#39'RPPP'#39
      'order by n6.array_num'
      '')
    UpdateObject = UpdateRPPP
    Left = 771
    Top = 398
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object ds_RPPP: TDataSource
    DataSet = q_RPPP
    Left = 841
    Top = 402
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 232
    Top = 286
  end
  object q_OutPutParam_NOFPOINT: TIBSQL
    Database = DM.DB
    ParamCheck = True
    SQL.Strings = (
      'select  ID, OutputLine, OutputColumn'
      'from Parameters '
      'where In_Out = '#39'OUT'#39' and param_GROUP = '#39'NOFPOINT'#39)
    Transaction = DM.tranDefault
    Left = 397
    Top = 151
  end
  object q_outputData_NOfPoint: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_calc
    SQL.Strings = (
      'select * from calc_values CV,'
      'Parameters P'
      'where'
      'cv.calc_id = :ID'
      'and p.id=cv.param_ID'
      'and p.in_out='#39'OUT'#39' and p.PARAM_GROUP='#39'NOFPOINT'#39
      'order by p.output_sort, cv.cv_number')
    Left = 408
    Top = 228
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object q_outputData_NOfPointCV_NUMBER: TIntegerField
      FieldName = 'CV_NUMBER'
      Origin = 'CALC_VALUES.CV_NUMBER'
    end
    object q_outputData_NOfPointCV_VALUE_STR: TIBStringField
      FieldName = 'CV_VALUE_STR'
      Origin = 'CALC_VALUES.CV_VALUE_STR'
      Size = 64
    end
    object q_outputData_NOfPointCV_VALUE: TFloatField
      FieldName = 'CV_VALUE'
      Origin = 'CALC_VALUES.CV_VALUE'
    end
    object q_outputData_NOfPointNAME_RUS: TIBStringField
      FieldName = 'NAME_RUS'
      Origin = 'PARAMETERS.NAME_RUS'
      Size = 64
    end
    object q_outputData_NOfPointNAME_SHORT: TIBStringField
      FieldName = 'NAME_SHORT'
      Origin = 'PARAMETERS.NAME_SHORT'
      Size = 16
    end
    object q_outputData_NOfPointED_IZM: TIBStringField
      FieldName = 'ED_IZM'
      Origin = 'PARAMETERS.ED_IZM'
      Size = 16
    end
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
