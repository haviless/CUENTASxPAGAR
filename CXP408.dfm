object FDistribucion: TFDistribucion
  Left = 547
  Top = 335
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Distribuci'#243'n del Gasto'
  ClientHeight = 157
  ClientWidth = 316
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDatos1: TPanel
    Left = 17
    Top = 8
    Width = 284
    Height = 109
    Color = 14869218
    TabOrder = 0
    object lblCia: TLabel
      Left = 14
      Top = 17
      Width = 49
      Height = 13
      Caption = 'Compa'#241#237'a'
    end
    object Label2: TLabel
      Left = 14
      Top = 47
      Width = 39
      Height = 13
      Caption = 'Periodo '
    end
    object Label5: TLabel
      Left = 14
      Top = 78
      Width = 40
      Height = 13
      Caption = 'T.Diario '
    end
    object dblcCia: TwwDBLookupCombo
      Left = 75
      Top = 12
      Width = 42
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      LookupTable = DMCXP.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 121
      Top = 12
      Width = 137
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object seAno: TSpinEdit
      Left = 75
      Top = 42
      Width = 49
      Height = 22
      MaxLength = 4
      MaxValue = 2100
      MinValue = 2000
      TabOrder = 2
      Value = 2001
    end
    object seMes: TSpinEdit
      Left = 131
      Top = 42
      Width = 38
      Height = 22
      MaxLength = 2
      MaxValue = 12
      MinValue = 1
      TabOrder = 3
      Value = 1
    end
    object dblcTDiario: TwwDBLookupCombo
      Left = 75
      Top = 72
      Width = 42
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TDIARID'#9'2'#9'Tipo de Diario'#9'F'
        'TDIARDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMCXP.cdsTDiario
      LookupField = 'TDIARID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      UseTFields = False
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTDiarioExit
    end
    object edtTDiario: TEdit
      Left = 121
      Top = 72
      Width = 152
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object bbtnOk: TBitBtn
    Left = 261
    Top = 124
    Width = 30
    Height = 24
    Hint = 'Imprimir'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
  object ppdbDistribucion: TppDBPipeline
    UserName = 'dbDistribucion'
    Left = 42
    Top = 111
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 8
      DisplayWidth = 8
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
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
      FieldAlias = 'CPNOREG'
      FieldName = 'CPNOREG'
      FieldLength = 6
      DisplayWidth = 6
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CPANOMES'
      FieldName = 'CPANOMES'
      FieldLength = 6
      DisplayWidth = 6
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'PROVRUC'
      FieldName = 'PROVRUC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'CPFRECEP'
      FieldName = 'CPFRECEP'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'CPFEMIS'
      FieldName = 'CPFEMIS'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'CPFVCMTO'
      FieldName = 'CPFVCMTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
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
      FieldAlias = 'CPTCAMPR'
      FieldName = 'CPTCAMPR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPTCAMPA'
      FieldName = 'CPTCAMPA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      FieldAlias = 'CPESTADO'
      FieldName = 'CPESTADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object ppField18: TppField
      FieldAlias = 'CPOCOMP'
      FieldName = 'CPOCOMP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      FieldAlias = 'CP_CONTA'
      FieldName = 'CP_CONTA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPGRAVAD'
      FieldName = 'CPGRAVAD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPNOGRAV'
      FieldName = 'CPNOGRAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPIGV'
      FieldName = 'CPIGV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPISC'
      FieldName = 'CPISC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPDCTO'
      FieldName = 'CPDCTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPSERVIC'
      FieldName = 'CPSERVIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPMTOORI'
      FieldName = 'CPMTOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPMTOLOC'
      FieldName = 'CPMTOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPMTOEXT'
      FieldName = 'CPMTOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPPAGORI'
      FieldName = 'CPPAGORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPPAGLOC'
      FieldName = 'CPPAGLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPPAGEXT'
      FieldName = 'CPPAGEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPSALORI'
      FieldName = 'CPSALORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPSALLOC'
      FieldName = 'CPSALLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPSALEXT'
      FieldName = 'CPSALEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppField35: TppField
      FieldAlias = 'TCANJEID'
      FieldName = 'TCANJEID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 34
    end
    object ppField36: TppField
      FieldAlias = 'CPCANJE'
      FieldName = 'CPCANJE'
      FieldLength = 6
      DisplayWidth = 6
      Position = 35
    end
    object ppField37: TppField
      FieldAlias = 'CPFCANJE'
      FieldName = 'CPFCANJE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 36
    end
    object ppField38: TppField
      FieldAlias = 'CPUSER'
      FieldName = 'CPUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
    object ppField39: TppField
      FieldAlias = 'CPFREG'
      FieldName = 'CPFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 38
    end
    object ppField40: TppField
      FieldAlias = 'CPHREG'
      FieldName = 'CPHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 39
    end
    object ppField41: TppField
      FieldAlias = 'CPAAAA'
      FieldName = 'CPAAAA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 40
    end
    object ppField42: TppField
      FieldAlias = 'CPMM'
      FieldName = 'CPMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 41
    end
    object ppField43: TppField
      FieldAlias = 'CPDD'
      FieldName = 'CPDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 42
    end
    object ppField44: TppField
      FieldAlias = 'CPTRI'
      FieldName = 'CPTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 43
    end
    object ppField45: TppField
      FieldAlias = 'CPSEM'
      FieldName = 'CPSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 44
    end
    object ppField46: TppField
      FieldAlias = 'CPSS'
      FieldName = 'CPSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 45
    end
    object ppField47: TppField
      FieldAlias = 'CPAATRI'
      FieldName = 'CPAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 46
    end
    object ppField48: TppField
      FieldAlias = 'CPAASEM'
      FieldName = 'CPAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 47
    end
    object ppField49: TppField
      FieldAlias = 'CPAASS'
      FieldName = 'CPAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 48
    end
    object ppField50: TppField
      FieldAlias = 'CPFCMPRB'
      FieldName = 'CPFCMPRB'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 49
    end
    object ppField51: TppField
      FieldAlias = 'DCPLOTE'
      FieldName = 'DCPLOTE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 50
    end
    object ppField52: TppField
      FieldAlias = 'CTATOTAL'
      FieldName = 'CTATOTAL'
      FieldLength = 15
      DisplayWidth = 15
      Position = 51
    end
    object ppField53: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 52
    end
    object ppField54: TppField
      FieldAlias = 'CPTOTOT'
      FieldName = 'CPTOTOT'
      FieldLength = 6
      DisplayWidth = 6
      Position = 53
    end
    object ppField55: TppField
      FieldAlias = 'lkCia'
      FieldName = 'lkCia'
      FieldLength = 20
      DisplayWidth = 20
      Position = 54
    end
    object ppField56: TppField
      FieldAlias = 'lkProv'
      FieldName = 'lkProv'
      FieldLength = 20
      DisplayWidth = 20
      Position = 55
    end
    object ppField57: TppField
      FieldAlias = 'lkTDoc'
      FieldName = 'lkTDoc'
      FieldLength = 20
      DisplayWidth = 20
      Position = 56
    end
    object ppField58: TppField
      FieldAlias = 'lkTMon'
      FieldName = 'lkTMon'
      FieldLength = 20
      DisplayWidth = 20
      Position = 57
    end
    object ppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPIGV2'
      FieldName = 'CPIGV2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object ppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPGRAVAD2'
      FieldName = 'CPGRAVAD2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object ppField61: TppField
      FieldAlias = 'lkDocResta'
      FieldName = 'lkDocResta'
      FieldLength = 20
      DisplayWidth = 20
      Position = 60
    end
  end
  object pprDistribucion: TppReport
    AutoStop = False
    DataPipeline = ppdbDistribucion
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rDistribucion'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 5000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\SolStandar\SOLCxP\SOLFormatos\Distribucion.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprDistribucionPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 140
    Top = 111
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbDistribucion'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34131
      mmPrintPosition = 0
      object ppLabel35: TppLabel
        UserName = 'Label35'
        CharWrap = True
        Caption = 
          'DISTRIBUCION DEL GASTO SEGUN PORCENTAJE DEL IGV DEL REGISTRO DE ' +
          'COMPRAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 55827
        mmTop = 1588
        mmWidth = 85196
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Periodo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 83344
        mmTop = 10848
        mmWidth = 11642
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'lblPeriodo1'
        Caption = 'lblPeriodo1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 100806
        mmTop = 10848
        mmWidth = 15875
        BandType = 0
      end
      object pplCia: TppLabel
        UserName = 'lCia'
        Caption = 'CIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 1852
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        CharWrap = True
        AutoSize = False
        Caption = 'B. Imponible OP Gravado y No Gravado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 15346
        mmLeft = 529
        mmTop = 17198
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        CharWrap = True
        AutoSize = False
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 15346
        mmLeft = 33602
        mmTop = 17198
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        CharWrap = True
        AutoSize = False
        Caption = 'I.G.V.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 15346
        mmLeft = 48948
        mmTop = 17198
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        CharWrap = True
        AutoSize = False
        Caption = 'Factor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 15346
        mmLeft = 65352
        mmTop = 17198
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        CharWrap = True
        AutoSize = False
        Caption = 'I.G.V. Aceptado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 15346
        mmLeft = 89694
        mmTop = 17198
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        CharWrap = True
        AutoSize = False
        Caption = 'Gasto C/Costo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 15346
        mmLeft = 117211
        mmTop = 17198
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        CharWrap = True
        AutoSize = False
        Caption = 'Adquisic. no Gravadas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 15346
        mmLeft = 142611
        mmTop = 17198
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        CharWrap = True
        AutoSize = False
        Caption = 'Precio Venta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 15346
        mmLeft = 177007
        mmTop = 17198
        mmWidth = 18256
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 175684
        mmTop = 1588
        mmWidth = 1588
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 175684
        mmTop = 10848
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Pag.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165100
        mmTop = 1588
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165100
        mmTop = 10848
        mmWidth = 8467
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'BASE'
        DataPipeline = ppdbDistribucion
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 529
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'TASA'
        DataPipeline = ppdbDistribucion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 28310
        mmTop = 529
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'IGV'
        DataPipeline = ppdbDistribucion
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 59002
        mmTop = 529
        mmWidth = 5292
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'FACTOR'
        DataPipeline = ppdbDistribucion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 66146
        mmTop = 529
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'IGVP'
        DataPipeline = ppdbDistribucion
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 99748
        mmTop = 529
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'DIFE'
        DataPipeline = ppdbDistribucion
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 127265
        mmTop = 529
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'CPNOGRAV'
        DataPipeline = ppdbDistribucion
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 147109
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'PRECIO'
        DataPipeline = ppdbDistribucion
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 183357
        mmTop = 529
        mmWidth = 11377
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'BASE'
        DataPipeline = ppdbDistribucion
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 1058
        mmWidth = 19050
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'IGV'
        DataPipeline = ppdbDistribucion
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 48154
        mmTop = 1058
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        AutoSize = True
        DataField = 'IGVP'
        DataPipeline = ppdbDistribucion
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 88636
        mmTop = 1058
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        AutoSize = True
        DataField = 'DIFE'
        DataPipeline = ppdbDistribucion
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 116946
        mmTop = 1058
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        AutoSize = True
        DataField = 'CPNOGRAV'
        DataPipeline = ppdbDistribucion
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 135467
        mmTop = 1058
        mmWidth = 29369
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        AutoSize = True
        DataField = 'PRECIO'
        DataPipeline = ppdbDistribucion
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDistribucion'
        mmHeight = 3969
        mmLeft = 171980
        mmTop = 1058
        mmWidth = 22754
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 2646
        mmTop = 265
        mmWidth = 168540
        BandType = 7
      end
    end
  end
end
