object FPlanillaDietasDetalle: TFPlanillaDietasDetalle
  Left = 266
  Top = 138
  Width = 886
  Height = 596
  BorderIcons = [biSystemMenu]
  Caption = 'Obligaciones por Pagar - Dietas '
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDetalle: TPanel
    Left = 0
    Top = 0
    Width = 865
    Height = 553
    BevelInner = bvRaised
    BevelWidth = 2
    Color = clSkyBlue
    TabOrder = 0
    object lblPlanilla: TLabel
      Left = 8
      Top = 6
      Width = 409
      Height = 16
      Caption = 'PLANILLA DE DIETAS DE DIRECTORIO DERRAMA MAGISTERIAL'
      Color = clAqua
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      Transparent = False
    end
    object grpDatosGenerales: TGroupBox
      Left = 8
      Top = 24
      Width = 825
      Height = 113
      Caption = 'Datos Generales de la Planilla de Dietas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lblnumero: TLabel
        Left = 24
        Top = 15
        Width = 106
        Height = 16
        Caption = 'N'#250'mero de Planilla'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblTipoPlanilla: TLabel
        Left = 147
        Top = 15
        Width = 141
        Height = 16
        Caption = 'Tipo de Planilla de Dieta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblOrigen: TLabel
        Left = 535
        Top = 17
        Width = 38
        Height = 16
        Caption = 'Origen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblFechaSesion: TLabel
        Left = 25
        Top = 60
        Width = 94
        Height = 16
        Caption = 'Fecha de Sesi'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblPosiPago: TLabel
        Left = 147
        Top = 61
        Width = 111
        Height = 16
        Caption = 'Fec. Sug para Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label5: TLabel
        Left = 289
        Top = 85
        Width = 44
        Height = 16
        Caption = 'Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 291
        Top = 61
        Width = 44
        Height = 16
        Caption = 'Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object meNoReg: TwwDBEdit
        Left = 24
        Top = 35
        Width = 105
        Height = 25
        DataField = 'DTRPORC'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        UsePictureMask = False
        WantReturns = False
        WordWrap = False
      end
      object dblcTplani: TwwDBLookupCombo
        Left = 145
        Top = 35
        Width = 56
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TMONID'#9'3'#9'Moneda'#9'F'
          'TMONDES'#9'30'#9'Descripci'#243'n'#9'F')
        DataField = 'IDNUMERO'
        LookupField = 'IDNUMERO'
        Options = [loColLines, loRowLines]
        MaxLength = 4
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcTplaniEnter
        OnExit = dblcTplaniExit
      end
      object edtDescripcionPlani: TEdit
        Left = 200
        Top = 35
        Width = 332
        Height = 25
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object dblcdCCosto: TwwDBLookupComboDlg
        Left = 534
        Top = 35
        Width = 90
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        SearchDelay = 2
        Selected.Strings = (
          'CCOSID'#9'15'#9'Id'#9'F'
          'CCOSDES'#9'30'#9'Centro de Costo'#9'F')
        DataField = 'CCOSID'
        LookupField = 'CCOSID'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        Enabled = False
        MaxLength = 12
        ParentFont = False
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        UseTFields = False
        ShowMatchText = True
        OnExit = dblcdCCostoExit
      end
      object edtCCosto: TEdit
        Left = 623
        Top = 35
        Width = 194
        Height = 25
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object dtpFSesion: TwwDBDateTimePicker
        Left = 24
        Top = 78
        Width = 92
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Date = 40466.000000000000000000
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
      end
      object dtpFPosiPago: TwwDBDateTimePicker
        Left = 146
        Top = 78
        Width = 92
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Date = 40463.000000000000000000
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 2
      end
      object dblcTMon: TwwDBLookupCombo
        Left = 289
        Top = 78
        Width = 43
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        CharCase = ecUpperCase
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TMONID'#9'3'#9'Moneda'#9'F'
          'TMONDES'#9'30'#9'Descripci'#243'n'#9'F')
        DataField = 'TMONID'
        LookupField = 'TMONID'
        Options = [loColLines, loRowLines]
        MaxLength = 2
        ParentFont = False
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcTMonExit
      end
      object edtTMon: TEdit
        Left = 333
        Top = 78
        Width = 107
        Height = 25
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
    end
    object grpCuentaContable: TGroupBox
      Left = 8
      Top = 137
      Width = 825
      Height = 67
      Caption = 'Cuenta Contable Asociada'
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      Visible = False
      object lblCuentaContable: TLabel
        Left = 23
        Top = 19
        Width = 93
        Height = 16
        Caption = 'Cuenta Contable'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblDescripcionContable: TLabel
        Left = 122
        Top = 19
        Width = 142
        Height = 16
        Caption = 'Descripci'#243'n de la Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dblcdCuentaCont: TwwDBLookupComboDlg
        Left = 22
        Top = 37
        Width = 96
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Cuenta Contable'
        MaxWidth = 0
        MaxHeight = 209
        SearchDelay = 2
        Selected.Strings = (
          'CCOSID'#9'15'#9'Id'#9'F'
          'CCOSDES'#9'30'#9'Centro de Costo'#9'F')
        DataField = 'CUENTAID'
        LookupField = 'CUENTAID'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 12
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        UseTFields = False
        ShowMatchText = True
        OnExit = dblcdCuentaContExit
      end
      object edtCnpEgr: TEdit
        Left = 120
        Top = 37
        Width = 249
        Height = 25
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object grpCuentaCorriente: TGroupBox
      Left = 8
      Top = 205
      Width = 825
      Height = 100
      Caption = 'Datos de Cuenta Corriente de Derrama Magisterial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object dbgDietaCuenta: TwwDBGrid
        Left = 21
        Top = 19
        Width = 788
        Height = 78
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clWhite
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        KeyOptions = [dgEnterToTab]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Times New Roman'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = True
        UseTFields = False
        OnDblClick = dbgDietaCuentaDblClick
        object btnActCuenta: TwwIButton
          Left = 0
          Top = 0
          Width = 25
          Height = 32
          Hint = 'A'#241'ade Registros'
          AllowAllUp = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btnActCuentaClick
        end
      end
    end
    object grpDetallePlanilla: TGroupBox
      Left = 11
      Top = 313
      Width = 825
      Height = 188
      Caption = 'Detalle de Planilla de Dietas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 13
      object dbgDietaDetalle: TwwDBGrid
        Left = 9
        Top = 14
        Width = 808
        Height = 170
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clWhite
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        KeyOptions = [dgEnterToTab]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Times New Roman'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = True
        UseTFields = False
        OnDblClick = dbgDietaDetalleDblClick
        OnKeyDown = dbgDietaDetalleKeyDown
        object btnActReg: TwwIButton
          Left = 0
          Top = 0
          Width = 25
          Height = 32
          Hint = 'A'#241'ade Registros'
          AllowAllUp = True
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btnActRegClick
        end
      end
    end
    object pnlRegistro: TPanel
      Left = 128
      Top = 224
      Width = 305
      Height = 137
      BevelInner = bvLowered
      BevelWidth = 2
      BorderStyle = bsSingle
      Color = clGradientInactiveCaption
      TabOrder = 14
      Visible = False
      object lblBanco: TLabel
        Left = 9
        Top = 27
        Width = 30
        Height = 15
        Caption = 'Banco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object lblCuentaBancaria: TLabel
        Left = 9
        Top = 50
        Width = 78
        Height = 15
        Caption = 'Cuenta Bancaria'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object lblMoneda: TLabel
        Left = 9
        Top = 73
        Width = 40
        Height = 15
        Caption = 'Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object bbtnRegOk: TBitBtn
        Left = 228
        Top = 101
        Width = 30
        Height = 25
        Hint = 'Confirma Actualizaci'#243'n'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnRegOkClick
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
      object bbtnCancelar: TBitBtn
        Left = 260
        Top = 101
        Width = 30
        Height = 25
        Hint = 'Cancela Actualizaci'#243'n'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = bbtnCancelarClick
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
      object StaticText1: TStaticText
        Left = 4
        Top = 4
        Width = 293
        Height = 17
        Align = alTop
        Alignment = taCenter
        BorderStyle = sbsSingle
        Caption = 'Datos de Cuenta Corriente - DERRAMA MAGISTERIAL'
        Color = 8389376
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 4
      end
      object dbeTM: TwwDBEdit
        Left = 94
        Top = 72
        Width = 49
        Height = 25
        CharCase = ecUpperCase
        DataField = 'TMONID'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        UnboundDataType = wwDefault
        UnboundAlignment = taCenter
        WantReturns = False
        WordWrap = False
      end
      object dblcBanco: TwwDBLookupCombo
        Left = 95
        Top = 26
        Width = 47
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'BANCOID'#9'3'#9'Id'#9'F'
          'BANCONOM'#9'40'#9'Banco'#9'F')
        DataField = 'BANCOID'
        LookupField = 'BANCOID'
        Options = [loColLines, loRowLines, loTitles]
        Frame.Enabled = True
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblcBancoExit
      end
      object edtBanco: TEdit
        Left = 146
        Top = 26
        Width = 143
        Height = 21
        BorderStyle = bsNone
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object dblcCCBco: TwwDBLookupCombo
        Left = 95
        Top = 49
        Width = 194
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CCBCOID'#9'30'#9'Cuenta Corriente del Banco'#9'F'
          'CCBCODES'#9'40'#9'Descripci'#243'n'#9'F')
        DataField = 'CCBCOID'
        LookupField = 'CCBCOID'
        Options = [loColLines, loRowLines, loTitles]
        Frame.Enabled = True
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnEnter = dblcCCBcoEnter
        OnExit = dblcCCBcoExit
      end
    end
    object pnlEstado: TPanel
      Left = 31
      Top = 505
      Width = 317
      Height = 41
      Color = 14869218
      TabOrder = 15
      object lblEstado: TLabel
        Left = 1
        Top = 8
        Width = 55
        Height = 21
        Caption = 'Estado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEstadoDescr: TLabel
        Left = 72
        Top = 8
        Width = 108
        Height = 18
        Caption = 'lblEstadoDescr'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object bbtnAnula: TBitBtn
      Left = 553
      Top = 508
      Width = 35
      Height = 35
      Hint = 'Anular Planilla'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = bbtnAnulaClick
      Glyph.Data = {
        96010000424D9601000000000000760000002800000015000000180000000100
        04000000000020010000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888880009988888888888888888990009990000000000000009990008999
        FFFFFFFFFFFFF999800088999FFFFFFFFFFF99988000880999FFFFFFFFF99908
        8000880F999FFFFFFF999F088000880FF999FFFFF999FF088000880FFF999FFF
        999FFF088000880FFFF999F999FFFF088000880FFFFF99999FFFFF088000880F
        FFFFF999FFFFFF088000880FFFFF99999FFFFF088000880FFFF999F999FFFF08
        8000880FFF999FFF999FFF088000880FF999FFFFF999FF088000880F999FFFFF
        FF999F088000880999FFFFFFFFF99908800088999FFFFFFFFFFF999880008999
        FFFFFFFFFFFFF9998000999FFFFFFFFFFFFFFF99900099000000000000000009
        9000888888888888888888888000888888888888888888888000}
    end
    object bbtnContab: TBitBtn
      Left = 823
      Top = 508
      Width = 35
      Height = 35
      Hint = 'Contabilizar Planilla'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      Visible = False
      OnClick = bbtnContabClick
      Glyph.Data = {
        06020000424D060200000000000076000000280000001A000000190000000100
        04000000000090010000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888800000080000000000000000000000008000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000BBBBBB
        BBBBBBBBB00000000000000000000000000000000000000000000000BBBBBBBB
        BBBBBBBBBBB00000000000000000000000000000000000000000000000000000
        0000000000000000000000BBBB0BBB0B0B0B0BBB0BBB0000000000B00B0B0B0B
        0B0B0B0B0B0B0000000000B00B0B0B0B0B0B0BBB0B0B0000000000B0000B0B0B
        0B0B000B0B0B0000000000B0000BBB0BBB0B0BBB0BBB0000000000B000000000
        000B00000B000000000000B00B00000000BBB0000B000000000000BBBB000000
        000B000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000080000000000000000000000008000000888888888888
        88888888888888000000}
    end
    object bbtnAcepta: TBitBtn
      Left = 515
      Top = 508
      Width = 35
      Height = 35
      Hint = 'Acepta Planilla'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbtnAceptaClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object bbtnGraba: TBitBtn
      Left = 477
      Top = 508
      Width = 35
      Height = 35
      Hint = 'Grabar Planilla'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnGrabaClick
      Glyph.Data = {
        8A010000424D8A01000000000000760000002800000017000000170000000100
        04000000000014010000CE0E0000D80E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333303000077777777777770003300000078888888888880000300000
        0780088888888800003000000780088888888800003000000780088888888800
        0030000007888888888888000030000000000000000000000030000000000000
        0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
        00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
        FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
        0030300099999999999999000330}
    end
    object bbtnRegresa: TBitBtn
      Left = 439
      Top = 508
      Width = 35
      Height = 35
      Hint = 'Modifica Datos de Cabecera'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Glyph.Data = {
        9A050000424D9A05000000000000360000002800000014000000170000000100
        18000000000064050000CE0E0000D80E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000000000C0C0C0C0C0C0C0C0C0C0C0C000000000000000
        0000000000000000000000FF0000000000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000000000000000000000000000C0C0C0000000FFFFFFFFFFFFFFFF
        FFCCCCCC00000000000000000000000000000000000000000000000000000000
        0000000000FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFF
        000000000000CCCCCCCCCCCCCCCCCCCCCCCC999999CCCCCC9999990000000000
        00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFF000000CCCCCCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666999999CCCCCC999999000000FFFFFF
        FFFFFF000000C0C0C0000000FFFFFFFFFFFFCCCCCC000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFCCCCCC999999666666CCCCCC666666000000FFFFFFFFFFFF00
        0000C0C0C0000000FFFFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFF
        CCCCCC666666000000666666CCCCCC999999000000FFFFFFFFFFFF000000C0C0
        C0000000FFFFFFFFFFFF000000CCCCCCFFFFFFFFFFFFFFFFFFFFFFFF00000099
        9999000000999999000000000000000000FFFFFFFFFFFF000000C0C0C0000000
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFCCCCCC0000000000000000
        00000000666666CCCCCC000000000000FFFFFF000000C0C0C0000000FFFFFFFF
        FFFF000000FFFFFFCCCCCCFFFFFFFFFFFF999999000000000000666666CCCCCC
        000000CCCCCC666666000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF0000
        00FFFFFFCCCCCCFFFFFFFFFFFF666666000000999999000000CCCCCC00000066
        6666CCCCCC000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFF
        CCCCCCFFFFFFFFFFFF999999000000CCCCCC000000666666CCCCCC0000000000
        00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC66
        6666FFFFFFFFFFFF000000666666CCCCCC000000FFFFFF000000FFFFFFFFFFFF
        FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC0000009999
        99FFFFFF000000000000FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF00
        0000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFF
        666666000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
        C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC00
        0000FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0000000
        FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC000000FFFF
        FFFFFFFF000000000000000000000000000000000000C0C0C0000000FFFFFFFF
        FFFF000000FFFFFFCCCCCC000000FFFFFF000000000000FFFFFFFFFFFFFFFFFF
        000000FFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0000000FFFFFFFFFFFF0000
        00FFFFFFCCCCCC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFFFFFFFF000000C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFF000000FFFFFF
        666666000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF0000
        00C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000000000FFFFFF99999900
        0000000000000000000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000999999999999000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
    end
    object bbtnImprimePlla: TBitBtn
      Left = 355
      Top = 508
      Width = 35
      Height = 35
      Hint = 'Imprimir Planilla'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = bbtnImprimePllaClick
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
    object bbtnPago: TBitBtn
      Left = 804
      Top = 508
      Width = 35
      Height = 35
      Hint = 'Confirmaci'#243'n Pago Planilla'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = bbtnPagoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
        00333337777777777733333308033308033333337F7F337F7F33333308033308
        033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
        7333333373F77733733333333088888033333333373FFFF73333333333000003
        3333333333777773333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnVisa: TBitBtn
      Left = 616
      Top = 508
      Width = 35
      Height = 35
      Hint = 'Visar Planilla'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = bbtnVisaClick
      Glyph.Data = {
        1A0D0000424D1A0D000000000000360000002800000021000000210000000100
        180000000000E40C0000C40E0000C40E000000000000000000003524278E8082
        B8AEB4C2BBC2CCC8CED0CACF8D848150433B1607003F2D223320133019097055
        41573B2A1E06004B32283C1F1146271866493A3B20122C120641281E230D0732
        1F1C2516145D5353A39EA0D9D5DAE1DBE0E8E0E7CFC2CAB29FA88B707A004629
        243D221E1D08073120232113152E20223C2A294E3A351701003C281D43302344
        31224F3D2C4533225E4B3E6751455A3E336244395E4138583B344E302B412420
        260D092F19146D5A5511030022140E52413E5C4745543A3A6F4F503713135327
        28005F3E3545282120080256423D341F1D220D0B260F0D69534E523A34624D45
        A9978CBCAC9F9C8F81C3B6A8CDBDB1D4C0B5D6BBB1D2B5ACD6BAB3E0C3BEAD91
        90AF96947E67656B55503A27201803006D534C3F221B532E2A6037349E706F48
        181652222000A48A7E543C30220C002D1A0D180400341F1779605C907A75AA94
        8FA390899C8A8383736C94877FB7A7A058473E4D383052352E52352E816761BF
        A9A39E8B888D7C79AE9D9AA99693846B677E615C65413B411712431210572121
        763D408D585BA67E7F00C2ADA5B39F948977663C2817412A1B967D73C3ABA5D9
        C0BCE7D3CE88757017090310020061534D1B0E061304001F0C0429120A230C04
        1802003E2B244E3B361605021E0C0BA28E8DF3DCDAC8ADA99A7A7587615C5025
        2280504FC48E93E0ADB4E6C1C300210F0E86746DCCBAA9C5B09BD1B8A8A88E82
        6D524E301715301C176F5F5970635B766B63A79A92B3A79D7F71656C60545A4F
        47665B539A8B82B3A098AB958F79635E9C84865E494B4D3D3E4A3E3A8F817BB4
        A49DC8B4AFCDB4B2C2A1A5BB959BA98087000F00046D5E5BC5B5A4A38E79AD93
        82D7BBB02B0D0C20060614010048383183776DC9BDB3D7CAC2FCF0E6F0E5D7AC
        A395BBB4ABD0C9C0DED5C8F1E3D7EDDAD2BEA8A36E585A2F1C1F0F01030E0200
        59514AC0B9B0D2C6C0D2C3C0D6BFC346272E28030B00D5C7CD94878547372658
        432D705344503128B29394957A7EB6A3A08B7C734B3D311E12064A3E34574B41
        180F02180F021C0E08190C0424180C696052251C0E4338307E716F7E70727463
        6697878873635D7261588E7C75B3A09D705B5EA48C9483646B00B3A8AB5B4F4B
        4F402D87725C705646452821BC9EA3B9A0A4C0ABA96E5F563525181A0D003326
        1E7F736D7D746B90877E9E908A9B8B8484796B968E7D433C2D0D04002E211F87
        797BD9C5CAF8E3E5654F4A2C170F9E877F69504C3F262AE3C7CDECCAD1000900
        006D6359EDE0CA3F2E14AB9282D4B8B123080C16000226110F4F3E3595847749
        392D75655FC6B9B7A69C9CBBB4B1BFB6B2CFC6BDBAB1A3C9BFADAA9D8D3A2C20
        715E5B513C3E271215130000745E59C6ACA5331710A0807BCDA8AC6C4249390D
        1400170F08867D73D3C8B2403019B8A394B49B97260C121801063F2A2877645C
        B09F924F3F339A8B88C5B9B99A92939D9798A5A09DC9C4BBB7B0A1BCB4A3B9AA
        9A59473C543F3D321C1E1600021A05046C5651E2CBC331150EC7A9A4E4BFC130
        080D70444A00C2BCB7423B32352B1ABDAF9D67544C2A1212CFB8BDC3ACB1CBB6
        B466554C2616094A3C30C0B4AEC8BCBCAFA7A8B1ACABBCB7B4C1BEB6A6A093A2
        9B8AB6A999948478412D2895807FA18B8DD2BEBD6B585364534AA6958C69564F
        422D2B99807EDFC1C0005C575486807B837A70665A5073635D7863659F888D8A
        757897868363544B1B0F039B9285E0D6CFC3BAB79B9491D0CBC8CCC7C4C8C5BD
        C2BEB3BBB6A7C6BDAFD1C5B93B2B25695855B3A1A0BFB0AE4E403A695C54A090
        897D6D665F4F49C7B3AEB4999500020001807B7CE1DCD91F1612C1B1B2AB989B
        170205140203231411443B32514B40B8B4A9CBC9BFC8C2BBB8B0A9D3CAC6867D
        7996908BCAC5BCC1BDB2AEAA9FCEC8BD857D76211814140B080C0000817571DB
        CBC5322019BAA7A0CFB9B3200600260601005C5D616766687F7D7D4F47478C80
        807262635D4B4C5341407D716F3A342F797A71CBCEC5BBBCB3D7D4CCD2CAC3C9
        BFB8100906585350D0CDC5BAB8AEB3B1A7DBD9CFBCB9B11A170F3B3431413835
        877A78897A7756433EAD9A93BFA8A0573B3444241F00C1C6C734393830312FAB
        A8A4473B392D1E1BDFCECBD9CAC7A197972A2827B5BAB9CAD1CEB8BBB9C1BEBA
        DCD1CD877E7A0201001B1F1AC5C4C0D4D4CEB4B0ABBAB7AFC3BDB6504A43A299
        96ECE3E02A1E1C3B2E2CC0AFAC4E3B3635221AEFDAD2DFC5BF001E272479807D
        ACADA935312CB3A8A47B6D671D0F09261B171E1A19646666C1C9C9BAC5C3C4C9
        C7C4C3BFE5DAD65A4F4B32312D2B2E2CA5A6A4D9D7D6D5D1D0B2AFABD8D4CF87
        817A1A0F0B42353387797A8578765648428878719B8A8149362E46302A00000A
        0099A298C8C9C0241C15DCCEC8867670140502080100171816BBC4C1BECCC8B7
        C5C1D3DAD5DADAD4D6CCC5453933A9A39E676261787375CBC5CAD5D1D7D2CFD1
        CAC7C2D7CFC8463832130200A89695B9AAA7261C12DDD4C68274681E0C01210A
        0200A5B3A8414B3F5B5C52A49D9452443E655751AFA4A03A3532686D6BDFEAE8
        C8D7D3C3D1CDC0C6C1D5D5CF988F860E03004E463F18110E2F2A2CDDD9DFC6C8
        D0C0C3C8CECFCDDFDBD67B6F6945352F5544417769637C74675F56487D6E65A0
        8D85937972009EABA3434C425F63589C9A90443D345D534CB0AAA5434140AFB5
        B4D5DFDFD7E4E6CEDADAD2D7D5FFFFFA3D342B1308000C07000E0B061C1B1DCA
        CDD2E0E8EFD0D8DFD0D5D8FFFFFFC3BDB8443931291E16897E76A69B9334241E
        553F3AE7CECADCC2BC00000B03B9C1BAA1A69D1B1C12DAD8CE918E860202003C
        3F3DE2E9ECD4DFE3DAE4EBCBD4D8E4E6E6C8C5C0696057C6BCB2A5A097D9D6D1
        66666674797CD4DEE5CFDBE1D7E1E8D0D5D8DDDCD8635E55918B80C6BDB32317
        13BEACABAC91942509091B0200004E5550969E976F776D33392EA1A59A83867D
        161C179BA1A0E0E9EDC6CFD8CBD4DEDCE2E9EDEFF06C69653C332A776D63746A
        63BDB6B37B7677505455DDE9EBC4D2D8D5E1EBC7D1D8EFF4F3BBBCB367675B95
        9389322A2AD7C8CC81686C25080B28101000C6CCC7151C154D554BA8B0A51D25
        1A121B11505956D8E2E2CFD9E0D2DBE5D2D8E5E7E9F3E6E5E91D18170E07000E
        03000C00000F0204090304070707CFD9D9D1DDE1D4E0EAD7E0E9CACFD0EFF0EC
        2A2B2187857D938D8E37292F4F383CF2D7DABFA7A90043453F9B9F999EA39A48
        51478C958B101B1398A3A1DDE9EBBEC7D0D3D9E4CFD3DEF1F2FC938F94231E1D
        2F2622271C1823121636242B7267693C38377E8582E2ECECC8D2D9E2E9F2D3D6
        DBE2E2E295958F3D3A35726C6D7062667F686C6E5356664F4D000B0901D8D9D0
        81867D20281ECBD6CE37423FD1DCDAEBF7F9E7EFF6DEE3ECDADBE5F6F5FE6460
        65B5AFB0F6EFECB3A9A9C6B6BDDDCCD5FCEFF1BDB8B7444843F5FBFADDE4E7E1
        E5EAD9D5DBF0EBEDEAE5E4312C291D1613FAECED472F311E0202230A08008A88
        7D6262567B7E75787C761C231E3B4644CED8D8AAB3B6C5CBD0B8BCC1C6C7CBC5
        C4C80E0C0C2E2A29302B2A211B1C2E21293D3038978F90777372151614CFD2D0
        CCCCCCDAD7D9EADEE4DFD1D5FFF4F45C504C50453DB4A29B7C605F3D1D1E5233
        3400C5C4B620201265695E878B85131A174D55542931312D35355C6162242928
        1414141715141412110602010400000E090A0700030700031C1415676261110D
        0C18141355504D5E545449383B614E513B29283929234C3F3128170A735854FF
        E3E4ECCDD0002E2F1FC4C7B7979B8F51564DB8BFBC6B71700006050F14135356
        547B7C78999A966C6C66B1B1AB9B9A966C6A6974706F61595A978D8DA69A9A97
        8B8B756A6C7E7272AB9F9B55453F1E0705563F3D8A76718575695D523E827462
        B49C964D2E2F60404500414A36878F7EB4BDB0949C927E85804146440005030B
        0F0A27292375766DB0B1A8D1D2C9E8E9E0DEDED8C9C8C4AEABA7ABA29EDBD1CA
        FFF5F1D6C7C5D6C6C79485833F2D261B06001D03002B110AB19D92BEAF9FACA4
        8DAEA38F5D493E1700001D010100ADBDAB758573727F6F64716377807691998F
        888D84A3A69D9D9E945150460908003A392F494A4017180F0607000805000C03
        001307004031286E5E571F0F094D3B348A766BBAA498947A6E9881727E6E5E4C
        402E6D665287806C7A6B5B9F8B80A0898100869C8ABAD0BE8093827B8B7AA2AC
        9F919A8DA1A59994968A77776B4F4F43303024424236636258070800090A0028
        261B302B1C130B00594E40897B6F221408423225857263D8C4B3AE9585C5AF9D
        A999885E5240A29A89D9D2BF968876BEAF9CA896850094AF9F7C98859AB2A06B
        7F6C5B6957CCD7C3848A79575A4A7A7A6C919082AFADA2818175AFAFA3B3B3A7
        9D9D918D8D7F757361ADA996DED7C6A69F8C9E9581ACA18B998A7782715C8974
        5F947F6AB09E8DC5B5A8A1958BC4B7A98978636B5A408878610083A3926A8875
        A0BAA8687F693A4934CEDAC46167548C907D9A998B5B5A4C78766B9D9B908686
        7A9B9B8F9D9D8F757666A8A896908F7B9B9784817C674F4A3198917685786294
        836EC3AE986D58437E6C5BCBBBAE5F4F49DFCFC39D8B74534124EBDEC400}
    end
    object bbtnObserva: TBitBtn
      Left = 656
      Top = 508
      Width = 35
      Height = 35
      Hint = 'Observar Planilla'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = bbtnObservaClick
      Glyph.Data = {
        7E090000424D7E0900000000000036000000280000001D0000001B0000000100
        18000000000048090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E4E4F5CBCBE88989DD5454
        E03030E02929E03030E05555E08989DDCBCBE8E4E4F5FFFFF9FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFBCBCE16161E40909E40000F90000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000F90909E36161E4BCBCE1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF04848D404
        04F50000FD0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FD0404F54848D4FFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFCFCFDF0E0EE30000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0E0EE3CFCFDFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFC9C9DD0F0FEB0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0F0FEBC9C9DDFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFE40A0AEB0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0A0AEB
        FFFFE4FFFFFFFFFFFF00FFFFFFFFFFF42121DF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0505FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF2121DFFFFFF4FFFF
        FF00FFFFFEA2A2E20000F60000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF3D3DF9B6B6EE0000FF0000FF0000FF0000FF0000
        FF0000FF1111FE7777F21616FD0000FF0000F6A2A2E2FFFFFE00F9F9F64040E1
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FFBFBFECF5F5E4FFFFE40000FF0000FF0000FF0000FF0000FF6C6CF6EBEBE5E0
        E0E61818FD0000FF0000FF4040E1F9F9F600D4D4F10000ED0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF2121FC9797F0FFFFE0F1F1E4EAEAE4F2
        F2E60000FF0000FF0808FE5252F8FFFFE3FFFFE1EFEFE4CDCDE81313FD0000FF
        0000FF0000EDD4D4F1009E9EDC0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF1717FD7F7FF2F1F1E5FEFEE2E4E4E5E5E5E6EAEAE5EBEBE60000FF5D5DF5
        C3C3EBFFFFE1E9E9E4E4E4E6EDEDE5CCCCE91313FD0000FF0000FF0000FF9E9E
        DC005C5CDF0000FF0000FF0000FF0000FF0000FF0000FF8484F3E6E6E5FAFAE3
        EAEAE5E4E4E6E5E5E6E5E5E6E8E8E5DFDFE9C3C3EBF5F5E3F2F2E4E4E4E5E5E5
        E6E5E5E6EDEDE5CCCCE91111FD0000FF0000FF0000FF5C5CDF002F2FE00000FF
        0000FF0000FF1A1AFC6565F5FFFFE2FEFEE2E8E8E5E5E5E6E5E5E6E6E6E6E6E6
        E6E6E6E6E5E5E5E9E9E7EBEBE3E6E6E6E5E5E6E6E6E6E6E6E6E5E5E6EDEDE5CA
        CAE90E0EFD0000FF0000FF0000FF3030E0005050DC4B4BFF3737FB1818FD7878
        F1FFFFDFEFEFE2E2E2E5E5E5E5E6E6E6E6E6E6E5E5E5E6E6E6E6E6E6E5E5E5E7
        E7E7E4E4E4E5E5E5E6E6E6E5E5E5E5E5E5E4E4E5EBEBE3C5C5E61414FB1D1DFD
        3D3DFB5757FF3333DC006666DC9090FF8585FD7C7CFE7171FD8585FBDCDCEDFF
        FFE4E8E8E3E1E1E1E0E0E0E2E2E2E4E4E4E4E4E4E3E3E4E7E7E5E4E4E2E2E2E2
        E0E0E0E2E2E2E5E5E5E7E7E8EEEEE9E3E3F27C7CFE7D7DFE8888FD9696FF3A3A
        DE006F6FDC8282FF7F7FFF8080FF8080FF7C7CFF6767FF9393FFE4E4F6FEFEF4
        F9F9F2F0F0F0EEEEEEEDEDEDEEEEEDECECF0E5E5F0FCFCF1F8F8F4F3F3F4F4F4
        F4F2F2F3F6F6F2E5E5F38282FF7D7DFF8282FF6E6EFF5D5DDF009D9DDC6868FF
        8181FF7E7EFF7F7FFF7F7FFF7F7FFF7575FF7373FFA6A6FAE7E7F3FFFFF0F4F4
        F1F1F1F2F6F6F2EEEEF46A6AFFBBBBF8F3F3F2FEFEEEF1F1F1F1F1F2F5F5F1E3
        E3F38181FF7C7CFF8787FF4646FF9797DC00D2D2F23A3AEA8787FF7E7EFF7F7F
        FF7F7FFF7F7FFF7F7FFF7D7DFF7474FF7B7BFEABABF9FFFFF0FDFDEFF6F6F0F3
        F3F26565FF7575FF7D7DFEC8C8F7FFFFEEF9F9F0F6F6F1E3E3F38181FF7B7BFF
        8C8CFF2626EBCBCBF200EFEFF66161E07979FF7F7FFF7F7FFF7F7FFF7F7FFF7F
        7FFF7F7FFF7F7FFF7E7EFF7373FF6363FFC1C1F8F8F8F0FBFBF26969FF8080FF
        7C7CFF6B6BFF7A7AFFD2D2F6FBFBF1E9E9F18181FF7E7EFF7070FF4747E2F4F4
        F600FFFFFF9393E05F5FF58282FF7E7EFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF
        7F7FFF7F7FFF7E7EFF6E6EFF8888FEC2C2F87373FF7F7FFF7F7FFF8080FF7A7A
        FF6C6CFF9A9AFCC3C3F78484FE8585FF4444F59191E1FFFFFF00FFFFFFFFFFF6
        2A2ADC8F8FFF7F7FFF7E7EFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7F
        FF7F7FFF7A7AFF7878FF7E7EFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7676FF7B
        7BFF8282FF8585FF1818DFFFFFF4FFFFFF00FFFFFFFFFFFFFEFEE61F1FE68484
        FF8181FF7E7EFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F
        7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7E7EFF8383FF7F7FFF0707E8
        FFFFE5FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFBABADC3B3BE77F7FFF8181FF7E
        7EFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF
        7F7FFF7F7FFF7F7FFF7E7EFF8484FF7878FF1C1CE8BDBDDDFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFC1C1E02020DF8282FF8585FF8080FF7F7FFF
        7E7EFF7E7EFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7E7EFF7E7EFF7F7FFF8080
        FF8C8CFF7777FF1111E0C2C2E0FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF13E3ED15858F56E6EFC8484FF8585FF8181FF7E7E
        FF7E7EFF7E7EFF7E7EFF7E7EFF8282FF8787FF8484FF6C6CFD3F3FF52D2DD3FF
        FFF1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFAEAEDF7070E44D4DE14444F77070FF8484FF8686FF8888FF87
        87FF8484FF6969FF3C3CF64242E26262E5AEAEE1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF9DCDCF4C9C9E88B8BDE6464DE5353DD4E4EDE5050DD5F5FDE8A8ADF
        C6C6E8DADAF4FFFFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00}
    end
    object bbtnApruebaPago: TBitBtn
      Left = 724
      Top = 508
      Width = 35
      Height = 35
      Hint = 'Aprobar Planilla'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = bbtnApruebaPagoClick
      Glyph.Data = {
        12090000424D120900000000000036000000280000001B0000001B0000000100
        180000000000DC080000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F8F6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0CEA048A246
        007800006F00007000006F000078003D9E3A93C893FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF8CC48B00770000710000750020A40D6FAE7078BD776CB66B
        3F9F3C00770000710000730073B772FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C8E1900700011
        890DC8D5CC61CB4E0BB000D5E6D4FFFFFFFFFFFFFFFFFFFFFFFFC3DFC322901F
        006F00078404F5F8F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFF007D0000700085C184FFFFFF87DD7513BB001FB20014
        AF00F6ECFBFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFA5D0A4007200007600ECF3EC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0985050071
        00C0DEC1FFFFFF87DB7D13CF0029CD0024BC0018B00042BB29FFF5FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE1EDE2007500007A00FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFF61AF5F006F00A4D0A3FFFFFF82DA7413CF002BD2
        002BD20029CC0023BA000DAD0083CC79FFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFCCE3CC006F00359933FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFEEF5EF
        006F003B9D38FFFFFF69D55615CF002BD2002BD2002BD2002BD20028CA0023B9
        0005AB00C5DDC3FFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF62B060006F00C7
        E1C8FFFFFFFFFFFFFFFFFF000000FFFFFF5BAD59007200FBEBFF53D5391AD000
        2BD2002BD2002BD2002BD2002AD2002AD10028C80020B50011AF00F0EAF4FFFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00740032982FFFFFFFFFFFFFFFFFFF00
        0000FFFFFF0077002587284DDE2A1FD0002BD2002BD2002BD2002BD20021D000
        23D0002AD2002AD10026C5001AB20032B718FFF2FFFFFEFFFFFFFFFFFFFFFFFF
        FFFFFFFF56A954007000FFFFFFFFFFFFFFFFFF000000E9EEEB00730028CF0027
        D3002BD2002BD2002BD2002BD2001ACF0077D9648EDC801CD0002BD20029CF00
        25BF0012AE0062C552FFF7FFFFFFFFFFFFFFFFFFFFFFFFFFB5D9B4007000BEDD
        BEFFFFFFFFFFFF000000ADDEA615B60027C6002BD1002BD2002BD2002BD2001D
        D0004DD436FFFBFFFFFCFF26D00127D1002BD20029CD0024BB0009AC0095D18E
        FFF9FFFFFFFFFFFFFFFFFFFFEFF5EF00700083C081FFFFFFFFFFFF0000009BC7
        9D0CA50023BC0029CD002BD2002AD1001BCB0049D12FFFF8FFFFFFFFFFFFFFD4
        EDD30ECD002AD2002BD20028C90022B70005AC00C1DCBEFFFBFFFFFFFFFFFFFF
        FFFFFF00700068B366FFFFFFFFFFFF0000009FCD9F0072002BB70D20BF0028C8
        0015BE004BC737FFFAFFFFFFFFFFFFFFFFFFFFFFFFFF7CDD6A1ACF002BD2002A
        D10027C60020B5000AAD00DEE5DEFFFCFFFFFFFFFFFFFF00700069B467FFFFFF
        FFFFFF000000B8DAB7007100C5DBC921B60305AD0063C754FFFDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFDFF37D21624D0002BD2002AD00027C4001EB40015
        B000EDE9F2FFFFFFEBF3EC00700088C386FFFFFFFFFFFF000000F5F8F6006F00
        8EC48DF4FAF594D88BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF8F5FB16CE0028D1002BD2002AD00026C3001BB20021B301FFF2FFAED4AE00
        7100C8E2C8FFFFFFFFFFFF000000FFFFFF007E001E8F1AFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0EDCE0ECD002AD1
        002BD2002ACF0026C00019B10039BD20439346007100FFFFFFFFFFFFFFFFFF00
        0000FFFFFF6AB368006F00E0EEE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3E49910CD002BD2002BD20029CD0025BF
        001DB30010AA004C974DFFFFFFFFFFFFFFFFFF000000FFFFFFFDFCFD00700021
        901EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF7BDD6D17CE002BD2002BD20029CE0026C30020B70029B90BD8E2
        DAFFF9FFFFFEFF000000FFFFFFFFFFFF7BBB7900700082BE81FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FD84A
        1ACF002BD2002BD2002AD10028CA0021BE000AB1008FCF88FFFAFF000000FFFF
        FFFFFFFFFFFFFF208F1D0070009ACA99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF63DE4A24D3002BD2002BD200
        2BD2002AD00024C80012BF00F3F5F4000000FFFFFFFFFFFFFFFFFFFFFFFF0E86
        0A0070005AAC58FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF80B3840DB70025D3002BD2002BD2002BD20010CE00CDE8CB
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42A03F006F00007B008DC4
        8BFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9DCC9C00810000700034
        8F3761DF451CCF002BD20022D1005DD446FFFBFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFB5D8B50181000070000070000C870946A24353A8
        514AA447158B11007100007000007B009CCC9BFFFFFFFFFEFF4FD6381ACF0012
        CD00F0EDF3FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC7E1C76BB4691E8E1B007800007500007700148A1162B060B9DA
        B9FFFFFFFFFFFFFFFFFFFFFFFFFFFEFF53D73862D74CFFFCFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFEFF8F0FFFFFFFFFFFFFFFFFF000000}
    end
    object Memo1: TMemo
      Left = 672
      Top = 8
      Width = 185
      Height = 89
      Lines.Strings = (
        'Memo1')
      TabOrder = 16
      Visible = False
    end
    object bbtnImprimeBoleta: TBitBtn
      Left = 395
      Top = 508
      Width = 35
      Height = 35
      Hint = 'Imprimir Boletas'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnClick = bbtnImprimeBoletaClick
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
    object cbDisenoRep: TCheckBox
      Left = 13
      Top = 520
      Width = 15
      Height = 17
      TabOrder = 18
    end
    object bbtnVisorOPago: TBitBtn
      Left = 765
      Top = 508
      Width = 35
      Height = 35
      Hint = 'Revisa '#211'rdenes de Pago generadas'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      OnClick = bbtnVisorOPagoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
    end
  end
  object pnlRegistroDetalle: TPanel
    Left = 707
    Top = 21
    Width = 684
    Height = 481
    BevelInner = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = clGradientInactiveCaption
    TabOrder = 1
    Visible = False
    object lblTipReg: TLabel
      Left = 25
      Top = 31
      Width = 66
      Height = 15
      Caption = 'Clase Auxiliar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblCnpEgr: TLabel
      Left = 25
      Top = 55
      Width = 49
      Height = 15
      Caption = 'Proveedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblCCosto: TLabel
      Left = 25
      Top = 103
      Width = 30
      Height = 15
      Caption = 'Banco'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblGlosa: TLabel
      Left = 25
      Top = 79
      Width = 28
      Height = 15
      Caption = 'Cargo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblTipPre: TLabel
      Left = 25
      Top = 127
      Width = 78
      Height = 15
      Caption = 'Cuenta Bancaria'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblPresu: TLabel
      Left = 25
      Top = 151
      Width = 40
      Height = 15
      Caption = 'Moneda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblTDoc: TLabel
      Left = 25
      Top = 172
      Width = 59
      Height = 17
      Caption = 'Documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblSerie: TLabel
      Left = 25
      Top = 195
      Width = 82
      Height = 17
      Caption = 'Serie/ N'#250'mero'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtClaseAux: TEdit
      Left = 176
      Top = 25
      Width = 116
      Height = 25
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dbeTMDet: TwwDBEdit
      Left = 112
      Top = 145
      Width = 34
      Height = 25
      CharCase = ecUpperCase
      DataField = 'TMONID'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnRegDetalleOk: TBitBtn
      Left = 610
      Top = 187
      Width = 30
      Height = 25
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = bbtnRegDetalleOkClick
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
    object bbtnCanc: TBitBtn
      Left = 610
      Top = 442
      Width = 30
      Height = 25
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnClick = bbtnCancClick
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
    object edtProv: TwwDBEdit
      Left = 176
      Top = 49
      Width = 289
      Height = 25
      DataField = 'PROVDES'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeCargoDir: TwwDBEdit
      Left = 176
      Top = 72
      Width = 289
      Height = 25
      CharCase = ecUpperCase
      DataField = 'DESCRIPCION'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object stTituloDet: TStaticText
      Left = 4
      Top = 4
      Width = 672
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSingle
      Caption = 'Detalle de Planilla de Dietas'
      Color = 8389376
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object dblcdProv: TwwDBLookupComboDlg
      Left = 112
      Top = 49
      Width = 65
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Maestro de Proveedores'
      MaxWidth = 0
      MaxHeight = 209
      OnCloseDialog = dblcdProvCloseDialog
      SearchDelay = 2
      Selected.Strings = (
        'PROV'#9'15'#9'C'#243'digo'#9'F'
        'PROVDES'#9'40'#9'Raz'#243'n Social'#9'F'
        'PROVRUC'#9'15'#9'RUC'#9'F'
        'PROVNOMCOM'#9'30'#9'Nombre Comercial'#9'F')
      DataField = 'PROV'
      LookupField = 'PROV'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 11
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdProvExit
    end
    object dblcBancoDetalle: TwwDBLookupCombo
      Left = 112
      Top = 96
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'BANCOID'#9'3'#9'Id'#9'T'
        'BANCONOM'#9'40'#9'Banco'#9'T')
      DataField = 'BANCOID'
      LookupField = 'BANCOID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      OnCloseUp = dblcBancoDetalleCloseUp
      OnExit = dblcBancoDetalleExit
    end
    object dbeBanco: TEdit
      Left = 176
      Top = 96
      Width = 289
      Height = 21
      Enabled = False
      TabOrder = 8
    end
    object dblcTDoc: TwwDBLookupCombo
      Left = 112
      Top = 170
      Width = 65
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DOCID'#9'3'#9'Id'#9'F'
        'DOCDES'#9'30'#9'Documento'#9'F')
      DataField = 'DOCID'
      LookupField = 'DOCID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 11
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcTDocCloseUp
      OnExit = dblcTDocExit
    end
    object edtTDoc: TEdit
      Left = 176
      Top = 170
      Width = 145
      Height = 25
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object edtSerie: TwwDBEdit
      Left = 112
      Top = 195
      Width = 65
      Height = 25
      CharCase = ecUpperCase
      DataField = 'CPSERIE'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtNoDoc: TwwDBEdit
      Left = 176
      Top = 195
      Width = 145
      Height = 25
      DataField = 'CPNODOC'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcClAux: TwwDBLookupCombo
      Left = 112
      Top = 25
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CLAUXID'#9'3'#9'Id.'#9'F'
        'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
      DataField = 'CLAUXID'
      LookupField = 'CLAUXID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      OnCloseUp = dblcClAuxCloseUp
      OnExit = dblcClAuxExit
    end
    object edtCuenta: TEdit
      Left = 112
      Top = 120
      Width = 353
      Height = 25
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object pnlDetCpto: TPanel
      Left = 4
      Top = 232
      Width = 669
      Height = 201
      TabOrder = 16
      object dbgDietaDirecto: TwwDBGrid
        Left = 16
        Top = 8
        Width = 633
        Height = 169
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clWhite
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        KeyOptions = [dgEnterToTab]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Times New Roman'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = True
        UseTFields = False
        OnDblClick = dbgDietaDirectoDblClick
        OnKeyDown = dbgDietaDirectoKeyDown
        object wwIButton1: TwwIButton
          Left = 0
          Top = 0
          Width = 25
          Height = 32
          Hint = 'A'#241'ade Registros'
          AllowAllUp = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = wwIButton1Click
        end
      end
      object pnlConceptoDet: TPanel
        Left = 187
        Top = 0
        Width = 342
        Height = 193
        BevelInner = bvLowered
        BevelWidth = 2
        BorderStyle = bsSingle
        Color = clGradientInactiveCaption
        TabOrder = 1
        Visible = False
        object Label2: TLabel
          Left = 6
          Top = 31
          Width = 47
          Height = 15
          Caption = 'Concepto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 6
          Top = 81
          Width = 39
          Height = 15
          Caption = 'Importe'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 6
          Top = 105
          Width = 56
          Height = 15
          Caption = 'Suma/Resta'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 6
          Top = 127
          Width = 54
          Height = 15
          Caption = 'Afecto 4ta.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label7: TLabel
          Left = 6
          Top = 55
          Width = 58
          Height = 15
          Caption = 'Descripci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object edtConcepto: TEdit
          Left = 67
          Top = 49
          Width = 265
          Height = 25
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object dbeSR: TwwDBEdit
          Left = 67
          Top = 99
          Width = 87
          Height = 25
          CharCase = ecUpperCase
          DataField = 'SUMRES'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          MaxLength = 1
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
          UnboundAlignment = taCenter
          WantReturns = False
          WordWrap = False
          OnExit = dbeSRExit
        end
        object bbtnGrabaCnpDet: TBitBtn
          Left = 258
          Top = 157
          Width = 30
          Height = 25
          Hint = 'Confirma Actualizaci'#243'n'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = bbtnGrabaCnpDetClick
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
        object bbtnCancelDetCpto: TBitBtn
          Left = 295
          Top = 157
          Width = 30
          Height = 25
          Hint = 'Cancela Actualizaci'#243'n'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = bbtnCancelDetCptoClick
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
        object StaticText3: TStaticText
          Left = 4
          Top = 4
          Width = 330
          Height = 17
          Align = alTop
          Alignment = taCenter
          BorderStyle = sbsSingle
          Caption = 'Detalle de Conceptos'
          Color = 8389376
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 6
        end
        object dbeImporte: TwwDBEdit
          Left = 67
          Top = 75
          Width = 88
          Height = 21
          CharCase = ecUpperCase
          DataField = 'IMPORTE'
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbeImporteExit
        end
        object dblcAfecto: TwwDBLookupCombo
          Left = 67
          Top = 125
          Width = 52
          Height = 25
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DOCID'#9'3'#9'Id'#9'F'
            'DOCDES'#9'30'#9'Documento'#9'F')
          DataField = 'AFECTO4TA'
          LookupField = 'AFECTO4TA'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          SearchDelay = 2
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblcAfectoExit
        end
        object dblcCnpEgrDet: TwwDBLookupComboDlg
          Left = 67
          Top = 25
          Width = 90
          Height = 25
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
          GridColor = clWhite
          GridTitleAlignment = taLeftJustify
          Caption = 'Concepto'
          MaxWidth = 0
          MaxHeight = 209
          SearchDelay = 2
          Selected.Strings = (
            'CPTOID'#9'15'#9'Concepto'#9'F'
            'CPTODES'#9'40'#9'Descripci'#243'n'#9'F'
            'CUENTAID'#9'20'#9'Cuenta'#9'F')
          DataField = 'CPTOID'
          LookupField = 'CPTOID'
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          MaxLength = 15
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = dblcCnpEgrDetEnter
          OnExit = dblcCnpEgrDetExit
        end
      end
    end
    object dblcdCargo: TwwDBLookupComboDlg
      Left = 112
      Top = 72
      Width = 65
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      OnCloseDialog = dblcdCargoCloseDialog
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdCargoExit
    end
  end
  object pnlNumPllaBco: TPanel
    Left = 269
    Top = 200
    Width = 564
    Height = 300
    Color = clGradientInactiveCaption
    TabOrder = 2
    Visible = False
    object lblOPago: TLabel
      Left = 97
      Top = 173
      Width = 64
      Height = 13
      Caption = 'N'#250'm. O.Pago'
    end
    object lblNumPlaOPago: TLabel
      Left = 97
      Top = 203
      Width = 64
      Height = 13
      Caption = 'N'#250'm.Plla.Bco'
    end
    object lblNumOpBco: TLabel
      Left = 97
      Top = 233
      Width = 61
      Height = 13
      Caption = 'N'#250'm.Op.Bco'
    end
    object bbtnOkNumPllaBco: TBitBtn
      Left = 313
      Top = 265
      Width = 30
      Height = 25
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bbtnOkNumPllaBcoClick
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
    object bbtnExitNumPllaBco: TBitBtn
      Left = 350
      Top = 265
      Width = 30
      Height = 25
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnExitNumPllaBcoClick
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
    object dbgNumPllaBco: TwwDBGrid
      Left = 32
      Top = 32
      Width = 497
      Height = 120
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      ReadOnly = True
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
    object dbeNumOPago: TwwDBEdit
      Left = 168
      Top = 170
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNumPllaOpago: TwwDBEdit
      Left = 168
      Top = 200
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeNumPllaOpagoExit
    end
    object dbeNumOp: TwwDBEdit
      Left = 168
      Top = 230
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeNumOpExit
    end
  end
  object sdGraba: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 
      '*.TXT  ( Archivo Texto )|*.txt|*.DOC  ( Archivo Texto )|*.doc|*.' +
      '*   ( Todos )|*.*'
    Title = 'Nombre de Archivo Texto'
    Left = 735
    Top = 485
  end
  object pprPlanillaDietas: TppReport
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
    Template.FileName = 'C:\DemaExes\RTMS\OP\Dema\PlanillaDietas.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 419
    Top = 417
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object pprBoletaDietas: TppReport
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
    Template.FileName = 'C:\DemaExes\RTMS\OP\Dema\DietasBoletas.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 419
    Top = 449
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppdbPllaCab: TppDBPipeline
    UserName = 'dbPllaCab'
    Left = 283
    Top = 417
  end
  object ppdbPllaDet: TppDBPipeline
    UserName = 'dbPllaDet'
    Left = 323
    Top = 417
  end
  object ppdbPllaConc: TppDBPipeline
    UserName = 'dbPllaConc'
    Left = 371
    Top = 417
  end
  object ppdbPllaBcos: TppDBPipeline
    UserName = 'dbPllaBcos'
    Left = 331
    Top = 449
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
    IniStorageType = 'IniFile'
    IniStorageName = 'C:\DemaExes\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 491
    Top = 433
  end
end
