object FEstCxCPro: TFEstCxCPro
  Left = 215
  Top = 112
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Estados de Cuenta por Proveedores'
  ClientHeight = 585
  ClientWidth = 804
  Color = 14869218
  Constraints.MaxHeight = 644
  Constraints.MaxWidth = 861
  Constraints.MinHeight = 559
  Constraints.MinWidth = 743
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
  object Label17: TLabel
    Left = 354
    Top = 67
    Width = 79
    Height = 15
    Caption = 'Saldo Ant. M.E.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel
    Left = 446
    Top = 67
    Width = 61
    Height = 15
    Caption = 'Cargos M.E.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 536
    Top = 67
    Width = 63
    Height = 15
    Caption = 'Abonos M.E.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label20: TLabel
    Left = 627
    Top = 67
    Width = 79
    Height = 15
    Caption = 'Saldo Act. M.E.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object pnlFOOT: TPanel
    Left = 0
    Top = 542
    Width = 804
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    Color = 14869218
    TabOrder = 3
    object Z2bbtnCancel: TBitBtn
      Left = 739
      Top = 13
      Width = 42
      Height = 28
      TabOrder = 0
      OnClick = Z2bbtnCancelClick
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
    object bbtnPrint: TBitBtn
      Left = 524
      Top = 14
      Width = 38
      Height = 28
      TabOrder = 1
      OnClick = bbtnPrintClick
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
    object BitBtn1: TBitBtn
      Left = 695
      Top = 12
      Width = 42
      Height = 30
      TabOrder = 2
      OnClick = BitBtn1Click
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
    object Z2bbtnRepAnos: TBitBtn
      Left = 651
      Top = 13
      Width = 42
      Height = 29
      Hint = 'Reporte Anual'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      OnClick = Z2bbtnRepAnosClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300030003
        0003333377737773777333333333333333333FFFFFFFFFFFFFFF770000000000
        0000777777777777777733039993BBB3CCC3337F737F737F737F37039993BBB3
        CCC3377F737F737F737F33039993BBB3CCC33F7F737F737F737F77079997BBB7
        CCC77777737773777377330399930003CCC3337F737F7773737F370399933333
        CCC3377F737F3333737F330399933333CCC33F7F737FFFFF737F770700077777
        CCC77777777777777377330333333333CCC3337F33333333737F370333333333
        0003377F33333333777333033333333333333F7FFFFFFFFFFFFF770777777777
        7777777777777777777733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object Z2bbtnOtros: TBitBtn
      Left = 606
      Top = 13
      Width = 42
      Height = 29
      Hint = 'Otros Clientes de este grupo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Visible = False
      OnClick = Z2bbtnOtrosClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
        0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
        0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
        0005555555575FF7777555555555000555555555555577755555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
    object bbtnImprimeAmortiza: TBitBtn
      Left = 563
      Top = 14
      Width = 40
      Height = 28
      TabOrder = 5
      Visible = False
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
  object pgcDctos: TPageControl
    Left = 0
    Top = 144
    Width = 804
    Height = 398
    ActivePage = TabSheet6
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TabSheet6: TTabSheet
      Caption = 'Todos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 796
        Height = 21
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Todos los Documentos'
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgTodos: TwwDBGrid
        Left = 0
        Top = 21
        Width = 796
        Height = 347
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 3
        TitleButtons = True
        OnTitleButtonClick = dbgTodosTitleButtonClick
        FooterColor = 7566265
        FooterCellColor = 12904163
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Provisi'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      PopupMenu = ppmDocu
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 796
        Height = 21
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Documentos por Pagar'
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgEst2: TwwDBGrid
        Left = 0
        Top = 21
        Width = 796
        Height = 347
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = 15792632
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 3
        TitleButtons = True
        OnCalcCellColors = dbgEst2CalCellColors
        OnCalcTitleAttributes = dbgEst2CalcTitleAttributes
        OnTitleButtonClick = dbgEst2TitleButtonClick
        FooterColor = 7566265
        FooterCellColor = 12904163
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'N. Credito'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      PopupMenu = ppmNCre
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 796
        Height = 21
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Notas de Cr'#233'dito'
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgEst6: TwwDBGrid
        Left = 0
        Top = 21
        Width = 796
        Height = 347
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = 15792632
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 3
        TitleButtons = True
        OnTitleButtonClick = dbgEst6TitleButtonClick
        FooterColor = 7566265
        FooterCellColor = 12904163
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Letras'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ImageIndex = 4
      ParentFont = False
      PopupMenu = ppmLetra
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 796
        Height = 21
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Letras por Cobrar'
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgEst3: TwwDBGrid
        Left = 0
        Top = 21
        Width = 796
        Height = 347
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = 15792632
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 3
        TitleButtons = True
        OnCalcCellColors = dbgEst3CalcCellColors
        OnCalcTitleAttributes = dbgEst3CalcTitleAttributes
        OnTitleButtonClick = dbgEst3TitleButtonClick
        FooterColor = 7566265
        FooterCellColor = 12904163
      end
    end
    object pgcNProv: TTabSheet
      Caption = 'No Provisionados'
      ImageIndex = 4
      object dbgNProv: TwwDBGrid
        Left = 0
        Top = 0
        Width = 796
        Height = 368
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = 15792632
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 3
        TitleButtons = True
        OnCalcCellColors = dbgEst3CalcCellColors
        OnCalcTitleAttributes = dbgEst3CalcTitleAttributes
        OnTitleButtonClick = dbgEst3TitleButtonClick
        FooterColor = 7566265
        FooterCellColor = 12904163
      end
    end
  end
  object pnlLetras: TPanel
    Left = 42
    Top = 266
    Width = 726
    Height = 263
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BevelWidth = 2
    Color = 12904163
    TabOrder = 4
    Visible = False
    object lblDocumento: TLabel
      Left = 4
      Top = 24
      Width = 718
      Height = 23
      Align = alTop
      Caption = 'LET '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Pitch = fpFixed
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgHist: TwwDBGrid
      Left = 4
      Top = 47
      Width = 718
      Height = 212
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = 15792632
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgHistDblClick
      FooterColor = 7566265
      FooterCellColor = 11974251
    end
    object pnlHist: TStaticText
      Left = 4
      Top = 4
      Width = 718
      Height = 20
      Align = alTop
      Alignment = taCenter
      Caption = 'Cancelaciones de letras'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object bbtnCierraHist: TBitBtn
      Left = 699
      Top = 3
      Width = 20
      Height = 20
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bbtnCierraHistClick
    end
  end
  object pnlHEAD: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 144
    Align = alTop
    BevelOuter = bvNone
    Color = 14869218
    TabOrder = 0
    object pgcDatCli: TPageControl
      Left = 0
      Top = 0
      Width = 785
      Height = 144
      ActivePage = tshDatCliente
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object tshDatCliente: TTabSheet
        Caption = 'Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        object Label11: TLabel
          Left = 7
          Top = 0
          Width = 52
          Height = 15
          Caption = 'Proveedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 459
          Top = 76
          Width = 70
          Height = 15
          Caption = 'Sdo Ant. M.E.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 608
          Top = 76
          Width = 63
          Height = 15
          Caption = 'Abonos M.E.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 343
          Top = 0
          Width = 51
          Height = 15
          Caption = 'Direcci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 7
          Top = 38
          Width = 59
          Height = 15
          Caption = 'Tel'#233'fono(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 534
          Top = 76
          Width = 61
          Height = 15
          Caption = 'Cargos M.E.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 683
          Top = 76
          Width = 79
          Height = 15
          Caption = 'Saldo Act. M.E.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 683
          Top = 38
          Width = 81
          Height = 15
          Caption = 'Saldo Act. M.N.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 608
          Top = 38
          Width = 65
          Height = 15
          Caption = 'Abonos M.N.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 534
          Top = 38
          Width = 63
          Height = 15
          Caption = 'Cargos M.N.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 459
          Top = 38
          Width = 72
          Height = 15
          Caption = 'Sdo Ant. M.N.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 642
          Top = 0
          Width = 40
          Height = 15
          Caption = 'Distrito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object rgEST: TRadioGroup
          Left = 107
          Top = 48
          Width = 177
          Height = 65
          Caption = 'Estados de Documentos'
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ItemIndex = 1
          Items.Strings = (
            'Todos'
            'Pendientes'
            'Cancelados'
            'Pend. Acept.')
          ParentFont = False
          TabOrder = 13
        end
        object dbeCLIE: TwwDBEdit
          Left = 107
          Top = 13
          Width = 236
          Height = 23
          CharCase = ecUpperCase
          DataField = 'PROVDES'
          DataSource = DMCXP.dsCXP
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDirec: TwwDBEdit
          Left = 344
          Top = 13
          Width = 297
          Height = 23
          DataField = 'PROVDIR'
          DataSource = DMCXP.dsCXP
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDistrito: TwwDBEdit
          Left = 642
          Top = 13
          Width = 121
          Height = 23
          DataField = 'ZIPDES'
          DataSource = DMCXP.dsCXP
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeTelf: TwwDBEdit
          Left = 3
          Top = 53
          Width = 72
          Height = 23
          DataField = 'PROVTELF'
          DataSource = DMCXP.dsCXP
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnMouseMove = dbeTelfMouseMove
        end
        object dbeSalAntME: TwwDBEdit
          Left = 459
          Top = 89
          Width = 71
          Height = 23
          DataField = 'SALANTME'
          DataSource = DMCXP.dsQry1
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dbeCargosME: TwwDBEdit
          Left = 534
          Top = 89
          Width = 71
          Height = 23
          DataField = 'CARGOSME'
          DataSource = DMCXP.dsQry1
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dbeAbonosME: TwwDBEdit
          Left = 608
          Top = 89
          Width = 71
          Height = 23
          DataField = 'ABONOSME'
          DataSource = DMCXP.dsQry1
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dbeSalActME: TwwDBEdit
          Left = 683
          Top = 89
          Width = 71
          Height = 23
          DataField = 'SALTOTALME'
          DataSource = DMCXP.dsQry1
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dblcProv: TwwDBEdit
          Left = 3
          Top = 13
          Width = 102
          Height = 23
          CharCase = ecUpperCase
          DataField = 'PROV'
          DataSource = DMCXP.dsCXP
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeSalActMN: TwwDBEdit
          Left = 683
          Top = 53
          Width = 71
          Height = 23
          DataField = 'SALTOTALMN'
          DataSource = DMCXP.dsQry1
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dbeAbonosMN: TwwDBEdit
          Left = 608
          Top = 53
          Width = 71
          Height = 23
          DataField = 'ABONOSMN'
          DataSource = DMCXP.dsQry1
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dbeCargosMN: TwwDBEdit
          Left = 534
          Top = 53
          Width = 71
          Height = 23
          DataField = 'CARGOSMN'
          DataSource = DMCXP.dsQry1
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dbeSalAntMN: TwwDBEdit
          Left = 459
          Top = 53
          Width = 71
          Height = 23
          DataField = 'SALANTMN'
          DataSource = DMCXP.dsQry1
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object Z2bbtnAceptar: TBitBtn
          Left = 344
          Top = 63
          Width = 32
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          OnClick = Z2bbtnAceptarClick
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
      object tshEstDctos: TTabSheet
        Caption = 'Cambia Estado Docs.'
        ImageIndex = 3
        object lblTipCam: TLabel
          Left = 9
          Top = 70
          Width = 78
          Height = 15
          Caption = 'Tipo de Cambio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 214
          Top = 7
          Width = 58
          Height = 15
          Caption = 'Comentario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 33
          Top = 7
          Width = 47
          Height = 15
          Caption = 'A'#241'o/Mes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object dbeTCAMB: TwwDBEdit
          Left = 8
          Top = 86
          Width = 89
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnKeyPress = dbeTCAMBKeyPress
        end
        object gbPER: TGroupBox
          Left = 583
          Top = 16
          Width = 209
          Height = 69
          Caption = 'Periodo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label1: TLabel
            Left = 7
            Top = 13
            Width = 68
            Height = 15
            Caption = 'Fecha Inicial'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 114
            Top = 12
            Width = 58
            Height = 15
            Caption = 'Fecha Final'
          end
          object Label3: TLabel
            Left = 98
            Top = 31
            Width = 9
            Height = 15
            Caption = 'al'
          end
          object dtpINI: TwwDBDateTimePicker
            Left = 7
            Top = 27
            Width = 87
            Height = 23
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'Draft 12cpi'
            CalendarAttributes.Font.Style = []
            Epoch = 1950
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 0
            UnboundDataType = wwDTEdtDate
          end
          object chbFecha: TCheckBox
            Left = 7
            Top = 50
            Width = 77
            Height = 17
            Caption = 'A la Fecha'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            State = cbChecked
            TabOrder = 1
            OnClick = chbFechaClick
          end
          object dtpFIN: TwwDBDateTimePicker
            Left = 114
            Top = 27
            Width = 87
            Height = 23
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'Draft 12cpi'
            CalendarAttributes.Font.Style = []
            Epoch = 1950
            ShowButton = True
            TabOrder = 2
            UnboundDataType = wwDTEdtDate
          end
        end
        object dbeComment: TwwDBEdit
          Left = 212
          Top = 24
          Width = 337
          Height = 89
          AutoSize = False
          DataField = 'CLIECOMEN'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          MaxLength = 255
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = True
        end
        object seAno: TSpinEdit
          Left = 9
          Top = 23
          Width = 53
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 3
          Value = 2002
        end
        object seMes: TSpinEdit
          Left = 65
          Top = 23
          Width = 40
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          MaxLength = 2
          MaxValue = 12
          MinValue = 1
          ParentFont = False
          TabOrder = 4
          Value = 1
          OnExit = seMesExit
        end
        object bbtnEjecuta: TBitBtn
          Left = 131
          Top = 35
          Width = 39
          Height = 41
          Hint = 'Filtrar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = bbtnEjecutaClick
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
    end
  end
  object pnlClientes: TPanel
    Left = 192
    Top = 322
    Width = 441
    Height = 169
    TabOrder = 5
    Visible = False
    object StaticText2: TStaticText
      Left = 1
      Top = 1
      Width = 439
      Height = 20
      Align = alTop
      Alignment = taCenter
      Caption = 'Clientes del Grupo'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object bbtnCierra1: TBitBtn
      Left = 420
      Top = 3
      Width = 18
      Height = 18
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = bbtnCierra1Click
    end
    object dbgClientes: TwwDBGrid
      Left = 1
      Top = 21
      Width = 439
      Height = 147
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 12904163
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      FooterColor = 12904163
    end
  end
  object pnlBusca1: TPanel
    Left = 290
    Top = 272
    Width = 224
    Height = 41
    Color = 12904163
    UseDockManager = False
    FullRepaint = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    Visible = False
    object Edit1: TEdit
      Left = 80
      Top = 16
      Width = 25
      Height = 13
      AutoSize = False
      TabOrder = 1
    end
    object isBusca1: TwwIncrementalSearch
      Left = 11
      Top = 11
      Width = 201
      Height = 21
      ShowMatchText = True
      AutoSize = False
      CharCase = ecUpperCase
      HideSelection = False
      TabOrder = 0
      OnExit = isBusca1Exit
    end
  end
  object pnlDetFPagoLiq: TPanel
    Left = 108
    Top = 338
    Width = 645
    Height = 172
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 6
    Visible = False
    object SpeedButton1: TSpeedButton
      Left = 620
      Top = 1
      Width = 21
      Height = 19
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object dbgDetPagoLiq: TwwDBGrid
      Left = 4
      Top = 24
      Width = 637
      Height = 144
      DisableThemesInTitle = False
      Selected.Strings = (
        'FPAGOID'#9'2'#9'C'#243'digo~Pago '#9'F'
        'FPAGODES'#9'10'#9'Descripci'#243'n~Pago'#9'F'
        'TMONIDPAGO'#9'2'#9'T. Moneda~del Pago'#9'F'
        'LICOMTOABOLOC'#9'10'#9'Mto. Pag.~Local'#9'F'
        'LICOMTOABOEXT'#9'10'#9'Mto. Pag.~Extranjero'#9'F'
        'BANCOID'#9'3'#9'C'#243'digo~Banco'#9'F'
        'BANCODES'#9'15'#9'Descripci'#243'n~Banco'#9'F'
        'LICONOCHQ'#9'20'#9'Nro ~Cheque/Docum.'#9'F'
        'LICOTCAMBL'#9'10'#9'T. Camb. ~Pago'#9'F'
        'FECPAGO'#9'10'#9'Fecha ~del Pago'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 12904163
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      object dbgDetPagoLiqIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 25
        Height = 29
        AllowAllUp = True
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
    end
    object StaticText1: TStaticText
      Left = 4
      Top = 4
      Width = 637
      Height = 20
      Align = alTop
      Alignment = taCenter
      Caption = 'Detalle de Liquidaci'#243'n'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object bbtnCierraDetFPagoLiq: TBitBtn
      Left = 621
      Top = 3
      Width = 18
      Height = 18
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bbtnCierraDetFPagoLiqClick
    end
  end
  object ppDBPipelineF: TppDBPipeline
    DataSource = DMCXP.dsQry2
    UserName = 'DBPipelineF'
    Left = 600
    Top = 464
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'PROVRUC'
      FieldName = 'PROVRUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'CPSERIE'
      FieldName = 'CPSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'CPNODOC'
      FieldName = 'CPNODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CPNOREG'
      FieldName = 'CPNOREG'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'TCANJEID'
      FieldName = 'TCANJEID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'CCPCANJE'
      FieldName = 'CCPCANJE'
      FieldLength = 6
      DisplayWidth = 6
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'CCPFCJE'
      FieldName = 'CCPFCJE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'DOCID2'
      FieldName = 'DOCID2'
      FieldLength = 2
      DisplayWidth = 2
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'CPSERIE2'
      FieldName = 'CPSERIE2'
      FieldLength = 5
      DisplayWidth = 5
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'CPNODOC2'
      FieldName = 'CPNODOC2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOORI'
      FieldName = 'DCDMOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOLOC'
      FieldName = 'DCDMOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOEXT'
      FieldName = 'DCDMOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      FieldAlias = 'DCDUSER'
      FieldName = 'DCDUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      FieldAlias = 'DCDFREG'
      FieldName = 'DCDFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      FieldAlias = 'DCDHREG'
      FieldName = 'DCDHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      FieldAlias = 'DCDAAAA'
      FieldName = 'DCDAAAA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 20
    end
    object ppField22: TppField
      FieldAlias = 'DCDMM'
      FieldName = 'DCDMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 21
    end
    object ppField23: TppField
      FieldAlias = 'DCDDD'
      FieldName = 'DCDDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object ppField24: TppField
      FieldAlias = 'DCDTRI'
      FieldName = 'DCDTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField25: TppField
      FieldAlias = 'DCDSEM'
      FieldName = 'DCDSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField26: TppField
      FieldAlias = 'DCDSS'
      FieldName = 'DCDSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 25
    end
    object ppField27: TppField
      FieldAlias = 'DCDANOMM'
      FieldName = 'DCDANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'DCDAATRI'
      FieldName = 'DCDAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'DCDAASEM'
      FieldName = 'DCDAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 28
    end
    object ppField30: TppField
      FieldAlias = 'DCDAASS'
      FieldName = 'DCDAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 29
    end
    object ppField31: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 30
    end
    object ppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDTCAMB'
      FieldName = 'DCDTCAMB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'CJEANTMN'
      FieldName = 'CJEANTMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'CJEANTME'
      FieldName = 'CJEANTME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALLOC'
      FieldName = 'SALLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALEXT'
      FieldName = 'SALEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppField77: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 36
    end
    object ppField78: TppField
      FieldAlias = 'DOCABR'
      FieldName = 'DOCABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 37
    end
    object ppField79: TppField
      FieldAlias = 'PROVDES'
      FieldName = 'PROVDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 38
    end
    object ppField80: TppField
      FieldAlias = 'TMONDES'
      FieldName = 'TMONDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 39
    end
    object ppField321: TppField
      FieldAlias = 'TMONABR'
      FieldName = 'TMONABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 40
    end
    object ppField322: TppField
      FieldAlias = 'TMON_LOC'
      FieldName = 'TMON_LOC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 41
    end
    object ppField323: TppField
      FieldAlias = 'CIADES'
      FieldName = 'CIADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 42
    end
  end
  object ppDBPipelineL: TppDBPipeline
    DataSource = DMCXP.dsQry4
    UserName = 'DBPipelineL'
    Left = 688
    Top = 464
    object ppField201: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField202: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppField203: TppField
      FieldAlias = 'PROVRUC'
      FieldName = 'PROVRUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppField204: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField205: TppField
      FieldAlias = 'CPSERIE'
      FieldName = 'CPSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 4
    end
    object ppField206: TppField
      FieldAlias = 'CPNODOC'
      FieldName = 'CPNODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppField207: TppField
      FieldAlias = 'CPNOREG'
      FieldName = 'CPNOREG'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppField208: TppField
      FieldAlias = 'TCANJEID'
      FieldName = 'TCANJEID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField209: TppField
      FieldAlias = 'CCPCANJE'
      FieldName = 'CCPCANJE'
      FieldLength = 6
      DisplayWidth = 6
      Position = 8
    end
    object ppField210: TppField
      FieldAlias = 'CCPFCJE'
      FieldName = 'CCPFCJE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppField211: TppField
      FieldAlias = 'DOCID2'
      FieldName = 'DOCID2'
      FieldLength = 2
      DisplayWidth = 2
      Position = 10
    end
    object ppField212: TppField
      FieldAlias = 'CPSERIE2'
      FieldName = 'CPSERIE2'
      FieldLength = 5
      DisplayWidth = 5
      Position = 11
    end
    object ppField213: TppField
      FieldAlias = 'CPNODOC2'
      FieldName = 'CPNODOC2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppField214: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppField215: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOORI'
      FieldName = 'DCDMOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField216: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOLOC'
      FieldName = 'DCDMOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField217: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOEXT'
      FieldName = 'DCDMOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField218: TppField
      FieldAlias = 'DCDUSER'
      FieldName = 'DCDUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppField219: TppField
      FieldAlias = 'DCDFREG'
      FieldName = 'DCDFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 18
    end
    object ppField220: TppField
      FieldAlias = 'DCDHREG'
      FieldName = 'DCDHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 19
    end
    object ppField221: TppField
      FieldAlias = 'DCDAAAA'
      FieldName = 'DCDAAAA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 20
    end
    object ppField222: TppField
      FieldAlias = 'DCDMM'
      FieldName = 'DCDMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 21
    end
    object ppField223: TppField
      FieldAlias = 'DCDDD'
      FieldName = 'DCDDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object ppField224: TppField
      FieldAlias = 'DCDTRI'
      FieldName = 'DCDTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField225: TppField
      FieldAlias = 'DCDSEM'
      FieldName = 'DCDSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField226: TppField
      FieldAlias = 'DCDSS'
      FieldName = 'DCDSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 25
    end
    object ppField227: TppField
      FieldAlias = 'DCDANOMM'
      FieldName = 'DCDANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 26
    end
    object ppField228: TppField
      FieldAlias = 'DCDAATRI'
      FieldName = 'DCDAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 27
    end
    object ppField229: TppField
      FieldAlias = 'DCDAASEM'
      FieldName = 'DCDAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 28
    end
    object ppField230: TppField
      FieldAlias = 'DCDAASS'
      FieldName = 'DCDAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 29
    end
    object ppField231: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 30
    end
    object ppField232: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDTCAMB'
      FieldName = 'DCDTCAMB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppField233: TppField
      Alignment = taRightJustify
      FieldAlias = 'CJEANTMN'
      FieldName = 'CJEANTMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppField234: TppField
      Alignment = taRightJustify
      FieldAlias = 'CJEANTME'
      FieldName = 'CJEANTME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppField235: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALLOC'
      FieldName = 'SALLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppField236: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALEXT'
      FieldName = 'SALEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppField237: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 36
    end
    object ppField238: TppField
      FieldAlias = 'DOCABR'
      FieldName = 'DOCABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 37
    end
    object ppField239: TppField
      FieldAlias = 'PROVDES'
      FieldName = 'PROVDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 38
    end
    object ppField240: TppField
      FieldAlias = 'TMONDES'
      FieldName = 'TMONDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 39
    end
    object ppField327: TppField
      FieldAlias = 'TMONABR'
      FieldName = 'TMONABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 40
    end
    object ppField328: TppField
      FieldAlias = 'TMON_LOC'
      FieldName = 'TMON_LOC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 41
    end
    object ppField329: TppField
      FieldAlias = 'CIADES'
      FieldName = 'CIADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 42
    end
  end
  object ppDBPipelineN: TppDBPipeline
    DataSource = DMCXP.dsQry6
    SkipWhenNoRecords = False
    UserName = 'DBPipelineN'
    Left = 648
    Top = 464
    object ppField161: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField162: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppField163: TppField
      FieldAlias = 'PROVRUC'
      FieldName = 'PROVRUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppField164: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField165: TppField
      FieldAlias = 'CPSERIE'
      FieldName = 'CPSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 4
    end
    object ppField166: TppField
      FieldAlias = 'CPNODOC'
      FieldName = 'CPNODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppField167: TppField
      FieldAlias = 'CPNOREG'
      FieldName = 'CPNOREG'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppField168: TppField
      FieldAlias = 'TCANJEID'
      FieldName = 'TCANJEID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField169: TppField
      FieldAlias = 'CCPCANJE'
      FieldName = 'CCPCANJE'
      FieldLength = 6
      DisplayWidth = 6
      Position = 8
    end
    object ppField170: TppField
      FieldAlias = 'CCPFCJE'
      FieldName = 'CCPFCJE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppField171: TppField
      FieldAlias = 'DOCID2'
      FieldName = 'DOCID2'
      FieldLength = 2
      DisplayWidth = 2
      Position = 10
    end
    object ppField172: TppField
      FieldAlias = 'CPSERIE2'
      FieldName = 'CPSERIE2'
      FieldLength = 5
      DisplayWidth = 5
      Position = 11
    end
    object ppField173: TppField
      FieldAlias = 'CPNODOC2'
      FieldName = 'CPNODOC2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppField174: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppField175: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOORI'
      FieldName = 'DCDMOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField176: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOLOC'
      FieldName = 'DCDMOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField177: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOEXT'
      FieldName = 'DCDMOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField178: TppField
      FieldAlias = 'DCDUSER'
      FieldName = 'DCDUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppField179: TppField
      FieldAlias = 'DCDFREG'
      FieldName = 'DCDFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 18
    end
    object ppField180: TppField
      FieldAlias = 'DCDHREG'
      FieldName = 'DCDHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 19
    end
    object ppField181: TppField
      FieldAlias = 'DCDAAAA'
      FieldName = 'DCDAAAA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 20
    end
    object ppField182: TppField
      FieldAlias = 'DCDMM'
      FieldName = 'DCDMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 21
    end
    object ppField183: TppField
      FieldAlias = 'DCDDD'
      FieldName = 'DCDDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object ppField184: TppField
      FieldAlias = 'DCDTRI'
      FieldName = 'DCDTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField185: TppField
      FieldAlias = 'DCDSEM'
      FieldName = 'DCDSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField186: TppField
      FieldAlias = 'DCDSS'
      FieldName = 'DCDSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 25
    end
    object ppField187: TppField
      FieldAlias = 'DCDANOMM'
      FieldName = 'DCDANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 26
    end
    object ppField188: TppField
      FieldAlias = 'DCDAATRI'
      FieldName = 'DCDAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 27
    end
    object ppField189: TppField
      FieldAlias = 'DCDAASEM'
      FieldName = 'DCDAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 28
    end
    object ppField190: TppField
      FieldAlias = 'DCDAASS'
      FieldName = 'DCDAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 29
    end
    object ppField191: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 30
    end
    object ppField192: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDTCAMB'
      FieldName = 'DCDTCAMB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppField193: TppField
      Alignment = taRightJustify
      FieldAlias = 'CJEANTMN'
      FieldName = 'CJEANTMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppField194: TppField
      Alignment = taRightJustify
      FieldAlias = 'CJEANTME'
      FieldName = 'CJEANTME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppField195: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALLOC'
      FieldName = 'SALLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppField196: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALEXT'
      FieldName = 'SALEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppField197: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 36
    end
    object ppField198: TppField
      FieldAlias = 'DOCABR'
      FieldName = 'DOCABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 37
    end
    object ppField199: TppField
      FieldAlias = 'PROVDES'
      FieldName = 'PROVDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 38
    end
    object ppField200: TppField
      FieldAlias = 'TMONDES'
      FieldName = 'TMONDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 39
    end
    object ppField324: TppField
      FieldAlias = 'TMONABR'
      FieldName = 'TMONABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 40
    end
    object ppField325: TppField
      FieldAlias = 'TMON_LOC'
      FieldName = 'TMON_LOC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 41
    end
    object ppField326: TppField
      FieldAlias = 'CIADES'
      FieldName = 'CIADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 42
    end
  end
  object ppdbp1: TppDBPipeline
    DataSource = DMCXP.dsQry2
    UserName = 'dbp1'
    Left = 544
    Top = 192
  end
  object ppdbp2: TppDBPipeline
    UserName = 'dbp2'
    Left = 544
    Top = 256
  end
  object ppDBPipelineC: TppDBPipeline
    UserName = 'DBPipelineC'
    Left = 132
    Top = 260
    object ppField81: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField82: TppField
      FieldAlias = 'LOCID'
      FieldName = 'LOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField83: TppField
      FieldAlias = 'HOJTID'
      FieldName = 'HOJTID'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField84: TppField
      FieldAlias = 'CLIEID'
      FieldName = 'CLIEID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object ppField85: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppField86: TppField
      FieldAlias = 'PEDFECHA'
      FieldName = 'PEDFECHA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 5
    end
    object ppField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEDTOTMO'
      FieldName = 'PEDTOTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppField88: TppField
      FieldAlias = 'VEID'
      FieldName = 'VEID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 7
    end
    object ppField89: TppField
      FieldAlias = 'FPAGOID'
      FieldName = 'FPAGOID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 8
    end
    object ppField90: TppField
      FieldAlias = 'HOJTFECREG'
      FieldName = 'HOJTFECREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppField91: TppField
      FieldAlias = 'HOJTHORREG'
      FieldName = 'HOJTHORREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 10
    end
    object ppField92: TppField
      FieldAlias = 'HOJTFECSOL'
      FieldName = 'HOJTFECSOL'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 11
    end
    object ppField93: TppField
      FieldAlias = 'HOJTHORSOL'
      FieldName = 'HOJTHORSOL'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 12
    end
    object ppField94: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppField95: TppField
      FieldAlias = 'CLIERUC'
      FieldName = 'CLIERUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object ppField96: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLIECREMAX'
      FieldName = 'CLIECREMAX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField97: TppField
      FieldAlias = 'HOJTFLAGFP'
      FieldName = 'HOJTFLAGFP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object ppField98: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 17
    end
    object ppField99: TppField
      Alignment = taRightJustify
      FieldAlias = 'HOJTDCTO'
      FieldName = 'HOJTDCTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField100: TppField
      FieldAlias = 'DESCLIEPL1'
      FieldName = 'DESCLIEPL1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object ppField101: TppField
      FieldAlias = 'DESCLIEPL2'
      FieldName = 'DESCLIEPL2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object ppField102: TppField
      FieldAlias = 'HOJTESTADO'
      FieldName = 'HOJTESTADO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppField103: TppField
      FieldAlias = 'SCOMERID'
      FieldName = 'SCOMERID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object ppField104: TppField
      FieldAlias = 'HOJTSOLLOG'
      FieldName = 'HOJTSOLLOG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField105: TppField
      FieldAlias = 'HOJTSOLCXC'
      FieldName = 'HOJTSOLCXC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField106: TppField
      FieldAlias = 'ALMID'
      FieldName = 'ALMID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 25
    end
    object ppField107: TppField
      FieldAlias = 'HOJTUSER'
      FieldName = 'HOJTUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
    object ppField108: TppField
      FieldAlias = 'HOJTVBCXC'
      FieldName = 'HOJTVBCXC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 27
    end
    object ppField109: TppField
      FieldAlias = 'HOJTVBLOG'
      FieldName = 'HOJTVBLOG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 28
    end
    object ppField110: TppField
      FieldAlias = 'HOJOBS'
      FieldName = 'HOJOBS'
      FieldLength = 200
      DisplayWidth = 200
      Position = 29
    end
    object ppField111: TppField
      FieldAlias = 'HOJHOR'
      FieldName = 'HOJHOR'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 30
    end
    object ppField112: TppField
      FieldAlias = 'CLIEDES'
      FieldName = 'CLIEDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 31
    end
    object ppField113: TppField
      FieldAlias = 'DCCOMDES'
      FieldName = 'DCCOMDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 32
    end
    object ppField114: TppField
      Alignment = taRightJustify
      FieldAlias = 'HOJTNIVEL'
      FieldName = 'HOJTNIVEL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 33
    end
    object ppField115: TppField
      FieldAlias = 'HOJOBSLOG1'
      FieldName = 'HOJOBSLOG1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 34
    end
    object ppField116: TppField
      FieldAlias = 'HOJOBSLOG2'
      FieldName = 'HOJOBSLOG2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 35
    end
    object ppField117: TppField
      FieldAlias = 'HOJOBSCXC1'
      FieldName = 'HOJOBSCXC1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 36
    end
    object ppField118: TppField
      FieldAlias = 'USERANUL'
      FieldName = 'USERANUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
    object ppField119: TppField
      FieldAlias = 'FECANUL'
      FieldName = 'FECANUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 38
    end
    object ppField120: TppField
      FieldAlias = 'HORANUL'
      FieldName = 'HORANUL'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 39
    end
  end
  object ppDBPipelineA: TppDBPipeline
    DataSource = DMCXP.dsQry5
    UserName = 'DBPipelineA'
    Left = 136
    Top = 348
    object ppField121: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField122: TppField
      FieldAlias = 'LOCID'
      FieldName = 'LOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField123: TppField
      FieldAlias = 'HOJTID'
      FieldName = 'HOJTID'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField124: TppField
      FieldAlias = 'CLIEID'
      FieldName = 'CLIEID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object ppField125: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppField126: TppField
      FieldAlias = 'PEDFECHA'
      FieldName = 'PEDFECHA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 5
    end
    object ppField127: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEDTOTMO'
      FieldName = 'PEDTOTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppField128: TppField
      FieldAlias = 'VEID'
      FieldName = 'VEID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 7
    end
    object ppField129: TppField
      FieldAlias = 'FPAGOID'
      FieldName = 'FPAGOID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 8
    end
    object ppField130: TppField
      FieldAlias = 'HOJTFECREG'
      FieldName = 'HOJTFECREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppField131: TppField
      FieldAlias = 'HOJTHORREG'
      FieldName = 'HOJTHORREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 10
    end
    object ppField132: TppField
      FieldAlias = 'HOJTFECSOL'
      FieldName = 'HOJTFECSOL'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 11
    end
    object ppField133: TppField
      FieldAlias = 'HOJTHORSOL'
      FieldName = 'HOJTHORSOL'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 12
    end
    object ppField134: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppField135: TppField
      FieldAlias = 'CLIERUC'
      FieldName = 'CLIERUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object ppField136: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLIECREMAX'
      FieldName = 'CLIECREMAX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField137: TppField
      FieldAlias = 'HOJTFLAGFP'
      FieldName = 'HOJTFLAGFP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object ppField138: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 17
    end
    object ppField139: TppField
      Alignment = taRightJustify
      FieldAlias = 'HOJTDCTO'
      FieldName = 'HOJTDCTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField140: TppField
      FieldAlias = 'DESCLIEPL1'
      FieldName = 'DESCLIEPL1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object ppField141: TppField
      FieldAlias = 'DESCLIEPL2'
      FieldName = 'DESCLIEPL2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object ppField142: TppField
      FieldAlias = 'HOJTESTADO'
      FieldName = 'HOJTESTADO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppField143: TppField
      FieldAlias = 'SCOMERID'
      FieldName = 'SCOMERID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object ppField144: TppField
      FieldAlias = 'HOJTSOLLOG'
      FieldName = 'HOJTSOLLOG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField145: TppField
      FieldAlias = 'HOJTSOLCXC'
      FieldName = 'HOJTSOLCXC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField146: TppField
      FieldAlias = 'ALMID'
      FieldName = 'ALMID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 25
    end
    object ppField147: TppField
      FieldAlias = 'HOJTUSER'
      FieldName = 'HOJTUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
    object ppField148: TppField
      FieldAlias = 'HOJTVBCXC'
      FieldName = 'HOJTVBCXC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 27
    end
    object ppField149: TppField
      FieldAlias = 'HOJTVBLOG'
      FieldName = 'HOJTVBLOG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 28
    end
    object ppField150: TppField
      FieldAlias = 'HOJOBS'
      FieldName = 'HOJOBS'
      FieldLength = 200
      DisplayWidth = 200
      Position = 29
    end
    object ppField151: TppField
      FieldAlias = 'HOJHOR'
      FieldName = 'HOJHOR'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 30
    end
    object ppField152: TppField
      FieldAlias = 'CLIEDES'
      FieldName = 'CLIEDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 31
    end
    object ppField153: TppField
      FieldAlias = 'DCCOMDES'
      FieldName = 'DCCOMDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 32
    end
    object ppField154: TppField
      Alignment = taRightJustify
      FieldAlias = 'HOJTNIVEL'
      FieldName = 'HOJTNIVEL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 33
    end
    object ppField155: TppField
      FieldAlias = 'HOJOBSLOG1'
      FieldName = 'HOJOBSLOG1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 34
    end
    object ppField156: TppField
      FieldAlias = 'HOJOBSLOG2'
      FieldName = 'HOJOBSLOG2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 35
    end
    object ppField157: TppField
      FieldAlias = 'HOJOBSCXC1'
      FieldName = 'HOJOBSCXC1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 36
    end
    object ppField158: TppField
      FieldAlias = 'USERANUL'
      FieldName = 'USERANUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
    object ppField159: TppField
      FieldAlias = 'FECANUL'
      FieldName = 'FECANUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 38
    end
    object ppField160: TppField
      FieldAlias = 'HORANUL'
      FieldName = 'HORANUL'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 39
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
    Report = ppCtaCteProv
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 496
    Top = 196
  end
  object pprCtaCte: TppReport
    AutoStop = False
    DataPipeline = ppdbCtaCte
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rCtaCte'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLEXes\SOLFormatos\CxP\Dema\CTACTEPROV.rtm'
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprCtaCtePreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 494
    Top = 525
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbCtaCte'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 63765
      mmPrintPosition = 0
      object pplblCiaInc: TppLabel
        UserName = 'lblCiaInc'
        Caption = 'DISTRIBUIDORA INCORESA S.A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 6085
        mmTop = 1588
        mmWidth = 52652
        BandType = 0
      end
      object pplblTelefonoInc: TppLabel
        UserName = 'lblTelefonoInc'
        Caption = 'Tel'#233'fono: 5641100 Fax : 5640460'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 6350
        mmTop = 6615
        mmWidth = 53446
        BandType = 0
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 183886
        mmTop = 0
        mmWidth = 16933
        BandType = 0
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable10'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 187590
        mmTop = 5292
        mmWidth = 13229
        BandType = 0
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable11'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 186002
        mmTop = 10583
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel188: TppLabel
        UserName = 'Label188'
        Caption = 'ESTADO DE CUENTA CORRIENTE AL '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 66940
        mmTop = 16933
        mmWidth = 61648
        BandType = 0
      end
      object pplblFechaINC: TppLabel
        UserName = 'lblFechaINC'
        Caption = '29/11/2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 16933
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel190: TppLabel
        UserName = 'Label190'
        Caption = 'Sr. (es).'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 24871
        mmWidth = 12700
        BandType = 0
      end
      object pplblClienteINC: TppLabel
        UserName = 'lblClienteINC'
        Caption = 'GARCIA FACUNDO, LORENZO                 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 29633
        mmWidth = 67204
        BandType = 0
      end
      object pplblrucinc: TppLabel
        UserName = 'lblrucinc'
        Caption = 'RUC: 10033774678 Telf: 378789'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 34131
        mmWidth = 50271
        BandType = 0
      end
      object pplbldirinc: TppLabel
        UserName = 'lbldirinc'
        Caption = 'AV. LAMBAYEQUE 1007 CHULUCANAS - PIURA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 38629
        mmWidth = 77258
        BandType = 0
      end
      object pplblDistritoinc: TppLabel
        UserName = 'lblDistritoinc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 43127
        mmWidth = 24077
        BandType = 0
      end
      object pplblCodigoinc: TppLabel
        UserName = 'lblCodigoinc'
        Caption = 'C'#243'digo Proveedor : 10033774678'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 132821
        mmTop = 34131
        mmWidth = 53975
        BandType = 0
      end
      object ppLabel198: TppLabel
        UserName = 'Label198'
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 6879
        mmTop = 55033
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel199: TppLabel
        UserName = 'Label199'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 15875
        mmTop = 55033
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel200: TppLabel
        UserName = 'Label200'
        Caption = 'Doc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 16140
        mmTop = 59002
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel201: TppLabel
        UserName = 'Label201'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 55033
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel202: TppLabel
        UserName = 'Label2001'
        Caption = 'Emisi'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 75406
        mmTop = 59002
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel203: TppLabel
        UserName = 'Label2002'
        Caption = 'N'#176' Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 30163
        mmTop = 55033
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel204: TppLabel
        UserName = 'Label204'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 100806
        mmTop = 55033
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel205: TppLabel
        UserName = 'Label205'
        Caption = 'deuda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 59002
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel206: TppLabel
        UserName = 'Label206'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 144198
        mmTop = 55033
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel207: TppLabel
        UserName = 'Label207'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 143934
        mmTop = 59002
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel208: TppLabel
        UserName = 'Label208'
        Caption = 'A Cuenta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 116946
        mmTop = 55033
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel209: TppLabel
        UserName = 'Label209'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 55033
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel210: TppLabel
        UserName = 'Label210'
        Caption = 'Vcmto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 159279
        mmTop = 59002
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel211: TppLabel
        UserName = 'Label211'
        Caption = 'Ubicaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 180711
        mmTop = 54769
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel212: TppLabel
        UserName = 'Label212'
        Caption = 'Numero Bco.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 180446
        mmTop = 54504
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel213: TppLabel
        UserName = 'Label1'
        Caption = 'Prot.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 191030
        mmTop = 54504
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Label30'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 102394
        mmTop = 28046
        mmWidth = 11906
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText104: TppDBText
        UserName = 'DBText104'
        DataField = 'UBICADES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 180182
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText120: TppDBText
        UserName = 'DBText120'
        AutoSize = True
        DataField = 'CCFLAGPROT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 159015
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppdbCtaCte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DOCABR'
        DataPipeline = ppdbCtaCte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 15081
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'CPSERIE'
        DataPipeline = ppdbCtaCte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 37042
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        AutoSize = True
        DataField = 'CPNODOC'
        DataPipeline = ppdbCtaCte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        AutoSize = True
        DataField = 'CPFEMIS'
        DataPipeline = ppdbCtaCte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 74877
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText100: TppDBText
        UserName = 'DBText100'
        AutoSize = True
        DataField = 'MTODOLAR'
        DataPipeline = ppdbCtaCte
        DisplayFormat = '###,###,###,0.00;-###,###,###,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 92604
        mmTop = 0
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText101: TppDBText
        UserName = 'DBText1001'
        AutoSize = True
        DataField = 'PAGDOLAR'
        DataPipeline = ppdbCtaCte
        DisplayFormat = '###,###,###,0.00;-###,###,###,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 114036
        mmTop = 0
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText102: TppDBText
        UserName = 'DBText102'
        AutoSize = True
        DataField = 'SALDOLAR'
        DataPipeline = ppdbCtaCte
        DisplayFormat = '###,###,###,0.00;-###,###,###,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 135467
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText103: TppDBText
        UserName = 'DBText103'
        AutoSize = True
        DataField = 'CPFVCMTO'
        DataPipeline = ppdbCtaCte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 156369
        mmTop = 0
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText105: TppDBText
        UserName = 'DBText105'
        DataField = 'CCNLETBCO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 161132
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppSummaryBand10: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 35719
      mmPrintPosition = 0
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        AutoSize = True
        DataField = 'MTODOLAR'
        DataPipeline = ppdbCtaCte
        DisplayFormat = '###,###,###,0.00;-###,###,###,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 82286
        mmTop = 2910
        mmWidth = 29369
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        AutoSize = True
        DataField = 'PAGDOLAR'
        DataPipeline = ppdbCtaCte
        DisplayFormat = '###,###,###,0.00;-###,###,###,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 103981
        mmTop = 2910
        mmWidth = 29104
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        AutoSize = True
        DataField = 'SALDOLAR'
        DataPipeline = ppdbCtaCte
        DisplayFormat = '###,###,###,0.00;-###,###,###,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 125148
        mmTop = 2910
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel214: TppLabel
        UserName = 'Label213'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 40746
        mmTop = 2910
        mmWidth = 11377
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataPipeline = ppdbCtaCte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppdbCtaCte'
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 3175
        mmWidth = 11113
        BandType = 7
      end
      object ppLabel229: TppLabel
        UserName = 'Label214'
        Caption = 'Documentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 14552
        mmTop = 3175
        mmWidth = 19315
        BandType = 7
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 
          'El presente estado de cuenta es un informe de su saldo en nuestr' +
          'os libros.'#13#10'Le rogamos confrontarlos con sus registros y darnos ' +
          'su conformidad o reparo, '#13#10'cualquier pago efectuado con fecha po' +
          'sterior a la fecha indicada, se reflejar'#225#13#10'en su pr'#243'ximo estado ' +
          'de cuenta.'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          
            'El presente estado de cuenta es un informe de su saldo en nuestr' +
            'os libros. Le rogamos confrontarlos con sus registros y darnos s' +
            'u conformidad o reparo,  cualquier pago efectuado con fecha post' +
            'erior a la fecha indicada, se reflejar'#225' en su pr'#243'ximo estado de ' +
            'cuenta.')
        Transparent = True
        mmHeight = 17992
        mmLeft = 1588
        mmTop = 12435
        mmWidth = 191030
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
  end
  object ppdbCtaCte: TppDBPipeline
    UserName = 'dbCtaCte'
    Left = 432
    Top = 526
  end
  object ppDBPipelineDF: TppDBPipeline
    UserName = 'DBPipelineDF'
    Left = 616
    Top = 441
    object ppField241: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField242: TppField
      FieldAlias = 'LOCID'
      FieldName = 'LOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField243: TppField
      FieldAlias = 'HOJTID'
      FieldName = 'HOJTID'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField244: TppField
      FieldAlias = 'CLIEID'
      FieldName = 'CLIEID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object ppField245: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppField246: TppField
      FieldAlias = 'PEDFECHA'
      FieldName = 'PEDFECHA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 5
    end
    object ppField247: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEDTOTMO'
      FieldName = 'PEDTOTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppField248: TppField
      FieldAlias = 'VEID'
      FieldName = 'VEID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 7
    end
    object ppField249: TppField
      FieldAlias = 'FPAGOID'
      FieldName = 'FPAGOID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 8
    end
    object ppField250: TppField
      FieldAlias = 'HOJTFECREG'
      FieldName = 'HOJTFECREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppField251: TppField
      FieldAlias = 'HOJTHORREG'
      FieldName = 'HOJTHORREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 10
    end
    object ppField252: TppField
      FieldAlias = 'HOJTFECSOL'
      FieldName = 'HOJTFECSOL'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 11
    end
    object ppField253: TppField
      FieldAlias = 'HOJTHORSOL'
      FieldName = 'HOJTHORSOL'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 12
    end
    object ppField254: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppField255: TppField
      FieldAlias = 'CLIERUC'
      FieldName = 'CLIERUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object ppField256: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLIECREMAX'
      FieldName = 'CLIECREMAX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField257: TppField
      FieldAlias = 'HOJTFLAGFP'
      FieldName = 'HOJTFLAGFP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object ppField258: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 17
    end
    object ppField259: TppField
      Alignment = taRightJustify
      FieldAlias = 'HOJTDCTO'
      FieldName = 'HOJTDCTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField260: TppField
      FieldAlias = 'DESCLIEPL1'
      FieldName = 'DESCLIEPL1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object ppField261: TppField
      FieldAlias = 'DESCLIEPL2'
      FieldName = 'DESCLIEPL2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object ppField262: TppField
      FieldAlias = 'HOJTESTADO'
      FieldName = 'HOJTESTADO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppField263: TppField
      FieldAlias = 'SCOMERID'
      FieldName = 'SCOMERID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object ppField264: TppField
      FieldAlias = 'HOJTSOLLOG'
      FieldName = 'HOJTSOLLOG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField265: TppField
      FieldAlias = 'HOJTSOLCXC'
      FieldName = 'HOJTSOLCXC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField266: TppField
      FieldAlias = 'ALMID'
      FieldName = 'ALMID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 25
    end
    object ppField267: TppField
      FieldAlias = 'HOJTUSER'
      FieldName = 'HOJTUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
    object ppField268: TppField
      FieldAlias = 'HOJTVBCXC'
      FieldName = 'HOJTVBCXC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 27
    end
    object ppField269: TppField
      FieldAlias = 'HOJTVBLOG'
      FieldName = 'HOJTVBLOG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 28
    end
    object ppField270: TppField
      FieldAlias = 'HOJOBS'
      FieldName = 'HOJOBS'
      FieldLength = 200
      DisplayWidth = 200
      Position = 29
    end
    object ppField271: TppField
      FieldAlias = 'HOJHOR'
      FieldName = 'HOJHOR'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 30
    end
    object ppField272: TppField
      FieldAlias = 'CLIEDES'
      FieldName = 'CLIEDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 31
    end
    object ppField273: TppField
      FieldAlias = 'DCCOMDES'
      FieldName = 'DCCOMDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 32
    end
    object ppField274: TppField
      Alignment = taRightJustify
      FieldAlias = 'HOJTNIVEL'
      FieldName = 'HOJTNIVEL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 33
    end
    object ppField275: TppField
      FieldAlias = 'HOJOBSLOG1'
      FieldName = 'HOJOBSLOG1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 34
    end
    object ppField276: TppField
      FieldAlias = 'HOJOBSLOG2'
      FieldName = 'HOJOBSLOG2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 35
    end
    object ppField277: TppField
      FieldAlias = 'HOJOBSCXC1'
      FieldName = 'HOJOBSCXC1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 36
    end
    object ppField278: TppField
      FieldAlias = 'USERANUL'
      FieldName = 'USERANUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
    object ppField279: TppField
      FieldAlias = 'FECANUL'
      FieldName = 'FECANUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 38
    end
    object ppField280: TppField
      FieldAlias = 'HORANUL'
      FieldName = 'HORANUL'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 39
    end
  end
  object ppDBPipelineDL: TppDBPipeline
    UserName = 'DBPipelineDL'
    Left = 707
    Top = 444
    object ppField281: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField282: TppField
      FieldAlias = 'LOCID'
      FieldName = 'LOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField283: TppField
      FieldAlias = 'HOJTID'
      FieldName = 'HOJTID'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField284: TppField
      FieldAlias = 'CLIEID'
      FieldName = 'CLIEID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object ppField285: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppField286: TppField
      FieldAlias = 'PEDFECHA'
      FieldName = 'PEDFECHA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 5
    end
    object ppField287: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEDTOTMO'
      FieldName = 'PEDTOTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppField288: TppField
      FieldAlias = 'VEID'
      FieldName = 'VEID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 7
    end
    object ppField289: TppField
      FieldAlias = 'FPAGOID'
      FieldName = 'FPAGOID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 8
    end
    object ppField290: TppField
      FieldAlias = 'HOJTFECREG'
      FieldName = 'HOJTFECREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppField291: TppField
      FieldAlias = 'HOJTHORREG'
      FieldName = 'HOJTHORREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 10
    end
    object ppField292: TppField
      FieldAlias = 'HOJTFECSOL'
      FieldName = 'HOJTFECSOL'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 11
    end
    object ppField293: TppField
      FieldAlias = 'HOJTHORSOL'
      FieldName = 'HOJTHORSOL'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 12
    end
    object ppField294: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppField295: TppField
      FieldAlias = 'CLIERUC'
      FieldName = 'CLIERUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object ppField296: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLIECREMAX'
      FieldName = 'CLIECREMAX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField297: TppField
      FieldAlias = 'HOJTFLAGFP'
      FieldName = 'HOJTFLAGFP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object ppField298: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 17
    end
    object ppField299: TppField
      Alignment = taRightJustify
      FieldAlias = 'HOJTDCTO'
      FieldName = 'HOJTDCTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField300: TppField
      FieldAlias = 'DESCLIEPL1'
      FieldName = 'DESCLIEPL1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object ppField301: TppField
      FieldAlias = 'DESCLIEPL2'
      FieldName = 'DESCLIEPL2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object ppField302: TppField
      FieldAlias = 'HOJTESTADO'
      FieldName = 'HOJTESTADO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppField303: TppField
      FieldAlias = 'SCOMERID'
      FieldName = 'SCOMERID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object ppField304: TppField
      FieldAlias = 'HOJTSOLLOG'
      FieldName = 'HOJTSOLLOG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField305: TppField
      FieldAlias = 'HOJTSOLCXC'
      FieldName = 'HOJTSOLCXC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField306: TppField
      FieldAlias = 'ALMID'
      FieldName = 'ALMID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 25
    end
    object ppField307: TppField
      FieldAlias = 'HOJTUSER'
      FieldName = 'HOJTUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
    object ppField308: TppField
      FieldAlias = 'HOJTVBCXC'
      FieldName = 'HOJTVBCXC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 27
    end
    object ppField309: TppField
      FieldAlias = 'HOJTVBLOG'
      FieldName = 'HOJTVBLOG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 28
    end
    object ppField310: TppField
      FieldAlias = 'HOJOBS'
      FieldName = 'HOJOBS'
      FieldLength = 200
      DisplayWidth = 200
      Position = 29
    end
    object ppField311: TppField
      FieldAlias = 'HOJHOR'
      FieldName = 'HOJHOR'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 30
    end
    object ppField312: TppField
      FieldAlias = 'CLIEDES'
      FieldName = 'CLIEDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 31
    end
    object ppField313: TppField
      FieldAlias = 'DCCOMDES'
      FieldName = 'DCCOMDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 32
    end
    object ppField314: TppField
      Alignment = taRightJustify
      FieldAlias = 'HOJTNIVEL'
      FieldName = 'HOJTNIVEL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 33
    end
    object ppField315: TppField
      FieldAlias = 'HOJOBSLOG1'
      FieldName = 'HOJOBSLOG1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 34
    end
    object ppField316: TppField
      FieldAlias = 'HOJOBSLOG2'
      FieldName = 'HOJOBSLOG2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 35
    end
    object ppField317: TppField
      FieldAlias = 'HOJOBSCXC1'
      FieldName = 'HOJOBSCXC1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 36
    end
    object ppField318: TppField
      FieldAlias = 'USERANUL'
      FieldName = 'USERANUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
    object ppField319: TppField
      FieldAlias = 'FECANUL'
      FieldName = 'FECANUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 38
    end
    object ppField320: TppField
      FieldAlias = 'HORANUL'
      FieldName = 'HORANUL'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 39
    end
  end
  object ppDBPipelineDC: TppDBPipeline
    UserName = 'DBPipelineDC'
    Left = 160
    Top = 260
  end
  object ppDBPipelineDA: TppDBPipeline
    UserName = 'DBPipelineDA'
    Left = 164
    Top = 348
  end
  object ppRepAnos: TppReport
    AutoStop = False
    DataPipeline = dbplRepAnos
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
    Template.FileName = 'C:\SOLExes\SolFormatos\Cxc\Incoresa\RepAnos.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppRepAnosPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 76
    Top = 523
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'dbplRepAnos'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 14288
      mmPrintPosition = 0
      object ppLabel150: TppLabel
        UserName = 'Label150'
        Caption = 'MES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 9525
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel151: TppLabel
        UserName = 'Label151'
        Caption = 'A'#209'O'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 17992
        mmTop = 9525
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel152: TppLabel
        UserName = 'Label152'
        Caption = 'VENTA M.E.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 41275
        mmTop = 9525
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel153: TppLabel
        UserName = 'Label153'
        Caption = 'PAGO M.E.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 60590
        mmTop = 9525
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel154: TppLabel
        UserName = 'Label154'
        Caption = 'SALDO M.E.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 78317
        mmTop = 9525
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel155: TppLabel
        UserName = 'Label155'
        Caption = 'RENOVACIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 98161
        mmTop = 9525
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel156: TppLabel
        UserName = 'Label156'
        Caption = 'REFINANCIACIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 125677
        mmTop = 9525
        mmWidth = 32015
        BandType = 0
      end
      object ppLabel157: TppLabel
        UserName = 'Label157'
        Caption = 'CHEQUES DEV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 180711
        mmTop = 9525
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel158: TppLabel
        UserName = 'Label158'
        Caption = 'CHEQUES DIF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 203994
        mmTop = 9525
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel159: TppLabel
        UserName = 'Label159'
        Caption = 'DISTRIBUIDORA INCORESA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 265
        mmWidth = 52917
        BandType = 0
      end
      object pplRATitulo: TppLabel
        UserName = 'lRATitulo'
        Caption = 'ANALISIS DEL CLIENTE: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 3969
        mmWidth = 39423
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 183357
        mmTop = 0
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 183357
        mmTop = 3704
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel160: TppLabel
        UserName = 'Label160'
        Caption = 'PROTESTOS  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 157957
        mmTop = 9525
        mmWidth = 22225
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 13758
        mmWidth = 226219
        BandType = 0
      end
      object ppLabel161: TppLabel
        UserName = 'Label161'
        Caption = 'L. CRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 29104
        mmTop = 9525
        mmWidth = 10848
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText75: TppDBText
        UserName = 'DBText75'
        AutoSize = True
        DataField = 'ANO'
        DataPipeline = dbplRepAnos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 18785
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppDBText76: TppDBText
        UserName = 'DBText76'
        AutoSize = True
        DataField = 'MESDESL'
        DataPipeline = dbplRepAnos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 794
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText77'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'MTOEXT'
        DataPipeline = dbplRepAnos
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 47890
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'DBText78'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'PAGEXT'
        DataPipeline = dbplRepAnos
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 64823
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText79: TppDBText
        UserName = 'DBText79'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'SALEXT'
        DataPipeline = dbplRepAnos
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 85725
        mmTop = 0
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText80: TppDBText
        UserName = 'DBText80'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'RENEXT'
        DataPipeline = dbplRepAnos
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 112184
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText81: TppDBText
        UserName = 'DBText801'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'NRORENOV'
        DataPipeline = dbplRepAnos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 92075
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText82: TppDBText
        UserName = 'DBText82'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'NROREFINA'
        DataPipeline = dbplRepAnos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 120650
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText83: TppDBText
        UserName = 'DBText802'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'REFEXT'
        DataPipeline = dbplRepAnos
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 146315
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText84: TppDBText
        UserName = 'DBText84'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'NRODEV'
        DataPipeline = dbplRepAnos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 178859
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText85: TppDBText
        UserName = 'DBText85'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'DEVEXT'
        DataPipeline = dbplRepAnos
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 191294
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText86: TppDBText
        UserName = 'DBText86'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'NRODIF'
        DataPipeline = dbplRepAnos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 205317
        mmTop = 0
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText87: TppDBText
        UserName = 'DBText87'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'DIFEXT'
        DataPipeline = dbplRepAnos
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 216430
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText88: TppDBText
        UserName = 'DBText88'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'NROPROT'
        DataPipeline = dbplRepAnos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 150548
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText89: TppDBText
        UserName = 'DBText89'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'PROTEXT'
        DataPipeline = dbplRepAnos
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 166952
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText90: TppDBText
        UserName = 'DBText90'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'CLIECREMAX'
        DataPipeline = dbplRepAnos
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbplRepAnos'
        mmHeight = 3440
        mmLeft = 22490
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object dbplRepAnos: TppDBPipeline
    UserName = 'dbplRepAnos'
    Left = 76
    Top = 492
    object ppField35: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppField36: TppField
      FieldAlias = 'LOCID'
      FieldName = 'LOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField37: TppField
      FieldAlias = 'HOJTID'
      FieldName = 'HOJTID'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField38: TppField
      FieldAlias = 'CLIEID'
      FieldName = 'CLIEID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object ppField39: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppField40: TppField
      FieldAlias = 'PEDFECHA'
      FieldName = 'PEDFECHA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 5
    end
    object ppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEDTOTMO'
      FieldName = 'PEDTOTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppField42: TppField
      FieldAlias = 'VEID'
      FieldName = 'VEID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 7
    end
    object ppField43: TppField
      FieldAlias = 'FPAGOID'
      FieldName = 'FPAGOID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 8
    end
    object ppField44: TppField
      FieldAlias = 'HOJTFECREG'
      FieldName = 'HOJTFECREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppField45: TppField
      FieldAlias = 'HOJTHORREG'
      FieldName = 'HOJTHORREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 10
    end
    object ppField46: TppField
      FieldAlias = 'HOJTFECSOL'
      FieldName = 'HOJTFECSOL'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 11
    end
    object ppField47: TppField
      FieldAlias = 'HOJTHORSOL'
      FieldName = 'HOJTHORSOL'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 12
    end
    object ppField48: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppField49: TppField
      FieldAlias = 'CLIERUC'
      FieldName = 'CLIERUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object ppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLIECREMAX'
      FieldName = 'CLIECREMAX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField51: TppField
      FieldAlias = 'HOJTFLAGFP'
      FieldName = 'HOJTFLAGFP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object ppField52: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 17
    end
    object ppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'HOJTDCTO'
      FieldName = 'HOJTDCTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField54: TppField
      FieldAlias = 'DESCLIEPL1'
      FieldName = 'DESCLIEPL1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object ppField55: TppField
      FieldAlias = 'DESCLIEPL2'
      FieldName = 'DESCLIEPL2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object ppField56: TppField
      FieldAlias = 'HOJTESTADO'
      FieldName = 'HOJTESTADO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppField57: TppField
      FieldAlias = 'SCOMERID'
      FieldName = 'SCOMERID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object ppField58: TppField
      FieldAlias = 'HOJTSOLLOG'
      FieldName = 'HOJTSOLLOG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField59: TppField
      FieldAlias = 'HOJTSOLCXC'
      FieldName = 'HOJTSOLCXC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField60: TppField
      FieldAlias = 'ALMID'
      FieldName = 'ALMID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 25
    end
    object ppField61: TppField
      FieldAlias = 'HOJTUSER'
      FieldName = 'HOJTUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
    object ppField62: TppField
      FieldAlias = 'HOJTVBCXC'
      FieldName = 'HOJTVBCXC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 27
    end
    object ppField63: TppField
      FieldAlias = 'HOJTVBLOG'
      FieldName = 'HOJTVBLOG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 28
    end
    object ppField64: TppField
      FieldAlias = 'HOJOBS'
      FieldName = 'HOJOBS'
      FieldLength = 1
      DataType = dtMemo
      DisplayWidth = 10
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppField65: TppField
      FieldAlias = 'HOJHOR'
      FieldName = 'HOJHOR'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 30
    end
    object ppField66: TppField
      FieldAlias = 'CLIEDES'
      FieldName = 'CLIEDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 31
    end
    object ppField67: TppField
      FieldAlias = 'DCCOMDES'
      FieldName = 'DCCOMDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 32
    end
    object ppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'HOJTNIVEL'
      FieldName = 'HOJTNIVEL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 33
    end
    object ppField69: TppField
      FieldAlias = 'HOJOBSLOG1'
      FieldName = 'HOJOBSLOG1'
      FieldLength = 1
      DataType = dtMemo
      DisplayWidth = 10
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppField70: TppField
      FieldAlias = 'HOJOBSLOG2'
      FieldName = 'HOJOBSLOG2'
      FieldLength = 1
      DataType = dtMemo
      DisplayWidth = 10
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppField71: TppField
      FieldAlias = 'HOJOBSCXC1'
      FieldName = 'HOJOBSCXC1'
      FieldLength = 1
      DataType = dtMemo
      DisplayWidth = 10
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppField72: TppField
      FieldAlias = 'USERANUL'
      FieldName = 'USERANUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
    object ppField73: TppField
      FieldAlias = 'FECANUL'
      FieldName = 'FECANUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 38
    end
    object ppField74: TppField
      FieldAlias = 'HORANUL'
      FieldName = 'HORANUL'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 39
    end
  end
  object ppmLetra: TPopupMenu
    Left = 20
    Top = 352
    object CanLetra: TMenuItem
      Caption = 'Cancelaciones'
      OnClick = CanLetraClick
    end
    object DocumentosOrigen1: TMenuItem
      Caption = 'Documentos de Compromiso'
      Visible = False
      OnClick = DocumentosOrigen1Click
    end
  end
  object ppmDocu: TPopupMenu
    Left = 68
    Top = 352
    object CanDocu: TMenuItem
      Caption = 'Cancelaciones'
      OnClick = CanDocuClick
    end
  end
  object ppmChDev: TPopupMenu
    Left = 12
    Top = 400
    object CanChDev: TMenuItem
      Caption = 'Cancelaciones'
      OnClick = CanChDevClick
    end
  end
  object ppmNCre: TPopupMenu
    Left = 68
    Top = 400
    object CanNCre: TMenuItem
      Caption = 'Cancelaciones'
      OnClick = CanNCreClick
    end
  end
  object ppdbAmortiza: TppDBPipeline
    UserName = 'dbAmortiza'
    Left = 208
    Top = 544
  end
  object pprAmortiza: TppReport
    AutoStop = False
    DataPipeline = ppdbAmortiza
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 11000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 220000
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SOLExes\SOLFormatos\CxP\Incoresa\Amortiza.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprAmortizaPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 240
    Top = 544
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbAmortiza'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 50800
      mmPrintPosition = 0
      object ppLabel163: TppLabel
        UserName = 'Label163'
        Caption = 'Amortizaciones'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5027
        mmLeft = 82550
        mmTop = 6615
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel164: TppLabel
        UserName = 'lCia'
        Caption = 'INCORESA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 1588
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel165: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 38100
        mmWidth = 195263
        BandType = 0
      end
      object ppLabel166: TppLabel
        UserName = 'Label166'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 47096
        mmWidth = 195263
        BandType = 0
      end
      object ppLabel167: TppLabel
        UserName = 'Label8'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 154517
        mmTop = 1852
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel168: TppLabel
        UserName = 'Label168'
        AutoSize = False
        Caption = 'Hora  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 154517
        mmTop = 6879
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel169: TppLabel
        UserName = 'Label169'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 154517
        mmTop = 12700
        mmWidth = 10319
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 169863
        mmTop = 12700
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 169598
        mmTop = 6879
        mmWidth = 17727
        BandType = 0
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 169598
        mmTop = 1852
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel170: TppLabel
        UserName = 'Label170'
        Caption = 'Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 12700
        mmWidth = 15875
        BandType = 0
      end
      object pplblCliente: TppLabel
        UserName = 'lblCliente'
        AutoSize = False
        Caption = 'WATANABE MATZUKURA, ROBERTO             '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 28840
        mmTop = 18785
        mmWidth = 106363
        BandType = 0
      end
      object ppLabel171: TppLabel
        UserName = 'Label171'
        Caption = 'T. Doc,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 26723
        mmWidth = 10848
        BandType = 0
      end
      object pplblTDoc: TppLabel
        UserName = 'lblTDoc'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 32808
        mmWidth = 38100
        BandType = 0
      end
      object ppLabel172: TppLabel
        UserName = 'Label172'
        Caption = 'Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 44715
        mmTop = 26723
        mmWidth = 7673
        BandType = 0
      end
      object pplblSerie: TppLabel
        UserName = 'lblSerie'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 44715
        mmTop = 32808
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel173: TppLabel
        UserName = 'Label173'
        Caption = 'N'#176
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 58738
        mmTop = 26723
        mmWidth = 3704
        BandType = 0
      end
      object pplblNoDoc: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 58738
        mmTop = 32808
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel174: TppLabel
        UserName = 'Label174'
        Caption = 'Moneda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 84402
        mmTop = 26723
        mmWidth = 11906
        BandType = 0
      end
      object pplblMoneda: TppLabel
        UserName = 'Label203'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 84402
        mmTop = 32808
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel175: TppLabel
        UserName = 'Label175'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 101600
        mmTop = 26723
        mmWidth = 11377
        BandType = 0
      end
      object pplblImporte: TppLabel
        UserName = 'Label204'
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 101600
        mmTop = 32808
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel176: TppLabel
        UserName = 'Label176'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 136790
        mmTop = 26723
        mmWidth = 7938
        BandType = 0
      end
      object pplblSaldo: TppLabel
        UserName = 'Label205'
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 136790
        mmTop = 32808
        mmWidth = 26194
        BandType = 0
      end
      object pplblCodigo: TppLabel
        UserName = 'lblCliente1'
        AutoSize = False
        Caption = '10992605'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 18785
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel177: TppLabel
        UserName = 'Label177'
        Caption = 'F.Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 42598
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel178: TppLabel
        UserName = 'Label20'
        Caption = 'T.Doc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 42598
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel179: TppLabel
        UserName = 'Label179'
        Caption = 'Serie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 58208
        mmTop = 42598
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel180: TppLabel
        UserName = 'Label180'
        Caption = 'N'#176
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 79375
        mmTop = 42598
        mmWidth = 3175
        BandType = 0
      end
      object ppLabel181: TppLabel
        UserName = 'Label181'
        Caption = 'T.Cje'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 94192
        mmTop = 42598
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel182: TppLabel
        UserName = 'Label182'
        Caption = 'N'#176'Canje'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 42598
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel183: TppLabel
        UserName = 'Label183'
        Caption = 'Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 134144
        mmTop = 42598
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel184: TppLabel
        UserName = 'Label184'
        Caption = 'Monto(MN)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 152665
        mmTop = 42598
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel185: TppLabel
        UserName = 'Label185'
        Caption = 'Monto(ME)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 175684
        mmTop = 42598
        mmWidth = 15081
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText91: TppDBText
        UserName = 'DBText91'
        DataField = 'CCFCANJE'
        DataPipeline = ppdbAmortiza
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbAmortiza'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText92: TppDBText
        UserName = 'DBText92'
        DataField = 'DOCABR'
        DataPipeline = ppdbAmortiza
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbAmortiza'
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 0
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText93: TppDBText
        UserName = 'DBText93'
        DataField = 'CCSERIE2'
        DataPipeline = ppdbAmortiza
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbAmortiza'
        mmHeight = 3704
        mmLeft = 56356
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText94: TppDBText
        UserName = 'DBText94'
        DataField = 'CCNODOC'
        DataPipeline = ppdbAmortiza
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbAmortiza'
        mmHeight = 3704
        mmLeft = 71173
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText95: TppDBText
        UserName = 'DBText95'
        DataField = 'TCANJEID'
        DataPipeline = ppdbAmortiza
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbAmortiza'
        mmHeight = 3704
        mmLeft = 94721
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText96: TppDBText
        UserName = 'DBText96'
        DataField = 'CCCANJE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText97: TppDBText
        UserName = 'DBText97'
        DataField = 'DCCMTOEXT'
        DataPipeline = ppdbAmortiza
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbAmortiza'
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText98: TppDBText
        UserName = 'DBText98'
        DataField = 'DCCMTOLOC'
        DataPipeline = ppdbAmortiza
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbAmortiza'
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText99: TppDBText
        UserName = 'DBText99'
        DataField = 'TMONABR'
        DataPipeline = ppdbAmortiza
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbAmortiza'
        mmHeight = 3704
        mmLeft = 134673
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand9: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'DCCMTOLOC'
        DataPipeline = ppdbAmortiza
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbAmortiza'
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 3440
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'DCCMTOEXT'
        DataPipeline = ppdbAmortiza
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbAmortiza'
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 3440
        mmWidth = 23019
        BandType = 7
      end
      object ppLabel186: TppLabel
        UserName = 'Label186'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 0
        mmWidth = 195263
        BandType = 7
      end
    end
  end
  object ppdbPipelineAdendo: TppDBPipeline
    UserName = 'dbPipelineAdendo'
    Left = 128
    Top = 288
  end
  object ppCtaCteProv: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'CtaCteProv'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\OP\Dema\CCProv.rtm'
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppCtaCteProvPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 698
    Top = 498
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppCia: TppLabel
        UserName = 'Cia'
        Caption = 'BHL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 4233
        mmWidth = 6350
        BandType = 0
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable12'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175155
        mmTop = 4233
        mmWidth = 21167
        BandType = 0
      end
      object ppSystemVariable13: TppSystemVariable
        UserName = 'SystemVariable13'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175155
        mmTop = 8731
        mmWidth = 16933
        BandType = 0
      end
      object ppSystemVariable14: TppSystemVariable
        UserName = 'SystemVariable14'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175155
        mmTop = 13229
        mmWidth = 2117
        BandType = 0
      end
      object ppLabel231: TppLabel
        UserName = 'Label1'
        Caption = 'Fecha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156898
        mmTop = 4233
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel232: TppLabel
        UserName = 'Label2'
        Caption = 'Hora:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156898
        mmTop = 8731
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel233: TppLabel
        UserName = 'Label233'
        Caption = 'Pag.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156898
        mmTop = 13229
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel234: TppLabel
        UserName = 'Label234'
        Caption = 'CUENTA CORRIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 78846
        mmTop = 4233
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel235: TppLabel
        UserName = 'Label223'
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 13229
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel236: TppLabel
        UserName = 'Label236'
        Caption = 'R.U.C.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 17992
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel237: TppLabel
        UserName = 'Label237'
        Caption = 'Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 22490
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel238: TppLabel
        UserName = 'Label238'
        Caption = 'Direcci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 26988
        mmWidth = 19050
        BandType = 0
      end
      object ppCod: TppLabel
        UserName = 'Label239'
        Caption = '00000001'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26194
        mmTop = 13229
        mmWidth = 16933
        BandType = 0
      end
      object ppRuc: TppLabel
        UserName = 'Ruc'
        Caption = '16461666161'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26194
        mmTop = 17992
        mmWidth = 23283
        BandType = 0
      end
      object ppProv: TppLabel
        UserName = 'Label231'
        Caption = 'Prueba'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26194
        mmTop = 22490
        mmWidth = 12700
        BandType = 0
      end
      object ppDir: TppLabel
        UserName = 'Label232'
        Caption = 'Lima'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26194
        mmTop = 26988
        mmWidth = 8467
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object CF: TppSubReport
        UserName = 'CF'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDBPipelineF'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 203200
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport7: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPipelineF
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'CtaCteProv'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Template.FileName = 'C:\SOLExes\SOLFormatos\CXP\Bhl\CCProv.rtm'
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPipelineF'
          object ppTitleBand9: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 24077
            mmPrintPosition = 0
            object ppLabel243: TppLabel
              UserName = 'Label243'
              Caption = 'Tipo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 2117
              mmTop = 14552
              mmWidth = 8467
              BandType = 1
            end
            object ppLabel244: TppLabel
              UserName = 'Label244'
              Caption = 'Serie'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 10848
              mmTop = 14552
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel245: TppLabel
              UserName = 'Label245'
              Caption = 'N'#186'Dcto'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 22225
              mmTop = 14552
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel246: TppLabel
              UserName = 'Label194'
              Caption = 'F.Emisi'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 36513
              mmTop = 14552
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel247: TppLabel
              UserName = 'Label195'
              Caption = 'Mon'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 78052
              mmTop = 14552
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel248: TppLabel
              UserName = 'Label248'
              Caption = 'D O C U M E N T O S'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 19050
              mmTop = 10319
              mmWidth = 40217
              BandType = 1
            end
            object ppLabel249: TppLabel
              UserName = 'Label249'
              Caption = 'MONEDA NACIONAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 93134
              mmTop = 10319
              mmWidth = 31750
              BandType = 1
            end
            object ppLabel250: TppLabel
              UserName = 'Label250'
              Caption = 'Cargo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 93927
              mmTop = 14552
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel251: TppLabel
              UserName = 'Label216'
              Caption = 'Abono'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 112448
              mmTop = 14552
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel252: TppLabel
              UserName = 'Label252'
              Caption = 'Saldo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 128852
              mmTop = 14552
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel253: TppLabel
              UserName = 'Label253'
              Caption = 'MONEDA EXTRANJERA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 155046
              mmTop = 10319
              mmWidth = 35983
              BandType = 1
            end
            object ppLabel254: TppLabel
              UserName = 'Label254'
              Caption = 'Cargo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 150284
              mmTop = 14552
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel255: TppLabel
              UserName = 'Label2201'
              Caption = 'Abono'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 168805
              mmTop = 14552
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel256: TppLabel
              UserName = 'Label256'
              Caption = 'Saldo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 187590
              mmTop = 14552
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel257: TppLabel
              UserName = 'Label233'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 6350
              mmWidth = 203200
              BandType = 1
            end
            object ppLabel258: TppLabel
              UserName = 'Label234'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 18785
              mmWidth = 203200
              BandType = 1
            end
            object ppLabel259: TppLabel
              UserName = 'Label235'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 88371
              mmTop = 10319
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel260: TppLabel
              UserName = 'Label236'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 88371
              mmTop = 14552
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel261: TppLabel
              UserName = 'Label261'
              Caption = 'Documentos'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 2381
              mmWidth = 21167
              BandType = 1
            end
            object ppLabel285: TppLabel
              UserName = 'Label285'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 529
              mmTop = 11642
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel286: TppLabel
              UserName = 'Label286'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 529
              mmTop = 15875
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel287: TppLabel
              UserName = 'Label287'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 200290
              mmTop = 10319
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel288: TppLabel
              UserName = 'Label288'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 200290
              mmTop = 14552
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel289: TppLabel
              UserName = 'Label289'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 143934
              mmTop = 10583
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel290: TppLabel
              UserName = 'Label290'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 143934
              mmTop = 14817
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel262: TppLabel
              UserName = 'Label262'
              Caption = 'F.Vcmto'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 58473
              mmTop = 14552
              mmWidth = 14817
              BandType = 1
            end
          end
          object ppDetailBand14: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 8996
            mmPrintPosition = 0
            object ppDBText121: TppDBText
              UserName = 'DBText1'
              DataField = 'DOCABR'
              DataPipeline = ppDBPipelineF
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 8467
              BandType = 4
            end
            object ppSubReport5: TppSubReport
              UserName = 'SubReport5'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'ppDBPipelineDF'
              mmHeight = 5027
              mmLeft = 0
              mmTop = 3969
              mmWidth = 203200
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport8: TppChildReport
                AutoStop = False
                DataPipeline = ppDBPipelineDF
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'CtaCteProv'
                PrinterSetup.PaperName = 'Carta'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 6350
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 279401
                PrinterSetup.mmPaperWidth = 215900
                PrinterSetup.PaperSize = 1
                Template.FileName = 'C:\SOLExes\SOLFormatos\CXP\Bhl\CCProv.rtm'
                Units = utMillimeters
                Version = '7.02'
                mmColumnWidth = 0
                DataPipelineName = 'ppDBPipelineDF'
                object ppTitleBand10: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 794
                  mmPrintPosition = 0
                end
                object ppDetailBand15: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 4498
                  mmPrintPosition = 0
                  object ppDBText122: TppDBText
                    UserName = 'DBText122'
                    DataField = 'DOCABR2'
                    DataPipeline = ppDBPipelineDF
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDF'
                    mmHeight = 4233
                    mmLeft = 10848
                    mmTop = 0
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppDBText123: TppDBText
                    UserName = 'DBText109'
                    DataField = 'CPNODOC2'
                    DataPipeline = ppDBPipelineDF
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDF'
                    mmHeight = 4233
                    mmLeft = 51329
                    mmTop = 0
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppDBText124: TppDBText
                    UserName = 'DBText1101'
                    DataField = 'CPSERIE2'
                    DataPipeline = ppDBPipelineDF
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDF'
                    mmHeight = 4233
                    mmLeft = 32015
                    mmTop = 0
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppDBText125: TppDBText
                    UserName = 'DBText125'
                    DataField = 'CCPCANJE'
                    DataPipeline = ppDBPipelineDF
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDF'
                    mmHeight = 4233
                    mmLeft = 96838
                    mmTop = 0
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppDBText126: TppDBText
                    UserName = 'DBText126'
                    DataField = 'TCANJEID'
                    DataPipeline = ppDBPipelineDF
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDF'
                    mmHeight = 4233
                    mmLeft = 74613
                    mmTop = 0
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppDBText127: TppDBText
                    UserName = 'DBText127'
                    AutoSize = True
                    BlankWhenZero = True
                    DataField = 'DCCMTOEXT'
                    DataPipeline = ppDBPipelineDF
                    DisplayFormat = '#,0.00;-#,0.00'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDF'
                    mmHeight = 4233
                    mmLeft = 124884
                    mmTop = 0
                    mmWidth = 16933
                    BandType = 4
                  end
                  object ppDBText128: TppDBText
                    UserName = 'DBText128'
                    AutoSize = True
                    BlankWhenZero = True
                    DataField = 'DCCMTOLOC'
                    DataPipeline = ppDBPipelineDF
                    DisplayFormat = '#,0.00;-#,0.00'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDF'
                    mmHeight = 4233
                    mmLeft = 147902
                    mmTop = 0
                    mmWidth = 19050
                    BandType = 4
                  end
                end
                object ppSummaryBand12: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
            object ppDBText129: TppDBText
              UserName = 'DBText129'
              DataField = 'CPSERIE'
              DataPipeline = ppDBPipelineF
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 9260
              mmTop = 0
              mmWidth = 6350
              BandType = 4
            end
            object ppDBText130: TppDBText
              UserName = 'DBText115'
              DataField = 'CPNODOC'
              DataPipeline = ppDBPipelineF
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 16404
              mmTop = 0
              mmWidth = 15610
              BandType = 4
            end
            object ppDBText131: TppDBText
              UserName = 'DBText131'
              AutoSize = True
              DataField = 'CPFEMIS'
              DataPipeline = ppDBPipelineF
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 33073
              mmTop = 0
              mmWidth = 21167
              BandType = 4
            end
            object ppDBText132: TppDBText
              UserName = 'DBText132'
              DataField = 'TMONABR'
              DataPipeline = ppDBPipelineF
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 78317
              mmTop = 0
              mmWidth = 6615
              BandType = 4
            end
            object ppDBText133: TppDBText
              UserName = 'DBText133'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MTOLOC'
              DataPipeline = ppDBPipelineF
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 94456
              mmTop = 0
              mmWidth = 12700
              BandType = 4
            end
            object ppDBText134: TppDBText
              UserName = 'DBText134'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'PAGLOC'
              DataPipeline = ppDBPipelineF
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 112713
              mmTop = 0
              mmWidth = 12700
              BandType = 4
            end
            object ppDBText135: TppDBText
              UserName = 'DBText121'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'SALLOC'
              DataPipeline = ppDBPipelineF
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 130704
              mmTop = 0
              mmWidth = 12700
              BandType = 4
            end
            object ppDBText136: TppDBText
              UserName = 'DBText122'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MTOEXT'
              DataPipeline = ppDBPipelineF
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 146315
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText137: TppDBText
              UserName = 'DBText123'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'PAGEXT'
              DataPipeline = ppDBPipelineF
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 171980
              mmTop = 0
              mmWidth = 12700
              BandType = 4
            end
            object ppDBText138: TppDBText
              UserName = 'DBText124'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'SALEXT'
              DataPipeline = ppDBPipelineF
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 184680
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText139: TppDBText
              UserName = 'DBText139'
              AutoSize = True
              DataField = 'CPFVCMTO'
              DataPipeline = ppDBPipelineF
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 55827
              mmTop = 0
              mmWidth = 21167
              BandType = 4
            end
          end
          object ppSummaryBand13: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 10319
            mmPrintPosition = 0
            object ppLabel291: TppLabel
              UserName = 'Label291'
              Caption = 'Total Facturaci'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 25135
              mmTop = 3969
              mmWidth = 35983
              BandType = 7
            end
            object ppLabel292: TppLabel
              UserName = 'Label292'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 203200
              BandType = 7
            end
            object ppdbcCLF: TppDBCalc
              UserName = 'DBCalc8'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MTOLOC'
              DataPipeline = ppDBPipelineF
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 85143
              mmTop = 3969
              mmWidth = 17780
              BandType = 7
            end
            object ppdbcPLF: TppDBCalc
              UserName = 'dbcPLF'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'PAGLOC'
              DataPipeline = ppDBPipelineF
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 103664
              mmTop = 3969
              mmWidth = 17780
              BandType = 7
            end
            object ppdbcSLF: TppDBCalc
              UserName = 'DBCalc10'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'SALLOC'
              DataPipeline = ppDBPipelineF
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 122185
              mmTop = 3969
              mmWidth = 17780
              BandType = 7
            end
            object ppdbcCEF: TppDBCalc
              UserName = 'DBCalc11'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MTOEXT'
              DataPipeline = ppDBPipelineF
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 142029
              mmTop = 3969
              mmWidth = 17780
              BandType = 7
            end
            object ppdbcPEF: TppDBCalc
              UserName = 'DBCalc12'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'PAGEXT'
              DataPipeline = ppDBPipelineF
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 163724
              mmTop = 3969
              mmWidth = 17780
              BandType = 7
            end
            object ppdbcSEF: TppDBCalc
              UserName = 'DBCalc13'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'SALEXT'
              DataPipeline = ppDBPipelineF
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 4233
              mmLeft = 183568
              mmTop = 3969
              mmWidth = 17780
              BandType = 7
            end
          end
        end
      end
      object CN: TppSubReport
        UserName = 'CN'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = CF
        TraverseAllData = False
        DataPipelineName = 'ppDBPipelineN'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 6085
        mmWidth = 203200
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport9: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPipelineN
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'CtaCteProv'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Template.FileName = 'C:\SOLEXes\SOLFormatos\CxP\Dema\CCProv.rtm'
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPipelineN'
          object ppTitleBand11: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 23283
            mmPrintPosition = 0
            object ppLabel263: TppLabel
              UserName = 'Label263'
              Caption = 'Tipo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 2910
              mmTop = 14288
              mmWidth = 8467
              BandType = 1
            end
            object ppLabel264: TppLabel
              UserName = 'Label264'
              Caption = 'Serie'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 12435
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel265: TppLabel
              UserName = 'Label265'
              Caption = 'Numero'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 23813
              mmTop = 14288
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel266: TppLabel
              UserName = 'Label266'
              Caption = 'F.Emisi'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 37306
              mmTop = 14288
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel267: TppLabel
              UserName = 'Label267'
              Caption = 'Mon'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 78052
              mmTop = 14288
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel268: TppLabel
              UserName = 'Label268'
              Caption = 'D O C U M E N T O S'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 19844
              mmTop = 10054
              mmWidth = 40217
              BandType = 1
            end
            object ppLabel269: TppLabel
              UserName = 'Label269'
              Caption = 'MONEDA NACIONAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 100542
              mmTop = 10054
              mmWidth = 31750
              BandType = 1
            end
            object ppLabel270: TppLabel
              UserName = 'Label2501'
              Caption = 'Cargo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 90488
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel271: TppLabel
              UserName = 'Label2704'
              Caption = 'Abono'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 108479
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel272: TppLabel
              UserName = 'Label1'
              Caption = 'Saldo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 127794
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel273: TppLabel
              UserName = 'Label272'
              Caption = 'MONEDA EXTRANJERA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 155046
              mmTop = 10054
              mmWidth = 35983
              BandType = 1
            end
            object ppLabel274: TppLabel
              UserName = 'Label2'
              Caption = 'Cargo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 150284
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel275: TppLabel
              UserName = 'Label274'
              Caption = 'Abono'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 169069
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel276: TppLabel
              UserName = 'Label3'
              Caption = 'Saldo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 187855
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel277: TppLabel
              UserName = 'Label276'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 6085
              mmWidth = 203200
              BandType = 1
            end
            object ppLabel278: TppLabel
              UserName = 'Label4'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 85461
              mmTop = 10583
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel279: TppLabel
              UserName = 'Label5'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 85461
              mmTop = 14817
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel280: TppLabel
              UserName = 'Label2202'
              Caption = 'Notas de Credito'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 2117
              mmWidth = 33867
              BandType = 1
            end
            object ppLabel281: TppLabel
              UserName = 'Label278'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 18785
              mmWidth = 203200
              BandType = 1
            end
            object ppLabel282: TppLabel
              UserName = 'Label279'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 200819
              mmTop = 11113
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel283: TppLabel
              UserName = 'Label280'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 200819
              mmTop = 15346
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel284: TppLabel
              UserName = 'Label281'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 143934
              mmTop = 10583
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel293: TppLabel
              UserName = 'Label282'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 143934
              mmTop = 14817
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel294: TppLabel
              UserName = 'Label283'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 265
              mmTop = 10319
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel295: TppLabel
              UserName = 'Label284'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 265
              mmTop = 14552
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel239: TppLabel
              UserName = 'Label239'
              Caption = 'F.Vcmto'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 60325
              mmTop = 14288
              mmWidth = 14817
              BandType = 1
            end
          end
          object ppDetailBand16: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppDBText140: TppDBText
              UserName = 'DBText125'
              DataField = 'DOCABR'
              DataPipeline = ppDBPipelineN
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 11906
              BandType = 4
            end
            object ppDBText142: TppDBText
              UserName = 'DBText142'
              DataField = 'CPSERIE'
              DataPipeline = ppDBPipelineN
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 12700
              mmTop = 0
              mmWidth = 6615
              BandType = 4
            end
            object ppDBText143: TppDBText
              UserName = 'DBText143'
              AutoSize = True
              DataField = 'CPNODOC'
              DataPipeline = ppDBPipelineN
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 19844
              mmTop = 0
              mmWidth = 14817
              BandType = 4
            end
            object ppDBText144: TppDBText
              UserName = 'DBText144'
              AutoSize = True
              DataField = 'CPFEMIS'
              DataPipeline = ppDBPipelineN
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 35454
              mmTop = 0
              mmWidth = 14817
              BandType = 4
            end
            object ppDBText145: TppDBText
              UserName = 'DBText145'
              DataField = 'TMONABR'
              DataPipeline = ppDBPipelineN
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 79375
              mmTop = 0
              mmWidth = 7144
              BandType = 4
            end
            object ppDBText146: TppDBText
              UserName = 'DBText146'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'CCMTOLOC'
              DataPipeline = ppDBPipelineN
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 87048
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText147: TppDBText
              UserName = 'DBText147'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'CCPAGLOC'
              DataPipeline = ppDBPipelineN
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 107156
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText148: TppDBText
              UserName = 'DBText148'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'CCSALLOC'
              DataPipeline = ppDBPipelineN
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 127265
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText149: TppDBText
              UserName = 'DBText149'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'CCMTOEXT'
              DataPipeline = ppDBPipelineN
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 146579
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText150: TppDBText
              UserName = 'DBText150'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'CCPAGEXT'
              DataPipeline = ppDBPipelineN
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 167217
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText151: TppDBText
              UserName = 'DBText151'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'CCSALEXT'
              DataPipeline = ppDBPipelineN
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 183886
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText141: TppDBText
              UserName = 'DBText141'
              AutoSize = True
              DataField = 'CPFVCMTO'
              DataPipeline = ppDBPipelineN
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 57415
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
          end
          object ppSummaryBand14: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 10054
            mmPrintPosition = 0
            object ppLabel296: TppLabel
              UserName = 'Label293'
              Caption = 'Total Notas de Credito'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 25135
              mmTop = 3969
              mmWidth = 46567
              BandType = 7
            end
            object ppLabel297: TppLabel
              UserName = 'Label294'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 203200
              BandType = 7
            end
            object ppdbcCLN: TppDBCalc
              UserName = 'DBCalc14'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'CCMTOLOC'
              DataPipeline = ppDBPipelineN
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 83239
              mmTop = 3969
              mmWidth = 20743
              BandType = 7
            end
            object ppdbcPLN: TppDBCalc
              UserName = 'DBCalc15'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'CCPAGLOC'
              DataPipeline = ppDBPipelineN
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 103347
              mmTop = 3969
              mmWidth = 20743
              BandType = 7
            end
            object ppdbcSLN: TppDBCalc
              UserName = 'DBCalc16'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'CCSALLOC'
              DataPipeline = ppDBPipelineN
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 123455
              mmTop = 3969
              mmWidth = 20743
              BandType = 7
            end
            object ppdbcCEN: TppDBCalc
              UserName = 'DBCalc17'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'CCMTOEXT'
              DataPipeline = ppDBPipelineN
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 142770
              mmTop = 3969
              mmWidth = 20743
              BandType = 7
            end
            object ppdbcPEN: TppDBCalc
              UserName = 'DBCalc18'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'CCPAGEXT'
              DataPipeline = ppDBPipelineN
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 163408
              mmTop = 3969
              mmWidth = 20743
              BandType = 7
            end
            object ppdbcSEN: TppDBCalc
              UserName = 'DBCalc19'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'CCSALEXT'
              DataPipeline = ppDBPipelineN
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineN'
              mmHeight = 4233
              mmLeft = 180076
              mmTop = 3969
              mmWidth = 20743
              BandType = 7
            end
          end
        end
      end
      object CL: TppSubReport
        UserName = 'CL'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = CN
        TraverseAllData = False
        DataPipelineName = 'ppDBPipelineL'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 11906
        mmWidth = 203200
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport10: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPipelineL
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'CtaCteProv'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Template.FileName = 'C:\SOLExes\SOLFormatos\CXP\Bhl\CCProv.rtm'
          Units = utMillimeters
          Left = 400
          Top = 288
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPipelineL'
          object ppTitleBand12: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 23019
            mmPrintPosition = 0
            object ppLabel298: TppLabel
              UserName = 'Label297'
              Caption = 'Letra'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 14817
              mmTop = 14552
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel299: TppLabel
              UserName = 'Label298'
              Caption = 'Serie'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 3704
              mmTop = 14552
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel300: TppLabel
              UserName = 'Label299'
              Caption = 'F. Emisi'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 34925
              mmTop = 14552
              mmWidth = 21167
              BandType = 1
            end
            object ppLabel301: TppLabel
              UserName = 'Label300'
              Caption = 'F. Vcmto.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 61383
              mmTop = 14552
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel302: TppLabel
              UserName = 'Label261'
              Caption = 'MONEDA NACIONAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 107156
              mmTop = 10319
              mmWidth = 31750
              BandType = 1
            end
            object ppLabel303: TppLabel
              UserName = 'Label262'
              Caption = 'Moneda'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 83609
              mmTop = 14552
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel304: TppLabel
              UserName = 'Label263'
              Caption = 'Importe'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 106363
              mmTop = 14552
              mmWidth = 14817
              BandType = 1
            end
            object ppLabel305: TppLabel
              UserName = 'Label264'
              Caption = 'Saldo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 133615
              mmTop = 14552
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel306: TppLabel
              UserName = 'Label265'
              Caption = 'MONEDA EXTRANJERA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 153459
              mmTop = 10319
              mmWidth = 35983
              BandType = 1
            end
            object ppLabel307: TppLabel
              UserName = 'Label267'
              Caption = 'Importe'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 156104
              mmTop = 14552
              mmWidth = 14817
              BandType = 1
            end
            object ppLabel308: TppLabel
              UserName = 'Label268'
              Caption = 'Saldo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 185473
              mmTop = 14552
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel309: TppLabel
              UserName = 'Label308'
              Caption = 'Letras'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 2381
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel310: TppLabel
              UserName = 'Label266'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 265
              mmTop = 6350
              mmWidth = 202407
              BandType = 1
            end
            object ppLabel311: TppLabel
              UserName = 'Label269'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 265
              mmTop = 18785
              mmWidth = 202407
              BandType = 1
            end
            object ppLabel312: TppLabel
              UserName = 'Label270'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 99748
              mmTop = 10583
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel313: TppLabel
              UserName = 'Label271'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 99748
              mmTop = 14817
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel314: TppLabel
              UserName = 'Label2701'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 146844
              mmTop = 10583
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel315: TppLabel
              UserName = 'Label273'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 146844
              mmTop = 14817
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel316: TppLabel
              UserName = 'Label2702'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 200290
              mmTop = 10583
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel317: TppLabel
              UserName = 'Label275'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 200290
              mmTop = 14817
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel318: TppLabel
              UserName = 'Label2703'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 794
              mmTop = 10583
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel319: TppLabel
              UserName = 'Label277'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 794
              mmTop = 14817
              mmWidth = 2117
              BandType = 1
            end
          end
          object ppDetailBand17: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 8996
            mmPrintPosition = 0
            object ppDBText152: TppDBText
              UserName = 'DBText1401'
              AutoSize = True
              DataField = 'CPNODOC'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 15875
              mmTop = 0
              mmWidth = 6350
              BandType = 4
            end
            object ppDBText153: TppDBText
              UserName = 'DBText1'
              AutoSize = True
              DataField = 'CPFEMIS'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 34660
              mmTop = 0
              mmWidth = 14817
              BandType = 4
            end
            object ppDBText154: TppDBText
              UserName = 'DBText152'
              AutoSize = True
              DataField = 'CPFVCMTO'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 60325
              mmTop = 0
              mmWidth = 21167
              BandType = 4
            end
            object ppDBText155: TppDBText
              UserName = 'DBText153'
              DataField = 'TMONABR'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 86254
              mmTop = 0
              mmWidth = 7938
              BandType = 4
            end
            object ppDBText156: TppDBText
              UserName = 'DBText1102'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MTOLOC'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 108744
              mmTop = 0
              mmWidth = 12700
              BandType = 4
            end
            object ppDBText157: TppDBText
              UserName = 'DBText155'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'SALLOC'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 130969
              mmTop = 0
              mmWidth = 12700
              BandType = 4
            end
            object ppDBText158: TppDBText
              UserName = 'DBText156'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MTOEXT'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 158486
              mmTop = 0
              mmWidth = 12700
              BandType = 4
            end
            object ppDBText159: TppDBText
              UserName = 'DBText157'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'SALEXT'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 183886
              mmTop = 0
              mmWidth = 12700
              BandType = 4
            end
            object ppDBText160: TppDBText
              UserName = 'DBText158'
              AutoSize = True
              DataField = 'CPSERIE'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 3704
              mmTop = 0
              mmWidth = 6350
              BandType = 4
            end
            object ppSubReport4: TppSubReport
              UserName = 'SubReport4'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'ppDBPipelineDL'
              mmHeight = 5027
              mmLeft = 0
              mmTop = 3969
              mmWidth = 203200
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport11: TppChildReport
                AutoStop = False
                DataPipeline = ppDBPipelineDL
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'CtaCteProv'
                PrinterSetup.PaperName = 'Carta'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 6350
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 279401
                PrinterSetup.mmPaperWidth = 215900
                PrinterSetup.PaperSize = 1
                Template.FileName = 'C:\SOLEXes\SOLFormatos\CxP\Dema\CCProv.rtm'
                Units = utMillimeters
                Version = '7.02'
                mmColumnWidth = 0
                DataPipelineName = 'ppDBPipelineDL'
                object ppTitleBand13: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppDetailBand18: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 4233
                  mmPrintPosition = 0
                  object ppDBText161: TppDBText
                    UserName = 'DBText159'
                    DataField = 'DOCABR'
                    DataPipeline = ppDBPipelineDL
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDL'
                    mmHeight = 4233
                    mmLeft = 5027
                    mmTop = 0
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppDBText162: TppDBText
                    UserName = 'DBText160'
                    DataField = 'CPNODOC2'
                    DataPipeline = ppDBPipelineDL
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDL'
                    mmHeight = 4233
                    mmLeft = 45508
                    mmTop = 0
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppDBText163: TppDBText
                    UserName = 'DBText161'
                    DataField = 'CPSERIE2'
                    DataPipeline = ppDBPipelineDL
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDL'
                    mmHeight = 4233
                    mmLeft = 26194
                    mmTop = 0
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppDBText164: TppDBText
                    UserName = 'DBText162'
                    DataField = 'CCPCANJE'
                    DataPipeline = ppDBPipelineDL
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDL'
                    mmHeight = 4233
                    mmLeft = 91017
                    mmTop = 0
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppDBText165: TppDBText
                    UserName = 'DBText163'
                    DataField = 'TCANJEID'
                    DataPipeline = ppDBPipelineDL
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDL'
                    mmHeight = 4233
                    mmLeft = 68792
                    mmTop = 0
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppDBText166: TppDBText
                    UserName = 'DBText140'
                    AutoSize = True
                    BlankWhenZero = True
                    DataField = 'DCCMTOEXT'
                    DataPipeline = ppDBPipelineDL
                    DisplayFormat = '#,0.00;-#,0.00'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDL'
                    mmHeight = 4233
                    mmLeft = 124884
                    mmTop = 0
                    mmWidth = 19050
                    BandType = 4
                  end
                  object ppDBText167: TppDBText
                    UserName = 'DBText141'
                    AutoSize = True
                    BlankWhenZero = True
                    DataField = 'DCCMTOLOC'
                    DataPipeline = ppDBPipelineDL
                    DisplayFormat = '#,0.00;-#,0.00'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDL'
                    mmHeight = 4233
                    mmLeft = 150019
                    mmTop = 0
                    mmWidth = 19050
                    BandType = 4
                  end
                  object ppDBText168: TppDBText
                    UserName = 'DBText168'
                    DataField = 'TMONABR'
                    DataPipeline = ppDBPipelineDL
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Draft 17cpi'
                    Font.Pitch = fpFixed
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppDBPipelineDL'
                    mmHeight = 4233
                    mmLeft = 111919
                    mmTop = 0
                    mmWidth = 7408
                    BandType = 4
                  end
                end
                object ppSummaryBand15: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
          end
          object ppSummaryBand16: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 10054
            mmPrintPosition = 0
            object ppLabel320: TppLabel
              UserName = 'Label295'
              Caption = 'Total Letras'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 25135
              mmTop = 3969
              mmWidth = 25400
              BandType = 7
            end
            object ppLabel321: TppLabel
              UserName = 'Label296'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '-------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 202407
              BandType = 7
            end
            object ppdbcCLL: TppDBCalc
              UserName = 'DBCalc20'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MTOLOC'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 96044
              mmTop = 3969
              mmWidth = 25400
              BandType = 7
            end
            object ppdbcSLL: TppDBCalc
              UserName = 'DBCalc21'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'SALLOC'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 118269
              mmTop = 3969
              mmWidth = 25400
              BandType = 7
            end
            object ppdbcPEL: TppDBCalc
              UserName = 'DBCalc22'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MTOEXT'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 145786
              mmTop = 3969
              mmWidth = 25400
              BandType = 7
            end
            object ppdbcSEL: TppDBCalc
              UserName = 'DBCalc23'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'SALEXT'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 4233
              mmLeft = 171186
              mmTop = 3969
              mmWidth = 25400
              BandType = 7
            end
          end
        end
      end
      object NP: TppSubReport
        UserName = 'NP'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = CL
        TraverseAllData = False
        DataPipelineName = 'ppdbpNoProv'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 17727
        mmWidth = 203200
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppdbpNoProv
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'CtaCteProv'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Template.FileName = 'C:\SOLEXes\SOLFormatos\CxP\Dema\CCProv.rtm'
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppdbpNoProv'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 22754
            mmPrintPosition = 0
            object ppLabel1: TppLabel
              UserName = 'Label1'
              Caption = 'Tipo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 2117
              mmTop = 14288
              mmWidth = 8467
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = 'Serie'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 10848
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              Caption = 'N'#186'Dcto'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 22225
              mmTop = 14288
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label4'
              Caption = 'F.Emisi'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 36513
              mmTop = 14288
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 'Mon'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 78052
              mmTop = 14288
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'D O C U M E N T O S'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 19050
              mmTop = 10319
              mmWidth = 40217
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'MONEDA NACIONAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 93134
              mmTop = 10319
              mmWidth = 31750
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label2502'
              Caption = 'Cargo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 93927
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Abono'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 112448
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Saldo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 128852
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Caption = 'MONEDA EXTRANJERA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 155046
              mmTop = 10319
              mmWidth = 35983
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Cargo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 150284
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Abono'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 168805
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Saldo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 187590
              mmTop = 14288
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 6350
              mmWidth = 203200
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 18521
              mmWidth = 203200
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 88371
              mmTop = 10319
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 88371
              mmTop = 12171
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'DOCUMENTOS NO PROVISIONADOS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 2381
              mmWidth = 57150
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'Label2010'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 529
              mmTop = 10319
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 529
              mmTop = 14552
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 143934
              mmTop = 10583
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label2901'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 143934
              mmTop = 14817
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel24: TppLabel
              UserName = 'Label24'
              Caption = 'F.Vcmto'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 58473
              mmTop = 14288
              mmWidth = 14817
              BandType = 1
            end
            object ppLabel28: TppLabel
              UserName = 'Label28'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 200819
              mmTop = 10583
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = '|'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 200819
              mmTop = 14817
              mmWidth = 2117
              BandType = 1
            end
          end
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'DOCABR'
              DataPipeline = ppdbpNoProv
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbpNoProv'
              mmHeight = 4233
              mmLeft = 529
              mmTop = 265
              mmWidth = 9525
              BandType = 4
            end
            object ppdbNPL: TppDBText
              UserName = 'dbNPL'
              BlankWhenZero = True
              DataField = 'MONTOMN'
              DataPipeline = ppdbpNoProv
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbpNoProv'
              mmHeight = 4233
              mmLeft = 107686
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'CPSERIE'
              DataPipeline = ppdbpNoProv
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbpNoProv'
              mmHeight = 4233
              mmLeft = 10848
              mmTop = 265
              mmWidth = 9525
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'CPNODOC'
              DataPipeline = ppdbpNoProv
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbpNoProv'
              mmHeight = 4233
              mmLeft = 21167
              mmTop = 265
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'CPFEMIS'
              DataPipeline = ppdbpNoProv
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbpNoProv'
              mmHeight = 4233
              mmLeft = 37306
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'CPFVCMTO'
              DataPipeline = ppdbpNoProv
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbpNoProv'
              mmHeight = 4233
              mmLeft = 57944
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'TMONABR'
              DataPipeline = ppdbpNoProv
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbpNoProv'
              mmHeight = 4233
              mmLeft = 76465
              mmTop = 265
              mmWidth = 9525
              BandType = 4
            end
            object ppdbNPE: TppDBText
              UserName = 'dbNPE'
              BlankWhenZero = True
              DataField = 'MONTOME'
              DataPipeline = ppdbpNoProv
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbpNoProv'
              mmHeight = 4233
              mmLeft = 165365
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 10319
            mmPrintPosition = 0
            object ppLabel25: TppLabel
              UserName = 'Label25'
              Caption = 'Total Facturaci'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 27252
              mmTop = 4498
              mmWidth = 35983
              BandType = 7
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 265
              mmTop = 265
              mmWidth = 203200
              BandType = 7
            end
            object ppdbcNPL: TppDBCalc
              UserName = 'dbcPLF1'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MONTOMN'
              DataPipeline = ppdbpNoProv
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbpNoProv'
              mmHeight = 4233
              mmLeft = 99484
              mmTop = 4498
              mmWidth = 25400
              BandType = 7
            end
            object ppdbcNPE: TppDBCalc
              UserName = 'dbcNPE'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MONTOME'
              DataPipeline = ppdbpNoProv
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbpNoProv'
              mmHeight = 4233
              mmLeft = 157163
              mmTop = 4498
              mmWidth = 25400
              BandType = 7
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand17: TppSummaryBand
      BeforePrint = ppSummaryBand17BeforePrint
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object ppLabel230: TppLabel
        UserName = 'Label230'
        Caption = 'RESUMEN DE SALDOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 116681
        mmTop = 3704
        mmWidth = 35983
        BandType = 7
      end
      object ppLabel324: TppLabel
        UserName = 'Label324'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 0
        mmWidth = 196321
        BandType = 7
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        AutoSize = False
        Caption = 'CARGO(M.N)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 72496
        mmTop = 7144
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel87: TppLabel
        UserName = 'Label87'
        AutoSize = False
        Caption = 'ABONO(M.N)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 93134
        mmTop = 7144
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel92: TppLabel
        UserName = 'Label92'
        AutoSize = False
        Caption = 'SALDO(M.N)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 113771
        mmTop = 7144
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel94: TppLabel
        UserName = 'Label94'
        Caption = 'Fac/Bol/N.Deb'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 10583
        mmWidth = 24077
        BandType = 7
      end
      object ppLabel97: TppLabel
        UserName = 'Label97'
        Caption = 'Letras'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 17992
        mmWidth = 11113
        BandType = 7
      end
      object ppvCLF: TppVariable
        UserName = 'vCLF'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 72496
        mmTop = 10583
        mmWidth = 20902
        BandType = 7
      end
      object ppvPLF: TppVariable
        UserName = 'vPLF'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 93134
        mmTop = 10583
        mmWidth = 20902
        BandType = 7
      end
      object ppvSLF: TppVariable
        UserName = 'vSLF'
        AutoSize = False
        CalcOrder = 2
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 113771
        mmTop = 10583
        mmWidth = 20902
        BandType = 7
      end
      object ppvCLL: TppVariable
        UserName = 'vCLL'
        AutoSize = False
        CalcOrder = 3
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 72496
        mmTop = 17992
        mmWidth = 20902
        BandType = 7
      end
      object ppvPLL: TppVariable
        UserName = 'vPLL'
        AutoSize = False
        CalcOrder = 4
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 93134
        mmTop = 17992
        mmWidth = 20902
        BandType = 7
      end
      object ppvSLL: TppVariable
        UserName = 'vSLL'
        AutoSize = False
        CalcOrder = 5
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 113771
        mmTop = 17992
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = 'TOTALES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 42333
        mmTop = 26458
        mmWidth = 12965
        BandType = 7
      end
      object ppvCLT: TppVariable
        UserName = 'vCLT'
        AutoSize = False
        CalcOrder = 6
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 72496
        mmTop = 26458
        mmWidth = 20902
        BandType = 7
      end
      object ppvPLT: TppVariable
        UserName = 'vPLT'
        AutoSize = False
        CalcOrder = 7
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 93134
        mmTop = 26458
        mmWidth = 20902
        BandType = 7
      end
      object ppvSLT: TppVariable
        UserName = 'vSLT'
        AutoSize = False
        CalcOrder = 8
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 113771
        mmTop = 26458
        mmWidth = 20902
        BandType = 7
      end
      object ppvCEF: TppVariable
        UserName = 'vCLF1'
        AutoSize = False
        CalcOrder = 9
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 134409
        mmTop = 10583
        mmWidth = 20902
        BandType = 7
      end
      object ppvPEF: TppVariable
        UserName = 'vPEF'
        AutoSize = False
        CalcOrder = 10
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 155046
        mmTop = 10583
        mmWidth = 20902
        BandType = 7
      end
      object ppvSEF: TppVariable
        UserName = 'vSEF'
        AutoSize = False
        CalcOrder = 11
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175684
        mmTop = 10583
        mmWidth = 20902
        BandType = 7
      end
      object ppvCEL: TppVariable
        UserName = 'vCEL'
        AutoSize = False
        CalcOrder = 12
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 134409
        mmTop = 17992
        mmWidth = 20902
        BandType = 7
      end
      object ppvPEL: TppVariable
        UserName = 'vPEL'
        AutoSize = False
        CalcOrder = 13
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 155046
        mmTop = 17992
        mmWidth = 20902
        BandType = 7
      end
      object ppvSEL: TppVariable
        UserName = 'vSEL'
        AutoSize = False
        CalcOrder = 14
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175684
        mmTop = 17992
        mmWidth = 20902
        BandType = 7
      end
      object ppvCET: TppVariable
        UserName = 'vCET'
        AutoSize = False
        CalcOrder = 15
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 134409
        mmTop = 26458
        mmWidth = 20902
        BandType = 7
      end
      object ppvPET: TppVariable
        UserName = 'vPET'
        AutoSize = False
        CalcOrder = 16
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 155046
        mmTop = 26458
        mmWidth = 20902
        BandType = 7
      end
      object ppvSET: TppVariable
        UserName = 'vSET'
        AutoSize = False
        CalcOrder = 17
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 175684
        mmTop = 26458
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        AutoSize = False
        Caption = 'CARGO(M.E)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 134409
        mmTop = 7144
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel101: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'ABONO(M.E)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 155046
        mmTop = 7144
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel102: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'SALDO(M.E)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 175684
        mmTop = 7144
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel123: TppLabel
        UserName = 'Label123'
        Caption = 'N. Cr'#233'dito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 14288
        mmWidth = 18521
        BandType = 7
      end
      object ppvCLN: TppVariable
        UserName = 'vCLA1'
        AutoSize = False
        CalcOrder = 18
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 72496
        mmTop = 14288
        mmWidth = 20902
        BandType = 7
      end
      object ppvPLN: TppVariable
        UserName = 'vPLA1'
        AutoSize = False
        CalcOrder = 19
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 93134
        mmTop = 14288
        mmWidth = 20902
        BandType = 7
      end
      object ppvSLN: TppVariable
        UserName = 'vSLA1'
        AutoSize = False
        CalcOrder = 20
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 113771
        mmTop = 14288
        mmWidth = 20902
        BandType = 7
      end
      object ppvCEN: TppVariable
        UserName = 'vCEA1'
        AutoSize = False
        CalcOrder = 21
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 134409
        mmTop = 14288
        mmWidth = 20902
        BandType = 7
      end
      object ppvPEN: TppVariable
        UserName = 'vPEA1'
        AutoSize = False
        CalcOrder = 22
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 155046
        mmTop = 14288
        mmWidth = 20902
        BandType = 7
      end
      object ppvSEN: TppVariable
        UserName = 'vSEA1'
        AutoSize = False
        CalcOrder = 23
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175684
        mmTop = 14288
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'No Provisionados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 21696
        mmWidth = 29633
        BandType = 7
      end
      object ppvCLNP: TppVariable
        UserName = 'vCLL1'
        AutoSize = False
        CalcOrder = 24
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 72496
        mmTop = 21696
        mmWidth = 20902
        BandType = 7
      end
      object ppvPLNP: TppVariable
        UserName = 'vPLL1'
        AutoSize = False
        CalcOrder = 25
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 93134
        mmTop = 21696
        mmWidth = 20902
        BandType = 7
      end
      object ppvSLNP: TppVariable
        UserName = 'vSLL1'
        AutoSize = False
        CalcOrder = 26
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 113771
        mmTop = 21696
        mmWidth = 20902
        BandType = 7
      end
      object ppvCENP: TppVariable
        UserName = 'vCEL1'
        AutoSize = False
        CalcOrder = 27
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 134409
        mmTop = 21696
        mmWidth = 20902
        BandType = 7
      end
      object ppvPENP: TppVariable
        UserName = 'vPEL1'
        AutoSize = False
        CalcOrder = 28
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 155046
        mmTop = 21696
        mmWidth = 20902
        BandType = 7
      end
      object ppvSENP: TppVariable
        UserName = 'vSEL1'
        AutoSize = False
        CalcOrder = 29
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175684
        mmTop = 21696
        mmWidth = 20902
        BandType = 7
      end
    end
  end
  object ppdbpNoProv: TppDBPipeline
    DataSource = DMCXP.dsQry16
    UserName = 'dbpNoProv'
    Left = 740
    Top = 466
  end
end
