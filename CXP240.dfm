object FAplicaCaja: TFAplicaCaja
  Left = 244
  Top = 133
  Width = 770
  Height = 560
  Caption = 'Aplica Pagos de Caja'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCab1: TPanel
    Left = 10
    Top = 5
    Width = 743
    Height = 134
    Color = 14869218
    Enabled = False
    TabOrder = 0
    object lblCia: TLabel
      Left = 16
      Top = 3
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
    object lblProv: TLabel
      Left = 300
      Top = 3
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
    object lblProvNom: TLabel
      Left = 387
      Top = 3
      Width = 71
      Height = 16
      Caption = 'Raz'#243'n Social'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 222
      Top = 3
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
    object Label15: TLabel
      Left = 625
      Top = 3
      Width = 85
      Height = 16
      Caption = 'F.Comprobante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblTDoc: TLabel
      Left = 14
      Top = 44
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
    object lblSerie: TLabel
      Left = 211
      Top = 44
      Width = 31
      Height = 16
      Caption = 'Serie'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblNoDoc: TLabel
      Left = 273
      Top = 44
      Width = 82
      Height = 16
      Caption = 'No.Documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblTDiario: TLabel
      Left = 398
      Top = 44
      Width = 81
      Height = 16
      Caption = 'Tipo de Diario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblNoReg: TLabel
      Left = 629
      Top = 44
      Width = 69
      Height = 16
      Caption = 'No.Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblAnoMes: TLabel
      Left = 559
      Top = 44
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
    object Label3: TLabel
      Left = 269
      Top = 105
      Width = 67
      Height = 16
      Caption = 'Saldo M.N.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 501
      Top = 105
      Width = 65
      Height = 16
      Caption = 'Saldo M.E.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label11: TLabel
      Left = 16
      Top = 87
      Width = 57
      Height = 16
      Caption = 'T.Moneda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dblcCia: TwwDBLookupCombo
      Left = 16
      Top = 19
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
        'CIAABR'#9'20'#9'Raz'#243'n Social'#9'F')
      DataField = 'CIAID'
      DataSource = DMCXP.dsMovCxP
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
    end
    object edtCia: TEdit
      Left = 59
      Top = 19
      Width = 130
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
    object dblcdProv: TwwDBLookupComboDlg
      Left = 263
      Top = 19
      Width = 120
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
      DataField = 'PROV'
      DataSource = DMCXP.dsMovCxP
      LookupTable = DMCXP.cdsProv
      LookupField = 'PROV'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 11
      ParentFont = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtProv: TEdit
      Left = 385
      Top = 19
      Width = 222
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
      TabOrder = 4
    end
    object dblcClAux: TwwDBLookupCombo
      Left = 219
      Top = 19
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CLAUXID'#9'3'#9'Id.'#9'F'
        'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
      DataField = 'CLAUXID'
      DataSource = DMCXP.dsMovCxP
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
    end
    object dtpFComp: TwwDBDateTimePicker
      Left = 624
      Top = 19
      Width = 90
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'CPFCMPRB'
      DataSource = DMCXP.dsMovCxP
      Date = 37176.000000000000000000
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 5
    end
    object edtTDoc: TEdit
      Left = 59
      Top = 60
      Width = 130
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
    object dblcTDiario: TwwDBLookupCombo
      Left = 394
      Top = 60
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TDIARID'#9'3'#9'Tipo de Diario'#9'F'
        'TDIARDES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'TDIARID'
      DataSource = DMCXP.dsMovCxP
      LookupTable = DMCXP.cdsTDiario
      LookupField = 'TDIARID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      MaxLength = 2
      ParentFont = False
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      UseTFields = False
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtTDiario: TEdit
      Left = 437
      Top = 60
      Width = 100
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object edtSerie: TwwDBEdit
      Left = 202
      Top = 60
      Width = 50
      Height = 23
      DataField = 'CPSERIE'
      DataSource = DMCXP.dsMovCxP
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtNoDoc: TwwDBEdit
      Left = 259
      Top = 60
      Width = 121
      Height = 23
      DataField = 'CPNODOC'
      DataSource = DMCXP.dsMovCxP
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object meNoReg: TwwDBEdit
      Left = 625
      Top = 60
      Width = 90
      Height = 23
      DataField = 'CPNOREG'
      DataSource = DMCXP.dsMovCxP
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTDoc: TwwDBLookupCombo
      Left = 16
      Top = 60
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DOCID'#9'3'#9'Id'#9'F'
        'DOCDES'#9'30'#9'Documento'#9'F')
      DataField = 'DOCID'
      DataSource = DMCXP.dsMovCxP
      LookupTable = DMCXP.cdsTDoc
      LookupField = 'DOCID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object meAnoMM: TwwDBEdit
      Left = 552
      Top = 60
      Width = 60
      Height = 23
      DataField = 'CPANOMES'
      DataSource = DMCXP.dsMovCxP
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeSalMN: TwwDBEdit
      Left = 342
      Top = 102
      Width = 121
      Height = 21
      TabOrder = 14
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeSalME: TwwDBEdit
      Left = 572
      Top = 102
      Width = 121
      Height = 21
      TabOrder = 15
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTMon: TwwDBLookupCombo
      Left = 16
      Top = 103
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
      DataField = 'TMONID'
      DataSource = DMCXP.dsMovCxP
      LookupTable = DMCXP.cdsTMon
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines]
      MaxLength = 2
      ParentFont = False
      TabOrder = 16
      AutoDropDown = True
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object edtTMon: TEdit
      Left = 60
      Top = 103
      Width = 139
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
    end
  end
  object Panel1: TPanel
    Left = 10
    Top = 144
    Width = 743
    Height = 234
    Caption = 'Panel1'
    Color = 14869218
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 741
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = 'Pagos adelantados'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object dbgPagos: TwwDBGrid
      Left = 9
      Top = 27
      Width = 721
      Height = 195
      DisableThemesInTitle = False
      Selected.Strings = (
        'BANCOID'#9'3'#9'Id'#9'T'
        'BANCOABR'#9'15'#9'Banco~Nombre'#9'T'
        'CCBCOID'#9'15'#9'Cuenta~Corriente'#9'T'
        'ECNOCHQ'#9'12'#9'No.Cheque'#9'T'
        'ECFEMICH'#9'11'#9'Fecha'#9'T'
        'ECTCAMB'#9'7'#9'TC'#9'T'
        'ECSALMN'#9'10'#9'Saldo~MN'#9'T'
        'ECSALME'#9'10'#9'Saldo~ME'#9'T'
        'PAGOMN'#9'11'#9'Pago~MN'#9'F'
        'PAGOME'#9'11'#9'Pago~ME'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DMCXP.dsDetCanje
      KeyOptions = [dgEnterToTab]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnColExit = dbgPagosColExit
      FooterColor = 7566265
    end
  end
  object Z2bbtnAcepta: TBitBtn
    Left = 622
    Top = 496
    Width = 30
    Height = 30
    Hint = 'Acepta Registro'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
  object bbtnCancela: TBitBtn
    Left = 692
    Top = 496
    Width = 30
    Height = 30
    Hint = 'Cancela Actualizaciones del Detalle'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      04000000000068010000CE0E0000D80E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033911833333333333333333F333333333333
      0000339111833333911333333388F333333F3333000033911118333911118333
      38F38F333F88F33300003339111183911111833338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003339
      1118333911183333338F33838F338F33000033911183333391118333338FF833
      38F338F300003391183333333911133333388333338FFF830000333913333333
      3391833333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object pnlCanje: TPanel
    Left = 10
    Top = 384
    Width = 743
    Height = 104
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label2: TLabel
      Left = 14
      Top = 4
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
    object Label8: TLabel
      Left = 457
      Top = 4
      Width = 85
      Height = 16
      Caption = 'F.Comprobante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 562
      Top = 4
      Width = 52
      Height = 16
      Caption = 'T.Cambio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 644
      Top = 4
      Width = 26
      Height = 16
      Caption = 'Lote'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 317
      Top = 70
      Width = 55
      Height = 23
      Caption = 'Periodo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 8
      Top = 50
      Width = 721
      Height = 5
    end
    object Label7: TLabel
      Left = 17
      Top = 70
      Width = 108
      Height = 23
      Caption = 'Canje de Caja'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 519
      Top = 70
      Width = 99
      Height = 23
      Caption = 'Comprobante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 240
      Top = 4
      Width = 81
      Height = 16
      Caption = 'Tipo de Diario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtDocDes2: TEdit
      Left = 59
      Top = 21
      Width = 160
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dbdtpFEmis: TwwDBDateTimePicker
      Left = 456
      Top = 21
      Width = 90
      Height = 22
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Date = 37257.000000000000000000
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 2
      OnExit = dbdtpFEmisExit
    end
    object dblcDoc2: TwwDBLookupCombo
      Left = 16
      Top = 21
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DOCID'#9'3'#9'Id'#9'F'
        'DOCDES'#9'30'#9'Documento'#9'F')
      LookupTable = DMCXP.cdsTDoc
      LookupField = 'DOCID'
      Options = [loColLines, loRowLines, loTitles]
      Enabled = False
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbeTCambio: TwwDBEdit
      Left = 562
      Top = 21
      Width = 55
      Height = 23
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Picture.PictureMask = '[#][#][.][#][#][#]'
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeLote: TwwDBEdit
      Left = 638
      Top = 21
      Width = 78
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeAnoMM: TwwDBEdit
      Left = 384
      Top = 70
      Width = 60
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtCanje: TEdit
      Left = 135
      Top = 70
      Width = 55
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
      TabOrder = 6
    end
    object edtComp: TEdit
      Left = 626
      Top = 70
      Width = 90
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
      TabOrder = 7
    end
    object dblcTDiario2: TwwDBLookupCombo
      Left = 236
      Top = 21
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TDIARID'#9'3'#9'Tipo de Diario'#9'F'
        'TDIARDES'#9'40'#9'Descripci'#243'n'#9'F')
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      Enabled = False
      MaxLength = 2
      ParentFont = False
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      UseTFields = False
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtTDDes: TEdit
      Left = 279
      Top = 21
      Width = 160
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
  end
  object Z2bbtnContab: TBitBtn
    Left = 656
    Top = 496
    Width = 30
    Height = 30
    Hint = 'Contabilizar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = Z2bbtnContabClick
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
  object Z2bbtnPreview: TBitBtn
    Left = 553
    Top = 495
    Width = 32
    Height = 31
    Hint = 'Previa Contabilizaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = Z2bbtnPreviewClick
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
  object pnlEstado: TPanel
    Left = 292
    Top = 494
    Width = 173
    Height = 32
    Color = 14869218
    TabOrder = 7
    object lblAnula: TLabel
      Left = 61
      Top = 4
      Width = 102
      Height = 24
      Caption = 'ANULADO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblContab: TLabel
      Left = 61
      Top = 9
      Width = 105
      Height = 16
      Caption = 'CONTABILIZADO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblAcepta: TLabel
      Left = 74
      Top = 8
      Width = 90
      Height = 19
      Caption = 'ACEPTADO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblEliminado: TLabel
      Left = 75
      Top = 8
      Width = 89
      Height = 19
      Caption = 'ELIMINADO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblActivo: TLabel
      Left = 85
      Top = 8
      Width = 60
      Height = 19
      Caption = 'ACTIVO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label5: TLabel
      Left = 9
      Top = 8
      Width = 48
      Height = 19
      Caption = 'Estado:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pprPreview: TppReport
    AutoStop = False
    DataPipeline = ppdbpPreview
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rPreview'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 280000
    PrinterSetup.mmPaperWidth = 225000
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SOLExes\SOLFormatos\CxP\Incoresa\CxPVoucher.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprPreviewPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 80
    Top = 500
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbpPreview'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 57150
      mmPrintPosition = 0
      object pplblCiaDes: TppLabel
        UserName = 'lblCiaDes'
        Caption = 'Nombre de la compa'#241'ia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 13494
        mmTop = 1323
        mmWidth = 32279
        BandType = 0
      end
      object ppsvFecha: TppSystemVariable
        UserName = 'svFecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 162190
        mmTop = 1323
        mmWidth = 14288
        BandType = 0
      end
      object pplblModulo: TppLabel
        UserName = 'lblModulo'
        Caption = 'Cuentas por Pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 5821
        mmWidth = 25665
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'lblPeriodo1'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 75671
        mmTop = 11113
        mmWidth = 10583
        BandType = 0
      end
      object pplblNroComp: TppLabel
        UserName = 'lblNroComp'
        Caption = 'No.Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 102923
        mmTop = 22225
        mmWidth = 23283
        BandType = 0
      end
      object pplblTDiario: TppLabel
        UserName = 'lblTDiario'
        Caption = 'lblTDiario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 26988
        mmWidth = 11377
        BandType = 0
      end
      object pplblDiarioDes: TppLabel
        UserName = 'lblDiarioDes'
        AutoSize = False
        Caption = 'este es el diari'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 14817
        mmTop = 26988
        mmWidth = 59531
        BandType = 0
      end
      object pplblAnoMes: TppLabel
        UserName = 'lblAnoMes'
        Caption = 'lblAnoMes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 15875
        mmWidth = 13229
        BandType = 0
      end
      object pplblNoCompro: TppLabel
        UserName = 'lblNoCompro'
        Caption = 'lblNoCompro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 102923
        mmTop = 26988
        mmWidth = 16669
        BandType = 0
      end
      object pplblProvDes: TppLabel
        UserName = 'lblProvDes'
        Caption = 'Nombre:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 34131
        mmWidth = 10583
        BandType = 0
      end
      object pplblProveedor: TppLabel
        UserName = 'lblProveedor'
        AutoSize = False
        Caption = 'lblProveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23283
        mmTop = 34131
        mmWidth = 107950
        BandType = 0
      end
      object pplblMoneda: TppLabel
        UserName = 'lblMoneda1'
        Caption = 'Moneda  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 135996
        mmTop = 39158
        mmWidth = 12171
        BandType = 0
      end
      object pplblMonedaDes: TppLabel
        UserName = 'lblMonedaDes'
        AutoSize = False
        Caption = 'lblMonedaDes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 39158
        mmWidth = 25929
        BandType = 0
      end
      object pplblGlosa: TppLabel
        UserName = 'lblGlosa1'
        Caption = 'Glosa :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 44450
        mmWidth = 8202
        BandType = 0
      end
      object pplblGlosaDes: TppLabel
        UserName = 'lblGlosa'
        Caption = 'lblGlosa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23283
        mmTop = 44450
        mmWidth = 11642
        BandType = 0
      end
      object pplblSerie: TppLabel
        UserName = 'lblSerie'
        Caption = 'SER.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 50536
        mmWidth = 5821
        BandType = 0
      end
      object pplblNoDoc: TppLabel
        UserName = 'lblNoDoc'
        Caption = 'NO.DOC.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 16933
        mmTop = 50536
        mmWidth = 11906
        BandType = 0
      end
      object pplblFEmision: TppLabel
        UserName = 'lblFEmision'
        Caption = 'F.Emisi'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 75671
        mmTop = 22225
        mmWidth = 13494
        BandType = 0
      end
      object pplblCuenta: TppLabel
        UserName = 'lblCuenta'
        AutoSize = False
        Caption = ' CUENTA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 50536
        mmWidth = 16140
        BandType = 0
      end
      object pplblDescrip: TppLabel
        UserName = 'Label10'
        Caption = 'DESCRIPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 75142
        mmTop = 50536
        mmWidth = 19050
        BandType = 0
      end
      object pplblProvId: TppLabel
        UserName = 'Label7'
        Caption = 'C'#243'd.Prov'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 39158
        mmWidth = 11642
        BandType = 0
      end
      object pplblCCosto: TppLabel
        UserName = 'Label15'
        Caption = 'C.CTO.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 112713
        mmTop = 50536
        mmWidth = 9525
        BandType = 0
      end
      object pplblCntTCambio: TppLabel
        UserName = 'Label1'
        Caption = 'T.C.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 98690
        mmTop = 39952
        mmWidth = 5556
        BandType = 0
      end
      object pplblMonedaDoc: TppLabel
        UserName = 'lblMonedaDoc'
        Caption = 'US$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132292
        mmTop = 50536
        mmWidth = 5027
        BandType = 0
      end
      object pplblDebe: TppLabel
        UserName = 'lblDebe'
        Caption = 'DEBE (S/.)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 143140
        mmTop = 50536
        mmWidth = 13494
        BandType = 0
      end
      object pplblHaber: TppLabel
        UserName = 'lblHaber'
        Caption = 'HABER (S/.)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161132
        mmTop = 50536
        mmWidth = 15610
        BandType = 0
      end
      object pplblCodProv: TppLabel
        UserName = 'Label11'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23283
        mmTop = 39158
        mmWidth = 16404
        BandType = 0
      end
      object ppdbCntTCambio: TppDBText
        UserName = 'dbCntTCambio'
        DataField = 'CNTTCAMBIO'
        DataPipeline = ppdbpPreview
        DisplayFormat = '###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 104775
        mmTop = 39952
        mmWidth = 7938
        BandType = 0
      end
      object pplblFecComp: TppLabel
        UserName = 'Label13'
        Caption = 'F.Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 102923
        mmTop = 11113
        mmWidth = 21167
        BandType = 0
      end
      object ppdbCia: TppDBText
        UserName = 'dbCia'
        DataField = 'CIAID'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 1323
        mmWidth = 7144
        BandType = 0
      end
      object pplblFecEmision: TppLabel
        UserName = 'lblFecEmision'
        Caption = 'lblFecEmision'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 26988
        mmWidth = 17198
        BandType = 0
      end
      object ppdbFecComp: TppDBText
        UserName = 'dbFecComp'
        DataField = 'CNTFCOMP'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 102923
        mmTop = 16140
        mmWidth = 17198
        BandType = 0
      end
      object pplblEstado: TppLabel
        UserName = 'Label24'
        Caption = 'Estado  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 135996
        mmTop = 44450
        mmWidth = 10583
        BandType = 0
      end
      object ppLblDesEstado: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = 'Label25'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 44450
        mmWidth = 17463
        BandType = 0
      end
      object pplblTit: TppLabel
        UserName = 'Label20'
        Caption = 'Impresi'#243'n de Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 76200
        mmTop = 1323
        mmWidth = 37571
        BandType = 0
      end
      object pplblFecha: TppLabel
        UserName = 'Label27'
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 147109
        mmTop = 1323
        mmWidth = 9790
        BandType = 0
      end
      object ppraya1: TppLabel
        UserName = 'Label28'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 29898
        mmWidth = 169334
        BandType = 0
      end
      object ppraya2: TppLabel
        UserName = 'Label29'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 47361
        mmWidth = 169334
        BandType = 0
      end
      object ppraya3: TppLabel
        UserName = 'Label31'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 53446
        mmWidth = 169334
        BandType = 0
      end
      object pplblItem: TppLabel
        UserName = 'Label33'
        Caption = 'It.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 50536
        mmWidth = 2910
        BandType = 0
      end
      object pplblFecDoc: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 45508
        mmTop = 50536
        mmWidth = 17463
        BandType = 0
      end
      object pplblImporte: TppLabel
        UserName = 'Label8'
        Caption = 'Importe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 166159
        mmTop = 22225
        mmWidth = 10848
        BandType = 0
      end
      object pplblMontoImporte: TppLabel
        UserName = 'Label19'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 162719
        mmTop = 26988
        mmWidth = 14288
        BandType = 0
      end
      object pplblTipCam: TppLabel
        UserName = 'lblTipCam'
        Caption = 'T.Cambio:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 135996
        mmTop = 34131
        mmWidth = 12965
        BandType = 0
      end
      object pplblHora: TppLabel
        UserName = 'Label26'
        Caption = 'Hora :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 147638
        mmTop = 5821
        mmWidth = 8731
        BandType = 0
      end
      object ppsvHora: TppSystemVariable
        UserName = 'svHora'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 160073
        mmTop = 5821
        mmWidth = 16933
        BandType = 0
      end
      object pplblTipoCamb: TppLabel
        UserName = 'lblTipoCamb'
        AutoSize = False
        Caption = 'lblTipoCamb'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 155575
        mmTop = 34131
        mmWidth = 13229
        BandType = 0
      end
      object pplblDiario: TppLabel
        UserName = 'lblDiario1'
        Caption = 'Diario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 22225
        mmWidth = 8731
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppdbSerie: TppDBText
        UserName = 'dbSerie'
        DataField = 'CNTSERIE'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 529
        mmWidth = 6879
        BandType = 4
      end
      object ppdbNoDoc: TppDBText
        UserName = 'dbNoDoc'
        DataField = 'CNTNODOC'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 17463
        mmTop = 529
        mmWidth = 10583
        BandType = 4
      end
      object ppdbCuenta: TppDBText
        UserName = 'dbCuenta'
        DataField = 'CUENTAID'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 28310
        mmTop = 529
        mmWidth = 15610
        BandType = 4
      end
      object ppdbDebe: TppDBText
        UserName = 'dbDebe'
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbpPreview
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 138377
        mmTop = 529
        mmWidth = 18256
        BandType = 4
      end
      object ppdbHaber: TppDBText
        UserName = 'dbHaber'
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbpPreview
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 265
        mmWidth = 18256
        BandType = 4
      end
      object ppdbGlosa: TppDBText
        UserName = 'dbGlosa'
        DataField = 'CNTGLOSA'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 60854
        mmTop = 529
        mmWidth = 52123
        BandType = 4
      end
      object ppdbCCos: TppDBText
        UserName = 'dbCCos'
        DataField = 'CCOSID'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 529
        mmWidth = 9790
        BandType = 4
      end
      object ppdbMtoExt: TppDBText
        UserName = 'dbMtoExt'
        DataField = 'CNTMTOEXT'
        DataPipeline = ppdbpPreview
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 123031
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppdbFEmis: TppDBText
        UserName = 'dbFEmis'
        DataField = 'CNTFEMIS'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppdbItem: TppDBText
        UserName = 'dbItem'
        DataField = 'CNTREG'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 5821
        mmTop = 529
        mmWidth = 2646
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppdbcDebe: TppDBCalc
        UserName = 'dbcDebe'
        AutoSize = True
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbpPreview
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 2646
        mmWidth = 25400
        BandType = 7
      end
      object ppdbcHaber: TppDBCalc
        UserName = 'dbcHaber'
        AutoSize = True
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbpPreview
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 2646
        mmWidth = 25929
        BandType = 7
      end
      object ppRaya4: TppLabel
        UserName = 'Label32'
        Caption = '-------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 145786
        mmTop = 0
        mmWidth = 39158
        BandType = 7
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = '====================================='
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 5821
        mmWidth = 58738
        BandType = 7
      end
    end
  end
  object ppdbpPreview: TppDBPipeline
    DataSource = DMCXP.dsCXP
    UserName = 'dbpPreview'
    Left = 119
    Top = 500
  end
end
