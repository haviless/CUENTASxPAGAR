object FCanjeCxC: TFCanjeCxC
  Left = 218
  Top = 113
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Canje de CxC'
  ClientHeight = 575
  ClientWidth = 788
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 315
    Top = 55
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
  object pnlCabecera: TPanel
    Left = 8
    Top = 1
    Width = 775
    Height = 146
    BevelInner = bvRaised
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 7566265
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object pnlCab1: TPanel
      Left = 9
      Top = 7
      Width = 755
      Height = 45
      Color = 14869218
      TabOrder = 0
      object lblCia: TLabel
        Left = 8
        Top = 2
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
      object Label11: TLabel
        Left = 368
        Top = 2
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
      object Label9: TLabel
        Left = 277
        Top = 2
        Width = 73
        Height = 16
        Caption = 'F.Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label12: TLabel
        Left = 518
        Top = 2
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
      object Label6: TLabel
        Left = 198
        Top = 2
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
      object lblTDiario: TLabel
        Left = 590
        Top = 2
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
      object dblcCia: TwwDBLookupCombo
        Left = 8
        Top = 18
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
        DataField = 'CIAID'
        LookupField = 'CIAID'
        Options = [loColLines, loRowLines, loTitles]
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
        Left = 51
        Top = 18
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
        TabOrder = 5
      end
      object dblcTMon: TwwDBLookupCombo
        Left = 369
        Top = 18
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
        LookupField = 'TMONID'
        Options = [loColLines, loRowLines]
        MaxLength = 2
        ParentFont = False
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcTMonExit
      end
      object edtTMon: TEdit
        Left = 413
        Top = 18
        Width = 98
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
      object dtpFEmis: TwwDBDateTimePicker
        Left = 274
        Top = 18
        Width = 90
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'CJFCMPRB'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 2
        OnExit = dtpFEmisExit
      end
      object dbeTCambio: TwwDBEdit
        Left = 517
        Top = 18
        Width = 66
        Height = 23
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        DataField = 'CJTCAM'
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
        OnExit = dbeTCambioExit
      end
      object dbeNReg: TwwDBEdit
        Left = 195
        Top = 18
        Width = 73
        Height = 23
        DataField = 'CJCANJE'
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeNRegExit
      end
      object dblcTDiario: TwwDBLookupCombo
        Left = 589
        Top = 18
        Width = 45
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TDIARID'#9'2'#9'Id'#9'F'
          'TDIARDES'#9'30'#9'Tipo de Diario'#9'F')
        DataField = 'TDIARID'
        LookupField = 'TDIARID'
        Options = [loColLines, loRowLines, loTitles]
        Color = clBtnFace
        Enabled = False
        MaxLength = 2
        ParentFont = False
        TabOrder = 7
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcTDiarioExit
      end
      object edtTDiario: TEdit
        Left = 634
        Top = 18
        Width = 110
        Height = 22
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
    end
    object pnlCab2: TPanel
      Left = 9
      Top = 54
      Width = 756
      Height = 83
      Color = 14869218
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lblProv: TLabel
        Left = 61
        Top = -1
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
      object lblProvRuc: TLabel
        Left = 155
        Top = -1
        Width = 24
        Height = 16
        Caption = 'RUC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblProvNom: TLabel
        Left = 11
        Top = 39
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
      object lblClieRuc: TLabel
        Left = 432
        Top = -1
        Width = 22
        Height = 16
        Caption = 'RUC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblClie: TLabel
        Left = 342
        Top = -1
        Width = 36
        Height = 16
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 11
        Top = -1
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
      object Label2: TLabel
        Left = 291
        Top = 39
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
      object Label10: TLabel
        Left = 291
        Top = -1
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
      object lblNoReg: TLabel
        Left = 597
        Top = 0
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
      object bbtnOK: TBitBtn
        Left = 709
        Top = 49
        Width = 30
        Height = 28
        Hint = 'Pasa a Registrar Detalle'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
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
      object bbtnBorra: TBitBtn
        Left = 673
        Top = 49
        Width = 30
        Height = 28
        Hint = 'Borra y Reinicia Registro'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
      end
      object dblcdProv: TwwDBLookupComboDlg
        Left = 59
        Top = 16
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
          'PROV'#9'15'#9'Id'#9'F'
          'PROVDES'#9'40'#9'Raz'#243'n Social'#9'F'
          'PROVABR'#9'15'#9'Nombre Corto'#9'F'
          'PROVRUC'#9'15'#9'R.U.C.'#9'F')
        DataField = 'PROV'
        LookupField = 'PROV'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnDropDown = dblcdProvDropDown
        OnEnter = dblcdProvEnter
        OnExit = dblcdProvExit
      end
      object dblcdProvRuc: TwwDBLookupComboDlg
        Left = 151
        Top = 16
        Width = 104
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Registro Unico'
        MaxWidth = 0
        MaxHeight = 209
        SearchDelay = 2
        Selected.Strings = (
          'PROVRUC'#9'10'#9'Reg.Unico'#9'F'
          'PROV'#9'8'#9'Proveedor'#9'F'
          'PROVDES'#9'40'#9'Raz'#243'n Social'#9'F'
          'PROVABR'#9'15'#9'Nombre Corto'#9'F')
        DataField = 'PROVRUC'
        LookupField = 'PROVRUC'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        Enabled = False
        MaxLength = 12
        ParentFont = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object edtProv: TEdit
        Left = 11
        Top = 55
        Width = 244
        Height = 23
        CharCase = ecUpperCase
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 9
      end
      object edtClie: TEdit
        Left = 291
        Top = 55
        Width = 232
        Height = 23
        AutoSize = False
        CharCase = ecUpperCase
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 10
      end
      object dblcClAux: TwwDBLookupCombo
        Left = 11
        Top = 16
        Width = 49
        Height = 23
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CLAUXID'#9'2'#9'Id.'#9'F'
          'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
        DataField = 'CLAUXPROV'
        LookupField = 'CLAUXID'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcClAuxExit
      end
      object dblcPrAux: TwwDBLookupCombo
        Left = 291
        Top = 16
        Width = 49
        Height = 23
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CLAUXID'#9'2'#9'Id.'#9'F'
          'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
        DataField = 'CLAUXCLIE'
        LookupField = 'CLAUXID'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcPrAuxExit
      end
      object dblcdClie: TwwDBLookupComboDlg
        Left = 340
        Top = 16
        Width = 90
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        CharCase = ecUpperCase
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Maestro de Clientes'
        MaxWidth = 0
        MaxHeight = 209
        SearchDelay = 2
        Selected.Strings = (
          'CLIEID'#9'8'#9'Id.'#9'F'
          'CLIEDES'#9'40'#9'Cliente'#9'F'
          'CLIERUC'#9'10'#9'R.U.C.'#9'F')
        DataField = 'CLIEID'
        LookupField = 'CLIEID'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 8
        ParentFont = False
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnDropDown = dblcdClieDropDown
        OnEndDrag = dbgDocCanjeClieEndDrag
        OnEnter = dblcdClieEnter
        OnExit = dblcdClieExit
      end
      object dblcdClieRuc: TwwDBLookupComboDlg
        Left = 432
        Top = 16
        Width = 120
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Registro Unico'
        MaxWidth = 0
        MaxHeight = 209
        SearchDelay = 2
        Selected.Strings = (
          'CLIERUC'#9'10'#9'R.U.C.'#9'F'
          'CLIEDES'#9'40'#9'Cliente'#9'F'
          'CLIEID'#9'8'#9'Id.'#9'F')
        DataField = 'CLIERUC'
        LookupField = 'CLIERUC'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 12
        ParentFont = False
        TabOrder = 5
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object meNoReg: TwwDBEdit
        Left = 589
        Top = 16
        Width = 102
        Height = 23
        DataField = 'CPNOREG'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = meNoRegExit
      end
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 148
    Width = 775
    Height = 370
    BevelInner = bvRaised
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object pnlDetalle: TPanel
      Left = 3
      Top = 5
      Width = 382
      Height = 193
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clNavy
      TabOrder = 0
      object Label7: TLabel
        Left = 1
        Top = 1
        Width = 376
        Height = 24
        Align = alTop
        AutoSize = False
        Caption = '     Documentos Pendientes del Proveedor'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbgDocProv: TwwDBGrid
        Left = -1
        Top = 21
        Width = 378
        Height = 168
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = 16053492
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnDragOver = dbgDocProvDragOver
        OnEndDrag = dbgDocProvEndDrag
        OnMouseDown = dbgDocProvMouseDown
        FooterColor = 7566265
      end
    end
    object Panel2: TPanel
      Left = 386
      Top = 5
      Width = 382
      Height = 192
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = 10207162
      TabOrder = 1
      object Label8: TLabel
        Left = 1
        Top = 1
        Width = 376
        Height = 19
        Align = alTop
        AutoSize = False
        Caption = '     Documentos Pendientes del Cliente'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbgDocClie: TwwDBGrid
        Left = 0
        Top = 20
        Width = 378
        Height = 170
        DisableThemesInTitle = False
        Selected.Strings = (
          'TDIARID'#9'2'#9'TD'#9'F'
          'CCANOMES'#9'6'#9'Periodo'#9'F'
          'CCNOREG'#9'10'#9'No.Reg'#9'F'
          'TMONID'#9'2'#9'Mon.'#9'T'
          'CCMTOORI'#9'9'#9'Monto.~Orig'#9'T'
          'CCSALLOC'#9'9'#9'Saldo Mon.~Local'#9'T'
          'CCSALEXT'#9'9'#9'Saldo Mon.~Extranjera'#9'T')
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = 16053492
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnDragOver = dbgDocClieDragOver
        OnEndDrag = dbgDocClieEndDrag
        OnMouseDown = dbgDocClieMouseDown
        FooterColor = 11974251
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 199
      Width = 385
      Height = 165
      BevelInner = bvRaised
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object dbgDocCanjeProv: TwwDBGrid
        Left = 3
        Top = 4
        Width = 376
        Height = 155
        DisableThemesInTitle = False
        Selected.Strings = (
          'DOCID'#9'2'#9'Doc'
          'DCJNODOC'#9'5'#9'No.Doc.'
          'DCJSALLOC'#9'9'#9'Saldo S/.'
          'DCJSALEXT'#9'9'#9'Saldo U$.'
          'DCJMOLOC'#9'9'#9'Pago S/.'
          'DCJMOEXT'#9'9'#9'Pago U$.'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = 16053492
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect, dgShowFooter]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnColExit = dbgDocCanjeProvColExit
        OnDragOver = dbgDocCanjeProvDragOver
        OnEndDrag = dbgDocCanjeProvEndDrag
        OnMouseDown = dbgDocCanjeProvMouseDown
        OnFieldChanged = dbgDocCanjeProvFieldChanged
        FooterColor = 7566265
      end
    end
    object Panel4: TPanel
      Left = 385
      Top = 199
      Width = 384
      Height = 165
      BevelInner = bvRaised
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object dbgDocCanjeClie: TwwDBGrid
        Left = 3
        Top = 4
        Width = 376
        Height = 155
        DisableThemesInTitle = False
        Selected.Strings = (
          'DOCID'#9'2'#9'Doc'
          'DCJNODOC'#9'5'#9'No.Doc'
          'DCJSALLOC'#9'9'#9'Saldo S/.'
          'DCJSALEXT'#9'9'#9'Saldo U$.'
          'DCJMOLOC'#9'9'#9'Pago S/.'
          'DCJMOEXT'#9'9'#9'Pago U$.'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = 16053492
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect, dgShowFooter]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnColExit = dbgDocCanjeClieColExit
        OnDragOver = dbgDocCanjeClieDragOver
        OnEndDrag = dbgDocCanjeClieEndDrag
        OnMouseDown = dbgDocCanjeClieMouseDown
        OnFieldChanged = dbgDocCanjeClieFieldChanged
        FooterColor = 7566265
      end
    end
  end
  object pnlPie: TPanel
    Left = 8
    Top = 518
    Width = 776
    Height = 53
    BevelInner = bvRaised
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 14869218
    Enabled = False
    TabOrder = 2
    object Label4: TLabel
      Left = 7
      Top = 33
      Width = 46
      Height = 10
      Caption = 'SACSA - SOL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object bbtnCalc: TBitBtn
      Left = 55
      Top = 10
      Width = 32
      Height = 31
      Hint = 'Calculadora'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bbtnCalcClick
      Glyph.Data = {
        36010000424D3601000000000000760000002800000010000000180000000100
        040000000000C0000000CE0E0000D80E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000000000007708888888888888070800800899999807080080089999
        9807088888888888880708008008008008070800800800800807088888888888
        8807080080080080080708008008008008070888888888888807080080080080
        0807080080080080080708888888888888070888888888888807088888888888
        8807080000000000080708000EE0EEEE080708000EE0EEEE0807080000000000
        0807088888888888880708888888888888077000000000000077}
    end
    object pnlEstado: TPanel
      Left = 283
      Top = 9
      Width = 207
      Height = 32
      Color = 14869218
      TabOrder = 1
      object lblAnula: TLabel
        Left = 80
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
      object lblActivo: TLabel
        Left = 94
        Top = 7
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
      object lblContab: TLabel
        Left = 66
        Top = 7
        Width = 131
        Height = 19
        Caption = 'CONTABILIZADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblAcepta: TLabel
        Left = 83
        Top = 7
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
      object Label5: TLabel
        Left = 12
        Top = 7
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
      object lblEliminado: TLabel
        Left = 84
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
    end
    object bbtnRegresa: TBitBtn
      Left = 539
      Top = 10
      Width = 30
      Height = 30
      Hint = 'Modifica Datos de Cabecera'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnRegresaClick
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
    object bbtnCancela: TBitBtn
      Left = 572
      Top = 10
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
    object Z2bbtnGraba: TBitBtn
      Left = 605
      Top = 10
      Width = 30
      Height = 30
      Hint = 'Grabar Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Z2bbtnGrabaClick
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
    object Z2bbtnAcepta: TBitBtn
      Left = 638
      Top = 10
      Width = 30
      Height = 30
      Hint = 'Acepta Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
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
    object Z2bbtnAnula: TBitBtn
      Left = 671
      Top = 10
      Width = 30
      Height = 30
      Hint = 'Anular Documento'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
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
    object Z2bbtnContab: TBitBtn
      Left = 704
      Top = 10
      Width = 30
      Height = 30
      Hint = 'Contabilizar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
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
    object Z2bbtnNuevo: TBitBtn
      Left = 737
      Top = 10
      Width = 30
      Height = 30
      Hint = 'Nuevo Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Garamond'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = Z2bbtnNuevoClick
      Glyph.Data = {
        96010000424D9601000000000000760000002800000017000000180000000100
        04000000000020010000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
        BBBBBBBBBBB08887777777777777777778B08800000000000000000078B0880F
        FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
        78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
        FFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880F
        FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
        78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
        FF00000078B0880FFFFFFFFFFF0FF88088B0880FFFFFFFFFFF0F880888B0880F
        FFFFFFFFFF08808888B0880FFFFFFFFFFF08088888B088000000000000008888
        88B08888888888888888888888B08888888888888888888888B0}
    end
    object Z2bbtnPreview: TBitBtn
      Left = 506
      Top = 10
      Width = 30
      Height = 30
      Hint = 'Previa Contabilizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
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
  end
  object ppdbpPreview: TppDBPipeline
    UserName = 'dbpPreview'
    Left = 87
    Top = 362
    object ppField1: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'CPNOREG'
      FieldName = 'CPNOREG'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'DOCABR'
      FieldName = 'DOCABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'CPSERIE'
      FieldName = 'CPSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'CPNODOC'
      FieldName = 'CPNODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 15
      DisplayWidth = 15
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
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'CPFEMIS'
      FieldName = 'CPFEMIS'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'CPFVCMTO'
      FieldName = 'CPFVCMTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'AUXNOMB'
      FieldName = 'AUXNOMB'
      FieldLength = 40
      DisplayWidth = 40
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'TMONABR'
      FieldName = 'TMONABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'FPAGO'
      FieldName = 'FPAGO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 13
    end
    object ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPMTOORI'
      FieldName = 'CPMTOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPSALORI'
      FieldName = 'CPSALORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPMTOLOC'
      FieldName = 'CPMTOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPMTOEXT'
      FieldName = 'CPMTOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPSALLOC'
      FieldName = 'CPSALLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPSALEXT'
      FieldName = 'CPSALEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      FieldAlias = 'CPESTADO'
      FieldName = 'CPESTADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
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
    Template.FileName = 'C:\SOLExes\SOLFormatos\CXP\Bhl\CXPVOUCHER.RTM'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprPreviewPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 88
    Top = 412
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
        mmHeight = 3704
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
      BeforePrint = ppDetailBand2BeforePrint
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
        mmLeft = 132557
        mmTop = 2646
        mmWidth = 23813
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
        mmLeft = 152400
        mmTop = 2646
        mmWidth = 24342
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
end
