object FToolRetPend: TFToolRetPend
  Left = 229
  Top = 176
  Width = 800
  Height = 121
  Caption = 'FToolRetPend'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLet: TPanel
    Left = 1
    Top = 1
    Width = 780
    Height = 60
    Color = 14869218
    TabOrder = 0
    object sbDisenoRep: TSpeedButton
      Left = 3
      Top = 32
      Width = 8
      Height = 22
      Flat = True
      OnClick = sbDisenoRepClick
    end
    object gbProv: TGroupBox
      Left = 313
      Top = 2
      Width = 259
      Height = 53
      TabOrder = 1
      object Label6: TLabel
        Left = 50
        Top = 6
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
        Left = 112
        Top = 6
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
      object dblcClAux: TwwDBLookupCombo
        Left = 43
        Top = 24
        Width = 49
        Height = 21
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CLAUXID'#9'2'#9'Id.'#9'F'
          'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
        LookupField = 'CLAUXID'
        Options = [loColLines, loRowLines, loTitles]
        DropDownCount = 15
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcClAuxExit
      end
      object dblcdProv: TwwDBLookupComboDlg
        Left = 103
        Top = 22
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
        LookupField = 'PROV'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 10
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object chkTodos: TCheckBox
        Left = 12
        Top = 24
        Width = 25
        Height = 17
        Caption = 'Todos'
        TabOrder = 0
        Visible = False
        OnClick = chkTodosClick
      end
    end
    object gbCia: TGroupBox
      Left = 12
      Top = 2
      Width = 293
      Height = 52
      TabOrder = 0
      object lblCia: TLabel
        Left = 12
        Top = 7
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
      object Label1: TLabel
        Left = 230
        Top = 7
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
      object dblcCia: TwwDBLookupCombo
        Left = 12
        Top = 23
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
        OnNotInList = dblcCiaNotInList
      end
      object edtCia: TEdit
        Left = 55
        Top = 23
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
        TabOrder = 2
      end
      object seAno: TSpinEdit
        Left = 224
        Top = 23
        Width = 58
        Height = 22
        MaxLength = 4
        MaxValue = 2100
        MinValue = 2000
        TabOrder = 1
        Value = 2011
      end
    end
    object bbtnCertificado: TBitBtn
      Left = 522
      Top = 10
      Width = 40
      Height = 40
      Hint = 'Certificado de Renta de Cuarta'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnCertificadoClick
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
    object GroupBox1: TGroupBox
      Left = 586
      Top = 1
      Width = 177
      Height = 53
      Caption = 'Mensual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object bbtnMensual: TBitBtn
        Left = 124
        Top = 9
        Width = 40
        Height = 40
        Hint = 'Reporte Mensual de Retenciones'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnMensualClick
        Glyph.Data = {
          CE020000424DCE020000000000007600000028000000220000001E0000000100
          04000000000058020000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFF0078800FFFFFFFFFFFFFFFF000000FFFFFFFFF00777888800
          FFFFFFFFFFFFFF000000FFFFFFF007777800888800FFFFFFFFFFFF000000FFFF
          F0077778878800888800FFFFFFFFFF000000FFF00777788787888800888800FF
          FFFFFF000000FF07777887778788888800888800FFFFFF000000FF8778877777
          87888888880088880FFFFF000000FF888777777787888888888800880FFFFF00
          0000F8878777777787888888888888000FFFFF000000F8F7877777778F888888
          8888888800FFFF000000F8F78777777F8877888888888888800FFF000000F8F7
          87777FF777887788888888888080FF000000F8F7877FF7777777887788888888
          80780F000000F8F78FF77799778877887788888880788F000000F8FF8877AA77
          8877777088778888808FFF000000F88F778877887777700F7088778880FFFF00
          0000FFF88F77888877700FFFF077887780FFFF000000FFFFF88F7788800FFFCC
          F7087788FFFFFF000000FFFFFFF88F7788FFCCFFFF0888FFFFFFFF000000FFFF
          FFFFF88F778FFFFCCF70FFFFFFFFFF000000FFFFFFFFFFF88F8FFCCFFFF70FFF
          FFFFFF000000FFFFFFFFFFFFF888FFFFCCFF70FFFFFFFF000000FFFFFFFFFFFF
          FFF8FFCCFFFFF70FFFFFFF000000FFFFFFFFFFFFFFFF8FFFFFCCFF700FFFFF00
          0000FFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFF000000FFFFFFFFFFFFFFFFFF8F
          FFFFF88FFFFFFF000000FFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFF888FFFFFFFFFFF000000}
      end
      object seAno2: TSpinEdit
        Left = 13
        Top = 21
        Width = 55
        Height = 24
        AutoSelect = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxValue = 2100
        MinValue = 2000
        ParentFont = False
        TabOrder = 1
        Value = 2011
      end
      object seMes2: TSpinEdit
        Left = 73
        Top = 21
        Width = 43
        Height = 24
        AutoSelect = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        MaxValue = 12
        MinValue = 1
        ParentFont = False
        TabOrder = 2
        Value = 1
        OnExit = seMes2Exit
      end
    end
    object cbDisenoRep: TCheckBox
      Left = 305
      Top = 0
      Width = 97
      Height = 17
      Caption = 'Dise'#241'o Rep'
      TabOrder = 4
      Visible = False
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 656
    Top = 64
  end
  object ppdb1: TppDBPipeline
    UserName = 'db1'
    Left = 688
    Top = 64
  end
  object ppr1: TppReport
    AutoStop = False
    DataPipeline = ppdb1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\OP\Dema\Retenciones4taSunat.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 728
    Top = 64
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdb1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'CIAID'
        DataPipeline = ppdb1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 2879
        mmLeft = 10319
        mmTop = 0
        mmWidth = 2709
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CPNOREG'
        DataPipeline = ppdb1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 2879
        mmLeft = 15346
        mmTop = 0
        mmWidth = 13547
        BandType = 4
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppdb1
        DisplayFormat = '####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppdb1'
        mmHeight = 2879
        mmLeft = 1323
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CPFEMIS'
        DataPipeline = ppdb1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 2879
        mmLeft = 31221
        mmTop = 0
        mmWidth = 12192
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'PROV'
        DataPipeline = ppdb1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 2879
        mmLeft = 45508
        mmTop = 0
        mmWidth = 7197
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PROVDES'
        DataPipeline = ppdb1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 2879
        mmLeft = 54504
        mmTop = 0
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'TOTMN'
        DataPipeline = ppdb1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 2879
        mmLeft = 180446
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'IESMN'
        DataPipeline = ppdb1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 2879
        mmLeft = 165894
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'BASEMN'
        DataPipeline = ppdb1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 2879
        mmLeft = 133350
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CUARMN'
        DataPipeline = ppdb1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 2879
        mmLeft = 151342
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'CPTOID'
        DataPipeline = ppdb1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 2879
        mmLeft = 89694
        mmTop = 0
        mmWidth = 6773
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DCPGLOSA'
        DataPipeline = ppdb1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 2910
        mmLeft = 98161
        mmTop = 0
        mmWidth = 33338
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppd1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppr1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 760
    Top = 64
  end
end
