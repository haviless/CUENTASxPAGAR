object FEstCxCli: TFEstCxCli
  Left = 198
  Top = 109
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Estados de Cuenta por Proveedor'
  ClientHeight = 573
  ClientWidth = 792
  Color = clBtnFace
  Constraints.MaxHeight = 644
  Constraints.MaxWidth = 861
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlFOOT: TPanel
    Left = 0
    Top = 480
    Width = 792
    Height = 93
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel1: TBevel
      Left = 4
      Top = 56
      Width = 793
      Height = 2
      Shape = bsTopLine
    end
    object Z2bbtnCancel: TBitBtn
      Left = 741
      Top = 62
      Width = 32
      Height = 30
      Cancel = True
      TabOrder = 0
      OnClick = Z2bbtnCancelClick
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
    object bbtnPrint: TBitBtn
      Left = 575
      Top = 62
      Width = 32
      Height = 30
      TabOrder = 1
      Visible = False
      OnClick = bbtnPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object GroupBox1: TGroupBox
      Left = 406
      Top = 0
      Width = 380
      Height = 52
      TabOrder = 2
      object lbl1: TLabel
        Left = 33
        Top = 11
        Width = 152
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Saldo Moneda Local'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 209
        Top = 11
        Width = 150
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Saldo Moneda Extranjera'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dbe1: TStaticText
        Left = 33
        Top = 27
        Width = 152
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbe2: TStaticText
        Left = 208
        Top = 27
        Width = 152
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 0
      Width = 380
      Height = 52
      TabOrder = 3
      object Label4: TLabel
        Left = 23
        Top = 11
        Width = 152
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Movimientos Moneda Local'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 198
        Top = 11
        Width = 169
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Movimientos Moneda Extranjera'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dbe3: TStaticText
        Left = 24
        Top = 27
        Width = 152
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbe4: TStaticText
        Left = 206
        Top = 27
        Width = 152
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object BitBtn1: TBitBtn
      Left = 702
      Top = 62
      Width = 32
      Height = 30
      TabOrder = 4
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object pnlHEAD: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 151
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Z2bbtnAceptar: TBitBtn
      Left = 750
      Top = 91
      Width = 32
      Height = 32
      Default = True
      TabOrder = 0
      OnClick = Z2bbtnAceptarClick
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
    object PageControl2: TPageControl
      Left = 0
      Top = 0
      Width = 792
      Height = 150
      ActivePage = TabSheet8
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object TabSheet8: TTabSheet
        Caption = 'Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        object Label8: TLabel
          Left = 228
          Top = 0
          Width = 52
          Height = 15
          Caption = 'Proveedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 14
          Top = 76
          Width = 50
          Height = 15
          Caption = 'L. Cr'#233'dito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 133
          Top = 76
          Width = 54
          Height = 15
          Caption = 'Disponible'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 264
          Top = 76
          Width = 79
          Height = 15
          Caption = 'Saldo Ant. M.E.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 522
          Top = 76
          Width = 63
          Height = 15
          Caption = 'Abonos M.E.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 14
          Top = 38
          Width = 51
          Height = 15
          Caption = 'Direcci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 452
          Top = 38
          Width = 59
          Height = 15
          Caption = 'Tel'#233'fono(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 394
          Top = 76
          Width = 61
          Height = 15
          Caption = 'Cargos M.E.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 661
          Top = 76
          Width = 79
          Height = 15
          Caption = 'Saldo Act. M.E.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 15
          Top = 0
          Width = 73
          Height = 15
          Caption = 'Clase Auxiliar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object dblcClie: TwwDBLookupComboDlg
          Left = 222
          Top = 14
          Width = 101
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
          GridColor = clWhite
          GridTitleAlignment = taLeftJustify
          Caption = 'Lookup'
          MaxWidth = 0
          MaxHeight = 209
          Selected.Strings = (
            'CLIEID'#9'8'#9'C'#243'digo'#9'F'
            'CLIEDES'#9'40'#9'Descripci'#243'n'#9'F'
            'CLIEABR'#9'15'#9'Abreviatura'#9'F')
          DataField = 'CLIEID'
          LookupField = 'CLIEID'
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object dbeClie: TwwDBEdit
          Left = 325
          Top = 14
          Width = 250
          Height = 23
          CharCase = ecUpperCase
          DataField = 'CLIEDES'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
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
        object dbeDirec: TwwDBEdit
          Left = 8
          Top = 51
          Width = 297
          Height = 23
          DataField = 'CLIEDIR'
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDistrito: TwwDBEdit
          Left = 317
          Top = 51
          Width = 121
          Height = 23
          DataField = 'ZIPDES'
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeTelf: TwwDBEdit
          Left = 445
          Top = 51
          Width = 105
          Height = 23
          DataField = 'CLIETELF'
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeSaldoAnt: TwwDBEdit
          Left = 265
          Top = 89
          Width = 90
          Height = 23
          DataField = 'SALANTME'
          TabOrder = 5
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dbeCargos: TwwDBEdit
          Left = 393
          Top = 89
          Width = 90
          Height = 23
          DataField = 'CARGOSME'
          TabOrder = 6
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dbeAbonos: TwwDBEdit
          Left = 521
          Top = 89
          Width = 90
          Height = 23
          DataField = 'ABONOSME'
          TabOrder = 7
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dbeSaldoAct: TwwDBEdit
          Left = 657
          Top = 89
          Width = 90
          Height = 23
          DataField = 'SALTOTALME'
          TabOrder = 8
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dbeLCredito: TwwDBEdit
          Left = 8
          Top = 89
          Width = 90
          Height = 23
          DataField = 'CLIECREMAX'
          TabOrder = 9
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dbeDisponible: TwwDBEdit
          Left = 121
          Top = 89
          Width = 90
          Height = 23
          DataField = 'DISPONIBLE'
          TabOrder = 10
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
        end
        object dblcClAux: TwwDBLookupCombo
          Left = 9
          Top = 14
          Width = 49
          Height = 23
          DropDownAlignment = taLeftJustify
          TabOrder = 11
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
        end
        object dbeClAux: TwwDBEdit
          Left = 60
          Top = 14
          Width = 150
          Height = 23
          TabOrder = 12
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object TabSheet10: TTabSheet
        Caption = 'Cambia Estado Docs.'
        ImageIndex = 3
        object Label20: TLabel
          Left = 529
          Top = 30
          Width = 78
          Height = 15
          Caption = 'Tipo de Cambio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object wwDBEdit2: TwwDBEdit
          Left = 528
          Top = 46
          Width = 89
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object chbFecha: TCheckBox
          Left = 532
          Top = 76
          Width = 77
          Height = 17
          Caption = 'A la Fecha'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
        end
        object BitBtn2: TBitBtn
          Left = 649
          Top = 45
          Width = 32
          Height = 32
          Default = True
          TabOrder = 2
          OnClick = Z2bbtnAceptarClick
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
        object rgEst: TRadioGroup
          Left = 290
          Top = 15
          Width = 193
          Height = 46
          Caption = 'Estados de Cr'#233'dito'
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ItemIndex = 1
          Items.Strings = (
            'Todos'
            'Pendientes'
            'Cancelados')
          ParentFont = False
          TabOrder = 3
        end
        object GroupBox3: TGroupBox
          Left = 55
          Top = 24
          Width = 209
          Height = 53
          Caption = 'Periodo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object Label21: TLabel
            Left = 7
            Top = 13
            Width = 68
            Height = 15
            Caption = 'Fecha Inicial'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 114
            Top = 12
            Width = 58
            Height = 15
            Caption = 'Fecha Final'
          end
          object Label23: TLabel
            Left = 98
            Top = 31
            Width = 9
            Height = 15
            Caption = 'al'
          end
          object dtpIni: TwwDBDateTimePicker
            Left = 7
            Top = 27
            Width = 87
            Height = 23
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'Draft 12cpi'
            CalendarAttributes.Font.Style = []
            Epoch = 1950
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 0
            UnboundDataType = wwDTEdtDate
          end
          object dtpFin: TwwDBDateTimePicker
            Left = 114
            Top = 27
            Width = 87
            Height = 23
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'Draft 12cpi'
            CalendarAttributes.Font.Style = []
            Epoch = 1950
            ShowButton = True
            TabOrder = 1
            UnboundDataType = wwDTEdtDate
          end
        end
      end
      object TabSheet7: TTabSheet
        Caption = 'Totales'
        object dbgLinea: TwwDBGrid
          Left = 5
          Top = 6
          Width = 721
          Height = 54
          DisableThemesInTitle = False
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 2
          TitleButtons = False
        end
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 151
    Width = 792
    Height = 331
    ActivePage = TabSheet4
    Align = alTop
    TabOrder = 2
    object TabSheet6: TTabSheet
      Caption = 'Todos'
      ImageIndex = 5
    end
    object TabSheet1: TTabSheet
      Caption = 'Documentos'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 21
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Documentos por Pagar'
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgEst2: TwwDBGrid
        Left = 0
        Top = 21
        Width = 784
        Height = 132
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 3
        TitleButtons = True
        OnCalcCellColors = dbgEst2CalCellColors
        OnCalcTitleAttributes = dbgEst2CalcTitleAttributes
        OnTitleButtonClick = dbgEst2TitleButtonClick
        OnDblClick = dbgEst2DblClick
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Letras'
      ImageIndex = 4
      object dbgEst3: TwwDBGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 132
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 3
        TitleButtons = True
        OnCalcCellColors = dbgEst2CalCellColors
        OnCalcTitleAttributes = dbgEst2CalcTitleAttributes
        OnTitleButtonClick = dbgEst2TitleButtonClick
        OnDblClick = dbgEst2DblClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Cheques'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 21
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Cheques'
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgEst4: TwwDBGrid
        Left = 0
        Top = 21
        Width = 784
        Height = 296
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = DMCXP.dsQry3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = True
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Anticipo'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 21
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Anticipos'
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgEst5: TwwDBGrid
        Left = 0
        Top = 21
        Width = 784
        Height = 296
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = True
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'N. Cr'#233'dito'
      ImageIndex = 3
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 21
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Notas de Cr'#233'dito'
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgEst6: TwwDBGrid
        Left = 0
        Top = 21
        Width = 784
        Height = 270
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = True
      end
    end
  end
  object ppDBPipelineF: TppDBPipeline
    UserName = 'DBPipelineF'
    Left = 282
    Top = 375
  end
  object ppDBPipelineL: TppDBPipeline
    UserName = 'DBPipelineL'
    Left = 124
    Top = 376
  end
  object ppReportF: TppReport
    AutoStop = False
    DataPipeline = ppDBPipelineF
    PageLimit = 2
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report1'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 378090
    PrinterSetup.PaperSize = 133
    Template.FileName = 'C:\SOLCxC\Cliente\estc03.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReportFPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 353
    Top = 374
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipelineF'
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'DOCUM1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        DataPipelineName = 'ppDBPipelineF'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 365390
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppCHDOCUM: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPipelineF
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'CDOCUM1'
          PrinterSetup.PaperName = 'Custom'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 20000
          PrinterSetup.mmMarginLeft = 20000
          PrinterSetup.mmMarginRight = 20000
          PrinterSetup.mmMarginTop = 15000
          PrinterSetup.mmPaperHeight = 279000
          PrinterSetup.mmPaperWidth = 378000
          PrinterSetup.PaperSize = 133
          Template.FileName = 'C:\SOLCxC\Cliente\estc03.rtm'
          Units = utMillimeters
          Left = 416
          Top = 304
          Version = '7.02'
          mmColumnWidth = 338000
          DataPipelineName = 'ppDBPipelineF'
          object ppTitleBand3: TppTitleBand
            BeforePrint = DOCUMBeforePrint
            mmBottomOffset = 0
            mmHeight = 63765
            mmPrintPosition = 0
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'Documento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 5821
              mmTop = 54240
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label103'
              AutoSize = False
              Caption = 'N'#186' de Documento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 13494
              mmLeft = 32279
              mmTop = 47625
              mmWidth = 22490
              BandType = 1
            end
            object ppLabel24: TppLabel
              UserName = 'Label24'
              AutoSize = False
              Caption = 'Fecha de Emisi'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 13494
              mmLeft = 57944
              mmTop = 47625
              mmWidth = 11906
              BandType = 1
            end
            object ppLabel25: TppLabel
              UserName = 'Label25'
              AutoSize = False
              Caption = 'Tipo Moneda'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 13758
              mmLeft = 87313
              mmTop = 47361
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              AutoSize = False
              Caption = 'Tipo de Cambio'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 13494
              mmLeft = 75671
              mmTop = 47361
              mmWidth = 9525
              BandType = 1
            end
            object plim1: TppLabel
              UserName = 'plim1'
              AutoSize = False
              Caption = 'Importe'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 4233
              mmLeft = 101600
              mmTop = 56000
              mmWidth = 20902
              BandType = 1
            end
            object plim2: TppLabel
              UserName = 'plim2'
              AutoSize = False
              Caption = 'Saldo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 4233
              mmLeft = 124354
              mmTop = 56000
              mmWidth = 20902
              BandType = 1
            end
            object plim4: TppLabel
              UserName = 'plim4'
              AutoSize = False
              Caption = 'Saldo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 4233
              mmLeft = 168805
              mmTop = 56000
              mmWidth = 20902
              BandType = 1
            end
            object plim3: TppLabel
              UserName = 'plim3'
              AutoSize = False
              Caption = 'Importe'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 4233
              mmLeft = 146579
              mmTop = 56000
              mmWidth = 20902
              BandType = 1
            end
            object plim6: TppLabel
              UserName = 'plim6'
              AutoSize = False
              Caption = 'Pagado'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 4233
              mmLeft = 212725
              mmTop = 56000
              mmWidth = 20902
              BandType = 1
            end
            object plim5: TppLabel
              UserName = 'plim5'
              AutoSize = False
              Caption = 'Importe'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 4233
              mmLeft = 190765
              mmTop = 56000
              mmWidth = 20902
              BandType = 1
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              Weight = 0.750000000000000000
              mmHeight = 1058
              mmLeft = 1058
              mmTop = 61648
              mmWidth = 320940
              BandType = 1
            end
            object ppDBText36: TppDBText
              UserName = 'DBText36'
              DataField = 'CIADES'
              DataPipeline = ppDBPipelineF
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 21167
              mmLeft = 794
              mmTop = 0
              mmWidth = 46302
              BandType = 1
            end
            object ppLabel41: TppLabel
              UserName = 'Label41'
              Caption = 'Estados de Cuenta por Cliente'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4763
              mmLeft = 105834
              mmTop = 5292
              mmWidth = 76729
              BandType = 1
            end
            object pplblPERIODO: TppLabel
              UserName = 'lblPERIODO1'
              Caption = 'lblPERIODO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 133615
              mmTop = 19844
              mmWidth = 21167
              BandType = 1
            end
            object ppLabel45: TppLabel
              UserName = 'Label45'
              AutoSize = False
              Caption = 'Cliente'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 5027
              mmTop = 29898
              mmWidth = 21696
              BandType = 1
            end
            object ppLabel47: TppLabel
              UserName = 'Label47'
              AutoSize = False
              Caption = 'Saldo Local'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              WordWrap = True
              mmHeight = 3440
              mmLeft = 132292
              mmTop = 29898
              mmWidth = 39952
              BandType = 1
            end
            object pplblSalLoc: TppLabel
              UserName = 'pplblSalLoc'
              AutoSize = False
              Caption = 'pplblSalLoc'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 132557
              mmTop = 39952
              mmWidth = 39952
              BandType = 1
            end
            object ppLabel50: TppLabel
              UserName = 'Label50'
              AutoSize = False
              Caption = 'Saldo Extranjero'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              WordWrap = True
              mmHeight = 3440
              mmLeft = 212461
              mmTop = 30000
              mmWidth = 39952
              BandType = 1
            end
            object pplblSalExt: TppLabel
              UserName = 'pplblSalExt1'
              AutoSize = False
              Caption = 'pplblSalExt'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 212461
              mmTop = 40000
              mmWidth = 39952
              BandType = 1
            end
            object ppLine5: TppLine
              UserName = 'Line5'
              Weight = 0.750000000000000000
              mmHeight = 1058
              mmLeft = 1323
              mmTop = 45244
              mmWidth = 320940
              BandType = 1
            end
            object ppSystemVariable3: TppSystemVariable
              UserName = 'SystemVariable3'
              VarType = vtTime
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 260351
              mmTop = 8467
              mmWidth = 24077
              BandType = 1
            end
            object ppLabel54: TppLabel
              UserName = 'Label54'
              Caption = 'Hora :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 248180
              mmTop = 8467
              mmWidth = 11113
              BandType = 1
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              Weight = 0.750000000000000000
              mmHeight = 1058
              mmLeft = 1323
              mmTop = 26723
              mmWidth = 320940
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label55'
              Caption = 'Fecha :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 243682
              mmTop = 3969
              mmWidth = 15610
              BandType = 1
            end
            object ppSystemVariable4: TppSystemVariable
              UserName = 'SystemVariable4'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 262467
              mmTop = 4233
              mmWidth = 18521
              BandType = 1
            end
            object plim7: TppLabel
              UserName = 'plim7'
              AutoSize = False
              Caption = 'Saldo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 4233
              mmLeft = 234686
              mmTop = 56000
              mmWidth = 20902
              BandType = 1
            end
            object plim8: TppLabel
              UserName = 'plim8'
              AutoSize = False
              Caption = 'Importe'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 4233
              mmLeft = 256646
              mmTop = 56000
              mmWidth = 20902
              BandType = 1
            end
            object plim9: TppLabel
              UserName = 'plim9'
              AutoSize = False
              Caption = 'Pagado'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 4233
              mmLeft = 278607
              mmTop = 56000
              mmWidth = 20902
              BandType = 1
            end
            object plim0: TppLabel
              UserName = 'plim0'
              AutoSize = False
              Caption = 'Saldo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 4233
              mmLeft = 300303
              mmTop = 56000
              mmWidth = 20902
              BandType = 1
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'CLIEID'
              DataPipeline = ppDBPipelineF
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 3704
              mmLeft = 5292
              mmTop = 39423
              mmWidth = 17198
              BandType = 1
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              DataField = 'CLIEDES'
              DataPipeline = ppDBPipelineF
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineF'
              mmHeight = 3704
              mmLeft = 45773
              mmTop = 39952
              mmWidth = 65881
              BandType = 1
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 16669
              mmLeft = 100542
              mmTop = 45244
              mmWidth = 1852
              BandType = 1
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 16669
              mmLeft = 190236
              mmTop = 45244
              mmWidth = 1852
              BandType = 1
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 16669
              mmLeft = 255853
              mmTop = 45508
              mmWidth = 1852
              BandType = 1
            end
            object ppLine8: TppLine
              UserName = 'Line8'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 16669
              mmLeft = 321999
              mmTop = 45244
              mmWidth = 1852
              BandType = 1
            end
            object ppLine9: TppLine
              UserName = 'Line9'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 16669
              mmLeft = 1058
              mmTop = 45244
              mmWidth = 1852
              BandType = 1
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              Caption = 'Movimientos M.Local'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2910
              mmLeft = 111390
              mmTop = 47890
              mmWidth = 23283
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = 'Movimientos M.Extranjera'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2910
              mmLeft = 153194
              mmTop = 48000
              mmWidth = 28575
              BandType = 1
            end
            object ppLine10: TppLine
              UserName = 'Line10'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 16669
              mmLeft = 145786
              mmTop = 45244
              mmWidth = 1852
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              Caption = 'Al Cambio en Moneda Local'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 204259
              mmTop = 47890
              mmWidth = 30427
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label4'
              Caption = 'Al Cambio en Moneda Extranjera'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 267759
              mmTop = 47890
              mmWidth = 35719
              BandType = 1
            end
            object pplblESTADO: TppLabel
              UserName = 'lblESTADO'
              Caption = 'lblESTADO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 134144
              mmTop = 13229
              mmWidth = 19050
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            BeforePrint = ppDetailBand5BeforePrint
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            DataPipeline = ppDBPipelineD
            object ppdbLoc: TppDBText
              UserName = 'dbLoc'
              DataField = 'DCCMTOLOC'
              DataPipeline = ppDBPipelineD
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineD'
              mmHeight = 2910
              mmLeft = 116417
              mmTop = 1000
              mmWidth = 28046
              BandType = 4
            end
            object ppdbDoc: TppDBText
              UserName = 'dbDoc'
              DataPipeline = ppDBPipelineD
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineD'
              mmHeight = 2910
              mmLeft = 20638
              mmTop = 1000
              mmWidth = 25665
              BandType = 4
            end
            object ppDBText48: TppDBText
              UserName = 'DBText48'
              DataField = 'CCSERIE2'
              DataPipeline = ppDBPipelineD
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineD'
              mmHeight = 2910
              mmLeft = 50271
              mmTop = 1000
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText49: TppDBText
              UserName = 'DBText49'
              DataField = 'CCNODOC2'
              DataPipeline = ppDBPipelineD
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineD'
              mmHeight = 2910
              mmLeft = 64558
              mmTop = 1000
              mmWidth = 24342
              BandType = 4
            end
            object ppDBText50: TppDBText
              UserName = 'DBText50'
              DataField = 'CCFCANJE'
              DataPipeline = ppDBPipelineD
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineD'
              mmHeight = 2910
              mmLeft = 91281
              mmTop = 1000
              mmWidth = 17198
              BandType = 4
            end
            object ppdbMon: TppDBText
              UserName = 'dbMon'
              DataPipeline = ppDBPipelineD
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              Visible = False
              DataPipelineName = 'ppDBPipelineD'
              mmHeight = 2910
              mmLeft = 8467
              mmTop = 1058
              mmWidth = 9260
              BandType = 4
            end
            object ppdbExt: TppDBText
              UserName = 'dbExt'
              DataField = 'DCCMTOEXT'
              DataPipeline = ppDBPipelineD
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineD'
              mmHeight = 2910
              mmLeft = 161132
              mmTop = 1000
              mmWidth = 28046
              BandType = 4
            end
            object pplLoc: TppLabel
              UserName = 'lLoc'
              Caption = 'S/.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 111654
              mmTop = 1000
              mmWidth = 2646
              BandType = 4
            end
            object pplExt: TppLabel
              UserName = 'lExt'
              Caption = 'us$.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 153988
              mmTop = 1000
              mmWidth = 4498
              BandType = 4
            end
          end
          object ppGroup1: TppGroup
            BreakName = 'CCNODOC'
            DataPipeline = ppDBPipelineD
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppDBPipelineD'
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object ppDBText17: TppDBText
                UserName = 'DBText17'
                DataField = 'DOCDES'
                DataPipeline = ppDBPipelineF
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                WordWrap = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 3440
                mmLeft = 1323
                mmTop = 1000
                mmWidth = 29898
                BandType = 3
                GroupNo = 0
              end
              object ppDBText18: TppDBText
                UserName = 'DBText18'
                DataField = 'CCNODOC'
                DataPipeline = ppDBPipelineF
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 32279
                mmTop = 1058
                mmWidth = 24871
                BandType = 3
                GroupNo = 0
              end
              object ppDBText19: TppDBText
                UserName = 'DBText19'
                DataField = 'CCFEMIS'
                DataPipeline = ppDBPipelineF
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 57679
                mmTop = 1058
                mmWidth = 15610
                BandType = 3
                GroupNo = 0
              end
              object ppDBText21: TppDBText
                UserName = 'DBText21'
                DataField = 'CCTCAMPR'
                DataPipeline = ppDBPipelineF
                DisplayFormat = '### ### ### ###.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 74613
                mmTop = 1058
                mmWidth = 11642
                BandType = 3
                GroupNo = 0
              end
              object ppDBText20: TppDBText
                UserName = 'DBText20'
                DataField = 'TMONABR'
                DataPipeline = ppDBPipelineF
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 90752
                mmTop = 1058
                mmWidth = 6879
                BandType = 3
                GroupNo = 0
              end
              object pdb1: TppDBText
                UserName = 'pdb1'
                AutoSize = True
                DataPipeline = ppDBPipelineF
                DisplayFormat = '### ### ### ###.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 115094
                mmTop = 1058
                mmWidth = 5292
                BandType = 3
                GroupNo = 0
              end
              object pdb2: TppDBText
                UserName = 'pdb2'
                AutoSize = True
                DataPipeline = ppDBPipelineF
                DisplayFormat = '### ### ### ###.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 137319
                mmTop = 1058
                mmWidth = 5292
                BandType = 3
                GroupNo = 0
              end
              object pdb3: TppDBText
                UserName = 'pdb3'
                AutoSize = True
                DataPipeline = ppDBPipelineF
                DisplayFormat = '### ### ### ###.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 159279
                mmTop = 1058
                mmWidth = 5292
                BandType = 3
                GroupNo = 0
              end
              object pdb4: TppDBText
                UserName = 'pdb4'
                AutoSize = True
                DataPipeline = ppDBPipelineF
                DisplayFormat = '### ### ### ###.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 181240
                mmTop = 1058
                mmWidth = 5292
                BandType = 3
                GroupNo = 0
              end
              object pdb5: TppDBText
                UserName = 'pdb5'
                AutoSize = True
                DataPipeline = ppDBPipelineF
                DisplayFormat = '### ### ### ###.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 203200
                mmTop = 1058
                mmWidth = 5292
                BandType = 3
                GroupNo = 0
              end
              object pdb6: TppDBText
                UserName = 'pdb6'
                AutoSize = True
                DataPipeline = ppDBPipelineF
                DisplayFormat = '### ### ### ###.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 225161
                mmTop = 1058
                mmWidth = 5292
                BandType = 3
                GroupNo = 0
              end
              object pdb7: TppDBText
                UserName = 'pdb7'
                AutoSize = True
                DataPipeline = ppDBPipelineF
                DisplayFormat = '### ### ### ###.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 247121
                mmTop = 1058
                mmWidth = 5292
                BandType = 3
                GroupNo = 0
              end
              object pdb8: TppDBText
                UserName = 'pdb8'
                AutoSize = True
                DataPipeline = ppDBPipelineF
                DisplayFormat = '### ### ### ###.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 269082
                mmTop = 1058
                mmWidth = 5292
                BandType = 3
                GroupNo = 0
              end
              object pdb9: TppDBText
                UserName = 'pdb9'
                AutoSize = True
                DataPipeline = ppDBPipelineF
                DisplayFormat = '### ### ### ###.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 291307
                mmTop = 1058
                mmWidth = 5292
                BandType = 3
                GroupNo = 0
              end
              object pdb0: TppDBText
                UserName = 'pdb0'
                AutoSize = True
                DataPipeline = ppDBPipelineF
                DisplayFormat = '### ### ### ###.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBPipelineF'
                mmHeight = 2910
                mmLeft = 314061
                mmTop = 1058
                mmWidth = 5292
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppSubReport2: TppSubReport
        UserName = 'LETRAS1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        DataPipelineName = 'ppDBPipelineL'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5027
        mmWidth = 365390
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppCHLETRAS: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPipelineL
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report1'
          PrinterSetup.PaperName = 'Custom'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 378090
          PrinterSetup.PaperSize = 133
          Template.FileName = 'C:\SOLCxC\Cliente\estc03.rtm'
          Units = utMillimeters
          Left = 520
          Top = 408
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPipelineL'
          object ppTitleBand4: TppTitleBand
            BeforePrint = ppTitleBand4BeforePrint
            mmBottomOffset = 0
            mmHeight = 15875
            mmPrintPosition = 0
            object ppLabel34: TppLabel
              UserName = 'Label34'
              Caption = 'Situaci'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 7938
              mmTop = 5821
              mmWidth = 16669
              BandType = 1
            end
            object ppLabel35: TppLabel
              UserName = 'Label35'
              Caption = 'Ubicaci'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 39423
              mmTop = 5821
              mmWidth = 16669
              BandType = 1
            end
            object ppLabel36: TppLabel
              UserName = 'Label36'
              AutoSize = False
              Caption = 'N'#186' de Letra'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 13494
              mmLeft = 63500
              mmTop = 0
              mmWidth = 18256
              BandType = 1
            end
            object ppLabel37: TppLabel
              UserName = 'Label37'
              AutoSize = False
              Caption = 'Fecha de Emisi'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 13494
              mmLeft = 82550
              mmTop = 0
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel38: TppLabel
              UserName = 'Label38'
              AutoSize = False
              Caption = 'Tipo Moneda'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 13758
              mmLeft = 100542
              mmTop = 0
              mmWidth = 15610
              BandType = 1
            end
            object ppLabel39: TppLabel
              UserName = 'Label39'
              AutoSize = False
              Caption = 'Tipo de Cambio'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 13494
              mmLeft = 116946
              mmTop = 0
              mmWidth = 15610
              BandType = 1
            end
            object pliml1: TppLabel
              UserName = 'pliml1'
              AutoSize = False
              Caption = 'Importe XXXXXXXX'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 13494
              mmLeft = 136261
              mmTop = 0
              mmWidth = 23019
              BandType = 1
            end
            object pliml2: TppLabel
              UserName = 'pliml2'
              AutoSize = False
              Caption = 'Importe XXXXXXXX'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 13494
              mmLeft = 161132
              mmTop = 0
              mmWidth = 23019
              BandType = 1
            end
            object pliml3: TppLabel
              UserName = 'pliml3'
              AutoSize = False
              Caption = 'Importe XXXXXXXX'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 13494
              mmLeft = 186267
              mmTop = 0
              mmWidth = 23019
              BandType = 1
            end
            object pliml4: TppLabel
              UserName = 'pliml4'
              AutoSize = False
              Caption = 'Importe XXXXXXXX'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 13494
              mmLeft = 211403
              mmTop = 0
              mmWidth = 23019
              BandType = 1
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              Weight = 0.750000000000000000
              mmHeight = 1058
              mmLeft = 529
              mmTop = 14817
              mmWidth = 284163
              BandType = 1
            end
          end
          object ppDetailBand6: TppDetailBand
            Save = True
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppDBText29: TppDBText
              UserName = 'DBText102'
              DataField = 'CCNODOC'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 2910
              mmLeft = 63500
              mmTop = 0
              mmWidth = 17992
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              DataField = 'CCFEMIS'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 2910
              mmLeft = 82550
              mmTop = 0
              mmWidth = 17463
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText31'
              DataField = 'TMONABR'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 2910
              mmLeft = 100806
              mmTop = 0
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText32'
              DataField = 'CCTCAMPR'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '### ### ### ###.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 2910
              mmLeft = 116946
              mmTop = 0
              mmWidth = 15346
              BandType = 4
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              DataField = 'SITUADES'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 3440
              mmLeft = 0
              mmTop = 0
              mmWidth = 29898
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'DBText35'
              DataField = 'UBICADES'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 3440
              mmLeft = 31221
              mmTop = 0
              mmWidth = 30956
              BandType = 4
            end
            object pdbl2: TppDBText
              UserName = 'pdbl2'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '### ### ### ###.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 2910
              mmLeft = 160602
              mmTop = 0
              mmWidth = 23019
              BandType = 4
            end
            object pdbl1: TppDBText
              UserName = 'pdbl1'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '### ### ### ###.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 2910
              mmLeft = 135732
              mmTop = 0
              mmWidth = 23019
              BandType = 4
            end
            object pdbl3: TppDBText
              UserName = 'pdbl3'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '### ### ### ###.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 2910
              mmLeft = 185738
              mmTop = 0
              mmWidth = 23019
              BandType = 4
            end
            object pdbl4: TppDBText
              UserName = 'pdbl4'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '### ### ### ###.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 2910
              mmLeft = 210873
              mmTop = 0
              mmWidth = 23019
              BandType = 4
            end
          end
        end
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLbl1: TppLabel
        UserName = 'Lbl1'
        Caption = 'Lbl1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101865
        mmTop = 1852
        mmWidth = 8467
        BandType = 7
      end
      object ppLblD1: TppLabel
        UserName = 'LblD1'
        AutoSize = False
        Caption = 'LblD1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 112448
        mmTop = 1852
        mmWidth = 25400
        BandType = 7
      end
      object ppLbl2: TppLabel
        UserName = 'Lbl2'
        Caption = 'Lbl2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 173302
        mmTop = 1852
        mmWidth = 8467
        BandType = 7
      end
      object ppLblD2: TppLabel
        UserName = 'LblD2'
        AutoSize = False
        Caption = 'LblD2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 184150
        mmTop = 1852
        mmWidth = 25400
        BandType = 7
      end
      object ppLbl3: TppLabel
        UserName = 'Lbl3'
        Caption = 'Lbl3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 241300
        mmTop = 1852
        mmWidth = 8467
        BandType = 7
      end
      object ppLblD3: TppLabel
        UserName = 'LblD3'
        AutoSize = False
        Caption = 'LblD3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 252413
        mmTop = 1852
        mmWidth = 25400
        BandType = 7
      end
    end
  end
  object ppDBPipelineD: TppDBPipeline
    SkipWhenNoRecords = False
    UserName = 'DBPipelineD'
    Left = 203
    Top = 376
  end
  object ppdbp1: TppDBPipeline
    UserName = 'dbp1'
    Left = 638
    Top = 376
  end
  object ppdbp2: TppDBPipeline
    UserName = 'dbp2'
    Left = 587
    Top = 376
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppdbp1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report2'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 11000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 378090
    PrinterSetup.PaperSize = 133
    Template.FileName = 'C:\SolCxC\SolFormatos\CtaCte.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport2PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 688
    Top = 376
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbp1'
    object ppHeaderBand2: TppHeaderBand
      BeforePrint = ppHeaderBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 30427
      mmPrintPosition = 0
      object pplTitulo: TppLabel
        UserName = 'lTitulo'
        Caption = 'Estado de Cta.Cte. :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 134144
        mmTop = 1058
        mmWidth = 35719
        BandType = 0
      end
      object pplPeriodo: TppLabel
        UserName = 'lPeriodo1'
        Caption = 'lblPERIODO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 139965
        mmTop = 8202
        mmWidth = 21696
        BandType = 0
      end
      object pplCia: TppLabel
        UserName = 'lCia1'
        Caption = 'Compa'#241#237'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 1588
        mmTop = 1058
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 259028
        mmTop = 1058
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'Hora :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 260351
        mmTop = 7938
        mmWidth = 8467
        BandType = 0
      end
      object pplSalMN: TppLabel
        UserName = 'lSalMN'
        Caption = 'pplblSalLoc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 154517
        mmTop = 25400
        mmWidth = 16669
        BandType = 0
      end
      object pplSalME: TppLabel
        UserName = 'lSalExt1'
        Caption = 'pplblSalExt'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 235744
        mmTop = 25400
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        Caption = 'Saldo M.N.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 154517
        mmTop = 20902
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = 'Saldo M.E.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 235744
        mmTop = 20902
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 15610
        mmWidth = 305330
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 279136
        mmTop = 1058
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 279136
        mmTop = 7938
        mmWidth = 17463
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppSubReport3: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppdbp1'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 1058
        mmWidth = 365390
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppcFactura: TppChildReport
          AutoStop = False
          DataPipeline = ppdbp1
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report2'
          PrinterSetup.PaperName = 'Custom'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 11000
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 378090
          PrinterSetup.PaperSize = 133
          Template.FileName = 'C:\SolCxC\SolFormatos\CtaCte.rtm'
          Units = utMillimeters
          Left = 544
          Top = 432
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppdbp1'
          object ppDetailBand3: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              AutoSize = True
              DataField = 'DOCABR'
              DataPipeline = ppdbp1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 2646
              mmTop = 265
              mmWidth = 11906
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'CPSERIE'
              DataPipeline = ppdbp1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 44186
              mmTop = 265
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              AutoSize = True
              DataField = 'CPNODOC'
              DataPipeline = ppdbp1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 58738
              mmTop = 265
              mmWidth = 14023
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'CPFEMIS'
              DataPipeline = ppdbp1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 96573
              mmTop = 265
              mmWidth = 21960
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'dbCargoMN1'
              AutoSize = True
              DataField = 'MTOLOC'
              DataPipeline = ppdbp1
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 167217
              mmTop = 265
              mmWidth = 12700
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'dbAbonoMN1'
              AutoSize = True
              DataField = 'PAGLOC'
              DataPipeline = ppdbp1
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 207963
              mmTop = 265
              mmWidth = 11642
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'dbCargoME1'
              AutoSize = True
              DataField = 'MTOEXT'
              DataPipeline = ppdbp1
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 246857
              mmTop = 265
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'dbAbonoME1'
              AutoSize = True
              DataField = 'PAGEXT'
              DataPipeline = ppdbp1
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 287867
              mmTop = 265
              mmWidth = 11906
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              DataField = 'TMONABR'
              DataPipeline = ppdbp1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 135996
              mmTop = 265
              mmWidth = 9260
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              AutoSize = True
              DataField = 'PROV'
              DataPipeline = ppdbp1
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 192617
              mmTop = 529
              mmWidth = 7673
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 16404
            mmPrintPosition = 0
            object ppLabel86: TppLabel
              UserName = 'Label86'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------------------------------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 0
              mmTop = 1323
              mmWidth = 305330
              BandType = 7
            end
            object ppDBCalc4: TppDBCalc
              UserName = 'dbcCargoMN4'
              AutoSize = True
              DataField = 'MTOLOC'
              DataPipeline = ppdbp1
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 160338
              mmTop = 6085
              mmWidth = 19844
              BandType = 7
            end
            object ppDBCalc5: TppDBCalc
              UserName = 'DBCalc5'
              AutoSize = True
              DataField = 'PAGLOC'
              DataPipeline = ppdbp1
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 200555
              mmTop = 6085
              mmWidth = 18785
              BandType = 7
            end
            object ppDBCalc6: TppDBCalc
              UserName = 'DBCalc6'
              AutoSize = True
              DataField = 'MTOEXT'
              DataPipeline = ppdbp1
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 239978
              mmTop = 6085
              mmWidth = 20108
              BandType = 7
            end
            object ppDBCalc7: TppDBCalc
              UserName = 'DBCalc7'
              AutoSize = True
              DataField = 'PAGEXT'
              DataPipeline = ppdbp1
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbp1'
              mmHeight = 3704
              mmLeft = 280723
              mmTop = 6085
              mmWidth = 19050
              BandType = 7
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'TOTAL DOCUMENTOS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 112448
              mmTop = 6085
              mmWidth = 28575
              BandType = 7
            end
          end
          object ppGroup2: TppGroup
            BreakName = 'ppDBText4'
            BreakType = btCustomField
            OutlineSettings.CreateNode = True
            NewPage = True
            ResetPageNo = True
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = ''
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 20373
              mmPrintPosition = 0
              object ppLabel62: TppLabel
                UserName = 'Label62'
                Caption = 'NUMERO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 58473
                mmTop = 10319
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppLabel65: TppLabel
                UserName = 'Label65'
                Caption = 'F.EMISION'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 98161
                mmTop = 10319
                mmWidth = 12965
                BandType = 3
                GroupNo = 0
              end
              object ppLabel67: TppLabel
                UserName = 'Label67'
                Caption = 'MONEDA NACIONAL'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 169863
                mmTop = 5292
                mmWidth = 26458
                BandType = 3
                GroupNo = 0
              end
              object ppLabel68: TppLabel
                UserName = 'Label68'
                Caption = 'CARGOS'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 169334
                mmTop = 10319
                mmWidth = 11906
                BandType = 3
                GroupNo = 0
              end
              object ppLabel70: TppLabel
                UserName = 'Label70'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 151871
                mmTop = 5292
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel71: TppLabel
                UserName = 'Label304'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 151871
                mmTop = 10319
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel74: TppLabel
                UserName = 'Label74'
                AutoSize = False
                Caption = 
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '--------------------------------'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 0
                mmTop = 794
                mmWidth = 305330
                BandType = 3
                GroupNo = 0
              end
              object ppLabel75: TppLabel
                UserName = 'Label75'
                AutoSize = False
                Caption = 
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '--------------------------------'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 0
                mmTop = 15610
                mmWidth = 305330
                BandType = 3
                GroupNo = 0
              end
              object ppLabel78: TppLabel
                UserName = 'Label78'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 220134
                mmTop = 5292
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel79: TppLabel
                UserName = 'Label79'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 220134
                mmTop = 10319
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel80: TppLabel
                UserName = 'Label80'
                Caption = 'ABONOS'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 206905
                mmTop = 10319
                mmWidth = 11906
                BandType = 3
                GroupNo = 0
              end
              object ppLabel81: TppLabel
                UserName = 'Label201'
                Caption = 'MONEDA EXTRANJERA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 249503
                mmTop = 5292
                mmWidth = 30163
                BandType = 3
                GroupNo = 0
              end
              object ppLabel82: TppLabel
                UserName = 'Label82'
                Caption = 'CARGOS'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 247386
                mmTop = 10319
                mmWidth = 11906
                BandType = 3
                GroupNo = 0
              end
              object ppLabel83: TppLabel
                UserName = 'Label83'
                Caption = 'ABONOS'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 287338
                mmTop = 10319
                mmWidth = 11906
                BandType = 3
                GroupNo = 0
              end
              object ppLabel84: TppLabel
                UserName = 'Label84'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 301096
                mmTop = 10319
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel85: TppLabel
                UserName = 'Label85'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 301096
                mmTop = 5292
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel109: TppLabel
                UserName = 'Label109'
                Caption = 'MONEDA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 132821
                mmTop = 10319
                mmWidth = 12965
                BandType = 3
                GroupNo = 0
              end
              object ppLabel58: TppLabel
                UserName = 'Label58'
                Caption = 'D   O   C   U   M   E   N   T   O'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 19050
                mmTop = 5292
                mmWidth = 35983
                BandType = 3
                GroupNo = 0
              end
              object ppLabel63: TppLabel
                UserName = 'Label63'
                Caption = 'SERIE'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 44450
                mmTop = 10319
                mmWidth = 7408
                BandType = 3
                GroupNo = 0
              end
              object ppLabel64: TppLabel
                UserName = 'Label64'
                Caption = 'TIPO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 4498
                mmTop = 10319
                mmWidth = 5821
                BandType = 3
                GroupNo = 0
              end
              object ppLabel73: TppLabel
                UserName = 'Label73'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 265
                mmTop = 10319
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel72: TppLabel
                UserName = 'Label72'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 265
                mmTop = 5292
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppSubReport4: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport3
        TraverseAllData = False
        DataPipelineName = 'ppDBPipelineL'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 11642
        mmWidth = 365390
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPipelineL
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report2'
          PrinterSetup.PaperName = 'Custom'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 11000
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 378090
          PrinterSetup.PaperSize = 133
          Template.FileName = 'C:\SolCxC\SolFormatos\CtaCte.rtm'
          Units = utMillimeters
          Left = 560
          Top = 448
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPipelineL'
          object ppDetailBand7: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              DataField = 'CPNODOC'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 3704
              mmLeft = 2646
              mmTop = 529
              mmWidth = 27252
              BandType = 4
            end
            object ppDBText37: TppDBText
              UserName = 'DBText37'
              DataField = 'CPFEMIS'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 3704
              mmLeft = 32279
              mmTop = 529
              mmWidth = 21431
              BandType = 4
            end
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              DataField = 'TMONABR'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 3704
              mmLeft = 66146
              mmTop = 529
              mmWidth = 8467
              BandType = 4
            end
            object ppDBText40: TppDBText
              UserName = 'DBText40'
              AutoSize = True
              DataField = 'MTOLOC'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 3704
              mmLeft = 113771
              mmTop = 529
              mmWidth = 12700
              BandType = 4
            end
            object ppDBText41: TppDBText
              UserName = 'DBText401'
              AutoSize = True
              DataField = 'MTOEXT'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 3704
              mmLeft = 172773
              mmTop = 529
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'CPESTADO'
              DataPipeline = ppDBPipelineL
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 3704
              mmLeft = 85196
              mmTop = 529
              mmWidth = 8467
              BandType = 4
            end
          end
          object ppSummaryBand4: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 11642
            mmPrintPosition = 0
            object ppDBCalc8: TppDBCalc
              UserName = 'DBCalc1'
              AutoSize = True
              DataField = 'MTOEXT'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 3704
              mmLeft = 165629
              mmTop = 6879
              mmWidth = 20108
              BandType = 7
            end
            object ppDBCalc9: TppDBCalc
              UserName = 'DBCalc9'
              AutoSize = True
              DataField = 'MTOLOC'
              DataPipeline = ppDBPipelineL
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipelineL'
              mmHeight = 3704
              mmLeft = 106627
              mmTop = 6879
              mmWidth = 19844
              BandType = 7
            end
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 'TOTAL DE LETRAS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 60854
              mmTop = 6879
              mmWidth = 24606
              BandType = 7
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              AutoSize = False
              Caption = 
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '----------------------------------------------------------------' +
                '--------------------------------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 2117
              mmTop = 794
              mmWidth = 183886
              BandType = 7
            end
          end
          object ppGroup3: TppGroup
            BreakName = 'ppDBText5'
            BreakType = btCustomField
            OutlineSettings.CreateNode = True
            NewPage = True
            ResetPageNo = True
            UserName = 'Group3'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = ''
            object ppGroupHeaderBand3: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 28310
              mmPrintPosition = 0
              object ppLabel88: TppLabel
                UserName = 'Label88'
                Caption = 'LETRA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 4498
                mmTop = 18785
                mmWidth = 9790
                BandType = 3
                GroupNo = 0
              end
              object ppLabel91: TppLabel
                UserName = 'Label91'
                Caption = 'F.EMISION'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 33602
                mmTop = 18785
                mmWidth = 12965
                BandType = 3
                GroupNo = 0
              end
              object ppLabel93: TppLabel
                UserName = 'Label701'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 97102
                mmTop = 13758
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel94: TppLabel
                UserName = 'Label94'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 97102
                mmTop = 18785
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel95: TppLabel
                UserName = 'Label95'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 529
                mmTop = 13758
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel96: TppLabel
                UserName = 'Label96'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 529
                mmTop = 18785
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel99: TppLabel
                UserName = 'Label99'
                Caption = 'IMPORTES'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 137584
                mmTop = 12965
                mmWidth = 14817
                BandType = 3
                GroupNo = 0
              end
              object ppLabel100: TppLabel
                UserName = 'Label100'
                Caption = 'MONEDA LOCAL'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 108744
                mmTop = 18785
                mmWidth = 23548
                BandType = 3
                GroupNo = 0
              end
              object ppLabel103: TppLabel
                UserName = 'Label103'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 145786
                mmTop = 19050
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel105: TppLabel
                UserName = 'Label105'
                Caption = 'MONEDA EXTRANJERA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 159809
                mmTop = 18785
                mmWidth = 32808
                BandType = 3
                GroupNo = 0
              end
              object ppLabel107: TppLabel
                UserName = 'Label107'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 196321
                mmTop = 18785
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel108: TppLabel
                UserName = 'Label108'
                Caption = #166
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 196321
                mmTop = 13758
                mmWidth = 529
                BandType = 3
                GroupNo = 0
              end
              object ppLabel110: TppLabel
                UserName = 'Label110'
                Caption = 'MONEDA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 63500
                mmTop = 18785
                mmWidth = 12965
                BandType = 3
                GroupNo = 0
              end
              object ppLabel11: TppLabel
                UserName = 'Label11'
                AutoSize = False
                Caption = 
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '--------------------------------'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 2381
                mmTop = 7144
                mmWidth = 183886
                BandType = 3
                GroupNo = 0
              end
              object ppLabel12: TppLabel
                UserName = 'Label12'
                AutoSize = False
                Caption = 
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '--------------------------------'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 2381
                mmTop = 23813
                mmWidth = 183886
                BandType = 3
                GroupNo = 0
              end
              object ppLabel15: TppLabel
                UserName = 'Label15'
                Caption = 'DETALLE DE LETRAS'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 12
                Font.Style = []
                Transparent = True
                mmHeight = 5027
                mmLeft = 74613
                mmTop = 1058
                mmWidth = 40217
                BandType = 3
                GroupNo = 0
              end
              object ppLabel16: TppLabel
                UserName = 'Label1101'
                Caption = 'ESTADO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 82550
                mmTop = 18785
                mmWidth = 11642
                BandType = 3
                GroupNo = 0
              end
              object ppDBText5: TppDBText
                UserName = 'DBText5'
                AutoSize = True
                DataField = 'PROV'
                DataPipeline = ppDBPipelineL
                DisplayFormat = '###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                Visible = False
                DataPipelineName = 'ppDBPipelineL'
                mmHeight = 3704
                mmLeft = 16933
                mmTop = 12171
                mmWidth = 7673
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand3: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'TOTAL GENERAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 76465
        mmTop = 11642
        mmWidth = 28046
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'SALDO ACTUAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 76465
        mmTop = 17727
        mmWidth = 25929
        BandType = 7
      end
      object pplActMN: TppLabel
        UserName = 'lSalMN1'
        Caption = 'pplblSalLoc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 154517
        mmTop = 17727
        mmWidth = 16669
        BandType = 7
      end
      object pplMovME: TppLabel
        UserName = 'lMovME'
        Caption = 'pplblSalLoc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 235744
        mmTop = 11642
        mmWidth = 16669
        BandType = 7
      end
      object pplMovMN: TppLabel
        UserName = 'lMovMN'
        Caption = 'pplblSalLoc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 154517
        mmTop = 11642
        mmWidth = 16669
        BandType = 7
      end
      object pplActME: TppLabel
        UserName = 'lActME'
        Caption = 'pplblSalLoc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 235744
        mmTop = 17727
        mmWidth = 16669
        BandType = 7
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 305330
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 4498
        mmWidth = 305330
        BandType = 7
      end
    end
  end
end
