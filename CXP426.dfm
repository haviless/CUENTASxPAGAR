object FMovCptoCC: TFMovCptoCC
  Left = 250
  Top = 265
  Width = 286
  Height = 272
  Caption = 'FMovCptoCC'
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlComando: TPanel
    Left = 0
    Top = 201
    Width = 276
    Height = 39
    Color = 10207162
    TabOrder = 0
    object Z2bbtnImprimir: TBitBtn
      Left = 177
      Top = 5
      Width = 30
      Height = 30
      Hint = 'Imprimir Reporte'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Z2bbtnImprimirClick
      Glyph.Data = {
        BE080000424DBE0800000000000036000000280000001B0000001A0000000100
        18000000000088080000CE0E0000D80E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C080
        8080000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000808080C0C0
        C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C000000080808080800080808080
        8000808080808000808080808000808080808000808080808000808080808000
        808080808000808080808080808000000000C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000C0C0C0C0C0C0000000C0C0C0C0C0C00000008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000000000C0C0C0
        C0C0C0000000C0C0C0C0C0C00000008080008080000000000000008080000000
        0000000080800000000000000080800080800080800080800000000000000000
        0000000000000000000000808000000000C0C0C0C0C0C0000000C0C0C0C0C0C0
        0000008080008080000000000000008080000000000000008080000000000000
        0080800080800080800080800000000000000000000000000000000000000080
        8000000000C0C0C0C0C0C0000000C0C0C0C0C0C0000000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        00808000808000808000808000808000808000808000000000C0C0C0C0C0C000
        0000C0C0C0C0C0C0000000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        00808000808000808000000000C0C0C0C0C0C0000000C0C0C0C0C0C0000000C0
        C0C0C0C0C0FFFFFFFFFFFFC0C0C0FFFFFFC0C0C0FFFFFFC0C0C0FFFFFFFFFFFF
        C0C0C0FFFFFFC0C0C0FFFFFFC0C0C0FFFFFFFFFFFFC0C0C0FFFFFFC0C0C00000
        00C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C0C0C0C0C0C0C0000000808000808000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808000808000
        000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C00000
        00000000000000000000FFFFFF00000000000080808080808000000080808000
        0000808080000000FFFFFF000000000000000000000000C0C0C0C0C0C0C0C0C0
        C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF0000000000008080800000
        00808080000000000000C0C0C0000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF000000
        808080000000000000808080000000FFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000FFFFFF000000000000808080808080000000000000FFFFFF000000000000
        000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
        00000000000000000000000000000000000000000000000000C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000}
    end
    object Z2bbtnSalir: TBitBtn
      Left = 220
      Top = 5
      Width = 30
      Height = 30
      Hint = 'Cerrar el Formulario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnSalirClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
  end
  object gbRango: TGroupBox
    Left = 13
    Top = 7
    Width = 250
    Height = 188
    Caption = 'Rango de Fechas'
    TabOrder = 1
    object TLabel
      Left = 21
      Top = 55
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object TLabel
      Left = 131
      Top = 55
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object TLabel
      Left = 21
      Top = 21
      Width = 50
      Height = 13
      Caption = 'Compa'#241'ia:'
    end
    object dtpDesde: TDateTimePicker
      Left = 21
      Top = 71
      Width = 80
      Height = 23
      Date = 36836.616261458300000000
      Time = 36836.616261458300000000
      TabOrder = 2
    end
    object dtpHasta: TDateTimePicker
      Left = 131
      Top = 71
      Width = 80
      Height = 23
      Date = 36836.616261458300000000
      Time = 36836.616261458300000000
      TabOrder = 3
    end
    object dblcCia: TwwDBLookupCombo
      Left = 19
      Top = 36
      Width = 41
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      LookupTable = DM1.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      Style = csDropDownList
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 62
      Top = 36
      Width = 147
      Height = 21
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object rgCCosto: TRadioGroup
      Left = 22
      Top = 102
      Width = 215
      Height = 31
      Caption = 'Centro de Costo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Escoger')
      TabOrder = 4
      OnClick = rgCCostoClick
    end
    object Z2bbtnSelCCosto: TBitBtn
      Left = 198
      Top = 109
      Width = 26
      Height = 22
      Enabled = False
      TabOrder = 5
      OnClick = Z2bbtnSelCCostoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        033333FFFF77777773F330000077777770333777773FFFFFF733077777000000
        03337F3F3F777777733F0797A770003333007F737337773F3377077777778803
        30807F333333337FF73707888887880007707F3FFFF333777F37070000878807
        07807F777733337F7F3707888887880808807F333333337F7F37077777778800
        08807F333FFF337773F7088800088803308073FF777FFF733737300008000033
        33003777737777333377333080333333333333F7373333333333300803333333
        33333773733333333333088033333333333373F7F33333333333308033333333
        3333373733333333333333033333333333333373333333333333}
      NumGlyphs = 2
    end
    object rgEstado: TRadioGroup
      Left = 22
      Top = 144
      Width = 215
      Height = 31
      Caption = 'Estado'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Inicial'
        'Aceptados'
        'Todos')
      TabOrder = 6
      OnClick = rgEstadoClick
    end
  end
  object ppdbFuente: TppDBPipeline
    UserName = 'dbFuente'
    Left = 216
    Top = 16
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
      FieldLength = 20
      DisplayWidth = 20
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
      FieldAlias = '00014'
      FieldName = '00014'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = '00015'
      FieldName = '00015'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
  end
  object ppReporte: TppReport
    AutoStop = False
    DataPipeline = ppdbFuente
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 0
    PrinterSetup.mmPaperWidth = 0
    PrinterSetup.PaperSize = 121
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextFileName = 'C:\borrar.txt'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 128
    Top = 24
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbFuente'
    object ppHBCab: TppHeaderBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 8260573
      mmPrintPosition = 0
      object pplblEmpresa: TppLabel
        UserName = 'pplblEmpresa'
        SaveOrder = 9
        Save = True
        Caption = 'pplblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object pplblSistema: TppLabel
        UserName = 'pplblSistema'
        SaveOrder = 14
        Save = True
        Caption = 'Cuenta Corriente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        mmHeight = 1190098
        mmLeft = 0
        mmTop = 0
        mmWidth = 6580465
        BandType = 0
      end
      object pplblPagina: TppLabel
        UserName = 'pplblPagina'
        SaveOrder = 11
        Save = True
        Caption = 'pplblPagina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 23283
        BandType = 0
      end
      object pplblFecha: TppLabel
        UserName = 'pplblFecha'
        SaveOrder = 12
        Save = True
        Caption = 'pplblFecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 21167
        BandType = 0
      end
      object pplblHora: TppLabel
        UserName = 'pplblHora'
        SaveOrder = 13
        Save = True
        Caption = 'pplblHora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 19050
        BandType = 0
      end
      object pplblTitulo: TppLabel
        UserName = 'pplblTitulo'
        SaveOrder = 15
        Save = True
        Caption = 'pplblTitulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 23283
        BandType = 0
      end
      object pplblLin0: TppLabel
        UserName = 'pplblLin0'
        SaveOrder = 10
        Save = True
        Caption = 'pplblLin0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 19050
        BandType = 0
      end
      object pplblLin1: TppLabel
        UserName = 'pplblLin1'
        SaveOrder = 16
        Save = True
        Caption = 'pplblLin1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        mmHeight = 4233
        mmLeft = 0
        mmTop = 7280554
        mmWidth = 19050
        BandType = 0
      end
      object ppsvPagina: TppSystemVariable
        UserName = 'ppsvPagina'
        SaveOrder = 19
        Save = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        mmHeight = 1190098
        mmLeft = 50893235
        mmTop = 0
        mmWidth = 1470028
        BandType = 0
      end
      object ppsvFecha: TppSystemVariable
        UserName = 'ppsvFecha'
        SaveOrder = 17
        Save = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        mmHeight = 1190098
        mmLeft = 50893235
        mmTop = 1119983
        mmWidth = 4340234
        BandType = 0
      end
      object ppsvHora: TppSystemVariable
        UserName = 'ppsvHora'
        SaveOrder = 18
        Save = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        mmHeight = 1190098
        mmLeft = 50893235
        mmTop = 2240232
        mmWidth = 5250402
        BandType = 0
      end
      object TppLabel
        UserName = 'Label1'
        SaveOrder = 0
        Save = True
        Caption = 'N'#176'Registro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 1050133
        mmLeft = 350044
        mmTop = 6090456
        mmWidth = 4270384
        BandType = 0
      end
      object TppLabel
        UserName = 'Label2'
        SaveOrder = 1
        Save = True
        Caption = 'Doc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 1050133
        mmLeft = 5670297
        mmTop = 6090456
        mmWidth = 1750222
        BandType = 0
      end
      object TppLabel
        UserName = 'Label3'
        SaveOrder = 2
        Save = True
        Caption = 'Doc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 1050133
        mmLeft = 8330423
        mmTop = 6090456
        mmWidth = 1750222
        BandType = 0
      end
      object TppLabel
        UserName = 'Label4'
        SaveOrder = 3
        Save = True
        Caption = 'Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 1050133
        mmLeft = 11200629
        mmTop = 6090456
        mmWidth = 3920339
        BandType = 0
      end
      object TppLabel
        UserName = 'Label5'
        SaveOrder = 4
        Save = True
        Caption = 'Glosa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 1050133
        mmLeft = 33112141
        mmTop = 6160306
        mmWidth = 2310082
        BandType = 0
      end
      object TppLabel
        UserName = 'Label6'
        SaveOrder = 5
        Save = True
        Caption = 'Doc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 1050133
        mmLeft = 46973160
        mmTop = 6160306
        mmWidth = 1750222
        BandType = 0
      end
      object TppLabel
        UserName = 'Label7'
        SaveOrder = 6
        Save = True
        Caption = 'Soles'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 55303583
        mmTop = 6090456
        mmWidth = 2240232
        BandType = 0
      end
      object TppLabel
        UserName = 'Label8'
        SaveOrder = 7
        Save = True
        Caption = 'Dolares'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 59784046
        mmTop = 6090456
        mmWidth = 3080285
        BandType = 0
      end
      object TppLabel
        UserName = 'Label9'
        SaveOrder = 8
        Save = True
        Caption = '--------Importe--------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 55303583
        mmTop = 5040323
        mmWidth = 7420519
        BandType = 0
      end
      object TppLabel
        UserName = 'Label14'
        SaveOrder = 20
        Save = True
        Caption = 'Tipo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 1050133
        mmLeft = 5740411
        mmTop = 4970208
        mmWidth = 1680108
        BandType = 0
      end
      object TppLabel
        UserName = 'Label20'
        SaveOrder = 21
        Save = True
        Caption = 'No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 1050133
        mmLeft = 8470652
        mmTop = 4970208
        mmWidth = 1330063
        BandType = 0
      end
      object TppLabel
        UserName = 'Label21'
        SaveOrder = 22
        Save = True
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 1050133
        mmLeft = 46833195
        mmTop = 4970208
        mmWidth = 2380196
        BandType = 0
      end
    end
    object ppDBDet: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 1330063
      mmPrintPosition = 0
      object pptxtNroReg: TppDBText
        UserName = 'pptxtNroReg'
        AutoSize = True
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 560124
        mmTop = 139965
        mmWidth = 23283
        BandType = 4
      end
      object pptxtTPDoc: TppDBText
        UserName = 'pptxtTPDoc'
        AutoSize = True
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 6650315
        mmTop = 139965
        mmWidth = 21167
        BandType = 4
      end
      object pptxtFeDoc: TppDBText
        UserName = 'pptxtFeDoc'
        AutoSize = True
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 46973160
        mmTop = 139965
        mmWidth = 21167
        BandType = 4
      end
      object pptxtMtoLoc: TppDBText
        UserName = 'pptxtMtoLoc'
        DataPipeline = ppdbFuente
        DisplayFormat = '#,#.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 1050133
        mmLeft = 54813574
        mmTop = 139965
        mmWidth = 4760393
        BandType = 4
      end
      object pptxtMtoExt: TppDBText
        UserName = 'pptxtMtoExt'
        DataPipeline = ppdbFuente
        DisplayFormat = '#,#.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 1050133
        mmLeft = 61464154
        mmTop = 139965
        mmWidth = 4760393
        BandType = 4
      end
      object pptxtProov: TppDBText
        UserName = 'pptxtProov'
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 1050133
        mmLeft = 15610977
        mmTop = 139965
        mmWidth = 15821056
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 1050133
        mmLeft = 32622132
        mmTop = 139965
        mmWidth = 11970832
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        AutoSize = True
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 9730601
        mmTop = 139965
        mmWidth = 19050
        BandType = 4
      end
    end
    object ppFBPie: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3430330
      mmPrintPosition = 0
      object pplblLin2: TppLabel
        UserName = 'pplblLin2'
        Caption = 'pplblLin2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 9
        Font.Style = []
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 12065
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4060304
      mmPrintPosition = 0
      object TppLabel
        UserName = 'Label17'
        Caption = '================================'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 52013483
        mmTop = 1470028
        mmWidth = 15681092
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'ppDBCalc6'
        DataPipeline = ppdbFuente
        DisplayFormat = '#,#.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 1050133
        mmLeft = 55023653
        mmTop = 2590276
        mmWidth = 4550313
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'ppDBCalc5'
        DataPipeline = ppdbFuente
        DisplayFormat = '#,#.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 1050133
        mmLeft = 61673969
        mmTop = 2590276
        mmWidth = 4550313
        BandType = 7
      end
      object TppLabel
        UserName = 'Label19'
        Caption = 'Total General:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1119983
        mmLeft = 41792873
        mmTop = 1470028
        mmWidth = 5670297
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      DataPipeline = ppdbFuente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentColumn = False
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbFuente'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 1470028
        mmPrintPosition = 0
        object TppLabel
          UserName = 'Label12'
          Caption = 'Concepto:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 1050133
          mmLeft = 560124
          mmTop = 210080
          mmWidth = 3920339
          BandType = 3
          GroupNo = 0
        end
        object pptxtConcepto: TppDBText
          UserName = 'pptxtConcepto'
          AutoSize = True
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 4233
          mmLeft = 6510350
          mmTop = 210080
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'ppDBText3'
          AutoSize = True
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 4233
          mmLeft = 13020966
          mmTop = 210080
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3080285
        mmPrintPosition = 0
        object TppLabel
          UserName = 'Label102'
          Caption = '---------------------------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 1050133
          mmLeft = 51733288
          mmTop = 0
          mmWidth = 15961021
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'ppDBCalc3'
          DataPipeline = ppdbFuente
          DisplayFormat = '#,#.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 1050133
          mmLeft = 61464154
          mmTop = 1400178
          mmWidth = 4760393
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'ppDBCalc4'
          DataPipeline = ppdbFuente
          DisplayFormat = '#,#.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 1050133
          mmLeft = 54813574
          mmTop = 1400178
          mmWidth = 4760393
          BandType = 5
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'ppLabel1'
          Caption = 'Total x Concepto:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 1119983
          mmLeft = 40322580
          mmTop = 70115
          mmWidth = 7140589
          BandType = 5
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'ppDBText7'
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 1050133
          mmLeft = 29401881
          mmTop = 1609993
          mmWidth = 18061288
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      DataPipeline = ppdbFuente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentColumn = False
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbFuente'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 1540143
        mmPrintPosition = 0
        object TppLabel
          UserName = 'Label13'
          Caption = 'C.de Costo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 1050133
          mmLeft = 1119983
          mmTop = 279930
          mmWidth = 4550313
          BandType = 3
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'ppDBText1'
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 1050133
          mmLeft = 13930869
          mmTop = 279930
          mmWidth = 16451031
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'ppDBText2'
          AutoSize = True
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 4233
          mmLeft = 7840414
          mmTop = 279930
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2940320
        mmPrintPosition = 0
        object TppLabel
          UserName = 'Label10'
          Caption = '---------------------------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 1050133
          mmLeft = 51733288
          mmTop = 0
          mmWidth = 15961021
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'ppDBCalc1'
          DataPipeline = ppdbFuente
          DisplayFormat = '#,#.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 1050133
          mmLeft = 61464154
          mmTop = 980019
          mmWidth = 4760393
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'ppDBCalc2'
          DataPipeline = ppdbFuente
          DisplayFormat = '#,#.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 1050133
          mmLeft = 54813574
          mmTop = 980019
          mmWidth = 4760393
          BandType = 5
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'ppLabel2'
          Caption = 'Total x C.Costo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 1119983
          mmLeft = 40882704
          mmTop = 0
          mmWidth = 6580465
          BandType = 5
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'ppDBText6'
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 1050133
          mmLeft = 29401881
          mmTop = 1400178
          mmWidth = 18061288
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object cdsClone: TwwClientDataSet
    Aggregates = <>
    Filter = 'FLAG='#39'S'#39
    Filtered = True
    Params = <>
    ValidateWithMask = True
    Left = 18
    Top = 135
  end
  object dsDocContClone: TwwDataSource
    DataSet = cdsClone
    Left = 92
    Top = 138
  end
end
