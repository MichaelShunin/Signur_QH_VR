inherited ExpForm: TExpForm
  Left = 17
  Top = 111
  Width = 1002
  Height = 642
  Caption = #1040#1088#1093#1080#1074#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1087#1088#1080#1073#1086#1088#1086#1074
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter4: TSplitter [0]
    Left = 0
    Top = 376
    Width = 994
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Color = clInfoBk
    ParentColor = False
  end
  object Panel_uP: TPanel [1]
    Left = 0
    Top = 0
    Width = 994
    Height = 376
    Align = alTop
    Color = clInfoBk
    Constraints.MinHeight = 200
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 601
      Top = 28
      Height = 347
      Align = alRight
    end
    object Panel5: TPanel
      Left = 604
      Top = 28
      Width = 389
      Height = 347
      Align = alRight
      BevelOuter = bvLowered
      Constraints.MaxWidth = 640
      Constraints.MinWidth = 320
      TabOrder = 0
      object Label4: TLabel
        Left = 1
        Top = 1
        Width = 387
        Height = 16
        Align = alTop
        Alignment = taCenter
        Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '
        Color = clGradientInactiveCaption
        ParentColor = False
      end
      object PageControl1: TPageControl
        Left = 1
        Top = 17
        Width = 387
        Height = 329
        ActivePage = TabSheet1
        Align = alClient
        MultiLine = True
        TabOrder = 0
        OnChange = PageControl1Change
        object TabSheet1: TTabSheet
          Caption = #1054#1073#1098#1077#1082#1090
          object cxObjectMemo: TcxDBMemo
            Left = 0
            Top = 72
            Width = 379
            Height = 185
            Align = alClient
            DataBinding.DataSource = ds_eksp_theme
            DataBinding.DataField = 'EKSP_SIGNALSOURCE'
            Properties.ScrollBars = ssVertical
            Style.Color = clWhite
            TabOrder = 0
          end
          object Panel1: TPanel
            Left = 0
            Top = 257
            Width = 379
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              379
              41)
            object cxButton3: TcxButton
              Left = 84
              Top = 4
              Width = 202
              Height = 29
              Anchors = [akLeft, akRight, akBottom]
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
              TabOrder = 0
              OnClick = cxButton3Click
              LookAndFeel.Kind = lfStandard
            end
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 379
            Height = 72
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            DesignSize = (
              379
              72)
            object Label5: TLabel
              Left = 4
              Top = 4
              Width = 52
              Height = 16
              Caption = #1054#1073#1098#1077#1082#1090':'
            end
            object Label12: TLabel
              Left = 5
              Top = 51
              Width = 153
              Height = 16
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103' '#1082' '#1086#1073#1098#1077#1082#1090#1091':'
            end
            object cbTheme: TcxCheckBox
              Left = 92
              Top = 0
              Width = 277
              Height = 24
              ParentBackground = True
              Properties.DisplayUnchecked = 'False'
              Properties.Caption = #1044#1083#1103' '#1074#1089#1077#1093' '#1087#1088#1080#1073#1086#1088#1086#1074' '#1086#1073#1098#1077#1082#1090#1072
              TabOrder = 0
              Visible = False
            end
            object cxDBTextEdit1: TcxDBTextEdit
              Left = 4
              Top = 24
              Width = 374
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'EKSP_THEME'
              Properties.ReadOnly = False
              Style.Color = clWhite
              TabOrder = 1
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = #1055#1088#1080#1073#1086#1088
          ImageIndex = 1
          object Panel6: TPanel
            Left = 0
            Top = 265
            Width = 379
            Height = 33
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              379
              33)
            object Label10: TLabel
              Left = 3
              Top = 0
              Width = 105
              Height = 16
              Anchors = [akLeft]
              Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1092#1072#1081#1083':'
              Visible = False
            end
            object btnEdit: TcxButton
              Left = 176
              Top = 5
              Width = 198
              Height = 24
              Anchors = [akLeft, akRight, akBottom]
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
              TabOrder = 0
              OnClick = btnEditClick
              LookAndFeel.Kind = lfStandard
            end
            object FileSource: TcxDBTextEdit
              Left = 3
              Top = 13
              Width = 373
              Height = 24
              Anchors = []
              BeepOnEnter = False
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'EKSP_SOURCEFILE'
              ParentShowHint = False
              Properties.Alignment.Horz = taRightJustify
              Properties.AutoSelect = False
              Properties.OnChange = FileSourcePropertiesChange
              ShowHint = True
              Style.BorderColor = cl3DLight
              Style.Color = clMenuBar
              Style.Shadow = True
              TabOrder = 1
              Visible = False
            end
          end
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 379
            Height = 100
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            OnClick = btnCreateAndShowImageClick
            DesignSize = (
              379
              100)
            object Label7: TLabel
              Left = 3
              Top = 76
              Width = 106
              Height = 16
              Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081':'
            end
            object Label13: TLabel
              Left = 3
              Top = 34
              Width = 136
              Height = 16
              Caption = #1055#1088#1080#1087#1080#1089#1072#1085' '#1082' '#1086#1073#1098#1077#1082#1090#1091':'
            end
            object eksp_header: TcxDBTextEdit
              Left = 0
              Top = 13
              Width = 374
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'EKSP_HEADER'
              Style.Color = clWhite
              TabOrder = 0
            end
            object cxDBTextEdit3: TcxDBTextEdit
              Left = 120
              Top = 75
              Width = 254
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'EKSP_AUTHOR'
              Style.Color = clWhite
              TabOrder = 1
            end
            object objectslist: TcxDBComboBox
              Left = 0
              Top = 50
              Width = 374
              Height = 24
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'EKSP_THEME'
              Properties.DropDownListStyle = lsFixedList
              Properties.DropDownSizeable = True
              Properties.ImmediatePost = True
              Properties.ImmediateUpdateText = True
              Properties.OnCloseUp = objectslistPropertiesCloseUp
              Style.Color = clWhite
              TabOrder = 2
            end
            object cxDBTextEdit2: TcxDBTextEdit
              Left = 0
              Top = -5
              Width = 374
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'DEVICE_NAME'
              Style.Color = cl3DLight
              Style.Edges = []
              TabOrder = 3
            end
          end
          object PageControl2: TPageControl
            Left = 0
            Top = 100
            Width = 379
            Height = 165
            ActivePage = TabSheet7
            Align = alClient
            Constraints.MinHeight = 70
            TabOrder = 2
            object TabSheet6: TTabSheet
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1082' '#1087#1088#1080#1073#1086#1088#1091
              object cxDeviceMemo: TcxDBMemo
                Left = 0
                Top = 0
                Width = 371
                Height = 134
                Align = alClient
                DataBinding.DataSource = ds_eksp_theme
                DataBinding.DataField = 'EKSP_MEMO'
                Properties.ScrollBars = ssVertical
                Style.Color = clWhite
                TabOrder = 0
              end
            end
            object TabSheet7: TTabSheet
              Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1084#1086#1076#1077#1084#1085#1086#1081' '#1089#1074#1103#1079#1080
              ImageIndex = 1
              object Label8: TLabel
                Left = 1
                Top = 30
                Width = 121
                Height = 32
                Alignment = taRightJustify
                Caption = #1055#1086#1083#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1076#1083#1103' '#1085#1072#1073#1086#1088#1072':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object Label15: TLabel
                Left = -1
                Top = 64
                Width = 300
                Height = 16
                Caption = #1085#1072#1087#1088#1080#1084#1077#1088', +7 495 362 32 00  '#1080#1083#1080' +7 8617 85 6390'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsItalic]
                ParentFont = False
              end
              object Label16: TLabel
                Left = 0
                Top = 86
                Width = 165
                Height = 16
                Caption = #1050#1086#1076' '#1076#1083#1103' '#1074#1099#1093#1086#1076#1072' "'#1074' '#1075#1086#1088#1086#1076'":'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Phone_Number: TcxDBTextEdit
                Left = 128
                Top = 36
                Width = 233
                Height = 24
                DataBinding.DataSource = ds_eksp_theme
                DataBinding.DataField = 'PHONE_NUMBER'
                Properties.MaxLength = 20
                TabOrder = 0
              end
              object modem: TDBCheckBox
                Left = 0
                Top = 8
                Width = 161
                Height = 17
                Caption = #1076#1086#1089#1090#1091#1087' '#1095#1077#1088#1077#1079' '#1084#1086#1076#1077#1084
                DataField = 'MODEM'
                DataSource = ds_eksp_theme
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = modemClick
              end
              object Access: TcxComboBox
                Left = 172
                Top = 85
                Width = 189
                Height = 24
                Properties.DropDownListStyle = lsEditFixedList
                Properties.DropDownRows = 11
                Properties.Items.Strings = (
                  #1087#1088#1103#1084#1086#1081' '#1074#1099#1093#1086#1076
                  '0'
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '6'
                  '7'
                  '8'
                  '9')
                TabOrder = 2
                OnClick = Tone_PulseClick
              end
              object Tone_Pulse: TRadioGroup
                Left = 160
                Top = -1
                Width = 212
                Height = 33
                Caption = #1085#1072#1073#1086#1088
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  #1080#1084#1087#1091#1083#1100#1089#1085#1099#1081
                  #1090#1086#1085#1072#1083#1100#1085#1099#1081)
                TabOrder = 3
                OnClick = Tone_PulseClick
              end
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = #1057#1080#1075#1085#1072#1083#1099
          ImageIndex = 2
          TabVisible = False
          object Splitter2: TSplitter
            Left = 0
            Top = 87
            Width = 379
            Height = 3
            Cursor = crVSplit
            Align = alBottom
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 90
            Width = 379
            Height = 208
            Align = alBottom
            Caption = #1054' '#1089#1080#1075#1085#1072#1083#1077
            TabOrder = 0
            DesignSize = (
              379
              208)
            object Label1: TLabel
              Left = 4
              Top = 147
              Width = 109
              Height = 16
              Caption = #1060#1072#1081#1083' '#1089' '#1076#1072#1085#1085#1099#1084#1080':'
            end
            object Label2: TLabel
              Left = 4
              Top = 16
              Width = 86
              Height = 16
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
            end
            object Label9: TLabel
              Left = 4
              Top = 121
              Width = 182
              Height = 16
              Cursor = crHandPoint
              Caption = #1063#1072#1089#1090#1086#1090#1072' '#1076#1080#1089#1082#1088#1077#1090#1080#1079#1072#1094#1080#1080', '#1043#1094':'
              OnClick = deltxDblClick
            end
            object deltx: TcxDBTextEdit
              Left = 207
              Top = 119
              Width = 165
              Height = 24
              Cursor = crHandPoint
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = DS_Signals
              DataBinding.DataField = 'DELTX'
              Style.Color = clMenuBar
              Style.LookAndFeel.NativeStyle = False
              Style.Shadow = True
              TabOrder = 0
              OnClick = deltxDblClick
            end
            object cxDBMemo2: TcxDBMemo
              Left = 2
              Top = 31
              Width = 369
              Height = 54
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = DS_Signals
              DataBinding.DataField = 'SIGNALMEMO'
              Properties.ScrollBars = ssVertical
              TabOrder = 1
            end
            object cxDBTextEdit4: TcxDBTextEdit
              Left = 4
              Top = 167
              Width = 369
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = DS_Signals
              DataBinding.DataField = 'FILEDAT'
              Style.Color = clMenuBar
              Style.Shadow = True
              TabOrder = 2
            end
            object cxButton1: TcxButton
              Left = 88
              Top = 90
              Width = 194
              Height = 25
              Anchors = [akLeft, akRight, akBottom]
              Caption = #1055#1088#1072#1074#1082#1072
              TabOrder = 3
              OnClick = cxButton1Click
              LookAndFeel.Kind = lfStandard
            end
          end
          object DBGridEh1: TDBGridEh
            Left = 0
            Top = 0
            Width = 379
            Height = 87
            Align = alClient
            AutoFitColWidths = True
            DataSource = DS_Signals
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CHANAL_NOMER'
                Footers = <>
                Title.Caption = #8470
                Width = 31
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'NAMEY'
                Footers = <>
                Title.Caption = #1086#1089#1100' Y'
                Width = 54
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'RAZMY'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = '[ ]'
                Width = 29
              end
              item
                EditButtons = <>
                FieldName = 'CHANAL_HEADER'
                Footers = <>
                Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              end
              item
                EditButtons = <>
                FieldName = 'POINTALL'
                Footers = <>
                Title.Caption = #1054#1090#1089#1095#1077#1090#1099
              end
              item
                DisplayFormat = '0.00000'
                EditButtons = <>
                FieldName = 'A1'
                Footers = <>
                Width = 52
              end
              item
                DisplayFormat = '0.00000'
                EditButtons = <>
                FieldName = 'A0'
                Footers = <>
                Width = 47
              end>
          end
        end
        object TabSheet4: TTabSheet
          Caption = #1043#1088#1072#1092#1080#1082#1080
          ImageIndex = 3
          TabVisible = False
          object GridImages: TDBGridEh
            Left = 0
            Top = 0
            Width = 379
            Height = 144
            Align = alClient
            AutoFitColWidths = True
            DataSource = ds_CurveSet
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
            OnDblClick = btnCreateAndShowImageClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'VIEW_HEADER'
                Footers = <>
                Title.Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
                Width = 110
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'VIEW_STYLE'
                Footers = <>
                Title.Caption = #1057#1090#1080#1083#1100
                Width = 93
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'VIEW_PAGE'
                Footers = <>
                Title.Caption = #1089#1090#1088#1072#1085#1080#1094#1099'( '#1095#1080#1089#1083#1086' '#1082#1088#1080#1074#1099#1093')'
                Width = 400
              end>
          end
          object Curveset_GB: TGroupBox
            Left = 0
            Top = 144
            Width = 379
            Height = 154
            Align = alBottom
            TabOrder = 1
            DesignSize = (
              379
              154)
            object Label11: TLabel
              Left = 4
              Top = 16
              Width = 86
              Height = 16
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
            end
            object cxDBMemo3: TcxDBMemo
              Left = 2
              Top = 38
              Width = 375
              Height = 66
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = ds_CurveSet
              DataBinding.DataField = 'VIEW_MEMO'
              Properties.ScrollBars = ssVertical
              TabOrder = 0
            end
            object cxButton2: TcxButton
              Left = 241
              Top = 10
              Width = 129
              Height = 25
              Anchors = [akTop, akRight]
              Caption = #1055#1088#1072#1074#1082#1072
              TabOrder = 1
              OnClick = cxButton2Click
              LookAndFeel.Kind = lfStandard
            end
            object btnDeleteCurveset: TcxButton
              Left = 8
              Top = 106
              Width = 141
              Height = 25
              Caption = #1059#1076#1072#1083#1080#1090#1100'  '#1075#1088#1072#1092#1080#1082
              TabOrder = 2
              OnClick = btnDeleteCurvesetClick
              LookAndFeel.Kind = lfStandard
            end
            object AllCurveSet_CB: TCheckBox
              Left = 8
              Top = 134
              Width = 217
              Height = 17
              Caption = #1074#1089#1077' '#1075#1088#1072#1092#1080#1082#1080' '#1087#1088#1080#1073#1086#1088#1072
              TabOrder = 3
            end
            object btnShowImage: TcxButton
              Left = 235
              Top = 106
              Width = 135
              Height = 25
              Anchors = [akTop, akRight]
              Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1075#1088#1072#1092#1080#1082
              TabOrder = 4
              OnClick = btnCreateAndShowImageClick
              LookAndFeel.Kind = lfStandard
            end
          end
        end
        object ImageTab: TTabSheet
          Caption = #1054#1090#1095#1077#1090#1099
          ImageIndex = 4
          TabVisible = False
          object DBGridEh2: TDBGridEh
            Left = 0
            Top = 0
            Width = 379
            Height = 257
            Align = alClient
            AllowedOperations = []
            AutoFitColWidths = True
            DataSource = ds_ekspParams
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
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PARAMNAME'
                Footers = <>
                Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                Width = 237
              end
              item
                Alignment = taRightJustify
                EditButtons = <>
                FieldName = 'PARAMVALUE'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1080
                Width = 109
              end>
          end
          object Panel7: TPanel
            Left = 0
            Top = 257
            Width = 379
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              379
              41)
            object btnPrintParamReport: TcxButton
              Left = 92
              Top = 8
              Width = 198
              Height = 25
              Anchors = [akLeft, akRight, akBottom]
              Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1080#1090#1100' '#1086#1090#1095#1077#1090
              TabOrder = 0
              OnClick = btnPrintParamReportClick
              LookAndFeel.Kind = lfStandard
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = #1040#1088#1093#1080#1074' '#1087#1088#1080#1073#1086#1088#1072
          ImageIndex = 5
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 379
            Height = 27
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              379
              27)
            object Label6: TLabel
              Left = 4
              Top = 5
              Width = 7
              Height = 16
              Caption = 'c'
            end
            object Label14: TLabel
              Left = 132
              Top = 5
              Width = 16
              Height = 16
              Caption = #1087#1086
            end
            object btnCreateHTMLReport: TSpeedButton
              Left = 273
              Top = 0
              Width = 25
              Height = 25
              Hint = #1055#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083' '#1074' '#1092#1086#1088#1084#1072#1090#1077' HTML'
              Anchors = [akTop, akRight]
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888000000
                0000888880777777777088800C7FBFFFBF70880CCC7FFFBFFF7080CCCC7FB444
                7F7080CCCC7F6CCC4F700CCCCC7F672C4F700CCC227F6F724F700CC2227FB666
                7F700CC2227FFFBF00000CC8227FBFFF7F7887CCF87FFFBF778887CF8F777777
                7088887CC8F82222088888877CCF820088888888877777888888}
              ParentShowHint = False
              ShowHint = True
              OnClick = btnCreateHTMLReportClick
            end
            object SpeedButton1: TSpeedButton
              Left = 301
              Top = 0
              Width = 25
              Height = 25
              Hint = #1055#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083' '#1074' '#1092#1086#1088#1084#1072#1090#1077' Excel'
              Anchors = [akTop, akRight]
              Enabled = False
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                888888888888888888888888888888800000000000000006666007777777706E
                EF0880E6666606EEF088880E66606EEF06088880E606EEF000088888006EEF08
                8888888806EEF008888888806EEF067088888806EEF0E6670888806EEF080E66
                70880FFFF08880EEEE0800000888880000088888888888888888}
              ParentShowHint = False
              ShowHint = True
            end
            object DD1: TDateTimePicker
              Left = 20
              Top = 1
              Width = 105
              Height = 24
              Date = 38702.369325798610000000
              Time = 38702.369325798610000000
              TabOrder = 0
              OnChange = DD1Change
            end
            object DD2: TDateTimePicker
              Left = 156
              Top = 1
              Width = 105
              Height = 24
              Date = 38702.000000000000000000
              Time = 38702.000000000000000000
              TabOrder = 1
              OnChange = DD1Change
            end
          end
          object ArchievPC: TPageControl
            Left = 0
            Top = 27
            Width = 379
            Height = 271
            ActivePage = TabSheet8
            Align = alClient
            MultiLine = True
            TabOrder = 1
            TabPosition = tpBottom
            OnChange = ArchievPCChange
            object TabSheet8: TTabSheet
              Caption = #1042#1082#1083'./'#1074#1099#1082#1083'.'
              object Splitter3: TSplitter
                Left = 0
                Top = 130
                Width = 371
                Height = 3
                Cursor = crVSplit
                Align = alBottom
              end
              object OnOffGrid: TDBGridEh
                Left = 0
                Top = 0
                Width = 371
                Height = 130
                Align = alClient
                AutoFitColWidths = True
                DataSource = ds_OnOff_F
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -13
                FooterFont.Name = 'MS Sans Serif'
                FooterFont.Style = []
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -13
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnGetCellParams = OnOffGridGetCellParams
                Columns = <
                  item
                    Alignment = taCenter
                    DisplayFormat = 'dd.mm.yy hh:mm'
                    EditButtons = <>
                    FieldName = 'ONOFF_EVENT'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1074#1088#1077#1084#1103
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'STATUS'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1089#1090#1072#1090#1091#1089
                    Width = 80
                  end>
              end
              object OnOff_Info: TcxMemo
                Left = 0
                Top = 133
                Width = 368
                Height = 106
                Align = alBottom
                Constraints.MinHeight = 29
                Lines.Strings = (
                  'OnOff_Info')
                Properties.ReadOnly = True
                Properties.ScrollBars = ssVertical
                Style.Color = 16776176
                Style.Shadow = True
                TabOrder = 1
              end
            end
            object TabSheet10: TTabSheet
              Caption = #1063#1072#1089#1086#1074#1099#1077' '#1076#1072#1085#1085#1099#1077
              ImageIndex = 1
              object HoursGrid: TDBGridEh
                Left = 0
                Top = 0
                Width = 364
                Height = 189
                Align = alClient
                AutoFitColWidths = True
                DataSource = ds_HoursData_F
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -13
                FooterFont.Name = 'MS Sans Serif'
                FooterFont.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -13
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Alignment = taCenter
                    DisplayFormat = 'dd.mm.yy hh:mm'
                    EditButtons = <>
                    FieldName = 'HOUR_VALUE'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1076#1072#1090#1072
                    Width = 102
                  end
                  item
                    Alignment = taCenter
                    DisplayFormat = '0.00'
                    EditButtons = <>
                    FieldName = 'S_VALUE'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1079#1085#1072#1095#1077#1085#1080#1077
                    Width = 127
                  end
                  item
                    DisplayFormat = '0.00'
                    EditButtons = <>
                    FieldName = 'D_VALUE'
                    Footers = <>
                    Title.Caption = #1087#1088#1080#1088#1072#1097#1077#1085#1080#1077
                    Width = 96
                  end>
              end
            end
            object TabSheet11: TTabSheet
              Caption = #1057#1091#1090#1086#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
              ImageIndex = 2
              object DaysGrid: TDBGridEh
                Left = 0
                Top = 0
                Width = 364
                Height = 189
                Align = alClient
                AutoFitColWidths = True
                DataSource = ds_DaysData_F
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -13
                FooterFont.Name = 'MS Sans Serif'
                FooterFont.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -13
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Alignment = taCenter
                    DisplayFormat = 'dd.mm.yy'
                    EditButtons = <>
                    FieldName = 'DAY_VALUE'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1076#1072#1090#1072
                    Width = 102
                  end
                  item
                    Alignment = taCenter
                    DisplayFormat = '0.00'
                    EditButtons = <>
                    FieldName = 'S_VALUE'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1079#1085#1072#1095#1077#1085#1080#1077
                    Width = 127
                  end
                  item
                    DisplayFormat = '0.00'
                    EditButtons = <>
                    FieldName = 'D_VALUE'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1087#1088#1080#1088#1072#1097#1077#1085#1080#1077
                    Width = 111
                  end>
              end
            end
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 28
      Width = 600
      Height = 347
      Align = alClient
      Caption = 'Panel2'
      Constraints.MinHeight = 100
      Constraints.MinWidth = 400
      TabOrder = 1
      object cxGrid1: TcxGrid
        Left = 1
        Top = 1
        Width = 598
        Height = 298
        Align = alClient
        BevelInner = bvSpace
        BevelOuter = bvNone
        BevelKind = bkSoft
        TabOrder = 0
        OnEnter = cxGrid1Enter
        LookAndFeel.NativeStyle = True
        object cxGrid1DBTableView1: TcxGridDBTableView
          DataController.DataSource = ds_eksp_theme
          DataController.DetailKeyFieldNames = 'EKSP_THEME'
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Column = cxGrid1DBTableView1DBColumn1
            end>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.ImmediateEditor = False
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.CellTextMaxLineCount = 1
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.IndicatorWidth = 6
          object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
            Caption = #1054#1073#1098#1077#1082#1090
            Visible = False
            GroupIndex = 0
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            SortOrder = soAscending
            Width = 139
            DataBinding.FieldName = 'EKSP_THEME'
          end
          object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
            Caption = #1055#1088#1080#1073#1086#1088
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            SortOrder = soAscending
            Width = 188
            DataBinding.FieldName = 'EKSP_HEADER'
          end
          object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1089
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 113
            DataBinding.FieldName = 'EKSP_DATE'
          end
          object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1087#1086
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 121
            DataBinding.FieldName = 'DATETIME_FINISH'
          end
          object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
            Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 123
            DataBinding.FieldName = 'EKSP_AUTHOR'
          end
          object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
            DataBinding.FieldName = 'EKSP_NOMER'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object Panel3: TPanel
        Left = 1
        Top = 299
        Width = 598
        Height = 47
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        DesignSize = (
          598
          47)
        object btnDelete: TcxButton
          Left = 264
          Top = 18
          Width = 213
          Height = 29
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1073#1086#1088' '#1080#1079' '#1073#1072#1079#1099
          TabOrder = 0
          Visible = False
          OnClick = btnDeleteClick
          LookAndFeel.Kind = lfStandard
        end
        object btnCreateAndShowImage: TcxButton
          Left = 335
          Top = 6
          Width = 250
          Height = 29
          Anchors = [akTop, akRight]
          Caption = #1043#1088#1072#1092#1080#1082' '#1079#1072' '#1074#1089#1077' '#1074#1088#1077#1084#1103' '#1085#1072#1073#1083#1102#1076#1077#1085#1080#1103
          TabOrder = 1
          OnClick = btnCreateAndShowImageClick
          LookAndFeel.Kind = lfStandard
        end
        object AllThemeExp: TCheckBox
          Left = 180
          Top = 20
          Width = 189
          Height = 17
          Caption = #1074#1089#1077' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1099' '#1090#1077#1084#1099
          TabOrder = 2
          Visible = False
        end
        object btnLoadInfoFromDevice: TcxButton
          Left = 8
          Top = 6
          Width = 213
          Height = 29
          Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1080#1073#1086#1088#1086#1084
          TabOrder = 3
          OnClick = btnLoadInfoFromDeviceClick
          LookAndFeel.Kind = lfStandard
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 992
      Height = 27
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 2
      Visible = False
      object Label3: TLabel
        Left = 8
        Top = 4
        Width = 78
        Height = 16
        Caption = #1048#1084#1103' '#1072#1088#1093#1080#1074#1072':'
      end
      object cbDatabases: TComboBox
        Left = 104
        Top = 1
        Width = 445
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 0
        OnChange = cbDatabasesChange
      end
    end
  end
  object Panel11: TPanel [2]
    Left = 0
    Top = 379
    Width = 994
    Height = 198
    Align = alClient
    Caption = 'Panel11'
    TabOrder = 1
    DesignSize = (
      994
      198)
    object ChartPC: TPageControl
      Left = 1
      Top = 1
      Width = 992
      Height = 196
      ActivePage = TabSheet12
      Align = alClient
      Constraints.MinHeight = 150
      MultiLine = True
      TabOrder = 0
      object TabSheet12: TTabSheet
        Caption = #1063#1072#1089#1086#1074#1099#1077' '#1076#1072#1085#1085#1099#1077
        ImageIndex = 1
        object Hours_Chart: TDBChart
          Left = 0
          Top = 0
          Width = 984
          Height = 98
          AnimatedZoom = True
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          Title.Text.Strings = (
            '')
          Title.Visible = False
          OnClickSeries = Hours_ChartClickSeries
          BottomAxis.DateTimeFormat = 'dd.mm hh:mm'
          BottomAxis.Visible = False
          LeftAxis.Labels = False
          LeftAxis.Visible = False
          View3D = False
          OnAfterDraw = Hours_ChartAfterDraw
          Align = alClient
          TabOrder = 0
          object BarSeries1: TAreaSeries
            Marks.ArrowLength = 20
            Marks.Style = smsValue
            Marks.Visible = True
            DataSource = HoursData_F
            SeriesColor = clTeal
            ShowInLegend = False
            ValueFormat = '#,##0.#'
            DrawArea = True
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = True
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'HOUR_VALUE'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'D_VALUE'
          end
        end
        object onOff_Hours_Chart: TDBChart
          Left = 0
          Top = 98
          Width = 984
          Height = 67
          AllowPanning = pmNone
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Gradient.EndColor = 8421631
          Gradient.Visible = True
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            '')
          Title.Visible = False
          BottomAxis.DateTimeFormat = 'dd.mm hh:mm'
          LeftAxis.Labels = False
          LeftAxis.Visible = False
          View3D = False
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 1
          object BarSeries3: TAreaSeries
            Marks.ArrowLength = 20
            Marks.BackColor = clSilver
            Marks.Style = smsXValue
            Marks.Visible = True
            DataSource = OnOff_VT_Chart
            SeriesColor = 16777088
            ShowInLegend = False
            ValueFormat = '#,##0.#'
            DrawArea = True
            LinePen.Color = 16744448
            LinePen.Style = psDash
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'ONOFF_EVENT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'STATUS'
          end
        end
      end
      object TabSheet13: TTabSheet
        Caption = #1057#1091#1090#1086#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        ImageIndex = 2
        object Days_Chart: TDBChart
          Left = 0
          Top = 0
          Width = 777
          Height = 203
          AnimatedZoom = True
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          Title.Text.Strings = (
            '')
          Title.Visible = False
          OnClickSeries = Days_ChartClickSeries
          BottomAxis.DateTimeFormat = 'dd.mm hh:mm'
          BottomAxis.Visible = False
          LeftAxis.Labels = False
          LeftAxis.Visible = False
          View3D = False
          OnAfterDraw = Days_ChartAfterDraw
          Align = alClient
          TabOrder = 0
          object OnOff_Days_Chart: TDBChart
            Left = 1
            Top = 135
            Width = 775
            Height = 67
            AllowPanning = pmNone
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            Gradient.EndColor = 8421631
            Gradient.Visible = True
            MarginLeft = 0
            MarginRight = 0
            MarginTop = 0
            Title.Text.Strings = (
              '')
            Title.Visible = False
            BottomAxis.DateTimeFormat = 'dd.mm hh:mm'
            LeftAxis.Labels = False
            LeftAxis.Visible = False
            View3D = False
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object AreaSeries2: TAreaSeries
              Marks.ArrowLength = 20
              Marks.BackColor = clSilver
              Marks.Style = smsXValue
              Marks.Visible = True
              DataSource = OnOff_VT_Chart
              SeriesColor = 16777088
              ShowInLegend = False
              ValueFormat = '#,##0.#'
              DrawArea = True
              LinePen.Color = 16744448
              LinePen.Style = psDash
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Multiplier = 1.000000000000000000
              XValues.Order = loAscending
              XValues.ValueSource = 'ONOFF_EVENT'
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1.000000000000000000
              YValues.Order = loNone
              YValues.ValueSource = 'STATUS'
            end
          end
          object AreaSeries1: TAreaSeries
            Marks.ArrowLength = 20
            Marks.Style = smsValue
            Marks.Visible = True
            DataSource = DaysData_F
            SeriesColor = 12615680
            ShowInLegend = False
            ValueFormat = '#,##0.#'
            DrawArea = True
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = True
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'DAY_VALUE'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'D_VALUE'
          end
        end
      end
    end
    object mousePanel: TPanel
      Left = 258
      Top = 4
      Width = 730
      Height = 19
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        730
        19)
      object cxButton4: TcxButton
        Left = 508
        Top = 0
        Width = 61
        Height = 20
        Hint = #1087#1086#1082#1072#1079#1072#1090#1100' 24 '#1095#1072#1089#1072' '#1086#1090' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086'  '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1095#1072#1089#1086#1074#1099#1093' '#1076#1072#1085#1085#1099#1093' '#1084#1086#1084#1077#1085#1090#1072
        Anchors = [akTop, akRight]
        Caption = '24 '#1095#1072#1089#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = cxButton4Click
        LookAndFeel.Kind = lfStandard
      end
      object cxButton5: TcxButton
        Left = 574
        Top = 0
        Width = 61
        Height = 20
        Hint = 
          #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1090#1088#1080#1076#1094#1072#1090#1100' '#1089#1091#1090#1086#1082' '#1086#1090' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1089#1091#1090#1086#1095#1085 +
          #1099#1093' '#1076#1072#1085#1085#1099#1093' '#1079#1085#1072#1095#1077#1085#1080#1103
        Anchors = [akTop, akRight]
        Caption = '30 '#1089#1091#1090#1086#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = cxButton5Click
        LookAndFeel.Kind = lfStandard
      end
      object cxButton6: TcxButton
        Left = 480
        Top = 0
        Width = 22
        Height = 20
        Hint = #1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1074#1099#1089#1090#1072#1074#1080#1090#1100' '#1084#1072#1089#1096#1090#1072#1073' '#1087#1086' '#1086#1089#1080' '#1086#1088#1076#1080#1085#1072#1090
        Anchors = [akTop, akRight]
        Caption = 'Y'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = SpeedButton2Click
        LookAndFeel.Kind = lfStandard
      end
    end
  end
  inherited MainMenu: TMainMenu
    Left = 116
    Top = 248
    object N4: TMenuItem [0]
      Caption = #1060#1072#1081#1083
      object N5: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = N5Click
      end
    end
    inherited miFile: TMenuItem
      Caption = #1040#1088#1093#1080#1074
      object miRefresh: TMenuItem [0]
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        OnClick = miRefreshClick
      end
      object N1: TMenuItem [1]
        Caption = #1055#1088#1080#1073#1086#1088
        object miAddSignurDevice: TMenuItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1074#1099#1081
          OnClick = miAddSignurDeviceClick
        end
        object N7: TMenuItem
          Caption = #1050#1086#1088#1088#1077#1082#1094#1080#1103' '#1089#1074#1086#1081#1089#1090#1074
          OnClick = N7Click
        end
        object N8: TMenuItem
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1073#1086#1088' '#1080' '#1074#1089#1077' '#1077#1075#1086' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1072#1088#1093#1080#1074#1072
          OnClick = btnDeleteClick
        end
      end
      object miClear: TMenuItem [2]
        Caption = #1054#1095#1080#1089#1090#1082#1072' '#1082#1072#1090#1072#1083#1086#1075#1072
        Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1074#1088#1077#1084#1077#1085#1085#1099#1093' '#1080' '#1085#1077#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1099#1093' '#1092#1072#1081#1083#1086#1074
        OnClick = miClearClick
      end
      inherited miClose: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1072#1088#1093#1080#1074
        ImageIndex = 0
      end
      object N9: TMenuItem
        Caption = #1054#1073#1098#1077#1082#1090
        Enabled = False
        object N10: TMenuItem
          Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1074#1099#1081
        end
        object N11: TMenuItem
          Caption = #1050#1086#1088#1088#1077#1082#1094#1080#1103' '#1089#1074#1086#1081#1089#1090#1074
        end
        object N12: TMenuItem
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
        end
      end
      object miAboutArchiev: TMenuItem
        Caption = #1054#1073' '#1072#1088#1093#1080#1074#1077
        Visible = False
        OnClick = miAboutArchievClick
      end
      object N3: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081
        Visible = False
        OnClick = N3Click
      end
      object miCreateAndShowImage: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1075#1088#1072#1092#1080#1082' '#1079#1072' '#1074#1089#1077' '#1074#1088#1077#1084#1103' '#1085#1072#1073#1083#1102#1076#1077#1085#1080#1103
        OnClick = btnCreateAndShowImageClick
      end
    end
    object miWindow: TMenuItem [2]
      Caption = #1054#1082#1085#1072
    end
  end
  object eksps: TIBDataSet
    Database = DM.DB
    Transaction = DM.TA
    AfterOpen = ekspsAfterOpen
    AfterPost = ekspsAfterPost
    AfterScroll = ekspsAfterScroll
    BeforeClose = ekspsBeforeClose
    BeforePost = ekspsBeforePost
    OnCalcFields = ekspsCalcFields
    DeleteSQL.Strings = (
      'delete from eksp '
      'where eksp_nomer=:old_eksp_nomer')
    SelectSQL.Strings = (
      'select e.*,'
      
        '(select pointall from signals where eksp_nomer = e.eksp_nomer an' +
        'd chanal_nomer = 1)  as pointall,'
      
        '(select deltx from signals where eksp_nomer = e.eksp_nomer and c' +
        'hanal_nomer = 1)  as deltx,'
      
        '(select device_Name from devices where id_Device = e.id_device) ' +
        ' as device_Name,'
      
        '(select device_Type from devices where id_Device = e.id_device) ' +
        ' as device_Type,'
      
        '(select max(Hour_Value) from Hoursdata where eksp_nomer = e.eksp' +
        '_nomer) as datetime_Finish,'
      
        '(select min(Hour_Value) from Hoursdata where eksp_nomer = e.eksp' +
        '_nomer) as datetime_start'
      
        '  from eksp e where (( eksp_proc = 0 ) or ( eksp_proc >2 ) )  an' +
        'd (id_uplevel=-1)  and e.hide<>1')
    ModifySQL.Strings = (
      'update eksp set '
      ' eksp_header=:new_eksp_header ,'
      'eksp_theme = :new_eksp_Theme,'
      'eksp_signalsource = :new_eksp_signalsource,'
      'eksp_date = :new_eksp_date,'
      'eksp_time = :new_eksp_time,'
      'eksp_author = :new_eksp_author,'
      'eksp_memo = :new_eksp_memo,'
      'modem = :new_modem,'
      'access = :new_access,'
      'phone_number = :new_Phone_number,'
      'tone_pulse = :new_tone_pulse'
      'where eksp_nomer=:old_eksp_nomer'
      '')
    GeneratorField.Field = 'EKSP_NOMER'
    Left = 132
    Top = 92
    object ekspsEKSP_NOMER: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"EKSP"."EKSP_NOMER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ekspsEKSP_THEME: TIBStringField
      FieldName = 'EKSP_THEME'
      Origin = '"EKSP"."EKSP_THEME"'
      Required = True
      Size = 30
    end
    object ekspsEKSP_DATE: TDateField
      FieldName = 'EKSP_DATE'
      Origin = '"EKSP"."EKSP_DATE"'
    end
    object ekspsEKSP_TIME: TTimeField
      FieldName = 'EKSP_TIME'
      Origin = '"EKSP"."EKSP_TIME"'
    end
    object ekspsEKSP_HEADER: TIBStringField
      FieldName = 'EKSP_HEADER'
      Origin = '"EKSP"."EKSP_HEADER"'
      Size = 50
    end
    object ekspsEKSP_AUTHOR: TIBStringField
      FieldName = 'EKSP_AUTHOR'
      Origin = '"EKSP"."EKSP_AUTHOR"'
      Size = 64
    end
    object ekspsEKSP_MEMO: TMemoField
      FieldName = 'EKSP_MEMO'
      Origin = '"EKSP"."EKSP_MEMO"'
      BlobType = ftMemo
      Size = 8
    end
    object ekspsEKSP_SELECTED: TSmallintField
      FieldName = 'EKSP_SELECTED'
      Origin = '"EKSP"."EKSP_SELECTED"'
    end
    object ekspsEKSP_PROC: TSmallintField
      FieldName = 'EKSP_PROC'
      Origin = '"EKSP"."EKSP_PROC"'
    end
    object ekspsEKSP_PARENT: TIntegerField
      FieldName = 'EKSP_PARENT'
      Origin = '"EKSP"."EKSP_PARENT"'
    end
    object ekspsID_UPLEVEL: TIntegerField
      FieldName = 'ID_UPLEVEL'
      Origin = '"EKSP"."ID_UPLEVEL"'
    end
    object ekspsEKSP_SOURCEFILE: TIBStringField
      FieldName = 'EKSP_SOURCEFILE'
      Origin = '"EKSP"."EKSP_SOURCEFILE"'
      Size = 512
    end
    object ekspsEKSP_SIGNALSOURCE: TMemoField
      FieldName = 'EKSP_SIGNALSOURCE'
      Origin = '"EKSP"."EKSP_SIGNALSOURCE"'
      BlobType = ftMemo
      Size = 8
    end
    object ekspsPOINTALL: TIntegerField
      FieldName = 'POINTALL'
    end
    object ekspsDELTX: TFloatField
      FieldName = 'DELTX'
    end
    object ekspsID_DEVICE: TIntegerField
      FieldName = 'ID_DEVICE'
      Origin = '"EKSP"."ID_DEVICE"'
    end
    object ekspsDEVICE_NAME: TIBStringField
      FieldName = 'DEVICE_NAME'
      ReadOnly = True
      Size = 48
    end
    object ekspsDEVICE_TYPE: TSmallintField
      FieldName = 'DEVICE_TYPE'
    end
    object ekspsDATETIME_FINISH: TDateTimeField
      FieldName = 'DATETIME_FINISH'
    end
    object ekspsDATETIME_START: TDateTimeField
      FieldName = 'DATETIME_START'
    end
    object ekspsMODEM: TSmallintField
      FieldName = 'MODEM'
      Origin = '"EKSP"."MODEM"'
    end
    object ekspsTONE_PULSE: TSmallintField
      FieldName = 'TONE_PULSE'
      Origin = '"EKSP"."TONE_PULSE"'
    end
    object ekspsPHONE_NUMBER: TIBStringField
      FieldName = 'PHONE_NUMBER'
      Origin = '"EKSP"."PHONE_NUMBER"'
    end
    object ekspsACCESS: TSmallintField
      FieldName = 'ACCESS'
      Origin = '"EKSP"."ACCESS"'
    end
  end
  object ds_eksp_theme: TDataSource
    DataSet = eksps
    OnDataChange = ds_eksp_themeDataChange
    Left = 188
    Top = 124
  end
  object Signals: TIBDataSet
    Database = DM.DB
    Transaction = DM.TA
    AfterPost = SignalsAfterPost
    SelectSQL.Strings = (
      'select * from signals where eksp_nomer = :eksp_nomer '
      'order by signal_nomer')
    ModifySQL.Strings = (
      'update signals set '
      ' NameY=:NameY ,'
      ' RazmY=:RazmY ,'
      ' signalmemo = :signalmemo,'
      ' a1 = :a1,'
      ' a0 = :a0,'
      'DELTX= :DELTX'
      'where signal_nomer=:signal_Nomer')
    DataSource = ds_eksp_theme
    Left = 41
    Top = 92
    object SignalsSIGNAL_NOMER: TIntegerField
      FieldName = 'SIGNAL_NOMER'
      Origin = '"SIGNALS"."SIGNAL_NOMER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SignalsEKSP_NOMER: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"SIGNALS"."EKSP_NOMER"'
    end
    object SignalsEKSP_PARENT: TIntegerField
      FieldName = 'EKSP_PARENT'
      Origin = '"SIGNALS"."EKSP_PARENT"'
    end
    object SignalsCHANAL_NOMER: TSmallintField
      FieldName = 'CHANAL_NOMER'
      Origin = '"SIGNALS"."CHANAL_NOMER"'
    end
    object SignalsCHANAL_HEADER: TIBStringField
      FieldName = 'CHANAL_HEADER'
      Origin = '"SIGNALS"."CHANAL_HEADER"'
      Size = 15
    end
    object SignalsDELTX: TFloatField
      FieldName = 'DELTX'
      Origin = '"SIGNALS"."DELTX"'
      ReadOnly = True
      OnGetText = SignalsDELTXGetText
    end
    object SignalsNAMEX: TIBStringField
      FieldName = 'NAMEX'
      Origin = '"SIGNALS"."NAMEX"'
      Size = 16
    end
    object SignalsNAMEY: TIBStringField
      FieldName = 'NAMEY'
      Origin = '"SIGNALS"."NAMEY"'
      Size = 16
    end
    object SignalsRAZMX: TIBStringField
      FieldName = 'RAZMX'
      Origin = '"SIGNALS"."RAZMX"'
      Size = 16
    end
    object SignalsRAZMY: TIBStringField
      FieldName = 'RAZMY'
      Origin = '"SIGNALS"."RAZMY"'
      Size = 16
    end
    object SignalsMULTX: TFloatField
      FieldName = 'MULTX'
      Origin = '"SIGNALS"."MULTX"'
    end
    object SignalsMULTY: TFloatField
      FieldName = 'MULTY'
      Origin = '"SIGNALS"."MULTY"'
    end
    object SignalsMAXX: TFloatField
      FieldName = 'MAXX'
      Origin = '"SIGNALS"."MAXX"'
    end
    object SignalsMAXY: TFloatField
      FieldName = 'MAXY'
      Origin = '"SIGNALS"."MAXY"'
    end
    object SignalsMINX: TFloatField
      FieldName = 'MINX'
      Origin = '"SIGNALS"."MINX"'
    end
    object SignalsMINY: TFloatField
      FieldName = 'MINY'
      Origin = '"SIGNALS"."MINY"'
    end
    object SignalsDATE_START: TDateField
      FieldName = 'DATE_START'
      Origin = '"SIGNALS"."DATE_START"'
    end
    object SignalsTIME_START: TTimeField
      FieldName = 'TIME_START'
      Origin = '"SIGNALS"."TIME_START"'
    end
    object SignalsPOINTALL: TIntegerField
      FieldName = 'POINTALL'
      Origin = '"SIGNALS"."POINTALL"'
    end
    object SignalsBMAXMINX: TSmallintField
      FieldName = 'BMAXMINX'
      Origin = '"SIGNALS"."BMAXMINX"'
    end
    object SignalsBMAXMINY: TSmallintField
      FieldName = 'BMAXMINY'
      Origin = '"SIGNALS"."BMAXMINY"'
    end
    object SignalsFILEDAT: TIBStringField
      FieldName = 'FILEDAT'
      Origin = '"SIGNALS"."FILEDAT"'
      Size = 255
    end
    object SignalsREZTYPE: TSmallintField
      FieldName = 'REZTYPE'
      Origin = '"SIGNALS"."REZTYPE"'
    end
    object SignalsREZLENGTH: TSmallintField
      FieldName = 'REZLENGTH'
      Origin = '"SIGNALS"."REZLENGTH"'
    end
    object SignalsA0: TFloatField
      FieldName = 'A0'
      Origin = '"SIGNALS"."A0"'
    end
    object SignalsA1: TFloatField
      FieldName = 'A1'
      Origin = '"SIGNALS"."A1"'
    end
    object SignalsA2: TFloatField
      FieldName = 'A2'
      Origin = '"SIGNALS"."A2"'
    end
    object SignalsA3: TFloatField
      FieldName = 'A3'
      Origin = '"SIGNALS"."A3"'
    end
    object SignalsSIGNALMEMO: TMemoField
      FieldName = 'SIGNALMEMO'
      Origin = '"SIGNALS"."SIGNALMEMO"'
      BlobType = ftMemo
      Size = 8
    end
    object SignalsSIGNAL_SELECTED: TSmallintField
      FieldName = 'SIGNAL_SELECTED'
      Origin = '"SIGNALS"."SIGNAL_SELECTED"'
    end
    object SignalsFILE_SEEK: TIntegerField
      FieldName = 'FILE_SEEK'
      Origin = '"SIGNALS"."FILE_SEEK"'
    end
  end
  object DS_Signals: TDataSource
    DataSet = Signals
    Left = 233
    Top = 69
  end
  object Curveset: TIBDataSet
    Database = DM.DB
    Transaction = DM.TA
    AfterOpen = CurvesetAfterOpen
    AfterPost = CurvesetAfterPost
    DeleteSQL.Strings = (
      'delete from curveset where view_nomer = :old_view_nomer')
    RefreshSQL.Strings = (
      'Select  *'
      'from getImages_for_exp (:eksp_pParent)'
      'where'
      '  VIEW_NOMER = :VIEW_NOMER ')
    SelectSQL.Strings = (
      'select  * from getImages_for_exp(:eksp_nomer)')
    ModifySQL.Strings = (
      'update curveset set'
      'view_header = :new_View_Header,'
      'view_memo=:new_View_memo'
      'where view_nomer = :old_View_nomer')
    DataSource = ds_eksp_theme
    Left = 309
    Top = 152
    object CurvesetVIEW_NOMER: TIntegerField
      FieldName = 'VIEW_NOMER'
      Origin = '"GETIMAGES_FOR_EXP"."VIEW_NOMER"'
    end
    object CurvesetVIEW_HEADER: TIBStringField
      FieldName = 'VIEW_HEADER'
      Origin = '"GETIMAGES_FOR_EXP"."VIEW_HEADER"'
      Size = 50
    end
    object CurvesetVIEW_STYLE: TIntegerField
      FieldName = 'VIEW_STYLE'
      Origin = '"GETIMAGES_FOR_EXP"."VIEW_STYLE"'
      OnGetText = CurvesetVIEW_STYLEGetText
    end
    object CurvesetVIEW_PAGE: TIBStringField
      FieldName = 'VIEW_PAGE'
      Origin = '"GETIMAGES_FOR_EXP"."VIEW_PAGE"'
      Size = 512
    end
    object CurvesetVIEW_MEMO: TMemoField
      FieldName = 'VIEW_MEMO'
      Origin = '"GETIMAGES_FOR_EXP"."VIEW_MEMO"'
      BlobType = ftMemo
      Size = 8
    end
    object CurvesetTXTFILE: TIBStringField
      FieldName = 'TXTFILE'
      Origin = '"GETIMAGES_FOR_EXP"."TXTFILE"'
      Size = 255
    end
  end
  object ds_CurveSet: TDataSource
    DataSet = Curveset
    Left = 289
    Top = 93
  end
  object qClear: TIBDataSet
    Database = DM.DB
    Transaction = DM.TA
    SelectSQL.Strings = (
      'select s.filedat as filename, 0 from signals s'
      'union'
      'select c.polyfile as filename, 1 from  curve c')
    Left = 193
    Top = 212
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'exp'
    StorageManager = MainForm.RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 57
    Top = 160
  end
  object ds_ekspParams: TDataSource
    DataSet = ekspParams
    Left = 528
    Top = 496
  end
  object ekspParams: TIBDataSet
    Database = DM.DB
    Transaction = DM.TA
    InsertSQL.Strings = (
      'insert into ekspparams (ID) values (?new_ID)')
    SelectSQL.Strings = (
      'select * from ekspparams'
      'where'
      'eksp_id = :eksp_nomer'
      ''
      'order by  id')
    ModifySQL.Strings = (
      'update ekspparams set'
      'paramimage=?new_paramimage'
      'where'
      'id = ?old_id')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_EKSPPARAMS_ID'
    DataSource = ds_eksp_theme
    Left = 381
    Top = 460
    object ekspParamsID: TIntegerField
      FieldName = 'ID'
      Origin = '"EKSPPARAMS"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ekspParamsEKSP_ID: TIntegerField
      FieldName = 'EKSP_ID'
      Origin = '"EKSPPARAMS"."EKSP_ID"'
    end
    object ekspParamsPARAMGROUP: TIBStringField
      FieldName = 'PARAMGROUP'
      Origin = '"EKSPPARAMS"."PARAMGROUP"'
      Size = 32
    end
    object ekspParamsPARAMNAME: TIBStringField
      FieldName = 'PARAMNAME'
      Origin = '"EKSPPARAMS"."PARAMNAME"'
      Size = 64
    end
    object ekspParamsPARAMVALUE: TIBStringField
      FieldName = 'PARAMVALUE'
      Origin = '"EKSPPARAMS"."PARAMVALUE"'
      Size = 128
    end
    object ekspParamsPARAMTYPE: TIBStringField
      FieldName = 'PARAMTYPE'
      Origin = '"EKSPPARAMS"."PARAMTYPE"'
      Size = 8
    end
    object ekspParamsPARAMIMAGE: TBlobField
      FieldName = 'PARAMIMAGE'
      Origin = '"EKSPPARAMS"."PARAMIMAGE"'
      Size = 8
    end
    object ekspParamsEKSP_NOMER: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"EKSPPARAMS"."EKSP_NOMER"'
    end
  end
  object OnOff: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    AfterOpen = OnOFF_FAfterOpen
    DataSource = ds_eksp_theme
    SQL.Strings = (
      'select oo.*,'
      '( select max(onoff_event) from'
      '    on_off where  eksp_nomer = :eksp_nomer) as lastevent'
      ' from On_Off  oo'
      'where '
      'eksp_nomer= :eksp_nomer'
      'order by '
      'onoff_event desc')
    Left = 104
    Top = 412
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'eksp_nomer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'eksp_nomer'
        ParamType = ptUnknown
      end>
    object OnOffONOFF_EVENT: TDateTimeField
      FieldName = 'ONOFF_EVENT'
      Origin = '"ON_OFF"."ONOFF_EVENT"'
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object OnOffSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = '"ON_OFF"."STATUS"'
    end
    object OnOffEKSP_NOMER: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"ON_OFF"."EKSP_NOMER"'
    end
    object OnOffLASTEVENT: TDateTimeField
      FieldName = 'LASTEVENT'
    end
  end
  object ds_OnOff_F: TDataSource
    DataSet = OnOff_VT
    Left = 180
    Top = 455
  end
  object DaysData: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    DataSource = ds_eksp_theme
    SQL.Strings = (
      'select * from DaysData '
      'where '
      'eksp_nomer = :eksp_nomer'
      'order by '
      'Day_Value desc')
    Left = 72
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EKSP_NOMER'
        ParamType = ptUnknown
        Size = 4
      end>
    object DaysDataDAY_VALUE: TDateField
      FieldName = 'DAY_VALUE'
      Origin = '"DAYSDATA"."DAY_VALUE"'
    end
    object DaysDataS_VALUE: TFloatField
      FieldName = 'S_VALUE'
      Origin = '"DAYSDATA"."S_VALUE"'
    end
    object DaysDataEKSP_NOMER: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"DAYSDATA"."EKSP_NOMER"'
    end
    object DaysDataD_VALUE: TFloatField
      FieldName = 'D_VALUE'
      Origin = '"DAYSDATA"."D_VALUE"'
    end
  end
  object ds_DaysData_F: TDataSource
    DataSet = DaysData_F
    Left = 104
    Top = 475
  end
  object HoursData: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    DataSource = ds_eksp_theme
    SQL.Strings = (
      'select * from HoursData '
      'where '
      'eksp_nomer = :eksp_nomer'
      'order by '
      'Hour_Value desc')
    Left = 192
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'eksp_nomer'
        ParamType = ptUnknown
      end>
    object HoursDataHOUR_VALUE: TDateTimeField
      FieldName = 'HOUR_VALUE'
      Origin = '"HOURSDATA"."HOUR_VALUE"'
    end
    object HoursDataS_VALUE: TFloatField
      FieldName = 'S_VALUE'
      Origin = '"HOURSDATA"."S_VALUE"'
    end
    object HoursDataEKSP_NOMER: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"HOURSDATA"."EKSP_NOMER"'
    end
    object HoursDataD_VALUE: TFloatField
      FieldName = 'D_VALUE'
      Origin = '"HOURSDATA"."D_VALUE"'
    end
  end
  object ds_HoursData_F: TDataSource
    DataSet = HoursData_F
    Left = 332
    Top = 63
  end
  object DaysData_F: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    SQL.Strings = (
      'select * from DaysData '
      'where '
      'eksp_nomer = :eksp_nomer'
      'and day_Value between :dd1 and :dd2'
      'order by '
      'Day_Value desc')
    Left = 276
    Top = 492
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EKSP_NOMER'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftDateTime
        Name = 'dd1'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftDateTime
        Name = 'dd2'
        ParamType = ptUnknown
        Size = 8
      end>
    object DateField1: TDateField
      FieldName = 'DAY_VALUE'
      Origin = '"DAYSDATA"."DAY_VALUE"'
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object FloatField1: TFloatField
      FieldName = 'S_VALUE'
      Origin = '"DAYSDATA"."S_VALUE"'
      DisplayFormat = '0.00'
    end
    object IntegerField1: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"DAYSDATA"."EKSP_NOMER"'
    end
    object FloatField2: TFloatField
      FieldName = 'D_VALUE'
      Origin = '"DAYSDATA"."D_VALUE"'
      DisplayFormat = '0.00'
    end
  end
  object HoursData_F: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    SQL.Strings = (
      'select * from HoursData '
      'where '
      'eksp_nomer = :eksp_nomer'
      'and hour_Value between :DD1 and :DD2'
      'order by '
      'Hour_Value desc')
    Left = 632
    Top = 380
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'eksp_nomer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DD1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DD2'
        ParamType = ptUnknown
      end>
    object DateTimeField1: TDateTimeField
      FieldName = 'HOUR_VALUE'
      Origin = '"HOURSDATA"."HOUR_VALUE"'
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object FloatField3: TFloatField
      FieldName = 'S_VALUE'
      Origin = '"HOURSDATA"."S_VALUE"'
    end
    object IntegerField2: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"HOURSDATA"."EKSP_NOMER"'
    end
    object FloatField4: TFloatField
      FieldName = 'D_VALUE'
      Origin = '"HOURSDATA"."D_VALUE"'
      DisplayFormat = '0.00'
    end
  end
  object OnOff_VT_Chart: TVirtualTable
    FieldDefs = <
      item
        Name = 'ONOFF_EVENT'
        DataType = ftDateTime
      end
      item
        Name = 'STATUS'
        DataType = ftSmallint
      end>
    Left = 437
    Top = 362
    Data = {
      010002000B004F4E4F46465F4556454E540B0000000600535441545553020000
      00000000000000}
    object TDateTimeField
      FieldName = 'ONOFF_EVENT'
    end
    object TSmallintField
      FieldName = 'STATUS'
    end
  end
  object On_VT: TVirtualTable
    FieldDefs = <
      item
        Name = 'ONOFF_EVENT'
        DataType = ftDateTime
      end
      item
        Name = 'STATUS'
        DataType = ftSmallint
      end>
    Left = 341
    Top = 386
    Data = {
      010002000B004F4E4F46465F4556454E540B0000000600535441545553020000
      00000000000000}
    object TDateTimeField
      FieldName = 'ONOFF_EVENT'
    end
    object TSmallintField
      FieldName = 'STATUS'
    end
    object On_VTLastEvent: TDateTimeField
      FieldName = 'LastEvent'
    end
  end
  object Off_VT: TVirtualTable
    FieldDefs = <
      item
        Name = 'ONOFF_EVENT'
        DataType = ftDateTime
      end
      item
        Name = 'STATUS'
        DataType = ftSmallint
      end>
    Left = 245
    Top = 402
    Data = {
      010002000B004F4E4F46465F4556454E540B0000000600535441545553020000
      00000000000000}
    object TDateTimeField
      FieldName = 'ONOFF_EVENT'
    end
    object TSmallintField
      FieldName = 'STATUS'
    end
    object Off_VTLastEvent: TDateTimeField
      FieldName = 'LastEvent'
    end
  end
  object OnOff_VT: TVirtualTable
    FieldDefs = <
      item
        Name = 'ONOFF_EVENT'
        DataType = ftDateTime
      end
      item
        Name = 'STATUS'
        DataType = ftSmallint
      end>
    Left = 485
    Top = 426
    Data = {
      010002000B004F4E4F46465F4556454E540B0000000600535441545553020000
      00000000000000}
    object ONOFF_VT_onOff_Event: TDateTimeField
      FieldName = 'ONOFF_EVENT'
    end
    object ON_OFF_VT_Status: TSmallintField
      FieldName = 'STATUS'
      OnGetText = ON_OFF_VT_StatusGetText
    end
    object OnOff_VTLastevent: TDateTimeField
      FieldName = 'Lastevent'
    end
  end
  object ds_on_Off_VT: TDataSource
    Left = 789
    Top = 419
  end
end
