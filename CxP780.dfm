object FToolLetPend: TFToolLetPend
  Left = 129
  Top = 143
  Width = 701
  Height = 99
  Caption = 'FToolLetPend'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLet: TPanel
    Left = 1
    Top = 1
    Width = 688
    Height = 60
    Color = 14869218
    TabOrder = 0
    object SpeedButton3: TSpeedButton
      Left = 637
      Top = 10
      Width = 39
      Height = 41
      Hint = 'Impresi'#243'n  de Letras'
      Flat = True
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
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton3Click
    end
    object gbProv: TGroupBox
      Left = 343
      Top = 2
      Width = 230
      Height = 53
      TabOrder = 1
      object Label6: TLabel
        Left = 83
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
        Left = 140
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
        Left = 76
        Top = 24
        Width = 49
        Height = 21
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CLAUXID'#9'2'#9'Id.'#9'F'
          'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
        LookupTable = DMCXP.cdsClAux
        LookupField = 'CLAUXID'
        Options = [loColLines, loRowLines, loTitles]
        DropDownCount = 15
        Enabled = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcClAuxExit
      end
      object dblcdProv: TwwDBLookupComboDlg
        Left = 131
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
        LookupTable = DMCXP.cdsProv
        LookupField = 'PROV'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        Enabled = False
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
        Width = 57
        Height = 17
        Caption = 'Todos'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = chkTodosClick
      end
    end
    object gbCia: TGroupBox
      Left = 8
      Top = 3
      Width = 328
      Height = 52
      Color = 14869218
      ParentColor = False
      TabOrder = 0
      object lblCia: TLabel
        Left = 7
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
      object Label2: TLabel
        Left = 214
        Top = 7
        Width = 99
        Height = 16
        Caption = 'Fecha Vencimiento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblcCia: TwwDBLookupCombo
        Left = 7
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
        LookupTable = DMCXP.cdsCia
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
        Left = 50
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
        TabOrder = 1
      end
      object dbdtpFecVenc: TwwDBDateTimePicker
        Left = 213
        Top = 23
        Width = 105
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 2
      end
    end
  end
  object ppDBLetras: TppDBPipeline
    UserName = 'DBLetras'
    Left = 377
    Top = 17
  end
  object ppRLetras: TppReport
    AutoStop = False
    DataPipeline = ppDBLetras
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SOLFormatos\CxP\Incoresa\LetPend.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 393
    Top = 17
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBLetras'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 1852
        mmWidth = 10054
        BandType = 0
      end
      object pplblFecha: TppLabel
        UserName = 'lblFecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 6615
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Registro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 20638
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Nro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 28840
        mmTop = 15346
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Letra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 27781
        mmTop = 20638
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'F.Vcmto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 50271
        mmTop = 20638
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Girador'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 71438
        mmTop = 20638
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'N'#176
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 113771
        mmTop = 15346
        mmWidth = 3704
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Fact'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 112713
        mmTop = 20638
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Soles'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 135467
        mmTop = 20638
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Dolares'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 150284
        mmTop = 20638
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Euros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 172773
        mmTop = 20638
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 191294
        mmTop = 15346
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Soles'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 191294
        mmTop = 20638
        mmWidth = 9260
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2910
        mmTop = 25400
        mmWidth = 197644
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'LETRAS PENDIENTES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 67733
        mmTop = 6615
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Usuario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 156898
        mmTop = 6615
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'P'#225'gina :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 156898
        mmTop = 1852
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 172244
        mmTop = 1852
        mmWidth = 1852
        BandType = 0
      end
      object pplblUser: TppLabel
        UserName = 'lblUser'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 172244
        mmTop = 6615
        mmWidth = 22225
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CPNOREG'
        DataPipeline = ppDBLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBLetras'
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 265
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CPNODOC'
        DataPipeline = ppDBLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBLetras'
        mmHeight = 3969
        mmLeft = 15081
        mmTop = 265
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PROVDES'
        DataPipeline = ppDBLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBLetras'
        mmHeight = 3969
        mmLeft = 65088
        mmTop = 265
        mmWidth = 34396
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CPFVCMTO'
        DataPipeline = ppDBLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBLetras'
        mmHeight = 3969
        mmLeft = 45773
        mmTop = 265
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MTOEXT'
        DataPipeline = ppDBLetras
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBLetras'
        mmHeight = 3969
        mmLeft = 145257
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'MTOEURO'
        DataPipeline = ppDBLetras
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBLetras'
        mmHeight = 3969
        mmLeft = 164042
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'SOLOSOLES'
        DataPipeline = ppDBLetras
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBLetras'
        mmHeight = 3969
        mmLeft = 182563
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'MTOLOC'
        DataPipeline = ppDBLetras
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBLetras'
        mmHeight = 3969
        mmLeft = 126736
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'OBSERVACION'
        DataPipeline = ppDBLetras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBLetras'
        mmHeight = 3969
        mmLeft = 100013
        mmTop = 265
        mmWidth = 25400
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'ppDBText6'
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'ppDBText10'
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'CPMM'
          DataPipeline = ppDBLetras
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBLetras'
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 1588
          mmWidth = 8467
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'CPAAAA'
          DataPipeline = ppDBLetras
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBLetras'
          mmHeight = 3969
          mmLeft = 32015
          mmTop = 1588
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 2646
          mmTop = 529
          mmWidth = 198438
          BandType = 3
          GroupNo = 1
        end
        object ppVMes: TppVariable
          UserName = 'VMes'
          CalcOrder = 0
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          OnCalc = ppVMesCalc
          Transparent = True
          mmHeight = 3969
          mmLeft = 12700
          mmTop = 1588
          mmWidth = 7408
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'MTOLOC'
          DataPipeline = ppDBLetras
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBLetras'
          mmHeight = 3969
          mmLeft = 126736
          mmTop = 1058
          mmWidth = 17992
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'MTOEXT'
          DataPipeline = ppDBLetras
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBLetras'
          mmHeight = 3969
          mmLeft = 145257
          mmTop = 1058
          mmWidth = 17992
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'MTOEURO'
          DataPipeline = ppDBLetras
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBLetras'
          mmHeight = 3969
          mmLeft = 164042
          mmTop = 1058
          mmWidth = 17992
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'SOLOSOLES'
          DataPipeline = ppDBLetras
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBLetras'
          mmHeight = 3969
          mmLeft = 182563
          mmTop = 1058
          mmWidth = 17992
          BandType = 5
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 125413
          mmTop = 529
          mmWidth = 75671
          BandType = 5
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Total:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 75936
          mmTop = 1058
          mmWidth = 11113
          BandType = 5
          GroupNo = 1
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'CPAAAA'
          DataPipeline = ppDBLetras
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBLetras'
          mmHeight = 3969
          mmLeft = 106892
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppVariable1: TppVariable
          UserName = 'VMes1'
          CalcOrder = 0
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          OnCalc = ppVMesCalc
          Transparent = True
          mmHeight = 3969
          mmLeft = 87577
          mmTop = 1058
          mmWidth = 7408
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'ppDBText11'
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'CPSS'
          DataPipeline = ppDBLetras
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBLetras'
          mmHeight = 3969
          mmLeft = 17198
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 2
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'Semana:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 0
          mmWidth = 12965
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 576
    Top = 8
  end
end
