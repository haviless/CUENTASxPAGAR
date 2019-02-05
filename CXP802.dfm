object FToolCtaCte: TFToolCtaCte
  Left = 0
  Top = 159
  Width = 836
  Height = 109
  Caption = 'FToolCtaCte'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 828
    Height = 82
    Align = alClient
    BevelInner = bvRaised
    Color = 14869218
    TabOrder = 0
    object Label11: TLabel
      Left = 15
      Top = 18
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 275
      Top = 19
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
    object dblcCia: TwwDBLookupCombo
      Left = 14
      Top = 35
      Width = 46
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
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
      Style = csDropDownList
      DropDownCount = 15
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
    end
    object dbeCIA: TwwDBEdit
      Left = 62
      Top = 35
      Width = 180
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnEjecuta: TBitBtn
      Left = 699
      Top = 27
      Width = 39
      Height = 41
      Hint = 'Filtrar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
    object seAno: TSpinEdit
      Left = 251
      Top = 35
      Width = 53
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
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
      Left = 307
      Top = 35
      Width = 40
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 4
      Value = 0
    end
    object BitBtn1: TBitBtn
      Left = 745
      Top = 27
      Width = 39
      Height = 41
      Hint = 'Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn1Click
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
    object GroupBox1: TGroupBox
      Left = 354
      Top = 6
      Width = 334
      Height = 71
      Caption = 'Criterios de Recuperaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object Label2: TLabel
        Left = 267
        Top = 24
        Width = 30
        Height = 13
        Caption = 'Monto'
      end
      object RbTodos: TRadioButton
        Left = 8
        Top = 20
        Width = 54
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RbTodosClick
      end
      object RbFiltrar1: TRadioButton
        Left = 9
        Top = 45
        Width = 29
        Height = 17
        Caption = '>'
        TabOrder = 1
        OnClick = RbFiltrar1Click
      end
      object edtMonto: TEdit
        Left = 246
        Top = 41
        Width = 78
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object RbFiltrar2: TRadioButton
        Left = 46
        Top = 45
        Width = 39
        Height = 17
        Caption = '>='
        TabOrder = 3
        OnClick = RbFiltrar2Click
      end
      object RbFiltrar3: TRadioButton
        Left = 88
        Top = 45
        Width = 33
        Height = 17
        Caption = '='
        TabOrder = 4
        OnClick = RbFiltrar3Click
      end
      object RbFiltrar4: TRadioButton
        Left = 122
        Top = 45
        Width = 38
        Height = 17
        Caption = '<='
        TabOrder = 5
        OnClick = RbFiltrar4Click
      end
      object RbFiltrar5: TRadioButton
        Left = 163
        Top = 45
        Width = 33
        Height = 17
        Caption = '<'
        TabOrder = 6
        OnClick = RbFiltrar5Click
      end
      object RbFiltrar6: TRadioButton
        Left = 202
        Top = 45
        Width = 37
        Height = 17
        Caption = '<>'
        TabOrder = 7
        OnClick = RbFiltrar6Click
      end
    end
  end
  object pprCtaCteProv: TppReport
    AutoStop = False
    DataPipeline = ppdbCtaCteProv
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
    Template.FileName = 'C:\SOLExes\SOLFormatos\CxP\SACSA\CtaCteProv.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 168
    Top = 16
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbCtaCteProv'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'ESTADO DE CUENTA DE PROVEEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 64558
        mmTop = 11113
        mmWidth = 57415
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 3175
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'P'#225'gina : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 13494
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Hora : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 8467
        mmWidth = 9260
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 180446
        mmTop = 3175
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 8467
        mmWidth = 16933
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 193675
        mmTop = 13494
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 17198
        mmTop = 26458
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'C'#243'digo '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 4763
        mmTop = 32015
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Descripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 28310
        mmTop = 32015
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Saldos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 127794
        mmTop = 26458
        mmWidth = 9525
        BandType = 0
      end
      object pplblciades: TppLabel
        UserName = 'lblciades'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 8467
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Anterior (S/.)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 93134
        mmTop = 32015
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Anterior ($/.)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 122238
        mmTop = 32015
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Actual (S/.)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 152400
        mmTop = 32015
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label101'
        Caption = 'Actual($/.)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 179123
        mmTop = 32015
        mmWidth = 15346
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PROV'
        DataPipeline = ppdbCtaCteProv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCtaCteProv'
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PROVDES'
        DataPipeline = ppdbCtaCteProv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCtaCteProv'
        mmHeight = 3969
        mmLeft = 24606
        mmTop = 1058
        mmWidth = 59002
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'SALDSANTME'
        DataPipeline = ppdbCtaCteProv
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCteProv'
        mmHeight = 3969
        mmLeft = 120915
        mmTop = 1058
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'SALDSANTMN'
        DataPipeline = ppdbCtaCteProv
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCteProv'
        mmHeight = 3969
        mmLeft = 92340
        mmTop = 1058
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'SALDSACTMN'
        DataPipeline = ppdbCtaCteProv
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCteProv'
        mmHeight = 3969
        mmLeft = 148696
        mmTop = 1058
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'SALDSACTME'
        DataPipeline = ppdbCtaCteProv
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCteProv'
        mmHeight = 3969
        mmLeft = 175419
        mmTop = 1058
        mmWidth = 22490
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'SALDSANTMN'
        DataPipeline = ppdbCtaCteProv
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCteProv'
        mmHeight = 3969
        mmLeft = 82550
        mmTop = 3704
        mmWidth = 33073
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'SALDSANTME'
        DataPipeline = ppdbCtaCteProv
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCteProv'
        mmHeight = 3969
        mmLeft = 111125
        mmTop = 3704
        mmWidth = 32544
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        AutoSize = True
        DataField = 'SALDSACTMN'
        DataPipeline = ppdbCtaCteProv
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCteProv'
        mmHeight = 3969
        mmLeft = 138907
        mmTop = 3704
        mmWidth = 32808
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        AutoSize = True
        DataField = 'SALDSACTME'
        DataPipeline = ppdbCtaCteProv
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCtaCteProv'
        mmHeight = 3969
        mmLeft = 165629
        mmTop = 3704
        mmWidth = 32279
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label12'
        Caption = 
          '----------------------------------------------------------------' +
          '---------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 84667
        mmTop = 0
        mmWidth = 115359
        BandType = 7
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'TOTALES : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 52917
        mmTop = 3704
        mmWidth = 17992
        BandType = 7
      end
    end
  end
  object ppdbCtaCteProv: TppDBPipeline
    UserName = 'dbCtaCteProv'
    Left = 104
    Top = 16
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 792
    Top = 8
  end
end
