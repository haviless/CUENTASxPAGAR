object FProvision: TFProvision
  Left = 150
  Top = 79
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Provisiones por Pagar '
  ClientHeight = 574
  ClientWidth = 795
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = [fsBold]
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
  TextHeight = 16
  object pnlActuali: TPanel
    Left = 312
    Top = 384
    Width = 184
    Height = 57
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Color = 10207162
    Enabled = False
    TabOrder = 4
    Visible = False
    object lblActuali: TLabel
      Left = 2
      Top = 2
      Width = 176
      Height = 49
      Align = alClient
      Alignment = taCenter
      Caption = 'Actualizando...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
  end
  object pnlDetalle: TPanel
    Left = 6
    Top = 241
    Width = 779
    Height = 281
    BevelInner = bvRaised
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 14869218
    Enabled = False
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 6
      Top = 5
      Width = 767
      Height = 267
      ActivePage = TabSheet1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = 'Detalle del Documento'
        object dbgDetCxP: TwwDBGrid
          Left = 0
          Top = 3
          Width = 758
          Height = 235
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
          TabOrder = 0
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
          OnKeyDown = dbgDetCxPKeyDown
          object btnActReg: TwwIButton
            Left = 0
            Top = 0
            Width = 25
            Height = 32
            Hint = 'A'#241'ade Registros'
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
            ParentShowHint = False
            ShowHint = True
            OnClick = btnActRegClick
          end
        end
        object lbDTRCpto: TListBox
          Left = 616
          Top = 152
          Width = 49
          Height = 33
          ItemHeight = 15
          TabOrder = 1
          Visible = False
        end
        object lbDTRPorc: TListBox
          Left = 616
          Top = 192
          Width = 49
          Height = 33
          ItemHeight = 15
          TabOrder = 2
          Visible = False
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Documentos de Referencia'
        ImageIndex = 1
        object pnlPendientes: TPanel
          Left = 15
          Top = 3
          Width = 726
          Height = 130
          BorderStyle = bsSingle
          TabOrder = 1
          object Label7: TLabel
            Left = 1
            Top = 1
            Width = 720
            Height = 14
            Align = alTop
            AutoSize = False
            BiDiMode = bdRightToLeft
            Caption = ' Seleccionar Documento(s) '
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
          object dbgPendientes: TwwDBGrid
            Left = -2
            Top = 16
            Width = 726
            Height = 109
            DisableThemesInTitle = False
            Selected.Strings = (
              'TDIARID'#9'3'#9'TD'#9'F'
              'CPNOREG'#9'11'#9'No.Reg'#9'F'
              'CPANOMES'#9'7'#9'Periodo'#9'F'
              'CPSERIE'#9'6'#9'Serie'#9'F'
              'CPNODOC'#9'15'#9'No.Documento'#9'F'
              'CPFCMPRB'#9'11'#9'Fecha~Comprobante'#9'F'
              'CPTCAMPR'#9'9'#9'T.Cambio~Provisi'#243'n'#9'F'
              'CPMTOORI'#9'15'#9'Total'#9'F'
              'CPSALLOC'#9'14'#9'Saldo~Mon.Local'#9'F'
              'CPSALEXT'#9'14'#9'Saldo~Mon.Extranjera'#9'F')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            IniAttributes.Delimiter = ';;'
            TitleColor = 7566265
            FixedCols = 0
            ShowHorzScrollBar = True
            Color = clInfoBk
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = [dgEnterToTab, dgAllowDelete]
            MultiSelectOptions = [msoShiftSelect]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
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
            OnDragOver = dbgPendientesDragOver
            OnEndDrag = dbgPendientesEndDrag
            OnMouseDown = dbgPendientesMouseDown
            FooterColor = clWindow
            FooterCellColor = clBlack
          end
        end
        object pnlCanje: TPanel
          Left = 88
          Top = 140
          Width = 567
          Height = 95
          BorderStyle = bsSingle
          Caption = 'Panel1'
          TabOrder = 0
          object Label2: TLabel
            Left = 1
            Top = 1
            Width = 561
            Height = 14
            Align = alTop
            AutoSize = False
            BiDiMode = bdRightToLeft
            Caption = '   Documentos de Referencia'
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
          object dbgCanje: TwwDBGrid
            Left = 1
            Top = 15
            Width = 561
            Height = 75
            DisableThemesInTitle = False
            Selected.Strings = (
              'DOCID'#9'3'#9'DOC'#9'F'
              'CPSERIE'#9'6'#9'Serie'#9'T'
              'CPNODOC'#9'16'#9'No.Documento'#9'T'
              'CCPFCJE'#9'12'#9'Fecha~Comprobante'#9'F'
              'DCDTCAMB'#9'8'#9'Tipo de~Cambio'#9'F'
              'DCDMOLOC'#9'15'#9'Amortizaci'#243'n~Mon.Local'#9'F'
              'DCDMOEXT'#9'15'#9'Amortizaci'#243'n~Mon.Extranjera'#9'F')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            IniAttributes.Delimiter = ';;'
            TitleColor = 7566265
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = [dgEnterToTab]
            MultiSelectOptions = [msoShiftSelect]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            ReadOnly = True
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
            OnDblClick = dbgCanjeDblClick
            OnDragOver = dbgCanjeDragOver
            OnEndDrag = dbgCanjeEndDrag
            OnMouseDown = dbgCanjeMouseDown
            object dbgCanjeIButton: TwwIButton
              Left = 0
              Top = 0
              Width = 25
              Height = 32
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
              OnClick = dbgCanjeIButtonClick
            end
          end
        end
        object pnlRegReferencia: TPanel
          Left = 203
          Top = 4
          Width = 313
          Height = 159
          BevelInner = bvRaised
          BevelWidth = 2
          BorderStyle = bsSingle
          Color = 10207162
          TabOrder = 2
          Visible = False
          object Label13: TLabel
            Left = 15
            Top = 44
            Width = 93
            Height = 14
            Caption = 'Tipo de Documento'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object Label24: TLabel
            Left = 15
            Top = 70
            Width = 22
            Height = 14
            Caption = 'Serie'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 15
            Top = 97
            Width = 40
            Height = 14
            Caption = 'N'#250'mero '
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 16
            Top = 124
            Width = 79
            Height = 17
            Caption = 'F.Comprobante'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object dblcRefTipoDoc: TwwDBLookupCombo
            Left = 123
            Top = 44
            Width = 47
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            LookupField = 'DOCID'
            ParentFont = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcRefTipoDocExit
          end
          object edtReftipDoc: TEdit
            Left = 171
            Top = 44
            Width = 121
            Height = 23
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object Panel3: TPanel
            Left = 2
            Top = 2
            Width = 309
            Height = 26
            BevelWidth = 2
            Caption = 'Actualizaci'#243'n'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object bbtnDocref: TBitBtn
            Left = 228
            Top = 122
            Width = 30
            Height = 28
            Hint = 'Aceptar'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = bbtnDocrefClick
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
          object bbtnCancelar: TBitBtn
            Left = 265
            Top = 121
            Width = 30
            Height = 28
            Hint = 'Cancelar'
            Cancel = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = bbtnCancelarClick
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
          object edtRefSerie: TEdit
            Left = 123
            Top = 70
            Width = 121
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object edtRefNodoc: TEdit
            Left = 123
            Top = 96
            Width = 121
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object dtpFComp2: TwwDBDateTimePicker
            Left = 123
            Top = 122
            Width = 90
            Height = 23
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
            TabOrder = 7
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Constancia de Deposito de Detracci'#243'n'
        ImageIndex = 2
        OnEnter = TabSheet3Enter
        object pnlDetraccion: TPanel
          Left = 399
          Top = 40
          Width = 344
          Height = 161
          Color = 10207162
          TabOrder = 0
          object Label20: TLabel
            Left = 13
            Top = 37
            Width = 196
            Height = 16
            Caption = 'Fecha del Deposito de Detracci'#243'n'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Comic Sans MS'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label21: TLabel
            Left = 13
            Top = 76
            Width = 206
            Height = 16
            Caption = 'N'#250'mero del Deposito de Detracci'#243'n'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Comic Sans MS'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Bevel1: TBevel
            Left = 6
            Top = 112
            Width = 334
            Height = 6
          end
          object dbeNumDet: TwwDBEdit
            Left = 227
            Top = 72
            Width = 100
            Height = 23
            DataField = 'NUMDEPDET'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            MaxLength = 20
            ParentFont = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dtpFecDet: TwwDBDateTimePicker
            Left = 227
            Top = 34
            Width = 100
            Height = 23
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            DataField = 'FECDEPDET'
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
            OnExit = dtpFecDetExit
          end
          object bbtnGrabaDet: TBitBtn
            Left = 236
            Top = 126
            Width = 76
            Height = 30
            Hint = 'Grabar Constancia de deposito de la Detracci'#243'n'
            Caption = 'Grabar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = bbtnGrabaDetClick
            Kind = bkOK
          end
          object bbtnEliminaDet: TBitBtn
            Left = 36
            Top = 126
            Width = 76
            Height = 30
            Hint = 'Elimina Constancia de deposito de la Detracci'#243'n'
            Caption = 'Elimina'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = bbtnEliminaDetClick
            Kind = bkOK
          end
          object StaticText3: TStaticText
            Left = 1
            Top = 1
            Width = 342
            Height = 20
            Align = alTop
            Alignment = taCenter
            BorderStyle = sbsSingle
            Caption = 'Datos Detracci'#243'n'
            Color = 8389376
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
        end
        object Panel1: TPanel
          Left = 11
          Top = 40
          Width = 362
          Height = 161
          Color = 10207162
          TabOrder = 1
          object Label22: TLabel
            Left = 12
            Top = 38
            Width = 90
            Height = 16
            Caption = 'Tipo Detracci'#243'n'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Comic Sans MS'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label23: TLabel
            Left = 12
            Top = 78
            Width = 85
            Height = 16
            Caption = 'Tipo Operaci'#243'n'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Comic Sans MS'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Bevel2: TBevel
            Left = 5
            Top = 112
            Width = 350
            Height = 6
          end
          object bbtnGrabSut: TBitBtn
            Left = 253
            Top = 126
            Width = 76
            Height = 30
            Hint = 'Grabar Constancia de deposito de la Detracci'#243'n'
            Caption = 'Grabar'
            Default = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = bbtnGrabSutClick
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
          object bbtnElimSun: TBitBtn
            Left = 19
            Top = 126
            Width = 76
            Height = 30
            Hint = 'Elimina Constancia de deposito de la Detracci'#243'n'
            Caption = 'Elimina'
            Default = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = bbtnElimSunClick
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
          object dblcTipoD: TwwDBLookupCombo
            Left = 107
            Top = 34
            Width = 53
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CPTODETRSUNATID'#9'2'#9'C'#243'digo'#9'F'
              'CPTODETRSUNATDES'#9'30'#9'Descripci'#243'n'#9'F')
            DataField = 'CPTODETRSUNATID'
            LookupTable = DMCXP.cdsTipo
            LookupField = 'CPTODETRSUNATID'
            Options = [loColLines, loRowLines, loTitles]
            Style = csDropDownList
            MaxLength = 2
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = True
            ShowMatchText = True
            OnExit = dblcTipoDExit
            OnNotInList = dblcTipoDNotInList
          end
          object edtTipoD: TwwDBEdit
            Left = 162
            Top = 34
            Width = 186
            Height = 23
            DataField = 'TIPPRESDES'
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblcOperD: TwwDBLookupCombo
            Left = 107
            Top = 74
            Width = 45
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPOOPERSUNATID'#9'2'#9'C'#243'digo'#9'F'
              'TIPOOPERSUNATDES'#9'30'#9'Descripci'#243'n'#9'F')
            DataField = 'TIPOOPERSUNATID'
            LookupField = 'TIPOOPERSUNATID'
            Options = [loColLines, loRowLines, loTitles]
            Style = csDropDownList
            MaxLength = 2
            ParentFont = False
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = True
            ShowMatchText = True
            OnExit = dblcOperDExit
            OnNotInList = dblcOperDNotInList
          end
          object edtOperD: TwwDBEdit
            Left = 154
            Top = 74
            Width = 194
            Height = 23
            DataField = 'TIPPRESDES'
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object StaticText2: TStaticText
            Left = 1
            Top = 1
            Width = 360
            Height = 20
            Align = alTop
            Alignment = taCenter
            BorderStyle = sbsSingle
            Caption = 'Datos SUNAT'
            Color = 8389376
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 6
          end
        end
      end
    end
    object bbtnTR: TBitBtn
      Left = 742
      Top = 4
      Width = 28
      Height = 22
      Hint = 'Cambiar Tipo de Registro'
      Caption = 'TR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnTRClick
    end
    object bbtnSR: TBitBtn
      Left = 620
      Top = 4
      Width = 35
      Height = 22
      Hint = 'Cambia condici'#243'n de retenci'#243'n del IGV'
      Caption = 'Ret'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnSRClick
    end
    object bbtnDet: TBitBtn
      Left = 658
      Top = 4
      Width = 35
      Height = 22
      Hint = 'Cambia condici'#243'n de retenci'#243'n del IGV'
      Caption = 'Detr'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnDetClick
    end
    object bbtnSNP: TBitBtn
      Left = 574
      Top = 4
      Width = 44
      Height = 22
      Hint = 'Cambia condici'#243'n de retenci'#243'n de Pensi'#243'n'
      Caption = 'Pensi'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Visible = False
      OnClick = bbtnSNPClick
      OnMouseMove = bbtnSNPMouseMove
    end
    object bbtnLiberaGFN: TBitBtn
      Left = 490
      Top = 4
      Width = 81
      Height = 22
      Hint = 'Libera de Gesti'#243'n de Fondos'
      Caption = 'Libera GFN'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = bbtnLiberaGFNClick
    end
  end
  object pnlPie: TPanel
    Left = 3
    Top = 519
    Width = 782
    Height = 51
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 14869218
    Enabled = False
    TabOrder = 3
    object bbtnCalc: TBitBtn
      Left = 4
      Top = 13
      Width = 23
      Height = 23
      Hint = 'Recalcula Importes'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bbtnCalcClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
        3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
        700077337F3333373777887007333337007733F773F333337733700070333333
        077037773733333F7F37703707333300080737F373333377737F003333333307
        78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
        078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
        70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
        3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
        33337F73FF737773333307800077033333337337773373333333}
      NumGlyphs = 2
    end
    object pnlEstado: TPanel
      Left = 330
      Top = 3
      Width = 147
      Height = 41
      Color = 14869218
      TabOrder = 1
      object lblAnula: TLabel
        Left = 77
        Top = 12
        Width = 63
        Height = 16
        Caption = 'ANULADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblActivo: TLabel
        Left = 85
        Top = 8
        Width = 49
        Height = 16
        Caption = 'ACTIVO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblContab: TLabel
        Left = 53
        Top = 9
        Width = 87
        Height = 14
        Caption = 'CONTABILIZADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblAcepta: TLabel
        Left = 66
        Top = 8
        Width = 70
        Height = 16
        Caption = 'ACEPTADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblEliminado: TLabel
        Left = 58
        Top = 8
        Width = 72
        Height = 16
        Caption = 'ELIMINADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label3: TLabel
        Left = 1
        Top = 8
        Width = 48
        Height = 19
        Caption = 'Estado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object bbtnRegresa: TBitBtn
      Left = 546
      Top = 8
      Width = 30
      Height = 30
      Hint = 'Modifica Datos de Cabecera'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnRegresaClick
      Glyph.Data = {
        9A050000424D9A05000000000000360000002800000014000000170000000100
        18000000000064050000CE0E0000D80E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000000000C0C0C0C0C0C0C0C0C0C0C0C000000000000000
        0000000000000000000000FF0000000000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000000000000000000000000000C0C0C0000000FFFFFFFFFFFFFFFF
        FFCCCCCC00000000000000000000000000000000000000000000000000000000
        0000000000FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFF
        000000000000CCCCCCCCCCCCCCCCCCCCCCCC999999CCCCCC9999990000000000
        00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFF000000CCCCCCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666999999CCCCCC999999000000FFFFFF
        FFFFFF000000C0C0C0000000FFFFFFFFFFFFCCCCCC000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFCCCCCC999999666666CCCCCC666666000000FFFFFFFFFFFF00
        0000C0C0C0000000FFFFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFF
        CCCCCC666666000000666666CCCCCC999999000000FFFFFFFFFFFF000000C0C0
        C0000000FFFFFFFFFFFF000000CCCCCCFFFFFFFFFFFFFFFFFFFFFFFF00000099
        9999000000999999000000000000000000FFFFFFFFFFFF000000C0C0C0000000
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFCCCCCC0000000000000000
        00000000666666CCCCCC000000000000FFFFFF000000C0C0C0000000FFFFFFFF
        FFFF000000FFFFFFCCCCCCFFFFFFFFFFFF999999000000000000666666CCCCCC
        000000CCCCCC666666000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF0000
        00FFFFFFCCCCCCFFFFFFFFFFFF666666000000999999000000CCCCCC00000066
        6666CCCCCC000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFF
        CCCCCCFFFFFFFFFFFF999999000000CCCCCC000000666666CCCCCC0000000000
        00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC66
        6666FFFFFFFFFFFF000000666666CCCCCC000000FFFFFF000000FFFFFFFFFFFF
        FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC0000009999
        99FFFFFF000000000000FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF00
        0000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFF
        666666000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
        C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC00
        0000FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0000000
        FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC000000FFFF
        FFFFFFFF000000000000000000000000000000000000C0C0C0000000FFFFFFFF
        FFFF000000FFFFFFCCCCCC000000FFFFFF000000000000FFFFFFFFFFFFFFFFFF
        000000FFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0000000FFFFFFFFFFFF0000
        00FFFFFFCCCCCC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFFFFFFFF000000C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFF000000FFFFFF
        666666000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF0000
        00C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000000000FFFFFF99999900
        0000000000000000000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000999999999999000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
    end
    object bbtnCancela: TBitBtn
      Left = 579
      Top = 8
      Width = 30
      Height = 30
      Hint = 'Cancela Actualizaciones del Detalle'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
      Left = 616
      Top = 8
      Width = 26
      Height = 30
      Hint = 'Grabar Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
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
    object Z2bbtnAcepta: TBitBtn
      Left = 645
      Top = 8
      Width = 30
      Height = 30
      Hint = 'Acepta Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
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
    object Z2bbtnAnula: TBitBtn
      Left = 678
      Top = 8
      Width = 30
      Height = 30
      Hint = 'Anular Documento'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = Z2bbtnAnulaClick
      Glyph.Data = {
        96010000424D9601000000000000760000002800000015000000180000000100
        04000000000020010000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888880009988888888888888888990009990000000000000009990008999
        FFFFFFFFFFFFF999800088999FFFFFFFFFFF99988000880999FFFFFFFFF99908
        8000880F999FFFFFFF999F088000880FF999FFFFF999FF088000880FFF999FFF
        999FFF088000880FFFF999F999FFFF088000880FFFFF99999FFFFF088000880F
        FFFFF999FFFFFF088000880FFFFF99999FFFFF088000880FFFF999F999FFFF08
        8000880FFF999FFF999FFF088000880FF999FFFFF999FF088000880F999FFFFF
        FF999F088000880999FFFFFFFFF99908800088999FFFFFFFFFFF999880008999
        FFFFFFFFFFFFF9998000999FFFFFFFFFFFFFFF99900099000000000000000009
        9000888888888888888888888000888888888888888888888000}
    end
    object Z2bbtnContab: TBitBtn
      Left = 711
      Top = 8
      Width = 30
      Height = 30
      Hint = 'Contabilizar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = Z2bbtnContabClick
      Glyph.Data = {
        06020000424D060200000000000076000000280000001A000000190000000100
        04000000000090010000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888800000080000000000000000000000008000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000BBBBBB
        BBBBBBBBB00000000000000000000000000000000000000000000000BBBBBBBB
        BBBBBBBBBBB00000000000000000000000000000000000000000000000000000
        0000000000000000000000BBBB0BBB0B0B0B0BBB0BBB0000000000B00B0B0B0B
        0B0B0B0B0B0B0000000000B00B0B0B0B0B0B0BBB0B0B0000000000B0000B0B0B
        0B0B000B0B0B0000000000B0000BBB0BBB0B0BBB0BBB0000000000B000000000
        000B00000B000000000000B00B00000000BBB0000B000000000000BBBB000000
        000B000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000080000000000000000000000008000000888888888888
        88888888888888000000}
    end
    object Z2bbtnNuevo: TBitBtn
      Left = 744
      Top = 8
      Width = 30
      Height = 30
      Hint = 'Nuevo Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Garamond'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = Z2bbtnNuevoClick
      Glyph.Data = {
        96010000424D9601000000000000760000002800000017000000180000000100
        04000000000020010000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
        BBBBBBBBBBB08887777777777777777778B08800000000000000000078B0880F
        FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
        78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
        FFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880F
        FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
        78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
        FF00000078B0880FFFFFFFFFFF0FF88088B0880FFFFFFFFFFF0F880888B0880F
        FFFFFFFFFF08808888B0880FFFFFFFFFFF08088888B088000000000000008888
        88B08888888888888888888888B08888888888888888888888B0}
    end
    object pnlImpuesto: TPanel
      Left = 30
      Top = 3
      Width = 299
      Height = 41
      Color = 14869218
      TabOrder = 9
      object Label5: TLabel
        Left = 3
        Top = 13
        Width = 40
        Height = 16
        Caption = 'Tributo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDet: TLabel
        Left = 170
        Top = 1
        Width = 30
        Height = 13
        Caption = 'Detrac'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblPor: TLabel
        Left = 202
        Top = 1
        Width = 25
        Height = 13
        Caption = 'Renta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object bbtnGenReg: TBitBtn
        Left = 232
        Top = 11
        Width = 30
        Height = 27
        TabOrder = 0
        OnClick = bbtnGenRegClick
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
      object dblcImpuesto: TwwDBLookupCombo
        Left = 44
        Top = 13
        Width = 43
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TREGID'#9'2'#9'Id'#9'F'
          'TREGDES'#9'20'#9'Descripci'#243'n'#9'F'
          'DCPDH'#9'1'#9'DCPDH'#9'F'
          'TIPDET'#9'2'#9'TIPDET'#9'F')
        LookupField = 'TREGID'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcImpuestoEnter
        OnExit = dblcImpuestoExit
      end
      object edtImpuesto: TEdit
        Left = 87
        Top = 13
        Width = 70
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object bbtnTotal: TBitBtn
        Left = 264
        Top = 11
        Width = 27
        Height = 27
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = bbtnTotalClick
        NumGlyphs = 2
      end
      object dbeDetrac: TwwDBEdit
        Left = 168
        Top = 13
        Width = 32
        Height = 23
        DataField = 'DTRPORC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        UnboundDataType = wwDefault
        UsePictureMask = False
        WantReturns = False
        WordWrap = False
      end
      object dbePor: TwwDBEdit
        Left = 200
        Top = 13
        Width = 32
        Height = 23
        DataField = 'PORCDESC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        UnboundDataType = wwDefault
        UsePictureMask = False
        Visible = False
        WantReturns = False
        WordWrap = False
      end
    end
    object Z2bbtnPreview: TBitBtn
      Left = 513
      Top = 8
      Width = 30
      Height = 30
      Hint = 'Previa Contabilizaci'#243'n'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = Z2bbtnPreviewClick
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
    object bbtnAplicaPagos: TBitBtn
      Left = 478
      Top = 7
      Width = 32
      Height = 32
      Hint = 'Aplicaci'#243'n de Pagos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = bbtnAplicaPagosClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555500000
        55555555000BB3B30555555030BB3303305555030BB0B3B3330555033BBBB333
        330550B3B3BB3BB3B33050B3B33BBBBB333050B3B33BBBBB3B3050B3B333BB0B
        33B050B33333BBB3B3B050BB33333333BB05550B33B3333BB305550BB33330BB
        B0555550BB33B3BB0555555500B3333055555555550000055555}
    end
  end
  object pnlCab4: TPanel
    Left = 3
    Top = 0
    Width = 782
    Height = 241
    BevelInner = bvRaised
    BevelOuter = bvNone
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lbl_DocsOrdenPago: TLabel
      Left = 719
      Top = 2
      Width = 53
      Height = 16
      Caption = 'Ord.Pago'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object pnlCab1: TPanel
      Left = 9
      Top = 6
      Width = 704
      Height = 45
      Color = 14869218
      TabOrder = 0
      object lblCia: TLabel
        Left = 17
        Top = 2
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
      object lblProv: TLabel
        Left = 259
        Top = 2
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
      object lblProvRuc: TLabel
        Left = 344
        Top = 2
        Width = 24
        Height = 16
        Caption = 'RUC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblProvNom: TLabel
        Left = 456
        Top = 2
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
      object Label6: TLabel
        Left = 210
        Top = 2
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
      object dblcCia: TwwDBLookupCombo
        Left = 17
        Top = 18
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
        DataField = 'CIAID'
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
        OnChange = dblcCiaChange
        OnExit = dblcCiaExit
        OnNotInList = dblcCiaNotInList
      end
      object edtCia: TEdit
        Left = 60
        Top = 18
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
        TabOrder = 1
      end
      object dblcdProv: TwwDBLookupComboDlg
        Left = 258
        Top = 18
        Width = 83
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
        DataField = 'PROV'
        LookupField = 'PROV'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 11
        ParentFont = False
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnEnter = dblcdProvEnter
        OnExit = dblcdProvExit
      end
      object dblcdProvRuc: TwwDBLookupComboDlg
        Left = 342
        Top = 18
        Width = 112
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Registro Unico'
        MaxWidth = 0
        MaxHeight = 209
        SearchDelay = 2
        Selected.Strings = (
          'PROVRUC'#9'12'#9'Reg.Unico'#9'F'
          'PROV'#9'12'#9'Proveedor'#9'F'
          'PROVDES'#9'40'#9'Raz'#243'n Social'#9'F'
          'PROVABR'#9'15'#9'Nombre Corto'#9'F')
        DataField = 'PROVRUC'
        LookupField = 'PROVRUC'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 11
        ParentFont = False
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnEnter = dblcdProvRucEnter
        OnExit = dblcdProvExit
      end
      object edtProv: TEdit
        Left = 454
        Top = 18
        Width = 241
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
        OnExit = edtProvExit
      end
      object dblcClAux: TwwDBLookupCombo
        Left = 208
        Top = 18
        Width = 49
        Height = 23
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CLAUXID'#9'3'#9'Id.'#9'F'
          'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
        DataField = 'CLAUXID'
        LookupField = 'CLAUXID'
        Options = [loColLines, loRowLines, loTitles]
        DropDownCount = 15
        MaxLength = 2
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcClAuxExit
      end
    end
    object pnlCab2: TPanel
      Left = 9
      Top = 53
      Width = 758
      Height = 88
      Color = 14869218
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lblTDoc: TLabel
        Left = 14
        Top = 2
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
      object lblSerie: TLabel
        Left = 228
        Top = 2
        Width = 31
        Height = 16
        Caption = 'Serie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblNoDoc: TLabel
        Left = 289
        Top = 2
        Width = 82
        Height = 16
        Caption = 'No.Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblTDiario: TLabel
        Left = 14
        Top = 45
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
        Left = 395
        Top = 45
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
      object lblNoReg: TLabel
        Left = 475
        Top = 45
        Width = 69
        Height = 16
        Caption = 'No.Registro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label15: TLabel
        Left = 293
        Top = 45
        Width = 85
        Height = 16
        Caption = 'F.Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblInter: TLabel
        Left = 408
        Top = 2
        Width = 79
        Height = 16
        Caption = 'Intermediaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblClauxInter: TLabel
        Left = 492
        Top = 2
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
        Visible = False
      end
      object lblProvInter: TLabel
        Left = 546
        Top = 2
        Width = 80
        Height = 16
        Caption = 'Intermediario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object Label25: TLabel
        Left = 642
        Top = 62
        Width = 45
        Height = 16
        Caption = 'Seguros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edtTDoc: TEdit
        Left = 67
        Top = 18
        Width = 145
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object dblcTDiario: TwwDBLookupCombo
        Left = 16
        Top = 61
        Width = 47
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TDIARID'#9'3'#9'Tipo de Diario'#9'F'
          'TDIARDES'#9'40'#9'Descripci'#243'n'#9'F')
        DataField = 'TDIARID'
        LookupField = 'TDIARID'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
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
        OnExit = dblcTDiarioExit
      end
      object edtTDiario: TEdit
        Left = 66
        Top = 61
        Width = 221
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
      object edtSerie: TwwDBEdit
        Left = 227
        Top = 18
        Width = 51
        Height = 23
        CharCase = ecUpperCase
        DataField = 'CPSERIE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = edtSerieExit
      end
      object edtNoDoc: TwwDBEdit
        Left = 283
        Top = 18
        Width = 121
        Height = 23
        DataField = 'CPNODOC'
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
        OnExit = edtNoDocExit
      end
      object meAnoMM: TwwDBEdit
        Left = 390
        Top = 61
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
        TabOrder = 11
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object meNoReg: TwwDBEdit
        Left = 473
        Top = 61
        Width = 121
        Height = 23
        DataField = 'CPNOREG'
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
        OnExit = meNoRegExit
      end
      object dtpFComp: TwwDBDateTimePicker
        Left = 292
        Top = 61
        Width = 90
        Height = 22
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'CPFCMPRB'
        Date = 37176.000000000000000000
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 10
        OnExit = dtpFCompExit
      end
      object dblcTDoc: TwwDBLookupCombo
        Left = 16
        Top = 18
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
        DataField = 'DOCID'
        LookupField = 'DOCID'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcTDocExit
      end
      object chkInter: TCheckBox
        Left = 432
        Top = 24
        Width = 26
        Height = 16
        Caption = '  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = chkInterClick
        OnExit = chkInterExit
      end
      object dblcClauxInter: TwwDBLookupCombo
        Left = 493
        Top = 18
        Width = 49
        Height = 22
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CLAUXID'#9'2'#9'Id.'#9'F'
          'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
        DataField = 'CLAUXINTER'
        LookupField = 'CLAUXID'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 5
        Visible = False
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcClauxInterExit
      end
      object dblcdInter: TwwDBLookupComboDlg
        Left = 544
        Top = 18
        Width = 90
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Maestro de Proveedores'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'PROV'#9'8'#9'Proveedor'#9'F'
          'PROVDES'#9'40'#9'Raz'#243'n Social'#9'F'
          'PROVABR'#9'15'#9'Nombre Corto'#9'F'
          'PROVRUC'#9'10'#9'Reg.Unico'#9'F')
        DataField = 'AUXIDINTER'
        LookupField = 'PROV'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 10
        ParentFont = False
        TabOrder = 6
        Visible = False
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnEnter = dblcdInterEnter
        OnExit = dblcdInterExit
      end
      object edtIntermediario: TEdit
        Left = 636
        Top = 17
        Width = 110
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Visible = False
      end
      object pnlSunat: TPanel
        Left = 547
        Top = 6
        Width = 200
        Height = 26
        Caption = 'Proveedor Notificado por la SUNAT'
        Color = clInfoBk
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        Visible = False
      end
      object pnlSunat2: TPanel
        Left = 547
        Top = 32
        Width = 200
        Height = 26
        Caption = 'Proveedor No Habido'
        Color = clInfoBk
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
        Visible = False
      end
      object cbSeguros: TCheckBox
        Left = 691
        Top = 64
        Width = 18
        Height = 16
        Caption = 'cbSeguros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
        OnClick = cbSegurosClick
      end
    end
    object pnlCab3: TPanel
      Left = 9
      Top = 143
      Width = 758
      Height = 89
      Color = 14869218
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label9: TLabel
        Left = 112
        Top = 2
        Width = 73
        Height = 16
        Caption = 'F.Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label10: TLabel
        Left = 252
        Top = 2
        Width = 79
        Height = 16
        Caption = 'F.Vencimiento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label11: TLabel
        Left = 354
        Top = 2
        Width = 57
        Height = 16
        Caption = 'T.Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label12: TLabel
        Left = 510
        Top = 2
        Width = 52
        Height = 16
        Caption = 'T.Cambio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblOCompra: TLabel
        Left = 663
        Top = 2
        Width = 56
        Height = 16
        Caption = 'O.Compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 14
        Top = 2
        Width = 67
        Height = 16
        Caption = 'F.Recepci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 576
        Top = 2
        Width = 26
        Height = 16
        Caption = 'Lote'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label4: TLabel
        Left = 14
        Top = 44
        Width = 74
        Height = 16
        Caption = 'Cl.Aux.Resp.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label8: TLabel
        Left = 91
        Top = 44
        Width = 69
        Height = 16
        Caption = 'Responsable'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblRetIGV: TLabel
        Left = 398
        Top = 47
        Width = 93
        Height = 32
        Caption = #191'Estar'#225' sujeto a Ret.IGV?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Visible = False
        WordWrap = True
      end
      object Label17: TLabel
        Left = 212
        Top = 2
        Width = 25
        Height = 16
        Caption = 'D'#237'as'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label19: TLabel
        Left = 640
        Top = 65
        Width = 25
        Height = 15
        Caption = 'V.5.1'
      end
      object lblsusp4c: TLabel
        Left = 492
        Top = 44
        Width = 127
        Height = 16
        Caption = 'Sujeto a Suspenc 4 C!'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Visible = False
        WordWrap = True
      end
      object dtpFVcmto: TwwDBDateTimePicker
        Left = 257
        Top = 18
        Width = 92
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'CPFVCMTO'
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
        UnboundDataType = wwDTEdtDate
        OnExit = dtpFVcmtoExit
      end
      object dblcTMon: TwwDBLookupCombo
        Left = 354
        Top = 18
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
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcTMonExit
      end
      object edtTMon: TEdit
        Left = 398
        Top = 18
        Width = 107
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object dbeTCambio: TwwDBEdit
        Left = 510
        Top = 18
        Width = 55
        Height = 23
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        DataField = 'CPTCAMPR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeTCambioExit
      end
      object dtpFRecep: TwwDBDateTimePicker
        Left = 15
        Top = 18
        Width = 92
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'CPFRECEP'
        Date = 37179.000000000000000000
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
        OnExit = dtpFRecepExit
      end
      object dbeLote: TwwDBEdit
        Left = 570
        Top = 18
        Width = 78
        Height = 23
        DataField = 'DCPLOTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeLoteExit
      end
      object bbtnOK: TBitBtn
        Left = 678
        Top = 52
        Width = 32
        Height = 32
        Hint = 'Pasa a Registrar Detalle'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
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
      object bbtnBorra: TBitBtn
        Left = 717
        Top = 52
        Width = 32
        Height = 32
        Hint = 'Borra y Reinicia Registro'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        OnClick = bbtnBorraClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
      end
      object dtpFEmis: TwwDBDateTimePicker
        Left = 110
        Top = 18
        Width = 92
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'CPFEMIS'
        Date = 37176.000000000000000000
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
        OnExit = dtpFEmisExit
      end
      object dblcClAuxResp: TwwDBLookupCombo
        Left = 17
        Top = 60
        Width = 49
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CLAUXID'#9'2'#9'Id.'#9'F'
          'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
        DataField = 'CLAUXREND'
        LookupField = 'CLAUXID'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 9
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblcClAuxRespExit
      end
      object dblcdResp: TwwDBLookupComboDlg
        Left = 81
        Top = 60
        Width = 90
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Maestro de Proveedores'
        MaxWidth = 0
        MaxHeight = 209
        SearchDelay = 2
        Selected.Strings = (
          'PROV'#9'15'#9'Id'#9'F'
          'PROVDES'#9'30'#9'Responsable'#9'F')
        DataField = 'AUXIDREND'
        LookupField = 'PROV'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 10
        ParentFont = False
        TabOrder = 10
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcdRespExit
      end
      object edtResp: TEdit
        Left = 173
        Top = 60
        Width = 201
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
        TabOrder = 11
        OnExit = edtProvExit
      end
      object dblcdOCompra: TwwDBLookupComboDlg
        Left = 653
        Top = 18
        Width = 95
        Height = 23
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'ODCID'#9'15'#9'Orden~Compra'#9'F'
          'ODCFEMI'#9'11'#9'Fecha~Emisi'#243'n'#9'F'
          'ODCTIMPAMOR'#9'10'#9'Saldo'#9'F')
        DataField = 'CPOCOMP'
        LookupField = 'ODCID'
        TabOrder = 8
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        UseTFields = False
        OnEnter = dblcdOCompraEnter
        OnExit = dblcdOCompraExit
      end
      object cbSujetoaRetIGV: TCheckBox
        Left = 472
        Top = 64
        Width = 18
        Height = 16
        Caption = 'cbSujetoaRetIGV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        Visible = False
      end
      object seDias: TSpinEdit
        Left = 210
        Top = 18
        Width = 45
        Height = 24
        MaxLength = 3
        MaxValue = 999
        MinValue = 0
        TabOrder = 2
        Value = 0
        OnExit = seDiasExit
      end
    end
  end
  object pnlRegistro: TPanel
    Left = 209
    Top = 200
    Width = 389
    Height = 227
    BevelInner = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 2
    Visible = False
    object lblTipReg: TLabel
      Left = 25
      Top = 31
      Width = 77
      Height = 14
      Caption = 'Tipo de Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblCnpEgr: TLabel
      Left = 25
      Top = 55
      Width = 48
      Height = 14
      Caption = 'Concepto:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblCCosto: TLabel
      Left = 25
      Top = 103
      Width = 75
      Height = 14
      Caption = 'Centro de Costo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblDH: TLabel
      Left = 25
      Top = 176
      Width = 69
      Height = 14
      Caption = '[D]ebe/[H]aber'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblImporte: TLabel
      Left = 152
      Top = 176
      Width = 44
      Height = 14
      Caption = 'Importe :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblGlosa: TLabel
      Left = 25
      Top = 79
      Width = 25
      Height = 14
      Caption = 'Glosa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblCuenta: TLabel
      Left = 208
      Top = 53
      Width = 35
      Height = 14
      Caption = 'Cuenta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblTipPre: TLabel
      Left = 25
      Top = 127
      Width = 76
      Height = 14
      Caption = 'T. de Presupesto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblPresu: TLabel
      Left = 25
      Top = 151
      Width = 50
      Height = 14
      Caption = 'Presupesto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
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
      OnEnter = dblcTipRegEnter
      OnExit = dblcTipRegExit
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
      OnExit = dblcdCCostoExit
    end
    object edtTipReg: TEdit
      Left = 158
      Top = 25
      Width = 134
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
      Left = 202
      Top = 170
      Width = 100
      Height = 23
      DataField = 'DCPMOORI'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = False
      OnExit = dbeImporteExit
    end
    object dbeDH: TwwDBEdit
      Left = 111
      Top = 169
      Width = 25
      Height = 23
      CharCase = ecUpperCase
      DataField = 'DCPDH'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeDHExit
    end
    object bbtnRegOk: TBitBtn
      Left = 313
      Top = 192
      Width = 30
      Height = 25
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
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
      Left = 345
      Top = 192
      Width = 30
      Height = 25
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
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
    object dbeGlosa: TwwDBEdit
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
      OnExit = dbeGlosaExit
    end
    object StaticText1: TStaticText
      Left = 4
      Top = 4
      Width = 377
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
    object dblcTipPre: TwwDBLookupCombo
      Left = 111
      Top = 121
      Width = 45
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPPRESID'#9'2'#9'C'#243'digo'#9'F'
        'TIPPRESDES'#9'20'#9'Descripci'#243'n'#9'F')
      DataField = 'TIPPRESID'
      LookupField = 'TIPPRESID'
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
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTipPreExit
    end
    object dbeTipPre: TwwDBEdit
      Left = 158
      Top = 121
      Width = 181
      Height = 23
      DataField = 'TIPPRESDES'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
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
      TabOrder = 11
    end
    object dblcdPresup: TwwDBLookupComboDlg
      Left = 111
      Top = 145
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
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'PARPRESID'#9'15'#9'ID'#9'F'
        'PARPRESDES'#9'30'#9'Partida presupuestal'#9'F'
        'PARPRES_IS'#9'3'#9'I/E'#9'F')
      DataField = 'PARPRESID'
      LookupField = 'PARPRESID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      Enabled = False
      MaxLength = 12
      ParentFont = False
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnExit = dblcdPresupExit
    end
    object cbRepGlosa: TCheckBox
      Left = 139
      Top = 198
      Width = 97
      Height = 17
      Caption = 'Repetir Glosa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
    end
    object bbtnImportDetalles: TBitBtn
      Left = 281
      Top = 192
      Width = 30
      Height = 25
      Hint = 'Importar Detalles'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnClick = bbtnImportDetallesClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
  end
  object Btn_OrdenPago: TBitBtn
    Left = 735
    Top = 21
    Width = 28
    Height = 28
    Hint = 'Ordenes de Pago Registradas'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = Btn_OrdenPagoClick
    Glyph.Data = {
      AA030000424DAA03000000000000360000002800000011000000110000000100
      1800000000007403000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFDFFFFFEFCFFFCF4FFFFF0FFFFF5FFFCF2
      FFFFF9FFFFF9FFFFF6FFFFF7FFFFFBFFFEFEFDF7F8FFFEFEFFFFF8FFFEF3FFFF
      FF00FFFDFB9185817F6E657766596F615575695F685D555F5349645749524537
      53473D544842554C49372E2B6D5F59FFFEF7FFFFFF00FFFFF587776BE2D3CAFF
      F6ECFCF0E6FAECE0FFEFE2FCECDBFFF1DFFFECD7FFF0DEF6E4D3FBEDE1E6DBD3
      332A27FFFEFEFFFFFF00FFFEEDA39484FFFEF4FFF5EBFFF2E6AE9E8EB29E8CB3
      9E88B49C88B09983B49D87B19C87B5A392FFF5E949433EFFFEFDFFFFFF00FFFF
      F09A8D7DF7EDE3FFFBEFFFFFF0B19C86FBE2C8F0D6BEF9E3D1F1DFCEF2E0CFF4
      E3D0AE9A88FAEAD94D443AFFFFF9FFFFFF00FFFFF0A99D8BFFF4E8FFFFF2FFEB
      D5B79E84FFFFE9FADFC5FFFFF1FFFCEFF1E0D3FFFFF1AF9C87F4E3D0625749FF
      FDF0FFFFFF00FFFFF0AEA290FEF1E1FFF6E3FFFFE7BC9F84FFDFC2F4D6BDF8DF
      CFF5E1D6EDDBD0EADACABAA694FFF3DE5B4D3BFFFFF0FFFFFF00FFFFEEAEA08D
      FFF4DFB39C86BFA287C19F81FFFFE4FEDABCFFFFE9FFFFEAFBE0CBFFFFEEAE99
      84FBE7D56C5C4BFFFFF1FFFFFF00FFFFEDC4B29BFFF2D8BDA183FFE2C4B7916F
      A87D56AA7A50AE7C4EA06F41A0744B99745293785EFFEEDC645749FFFFF2FFFF
      FF00FFFFF0C6B19BFFF5D9BFA184FFFFE7FEDCBFFFFFE4FFFFE0FFEABEFFFFD7
      D4A87FFFF5D5FFF0DBFBEBDB6F6155FFFFF7FFFFFF00FFFDECD6C3AEFFF2DAB5
      9B83F4DECCF8E3D4ECD6CAF8DED0F7D8C3FFE4CBB1947FFFF3E3FFF7EFF9EAE1
      716053FFFFF1FFFFFF00FFFFF4D4C4B3FFF2DCB69E86FFFFEDF8E2D0FFFFF2FF
      FFF0FBE0CCFFFFEDB9A18FFFFBEEFFF8F1F6E9E17E6D60FFFFF2FFFFFF00FFFA
      F3D7CEC1FFFCE5B096789878549D7951A27C529973499B744D906E4A967A5CFF
      FDE7FFF8EBFFFFF36E5C51FFFFF4FFFFFF00FFFFF8DCD4C7F1E3D0FFF2D6FFF0
      CBFFEFC4FFF0C3FFEEBEFFEDC2FFF5D1FFECCEFFF1D8FDEBDAE6D6CA75695FFF
      FFF7FFFFFF00FFFFF2EDE3D2D9D2C3D2CAB9D8CAB4DCC9AEC4AF90CFBA9AB6A3
      88AB9C82AF9E89A2917EA19181837569938A87FFFEFFFFFFFF00FFFFECFFFFF1
      FFFFF7FFFFF8FFFFF3FFFFF1FFFFEDFFFFE9FFFFEEFFFFF1FFFFF1FFFFEDFFFF
      F1FFFFF7FDF8F7FFFEFFFFFFFF00}
  end
  object pnlSeguroDatos: TPanel
    Left = 184
    Top = 319
    Width = 481
    Height = 114
    BevelInner = bvLowered
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 14869218
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    object Label26: TLabel
      Left = 19
      Top = 30
      Width = 65
      Height = 14
      Caption = 'Tipo Seguro : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblTitulo1: TLabel
      Left = 3
      Top = 3
      Width = 471
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Datos del Seguros'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label27: TLabel
      Left = 20
      Top = 57
      Width = 53
      Height = 14
      Caption = 'N'#176' P'#243'liza : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 19
      Top = 87
      Width = 107
      Height = 14
      Caption = 'Fecha Vigencia Desde : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Label29: TLabel
      Left = 227
      Top = 87
      Width = 35
      Height = 14
      Caption = 'Hasta : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object bbtnOk1: TBitBtn
      Left = 399
      Top = 113
      Width = 30
      Height = 25
      TabOrder = 0
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
    object bbtnCanc1: TBitBtn
      Left = 433
      Top = 113
      Width = 30
      Height = 25
      TabOrder = 1
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
    object btnSalir: TBitBtn
      Left = 458
      Top = 3
      Width = 15
      Height = 17
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnSalirClick
    end
    object dbeConcepto: TwwDBEdit
      Left = 180
      Top = 25
      Width = 291
      Height = 24
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcConcepto: TwwDBLookupComboDlg
      Left = 87
      Top = 29
      Width = 90
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
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
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcConceptoEnter
      OnExit = dblcConceptoExit
    end
    object dbePoliza: TwwDBEdit
      Left = 87
      Top = 53
      Width = 122
      Height = 24
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dtpFIVigencia: TwwDBDateTimePicker
      Left = 127
      Top = 82
      Width = 92
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
      TabOrder = 6
      OnExit = dtpFIVigenciaExit
    end
    object dtpFFVigencia: TwwDBDateTimePicker
      Left = 263
      Top = 82
      Width = 92
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
      TabOrder = 7
    end
    object btnGrabarSeg: TBitBtn
      Left = 411
      Top = 72
      Width = 26
      Height = 30
      Hint = 'Actualizar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnGrabarSegClick
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
    object btnLimpiarSeg: TBitBtn
      Left = 439
      Top = 72
      Width = 30
      Height = 30
      Hint = 'Limpiar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btnLimpiarSegClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
  end
  object ppdbpPreview: TppDBPipeline
    UserName = 'dbpPreview'
    Left = 186
    Top = 439
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
      FieldAlias = 'CNTCOMPROB'
      FieldName = 'CNTCOMPROB'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'CNTANO'
      FieldName = 'CNTANO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'CNTANOMM'
      FieldName = 'CNTANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'CNTLOTE'
      FieldName = 'CNTLOTE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CUENTAID'
      FieldName = 'CUENTAID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'AUXID'
      FieldName = 'AUXID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'CNTSERIE'
      FieldName = 'CNTSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'CNTNODOC'
      FieldName = 'CNTNODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'CNTGLOSA'
      FieldName = 'CNTGLOSA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'CNTDH'
      FieldName = 'CNTDH'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
    object ppField15: TppField
      FieldAlias = 'CCOSID'
      FieldName = 'CCOSID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTTCAMBIO'
      FieldName = 'CNTTCAMBIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTMTOORI'
      FieldName = 'CNTMTOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTMTOLOC'
      FieldName = 'CNTMTOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTMTOEXT'
      FieldName = 'CNTMTOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      FieldAlias = 'CNTFEMIS'
      FieldName = 'CNTFEMIS'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      FieldAlias = 'CNTFVCMTO'
      FieldName = 'CNTFVCMTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 20
    end
    object ppField22: TppField
      FieldAlias = 'CNTFCOMP'
      FieldName = 'CNTFCOMP'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 21
    end
    object ppField23: TppField
      FieldAlias = 'CNTESTADO'
      FieldName = 'CNTESTADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object ppField24: TppField
      FieldAlias = 'CNTCUADRE'
      FieldName = 'CNTCUADRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField25: TppField
      FieldAlias = 'CNTFAUTOM'
      FieldName = 'CNTFAUTOM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField26: TppField
      FieldAlias = 'CNTUSER'
      FieldName = 'CNTUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 25
    end
    object ppField27: TppField
      FieldAlias = 'CNTFREG'
      FieldName = 'CNTFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'CNTHREG'
      FieldName = 'CNTHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'CNTMM'
      FieldName = 'CNTMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 28
    end
    object ppField30: TppField
      FieldAlias = 'CNTDD'
      FieldName = 'CNTDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 29
    end
    object ppField31: TppField
      FieldAlias = 'CNTTRI'
      FieldName = 'CNTTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 30
    end
    object ppField32: TppField
      FieldAlias = 'CNTSEM'
      FieldName = 'CNTSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 31
    end
    object ppField33: TppField
      FieldAlias = 'CNTSS'
      FieldName = 'CNTSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 32
    end
    object ppField34: TppField
      FieldAlias = 'CNTAATRI'
      FieldName = 'CNTAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 33
    end
    object ppField35: TppField
      FieldAlias = 'CNTAASEM'
      FieldName = 'CNTAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 34
    end
    object ppField36: TppField
      FieldAlias = 'CNTAASS'
      FieldName = 'CNTAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 35
    end
    object ppField37: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 36
    end
    object ppField38: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 37
    end
    object ppField39: TppField
      FieldAlias = 'FCONS'
      FieldName = 'FCONS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 38
    end
    object ppField40: TppField
      FieldAlias = 'CNTFMEC'
      FieldName = 'CNTFMEC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 39
    end
    object ppField41: TppField
      FieldAlias = 'TDIARDES'
      FieldName = 'TDIARDES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 40
    end
    object ppField42: TppField
      FieldAlias = 'CTADES'
      FieldName = 'CTADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 41
    end
    object ppField43: TppField
      FieldAlias = 'AUXDES'
      FieldName = 'AUXDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 42
    end
    object ppField44: TppField
      FieldAlias = 'DOCDES'
      FieldName = 'DOCDES'
      FieldLength = 8
      DisplayWidth = 8
      Position = 43
    end
    object ppField45: TppField
      FieldAlias = 'CCOSDES'
      FieldName = 'CCOSDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 44
    end
    object ppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTDEBEMN'
      FieldName = 'CNTDEBEMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object ppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTDEBEME'
      FieldName = 'CNTDEBEME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object ppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTHABEMN'
      FieldName = 'CNTHABEMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object ppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTHABEME'
      FieldName = 'CNTHABEME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object ppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTSALDMN'
      FieldName = 'CNTSALDMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object ppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTSALDME'
      FieldName = 'CNTSALDME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object ppField52: TppField
      FieldAlias = 'CAMPOVAR'
      FieldName = 'CAMPOVAR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 51
    end
    object ppField53: TppField
      FieldAlias = 'CNTTS'
      FieldName = 'CNTTS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 52
    end
    object ppField54: TppField
      FieldAlias = 'CNTPAGADO'
      FieldName = 'CNTPAGADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 53
    end
    object ppField55: TppField
      FieldAlias = 'CNTMODDOC'
      FieldName = 'CNTMODDOC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 54
    end
    object ppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTREG'
      FieldName = 'CNTREG'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 55
    end
    object ppField57: TppField
      FieldAlias = 'MODULO'
      FieldName = 'MODULO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 56
    end
    object ppField58: TppField
      FieldAlias = 'TMONDES'
      FieldName = 'TMONDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 57
    end
    object ppField59: TppField
      FieldAlias = 'TMONABR'
      FieldName = 'TMONABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 58
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
    Template.FileName = 'C:\SOLExes\SOLFormatos\CxP\Dema\CxPVoucher.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprPreviewPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 56
    Top = 476
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
        mmWidth = 12700
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
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3260
        mmLeft = 138589
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
        Transparent = True
        DataPipelineName = 'ppdbpPreview'
        mmHeight = 3260
        mmLeft = 158962
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
        Transparent = True
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 5821
        mmWidth = 58738
        BandType = 7
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 698
    Top = 464
  end
  object sdImportDetalles: TSaveDialog
    DefaultExt = '*.txt'
    FileName = 'c:\oaEjecuta\*.txt'
    Filter = '*.txt  ( Archivo txt )|*.txt|*.*   ( Todos )|*.*'
    Title = 'Importar Archivo Detalles'
    Left = 734
    Top = 465
  end
  object scData: TStrContainer
    Left = 733
    Top = 433
  end
end
