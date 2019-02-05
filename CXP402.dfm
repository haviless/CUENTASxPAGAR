object FRegComprasPLE: TFRegComprasPLE
  Left = 219
  Top = 214
  Width = 857
  Height = 439
  Caption = 'Exportaci'#243'n del Registro de Compras al PLE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bbtnGenExport: TBitBtn
    Left = 766
    Top = 362
    Width = 30
    Height = 25
    Hint = 'Genera Exportable para el PLE'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = bbtnGenExportClick
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
  object bbtnRegCanc: TBitBtn
    Left = 798
    Top = 362
    Width = 30
    Height = 25
    Hint = 'Cancela Actualizaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = bbtnRegCancClick
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
  object prgb_Progreso: TProgressBar
    Left = 21
    Top = 367
    Width = 676
    Height = 17
    TabOrder = 2
  end
  object dbgRegCompPLE: TwwDBGrid
    Left = 8
    Top = 56
    Width = 817
    Height = 297
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ReadOnly = True
    TabOrder = 3
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = True
    OnTitleButtonClick = dbgRegCompPLETitleButtonClick
    OnDblClick = dbgRegCompPLEDblClick
    object dbgRegCompPLEIButton: TwwIButton
      Left = 0
      Top = 0
      Width = 32
      Height = 29
      AllowAllUp = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = dbgRegCompPLEIButtonClick
    end
  end
  object bbtnValida: TBitBtn
    Left = 729
    Top = 362
    Width = 30
    Height = 25
    Hint = 'Valida los datos de la Grilla'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = bbtnValidaClick
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
  object bbtnResumenxCia: TBitBtn
    Left = 32
    Top = 16
    Width = 155
    Height = 25
    Caption = 'Resumen por Cia'
    TabOrder = 5
    OnClick = bbtnResumenxCiaClick
  end
  object btnExportarExcel: TBitBtn
    Left = 767
    Top = 15
    Width = 35
    Height = 27
    Hint = 'Exportar a Excel'
    TabOrder = 6
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
  object bbtnDuplica: TBitBtn
    Left = 336
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Duplica'
    TabOrder = 7
    Visible = False
    OnClick = bbtnDuplicaClick
  end
  object bbtnRenumera: TBitBtn
    Left = 432
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Renumera'
    TabOrder = 8
    Visible = False
    OnClick = bbtnRenumeraClick
  end
  object dbgExporta: TDBGrid
    Left = 8
    Top = 352
    Width = 41
    Height = 33
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object cbDiseno: TCheckBox
    Left = 192
    Top = 24
    Width = 15
    Height = 17
    TabOrder = 10
  end
  object BitBtn1: TBitBtn
    Left = 544
    Top = 16
    Width = 129
    Height = 25
    Caption = 'Compara Registros'
    TabOrder = 11
    Visible = False
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 686
    Top = 16
    Width = 75
    Height = 25
    Caption = 'BitBtn2'
    TabOrder = 12
    Visible = False
    OnClick = BitBtn2Click
  end
  object rgTam: TRadioGroup
    Left = 218
    Top = 7
    Width = 111
    Height = 48
    ItemIndex = 0
    Items.Strings = (
      'Domiciliados'
      'No Domiciliados')
    TabOrder = 13
  end
  object sdNombreArchivo: TSaveDialog
    DefaultExt = 'slk'
    Left = 760
    Top = 310
  end
  object ppdbRegCompPLE: TppDBPipeline
    UserName = 'dbRegCompPLE'
    Left = 35
    Top = 34
  end
  object pprRegCompPLE: TppReport
    AutoStop = False
    DataPipeline = ppdbRegCompPLE
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rRCompras'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 10500
    PrinterSetup.mmMarginRight = 500
    PrinterSetup.mmMarginTop = 5000
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DemaExes\RTMS\OP\Dema\RegCompPLE_Resumen.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 68
    Top = 34
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbRegCompPLE'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'RESUMEN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 5408
        mmTop = 4498
        mmWidth = 17526
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'NO GRAVADAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 58738
        mmTop = 16404
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'ADQ.GRAV P/OP NO GRAV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 83608
        mmTop = 11642
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'MIXTAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 123296
        mmTop = 16404
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'GRAVADAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 141817
        mmTop = 16404
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'IGV 18%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 168275
        mmTop = 12171
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'IGV 18% MIXTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 179652
        mmTop = 12171
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'IGV 18% GASTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 208492
        mmTop = 12171
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 266701
        mmTop = 16404
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'OTROS CARGOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 226219
        mmTop = 16404
        mmWidth = 23283
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2381
        mmTop = 21431
        mmWidth = 275167
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'ADQNOGRAV'
        DataPipeline = ppdbRegCompPLE
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRegCompPLE'
        mmHeight = 3175
        mmLeft = 51594
        mmTop = 3704
        mmWidth = 27781
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'IMPTOTAL'
        DataPipeline = ppdbRegCompPLE
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRegCompPLE'
        mmHeight = 3175
        mmLeft = 252148
        mmTop = 3704
        mmWidth = 23548
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'BASIMPMIX'
        DataPipeline = ppdbRegCompPLE
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRegCompPLE'
        mmHeight = 3175
        mmLeft = 108479
        mmTop = 3704
        mmWidth = 25135
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'BASIMPGAS'
        DataPipeline = ppdbRegCompPLE
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRegCompPLE'
        mmHeight = 3175
        mmLeft = 79904
        mmTop = 3704
        mmWidth = 26194
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'BASIMP'
        DataPipeline = ppdbRegCompPLE
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRegCompPLE'
        mmHeight = 3175
        mmLeft = 137319
        mmTop = 3704
        mmWidth = 20108
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2381
        mmTop = 1058
        mmWidth = 275167
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'IMPOTROS'
        DataPipeline = ppdbRegCompPLE
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRegCompPLE'
        mmHeight = 3175
        mmLeft = 224896
        mmTop = 3704
        mmWidth = 24342
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc16'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'IGV'
        DataPipeline = ppdbRegCompPLE
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRegCompPLE'
        mmHeight = 3175
        mmLeft = 162984
        mmTop = 3704
        mmWidth = 14288
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc17'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'IGVMIX'
        DataPipeline = ppdbRegCompPLE
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRegCompPLE'
        mmHeight = 3175
        mmLeft = 178859
        mmTop = 3704
        mmWidth = 19050
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc18'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'IGVGAS'
        DataPipeline = ppdbRegCompPLE
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRegCompPLE'
        mmHeight = 3175
        mmLeft = 202407
        mmTop = 3704
        mmWidth = 20108
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CIAID'
      DataPipeline = ppdbRegCompPLE
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbRegCompPLE'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'ADQNOGRAV'
          DataPipeline = ppdbRegCompPLE
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRegCompPLE'
          mmHeight = 3175
          mmLeft = 51594
          mmTop = 0
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CIAID'
          DataPipeline = ppdbRegCompPLE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbRegCompPLE'
          mmHeight = 3260
          mmLeft = 5556
          mmTop = 0
          mmWidth = 6615
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'IMPTOTAL'
          DataPipeline = ppdbRegCompPLE
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRegCompPLE'
          mmHeight = 3175
          mmLeft = 252148
          mmTop = 0
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'BASIMPMIX'
          DataPipeline = ppdbRegCompPLE
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRegCompPLE'
          mmHeight = 3175
          mmLeft = 108479
          mmTop = 0
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'BASIMPGAS'
          DataPipeline = ppdbRegCompPLE
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRegCompPLE'
          mmHeight = 3175
          mmLeft = 79904
          mmTop = 0
          mmWidth = 26194
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'BASIMP'
          DataPipeline = ppdbRegCompPLE
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRegCompPLE'
          mmHeight = 3175
          mmLeft = 137319
          mmTop = 0
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'IGV'
          DataPipeline = ppdbRegCompPLE
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRegCompPLE'
          mmHeight = 3175
          mmLeft = 162984
          mmTop = 0
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'IGVMIX'
          DataPipeline = ppdbRegCompPLE
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRegCompPLE'
          mmHeight = 3175
          mmLeft = 178859
          mmTop = 0
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'IGVGAS'
          DataPipeline = ppdbRegCompPLE
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRegCompPLE'
          mmHeight = 3175
          mmLeft = 202407
          mmTop = 0
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'IMPOTROS'
          DataPipeline = ppdbRegCompPLE
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRegCompPLE'
          mmHeight = 3175
          mmLeft = 224896
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
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
    Report = pprRegCompPLE
    IniStorageType = 'IniFile'
    IniStorageName = 'C:\DemaExes\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 139
    Top = 34
  end
end
