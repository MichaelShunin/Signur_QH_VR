object QpFilterFrame: TQpFilterFrame
  Left = 0
  Top = 0
  Width = 160
  Height = 55
  TabOrder = 0
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 4
    Height = 55
    Align = alLeft
    Style = bsRaised
  end
  object FilterLabel: TLabel
    Left = 8
    Top = 6
    Width = 116
    Height = 13
    Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1074#1099#1073#1086#1088#1082#1080':'
  end
  object FilterCombo: TComboBox
    Left = 8
    Top = 28
    Width = 150
    Height = 21
    BevelKind = bkFlat
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = '<'#1053#1077#1090' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1081'>'
    OnChange = FilterComboChange
    OnDropDown = FilterComboDropDown
    Items.Strings = (
      '<'#1053#1077#1090' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1081'>'
      '<'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100'...>')
  end
end
