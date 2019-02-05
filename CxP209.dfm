object FPlnCta: TFPlnCta
  Left = 256
  Top = 137
  Width = 728
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Plan de Cuentas Principal'
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label13: TLabel
    Left = 160
    Top = 96
    Width = 104
    Height = 15
    Caption = 'Cuenta Automatica 1'
  end
  object Label14: TLabel
    Left = 8
    Top = 96
    Width = 143
    Height = 15
    Caption = 'Flag de Cuenta Automatica 1'
  end
  object Label15: TLabel
    Left = 280
    Top = 96
    Width = 139
    Height = 15
    Caption = 'Flag Debe/Haber  Cta.Aut.1'
  end
  object pnlPrincipal: TPanel
    Left = 8
    Top = 8
    Width = 705
    Height = 342
    Color = clNavy
    TabOrder = 0
    object pnlDetalle: TPanel
      Left = 8
      Top = 12
      Width = 689
      Height = 278
      BevelInner = bvLowered
      Color = 14869218
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 8
        Width = 49
        Height = 15
        Caption = 'Compa'#241'ia'
      end
      object Label2: TLabel
        Left = 261
        Top = 8
        Width = 82
        Height = 15
        Caption = 'Cuenta Contable'
      end
      object Label3: TLabel
        Left = 10
        Top = 63
        Width = 100
        Height = 15
        Caption = 'Descripci'#243'n Cuenta'
      end
      object Label4: TLabel
        Left = 351
        Top = 63
        Width = 62
        Height = 15
        Caption = 'Abreviatura'
      end
      object Label5: TLabel
        Left = 62
        Top = 8
        Width = 62
        Height = 15
        Caption = 'Descripci'#243'n'
      end
      object Label6: TLabel
        Left = 508
        Top = 64
        Width = 23
        Height = 15
        Caption = 'M.E.'
      end
      object Label7: TLabel
        Left = 16
        Top = 112
        Width = 24
        Height = 15
        Caption = 'Aux.'
      end
      object Label8: TLabel
        Left = 48
        Top = 112
        Width = 88
        Height = 15
        Caption = 'Clase de Auxiliar'
      end
      object Label9: TLabel
        Left = 232
        Top = 112
        Width = 23
        Height = 15
        Caption = 'Doc.'
      end
      object Label19: TLabel
        Left = 272
        Top = 112
        Width = 28
        Height = 15
        Caption = 'C.Cos'
      end
      object Label20: TLabel
        Left = 320
        Top = 112
        Width = 76
        Height = 15
        Caption = 'Tipo de Cuenta'
      end
      object Label21: TLabel
        Left = 512
        Top = 112
        Width = 34
        Height = 15
        Caption = 'Gastos'
      end
      object Label22: TLabel
        Left = 560
        Top = 112
        Width = 51
        Height = 15
        Caption = 'Presupues'
      end
      object Label23: TLabel
        Left = 616
        Top = 112
        Width = 32
        Height = 15
        Caption = 'Plazos'
      end
      object Label10: TLabel
        Left = 544
        Top = 64
        Width = 33
        Height = 15
        Caption = 'Cierre'
      end
      object Label11: TLabel
        Left = 15
        Top = 160
        Width = 99
        Height = 15
        Caption = 'Cuenta Consolidada'
      end
      object Label12: TLabel
        Left = 8
        Top = 212
        Width = 147
        Height = 13
        Caption = 'Cuentas de Transferencia'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label16: TLabel
        Left = 8
        Top = 228
        Width = 92
        Height = 15
        Caption = 'Cuenta de Destino'
      end
      object Label17: TLabel
        Left = 347
        Top = 227
        Width = 124
        Height = 15
        Caption = 'Cuenta de Contrapartida'
      end
      object Label18: TLabel
        Left = 582
        Top = 64
        Width = 39
        Height = 15
        Caption = 'Destino'
      end
      object Label30: TLabel
        Left = 632
        Top = 64
        Width = 28
        Height = 15
        Caption = 'Rend.'
      end
      object dbeDescripcion: TwwDBEdit
        Left = 10
        Top = 79
        Width = 327
        Height = 23
        DataField = 'CTADES'
        DataSource = DMCXP.dsCuenta
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 349
        Top = 79
        Width = 140
        Height = 23
        DataField = 'CTAABR'
        DataSource = DMCXP.dsCuenta
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object Panel3: TPanel
        Left = 0
        Top = 52
        Width = 688
        Height = 2
        TabOrder = 19
      end
      object dblcCia: TwwDBLookupCombo
        Left = 8
        Top = 24
        Width = 49
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'Cia'#9'F'
          'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
        DataField = 'CIAID'
        DataSource = DMCXP.dsCuenta
        LookupTable = DMCXP.cdsCia
        LookupField = 'CIAID'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        OnChange = dblcCiaChange
        OnExit = dblcCiaExit
      end
      object dbeCia: TwwDBEdit
        Left = 61
        Top = 23
        Width = 192
        Height = 23
        Enabled = False
        TabOrder = 20
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeCuenta: TwwDBEdit
        Left = 260
        Top = 23
        Width = 109
        Height = 23
        DataField = 'CUENTAID'
        DataSource = DMCXP.dsCuenta
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeCuentaExit
      end
      object dbcbME: TDBCheckBox
        Left = 512
        Top = 80
        Width = 25
        Height = 17
        Caption = ' '
        DataField = 'CTA_MEXT'
        DataSource = DMCXP.dsCuenta
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbAux: TDBCheckBox
        Left = 17
        Top = 130
        Width = 24
        Height = 17
        Caption = ' '
        DataField = 'CTA_AUX'
        DataSource = DMCXP.dsCuenta
        TabOrder = 8
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = dbcbAuxClick
        OnEnter = dbcbAuxEnter
      end
      object dblcCLAux: TwwDBLookupCombo
        Left = 49
        Top = 128
        Width = 45
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CLAUXID'#9'2'#9'ID'#9'F'
          'CLAUXDES'#9'30'#9'Clase Auxiliar'#9'F'
          'CLAUXABR'#9'8'#9'Abreviatura'#9'F')
        DataField = 'CTACLAUX'
        DataSource = DMCXP.dsCuenta
        LookupTable = DMCXP.cdsClAux
        LookupField = 'CLAUXID'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 9
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = dblcCLAuxChange
        OnExit = dblcCLAuxExit
      end
      object dbeCLAux: TwwDBEdit
        Left = 99
        Top = 128
        Width = 121
        Height = 23
        Enabled = False
        TabOrder = 21
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBCheckBox3: TDBCheckBox
        Left = 233
        Top = 130
        Width = 32
        Height = 17
        Caption = ' '
        DataField = 'CTA_DOC'
        DataSource = DMCXP.dsCuenta
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbCcos: TDBCheckBox
        Left = 273
        Top = 130
        Width = 32
        Height = 17
        Caption = ' '
        DataField = 'CTA_CCOS'
        DataSource = DMCXP.dsCuenta
        TabOrder = 11
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = dbcbCcosClick
        OnEnter = dbcbCcosEnter
      end
      object dblcTipCta: TwwDBLookupCombo
        Left = 320
        Top = 127
        Width = 41
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPCTAID'#9'1'#9'Id'#9'F'
          'TIPCTADES'#9'30'#9'Tipo de Cuenta'#9'F')
        DataField = 'CTA_GYP'
        DataSource = DMCXP.dsCuenta
        LookupTable = DMCXP.cdsTipCta
        LookupField = 'TIPCTAID'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 12
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        OnChange = dblcTipCtaChange
        OnExit = dblcTipCtaExit
      end
      object dbeTipCta: TwwDBEdit
        Left = 368
        Top = 126
        Width = 126
        Height = 23
        Enabled = False
        TabOrder = 22
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBCheckBox5: TDBCheckBox
        Left = 512
        Top = 128
        Width = 25
        Height = 17
        Caption = ' '
        DataField = 'CTA_DGAS'
        DataSource = DMCXP.dsCuenta
        TabOrder = 13
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox6: TDBCheckBox
        Left = 560
        Top = 128
        Width = 25
        Height = 17
        Caption = ' '
        DataField = 'CTA_PRES'
        DataSource = DMCXP.dsCuenta
        TabOrder = 14
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox7: TDBCheckBox
        Left = 616
        Top = 128
        Width = 25
        Height = 17
        Caption = ' '
        DataField = 'CTA_PLAZ'
        DataSource = DMCXP.dsCuenta
        TabOrder = 15
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox8: TDBCheckBox
        Left = 551
        Top = 80
        Width = 26
        Height = 17
        Caption = ' '
        DataField = 'CTA_CIER'
        DataSource = DMCXP.dsCuenta
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbeCtaConsol: TwwDBEdit
        Left = 138
        Top = 176
        Width = 231
        Height = 23
        Enabled = False
        TabOrder = 23
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcCtaConsol: TwwDBLookupComboDlg
        Left = 14
        Top = 176
        Width = 120
        Height = 23
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'CUENTAID'#9'15'#9'Id'#9'F'
          'CTADES'#9'40'#9'Plan Ctas Consolidada'#9'F')
        DataField = 'CTAPLAN2'
        DataSource = DMCXP.dsCuenta
        LookupTable = DMCXP.cdsCtaConsol
        LookupField = 'CUENTAID'
        TabOrder = 16
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcCtaConsolChange
        OnEnter = dblcCtaConsolEnter
        OnExit = dblcCtaConsolExit
      end
      object Panel5: TPanel
        Left = 0
        Top = 206
        Width = 689
        Height = 2
        TabOrder = 24
      end
      object dblcdCtaDes: TwwDBLookupComboDlg
        Left = 8
        Top = 244
        Width = 90
        Height = 23
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'CUENTAID'#9'15'#9'Id'#9'F'
          'CTADES'#9'40'#9'Cuenta Contable'#9'F')
        LookupTable = DMCXP.cdsCuenta2
        LookupField = 'CUENTAID'
        TabOrder = 17
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcdCtaDesChange
        OnEnter = dblcdCtaDesEnter
        OnExit = dblcdCtaDesExit
      end
      object dbeCtaDes: TwwDBEdit
        Left = 101
        Top = 244
        Width = 230
        Height = 23
        Enabled = False
        TabOrder = 25
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcdCtaContra: TwwDBLookupComboDlg
        Left = 347
        Top = 244
        Width = 90
        Height = 23
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'CUENTAID'#9'15'#9'Id'#9'F'
          'CTADES'#9'40'#9'Cuenta Contable'#9'F')
        LookupTable = DMCXP.cdsCuenta2
        LookupField = 'CUENTAID'
        TabOrder = 18
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcdCtaContraChange
        OnEnter = dblcdCtaContraEnter
        OnExit = dblcdCtaContraExit
      end
      object dbeCtaContra: TwwDBEdit
        Left = 441
        Top = 244
        Width = 231
        Height = 23
        Enabled = False
        TabOrder = 26
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBCheckBox9: TDBCheckBox
        Left = 591
        Top = 80
        Width = 26
        Height = 17
        Caption = ' '
        DataField = 'CTA_DEST'
        DataSource = DMCXP.dsCuenta
        TabOrder = 6
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox2: TDBCheckBox
        Left = 637
        Top = 80
        Width = 28
        Height = 17
        Caption = ' '
        DataField = 'CTA_REND'
        DataSource = DMCXP.dsCuenta
        TabOrder = 7
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object Z2bbtnRegistra: TBitBtn
      Left = 640
      Top = 303
      Width = 25
      Height = 25
      Hint = 'Registra'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnRegistraClick
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
    object Z2bbtnCanc2: TBitBtn
      Left = 671
      Top = 303
      Width = 25
      Height = 25
      Hint = 'Cancela Datos'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Z2bbtnCanc2Click
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
    object Z2bbtnImprime: TBitBtn
      Left = 608
      Top = 303
      Width = 25
      Height = 25
      Hint = 'Imprimir'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Z2bbtnImprimeClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object pnlFondo: TPanel
    Left = 5
    Top = 281
    Width = 593
    Height = 158
    Color = clNavy
    TabOrder = 2
    Visible = False
    object Label29: TLabel
      Left = 13
      Top = 12
      Width = 152
      Height = 13
      Caption = 'Impresi'#243'n Plan de Cuentas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlReporte: TPanel
    Left = 13
    Top = 309
    Width = 577
    Height = 121
    BevelInner = bvLowered
    Color = 14869218
    TabOrder = 1
    Visible = False
    object Label24: TLabel
      Left = 19
      Top = 7
      Width = 28
      Height = 15
      Caption = 'Nivel'
    end
    object Label25: TLabel
      Left = 18
      Top = 56
      Width = 94
      Height = 13
      Caption = 'Rangos de Cuentas'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label26: TLabel
      Left = 16
      Top = 72
      Width = 73
      Height = 15
      Caption = 'Cuenta Inicial'
    end
    object Label27: TLabel
      Left = 291
      Top = 72
      Width = 63
      Height = 15
      Caption = 'Cuenta Final'
    end
    object Label28: TLabel
      Left = 73
      Top = 8
      Width = 37
      Height = 15
      Caption = 'D'#237'gitos'
    end
    object dblcNivel: TwwDBLookupCombo
      Left = 16
      Top = 23
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NIVEL'#9'2'#9'Nivel'#9'F'
        'DIGITOS'#9'10'#9'Digitos'#9'F')
      LookupTable = DMCXP.cdsNivel
      LookupField = 'NIVEL'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      OnChange = dblcNivelChange
      OnExit = dblcNivelExit
    end
    object dbeNivel: TwwDBEdit
      Left = 71
      Top = 23
      Width = 41
      Height = 23
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Panel4: TPanel
      Left = 2
      Top = 48
      Width = 573
      Height = 2
      TabOrder = 2
    end
    object dblcdCtaInic: TwwDBLookupComboDlg
      Left = 15
      Top = 88
      Width = 90
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CUENTAID'#9'15'#9'Id'#9'F'
        'CTADES'#9'40'#9'Cuenta Contable'#9'F')
      LookupTable = DMCXP.cdsCuenta3
      LookupField = 'CUENTAID'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcdCtaInicChange
    end
    object dbeCtaInic: TwwDBEdit
      Left = 107
      Top = 88
      Width = 171
      Height = 23
      Enabled = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdCtaFinal: TwwDBLookupComboDlg
      Left = 290
      Top = 88
      Width = 90
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CUENTAID'#9'15'#9'Id'#9'F'
        'CTADES'#9'40'#9'Cuenta Contable'#9'F')
      LookupTable = DMCXP.cdsCuenta3
      LookupField = 'CUENTAID'
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcdCtaFinalChange
      OnExit = dblcdCtaFinalExit
    end
    object dbeCtaFinal: TwwDBEdit
      Left = 386
      Top = 87
      Width = 185
      Height = 23
      Enabled = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Z2bbtnRegistra3: TBitBtn
      Left = 494
      Top = 16
      Width = 25
      Height = 25
      Hint = 'Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = Z2bbtnRegistra3Click
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
    object Z2bbtnCanc3: TBitBtn
      Left = 525
      Top = 16
      Width = 25
      Height = 25
      Hint = 'Cancela Datos'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = Z2bbtnCanc3Click
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
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DMCXP.dsCuenta3
    UserName = 'DBPipeline1'
    Left = 215
    Top = 312
  end
  object pprPlanCtas: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 263
    Top = 313
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 1588
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Sistema Contable'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 8202
        mmWidth = 27252
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 2117
        mmTop = 16933
        mmWidth = 262891
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Cuentas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 18542
        mmWidth = 12700
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 27517
        mmWidth = 262891
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Descripci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 28310
        mmTop = 18521
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Plan de Cuentas General'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 109009
        mmTop = 1588
        mmWidth = 49742
        BandType = 0
      end
      object pplblNivel: TppLabel
        UserName = 'Label101'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 134938
        mmTop = 7408
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Aux.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 135732
        mmTop = 18521
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Pagina :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 222515
        mmTop = 1323
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 237861
        mmTop = 1588
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Fecha  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 222515
        mmTop = 6615
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 237861
        mmTop = 6350
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Hora    :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 222780
        mmTop = 11642
        mmWidth = 12435
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 237332
        mmTop = 11377
        mmWidth = 19579
        BandType = 0
      end
      object pplblNivel1: TppLabel
        UserName = 'Label10'
        Caption = 'Nivel :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 123296
        mmTop = 7408
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Clase Aux.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8731
        mmLeft = 145786
        mmTop = 18542
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Centro Costo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 159544
        mmTop = 18542
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Cuenta de Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 174361
        mmTop = 18542
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Cuenta de Contrapartida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 196586
        mmTop = 18521
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label15'
        Caption = 'Tipo Cuenta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 220398
        mmTop = 19050
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Cuenta  Consolidada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 109538
        mmTop = 18521
        mmWidth = 23283
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        OnPrint = ppDBText1Print
        UserName = 'DBText1'
        DataField = 'CUENTAID'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 265
        mmWidth = 17780
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CTADES'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 27781
        mmTop = 265
        mmWidth = 79111
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CTAPLAN2'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 109802
        mmTop = 265
        mmWidth = 17780
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CTA_AUX'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 135732
        mmTop = 265
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CTACLAUX'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 145257
        mmTop = 265
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CTA_CCOS'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 265
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CTAAUT1'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 174096
        mmTop = 265
        mmWidth = 17780
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CTAAUT2'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 196850
        mmTop = 265
        mmWidth = 17780
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CTA_GP'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 220663
        mmTop = 265
        mmWidth = 5027
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
end
