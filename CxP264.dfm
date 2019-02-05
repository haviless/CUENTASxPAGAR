object FOrdenPagoCab: TFOrdenPagoCab
  Left = 723
  Top = 56
  BorderStyle = bsDialog
  Caption = 'Orden de Pago'
  ClientHeight = 552
  ClientWidth = 773
  Color = clMoneyGreen
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
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetalle: TwwDBGrid
    Left = 5
    Top = 121
    Width = 760
    Height = 319
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMCXP.dsDetallePres
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgDetalleDblClick
    OnKeyDown = dbgDetalleKeyDown
    FooterColor = 14869218
    FooterHeight = 28
    object wwDBGrid1IButton: TwwIButton
      Left = 0
      Top = 0
      Width = 30
      Height = 30
      AllowAllUp = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = wwDBGrid1IButtonClick
    end
  end
  object pnlCab: TPanel
    Left = 5
    Top = 5
    Width = 760
    Height = 110
    Color = clMoneyGreen
    TabOrder = 1
    object Label2: TLabel
      Left = 639
      Top = 5
      Width = 114
      Height = 19
      Caption = 'Orden de Pago'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 18
      Top = 52
      Width = 75
      Height = 19
      Caption = 'Observaci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeNumero: TwwDBEdit
      Left = 638
      Top = 25
      Width = 101
      Height = 35
      Color = clInfoBk
      DataField = 'NUMERO'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBMemo: TDBMemo
      Left = 17
      Top = 72
      Width = 590
      Height = 31
      DataField = 'OBSERVA'
      TabOrder = 4
      OnExit = bbtnGrabaClick
    end
    object edtEstado: TEdit
      Left = 627
      Top = 69
      Width = 113
      Height = 35
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object pnlCab1: TPanel
      Left = 5
      Top = 5
      Width = 336
      Height = 50
      BevelInner = bvRaised
      BevelOuter = bvNone
      Color = clMoneyGreen
      TabOrder = 0
      object lblCia: TLabel
        Left = 9
        Top = -1
        Width = 57
        Height = 19
        Caption = 'Compa'#241#237'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblTMon: TLabel
        Left = 202
        Top = 1
        Width = 80
        Height = 19
        Caption = 'Tipo Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblcCia: TwwDBLookupCombo
        Left = 9
        Top = 19
        Width = 42
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'Id'#9'F'
          'CIADES'#9'40'#9'Compa'#241'ia'#9'F')
        DataField = 'CIAID'
        LookupField = 'CIAID'
        Options = [loColLines, loRowLines, loTitles]
        MaxLength = 2
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcCiaExit
        OnNotInList = dblcCiaNotInList
      end
      object edtCia: TEdit
        Left = 52
        Top = 19
        Width = 130
        Height = 23
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dblcTMoneda: TwwDBLookupCombo
        Left = 187
        Top = 19
        Width = 38
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TMONID'#9'3'#9'ID'#9'F'
          'TMONDES'#9'30'#9'Moneda'#9'F'
          'TMONABR'#9'8'#9'Abreviatura'#9'F')
        DataField = 'TMONID'
        LookupField = 'TMONID'
        Options = [loColLines, loRowLines, loTitles]
        MaxLength = 1
        ParentFont = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcTMonedaExit
        OnNotInList = dblcTMonedaNotInList
      end
      object edtTMoneda: TEdit
        Left = 226
        Top = 19
        Width = 103
        Height = 23
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object pnlCab3: TPanel
      Left = 346
      Top = 5
      Width = 108
      Height = 50
      BevelInner = bvRaised
      BevelOuter = bvNone
      Color = clMoneyGreen
      TabOrder = 1
      object Label1: TLabel
        Left = 4
        Top = 1
        Width = 37
        Height = 19
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dtpFecha: TwwDBDateTimePicker
        Left = 5
        Top = 21
        Width = 100
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECHA'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
        OnExit = dtpFechaExit
      end
    end
    object rgOperacion: TRadioGroup
      Left = 458
      Top = -2
      Width = 175
      Height = 56
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Abono en Cuenta'
        'Transf Interbanca')
      ParentFont = False
      TabOrder = 2
      OnClick = rgOperacionClick
    end
  end
  object Panel2: TPanel
    Left = 5
    Top = 441
    Width = 761
    Height = 102
    Color = clMoneyGreen
    TabOrder = 2
    object pnlGraba: TPanel
      Left = 4
      Top = 3
      Width = 235
      Height = 46
      Color = 14869218
      TabOrder = 0
      object Label4: TLabel
        Left = 120
        Top = 4
        Width = 51
        Height = 13
        Caption = 'Hecho Por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object bbtnGraba: TBitBtn
        Left = 15
        Top = 8
        Width = 36
        Height = 32
        Hint = 'Grabar Registro'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnGrabaClick
        Glyph.Data = {
          8A010000424D8A01000000000000760000002800000017000000170000000100
          0400000000001401000000000000000000001000000010000000000000000000
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
      object dbeUsuGraba: TwwDBEdit
        Left = 93
        Top = 18
        Width = 100
        Height = 21
        DataField = 'USUARIO'
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlVisa: TPanel
      Left = 4
      Top = 52
      Width = 235
      Height = 46
      Color = 14869218
      TabOrder = 1
      object Label5: TLabel
        Left = 120
        Top = 4
        Width = 46
        Height = 13
        Caption = 'Aceptado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbDiseno: TSpeedButton
        Left = 3
        Top = 13
        Width = 7
        Height = 22
        Flat = True
        OnClick = sbDisenoClick
      end
      object bbtnAcepta: TBitBtn
        Left = 14
        Top = 8
        Width = 36
        Height = 32
        Hint = 'Aceptar Registro'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnAceptaClick
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000010000000000000000000
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
      object dbeUsuAcepta: TwwDBEdit
        Left = 93
        Top = 18
        Width = 100
        Height = 21
        DataField = 'USUACEPTA'
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object z2bbtnAnula: TBitBtn
        Left = 54
        Top = 8
        Width = 36
        Height = 32
        Hint = 'Anula Registro'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = z2bbtnAnulaClick
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
      object bbtnIni: TBitBtn
        Left = 201
        Top = 15
        Width = 27
        Height = 26
        Hint = 'Inicializa Orden de Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = False
        OnClick = bbtnIniClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
      end
    end
    object bbtnExporta: TBitBtn
      Left = 687
      Top = 10
      Width = 67
      Height = 30
      Caption = 'Exportar '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bbtnExportaClick
      Margin = 5
    end
    object pnlCab2: TPanel
      Left = 279
      Top = 3
      Width = 373
      Height = 45
      Color = 14869218
      TabOrder = 3
      object lblBanco: TLabel
        Left = 17
        Top = 3
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
      object lblCCBco: TLabel
        Left = 215
        Top = 3
        Width = 43
        Height = 15
        Caption = 'Cta. Cte.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcBanco: TwwDBLookupCombo
        Left = 15
        Top = 18
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
        Frame.Enabled = True
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblcBancoExit
        OnNotInList = dblcBancoNotInList
      end
      object edtBanco: TEdit
        Left = 66
        Top = 16
        Width = 128
        Height = 23
        BorderStyle = bsNone
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
      object dblcCCBco: TwwDBLookupCombo
        Left = 207
        Top = 18
        Width = 150
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
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
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnEnter = dblcCCBcoEnter
        OnNotInList = dblcCCBcoNotInList
      end
    end
    object pnlCnt: TPanel
      Left = 279
      Top = 50
      Width = 473
      Height = 48
      Color = 14869218
      TabOrder = 4
      object Label6: TLabel
        Left = 4
        Top = 18
        Width = 85
        Height = 20
        Caption = 'No.Planilla'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 207
        Top = 0
        Width = 71
        Height = 19
        Caption = 'Fecha Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeNumPla: TwwDBEdit
        Left = 92
        Top = 10
        Width = 102
        Height = 31
        Color = clInfoBk
        DataField = 'NUMPLA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dtpFechaCnt: TwwDBDateTimePicker
        Left = 207
        Top = 19
        Width = 100
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECCONTA'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
        OnExit = dtpFechaCntExit
      end
      object bbtnContabiliza: TBitBtn
        Left = 370
        Top = 11
        Width = 30
        Height = 30
        Hint = 'Contabilizar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = bbtnContabilizaClick
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
      object bbtnPago: TBitBtn
        Left = 321
        Top = 11
        Width = 30
        Height = 30
        Hint = 'Confirmaci'#243'n Pago Planilla'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
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
    end
    object bbtnRet: TBitBtn
      Left = 240
      Top = 16
      Width = 38
      Height = 20
      Caption = 'R-Todo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnClick = bbtnRetClick
    end
    object bbtnVerCont: TBitBtn
      Left = 685
      Top = 61
      Width = 30
      Height = 30
      Caption = 'Ver'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = bbtnVerContClick
    end
    object BitBtn1: TBitBtn
      Left = 718
      Top = 61
      Width = 23
      Height = 30
      Caption = 'Cia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      Visible = False
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 726
      Top = 61
      Width = 21
      Height = 30
      Caption = 'All'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      Visible = False
      OnClick = BitBtn3Click
    end
    object bbtnRetUno: TBitBtn
      Left = 240
      Top = 38
      Width = 38
      Height = 20
      Caption = 'R-Uno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Visible = False
      OnClick = bbtnRetUnoClick
    end
    object bbtnImprime: TBitBtn
      Left = 245
      Top = 24
      Width = 32
      Height = 30
      Hint = 'Imprimir Orden de Pago'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = bbtnImprimeClick
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
    object bbtnDesCnt: TBitBtn
      Left = 656
      Top = 16
      Width = 25
      Height = 25
      Caption = 'D'
      TabOrder = 11
      OnClick = bbtnDesCntClick
    end
  end
  object Memo1: TMemo
    Left = 536
    Top = 304
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    Visible = False
  end
  object btnExportarExcel: TBitBtn
    Left = 250
    Top = 502
    Width = 35
    Height = 27
    Hint = 'Exportar a Excel'
    TabOrder = 4
    OnClick = btnExportarExcelClick
    Glyph.Data = {
      F6010000424DF60100000000000076000000280000001C000000180000000100
      04000000000080010000C40E0000C40E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF0FFFFFF0000FFFFFFFFFFFF
      FFFFFFFF00FFFFFF0000FFFFFFFFFFFFFFFFFFF00000FFFF0000FFFFFFFFFFFF
      FFFFFFFF00FF0FFF0000FFFFFFFFFFFFFFFFFF0FF0FFF0FF0000272727272727
      2727F0FFFFFFF0FF00007272727272727272F0FFFFFFF0FF000027FFFFFFFFFF
      FF27F0FFFFFFF0FF000072FFFFFFF7272772F0FFF0FF0FFF000027F2727272F2
      7227FF0FF00FFFFF000072F727272F272F72FFF00000FFFF000027F27272F272
      7F27FFFFF00FFFFF000072FF272F27272F72FFFFF0FFFFFF000027FFF2F2727F
      FF27FFFFFFFFFFFF000072FF2F272727FF72FFFFFFFFFFFF000027F2F2727272
      7F27FFFFFFFFFFFF000072F72727F7272F72FFFFFFFFFFFF000027F2727FFF72
      7F27FFFFFFFFFFFF000072FFFFFFFFFFFF72FFFFFFFFFFFF0000272727272727
      2727FFFFFFFFFFFF00007272727272727272FFFFFFFFFFFF0000}
  end
  object dbgExporta: TDBGrid
    Left = 8
    Top = 352
    Width = 41
    Height = 33
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object cbDiseno: TCheckBox
    Left = 288
    Top = 536
    Width = 15
    Height = 17
    TabOrder = 6
    Visible = False
  end
  object pnlConstancia1: TPanel
    Left = 48
    Top = 184
    Width = 185
    Height = 97
    TabOrder = 7
    Visible = False
    object Label12: TLabel
      Left = 1
      Top = 1
      Width = 183
      Height = 15
      Align = alTop
      Alignment = taCenter
      Caption = 'N'#250'mero de Operaci'#243'n'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edtConstancia: TwwDBEdit
      Left = 32
      Top = 24
      Width = 129
      Height = 21
      MaxLength = 20
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object btnActConstancia: TBitBtn
      Left = 66
      Top = 56
      Width = 33
      Height = 25
      TabOrder = 1
      OnClick = btnActConstanciaClick
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
    object btnCerrarPanelConsta: TBitBtn
      Left = 125
      Top = 56
      Width = 33
      Height = 25
      TabOrder = 2
      OnClick = btnCerrarPanelConstaClick
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
  object bbtnDatosTransf: TBitBtn
    Left = 601
    Top = 32
    Width = 33
    Height = 25
    TabOrder = 8
    OnClick = bbtnDatosTransfClick
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
  object pnlImprDest: TPanel
    Left = 331
    Top = 283
    Width = 265
    Height = 88
    BevelInner = bvRaised
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 9
    Visible = False
    object bbtnImpDest: TBitBtn
      Left = 224
      Top = 27
      Width = 30
      Height = 25
      Hint = 'Pasa a Registrar Detalle'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bbtnImpDestClick
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
    object StaticText3: TStaticText
      Left = 4
      Top = 4
      Width = 253
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'Impresora de Destino'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object dblcdImpDest: TwwDBLookupComboDlg
      Left = 13
      Top = 28
      Width = 204
      Height = 21
      AutoSize = False
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      DataField = 'IMP_DES'
      LookupField = 'IMP_DES'
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object bbtnImpDestCanc: TBitBtn
      Left = 224
      Top = 54
      Width = 30
      Height = 25
      Hint = 'Cancela Selecci'#243'n de Impresora'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnImpDestCancClick
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
  object cbTodos: TCheckBox
    Left = 705
    Top = 135
    Width = 15
    Height = 17
    TabOrder = 10
    OnClick = cbTodosClick
  end
  object sdGraba: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 
      '*.TXT  ( Archivo Texto )|*.txt|*.DOC  ( Archivo Texto )|*.doc|*.' +
      '*   ( Todos )|*.*'
    Title = 'Nombre de Archivo Texto'
    Left = 687
    Top = 349
  end
  object ppdbReporte: TppDBPipeline
    UserName = 'dbReporte'
    Left = 648
    Top = 424
  end
  object pprReporte: TppReport
    AutoStop = False
    DataPipeline = ppdbReporte
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DemaExes\RTMS\OP\Dema\CxPOPago.rtm'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprReportePreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 680
    Top = 424
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbReporte'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33338
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'CIADES'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 4022
        mmLeft = 3175
        mmTop = 7144
        mmWidth = 46863
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NUMERO'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3969
        mmLeft = 29633
        mmTop = 13229
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'FECHA'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 4022
        mmLeft = 48419
        mmTop = 13229
        mmWidth = 17526
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 4233
        mmTop = 26194
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'T.Diario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 16669
        mmTop = 26194
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Nro.Reg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 31221
        mmTop = 26194
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 77523
        mmTop = 21167
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Detalle / Glosa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 26194
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 153194
        mmTop = 26194
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Mon'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 175419
        mmTop = 26194
        mmWidth = 5461
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Importe Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 182827
        mmTop = 22225
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Detracci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 197115
        mmTop = 21167
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Retenci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 216694
        mmTop = 25135
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Medio de Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 260880
        mmTop = 22225
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Importe Neto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 247386
        mmTop = 22225
        mmWidth = 10319
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2910
        mmTop = 32544
        mmWidth = 270669
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2910
        mmTop = 19844
        mmWidth = 270669
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label11'
        Caption = 'Orden de Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 13229
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label13'
        Caption = 'ORDEN DE PAGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 5027
        mmLeft = 129646
        mmTop = 8202
        mmWidth = 35983
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 256646
        mmTop = 6879
        mmWidth = 17526
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 272257
        mmTop = 12965
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label14'
        Caption = 'Derrama Magisterial - M'#243'dulo de Obligaciones'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 3175
        mmTop = 529
        mmWidth = 72390
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12700
        mmLeft = 2910
        mmTop = 19844
        mmWidth = 1323
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12435
        mmLeft = 15081
        mmTop = 20108
        mmWidth = 1323
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12435
        mmLeft = 28310
        mmTop = 20108
        mmWidth = 1323
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12435
        mmLeft = 44979
        mmTop = 20108
        mmWidth = 1323
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12435
        mmLeft = 126736
        mmTop = 20108
        mmWidth = 1323
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12435
        mmLeft = 151342
        mmTop = 20108
        mmWidth = 1323
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12435
        mmLeft = 174890
        mmTop = 20108
        mmWidth = 265
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12435
        mmLeft = 182034
        mmTop = 20108
        mmWidth = 1323
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12435
        mmLeft = 194469
        mmTop = 20108
        mmWidth = 1323
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12435
        mmLeft = 216165
        mmTop = 20108
        mmWidth = 1323
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12435
        mmLeft = 230717
        mmTop = 20108
        mmWidth = 1323
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12435
        mmLeft = 257969
        mmTop = 20108
        mmWidth = 1323
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12965
        mmLeft = 273580
        mmTop = 19844
        mmWidth = 1323
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 45244
        mmTop = 24871
        mmWidth = 81756
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 61913
        mmTop = 25135
        mmWidth = 794
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 105834
        mmTop = 25135
        mmWidth = 794
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 47096
        mmTop = 27252
        mmWidth = 8932
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = 'Raz'#243'n Social / Nombre Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 62706
        mmTop = 27517
        mmWidth = 42968
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'R.U.C'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 112713
        mmTop = 27517
        mmWidth = 7673
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 194469
        mmTop = 24871
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Tasa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 195527
        mmTop = 26723
        mmWidth = 7408
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 203994
        mmTop = 25135
        mmWidth = 794
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 205582
        mmTop = 26723
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Otros Dsc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 231511
        mmTop = 25135
        mmWidth = 13758
        BandType = 0
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12435
        mmLeft = 245534
        mmTop = 20108
        mmWidth = 1323
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CPANOMES'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 3704
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'TDIARID'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 18785
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CPNOREG'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 27781
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CLAUXID'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 47361
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PROV'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 51329
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PROVDES'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 62706
        mmTop = 0
        mmWidth = 42598
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DCPGLOSA'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 128059
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DOCID'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 152929
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'CPSERIE'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2910
        mmLeft = 157427
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'CPNODOC'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2910
        mmLeft = 163777
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'TMONID'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 176742
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'IMPTOTAL'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 182034
        mmTop = 0
        mmWidth = 12023
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'DTRPORC'
        DataPipeline = ppdbReporte
        DisplayFormat = '0%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 194734
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'IMPDETRAC'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2910
        mmLeft = 204788
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        ReprintOnOverFlow = True
        AutoSize = True
        BlankWhenZero = True
        DataField = 'IMPRETIGV'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 217223
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'FPAGOID'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 262203
        mmTop = 0
        mmWidth = 10837
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'IMPNETO'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 246857
        mmTop = 0
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'PROVRUC'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 106892
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        ReprintOnOverFlow = True
        AutoSize = True
        BlankWhenZero = True
        DataField = 'IMPOTRDTO'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 229828
        mmTop = 0
        mmWidth = 14647
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 35719
      mmPrintPosition = 0
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'USUARIO'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3175
        mmLeft = 52123
        mmTop = 27781
        mmWidth = 17198
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 32279
        mmTop = 26458
        mmWidth = 38894
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label15'
        Caption = 'Elaborado por '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 32544
        mmTop = 27781
        mmWidth = 18521
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 94986
        mmTop = 27252
        mmWidth = 38894
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Visado por '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 95779
        mmTop = 28310
        mmWidth = 14288
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 155046
        mmTop = 27252
        mmWidth = 38894
        BandType = 7
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Aprobado por '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 28575
        mmWidth = 17992
        BandType = 7
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2381
        mmTop = 529
        mmWidth = 270669
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'IMPNETO'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 239660
        mmTop = 1588
        mmWidth = 17780
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'IMPRETIGV'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 209551
        mmTop = 1588
        mmWidth = 20108
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        AutoSize = True
        DataField = 'IMPDETRAC'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2910
        mmLeft = 198173
        mmTop = 1588
        mmWidth = 16933
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        AutoSize = True
        DataField = 'IMPTOTAL'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 175229
        mmTop = 1588
        mmWidth = 18711
        BandType = 7
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 216694
        mmTop = 26723
        mmWidth = 38894
        BandType = 7
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Autorizado por '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 226748
        mmTop = 28046
        mmWidth = 19050
        BandType = 7
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'USUACEPTA'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3175
        mmLeft = 111654
        mmTop = 28310
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        AutoSize = True
        DataField = 'IMPOTRDTO'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 2879
        mmLeft = 223140
        mmTop = 1588
        mmWidth = 21336
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
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 720
    Top = 424
  end
end
