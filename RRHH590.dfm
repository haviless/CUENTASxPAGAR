object FGenArchBcoxBoleta: TFGenArchBcoxBoleta
  Left = 257
  Top = 132
  Width = 536
  Height = 272
  Caption = 'Genera Archivo para Banco por Boletas'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCierre: TPanel
    Left = 7
    Top = 7
    Width = 506
    Height = 226
    Color = 14869218
    TabOrder = 0
    object fcLabel1: TfcLabel
      Left = 17
      Top = 2
      Width = 451
      Height = 27
      Caption = 'Genera Archivo para Banco por Boletas de Pago '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.VAlignment = vaTop
    end
    object TPanel
      Left = 16
      Top = 35
      Width = 474
      Height = 151
      Color = 14869218
      TabOrder = 2
      object lblPeriodo: TLabel
        Left = 15
        Top = 45
        Width = 45
        Height = 15
        Caption = 'Periodo :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblTipoBoleta: TLabel
        Left = 15
        Top = 11
        Width = 79
        Height = 15
        Caption = 'Tipo de Boleta :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblBanco: TLabel
        Left = 15
        Top = 78
        Width = 31
        Height = 15
        Caption = 'Banco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcPeriodo: TwwDBLookupCombo
        Left = 95
        Top = 40
        Width = 95
        Height = 19
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PERBOL'#9'6'#9'Periodo'#9'F'
          'TIPBOLID'#9'15'#9'Tipo de Boleta'#9'F'
          'PERB_CIER'#9'1'#9'Cerrado'#9'F'
          'PERCIERC'#9'1'#9'Cierre Contable'#9'F')
        LookupTable = DMPL.cdsPerBol
        LookupField = 'PERBOL'
        Options = [loColLines, loRowLines, loTitles]
        Color = 14869218
        Frame.Enabled = True
        Frame.FocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcPeriodoExit
      end
      object dblcTipBol: TwwDBLookupCombo
        Left = 95
        Top = 11
        Width = 42
        Height = 19
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        CharCase = ecUpperCase
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPBOLID'#9'1'#9'Id'#9'F'
          'TIPBOLDES'#9'30'#9'Tipo de Boleta'#9'F')
        LookupTable = DMPL.cdsTipBol
        LookupField = 'TIPBOLID'
        Options = [loColLines, loRowLines, loTitles]
        Color = 14869218
        Frame.Enabled = True
        Frame.FocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        PreciseEditRegion = False
        AllowClearKey = True
        OnExit = dblcTipBolExit
      end
      object edtTipBol: TEdit
        Left = 145
        Top = 10
        Width = 128
        Height = 21
        CharCase = ecUpperCase
        Color = 14869218
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object dblcBanco: TwwDBLookupCombo
        Left = 95
        Top = 75
        Width = 42
        Height = 19
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'BANCOID'#9'5'#9'Banco'#9'F'
          'BANCONOM'#9'40'#9'Nombre Banco'#9'F')
        LookupTable = DMPL.cdsBanco
        LookupField = 'BANCOID'
        Options = [loColLines, loRowLines, loTitles]
        Color = 14869218
        Frame.Enabled = True
        Frame.FocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcBancoExit
      end
      object edtnomBanco: TEdit
        Left = 145
        Top = 74
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        Color = 14869218
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object rgOrden: TRadioGroup
        Left = 13
        Top = 101
        Width = 324
        Height = 40
        Caption = 'Ordenado por'
        Columns = 3
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Alfab'#233'tico'
          'Nro.Cuenta'
          'C'#243'digo')
        ParentFont = False
        TabOrder = 5
      end
    end
    object Z2bbtnCancela: TBitBtn
      Left = 459
      Top = 190
      Width = 30
      Height = 30
      Hint = 'Cancela Datos'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object Z2bbtnGeneraTxt: TBitBtn
      Left = 421
      Top = 190
      Width = 30
      Height = 30
      Hint = 'Genera Archivo para Banco'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Z2bbtnGeneraTxtClick
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
    object Z2bbtnImprimir: TBitBtn
      Left = 382
      Top = 190
      Width = 30
      Height = 30
      Hint = 'Imprime Inf.que se enviar'#225
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Z2bbtnImprimirClick
      Glyph.Data = {
        BE080000424DBE0800000000000036000000280000001B0000001A0000000100
        18000000000088080000CE0E0000D80E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C080
        8080000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000808080C0C0
        C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C000000080808080800080808080
        8000808080808000808080808000808080808000808080808000808080808000
        808080808000808080808080808000000000C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000C0C0C0C0C0C0000000C0C0C0C0C0C00000008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000000000C0C0C0
        C0C0C0000000C0C0C0C0C0C00000008080008080000000000000008080000000
        0000000080800000000000000080800080800080800080800000000000000000
        0000000000000000000000808000000000C0C0C0C0C0C0000000C0C0C0C0C0C0
        0000008080008080000000000000008080000000000000008080000000000000
        0080800080800080800080800000000000000000000000000000000000000080
        8000000000C0C0C0C0C0C0000000C0C0C0C0C0C0000000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        00808000808000808000808000808000808000808000000000C0C0C0C0C0C000
        0000C0C0C0C0C0C0000000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        00808000808000808000000000C0C0C0C0C0C0000000C0C0C0C0C0C0000000C0
        C0C0C0C0C0FFFFFFFFFFFFC0C0C0FFFFFFC0C0C0FFFFFFC0C0C0FFFFFFFFFFFF
        C0C0C0FFFFFFC0C0C0FFFFFFC0C0C0FFFFFFFFFFFFC0C0C0FFFFFFC0C0C00000
        00C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C0C0C0C0C0C0C0000000808000808000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808000808000
        000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C00000
        00000000000000000000FFFFFF00000000000080808080808000000080808000
        0000808080000000FFFFFF000000000000000000000000C0C0C0C0C0C0C0C0C0
        C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF0000000000008080800000
        00808080000000000000C0C0C0000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF000000
        808080000000000000808080000000FFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000FFFFFF000000000000808080808080000000000000FFFFFF000000000000
        000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
        00000000000000000000000000000000000000000000000000C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000}
    end
  end
  object sdlgGuardaArchivo: TSaveDialog
    DefaultExt = 'txt'
    Left = 434
    Top = 175
  end
  object ppdbRepBancos: TppDBPipeline
    DataSource = DMPL.dsQry5
    UserName = 'dbRepBancos'
    Left = 343
    Top = 202
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'TIPPLAID'
      FieldName = 'TIPPLAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'TRABID'
      FieldName = 'TRABID'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'TRABNOMT'
      FieldName = 'TRABNOMT'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'TRABFING'
      FieldName = 'TRABFING'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TRABDEPCTS'
      FieldName = 'TRABDEPCTS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CCOSID'
      FieldName = 'CCOSID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'BOLAAAA'
      FieldName = 'BOLAAAA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'BOLMM'
      FieldName = 'BOLMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 8
    end
  end
  object pprRepBancos: TppReport
    AutoStop = False
    DataPipeline = ppdbRepBancos
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\PL\Dema\BancosBoletaMensual.rtm'
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 367
    Top = 194
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbRepBancos'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object pplblNroCta: TppLabel
        UserName = 'lblNroCta'
        Caption = 'Cta.Ahorros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 9525
        mmTop = 19315
        mmWidth = 18256
        BandType = 0
      end
      object pplblTrabajador: TppLabel
        UserName = 'lblTrabajador'
        Caption = 'Trabajador'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 19315
        mmWidth = 15875
        BandType = 0
      end
      object pplblDNI: TppLabel
        UserName = 'lblDNI'
        Caption = 'DNI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 128323
        mmTop = 19050
        mmWidth = 5556
        BandType = 0
      end
      object pplblMoneda: TppLabel
        UserName = 'lblMoneda'
        Caption = 'Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 149490
        mmTop = 19315
        mmWidth = 12171
        BandType = 0
      end
      object pplblImporte: TppLabel
        UserName = 'lblImporte'
        Caption = 'Importe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 177271
        mmTop = 19315
        mmWidth = 11377
        BandType = 0
      end
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Caption = 'lblCia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 794
        mmWidth = 8467
        BandType = 0
      end
      object pplblAreaPersonal: TppLabel
        UserName = 'lblAreaPersonal'
        Caption = 'lblAreaPersonal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 5556
        mmWidth = 24077
        BandType = 0
      end
      object pplblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = 'lblTitulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 29633
        mmTop = 10848
        mmWidth = 13758
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 172509
        mmTop = 794
        mmWidth = 16933
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 187590
        mmTop = 6350
        mmWidth = 1852
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2646
        mmTop = 25135
        mmWidth = 189442
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppdbNroCta: TppDBText
        UserName = 'dbNroCta'
        AutoSize = True
        DataField = 'TRABCTADEP'
        DataPipeline = ppdbRepBancos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepBancos'
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppdbTrabajador: TppDBText
        UserName = 'dbTrabajador'
        DataField = 'TRABNOMT'
        DataPipeline = ppdbRepBancos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepBancos'
        mmHeight = 4233
        mmLeft = 38629
        mmTop = 0
        mmWidth = 79375
        BandType = 4
      end
      object ppdbDNI: TppDBText
        UserName = 'dbDNI'
        DataField = 'TRABDNI'
        DataPipeline = ppdbRepBancos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepBancos'
        mmHeight = 4233
        mmLeft = 123031
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppdbMoneda: TppDBText
        UserName = 'dbMoneda'
        DataField = 'TMONABR'
        DataPipeline = ppdbRepBancos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepBancos'
        mmHeight = 4233
        mmLeft = 153194
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppdbImporte: TppDBText
        UserName = 'dbImporte'
        AutoSize = True
        DataField = 'BOLMONTO'
        DataPipeline = ppdbRepBancos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepBancos'
        mmHeight = 4233
        mmLeft = 169334
        mmTop = 0
        mmWidth = 19315
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
      mmHeight = 13229
      mmPrintPosition = 0
      object ppdbTotImporte: TppDBCalc
        UserName = 'dbTotImporte'
        AutoSize = True
        DataField = 'BOLMONTO'
        DataPipeline = ppdbRepBancos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepBancos'
        mmHeight = 4233
        mmLeft = 159015
        mmTop = 1323
        mmWidth = 29633
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprRepBancos
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 319
    Top = 199
  end
end
