object FImpRecHonElectCXP: TFImpRecHonElectCXP
  Left = 260
  Top = 82
  Width = 815
  Height = 608
  Caption = 
    'Importaci'#243'n de Recibos de Honorarios Profesionales Electr'#243'nicos ' +
    'hacia Cuentas por Pagar'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object bbtnRegAnt: TBitBtn
    Left = 554
    Top = 542
    Width = 70
    Height = 25
    Caption = '<--Anterior'
    TabOrder = 0
    OnClick = bbtnRegAntClick
  end
  object bbtnRegSig: TBitBtn
    Left = 640
    Top = 542
    Width = 70
    Height = 25
    Caption = 'Siguiente-->'
    TabOrder = 1
    OnClick = bbtnRegSigClick
  end
  object gbPersonaNatural: TGroupBox
    Left = 8
    Top = 80
    Width = 778
    Height = 192
    Caption = 
      'Datos del Trabajador Independiente (para el Maestro de Proveedor' +
      'es)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lblTipodocumento: TLabel
      Left = 9
      Top = 60
      Width = 165
      Height = 15
      Caption = 'Tipo de Documento de Identidad'
    end
    object lblNumDocumento: TLabel
      Left = 187
      Top = 60
      Width = 83
      Height = 15
      Caption = 'N'#186' de Doc.Ident'
    end
    object lblNombre: TLabel
      Left = 9
      Top = 103
      Width = 40
      Height = 15
      Caption = 'Nombre'
    end
    object lblNombre2: TLabel
      Left = 152
      Top = 103
      Width = 87
      Height = 15
      Caption = 'Segundo Nombre'
    end
    object lblApPaterno: TLabel
      Left = 294
      Top = 103
      Width = 84
      Height = 15
      Caption = 'Apellido Paterno'
    end
    object lblApMaterno: TLabel
      Left = 468
      Top = 103
      Width = 88
      Height = 15
      Caption = 'Apellido Materno'
    end
    object lblNacionalidad: TLabel
      Left = 294
      Top = 60
      Width = 68
      Height = 15
      Caption = 'Nacionalidad'
    end
    object lblSexo: TLabel
      Left = 497
      Top = 60
      Width = 27
      Height = 15
      Caption = 'Sexo'
    end
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 73
      Height = 15
      Caption = 'Clase Auxiliar'
    end
    object Label25: TLabel
      Left = 149
      Top = 18
      Width = 90
      Height = 15
      Caption = 'C'#243'digo Proveedor'
    end
    object Label27: TLabel
      Left = 248
      Top = 18
      Width = 31
      Height = 15
      Caption = 'R.U.C.'
    end
    object Label17: TLabel
      Left = 380
      Top = 18
      Width = 81
      Height = 15
      Caption = 'Tipo de Persona'
    end
    object Label2: TLabel
      Left = 9
      Top = 145
      Width = 40
      Height = 15
      Caption = 'Nombre'
    end
    object dblcTipDoc: TwwDBLookupCombo
      Left = 8
      Top = 75
      Width = 45
      Height = 23
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDOCID'#9'3'#9'Id.'#9'F'
        'TIPDOCDES'#9'30'#9'Tipo de Documento'#9'F')
      DataField = 'TIPDOCID'
      LookupField = 'TIPDOCID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object edtTipDoc: TEdit
      Left = 55
      Top = 75
      Width = 126
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object dbeDNI: TwwDBEdit
      Left = 183
      Top = 75
      Width = 106
      Height = 23
      CharCase = ecUpperCase
      DataField = 'PROVDNI'
      MaxLength = 15
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNombres: TwwDBEdit
      Left = 8
      Top = 119
      Width = 139
      Height = 23
      CharCase = ecUpperCase
      DataField = 'PROVNOMBRE'
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeSnombres: TwwDBEdit
      Left = 150
      Top = 119
      Width = 139
      Height = 23
      CharCase = ecUpperCase
      DataField = 'PROVNOMBRE1'
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeApepat: TwwDBEdit
      Left = 292
      Top = 119
      Width = 173
      Height = 23
      CharCase = ecUpperCase
      DataField = 'PROVAPEPAT'
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeApemat: TwwDBEdit
      Left = 467
      Top = 119
      Width = 169
      Height = 23
      CharCase = ecUpperCase
      DataField = 'PROVAPEMAT'
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdPais: TwwDBLookupComboDlg
      Left = 292
      Top = 75
      Width = 50
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 2
      MaxHeight = 209
      Selected.Strings = (
        'PAISID'#9'3'#9'Id'#9'F'
        'PAISDES'#9'30'#9'Pais'#9'F')
      DataField = 'PAISID'
      LookupField = 'PAISID'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbePais: TEdit
      Left = 343
      Top = 75
      Width = 148
      Height = 23
      Enabled = False
      TabOrder = 4
    end
    object dblcSexo: TwwDBLookupCombo
      Left = 499
      Top = 75
      Width = 57
      Height = 23
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ID'#9'2'#9'Id.'#9'F'
        'DESCRIP'#9'20'#9'Sexo'#9'F')
      DataField = 'SEXO'
      LookupField = 'ID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object dblcClAux: TwwDBLookupCombo
      Left = 8
      Top = 33
      Width = 45
      Height = 23
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CLAUXID'#9'2'#9'Id.'#9'F'
        'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
      DataField = 'CLAUXID'
      LookupField = 'CLAUXID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object dbeClAux: TEdit
      Left = 54
      Top = 33
      Width = 91
      Height = 23
      TabStop = False
      Enabled = False
      TabOrder = 11
    end
    object dbeProv: TwwDBEdit
      Left = 148
      Top = 33
      Width = 95
      Height = 23
      CharCase = ecUpperCase
      DataField = 'PROV'
      MaxLength = 6
      TabOrder = 12
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTipper: TwwDBLookupCombo
      Left = 378
      Top = 33
      Width = 40
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPPERID'#9'2'#9'Id.'#9'F'
        'TIPPERDES'#9'30'#9'Descripci'#243'n'#9'F')
      DataField = 'TIPPERID'
      LookupField = 'TIPPERID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      TabOrder = 13
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object dbeTipPer: TEdit
      Left = 419
      Top = 33
      Width = 102
      Height = 23
      Enabled = False
      TabOrder = 14
    end
    object dbeRuc: TwwDBEdit
      Left = 246
      Top = 33
      Width = 128
      Height = 23
      CharCase = ecUpperCase
      DataField = 'PROVRUC'
      MaxLength = 11
      TabOrder = 15
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNombreTotal: TwwDBEdit
      Left = 8
      Top = 161
      Width = 673
      Height = 23
      CharCase = ecUpperCase
      DataField = 'PROVNOMBRE'
      Enabled = False
      TabOrder = 16
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object gbExon4ta: TGroupBox
      Left = 640
      Top = 7
      Width = 134
      Height = 137
      Caption = 'Exoneraci'#243'n 4ta'
      TabOrder = 17
      object Label30: TLabel
        Left = 12
        Top = 61
        Width = 30
        Height = 15
        Caption = 'Fecha'
      end
      object Label6: TLabel
        Left = 12
        Top = 18
        Width = 40
        Height = 15
        Caption = 'N'#250'mero'
      end
      object dbeExonera: TwwDBEdit
        Left = 12
        Top = 33
        Width = 104
        Height = 23
        CharCase = ecUpperCase
        DataField = 'PROVEXONER'
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbdtpFechaExon4ta: TwwDBDateTimePicker
        Left = 12
        Top = 76
        Width = 105
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECEXON4TA'
        Epoch = 1950
        ShowButton = True
        TabOrder = 1
      end
    end
  end
  object gbDatosGenerales: TGroupBox
    Left = 8
    Top = 7
    Width = 777
    Height = 68
    TabOrder = 3
    object lblCorrelativo: TLabel
      Left = 14
      Top = 13
      Width = 58
      Height = 15
      Caption = 'Correlativo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblCia: TLabel
      Left = 94
      Top = 13
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblFecComp: TLabel
      Left = 293
      Top = 14
      Width = 75
      Height = 15
      Caption = 'F.Comprobante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblAnoMes: TLabel
      Left = 388
      Top = 14
      Width = 39
      Height = 15
      Caption = 'Periodo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblProvNom: TLabel
      Left = 461
      Top = 15
      Width = 177
      Height = 15
      Caption = 'Nombre Trabajador Independiente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object dbeCorrelativo: TwwDBEdit
      Left = 14
      Top = 29
      Width = 75
      Height = 23
      Font.Charset = ANSI_CHARSET
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
    object dblcCia: TwwDBLookupCombo
      Left = 94
      Top = 29
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
        'CIAABR'#9'20'#9'Raz'#243'n Social'#9'F')
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 137
      Top = 29
      Width = 147
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
    object dtpFComp: TwwDBDateTimePicker
      Left = 292
      Top = 30
      Width = 90
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Date = 37176.000000000000000000
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 3
      OnExit = dtpFCompExit
    end
    object dbeAnoMM: TwwDBEdit
      Left = 383
      Top = 30
      Width = 74
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtProv: TEdit
      Left = 459
      Top = 31
      Width = 280
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 5
    end
  end
  object gbDatosRHCab: TGroupBox
    Left = 8
    Top = 280
    Width = 778
    Height = 121
    Caption = 'Datos principales del Recibo por Honoraios'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object lblTDoc: TLabel
      Left = 90
      Top = 17
      Width = 56
      Height = 15
      Caption = 'Documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblSerie: TLabel
      Left = 246
      Top = 17
      Width = 29
      Height = 15
      Caption = 'Serie'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblNoDoc: TLabel
      Left = 307
      Top = 17
      Width = 74
      Height = 15
      Caption = 'No.Documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblTDiario: TLabel
      Left = 402
      Top = 17
      Width = 74
      Height = 15
      Caption = 'Tipo de Diario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblNoReg: TLabel
      Left = 517
      Top = 65
      Width = 61
      Height = 15
      Caption = 'No.Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblFecDoc: TLabel
      Left = 6
      Top = 17
      Width = 49
      Height = 15
      Caption = 'F.Emisi'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblGlosa: TLabel
      Left = 193
      Top = 65
      Width = 28
      Height = 15
      Caption = 'Glosa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblTMon: TLabel
      Left = 10
      Top = 65
      Width = 50
      Height = 15
      Caption = 'T.Moneda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 561
      Top = 17
      Width = 80
      Height = 15
      Caption = 'Centro de Costo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object dblcTDoc: TwwDBLookupCombo
      Left = 90
      Top = 34
      Width = 47
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DOCID'#9'3'#9'Id'#9'F'
        'DOCDES'#9'30'#9'Documento'#9'F')
      LookupField = 'DOCID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtTDoc: TEdit
      Left = 138
      Top = 34
      Width = 103
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtSerie: TwwDBEdit
      Left = 245
      Top = 34
      Width = 51
      Height = 23
      Font.Charset = ANSI_CHARSET
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
    object edtNoDoc: TwwDBEdit
      Left = 299
      Top = 34
      Width = 98
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtTDiario: TEdit
      Left = 448
      Top = 34
      Width = 108
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object meNoReg: TwwDBEdit
      Left = 495
      Top = 82
      Width = 131
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeTDiario: TwwDBEdit
      Left = 401
      Top = 34
      Width = 43
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dtpFEmis: TwwDBDateTimePicker
      Left = 6
      Top = 34
      Width = 84
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'CPFEMIS'
      DataSource = DMCXP.dsQry2
      Date = 37176.000000000000000000
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 0
    end
    object pnlEstado: TPanel
      Left = 629
      Top = 65
      Width = 136
      Height = 41
      Color = 14869218
      TabOrder = 13
      object lblEstado: TLabel
        Left = 42
        Top = 8
        Width = 70
        Height = 16
        Caption = 'ACEPTADO'
        Color = 14869218
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 1
        Top = 8
        Width = 37
        Height = 15
        Caption = 'Estado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
    end
    object dbeGlosa: TwwDBEdit
      Left = 167
      Top = 82
      Width = 322
      Height = 23
      CharCase = ecUpperCase
      DataField = 'DCPGLOSA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTMon: TwwDBLookupCombo
      Left = 10
      Top = 82
      Width = 43
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'Moneda'#9'F'
        'TMONDES'#9'30'#9'Descripci'#243'n'#9'F')
      DataField = 'TMONID'
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines]
      MaxLength = 2
      ParentFont = False
      TabOrder = 9
      AutoDropDown = True
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object edtTMon: TEdit
      Left = 54
      Top = 82
      Width = 107
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object dblcdCCostoCab: TwwDBLookupComboDlg
      Left = 560
      Top = 34
      Width = 73
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Centro de Costo'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'CCOSID'#9'15'#9'Id'#9'F'
        'CCOSDES'#9'30'#9'Centro de Costo'#9'F')
      DataField = 'CCOSID'
      LookupField = 'CCOSID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      Enabled = False
      MaxLength = 12
      ParentFont = False
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnEnter = dblcdCCostoCabEnter
      OnExit = dblcdCCostoCabExit
    end
    object edtCCostoCab: TEdit
      Left = 636
      Top = 34
      Width = 132
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
  end
  object gbDatosRHDet: TGroupBox
    Left = 8
    Top = 401
    Width = 779
    Height = 122
    Caption = 'Datos de Importes del Recibo por Honorarios'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object bbtnEnv_a_CxP: TBitBtn
      Left = 604
      Top = 76
      Width = 102
      Height = 32
      Hint = 'Pasa a Registrar Detalle'
      Caption = 'Enviar a CxP'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bbtnEnv_a_CxPClick
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
    object dbgDetCxP: TwwDBGrid
      Left = 4
      Top = 15
      Width = 575
      Height = 102
      DisableThemesInTitle = False
      Selected.Strings = (
        'DCPREG'#9'3'#9'Item'#9'F'
        'TREGID'#9'3'#9'TR'#9'F'
        'CPTOID'#9'11'#9'Concepto'#9'F'
        'CUENTAID'#9'13'#9'Cuenta~Contable'#9'F'
        'DCPGLOSA'#9'30'#9'Glosa'#9'F'
        'CCOSID'#9'10'#9'Centro de~Costo'#9'F'
        'DCPDH'#9'4'#9'Debe~Haber'#9'F'
        'DCPMOORI'#9'12'#9'Importe'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Times New Roman'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      OnDblClick = dbgDetCxPDblClick
    end
  end
  object pnlRegistro: TPanel
    Left = 219
    Top = 334
    Width = 361
    Height = 185
    BevelInner = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 6
    Visible = False
    object lblTipReg: TLabel
      Left = 25
      Top = 31
      Width = 84
      Height = 15
      Caption = 'Tipo de Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblCnpEgr: TLabel
      Left = 25
      Top = 55
      Width = 50
      Height = 15
      Caption = 'Concepto:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblCCosto: TLabel
      Left = 25
      Top = 103
      Width = 80
      Height = 15
      Caption = 'Centro de Costo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblDH: TLabel
      Left = 25
      Top = 131
      Width = 79
      Height = 15
      Caption = '[D]ebe/[H]aber'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblImporte: TLabel
      Left = 152
      Top = 131
      Width = 47
      Height = 15
      Caption = 'Importe :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 25
      Top = 79
      Width = 28
      Height = 15
      Caption = 'Glosa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblCuenta: TLabel
      Left = 208
      Top = 53
      Width = 38
      Height = 15
      Caption = 'Cuenta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcTipReg: TwwDBLookupCombo
      Left = 111
      Top = 25
      Width = 45
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TREGID'#9'3'#9'Id'#9'F'
        'TREGDES'#9'30'#9'Descripci'#243'n'#9'F')
      DataField = 'TREGID'
      LookupField = 'TREGID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcdCnpEgr: TwwDBLookupComboDlg
      Left = 111
      Top = 49
      Width = 90
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Concepto'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'CPTOID'#9'15'#9'Concepto'#9'F'
        'CPTODES'#9'40'#9'Descripci'#243'n'#9'F'
        'CUENTAID'#9'20'#9'Cuenta'#9'F')
      DataField = 'CPTOID'
      LookupField = 'CPTOID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 15
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcdCnpEgrEnter
      OnExit = dblcdCnpEgrExit
    end
    object dblcdCCosto: TwwDBLookupComboDlg
      Left = 111
      Top = 98
      Width = 90
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Centro de Costo'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'CCOSID'#9'15'#9'Id'#9'F'
        'CCOSDES'#9'30'#9'Centro de Costo'#9'F')
      DataField = 'CCOSID'
      LookupField = 'CCOSID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      Enabled = False
      MaxLength = 12
      ParentFont = False
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
    end
    object edtTipReg: TEdit
      Left = 158
      Top = 25
      Width = 182
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtCCosto: TEdit
      Left = 203
      Top = 98
      Width = 137
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object dbeImporte: TwwDBEdit
      Left = 204
      Top = 125
      Width = 136
      Height = 23
      DataField = 'DCPMOORI'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = False
    end
    object dbeDH: TwwDBEdit
      Left = 111
      Top = 124
      Width = 34
      Height = 23
      CharCase = ecUpperCase
      DataField = 'DCPDH'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnRegOk: TBitBtn
      Left = 278
      Top = 152
      Width = 30
      Height = 25
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = bbtnRegOkClick
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
    object bbtnRegCanc: TBitBtn
      Left = 310
      Top = 152
      Width = 30
      Height = 25
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
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
    object dbeCuenta: TwwDBEdit
      Left = 246
      Top = 49
      Width = 94
      Height = 23
      DataField = 'CUENTAID'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeGlosaDet: TwwDBEdit
      Left = 111
      Top = 73
      Width = 229
      Height = 23
      CharCase = ecUpperCase
      DataField = 'DCPGLOSA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object StaticText1: TStaticText
      Left = 4
      Top = 4
      Width = 349
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSingle
      Caption = 'Detalle de Provisiones'
      Color = 8389376
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object edtPresup: TEdit
      Left = 403
      Top = 144
      Width = 137
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
  end
  object btnActReg: TBitBtn
    Left = 8
    Top = 531
    Width = 30
    Height = 27
    Hint = 'Generar Registro'
    TabOrder = 7
    OnClick = btnActRegClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFB
      FB0555557F555555557F55500FBFBFBFBF0555577F555555557F550B0BFBFBFB
      FB05557F7F555555557F500F0FBFBFBFBF05577F7F555555557F0B0B0BFBFBFB
      FB057F7F7F555555557F0F0F0FBFBFBFBF057F7F7FFFFFFFFF750B0B00000000
      00557F7F7777777777550F0FB0FBFB0F05557F7FF75FFF7575550B0007000070
      55557F777577775755550FB0FBFB0F0555557FF75FFF75755555000700007055
      5555777577775755555550FBFB0555555555575FFF7555555555570000755555
      5555557777555555555555555555555555555555555555555555}
    NumGlyphs = 2
  end
end
