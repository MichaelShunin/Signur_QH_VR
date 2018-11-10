object MultiListForm: TMultiListForm
  Left = 271
  Top = 154
  ActiveControl = ListView
  AutoScroll = False
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1090#1088#1080#1073#1091#1090#1099
  ClientHeight = 308
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnHide = FormHide
  OnShow = FormShow
  DesignSize = (
    478
    308)
  PixelsPerInch = 96
  TextHeight = 13
  object OKBtn: TButton
    Left = 400
    Top = 8
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelBtn: TButton
    Left = 400
    Top = 40
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object ListView: TListView
    Left = 0
    Top = 0
    Width = 393
    Height = 308
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelKind = bkFlat
    BorderStyle = bsNone
    Checkboxes = True
    Columns = <>
    GridLines = True
    HideSelection = False
    MultiSelect = True
    RowSelect = True
    SortType = stText
    TabOrder = 0
    ViewStyle = vsReport
    OnColumnClick = ListViewColumnClick
    OnCompare = ListViewCompare
    OnSelectItem = ListViewSelectItem
  end
  object MarkBtn: TButton
    Left = 400
    Top = 88
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1084#1077#1090#1080#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = MarkBtnClick
  end
  object UnmarkBtn: TButton
    Left = 400
    Top = 120
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1057#1085#1103#1090#1100
    Enabled = False
    TabOrder = 4
    OnClick = UnmarkBtnClick
  end
  object MarkAllBtn: TButton
    Left = 400
    Top = 168
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
    TabOrder = 5
    OnClick = MarkAllBtnClick
  end
  object UnmarkAllBtn: TButton
    Left = 400
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077
    TabOrder = 6
    OnClick = UnmarkAllBtnClick
  end
  object ListQuery: TIBQuery
    Database = CommonData.Database
    Transaction = CommonData.ReadTransaction
    Left = 8
    Top = 264
  end
end
