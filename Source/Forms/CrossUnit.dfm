object CrossForm: TCrossForm
  Left = 239
  Top = 128
  Width = 544
  Height = 435
  Caption = 'CrossForm'
  Color = clWindow
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  ShowHint = True
  OnClose = FormClose
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    536
    408)
  PixelsPerInch = 96
  TextHeight = 13
  object BottomBevel: TBevel
    Left = 0
    Top = 348
    Width = 536
    Height = 4
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsFrame
  end
  object PageScroller: TPageScroller
    Left = 0
    Top = 0
    Width = 81
    Height = 348
    Anchors = [akLeft, akTop, akBottom]
    Color = clActiveCaption
    Control = ToolPanel
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Orientation = soVertical
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object ToolPanel: TPanel
      Left = 0
      Top = 0
      Width = 81
      Height = 368
      BevelOuter = bvNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clCaptionText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      TabOrder = 0
    end
  end
  object ClientPanel: TPanel
    Left = 81
    Top = 0
    Width = 455
    Height = 348
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter: TSplitter
      Left = 0
      Top = 177
      Width = 455
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Beveled = True
    end
    object MainPageControl: TPageControl
      Left = 0
      Top = 0
      Width = 455
      Height = 177
      Align = alTop
      Style = tsButtons
      TabOrder = 0
    end
    object DetailedPageControl: TPageControl
      Left = 0
      Top = 181
      Width = 455
      Height = 167
      Align = alClient
      Style = tsButtons
      TabOrder = 1
    end
  end
  object CloseBtn: TButton
    Left = 453
    Top = 356
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    OnClick = CloseBtnClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 389
    Width = 536
    Height = 19
    Panels = <>
  end
end
