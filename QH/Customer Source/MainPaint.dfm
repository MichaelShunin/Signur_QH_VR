object Form1: TForm1
  Left = 154
  Top = 172
  Width = 778
  Height = 359
  Caption = 'MyPaint'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 770
    Height = 21
    Align = alTop
    Alignment = taCenter
    Caption = #1042#1085#1077#1096#1085#1080#1081' '#1074#1080#1076' '#1084#1072#1075#1085#1080#1090#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object PaintBox1: TPaintBox
    Left = 297
    Top = 21
    Width = 473
    Height = 304
    Align = alClient
    Color = clActiveBorder
    ParentColor = False
    ParentShowHint = False
    ShowHint = False
    OnPaint = PaintBox1Paint
  end
  object Panel1: TPanel
    Left = 0
    Top = 21
    Width = 297
    Height = 304
    Align = alLeft
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 295
      Height = 302
      Align = alClient
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 293
        Height = 80
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object rgTypeOfImage: TRadioGroup
          Left = 0
          Top = 45
          Width = 293
          Height = 33
          Align = alTop
          Caption = #1088#1077#1078#1080#1084' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            #1073#1077#1079' '#1088#1072#1079#1084#1077#1088#1086#1074
            #1089' '#1088#1072#1079#1084#1077#1088#1072#1084#1080)
          TabOrder = 0
          Visible = False
          OnClick = rgTypeOfImageClick
        end
        object rgTypeOfSystem: TRadioGroup
          Left = 0
          Top = 0
          Width = 293
          Height = 45
          Align = alTop
          Caption = #1090#1080#1087' '#1089#1080#1089#1090#1077#1084#1099
          Columns = 2
          ItemIndex = 2
          Items.Strings = (
            #1087#1072#1079#1099' '#1088#1086#1090#1086#1088#1072
            #1087#1072#1079#1099' '#1089#1090#1072#1090#1086#1088#1072
            #1075#1083#1072#1074#1085#1099#1077' '#1088#1072#1079#1084#1077#1088#1099)
          TabOrder = 1
          OnClick = rgTypeOfSystemClick
        end
      end
      object pnRotorStator: TPanel
        Left = 1
        Top = 81
        Width = 293
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label3: TLabel
          Left = 9
          Top = 1
          Width = 83
          Height = 16
          Caption = #1087#1072#1079#1099' '#1088#1086#1090#1086#1088#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label4: TLabel
          Left = 8
          Top = 22
          Width = 89
          Height = 16
          Caption = #1087#1072#1079#1099' '#1089#1090#1072#1090#1086#1088#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object cbRotor: TComboBox
          Left = 98
          Top = 0
          Width = 188
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = #1082#1088#1091#1075#1083#1099#1081' '#1079#1072#1082#1088#1099#1090#1099#1081
          Visible = False
          OnChange = cbRotorChange
          Items.Strings = (
            #1082#1088#1091#1075#1083#1099#1081' '#1079#1072#1082#1088#1099#1090#1099#1081
            #1082#1088#1091#1075#1083#1099#1081' '#1087#1086#1083#1091#1079#1072#1082#1088#1099#1090#1099#1081
            #1086#1074#1072#1083#1100#1085#1099#1081' '#1079#1072#1082#1088#1099#1090#1099#1081
            #1086#1074#1072#1083#1100#1085#1099#1081' '#1087#1086#1083#1091#1079#1072#1082#1088#1099#1090#1099#1081
            #1090#1088#1072#1087#1077#1094#1077#1080#1076#1072#1083#1100#1085#1099#1081' '#1087#1086#1083#1091#1079#1072#1082#1088#1099#1090#1099#1081
            #1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1099#1081' '#1087#1086#1083#1091#1079#1072#1082#1088#1099#1090#1099#1081)
        end
        object cbStator: TComboBox
          Left = 98
          Top = 20
          Width = 188
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = #1086#1074#1072#1083#1100#1085#1099#1081
          Visible = False
          OnChange = cbStatorChange
          Items.Strings = (
            #1086#1074#1072#1083#1100#1085#1099#1081
            #1087#1086#1083#1091#1086#1074#1072#1083#1100#1085#1099#1081
            #1090#1088#1072#1087#1077#1094#1077#1080#1076#1072#1083#1100#1085#1099#1081
            #1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1099#1081' '#1086#1090#1082#1088#1099#1090#1099#1081
            #1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1099#1081' '#1087#1086#1083#1091#1079#1072#1082#1088#1099#1090#1099#1081)
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 112
        Width = 293
        Height = 189
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Label5: TLabel
          Left = 18
          Top = 4
          Width = 32
          Height = 13
          Caption = 'Label5'
          Visible = False
        end
        object Label6: TLabel
          Left = 18
          Top = 28
          Width = 32
          Height = 13
          Caption = 'Label6'
          Visible = False
        end
        object Label7: TLabel
          Left = 18
          Top = 50
          Width = 32
          Height = 13
          Caption = 'Label7'
          Visible = False
        end
        object Label8: TLabel
          Left = 111
          Top = 4
          Width = 32
          Height = 13
          Caption = 'Label8'
          Visible = False
        end
        object Label9: TLabel
          Left = 111
          Top = 28
          Width = 32
          Height = 13
          Caption = 'Label9'
          Visible = False
        end
        object Label10: TLabel
          Left = 111
          Top = 50
          Width = 38
          Height = 13
          Caption = 'Label10'
          Visible = False
        end
        object Label11: TLabel
          Left = 210
          Top = 4
          Width = 38
          Height = 13
          Caption = 'Label11'
          Visible = False
        end
        object Label12: TLabel
          Left = 210
          Top = 28
          Width = 38
          Height = 13
          Caption = 'Label12'
          Visible = False
        end
        object Label13: TLabel
          Left = 210
          Top = 50
          Width = 38
          Height = 13
          Caption = 'Label13'
          Visible = False
        end
        object Edit1: TEdit
          Left = 50
          Top = 4
          Width = 40
          Height = 24
          TabOrder = 0
          Text = 'Edit1'
          Visible = False
        end
        object Edit2: TEdit
          Left = 50
          Top = 28
          Width = 40
          Height = 24
          TabOrder = 1
          Text = 'Edit2'
          Visible = False
        end
        object Edit3: TEdit
          Left = 50
          Top = 50
          Width = 40
          Height = 24
          TabOrder = 2
          Text = 'Edit3'
          Visible = False
        end
        object Edit4: TEdit
          Left = 143
          Top = 4
          Width = 41
          Height = 24
          TabOrder = 3
          Text = 'Edit4'
          Visible = False
        end
        object Edit5: TEdit
          Left = 143
          Top = 28
          Width = 41
          Height = 24
          TabOrder = 4
          Text = 'Edit5'
          Visible = False
        end
        object Edit6: TEdit
          Left = 143
          Top = 50
          Width = 41
          Height = 24
          TabOrder = 5
          Text = 'Edit6'
          Visible = False
        end
        object Edit7: TEdit
          Left = 246
          Top = 4
          Width = 41
          Height = 24
          TabOrder = 6
          Text = 'Edit7'
          Visible = False
        end
        object Edit8: TEdit
          Left = 246
          Top = 28
          Width = 41
          Height = 24
          TabOrder = 7
          Text = 'Edit8'
          Visible = False
        end
        object Edit9: TEdit
          Left = 246
          Top = 50
          Width = 41
          Height = 24
          TabOrder = 8
          Text = 'Edit9'
          Visible = False
        end
        object Button1: TButton
          Left = 44
          Top = 76
          Width = 183
          Height = 25
          Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100' '#1080'  '#1086#1090#1086#1073#1088#1072#1079#1080#1090#1100
          TabOrder = 9
          Visible = False
          OnClick = Button1Click
        end
      end
    end
  end
end
