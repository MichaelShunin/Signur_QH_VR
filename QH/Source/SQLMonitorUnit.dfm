inherited SQLMonitor: TSQLMonitor
  Left = 27
  Top = 140
  Width = 882
  Height = 365
  Caption = 'SQL- '#1084#1086#1085#1080#1090#1086#1088
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 864
    Height = 79
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object chbOnOff: TCheckBox
      Left = 9
      Top = 9
      Width = 202
      Height = 16
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083' '#1084#1086#1085#1080#1090#1086#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = chbOnOffClick
    end
    object chbStayOnTop: TCheckBox
      Left = 218
      Top = 7
      Width = 163
      Height = 16
      Caption = 'Stay on top'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = chbStayOnTopClick
    end
    object Button1: TButton
      Left = 430
      Top = 10
      Width = 160
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 430
      Top = 43
      Width = 160
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button2Click
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 32
      Width = 377
      Height = 39
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1074' '#1083#1086#1075':'
      TabOrder = 4
      object chbFetch: TCheckBox
        Left = 8
        Top = 18
        Width = 85
        Height = 17
        Caption = 'Fetch'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = chbFetchClick
      end
      object chbPrepare: TCheckBox
        Left = 138
        Top = 18
        Width = 94
        Height = 17
        Caption = 'Prepare'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = chbPrepareClick
      end
      object chbTransaction: TCheckBox
        Left = 269
        Top = 18
        Width = 102
        Height = 17
        Caption = 'Transaction'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = chbTransactionClick
      end
    end
  end
  object memoText: TMemo
    Left = 0
    Top = 79
    Width = 864
    Height = 243
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'sql'
    Filter = '*.sql'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 496
    Top = 90
  end
  object IBSQLMonitor: TIBSQLMonitor
    OnSQL = IBSQLMonitorSQL
    TraceFlags = [tfQPrepare, tfQExecute, tfQFetch, tfConnect, tfTransact]
    Enabled = False
    Left = 124
    Top = 150
  end
end
