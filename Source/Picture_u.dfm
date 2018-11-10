object Pictureform: TPictureform
  Left = 377
  Top = 209
  Width = 592
  Height = 423
  Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1085#1086#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 120
  TextHeight = 16
  object cxDBImage1: TcxDBImage
    Left = 0
    Top = 137
    Width = 581
    Height = 243
    Align = alClient
    DataBinding.DataSource = ExpForm.ds_ekspParams
    DataBinding.DataField = 'PARAMIMAGE'
    Properties.GraphicClassName = 'TJPEGImage'
    Properties.Stretch = True
    Style.Color = clBtnFace
    Style.Shadow = True
    TabOrder = 0
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      584
      137)
    object Label5: TLabel
      Left = 94
      Top = 7
      Width = 39
      Height = 16
      Caption = #1058#1077#1084#1072':'
    end
    object Label6: TLabel
      Left = 27
      Top = 32
      Width = 106
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label7: TLabel
      Left = 71
      Top = 56
      Width = 62
      Height = 16
      Caption = #1057#1090#1072#1085#1094#1080#1103':'
    end
    object Label12: TLabel
      Left = 5
      Top = 81
      Width = 128
      Height = 16
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1089#1080#1075#1085#1072#1083#1072':'
    end
    object btnClose: TcxButton
      Left = 465
      Top = 30
      Width = 101
      Height = 31
      Anchors = [akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = btnCloseClick
      LookAndFeel.Kind = lfStandard
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 136
      Top = 4
      Width = 318
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = ExpForm.ds_eksp_theme
      DataBinding.DataField = 'EKSP_THEME'
      Properties.ReadOnly = True
      Style.Color = clBtnFace
      TabOrder = 1
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 136
      Top = 28
      Width = 318
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = ExpForm.ds_eksp_theme
      DataBinding.DataField = 'EKSP_HEADER'
      Properties.ReadOnly = True
      Style.Color = clBtnFace
      TabOrder = 2
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 136
      Top = 52
      Width = 318
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = ExpForm.ds_eksp_theme
      DataBinding.DataField = 'EKSP_AUTHOR'
      Properties.ReadOnly = True
      Style.Color = clBtnFace
      TabOrder = 3
    end
    object cxDBMemo4: TcxDBMemo
      Left = 136
      Top = 76
      Width = 318
      Height = 36
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = ExpForm.ds_eksp_theme
      DataBinding.DataField = 'EKSP_SIGNALSOURCE'
      Properties.ScrollBars = ssVertical
      Style.Color = clBtnFace
      TabOrder = 4
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 8
      Top = 112
      Width = 570
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = ExpForm.ds_ekspParams
      DataBinding.DataField = 'PARAMNAME'
      Properties.Alignment.Horz = taCenter
      Properties.ReadOnly = True
      Style.Color = clBtnFace
      TabOrder = 5
    end
  end
end
