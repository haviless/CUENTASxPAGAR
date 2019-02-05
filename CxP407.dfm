object FIngDia: TFIngDia
  Left = 273
  Top = 69
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ingresos del Dia'
  ClientHeight = 201
  ClientWidth = 309
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRegComp: TPanel
    Left = 3
    Top = 6
    Width = 300
    Height = 191
    BevelInner = bvRaised
    BorderWidth = 1
    Color = 14869218
    TabOrder = 0
    object bbtnOk: TBitBtn
      Left = 261
      Top = 160
      Width = 30
      Height = 24
      Hint = 'Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnOkClick
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
    object pnlDatos1: TPanel
      Left = 9
      Top = 9
      Width = 284
      Height = 72
      Color = 14869218
      TabOrder = 0
      object lblCia: TLabel
        Left = 6
        Top = 13
        Width = 49
        Height = 13
        Caption = 'Compa'#241#237'a'
      end
      object lblDiario: TLabel
        Left = 6
        Top = 42
        Width = 40
        Height = 13
        Caption = 'T.Diario '
      end
      object dblcCia: TwwDBLookupCombo
        Left = 75
        Top = 8
        Width = 42
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'Cia'#9'F'
          'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
        LookupTable = DMCXP.cdsCia
        LookupField = 'CIAID'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcCiaExit
      end
      object edtCia: TEdit
        Left = 121
        Top = 8
        Width = 137
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
      object dblcTDiario: TwwDBLookupCombo
        Left = 75
        Top = 36
        Width = 42
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TDIARID'#9'2'#9'Tipo de Diario'#9'F'
          'TDIARDES'#9'40'#9'Descripci'#243'n'#9'F')
        LookupTable = DMCXP.cdsTDiario
        LookupField = 'TDIARID'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        UseTFields = False
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcTDiarioExit
      end
      object edtTDiario: TEdit
        Left = 121
        Top = 36
        Width = 137
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object pnlDatos2: TPanel
      Left = 9
      Top = 84
      Width = 284
      Height = 72
      Color = 14869218
      TabOrder = 2
      object rgOrden: TRadioGroup
        Left = 8
        Top = 5
        Width = 265
        Height = 60
        Caption = 'Ordenado por'
        Ctl3D = True
        ItemIndex = 0
        Items.Strings = (
          'No. de Registro'
          'Proveedor')
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
  object pprptData: TppReport
    AutoStop = False
    DataPipeline = ppdbpData
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 5000
    PrinterSetup.mmMarginRight = 2500
    PrinterSetup.mmMarginTop = 3500
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 378000
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SolCxP\SOLFormatos\CXPIngresoDiarioInt.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprptDataPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 179
    Top = 150
    Version = '7.02'
    mmColumnWidth = 370500
    DataPipelineName = 'ppdbpData'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object pplblProv: TppLabel
        UserName = 'lblProv'
        AutoSize = False
        Caption = 'Nombre Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76729
        mmTop = 14817
        mmWidth = 48419
        BandType = 0
      end
      object pplblSoles: TppLabel
        UserName = 'lblSoles'
        AutoSize = False
        Caption = 'Importe S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 236803
        mmTop = 14817
        mmWidth = 27517
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1000
        mmLeft = 1058
        mmTop = 22225
        mmWidth = 300567
        BandType = 0
      end
      object pplblDolar: TppLabel
        UserName = 'lblDolar'
        Caption = 'Importe  US$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 277284
        mmTop = 14817
        mmWidth = 16669
        BandType = 0
      end
      object pplTitulo: TppLabel
        UserName = 'lTitulo'
        Caption = 'Listado de Proveedores'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 128588
        mmTop = 0
        mmWidth = 41804
        BandType = 0
      end
      object ppDescri: TppLabel
        UserName = 'Descri'
        AutoSize = False
        Caption = 'Descripcion'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 141817
        mmTop = 14817
        mmWidth = 36248
        BandType = 0
      end
      object pplblNRegistro: TppLabel
        UserName = 'lblNRegistro'
        Caption = 'Numero Registro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 7673
        mmTop = 14817
        mmWidth = 10054
        BandType = 0
      end
      object pplblDoc: TppLabel
        UserName = 'lblDoc'
        Caption = 'Numero Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 52917
        mmTop = 14817
        mmWidth = 14288
        BandType = 0
      end
      object pplblTipDoc: TppLabel
        UserName = 'Label12'
        Caption = 'Tipo Doc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 29633
        mmTop = 14817
        mmWidth = 6085
        BandType = 0
      end
      object ppFechas: TppLabel
        UserName = 'Fechas'
        Caption = 'Fechas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 143669
        mmTop = 4498
        mmWidth = 7938
        BandType = 0
      end
      object pplblPag: TppLabel
        UserName = 'lblPag'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 266171
        mmTop = 0
        mmWidth = 8996
        BandType = 0
      end
      object svPag: TppSystemVariable
        UserName = 'svPag'
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 281517
        mmTop = 0
        mmWidth = 1852
        BandType = 0
      end
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Caption = 'Cia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 0
        mmWidth = 4498
        BandType = 0
      end
      object pplvlCXP: TppLabel
        UserName = 'lvlCXP'
        Caption = 'Cuentas x Pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 4498
        mmWidth = 22490
        BandType = 0
      end
      object pplblCuenta: TppLabel
        UserName = 'Label10'
        Caption = 'Cuenta Contable'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 192882
        mmTop = 14817
        mmWidth = 10848
        BandType = 0
      end
      object pplblCC: TppLabel
        UserName = 'Label101'
        Caption = 'Centro Costo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 216165
        mmTop = 14817
        mmWidth = 8467
        BandType = 0
      end
      object pplblFecha: TppLabel
        UserName = 'lblPag1'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 266171
        mmTop = 4498
        mmWidth = 7144
        BandType = 0
      end
      object svFecha: TppSystemVariable
        UserName = 'svPag1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 281517
        mmTop = 4498
        mmWidth = 14288
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CPMTOLOC'
        DataPipeline = ppdbpData
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpData'
        mmHeight = 2910
        mmLeft = 237332
        mmTop = 0
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CPMTOEXT'
        DataPipeline = ppdbpData
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpData'
        mmHeight = 2910
        mmLeft = 274638
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DCPGLOSA'
        DataPipeline = ppdbpData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpData'
        mmHeight = 2910
        mmLeft = 131763
        mmTop = 0
        mmWidth = 57150
        BandType = 4
      end
      object ppdbReg: TppDBText
        UserName = 'dbReg'
        DataField = 'CPNOREG'
        DataPipeline = ppdbpData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbpData'
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppdbtTipDoc: TppDBText
        UserName = 'dbtTipDoc'
        DataField = 'DOCABR'
        DataPipeline = ppdbpData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpData'
        mmHeight = 2910
        mmLeft = 27252
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PROVDES'
        DataPipeline = ppdbpData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpData'
        mmHeight = 2910
        mmLeft = 74083
        mmTop = 0
        mmWidth = 56092
        BandType = 4
      end
      object ppVariable2: TppVariable
        UserName = 'Variable2'
        AutoSize = False
        CalcOrder = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 2910
        mmLeft = 237067
        mmTop = 0
        mmWidth = 65352
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CUENTAID'
        DataPipeline = ppdbpData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpData'
        mmHeight = 2910
        mmLeft = 189971
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CCOSID'
        DataPipeline = ppdbpData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpData'
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'dbtTipDoc1'
        DataField = 'CPNODOC'
        DataPipeline = ppdbpData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpData'
        mmHeight = 2910
        mmLeft = 50271
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'CPMTOLOC'
        DataPipeline = ppdbpData
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpData'
        mmHeight = 2910
        mmLeft = 238919
        mmTop = 3175
        mmWidth = 25929
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'CPMTOEXT'
        DataPipeline = ppdbpData
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpData'
        mmHeight = 2910
        mmLeft = 278078
        mmTop = 3175
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label11'
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 4233
        mmTop = 794
        mmWidth = 6879
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 235215
        mmTop = 1058
        mmWidth = 67204
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 235215
        mmTop = 8467
        mmWidth = 67204
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 15346
        mmTop = 794
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel26: TppLabel
        UserName = 'Label1'
        Caption = 'Registros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 34660
        mmTop = 794
        mmWidth = 11113
        BandType = 7
      end
    end
  end
  object ppdbpData: TppDBPipeline
    UserName = 'dbpData'
    Left = 116
    Top = 153
  end
end
