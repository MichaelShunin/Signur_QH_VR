object DbGridColumnSetupForm: TDbGridColumnSetupForm
  Left = 431
  Top = 396
  Width = 486
  Height = 335
  Caption = #1057#1086#1089#1090#1072#1074' '#1080' '#1087#1086#1088#1103#1076#1086#1082' '#1089#1090#1086#1083#1073#1094#1086#1074
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inline ColumnsFrame: TDbGridFrame
    Left = 0
    Top = 0
    Width = 392
    Height = 301
    Align = alClient
    AutoScroll = False
    TabOrder = 0
    inherited Grid: TDBGridEh
      Width = 277
      Height = 276
      AllowedOperations = [alopUpdateEh]
      AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Name = 'Tahoma'
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghClearSelection, dghAutoSortMarking, dghEnterAsTab, dghTraceColSizing, dghIncSearch, dghRowHighlight]
      ReadOnly = False
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Name = 'Tahoma'
      OnSortMarkingChanged = ColumnsFrameGridSortMarkingChanged
      Columns = <
        item
          EditButtons = <>
          FieldName = 'VISIBLE'
          Footers = <>
          Title.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100
          Width = 80
        end
        item
          Color = 15263976
          EditButtons = <>
          FieldName = 'TITLE'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
          Width = 100
        end
        item
          AlwaysShowEditButton = True
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'ALIGNMENT'
          Footers = <>
          KeyList.Strings = (
            '0'
            '1'
            '2')
          PickList.Strings = (
            #1074#1083#1077#1074#1086
            #1074#1087#1088#1072#1074#1086
            #1087#1086' '#1094#1077#1085#1090#1088#1091)
          Title.Caption = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077
          Width = 80
        end
        item
          Color = 15263976
          EditButtons = <>
          FieldName = 'FIELD_NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1086#1083#1077' '#1041#1044
          Width = 100
        end>
    end
    inherited ToolPanel: TPanel
      Height = 276
      inherited Label2: TLabel
        Width = 52
      end
      inherited SimilarityLabel: TLabel
        Width = 49
      end
      inherited Bevel: TBevel
        Height = 276
      end
      inherited Label4: TLabel
        Width = 11
      end
    end
    inherited TopPanel: TPanel
      Width = 392
      inherited Navigator: TDBNavigator
        Width = 335
      end
    end
    inherited PopupMenu: TPopupMenu
      inherited SelectColumnMenuItem: TMenuItem
        Enabled = False
      end
    end
    inherited DataSource: TDataSource
      DataSet = ColumnsDataSet
    end
  end
  object Panel1: TPanel
    Left = 392
    Top = 0
    Width = 86
    Height = 301
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object ResetBtn: TButton
      Left = 7
      Top = 168
      Width = 75
      Height = 25
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100
      TabOrder = 0
      OnClick = ResetBtnClick
    end
    object DownBtn: TButton
      Left = 7
      Top = 120
      Width = 75
      Height = 25
      Caption = #1042#1085#1080#1079
      TabOrder = 1
      OnClick = DownBtnClick
    end
    object UpBtn: TButton
      Left = 7
      Top = 88
      Width = 75
      Height = 25
      Caption = #1042#1074#1077#1088#1093
      TabOrder = 2
      OnClick = UpBtnClick
    end
    object CancelBtn: TButton
      Left = 7
      Top = 40
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 3
    end
    object OKBtn: TButton
      Left = 7
      Top = 8
      Width = 75
      Height = 25
      Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 4
    end
  end
  object ColumnsDataSet: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ORDER_ID'
        DataType = ftInteger
      end
      item
        Name = 'VISIBLE'
        DataType = ftBoolean
      end
      item
        Name = 'TITLE'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'FIELD_NAME'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'COLUMN_REF'
        DataType = ftInteger
      end
      item
        Name = 'ALIGNMENT'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'COLUMN_REF'
        Fields = 'COLUMN_REF'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'ORDER_ID_A'
        Fields = 'ORDER_ID'
      end
      item
        Name = 'ORDER_ID_D'
        Fields = 'ORDER_ID'
        Options = [ixDescending]
      end
      item
        Name = 'VISIBLE_A'
        Fields = 'VISIBLE'
      end
      item
        Name = 'VISIBLE_D'
        DescFields = 'VISIBLE'
        Fields = 'VISIBLE'
        Options = [ixDescending]
      end
      item
        Name = 'TITLE_A'
        Fields = 'TITLE'
      end
      item
        Name = 'TITLE_D'
        DescFields = 'TITLE'
        Fields = 'TITLE'
        Options = [ixDescending]
      end
      item
        Name = 'FIELD_NAME_A'
        Fields = 'FIELD_NAME'
      end
      item
        Name = 'FIELD_NAME_D'
        DescFields = 'FIELD_NAME'
        Fields = 'FIELD_NAME'
        Options = [ixDescending]
      end
      item
        Name = 'ALIGNMENT_A'
        Fields = 'ALIGNMENT'
      end
      item
        Name = 'ALIGNMENT_D'
        DescFields = 'ALIGNMENT'
        Fields = 'ALIGNMENT'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 408
    Top = 208
    object ColumnsDataSetORDER_ID: TIntegerField
      FieldName = 'ORDER_ID'
    end
    object ColumnsDataSetVISIBLE: TBooleanField
      FieldName = 'VISIBLE'
      OnChange = ColumnsDataSetVISIBLEChange
    end
    object ColumnsDataSetTITLE: TStringField
      FieldName = 'TITLE'
      Size = 512
    end
    object ColumnsDataSetFIELD_NAME: TStringField
      FieldName = 'FIELD_NAME'
      Size = 512
    end
    object ColumnsDataSetCOLUMN_REF: TIntegerField
      FieldName = 'COLUMN_REF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ColumnsDataSetALIGNMENT: TIntegerField
      FieldName = 'ALIGNMENT'
    end
  end
end
