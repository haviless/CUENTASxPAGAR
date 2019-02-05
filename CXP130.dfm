object FListaOrdenPago: TFListaOrdenPago
  Left = 430
  Top = 149
  Width = 736
  Height = 499
  Caption = 'Solicitud Orden de Pago'
  Color = clBtnFace
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
  object dbgOrdenPago: TwwDBGrid
    Left = 8
    Top = 8
    Width = 705
    Height = 273
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = 16053492
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
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
    OnTitleButtonClick = dbgOrdenPagoTitleButtonClick
    OnDblClick = dbgOrdenPagoDblClick
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
    end
  end
  object pnlBusca: TPanel
    Left = 267
    Top = 77
    Width = 257
    Height = 81
    BevelInner = bvRaised
    BevelWidth = 2
    TabOrder = 1
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
      DataSource = DMCXP.dsQry1
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
  object pnlDetalle: TPanel
    Left = 8
    Top = 280
    Width = 465
    Height = 174
    BevelInner = bvRaised
    BevelWidth = 2
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 43
      Width = 95
      Height = 16
      Caption = 'Tipo de Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 12
      Top = 65
      Width = 50
      Height = 16
      Caption = 'Concepto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 14
      Top = 85
      Width = 30
      Height = 16
      Caption = 'Glosa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 14
      Top = 113
      Width = 93
      Height = 16
      Caption = 'Centro de Costo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 216
      Top = 66
      Width = 39
      Height = 16
      Caption = 'Cuenta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 366
      Top = 66
      Width = 41
      Height = 16
      Caption = 'Detrac'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 12
      Top = 18
      Width = 51
      Height = 16
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dblcTRegistroOP: TwwDBLookupCombo
      Left = 118
      Top = 38
      Width = 47
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TREGID'#9'3'#9'Tipo de Registro'#9'F'
        'TREGDES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'TREGID'
      LookupField = 'TREGID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      ParentFont = False
      TabOrder = 11
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      UseTFields = False
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcTRegistroOPEnter
      OnExit = dblcTRegistroOPExit
    end
    object dblcdCnpEgrOP: TwwDBLookupComboDlg
      Left = 118
      Top = 62
      Width = 90
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
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
      OnEnter = dblcdCnpEgrOPEnter
      OnExit = dblcdCnpEgrOPExit
    end
    object dbeGlosaOP: TwwDBEdit
      Left = 118
      Top = 86
      Width = 328
      Height = 23
      CharCase = ecUpperCase
      DataField = 'DCPGLOSA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdCCostoOP: TwwDBLookupComboDlg
      Left = 118
      Top = 109
      Width = 90
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
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
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnExit = dblcdCCostoOPExit
    end
    object edtTRegistroOP: TEdit
      Left = 168
      Top = 38
      Width = 278
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object dbeCuentaOP: TwwDBEdit
      Left = 265
      Top = 63
      Width = 94
      Height = 23
      DataField = 'CUENTAID'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeDetracOP: TwwDBEdit
      Left = 415
      Top = 63
      Width = 31
      Height = 23
      DataField = 'DTRPORC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = False
    end
    object edtCCostoOP: TEdit
      Left = 208
      Top = 108
      Width = 238
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object bbtnRegOk: TBitBtn
      Left = 380
      Top = 138
      Width = 30
      Height = 25
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
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
    object bbtnRegCanc: TBitBtn
      Left = 415
      Top = 138
      Width = 30
      Height = 25
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
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
    object edtCiaOP: TEdit
      Left = 168
      Top = 14
      Width = 278
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object dblcCiaOP: TwwDBLookupCombo
      Left = 118
      Top = 14
      Width = 47
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'20'#9'Raz'#243'n Social'#9'F')
      DataField = 'CIAID'
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcCiaOPEnter
      OnExit = dblcCiaOPExit
    end
  end
end
