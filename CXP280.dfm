object FRetencion: TFRetencion
  Left = 302
  Top = 167
  Width = 745
  Height = 543
  BorderIcons = [biSystemMenu, biMinimize]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spbGraba: TBitBtn
    Left = 471
    Top = 457
    Width = 54
    Height = 43
    Caption = 'Graba'
    Enabled = False
    TabOrder = 6
    OnClick = spbGrabaClick
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
    Layout = blGlyphTop
    NumGlyphs = 2
  end
  object spbAceptar: TBitBtn
    Left = 531
    Top = 457
    Width = 54
    Height = 43
    Caption = 'Aceptar'
    Enabled = False
    TabOrder = 9
    OnClick = spbAceptarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    Layout = blGlyphTop
    NumGlyphs = 2
  end
  object spbNuevo: TBitBtn
    Left = 610
    Top = 457
    Width = 54
    Height = 43
    Caption = 'Nuevo'
    Enabled = False
    TabOrder = 10
    OnClick = spbNuevoClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
      0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
      0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
      0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
      0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
      0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
      5555557FFFFF7755555555500000005555555577777775555555555555555555
      5555555555555555555555555555555555555555555555555555}
    Layout = blGlyphTop
    NumGlyphs = 2
  end
  object spbSalir: TBitBtn
    Left = 667
    Top = 457
    Width = 54
    Height = 43
    Caption = 'Salir'
    TabOrder = 11
    OnClick = spbSalirClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301111111110333337F333333337F33330111111111
      0333337F333333337F333301111111110333337F333333337F33330111111111
      0333337F333333337F333301111111110333337F333333337F33330111111111
      0333337F3333333F7F333301111111B10333337F333333737F33330111111111
      0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
      0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
      0333337F377777337F333301111111110333337F333333337F33330111111111
      0333337FFFFFFFFF7F3333000000000003333377777777777333}
    Layout = blGlyphTop
    NumGlyphs = 2
  end
  object gbDocumento: TGroupBox
    Left = 9
    Top = 291
    Width = 713
    Height = 87
    Caption = 'Documento que Genera la Retenci'#243'n :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Clase'
    end
    object Label2: TLabel
      Left = 109
      Top = 24
      Width = 59
      Height = 13
      Caption = 'Proveedor'
    end
    object Label3: TLabel
      Left = 585
      Top = 24
      Width = 27
      Height = 13
      Caption = 'RUC'
    end
    object Label4: TLabel
      Left = 10
      Top = 57
      Width = 49
      Height = 13
      Caption = 'TipoDoc'
    end
    object Label5: TLabel
      Left = 110
      Top = 57
      Width = 61
      Height = 13
      Caption = 'Serie Doc.'
    end
    object Label6: TLabel
      Left = 217
      Top = 57
      Width = 53
      Height = 13
      Caption = 'Num.Doc'
    end
    object Label7: TLabel
      Left = 372
      Top = 57
      Width = 63
      Height = 13
      Caption = 'Fecha.Doc'
    end
    object Label10: TLabel
      Left = 539
      Top = 58
      Width = 75
      Height = 13
      Caption = 'Tipo Moneda'
    end
    object edtProvDes: TEdit
      Left = 241
      Top = 20
      Width = 332
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object dbeRuc: TwwDBEdit
      Left = 616
      Top = 20
      Width = 87
      Height = 21
      DataField = 'AUXRUC'
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcAux: TwwDBLookupComboDlg
      Left = 170
      Top = 20
      Width = 67
      Height = 21
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      OnInitDialog = dblcAuxInitDialog
      Selected.Strings = (
        'AUXID'#9'15'#9'C'#243'digo'#9'F'
        'AUXNOMB'#9'40'#9'Nombre'#9'F'
        'AUXRUC'#9'15'#9'AUXRUC'#9'F')
      DataField = 'AUXID'
      LookupField = 'AUXID'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcAuxChange
      OnEnter = OnEnter
      OnExit = dblcAuxExit
      OnKeyPress = OnUpperKeyPress
    end
    object lkcDocid: TwwDBLookupCombo
      Left = 64
      Top = 54
      Width = 41
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DOCID'#9'2'#9'cod'#9'F'
        'DOCDES'#9'30'#9'nombre'#9'F')
      DataField = 'DOCID'
      LookupField = 'DOCID'
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = OnEnter
      OnExit = lkcDocidExit
      OnKeyPress = OnUpperKeyPress
    end
    object dbeSerie: TwwDBEdit
      Left = 170
      Top = 54
      Width = 40
      Height = 21
      CharCase = ecUpperCase
      DataField = 'SERIE'
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = OnEnter
      OnExit = dbeSerieExit
    end
    object dbeNoDoc: TwwDBEdit
      Left = 277
      Top = 54
      Width = 81
      Height = 21
      DataField = 'NODOC'
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = OnEnter
      OnExit = dbeNoDocExit
    end
    object dbdtFecemi: TwwDBDateTimePicker
      Left = 437
      Top = 54
      Width = 92
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'FECEMI'
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 7
      OnEnter = OnEnter
    end
    object dblTipMon: TwwDBLookupCombo
      Left = 618
      Top = 54
      Width = 35
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'2'#9'cod'#9'F'
        'TMONDES'#9'30'#9'nombre'#9'F')
      DataField = 'TMONIDFAC'
      LookupField = 'TMONID'
      Enabled = False
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = OnEnter
      OnExit = dblTipMonExit
      OnKeyPress = OnUpperKeyPress
    end
    object dblClase: TwwDBLookupCombo
      Left = 64
      Top = 20
      Width = 41
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CLAUXID'#9'2'#9'codigo'#9'F'
        'CLAUXDES'#9'30'#9'nombre'#9'F')
      DataField = 'CLAUXID'
      LookupField = 'CLAUXID'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      OnChange = dblClaseChange
      OnEnter = OnEnter
      OnExit = dblClaseExit
      OnKeyPress = OnUpperKeyPress
    end
  end
  object gbDetalle: TGroupBox
    Left = 8
    Top = 63
    Width = 713
    Height = 176
    Caption = 'Detalle :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object dbgGrid: TwwDBGrid
      Left = 17
      Top = 19
      Width = 683
      Height = 148
      DisableThemesInTitle = False
      Selected.Strings = (
        'DOCID'#9'2'#9'TIPO'#9'F'
        'SERIE'#9'5'#9'SERIE'#9'F'
        'NODOC'#9'10'#9'NUMERO DOC'#9'F'
        'FECEMI'#9'10'#9'FEC.EMI.'#9'F'
        'MTOORI'#9'10'#9'MTO PAGO'#9'F'
        'FECPAGO'#9'10'#9'FEC PAGO'#9'F'
        'MTORETORI'#9'10'#9'RETENCION'#9'F'
        'TMONIDFAC'#9'2'#9'MND'#9'F'
        'TCAMB'#9'10'#9'TIPO CAMB.'#9'F'
        'AUXID'#9'10'#9'AUXID'#9'F'
        'AUXRUC'#9'11'#9'AUXRUC'#9'F'
        'CLAUXID'#9'20'#9'CLAUXID'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      KeyOptions = [dgAllowDelete]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap, dgShowFooter]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      FooterColor = clInfoBk
      FooterCellColor = clScrollBar
    end
  end
  object gbDatosPago: TGroupBox
    Left = 8
    Top = 385
    Width = 714
    Height = 59
    Caption = 'Datos del Pago del Documento : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Label11: TLabel
      Left = 400
      Top = 28
      Width = 36
      Height = 13
      Caption = 'Monto'
    end
    object Label13: TLabel
      Left = 15
      Top = 28
      Width = 87
      Height = 13
      Caption = 'Fecha de Pago'
    end
    object Label14: TLabel
      Left = 217
      Top = 28
      Width = 58
      Height = 13
      Caption = 'Tip.Camb.'
    end
    object spbCalcula: TBitBtn
      Left = 599
      Top = 6
      Width = 113
      Height = 44
      Cursor = crHandPoint
      BiDiMode = bdLeftToRight
      Caption = 'Calcula Retenci'#242'n'
      Enabled = False
      ParentBiDiMode = False
      TabOrder = 3
      Visible = False
      OnClick = spbCalculaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
    object dbemonto: TwwDBEdit
      Left = 443
      Top = 23
      Width = 121
      Height = 21
      DataField = 'MTOORI'
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = dbemontoChange
      OnEnter = OnEnter
      OnExit = dbemontoExit
      OnKeyPress = dbemontoKeyPress
    end
    object dbdtFecPag2: TwwDBDateTimePicker
      Left = 104
      Top = 25
      Width = 92
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 0
      OnEnter = OnEnter
      OnExit = dbdtFecPagExit
    end
    object dbeTCam2: TwwDBEdit
      Left = 277
      Top = 23
      Width = 102
      Height = 21
      DataField = 'TCAMB'
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnKeyPress = dbemontoKeyPress
    end
  end
  object gbCalculo: TGroupBox
    Left = 9
    Top = 447
    Width = 285
    Height = 55
    Caption = 'Total Retenci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object Label12: TLabel
      Left = 180
      Top = 6
      Width = 29
      Height = 13
      Caption = 'Tasa'
    end
    object spbOtro: TBitBtn
      Left = 226
      Top = 8
      Width = 56
      Height = 43
      Caption = 'Otro'
      Enabled = False
      TabOrder = 2
      OnClick = spbOtroClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object dbeMontoRet: TwwDBEdit
      Left = 16
      Top = 19
      Width = 122
      Height = 21
      DataField = 'MTORETORI'
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeTasaRet: TwwDBEdit
      Left = 178
      Top = 21
      Width = 35
      Height = 21
      DataField = 'TASACAN'
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object gbxNumero: TGroupBox
    Left = 7
    Top = 7
    Width = 642
    Height = 52
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblNumero: TLabel
      Left = 627
      Top = 11
      Width = 6
      Height = 29
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 15
      Top = 21
      Width = 87
      Height = 13
      Caption = 'Fecha de Pago'
    end
    object Label9: TLabel
      Left = 217
      Top = 21
      Width = 58
      Height = 13
      Caption = 'Tip.Camb.'
    end
    object dbdtFecPag: TwwDBDateTimePicker
      Left = 109
      Top = 17
      Width = 92
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 0
      OnEnter = OnEnter
      OnExit = dbdtFecPagExit
    end
    object dbeTCam: TwwDBEdit
      Left = 277
      Top = 17
      Width = 76
      Height = 21
      DataField = 'TCAMB'
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = dbeTCamChange
      OnExit = dbeTCamExit
      OnKeyPress = dbemontoKeyPress
    end
  end
  object bbtnCancelar: TBitBtn
    Left = 351
    Top = 457
    Width = 54
    Height = 43
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 7
    OnClick = bbtnCancelarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
      993337777F777F3377F3393999707333993337F77737333337FF993399933333
      399377F3777FF333377F993339903333399377F33737FF33377F993333707333
      399377F333377FF3377F993333101933399377F333777FFF377F993333000993
      399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
      99333773FF777F777733339993707339933333773FF7FFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    Layout = blGlyphTop
    NumGlyphs = 2
  end
  object bbtnRetCons: TBitBtn
    Left = 653
    Top = 10
    Width = 67
    Height = 44
    Caption = 'Consulta'
    TabOrder = 1
    OnClick = bbtnRetConsClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
      7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
      777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
      79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
      7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
      777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
      79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
      CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
    Layout = blGlyphTop
    NumGlyphs = 2
  end
  object gbRetencion: TGroupBox
    Left = 9
    Top = 240
    Width = 713
    Height = 49
    Caption = 'Retenci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object lblSerie: TLabel
      Left = 24
      Top = 20
      Width = 30
      Height = 13
      Caption = 'Serie'
    end
    object lblNroRetencion: TLabel
      Left = 207
      Top = 20
      Width = 149
      Height = 13
      Caption = 'N'#250'mero de Retenci'#243'n IGV'
    end
    object dbeRetSerie: TwwDBEdit
      Left = 65
      Top = 18
      Width = 72
      Height = 21
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeRetNumero: TwwDBEdit
      Left = 366
      Top = 18
      Width = 160
      Height = 21
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
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
    TabOrder = 12
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
  object Z2bbtnReImprime: TBitBtn
    Left = 415
    Top = 458
    Width = 54
    Height = 43
    Hint = 'RE Envia Comprobante'
    Caption = 'ReImprimir'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = Z2bbtnReImprimeClick
    Glyph.Data = {
      0E060000424D0E06000000000000360000002800000016000000160000000100
      180000000000D8050000C40E0000C40E00000000000000000000FBF3E5E1A62C
      DE9900E09D00E09D00E09D00E09D00E09D00E09D00E09D00E09D00E09D00E09D
      00E09D00E09D00E09D00E09D00E09D00E09D00DE9900E1A62CFBF3E50000E1A7
      2CDC9300E09D00DF9C00DF9B00DF9B00DF9B00DF9B00DF9B00DF9B00DF9B00DF
      9B00DF9B00DF9B00DF9B00DF9B00DF9B00DF9B00DF9C00E09D00DC9300E1A72C
      0000DE9900E09D00DF9C00D98E00DE9700DC9500DC9600DC9600DC9600DC9600
      DC9600DC9600DC9600DC9600DC9600DC9600DC9500DE9700D98E00DF9C00E09D
      00DE99000000E09D00E09D00DA8D00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDA
      8D00E09D00E09D000000E09D00E09B00DC9800FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FAFAFEFEFFFFFFFFFFFFFF
      FFFFFFDC9700E09B00E09D000000E09D00E09B00DC9700FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE3E3E3FAFAFAFFFF
      FFFFFFFFFFFFFFDC9400E09B00E09D000000E09D00E09B00DC9700FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFDC9500E09B00E09D000000E09D00E09B00DC9700FF
      FFFFFEFEFEFCF7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDC9500E09B00E09D000000E09D00E09B00
      DC9700FFFFFFFFFFFFEBC46FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDC9500E09B00E09D000000E09D
      00E09B00DC9700FFFFFFFFFFFFE1A32CF5E3BAFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDC9500E09B00E09D00
      0000E09D00E09B00DC9700FFFFFFFFFFFFEFD18CDC960DFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDC9500E09B
      00E09D000000E09D00E09B00DC9700FFFFFFFFFFFFF9EED0D88700ECCA81FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8
      8A00DF9A00E09D000000E09D00E09B00DC9700FFFFFFFFFFFFFFFFFFDB9300DC
      9200F4DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF1D494DA8F00DE98000000E09D00E09B00DC9700FFFFFFFFFFFFFFFFFF
      EECD85DB8C00D98D00F4DDADFFFFFFFFFFFFFFFFFFFFFFFFFDFCFAF7E5BEFFFF
      FFFFFFFFFFFFFFFFFFFFFAEFDBE0A1260000E09D00E09B00DC9700FFFFFFFFFF
      FFFFFFFFFCF8EDDF9C12DD9500DC9500EECB86FFFFFFFFFFFFFFFFFFFEFDFBDC
      9009EBC471FCFAF4FFFFFFFFFFFFFFFFFFFAF1DB0000E09D00E09B00DC9700FF
      FFFFFFFFFFFFFFFFFFFFFFF2D89EDB9100DF9900DB9200E1A226F4DDAAFFFFFF
      FFFFFFDD9413DD9400DD9A0BF5E0B1FFFFFFFFFFFFFFFFFF0000E09D00E09B00
      DC9700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D89CDC9100DF9900DE9A00DA8A
      00DC9700E7B957DE9B08E09C00DF9B00D78500E5AF3BF8EAD1FFFFFF0000E09D
      00E09B00DC9800FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D699DD980ADB
      8F00DF9C00DF9B00DD9500DF9C00E09D00E09D00E09E00DD9400DC9200E9BB5F
      0000E09D00E09D00DA8D00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FCF7EDEECB80D98B00D98D00DC9200E09C00E09D00E09D00DF9C00DC9200DB95
      07F4E1B50000DE9900E09D00DF9C00D98E00DE9700DC9500DC9600DC9200E3AA
      34F8EBD0FFFFFFFFFFFFFFFFFFF7E9C7F0D192DD9707DF9C00DC9300DD970CE9
      BF62FFFFFFFFFFFF0000E1A72CDC9300E09D00DF9C00DF9B00DF9B00DF9B00DF
      9B00DC9300DC9400ECC683FDFBF8FFFFFFFFFFFFFFFFFFDC9313DA8E00E5B34E
      F7E8CAFFFFFFFFFFFFFFFFFF0000FBF3E5E1A62CDE9900E09D00E09D00E09D00
      E09D00E09D00E09D00DF9B00DC9400DD9A10EECD8CFFFFFFFDFEFDDE9A11F8E9
      CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
    Layout = blGlyphTop
    NumGlyphs = 2
  end
end
