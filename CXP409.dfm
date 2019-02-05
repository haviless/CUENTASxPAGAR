object FCuadroMensual: TFCuadroMensual
  Left = 419
  Top = 170
  BorderStyle = bsDialog
  Caption = 'Compras Mensuales'
  ClientHeight = 394
  ClientWidth = 208
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCia: TLabel
    Left = 10
    Top = 13
    Width = 49
    Height = 13
    Caption = 'Compa'#241#237'a'
  end
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 19
    Height = 13
    Caption = 'A'#241'o'
  end
  object dblcCia: TwwDBLookupCombo
    Left = 7
    Top = 32
    Width = 42
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'Cia'#9'F'
      'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
    LookupField = 'CIAID'
    Options = [loColLines, loRowLines, loTitles]
    Style = csDropDownList
    DropDownCount = 15
    MaxLength = 2
    TabOrder = 0
    AutoDropDown = True
    ShowButton = True
    SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblcCiaExit
    OnNotInList = NotInList
  end
  object edtCia: TEdit
    Left = 53
    Top = 32
    Width = 152
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object dbeAno: TwwDBSpinEdit
    Left = 8
    Top = 72
    Width = 73
    Height = 21
    Increment = 1.000000000000000000
    MaxValue = 2050.000000000000000000
    MinValue = 1980.000000000000000000
    MaxLength = 4
    TabOrder = 2
    UnboundDataType = wwDefault
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 100
    Width = 193
    Height = 49
    Caption = 'Clase Auxiliar'
    TabOrder = 3
    object rbClTodos: TRadioButton
      Left = 8
      Top = 16
      Width = 57
      Height = 17
      Caption = 'Todos'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbClTodosClick
    end
    object rbClSelec: TRadioButton
      Left = 72
      Top = 16
      Width = 81
      Height = 17
      Caption = 'Seleccionar'
      TabOrder = 1
      OnClick = rbClSelecClick
    end
    object bbtnSeleccionaClAux: TBitBtn
      Left = 152
      Top = 16
      Width = 25
      Height = 25
      Hint = 'Selecciona Clase Auxiliar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnSeleccionaClAuxClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 156
    Width = 193
    Height = 49
    Caption = 'Auxiliar'
    TabOrder = 4
    object rbAuxTodos: TRadioButton
      Left = 8
      Top = 16
      Width = 57
      Height = 17
      Caption = 'Todos'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbAuxTodosClick
    end
    object rbAuxSelec: TRadioButton
      Left = 72
      Top = 16
      Width = 81
      Height = 17
      Caption = 'Seleccionar'
      TabOrder = 1
      OnClick = rbAuxSelecClick
    end
    object bbtnSeleccionaAux: TBitBtn
      Left = 152
      Top = 16
      Width = 25
      Height = 25
      Hint = 'Selecciona Clase Auxiliar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnSeleccionaAuxClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object rgMonto: TRadioGroup
    Left = 8
    Top = 212
    Width = 193
    Height = 81
    Caption = 'Tipo de Monto a Considerar'
    ItemIndex = 0
    Items.Strings = (
      'Monto Gravado'
      'Base Imponible'
      'Monto Total')
    TabOrder = 5
  end
  object rgMoneda: TRadioGroup
    Left = 12
    Top = 297
    Width = 193
    Height = 41
    Caption = 'Moneda'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Nacional'
      'Extranjera')
    TabOrder = 6
  end
  object bbtnOk: TBitBtn
    Left = 140
    Top = 349
    Width = 30
    Height = 24
    Hint = 'Imprimir'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = bbtnOkClick
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
    Left = 176
    Top = 349
    Width = 30
    Height = 24
    TabOrder = 8
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
  object pnlClAux: TPanel
    Left = 216
    Top = 32
    Width = 401
    Height = 313
    Color = clInfoBk
    TabOrder = 9
    Visible = False
    object dbgClAux: TwwDBGrid
      Left = 1
      Top = 18
      Width = 399
      Height = 120
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      DataSource = dsClAux
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = True
      OnTitleButtonClick = dbgClAuxTitleButtonClick
      OnDragOver = dbgClAuxDragOver
      OnEndDrag = dbgClAuxEndDrag
      OnMouseDown = dbgClAuxMouseDown
    end
    object dbgClAuxSelec: TwwDBGrid
      Left = 1
      Top = 155
      Width = 399
      Height = 124
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      DataSource = dsClAuxClone
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnDragOver = dbgClAuxSelecDragOver
      OnEndDrag = dbgClAuxSelecEndDrag
      OnMouseDown = dbgClAuxSelecMouseDown
    end
    object StaticText2: TStaticText
      Left = 1
      Top = 1
      Width = 399
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'Clase Auxiliar'
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object StaticText1: TStaticText
      Left = 1
      Top = 138
      Width = 399
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'Clase Auxiliar Escogidas'
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
    object bbtnClAux: TBitBtn
      Left = 352
      Top = 280
      Width = 43
      Height = 25
      TabOrder = 4
      OnClick = bbtnClAuxClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object pnlBusca: TPanel
      Left = 64
      Top = 32
      Width = 281
      Height = 41
      Color = 10207162
      TabOrder = 5
      Visible = False
      object lblBusca: TLabel
        Left = 12
        Top = 13
        Width = 132
        Height = 13
        Caption = 'Nombre de Clase de Auxiliar'
      end
      object isBusca: TwwIncrementalSearch
        Left = 160
        Top = 8
        Width = 105
        Height = 21
        DataSource = dsClAux
        TabOrder = 0
        OnExit = isBuscaExit
      end
    end
  end
  object pnlAux: TPanel
    Left = 216
    Top = 32
    Width = 401
    Height = 313
    Color = clInfoBk
    TabOrder = 10
    Visible = False
    object dbgAux: TwwDBGrid
      Left = 1
      Top = 18
      Width = 399
      Height = 120
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      DataSource = dsAux
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = True
      OnTitleButtonClick = dbgAuxTitleButtonClick
      OnDragOver = dbgAuxDragOver
      OnEndDrag = dbgAuxEndDrag
      OnMouseDown = dbgAuxMouseDown
    end
    object dbgAuxSelec: TwwDBGrid
      Left = 1
      Top = 155
      Width = 399
      Height = 124
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      DataSource = dsAuxClone
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnDragOver = dbgAuxSelecDragOver
      OnEndDrag = dbgAuxSelecEndDrag
      OnMouseDown = dbgAuxSelecMouseDown
    end
    object StaticText3: TStaticText
      Left = 1
      Top = 1
      Width = 399
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'Auxiliar'
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object StaticText4: TStaticText
      Left = 1
      Top = 138
      Width = 399
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'Auxiliar Escogidas'
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
    object bbtnAux: TBitBtn
      Left = 352
      Top = 280
      Width = 43
      Height = 25
      TabOrder = 4
      OnClick = bbtnAuxClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object pnlBusca1: TPanel
      Left = 64
      Top = 32
      Width = 281
      Height = 41
      Color = 10207162
      TabOrder = 5
      Visible = False
      object lblBusca1: TLabel
        Left = 12
        Top = 13
        Width = 132
        Height = 13
        Caption = 'Nombre de Clase de Auxiliar'
      end
      object isBusca1: TwwIncrementalSearch
        Left = 160
        Top = 8
        Width = 105
        Height = 21
        DataSource = dsAux
        TabOrder = 0
        OnExit = isBusca1Exit
      end
    end
  end
  object ppdbCuadroMensual: TppDBPipeline
    UserName = 'dbCuadroMensual'
    Left = 16
    Top = 352
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'CPANOMES'
      FieldName = 'CPANOMES'
      FieldLength = 6
      DisplayWidth = 6
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'CPNOREG'
      FieldName = 'CPNOREG'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'TREGID'
      FieldName = 'TREGID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'TREGDES'
      FieldName = 'TREGDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CPTOID'
      FieldName = 'CPTOID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'CUENTAID'
      FieldName = 'CUENTAID'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'DCPGLOSA'
      FieldName = 'DCPGLOSA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'CCOSID'
      FieldName = 'CCOSID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'CCOSDES'
      FieldName = 'CCOSDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'PARPRESID'
      FieldName = 'PARPRESID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'DCPDH'
      FieldName = 'DCPDH'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = '14'
      FieldName = '14'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = '15'
      FieldName = '15'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
  end
  object pprCuadroMensual: TppReport
    AutoStop = False
    DataPipeline = ppdbCuadroMensual
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 378090
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SOLExes\SOLFormatos\CXP\Bhl\CuadroMensualCompras.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 48
    Top = 352
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbCuadroMensual'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'CUADRO DE COMPRAS MENSUALES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 3175
        mmWidth = 50006
        BandType = 0
      end
      object pplblCCMAno: TppLabel
        UserName = 'lblCCMAno'
        Caption = '2003'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 204523
        mmTop = 3175
        mmWidth = 7408
        BandType = 0
      end
      object pplblCCMMoneda: TppLabel
        UserName = 'lblCCMMoneda'
        Caption = '* NUEVOS SOLES *'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162190
        mmTop = 9260
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'NRO.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 15081
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'PROVEEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 15081
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'ENERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 63765
        mmTop = 15346
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'FEBRERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 80963
        mmTop = 15346
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'MARZO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 15346
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'ABRIL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 126471
        mmTop = 15346
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'MAYO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 149225
        mmTop = 15346
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'JUNIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 15346
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'JULIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 189177
        mmTop = 15346
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'AGOSTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 208227
        mmTop = 15346
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'SETIEMBRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 223573
        mmTop = 15346
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'OCTUBRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 248180
        mmTop = 15346
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'NOVIEMBRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265378
        mmTop = 15346
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'DICIEMBRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 286280
        mmTop = 15346
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 315913
        mmTop = 15346
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 335492
        mmTop = 15346
        mmWidth = 1852
        BandType = 0
      end
      object pplblCCMCia: TppLabel
        UserName = 'lblCCMCia'
        Caption = 'DISTRIBUIDORA INCORESA S.A'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 4498
        mmTop = 794
        mmWidth = 48154
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNoDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 315913
        mmTop = 0
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 312209
        mmTop = 4498
        mmWidth = 18521
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '#####'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PROVDES'
        DataPipeline = ppdbCuadroMensual
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 4233
        mmLeft = 9790
        mmTop = 0
        mmWidth = 39158
        BandType = 4
      end
      object ppdbENE: TppDBText
        UserName = 'dbENE'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0301'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 61913
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbFEB: TppDBText
        UserName = 'dbFEB'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0302'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 82815
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbMAR: TppDBText
        UserName = 'dbMAR'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0303'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 103717
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbABR: TppDBText
        UserName = 'dbABR'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0304'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 124619
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbMAY: TppDBText
        UserName = 'dbMAY'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0305'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 145521
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbJUN: TppDBText
        UserName = 'dbJUN'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0306'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 166423
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbJUL: TppDBText
        UserName = 'dbJUL'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0307'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 187325
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbAGO: TppDBText
        UserName = 'dbAGO'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0308'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 208227
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbSET: TppDBText
        UserName = 'dbSET'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0309'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 229130
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbOCT: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0310'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 250032
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbNOV: TppDBText
        UserName = 'dbNOV'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0311'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 270934
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbDIC: TppDBText
        UserName = 'dbDIC'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0312'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 291836
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbTOT: TppDBText
        UserName = 'dbTOT'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0313'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 313796
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppdbPOR: TppDBText
        UserName = 'dbPOR'
        AutoSize = True
        DataField = 'PORC'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 330730
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'T O T A L E S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 0
        mmWidth = 24077
        BandType = 7
      end
      object ppdbTENE: TppDBCalc
        UserName = 'dbTENE'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0301'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 52652
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTFEB: TppDBCalc
        UserName = 'dbTENE1'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0302'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 73554
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTMAR: TppDBCalc
        UserName = 'dbTENE2'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0303'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 94456
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTABR: TppDBCalc
        UserName = 'dbTENE3'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0304'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 115359
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTMAY: TppDBCalc
        UserName = 'dbTENE4'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0305'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 136261
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTJUN: TppDBCalc
        UserName = 'dbTENE5'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0306'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 157163
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTJUL: TppDBCalc
        UserName = 'dbTENE6'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0307'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 178065
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTAGO: TppDBCalc
        UserName = 'dbTENE7'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0308'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 198967
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTSET: TppDBCalc
        UserName = 'dbTENE8'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0309'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 219869
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTOCT: TppDBCalc
        UserName = 'dbTENE9'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0310'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 240771
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTNOV: TppDBCalc
        UserName = 'dbTNOV'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0311'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 261673
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTDIC: TppDBCalc
        UserName = 'dbTDIC'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0312'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 282576
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTTOT: TppDBCalc
        UserName = 'dbTTOT'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CP0313'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 304536
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppdbTPOR: TppDBCalc
        UserName = 'dbTPOR'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'PORC'
        DataPipeline = ppdbCuadroMensual
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCuadroMensual'
        mmHeight = 3704
        mmLeft = 321469
        mmTop = 0
        mmWidth = 16669
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 
          '================================================================' +
          '================================================================' +
          '======================='
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 52652
        mmTop = 4763
        mmWidth = 279665
        BandType = 7
      end
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
    Report = pprCuadroMensual
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 80
    Top = 352
  end
  object cdsClAux: TwwClientDataSet
    Aggregates = <>
    Filter = 'FLAG='#39'N'#39
    Filtered = True
    Params = <>
    ProviderName = 'prvDocsCont'
    ValidateWithMask = True
    Left = 122
    Top = 2
  end
  object dsClAux: TwwDataSource
    DataSet = cdsClAux
    Left = 156
    Top = 2
  end
  object dsClAuxClone: TwwDataSource
    DataSet = cdsClAuxClone
    Left = 220
    Top = 2
  end
  object cdsClAuxClone: TwwClientDataSet
    Aggregates = <>
    Filter = 'FLAG='#39'S'#39
    Filtered = True
    Params = <>
    ValidateWithMask = True
    Left = 210
  end
  object cdsAux: TwwClientDataSet
    Aggregates = <>
    Filter = 'FLAG='#39'N'#39
    Filtered = True
    Params = <>
    ProviderName = 'prvDocsCont'
    ValidateWithMask = True
    Left = 290
    Top = 2
  end
  object dsAux: TwwDataSource
    DataSet = cdsAux
    Left = 300
    Top = 4
  end
  object dsAuxClone: TwwDataSource
    DataSet = cdsAuxClone
    Left = 364
    Top = 2
  end
  object cdsAuxClone: TwwClientDataSet
    Aggregates = <>
    Filter = 'FLAG='#39'S'#39
    Filtered = True
    Params = <>
    ValidateWithMask = True
    Left = 354
  end
end
