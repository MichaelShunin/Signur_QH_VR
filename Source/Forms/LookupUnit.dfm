inherited LookupForm: TLookupForm
  Left = 192
  Top = 168
  Width = 458
  Height = 369
  Caption = 'LookupForm'
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BottomPanel: TPanel
    Left = 0
    Top = 292
    Width = 450
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      450
      43)
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 450
      Height = 4
      Align = alTop
    end
    object OKBtn: TButton
      Left = 278
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelBtn: TButton
      Left = 363
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  inline LookupFrame: TDbGridFrame
    Left = 0
    Top = 0
    Width = 450
    Height = 292
    Align = alClient
    AutoScroll = False
    TabOrder = 1
    inherited Grid: TDBGridEh
      Width = 293
      Height = 267
      AllowedSelections = [gstRectangle]
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Name = 'Tahoma'
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgMultiSelect]
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Name = 'Tahoma'
      OnDblClick = LookupFrameGridDblClick
    end
    inherited ToolPanel: TPanel
      Height = 267
      inherited Label2: TLabel
        Width = 52
      end
      inherited SimilarityLabel: TLabel
        Width = 49
      end
      inherited Bevel: TBevel
        Height = 267
      end
      inherited Label4: TLabel
        Width = 11
      end
    end
    inherited TopPanel: TPanel
      Width = 450
      inherited Navigator: TDBNavigator
        Width = 393
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      end
    end
    inherited ViewsPanel: TPanel
      Left = 408
      Height = 267
      inherited Bevel1: TBevel
        Height = 265
      end
    end
  end
end
