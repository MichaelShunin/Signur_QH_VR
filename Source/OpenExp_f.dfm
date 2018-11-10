inherited OpenExpForm: TOpenExpForm
  Left = 157
  Top = 227
  Width = 752
  Height = 447
  Action = MainForm.actImport
  Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1092#1072#1081#1083#1072
  PixelsPerInch = 120
  TextHeight = 16
  object Panel_uP: TPanel [0]
    Left = 0
    Top = 0
    Width = 744
    Height = 221
    Align = alTop
    TabOrder = 0
    object ChangeTime: TGroupBox
      Left = 84
      Top = 10
      Width = 499
      Height = 133
      Color = clScrollBar
      ParentColor = False
      TabOrder = 2
      Visible = False
      object Label4: TLabel
        Left = 17
        Top = 53
        Width = 37
        Height = 18
        Caption = #1044#1072#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Times New Roman Cyr'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 11
        Top = 94
        Width = 57
        Height = 18
        Caption = #1042#1088#1077#1084#1103' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Times New Roman Cyr'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 175
        Top = 53
        Width = 72
        Height = 18
        Caption = #1064#1072#1075' '#1087#1086' '#1061' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Times New Roman Cyr'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 2
        Top = 18
        Width = 495
        Height = 26
        Align = alTop
        AutoSize = False
        Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1096#1072#1075#1072' '#1087#1086' '#1061', '#1076#1072#1090#1099', '#1074#1088#1077#1084#1077#1085#1080' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -15
        Font.Name = 'Times New Roman Cyr'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object DateStartEdit: TDBEdit
        Left = 73
        Top = 48
        Width = 88
        Height = 25
        DataField = 'Date_Start'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object TimeStartEdit: TDBEdit
        Left = 73
        Top = 82
        Width = 88
        Height = 25
        DataField = 'Time_Start'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DeltXEdit: TDBEdit
        Left = 258
        Top = 48
        Width = 110
        Height = 25
        DataField = 'DeltX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object BitBtn1: TBitBtn
        Left = 246
        Top = 86
        Width = 193
        Height = 35
        TabOrder = 3
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 389
        Top = 47
        Width = 90
        Height = 35
        TabOrder = 4
        Kind = bkCancel
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 132
      Width = 742
      Height = 88
      Align = alBottom
      TabOrder = 3
      object SpeedButton1: TSpeedButton
        Left = 236
        Top = 4
        Width = 22
        Height = 22
        Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090' '#1076#1083#1103' '#1087#1072#1082#1077#1090#1085#1086#1081' '#1088#1072#1073#1086#1090#1099
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
      object DelButton: TSpeedButton
        Left = 278
        Top = 4
        Width = 27
        Height = 22
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090
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
        ParentShowHint = False
        ShowHint = True
      end
      object Label3: TLabel
        Left = 416
        Top = 28
        Width = 88
        Height = 17
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Times New Roman Cyr'
        Font.Style = []
        ParentFont = False
      end
      object Gauge1: TGauge
        Left = 525
        Top = 32
        Width = 137
        Height = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Progress = 0
        Visible = False
      end
      object Label1: TLabel
        Left = 216
        Top = 32
        Width = 39
        Height = 17
        Caption = #1058#1077#1084#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Times New Roman Cyr'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 212
        Top = 59
        Width = 44
        Height = 17
        Caption = #1040#1074#1090#1086#1088':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Times New Roman Cyr'
        Font.Style = []
        ParentFont = False
      end
      object DBNavigator1: TDBNavigator
        Left = 322
        Top = 4
        Width = 115
        Height = 24
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost]
        Hints.Strings = (
          #1055#1077#1088#1074#1099#1081' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090' '#1090#1077#1084#1099
          #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090' '#1090#1077#1084#1099
          #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090' '#1090#1077#1084#1099
          #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090' '#1090#1077#1084#1099
          #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103)
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object Button1: TButton
        Left = 458
        Top = 2
        Width = 200
        Height = 26
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1080' '#1087#1086#1082#1072#1079#1072#1090#1100' '#1086#1073#1088#1072#1079
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman Cyr'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBMemo1: TDBMemo
        Left = 418
        Top = 48
        Width = 247
        Height = 36
        DataField = 'Eksp_Memo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman Cyr'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 279
        Top = 59
        Width = 131
        Height = 25
        DataField = 'Eksp_Author'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman Cyr'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit1: TDBEdit
        Left = 279
        Top = 32
        Width = 131
        Height = 25
        DataField = 'Eksp_Theme'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman Cyr'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object ImportSignal: TBitBtn
        Left = 3
        Top = 4
        Width = 206
        Height = 34
        Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Times New Roman Cyr'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        NumGlyphs = 2
      end
    end
    object DBGrid2: TDBGrid
      Left = 209
      Top = 1
      Width = 534
      Height = 131
      Hint = #1069#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1099' '#1090#1077#1084#1099
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Times New Roman Cyr'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -13
      TitleFont.Name = 'Times New Roman Cyr'
      TitleFont.Style = [fsBold]
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 208
      Height = 131
      Align = alLeft
      FixedColor = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Times New Roman Cyr'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -12
      TitleFont.Name = 'Times New Roman Cyr'
      TitleFont.Style = [fsBold]
    end
  end
  inherited MainMenu: TMainMenu
    inherited N1: TMenuItem
      inherited miClose: TMenuItem
        ImageIndex = 0
      end
      object N2: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1092#1072#1081#1083#1072
      end
    end
  end
end
