object FOPagoTransfInterb: TFOPagoTransfInterb
  Left = 349
  Top = 148
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Transferencia Interbancaria'
  ClientHeight = 430
  ClientWidth = 382
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlConstancia: TPanel
    Left = 6
    Top = 7
    Width = 371
    Height = 410
    TabOrder = 0
    object Label9: TLabel
      Left = 1
      Top = 1
      Width = 369
      Height = 15
      Align = alTop
      Alignment = taCenter
      Caption = 'Transferencia Interbancaria'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object bbtnActDatosTrans: TBitBtn
      Left = 286
      Top = 370
      Width = 33
      Height = 25
      Hint = 'Actualiza datos por Transferencia Interbancaria'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnActDatosTransClick
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
    object bbtnCierraDatos: TBitBtn
      Left = 330
      Top = 370
      Width = 33
      Height = 25
      TabOrder = 4
      OnClick = bbtnCierraDatosClick
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
    object gbProveedor: TGroupBox
      Left = 4
      Top = 19
      Width = 355
      Height = 78
      Caption = 'Datos del Proveedor'
      TabOrder = 0
      object lblClaseAux: TLabel
        Left = 6
        Top = 12
        Width = 29
        Height = 17
        Caption = 'Clase'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblProvId: TLabel
        Left = 60
        Top = 12
        Width = 35
        Height = 17
        Caption = 'Código'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblRazSocial: TLabel
        Left = 148
        Top = 12
        Width = 125
        Height = 17
        Caption = 'Nombre / Razón Social'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcClAux: TwwDBLookupCombo
        Left = 6
        Top = 28
        Width = 44
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
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcClAuxExit
      end
      object edtProv: TEdit
        Left = 150
        Top = 28
        Width = 198
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 2
      end
      object dblcdProv: TwwDBLookupComboDlg
        Left = 58
        Top = 28
        Width = 87
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        CharCase = ecUpperCase
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Maestro de Proveedores'
        MaxWidth = 0
        MaxHeight = 209
        SearchDelay = 2
        Selected.Strings = (
          'PROV'#9'15'#9'Código'#9'F'
          'PROVDES'#9'40'#9'Razón Social'#9'F'
          'PROVRUC'#9'15'#9'RUC'#9'F'
          'PROVNOMCOM'#9'30'#9'Nombre Comercial'#9'F')
        DataField = 'PROV'
        LookupField = 'PROV'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 11
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcdProvExit
        OnKeyPress = dblcdProvKeyPress
      end
    end
    object gbBcoTransf: TGroupBox
      Left = 4
      Top = 80
      Width = 355
      Height = 105
      Caption = 'Datos del Banco de Transferencia'
      TabOrder = 1
      object lblBanco: TLabel
        Left = 6
        Top = 12
        Width = 32
        Height = 17
        Caption = 'Banco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblCtaCte: TLabel
        Left = 6
        Top = 54
        Width = 42
        Height = 17
        Caption = 'Cta Cte'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblTMoneda: TLabel
        Left = 228
        Top = 54
        Width = 68
        Height = 17
        Caption = 'Tipo Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object edtBanco: TEdit
        Left = 60
        Top = 28
        Width = 273
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dblcTMon: TwwDBLookupCombo
        Left = 230
        Top = 72
        Width = 47
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
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
        Enabled = False
        Frame.Enabled = True
        ParentFont = False
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
      end
      object edtTMon: TEdit
        Left = 284
        Top = 72
        Width = 53
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object dbeCtaCte: TwwDBEdit
        Left = 6
        Top = 72
        Width = 211
        Height = 21
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcBanco: TwwDBLookupCombo
        Left = 7
        Top = 28
        Width = 49
        Height = 21
        DropDownAlignment = taLeftJustify
        DataField = 'BANCOID'
        LookupField = 'BANCOID'
        MaxLength = 2
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcBancoExit
      end
    end
    object gbDatosComision: TGroupBox
      Left = 6
      Top = 192
      Width = 355
      Height = 167
      Caption = 'Datos Comisión por Transferencia Interbancaria'
      TabOrder = 2
      object lblCtaCnt: TLabel
        Left = 6
        Top = 12
        Width = 88
        Height = 17
        Caption = 'Cuenta Contable'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblCCosto: TLabel
        Left = 6
        Top = 64
        Width = 88
        Height = 17
        Caption = 'Centro de Costo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblImporteComision: TLabel
        Left = 6
        Top = 112
        Width = 118
        Height = 17
        Caption = 'Importe por Comisión'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object edtCtaCnt: TEdit
        Left = 101
        Top = 28
        Width = 213
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtCCosto: TEdit
        Left = 103
        Top = 82
        Width = 213
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object dbeImporteComis: TwwDBEdit
        Left = 6
        Top = 136
        Width = 121
        Height = 21
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcdCtaCnt: TwwDBLookupComboDlg
        Left = 6
        Top = 28
        Width = 90
        Height = 21
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        OnExit = dblcdCtaCntExit
      end
      object dblcdCCosto: TwwDBLookupComboDlg
        Left = 6
        Top = 81
        Width = 87
        Height = 21
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Enabled = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dblcdCCostoExit
      end
    end
  end
end
