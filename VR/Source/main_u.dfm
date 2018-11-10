object main: Tmain
  Left = 81
  Top = 11
  Width = 1280
  Height = 848
  Caption = #1057#1048#1043#1053#1059#1056' - '#1052#1050#1056#1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 609
    Top = 73
    Width = 4
    Height = 716
    Color = 15448129
    ParentColor = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 46
    Width = 1264
    Height = 27
    ButtonHeight = 23
    Caption = 'ToolBar1'
    HotImages = DM.ImageList1
    Images = DM.ImageList1
    TabOrder = 0
    Visible = False
    object ExitButton: TToolButton
      Left = 0
      Top = 2
      Hint = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
      Action = FileExit1
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton6: TToolButton
      Left = 23
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 31
      Top = 2
      Width = 1
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 32
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 43
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 40
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 48
      Top = 2
      Action = actCreateDevice
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object ToolButton4: TToolButton
      Left = 71
      Top = 2
      Action = actArchiev
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object ToolButton9: TToolButton
      Left = 94
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 41
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 102
      Top = 2
      Action = Action_UserGuide
    end
  end
  object PanelMsg: TPanel
    Left = 0
    Top = 0
    Width = 1264
    Height = 46
    Align = alTop
    TabOrder = 1
    OnClick = PanelMsgClick
    DesignSize = (
      1264
      46)
    object btnReadMKRC: TSpeedButton
      Left = 32
      Top = 6
      Width = 217
      Height = 22
      Caption = #1057#1095#1080#1090#1072#1090#1100' '#1072#1088#1093#1080#1074#1099
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
      OnClick = btnReadMKRCClick
    end
    object Gauge: TGauge
      Left = 1
      Top = 34
      Width = 1262
      Height = 11
      Align = alBottom
      Progress = 0
      Visible = False
    end
    object btnPrint: TSpeedButton
      Tag = 1
      Left = 1134
      Top = 4
      Width = 123
      Height = 24
      Hint = #1053#1072#1087#1077#1095#1072#1090#1072#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083' '
      Anchors = []
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnPrintClick
    end
    object Button1: TButton
      Left = 272
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 613
    Top = 73
    Width = 651
    Height = 716
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 1
      Top = 306
      Width = 649
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Color = 15448129
      ParentColor = False
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 649
      Height = 164
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label4: TLabel
        Left = 1
        Top = 49
        Width = 647
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1073#1098#1077#1082#1090#1072':'
      end
      object Label1: TLabel
        Left = 1
        Top = 93
        Width = 647
        Height = 16
        Align = alBottom
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
      end
      object DBMemo2: TDBMemo
        Left = 1
        Top = 109
        Width = 647
        Height = 54
        Align = alBottom
        BevelOuter = bvNone
        DataField = 'DESCR'
        DataSource = ds_q_meas
        MaxLength = 1023
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 647
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 161
          Height = 25
          Align = alLeft
          Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
        end
        object DBText1: TDBText
          Left = 173
          Top = 0
          Width = 60
          Height = 25
          Align = alLeft
          AutoSize = True
          Color = clBtnFace
          DataField = 'MEAS_DATE'
          DataSource = ds_q_meas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label5: TLabel
          Left = 245
          Top = 0
          Width = 44
          Height = 25
          Align = alLeft
          Caption = '  '#1042#1080#1085#1090'  '
        end
        object DBText3: TDBText
          Left = 301
          Top = 0
          Width = 105
          Height = 25
          Align = alLeft
          Color = clBtnFace
          DataField = 'DEVICE_NUMBER'
          DataSource = ds_q_meas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label9: TLabel
          Left = 161
          Top = 0
          Width = 12
          Height = 25
          Align = alLeft
          Caption = '    '
        end
        object Label10: TLabel
          Left = 233
          Top = 0
          Width = 12
          Height = 25
          Align = alLeft
          Caption = '    '
        end
        object Label11: TLabel
          Left = 289
          Top = 0
          Width = 12
          Height = 25
          Align = alLeft
          Caption = '    '
        end
      end
      object Panel8: TPanel
        Left = 1
        Top = 26
        Width = 647
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label3: TLabel
          Left = 0
          Top = 0
          Width = 83
          Height = 23
          Align = alLeft
          Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
        end
        object Label12: TLabel
          Left = 83
          Top = 0
          Width = 12
          Height = 23
          Align = alLeft
          Caption = '    '
        end
        object DBText2: TDBText
          Left = 95
          Top = 0
          Width = 60
          Height = 23
          Align = alLeft
          AutoSize = True
          Color = clBtnFace
          DataField = 'OBJECT_TYPE_NAME'
          DataSource = ds_q_meas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object Panel9: TPanel
        Left = 1
        Top = 67
        Width = 647
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel9'
        TabOrder = 3
        DesignSize = (
          647
          25)
        object DBEdit1: TDBEdit
          Left = 1
          Top = 4
          Width = 645
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          DataField = 'OBJECT_NAME'
          DataSource = ds_q_meas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object gbObject: TGroupBox
      Left = 1
      Top = 165
      Width = 649
      Height = 141
      Align = alTop
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1073#1098#1077#1082#1090#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object DBGridEh2: TDBGridEh
        Left = 2
        Top = 18
        Width = 645
        Height = 121
        Align = alClient
        AllowedOperations = []
        AllowedSelections = []
        DataSource = ds_object_info
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
        UseMultiTitle = True
        OnDblClick = DBGridEh2DblClick
        OnGetCellParams = DBGridEh2GetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ATT_NAME'
            Footers = <>
            Title.Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 303
          end
          item
            Alignment = taCenter
            DblClickNextVal = True
            DisplayFormat = '0.00'
            EditButtons = <>
            FieldName = 'ATT_VALUE'
            Footers = <>
            Title.Caption = #1079#1085#1072#1095#1077#1085#1080#1077
            Width = 134
          end>
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 310
      Width = 649
      Height = 405
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 2
      object gbResult: TGroupBox
        Left = 1
        Top = 1
        Width = 647
        Height = 403
        Align = alClient
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Grid_QV: TDBGridEh
          Left = 2
          Top = 80
          Width = 643
          Height = 321
          Align = alClient
          AllowedOperations = []
          AutoFitColWidths = True
          DataSource = ds_q_VQ
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
          UseMultiTitle = True
          OnDblClick = Grid_QVDblClick
          Columns = <
            item
              Alignment = taCenter
              DisplayFormat = '0.000'
              EditButtons = <>
              FieldName = 'V_VALUE'
              Footers = <>
              Title.Caption = #1089#1082#1086#1088#1086#1089#1090#1100'. '#1084'/c'
              Width = 182
            end
            item
              Alignment = taCenter
              EditButtons = <>
              FieldName = 'Q_VALUE'
              Footers = <>
              Title.Caption = #1088#1072#1089#1093#1086#1076', '#1082#1091#1073'/c'
              Width = 136
            end>
        end
        object Panel1: TPanel
          Left = 2
          Top = 18
          Width = 643
          Height = 62
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object pnlError: TPanel
            Left = 0
            Top = 0
            Width = 643
            Height = 19
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label6: TLabel
              Left = 0
              Top = 0
              Width = 119
              Height = 19
              Align = alLeft
              Alignment = taRightJustify
              Caption = #1055#1086#1075#1088#1077#1096#1085#1086#1089#1090#1100', %     '
            end
            object DBText4: TDBText
              Left = 131
              Top = 0
              Width = 512
              Height = 19
              Align = alClient
              AutoSize = True
              DataField = 'ERROR'
              DataSource = ds_q_meas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 119
              Top = 0
              Width = 12
              Height = 19
              Align = alLeft
              Caption = '    '
            end
          end
          object pnlSeria: TPanel
            Left = 0
            Top = 30
            Width = 643
            Height = 32
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Panel2: TPanel
              Left = 0
              Top = 16
              Width = 643
              Height = 16
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              object Label7: TLabel
                Left = 0
                Top = 0
                Width = 194
                Height = 16
                Align = alLeft
                Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1095#1077#1082' '#1074' '#1084#1072#1089#1089#1080#1074#1077'  '
              end
              object DBText5: TDBText
                Left = 206
                Top = 0
                Width = 144
                Height = 16
                Align = alLeft
                DataField = 'N_SERIA'
                DataSource = ds_q_meas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label15: TLabel
                Left = 194
                Top = 0
                Width = 12
                Height = 16
                Align = alLeft
                Caption = '    '
              end
            end
            object Panel6: TPanel
              Left = 0
              Top = -3
              Width = 643
              Height = 19
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object Label8: TLabel
                Left = 0
                Top = 0
                Width = 147
                Height = 19
                Align = alLeft
                Caption = #1042#1088#1077#1084#1103' '#1086#1089#1088#1077#1076#1085#1077#1085#1080#1103', '#1089'    '
              end
              object DBText6: TDBText
                Left = 159
                Top = 0
                Width = 144
                Height = 19
                Align = alLeft
                DataField = 'TIME_AVERAGE'
                DataSource = ds_q_meas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label14: TLabel
                Left = 147
                Top = 0
                Width = 12
                Height = 19
                Align = alLeft
                Caption = '    '
              end
            end
          end
        end
      end
    end
  end
  inline GridFrame: TDbGridFrame
    Left = 0
    Top = 73
    Width = 609
    Height = 716
    Align = alLeft
    AutoScroll = False
    TabOrder = 3
    inherited Grid: TDBGridEh
      Left = 180
      Width = 429
      Height = 716
      DataSource = ds_q_meas
      Font.Height = -15
      FooterFont.Height = -9
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = nil
      RowSizingAllowed = True
      TitleFont.Height = -15
      OnGetCellParams = GridFrameGridGetCellParams
      Columns = <
        item
          Alignment = taCenter
          DisplayFormat = 'dd.mm.yyyy hh:mm'
          EditButtons = <>
          FieldName = 'MEAS_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          Width = 117
        end
        item
          EditButtons = <>
          FieldName = 'DIG_AFTER_POINT'
          Footers = <>
          Title.Caption = #8470' '#1074' '#1072#1088#1093#1080#1074#1077
          Visible = False
          Width = 73
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'ARCH_TYPE'
          Footers = <>
          Title.Caption = #1074#1080#1076' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          Visible = False
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'OBJECT_TYPE_NAME'
          Footers = <>
          Title.Caption = #1054#1073#1098#1077#1082#1090' '#1080#1079#1084#1077#1088#1077#1085#1080#1103'|'#1090#1080#1087
          Width = 145
        end
        item
          EditButtons = <>
          FieldName = 'OBJECT_NAME'
          Footers = <>
          Title.Caption = #1054#1073#1098#1077#1082#1090' '#1080#1079#1084#1077#1088#1077#1085#1080#1103'|'#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 154
        end>
    end
    inherited ToolPanel: TPanel
      Width = 180
      Height = 716
      inherited Label2: TLabel
        Font.Height = -12
      end
      inherited Bevel: TBevel
        Left = 176
        Top = 21
        Height = 695
      end
      inherited Label4: TLabel
        Font.Height = -12
      end
      inherited FieldCombo: TDBComboBoxEh
        Width = 160
        DropDownBox.Rows = 9
        DropDownBox.Sizable = True
      end
      inherited ValueEdit: TDBEditEh
        Width = 131
      end
      inherited SearchCombo: TDBComboBoxEh
        Width = 160
      end
      inherited SimilarityTrack: TTrackBar
        Width = 168
      end
      inherited Panel1: TPanel
        Width = 180
        Height = 21
        Font.Height = -12
        inherited btnSearchClose: TSpeedButton
          Left = 161
        end
      end
      inherited SearchDirectionCompo: TDBComboBoxEh
        Width = 160
      end
      inherited ToolBar1: TToolBar
        Left = 144
      end
      inherited ValueEdit2: TDBEditEh
        Left = 80
      end
    end
    inherited PopupMenu: TPopupMenu
      Left = 466
      Top = 262
      object N22: TMenuItem [0]
        Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1073#1086#1088
        GroupIndex = 200
      end
      object N23: TMenuItem [1]
        Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1073#1086#1088
        GroupIndex = 200
      end
      object N21: TMenuItem [2]
        Caption = '-'
        GroupIndex = 200
      end
      object N12: TMenuItem [3]
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1088#1080#1073#1086#1088'-'#1082#1083#1086#1085' '
        GroupIndex = 200
      end
      object N11: TMenuItem [4]
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1088#1080#1073#1086#1088'-'#1080#1089#1090#1086#1095#1085#1080#1082' '#1076#1083#1103' '#1082#1083#1086#1085#1072
        GroupIndex = 200
      end
      object pmReplaceParent: TMenuItem [5]
        Caption = #1047#1072#1084#1077#1089#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1087#1088#1080#1073#1086#1088#1077'-"'#1088#1086#1076#1080#1090#1077#1083#1077'"'
        GroupIndex = 200
      end
      object N20: TMenuItem [6]
        Caption = '-'
        GroupIndex = 200
      end
      object pmDeleteDevice: TMenuItem [7]
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1087#1088#1080#1073#1086#1088#1077
        GroupIndex = 200
      end
      object MenuItem1: TMenuItem [8]
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
  object MainMenu1: TMainMenu
    Images = DM.ImageList1
    Left = 480
    Top = 168
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object SQL1: TMenuItem
        Caption = 'SQL-'#1084#1086#1085#1080#1090#1086#1088
        Visible = False
        OnClick = SQL1Click
      end
      object l1: TMenuItem
        Caption = #1056#1072#1079#1084#1077#1088' '#1096#1088#1080#1092#1090#1072
        Visible = False
        OnClick = l1Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object ExitItem: TMenuItem
        Action = FileExit1
        Caption = #1042#1099#1093#1086#1076
      end
    end
    object N2: TMenuItem
      Caption = #1055#1088#1080#1073#1086#1088#1099
      Visible = False
      object miCreateCalculation: TMenuItem
        Action = actCreateDevice
        SubMenuImages = DM.ImageList1
        Enabled = False
      end
      object OpenItem: TMenuItem
        Action = actArchiev
      end
    end
    object N5: TMenuItem
      Caption = '     '#1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090'     '
      Hint = #1055#1077#1095#1072#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
      OnClick = btnPrintClick
    end
    object N3: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N7: TMenuItem
        Action = Action_UserGuide
        Caption = #1056#1091#1082#1086#1074#1086#1076#1089#1090#1074#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      end
      object N4: TMenuItem
        Action = Action_About
        Caption = #1054' '#1089#1080#1089#1090#1077#1084#1077
      end
    end
  end
  object ActionList1: TActionList
    Images = DM.ImageList1
    Left = 60
    Top = 148
    object FileExit1: TFileExit
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit|Quits the application'
      ImageIndex = 44
    end
    object Action_UserGuide: TAction
      Caption = 'Action1'
      Hint = #1056#1091#1082#1086#1074#1086#1076#1089#1090#1074#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ImageIndex = 41
      OnExecute = Action_UserGuideExecute
    end
    object Action_About: TAction
      Caption = 'Action_About'
      OnExecute = Action_AboutExecute
    end
    object actCreateDevice: TAction
      Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1087#1088#1080#1073#1086#1088#1072
      Hint = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1088#1080#1073#1086#1088
      ImageIndex = 7
      OnExecute = actCreateDeviceExecute
    end
    object actArchiev: TAction
      Caption = #1040#1088#1093#1080#1074' '#1087#1088#1080#1073#1086#1088#1072
      Enabled = False
      ImageIndex = 47
      OnExecute = actArchievExecute
    end
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'geom'
    StorageManager = iniPS_Man
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'Panel3.<P>.Width'
      'Panel3.gbObject.DBGridEh2.<P>.Columns.<Item0>.Width'
      'Panel3.Panel5.<P>.Width'
      'Panel3.Panel5.gbResult.Grid_QV.<P>.Columns.<Item0>.Width')
    Left = 176
    Top = 176
  end
  object iniPS_Man: TIniPropStorageManEh
    IniFileName = 'VR_GEOM.ini'
    Left = 176
    Top = 232
  end
  object q_att: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    SQL.Strings = (
      'select * from attribute where object_Type = :object_Type '
      'order by ID ')
    Left = 328
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'object_Type'
        ParamType = ptUnknown
      end>
    object q_attID: TIntegerField
      FieldName = 'ID'
      Origin = '"ATTRIBUTE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_attOBJECT_TYPE: TSmallintField
      FieldName = 'OBJECT_TYPE'
      Origin = '"ATTRIBUTE"."OBJECT_TYPE"'
    end
    object q_attATT_NAME: TIBStringField
      FieldName = 'ATT_NAME'
      Origin = '"ATTRIBUTE"."ATT_NAME"'
      Size = 64
    end
    object q_attVALUE_DIM: TIBStringField
      FieldName = 'VALUE_DIM'
      Origin = '"ATTRIBUTE"."VALUE_DIM"'
      Size = 16
    end
    object q_attIS_V_Q: TSmallintField
      FieldName = 'IS_V_Q'
      Origin = '"ATTRIBUTE"."IS_V_Q"'
    end
  end
  object q_add_Meas: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    SQL.Strings = (
      
        'select ID from add_measurement  (:ARCH_TYPE, :DEVICE_NUMBER, :OB' +
        'JECT_TYPE, :MEAS_DATE, :ERROR, :DIM_VALUE, :DIG_AFTER_POINT, :ME' +
        'AS_NUMBER)')
    Left = 272
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ARCH_TYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEVICE_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBJECT_TYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MEAS_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ERROR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIM_VALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIG_AFTER_POINT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MEAS_NUMBER'
        ParamType = ptUnknown
      end>
    object q_add_MeasID: TIntegerField
      FieldName = 'ID'
      Origin = '"ADD_MEASUREMENT"."ID"'
    end
  end
  object q_add_seria_meas: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    SQL.Strings = (
      
        'select ID from add_seria_measurement  (:ARCH_TYPE, :DEVICE_NUMBE' +
        'R, :OBJECT_TYPE, :MEAS_DATE, :Time_average,'
      
        '        :n_seria,  :K_Q_To_V, :DIM_VALUE, :DIG_AFTER_POINT, :MEA' +
        'S_NUMBER)')
    Left = 272
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ARCH_TYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEVICE_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBJECT_TYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MEAS_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIME_AVERAGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'N_SERIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'K_Q_To_V'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIM_VALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIG_AFTER_POINT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MEAS_NUMBER'
        ParamType = ptUnknown
      end>
    object q_add_seria_measID: TIntegerField
      FieldName = 'ID'
      Origin = '"ADD_SERIA_MEASUREMENT"."ID"'
    end
  end
  object q_add_Object_meas: TIBSQL
    Database = DM.DB
    SQL.Strings = (
      
        'insert into object_meas (ID_ATT, ATT_VALUE, type_4_Array_Num, ID' +
        '_MEASUREMENT)'
      
        'values (:ID_ATT          , :ATT_VALUE, :type_4_Array_Num, :ID_ME' +
        'ASUREMENT)')
    Transaction = DM.tranDefault
    Left = 376
    Top = 200
  end
  object q_meas: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    AfterOpen = q_measAfterOpen
    BeforeClose = q_measBeforeClose
    SQL.Strings = (
      
        'select o.object_type_name, m.object_type,  m.id, m.id as id_meas' +
        ',  m.meas_date, m.device_number, m.error, m.arch_type,'
      'm.time_average, m.n_seria, m.k_q_to_v, m.object_name ,m.descr,'
      'm.meas_number, m.dig_after_point, m.dim_value'
      'from'
      
        '  measurement M join objects o on objects.object_type = m.object' +
        '_type'
      'order by m.meas_date desc')
    UpdateObject = Update_Meas
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_MEASUREMENT_ID'
    Left = 400
    Top = 432
    object q_measOBJECT_TYPE_NAME: TIBStringField
      FieldName = 'OBJECT_TYPE_NAME'
      Origin = '"OBJECTS"."OBJECT_TYPE_NAME"'
      Size = 32
    end
    object q_measOBJECT_TYPE: TSmallintField
      FieldName = 'OBJECT_TYPE'
      Origin = '"MEASUREMENT"."OBJECT_TYPE"'
    end
    object q_measID: TIntegerField
      FieldName = 'ID'
      Origin = '"MEASUREMENT"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_measID_MEAS: TIntegerField
      FieldName = 'ID_MEAS'
      Origin = '"MEASUREMENT"."ID"'
      Required = True
    end
    object q_measMEAS_DATE: TDateTimeField
      FieldName = 'MEAS_DATE'
      Origin = '"MEASUREMENT"."MEAS_DATE"'
    end
    object q_measDEVICE_NUMBER: TIntegerField
      FieldName = 'DEVICE_NUMBER'
      Origin = '"MEASUREMENT"."DEVICE_NUMBER"'
      OnGetText = q_measDEVICE_NUMBERGetText
    end
    object q_measERROR: TIntegerField
      FieldName = 'ERROR'
      Origin = '"MEASUREMENT"."ERROR"'
    end
    object q_measARCH_TYPE: TIBStringField
      FieldName = 'ARCH_TYPE'
      Origin = '"MEASUREMENT"."ARCH_TYPE"'
      Size = 4
    end
    object q_measTIME_AVERAGE: TIntegerField
      FieldName = 'TIME_AVERAGE'
      Origin = '"MEASUREMENT"."TIME_AVERAGE"'
    end
    object q_measN_SERIA: TIntegerField
      FieldName = 'N_SERIA'
      Origin = '"MEASUREMENT"."N_SERIA"'
    end
    object q_measK_Q_TO_V: TFloatField
      FieldName = 'K_Q_TO_V'
      Origin = '"MEASUREMENT"."K_Q_TO_V"'
    end
    object q_measOBJECT_NAME: TIBStringField
      FieldName = 'OBJECT_NAME'
      Origin = '"MEASUREMENT"."OBJECT_NAME"'
      Size = 64
    end
    object q_measDESCR: TIBStringField
      FieldName = 'DESCR'
      Origin = '"MEASUREMENT"."DESCR"'
      Size = 1024
    end
    object q_measMEAS_NUMBER: TIntegerField
      FieldName = 'MEAS_NUMBER'
      Origin = '"MEASUREMENT"."MEAS_NUMBER"'
    end
    object q_measDIG_AFTER_POINT: TSmallintField
      FieldName = 'DIG_AFTER_POINT'
      Origin = '"MEASUREMENT"."DIG_AFTER_POINT"'
    end
    object q_measDIM_VALUE: TSmallintField
      FieldName = 'DIM_VALUE'
      Origin = '"MEASUREMENT"."DIM_VALUE"'
    end
  end
  object Update_Meas: TIBUpdateSQL
    RefreshSQL.Strings = (
      
        'select o.object_type_name, m.object_type,  m.id,  m.meas_date, m' +
        '.device_number, m.error,'
      
        'm.time_average, m.n_seria, m.k_v_to_q, m.object_name ,m.descr, m' +
        '.arch_type'
      'from'
      
        '  measurement M join objects o on objects.object_type = m.object' +
        '_type'
      ''
      'where'
      '  ID = :ID')
    ModifySQL.Strings = (
      'update measurement'
      'set'
      '  DESCR = :DESCR, '
      '  OBJECT_NAME = :OBJECT_NAME'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into measurement'
      
        '  (DESCR, DEVICE_NUMBER, ERROR, ID, K_V_TO_Q, MEAS_DATE, N_SERIA' +
        ', OBJECT_NAME, '
      '   OBJECT_TYPE, OBJECT_TYPE_NAME, TIME_AVERAGE)'
      'values'
      
        '  (:DESCR, :DEVICE_NUMBER, :ERROR, :ID, :K_V_TO_Q, :MEAS_DATE, :' +
        'N_SERIA, '
      '   :OBJECT_NAME, :OBJECT_TYPE, :OBJECT_TYPE_NAME, :TIME_AVERAGE)')
    DeleteSQL.Strings = (
      'delete from measurement'
      'where'
      '  ID = :OLD_ID')
    Left = 144
    Top = 328
  end
  object ds_q_meas: TDataSource
    DataSet = q_meas
    OnDataChange = ds_q_measDataChange
    Left = 384
    Top = 488
  end
  object q_object_info: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    DataSource = ds_q_meas
    SQL.Strings = (
      'select * from Get_Object_info (:id_meas)')
    Left = 80
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_MEAS'
        ParamType = ptUnknown
        Size = 4
      end>
    object q_object_infoID: TIntegerField
      FieldName = 'ID'
      Origin = '"GET_OBJECT_INFO"."ID"'
    end
    object q_object_infoID_MEASUREMENT: TIntegerField
      FieldName = 'ID_MEASUREMENT'
      Origin = '"GET_OBJECT_INFO"."ID_MEASUREMENT"'
    end
    object q_object_infoID_ATT: TIntegerField
      FieldName = 'ID_ATT'
      Origin = '"GET_OBJECT_INFO"."ID_ATT"'
    end
    object q_object_infoTYPE_4_ARRAY_NUM: TSmallintField
      FieldName = 'TYPE_4_ARRAY_NUM'
      Origin = '"GET_OBJECT_INFO"."TYPE_4_ARRAY_NUM"'
    end
    object q_object_infoATT_VALUE: TFloatField
      FieldName = 'ATT_VALUE'
      Origin = '"GET_OBJECT_INFO"."ATT_VALUE"'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object q_object_infoATT_NAME: TIBStringField
      FieldName = 'ATT_NAME'
      Origin = '"GET_OBJECT_INFO"."ATT_NAME"'
      Size = 64
    end
    object q_object_infoVALUE_DIM: TIBStringField
      FieldName = 'VALUE_DIM'
      Origin = '"GET_OBJECT_INFO"."VALUE_DIM"'
      Size = 16
    end
    object q_object_infoIS_V_Q: TSmallintField
      FieldName = 'IS_V_Q'
      Origin = '"GET_OBJECT_INFO"."IS_V_Q"'
    end
  end
  object ds_object_info: TDataSource
    AutoEdit = False
    DataSet = q_object_info
    Left = 272
    Top = 360
  end
  object Q_ADD_v_q: TIBSQL
    Database = DM.DB
    SQL.Strings = (
      'INSERT INTO MEAS_SERIA (ID_MEASUREMENT, v_VALUE, Q_vALUE)'
      ' VALUES (:ID_MEASUREMENT, :v_VALUE, :Q_vALUE   )')
    Transaction = DM.tranDefault
    Left = 256
    Top = 432
  end
  object q_VQ: TIBQuery
    Database = DM.DB
    Transaction = DM.tranDefault
    DataSource = ds_q_meas
    SQL.Strings = (
      'select * from Meas_seria'
      'where'
      'id_measurement = :id_meas')
    Left = 152
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_MEAS'
        ParamType = ptUnknown
        Size = 4
      end>
    object q_VQID: TIntegerField
      FieldName = 'ID'
      Origin = '"MEAS_SERIA"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_VQID_MEASUREMENT: TIntegerField
      FieldName = 'ID_MEASUREMENT'
      Origin = '"MEAS_SERIA"."ID_MEASUREMENT"'
    end
    object q_VQV_VALUE: TFloatField
      FieldName = 'V_VALUE'
      Origin = '"MEAS_SERIA"."V_VALUE"'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object q_VQQ_VALUE: TFloatField
      FieldName = 'Q_VALUE'
      Origin = '"MEAS_SERIA"."Q_VALUE"'
      OnGetText = q_VQQ_VALUEGetText
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
  end
  object ds_q_VQ: TDataSource
    AutoEdit = False
    DataSet = q_VQ
    Left = 168
    Top = 464
  end
end
