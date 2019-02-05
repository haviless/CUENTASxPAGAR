object FImpRecHonElect: TFImpRecHonElect
  Left = 184
  Top = 96
  Width = 820
  Height = 624
  Caption = 'Importaci'#243'n de Recibos por Honorarios Electr'#243'nicos'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 585
    Align = alTop
    Color = 14869218
    TabOrder = 0
    object lblPeriodo: TLabel
      Left = 51
      Top = 10
      Width = 90
      Height = 13
      Caption = 'Periodo (A'#241'o+Mes)'
    end
    object grbExtBanDatos: TGroupBox
      Left = 418
      Top = 12
      Width = 369
      Height = 75
      TabOrder = 1
      object lblArchivoTxt: TLabel
        Left = 6
        Top = 7
        Width = 148
        Height = 13
        Caption = 'Archivo en Formato TXT / CSV'
      end
      object edtRutaArchivo: TEdit
        Left = 5
        Top = 21
        Width = 325
        Height = 21
        Color = 13303807
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object btnBuscarArchivo: TButton
        Left = 332
        Top = 21
        Width = 33
        Height = 20
        Caption = '...'
        TabOrder = 1
        OnClick = btnBuscarArchivoClick
      end
      object bbtnProcesar: TBitBtn
        Left = 266
        Top = 44
        Width = 63
        Height = 26
        Caption = 'Procesa'
        TabOrder = 2
        OnClick = bbtnProcesarClick
      end
    end
    object dbgDatosdImportados: TwwDBGrid
      Left = 1
      Top = 352
      Width = 810
      Height = 232
      HelpType = htKeyword
      DisableThemesInTitle = False
      ControlInfoInDataset = False
      MemoAttributes = [mSizeable, mWordWrap, mGridShow]
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alBottom
      Color = clWhite
      DataSource = DMCXP.dsQry2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
      ParentFont = False
      TabOrder = 6
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = True
      UseTFields = False
      OnCalcCellColors = dbgDatosdImportadosCalcCellColors
      OnTitleButtonClick = dbgDatosdImportadosTitleButtonClick
      OnDblClick = dbgDatosdImportadosDblClick
    end
    object dbeAnoMM: TwwDBEdit
      Left = 160
      Top = 7
      Width = 56
      Height = 21
      MaxLength = 6
      Picture.PictureMask = '999999'
      TabOrder = 0
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = False
      OnExit = dbeAnoMMExit
    end
    object pbProgreso: TProgressBar
      Left = 418
      Top = 92
      Width = 370
      Height = 17
      TabOrder = 2
    end
    object edtLogResultado: TMemo
      Left = 418
      Top = 136
      Width = 371
      Height = 33
      Lines.Strings = (
        'edtLogResultado')
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object pbProgreso2: TProgressBar
      Left = 418
      Top = 116
      Width = 370
      Height = 17
      TabOrder = 3
    end
    object gbArchivosImport: TGroupBox
      Left = 8
      Top = 48
      Width = 406
      Height = 297
      Caption = 'Archivos Importados'
      TabOrder = 5
      object dbgDatos: TwwDBGrid
        Left = 2
        Top = 16
        Width = 402
        Height = 279
        HelpType = htKeyword
        DisableThemesInTitle = False
        ControlInfoInDataset = False
        MemoAttributes = [mSizeable, mWordWrap, mGridShow]
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alBottom
        Color = clWhite
        DataSource = DMCXP.dsQry13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = True
        UseTFields = False
      end
    end
    object gbFiltroDetalle: TGroupBox
      Left = 420
      Top = 264
      Width = 370
      Height = 41
      Caption = 'Filtro sobre Detalle'
      TabOrder = 7
      object lblNroRegistros: TLabel
        Left = 200
        Top = 17
        Width = 71
        Height = 13
        Caption = 'lblNroRegistros'
        Visible = False
      end
      object rbTodos: TRadioButton
        Left = 16
        Top = 17
        Width = 73
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbTodosClick
      end
      object rbFaltantes: TRadioButton
        Left = 104
        Top = 17
        Width = 73
        Height = 17
        Caption = 'Faltantes'
        TabOrder = 1
        OnClick = rbFaltantesClick
      end
    end
    object gbFiltroBusqueda: TGroupBox
      Left = 420
      Top = 304
      Width = 370
      Height = 41
      Caption = 'B'#250'squeda '
      TabOrder = 8
      object lblBusca: TLabel
        Left = 9
        Top = 16
        Width = 23
        Height = 13
        Caption = 'RUC'
      end
      object isBusca: TwwIncrementalSearch
        Left = 103
        Top = 16
        Width = 121
        Height = 21
        DataSource = DMCXP.dsQry2
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
  end
  object odlgSeleccionarArchivo: TOpenDialog
    Left = 8
    Top = 8
  end
end
