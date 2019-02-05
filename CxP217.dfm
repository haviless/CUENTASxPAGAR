object FDetAmo: TFDetAmo
  Left = 194
  Top = 108
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Detalle de Amortizaciones'
  ClientHeight = 573
  ClientWidth = 792
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHEAD: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 111
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel2: TBevel
      Left = 2
      Top = 4
      Width = 786
      Height = 101
      Shape = bsFrame
    end
    object Label11: TLabel
      Left = 10
      Top = 15
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object lblTipCam: TLabel
      Left = 506
      Top = 59
      Width = 35
      Height = 13
      Caption = 'Importe'
    end
    object Label4: TLabel
      Left = 620
      Top = 59
      Width = 27
      Height = 13
      Caption = 'Saldo'
    end
    object Label1: TLabel
      Left = 275
      Top = 59
      Width = 24
      Height = 13
      Caption = 'Serie'
    end
    object Label2: TLabel
      Left = 10
      Top = 59
      Width = 79
      Height = 13
      Caption = 'Tipo Documento'
    end
    object Label3: TLabel
      Left = 337
      Top = 59
      Width = 85
      Height = 13
      Caption = 'N'#186' de Documento'
    end
    object Label5: TLabel
      Left = 447
      Top = 59
      Width = 39
      Height = 13
      Caption = 'Moneda'
    end
    object Z2bbtnAceptar: TBitBtn
      Left = 748
      Top = 64
      Width = 32
      Height = 32
      Default = True
      TabOrder = 0
      Visible = False
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
    object dblcCLIE: TwwDBLookupComboDlg
      Left = 10
      Top = 32
      Width = 79
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CLIEID'#9'8'#9'C'#243'digo'#9'F'
        'CLIEDES'#9'40'#9'Descripci'#243'n'#9'F'
        'CLIEABR'#9'15'#9'Abreviatura'#9'F')
      LookupField = 'CLIEID'
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dblcCLIEChange
    end
    object dbeCLIE: TwwDBEdit
      Left = 91
      Top = 32
      Width = 238
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object stt1: TStaticText
      Left = 505
      Top = 76
      Width = 113
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
    object stt2: TStaticText
      Left = 622
      Top = 76
      Width = 113
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 4
    end
    object dblcSER: TwwDBLookupCombo
      Left = 275
      Top = 76
      Width = 59
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SERIEID'#9'2'#9'C'#243'digo'#9'F'
        'SERIEDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupField = 'SERIEID'
      Options = [loColLines, loTitles]
      Color = clBtnFace
      Enabled = False
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dblcSERChange
    end
    object dblcTDOC: TwwDBLookupCombo
      Left = 10
      Top = 76
      Width = 59
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DOCID'#9'2'#9'C'#243'digo'#9'F'
        'DOCDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMCXP.cdsTDoc
      LookupField = 'DOCID'
      Options = [loColLines, loTitles]
      Color = clMenu
      Enabled = False
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dblcTDOCChange
    end
    object dbeTDOC: TwwDBEdit
      Left = 72
      Top = 76
      Width = 199
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNDOC: TwwDBEdit
      Left = 335
      Top = 76
      Width = 109
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object stMoneda: TStaticText
      Left = 448
      Top = 76
      Width = 54
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 9
    end
  end
  object dbgEst4: TwwDBGrid
    Left = 0
    Top = 133
    Width = 792
    Height = 399
    DisableThemesInTitle = False
    Selected.Strings = (
      'CCPFCJE'#9'10'#9'Fecha de~Pago'#9'F'
      'DOCABR'#9'8'#9'Tipo~Doc'#9'F'
      'CPSERIE2'#9'5'#9'No.~Serie'#9'F'
      'CPNODOC2'#9'20'#9'No.~Documento'#9'F'
      'TCANJEID'#9'2'#9'Tipo de~Canje'#9'F'
      'CCPCANJE'#9'6'#9'No. de~Canje'#9'F'
      'TMONABR'#9'8'#9'TM'#9'F'
      'DCDMOLOC'#9'10'#9'Monto~M.N.'#9'F'
      'DCDMOEXT'#9'10'#9'Monto~M.E.'#9'T')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = DMCXP.dsQry3
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
    TabOrder = 1
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 3
    TitleButtons = False
    UseTFields = False
    OnEnter = dbgEst4Enter
  end
  object pnlFOOT: TPanel
    Left = 0
    Top = 532
    Width = 792
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Z2bbtnCancel: TBitBtn
      Left = 756
      Top = 5
      Width = 32
      Height = 32
      Cancel = True
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
      Left = 719
      Top = 5
      Width = 32
      Height = 32
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 111
    Width = 792
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Detalle de Amortizaciones'
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline
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
    Template.FileName = 'C:\SOLCxC\Cliente\estc01.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 720
    Top = 448
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 50800
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
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
      object pplCia: TppLabel
        UserName = 'lCia'
        Caption = 'Compa'#241#237'a'
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
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel16: TppLabel
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
      object ppLabel17: TppLabel
        UserName = 'Label17'
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
      object ppLabel8: TppLabel
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
      object ppLabel9: TppLabel
        UserName = 'Label9'
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
      object ppLabel19: TppLabel
        UserName = 'Label19'
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
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
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
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
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
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
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
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 12700
        mmWidth = 10319
        BandType = 0
      end
      object pplblCliente: TppLabel
        UserName = 'lblCliente'
        AutoSize = False
        Caption = 'lblCliente'
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
      object ppLabel15: TppLabel
        UserName = 'Label15'
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
        Caption = 'lblTDoc'
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
      object ppLabel21: TppLabel
        UserName = 'Label21'
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
        UserName = 'Label201'
        AutoSize = False
        Caption = 'Label201'
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
      object ppLabel23: TppLabel
        UserName = 'Label23'
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
        Caption = 'Label202'
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
      object ppLabel25: TppLabel
        UserName = 'Label25'
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
        Caption = 'Label203'
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
      object ppLabel27: TppLabel
        UserName = 'Label27'
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
        Caption = 'Label204'
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
      object ppLabel29: TppLabel
        UserName = 'Label29'
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
        Caption = 'Label205'
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
        Caption = 'lblCliente'
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
      object ppLabel13: TppLabel
        UserName = 'Label13'
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
      object ppLabel20: TppLabel
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
      object ppLabel22: TppLabel
        UserName = 'Label22'
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
      object ppLabel2: TppLabel
        UserName = 'Label2'
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
      object ppLabel3: TppLabel
        UserName = 'Label3'
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
      object ppLabel5: TppLabel
        UserName = 'Label5'
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
      object ppLabel4: TppLabel
        UserName = 'Label4'
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
      object ppLabel6: TppLabel
        UserName = 'Label6'
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
      object ppLabel7: TppLabel
        UserName = 'Label7'
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
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CCPFCJE'
        DataPipeline = ppDBPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DOCABR'
        DataPipeline = ppDBPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 0
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CPSERIE2'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 56356
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CPNODOC2'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 71173
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TCANJEID'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 94721
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CCPCANJE'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DCDMOEXT'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DCDMOLOC'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TMONABR'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 134673
        mmTop = 0
        mmWidth = 12171
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
      mmHeight = 9525
      mmPrintPosition = 0
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'DCDMOLOC'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 3440
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'DCDMOEXT'
        DataPipeline = ppDBPipeline
        DisplayFormat = '### ### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 3440
        mmWidth = 23019
        BandType = 7
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
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
  object ppDBPipeline: TppDBPipeline
    DataSource = DMCXP.dsQry3
    UserName = 'DBPipeline'
    Left = 720
    Top = 408
  end
end
