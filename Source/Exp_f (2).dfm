inherited ExpForm: TExpForm
  Left = 31
  Top = 117
  Width = 1107
  Height = 675
  Caption = #1040#1088#1093#1080#1074#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1087#1088#1080#1073#1086#1088#1086#1074
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter4: TSplitter [0]
    Left = 0
    Top = 439
    Width = 1089
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Color = clInfoBk
    ParentColor = False
  end
  object Panel_uP: TPanel [1]
    Left = 0
    Top = 0
    Width = 1089
    Height = 439
    Align = alTop
    Color = clInfoBk
    Constraints.MinHeight = 200
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 690
      Top = 28
      Height = 410
      Align = alRight
    end
    object Panel5: TPanel
      Left = 693
      Top = 28
      Width = 395
      Height = 410
      Align = alRight
      BevelOuter = bvLowered
      Constraints.MaxWidth = 640
      Constraints.MinWidth = 320
      TabOrder = 0
      object Label4: TLabel
        Left = 1
        Top = 1
        Width = 393
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
        Width = 393
        Height = 392
        ActivePage = TabSheet5
        Align = alClient
        MultiLine = True
        TabOrder = 0
        OnChange = PageControl1Change
        object TabSheet1: TTabSheet
          Caption = #1054#1073#1098#1077#1082#1090
          object cxObjectMemo: TcxDBMemo
            Left = 0
            Top = 73
            Width = 385
            Height = 250
            Align = alClient
            DataBinding.DataSource = ds_eksp_theme
            DataBinding.DataField = 'EKSP_SIGNALSOURCE'
            Properties.ScrollBars = ssVertical
            Style.Color = clWhite
            TabOrder = 0
          end
          object Panel1: TPanel
            Left = 0
            Top = 323
            Width = 385
            Height = 38
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              385
              38)
            object cxButton3: TcxButton
              Left = 96
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
            Width = 385
            Height = 73
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            DesignSize = (
              385
              73)
            object Label5: TLabel
              Left = 4
              Top = 4
              Width = 54
              Height = 16
              Caption = #1054#1073#1098#1077#1082#1090':'
            end
            object Label12: TLabel
              Left = 5
              Top = 50
              Width = 159
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
              TabOrder = 0
              Visible = False
            end
            object cxDBTextEdit1: TcxDBTextEdit
              Left = 4
              Top = 25
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
            Top = 328
            Width = 385
            Height = 33
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              385
              33)
            object Label10: TLabel
              Left = 2
              Top = 0
              Width = 111
              Height = 16
              Anchors = [akLeft]
              Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1092#1072#1081#1083':'
              Visible = False
            end
            object btnEdit: TcxButton
              Left = 96
              Top = 5
              Width = 198
              Height = 25
              Anchors = [akLeft, akRight, akBottom]
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
              TabOrder = 0
              OnClick = btnEditClick
              LookAndFeel.Kind = lfStandard
            end
            object FileSource: TcxDBTextEdit
              Left = 2
              Top = 14
              Width = 375
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
            Width = 385
            Height = 154
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              385
              154)
            object Label7: TLabel
              Left = 2
              Top = 89
              Width = 114
              Height = 16
              Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081':'
            end
            object Label13: TLabel
              Left = 2
              Top = 46
              Width = 139
              Height = 16
              Caption = #1055#1088#1080#1087#1080#1089#1072#1085' '#1082' '#1086#1073#1098#1077#1082#1090#1091':'
            end
            object Label21: TLabel
              Left = 290
              Top = 2
              Width = 14
              Height = 16
              Caption = #8470
            end
            object DBText1: TDBText
              Left = 311
              Top = 2
              Width = 61
              Height = 21
              DataField = 'DEVICE_NUMBER'
              DataSource = ds_eksp_theme
            end
            object eksp_header: TcxDBTextEdit
              Left = -1
              Top = 22
              Width = 374
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'EKSP_HEADER'
              Style.Color = clWhite
              TabOrder = 0
            end
            object cxDBTextEdit3: TcxDBTextEdit
              Left = 119
              Top = 89
              Width = 254
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'EKSP_AUTHOR'
              Style.Color = clWhite
              TabOrder = 1
            end
            object objectslist: TcxDBComboBox
              Left = -1
              Top = 62
              Width = 374
              Height = 24
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
              Width = 281
              Height = 24
              DataBinding.DataSource = ds_eksp_theme
              DataBinding.DataField = 'DEVICE_NAME'
              ParentFont = False
              Style.Color = cl3DLight
              Style.Edges = []
              TabOrder = 3
            end
            object RG_Access: TRadioGroup
              Left = 3
              Top = 115
              Width = 253
              Height = 39
              Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089' '#1087#1088#1080#1073#1086#1088#1072
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'RS232'
                'RS485(ModBus)')
              TabOrder = 4
              OnClick = RG_AccessClick
            end
            object cbVia_modem: TCheckBox
              Left = 261
              Top = 119
              Width = 122
              Height = 30
              Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1084#1086#1076#1077#1084
              TabOrder = 5
              WordWrap = True
              OnClick = cbVia_modemClick
            end
          end
          object PageControl2: TPageControl
            Left = 0
            Top = 154
            Width = 385
            Height = 174
            ActivePage = TabSheetModBus
            Align = alClient
            Constraints.MinHeight = 70
            MultiLine = True
            TabOrder = 2
            object TabSheetMemo: TTabSheet
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1082' '#1087#1088#1080#1073#1086#1088#1091
              object cxDeviceMemo: TcxDBMemo
                Left = 0
                Top = 0
                Width = 377
                Height = 122
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
                Left = 20
                Top = 30
                Width = 102
                Height = 32
                Alignment = taRightJustify
                Caption = #1055#1086#1083#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1076#1083#1103' '#1085#1072#1073#1086#1088#1072':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object Label_pulse: TLabel
                Left = -1
                Top = 64
                Width = 291
                Height = 16
                Caption = #1085#1072#1087#1088#1080#1084#1077#1088', 8 495 362 32 00  '#1080#1083#1080' 8 8617 85 6390'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsItalic]
                ParentFont = False
                Visible = False
              end
              object Label16: TLabel
                Left = 0
                Top = 82
                Width = 173
                Height = 16
                Caption = #1050#1086#1076' '#1076#1083#1103' '#1074#1099#1093#1086#1076#1072' "'#1074' '#1075#1086#1088#1086#1076'":'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label_Tone: TLabel
                Left = 15
                Top = 63
                Width = 305
                Height = 16
                Caption = #1085#1072#1087#1088#1080#1084#1077#1088', +7 495 362 32 00  '#1080#1083#1080' +7 8617 85 6390'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsItalic]
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
              object Access: TcxComboBox
                Left = 172
                Top = 81
                Width = 189
                Height = 24
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
                Top = -4
                Width = 361
                Height = 37
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
                Top = 6
                Width = 60
                Height = 32
                Caption = #1040#1076#1088#1077#1089' '#1087#1088#1080#1073#1086#1088#1072':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object lbBdr: TLabel
                Left = 0
                Top = 47
                Width = 107
                Height = 16
                Caption = #1057#1082#1086#1088#1086#1089#1090#1100', '#1073#1080#1090'/'#1089
              end
              object lbParity: TLabel
                Left = 0
                Top = 80
                Width = 121
                Height = 16
                Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1099#1081' '#1073#1080#1090
              end
              object modbus_address: TcxDBSpinEdit
                Left = 118
                Top = 9
                Width = 80
                Height = 24
                DataBinding.DataSource = ds_eksp_theme
                DataBinding.DataField = 'MODBUS_ADDRESS'
                Properties.MaxValue = 247.000000000000000000
                Properties.MinValue = 1.000000000000000000
                Properties.ReadOnly = False
                Properties.OnValidate = modbus_addressPropertiesValidate
                TabOrder = 0
              end
              object cxBDR: TDBComboBoxEh
                Left = 118
                Top = 41
                Width = 80
                Height = 22
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
                Left = 118
                Top = 74
                Width = 80
                Height = 22
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
              Caption = 'PIN '#1082#1086#1076
              ImageIndex = 3
              object Label6: TLabel
                Left = 5
                Top = 4
                Width = 113
                Height = 16
                Alignment = taRightJustify
                Caption = 'PIN-'#1082#1086#1076' '#1087#1088#1080#1073#1086#1088#1072':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object cxDBSpinEdit1: TcxDBSpinEdit
                Left = 134
                Top = 1
                Width = 80
                Height = 24
                DataBinding.DataSource = ds_eksp_theme
                DataBinding.DataField = 'BLUETOOTH_PIN'
                Properties.MaxValue = 9999.000000000000000000
                Properties.ReadOnly = False
                Properties.OnValidate = modbus_addressPropertiesValidate
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
            Top = 153
            Width = 385
            Height = 0
            Cursor = crVSplit
            Align = alBottom
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 153
            Width = 385
            Height = 208
            Align = alBottom
            Caption = #1054' '#1089#1080#1075#1085#1072#1083#1077
            TabOrder = 0
            DesignSize = (
              385
              208)
            object Label1: TLabel
              Left = 4
              Top = 146
              Width = 117
              Height = 16
              Caption = #1060#1072#1081#1083' '#1089' '#1076#1072#1085#1085#1099#1084#1080':'
            end
            object Label2: TLabel
              Left = 4
              Top = 16
              Width = 90
              Height = 16
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
            end
            object Label9: TLabel
              Left = 4
              Top = 121
              Width = 196
              Height = 16
              Cursor = crHandPoint
              Caption = #1063#1072#1089#1090#1086#1090#1072' '#1076#1080#1089#1082#1088#1077#1090#1080#1079#1072#1094#1080#1080', '#1043#1094':'
              OnClick = deltxDblClick
            end
            object deltx: TcxDBTextEdit
              Left = 207
              Top = 119
              Width = 164
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
              Width = 368
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
              Left = 89
              Top = 90
              Width = 193
              Height = 24
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
            Width = 385
            Height = 153
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
                Width = 13
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'NAMEY'
                Footers = <>
                Title.Caption = #1086#1089#1100' Y'
                Width = 24
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'RAZMY'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = '[ ]'
                Width = 13
              end
              item
                EditButtons = <>
                FieldName = 'CHANAL_HEADER'
                Footers = <>
                Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                Width = 40
              end
              item
                EditButtons = <>
                FieldName = 'POINTALL'
                Footers = <>
                Title.Caption = #1054#1090#1089#1095#1077#1090#1099
                Width = 29
              end
              item
                DisplayFormat = '0.00000'
                EditButtons = <>
                FieldName = 'A1'
                Footers = <>
                Width = 22
              end
              item
                DisplayFormat = '0.00000'
                EditButtons = <>
                FieldName = 'A0'
                Footers = <>
                Width = 21
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
            Width = 385
            Height = 211
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
                Width = 48
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'VIEW_STYLE'
                Footers = <>
                Title.Caption = #1057#1090#1080#1083#1100
                Width = 41
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'VIEW_PAGE'
                Footers = <>
                Title.Caption = #1089#1090#1088#1072#1085#1080#1094#1099'( '#1095#1080#1089#1083#1086' '#1082#1088#1080#1074#1099#1093')'
                Width = 173
              end>
          end
          object Curveset_GB: TGroupBox
            Left = 0
            Top = 211
            Width = 385
            Height = 150
            Align = alBottom
            TabOrder = 1
            DesignSize = (
              385
              150)
            object Label11: TLabel
              Left = 4
              Top = 16
              Width = 90
              Height = 16
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
            end
            object cxDBMemo3: TcxDBMemo
              Left = 2
              Top = 38
              Width = 375
              Height = 67
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
              Height = 24
              Anchors = [akTop, akRight]
              Caption = #1055#1088#1072#1074#1082#1072
              TabOrder = 1
              OnClick = cxButton2Click
              LookAndFeel.Kind = lfStandard
            end
            object btnDeleteCurveset: TcxButton
              Left = 9
              Top = 106
              Width = 140
              Height = 24
              Caption = #1059#1076#1072#1083#1080#1090#1100'  '#1075#1088#1072#1092#1080#1082
              TabOrder = 2
              OnClick = btnDeleteCurvesetClick
              LookAndFeel.Kind = lfStandard
            end
            object AllCurveSet_CB: TCheckBox
              Left = 9
              Top = 134
              Width = 216
              Height = 17
              Caption = #1074#1089#1077' '#1075#1088#1072#1092#1080#1082#1080' '#1087#1088#1080#1073#1086#1088#1072
              TabOrder = 3
            end
            object btnShowImage: TcxButton
              Left = 235
              Top = 106
              Width = 135
              Height = 24
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
            Width = 385
            Height = 320
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
                Width = 104
              end
              item
                Alignment = taRightJustify
                EditButtons = <>
                FieldName = 'PARAMVALUE'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1080
                Width = 46
              end>
          end
          object Panel7: TPanel
            Left = 0
            Top = 320
            Width = 385
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              385
              41)
            object btnPrintParamReport: TcxButton
              Left = 92
              Top = 9
              Width = 200
              Height = 24
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
            Width = 385
            Height = 361
            ActivePage = TabSheet10
            Align = alClient
            MultiLine = True
            TabOrder = 0
            OnChange = ArchievPCChange
            object TabSheet8: TTabSheet
              Caption = #1055#1077#1088#1077#1088#1099#1074#1099' '#1091#1095#1077#1090#1072
              object OnOffGrid: TDBGridEh
                Left = 0
                Top = 32
                Width = 377
                Height = 50
                Align = alClient
                AutoFitColWidths = True
                DataSource = ds_OnOff
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
                    FieldName = 'SSTART'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1085#1072#1095#1072#1083#1086
                    Width = 106
                  end
                  item
                    Alignment = taCenter
                    DisplayFormat = 'dd.mm.yy hh:mm'
                    EditButtons = <>
                    FieldName = 'FINISH'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1086#1082#1086#1085#1095#1072#1085#1080#1077
                    Width = 97
                  end
                  item
                    Alignment = taLeftJustify
                    EditButtons = <>
                    FieldName = 'ON_OFF_REASON_INT'
                    Footers = <>
                    Title.Caption = #1087#1088#1080#1095#1080#1085#1072
                    Width = 156
                  end>
              end
              object OnOff_Info: TcxMemo
                Left = 0
                Top = 82
                Width = 374
                Height = 224
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
                Width = 377
                Height = 32
                Align = alTop
                TabOrder = 2
                object Label26: TLabel
                  Left = 7
                  Top = 9
                  Width = 7
                  Height = 16
                  Caption = 'c'
                end
                object Label27: TLabel
                  Left = 126
                  Top = 9
                  Width = 16
                  Height = 16
                  Caption = #1087#1086
                end
                object DD1_OnOff: TDateTimePicker
                  Left = 19
                  Top = 5
                  Width = 100
                  Height = 24
                  Date = 38702.369325798610000000
                  Time = 38702.369325798610000000
                  TabOrder = 0
                  OnChange = DD1Change
                end
                object DD2_OnOff: TDateTimePicker
                  Left = 151
                  Top = 5
                  Width = 97
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
              object HoursGrid: TDBGridEh
                Left = 0
                Top = 54
                Width = 377
                Height = 255
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
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind]
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
                    EditButtons = <>
                    FieldName = 'HOUR_VALUE'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1076#1072#1090#1072
                    Width = 66
                  end
                  item
                    DisplayFormat = '0.000'
                    EditButtons = <>
                    FieldName = 'S_VALUE'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1079#1085#1072#1095#1077#1085#1080#1077
                    Width = 94
                  end
                  item
                    EditButtons = <>
                    FieldName = 'D_VALUE'
                    Footers = <>
                    Title.Caption = #1087#1088#1080#1088#1072#1097#1077#1085#1080#1077
                    Width = 111
                  end>
              end
              object Panel14: TPanel
                Left = 0
                Top = 0
                Width = 377
                Height = 54
                Align = alTop
                TabOrder = 1
                DesignSize = (
                  377
                  54)
                object btnLastDay: TSpeedButton
                  Left = 6
                  Top = 29
                  Width = 149
                  Height = 22
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
                  Top = 7
                  Width = 7
                  Height = 16
                  Caption = 'c'
                end
                object Label23: TLabel
                  Left = 145
                  Top = 7
                  Width = 16
                  Height = 16
                  Caption = #1087#1086
                end
                object btnLast10Days: TSpeedButton
                  Left = 165
                  Top = 29
                  Width = 164
                  Height = 22
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
                  Left = 14
                  Top = 3
                  Width = 110
                  Height = 24
                  Date = 38702.369325798610000000
                  Time = 38702.369325798610000000
                  TabOrder = 0
                  OnChange = DD1Change
                end
                object DD2_H: TDateTimePicker
                  Left = 170
                  Top = 3
                  Width = 110
                  Height = 24
                  Date = 38702.000000000000000000
                  Time = 38702.000000000000000000
                  TabOrder = 1
                  OnChange = DD1Change
                end
              end
            end
            object TabSheet11: TTabSheet
              Caption = #1057#1091#1090#1086#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
              ImageIndex = 2
              object DaysGrid: TDBGridEh
                Left = 0
                Top = 59
                Width = 377
                Height = 250
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
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind]
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
                    DisplayFormat = 'dd.mm.yy 00:00'
                    EditButtons = <>
                    FieldName = 'DAY_VALUE'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1076#1072#1090#1072
                    Width = 84
                  end
                  item
                    DisplayFormat = '0.00'
                    EditButtons = <>
                    FieldName = 'S_VALUE'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1079#1085#1072#1095#1077#1085#1080#1077
                    Width = 96
                  end
                  item
                    EditButtons = <>
                    FieldName = 'D_VALUE'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1087#1088#1080#1088#1072#1097#1077#1085#1080#1077
                    Width = 117
                  end>
              end
              object Panel15: TPanel
                Left = 0
                Top = 0
                Width = 377
                Height = 59
                Align = alTop
                TabOrder = 1
                DesignSize = (
                  377
                  59)
                object btnLastMonth: TSpeedButton
                  Left = 6
                  Top = 30
                  Width = 153
                  Height = 25
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
                  Top = 7
                  Width = 7
                  Height = 16
                  Caption = 'c'
                end
                object Label25: TLabel
                  Left = 146
                  Top = 7
                  Width = 16
                  Height = 16
                  Caption = #1087#1086
                end
                object btnLast3Monthes: TSpeedButton
                  Left = 179
                  Top = 31
                  Width = 174
                  Height = 25
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
                  Left = 14
                  Top = 3
                  Width = 110
                  Height = 24
                  Date = 38702.369325798610000000
                  Time = 38702.369325798610000000
                  TabOrder = 0
                  OnChange = DD1Change
                end
                object DD2_D: TDateTimePicker
                  Left = 170
                  Top = 3
                  Width = 110
                  Height = 24
                  Date = 38702.000000000000000000
                  Time = 38702.000000000000000000
                  TabOrder = 1
                  OnChange = DD1Change
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
            Top = 9
            Width = 233
            Height = 16
            Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1086#1073#1088#1072#1097#1077#1085#1080#1081' '#1082' '#1087#1088#1080#1073#1086#1088#1091':'
          end
          object sch_mode: TDBComboBoxEh
            Left = 0
            Top = 32
            Width = 265
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
            Top = 319
            Width = 385
            Height = 42
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              385
              42)
            object cxButton4: TcxButton
              Left = 96
              Top = 4
              Width = 212
              Height = 29
              Anchors = [akLeft, akRight, akBottom]
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
              TabOrder = 0
              OnClick = cxButton3Click
              LookAndFeel.Kind = lfStandard
            end
          end
          object sch_panel: TPanel
            Left = -2
            Top = 58
            Width = 329
            Height = 159
            BevelOuter = bvNone
            TabOrder = 2
            object Label18: TLabel
              Left = 2
              Top = 2
              Width = 130
              Height = 16
              Caption = #1056#1077#1078#1080#1084' '#1086#1073#1088#1072#1097#1077#1085#1080#1103':'
            end
            object Label15: TLabel
              Left = 2
              Top = 54
              Width = 126
              Height = 16
              Caption = #1042#1088#1077#1084#1103' '#1086#1073#1088#1072#1097#1077#1085#1080#1103':'
            end
            object LabelDay: TLabel
              Left = 2
              Top = 85
              Width = 116
              Height = 16
              Caption = #1044#1077#1085#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1103':'
            end
            object Label17: TLabel
              Left = 86
              Top = 110
              Width = 136
              Height = 16
              Caption = #1056#1077#1078#1080#1084' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103':'
              Visible = False
            end
            object sch_action_mode: TDBComboBoxEh
              Left = 2
              Top = 22
              Width = 266
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
              Left = 126
              Top = 54
              Width = 61
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
              Left = 126
              Top = 84
              Width = 142
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
              Left = 86
              Top = 128
              Width = 265
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
        Left = 251
        Top = 16
        Width = 140
        Height = 28
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          140
          28)
        object btnCreateHTMLReport: TSpeedButton
          Left = 1
          Top = 1
          Width = 137
          Height = 25
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
          Left = 116
          Top = 0
          Width = 24
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
          Visible = False
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 28
      Width = 689
      Height = 410
      Align = alClient
      Caption = 'Panel2'
      Constraints.MinHeight = 100
      Constraints.MinWidth = 400
      TabOrder = 1
      object Panel3: TPanel
        Left = 1
        Top = 362
        Width = 687
        Height = 47
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        DesignSize = (
          687
          47)
        object btnDelete: TcxButton
          Left = 169
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
          Left = 440
          Top = 6
          Width = 250
          Height = 28
          Anchors = [akTop, akRight]
          Caption = #1043#1088#1072#1092#1080#1082' '#1079#1072' '#1074#1089#1077' '#1074#1088#1077#1084#1103' '#1085#1072#1073#1083#1102#1076#1077#1085#1080#1103
          TabOrder = 1
          OnClick = btnCreateAndShowImageClick
          LookAndFeel.Kind = lfStandard
        end
        object AllThemeExp: TCheckBox
          Left = 12
          Top = 28
          Width = 189
          Height = 18
          Caption = #1074#1089#1077' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1099' '#1090#1077#1084#1099
          TabOrder = 2
          Visible = False
        end
        object btnLoadInfoFromDevice: TcxButton
          Left = 9
          Top = 6
          Width = 213
          Height = 28
          Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1080#1073#1086#1088#1086#1084
          TabOrder = 3
          OnClick = btnLoadInfoFromDeviceClick
          LookAndFeel.Kind = lfStandard
        end
      end
      object DBGrid: TDBGridEh
        Left = 1
        Top = 1
        Width = 687
        Height = 361
        Align = alClient
        AutoFitColWidths = True
        DataSource = ds_eksp_theme
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
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
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'EKSP_THEME'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1082#1090
            Width = 114
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'DEVICE_NAME'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1090#1080#1087
            Width = 99
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'DEVICE_NUMBER'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1085#1086#1084#1077#1088
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'EKSP_HEADER'
            Footers = <>
            Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 113
          end
          item
            DisplayFormat = 'dd.mm.yy hh:mm'
            EditButtons = <>
            FieldName = 'DATETIME_START'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'| '#1089'  '
            Width = 49
          end
          item
            DisplayFormat = 'dd.mm.yy hh:mm'
            EditButtons = <>
            FieldName = 'DATETIME_FINISH'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'| '#1087#1086
            Width = 62
          end
          item
            EditButtons = <>
            FieldName = 'EKSP_AUTHOR'
            Footers = <>
            Title.Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
            Width = 119
          end>
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 1087
      Height = 27
      Align = alTop
      Alignment = taRightJustify
      BevelOuter = bvLowered
      TabOrder = 2
      Visible = False
      object Label3: TLabel
        Left = 9
        Top = 4
        Width = 82
        Height = 16
        Caption = #1048#1084#1103' '#1072#1088#1093#1080#1074#1072':'
      end
      object cbDatabases: TComboBox
        Left = 105
        Top = 1
        Width = 444
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
    Top = 442
    Width = 1089
    Height = 165
    Align = alClient
    Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1072#1085#1085#1099#1093
    TabOrder = 1
    DesignSize = (
      1089
      165)
    object ChartPC: TPageControl
      Left = 1
      Top = 1
      Width = 1087
      Height = 163
      ActivePage = HoursChat_Tab
      Align = alClient
      Constraints.MinHeight = 150
      MultiLine = True
      TabOrder = 0
      object HoursChat_Tab: TTabSheet
        Caption = #1063#1072#1089#1086#1074#1099#1077' '#1076#1072#1085#1085#1099#1077
        ImageIndex = 1
        object Hours_Chart: TDBChart
          Left = 0
          Top = 0
          Width = 1079
          Height = 60
          AllowPanning = pmHorizontal
          AnimatedZoom = True
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            '')
          Title.Visible = False
          OnClickSeries = Hours_ChartClickSeries
          BottomAxis.DateTimeFormat = 'dd.mm.yy  hh:mm'
          BottomAxis.LabelStyle = talValue
          Legend.Visible = False
          View3D = False
          OnAfterDraw = Hours_ChartAfterDraw
          Align = alClient
          TabOrder = 0
          object HourSeries: TAreaSeries
            ColorSource = 'color'
            Marks.ArrowLength = 20
            Marks.Style = smsValue
            Marks.Visible = False
            DataSource = HoursData_VT
            SeriesColor = 16498119
            ShowInLegend = False
            ValueFormat = '#,##0.#'
            XLabelsSource = 'D_VALUE'
            AreaLinesPen.Color = 16744576
            DrawArea = True
            LinePen.Color = clAqua
            Pointer.HorizSize = 2
            Pointer.InflateMargins = True
            Pointer.Pen.Color = 10485760
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
        object onOff_Hours_Chart: TDBChart
          Left = 0
          Top = 60
          Width = 1079
          Height = 72
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
      end
      object DaysChat_Tab: TTabSheet
        Caption = #1057#1091#1090#1086#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        ImageIndex = 2
        object Days_Chart: TDBChart
          Left = 0
          Top = 0
          Width = 1079
          Height = 56
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
          LeftAxis.Labels = False
          LeftAxis.Visible = False
          Legend.Visible = False
          View3D = False
          OnAfterDraw = Days_ChartAfterDraw
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
            XLabelsSource = 'D_VALUE'
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
          Top = 56
          Width = 1079
          Height = 76
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
      end
    end
    object mousePanel: TPanel
      Left = 262
      Top = 4
      Width = 816
      Height = 19
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        816
        19)
      object cxButton24Hours: TcxButton
        Left = 102
        Top = 0
        Width = 60
        Height = 20
        Hint = #1087#1086#1082#1072#1079#1072#1090#1100' 24 '#1095#1072#1089#1072' '#1086#1090' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086'  '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1095#1072#1089#1086#1074#1099#1093' '#1076#1072#1085#1085#1099#1093' '#1084#1086#1084#1077#1085#1090#1072
        Anchors = [akTop, akRight]
        Caption = '24 '#1095#1072#1089#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -15
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
        Left = 177
        Top = 0
        Width = 60
        Height = 20
        Hint = 
          #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1090#1088#1080#1076#1094#1072#1090#1100' '#1089#1091#1090#1086#1082' '#1086#1090' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1089#1091#1090#1086#1095#1085 +
          #1099#1093' '#1076#1072#1085#1085#1099#1093' '#1079#1085#1072#1095#1077#1085#1080#1103
        Anchors = [akTop, akRight]
        Caption = '30 '#1089#1091#1090#1086#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -15
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
        Left = 377
        Top = -1
        Width = 200
        Height = 20
        Hint = #1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1074#1099#1089#1090#1072#1074#1080#1090#1100' '#1084#1072#1089#1096#1090#1072#1073' '#1087#1086' '#1086#1089#1080' '#1086#1088#1076#1080#1085#1072#1090
        Anchors = [akTop, akRight]
        Caption = #1053#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1088#1072#1089#1093#1086#1076#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -15
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
        Left = 622
        Top = 1
        Width = 172
        Height = 17
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
      object N2: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100'  '#1072#1088#1093#1080#1074' '#1087#1088#1080#1073#1086#1088#1072' '#1074' '#1091#1082#1072#1079#1072#1085#1085#1086#1084' '#1076#1080#1072#1087#1072#1079#1086#1085#1077' '#1076#1072#1090
        OnClick = N2Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object N8: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1073#1086#1088' '#1080' '#1074#1089#1077' '#1077#1075#1086' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1072#1088#1093#1080#1074#1072
        OnClick = btnDeleteClick
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
      'Via_modem = :Via_modem'
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
    Left = 416
    Top = 308
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
    Left = 496
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
  object HoursData: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    AfterOpen = HoursDataAfterOpen
    DataSource = ds_eksp_theme
    SQL.Strings = (
      'select * from HoursData '
      'where '
      'eksp_nomer = :eksp_nomer'
      'order by '
      'Hour_Value desc')
    Left = 424
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'eksp_nomer'
        ParamType = ptUnknown
      end>
    object HoursDataHOUR_VALUE: TDateTimeField
      FieldName = 'HOUR_VALUE'
      Origin = '"HOURSDATA"."HOUR_VALUE"'
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object HoursDataS_VALUE: TFloatField
      FieldName = 'S_VALUE'
      Origin = '"HOURSDATA"."S_VALUE"'
      DisplayFormat = '0.00'
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
    Left = 396
    Top = 103
  end
  object DaysData_F: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    AfterOpen = DaysData_FAfterOpen
    BeforeOpen = DaysData_FBeforeOpen
    OnCalcFields = DaysData_FCalcFields
    DataSource = DS_Signals
    SQL.Strings = (
      'select'
      '  dD.*,'
      
        '(select count(oo.id_onoff) from on_off oo where oo.eksp_nomer = ' +
        'dd.eksp_nomer'
      'and oo.onoff_event between (dd.day_value -1 ) and dd.day_value )'
      '  as OnOff_Exists'
      'from DaysData dD'
      'where '
      'eksp_nomer = :eksp_nomer'
      'and day_Value between :DD1 and :DD2'
      'order by '
      'day_Value desc')
    Left = 550
    Top = 284
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'eksp_nomer'
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
    AfterOpen = HoursData_FAfterOpen
    BeforeOpen = HoursData_FBeforeOpen
    OnCalcFields = HoursData_FCalcFields
    DataSource = DS_Signals
    SQL.Strings = (
      'select   HD.*,'
      
        '(select count(oo.id_onoff) from on_off oo where oo.eksp_nomer = ' +
        'hd.eksp_nomer'
      
        ' and oo.onoff_event between ( hd.hour_value-0.0416666666 ) and h' +
        'd.hour_value ) as onoff_exists'
      'from HoursData HD'
      'where '
      'eksp_nomer = :eksp_nomer'
      'and hour_Value between :DD1 and :DD2'
      'order by '
      'Hour_Value desc')
    Left = 552
    Top = 236
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
    Left = 301
    Top = 318
    Data = {010001000B004F4E4F46465F4556454E540B000000000000000000}
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
    Left = 267
    Top = 322
    Data = {010001000B004F4E4F46465F4556454E540B000000000000000000}
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
    Left = 225
    Top = 338
    Data = {010001000B004F4E4F46465F4556454E540B000000000000000000}
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
    Top = 306
    Data = {010001000B004F4E4F46465F4556454E540B000000000000000000}
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
    Left = 373
    Top = 347
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
    Top = 316
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
    Left = 581
    Top = 110
    Data = {010001000A00484F55525F56414C55450B000000000000000000}
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
    Top = 190
    Data = {0100010009004441595F56414C55450B000000000000000000}
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
      '   where  q.eksp_nomer = oo.eksp_nomer and q.status<>oo.status'
      '    and q.onoff_event > oo.onoff_event) as finish,'
      '         oo.status,  oo.on_off_reason_int'
      'from on_off oo'
      ''
      ' where oo.eksp_nomer = :eksp_Nomer  and oo.status =0'
      ' order by oo.onoff_event desc')
    Left = 992
    Top = 317
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
