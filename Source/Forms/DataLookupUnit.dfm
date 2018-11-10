inherited DataLookupForm: TDataLookupForm
  Left = 216
  Top = 135
  Width = 583
  Caption = #1042#1099#1073#1086#1088
  PixelsPerInch = 96
  TextHeight = 13
  inherited BottomPanel: TPanel
    Width = 575
    inherited Bevel1: TBevel
      Width = 575
    end
    inherited OKBtn: TButton
      Left = 414
    end
    inherited CancelBtn: TButton
      Left = 495
    end
  end
  inherited LookupFrame: TDbGridFrame
    Width = 575
    inherited Grid: TDBGridEh
      Width = 418
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghClearSelection, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight]
    end
    inherited TopPanel: TPanel
      Width = 575
      inherited Navigator: TDBNavigator
        Width = 518
      end
    end
    inherited ViewsPanel: TPanel
      Left = 533
    end
    inherited DataSource: TDataSource
      DataSet = ListQuery
    end
  end
  object ListQuery: TIBQuery
    Database = CommonData.Database
    Transaction = CommonData.ReadTransaction
    Left = 488
    Top = 226
  end
end
