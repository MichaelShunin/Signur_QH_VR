inherited CarHelpForm: TCarHelpForm
  Left = 83
  Top = 75
  Width = 863
  Height = 645
  Caption = #1057#1087#1088#1072#1074#1082#1072
  Font.Height = -13
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 855
    Height = 618
    ActivePage = CommonSheet
    Align = alClient
    TabOrder = 0
    object CommonSheet: TTabSheet
      Caption = #1054#1073#1097#1077#1077
      object Splitter1: TSplitter
        Left = 433
        Top = 0
        Height = 587
      end
      object ArrivalPanel: TPanel
        Left = 0
        Top = 0
        Width = 433
        Height = 587
        Align = alLeft
        TabOrder = 0
        object TrainLabel: TLabel
          Left = 18
          Top = 16
          Width = 35
          Height = 16
          Caption = #1055#1086#1077#1079#1076
        end
        object TrNumberLabel: TLabel
          Left = 29
          Top = 33
          Width = 42
          Height = 16
          Caption = #1053#1086#1084#1077#1088':'
        end
        object TrDateLabel: TLabel
          Left = 29
          Top = 49
          Width = 34
          Height = 16
          Caption = #1044#1072#1090#1072':'
        end
        object TrTimeLabel: TLabel
          Left = 29
          Top = 65
          Width = 41
          Height = 16
          Caption = #1042#1088#1077#1084#1103':'
        end
        object ATrNumberLabel: TLabel
          Left = 81
          Top = 34
          Width = 41
          Height = 16
          Caption = #1053#1086#1084#1077#1088'!'
        end
        object ATrDateLabel: TLabel
          Left = 81
          Top = 49
          Width = 33
          Height = 16
          Caption = #1044#1072#1090#1072'!'
        end
        object ATrTimeLabel: TLabel
          Left = 81
          Top = 66
          Width = 40
          Height = 16
          Caption = #1042#1088#1077#1084#1103'!'
        end
        object BillNumberLabel: TLabel
          Left = 18
          Top = 90
          Width = 87
          Height = 16
          Caption = #8470' '#1053#1072#1082#1083#1072#1076#1085#1086#1081':'
        end
        object BillPreparedLabel: TLabel
          Left = 18
          Top = 108
          Width = 57
          Height = 16
          Caption = #1054#1090#1075#1088#1091#1079#1082#1072':'
        end
        object ABillNumberLabel: TLabel
          Left = 113
          Top = 91
          Width = 86
          Height = 16
          Caption = #8470' '#1053#1072#1082#1083#1072#1076#1085#1086#1081'!'
        end
        object ABillPreparedLabel: TLabel
          Left = 80
          Top = 108
          Width = 56
          Height = 16
          Caption = #1054#1090#1075#1088#1091#1079#1082#1072'!'
        end
        object ProductLabel: TLabel
          Left = 18
          Top = 126
          Width = 31
          Height = 16
          Caption = #1043#1088#1091#1079':'
        end
        object AProductLabel: TLabel
          Left = 55
          Top = 126
          Width = 30
          Height = 16
          Caption = #1043#1088#1091#1079'!'
        end
        object StationLabel: TLabel
          Left = 18
          Top = 144
          Width = 54
          Height = 16
          Caption = #1057#1090#1072#1085#1094#1080#1103':'
        end
        object AStationLabel: TLabel
          Left = 79
          Top = 144
          Width = 53
          Height = 16
          Caption = #1057#1090#1072#1085#1094#1080#1103'!'
        end
        object OwnerLabel: TLabel
          Left = 18
          Top = 162
          Width = 74
          Height = 16
          Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100':'
        end
        object AOwnerLabel: TLabel
          Left = 100
          Top = 162
          Width = 73
          Height = 16
          Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100'!'
        end
        object SenderLabel: TLabel
          Left = 18
          Top = 178
          Width = 82
          Height = 16
          Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100':'
        end
        object ASenderLabel: TLabel
          Left = 108
          Top = 179
          Width = 82
          Height = 16
          Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100':'
        end
        object ManufactLabel: TLabel
          Left = 18
          Top = 193
          Width = 95
          Height = 16
          Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100':'
        end
        object AManufactLabel: TLabel
          Left = 122
          Top = 193
          Width = 94
          Height = 16
          Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100'!'
        end
        object ExtraBillLabel: TLabel
          Left = 18
          Top = 296
          Width = 97
          Height = 16
          Caption = #8470' '#1044#1086#1089#1099#1083#1086#1095#1085#1086#1081':'
        end
        object AExtraBillLabel: TLabel
          Left = 121
          Top = 297
          Width = 96
          Height = 16
          Caption = #8470' '#1044#1086#1089#1099#1083#1086#1095#1085#1086#1081'!'
        end
        object ReplacedLabel: TLabel
          Left = 18
          Top = 313
          Width = 70
          Height = 16
          Caption = #1042#1079#1072#1084#1077#1085' '#1074'/'#1094':'
        end
        object AReplacedLabel: TLabel
          Left = 95
          Top = 314
          Width = 69
          Height = 16
          Caption = #1042#1079#1072#1084#1077#1085' '#1074'/'#1094'!'
        end
        object TypeLabel: TLabel
          Left = 18
          Top = 329
          Width = 27
          Height = 16
          Caption = #1058#1080#1087':'
        end
        object ATypeLabel: TLabel
          Left = 52
          Top = 329
          Width = 26
          Height = 16
          Caption = #1058#1080#1087'!'
        end
        object OBruttoLabel: TLabel
          Left = 18
          Top = 346
          Width = 129
          Height = 16
          Caption = #1041#1088#1091#1090#1090#1086' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
        end
        object AOBruttoLabel: TLabel
          Left = 155
          Top = 347
          Width = 128
          Height = 16
          Caption = #1041#1088#1091#1090#1090#1086' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081'!'
        end
        object ONettoLabel: TLabel
          Left = 18
          Top = 362
          Width = 123
          Height = 16
          Caption = #1053#1077#1090#1090#1086' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
        end
        object AONettoLabel: TLabel
          Left = 149
          Top = 362
          Width = 122
          Height = 16
          Caption = #1053#1077#1090#1090#1086' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081'!'
        end
        object QPOLabel: TLabel
          Left = 18
          Top = 379
          Width = 117
          Height = 16
          Caption = #1055#1072#1089#1087#1086#1088#1090' '#1079#1072#1074#1086#1076#1089#1082#1086#1081':'
        end
        object AQPOLabel: TLabel
          Left = 143
          Top = 380
          Width = 116
          Height = 16
          Caption = #1055#1072#1089#1087#1086#1088#1090' '#1079#1072#1074#1086#1076#1089#1082#1086#1081'!'
        end
        object GTDLabel: TLabel
          Left = 18
          Top = 422
          Width = 29
          Height = 16
          Caption = #1043#1058#1044':'
        end
        object AGTDLabel: TLabel
          Left = 54
          Top = 422
          Width = 28
          Height = 16
          Caption = #1043#1058#1044'!'
        end
        object CNLabel: TLabel
          Left = 18
          Top = 405
          Width = 84
          Height = 16
          Caption = #1058#1072#1084#1086#1078'. '#1091#1074#1077#1076'.:'
        end
        object ACNLabel: TLabel
          Left = 110
          Top = 405
          Width = 83
          Height = 16
          Caption = #1058#1072#1084#1086#1078'. '#1091#1074#1077#1076'.!'
        end
        object ZPULabel: TLabel
          Left = 18
          Top = 439
          Width = 27
          Height = 16
          Caption = #1047#1055#1059':'
        end
        object AZPULabel: TLabel
          Left = 51
          Top = 439
          Width = 26
          Height = 16
          Caption = #1047#1055#1059'!'
        end
        object OwnershipLabel: TLabel
          Left = 18
          Top = 454
          Width = 48
          Height = 16
          Caption = #1040#1088#1077#1085#1076#1072':'
        end
        object AOwnershipLabel: TLabel
          Left = 73
          Top = 454
          Width = 47
          Height = 16
          Caption = #1040#1088#1077#1085#1076#1072'!'
        end
        object BillTrainLabel: TLabel
          Left = 18
          Top = 217
          Width = 106
          Height = 16
          Caption = #1055#1086#1077#1079#1076' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
        end
        object BillTrainNumberLabel: TLabel
          Left = 34
          Top = 235
          Width = 42
          Height = 16
          Caption = #1053#1086#1084#1077#1088':'
        end
        object ABillTrainNumberLabel: TLabel
          Left = 83
          Top = 235
          Width = 41
          Height = 16
          Caption = #1053#1086#1084#1077#1088'!'
        end
        object BillTrainDateLabel: TLabel
          Left = 34
          Top = 250
          Width = 34
          Height = 16
          Caption = #1044#1072#1090#1072':'
        end
        object ABillTrainDateLabel: TLabel
          Left = 82
          Top = 250
          Width = 33
          Height = 16
          Caption = #1044#1072#1090#1072'!'
        end
        object BillTrainTimeLabel: TLabel
          Left = 34
          Top = 265
          Width = 41
          Height = 16
          Caption = #1042#1088#1077#1084#1103':'
        end
        object ABillTrainTimeLabel: TLabel
          Left = 80
          Top = 266
          Width = 40
          Height = 16
          Caption = #1042#1088#1077#1084#1103'!'
        end
        object NotArrivedLabel: TLabel
          Left = 64
          Top = 14
          Width = 168
          Height = 24
          Caption = #1053#1045#1055#1056#1048#1041#1067#1042#1064#1040#1071
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object PlacPanel: TPanel
        Left = 436
        Top = 0
        Width = 411
        Height = 587
        Align = alClient
        TabOrder = 1
        object PlStateLabel: TLabel
          Left = 18
          Top = 16
          Width = 102
          Height = 16
          Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1089#1083#1080#1074#1072':'
        end
        object APlStateLabel: TLabel
          Left = 127
          Top = 16
          Width = 101
          Height = 16
          Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1089#1083#1080#1074#1072'!'
        end
        object PLabel: TLabel
          Left = 18
          Top = 62
          Width = 43
          Height = 16
          Caption = #1055#1086#1076#1072#1095#1072
        end
        object PDateLabel: TLabel
          Left = 32
          Top = 77
          Width = 34
          Height = 16
          Caption = #1044#1072#1090#1072':'
        end
        object APDateLabel: TLabel
          Left = 80
          Top = 77
          Width = 33
          Height = 16
          Caption = #1044#1072#1090#1072'!'
        end
        object PTimeLabel: TLabel
          Left = 31
          Top = 93
          Width = 41
          Height = 16
          Caption = #1042#1088#1077#1084#1103':'
        end
        object APTimeLabel: TLabel
          Left = 79
          Top = 93
          Width = 40
          Height = 16
          Caption = #1042#1088#1077#1084#1103'!'
        end
        object ELabel: TLabel
          Left = 18
          Top = 115
          Width = 73
          Height = 16
          Caption = #1050#1086#1085#1077#1094' '#1089#1083#1080#1074#1072
        end
        object EDateLabel: TLabel
          Left = 31
          Top = 131
          Width = 34
          Height = 16
          Caption = #1044#1072#1090#1072':'
        end
        object AEDateLabel: TLabel
          Left = 79
          Top = 131
          Width = 33
          Height = 16
          Caption = #1044#1072#1090#1072'!'
        end
        object ETimeLabel: TLabel
          Left = 30
          Top = 148
          Width = 41
          Height = 16
          Caption = #1042#1088#1077#1084#1103':'
        end
        object AETimeLabel: TLabel
          Left = 79
          Top = 149
          Width = 40
          Height = 16
          Caption = #1042#1088#1077#1084#1103'!'
        end
        object CLabel: TLabel
          Left = 18
          Top = 169
          Width = 46
          Height = 16
          Caption = #1059#1073#1086#1088#1082#1072':'
        end
        object CDateLabel: TLabel
          Left = 31
          Top = 185
          Width = 34
          Height = 16
          Caption = #1044#1072#1090#1072':'
        end
        object ACDateLabel: TLabel
          Left = 78
          Top = 186
          Width = 33
          Height = 16
          Caption = #1044#1072#1090#1072'!'
        end
        object CTimeLabel: TLabel
          Left = 30
          Top = 201
          Width = 41
          Height = 16
          Caption = #1042#1088#1077#1084#1103':'
        end
        object ACTimeLabel: TLabel
          Left = 78
          Top = 202
          Width = 40
          Height = 16
          Caption = #1042#1088#1077#1084#1103'!'
        end
        object UploadLabel: TLabel
          Left = 18
          Top = 223
          Width = 39
          Height = 16
          Caption = #1042#1079#1083#1080#1074':'
        end
        object AUploadLabel: TLabel
          Left = 65
          Top = 223
          Width = 38
          Height = 16
          Caption = #1042#1079#1083#1080#1074'!'
        end
        object BBruttoLabel: TLabel
          Left = 18
          Top = 265
          Width = 125
          Height = 16
          Caption = #1041#1088#1091#1090#1090#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081':'
        end
        object ABBruttoLabel: TLabel
          Left = 151
          Top = 264
          Width = 124
          Height = 16
          Caption = #1041#1088#1091#1090#1090#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081'!'
        end
        object BNettoLabel: TLabel
          Left = 18
          Top = 282
          Width = 119
          Height = 16
          Caption = #1053#1077#1090#1090#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081':'
        end
        object ABNettoLabel: TLabel
          Left = 146
          Top = 282
          Width = 118
          Height = 16
          Caption = #1053#1077#1090#1090#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081'!'
        end
        object VolumeLabel: TLabel
          Left = 18
          Top = 239
          Width = 43
          Height = 16
          Caption = #1054#1073#1100#1077#1084':'
        end
        object AVolumeLabel: TLabel
          Left = 69
          Top = 239
          Width = 42
          Height = 16
          Caption = #1054#1073#1100#1077#1084'!'
        end
        object DBruttoLabel: TLabel
          Left = 18
          Top = 299
          Width = 105
          Height = 16
          Caption = #1044#1077#1073#1072#1083#1072#1085#1089' '#1073#1088#1091#1090#1090#1086':'
        end
        object ADBruttoLabel: TLabel
          Left = 129
          Top = 299
          Width = 104
          Height = 16
          Caption = #1044#1077#1073#1072#1083#1072#1085#1089' '#1073#1088#1091#1090#1090#1086'!'
        end
        object DNettoLabel: TLabel
          Left = 18
          Top = 316
          Width = 99
          Height = 16
          Caption = #1044#1077#1073#1072#1083#1072#1085#1089' '#1085#1077#1090#1090#1086':'
        end
        object ADNettoLabel: TLabel
          Left = 124
          Top = 316
          Width = 98
          Height = 16
          Caption = #1044#1077#1073#1072#1083#1072#1085#1089' '#1085#1077#1090#1090#1086'!'
        end
        object QPBLabel: TLabel
          Left = 18
          Top = 340
          Width = 133
          Height = 16
          Caption = #1055#1072#1089#1087#1086#1088#1090' '#1083#1072#1073#1086#1088#1072#1090#1086#1088#1080#1080':'
        end
        object AQPBLabel: TLabel
          Left = 158
          Top = 340
          Width = 132
          Height = 16
          Caption = #1055#1072#1089#1087#1086#1088#1090' '#1083#1072#1073#1086#1088#1072#1090#1086#1088#1080#1080'!'
        end
        object TemperLabel: TLabel
          Left = 18
          Top = 356
          Width = 132
          Height = 16
          Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1086#1079#1076#1091#1093#1072':'
        end
        object ATemperLabel: TLabel
          Left = 157
          Top = 356
          Width = 131
          Height = 16
          Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1086#1079#1076#1091#1093#1072'!'
        end
        object LineLabel: TLabel
          Left = 18
          Top = 39
          Width = 32
          Height = 16
          Caption = #1055#1091#1090#1100':'
        end
        object ALineLabel: TLabel
          Left = 57
          Top = 39
          Width = 31
          Height = 16
          Caption = #1055#1091#1090#1100'!'
        end
        object StatNumberLabel: TLabel
          Left = 18
          Top = 381
          Width = 51
          Height = 16
          Caption = #8470' '#1040#1082#1090#1072':'
        end
        object AStatNumberLabel: TLabel
          Left = 73
          Top = 381
          Width = 50
          Height = 16
          Caption = #8470' '#1040#1082#1090#1072'!'
        end
        object RegNumberLabel: TLabel
          Left = 18
          Top = 397
          Width = 71
          Height = 16
          Caption = #8470' '#1056#1077#1077#1089#1090#1088#1072':'
        end
        object ARegNumberLabel: TLabel
          Left = 95
          Top = 397
          Width = 70
          Height = 16
          Caption = #8470' '#1056#1077#1077#1089#1090#1088#1072'!'
        end
      end
    end
    object QpSheet: TTabSheet
      Caption = #1055#1072#1089#1087#1086#1088#1090#1072
      ImageIndex = 1
      inline QpFrame: TQpbHelpFrame
        Left = 0
        Top = 0
        Width = 847
        Height = 587
        Align = alClient
        TabOrder = 0
        inherited Splitter1: TSplitter
          Height = 587
        end
        inherited QpbPanel: TPanel
          Height = 587
          inherited QpbHeaderPanel: TPanel
            inherited QpbLabel: TLabel
              Left = 82
              Width = 100
              Height = 16
            end
            inherited QpbNLabel: TLabel
              Width = 21
              Height = 16
            end
          end
          inherited QpbGrid: TDBGridEh
            Height = 526
            FooterFont.Charset = RUSSIAN_CHARSET
            FooterFont.Height = -13
            FooterFont.Name = 'Tahoma'
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
          end
        end
        inherited QpoPanel: TPanel
          Width = 371
          Height = 587
          inherited QpoHeaderPanel: TPanel
            Width = 369
            inherited QpoLabel: TLabel
              Width = 131
              Height = 16
            end
            inherited QpoNLabel: TLabel
              Width = 21
              Height = 16
            end
          end
          inherited QpoGrid: TDBGridEh
            Width = 369
            Height = 526
            FooterFont.Charset = RUSSIAN_CHARSET
            FooterFont.Height = -13
            FooterFont.Name = 'Tahoma'
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
          end
        end
      end
    end
    object EmSheet: TTabSheet
      Caption = #1055#1086#1088#1086#1078#1085#1103#1082
      ImageIndex = 2
      object Splitter2: TSplitter
        Left = 395
        Top = 0
        Height = 587
      end
      object BPanel: TPanel
        Left = 0
        Top = 0
        Width = 395
        Height = 587
        Align = alLeft
        TabOrder = 0
        object EBStationLabel: TLabel
          Left = 18
          Top = 74
          Width = 127
          Height = 16
          Caption = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103':'
        end
        object AEBStationLabel: TLabel
          Left = 150
          Top = 74
          Width = 126
          Height = 16
          Caption = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103'!'
        end
        object EBRecipLabel: TLabel
          Left = 17
          Top = 92
          Width = 143
          Height = 16
          Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' '#1087#1086#1088#1086#1078#1085#1103#1082#1072':'
        end
        object AEBRecipLabel: TLabel
          Left = 165
          Top = 92
          Width = 142
          Height = 16
          Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' '#1087#1086#1088#1086#1078#1085#1103#1082#1072'!'
        end
        object BNoLabel: TLabel
          Left = 26
          Top = 69
          Width = 39
          Height = 24
          Caption = #1053#1045#1058
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BNamePanel: TPanel
          Left = 1
          Top = 1
          Width = 393
          Height = 52
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = '  '#1053#1072#1082#1083#1072#1076#1085#1072#1103
          Color = clSkyBlue
          TabOrder = 0
          object BToolBar: TToolBar
            Left = 370
            Top = 0
            Width = 23
            Height = 52
            Align = alRight
            AutoSize = True
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Images = ImageList
            TabOrder = 0
            Transparent = True
            object BOpenBtn: TToolButton
              Left = 0
              Top = 0
              Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
              ImageIndex = 0
              ParentShowHint = False
              ShowHint = True
              OnClick = BOpenBtnClick
            end
          end
        end
      end
      object TPanel: TPanel
        Left = 398
        Top = 0
        Width = 449
        Height = 587
        Align = alClient
        TabOrder = 1
        object TFirmLabel: TLabel
          Left = 18
          Top = 74
          Width = 128
          Height = 16
          Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100' '#1090#1077#1083'-'#1084#1099':'
        end
        object ATFirmLabel: TLabel
          Left = 151
          Top = 74
          Width = 127
          Height = 16
          Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100' '#1090#1077#1083'-'#1084#1099'!'
        end
        object TDateLabel: TLabel
          Left = 18
          Top = 92
          Width = 34
          Height = 16
          Caption = #1044#1072#1090#1072':'
        end
        object ATDateLabel: TLabel
          Left = 57
          Top = 92
          Width = 33
          Height = 16
          Caption = #1044#1072#1090#1072'!'
        end
        object TNumberLabel: TLabel
          Left = 18
          Top = 111
          Width = 42
          Height = 16
          Caption = #1053#1086#1084#1077#1088':'
        end
        object ATNumberLabel: TLabel
          Left = 65
          Top = 111
          Width = 41
          Height = 16
          Caption = #1053#1086#1084#1077#1088'!'
        end
        object TNoLabel: TLabel
          Left = 26
          Top = 69
          Width = 39
          Height = 24
          Caption = #1053#1045#1058
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object TNamePanel: TPanel
          Left = 1
          Top = 1
          Width = 447
          Height = 52
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = '  '#1058#1077#1083#1077#1075#1088#1072#1084#1084#1072
          Color = clSkyBlue
          TabOrder = 0
          object TToolBar: TToolBar
            Left = 424
            Top = 0
            Width = 23
            Height = 52
            Align = alRight
            AutoSize = True
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Images = ImageList
            TabOrder = 0
            Transparent = True
            object TOpenBtn: TToolButton
              Left = 0
              Top = 0
              Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1077#1083#1077#1075#1088#1072#1084#1084#1091
              ImageIndex = 0
              ParentShowHint = False
              ShowHint = True
              OnClick = TOpenBtnClick
            end
          end
        end
      end
    end
  end
  object ArrivalQuery: TIBQuery
    Database = CommonData.Database
    Transaction = CommonData.ReadTransaction
    BufferChunks = 100
    SQL.Strings = (
      'select C.CAR_ID, C.NUMBER, T.NUMBER as TRAIN_NUMBER,'
      '      cast (T.ARRIVAL as date) as ARRIVAL_DATE,'
      '      cast(T.ARRIVAL as time) as ARRIVAL_TIME,'
      '      RC.REPLACED_NUMBER , BF.MAIN_BILL_ID,'
      '      MB.NUMBER as BILL_NUMBER, MB.PREPARED,'
      '      EB.NUMBER as EXTRA_BILL_NUMBER, '
      '      CT.NAME as CTYPE_NAME, '
      '      Q.NUMBER as QPO_NUMBER,'
      '      CU.GTD, C.WEIGHT_OB, C.WEIGHT_ON,'
      '      C.ZPU, C.OWNERSHIP, C.CN_NUMBER,'
      '      P.DESCR as PRODUCT_NAME, S.NAME as STATION_NAME,'
      '      CO.SHORT_NAME as OWNER_NAME, CS.SHORT_NAME as SENDER_NAME,'
      '      CM.SHORT_NAME as MANUFACT_NAME,'
      '      TB.NUMBER as BILL_TRAIN_NUMBER,'
      '      cast(TB.ARRIVAL as date) as BILL_TRAIN_DATE,'
      '      cast(TB.ARRIVAL as time) as BILL_TRAIN_TIME'
      '  from IN_CARS C'
      '  left join IN_TRAINS T on (T.TRAIN_ID = C.TRAIN_ID)'
      '  left join REPLACED_INFO(C.CAR_ID) RC on 1=1'
      '  left join MAINBILL_INFO(C.CAR_ID) BF on 1=1'
      '  left join WAYBILLS MB on (MB.BILL_ID = BF.MAIN_BILL_ID)'
      '  left join WAYBILLS EB on (EB.BILL_ID = BF.RESENT_BILL_ID)'
      '  left join CAR_TYPES CT on (CT.CTYPE_ID = C.CTYPE_ID)'
      '  left join QP_OWNER Q on (Q.ID = C.QPO_ID)'
      '  left join CUSTOMS CU on (CU.CUSTOMS_ID = C.CUSTOMS_ID)'
      '  left join LROUTES L on (L.LROUTE_ID = BF.LROUTE_ID)'
      '  left join PRODUCTS P on (P.ID = L.PRODUCT_ID)'
      '  left join STATIONS S on (S.STATION_ID = L.STATION_ID)'
      '  left join COMPANIES CO on (CO.COMPANY_ID = L.OWNER_ID)'
      '  left join COMPANIES CS on (CS.COMPANY_ID = L.SENDER_ID)'
      '  left join COMPANIES CM on (CM.COMPANY_ID = L.MANUFACT_ID)'
      '  left join IN_TRAINS TB on (TB.TRAIN_ID = MB.TRAIN_ID)'
      '  where (C.CAR_ID=:CAR_ID)'
      '')
    Left = 284
    Top = 1
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CAR_ID'
        ParamType = ptUnknown
      end>
    object ArrivalQueryCAR_ID: TIntegerField
      FieldName = 'CAR_ID'
      Origin = '"IN_CARS"."CAR_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ArrivalQueryNUMBER: TIntegerField
      FieldName = 'NUMBER'
      Origin = '"IN_CARS"."NUMBER"'
    end
    object ArrivalQueryARRIVAL_DATE: TDateField
      FieldName = 'ARRIVAL_DATE'
      ProviderFlags = []
    end
    object ArrivalQueryARRIVAL_TIME: TTimeField
      FieldName = 'ARRIVAL_TIME'
      ProviderFlags = []
    end
    object ArrivalQueryREPLACED_NUMBER: TIntegerField
      FieldName = 'REPLACED_NUMBER'
      Origin = '"REPLACED_INFO"."REPLACED_NUMBER"'
    end
    object ArrivalQueryMAIN_BILL_ID: TIntegerField
      FieldName = 'MAIN_BILL_ID'
      Origin = '"CAR_INFO"."MAIN_BILL_ID"'
    end
    object ArrivalQueryEXTRA_BILL_NUMBER: TIBStringField
      FieldName = 'EXTRA_BILL_NUMBER'
      Origin = '"WAYBILLS"."NUMBER"'
      Size = 128
    end
    object ArrivalQueryTRAIN_NUMBER: TSmallintField
      FieldName = 'TRAIN_NUMBER'
      Origin = '"IN_TRAINS"."NUMBER"'
    end
    object ArrivalQueryCTYPE_NAME: TIBStringField
      FieldName = 'CTYPE_NAME'
      Origin = '"CAR_TYPES"."NAME"'
      Size = 32
    end
    object ArrivalQueryQPO_NUMBER: TSmallintField
      FieldName = 'QPO_NUMBER'
      Origin = '"QP_OWNER"."NUMBER"'
    end
    object ArrivalQueryGTD: TIBStringField
      FieldName = 'GTD'
      Origin = '"CUSTOMS"."GTD"'
      Size = 128
    end
    object ArrivalQueryWEIGHT_OB: TIntegerField
      FieldName = 'WEIGHT_OB'
      Origin = '"IN_CARS"."WEIGHT_OB"'
    end
    object ArrivalQueryWEIGHT_ON: TIntegerField
      FieldName = 'WEIGHT_ON'
      Origin = '"IN_CARS"."WEIGHT_ON"'
    end
    object ArrivalQueryZPU: TIBStringField
      FieldName = 'ZPU'
      Origin = '"IN_CARS"."ZPU"'
      Size = 16
    end
    object ArrivalQueryOWNERSHIP: TSmallintField
      FieldName = 'OWNERSHIP'
      Origin = '"IN_CARS"."OWNERSHIP"'
    end
    object ArrivalQueryCN_NUMBER: TSmallintField
      FieldName = 'CN_NUMBER'
      Origin = '"IN_CARS"."CN_NUMBER"'
    end
    object ArrivalQueryBILL_NUMBER: TIBStringField
      FieldName = 'BILL_NUMBER'
      Origin = '"WAYBILLS"."NUMBER"'
      Size = 128
    end
    object ArrivalQueryPRODUCT_NAME: TIBStringField
      FieldName = 'PRODUCT_NAME'
      Origin = '"PRODUCTS"."DESCR"'
      Size = 1024
    end
    object ArrivalQuerySTATION_NAME: TIBStringField
      FieldName = 'STATION_NAME'
      Origin = '"STATIONS"."NAME"'
      Size = 256
    end
    object ArrivalQueryPREPARED: TDateField
      FieldName = 'PREPARED'
      Origin = '"WAYBILLS"."PREPARED"'
    end
    object ArrivalQueryBILL_TRAIN_NUMBER: TSmallintField
      FieldName = 'BILL_TRAIN_NUMBER'
      Origin = '"IN_TRAINS"."NUMBER"'
    end
    object ArrivalQueryBILL_TRAIN_DATE: TDateField
      FieldName = 'BILL_TRAIN_DATE'
      ProviderFlags = []
    end
    object ArrivalQueryBILL_TRAIN_TIME: TTimeField
      FieldName = 'BILL_TRAIN_TIME'
      ProviderFlags = []
    end
    object ArrivalQueryOWNER_NAME: TIBStringField
      FieldName = 'OWNER_NAME'
      Origin = '"COMPANIES"."SHORT_NAME"'
      Size = 256
    end
    object ArrivalQuerySENDER_NAME: TIBStringField
      FieldName = 'SENDER_NAME'
      Origin = '"COMPANIES"."SHORT_NAME"'
      Size = 256
    end
    object ArrivalQueryMANUFACT_NAME: TIBStringField
      FieldName = 'MANUFACT_NAME'
      Origin = '"COMPANIES"."SHORT_NAME"'
      Size = 256
    end
  end
  object ArrivalSource: TDataSource
    DataSet = ArrivalQuery
    Left = 358
    Top = 6
  end
  object PlacQuery: TIBQuery
    Database = CommonData.Database
    Transaction = CommonData.ReadTransaction
    BufferChunks = 100
    SQL.Strings = (
      'select P.LINE,'
      '             cast(P.DT_P as date) as DT_P_DATE,'
      '             cast(P.DT_P as time) as DT_P_TIME,'
      '             cast(P.DT_C as date) as DT_C_DATE,'
      '             cast(P.DT_C as time) as DT_C_TIME,'
      '             cast(N.DT_E as date) as DT_E_DATE,'
      '             cast(N.DT_E as time) as DT_E_TIME,'
      '             N.TEMPER,'
      '             PL.DESCR as PL_STATE_NAME,'
      '             C.UPLOAD_B, C.VOLUME_B, '
      '             C.WEIGHT_BB, C.WEIGHT_BN,'
      '             (C.WEIGHT_BB - C.WEIGHT_OB) as DEB_BRUTTO,'
      '             (C.WEIGHT_BN - C.WEIGHT_ON) as DEB_NETTO,'
      '             Q.NUMBER as QPB_NUMBER,'
      '             ST.NUMBER, ST.REG_NUMBER,'
      '             BS.NAME as EB_STATION_NAME,'
      '             BR.SHORT_NAME as EB_RECIPIENT_NAME,'
      '             C.EMBILL_ID, ET.TEL_DATE, ET.NUMBER as TEL_NUMBER,'
      '             C.TEL_ID, TS.SHORT_NAME as TEL_FIRM_NAME '
      '  from IN_CARS C '
      '  left join NOTIFICATIONS N on (N.NOTIF_ID = C.NOTIF_ID)'
      '  left join PLACEMENTS P on (P.PLAC_ID = N.PLAC_ID)'
      '  left join PL_STATES PL on (PL.REASON_ID = C.PL_STATE)'
      '  left join QP_BASE Q on (Q.ID = C.QPB_ID)'
      '  left join STATEMENTS ST on (ST.STAT_ID = C.NORMAL_STAT_ID)'
      '  left join EM_BILLS EB on (EB.BILL_ID = C.EMBILL_ID)'
      '  left join STATIONS BS on (BS.STATION_ID = EB.STATION_ID)'
      '  left join EM_COMPANIES BR on (BR.COMP_ID = EB.RECIPIENT_ID)'
      '  left join EM_TELEGRAMS ET on (ET.TEL_ID = C.TEL_ID)'
      '  left join EM_COMPANIES TS on (TS.COMP_ID = ET.FIRM_ID)'
      '  where C.CAR_ID=:CAR_ID')
    Left = 320
    Top = 9
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CAR_ID'
        ParamType = ptUnknown
      end>
    object PlacQueryLINE: TIntegerField
      FieldName = 'LINE'
      Origin = '"PLACEMENTS"."LINE"'
    end
    object PlacQueryDT_P_DATE: TDateField
      FieldName = 'DT_P_DATE'
      ProviderFlags = []
    end
    object PlacQueryDT_P_TIME: TTimeField
      FieldName = 'DT_P_TIME'
      ProviderFlags = []
    end
    object PlacQueryDT_C_DATE: TDateField
      FieldName = 'DT_C_DATE'
      ProviderFlags = []
    end
    object PlacQueryDT_C_TIME: TTimeField
      FieldName = 'DT_C_TIME'
      ProviderFlags = []
    end
    object PlacQueryDT_E_DATE: TDateField
      FieldName = 'DT_E_DATE'
      ProviderFlags = []
    end
    object PlacQueryDT_E_TIME: TTimeField
      FieldName = 'DT_E_TIME'
      ProviderFlags = []
    end
    object PlacQueryTEMPER: TSmallintField
      FieldName = 'TEMPER'
      Origin = '"NOTIFICATIONS"."TEMPER"'
    end
    object PlacQueryPL_STATE_NAME: TIBStringField
      FieldName = 'PL_STATE_NAME'
      Origin = '"PL_STATES"."DESCR"'
      Size = 128
    end
    object PlacQueryUPLOAD_B: TIntegerField
      FieldName = 'UPLOAD_B'
      Origin = '"IN_CARS"."UPLOAD_B"'
    end
    object PlacQueryVOLUME_B: TIntegerField
      FieldName = 'VOLUME_B'
      Origin = '"IN_CARS"."VOLUME_B"'
    end
    object PlacQueryWEIGHT_BB: TIntegerField
      FieldName = 'WEIGHT_BB'
      Origin = '"IN_CARS"."WEIGHT_BB"'
    end
    object PlacQueryWEIGHT_BN: TIntegerField
      FieldName = 'WEIGHT_BN'
      Origin = '"IN_CARS"."WEIGHT_BN"'
    end
    object PlacQueryDEB_BRUTTO: TLargeintField
      FieldName = 'DEB_BRUTTO'
      ProviderFlags = []
    end
    object PlacQueryDEB_NETTO: TLargeintField
      FieldName = 'DEB_NETTO'
      ProviderFlags = []
    end
    object PlacQueryQPB_NUMBER: TSmallintField
      FieldName = 'QPB_NUMBER'
      Origin = '"QP_BASE"."NUMBER"'
    end
    object PlacQueryNUMBER: TIntegerField
      FieldName = 'NUMBER'
      Origin = '"STATEMENTS"."NUMBER"'
    end
    object PlacQueryREG_NUMBER: TIntegerField
      FieldName = 'REG_NUMBER'
      Origin = '"STATEMENTS"."REG_NUMBER"'
    end
    object PlacQueryEB_STATION_NAME: TIBStringField
      FieldName = 'EB_STATION_NAME'
      Origin = '"STATIONS"."NAME"'
      Size = 256
    end
    object PlacQueryEB_RECIPIENT_NAME: TIBStringField
      FieldName = 'EB_RECIPIENT_NAME'
      Origin = '"EM_COMPANIES"."SHORT_NAME"'
      Size = 256
    end
    object PlacQueryTEL_DATE: TDateField
      FieldName = 'TEL_DATE'
      Origin = '"EM_TELEGRAMS"."TEL_DATE"'
    end
    object PlacQueryTEL_NUMBER: TIBStringField
      FieldName = 'TEL_NUMBER'
      Origin = '"EM_TELEGRAMS"."NUMBER"'
      Size = 30
    end
    object PlacQueryTEL_FIRM_NAME: TIBStringField
      FieldName = 'TEL_FIRM_NAME'
      Origin = '"EM_COMPANIES"."SHORT_NAME"'
      Size = 256
    end
    object PlacQueryEMBILL_ID: TIntegerField
      FieldName = 'EMBILL_ID'
      Origin = '"IN_CARS"."EMBILL_ID"'
    end
    object PlacQueryTEL_ID: TIntegerField
      FieldName = 'TEL_ID'
      Origin = '"IN_CARS"."TEL_ID"'
    end
  end
  object ImageList: TImageList
    Left = 246
    Top = 2
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF00000000000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000800F000000000000800F000000000000
      800700000000000080030000000000008001000000000000801F000000000000
      801F000000000000801F000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
end
