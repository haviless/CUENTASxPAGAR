object FRetencionEdit: TFRetencionEdit
  Left = 226
  Top = 186
  Width = 780
  Height = 540
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Retenciones'
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
  object dbgFiltra: TwwDBGrid
    Left = 8
    Top = 82
    Width = 754
    Height = 409
    DisableThemesInTitle = False
    Selected.Strings = (
      'RETSERIE'#9'5'#9'Serie'#9'F'
      'RETNUMERO'#9'11'#9'Numero'#9'F'
      'FECPAGO'#9'11'#9'Fecha'#9'F'
      'CLAUXID'#9'5'#9'Cl.Aux'#9'F'
      'AUXID'#9'6'#9'Auxiliar'#9'F'
      'AUXRUC'#9'12'#9'RUC'#9'F'
      'MTOLOC'#9'10'#9'Mto.Loc.'#9'F'
      'MTOEXT'#9'10'#9'Mto.Ext.'#9'F'
      'ECESTADO'#9'10'#9'Estado'#9'F'
      'CIAID'#9'4'#9'C'#237'a'#9'F'
      'ECNOCOMP'#9'11'#9'No.Comp'#9'F'
      'USUARIO'#9'8'#9'Usuario'#9'F'
      'ITEMS'#9'5'#9'Items'#9'F')
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMCXP.dsConsulta
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ReadOnly = True
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgFiltraDblClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 754
    Height = 66
    BevelWidth = 3
    Color = 10207162
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 28
      Width = 85
      Height = 13
      Caption = 'Buscar Retenci'#243'n'
    end
    object Label2: TLabel
      Left = 596
      Top = 11
      Width = 32
      Height = 13
      Caption = 'R.U.C.'
    end
    object Bevel2: TBevel
      Left = 229
      Top = 5
      Width = 4
      Height = 56
    end
    object Label3: TLabel
      Left = 469
      Top = 11
      Width = 94
      Height = 13
      Caption = 'Periodo ( AAAAMM)'
    end
    object wwIncrementalSearch1: TwwIncrementalSearch
      Left = 109
      Top = 23
      Width = 84
      Height = 21
      DataSource = DMCXP.dsConsulta
      SearchField = 'RETNUMERO'
      MaxLength = 10
      TabOrder = 0
    end
    object rgFiltro: TRadioGroup
      Left = 251
      Top = 7
      Width = 198
      Height = 49
      Caption = 'Filtrar'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todo'
        'Por RUC/Mes')
      TabOrder = 1
    end
    object meRuc: TMaskEdit
      Left = 570
      Top = 29
      Width = 89
      Height = 21
      MaxLength = 11
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 672
      Top = 22
      Width = 57
      Height = 28
      Caption = 'Ejecuta'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object mePeriodo: TMaskEdit
      Left = 490
      Top = 29
      Width = 51
      Height = 21
      MaxLength = 6
      TabOrder = 4
    end
  end
end
