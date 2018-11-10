object OptionsForm: TOptionsForm
  Left = 288
  Top = 104
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 412
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 353
    Height = 374
    ActivePage = CommonSheet
    Align = alClient
    TabOrder = 0
    object CommonSheet: TTabSheet
      Caption = #1054#1073#1097#1080#1077
    end
    object ReportSheet: TTabSheet
      Caption = #1054#1090#1095#1077#1090#1099
      ImageIndex = 1
      object Bevel1: TBevel
        Left = 0
        Top = 81
        Width = 345
        Height = 4
        Align = alTop
      end
      object ReportsCommonPanel: TPanel
        Left = 0
        Top = 0
        Width = 345
        Height = 81
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
      end
      object ReportPageControl: TPageControl
        Left = 0
        Top = 121
        Width = 345
        Height = 225
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 1
      end
      object ReportComboPanel: TPanel
        Left = 0
        Top = 85
        Width = 345
        Height = 36
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          345
          36)
        object ReportsCombo: TComboBox
          Left = 8
          Top = 8
          Width = 329
          Height = 21
          BevelKind = bkFlat
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
          OnChange = ReportsComboChange
        end
      end
    end
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 374
    Width = 353
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object OkBtn: TButton
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelBtn: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [fdEffects, fdApplyButton]
    OnApply = FontDialogApply
    Left = 8
    Top = 382
  end
end
