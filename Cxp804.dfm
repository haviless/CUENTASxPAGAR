object FActLetra: TFActLetra
  Left = 192
  Top = 107
  Width = 737
  Height = 373
  Caption = 'FActLetra'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgLetras: TwwDBGrid
    Left = 2
    Top = 64
    Width = 723
    Height = 275
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 2
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clTeal
    TitleFont.Height = -11
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = [fsBold]
    TitleLines = 1
    TitleButtons = False
    OnDblClick = dbgLetrasDblClick
    object dbgLetrasIButton: TwwIButton
      Left = 0
      Top = 0
      Width = 31
      Height = 48
      AllowAllUp = True
    end
  end
  object gbProv: TGroupBox
    Left = 2
    Top = 0
    Width = 723
    Height = 63
    TabOrder = 0
    object Label6: TLabel
      Left = 203
      Top = 11
      Width = 42
      Height = 16
      Caption = 'Cl.Aux.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblProv: TLabel
      Left = 260
      Top = 11
      Width = 57
      Height = 16
      Caption = 'Proveedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 357
      Top = 11
      Width = 41
      Height = 16
      Caption = 'Periodo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblCia: TLabel
      Left = 11
      Top = 11
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
    object Label2: TLabel
      Left = 423
      Top = 11
      Width = 61
      Height = 16
      Caption = 'Documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dblcClAux: TwwDBLookupCombo
      Left = 204
      Top = 30
      Width = 49
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CLAUXID'#9'2'#9'Id.'#9'F'
        'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
      LookupTable = DMCXP.cdsClAux
      LookupField = 'CLAUXID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      ParentFont = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcClAuxExit
    end
    object dblcdProv: TwwDBLookupComboDlg
      Left = 259
      Top = 30
      Width = 90
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
        'PROV'#9'15'#9'C'#243'digo'#9'F'
        'PROVDES'#9'40'#9'Raz'#243'n Social'#9'F'
        'PROVRUC'#9'15'#9'RUC'#9'F'
        'PROVNOMCOM'#9'30'#9'Nombre Comercial'#9'F')
      LookupTable = DMCXP.cdsProv
      LookupField = 'PROV'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtPeriodo: TEdit
      Left = 353
      Top = 30
      Width = 64
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object dblcCia: TwwDBLookupCombo
      Left = 9
      Top = 30
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      LookupTable = DMCXP.cdsCia
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
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 52
      Top = 30
      Width = 137
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Z2bbtnAcepta: TBitBtn
      Left = 617
      Top = 24
      Width = 30
      Height = 30
      Hint = 'Acepta Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = Z2bbtnAceptaClick
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
    object dblcTDoc: TwwDBLookupCombo
      Left = 423
      Top = 29
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DOCID'#9'2'#9'Doc.'#9'F'
        'DOCABR'#9'8'#9'Descripci'#243'n'#9'F')
      LookupTable = DMCXP.cdsTDoc
      LookupField = 'DOCID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 5
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
      Left = 469
      Top = 29
      Width = 92
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
  end
  object pnlActualiza: TPanel
    Left = 240
    Top = 136
    Width = 211
    Height = 73
    BevelInner = bvRaised
    BevelWidth = 2
    TabOrder = 1
    Visible = False
    object Label3: TLabel
      Left = 21
      Top = 20
      Width = 74
      Height = 16
      Caption = 'Fecha Vcmto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object bbtnRegOk: TBitBtn
      Left = 127
      Top = 33
      Width = 30
      Height = 25
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
      Left = 159
      Top = 33
      Width = 30
      Height = 25
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
    object dbdtpFVcmto: TwwDBDateTimePicker
      Left = 20
      Top = 35
      Width = 101
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'CPFVCMTO'
      DataSource = DMCXP.dsLetras
      Epoch = 1950
      ShowButton = True
      TabOrder = 0
    end
    object dbdtpFvcmtoTemp: TwwDBDateTimePicker
      Left = 148
      Top = 11
      Width = 37
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 3
      Visible = False
    end
  end
end
