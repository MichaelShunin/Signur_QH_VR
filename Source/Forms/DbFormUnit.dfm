object DbFormForm: TDbFormForm
  Left = 180
  Top = 108
  BorderStyle = bsDialog
  Caption = 'DbFormForm'
  ClientHeight = 197
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  ShowHint = True
  OnClose = FormClose
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  DesignSize = (
    417
    197)
  PixelsPerInch = 120
  TextHeight = 16
  object Bevel1: TBevel
    Left = 0
    Top = 24
    Width = 417
    Height = 4
    Anchors = [akLeft, akTop, akRight]
  end
  object Bevel2: TBevel
    Left = 0
    Top = 161
    Width = 417
    Height = 4
    Anchors = [akLeft, akRight, akBottom]
  end
  object PostBtn: TButton
    Left = 177
    Top = 169
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1080#1085#1103#1090#1100
    Enabled = False
    TabOrder = 0
    OnClick = PostBtnClick
  end
  object CancelBtn: TButton
    Left = 257
    Top = 169
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    Enabled = False
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object CloseBtn: TButton
    Left = 337
    Top = 169
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    OnClick = CloseBtnClick
  end
  object CheckPanel: TPanel
    Left = 0
    Top = 28
    Width = 23
    Height = 133
    Anchors = [akLeft, akTop, akBottom]
    BevelOuter = bvNone
    Color = clSkyBlue
    TabOrder = 3
  end
  object MassPanel: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    Color = clSkyBlue
    TabOrder = 4
    DesignSize = (
      417
      25)
    object CheckAllBtn: TSpeedButton
      Left = 0
      Top = 2
      Width = 22
      Height = 22
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFF0EEED727272785E5E785E5E785E5E785E5E785E5E785E5E785E5E785E
        5E785E5E665349CBC5C2FFFFFFFFFFFFF4F2F2E6E4E2727272FFDCB9FFDCB9FF
        DCB9FFDCB9FFDCB9FFDCB9FFDCB9FFDCB9785E5E665349CBC5C2FFFFFFEFEDEB
        DAD6D4C6C0BC727272FFFFFEFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFDC
        B9785E5E665349CBC5C2FFFFFFA3A3A3A3A3A3A3A3A3727272FFFFFEFFE3B000
        00FF0000FF0000FFFFE3B0FFE3B0FFDCB9785E5E665349CBC5C2FFFFFFA3A3A3
        F2E2D2FFE6CD727272FFFFFE0000FF0000FF0000FF0000FF0000FFFFFFFFFFDC
        B9785E5E665349CBC5C2FFFFFFA3A3A3FFFFFEFFFFFF7272720000FF0000FF00
        00FFFFE3B00000FF0000FF0000FFFFDCB9785E5E665349CBC5C2FFFFFFA3A3A3
        FFFFFEFFE3B07272720000FF0000FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000
        FF785E5E665349CBC5C2FFFFFFA3A3A3FFFFFEFFFFFF727272FFFFFEFFE3B0FF
        E3B0FFE3B0FFE3B0FFE3B00000FF0000FF0000FF665349CBC5C2FFFFFFA3A3A3
        FFFFFEFFE3B0727272FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        FF0000FF67544ACBC5C2FFFFFFA3A3A3FFFFFEFFFFFF727272FFFFFEFFE3B0FF
        E3B0FFE3B0FFE3B0E7B988E7B988E7B988785E5E6A5850CBC5C2FFFFFFA3A3A3
        FFFFFEFFE3B0727272FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7B988D1995CD199
        5CBA720D7C6C64D8D3D1FFFFFFA3A3A3FFFFFEFFFFFF727272FFFFFEFFFFFEFF
        FFFEFFFFFEFFFFFEE7B988D1995CBA720D705F56C5BEBAEAE7E6FFFFFFA3A3A3
        FFFFFEFFE3B0727272727272727272727272727272727272727272BA720D6F5C
        54C3BBB8E5E2E0F6F5F5FFFFFFA3A3A3FEFEFEFFFFFFFFFFFFFFFFFFFFFCF9E7
        B988D1995CD1995CBA720D6F5C54C3BBB8E4E1DFF6F5F5FFFFFFFFFFFFA3A3A3
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7B988D1995CBA720D6C5A50C1BAB5E4E1
        DFF6F5F5FDFDFDFFFFFFFFFFFFA3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3
        A3A3BA720D59453AB5ACA7E0DDDAF6F5F5FDFDFDFFFFFFFFFFFF}
    end
    object Label1: TLabel
      Left = 198
      Top = 4
      Width = 52
      Height = 16
      Caption = #1048#1089#1082#1072#1090#1100':'
    end
    object SpeedButton1: TSpeedButton
      Left = 393
      Top = 1
      Width = 22
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        00660072745EA6A198CECCC6E8E8E5FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF006600006600385E2A868373C5C2BCE0
        E0DCF2F2F0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        0066000D901A026F04155D0D5F664AADABA1D6D5CFECECE9FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00660014A02716AB2B07840F04630242
        582F908F80CAC8C2E4E3E0F4F4F2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660019A5321CB53617B02D0C9517016A021A5B106C6D57B6B4ACD9D8D3EEEE
        EBFF00FFFF00FFFF00FFFF00FFFF00FF0066001FAB3D22BB441CB53617B02D0F
        A51E0379060860044A5C3799988BCDCCC6E8E8E4FF00FFFF00FFFF00FFFF00FF
        00660023B04629C25222BB441CB53617B02D0FA91F05880B016A0127591A7C7A
        69C7C4BEE5E5E2FF00FFFF00FFFF00FF00660026B34D30C96029C25222BB441C
        B53617B02D0FA91F089B1002710310600A6C745AC7C7BFF0F1EEFF00FFFF00FF
        00660027B34D33CC6630C96029C25222BB441CB53617B02D0EA41D037D060563
        036A6F57C5C6BEEFF0EDFF00FFFF00FF0066002DB95335CE6833CC6630C96029
        C25222BB4415A128036F05155D0D6A6A54BBB9B1E3E2DFFF00FFFF00FFFF00FF
        00660032BE583CD56F35CE6833CC6630C960149428046302335823858372C7C4
        BEE3E2DFFF00FFFF00FFFF00FFFF00FF00660036C25C43DC763CD56F2BBB550A
        79130E5E08556241A3A296D1D1CBE9E9E5FF00FFFF00FFFF00FFFF00FFFF00FF
        0066003DC96349E27C25A842046D072C581D7F7C6CC2C0B9DEDED9EFEFEDFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0066003CC55F1587210860044A5C379A
        998CCECDC7E8E8E4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        006600006600235D186C6F58B7B4ABDAD9D4EEEEEBFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF006600536C44898878C1C0B8E2E2DDFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object SearchEdit: TEdit
      Left = 240
      Top = 2
      Width = 154
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 0
    end
  end
  object Navigator: TDBNavigator
    Left = 0
    Top = 169
    Width = 168
    Height = 25
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbRefresh]
    Anchors = [akLeft, akRight, akBottom]
    Flat = True
    ConfirmDelete = False
    TabOrder = 5
    BeforeAction = NavigatorBeforeAction
  end
end