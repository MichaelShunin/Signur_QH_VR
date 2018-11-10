inherited DataLookupMemoForm: TDataLookupMemoForm
  Left = 176
  Top = 174
  Width = 574
  Height = 405
  Caption = #1042#1099#1073#1086#1088
  PixelsPerInch = 96
  TextHeight = 13
  object HSplitter: TSplitter [0]
    Left = 0
    Top = 196
    Width = 566
    Height = 6
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    ResizeStyle = rsUpdate
  end
  inherited BottomPanel: TPanel
    Top = 328
    Width = 566
    inherited Bevel1: TBevel
      Width = 566
    end
    inherited OKBtn: TButton
      Left = 405
    end
    inherited CancelBtn: TButton
      Left = 486
    end
  end
  inherited LookupFrame: TDbGridFrame
    Width = 566
    Height = 196
    inherited Grid: TDBGridEh
      Width = 409
      Height = 171
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghClearSelection, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight]
    end
    inherited ToolPanel: TPanel
      Height = 171
      inherited Bevel: TBevel
        Height = 171
      end
    end
    inherited TopPanel: TPanel
      Width = 566
      inherited Navigator: TDBNavigator
        Width = 509
      end
    end
    inherited ViewsPanel: TPanel
      Left = 524
      Height = 171
      inherited Bevel1: TBevel
        Height = 169
      end
    end
    inherited DataSource: TDataSource
      DataSet = ListQuery
    end
  end
  object Memo: TDBMemo
    Left = 0
    Top = 202
    Width = 566
    Height = 126
    Align = alBottom
    Constraints.MinHeight = 40
    DataSource = LookupFrame.DataSource
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    WordWrap = False
  end
  object ListQuery: TIBQuery
    Database = CommonData.Database
    Transaction = CommonData.ReadTransaction
    Left = 488
    Top = 226
  end
end
