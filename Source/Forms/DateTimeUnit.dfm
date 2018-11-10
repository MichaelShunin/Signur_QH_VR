object DateTimeFrame: TDateTimeFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 55
  AutoScroll = False
  TabOrder = 0
  object LimitBevel: TBevel
    Left = 0
    Top = 0
    Width = 4
    Height = 55
    Align = alLeft
    Style = bsRaised
  end
  object FromLabel: TLabel
    Left = 8
    Top = 6
    Width = 31
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1054#1090':'
    Visible = False
  end
  object ToLabel: TLabel
    Left = 8
    Top = 31
    Width = 31
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1044#1086':'
    Visible = False
  end
  object FromDatePicker: TDateTimePicker
    Left = 48
    Top = 3
    Width = 97
    Height = 21
    Date = 37987.577442303240000000
    Time = 37987.577442303240000000
    TabOrder = 1
    OnCloseUp = FromDatePickerCloseUp
    OnChange = FromDatePickerChange
    OnKeyPress = FromDatePickerKeyPress
  end
  object ToDatePicker: TDateTimePicker
    Left = 48
    Top = 27
    Width = 97
    Height = 21
    Date = 37987.577442303240000000
    Time = 37987.577442303240000000
    TabOrder = 4
    OnCloseUp = ToDatePickerCloseUp
    OnChange = ToDatePickerChange
    OnKeyPress = FromDatePickerKeyPress
  end
  object FromTimePicker: TDateTimePicker
    Left = 152
    Top = 3
    Width = 73
    Height = 21
    Date = 38027.000000000000000000
    Format = 'HH:mm'
    Time = 38027.000000000000000000
    Kind = dtkTime
    TabOrder = 2
    OnChange = FromTimePickerChange
    OnExit = FromTimePickerExit
    OnKeyPress = FromDatePickerKeyPress
  end
  object ToTimePicker: TDateTimePicker
    Left = 152
    Top = 27
    Width = 73
    Height = 21
    Date = 38027.000000000000000000
    Format = 'HH:mm'
    Time = 38027.000000000000000000
    Kind = dtkTime
    TabOrder = 5
    OnChange = ToTimePickerChange
    OnExit = ToTimePickerExit
    OnKeyPress = FromDatePickerKeyPress
  end
  object FromCheck: TCheckBox
    Left = 8
    Top = 6
    Width = 39
    Height = 17
    Caption = #1054#1090':'
    TabOrder = 0
    OnClick = FromCheckClick
    OnKeyPress = FromDatePickerKeyPress
  end
  object ToCheck: TCheckBox
    Left = 8
    Top = 30
    Width = 39
    Height = 17
    Caption = #1044#1086':'
    TabOrder = 3
    OnClick = ToCheckClick
    OnKeyPress = FromDatePickerKeyPress
  end
end
