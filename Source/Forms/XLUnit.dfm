object XLDataModule: TXLDataModule
  OldCreateOrder = False
  Left = 229
  Top = 119
  Height = 172
  Width = 196
  object xlReport1: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen, xroAutoClose, xroHideExcel]
    DataSources = <
      item
        Options = [xrgoAutoOpen, xrgoAutoClose, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 16
    Top = 16
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 104
    Top = 64
  end
end
