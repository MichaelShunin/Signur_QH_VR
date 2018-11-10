object Importisgi_form: TImportisgi_form
  Left = 111
  Top = 152
  Width = 745
  Height = 445
  BorderIcons = []
  Caption = #1048#1084#1087#1086#1088#1090' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1080#1089#1087#1099#1090#1072#1085#1080#1081
  Color = clBtnFace
  Constraints.MinWidth = 620
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 300
    Align = alTop
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 310
      Height = 298
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 308
        Height = 35
        Align = alTop
        Constraints.MinWidth = 275
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 170
          Top = 4
          Width = 92
          Height = 28
          Caption = #1042#1099#1073#1088#1072#1090#1100
          OnClick = SpeedButton1Click
        end
        object StaticText2: TStaticText
          Left = 13
          Top = 7
          Width = 141
          Height = 20
          Alignment = taCenter
          Caption = #1060#1072#1081#1083#1099' '#1080#1089#1087#1099#1090#1072#1085#1080#1081' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object LB: TListBox
        Left = 1
        Top = 36
        Width = 308
        Height = 261
        Align = alClient
        Columns = 2
        ItemHeight = 16
        MultiSelect = True
        TabOrder = 1
        OnClick = LBClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 311
      Top = 1
      Width = 425
      Height = 298
      Align = alRight
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086#1073' '#1080#1089#1087#1099#1090#1072#1085#1080#1103#1093' '#1076#1083#1103' '#1079#1072#1087#1080#1089#1080' '#1074' '#1072#1088#1093#1080#1074
      Constraints.MinHeight = 220
      Constraints.MinWidth = 420
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 5
        Top = 92
        Width = 126
        Height = 16
        Caption = #1054#1073#1098#1077#1082#1090' '#1080#1089#1087#1099#1090#1072#1085#1080#1081':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 5
        Top = 136
        Width = 259
        Height = 16
        Caption = #1055#1088#1080#1095#1080#1085#1072' ('#1094#1077#1083#1100') '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1080#1089#1087#1099#1090#1072#1085#1080#1081':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 5
        Top = 184
        Width = 132
        Height = 16
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100' '#1088#1072#1073#1086#1090':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 5
        Top = 230
        Width = 86
        Height = 16
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 5
        Top = 15
        Width = 76
        Height = 16
        Caption = #1048#1089#1087#1099#1090#1072#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ModePanel: TPanel
        Left = 8
        Top = 71
        Width = 413
        Height = 17
        BevelOuter = bvNone
        TabOrder = 9
        Visible = False
        object Mode: TLabel
          Left = 0
          Top = 0
          Width = 40
          Height = 17
          Align = alLeft
          Caption = 'Mode'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Oil: TLabel
          Left = 367
          Top = 0
          Width = 46
          Height = 17
          Align = alRight
          Caption = #1084#1072#1089#1083#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Object_CB: TComboBox
        Left = 5
        Top = 112
        Width = 308
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        OnClick = Object_CBClick
      end
      object Reason_CB: TComboBox
        Left = 5
        Top = 156
        Width = 413
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 1
        Text = 'ComboBox1'
      end
      object Author_CB: TComboBox
        Left = 5
        Top = 204
        Width = 413
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 2
        Text = 'ComboBox1'
      end
      object Memo1: TMemo
        Left = 5
        Top = 248
        Width = 412
        Height = 45
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Memo1')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object LB1: TListBox
        Left = 138
        Top = 98
        Width = 131
        Height = 139
        ItemHeight = 16
        MultiSelect = True
        TabOrder = 4
        Visible = False
        OnClick = LBClick
      end
      object E_Name: TEdit
        Left = 8
        Top = 36
        Width = 353
        Height = 24
        MaxLength = 47
        TabOrder = 5
        Text = ' '
      end
      object AutoCB: TCheckBox
        Left = 368
        Top = 40
        Width = 53
        Height = 17
        Hint = #1040#1074#1090#1086#1079#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1087#1086' '#1080#1084#1077#1085#1080' '#1092#1072#1081#1083#1072' '#1080' '#1076#1072#1090#1077
        Caption = #1072#1074#1090#1086
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 6
        OnClick = AutoCBClick
      end
      object emptyoborotpanel: TPanel
        Left = 317
        Top = 96
        Width = 105
        Height = 57
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Visible = False
        object Label12: TLabel
          Left = 4
          Top = 38
          Width = 64
          Height = 16
          Caption = #1093#1086#1083#1086#1089#1090#1099#1077' '
        end
        object Label13: TLabel
          Left = 1
          Top = 1
          Width = 70
          Height = 16
          Caption = #1054#1073#1086#1088#1086#1090#1099':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 75
          Top = 38
          Width = 23
          Height = 17
          DataField = 'EMPTYOBOROT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 5
          Top = 19
          Width = 59
          Height = 16
          Caption = #1085#1077' '#1073#1086#1083#1077#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 75
          Top = 19
          Width = 29
          Height = 17
          DataField = 'OBOROTMAX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object EtapPanel: TPanel
        Left = 8
        Top = 64
        Width = 321
        Height = 29
        BevelOuter = bvNone
        Caption = 'EtapPanel'
        TabOrder = 8
        object Label11: TLabel
          Left = 3
          Top = 3
          Width = 109
          Height = 16
          Caption = #1069#1090#1072#1087' '#1080#1089#1087#1099#1090#1072#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Stage_CB: TComboBox
          Left = 116
          Top = 1
          Width = 190
          Height = 24
          ItemHeight = 16
          TabOrder = 0
        end
      end
    end
  end
  object GB3: TGroupBox
    Left = 0
    Top = 300
    Width = 710
    Height = 61
    Align = alTop
    Caption = #1060#1072#1081#1083' '
    Constraints.MaxWidth = 710
    Constraints.MinWidth = 710
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label5: TLabel
      Left = 9
      Top = 13
      Width = 140
      Height = 16
      Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 336
      Top = 14
      Width = 144
      Height = 16
      Caption = #1063#1072#1089#1090#1086#1090#1072' '#1086#1087#1088#1086#1089#1072', '#1043#1094
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 549
      Top = 69
      Width = 116
      Height = 16
      Caption = #1063#1080#1089#1083#1086' '#1082#1072#1085#1072#1083#1086#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label8: TLabel
      Left = 29
      Top = 59
      Width = 127
      Height = 16
      Caption = ' '#1086#1090#1089#1095#1077#1090#1086#1074'/'#1082#1072#1085#1072#1083':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label9: TLabel
      Left = 169
      Top = 13
      Width = 158
      Height = 16
      Caption = #1042#1088#1077#1084#1103' '#1085#1072#1073#1083#1102#1076#1077#1085#1080#1103', '#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dateEksp: TStaticText
      Left = 8
      Top = 31
      Width = 153
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object Freq: TStaticText
      Left = 339
      Top = 31
      Width = 134
      Height = 20
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object NChan: TStaticText
      Left = 548
      Top = 87
      Width = 113
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object NPoint: TStaticText
      Left = 11
      Top = 68
      Width = 56
      Height = 20
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
    object Duration: TStaticText
      Left = 172
      Top = 31
      Width = 148
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 4
    end
    object SaveBtn: TBitBtn
      Left = 491
      Top = 17
      Width = 86
      Height = 40
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1072#1088#1093#1080#1074
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = SaveBtnClick
      NumGlyphs = 2
    end
    object CheckBox1: TCheckBox
      Left = 588
      Top = 17
      Width = 49
      Height = 17
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1089#1077' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1077
      Caption = #1074#1089#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = CheckBox1Click
    end
    object OnlyFile_CB: TCheckBox
      Left = 588
      Top = 36
      Width = 117
      Height = 17
      Hint = #1058#1086#1083#1100#1082#1086' '#1074' '#1092#1072#1081#1083
      Caption = #1090#1086#1083#1100#1082#1086' '#1074' '#1092#1072#1081#1083
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 7
      OnClick = CheckBox1Click
    end
  end
  object GB: TPanel
    Left = 0
    Top = 361
    Width = 737
    Height = 19
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 2
    object LabelInfo: TLabel
      Left = 1
      Top = 2
      Width = 735
      Height = 16
      Align = alBottom
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
  end
  object MainMenu1: TMainMenu
    Left = 220
    Top = 80
    object N1: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = N1Click
    end
    object Contact1: TMenuItem
      Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '
      Visible = False
      OnClick = Contact1Click
    end
    object N2: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Visible = False
      object N3: TMenuItem
        Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
        OnClick = N3Click
      end
    end
    object cleaerlb: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      OnClick = Archiev_FormcleaerlbClick
    end
  end
  object OD: TOpenDialog
    Filter = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1089#1087#1099#1090#1072#1085#1080#1081' (*.lcr)|*.lcr|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Options = [ofReadOnly, ofHideReadOnly, ofShowHelp, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1059#1082#1072#1078#1080#1090#1077' '#1092#1072#1081#1083'('#1099') '#1089' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072#1084#1080' '#1080#1089#1087#1099#1090#1072#1085#1080#1081
    Left = 116
    Top = 116
  end
end
