inherited VRDeviceForm: TVRDeviceForm
  Left = 233
  Top = 157
  Width = 1160
  Height = 538
  Caption = 'VRDeviceForm'
  Menu = MainMenu1
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 449
    Top = 51
    Width = 4
    Height = 428
    Color = 15448129
    ParentColor = False
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 51
    Width = 449
    Height = 428
    Align = alLeft
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        DisplayFormat = 'dd.mm.yyyy hh:mm'
        EditButtons = <>
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
        Title.TitleButton = True
        Width = 165
      end
      item
        EditButtons = <>
        Footers = <>
        Title.Caption = #1054#1073#1098#1077#1082#1090' '#1080#1079#1084#1077#1088#1077#1085#1080#1103'|'#1090#1080#1087
        Width = 92
      end
      item
        EditButtons = <>
        Footers = <>
        Title.Caption = #1054#1073#1098#1077#1082#1090' '#1080#1079#1084#1077#1088#1077#1085#1080#1103'|'#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 125
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1144
    Height = 51
    Align = alTop
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 32
      Top = 8
      Width = 217
      Height = 22
      Caption = #1057#1080#1085#1093#1088#1086#1085#1080#1079#1072#1094#1080#1103' '#1089' '#1052#1056#1050#1057
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
    end
    object StaticText3: TStaticText
      Left = 1
      Top = 33
      Width = 1142
      Height = 17
      Align = alBottom
      Alignment = taCenter
      Caption = 
        #1074' '#1051#1077#1074#1086#1081' '#1095#1072#1089#1090#1080' - '#1089#1087#1080#1089#1086#1082' '#1080#1079#1084#1077#1088#1077#1085#1080#1081', '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1087#1088#1080#1073#1086#1088#1086#1084'. '#1059' '#1086#1076#1085#1086#1075#1086 +
        ' '#1087#1088#1080#1073#1086#1088#1072' '#1085#1077' '#1073#1086#1083#1077#1077' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1089#1086#1090#1077#1085' '#1080#1079#1084#1077#1088#1077#1085#1080#1081'                    ' +
        ' '#1074' '#1055#1088#1072#1074#1086#1081' '#1095#1072#1089#1090#1080' -  '#1086#1090#1086#1073#1088#1072#1078#1072#1077#1102#1090#1089#1103' '#1076#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1080#1079' ' +
        #1072#1088#1093#1080#1074#1072' '#1074' '#1083#1077#1074#1086#1081' '#1095#1072#1089#1090#1080' '#1092#1086#1088#1084#1099
      Color = 8454143
      ParentColor = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 453
    Top = 51
    Width = 691
    Height = 428
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 1
      Top = 233
      Width = 689
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Color = 15448129
      ParentColor = False
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 689
      Height = 64
      Align = alTop
      TabOrder = 0
      DesignSize = (
        689
        64)
      object Label1: TLabel
        Left = 9
        Top = 1
        Width = 123
        Height = 13
        Caption = #1076#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      end
      object DBText1: TDBText
        Left = 160
        Top = 1
        Width = 265
        Height = 13
        Color = 14417065
        ParentColor = False
      end
      object Label2: TLabel
        Left = 8
        Top = 17
        Width = 123
        Height = 13
        AutoSize = False
        Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
      end
      object DBText2: TDBText
        Left = 80
        Top = 17
        Width = 345
        Height = 13
        Color = 14417065
        ParentColor = False
      end
      object Label3: TLabel
        Left = 6
        Top = 36
        Width = 123
        Height = 13
        AutoSize = False
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1073#1098#1077#1082#1090#1072':'
      end
      object SpeedButton2: TSpeedButton
        Tag = 1
        Left = 593
        Top = 4
        Width = 80
        Height = 24
        Hint = #1053#1072#1087#1077#1095#1072#1090#1072#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083' '#1074' '#1092#1086#1088#1084#1072#1090#1077' Excel'
        Anchors = [akRight]
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
      end
      object DBEdit1: TDBEdit
        Left = 140
        Top = 35
        Width = 527
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 65
      Width = 689
      Height = 168
      Align = alTop
      Caption = #1054#1073#1098#1077#1082#1090' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      TabOrder = 1
      object StaticText1: TStaticText
        Left = 2
        Top = 15
        Width = 685
        Height = 17
        Align = alTop
        Caption = 
          #1058#1091#1090' '#1086#1090#1086#1073#1088#1072#1078#1072#1077#1090#1089#1103' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1086#1073#1098#1077#1082#1090#1072',  '#1088#1072#1079#1085#1099#1077' '#1072#1090#1088#1080#1073#1091#1090#1099' '#1074' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090 +
          #1080' '#1086#1090' '#1090#1080#1087#1072' '#1086#1073#1098#1077#1082#1090#1072
        Color = 8454143
        ParentColor = False
        TabOrder = 0
      end
      object DBGridEh2: TDBGridEh
        Left = 2
        Top = 32
        Width = 685
        Height = 134
        Align = alClient
        AutoFitColWidths = True
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = RUSSIAN_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 201
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #1079#1085#1072#1095#1077#1085#1080#1077
            Width = 279
          end>
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 237
      Width = 689
      Height = 190
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 2
      object Splitter3: TSplitter
        Left = 1
        Top = 109
        Width = 687
        Height = 4
        Cursor = crVSplit
        Align = alBottom
        Color = 15448129
        ParentColor = False
      end
      object GroupBox2: TGroupBox
        Left = 1
        Top = 1
        Width = 687
        Height = 108
        Align = alClient
        Caption = #1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
        TabOrder = 0
        object StaticText2: TStaticText
          Left = 2
          Top = 15
          Width = 683
          Height = 17
          Align = alTop
          Caption = 
            #1058#1091#1090' '#1086#1090#1086#1073#1088#1072#1078#1072#1077#1090#1089#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103'. '#1054#1076#1085#1086#1081' '#1089#1090#1088#1086#1082#1086#1081' '#1080#1083#1080' '#1085#1077#1089#1082#1086#1083#1100 +
            #1082#1080#1084#1080' '#1074' '#1089#1083#1091#1095#1072#1077' '#1089#1077#1088#1080#1080
          Color = 8454143
          ParentColor = False
          TabOrder = 0
        end
        object DBGridEh3: TDBGridEh
          Left = 2
          Top = 32
          Width = 683
          Height = 74
          Align = alClient
          AutoFitColWidths = True
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = RUSSIAN_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          UseMultiTitle = True
          Columns = <
            item
              EditButtons = <>
              Footers = <>
              Title.Caption = #1089#1082#1086#1088#1086#1089#1090#1100
              Width = 201
            end
            item
              EditButtons = <>
              Footers = <>
              Title.Caption = #1088#1072#1089#1093#1086#1076
              Width = 279
            end>
        end
      end
      object GroupBox3: TGroupBox
        Left = 1
        Top = 113
        Width = 687
        Height = 76
        Align = alBottom
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        TabOrder = 1
        object DBMemo1: TDBMemo
          Left = 2
          Top = 15
          Width = 683
          Height = 59
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 160
    Top = 208
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
    end
    object N2: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
    end
  end
end
