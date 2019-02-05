object FTrasladoAmort: TFTrasladoAmort
  Left = 171
  Top = 179
  BorderStyle = bsSingle
  Caption = 'Traslado de amortizaciones/cancelaciones de una Provisi'#243'n a Otra'
  ClientHeight = 364
  ClientWidth = 695
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
  object pnlProvisionOrig: TPanel
    Left = 5
    Top = 60
    Width = 330
    Height = 250
    Color = 14869218
    TabOrder = 0
    object lblTipDocOrig: TLabel
      Left = 16
      Top = 24
      Width = 94
      Height = 13
      Caption = 'Tipo de Documento'
    end
    object lblProveedorOrig: TLabel
      Left = 69
      Top = 70
      Width = 49
      Height = 13
      Caption = 'Proveedor'
    end
    object lblSerieDocOrig: TLabel
      Left = 16
      Top = 175
      Width = 24
      Height = 13
      Caption = 'Serie'
    end
    object lblNroDocOrig: TLabel
      Left = 75
      Top = 175
      Width = 110
      Height = 13
      Caption = 'N'#250'mero de Documento'
    end
    object lblClAuxOrig: TLabel
      Left = 16
      Top = 70
      Width = 30
      Height = 13
      Caption = 'Cl.Aux'
    end
    object lblRUCOrig: TLabel
      Left = 154
      Top = 70
      Width = 23
      Height = 13
      Caption = 'RUC'
    end
    object lblRazonSocOrig: TLabel
      Left = 16
      Top = 126
      Width = 111
      Height = 13
      Caption = 'Nombre / Raz'#243'n Social'
    end
    object dblcTDocOrig: TwwDBLookupCombo
      Left = 17
      Top = 38
      Width = 47
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
      LookupField = 'DOCID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTDocOrigExit
    end
    object edtTDocOrig: TEdit
      Left = 68
      Top = 38
      Width = 145
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
    object dblcClAuxOrig: TwwDBLookupCombo
      Left = 16
      Top = 86
      Width = 49
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
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcClAuxOrigExit
    end
    object dblcdProvOrig: TwwDBLookupComboDlg
      Left = 69
      Top = 86
      Width = 83
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
      LookupField = 'PROV'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 11
      ParentFont = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcdProvOrigEnter
      OnExit = dblcdProvOrigExit
    end
    object dblcdProvRucOrig: TwwDBLookupComboDlg
      Left = 154
      Top = 86
      Width = 112
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
        'PROVRUC'#9'12'#9'Reg.Unico'#9'F'
        'PROV'#9'12'#9'Proveedor'#9'F'
        'PROVDES'#9'40'#9'Raz'#243'n Social'#9'F'
        'PROVABR'#9'15'#9'Nombre Corto'#9'F')
      DataField = 'PROVRUC'
      LookupField = 'PROVRUC'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 11
      ParentFont = False
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcdProvRucOrigEnter
      OnExit = dblcdProvRucOrigExit
    end
    object edtProvOrig: TEdit
      Left = 17
      Top = 143
      Width = 288
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
      TabOrder = 5
    end
    object bbtnDatosOrig: TBitBtn
      Left = 208
      Top = 216
      Width = 114
      Height = 25
      Hint = 'Busca Datos Documento Origen'
      Caption = 'Busca Doc.Origen'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = bbtnDatosOrigClick
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
    object edtSerieOrig: TwwDBEdit
      Left = 17
      Top = 193
      Width = 51
      Height = 23
      DataField = 'CPSERIE'
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
      OnExit = edtSerieOrigExit
    end
    object edtNoDocOrig: TwwDBEdit
      Left = 73
      Top = 193
      Width = 121
      Height = 23
      DataField = 'CPNODOC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = edtNoDocOrigExit
    end
  end
  object pnlProvisionDest: TPanel
    Left = 361
    Top = 60
    Width = 330
    Height = 250
    Color = 14869218
    TabOrder = 1
    object lblTipDocDest: TLabel
      Left = 16
      Top = 24
      Width = 94
      Height = 13
      Caption = 'Tipo de Documento'
    end
    object lblSerieDocDest: TLabel
      Left = 16
      Top = 175
      Width = 24
      Height = 13
      Caption = 'Serie'
    end
    object lblNroDocDest: TLabel
      Left = 75
      Top = 175
      Width = 110
      Height = 13
      Caption = 'N'#250'mero de Documento'
    end
    object Label1: TLabel
      Left = 16
      Top = 126
      Width = 111
      Height = 13
      Caption = 'Nombre / Raz'#243'n Social'
    end
    object Label2: TLabel
      Left = 16
      Top = 70
      Width = 30
      Height = 13
      Caption = 'Cl.Aux'
    end
    object Label3: TLabel
      Left = 69
      Top = 70
      Width = 49
      Height = 13
      Caption = 'Proveedor'
    end
    object Label4: TLabel
      Left = 154
      Top = 70
      Width = 23
      Height = 13
      Caption = 'RUC'
    end
    object edtSerieDest: TwwDBEdit
      Left = 17
      Top = 193
      Width = 51
      Height = 23
      DataField = 'CPSERIE'
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
    end
    object edtNoDocDest: TwwDBEdit
      Left = 73
      Top = 193
      Width = 121
      Height = 23
      DataField = 'CPNODOC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtProvDest: TEdit
      Left = 17
      Top = 143
      Width = 288
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
      TabOrder = 5
    end
    object dblcClAuxDest: TwwDBLookupCombo
      Left = 16
      Top = 86
      Width = 49
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
      Enabled = False
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object dblcdProvDest: TwwDBLookupComboDlg
      Left = 69
      Top = 86
      Width = 83
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
      LookupField = 'PROV'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      Enabled = False
      MaxLength = 11
      ParentFont = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcdProvRucDest: TwwDBLookupComboDlg
      Left = 154
      Top = 86
      Width = 112
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
        'PROVRUC'#9'12'#9'Reg.Unico'#9'F'
        'PROV'#9'12'#9'Proveedor'#9'F'
        'PROVDES'#9'40'#9'Raz'#243'n Social'#9'F'
        'PROVABR'#9'15'#9'Nombre Corto'#9'F')
      DataField = 'PROVRUC'
      LookupField = 'PROVRUC'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      Enabled = False
      MaxLength = 11
      ParentFont = False
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcTDocDest: TwwDBLookupCombo
      Left = 17
      Top = 38
      Width = 47
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
      LookupField = 'DOCID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTDocDestExit
    end
    object edtTDocDest: TEdit
      Left = 68
      Top = 38
      Width = 145
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
    object bbtnDatosDest: TBitBtn
      Left = 206
      Top = 216
      Width = 120
      Height = 25
      Hint = 'Busca Datos Documento Destino'
      Caption = 'Busca Doc.Destino'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = bbtnDatosDestClick
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
  object pnlCabOrig: TPanel
    Left = 5
    Top = 8
    Width = 330
    Height = 45
    Color = 14869218
    TabOrder = 2
    object lblProvisionOrig: TLabel
      Left = 8
      Top = 12
      Width = 314
      Height = 26
      AutoSize = False
      Caption = 'Provisi'#243'n Original'
      WordWrap = True
    end
  end
  object pnlCabDest: TPanel
    Left = 361
    Top = 8
    Width = 330
    Height = 45
    Color = 14869218
    TabOrder = 3
    object lblProvisionDest: TLabel
      Left = 8
      Top = 12
      Width = 314
      Height = 26
      AutoSize = False
      Caption = 'Provisi'#243'n Destino'
      WordWrap = True
    end
  end
  object pnlTransferir: TPanel
    Left = 2
    Top = 314
    Width = 689
    Height = 42
    Color = 14869218
    TabOrder = 4
    object bbtnTransferir: TBitBtn
      Left = 483
      Top = 8
      Width = 84
      Height = 25
      Hint = 'Transferir Amortizaciones/Cancelaciones'
      Caption = 'Transferir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bbtnTransferirClick
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
    object bbtnSalir: TBitBtn
      Left = 592
      Top = 8
      Width = 84
      Height = 25
      Hint = 'Transferir Amortizaciones/Cancelaciones'
      Caption = 'Salir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnSalirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object bbtnNuevaBusqueda: TBitBtn
      Left = 27
      Top = 8
      Width = 126
      Height = 25
      Hint = 'Inicializa y realiza una nueva b'#250'squeda de documentos'
      Caption = 'Nueva B'#250'squeda'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnNuevaBusquedaClick
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
end
