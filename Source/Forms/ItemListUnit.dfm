inherited ItemListForm: TItemListForm
  Left = 151
  Top = 175
  Width = 577
  Height = 327
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'ItemListForm'
  Constraints.MinWidth = 300
  KeyPreview = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolPanel: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 52
    Align = alTop
    BevelOuter = bvNone
    Color = clSkyBlue
    TabOrder = 0
    object ToolBar: TToolBar
      Left = 0
      Top = 0
      Width = 171
      Height = 52
      Align = alLeft
      AutoSize = True
      ButtonHeight = 52
      ButtonWidth = 57
      EdgeBorders = []
      Flat = True
      Images = ToolImages
      ShowCaptions = True
      TabOrder = 0
      Transparent = True
      object AddBtn: TToolButton
        Left = 0
        Top = 0
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = AddBtnClick
      end
      object OpenBtn: TToolButton
        Left = 57
        Top = 0
        Caption = #1054#1090#1082#1088#1099#1090#1100
        ImageIndex = 1
        OnClick = OpenBtnClick
      end
      object DelBtn: TToolButton
        Left = 114
        Top = 0
        Caption = #1059#1076#1072#1083#1080#1090#1100
        ImageIndex = 2
        OnClick = DelBtnClick
      end
    end
  end
  object Panel: TPanel
    Left = 0
    Top = 52
    Width = 569
    Height = 222
    Align = alClient
    TabOrder = 1
    inline GridFrame: TDbGridFrame
      Left = 1
      Top = 1
      Width = 567
      Height = 220
      Align = alClient
      AutoScroll = False
      TabOrder = 0
      inherited Grid: TDBGridEh
        Width = 410
        Height = 195
        FooterFont.Charset = RUSSIAN_CHARSET
        FooterFont.Name = 'Tahoma'
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Name = 'Tahoma'
        OnDblClick = GridFrameGridDblClick
        OnKeyDown = GridFrameGridKeyDown
      end
      inherited ToolPanel: TPanel
        Height = 195
        inherited Label2: TLabel
          Width = 52
        end
        inherited SimilarityLabel: TLabel
          Width = 49
        end
        inherited Bevel: TBevel
          Height = 195
        end
        inherited Label4: TLabel
          Width = 11
        end
      end
      inherited TopPanel: TPanel
        Width = 567
        inherited Navigator: TDBNavigator
          Width = 510
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        end
      end
      inherited ViewsPanel: TPanel
        Left = 525
        Height = 195
        inherited Bevel1: TBevel
          Height = 193
        end
      end
      inherited DataSource: TDataSource
        OnDataChange = GridFrameDataSourceDataChange
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 274
    Width = 569
    Height = 19
    Panels = <>
  end
  object ToolImages: TImageList
    Height = 32
    Width = 32
    Left = 188
    Top = 12
    Bitmap = {
      494C010103000400040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001001000000000000020
      000000000000000000000000000000000000000000000000000000000212A001
      A001A001A0010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000212C31A
      A216A10EA0011042104210421042104210421042104210421042104210421042
      1042104210421042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A29
      1042104210421042104210421042104210421042104210421042104210421042
      1042104210421042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000212C31A
      A216A10EA0011863186318631863186318631863186318631863186318631863
      186318631863186318631863186310420000000000000000FF7FDE7BDE7BFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A29
      734E186318631863186318631863186318631863186318631863186318631863
      1863186318631863186318631863104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000212E422
      C31AA216A001FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F10420000000000000000DE7B5A6B18633967
      7B6F9C73DE7BFF7FFF7FFF7F0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000BD779C73
      9C73DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FDE7BBD77FF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000212052B
      E422C31AA001CE39CE39734E734E734E734E734E734E734EFF7FCE39734E734E
      CE39734E734E734E734EFF7FFF7F1042000000000000FF7F5673905ACD39AD35
      EF3D734ED65A18637B6F9C73BD77FF7FFF7FFF7F000000000000000000000000
      00000000000000000000000000000000000000000000000000009C73CE396B2D
      8C319452DE7BCE39CE39734E734E734E734E734E734E734EFF7FCE39734E734E
      CE39FF7F7B6F9452524ABD77FF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000021202120212021202120212052F
      052BE422A001A001A001A001A001A001FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1042000000000000FF7F0E6FEA6EE96E015A
      C449A73D8A358C31EF3D524AB55618635A6B9C73BD77DE7BFF7FFF7FFF7F0000
      000000000000000000000000000000000000000000000000FF7F266C056C056C
      8648CE399C73FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      BD77B65EE954465CCE399C73FF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000212A943893F683B473B46372633
      052F052BE422C31AA216A212A10E0212CE39734E734EFF7FCE39734EFF7FCE39
      734E734E734E734E734EFF7FFF7F1042000000000000FF7F0E6F0C73DB7F4D7F
      0A7BC672A36E415EE34DA63D89358C31CE3931469452F75E5A6B9C73BD77DE7B
      FF7FFF7F0000000000000000000000000000000000000000BE7F056C056C056C
      25644A29B556DE7B734E734E734EFF7FCE39734E734EFF7FCE39734EFF7F9C73
      D0552664056C056C1863FF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000212AA47A943893F683B473B4737
      2633052F052BE422C31AA216A2160212FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1042000000000000FF7F0E6FC77200006F7F
      6E7F6E7F6E7F6E7F2B7BE876A46E4162E251A54188358C31AD351042734EF75E
      5A6B9C73DE7BFF7F00000000000000000000000000000000BE7FAA70056C056C
      056CA73CAD355A6BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F7B6F2B5D
      056C056C6768B66EFF7FFF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000212CB47AA47A943893F683B473B
      47372633052F052BE422C31AC31A0212660266026602FF7FCE39CE39734EFF7F
      CE39734E734EFF7FCE39FF7FFF7F1042000000000000FF7FEE6EE9767577B57F
      6E7F6E7F6E7F6E7F6E7F6E7F6E7F6E7F4D7F0977C56E816A0256C44588396B2D
      AD353146F75EDE7B0000000000000000000000000000000000003A7F266C056C
      056C0568082910429C73660266026602660266026602FF7FFF7F5A6BC95C056C
      056CEA605B73FF7FCE39FF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000021202120212021202120212683B
      473B4737021202120212021202120212260366022603FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1042000000000000FF7FEC6A4F7F0E73DA7F
      8F7F8F7F8F7F8F7F8F7F8F7F8F7F8F7F8F7F8F7F8F7F8F7F6E7F2A77E672836A
      015AA73931467B6FFF7F00000000000000004A2910421042104210423A7F266C
      056C056C45584A29734EBD7726036602260366022603FF7F186B6764056C056C
      4D61BD77FF7FFF7FFF7FFF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734E1863186318630212893F
      683B473B02122603E0032603E0032603E0032603E003FF7FCE39CE39734E734E
      734E734E734E734E734EFF7FFF7F1042000000000000FF7FA76A4E7FA66EFE7F
      907F907F907F907F907F907F907F907F907F907F907F907F907F907F907F907F
      6D7F23568C31F75EDE7B00000000000000004A29734E1863186318631863F97A
      056C056C056C664C6B2DB556DE7B2603E0032603FF7F186B6764056C056CAF5D
      BD77734E734E734E734EFF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7FFF7F0212AA43
      893F683B0212E0032603E0032603E0032603E0032603FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1042000000000000FF7FC96A4F7FA46EB97B
      D57FB07FB07FB07FB07FB07FB07FB07FB07FB07FB07FB07FB07FB07FB07FB07F
      4D7F29738735524A9C73FF7F0000000000004A29734EFF7FFF7FFF7FFF7F4A29
      757A056C056C056CA63C8C31F75EDE7B2603FF7F186B6764056C056CAF5DBD77
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7FCE390212AA47
      AA43893F02123F333F333F333F333F333F333F333F33FF7F734E734EFF7FCE39
      734E734E734E734E734EFF7FFF7F1042000000000000FF7FEB6E507FC7763073
      FA7FD17FD17FD17FD17FD17FD17FD17FD17FD17FD17FD17FD17FD17FD17FD17F
      4D7FF37FE44DAD351863DE7B0000000000004A29734EFF7FFF7FCE39CE394A29
      734E757A056C056C056CC734AD351863DE7B186B6764056C056CAF5DBD77CE39
      734E734E734E734E734EFF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7FFF7F0212CB47
      AA47AA430212FF03FF7F3F33FF03FF033F33FF03FF03FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1042000000000000FF7FEB6E517FE97AC76E
      FE7FD27FD27FD27FD27FD27FD27FD27FD27FD27FD27FD27FD27FD27FD27FD27F
      4E7FF67FE86E6931734EBD77FF7F000000004A29734EFF7FFF7FFF7FFF7F4A29
      734EFF7F757A056C056C0568C730AD3573564764056C056CAF5DBD77FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7FCE3902120212
      021202120212FF7FFF7FFF7F3F333F33FF7F3F33FF7FFF7FCE39CE39734E734E
      FF7FCE39734E734EFF7FFF7FFF7F1042000000000000FF7FA66E717F0A7BC672
      DB7FF57FF27FF27FF27FF27FF27FF27FF27FF27FF27FF27FF27FF27FF27FF27F
      6E7FF77FD47FA445CE393967FF7F000000004A29734EFF7FFF7FCE39734E4A29
      734EFF7FFF7F757A056C056C056CC7342560056C056CAF5DBD77CE39734E734E
      FF7FCE39734E734EFF7FFF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7FFF7FFF7F4A29
      734EFF7FFF7FFF03FF7FFF03FF03FF7FFF7FFF7FFF03FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1042000000000000FF7FA56E507F2B7FE97A
      5177FA7FF37FF37FF37FF37FF37FF37FF37FF37FF37FF37FF37FF37FF37FF37F
      6E7FF87FF87FC86A6A31B556BD77000000004A29734EFF7FFF7FFF7FFF7F4A29
      734EFF7FFF7FFF033A7F266C056C056C056C056C0A4D7B6FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7F660266024A29
      734EFF7FFF7FFF03FF03FF03FF03FF03FF7F3F33FF03FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1042000000000000FF7FEB72717F2C7F2C7F
      EB72FE7FF57FF47FF47FF47FF47FF47FF47FF47FF47FF47FF47FF47FF47FF47F
      6E7FF97FF97F937B853DEF3D5A6BFF7F00004A29734EFF7FFF7F660266024A29
      734EFF7FFF7FFF03FF7F126A056C056C056C455C4A29B556BD77FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7F660226034A29
      734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1042000000000000FF7F0B73727F4D7F4D7F
      C67251770000FE7FFC7FFA7FF97FF87FF67FF67FF67FF67FF67FF67FF67FF67F
      6F7FFA7FFA7FFA7F85626B2DD65ADE7B00004A29734EFF7FFF7F660226034A29
      734EFF7FFF7FFF7F186B256C056C056C056C056CC7406B2D734E9C73FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7F2603E0034A29
      1863100010001000100010001000100010001000100010001000100000000000
      00000000000000000000000000001042000000000000DE7B0C73937F6E7F6E7F
      6E7F0977C56E0B73EC6E3073977BDB7FFF7FF97FF87FF87FF87FF87FF87FF87F
      6F7FFC7FFC7FFC7F7177863931467B6FFF7F4A29734EFF7FFF7F2603E0034A29
      18631000FF7F186B6764056C056CEA60A96C056C056C87504A29524A5A6BFF7F
      0000000000000000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7FE00326034A29
      1863100010001000100010001000100010001000100010001000100018631863
      0000186318630000186318630000104200000000000076770C73927F8F7F8F7F
      8F7F8F7F8F7F8F7F8F7F4C7B2A77E8720D73FF7FFB7FFA7FFA7FFA7FFA7FFA7F
      707FFD7FFD7FFD7FFD7F455AAD351863DE7B4A29734EFF7FFF7FE00326034A29
      1863FF7F186B6764056C056CEA609C7310008F75056C056C8758292DEF3D3967
      DE7B186318630000186318630000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7F3F333F334A29
      1863100010001000100010001000100010001000100010001000100018631863
      0000186318630000186318630000104200000000000076772E77B27FB07FB07F
      B07FB07FB07FB07FB07FB07FB07FB07F6D7B0D730000FE7FFE7FFD7FFC7FFC7F
      707FFE7FFE7FFE7FFE7F51776931734EBD774A29734EFF7FFF7F3F333F334A29
      FF7F186B6764056C056CC95C7B6F100010001000757A056C056C4664092DAD35
      D65ABD7718630000186318630000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7FFF03FF7F4A29
      1863100010001000100010001000100010001000100010001000100010001000
      100010001000100010001000100010420000000000007677747BD47FD17FD17F
      D17FD17FD17FD17FD17FD17FD17FD17FD17F8E7BC56E2C73EC6E30737577977B
      00000000FF7FFF7FFF7FFD7F0552734E9C734A29734EFF7FFF7FFF03FF7FFF7F
      186B6764056C056C87605A6BFF7F10001000100010003A7F4670056C256CE83C
      6B2D734E9C73FF7F100010001000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7FFF7FFF7F4A29
      1863186318631863186318631863186318631863186318631863186318631863
      186318631863186318631863186310420000000000007677747BF57FF27FF27F
      F27FF27FF27FF27FF27FF27FF27FF27FF27FF27FF27FF27FF27FD17F8E7B6B77
      826A455AEC6A0E733073977B86665A6BDE7B4A29734EFF7FFF7FFF7FFF7F186B
      6764056C056C4664186BFF7F186318631863186318631863BE7F0B71056C056C
      A7504A2910429C73FF7F18631863104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7FFF03FF7F4A29
      4A294A294A294A294A294A294A294A294A294A294A294A294A294A294A294A29
      4A294A294A294A294A294A294A294A290000000000007577757BF57FF37FF37F
      F37FF37FF37FF37FF37FF37FF37FF37FF37FF37FF37FF37FF37FF37FF37FF37F
      C46EAD355A6BFF7FDB7B9777BA7BFF7FFF7F4A29734EFF7FFF7FDE7BD65E4664
      056C056C056CD662FF7F4A294A294A294A294A294A294A294A294A29D075056C
      056C67608C353967FF7F4A294A294A2900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7FFF03FF03FF03
      FF03FF03FF7F3F33FF03FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F10420000000000000000000000000000DB7B2E73F97FF37FF37F
      F37FF37FF37FF37FF47FFA7FFA7FF87FF77FF57FF37FF37FF37FF37FF37FF37F
      C46EAD355A6BFF7F000000000000000000004A29734EFF7FFF7F53662668056C
      056C0568325ADE7BFF03FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FB77A
      266C056C5366DE7B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29734EFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F104200000000000000000000000000000000C96EDC7FF47FF37F
      F37FF37FF37FF37FFC7F0F6FCC66EC6E2F735177967BB97FFB7FFA7FF87FF67F
      E76E524A9C73FF7F000000000000000000004A29734EFF7F1877256C056C056C
      056C8D59BD77FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      BE7F757ADE7B1042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29186310001000100010001000
      1000100010001000100010001000100010001000000000000000000000000000
      000000000000104200000000000000000000000000000000977B2F73FD7FFC7F
      F97FF87FF67FFA7F977B4B527B6FFF7FFF7FB97B97770F6FED6EEC6EEB6E0D73
      C96A9C73DE7B0000000000000000000000004A2918631000A970056C056C056C
      EA5C9C7310001000100010001000100010001000000000000000000000000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29186310001000100010001000
      1000100010001000100010001000100010001000186318630000186318630000
      1863186300001042000000000000000000000000000000000000EB6E0F6FC96E
      0E7330737577977BA8667B6FDE7B000000000000000000000000FF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000004A2918631000056C056C056C6760
      5A6BFF7F10001000100010001000100010001000186318630000186318630000
      1863186300001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29186310001000100010001000
      1000100010001000100010001000100010001000186318630000186318630000
      18631863000010420000000000000000000000000000000000000000FF7FFF7F
      FF7FDB7B97777777DC7BFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000004A29186310008F75266C686C7B77
      FF7F100010001000100010001000100010001000186318630000186318630000
      1863186300001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29186310001000100010001000
      1000100010001000100010001000100010001000100010001000100010001000
      1000100010001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29186310001000100010001000
      1000100010001000100010001000100010001000100010001000100010001000
      1000100010001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29186318631863186318631863
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A29186318631863186318631863
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A294A294A294A294A294A294A29
      4A294A294A294A294A294A294A294A294A294A294A294A294A294A294A294A29
      4A294A294A294A29000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A294A294A294A294A294A294A29
      4A294A294A294A294A294A294A294A294A294A294A294A294A294A294A294A29
      4A294A294A294A29000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00F8000000FFFFFFFFFC00000000000000
      F8000000FFFFFFFFFC00000000000000F8000000E07FFFFFFC00000000000000
      F8000000E007FFFFF800000000000000F8000000C0007FFFF000000000000000
      00000000C00003FFE00000000000000000000000C000007FE000000000000000
      00000000C400001FE00000000000000000000000C000001F0000000000000000
      00000000C000000F000000000000000000000000C000000F0000000000000000
      00000000C0000007000000000000000000000000C00000070000000000000000
      00000000C0000003000000000000000000000000C00000030000000000000000
      00000000C0000003000000000000000000000000C00000010000000000000000
      00000000C0400001000000000000000000000000C00000000000000000000000
      00000000C0000000000000000000000000000000C00040000000000000000000
      00000000C0000180000000000000000000000000C00000000000000000000000
      00000000C000000000000000000000000000000FC000001F0000000F00000000
      0000000FE000001F0000000F000000000000000FE000003F0000000F00000000
      0000000FF003F07F0000000F000000000000000FF803FFFF0000000F00000000
      0000000FFFFFFFFF0000000F000000000000000FFFFFFFFF0000000F00000000
      0000000FFFFFFFFF0000000F0000000000000000000000000000000000000000
      000000000000}
  end
end