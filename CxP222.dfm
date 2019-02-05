object FCanjeNC: TFCanjeNC
  Left = 264
  Top = 77
  Width = 810
  Height = 551
  Caption = 'Canje de Notas de Cr'#233'dito'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecera: TPanel
    Left = 3
    Top = 1
    Width = 789
    Height = 88
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 0
    object lblCia: TLabel
      Left = 10
      Top = 3
      Width = 58
      Height = 13
      Caption = 'Compa'#241#237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 192
      Top = 3
      Width = 37
      Height = 13
      Caption = 'Cl.Aux'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblprov: TLabel
      Left = 244
      Top = 3
      Width = 59
      Height = 13
      Caption = 'Proveedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRuc: TLabel
      Left = 336
      Top = 3
      Width = 39
      Height = 13
      Caption = 'R.U.C.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblProvNom: TLabel
      Left = 457
      Top = 2
      Width = 76
      Height = 13
      Caption = 'Raz'#243'n Social'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblSerie: TLabel
      Left = 604
      Top = 3
      Width = 30
      Height = 13
      Caption = 'Serie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNoDoc: TLabel
      Left = 646
      Top = 3
      Width = 85
      Height = 13
      Caption = 'No.Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFComprob: TLabel
      Left = 10
      Top = 42
      Width = 59
      Height = 13
      Caption = 'F.Registro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblComprob: TLabel
      Left = 95
      Top = 42
      Width = 68
      Height = 13
      Caption = 'No.Registro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblLote: TLabel
      Left = 189
      Top = 42
      Width = 26
      Height = 13
      Caption = 'Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTMon: TLabel
      Left = 231
      Top = 42
      Width = 46
      Height = 13
      Caption = 'Moneda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTCam: TLabel
      Left = 397
      Top = 42
      Width = 54
      Height = 13
      Caption = 'T.Cambio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFRecep: TLabel
      Left = 460
      Top = 42
      Width = 73
      Height = 13
      Caption = 'F.Recepci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFEmis: TLabel
      Left = 545
      Top = 42
      Width = 55
      Height = 13
      Caption = 'F.Emisi'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblcCia: TwwDBLookupCombo
      Left = 9
      Top = 18
      Width = 42
      Height = 21
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
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object dblcClAux: TwwDBLookupCombo
      Left = 188
      Top = 18
      Width = 49
      Height = 21
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
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcdProv: TwwDBLookupComboDlg
      Left = 242
      Top = 18
      Width = 90
      Height = 21
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
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcdProvRuc: TwwDBLookupComboDlg
      Left = 333
      Top = 18
      Width = 120
      Height = 21
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
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
    end
    object edtProv: TEdit
      Left = 454
      Top = 18
      Width = 140
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object edtSerie: TwwDBEdit
      Left = 603
      Top = 18
      Width = 38
      Height = 21
      DataField = 'CPSERIE'
      Enabled = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtNoDoc: TwwDBEdit
      Left = 646
      Top = 18
      Width = 121
      Height = 21
      DataField = 'CPNODOC'
      Enabled = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dtpFComp: TwwDBDateTimePicker
      Left = 9
      Top = 56
      Width = 81
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'CPFCMPRB'
      Date = 36647.000000000000000000
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 8
    end
    object dbeNoReg: TwwDBEdit
      Left = 96
      Top = 56
      Width = 85
      Height = 21
      DataField = 'CPNOREG'
      Enabled = False
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeLote: TwwDBEdit
      Left = 187
      Top = 56
      Width = 38
      Height = 21
      DataField = 'DCPLOTE'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTMon: TwwDBLookupCombo
      Left = 231
      Top = 56
      Width = 49
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'Moneda'#9'F'
        'TMONDES'#9'25'#9'Descripci'#243'n'#9'F')
      DataField = 'TMONID'
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines, loTitles]
      Enabled = False
      MaxLength = 2
      TabOrder = 11
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object edtTMon: TEdit
      Left = 284
      Top = 56
      Width = 108
      Height = 21
      Enabled = False
      TabOrder = 12
    end
    object dbeTCambio: TwwDBEdit
      Left = 398
      Top = 56
      Width = 53
      Height = 21
      Ctl3D = True
      DataField = 'CPTCAMPR'
      Enabled = False
      ParentCtl3D = False
      TabOrder = 13
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbdtpFRecep: TwwDBDateTimePicker
      Left = 458
      Top = 56
      Width = 81
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'CPFRECEP'
      Date = 36676.000000000000000000
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 14
    end
    object dbdtpFEmis: TwwDBDateTimePicker
      Left = 545
      Top = 56
      Width = 81
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'CPFEMIS'
      Date = 36653.000000000000000000
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 15
    end
  end
  object pnlDetalle: TPanel
    Left = 3
    Top = 92
    Width = 789
    Height = 372
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 1
    object tnbkDetalle: TTabbedNotebook
      Left = 9
      Top = 35
      Width = 766
      Height = 328
      TabFont.Charset = ANSI_CHARSET
      TabFont.Color = clBtnText
      TabFont.Height = -12
      TabFont.Name = 'Century Gothic'
      TabFont.Style = [fsBold]
      TabOrder = 0
      object TTabPage
        Left = 4
        Top = 24
        Caption = 'Aplicaci'#243'n de Cr'#233'dito a Docs.'
        object pnlPendientes2: TPanel
          Left = 13
          Top = 2
          Width = 734
          Height = 139
          BorderStyle = bsSingle
          TabOrder = 0
          object Label1: TLabel
            Left = 1
            Top = 1
            Width = 728
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
            Top = 16
            Width = 727
            Height = 116
            DisableThemesInTitle = False
            Selected.Strings = (
              'TDIARID'#9'3'#9'TD'#9'F'
              'CPANOMES'#9'6'#9'Periodo'#9'F'
              'CPNOREG'#9'11'#9'No.Reg'#9'F'
              'CPSERIE'#9'5'#9'Serie'#9'F'
              'CPNODOC'#9'15'#9'No.Doc'#9'F'
              'CPFEMIS'#9'11'#9'Fecha~Emisi'#243'n'#9'F'
              'CPTCAMPR'#9'7'#9'T.Cambio~Provisi'#243'n'#9'F'
              'TMONID'#9'2'#9'Moneda'#9'F'
              'CPMTOORI'#9'12'#9'Total'#9'F'
              'CPSALLOC'#9'12'#9'Saldo~Mon.Loc.'#9'F'
              'CPSALEXT'#9'12'#9'Saldo~Mon.Ext.'#9'F')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            IniAttributes.Delimiter = ';;'
            TitleColor = 7566265
            FixedCols = 0
            ShowHorzScrollBar = True
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
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
          Left = 92
          Top = 146
          Width = 567
          Height = 145
          BorderStyle = bsSingle
          Caption = 'pnlDetCanje'
          TabOrder = 1
          object Label4: TLabel
            Left = 1
            Top = 1
            Width = 561
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
            Left = -2
            Top = 16
            Width = 567
            Height = 127
            DisableThemesInTitle = False
            Selected.Strings = (
              'lkDocID'#9'5'#9'DOC'#9'T'
              'CPSERIE'#9'5'#9'Serie'#9'T'
              'CPNODOC'#9'16'#9'No.Documento'#9'T'
              'CCPFCJE'#9'12'#9'Fecha~Aplicaci'#243'n'#9'F'
              'lkTMonID'#9'6'#9'TM'#9'T'
              'DCDTCAMB'#9'8'#9'Tipo de~Cambio'#9'F'
              'DCDMOLOC'#9'15'#9'Amortizaci'#243'n~Mon.Local'#9'F'
              'DCDMOEXT'#9'15'#9'Amortizaci'#243'n~Mon.Extranjera'#9'F')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            IniAttributes.Delimiter = ';;'
            TitleColor = 7566265
            FixedCols = 0
            ShowHorzScrollBar = True
            Color = 15263976
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = [dgEnterToTab]
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
            UseTFields = False
            OnColExit = dbgDetCanjeColExit
            OnDragOver = dbgDetCanjeDragOver
            OnEndDrag = dbgDetCanjeEndDrag
            OnMouseDown = dbgDetCanjeMouseDown
          end
        end
      end
    end
    object edtFinal: TEdit
      Left = 176
      Top = 5
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
      TabOrder = 1
    end
  end
  object pnlPie: TPanel
    Left = 3
    Top = 466
    Width = 789
    Height = 46
    BorderStyle = bsSingle
    Color = 14869218
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    object Z2bbtnAcepta: TBitBtn
      Left = 625
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
    object Z2bbtnPAplica: TBitBtn
      Left = 587
      Top = 6
      Width = 32
      Height = 31
      Hint = 'Previa Contabilizaci'#243'n'
      Caption = 'A'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Z2bbtnPAplicaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
    end
    object Z2bbtnContab: TBitBtn
      Left = 663
      Top = 6
      Width = 32
      Height = 31
      Hint = 'Contabilizado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Z2bbtnContabClick
      Glyph.Data = {
        06020000424D060200000000000076000000280000001A000000190000000100
        04000000000090010000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888880000008BBBBBBBBBBBBBBBBBBBBBBBB8000000B00000000000
        0000000000000B000000B000000000000000000000000B000000B00000000000
        0000000000000B000000B000000000000000000000000B000000B00000BBBBBB
        BBBBBBBBB0000B000000B000000000000000000000000B000000B000BBBBBBBB
        BBBBBBBBBBB00B000000B000000000000000000000000B000000B00000000000
        0000000000000B000000B0BBBB0BBB0B0B0B0BBB0BBB0B000000B0B00B0B0B0B
        0B0B0B0B0B0B0B000000B0B00B0B0B0B0B0B0BBB0B0B0B000000B0B0000B0B0B
        0B0B000B0B0B0B000000B0B0000BBB0BBB0B0BBB0BBB0B000000B0B000000000
        000B00000B000B000000B0B00B00000000BBB0000B000B000000B0BBBB000000
        000B000000000B000000B000000000000000000000000B000000B00000000000
        0000000000000B000000B000000000000000000000000B000000B00000000000
        0000000000000B0000008BBBBBBBBBBBBBBBBBBBBBBBB8000000888888888888
        88888888888888000000}
    end
    object pnlEstado: TPanel
      Left = 329
      Top = 6
      Width = 132
      Height = 32
      Color = cl3DLight
      TabOrder = 5
      object lblAcepta: TLabel
        Left = 24
        Top = 7
        Width = 68
        Height = 15
        Caption = 'ACEPTADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblContab: TLabel
        Left = 10
        Top = 9
        Width = 105
        Height = 15
        Caption = 'CONTABILIZADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblAnula: TLabel
        Left = 30
        Top = 8
        Width = 62
        Height = 15
        Caption = 'ANULADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblActivo: TLabel
        Left = 35
        Top = 7
        Width = 49
        Height = 15
        Caption = 'ACTIVO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEliminado: TLabel
        Left = 29
        Top = 8
        Width = 71
        Height = 15
        Caption = 'ELIMINADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
    end
  end
  object pprPreview: TppReport
    AutoStop = False
    DataPipeline = ppdbpPreview
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rPreview'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 280000
    PrinterSetup.mmPaperWidth = 225000
    PrinterSetup.PaperSize = 123
    Template.FileName = 'C:\SOLExes\SOLFormatos\CxP\Incoresa\CxPVoucher.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprPreviewPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 40
    Top = 403
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbpPreview'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 57150
      mmPrintPosition = 0
      object pplblCiaDes: TppLabel
        UserName = 'lblCiaDes'
        Caption = 'Nombre de la compa'#241'ia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 13494
        mmTop = 1323
        mmWidth = 32279
        BandType = 0
      end
      object ppsvFecha: TppSystemVariable
        UserName = 'svFecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 162190
        mmTop = 1323
        mmWidth = 14288
        BandType = 0
      end
      object pplblModulo: TppLabel
        UserName = 'lblModulo'
        Caption = 'Cuentas por Pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 5821
        mmWidth = 25665
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'lblPeriodo1'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 75671
        mmTop = 11113
        mmWidth = 10583
        BandType = 0
      end
      object pplblNroComp: TppLabel
        UserName = 'lblNroComp'
        Caption = 'No.Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 102923
        mmTop = 22225
        mmWidth = 23283
        BandType = 0
      end
      object pplblTDiario: TppLabel
        UserName = 'lblTDiario'
        Caption = 'lblTDiario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 26988
        mmWidth = 11377
        BandType = 0
      end
      object pplblDiarioDes: TppLabel
        UserName = 'lblDiarioDes'
        AutoSize = False
        Caption = 'este es el diari'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 14817
        mmTop = 26988
        mmWidth = 59531
        BandType = 0
      end
      object pplblAnoMes: TppLabel
        UserName = 'lblAnoMes'
        Caption = 'lblAnoMes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 15875
        mmWidth = 13229
        BandType = 0
      end
      object pplblNoCompro: TppLabel
        UserName = 'lblNoCompro'
        Caption = 'lblNoCompro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 102923
        mmTop = 26988
        mmWidth = 16669
        BandType = 0
      end
      object pplblProvDes: TppLabel
        UserName = 'lblProvDes'
        Caption = 'Nombre:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 34131
        mmWidth = 10583
        BandType = 0
      end
      object pplblProveedor: TppLabel
        UserName = 'lblProveedor'
        AutoSize = False
        Caption = 'lblProveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23283
        mmTop = 34131
        mmWidth = 107950
        BandType = 0
      end
      object pplblMoneda: TppLabel
        UserName = 'lblMoneda1'
        Caption = 'Moneda  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 135996
        mmTop = 39158
        mmWidth = 12171
        BandType = 0
      end
      object pplblMonedaDes: TppLabel
        UserName = 'lblMonedaDes'
        AutoSize = False
        Caption = 'lblMonedaDes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 39158
        mmWidth = 25929
        BandType = 0
      end
      object pplblGlosa: TppLabel
        UserName = 'lblGlosa1'
        Caption = 'Glosa :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 44450
        mmWidth = 8202
        BandType = 0
      end
      object pplblGlosaDes: TppLabel
        UserName = 'lblGlosa'
        Caption = 'lblGlosa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23283
        mmTop = 44450
        mmWidth = 11642
        BandType = 0
      end
      object pplblSerie: TppLabel
        UserName = 'lblSerie'
        Caption = 'SER.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 50536
        mmWidth = 5821
        BandType = 0
      end
      object pplblNoDoc: TppLabel
        UserName = 'lblNoDoc'
        Caption = 'NO.DOC.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 16933
        mmTop = 50536
        mmWidth = 11906
        BandType = 0
      end
      object pplblFEmision: TppLabel
        UserName = 'lblFEmision'
        Caption = 'F.Emisi'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 75671
        mmTop = 22225
        mmWidth = 13494
        BandType = 0
      end
      object pplblCuenta: TppLabel
        UserName = 'lblCuenta'
        AutoSize = False
        Caption = ' CUENTA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 50536
        mmWidth = 16140
        BandType = 0
      end
      object pplblDescrip: TppLabel
        UserName = 'Label10'
        Caption = 'DESCRIPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 75142
        mmTop = 50536
        mmWidth = 19050
        BandType = 0
      end
      object pplblProvId: TppLabel
        UserName = 'Label7'
        Caption = 'C'#243'd.Prov'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 39158
        mmWidth = 11642
        BandType = 0
      end
      object pplblCCosto: TppLabel
        UserName = 'Label15'
        Caption = 'C.CTO.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 112713
        mmTop = 50536
        mmWidth = 9525
        BandType = 0
      end
      object pplblCntTCambio: TppLabel
        UserName = 'Label1'
        Caption = 'T.C.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 98690
        mmTop = 39952
        mmWidth = 5556
        BandType = 0
      end
      object pplblMonedaDoc: TppLabel
        UserName = 'lblMonedaDoc'
        Caption = 'US$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132292
        mmTop = 50536
        mmWidth = 5027
        BandType = 0
      end
      object pplblDebe: TppLabel
        UserName = 'lblDebe'
        Caption = 'DEBE (S/.)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 143140
        mmTop = 50536
        mmWidth = 13494
        BandType = 0
      end
      object pplblHaber: TppLabel
        UserName = 'lblHaber'
        Caption = 'HABER (S/.)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161132
        mmTop = 50536
        mmWidth = 15610
        BandType = 0
      end
      object pplblCodProv: TppLabel
        UserName = 'Label11'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23283
        mmTop = 39158
        mmWidth = 16404
        BandType = 0
      end
      object ppdbCntTCambio: TppDBText
        UserName = 'dbCntTCambio'
        DataField = 'CNTTCAMBIO'
        DataPipeline = ppdbpPreview
        DisplayFormat = '###,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 104775
        mmTop = 39952
        mmWidth = 7938
        BandType = 0
      end
      object pplblFecComp: TppLabel
        UserName = 'Label13'
        Caption = 'F.Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 102923
        mmTop = 11113
        mmWidth = 21167
        BandType = 0
      end
      object ppdbCia: TppDBText
        UserName = 'dbCia'
        DataField = 'CIAID'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 1323
        mmWidth = 7144
        BandType = 0
      end
      object pplblFecEmision: TppLabel
        UserName = 'lblFecEmision'
        Caption = 'lblFecEmision'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 26988
        mmWidth = 17198
        BandType = 0
      end
      object ppdbFecComp: TppDBText
        UserName = 'dbFecComp'
        DataField = 'CNTFCOMP'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 102923
        mmTop = 16140
        mmWidth = 17198
        BandType = 0
      end
      object pplblEstado: TppLabel
        UserName = 'Label24'
        Caption = 'Estado  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 135996
        mmTop = 44450
        mmWidth = 10583
        BandType = 0
      end
      object ppLblDesEstado: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = 'Label25'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 44450
        mmWidth = 17463
        BandType = 0
      end
      object pplblTit: TppLabel
        UserName = 'Label20'
        Caption = 'Impresi'#243'n de Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 76200
        mmTop = 1323
        mmWidth = 37571
        BandType = 0
      end
      object pplblFecha: TppLabel
        UserName = 'Label27'
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 147109
        mmTop = 1323
        mmWidth = 9790
        BandType = 0
      end
      object ppraya1: TppLabel
        UserName = 'Label28'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 29898
        mmWidth = 169334
        BandType = 0
      end
      object ppraya2: TppLabel
        UserName = 'Label29'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 47361
        mmWidth = 169334
        BandType = 0
      end
      object ppraya3: TppLabel
        UserName = 'Label31'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 53446
        mmWidth = 169334
        BandType = 0
      end
      object pplblItem: TppLabel
        UserName = 'Label33'
        Caption = 'It.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 50536
        mmWidth = 2910
        BandType = 0
      end
      object pplblFecDoc: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 45508
        mmTop = 50536
        mmWidth = 17463
        BandType = 0
      end
      object pplblImporte: TppLabel
        UserName = 'Label8'
        Caption = 'Importe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 166159
        mmTop = 22225
        mmWidth = 10848
        BandType = 0
      end
      object pplblMontoImporte: TppLabel
        UserName = 'Label19'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 162719
        mmTop = 26988
        mmWidth = 14288
        BandType = 0
      end
      object pplblTipCam: TppLabel
        UserName = 'lblTipCam'
        Caption = 'T.Cambio:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 135996
        mmTop = 34131
        mmWidth = 12965
        BandType = 0
      end
      object pplblHora: TppLabel
        UserName = 'Label26'
        Caption = 'Hora :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 147638
        mmTop = 5821
        mmWidth = 8731
        BandType = 0
      end
      object ppsvHora: TppSystemVariable
        UserName = 'svHora'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 160073
        mmTop = 5821
        mmWidth = 16933
        BandType = 0
      end
      object pplblTipoCamb: TppLabel
        UserName = 'lblTipoCamb'
        AutoSize = False
        Caption = 'lblTipoCamb'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 155575
        mmTop = 34131
        mmWidth = 13229
        BandType = 0
      end
      object pplblDiario: TppLabel
        UserName = 'lblDiario1'
        Caption = 'Diario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 22225
        mmWidth = 8731
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      BeforePrint = ppDetailBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppdbSerie: TppDBText
        UserName = 'dbSerie'
        DataField = 'CNTSERIE'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 529
        mmWidth = 6879
        BandType = 4
      end
      object ppdbNoDoc: TppDBText
        UserName = 'dbNoDoc'
        DataField = 'CNTNODOC'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 17463
        mmTop = 529
        mmWidth = 10583
        BandType = 4
      end
      object ppdbCuenta: TppDBText
        UserName = 'dbCuenta'
        DataField = 'CUENTAID'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 28310
        mmTop = 529
        mmWidth = 15610
        BandType = 4
      end
      object ppdbDebe: TppDBText
        UserName = 'dbDebe'
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbpPreview
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 138377
        mmTop = 529
        mmWidth = 18256
        BandType = 4
      end
      object ppdbHaber: TppDBText
        UserName = 'dbHaber'
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbpPreview
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 265
        mmWidth = 18256
        BandType = 4
      end
      object ppdbGlosa: TppDBText
        UserName = 'dbGlosa'
        DataField = 'CNTGLOSA'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 60854
        mmTop = 529
        mmWidth = 52123
        BandType = 4
      end
      object ppdbCCos: TppDBText
        UserName = 'dbCCos'
        DataField = 'CCOSID'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 529
        mmWidth = 9790
        BandType = 4
      end
      object ppdbMtoExt: TppDBText
        UserName = 'dbMtoExt'
        DataField = 'CNTMTOEXT'
        DataPipeline = ppdbpPreview
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 123031
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppdbFEmis: TppDBText
        UserName = 'dbFEmis'
        DataField = 'CNTFEMIS'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppdbItem: TppDBText
        UserName = 'dbItem'
        DataField = 'CNTREG'
        DataPipeline = ppdbpPreview
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3704
        mmLeft = 5821
        mmTop = 529
        mmWidth = 2646
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppdbcDebe: TppDBCalc
        UserName = 'dbcDebe'
        AutoSize = True
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbpPreview
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3260
        mmLeft = 130715
        mmTop = 2646
        mmWidth = 25654
        BandType = 7
      end
      object ppdbcHaber: TppDBCalc
        UserName = 'dbcHaber'
        AutoSize = True
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbpPreview
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3260
        mmLeft = 151088
        mmTop = 2646
        mmWidth = 25654
        BandType = 7
      end
      object ppRaya4: TppLabel
        UserName = 'Label32'
        Caption = '-------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 145786
        mmTop = 0
        mmWidth = 39158
        BandType = 7
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = '====================================='
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 5821
        mmWidth = 58738
        BandType = 7
      end
    end
  end
  object ppdbpPreview: TppDBPipeline
    UserName = 'dbpPreview'
    Left = 79
    Top = 402
  end
end
