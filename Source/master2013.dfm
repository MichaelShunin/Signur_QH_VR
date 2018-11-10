object Master2013Form: TMaster2013Form
  Left = 531
  Top = 173
  Width = 816
  Height = 271
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1080#1073#1086#1088#1086#1084
  Color = clBtnFace
  Constraints.MinHeight = 210
  Constraints.MinWidth = 610
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Gauge: TGauge
    Left = 0
    Top = 50
    Width = 800
    Height = 9
    Align = alTop
    BackColor = clActiveBorder
    BorderStyle = bsNone
    Color = clBlue
    ForeColor = clNavy
    ParentColor = False
    Progress = 0
    ShowText = False
  end
  object pnButtons: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 50
    Align = alTop
    Constraints.MinWidth = 630
    TabOrder = 0
    DesignSize = (
      800
      50)
    object lbStrNum: TLabel
      Left = 561
      Top = 53
      Width = 50
      Height = 14
      Alignment = taCenter
      Anchors = [akTop, akRight]
      Caption = #1076#1083#1080#1085#1072' '#1092#1088'.'
      Visible = False
    end
    object btnModem: TSpeedButton
      Left = 32
      Top = 7
      Width = 21
      Height = 19
      Hint = #1088#1072#1079#1088#1077#1096#1080#1090#1100' '#1089#1074#1103#1079#1100' '#1095#1077#1088#1077#1079' '#1084#1086#1076#1077#1084
      GroupIndex = 1
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        003333377777777777F3333091111111103333F7F3F3F3F3F7F3311098080808
        10333777F737373737F313309999999910337F373F3F3F3F3733133309808089
        03337FFF7F7373737FFF1000109999901000777777FFFFF77777701110000000
        111037F337777777F3373099901111109990373F373333373337330999999999
        99033373FFFFFFFFFF7333310000000001333337777777777733333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnModemClick
    end
    object btnPrm: TSpeedButton
      Left = 81
      Top = 1
      Width = 22
      Height = 19
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnPrmClick
    end
    object lbStrInit: TLabel
      Left = 576
      Top = 79
      Width = 56
      Height = 14
      Alignment = taCenter
      Anchors = [akTop, akRight]
      Caption = #1085#1072#1095#1072#1083#1086' '#1092#1088'.'
      Visible = False
    end
    object btnLocal: TSpeedButton
      Left = 5
      Top = 7
      Width = 22
      Height = 19
      GroupIndex = 1
      Down = True
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
        0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnLocalClick
    end
    object btnModbus: TSpeedButton
      Left = 58
      Top = 7
      Width = 22
      Height = 19
      Hint = #1088#1072#1088#1077#1096#1080#1090#1100' '#1089#1074#1103#1079#1100' '#1095#1077#1088#1077#1079' MODBUS'
      GroupIndex = 1
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
        00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
        00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
        03FF33337FFF77777333333300000333333F3333777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnModbusClick
    end
    object btnIdent: TBitBtn
      Left = 495
      Top = 34
      Width = 106
      Height = 23
      Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = btnIdentClick
    end
    object btnInst: TBitBtn
      Left = 91
      Top = 2
      Width = 190
      Height = 29
      Caption = #1058#1077#1082#1091#1097#1080#1077
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnInstClick
    end
    object btnArchAll: TBitBtn
      Left = 297
      Top = 2
      Width = 190
      Height = 31
      Caption = #1040#1088#1093#1080#1074#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnArchAllClick
    end
    object meStrNum: TMaskEdit
      Left = 623
      Top = 49
      Width = 50
      Height = 23
      Anchors = [akTop, akRight]
      EditMask = '9999;0; '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '8'
      Visible = False
    end
    object meStrInit: TMaskEdit
      Left = 499
      Top = 35
      Width = 39
      Height = 23
      Anchors = [akTop, akRight]
      EditMask = '9999;0; '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      TabOrder = 6
      Text = '1'
      Visible = False
    end
    object cbAlwaysOnTop: TCheckBox
      Left = 566
      Top = 34
      Width = 110
      Height = 14
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1042#1089#1077#1075#1076#1072' '#1085#1072#1074#1077#1088#1093#1091
      Checked = True
      State = cbChecked
      TabOrder = 8
      Visible = False
      OnClick = cbAlwaysOnTopClick
    end
    object btnLoadInfoFromDevice: TcxButton
      Left = 602
      Top = 4
      Width = 72
      Height = 23
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      Visible = False
      OnClick = btnLoadInfoFromDeviceClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000808
        08000808080008080800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000808
        0800FFFFFF00ADADAD000808080008080800FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000808080008080800080808000808
        0800FFFFFF0084848400848484000808080008080800FF00FF00FF00FF00FF00
        FF00FF00FF000808080008080800FF00FF0008080800FFFFFF00FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF00FF00FF00FF00
        FF00FF00FF0008080800CECECE0008080800CECECE00FFFFFF00FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF00080808000808
        08000808080008080800FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF0008080800FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
        0000FFFFFF0000000000000000008484840008080800FF00FF0008080800FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
        0000FFFFFF0084848400000000008484840008080800FF00FF0008080800FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF00080808000808
        08000808080008080800FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF00FF00FF00FF00
        FF00FF00FF0008080800CECECE0008080800CECECE00FFFFFF00FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF00FF00FF00FF00
        FF00FF00FF000808080008080800FF00FF0008080800FFFFFF00FFFFFF000000
        0000FFFFFF0084848400848484008484840008080800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0008080800FFFFFF00FFFFFF000000
        000000000000FFFFFF00848484008484840008080800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0008080800FFFFFF00FFFFFF00FFFF
        FF000000000000000000FFFFFF008484840008080800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000808080008080800080808000808
        08000808080008080800080808000808080008080800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfStandard
    end
    object btnTable: TBitBtn
      Left = 434
      Top = 32
      Width = 103
      Height = 22
      Caption = #1079#1072#1075#1088#1091#1079#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
    object btnSetDT: TBitBtn
      Left = 493
      Top = 2
      Width = 190
      Height = 29
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1072#1090#1091' '#1080' '#1074#1088#1077#1084#1103
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnClick = btnSetDTClick
    end
    object chkPacket_Mode: TCheckBox
      Left = 1
      Top = 33
      Width = 182
      Height = 15
      Caption = #1056#1072#1073#1086#1090#1072' '#1074' '#1087#1072#1082#1077#1090#1085#1086#1084' '#1088#1077#1078#1080#1084#1077
      Checked = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
      State = cbChecked
      TabOrder = 7
      OnClick = chkPacket_ModeClick
    end
    object chkPacket_: TCheckBox
      Left = 186
      Top = 34
      Width = 70
      Height = 15
      Caption = #1055#1072#1082#1077#1090
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      Visible = False
    end
    object Button1: TButton
      Left = 720
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 11
      Visible = False
      OnClick = Button1Click
    end
  end
  object pnStatus: TPanel
    Left = 0
    Top = 80
    Width = 800
    Height = 25
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object pnErrorInfo: TPanel
    Left = 0
    Top = 59
    Width = 800
    Height = 21
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object pnStatus2: TPanel
    Left = 0
    Top = 105
    Width = 800
    Height = 2
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object pgcSET: TPageControl
    Left = 0
    Top = 107
    Width = 800
    Height = 125
    ActivePage = ts1
    Align = alClient
    Constraints.MinHeight = 60
    Constraints.MinWidth = 800
    MultiLine = True
    TabHeight = 1
    TabOrder = 4
    TabPosition = tpLeft
    TabWidth = 1
    object ts1: TTabSheet
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1084#1086#1076#1077#1084#1072' '#1087#1072#1082#1077#1090#1085#1086#1075#1086' '#1088#1077#1078#1080#1084#1072
      Enabled = False
      object Access: TcxComboBox
        Left = 440
        Top = 24
        Width = 94
        Height = 22
        Enabled = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.DropDownRows = 11
        Properties.Items.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          #1087#1088#1103#1084#1086#1081' '#1074#1099#1093#1086#1076)
        TabOrder = 1
        Visible = False
      end
      object Phone_Number: TcxMaskEdit
        Left = 435
        Top = 0
        Width = 172
        Height = 22
        Enabled = False
        TabOrder = 2
        Text = 'Phone_Number'
        Visible = False
      end
      object DeviceList: TcxListBox
        Left = 634
        Top = 0
        Width = 157
        Height = 117
        Align = alRight
        Columns = 1
        Constraints.MinHeight = 60
        Constraints.MinWidth = 10
        ExtendedSelect = False
        ItemHeight = 16
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -13
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Visible = False
      end
      object lstDeviceListAll: TcxListBox
        Left = 742
        Top = 189
        Width = 123
        Height = 84
        Columns = 1
        Constraints.MinHeight = 60
        Constraints.MinWidth = 10
        ItemHeight = 16
        ParentColor = False
        ParentFont = False
        Style.Color = 16777088
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -13
        Style.Font.Name = 'Arial'
        Style.Font.Style = []
        TabOrder = 4
        Visible = False
      end
      object lstDeviceList_DeviceType: TcxListBox
        Left = 743
        Top = 98
        Width = 122
        Height = 87
        Columns = 1
        Constraints.MinHeight = 60
        Constraints.MinWidth = 10
        ItemHeight = 16
        ParentColor = False
        ParentFont = False
        Style.Color = 65408
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -13
        Style.Font.Name = 'Arial'
        Style.Font.Style = []
        TabOrder = 5
        Visible = False
      end
      object lstDevicelist_ID: TcxListBox
        Left = 744
        Top = 11
        Width = 122
        Height = 86
        Columns = 1
        Constraints.MinHeight = 60
        Constraints.MinWidth = 10
        ItemHeight = 16
        ParentColor = False
        ParentFont = False
        Style.Color = 8454143
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -13
        Style.Font.Name = 'Arial'
        Style.Font.Style = []
        TabOrder = 6
        Visible = False
      end
      object rgTone_Pulse: TRadioGroup
        Left = 440
        Top = 48
        Width = 129
        Height = 49
        Caption = #1085#1072#1073#1086#1088
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          #1080#1084#1087#1091#1083#1100#1089#1085#1099#1081
          #1090#1086#1085#1072#1083#1100#1085#1099#1081' ')
        TabOrder = 0
        Visible = False
      end
      object grid: TDBGridEh
        Left = 0
        Top = 0
        Width = 634
        Height = 117
        Align = alClient
        AutoFitColWidths = True
        BorderStyle = bsNone
        Color = clBtnFace
        DataSource = dsVT
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = RUSSIAN_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Arial'
        FooterFont.Style = []
        HorzScrollBar.Visible = False
        Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 7
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        VertScrollBar.VisibleMode = sbNeverShowEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'Name'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 10485760
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Footers = <>
            Width = 158
          end
          item
            EditButtons = <>
            FieldName = 'ResultText'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 10485760
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Footers = <>
            Width = 635
          end
          item
            EditButtons = <>
            FieldName = 'Eksp_ID'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'Device_Type'
            Footers = <>
            Visible = False
            Width = 0
          end
          item
            EditButtons = <>
            FieldName = 'Address'
            Footers = <>
            Visible = False
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'Channel'
            Footers = <>
            Visible = False
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'Size_Current'
            Footers = <>
            Visible = False
            Width = 98
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #1055#1072#1082#1077#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 1
      object lstlb: TListBox
        Left = 0
        Top = 0
        Width = 791
        Height = 117
        Align = alClient
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 104
    Top = 64
  end
  object Timer: TTimer
    Enabled = False
    Interval = 180000
    OnTimer = TimerTimer
    Left = 64
    Top = 56
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 54
  end
  object prpstrgh1: TPropStorageEh
    Section = 'master'
    StorageManager = MainForm.RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Left'
      '<P>.Top')
    Left = 189
    Top = 182
  end
  object VT: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'Name'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'Eksp_ID'
        DataType = ftInteger
      end
      item
        Name = 'Device_Type'
        DataType = ftSmallint
      end
      item
        Name = 'Address'
        DataType = ftInteger
      end
      item
        Name = 'ResultText'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'Channel'
        DataType = ftInteger
      end
      item
        Name = 'Size_Current'
        DataType = ftLargeint
      end>
    Left = 341
    Top = 167
    Data = {
      0300070004004E616D6501004000000000000700456B73705F49440300000000
      0000000B004465766963655F5479706502000000000000000700416464726573
      7303000000000000000A00526573756C74546578740100000100000000070043
      68616E6E656C03000000000000000C0053697A655F43757272656E7419000000
      00000000000000000000}
    object VTName: TStringField
      DisplayWidth = 17
      FieldName = 'Name'
      OnGetText = VTNameGetText
      Size = 64
    end
    object VTEksp_ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'Eksp_ID'
    end
    object VTDevice_Type: TSmallintField
      DisplayWidth = 10
      FieldName = 'Device_Type'
    end
    object VTAddress: TIntegerField
      DisplayWidth = 10
      FieldName = 'Address'
    end
    object VTChannel: TIntegerField
      FieldName = 'Channel'
      OnGetText = VTChannelGetText
    end
    object VTResultText: TStringField
      DisplayWidth = 256
      FieldName = 'ResultText'
      Size = 256
    end
    object VTSize_Current: TLargeintField
      FieldName = 'Size_Current'
    end
  end
  object dsVT: TDataSource
    DataSet = VT
    Left = 365
    Top = 271
  end
end
