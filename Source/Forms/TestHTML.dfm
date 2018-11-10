object TestHTMLForm: TTestHTMLForm
  Left = 193
  Top = 127
  Width = 696
  Height = 480
  Caption = 'TestHTMLForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 4
    Top = 184
    Width = 683
    Height = 259
    TabOrder = 0
    OnDocumentComplete = WebBrowser1DocumentComplete
    ControlData = {
      4C00000097460000C51A00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Table: TIBTable
    Database = CommonData.Database
    TableName = 'CAR_TYPES'
    Left = 560
    Top = 76
  end
  object DataSource1: TDataSource
    DataSet = Table
    Left = 500
    Top = 100
  end
end
