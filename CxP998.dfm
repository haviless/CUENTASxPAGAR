object FImpresion: TFImpresion
  Left = 661
  Top = 311
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impresi'#243'n'
  ClientHeight = 105
  ClientWidth = 325
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 40
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Normal'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Rapida'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 216
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = BitBtn3Click
  end
end
