object FRepRegDiarios: TFRepRegDiarios
  Left = 410
  Top = 221
  ActiveControl = dblcCia
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Comprobantes Ingresados'
  ClientHeight = 483
  ClientWidth = 301
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
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
  TextHeight = 15
  object Bevel5: TBevel
    Left = 153
    Top = 289
    Width = 141
    Height = 37
    Shape = bsFrame
  end
  object Bevel4: TBevel
    Left = 7
    Top = 289
    Width = 141
    Height = 37
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 7
    Top = 7
    Width = 288
    Height = 39
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 13
    Top = 1
    Width = 55
    Height = 15
    Caption = 'Compa'#241'ia :'
  end
  object Bevel3: TBevel
    Left = 7
    Top = 448
    Width = 288
    Height = 33
    Shape = bsFrame
  end
  object Label4: TLabel
    Left = 14
    Top = 283
    Width = 60
    Height = 15
    Caption = 'Por Estado :'
  end
  object Label5: TLabel
    Left = 158
    Top = 283
    Width = 69
    Height = 15
    Caption = 'Ordenar por :'
  end
  object Bevel6: TBevel
    Left = 7
    Top = 365
    Width = 288
    Height = 37
    Shape = bsFrame
  end
  object Label6: TLabel
    Left = 15
    Top = 357
    Width = 30
    Height = 15
    Caption = 'Titulo'
  end
  object Bevel7: TBevel
    Left = 7
    Top = 331
    Width = 288
    Height = 25
    Shape = bsFrame
  end
  object rgbTipDoc: TGroupBox
    Left = 7
    Top = 50
    Width = 288
    Height = 179
    Caption = 'Por tipo de Documento :'
    TabOrder = 2
    object Bevel1: TBevel
      Left = 4
      Top = 36
      Width = 279
      Height = 137
      Shape = bsFrame
    end
    object rbTipDocTodos: TRadioButton
      Left = 13
      Top = 15
      Width = 113
      Height = 17
      Caption = 'Todos'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbTipDocTodosClick
    end
    object rbTipDocEscoger: TRadioButton
      Left = 13
      Top = 30
      Width = 66
      Height = 22
      Caption = 'Escoger :'
      TabOrder = 1
      OnClick = rbTipDocEscogerClick
    end
    object lvTipoDoc: TListView
      Left = 9
      Top = 49
      Width = 269
      Height = 119
      Checkboxes = True
      Columns = <
        item
          Caption = 'C'#243'digo'
        end
        item
          Caption = 'Descripci'#243'n'
          Width = 250
        end>
      Enabled = False
      GridLines = True
      MultiSelect = True
      TabOrder = 2
      ViewStyle = vsReport
    end
  end
  object rgbFechas: TGroupBox
    Left = 7
    Top = 231
    Width = 288
    Height = 48
    Caption = 'Rango de Fechas :'
    TabOrder = 3
    object Label2: TLabel
      Left = 15
      Top = 20
      Width = 32
      Height = 15
      Caption = 'Inicio'
    end
    object Label3: TLabel
      Left = 162
      Top = 21
      Width = 16
      Height = 15
      Caption = 'Fin'
    end
    object dbdtpFReg1: TwwDBDateTimePicker
      Left = 50
      Top = 19
      Width = 90
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 0
      OnExit = dbdtpFReg1Exit
    end
    object dbdtpFReg2: TwwDBDateTimePicker
      Left = 184
      Top = 19
      Width = 90
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
      OnExit = dbdtpFReg2Exit
    end
  end
  object dblcCia: TwwDBLookupCombo
    Left = 41
    Top = 18
    Width = 42
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'Cia'#9'F'
      'CIADES'#9'40'#9'Raz'#243'n Social'#9'F')
    LookupField = 'CIAID'
    Options = [loColLines, loRowLines, loTitles]
    MaxLength = 2
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnChange = dblcCiaChange
    OnExit = dblcCiaExit
  end
  object edtCia: TEdit
    Left = 85
    Top = 18
    Width = 174
    Height = 23
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object Z2bbtnOk: TBitBtn
    Left = 220
    Top = 452
    Width = 30
    Height = 25
    TabOrder = 6
    OnClick = Z2bbtnOkClick
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
  object Z2bbtnCanc: TBitBtn
    Left = 254
    Top = 452
    Width = 30
    Height = 25
    Cancel = True
    ModalResult = 2
    TabOrder = 7
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
  object cboEstado: TComboBox
    Left = 14
    Top = 298
    Width = 122
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    TabOrder = 4
    Items.Strings = (
      'Todos'
      'Inicial'
      'Anulados'
      'Aceptados'
      'Contabilizados'
      'Eliminados')
  end
  object cboOrdenar: TComboBox
    Left = 162
    Top = 298
    Width = 122
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    TabOrder = 5
    Items.Strings = (
      'Comprobante'
      'Documento'
      'Proveedor'
      'Fecha')
  end
  object edtTitulo: TEdit
    Left = 17
    Top = 373
    Width = 267
    Height = 23
    MaxLength = 50
    TabOrder = 8
    Text = 'Comprobantes Ingresados'
  end
  object rgHoja: TRadioGroup
    Left = 7
    Top = 404
    Width = 288
    Height = 39
    Caption = 'Tama'#241'o de Hoja'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Standard 14 7/8 x 11'
      'A4 211 x 297 mm')
    TabOrder = 9
  end
  object cbCCosto: TCheckBox
    Left = 17
    Top = 336
    Width = 177
    Height = 17
    Caption = 'Incluir Centro de Costo'
    TabOrder = 10
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 5000
    PrinterSetup.mmMarginRight = 2500
    PrinterSetup.mmMarginTop = 3500
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 378000
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SOLExes\SOLFormatos\CXP\Bhl\CXPIngresoDiario.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 102
    Top = 139
    Version = '7.02'
    mmColumnWidth = 370500
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Registro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 12700
        mmTop = 17727
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 59531
        mmTop = 17727
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Nombre Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 115888
        mmTop = 17463
        mmWidth = 48419
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Importe S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 237332
        mmTop = 17463
        mmWidth = 27517
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 22225
        mmWidth = 300567
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Importe  US$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 278078
        mmTop = 17463
        mmWidth = 16140
        BandType = 0
      end
      object pplTitulo: TppLabel
        UserName = 'lTitulo'
        Caption = 'Listado de Proveedores'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 131498
        mmTop = 1058
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Descripcion'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 183886
        mmTop = 17463
        mmWidth = 36248
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Numero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 12435
        mmTop = 13494
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Numero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 59796
        mmTop = 13494
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 35983
        mmTop = 17727
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label12'
        Caption = 'Tipo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 42069
        mmTop = 13494
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Codigo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 87577
        mmTop = 17198
        mmWidth = 16404
        BandType = 0
      end
      object ppFechas: TppLabel
        UserName = 'Fechas'
        Caption = 'Fechas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 143404
        mmTop = 6615
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 280459
        mmTop = 1058
        mmWidth = 11642
        BandType = 0
      end
      object svPag: TppSystemVariable
        UserName = 'svPag'
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 296069
        mmTop = 1058
        mmWidth = 1852
        BandType = 0
      end
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Caption = 'lblCia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 1058
        mmWidth = 8467
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CPMTOLOC'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 237332
        mmTop = 0
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CPMTOEXT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 274638
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label102'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label103'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 34660
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label104'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 59267
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label105'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 82286
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DCPGLOSA'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 173302
        mmTop = 0
        mmWidth = 57150
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CPNOREG'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 10848
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TDIARID'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 0
        mmWidth = 5292
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 300832
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 268817
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 234421
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DOCABR'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 37571
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        AutoSize = False
        CalcOrder = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        OnCalc = ppVariable1Calc2
        Transparent = True
        mmHeight = 3969
        mmLeft = 62177
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'AUXNOMB'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 112713
        mmTop = 0
        mmWidth = 56092
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PROV'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 84667
        mmTop = 0
        mmWidth = 24871
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label106'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 111125
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = '|'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppVariable2: TppVariable
        UserName = 'Variable2'
        AutoSize = False
        CalcOrder = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        OnCalc = ppVariable2Calc
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 235744
        mmTop = 0
        mmWidth = 64294
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'CPMTOLOC'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 238919
        mmTop = 3175
        mmWidth = 25929
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'CPMTOEXT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 278078
        mmTop = 3175
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label11'
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 2381
        mmWidth = 7144
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 235215
        mmTop = 1058
        mmWidth = 67204
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 235215
        mmTop = 8731
        mmWidth = 67204
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 17198
        mmTop = 2381
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel26: TppLabel
        UserName = 'Label1'
        Caption = 'Registros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 36248
        mmTop = 2381
        mmWidth = 14288
        BandType = 7
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    UserName = 'DBPipeline1'
    Left = 179
    Top = 136
    object ppField1: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'CPNOREG'
      FieldName = 'CPNOREG'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'DOCABR'
      FieldName = 'DOCABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'CPSERIE'
      FieldName = 'CPSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'CPNODOC'
      FieldName = 'CPNODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'AUXNOMB'
      FieldName = 'AUXNOMB'
      FieldLength = 40
      DisplayWidth = 40
      Position = 7
    end
    object ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPMTOLOC'
      FieldName = 'CPMTOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPMTOEXT'
      FieldName = 'CPMTOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'DCPGLOSA'
      FieldName = 'DCPGLOSA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 10
    end
  end
end
