inherited MenuForm: TMenuForm
  Caption = 'Gemis_2004  MenuForm'
  Menu = MainMenu
  OldCreateOrder = True
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object MainMenu: TMainMenu
    Left = 164
    Top = 20
    object miFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object miClose: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = miCloseClick
      end
    end
    object miHelp: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object miHelpAbout: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = miHelpAboutClick
      end
    end
  end
end
