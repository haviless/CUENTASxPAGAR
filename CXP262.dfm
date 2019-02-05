object FOrdenSelec: TFOrdenSelec
  Left = 252
  Top = 194
  BorderStyle = bsSingle
  Caption = 'Seleccionar Documentos para pago'
  ClientHeight = 466
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 438
    Width = 121
    Height = 19
    Caption = 'Documentos desde:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgSelec: TwwDBGrid
    Left = 5
    Top = 7
    Width = 741
    Height = 417
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMCXP.dsMovCxP
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = True
    OnTitleButtonClick = dbgSelecTitleButtonClick
    OnDblClick = dbgSelecDblClick
  end
  object bbtnTranferir: TBitBtn
    Left = 640
    Top = 429
    Width = 105
    Height = 33
    Caption = 'Enviar a Pago'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = bbtnTranferirClick
  end
  object pnlBusca: TPanel
    Left = 321
    Top = 429
    Width = 285
    Height = 32
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 7566265
    TabOrder = 2
    Visible = False
    object lblBusca1: TLabel
      Left = 7
      Top = 10
      Width = 48
      Height = 13
      Caption = 'Busca por'
    end
    object lblBusca2: TLabel
      Left = 57
      Top = 10
      Width = 89
      Height = 13
      Caption = 'Titulo de cabecera'
    end
    object isBusca: TwwIncrementalSearch
      Left = 157
      Top = 5
      Width = 121
      Height = 21
      DataSource = DMCXP.dsMovCxP
      TabOrder = 0
      OnExit = isBuscaExit
    end
  end
  object seMes: TSpinEdit
    Left = 191
    Top = 435
    Width = 41
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 2
    MaxValue = 12
    MinValue = 1
    ParentFont = False
    TabOrder = 3
    Value = 1
  end
  object seAno: TSpinEdit
    Left = 131
    Top = 435
    Width = 58
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 4
    MaxValue = 2015
    MinValue = 2009
    ParentFont = False
    TabOrder = 4
    Value = 2009
  end
  object bbtnBuscar: TBitBtn
    Left = 235
    Top = 429
    Width = 54
    Height = 33
    Caption = 'Buscar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = bbtnBuscarClick
  end
end
