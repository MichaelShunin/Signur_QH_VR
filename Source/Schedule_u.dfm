inherited ScheduleForm: TScheduleForm
  Left = 24
  Top = 128
  Width = 1001
  Height = 517
  Caption = #1046#1091#1088#1085#1072#1083' '#1072#1074#1090#1086#1086#1073#1088#1072#1097#1077#1085#1080#1081
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 0
    Top = 373
    Width = 985
    Height = 13
    Align = alBottom
    Caption = #1051#1086#1075' '#1086#1073#1088#1072#1097#1077#1085#1080#1103' '#1082' '#1087#1088#1080#1073#1086#1088#1091
    Color = 10930928
    ParentColor = False
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 985
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 165
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1060#1080#1083#1100#1090#1088' '#1076#1072#1090' '#1086#1073#1088#1072#1097#1077#1085#1080#1081' '#1086#1090':'
    end
    object Label2: TLabel
      Left = 2
      Top = 27
      Width = 165
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = ' '#1076#1086':'
    end
    object D1: TDateTimePicker
      Left = 173
      Top = 3
      Width = 77
      Height = 24
      Date = 39027.548365879630000000
      Time = 39027.548365879630000000
      TabOrder = 0
    end
    object D2: TDateTimePicker
      Left = 172
      Top = 25
      Width = 77
      Height = 24
      Date = 39027.548365879630000000
      Time = 39027.548365879630000000
      TabOrder = 1
    end
    object btnShowSchedule: TcxButton
      Tag = 2
      Left = 258
      Top = 11
      Width = 315
      Height = 26
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1072#1074#1090#1086#1086#1073#1088#1072#1097#1077#1085#1080#1081
      TabOrder = 2
      WordWrap = True
      OnClick = btnShowScheduleClick
      LookAndFeel.Kind = lfStandard
    end
    object cbSchedule: TCheckBox
      Left = 598
      Top = 20
      Width = 163
      Height = 13
      Caption = #1072#1074#1090#1086#1086#1073#1088#1072#1097#1077#1085#1080#1103' '#1074#1082#1083#1102#1095#1077#1085#1099
      TabOrder = 3
      OnClick = cbScheduleClick
    end
  end
  object DBMemo1: TDBMemo [2]
    Left = 0
    Top = 386
    Width = 985
    Height = 72
    Align = alBottom
    DataField = 'LOG'
    DataSource = ds_schedule
    TabOrder = 1
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
    Enabled = False
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 712
    Top = 152
  end
  object auto_sch: TIBQuery
    Database = DM.DB
    Transaction = DM.TA
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
