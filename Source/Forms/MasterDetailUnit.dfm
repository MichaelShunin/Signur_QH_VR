inherited MasterDetailForm: TMasterDetailForm
  Left = 194
  Top = 140
  Caption = #1060#1086#1088#1084#1072' '#1076#1083#1103' '#1074#1099#1074#1086#1076#1072' '#1089#1087#1080#1089#1082#1072' '#1089' '#1076#1077#1090#1072#1083#1080#1079#1072#1094#1080#1077#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited MainSheet: TTabSheet
      inline DetailFrame: TDbGridFrame
        Left = 0
        Top = 175
        Width = 528
        Height = 141
        Align = alClient
        AutoScroll = False
        TabOrder = 2
        inherited Grid: TDBGridEh
          Width = 265
          Height = 116
          AllowedSelections = [gstRectangle]
          FooterFont.Charset = RUSSIAN_CHARSET
          FooterFont.Name = 'Tahoma'
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Name = 'Tahoma'
        end
        inherited ToolPanel: TPanel
          Height = 116
          inherited Label2: TLabel
            Width = 52
          end
          inherited SimilarityLabel: TLabel
            Width = 49
          end
          inherited Bevel: TBevel
            Height = 116
          end
          inherited Label4: TLabel
            Width = 11
          end
        end
        inherited TopPanel: TPanel
          Width = 528
          Visible = True
          inherited Navigator: TDBNavigator
            Width = 471
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          end
          inherited ExtraPanel: TPanel
            Visible = False
          end
        end
        inherited ViewsPanel: TPanel
          Left = 378
          Height = 116
          inherited Bevel1: TBevel
            Height = 114
          end
        end
      end
    end
  end
end
