object FToolProv: TFToolProv
  Left = 268
  Top = 275
  Width = 644
  Height = 80
  Caption = 'Proveedores'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBtns: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 50
    Align = alTop
    Color = 14869218
    TabOrder = 0
    object bbtnActiva: TBitBtn
      Left = 81
      Top = 5
      Width = 176
      Height = 38
      Caption = '(x) Activar / Desactivar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bbtnActivaClick
    end
  end
end
