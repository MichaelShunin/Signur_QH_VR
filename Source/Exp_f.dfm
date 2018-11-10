inherited ExpForm: TExpForm
  Left = 79
  Top = 92
  Width = 1345
  Height = 675
  Caption = #1040#1088#1093#1080#1074#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1087#1088#1080#1073#1086#1088#1086#1074
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter4: TSplitter [0]
    Left = 0
    Top = 357
    Width = 1329
    Height = 2
    Cursor = crVSplit
    Align = alTop
    Color = clInfoBk
    ParentColor = False
  end
  object Panel_uP: TPanel [1]
    Left = 0
    Top = 0
    Width = 1329
    Height = 357
    Align = alTop
    Color = clInfoBk
    Constraints.MinHeight = 200
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 901
      Top = 23
      Height = 333
      Align = alRight
      Color = 33023
      ParentColor = False
    end
    object Panel5: TPanel
      Left = 904
      Top = 23
      Width = 424
      Height = 333
      Align = alRight
      BevelOuter = bvLowered
      Constraints.MaxWidth = 640
      Constraints.MinWidth = 420
      TabOrder = 0
      object Label4: TLabel
        Left = 1
        Top = 1
        Width = 422
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '
        Color = clGradientInactiveCaption
        ParentColor = False
      end
      object PageControl1: TPageControl
        Left = 1
        Top = 14
        Width = 422
        Height = 318
        ActivePage = TabSheet2
        Align = alClient
        MultiLine = True
        TabOrder = 0
        OnChange = PageControl1Change
        object TabSheet1: TTabSheet
          Caption = #1054#1073#1098#1077#1082#1090
          object cxObjectMemo: TcxDBMemo
            Left = 0
            Top = 59
            Width = 414
            Height = 200
            Align = alClient
            DataBinding.DataSource = ds_eksp_theme
            DataBinding.DataField = 'EKSP_SIGNALSOURCE'
            Properties.ScrollBars = ssVertical
            Style.Color = clWhite
            TabOrder = 0
          end
          object Panel1: TPanel
            Left = 0
            Top = 259
            Width = 414
            Height = 31
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              414
              31)
            object cxButton3: TcxButton
              Left = 78
              Top = 3
              Width = 266
              Height = 24
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
            Width = 414
            Height = 59
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            DesignSize = (
              414
              59)
            object Label5: TLabel
              Left = 3
              Top = 3
              Width = 41
              Height = 13
              Caption = #1054#1073#1098#1077#1082#1090':'
            end
            object Label12: TLabel
              Left = 4
              Top = 41
              Width = 119
              Height = 13
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103' '#1082' '#1086#1073#1098#1077#1082#1090#1091':'
            end
            object cbTheme: TcxCheckBox
              Left = 75
              Top = 0
              Width = 225
              Height = 21
              ParentBackground = True
              Properties.DisplayUnchecked = 'False'
              TabOrder = 0
              Visible = False
            end
            object cxDBTextEdit1: TcxDBTextEdit
              Left = 3
              Top = 20
              Width = 406
              Height = 21
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
            Top = 263
            Width = 414
            Height = 27
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              414
              27)
            object Label10: TLabel
              Left = 2
              Top = 0
              Width = 83
              Height = 13
              Anchors = [akLeft]
              Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1092#1072#1081#1083':'
              Visible = False
            end
            object btnEdit: TcxButton
              Left = 78
              Top = 4
              Width = 263
              Height = 20
              Anchors = [akLeft, akRight, akBottom]
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
              TabOrder = 0
              OnClick = btnEditClick
              LookAndFeel.Kind = lfStandard
            end
            object FileSource: TcxDBTextEdit
              Left = 53
              Top = 11
              Width = 304
              Height = 21
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
            Width = 414
            Height = 133
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              414
              133)
            object Label7: TLabel
              Left = 2
              Top = 72
              Width = 82
              Height = 13
              Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081':'
            end
            object Label13: TLabel
              Left = 2
              Top = 37
              Width = 106
              Height = 13
              Caption = #1055#1088#1080#1087#1080#1089#1072#1085' '#1082' '#1086#1073#1098#1077#1082#1090#1091':'
            end
            object Label21: TLabel
              Left = 236
              Top = 2
              Width = 11
              Height = 13
              Caption = #8470
            end
            object DBText1: TDBText
              Left = 253
              Top = 2
              Width = 49
              Height = 17
              DataField = 'DEVICE_NUMBER'
              DataSource = ds_eksp_theme
            end
            object eksp_header: TcxDBTextEdit
              Left = -1
              Top = 18
              Width = 406
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'EKSP_HEADER'
              Style.Color = clWhite
              TabOrder = 0
            end
            object cxDBTextEdit3: TcxDBTextEdit
              Left = 97
              Top = 72
              Width = 308
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'EKSP_AUTHOR'
              Style.Color = clWhite
              TabOrder = 1
            end
            object objectslist: TcxDBComboBox
              Left = -1
              Top = 50
              Width = 304
              Height = 21
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'EKSP_THEME'
              Properties.DropDownSizeable = True
              Properties.ImmediatePost = True
              Properties.ImmediateUpdateText = True
              Properties.OnCloseUp = objectslistPropertiesCloseUp
              Style.Color = clWhite
              TabOrder = 2
            end
            object cxDBTextEdit2: TcxDBTextEdit
              Left = 0
              Top = 0
              Width = 228
              Height = 21
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'DEVICE_NAME'
              ParentFont = False
              Style.Color = cl3DLight
              Style.Edges = []
              TabOrder = 3
            end
            object RG_Access: TRadioGroup
              Left = 0
              Top = 94
              Width = 316
              Height = 36
              Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089' '#1087#1088#1080#1073#1086#1088#1072
              Columns = 3
              ItemIndex = 0
              Items.Strings = (
                'RS232'
                'RS485(ModBus)'
                'USB')
              TabOrder = 4
              OnClick = RG_AccessClick
            end
            object cbVia_modem: TCheckBox
              Left = 321
              Top = 100
              Width = 93
              Height = 24
              Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1084#1086#1076#1077#1084
              TabOrder = 5
              WordWrap = True
              OnClick = cbVia_modemClick
            end
          end
          object PageControl2: TPageControl
            Left = 0
            Top = 133
            Width = 414
            Height = 130
            ActivePage = TabSheetMemo
            Align = alClient
            Constraints.MinHeight = 70
            MultiLine = True
            TabOrder = 2
            object TabSheetMemo: TTabSheet
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1082' '#1087#1088#1080#1073#1086#1088#1091
              object cxDeviceMemo: TcxDBMemo
                Left = 0
                Top = 0
                Width = 406
                Height = 84
                Align = alClient
                DataBinding.DataSource = ds_eksp_theme
                DataBinding.DataField = 'EKSP_MEMO'
                Properties.ScrollBars = ssVertical
                Style.Color = clWhite
                TabOrder = 0
              end
            end
            object TabSheetModem: TTabSheet
              Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1084#1086#1076#1077#1084#1085#1086#1081' '#1089#1074#1103#1079#1080
              ImageIndex = 1
              object Label8: TLabel
                Left = 24
                Top = 24
                Width = 75
                Height = 26
                Alignment = taRightJustify
                Caption = #1055#1086#1083#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1076#1083#1103' '#1085#1072#1073#1086#1088#1072':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object Label_pulse: TLabel
                Left = -1
                Top = 52
                Width = 242
                Height = 13
                Caption = #1085#1072#1087#1088#1080#1084#1077#1088', 8 495 362 32 00  '#1080#1083#1080' 8 8617 85 6390'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsItalic]
                ParentFont = False
                Visible = False
              end
              object Label16: TLabel
                Left = 0
                Top = 67
                Width = 134
                Height = 13
                Caption = #1050#1086#1076' '#1076#1083#1103' '#1074#1099#1093#1086#1076#1072' "'#1074' '#1075#1086#1088#1086#1076'":'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label_Tone: TLabel
                Left = 12
                Top = 51
                Width = 221
                Height = 13
                Caption = #1085#1072#1087#1088#1080#1084#1077#1088', 84953623200  '#1080#1083#1080' 88617856390'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsItalic]
                ParentFont = False
              end
              object Phone_Number: TcxDBTextEdit
                Left = 104
                Top = 29
                Width = 189
                Height = 21
                DataBinding.DataSource = ds_eksp_theme
                DataBinding.DataField = 'PHONE_NUMBER'
                Properties.MaxLength = 20
                TabOrder = 0
              end
              object Access: TcxComboBox
                Left = 140
                Top = 66
                Width = 153
                Height = 21
                Properties.DropDownListStyle = lsEditFixedList
                Properties.DropDownRows = 11
                Properties.Items.Strings = (
                  '0'
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '6'
                  '7'
                  '8'
                  '9'
                  #1087#1088#1103#1084#1086#1081' '#1074#1099#1093#1086#1076)
                TabOrder = 1
                OnClick = Tone_PulseClick
              end
              object Tone_Pulse: TRadioGroup
                Left = 0
                Top = -3
                Width = 293
                Height = 30
                Caption = #1085#1072#1073#1086#1088
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  #1080#1084#1087#1091#1083#1100#1089#1085#1099#1081
                  #1090#1086#1085#1072#1083#1100#1085#1099#1081' ')
                TabOrder = 2
                OnClick = Tone_PulseClick
              end
            end
            object TabSheetModBus: TTabSheet
              Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' ModBus'
              ImageIndex = 2
              object Label20: TLabel
                Left = 0
                Top = 5
                Width = 92
                Height = 39
                AutoSize = False
                Caption = #1040#1076#1088#1077#1089' '#1087#1088#1080#1073#1086#1088#1072' (1..127):'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object lbBdr: TLabel
                Left = 0
                Top = 38
                Width = 82
                Height = 13
                Caption = #1057#1082#1086#1088#1086#1089#1090#1100', '#1073#1080#1090'/'#1089
              end
              object lbParity: TLabel
                Left = 0
                Top = 65
                Width = 88
                Height = 13
                Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1099#1081' '#1073#1080#1090
              end
              object modbus_address: TcxDBSpinEdit
                Left = 96
                Top = 7
                Width = 65
                Height = 21
                DataBinding.DataSource = ds_eksp_theme
                DataBinding.DataField = 'MODBUS_ADDRESS'
                Properties.MaxValue = 127.000000000000000000
                Properties.MinValue = 1.000000000000000000
                Properties.ReadOnly = False
                Properties.OnValidate = modbus_addressPropertiesValidate
                TabOrder = 0
              end
              object cxBDR: TDBComboBoxEh
                Left = 96
                Top = 33
                Width = 65
                Height = 19
                DataField = 'BDR'
                DataSource = ds_eksp_theme
                EditButtons = <>
                Flat = True
                Items.Strings = (
                  '1200'
                  '2400'
                  '4800'
                  '9600')
                KeyItems.Strings = (
                  '0'
                  '1'
                  '2'
                  '3')
                TabOrder = 1
                Visible = True
              end
              object Parity: TDBComboBoxEh
                Left = 96
                Top = 60
                Width = 65
                Height = 19
                DataField = 'PARITYCONTROL'
                DataSource = ds_eksp_theme
                EditButtons = <>
                Flat = True
                Items.Strings = (
                  #1085#1077#1090
                  #1095#1105#1090
                  #1085#1077#1095#1105#1090)
                KeyItems.Strings = (
                  '0'
                  '1'
                  '2')
                TabOrder = 2
                Visible = True
              end
            end
            object TabSheetBlueTooth: TTabSheet
              Caption = 'PIN-'#1082#1086#1076
              ImageIndex = 3
              object Label6: TLabel
                Left = 51
                Top = 3
                Width = 45
                Height = 26
                Alignment = taRightJustify
                Caption = 'PIN-'#1082#1086#1076' '#1087#1088#1080#1073#1086#1088#1072':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object cxDBSpinEdit1: TcxDBSpinEdit
                Left = 109
                Top = 1
                Width = 65
                Height = 21
                DataBinding.DataSource = ds_eksp_theme
                DataBinding.DataField = 'BLUETOOTH_PIN'
                Properties.MaxValue = 9999.000000000000000000
                Properties.ReadOnly = False
                Properties.OnValidate = modbus_addressPropertiesValidate
                TabOrder = 0
              end
            end
            object TabSheet12: TTabSheet
              Caption = #1048#1085#1090#1077#1088#1085#1077#1090'-'#1076#1086#1089#1090#1091#1087
              ImageIndex = 4
              object Label14: TLabel
                Left = 12
                Top = 3
                Width = 101
                Height = 39
                Alignment = taRightJustify
                Caption = #1050#1086#1076' '#1076#1083#1103' '#1080#1085#1090#1077#1088#1085#1077#1090'-'#1076#1086#1089#1090#1091#1087#1072' '#1082' '#1072#1088#1093#1080#1074#1091
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object cxDBMaskEdit1: TcxDBMaskEdit
                Left = 144
                Top = 16
                Width = 65
                Height = 24
                DataBinding.DataSource = ds_eksp_theme
                DataBinding.DataField = 'FTP_PASSWORD'
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.EchoMode = eemPassword
                Properties.MaskKind = emkRegExpr
                Properties.EditMask = '\d+'
                Properties.MaxLength = 0
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'MS Sans Serif'
                Style.Font.Style = []
                TabOrder = 0
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
            Top = 121
            Width = 414
            Height = 0
            Cursor = crVSplit
            Align = alBottom
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 121
            Width = 414
            Height = 169
            Align = alBottom
            Caption = #1054' '#1089#1080#1075#1085#1072#1083#1077
            TabOrder = 0
            DesignSize = (
              414
              169)
            object Label1: TLabel
              Left = 3
              Top = 119
              Width = 90
              Height = 13
              Caption = #1060#1072#1081#1083' '#1089' '#1076#1072#1085#1085#1099#1084#1080':'
            end
            object Label2: TLabel
              Left = 3
              Top = 13
              Width = 66
              Height = 13
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
            end
            object Label9: TLabel
              Left = 3
              Top = 98
              Width = 143
              Height = 13
              Cursor = crHandPoint
              Caption = #1063#1072#1089#1090#1086#1090#1072' '#1076#1080#1089#1082#1088#1077#1090#1080#1079#1072#1094#1080#1080', '#1043#1094':'
              OnClick = deltxDblClick
            end
            object deltx: TcxDBTextEdit
              Left = 168
              Top = 97
              Width = 233
              Height = 21
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
              Top = 25
              Width = 401
              Height = 44
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = DS_Signals
              DataBinding.DataField = 'SIGNALMEMO'
              Properties.ScrollBars = ssVertical
              TabOrder = 1
            end
            object cxDBTextEdit4: TcxDBTextEdit
              Left = 3
              Top = 136
              Width = 402
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = DS_Signals
              DataBinding.DataField = 'FILEDAT'
              Style.Color = clMenuBar
              Style.Shadow = True
              TabOrder = 2
            end
            object cxButton1: TcxButton
              Left = 72
              Top = 73
              Width = 259
              Height = 20
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
            Width = 414
            Height = 121
            Align = alClient
            AutoFitColWidths = True
            DataSource = DS_Signals
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -10
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -10
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CHANAL_NOMER'
                Footers = <>
                Title.Caption = #8470
                Width = 9
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'NAMEY'
                Footers = <>
                Title.Caption = #1086#1089#1100' Y'
                Width = 15
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'RAZMY'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = '[ ]'
                Width = 9
              end
              item
                EditButtons = <>
                FieldName = 'CHANAL_HEADER'
                Footers = <>
                Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                Width = 26
              end
              item
                EditButtons = <>
                FieldName = 'POINTALL'
                Footers = <>
                Title.Caption = #1054#1090#1089#1095#1077#1090#1099
                Width = 20
              end
              item
                DisplayFormat = '0.00000'
                EditButtons = <>
                FieldName = 'A1'
                Footers = <>
                Width = 14
              end
              item
                DisplayFormat = '0.00000'
                EditButtons = <>
                FieldName = 'A0'
                Footers = <>
                Width = 14
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
            Width = 414
            Height = 168
            Align = alClient
            AutoFitColWidths = True
            DataSource = ds_CurveSet
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -10
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -10
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = btnCreateAndShowImageClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'VIEW_HEADER'
                Footers = <>
                Title.Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
                Width = 32
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'VIEW_STYLE'
                Footers = <>
                Title.Caption = #1057#1090#1080#1083#1100
                Width = 27
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'VIEW_PAGE'
                Footers = <>
                Title.Caption = #1089#1090#1088#1072#1085#1080#1094#1099'( '#1095#1080#1089#1083#1086' '#1082#1088#1080#1074#1099#1093')'
                Width = 114
              end>
          end
          object Curveset_GB: TGroupBox
            Left = 0
            Top = 168
            Width = 414
            Height = 122
            Align = alBottom
            TabOrder = 1
            DesignSize = (
              414
              122)
            object Label11: TLabel
              Left = 3
              Top = 13
              Width = 66
              Height = 13
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
            end
            object cxDBMemo3: TcxDBMemo
              Left = 2
              Top = 31
              Width = 404
              Height = 54
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = ds_CurveSet
              DataBinding.DataField = 'VIEW_MEMO'
              Properties.ScrollBars = ssVertical
              TabOrder = 0
            end
            object cxButton2: TcxButton
              Left = 298
              Top = 8
              Width = 105
              Height = 20
              Anchors = [akTop, akRight]
              Caption = #1055#1088#1072#1074#1082#1072
              TabOrder = 1
              OnClick = cxButton2Click
              LookAndFeel.Kind = lfStandard
            end
            object btnDeleteCurveset: TcxButton
              Left = 7
              Top = 86
              Width = 114
              Height = 20
              Caption = #1059#1076#1072#1083#1080#1090#1100'  '#1075#1088#1072#1092#1080#1082
              TabOrder = 2
              OnClick = btnDeleteCurvesetClick
              LookAndFeel.Kind = lfStandard
            end
            object AllCurveSet_CB: TCheckBox
              Left = 7
              Top = 109
              Width = 176
              Height = 14
              Caption = #1074#1089#1077' '#1075#1088#1072#1092#1080#1082#1080' '#1087#1088#1080#1073#1086#1088#1072
              TabOrder = 3
            end
            object btnShowImage: TcxButton
              Left = 293
              Top = 86
              Width = 110
              Height = 20
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
            Width = 414
            Height = 257
            Align = alClient
            AllowedOperations = []
            AutoFitColWidths = True
            DataSource = ds_ekspParams
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -10
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -10
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PARAMNAME'
                Footers = <>
                Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                Width = 69
              end
              item
                Alignment = taRightJustify
                EditButtons = <>
                FieldName = 'PARAMVALUE'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1080
                Width = 30
              end>
          end
          object Panel7: TPanel
            Left = 0
            Top = 257
            Width = 414
            Height = 33
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              414
              33)
            object btnPrintParamReport: TcxButton
              Left = 75
              Top = 7
              Width = 277
              Height = 20
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
          object ArchievPC: TPageControl
            Left = 0
            Top = 0
            Width = 414
            Height = 290
            ActivePage = TabSheet11
            Align = alClient
            MultiLine = True
            TabOrder = 0
            OnChange = ArchievPCChange
            object TabSheet8: TTabSheet
              Caption = #1055#1077#1088#1077#1088#1099#1074#1099' '#1091#1095#1077#1090#1072
              object OnOffGrid: TDBGridEh
                Left = 0
                Top = 26
                Width = 406
                Height = 0
                Align = alClient
                AutoFitColWidths = True
                DataSource = ds_OnOff
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -10
                FooterFont.Name = 'MS Sans Serif'
                FooterFont.Style = []
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -10
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnGetCellParams = OnOffGridGetCellParams
                Columns = <
                  item
                    Alignment = taCenter
                    DisplayFormat = 'dd.mm.yy hh:mm'
                    EditButtons = <>
                    FieldName = 'SSTART'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1085#1072#1095#1072#1083#1086
                    Width = 70
                  end
                  item
                    Alignment = taCenter
                    DisplayFormat = 'dd.mm.yy hh:mm'
                    EditButtons = <>
                    FieldName = 'FINISH'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1086#1082#1086#1085#1095#1072#1085#1080#1077
                  end
                  item
                    Alignment = taLeftJustify
                    EditButtons = <>
                    FieldName = 'ON_OFF_REASON_INT'
                    Footers = <>
                    Title.Caption = #1087#1088#1080#1095#1080#1085#1072
                    Width = 103
                  end>
              end
              object OnOff_Info: TcxMemo
                Left = 0
                Top = -4
                Width = 403
                Height = 263
                Align = alBottom
                Constraints.MinHeight = 29
                Lines.Strings = (
                  'OnOff_Info')
                Properties.ReadOnly = True
                Properties.ScrollBars = ssVertical
                Style.Color = 16776176
                Style.Shadow = True
                TabOrder = 1
                Visible = False
              end
              object Panel13: TPanel
                Left = 0
                Top = 0
                Width = 406
                Height = 26
                Align = alTop
                TabOrder = 2
                object Label26: TLabel
                  Left = 6
                  Top = 7
                  Width = 6
                  Height = 13
                  Caption = 'c'
                end
                object Label27: TLabel
                  Left = 102
                  Top = 7
                  Width = 12
                  Height = 13
                  Caption = #1087#1086
                end
                object DD1_OnOff: TDateTimePicker
                  Left = 15
                  Top = 4
                  Width = 82
                  Height = 24
                  Date = 38702.369325798610000000
                  Time = 38702.369325798610000000
                  TabOrder = 0
                  OnChange = DD1Change
                end
                object DD2_OnOff: TDateTimePicker
                  Left = 123
                  Top = 4
                  Width = 79
                  Height = 24
                  Date = 38702.000000000000000000
                  Time = 38702.000000000000000000
                  TabOrder = 1
                  OnChange = DD1Change
                end
              end
            end
            object TabSheet10: TTabSheet
              Caption = #1063#1072#1089#1086#1074#1099#1077' '#1076#1072#1085#1085#1099#1077
              ImageIndex = 1
              object Panel14: TPanel
                Left = 0
                Top = 0
                Width = 406
                Height = 44
                Align = alTop
                TabOrder = 0
                DesignSize = (
                  406
                  44)
                object btnLastDay: TSpeedButton
                  Left = 111
                  Top = 24
                  Width = 121
                  Height = 17
                  Anchors = [akTop, akRight]
                  Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' '#1089#1091#1090#1082#1080
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
                    7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
                    777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
                    79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
                    7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
                    777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
                    79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
                    CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnLastDayClick
                end
                object Label22: TLabel
                  Left = 2
                  Top = 6
                  Width = 6
                  Height = 13
                  Caption = 'c'
                end
                object Label23: TLabel
                  Left = 118
                  Top = 6
                  Width = 12
                  Height = 13
                  Caption = #1087#1086
                end
                object btnLast10Days: TSpeedButton
                  Left = 240
                  Top = 24
                  Width = 133
                  Height = 17
                  Anchors = [akTop, akRight]
                  Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1076#1077#1082#1072#1076#1072
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
                    7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
                    777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
                    79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
                    7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
                    777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
                    79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
                    CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnLast10DaysClick
                end
                object DD1_H: TDateTimePicker
                  Left = 11
                  Top = 2
                  Width = 90
                  Height = 24
                  Date = 38702.369325798610000000
                  Time = 38702.369325798610000000
                  TabOrder = 0
                  OnChange = DD1Change
                end
                object DD2_H: TDateTimePicker
                  Left = 138
                  Top = 2
                  Width = 90
                  Height = 24
                  Date = 38702.000000000000000000
                  Time = 38702.000000000000000000
                  TabOrder = 1
                  OnChange = DD1Change
                end
              end
              object pgcHourData: TPageControl
                Left = 0
                Top = 44
                Width = 406
                Height = 25
                ActivePage = ts2
                Align = alTop
                Style = tsFlatButtons
                TabOrder = 1
                OnChange = pgcHourDataChange
                object ts1: TTabSheet
                  Caption = #1050#1072#1085#1072#1083' 1'
                end
                object ts2: TTabSheet
                  Caption = #1050#1072#1085#1072#1083' 2'
                  ImageIndex = 1
                end
              end
              object HoursGrid: TDBGridEh
                Left = 0
                Top = 69
                Width = 406
                Height = 193
                Align = alClient
                AutoFitColWidths = True
                DataSource = ds_HoursData_F
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -10
                FooterFont.Name = 'MS Sans Serif'
                FooterFont.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind]
                ReadOnly = True
                TabOrder = 2
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -10
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                UseMultiTitle = True
                Columns = <
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'HOUR_VALUE'
                    Footers = <>
                    Title.Caption = #1076#1072#1090#1072
                    Width = 44
                  end
                  item
                    DisplayFormat = '0.000'
                    EditButtons = <>
                    FieldName = 'S_VALUE'
                    Footers = <>
                    Title.Caption = #1079#1085#1072#1095#1077#1085#1080#1077' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1095#1072#1089#1072
                    Width = 110
                  end
                  item
                    EditButtons = <>
                    FieldName = 'D_VALUE'
                    Footers = <>
                    Title.Caption = #1087#1088#1080#1088#1072#1097#1077#1085#1080#1077' '#1079#1072' '#1095#1072#1089
                    Width = 82
                  end>
              end
            end
            object TabSheet11: TTabSheet
              Caption = #1057#1091#1090#1086#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
              ImageIndex = 2
              object DaysGrid: TDBGridEh
                Left = 0
                Top = 73
                Width = 406
                Height = 189
                Align = alClient
                AutoFitColWidths = True
                DataSource = ds_DaysData_F
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -10
                FooterFont.Name = 'MS Sans Serif'
                FooterFont.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -10
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                UseMultiTitle = True
                Columns = <
                  item
                    Alignment = taCenter
                    DisplayFormat = 'dd.mm.yy 00:00'
                    EditButtons = <>
                    FieldName = 'DAY_VALUE'
                    Footers = <>
                    Title.Caption = #1076#1072#1090#1072
                    Width = 55
                  end
                  item
                    DisplayFormat = '0.000'
                    EditButtons = <>
                    FieldName = 'S_VALUE'
                    Footers = <>
                    Title.Caption = #1079#1085#1072#1095#1077#1085#1080#1077' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1089#1091#1090#1086#1082
                    Width = 104
                  end
                  item
                    EditButtons = <>
                    FieldName = 'D_VALUE'
                    Footers = <>
                    Title.Caption = #1087#1088#1080#1088#1072#1097#1077#1085#1080#1077' '#1079#1072' '#1089#1091#1090#1082#1080
                    Width = 85
                  end>
              end
              object Panel15: TPanel
                Left = 0
                Top = 0
                Width = 406
                Height = 48
                Align = alTop
                TabOrder = 1
                DesignSize = (
                  406
                  48)
                object btnLastMonth: TSpeedButton
                  Left = 111
                  Top = 24
                  Width = 124
                  Height = 21
                  Anchors = [akTop, akRight]
                  Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1084#1077#1089#1103#1094
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
                    7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
                    777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
                    79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
                    7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
                    777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
                    79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
                    CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnLastMonthClick
                end
                object Label24: TLabel
                  Left = 2
                  Top = 6
                  Width = 6
                  Height = 13
                  Caption = 'c'
                end
                object Label25: TLabel
                  Left = 119
                  Top = 6
                  Width = 12
                  Height = 13
                  Caption = #1087#1086
                end
                object btnLast3Monthes: TSpeedButton
                  Left = 251
                  Top = 25
                  Width = 142
                  Height = 21
                  Anchors = [akTop, akRight]
                  Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' 3 '#1084#1077#1089#1103#1094#1072
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
                    7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
                    777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
                    79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
                    7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
                    777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
                    79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
                    CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnLast3MonthesClick
                end
                object DD1_D: TDateTimePicker
                  Left = 11
                  Top = 2
                  Width = 90
                  Height = 24
                  Date = 38702.369325798610000000
                  Time = 38702.369325798610000000
                  TabOrder = 0
                  OnChange = DD1Change
                end
                object DD2_D: TDateTimePicker
                  Left = 138
                  Top = 2
                  Width = 90
                  Height = 24
                  Date = 38702.000000000000000000
                  Time = 38702.000000000000000000
                  TabOrder = 1
                  OnChange = DD1Change
                end
              end
              object pgcDayData: TPageControl
                Left = 0
                Top = 48
                Width = 406
                Height = 25
                ActivePage = TabSheet6
                Align = alTop
                Style = tsFlatButtons
                TabOrder = 2
                OnChange = pgcDayDataChange
                object TabSheet6: TTabSheet
                  Caption = #1050#1072#1085#1072#1083' 1'
                end
                object TabSheet7: TTabSheet
                  Caption = #1050#1072#1085#1072#1083' 2'
                  ImageIndex = 1
                end
              end
            end
          end
        end
        object TabSheet9: TTabSheet
          Caption = #1040#1074#1090#1086'-'#1086#1073#1088#1072#1097#1077#1085#1080#1103
          ImageIndex = 6
          TabVisible = False
          object Label19: TLabel
            Left = 0
            Top = 7
            Width = 177
            Height = 13
            Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1086#1073#1088#1072#1097#1077#1085#1080#1081' '#1082' '#1087#1088#1080#1073#1086#1088#1091':'
          end
          object sch_mode: TDBComboBoxEh
            Left = 0
            Top = 26
            Width = 215
            Height = 22
            DataField = 'SCH_MODE'
            DataSource = ds_eksp_theme
            DropDownBox.AutoDrop = True
            DropDownBox.Sizable = True
            EditButtons = <>
            Flat = True
            Items.Strings = (
              #1085#1077#1090' '#1086#1073#1088#1072#1097#1077#1085#1080#1081
              #1077#1078#1077#1076#1085#1077#1074#1085#1086' ('#1074' '#1079#1072#1076#1072#1085#1085#1086#1077' '#1074#1088#1077#1084#1103')'
              #1077#1078#1077#1085#1077#1076#1077#1083#1100#1085#1086' ('#1076#1077#1085#1100' '#1085#1077#1076#1077#1083#1080', '#1074#1088#1077#1084#1103')'
              #1077#1078#1077#1084#1077#1089#1103#1095#1085#1086' ('#1076#1077#1085#1100' '#1084#1077#1089#1103#1094#1072', '#1074#1088#1077#1084#1103')')
            KeyItems.Strings = (
              '0'
              '1'
              '2'
              '3')
            TabOrder = 0
            Visible = True
            OnChange = sch_modeChange
          end
          object Panel12: TPanel
            Left = 0
            Top = 256
            Width = 414
            Height = 34
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              414
              34)
            object cxButton4: TcxButton
              Left = 78
              Top = 3
              Width = 277
              Height = 24
              Anchors = [akLeft, akRight, akBottom]
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
              TabOrder = 0
              OnClick = cxButton3Click
              LookAndFeel.Kind = lfStandard
            end
          end
          object sch_panel: TPanel
            Left = -2
            Top = 47
            Width = 268
            Height = 129
            BevelOuter = bvNone
            TabOrder = 2
            object Label18: TLabel
              Left = 2
              Top = 2
              Width = 98
              Height = 13
              Caption = #1056#1077#1078#1080#1084' '#1086#1073#1088#1072#1097#1077#1085#1080#1103':'
            end
            object Label15: TLabel
              Left = 2
              Top = 44
              Width = 96
              Height = 13
              Caption = #1042#1088#1077#1084#1103' '#1086#1073#1088#1072#1097#1077#1085#1080#1103':'
            end
            object LabelDay: TLabel
              Left = 2
              Top = 69
              Width = 90
              Height = 13
              Caption = #1044#1077#1085#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1103':'
            end
            object Label17: TLabel
              Left = 70
              Top = 89
              Width = 101
              Height = 13
              Caption = #1056#1077#1078#1080#1084' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103':'
              Visible = False
            end
            object sch_action_mode: TDBComboBoxEh
              Left = 2
              Top = 18
              Width = 216
              Height = 22
              DataField = 'SCH_ACTION_MODE'
              DataSource = ds_eksp_theme
              DropDownBox.AutoDrop = True
              DropDownBox.Sizable = True
              EditButtons = <>
              Flat = True
              Items.Strings = (
                #1090#1077#1082#1091#1097#1080#1077
                #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1077
                #1072#1088#1093#1080#1074)
              KeyItems.Strings = (
                '0'
                '1'
                '2')
              TabOrder = 0
              Visible = True
            end
            object sch_time: TDBDateTimeEditEh
              Left = 102
              Top = 44
              Width = 50
              Height = 22
              DataField = 'SCH_TIME'
              DataSource = ds_eksp_theme
              EditButton.Visible = False
              EditButtons = <>
              Flat = True
              TabOrder = 1
              Visible = True
              EditFormat = 'HH:NN'
            end
            object sch_day: TDBComboBoxEh
              Left = 102
              Top = 68
              Width = 116
              Height = 22
              DataField = 'SCH_DAY'
              DataSource = ds_eksp_theme
              DropDownBox.AutoDrop = True
              DropDownBox.Rows = 28
              DropDownBox.Sizable = True
              EditButtons = <>
              Flat = True
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16'
                '17'
                '18'
                '19'
                '20'
                '21'
                '22'
                '23'
                '24'
                '25'
                '26'
                '27'
                '28')
              KeyItems.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16'
                '17'
                '18'
                '19'
                '20'
                '21'
                '22'
                '23'
                '24'
                '25'
                '26'
                '27'
                '28')
              TabOrder = 2
              Visible = True
            end
            object sch_connection_mode: TDBComboBoxEh
              Left = 70
              Top = 104
              Width = 215
              Height = 22
              DataField = 'SCH_connection_MODE'
              DataSource = ds_eksp_theme
              DropDownBox.AutoDrop = True
              DropDownBox.Sizable = True
              Enabled = False
              EditButtons = <>
              Flat = True
              Items.Strings = (
                #1089#1086#1075#1083#1072#1089#1085#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1077
                #1087#1086' '#1084#1086#1076#1077#1084#1091
                #1087#1088#1103#1084#1086#1077' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077
                #1088#1077#1079#1077#1088#1074#1085#1099#1081' '#1088#1077#1078#1080#1084)
              KeyItems.Strings = (
                '0'
                '1'
                '2'
                '3')
              TabOrder = 3
              Visible = False
            end
          end
        end
      end
      object Panel16: TPanel
        Left = 204
        Top = 13
        Width = 128
        Height = 23
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          128
          23)
        object btnCreateHTMLReport: TSpeedButton
          Left = 0
          Top = 1
          Width = 108
          Height = 20
          Anchors = [akTop, akRight]
          Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
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
          Left = 108
          Top = 0
          Width = 20
          Height = 20
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
          Visible = False
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 23
      Width = 900
      Height = 333
      Align = alClient
      Caption = 'Panel2'
      Constraints.MinHeight = 100
      Constraints.MinWidth = 400
      TabOrder = 1
      object Panel3: TPanel
        Left = 1
        Top = 294
        Width = 898
        Height = 38
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        DesignSize = (
          898
          38)
        object btnDelete: TcxButton
          Left = 137
          Top = 15
          Width = 173
          Height = 23
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1073#1086#1088' '#1080#1079' '#1073#1072#1079#1099
          TabOrder = 0
          Visible = False
          OnClick = btnDeleteClick
          LookAndFeel.Kind = lfStandard
        end
        object btnCreateAndShowImage: TcxButton
          Left = 524
          Top = 5
          Width = 203
          Height = 23
          Anchors = [akTop, akRight]
          Caption = #1043#1088#1072#1092#1080#1082' '#1079#1072' '#1074#1089#1077' '#1074#1088#1077#1084#1103' '#1085#1072#1073#1083#1102#1076#1077#1085#1080#1103
          TabOrder = 1
          OnClick = btnCreateAndShowImageClick
          LookAndFeel.Kind = lfStandard
        end
        object AllThemeExp: TCheckBox
          Left = 10
          Top = 23
          Width = 153
          Height = 14
          Caption = #1074#1089#1077' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1099' '#1090#1077#1084#1099
          TabOrder = 2
          Visible = False
        end
        object btnLoadInfoFromDevice: TcxButton
          Left = 7
          Top = 5
          Width = 173
          Height = 23
          Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1080#1073#1086#1088#1086#1084
          TabOrder = 3
          OnClick = btnLoadInfoFromDeviceClick
          LookAndFeel.Kind = lfStandard
        end
      end
      object DBGrid: TDBGridEh
        Left = 1
        Top = 1
        Width = 898
        Height = 293
        Align = alClient
        AutoFitColWidths = True
        DataSource = ds_eksp_theme
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -10
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -10
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnCellClick = DBGridCellClick
        OnGetCellParams = DBGridGetCellParams
        OnTitleBtnClick = DBGridTitleBtnClick
        Columns = <
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'INTERFACE_MODE'
            Footers = <>
            Title.Caption = #1044#1086#1089#1090#1091#1087
            Width = 55
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'EKSP_THEME'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1082#1090
            Width = 128
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'DEVICE_NAME'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1090#1080#1087
            Width = 65
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'DEVICE_NUMBER'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1085#1086#1084#1077#1088
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'EKSP_HEADER'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 154
          end
          item
            DisplayFormat = 'dd.mm.yy hh:mm'
            EditButtons = <>
            FieldName = 'DATETIME_START'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'| '#1089'  '
            Width = 91
          end
          item
            DisplayFormat = 'dd.mm.yy hh:mm'
            EditButtons = <>
            FieldName = 'DATETIME_FINISH'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'| '#1087#1086
            Width = 97
          end
          item
            EditButtons = <>
            FieldName = 'EKSP_AUTHOR'
            Footers = <>
            Title.Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
            Width = 136
          end>
      end
      object btn1: TButton
        Left = 560
        Top = 8
        Width = 75
        Height = 25
        Caption = 'btn1'
        TabOrder = 2
        Visible = False
        OnClick = btn1Click
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 1327
      Height = 22
      Align = alTop
      Alignment = taRightJustify
      BevelOuter = bvLowered
      TabOrder = 2
      Visible = False
      object Label3: TLabel
        Left = 7
        Top = 3
        Width = 63
        Height = 13
        Caption = #1048#1084#1103' '#1072#1088#1093#1080#1074#1072':'
      end
      object cbDatabases: TComboBox
        Left = 85
        Top = 1
        Width = 361
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cbDatabasesChange
      end
    end
  end
  object Panel11: TPanel [2]
    Left = 0
    Top = 359
    Width = 1329
    Height = 257
    Align = alClient
    Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1072#1085#1085#1099#1093
    TabOrder = 1
    DesignSize = (
      1329
      257)
    object ChartPC: TPageControl
      Left = 1
      Top = 1
      Width = 1327
      Height = 255
      ActivePage = HoursChat_Tab
      Align = alClient
      Constraints.MinHeight = 150
      MultiLine = True
      TabOrder = 0
      OnChange = ChartPCChange
      object HoursChat_Tab: TTabSheet
        Caption = #1063#1072#1089#1086#1074#1099#1077' '#1076#1072#1085#1085#1099#1077
        ImageIndex = 1
        object onOff_Hours_Chart: TDBChart
          Left = 0
          Top = 169
          Width = 1319
          Height = 58
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
          TabOrder = 0
          Visible = False
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
        object Hours_Chart: TDBChart
          Left = 0
          Top = 0
          Width = 1319
          Height = 169
          AllowPanning = pmHorizontal
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
          BottomAxis.DateTimeFormat = 'dd.mm.yy'
          BottomAxis.LabelStyle = talValue
          Legend.Visible = False
          View3D = False
          Align = alClient
          TabOrder = 1
          object HSeries: TAreaSeries
            ColorSource = 'color'
            Marks.ArrowLength = 20
            Marks.Style = smsValue
            Marks.Visible = False
            SeriesColor = 12615680
            ShowInLegend = False
            Title = 'HourSeries'
            ValueFormat = '#,##0.#'
            AreaLinesPen.Color = 8421440
            DrawArea = True
            LinePen.Color = clBlue
            Pointer.HorizSize = 2
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.VertSize = 2
            Pointer.Visible = False
            Stairs = True
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
      end
      object DaysChat_Tab: TTabSheet
        Caption = #1057#1091#1090#1086#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        ImageIndex = 2
        object Days_Chart: TDBChart
          Left = 0
          Top = 0
          Width = 1319
          Height = 166
          AllowPanning = pmHorizontal
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
          BottomAxis.DateTimeFormat = 'dd.mm.yy'
          BottomAxis.LabelStyle = talValue
          Legend.Visible = False
          View3D = False
          Align = alClient
          TabOrder = 0
          object DaySeries: TAreaSeries
            ColorSource = 'color'
            Marks.ArrowLength = 20
            Marks.Style = smsValue
            Marks.Visible = False
            DataSource = DaysData_VT
            SeriesColor = 12615680
            ShowInLegend = False
            ValueFormat = '#,##0.#'
            AreaLinesPen.Color = 8421440
            DrawArea = True
            LinePen.Color = clBlue
            Pointer.HorizSize = 2
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.VertSize = 2
            Pointer.Visible = False
            Stairs = True
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
        object OnOff_Days_Chart: TDBChart
          Left = 0
          Top = 166
          Width = 1319
          Height = 61
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
          TabOrder = 1
          Visible = False
          object HourSeries: TAreaSeries
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
    end
    object mousePanel: TPanel
      Left = 213
      Top = 3
      Width = 902
      Height = 16
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        902
        16)
      object cxButton24Hours: TcxButton
        Left = 322
        Top = 0
        Width = 49
        Height = 16
        Hint = #1087#1086#1082#1072#1079#1072#1090#1100' 24 '#1095#1072#1089#1072' '#1086#1090' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086'  '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1095#1072#1089#1086#1074#1099#1093' '#1076#1072#1085#1085#1099#1093' '#1084#1086#1084#1077#1085#1090#1072
        Anchors = [akTop, akRight]
        Caption = '24 '#1095#1072#1089#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = False
        OnClick = cxButton24HoursClick
        LookAndFeel.Kind = lfStandard
      end
      object cxButton30Days: TcxButton
        Left = 383
        Top = 0
        Width = 49
        Height = 16
        Hint = 
          #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1090#1088#1080#1076#1094#1072#1090#1100' '#1089#1091#1090#1086#1082' '#1086#1090' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1089#1091#1090#1086#1095#1085 +
          #1099#1093' '#1076#1072#1085#1085#1099#1093' '#1079#1085#1072#1095#1077#1085#1080#1103
        Anchors = [akTop, akRight]
        Caption = '30 '#1089#1091#1090#1086#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Visible = False
        OnClick = cxButton30DaysClick
        LookAndFeel.Kind = lfStandard
      end
      object cxButton6: TcxButton
        Left = 545
        Top = -1
        Width = 163
        Height = 16
        Hint = #1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1074#1099#1089#1090#1072#1074#1080#1090#1100' '#1084#1072#1089#1096#1090#1072#1073' '#1087#1086' '#1086#1089#1080' '#1086#1088#1076#1080#1085#1072#1090
        Anchors = [akTop, akRight]
        Caption = #1053#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1088#1072#1089#1093#1086#1076#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = SpeedButton2Click
        LookAndFeel.Kind = lfStandard
      end
      object _cbLastData: TCheckBox
        Left = 744
        Top = 1
        Width = 140
        Height = 14
        Anchors = [akTop, akRight]
        Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1084#1077#1089#1103#1094
        TabOrder = 3
        Visible = False
        OnClick = _cbLastDataClick
      end
    end
  end
  inherited MainMenu: TMainMenu
    Left = 116
    Top = 248
    object N4: TMenuItem [0]
      Caption = #1060#1072#1081#1083
      object miCOM: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072
        OnClick = miCOMClick
      end
      object N5: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = N5Click
      end
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
      object miCreateAndShowImage: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1075#1088#1072#1092#1080#1082' '#1079#1072' '#1074#1089#1077' '#1074#1088#1077#1084#1103' '#1085#1072#1073#1083#1102#1076#1077#1085#1080#1103
        Visible = False
        OnClick = btnCreateAndShowImageClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N15: TMenuItem
        Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1080#1073#1086#1088#1086#1084
        OnClick = N15Click
      end
      object N16: TMenuItem
        Caption = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1072#1088#1093#1080#1074#1086#1074' '#1087#1088#1080#1073#1086#1088#1072' '#1095#1077#1088#1077#1079' '#1080#1085#1090#1077#1088#1085#1077#1090
        OnClick = N16Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object N8: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1073#1086#1088' '#1080' '#1074#1089#1077' '#1077#1075#1086' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1072#1088#1093#1080#1074#1072
        OnClick = btnDeleteClick
      end
      object N14: TMenuItem
        Caption = '-'
      end
    end
    inherited miFile: TMenuItem
      Caption = #1040#1088#1093#1080#1074
      object miRefresh: TMenuItem [0]
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        OnClick = miRefreshClick
      end
      object miClear: TMenuItem [1]
        Caption = #1054#1095#1080#1089#1090#1082#1072' '#1082#1072#1090#1072#1083#1086#1075#1072
        Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1074#1088#1077#1084#1077#1085#1085#1099#1093' '#1080' '#1085#1077#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1099#1093' '#1092#1072#1081#1083#1086#1074
        Visible = False
        OnClick = miClearClick
      end
      inherited miClose: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1072#1088#1093#1080#1074
        ImageIndex = 0
        Visible = False
      end
      object N9: TMenuItem
        Caption = #1054#1073#1098#1077#1082#1090
        Enabled = False
        Visible = False
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
      object N2: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100'  '#1072#1088#1093#1080#1074' '#1087#1088#1080#1073#1086#1088#1072' '#1074' '#1091#1082#1072#1079#1072#1085#1085#1086#1084' '#1076#1080#1072#1087#1072#1079#1086#1085#1077' '#1076#1072#1090
        OnClick = N2Click
      end
    end
    object miWindow: TMenuItem [3]
      Caption = #1054#1082#1085#1072
    end
    inherited miHelp: TMenuItem
      object miHTML: TMenuItem [0]
        Caption = #1056#1091#1082#1086#1074#1086#1076#1089#1090#1074#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        OnClick = miHTMLClick
      end
    end
    object miBlueTooth: TMenuItem
      Caption = #1048#1084#1087#1086#1088#1090' '#1089' '#1087#1086#1084#1086#1097#1100#1102' BlueTooth'
      Enabled = False
      Visible = False
      OnClick = miBlueToothClick
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
      
        '(select STARTNUMBER_LARGEARCH from devices where id_Device = e.i' +
        'd_device)  as STARTNUMBER_LARGEARCH,'
      
        '(select device_Type from devices where id_Device = e.id_device) ' +
        ' as device_Type,'
      
        '(select max(Hour_Value) from Hoursdata where eksp_nomer = e.eksp' +
        '_nomer) as datetime_Finish,'
      
        '(select min(Hour_Value) from Hoursdata where eksp_nomer = e.eksp' +
        '_nomer) as datetime_start'
      
        '  from eksp e where (( eksp_proc = 0 ) or ( eksp_proc >2 ) )  an' +
        'd (id_uplevel=-1)  and e.hide<>1'
      'order by eksp_theme, eksp_header')
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
      'tone_pulse = :new_tone_pulse,'
      'sch_action_mode = :new_sch_action_mode,'
      'sch_connection_mode = :new_sch_connection_mode,'
      'sch_Mode = :new_sch_mode,'
      'sch_day = :new_sch_day,'
      'sch_Time = :new_sch_time,'
      'MODBUS = :new_MODBUS,'
      'MODBUS_ADDRESS = :new_MODBUS_ADDRESS,'
      'BDR = :new_BDR,'
      'PARITYCONTROL= :new_ParityControl,'
      'BLUETOOTH = :new_BLUETOOTH,'
      'BLUETOOTH_PIN = :new_BLUETOOTH_PIN,'
      'interface_mode = :new_Interface_mode,'
      'Via_modem = :Via_modem,'
      'FTP_PASSWORD = :FTP_PASSWORD'
      'where eksp_nomer=:old_eksp_nomer'
      '')
    GeneratorField.Field = 'EKSP_NOMER'
    Left = 140
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
    object ekspsSCH_MODE: TSmallintField
      FieldName = 'SCH_MODE'
      Origin = '"EKSP"."SCH_MODE"'
    end
    object ekspsSCH_DAY: TSmallintField
      FieldName = 'SCH_DAY'
      Origin = '"EKSP"."SCH_DAY"'
    end
    object ekspsSCH_TIME: TTimeField
      FieldName = 'SCH_TIME'
      Origin = '"EKSP"."SCH_TIME"'
    end
    object ekspsSCH_ACTION_MODE: TSmallintField
      FieldName = 'SCH_ACTION_MODE'
      Origin = '"EKSP"."SCH_ACTION_MODE"'
    end
    object ekspsSCH_CONNECTION_MODE: TSmallintField
      FieldName = 'SCH_CONNECTION_MODE'
      Origin = '"EKSP"."SCH_CONNECTION_MODE"'
    end
    object ekspsMODBUS_ADDRESS: TIBStringField
      FieldName = 'MODBUS_ADDRESS'
      Origin = 'EKSP.MODBUS_ADDRESS'
      Size = 32
    end
    object ekspsMODBUS: TSmallintField
      FieldName = 'MODBUS'
      Origin = 'EKSP.MODBUS'
    end
    object ekspsBDR: TIntegerField
      FieldName = 'BDR'
      Origin = 'EKSP.BDR'
    end
    object ekspsPARITYCONTROL: TSmallintField
      FieldName = 'PARITYCONTROL'
      Origin = 'EKSP.PARITYCONTROL'
    end
    object ekspsDEVICE_NUMBER: TIntegerField
      FieldName = 'DEVICE_NUMBER'
      Origin = 'EKSP.DEVICE_NUMBER'
    end
    object ekspsSTARTNUMBER_LARGEARCH: TIntegerField
      FieldName = 'STARTNUMBER_LARGEARCH'
    end
    object ekspsdd1: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'dd1'
      Calculated = True
    end
    object ekspsDD2: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'DD2'
      Calculated = True
    end
    object ekspsBLUETOOTH: TSmallintField
      FieldName = 'BLUETOOTH'
      Origin = '"EKSP"."BLUETOOTH"'
    end
    object ekspsBLUETOOTH_PIN: TIntegerField
      FieldName = 'BLUETOOTH_PIN'
      Origin = '"EKSP"."BLUETOOTH_PIN"'
    end
    object ekspsdevice_Interface: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'device_Interface'
      Calculated = True
    end
    object ekspsINTERFACE_MODE: TSmallintField
      FieldName = 'INTERFACE_MODE'
      Origin = '"EKSP"."INTERFACE_MODE"'
      OnGetText = ekspsINTERFACE_MODEGetText
    end
    object ekspsVIA_MODEM: TSmallintField
      FieldName = 'VIA_MODEM'
      Origin = '"EKSP"."VIA_MODEM"'
    end
    object ekspsFTP_PASSWORD: TIntegerField
      FieldName = 'FTP_PASSWORD'
      Origin = '"EKSP"."FTP_PASSWORD"'
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
    OnCalcFields = SignalsCalcFields
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
    object Signalsdd2: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'dd2'
      Calculated = True
    end
    object Signalsdd1: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'dd1'
      Calculated = True
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
      '<P>.Width'
      'Panel_uP.<P>.Height'
      'Panel_uP.<P>.Width'
      'Panel_uP.Panel2.<P>.Height'
      'Panel_uP.Panel2.<P>.Width'
      'Panel_uP.Panel2.DBGrid.<P>.Columns.ColumnsIndex'
      'Panel_uP.Panel2.DBGrid.<P>.Columns.<ForAllItems>.Width'
      'Panel_uP.Panel5.<P>.Width'
      
        'Panel_uP.Panel5.PageControl1.TabSheet5.ArchievPC.TabSheet10.Hour' +
        'sGrid.<P>.Columns.ColumnsIndex'
      
        'Panel_uP.Panel5.PageControl1.TabSheet5.ArchievPC.TabSheet10.Hour' +
        'sGrid.<P>.Columns.<ForAllItems>.Width'
      
        'Panel_uP.Panel5.PageControl1.TabSheet5.ArchievPC.TabSheet11.Days' +
        'Grid.<P>.Columns.ColumnsIndex'
      
        'Panel_uP.Panel5.PageControl1.TabSheet5.ArchievPC.TabSheet11.Days' +
        'Grid.<P>.Columns.<ForAllItems>.Width'
      
        'Panel_uP.Panel5.PageControl1.TabSheet5.ArchievPC.TabSheet8.OnOff' +
        'Grid.<P>.Columns.ColumnsIndex'
      
        'Panel_uP.Panel5.PageControl1.TabSheet5.ArchievPC.TabSheet8.OnOff' +
        'Grid.<P>.Columns.<ForAllItems>.Width')
    Left = 57
    Top = 160
  end
  object ds_ekspParams: TDataSource
    DataSet = ekspParams
    Left = 712
    Top = 480
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
    Left = 456
    Top = 268
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
      OnGetText = OnOffONOFF_EVENTGetText
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
    object OnOffON_OFF_REASON_INT: TSmallintField
      FieldName = 'ON_OFF_REASON_INT'
      Origin = '"ON_OFF"."ON_OFF_REASON_INT"'
    end
  end
  object ds_OnOff_F: TDataSource
    DataSet = OnOff_VT
    Left = 284
    Top = 223
  end
  object DaysData: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    AfterOpen = DaysDataAfterOpen
    DataSource = ds_eksp_theme
    SQL.Strings = (
      'select * from DaysData '
      'where '
      'eksp_nomer = :eksp_nomer'
      'order by '
      'Day_Value desc')
    Left = 384
    Top = 176
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
    Left = 528
    Top = 147
  end
  object Hoursdata: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    AfterOpen = HoursdataAfterOpen
    DataSource = ds_eksp_theme
    SQL.Strings = (
      'select * from HoursData '
      'where '
      'eksp_nomer = :eksp_nomer'
      'order by '
      'Hour_Value desc')
    Left = 448
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'eksp_nomer'
        ParamType = ptUnknown
      end>
    object HoursdataHOUR_VALUE: TDateTimeField
      FieldName = 'HOUR_VALUE'
      Origin = '"HOURSDATA"."HOUR_VALUE"'
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object HoursdataS_VALUE: TFloatField
      FieldName = 'S_VALUE'
      Origin = '"HOURSDATA"."S_VALUE"'
      DisplayFormat = '0.00'
    end
    object HoursdataEKSP_NOMER: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"HOURSDATA"."EKSP_NOMER"'
    end
    object HoursdataD_VALUE: TFloatField
      FieldName = 'D_VALUE'
      Origin = '"HOURSDATA"."D_VALUE"'
    end
  end
  object ds_HoursData_F: TDataSource
    DataSet = HoursData_F
    Left = 396
    Top = 103
  end
  object DaysData_F: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    AfterClose = DaysData_FAfterClose
    AfterOpen = DaysData_FAfterOpen
    BeforeOpen = DaysData_FBeforeOpen
    OnCalcFields = DaysData_FCalcFields
    SQL.Strings = (
      
        'select    dD.id_daysdata, dd.id_device, dd.day_value, dd.s_value' +
        ', dd.eksp_nomer, dd.prior_day_value, dd.d_value,'
      
        '(select count(oo.id_onoff) from on_off oo where oo.eksp_nomer = ' +
        'dd.eksp_nomer'
      'and oo.onoff_event between (dd.day_value -1 ) and dd.day_value )'
      '  as OnOff_Exists'
      'from GET_DaysData(:eksp_nomer_IN, :ID_device_IN, :DD1, :DD2) dD'
      'order by '
      'day_Value desc')
    Left = 742
    Top = 236
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'eksp_nomer_IN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_device_IN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dd1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dd2'
        ParamType = ptUnknown
      end>
    object DateField1: TDateField
      FieldName = 'DAY_VALUE'
      Origin = '"DAYSDATA"."DAY_VALUE"'
      DisplayFormat = 'dd.mm.yy 00:00'
    end
    object FloatField1: TFloatField
      FieldName = 'S_VALUE'
      Origin = '"DAYSDATA"."S_VALUE"'
      DisplayFormat = '0.000'
    end
    object IntegerField1: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"DAYSDATA"."EKSP_NOMER"'
    end
    object FloatField2: TFloatField
      FieldName = 'D_VALUE'
      Origin = '"DAYSDATA"."D_VALUE"'
      OnGetText = FloatField2GetText
      DisplayFormat = '0.000'
    end
    object DaysData_FONOFF_EXISTS: TIntegerField
      FieldName = 'ONOFF_EXISTS'
      ProviderFlags = []
    end
    object DaysData_Fcolor: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'color'
      Calculated = True
    end
  end
  object HoursData_F: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    AfterClose = HoursData_FAfterClose
    AfterOpen = HoursData_FAfterOpen
    BeforeOpen = HoursData_FBeforeOpen
    OnCalcFields = HoursData_FCalcFields
    SQL.Strings = (
      
        '  select   hD.id_hoursdata, hd.id_device, hd.hour_value, hd.s_va' +
        'lue, hd.eksp_nomer, hd.prior_hour_value,'
      '    hd.d_value, hd. onoff_exists'
      'from Get_HoursData(:Eksp_nomer_IN, :ID_Device_IN, :dd1, :dd2) HD'
      'order by hd.hour_value desc')
    Left = 552
    Top = 236
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Eksp_nomer_IN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_Device_IN'
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
      DisplayFormat = '0.000'
    end
    object IntegerField2: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"HOURSDATA"."EKSP_NOMER"'
    end
    object FloatField4: TFloatField
      FieldName = 'D_VALUE'
      Origin = '"HOURSDATA"."D_VALUE"'
      OnGetText = FloatField4GetText
      DisplayFormat = '0.000'
    end
    object HoursData_FONOFF_EXISTS: TIntegerField
      FieldName = 'ONOFF_EXISTS'
      ProviderFlags = []
    end
    object HoursData_Fcolor: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'color'
      Calculated = True
    end
  end
  object OnOff_VT_Chart: TVirtualTable
    FieldDefs = <
      item
        Name = 'ONOFF_EVENT'
        DataType = ftDateTime
      end>
    Left = 245
    Top = 254
    Data = {030001000B004F4E4F46465F4556454E540B00000000000000000000000000}
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
      end>
    Left = 291
    Top = 298
    Data = {030001000B004F4E4F46465F4556454E540B00000000000000000000000000}
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
      end>
    Left = 185
    Top = 266
    Data = {030001000B004F4E4F46465F4556454E540B00000000000000000000000000}
    object TDateTimeField
      FieldName = 'ONOFF_EVENT'
    end
    object TSmallintField
      FieldName = 'STATUS'
    end
    object Off_VTLastEvent: TDateTimeField
      FieldName = 'LastEvent'
    end
    object Off_VTOff_Reason_Int: TSmallintField
      FieldName = 'Off_Reason_Int'
    end
  end
  object OnOff_VT: TVirtualTable
    FieldDefs = <
      item
        Name = 'ONOFF_EVENT'
        DataType = ftDateTime
      end>
    Left = 365
    Top = 250
    Data = {030001000B004F4E4F46465F4556454E540B00000000000000000000000000}
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
    object OnOff_VToff_reason_int: TSmallintField
      FieldName = 'off_reason_int'
      OnGetText = OnOff_VToff_reason_intGetText
    end
  end
  object ds_on_Off_VT: TDataSource
    Left = 365
    Top = 299
  end
  object eksp_for_Load: TIBDataSet
    Database = DM.DB
    Transaction = DM.TA
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
      
        '(select STARTNUMBER_LARGEARCH from devices where id_Device = e.i' +
        'd_device)  as STARTNUMBER_LARGEARCH,'
      
        '(select device_Type from devices where id_Device = e.id_device) ' +
        ' as device_Type,'
      
        '(select max(Hour_Value) from Hoursdata where eksp_nomer = e.eksp' +
        '_nomer) as datetime_Finish,'
      
        '(select min(Hour_Value) from Hoursdata where eksp_nomer = e.eksp' +
        '_nomer) as datetime_start'
      '  from eksp e '
      'where eksp_nomer = :eksp_nomer'
      '')
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
      'tone_pulse = :new_tone_pulse,'
      'sch_action_mode = :new_sch_action_mode,'
      'sch_connection_mode = :new_sch_connection_mode,'
      'sch_Mode = :new_sch_mode,'
      'sch_day = :new_sch_day,'
      'sch_Time = :new_sch_time,'
      'MODBUS = :new_MODBUS,'
      'MODBUS_ADDRESS = :new_MODBUS_ADDRESS,'
      'BDR = :new_BDR,'
      'PARITYCONTROL= :new_ParityControl'
      'where eksp_nomer=:old_eksp_nomer'
      '')
    GeneratorField.Field = 'EKSP_NOMER'
    Left = 52
    Top = 260
    object IntegerField3: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"EKSP"."EKSP_NOMER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'EKSP_THEME'
      Origin = '"EKSP"."EKSP_THEME"'
      Required = True
      Size = 30
    end
    object DateField2: TDateField
      FieldName = 'EKSP_DATE'
      Origin = '"EKSP"."EKSP_DATE"'
    end
    object TimeField1: TTimeField
      FieldName = 'EKSP_TIME'
      Origin = '"EKSP"."EKSP_TIME"'
    end
    object IBStringField2: TIBStringField
      FieldName = 'EKSP_HEADER'
      Origin = '"EKSP"."EKSP_HEADER"'
      Size = 50
    end
    object IBStringField3: TIBStringField
      FieldName = 'EKSP_AUTHOR'
      Origin = '"EKSP"."EKSP_AUTHOR"'
      Size = 64
    end
    object MemoField1: TMemoField
      FieldName = 'EKSP_MEMO'
      Origin = '"EKSP"."EKSP_MEMO"'
      BlobType = ftMemo
      Size = 8
    end
    object SmallintField1: TSmallintField
      FieldName = 'EKSP_SELECTED'
      Origin = '"EKSP"."EKSP_SELECTED"'
    end
    object SmallintField2: TSmallintField
      FieldName = 'EKSP_PROC'
      Origin = '"EKSP"."EKSP_PROC"'
    end
    object IntegerField4: TIntegerField
      FieldName = 'EKSP_PARENT'
      Origin = '"EKSP"."EKSP_PARENT"'
    end
    object IntegerField5: TIntegerField
      FieldName = 'ID_UPLEVEL'
      Origin = '"EKSP"."ID_UPLEVEL"'
    end
    object IBStringField4: TIBStringField
      FieldName = 'EKSP_SOURCEFILE'
      Origin = '"EKSP"."EKSP_SOURCEFILE"'
      Size = 512
    end
    object MemoField2: TMemoField
      FieldName = 'EKSP_SIGNALSOURCE'
      Origin = '"EKSP"."EKSP_SIGNALSOURCE"'
      BlobType = ftMemo
      Size = 8
    end
    object IntegerField6: TIntegerField
      FieldName = 'POINTALL'
    end
    object FloatField5: TFloatField
      FieldName = 'DELTX'
    end
    object IntegerField7: TIntegerField
      FieldName = 'ID_DEVICE'
      Origin = '"EKSP"."ID_DEVICE"'
    end
    object IBStringField5: TIBStringField
      FieldName = 'DEVICE_NAME'
      ReadOnly = True
      Size = 48
    end
    object SmallintField3: TSmallintField
      FieldName = 'DEVICE_TYPE'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATETIME_FINISH'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATETIME_START'
    end
    object SmallintField4: TSmallintField
      FieldName = 'MODEM'
      Origin = '"EKSP"."MODEM"'
    end
    object SmallintField5: TSmallintField
      FieldName = 'TONE_PULSE'
      Origin = '"EKSP"."TONE_PULSE"'
    end
    object IBStringField6: TIBStringField
      FieldName = 'PHONE_NUMBER'
      Origin = '"EKSP"."PHONE_NUMBER"'
    end
    object SmallintField6: TSmallintField
      FieldName = 'ACCESS'
      Origin = '"EKSP"."ACCESS"'
    end
    object SmallintField7: TSmallintField
      FieldName = 'SCH_MODE'
      Origin = '"EKSP"."SCH_MODE"'
    end
    object SmallintField8: TSmallintField
      FieldName = 'SCH_DAY'
      Origin = '"EKSP"."SCH_DAY"'
    end
    object TimeField2: TTimeField
      FieldName = 'SCH_TIME'
      Origin = '"EKSP"."SCH_TIME"'
    end
    object SmallintField9: TSmallintField
      FieldName = 'SCH_ACTION_MODE'
      Origin = '"EKSP"."SCH_ACTION_MODE"'
    end
    object SmallintField10: TSmallintField
      FieldName = 'SCH_CONNECTION_MODE'
      Origin = '"EKSP"."SCH_CONNECTION_MODE"'
    end
    object IBStringField7: TIBStringField
      FieldName = 'MODBUS_ADDRESS'
      Origin = 'EKSP.MODBUS_ADDRESS'
      Size = 32
    end
    object SmallintField11: TSmallintField
      FieldName = 'MODBUS'
      Origin = 'EKSP.MODBUS'
    end
    object IntegerField8: TIntegerField
      FieldName = 'BDR'
      Origin = 'EKSP.BDR'
    end
    object SmallintField12: TSmallintField
      FieldName = 'PARITYCONTROL'
      Origin = 'EKSP.PARITYCONTROL'
    end
    object IntegerField9: TIntegerField
      FieldName = 'DEVICE_NUMBER'
      Origin = 'EKSP.DEVICE_NUMBER'
    end
    object IntegerField10: TIntegerField
      FieldName = 'STARTNUMBER_LARGEARCH'
    end
  end
  object HoursData_VT: TVirtualTable
    FieldDefs = <
      item
        Name = 'HOUR_VALUE'
        DataType = ftDateTime
      end>
    Left = 621
    Top = 102
    Data = {030001000A00484F55525F56414C55450B00000000000000000000000000}
    object HoursData_VTHOUR_VALUE: TDateTimeField
      FieldName = 'HOUR_VALUE'
    end
    object HoursData_VTS_VALUE: TFloatField
      FieldName = 'S_VALUE'
    end
    object HoursData_VTEKSP_NOMER: TIntegerField
      FieldName = 'EKSP_NOMER'
    end
    object HoursData_VTD_VALUE: TFloatField
      FieldName = 'D_VALUE'
    end
    object HoursData_VTONOFF_EXISTS: TIntegerField
      FieldName = 'ONOFF_EXISTS'
    end
    object HoursData_VTColor: TIntegerField
      FieldName = 'Color'
    end
    object HoursData_VTParent_HV: TDateTimeField
      FieldName = 'Parent_HV'
    end
  end
  object DaysData_VT: TVirtualTable
    FieldDefs = <
      item
        Name = 'DAY_VALUE'
        DataType = ftDateTime
      end>
    Left = 621
    Top = 54
    Data = {0300010009004441595F56414C55450B00000000000000000000000000}
    object DaysData_VTS_VALUE: TFloatField
      FieldName = 'S_VALUE'
    end
    object DaysData_VTEKSP_NOMER: TIntegerField
      FieldName = 'EKSP_NOMER'
    end
    object DaysData_VTD_VALUE: TFloatField
      FieldName = 'D_VALUE'
    end
    object DaysData_VTONOFF_EXISTS: TIntegerField
      FieldName = 'ONOFF_EXISTS'
    end
    object DaysData_VTcolor: TIntegerField
      FieldName = 'color'
    end
    object DaysData_VTParent_DV: TDateTimeField
      FieldName = 'Parent_DV'
    end
    object DaysData_VTDAY_VALUE: TDateTimeField
      FieldName = 'DAY_VALUE'
    end
  end
  object ds_OnOff: TDataSource
    AutoEdit = False
    DataSet = OnOff_New
    Left = 485
    Top = 78
  end
  object OnOff_New: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    DataSource = ds_eksp_theme
    SQL.Strings = (
      'select'
      ' oo.onoff_event as sstart,'
      ' (select min(q.onoff_event) from  on_off q'
      '   where  q.eksp_nomer = oo.eksp_nomer --and q.status=1'
      '    and q.onoff_event > oo.onoff_event) as finish,'
      '         oo.status,  oo.on_off_reason_int'
      'from on_off oo'
      ''
      ' where oo.eksp_nomer = :eksp_Nomer  and oo.status =0'
      ' order by oo.onoff_event desc')
    Left = 944
    Top = 165
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'eksp_nomer'
        ParamType = ptUnknown
      end>
    object OnOff_NewSSTART: TDateTimeField
      FieldName = 'SSTART'
      Origin = '"ON_OFF"."ONOFF_EVENT"'
    end
    object OnOff_NewFINISH: TDateTimeField
      FieldName = 'FINISH'
      ProviderFlags = []
    end
    object OnOff_NewSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = '"ON_OFF"."STATUS"'
    end
    object OnOff_NewON_OFF_REASON_INT: TSmallintField
      FieldName = 'ON_OFF_REASON_INT'
      Origin = '"ON_OFF"."ON_OFF_REASON_INT"'
      OnGetText = OnOff_NewON_OFF_REASON_INTGetText
    end
  end
end
