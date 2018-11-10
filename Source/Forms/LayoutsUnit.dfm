inherited LayoutsForm: TLayoutsForm
  Left = 245
  Top = 211
  Width = 537
  Height = 301
  ActiveControl = Grid
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1093#1088#1072#1085#1077#1085#1085#1099#1093' '#1074#1080#1076#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 440
    Top = 0
    Width = 89
    Height = 274
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object OKBtn: TButton
      Left = 8
      Top = 16
      Width = 75
      Height = 25
      Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100
      Default = True
      TabOrder = 0
      OnClick = OKBtnClick
    end
    object CancelBtn: TButton
      Left = 8
      Top = 48
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = CancelBtnClick
    end
    object UpBtn: TButton
      Left = 8
      Top = 112
      Width = 75
      Height = 25
      Caption = #1042#1074#1077#1088#1093
      TabOrder = 2
      OnClick = UpBtnClick
    end
    object DownBtn: TButton
      Left = 8
      Top = 144
      Width = 75
      Height = 25
      Caption = #1042#1085#1080#1079
      TabOrder = 3
      OnClick = DownBtnClick
    end
    object DeleteBtn: TButton
      Left = 8
      Top = 208
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 4
      OnClick = DeleteBtnClick
    end
    object SelectBtn: TButton
      Left = 8
      Top = 240
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 5
      OnClick = SelectBtnClick
    end
  end
  object Grid: TDBGridEh
    Left = 0
    Top = 0
    Width = 440
    Height = 274
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    AllowedSelections = [gstRectangle]
    AutoFitColWidths = True
    ColumnDefValues.Title.TitleButton = True
    DataSource = LayoutsSource
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghClearSelection, dghAutoSortMarking, dghEnterAsTab, dghTraceColSizing, dghIncSearch, dghRowHighlight]
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    VertScrollBar.Tracking = True
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Color = 15263976
        EditButtons = <>
        FieldName = 'ORDER'
        Footers = <>
        ReadOnly = True
        Title.Caption = #8470' '#1087'.'#1087'.'
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 120
      end>
  end
  object LayoutsSource: TDataSource
    DataSet = LayoutsDataSet
    OnDataChange = LayoutsSourceDataChange
    Left = 24
    Top = 56
  end
  object LayoutsDataSet: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ORDER'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 1024
      end
      item
        Name = 'POINTER'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'ORDER_INDEX'
        Fields = 'ORDER'
      end>
    IndexName = 'ORDER_INDEX'
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 96
    object LayoutsDataSetORDER: TIntegerField
      FieldName = 'ORDER'
      OnGetText = LayoutsDataSetORDERGetText
    end
    object LayoutsDataSetNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
    object LayoutsDataSetPOINTER: TIntegerField
      FieldName = 'POINTER'
    end
  end
end
