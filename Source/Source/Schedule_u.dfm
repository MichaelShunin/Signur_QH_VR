inherited ScheduleForm: TScheduleForm
  Left = 42
  Top = 175
  Width = 1001
  Height = 517
  Caption = #1046#1091#1088#1085#1072#1083' '#1072#1074#1090#1086#1086#1073#1088#1072#1097#1077#1085#1080#1081
  PixelsPerInch = 120
  TextHeight = 16
  object Label3: TLabel [0]
    Left = 0
    Top = 347
    Width = 993
    Height = 16
    Align = alBottom
    Caption = #1051#1086#1075' '#1086#1073#1088#1072#1097#1077#1085#1080#1103' '#1082' '#1087#1088#1080#1073#1086#1088#1091
    Color = 10930928
    ParentColor = False
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 993
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 3
      Width = 204
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1060#1080#1083#1100#1090#1088' '#1076#1072#1090' '#1086#1073#1088#1072#1097#1077#1085#1080#1081' '#1086#1090':'
    end
    object Label2: TLabel
      Left = 2
      Top = 33
      Width = 204
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = ' '#1076#1086':'
    end
    object D1: TDateTimePicker
      Left = 213
      Top = 4
      Width = 95
      Height = 24
      Date = 39027.548365879630000000
      Time = 39027.548365879630000000
      TabOrder = 0
    end
    object D2: TDateTimePicker
      Left = 212
      Top = 31
      Width = 95
      Height = 24
      Date = 39027.548365879630000000
      Time = 39027.548365879630000000
      TabOrder = 1
    end
    object btnShowSchedule: TcxButton
      Tag = 2
      Left = 318
      Top = 14
      Width = 387
      Height = 32
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1072#1074#1090#1086#1086#1073#1088#1072#1097#1077#1085#1080#1081
      TabOrder = 2
      WordWrap = True
      OnClick = btnShowScheduleClick
      LookAndFeel.Kind = lfStandard
    end
    object cbSchedule: TCheckBox
      Left = 736
      Top = 24
      Width = 201
      Height = 17
      Caption = #1072#1074#1090#1086#1086#1073#1088#1072#1097#1077#1085#1080#1103' '#1074#1082#1083#1102#1095#1077#1085#1099
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = cbScheduleClick
    end
  end
  inline DbGridFrame3: TDbGridFrame [2]
    Left = 0
    Top = 62
    Width = 993
    Height = 285
    Align = alClient
    AutoScroll = False
    TabOrder = 1
    inherited Grid: TDBGridEh
      Width = 813
      Height = 285
      AllowedOperations = [alopUpdateEh]
      AllowedSelections = [gstRecordBookmarks]
      DataSource = ds_schedule
      EditActions = [geaSelectAllEh]
      FixedColor = 16776176
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ReadOnly = False
      SortLocal = True
      OnGetCellParams = DbGridFrame3GridGetCellParams
      Columns = <
        item
          DisplayFormat = 'dd.mm.yy  hh:mm'
          EditButtons = <>
          FieldName = 'ACTION_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1086#1073#1088#1072#1097#1077#1085#1080#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clActiveCaption
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 93
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'EKSP_HEADER'
          Footers = <>
          ImeName = '2'
          Title.Caption = #1055#1088#1080#1073#1086#1088
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clActiveCaption
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'ACTION_MODE'
          Footers = <>
          ImeName = 'day_night'
          Title.Caption = #1056#1077#1078#1080#1084' '#1095#1090#1077#1085#1080#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clActiveCaption
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 157
        end
        item
          EditButtons = <>
          FieldName = 'CURRENT_VALUE'
          Footers = <>
          ImeName = '3'
          Title.Caption = #1055#1088#1086#1095#1080#1090#1072#1085#1086'|'#1090#1077#1082#1091#1097#1077#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clActiveCaption
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 92
        end
        item
          EditButtons = <>
          FieldName = 'MAX_VALUE'
          Footers = <>
          ImeName = '5'
          Title.Caption = #1055#1088#1086#1095#1080#1090#1072#1085#1086'|'#1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clActiveCaption
          Title.Font.Height = -13
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 96
        end
        item
          EditButtons = <>
          FieldName = 'LOG'
          Footers = <>
          Width = 260
        end>
    end
    inherited ToolPanel: TPanel
      Height = 285
      inherited Bevel: TBevel
        Height = 264
      end
    end
    inherited Image24: TImageList [2]
      Top = 116
    end
  end
  object DBMemo1: TDBMemo
    Left = 0
    Top = 363
    Width = 993
    Height = 89
    Align = alBottom
    DataField = 'LOG'
    DataSource = ds_schedule
    TabOrder = 2
  end
  inherited MainMenu: TMainMenu
    Left = 436
    Top = 132
    object N1: TMenuItem [0]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = miCloseClick
    end
    inherited miFile: TMenuItem
      Visible = False
    end
    inherited miHelp: TMenuItem
      Visible = False
    end
    object N2: TMenuItem
      Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077
      object miRecreateSchedule: TMenuItem
        Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077
        OnClick = miRecreateScheduleClick
      end
      object N3: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1087#1091#1097#1077#1085#1085#1099#1077
        OnClick = N3Click
      end
    end
  end
  object schedule: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select s.* , e.EKSP_HEADER, e.sch_mode'
      'from schedule s,  eksp e'
      ' where'
      's.action_date between :d1 and :d2 '
      'and e.eksp_nomer = s.eksp_nomer'
      ''
      'order by s.action_date'
      ' ')
    Left = 432
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'd1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'd2'
        ParamType = ptUnknown
      end>
    object scheduleID: TIntegerField
      FieldName = 'ID'
      Origin = '"SCHEDULE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object scheduleEKSP_NOMER: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"SCHEDULE"."EKSP_NOMER"'
      Required = True
    end
    object scheduleACTION_DATE: TDateTimeField
      FieldName = 'ACTION_DATE'
      Origin = '"SCHEDULE"."ACTION_DATE"'
    end
    object scheduleACTION_MODE: TSmallintField
      FieldName = 'ACTION_MODE'
      Origin = '"SCHEDULE"."ACTION_MODE"'
      OnGetText = scheduleACTION_MODEGetText
    end
    object scheduleMAX_VALUE: TFloatField
      FieldName = 'MAX_VALUE'
      Origin = '"SCHEDULE"."MAX_VALUE"'
    end
    object scheduleCURRENT_VALUE: TFloatField
      FieldName = 'CURRENT_VALUE'
      Origin = '"SCHEDULE"."CURRENT_VALUE"'
    end
    object scheduleLOG: TIBStringField
      FieldName = 'LOG'
      Origin = '"SCHEDULE"."LOG"'
      Size = 2048
    end
    object scheduleEKSP_HEADER: TIBStringField
      FieldName = 'EKSP_HEADER'
      Origin = '"EKSP"."EKSP_HEADER"'
      Size = 64
    end
    object scheduleSCH_MODE: TSmallintField
      FieldName = 'SCH_MODE'
      Origin = '"EKSP"."SCH_MODE"'
    end
  end
  object ds_schedule: TDataSource
    AutoEdit = False
    DataSet = schedule
    Left = 512
    Top = 248
  end
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 712
    Top = 152
  end
  object auto_sch: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select s.* , e.EKSP_HEADER, e.sch_mode'
      'from schedule s,  eksp e'
      ' where'
      's.action_date between :d1 and :d2  and '
      's.log is null'
      'and e.eksp_nomer = s.eksp_nomer'
      ''
      'order by s.action_date')
    UpdateObject = update_Auto_SCH
    Left = 712
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'd1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'd2'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Origin = '"SCHEDULE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'EKSP_NOMER'
      Origin = '"SCHEDULE"."EKSP_NOMER"'
      Required = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'ACTION_DATE'
      Origin = '"SCHEDULE"."ACTION_DATE"'
    end
    object SmallintField1: TSmallintField
      FieldName = 'ACTION_MODE'
      Origin = '"SCHEDULE"."ACTION_MODE"'
      OnGetText = scheduleACTION_MODEGetText
    end
    object FloatField1: TFloatField
      FieldName = 'MAX_VALUE'
      Origin = '"SCHEDULE"."MAX_VALUE"'
    end
    object FloatField2: TFloatField
      FieldName = 'CURRENT_VALUE'
      Origin = '"SCHEDULE"."CURRENT_VALUE"'
    end
    object IBStringField1: TIBStringField
      FieldName = 'LOG'
      Origin = '"SCHEDULE"."LOG"'
      Size = 2048
    end
    object IBStringField2: TIBStringField
      FieldName = 'EKSP_HEADER'
      Origin = '"EKSP"."EKSP_HEADER"'
      Size = 64
    end
    object SmallintField2: TSmallintField
      FieldName = 'SCH_MODE'
      Origin = '"EKSP"."SCH_MODE"'
    end
  end
  object update_Auto_SCH: TIBUpdateSQL
    ModifySQL.Strings = (
      'update schedule set '
      ' log = :log,'
      'CURRENT_VALUE = :CURRENT_VALUE,'
      'MAX_VALUE = :MAX_VALUE'
      'where'
      ' id = :id')
    Left = 800
    Top = 216
  end
end
