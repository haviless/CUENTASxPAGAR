object FEstCtaCli: TFEstCtaCli
  Left = -4
  Top = 95
  VertScrollBar.Visible = False
  ActiveControl = Z2bbtnAceptar
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Estados de Cuenta Proveedores'
  ClientHeight = 573
  ClientWidth = 792
  Color = clBtnFace
  Constraints.MaxHeight = 602
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHEAD: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 144
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel2: TBevel
      Left = 5
      Top = 81
      Width = 735
      Height = 57
      Shape = bsFrame
    end
    object Label4: TLabel
      Left = 13
      Top = 74
      Width = 134
      Height = 15
      Caption = 'Criterios de Recuperaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object grBCIA: TGroupBox
      Left = 4
      Top = 6
      Width = 590
      Height = 64
      TabOrder = 0
      object Label11: TLabel
        Left = 7
        Top = 16
        Width = 49
        Height = 15
        Caption = 'Compa'#241#237'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 367
        Top = 16
        Width = 40
        Height = 15
        Caption = 'Moneda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object dbeCIA: TwwDBEdit
        Left = 61
        Top = 33
        Width = 284
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeMoneda: TwwDBEdit
        Left = 421
        Top = 33
        Width = 156
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbclMoneda: TwwDBLookupCombo
        Left = 360
        Top = 33
        Width = 59
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TMONID'#9'3'#9'C'#243'digo'#9'F'
          'TMONDES'#9'30'#9'Descripci'#243'n'#9'F'
          'TMONABR'#9'8'#9'Abreviatura'#9'F')
        LookupTable = DMCXP.cdsTMon
        LookupField = 'TMONID'
        Options = [loColLines, loTitles]
        ParentFont = False
        TabOrder = 2
        Visible = False
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = dbclMonedaChange
        OnExit = dblcExist
      end
      object dblcCia: TwwDBLookupCombo
        Left = 11
        Top = 33
        Width = 46
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'Cia'#9'F'
          'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
        LookupTable = DMCXP.cdsCia
        LookupField = 'CIAID'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        DropDownCount = 15
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcCiaExit
      end
    end
    object rgImportes: TRadioGroup
      Left = 216
      Top = 90
      Width = 389
      Height = 41
      Caption = 'Saldos Presentados'
      Columns = 7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 6
      Items.Strings = (
        '>'
        '>='
        '='
        '<='
        '<'
        '<>'
        'Todos')
      ParentFont = False
      TabOrder = 1
      OnClick = rgImportesClick
    end
    object Z2bbtnAceptar: TBitBtn
      Left = 755
      Top = 105
      Width = 32
      Height = 32
      TabOrder = 3
      OnClick = Z2bbtnAceptarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object GroupBox1: TGroupBox
      Left = 599
      Top = 6
      Width = 188
      Height = 64
      Caption = 'Periodo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label2: TLabel
        Left = 9
        Top = 16
        Width = 20
        Height = 15
        Caption = 'A'#241'o'
      end
      object Label3: TLabel
        Left = 76
        Top = 16
        Width = 21
        Height = 15
        Caption = 'Mes'
      end
      object dbSpAnno: TwwDBSpinEdit
        Left = 8
        Top = 33
        Width = 65
        Height = 23
        Increment = 1.000000000000000000
        MaxValue = 2100.000000000000000000
        MaxLength = 4
        TabOrder = 0
        UnboundDataType = wwDefault
        OnExit = dbSpAnnoExit
        OnKeyPress = dbSpAnnoKeyPress
      end
      object cbMes: TComboBox
        Left = 75
        Top = 33
        Width = 108
        Height = 23
        ItemHeight = 15
        TabOrder = 1
        Text = 'cbMes'
        OnChange = cbMesChange
        OnEnter = cbMesEnter
        OnExit = cbMesExit
      end
    end
    object rgMoneda: TRadioGroup
      Left = 13
      Top = 90
      Width = 200
      Height = 41
      Caption = 'Moneda '
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Local'
        'Externa')
      ParentFont = False
      TabOrder = 4
    end
    object dbeSaldoWhere: TwwDBEdit
      Left = 614
      Top = 103
      Width = 116
      Height = 23
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeSaldoWhereExit
      OnKeyPress = dbeSaldoWhereKeyPress
    end
  end
  object pnlFOOT: TPanel
    Left = 0
    Top = 532
    Width = 792
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Z2bbtnCancel: TBitBtn
      Left = 756
      Top = 6
      Width = 32
      Height = 32
      Cancel = True
      TabOrder = 0
      OnClick = Z2bbtnCancelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbtnPrint: TBitBtn
      Left = 720
      Top = 6
      Width = 32
      Height = 32
      TabOrder = 1
      OnClick = bbtnPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object dbgEst1: TwwDBGrid
    Left = 0
    Top = 147
    Width = 792
    Height = 385
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 2
    ShowHorzScrollBar = True
    Align = alBottom
    DataSource = DMCXP.dsQry
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
    ParentFont = False
    TabOrder = 2
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = True
    OnCalcCellColors = dbgEst1CalcCellColors
    OnCalcTitleAttributes = dbgEst1CalcTitleAttributes
    OnTitleButtonClick = dbgEst1TitleButtonClick
    OnDblClick = dbgEst1DblClick
    FooterCellColor = clInfoBk
  end
  object pnlOrden: TPanel
    Left = 267
    Top = 246
    Width = 257
    Height = 81
    BevelInner = bvRaised
    BevelWidth = 2
    TabOrder = 3
    Visible = False
    object lblBusca: TLabel
      Left = 18
      Top = 15
      Width = 49
      Height = 16
      Caption = 'Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 12
      Top = 35
      Width = 235
      Height = 2
    end
    object isBusca: TwwIncrementalSearch
      Left = 21
      Top = 45
      Width = 220
      Height = 24
      DataSource = DMCXP.dsQry
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = isBuscaKeyPress
    end
    object btnSalir: TBitBtn
      Left = 236
      Top = 7
      Width = 15
      Height = 17
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalirClick
    end
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 11000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 378000
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SOLCxC\Cliente\estc01.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReportPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 720
    Top = 448
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Resumen de Estados de Cuenta '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5027
        mmLeft = 121179
        mmTop = 3969
        mmWidth = 57150
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 24077
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 19579
        mmTop = 23813
        mmWidth = 75000
        BandType = 0
      end
      object pplblPERIODO: TppLabel
        UserName = 'lblPERIODO'
        Caption = 'PERIODO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 141023
        mmTop = 12435
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Anterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 107421
        mmTop = 26458
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Cargos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 133086
        mmTop = 26458
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Acumulado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 184944
        mmTop = 26458
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'SALDOS   MONEDA   LOCAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 123031
        mmTop = 22225
        mmWidth = 38365
        BandType = 0
      end
      object pplCia: TppLabel
        UserName = 'lCia'
        Caption = 'Compa'#241#237'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 1588
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Abonos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 159279
        mmTop = 26458
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Anterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 212725
        mmTop = 26458
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Cargos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 238390
        mmTop = 26458
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'SALDOS   MONEDA   EXTRANJERA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 220134
        mmTop = 22225
        mmWidth = 47625
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Abonos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 264584
        mmTop = 26458
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Acumulado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 290248
        mmTop = 26458
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 19050
        mmWidth = 305330
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 28840
        mmWidth = 305330
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 245269
        mmTop = 1323
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Hora  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 245269
        mmTop = 6350
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 245269
        mmTop = 11642
        mmWidth = 10319
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 260615
        mmTop = 11377
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 260351
        mmTop = 6350
        mmWidth = 17727
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 260351
        mmTop = 1323
        mmWidth = 1588
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PROV'
        DataPipeline = ppDBPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PROVDES'
        DataPipeline = ppDBPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 19579
        mmTop = 0
        mmWidth = 74877
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'SALANTMN'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CARGOSMN'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 125413
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'SALACUMMN'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 177536
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'ABONOSMN'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 151342
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'SALANTME'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 204788
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CARGOSME'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 230717
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'ABONOSME'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 256646
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'SALACUMME'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 282840
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'SALANTMN'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 3440
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'CARGOSMN'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 125413
        mmTop = 3440
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'SALACUMMN'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 177536
        mmTop = 3440
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'ABONOSMN'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 151342
        mmTop = 3440
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'SALANTME'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 204788
        mmTop = 3440
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'CARGOSME'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 230717
        mmTop = 3440
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'ABONOSME'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 256646
        mmTop = 3440
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'SALACUMME'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 282840
        mmTop = 3440
        mmWidth = 23019
        BandType = 7
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 305330
        BandType = 7
      end
    end
  end
  object ppDBPipeline: TppDBPipeline
    UserName = 'DBPipeline'
    Left = 720
    Top = 408
  end
end
