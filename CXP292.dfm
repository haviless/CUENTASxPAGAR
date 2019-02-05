object FPlantillaDetalle: TFPlantillaDetalle
  Left = 427
  Top = 219
  Width = 575
  Height = 376
  BorderIcons = [biSystemMenu]
  Caption = 'Obligaciones por Pagar - Dietas de Directorio'
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
  object dbgDietaDirecto: TwwDBGrid
    Left = 0
    Top = 128
    Width = 553
    Height = 201
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
    object btnActReg: TwwIButton
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
      OnClick = btnActRegClick
    end
  end
  object pnlDetalle: TPanel
    Left = 0
    Top = 0
    Width = 553
    Height = 129
    BevelInner = bvRaised
    BevelWidth = 2
    Color = clSkyBlue
    TabOrder = 1
    object Label7: TLabel
      Left = 9
      Top = 6
      Width = 157
      Height = 16
      Caption = 'DETALLE DE CONCEPTOS'
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
    object GroupBox1: TGroupBox
      Left = 9
      Top = 40
      Width = 537
      Height = 73
      Caption = 'Datos del Directivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label3: TLabel
        Left = 90
        Top = 22
        Width = 45
        Height = 16
        Caption = 'Nombre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 386
        Top = 23
        Width = 32
        Height = 16
        Caption = 'Cargo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblNumero: TLabel
        Left = 194
        Top = 6
        Width = 103
        Height = 16
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Visible = False
      end
      object lblclauxid: TLabel
        Left = 2
        Top = 14
        Width = 47
        Height = 16
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Visible = False
      end
      object Label1: TLabel
        Left = 8
        Top = 22
        Width = 35
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edtCodProv: TwwDBEdit
        Left = 8
        Top = 40
        Width = 73
        Height = 25
        DataField = 'PROV'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        UsePictureMask = False
        WantReturns = False
        WordWrap = False
      end
      object edtDescripcionProv: TEdit
        Left = 84
        Top = 40
        Width = 293
        Height = 25
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtCargo: TEdit
        Left = 380
        Top = 40
        Width = 149
        Height = 25
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object pnlRegistro: TPanel
    Left = 153
    Top = 128
    Width = 342
    Height = 193
    BevelInner = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = clGradientInactiveCaption
    TabOrder = 2
    Visible = False
    object lblTipReg: TLabel
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
    object lblTipPre: TLabel
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
    object lblPresu: TLabel
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
    object lblTDoc: TLabel
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
    object Label4: TLabel
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
      TabOrder = 2
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
      TabOrder = 4
      UnboundDataType = wwDefault
      UnboundAlignment = taCenter
      WantReturns = False
      WordWrap = False
      OnExit = dbeSRExit
    end
    object bbtnRegOk: TBitBtn
      Left = 204
      Top = 157
      Width = 30
      Height = 25
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
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
      Left = 244
      Top = 157
      Width = 30
      Height = 25
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
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
      TabOrder = 0
    end
    object dbeImporte: TwwDBEdit
      Left = 67
      Top = 75
      Width = 88
      Height = 21
      CharCase = ecUpperCase
      DataField = 'IMPORTE'
      TabOrder = 3
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
      DataField = 'VALOR'
      LookupField = 'VALOR'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcAfectoExit
    end
    object dblcdCnpEgr: TwwDBLookupComboDlg
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
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdCnpEgrExit
    end
  end
end
