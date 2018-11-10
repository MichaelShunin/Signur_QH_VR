object Form1: TForm1
  Left = 232
  Top = 106
  Width = 507
  Height = 432
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Button2: TButton
    Left = 246
    Top = 286
    Width = 92
    Height = 30
    Hint = 'Puts matrix b = [5 5 5 5; 4 4 4 4] to workspace'
    Caption = 'PutMatrix'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 59
    Top = 286
    Width = 92
    Height = 30
    Hint = 'Runs the Peaks demo plot'
    Caption = 'Plot peaks'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Button3Click
  end
  object GroupBox1: TGroupBox
    Left = 20
    Top = 20
    Width = 365
    Height = 237
    Caption = 'Demo GetFullMatrix Function'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 10
      Top = 30
      Width = 239
      Height = 16
      Caption = 'Gets predefined matix a from workspace'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object StringGrid1: TStringGrid
      Left = 20
      Top = 59
      Width = 326
      Height = 129
      ColCount = 4
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssNone
      TabOrder = 0
    end
    object Button1: TButton
      Left = 128
      Top = 197
      Width = 92
      Height = 31
      Hint = 'Gets a = [1 2 3 4; 5 6 7 8] from workspace'
      Caption = 'GetMatrix'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
