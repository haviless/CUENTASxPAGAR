object FToolRegLetras: TFToolRegLetras
  Left = 49
  Top = 186
  AutoSize = True
  BorderStyle = bsToolWindow
  Caption = 'Registro de Letras'
  ClientHeight = 129
  ClientWidth = 880
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object lblCia: TLabel
    Left = 22
    Top = 17
    Width = 49
    Height = 15
    Caption = 'Compa'#241#237'a'
  end
  object Label2: TLabel
    Left = 22
    Top = 46
    Width = 42
    Height = 15
    Caption = 'Periodo '
  end
  object pnlComprobante: TPanel
    Left = 0
    Top = 0
    Width = 880
    Height = 129
    Color = 14869218
    TabOrder = 0
    object lblRango1: TLabel
      Left = 488
      Top = 96
      Width = 31
      Height = 15
      Caption = 'Desde'
    end
    object lblRango2: TLabel
      Left = 614
      Top = 96
      Width = 29
      Height = 15
      Caption = 'Hasta'
    end
    object GroupBox1: TGroupBox
      Left = 12
      Top = 1
      Width = 860
      Height = 75
      TabOrder = 0
      object Label5: TLabel
        Left = 565
        Top = 19
        Width = 46
        Height = 15
        Caption = 'T.Diario '
      end
      object Label1: TLabel
        Left = 273
        Top = 19
        Width = 66
        Height = 15
        Caption = 'T.Documento'
      end
      object zsbImprime: TSpeedButton
        Left = 811
        Top = 17
        Width = 34
        Height = 30
        Hint = 'Imprime'
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
        ParentShowHint = False
        ShowHint = True
        OnClick = zsbImprimeClick
      end
      object Label3: TLabel
        Left = 273
        Top = 49
        Width = 69
        Height = 15
        Caption = 'Tipo Moneda '
      end
      object Label4: TLabel
        Left = 11
        Top = 19
        Width = 49
        Height = 15
        Caption = 'Compa'#241#237'a'
      end
      object Label6: TLabel
        Left = 11
        Top = 49
        Width = 39
        Height = 15
        Caption = 'Periodo'
      end
      object dblcTMon: TwwDBLookupCombo
        Left = 346
        Top = 44
        Width = 43
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TMONID'#9'3'#9'Moneda'#9'F'
          'TMONDES'#9'30'#9'Descripci'#243'n'#9'F')
        LookupTable = DMCXP.cdsTMon
        LookupField = 'TMONID'
        Options = [loColLines, loRowLines]
        MaxLength = 2
        ParentFont = False
        TabOrder = 5
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcTMonExit
      end
      object edtTMon: TEdit
        Left = 391
        Top = 44
        Width = 161
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object dblcCia: TwwDBLookupCombo
        Left = 85
        Top = 16
        Width = 42
        Height = 23
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
        Left = 128
        Top = 16
        Width = 137
        Height = 23
        Enabled = False
        ReadOnly = True
        TabOrder = 7
      end
      object seAno: TSpinEdit
        Left = 88
        Top = 44
        Width = 51
        Height = 24
        AutoSelect = False
        AutoSize = False
        MaxValue = 2050
        MinValue = 2000
        TabOrder = 3
        Value = 2000
        OnExit = seAnoExit
      end
      object seMes: TSpinEdit
        Left = 142
        Top = 44
        Width = 41
        Height = 24
        AutoSelect = False
        AutoSize = False
        MaxValue = 12
        MinValue = 1
        TabOrder = 4
        Value = 10
        OnExit = seMesExit
      end
      object dblcTDoc: TwwDBLookupCombo
        Left = 346
        Top = 16
        Width = 42
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DOCID'#9'2'#9'Doc.'#9'F'
          'DOCABR'#9'8'#9'Descripci'#243'n'#9'F')
        LookupTable = DMCXP.cdsTDoc
        LookupField = 'DOCID'
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
        OnExit = dblcTDocExit
      end
      object edtTDoc: TEdit
        Left = 389
        Top = 16
        Width = 162
        Height = 23
        Enabled = False
        ReadOnly = True
        TabOrder = 8
      end
      object dblcTDiario: TwwDBLookupCombo
        Left = 622
        Top = 16
        Width = 42
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TDIARID'#9'2'#9'Tipo de Diario'#9'F'
          'TDIARDES'#9'40'#9'Descripci'#243'n'#9'F')
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 2
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
        Left = 665
        Top = 16
        Width = 137
        Height = 23
        Enabled = False
        ReadOnly = True
        TabOrder = 9
      end
    end
    object rgOrden: TRadioGroup
      Left = 14
      Top = 78
      Width = 467
      Height = 42
      Caption = 'Ordenado por'
      Columns = 4
      Ctl3D = True
      Items.Strings = (
        'No. de Registro'
        'Fecha de Registro'
        'Proveedor'
        'Fecha Vcmto')
      ParentCtl3D = False
      TabOrder = 1
      OnClick = rgOrdenClick
    end
    object dbdtpFReg1: TwwDBDateTimePicker
      Left = 523
      Top = 90
      Width = 80
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
      Visible = False
    end
    object dblcdProv1: TwwDBLookupComboDlg
      Left = 522
      Top = 90
      Width = 80
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'PROV'#9'8'#9'Proveedor'#9'F'
        'PROVDES'#9'30'#9'Raz'#243'n Social'#9'F'
        'PROVRUC'#9'10'#9'R.U.C.'#9'F')
      LookupTable = DMCXP.cdsProv
      LookupField = 'PROV'
      MaxLength = 8
      TabOrder = 3
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dblcdProv2: TwwDBLookupComboDlg
      Left = 648
      Top = 89
      Width = 74
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'PROV'#9'8'#9'Proveedor'#9'F'
        'PROVDES'#9'30'#9'Raz'#243'n Social'#9'F'
        'PROVRUC'#9'10'#9'R.U.C.'#9'F')
      LookupTable = DMCXP.cdsProv
      LookupField = 'PROV'
      MaxLength = 8
      TabOrder = 4
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbdtpFReg2: TwwDBDateTimePicker
      Left = 646
      Top = 89
      Width = 78
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 5
      Visible = False
    end
    object dbeNoReg2: TwwDBEdit
      Left = 647
      Top = 89
      Width = 76
      Height = 23
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNoReg1: TwwDBEdit
      Left = 523
      Top = 90
      Width = 80
      Height = 23
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object pprNLetras: TppReport
    AutoStop = False
    DataPipeline = ppdbLetras
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rNLetras'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 378000
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SOLExes\SOLFormatos\CxP\Incoresa\CXPRegLetras.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprNLetrasPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 754
    Top = 63
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbLetras'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39158
      mmPrintPosition = 0
      object pplblCia: TppDBText
        UserName = 'lblCia'
        AutoSize = True
        DataField = 'CIADESC'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 1852
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'REGISTRO DE LETRAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 2117
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Cuentas Por Pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 7938
        mmWidth = 31485
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Periodo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 122502
        mmTop = 6879
        mmWidth = 14817
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'lblPeriodo1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 139965
        mmTop = 6879
        mmWidth = 14288
        BandType = 0
      end
      object pplblDel: TppLabel
        UserName = 'lblDel1'
        Caption = 'Del:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 111390
        mmTop = 16669
        mmWidth = 7408
        BandType = 0
      end
      object pplblAl: TppLabel
        UserName = 'lblAl1'
        Caption = 'Al:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 144463
        mmTop = 16669
        mmWidth = 5556
        BandType = 0
      end
      object pplblFecini: TppLabel
        UserName = 'lblFecini1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 120121
        mmTop = 16669
        mmWidth = 16933
        BandType = 0
      end
      object pplblFecfin: TppLabel
        UserName = 'lblFecfin1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 151607
        mmTop = 16669
        mmWidth = 16933
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 27781
        mmWidth = 303478
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'A Favor de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 20902
        mmTop = 28840
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Registro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 61913
        mmTop = 33338
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'Letra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 90752
        mmTop = 33338
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Cambio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 33073
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'M.Ext.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 209021
        mmTop = 33073
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label201'
        Caption = 'M.Ori'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 191823
        mmTop = 33073
        mmWidth = 9260
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 529
        mmTop = 37835
        mmWidth = 303478
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = '(d'#237'as)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 148167
        mmTop = 33073
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = 'Emisi'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 33338
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = 'Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 105040
        mmTop = 33073
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'Total MN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 225161
        mmTop = 33073
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Observaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 285221
        mmTop = 28840
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 276755
        mmTop = 2381
        mmWidth = 12965
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 288132
        mmTop = 2381
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = 'Hora  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 276755
        mmTop = 7408
        mmWidth = 8996
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 288132
        mmTop = 7408
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 288132
        mmTop = 12435
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 276755
        mmTop = 12435
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 28840
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 62971
        mmTop = 28840
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 91017
        mmTop = 28840
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 106098
        mmTop = 28840
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Plazo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 28840
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Importe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 189971
        mmTop = 28840
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label401'
        Caption = 'Importe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 207963
        mmTop = 28840
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label402'
        Caption = 'Importe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 225425
        mmTop = 28840
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label301'
        Caption = 'R.U.C.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 129117
        mmTop = 28575
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 247386
        mmTop = 28575
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = 'Vcmto.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 247121
        mmTop = 33338
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        Caption = 'Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 173038
        mmTop = 33073
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'Tipo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 162984
        mmTop = 28840
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = 'Tipo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 174890
        mmTop = 28840
        mmWidth = 7408
        BandType = 0
      end
      object pplblOrden: TppLabel
        UserName = 'lblOrden'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 121973
        mmTop = 11377
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label55'
        Caption = 'Estado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 266171
        mmTop = 28575
        mmWidth = 11113
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppPlazo: TppVariable
        UserName = 'VarPlazo1'
        AutoSize = False
        CalcOrder = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Visible = False
        mmHeight = 3704
        mmLeft = 329142
        mmTop = 794
        mmWidth = 2910
        BandType = 4
      end
      object ppdic: TppDBText
        UserName = 'dic'
        DataField = 'DIC'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 529
        mmWidth = 1323
        BandType = 4
      end
      object ppReg: TppDBText
        UserName = 'Reg'
        DataField = 'CPNOREG'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 60061
        mmTop = 529
        mmWidth = 24606
        BandType = 4
      end
      object ppAfavor: TppDBText
        UserName = 'Afavor'
        DataField = 'AFAVOR'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 529
        mmWidth = 38365
        BandType = 4
      end
      object ppLetra: TppDBText
        UserName = 'Letra'
        DataField = 'CPNODOC'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 529
        mmWidth = 18256
        BandType = 4
      end
      object ppTcam: TppDBText
        UserName = 'Tcam'
        DataField = 'CPTCAMPR'
        DataPipeline = ppdbLetras
        DisplayFormat = '###,###,##0.#00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 161132
        mmTop = 529
        mmWidth = 8996
        BandType = 4
      end
      object ppMext: TppDBText
        UserName = 'Mext'
        DataField = 'CPMTOORI'
        DataPipeline = ppdbLetras
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3440
        mmLeft = 185473
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppMloc: TppDBText
        UserName = 'DBText101'
        DataField = 'CPMTOEXT'
        DataPipeline = ppdbLetras
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3440
        mmLeft = 204259
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppFechaE: TppDBText
        UserName = 'FechaE'
        AutoSize = True
        DataField = 'CPFEMIS'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppProv: TppDBText
        UserName = 'Prov'
        DataField = 'PROV'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 106098
        mmTop = 529
        mmWidth = 17992
        BandType = 4
      end
      object ppTmonto: TppDBText
        UserName = 'Tmonto'
        DataField = 'CPMTOLOC'
        DataPipeline = ppdbLetras
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3440
        mmLeft = 224367
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object ppano: TppDBText
        UserName = 'ano'
        DataField = 'anio'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 529
        mmWidth = 1852
        BandType = 4
      end
      object ppene: TppDBText
        UserName = 'ene'
        DataField = 'ENE'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 794
        mmWidth = 1323
        BandType = 4
      end
      object ppfeb: TppDBText
        UserName = 'feb'
        DataField = 'FEB'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 529
        mmWidth = 1058
        BandType = 4
      end
      object ppmar: TppDBText
        UserName = 'mar'
        DataField = 'MAR'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 529
        mmWidth = 1588
        BandType = 4
      end
      object ppabr: TppDBText
        UserName = 'abr'
        DataField = 'ABR'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 529
        mmWidth = 1323
        BandType = 4
      end
      object ppjun: TppDBText
        UserName = 'jun'
        DataField = 'JUN'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 1058
        mmWidth = 529
        BandType = 4
      end
      object ppjul: TppDBText
        UserName = 'jul'
        DataField = 'JUL'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 794
        mmWidth = 1852
        BandType = 4
      end
      object ppago: TppDBText
        UserName = 'ago'
        DataField = 'AGO'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 794
        mmWidth = 1588
        BandType = 4
      end
      object ppset: TppDBText
        UserName = 'set'
        DataField = 'SEP'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 794
        mmWidth = 1323
        BandType = 4
      end
      object ppoct: TppDBText
        UserName = 'oct'
        DataField = 'OCT'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 1058
        mmWidth = 1323
        BandType = 4
      end
      object ppobs: TppDBText
        UserName = 'obs'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 284692
        mmTop = 529
        mmWidth = 16669
        BandType = 4
      end
      object ppmay: TppDBText
        UserName = 'may'
        DataField = 'MAY'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppnov: TppDBText
        UserName = 'nov'
        DataField = 'NOV'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 323851
        mmTop = 529
        mmWidth = 794
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PROVRUC'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 529
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CPFVCMTO'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 243417
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'TMONID'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 173832
        mmTop = 529
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'PLAZO'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 148696
        mmTop = 529
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'ESTDOCDES'
        DataPipeline = ppdbLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 3704
        mmLeft = 263526
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 15346
      mmPrintPosition = 0
      object pplbltot: TppLabel
        UserName = 'lbltot'
        Caption = 'Totales:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 151607
        mmTop = 4233
        mmWidth = 14817
        BandType = 7
      end
      object ppdbtotext: TppDBCalc
        UserName = 'dbtotext'
        DataField = 'CPMTOEXT'
        DataPipeline = ppdbLetras
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 2910
        mmLeft = 204259
        mmTop = 4233
        mmWidth = 17198
        BandType = 7
      end
      object ppdbtotloc: TppDBCalc
        UserName = 'dbtotloc'
        DataField = 'CPMTOLOC'
        DataPipeline = ppdbLetras
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbLetras'
        mmHeight = 2910
        mmLeft = 222250
        mmTop = 4233
        mmWidth = 17198
        BandType = 7
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 146579
        mmTop = 1058
        mmWidth = 80698
        BandType = 7
      end
    end
  end
  object ppdbLetras: TppDBPipeline
    DataSource = DMCXP.dsCXP
    UserName = 'dbLetras'
    Left = 610
    Top = 47
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'PROFID'
      FieldName = 'PROFID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'FPAGOID'
      FieldName = 'FPAGOID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'LGECID'
      FieldName = 'LGECID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'COMPID'
      FieldName = 'COMPID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'ODCID'
      FieldName = 'ODCID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'ODCFEMI'
      FieldName = 'ODCFEMI'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 8
    end
    object ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'ODCTEN'
      FieldName = 'ODCTEN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'ODCVALID'
      FieldName = 'ODCVALID'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'ODCTCAMB'
      FieldName = 'ODCTCAMB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'ODCIXFLE'
      FieldName = 'ODCIXFLE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'ODCIXTCC'
      FieldName = 'ODCIXTCC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'ODCIXTD'
      FieldName = 'ODCIXTD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'ODCIXTI'
      FieldName = 'ODCIXTI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      FieldAlias = 'ODCEST'
      FieldName = 'ODCEST'
      FieldLength = 15
      DisplayWidth = 15
      Position = 16
    end
    object ppField18: TppField
      FieldAlias = 'ODCFATE'
      FieldName = 'ODCFATE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      FieldAlias = 'ODCOBS'
      FieldName = 'ODCOBS'
      FieldLength = 1
      DataType = dtMemo
      DisplayWidth = 10
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppField20: TppField
      FieldAlias = 'ODCUSER'
      FieldName = 'ODCUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      FieldAlias = 'ODCFREG'
      FieldName = 'ODCFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 20
    end
    object ppField22: TppField
      FieldAlias = 'ODCHREG'
      FieldName = 'ODCHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 21
    end
    object ppField23: TppField
      FieldAlias = 'ODCANO'
      FieldName = 'ODCANO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 22
    end
    object ppField24: TppField
      FieldAlias = 'ODCMM'
      FieldName = 'ODCMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 23
    end
    object ppField25: TppField
      FieldAlias = 'ODCDD'
      FieldName = 'ODCDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 24
    end
    object ppField26: TppField
      FieldAlias = 'ODCTRI'
      FieldName = 'ODCTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 25
    end
    object ppField27: TppField
      FieldAlias = 'ODCSEM'
      FieldName = 'ODCSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'ODCSS'
      FieldName = 'ODCSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'ODCANOMM'
      FieldName = 'ODCANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 28
    end
    object ppField30: TppField
      FieldAlias = 'ODCAATRI'
      FieldName = 'ODCAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 29
    end
    object ppField31: TppField
      FieldAlias = 'ODCAASEM'
      FieldName = 'ODCAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 30
    end
    object ppField32: TppField
      FieldAlias = 'ODCAASS'
      FieldName = 'ODCAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 31
    end
    object ppField33: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 32
    end
    object ppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'ODCTOTALG'
      FieldName = 'ODCTOTALG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppField35: TppField
      FieldAlias = 'ODCTIMP'
      FieldName = 'ODCTIMP'
      FieldLength = 15
      DisplayWidth = 15
      Position = 34
    end
    object ppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'ODCTTIMPU'
      FieldName = 'ODCTTIMPU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppField37: TppField
      FieldAlias = 'ODCFEOC'
      FieldName = 'ODCFEOC'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 36
    end
    object ppField38: TppField
      FieldAlias = 'ODCIDCP'
      FieldName = 'ODCIDCP'
      FieldLength = 15
      DisplayWidth = 15
      Position = 37
    end
    object ppField39: TppField
      FieldAlias = 'ODCVISADOR'
      FieldName = 'ODCVISADOR'
      FieldLength = 20
      DisplayWidth = 20
      Position = 38
    end
    object ppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'ODCTOTALISC'
      FieldName = 'ODCTOTALISC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object ppField41: TppField
      FieldAlias = 'TIPOADQ'
      FieldName = 'TIPOADQ'
      FieldLength = 1
      DisplayWidth = 1
      Position = 40
    end
    object ppField42: TppField
      FieldAlias = 'CCOMERID'
      FieldName = 'CCOMERID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 41
    end
    object ppField43: TppField
      FieldAlias = 'PROVDES'
      FieldName = 'PROVDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 42
    end
    object ppField44: TppField
      FieldAlias = 'OCVISFREG'
      FieldName = 'OCVISFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 43
    end
    object ppField45: TppField
      FieldAlias = 'OCVISHREG'
      FieldName = 'OCVISHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 44
    end
    object ppField46: TppField
      FieldAlias = 'OCCOLOCAC'
      FieldName = 'OCCOLOCAC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 45
    end
    object ppField47: TppField
      FieldAlias = 'OCCOLOFREG'
      FieldName = 'OCCOLOFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 46
    end
    object ppField48: TppField
      FieldAlias = 'OCCOLOHREG'
      FieldName = 'OCCOLOHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 47
    end
    object ppField49: TppField
      FieldAlias = 'ODCACEPFREG'
      FieldName = 'ODCACEPFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 48
    end
    object ppField50: TppField
      FieldAlias = 'ODCACEPHREG'
      FieldName = 'ODCACEPHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 49
    end
    object ppField51: TppField
      FieldAlias = 'ODCDEPURA'
      FieldName = 'ODCDEPURA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 50
    end
    object ppField52: TppField
      FieldAlias = 'ODCANULA'
      FieldName = 'ODCANULA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 51
    end
    object ppField53: TppField
      FieldAlias = 'OCANUFREG'
      FieldName = 'OCANUFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 52
    end
    object ppField54: TppField
      FieldAlias = 'OCANUHREG'
      FieldName = 'OCANUHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 53
    end
    object ppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'ODCTIMPAMOR'
      FieldName = 'ODCTIMPAMOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 792
    Top = 96
  end
end
