inherited DeviceListForm: TDeviceListForm
  Top = 52
  Width = 759
  Height = 554
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1080#1073#1086#1088#1086#1074' '
  Menu = mm1
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 390
    Width = 743
    Height = 105
    Align = alBottom
    Constraints.MinWidth = 630
    TabOrder = 0
    object btn1: TButton
      Left = 248
      Top = 3
      Width = 180
      Height = 47
      Hint = #1057#1087#1080#1089#1086#1082' '#1087#1088#1080#1073#1086#1088#1086#1074'  '#1086#1095#1080#1097#1072#1077#1090#1089#1103
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 580
      Top = 3
      Width = 253
      Height = 47
      Hint = 
        'xls-'#1092#1072#1081#1083#1099' '#1080' tbl-'#1092#1072#1081#1083#1099' '#1089#1086#1076#1077#1088#1078#1072#1097#1080#1093#1089#1103' '#1074' '#1089#1087#1080#1089#1082#1077' '#1087#1088#1080#1073#1086#1088#1086#1074' '#1079#1072#1085#1086#1089#1103#1090#1089#1103' '#1074 +
        #13#10#1082#1072#1090#1072#1083#1086#1075' DeviceList'#13#10
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1092#1072#1081#1083#1099' '#1087#1088#1080#1073#1086#1088#1086#1074' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1074' '#1082#1072#1090#1072#1083#1086#1075#1077' DeviceList'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = btn2Click
    end
    object btn4: TButton
      Left = 8
      Top = 3
      Width = 180
      Height = 47
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1087#1088#1080#1073#1086#1088'  '#1080#1079' '#1089#1087#1080#1089#1082#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      WordWrap = True
      OnClick = btn4Click
    end
  end
  inline GridFrame: TDbGridFrame
    Left = 0
    Top = 0
    Width = 743
    Height = 390
    Align = alClient
    AutoScroll = False
    TabOrder = 1
    inherited Grid: TDBGridEh
      Left = 222
      Width = 521
      Height = 390
      AutoFitColWidths = False
      Color = 16776176
      DataSource = dsDS_VT
      Font.Charset = RUSSIAN_CHARSET
      Font.Height = -15
      Font.Name = 'Tahoma'
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Height = -10
      FooterFont.Name = 'Tahoma'
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      RowSizingAllowed = True
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Height = -15
      TitleFont.Name = 'Tahoma'
      OnDblClick = GridFrameGridDblClick
      OnGetCellParams = GridFrameGridGetCellParams
      Columns = <
        item
          Alignment = taLeftJustify
          EditButtons = <>
          FieldName = 'COMPOSITION_DEVICETYPE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1090#1080#1087
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'DEVICENUMBER'
          Footers = <>
          Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1085#1086#1084#1077#1088
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'DEVICETYPENAME'
          Footers = <>
          Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1090#1080#1087' '#1074#1086#1076#1086#1074#1086#1076#1072
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'CONVERTERNAME'
          Footers = <>
          Title.Caption = #1055#1088#1080#1073#1086#1088'|'#1072#1082#1091#1089#1090#1080#1095'. '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1077#1083#1100
          Width = 97
        end
        item
          EditButtons = <>
          FieldName = 'tblfile'
          Footers = <>
          Title.Caption = #1060#1072#1081#1083#1099'|tbl'
          Title.TitleButton = False
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'xlsfile'
          Footers = <>
          Title.Caption = #1060#1072#1081#1083#1099'|xls'
          Width = 84
        end
        item
          DisplayFormat = 'dd.mm.yy'
          EditButtons = <>
          FieldName = 'CREATE_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080'|'#1087#1088#1077#1076#1099#1076#1091#1097#1080#1081
          Width = 80
        end
        item
          DisplayFormat = 'dd.mm.yy'
          EditButtons = <>
          FieldName = 'SALE_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080'|'#1090#1077#1082#1091#1097#1080#1081
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'CUSTOMER'
          Footers = <>
          Title.Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
          Width = 107
        end
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Title.Caption = #1082#1086#1076' '#1079#1072#1087#1080#1089#1080' '#1074' '#1072#1088#1093#1080#1074#1077
          Title.TitleButton = False
          Width = 93
        end
        item
          EditButtons = <>
          FieldName = 'TABLE_CODE'
          Footers = <>
          Visible = False
          Width = 91
        end>
      inherited ToolBtn: TSpeedButton
        Width = 25
        Height = 25
        Visible = False
      end
    end
    inherited ToolPanel: TPanel
      Width = 222
      Height = 390
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
        Width = 131
      end
      inherited Bevel: TBevel
        Left = 217
        Top = 26
        Width = 5
        Height = 364
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
        Width = 202
        DropDownBox.Rows = 9
        DropDownBox.Sizable = True
        ShowHint = True
      end
      inherited ValueEdit: TDBEditEh
        Left = 15
        Top = 49
        Width = 173
        ShowHint = True
      end
      inherited SearchCombo: TDBComboBoxEh
        Left = 15
        Top = 256
        Width = 202
        ShowHint = True
      end
      inherited SimilarityTrack: TTrackBar
        Left = 10
        Top = 303
        Width = 210
        Height = 40
      end
      inherited FilterCheck: TCheckBox
        Left = 15
        Top = 84
        Width = 168
        Height = 21
      end
      inherited Panel1: TPanel
        Width = 222
        Height = 26
        Font.Height = -15
        inherited btnSearchClose: TSpeedButton
          Left = 203
          Width = 20
          Height = 20
        end
      end
      inherited SearchDirectionCompo: TDBComboBoxEh
        Left = 15
        Top = 207
        Width = 202
        ShowHint = True
      end
      inherited ToolBar1: TToolBar
        Left = 186
      end
      inherited ValueEdit2: TDBEditEh
        Left = 122
        Top = 49
        Width = 78
        ShowHint = True
      end
    end
    inherited PopupMenu: TPopupMenu
      Left = 178
      Top = 70
      inherited SelectColumnMenuItem: TMenuItem
        GroupIndex = 200
      end
      inherited ToolMenuItem: TMenuItem
        Enabled = False
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
  object dsDS_VT: TDataSource
    DataSet = VT
    Left = 496
    Top = 168
  end
  object VT: TVirtualTable
    BeforeDelete = VTBeforeDelete
    OnCalcFields = VTCalcFields
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 48
      end
      item
        Name = 'DEVICENUMBER'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'TYPEDEVICE_ID'
        DataType = ftInteger
      end
      item
        Name = 'CREATE_DATE'
        DataType = ftDate
      end
      item
        Name = 'SALE_DATE'
        DataType = ftDate
      end
      item
        Name = 'CUSTOMER'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'DESCR'
        DataType = ftString
        Size = 1024
      end
      item
        Name = 'ID_CONVERTER'
        DataType = ftInteger
      end
      item
        Name = 'LOCKED'
        DataType = ftSmallint
      end
      item
        Name = 'DEVICETYPENAME'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'CONVERTERNAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'CALCMODE'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'VT_X_UNIT'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'VT_X_NAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'VT_X_SHORTNAME'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'VT_Y_UNIT'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'VT_Y_NAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'VT_Y_SHORTNAME'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'FORMULA'
        DataType = ftString
        Size = 1024
      end
      item
        Name = 'DEVICE_PARENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'PARENTDEVICENUMBER'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'PARAMS_ARE_BAD'
        DataType = ftSmallint
      end
      item
        Name = 'COMPOSITION_CURRENT'
        DataType = ftSmallint
      end
      item
        Name = 'COMPOSITION_RS'
        DataType = ftSmallint
      end
      item
        Name = 'COMPOSITION_LEVEL'
        DataType = ftSmallint
      end
      item
        Name = 'COMPOSITION_IR_PORT'
        DataType = ftSmallint
      end
      item
        Name = 'COMPOSITION_DEVICETYPE'
        DataType = ftSmallint
      end
      item
        Name = 'COMPOSITION_IMP_OUT'
        DataType = ftSmallint
      end
      item
        Name = 'TABLE_CODE'
        DataType = ftSmallint
      end
      item
        Name = 'RECORD_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'NEED_RECALC'
        DataType = ftSmallint
      end
      item
        Name = 'NEED_TBL'
        DataType = ftSmallint
      end>
    Left = 616
    Top = 160
    Data = {
      0300210002004944030000000000000004004E414D4501003000000000000C00
      4445564943454E554D42455201001000000000000D0054595045444556494345
      5F494403000000000000000B004352454154455F444154450900000000000000
      090053414C455F4441544509000000000000000800435553544F4D4552010080
      00000000000500444553435201000004000000000C0049445F434F4E56455254
      4552030000000000000006004C4F434B454402000000000000000E0044455649
      4345545950454E414D4501008000000000000D00434F4E5645525445524E414D
      450100400000000000080043414C434D4F44450100100000000000090056545F
      585F554E49540100100000000000090056545F585F4E414D4501004000000000
      000E0056545F585F53484F52544E414D450100100000000000090056545F595F
      554E49540100100000000000090056545F595F4E414D4501004000000000000E
      0056545F595F53484F52544E414D4501001000000000000700464F524D554C41
      010000040000000010004445564943455F504152454E545F4944030000000000
      00001200504152454E544445564943454E554D42455201001000000000000E00
      504152414D535F4152455F42414402000000000000001300434F4D504F534954
      494F4E5F43555252454E5402000000000000000E00434F4D504F534954494F4E
      5F525302000000000000001100434F4D504F534954494F4E5F4C4556454C0200
      0000000000001300434F4D504F534954494F4E5F49525F504F52540200000000
      0000001600434F4D504F534954494F4E5F444556494345545950450200000000
      0000001300434F4D504F534954494F4E5F494D505F4F55540200000000000000
      0A005441424C455F434F444502000000000000000B005245434F52445F444154
      450B000000000000000B004E4545445F524543414C4302000000000000000800
      4E4545445F54424C0200000000000000000000000000}
    object VTID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object VTNAME: TStringField
      FieldName = 'NAME'
      OnGetText = VTNAMEGetText
      Size = 48
    end
    object VTDEVICENUMBER: TStringField
      FieldName = 'DEVICENUMBER'
      Size = 16
    end
    object VTTYPEDEVICE_ID: TIntegerField
      FieldName = 'TYPEDEVICE_ID'
    end
    object VTCREATE_DATE: TDateField
      FieldName = 'CREATE_DATE'
    end
    object VTSALE_DATE: TDateField
      FieldName = 'SALE_DATE'
    end
    object VTCUSTOMER: TStringField
      FieldName = 'CUSTOMER'
      Size = 128
    end
    object VTDESCR: TStringField
      FieldName = 'DESCR'
      Size = 1024
    end
    object VTID_CONVERTER: TIntegerField
      FieldName = 'ID_CONVERTER'
    end
    object VTLOCKED: TSmallintField
      FieldName = 'LOCKED'
    end
    object VTDEVICETYPENAME: TStringField
      FieldName = 'DEVICETYPENAME'
      Size = 128
    end
    object VTCONVERTERNAME: TStringField
      FieldName = 'CONVERTERNAME'
      Size = 64
    end
    object VTCALCMODE: TStringField
      FieldName = 'CALCMODE'
      Size = 16
    end
    object VTVT_X_UNIT: TStringField
      FieldName = 'VT_X_UNIT'
      Size = 16
    end
    object VTVT_X_NAME: TStringField
      FieldName = 'VT_X_NAME'
      Size = 64
    end
    object VTVT_X_SHORTNAME: TStringField
      FieldName = 'VT_X_SHORTNAME'
      Size = 16
    end
    object VTVT_Y_UNIT: TStringField
      FieldName = 'VT_Y_UNIT'
      Size = 16
    end
    object VTVT_Y_NAME: TStringField
      FieldName = 'VT_Y_NAME'
      Size = 64
    end
    object VTVT_Y_SHORTNAME: TStringField
      FieldName = 'VT_Y_SHORTNAME'
      Size = 16
    end
    object VTFORMULA: TStringField
      FieldName = 'FORMULA'
      Size = 1024
    end
    object VTDEVICE_PARENT_ID: TIntegerField
      FieldName = 'DEVICE_PARENT_ID'
    end
    object VTPARENTDEVICENUMBER: TStringField
      FieldName = 'PARENTDEVICENUMBER'
      Size = 16
    end
    object VTPARAMS_ARE_BAD: TSmallintField
      FieldName = 'PARAMS_ARE_BAD'
    end
    object VTCOMPOSITION_CURRENT: TSmallintField
      FieldName = 'COMPOSITION_CURRENT'
    end
    object VTCOMPOSITION_RS: TSmallintField
      FieldName = 'COMPOSITION_RS'
    end
    object VTCOMPOSITION_LEVEL: TSmallintField
      FieldName = 'COMPOSITION_LEVEL'
    end
    object VTCOMPOSITION_IR_PORT: TSmallintField
      FieldName = 'COMPOSITION_IR_PORT'
    end
    object VTCOMPOSITION_DEVICETYPE: TSmallintField
      FieldName = 'COMPOSITION_DEVICETYPE'
      OnGetText = VTCOMPOSITION_DEVICETYPEGetText
    end
    object VTCOMPOSITION_IMP_OUT: TSmallintField
      FieldName = 'COMPOSITION_IMP_OUT'
    end
    object VTTABLE_CODE: TSmallintField
      FieldName = 'TABLE_CODE'
    end
    object VTtblfile: TStringField
      FieldName = 'tblfile'
      Size = 32
    end
    object VTRECORD_DATE: TDateTimeField
      FieldName = 'RECORD_DATE'
    end
    object VTNEED_RECALC: TSmallintField
      FieldName = 'NEED_RECALC'
    end
    object VTNEED_TBL: TSmallintField
      FieldName = 'NEED_TBL'
    end
    object VTxlsfile: TStringField
      FieldKind = fkCalculated
      FieldName = 'xlsfile'
      Size = 32
      Calculated = True
    end
    object fltfldVTAdditive_shift: TFloatField
      FieldName = 'Additive_shift'
    end
  end
  object mm1: TMainMenu
    Left = 320
    Top = 296
    object N1: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1089#1086' '#1089#1087#1080#1089#1082#1086#1084' '#1087#1088#1080#1073#1086#1088#1086#1074
      OnClick = N1Click
    end
    object TMenuItem
    end
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1087#1088#1080#1073#1086#1088#1086#1074
      object N4: TMenuItem
        Caption = '-'
      end
      object miDeleteDevice: TMenuItem
        Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1074' '#1089#1087#1080#1089#1082#1077' '#1087#1088#1080#1073#1086#1088#1072' '#1080#1079' '#1072#1088#1093#1080#1074#1072
        OnClick = btnDeleteDeviceClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miDeleteAll: TMenuItem
        Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1074#1089#1077#1093' '#1087#1088#1080#1073#1086#1088#1086#1074' '#1089#1087#1080#1089#1082#1072' '#1080#1079' '#1072#1088#1093#1080#1074#1072
        OnClick = miDeleteAllClick
      end
    end
  end
end
