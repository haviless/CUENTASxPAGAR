object FCanjeLT: TFCanjeLT
  Left = 198
  Top = 56
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Aplicaci'#243'n de Letras Anticipadas'
  ClientHeight = 551
  ClientWidth = 792
  Color = 14869218
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
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 129
    Align = alTop
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 0
    object lblCia: TLabel
      Left = 10
      Top = 3
      Width = 51
      Height = 16
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 192
      Top = 3
      Width = 37
      Height = 16
      Caption = 'Cl.Aux'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblprov: TLabel
      Left = 244
      Top = 3
      Width = 57
      Height = 16
      Caption = 'Proveedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRuc: TLabel
      Left = 336
      Top = 3
      Width = 39
      Height = 16
      Caption = 'R.U.C.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblProvNom: TLabel
      Left = 457
      Top = 3
      Width = 71
      Height = 16
      Caption = 'Raz'#243'n Social'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblSerie: TLabel
      Left = 447
      Top = 43
      Width = 31
      Height = 16
      Caption = 'Serie'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNoDoc: TLabel
      Left = 489
      Top = 43
      Width = 82
      Height = 16
      Caption = 'No.Documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFComprob: TLabel
      Left = 11
      Top = 80
      Width = 60
      Height = 16
      Caption = 'F.Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblComprob: TLabel
      Left = 182
      Top = 80
      Width = 69
      Height = 16
      Caption = 'No.Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblLote: TLabel
      Left = 276
      Top = 80
      Width = 26
      Height = 16
      Caption = 'Lote'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTMon: TLabel
      Left = 318
      Top = 80
      Width = 44
      Height = 16
      Caption = 'Moneda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTCam: TLabel
      Left = 485
      Top = 80
      Width = 52
      Height = 16
      Caption = 'T.Cambio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFRecep: TLabel
      Left = 701
      Top = 41
      Width = 67
      Height = 16
      Caption = 'F.Recepci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFEmis: TLabel
      Left = 614
      Top = 42
      Width = 53
      Height = 16
      Caption = 'F.Emisi'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTDoc: TLabel
      Left = 8
      Top = 42
      Width = 61
      Height = 16
      Caption = 'Documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblTDiario: TLabel
      Left = 208
      Top = 42
      Width = 81
      Height = 16
      Caption = 'Tipo de Diario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblAnoMes: TLabel
      Left = 101
      Top = 80
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
      Left = 9
      Top = 18
      Width = 42
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      DataField = 'CIAID'
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Enabled = False
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object edtCia: TEdit
      Left = 52
      Top = 18
      Width = 130
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object dblcClAux: TwwDBLookupCombo
      Left = 188
      Top = 18
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CLAUXID'#9'2'#9'Id.'#9'F'
        'CLAUXDES'#9'30'#9'Clase Auxiliar'#9'F')
      DataField = 'CLAUXID'
      LookupField = 'CLAUXID'
      Options = [loColLines, loRowLines, loTitles]
      Enabled = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object dblcdProv: TwwDBLookupComboDlg
      Left = 242
      Top = 18
      Width = 90
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'PROV'#9'8'#9'Proveedor'#9'F'
        'PROVDES'#9'30'#9'Raz'#243'n Social'#9'F'
        'PROVRUC'#9'10'#9'R.U.C.'#9'F')
      DataField = 'PROV'
      LookupField = 'PROV'
      Enabled = False
      MaxLength = 10
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dblcdProvRuc: TwwDBLookupComboDlg
      Left = 333
      Top = 18
      Width = 120
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'PROVRUC'#9'10'#9'PROVRUC'#9'F'
        'PROV'#9'8'#9'PROV'#9'F'
        'PROVABR'#9'15'#9'PROVABR'#9'F'
        'PROVDES'#9'40'#9'PROVDES'#9'F')
      DataField = 'PROVRUC'
      LookupField = 'PROVRUC'
      Enabled = False
      MaxLength = 12
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      UseTFields = False
    end
    object edtProv: TEdit
      Left = 454
      Top = 18
      Width = 250
      Height = 23
      Enabled = False
      TabOrder = 5
    end
    object edtSerie: TwwDBEdit
      Left = 446
      Top = 58
      Width = 38
      Height = 23
      DataField = 'CPSERIE'
      Enabled = False
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtNoDoc: TwwDBEdit
      Left = 489
      Top = 58
      Width = 121
      Height = 23
      DataField = 'CPNODOC'
      Enabled = False
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dtpFComp: TwwDBDateTimePicker
      Left = 10
      Top = 96
      Width = 81
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'CPFCMPRB'
      Date = 36647.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 14
      OnExit = dtpFCompExit
    end
    object dbeNoReg: TwwDBEdit
      Left = 183
      Top = 96
      Width = 85
      Height = 23
      DataField = 'CPNOREG'
      TabOrder = 16
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeLote: TwwDBEdit
      Left = 274
      Top = 96
      Width = 38
      Height = 23
      DataField = 'DCPLOTE'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTMon: TwwDBLookupCombo
      Left = 318
      Top = 96
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'Moneda'#9'F'
        'TMONDES'#9'25'#9'Descripci'#243'n'#9'F')
      DataField = 'TMONID'
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines, loTitles]
      Enabled = False
      MaxLength = 2
      TabOrder = 18
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTMonExit
    end
    object edtTMon: TEdit
      Left = 371
      Top = 96
      Width = 108
      Height = 23
      Enabled = False
      TabOrder = 19
    end
    object dbeTCambio: TwwDBEdit
      Left = 485
      Top = 96
      Width = 53
      Height = 23
      Ctl3D = True
      DataField = 'CPTCAMPR'
      Enabled = False
      ParentCtl3D = False
      TabOrder = 20
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbdtpFRecep: TwwDBDateTimePicker
      Left = 699
      Top = 58
      Width = 81
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'CPFRECEP'
      Date = 36676.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 13
    end
    object dbdtpFEmis: TwwDBDateTimePicker
      Left = 614
      Top = 58
      Width = 81
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'CPFEMIS'
      Date = 36653.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 12
    end
    object dblcTDoc: TwwDBLookupCombo
      Left = 10
      Top = 58
      Width = 47
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DOCID'#9'2'#9'Id'#9'F'
        'DOCDES'#9'30'#9'Documento'#9'F')
      DataField = 'DOCID'
      LookupField = 'DOCID'
      Options = [loColLines, loRowLines, loTitles]
      Enabled = False
      ParentFont = False
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTDocExit
    end
    object edtTDoc: TEdit
      Left = 61
      Top = 58
      Width = 145
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object dblcTDiario: TwwDBLookupCombo
      Left = 210
      Top = 58
      Width = 47
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TDIARID'#9'2'#9'Tipo de Diario'#9'F'
        'TDIARDES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'TDIARID'
      LookupField = 'TDIARID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      Enabled = False
      MaxLength = 2
      ParentFont = False
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      UseTFields = False
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtTDiario: TEdit
      Left = 260
      Top = 58
      Width = 180
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object meAnoMM: TwwDBEdit
      Left = 96
      Top = 96
      Width = 74
      Height = 23
      DataField = 'CPANOMES'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnOK: TBitBtn
      Left = 751
      Top = 93
      Width = 30
      Height = 28
      Hint = 'Pasa a Registrar Detalle'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
      OnClick = bbtnOKClick
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
  object pnlDetalle: TPanel
    Left = 0
    Top = 134
    Width = 792
    Height = 371
    Align = alBottom
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 1
    object edtFinal: TEdit
      Left = 201
      Top = 3
      Width = 390
      Height = 23
      Color = clBtnShadow
      Ctl3D = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
    object pgcDetalle: TPageControl
      Left = 1
      Top = 27
      Width = 786
      Height = 339
      ActivePage = tbsDocum
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object tbsDocum: TTabSheet
        Caption = 'Documentos'
        object pnlPendientes2: TPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 155
          Align = alTop
          BorderStyle = bsSingle
          TabOrder = 0
          object Label1: TLabel
            Left = 1
            Top = 1
            Width = 772
            Height = 14
            Align = alTop
            AutoSize = False
            BiDiMode = bdRightToLeft
            Caption = '   Documentos Selecci'#243'n: Pendientes'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentColor = False
            ParentFont = False
          end
          object dbgPendientes2: TwwDBGrid
            Left = 1
            Top = 15
            Width = 772
            Height = 135
            DisableThemesInTitle = False
            Selected.Strings = (
              'TDIARID'#9'3'#9'TD'#9'F'
              'CPANOMES'#9'6'#9'Periodo'#9'F'
              'CPNOREG'#9'11'#9'No.Reg'#9'F'
              'CPSERIE'#9'5'#9'Serie'#9'F'
              'CPNODOC'#9'14'#9'No.Doc'#9'F'
              'CPFEMIS'#9'10'#9'Fecha~Emisi'#243'n'#9'F'
              'CPTCAMPR'#9'7'#9'T.Cambio~Provisi'#243'n'#9'F'
              'TMONID'#9'5'#9'Moneda'#9'F'
              'CPMTOORI'#9'12'#9'Total'#9'F'
              'CPSALLOC'#9'12'#9'Saldo~Mon.Loc.'#9'F'
              'CPSALEXT'#9'12'#9'Saldo~Mon.Ext.'#9'F')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            IniAttributes.Delimiter = ';;'
            TitleColor = 11974251
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            KeyOptions = [dgEnterToTab, dgAllowDelete]
            MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clNavy
            TitleFont.Height = -12
            TitleFont.Name = 'Comic Sans MS'
            TitleFont.Style = []
            TitleLines = 2
            TitleButtons = False
            UseTFields = False
            OnDragOver = dbgPendientes2DragOver
            OnEndDrag = dbgPendientes2EndDrag
            OnMouseDown = dbgPendientes2MouseDown
          end
        end
        object pnlDetCanje: TPanel
          Left = 81
          Top = 163
          Width = 577
          Height = 145
          BorderStyle = bsSingle
          Caption = 'pnlDetCanje'
          TabOrder = 1
          object Label4: TLabel
            Left = 1
            Top = 1
            Width = 571
            Height = 14
            Align = alTop
            AutoSize = False
            BiDiMode = bdRightToLeft
            Caption = '   Amortizaci'#243'n de Documentos'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentColor = False
            ParentFont = False
          end
          object dbgDetCanje: TwwDBGrid
            Left = 1
            Top = 15
            Width = 571
            Height = 125
            DisableThemesInTitle = False
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Color = 15263976
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            KeyOptions = []
            MultiSelectOptions = [msoShiftSelect]
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clNavy
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            TitleLines = 2
            TitleButtons = False
            OnColExit = dbgDetCanjeColExit
            OnDragOver = dbgDetCanjeDragOver
            OnEndDrag = dbgDetCanjeEndDrag
            OnKeyPress = dbgDetCanjeKeyPress
            OnMouseDown = dbgDetCanjeMouseDown
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Aplicaci'#243'n de Letras'
        ImageIndex = 1
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 39
          Align = alTop
          Color = 12904163
          TabOrder = 0
          object sbtABl: TSpeedButton
            Left = 5
            Top = 4
            Width = 137
            Height = 32
            Hint = 'Aceptaci'#243'n'
            Caption = 'Generar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000C40E0000C40E00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555555555555555555555555555555555555555FF5555555555555C055555
              55555555577FF55555555555CCC05555555555557777F55555555555CCC05555
              555555557777FF555555555CCCCC05555555555777777F55555555CCCCCC0555
              5555557777777FF555555CCC05CCC05555555777757777F55555CC05555CC055
              55557775555777FF55555555555CCC05555555555557777F555555555555CC05
              555555555555777FF555555555555CC05555555555555777FF555555555555CC
              05555555555555777FF555555555555CC05555555555555777FF555555555555
              5CC0555555555555577755555555555555555555555555555555}
            Layout = blGlyphRight
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtABlClick
          end
        end
        object dbgDetCxP: TwwDBGrid
          Left = 0
          Top = 39
          Width = 778
          Height = 269
          DisableThemesInTitle = False
          Selected.Strings = (
            'DCPREG'#9'3'#9'Item'#9'F'
            'TREGID'#9'3'#9'TR'#9'F'
            'CPTOID'#9'11'#9'Concepto'#9'F'
            'CUENTAID'#9'13'#9'Cuenta~Contable'#9'F'
            'DCPGLOSA'#9'30'#9'Glosa'#9'F'
            'CCOSID'#9'10'#9'Centro de~Costo'#9'F'
            'DCPDH'#9'4'#9'Debe~Haber'#9'F'
            'DCPMOORI'#9'12'#9'Importe'#9'F'
            'PARPRESID'#9'9'#9'Partida~Presupuestal'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = 11974251
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
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
        end
      end
    end
  end
  object pnlPie: TPanel
    Left = 0
    Top = 505
    Width = 792
    Height = 46
    Align = alBottom
    BorderStyle = bsSingle
    Color = 14869218
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    object Z2bbtnAcepta: TBitBtn
      Left = 737
      Top = 6
      Width = 32
      Height = 31
      Hint = 'Aceptado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Z2bbtnAceptaClick
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
    object bbtnSumat: TBitBtn
      Left = 109
      Top = 6
      Width = 32
      Height = 32
      Hint = 'Sumatoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      OnClick = bbtnSumatClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
        03333377777777777F33333003333330033333377FF333377F33333300333333
        0333333377FF33337F3333333003333303333333377FF3337333333333003333
        333333333377FF3333333333333003333333333333377FF33333333333330033
        3333333333337733333333333330033333333333333773333333333333003333
        33333333337733333F3333333003333303333333377333337F33333300333333
        03333333773333337F33333003333330033333377FFFFFF77F33330000000000
        0333337777777777733333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnCancela: TBitBtn
      Left = 702
      Top = 6
      Width = 32
      Height = 31
      Hint = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnCancelaClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        04000000000068010000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033911833333333333333333F333333333333
        0000339111833333911333333388F333333F3333000033911118333911118333
        38F38F333F88F33300003339111183911111833338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003339
        1118333911183333338F33838F338F33000033911183333391118333338FF833
        38F338F300003391183333333911133333388333338FFF830000333913333333
        3391833333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object Z2bbtnGraba: TBitBtn
      Left = 651
      Top = 6
      Width = 30
      Height = 30
      Hint = 'Grabar Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Z2bbtnGrabaClick
      Glyph.Data = {
        8A010000424D8A01000000000000760000002800000017000000170000000100
        04000000000014010000CE0E0000D80E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333303000077777777777770003300000078888888888880000300000
        0780088888888800003000000780088888888800003000000780088888888800
        0030000007888888888888000030000000000000000000000030000000000000
        0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
        00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
        FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
        0030300099999999999999000330}
    end
  end
end
