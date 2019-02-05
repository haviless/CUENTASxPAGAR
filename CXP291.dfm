object FPlantillaDieta: TFPlantillaDieta
  Left = 149
  Top = 116
  Width = 765
  Height = 480
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDietaDirecto: TwwDBGrid
    Left = 0
    Top = 192
    Width = 744
    Height = 201
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
  object pnlDetalle: TPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 193
    BevelInner = bvRaised
    BevelWidth = 2
    Color = clSkyBlue
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 46
      Width = 112
      Height = 16
      Caption = 'N'#250'mero de Plantilla'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 171
      Top = 92
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
    object Label5: TLabel
      Left = 170
      Top = 138
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
    object Label3: TLabel
      Left = 170
      Top = 46
      Width = 147
      Height = 16
      Caption = 'Descripci'#243'n de la Plantilla'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 24
      Top = 6
      Width = 263
      Height = 16
      Caption = 'PLANTILLAS DE DIETAS DE DIRECTORIO'
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
    object edtDescripcionPlant: TEdit
      Left = 172
      Top = 63
      Width = 357
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object meNoReg: TwwDBEdit
      Left = 43
      Top = 64
      Width = 54
      Height = 25
      DataField = 'DTRPORC'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = False
    end
    object dblcTMon: TwwDBLookupCombo
      Left = 170
      Top = 157
      Width = 43
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
      DataField = 'TMONID'
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines]
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcTMonEnter
      OnExit = dblcTMonExit
    end
    object edtTMon: TEdit
      Left = 214
      Top = 157
      Width = 107
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
      Left = 170
      Top = 110
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
      Caption = 'Centro de Costo'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'CCOSID'#9'15'#9'Id'#9'F'
        'CCOSDES'#9'30'#9'Centro de Costo'#9'F')
      DataField = 'CCOSID'
      LookupField = 'CCOSID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 12
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnExit = dblcdCCostoExit
    end
    object edtCCosto: TEdit
      Left = 262
      Top = 110
      Width = 267
      Height = 25
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object bbtnOK: TBitBtn
      Left = 497
      Top = 148
      Width = 32
      Height = 32
      Hint = 'Pasa a Registrar Detalle'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnOKClick
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
  end
  object bbtnRegCanc: TBitBtn
    Left = 714
    Top = 400
    Width = 30
    Height = 30
    Hint = 'Cancela Actualizaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = bbtnRegCancClick
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
  object pnlRegistro: TPanel
    Left = 17
    Top = 168
    Width = 480
    Height = 257
    BevelInner = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = clGradientInactiveCaption
    TabOrder = 3
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
      Width = 30
      Height = 17
      Caption = 'Serie'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtTipReg: TEdit
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
      TabOrder = 9
    end
    object dbeTM: TwwDBEdit
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
      TabOrder = 14
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnRegOk: TBitBtn
      Left = 400
      Top = 221
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
    object bbtnCanc: TBitBtn
      Left = 432
      Top = 221
      Width = 30
      Height = 25
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
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
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeGlosa: TwwDBEdit
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
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object StaticText1: TStaticText
      Left = 4
      Top = 4
      Width = 468
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSingle
      Caption = 'Detalle de Plantillas'
      Color = 8389376
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 8
    end
    object dblcdCargo: TwwDBLookupComboDlg
      Left = 112
      Top = 74
      Width = 65
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Cargo'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'CCOSID'#9'15'#9'Id'#9'F'
        'CCOSDES'#9'30'#9'Centro de Costo'#9'F')
      DataField = 'IDCARGO'
      LookupField = 'IDCARGO'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 12
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnExit = dblcdCargoExit
    end
    object dblcdProv: TwwDBLookupComboDlg
      Left = 112
      Top = 50
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
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdProvExit
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 112
      Top = 98
      Width = 64
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
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcBancoExit
    end
    object dbeBanco: TEdit
      Left = 176
      Top = 96
      Width = 289
      Height = 21
      Enabled = False
      TabOrder = 12
    end
    object dblcTDoc: TwwDBLookupCombo
      Left = 112
      Top = 170
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
      DataField = 'DOCID'
      LookupField = 'DOCID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTDocExit
    end
    object edtTDoc: TEdit
      Left = 163
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
      TabOrder = 13
    end
    object edtSerie: TwwDBEdit
      Left = 112
      Top = 195
      Width = 51
      Height = 25
      CharCase = ecUpperCase
      DataField = 'CPSERIE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = edtSerieExit
    end
    object dblcClAux: TwwDBLookupCombo
      Left = 112
      Top = 26
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
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
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
      TabOrder = 15
    end
  end
  object bbtnImportDetalles: TBitBtn
    Left = 628
    Top = 400
    Width = 27
    Height = 30
    Hint = 'Detalle de Conceptos'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = bbtnImportDetallesClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
      007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
      7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
      99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
end
