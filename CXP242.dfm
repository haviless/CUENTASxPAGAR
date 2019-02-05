object FProveNotiSunat: TFProveNotiSunat
  Left = 298
  Top = 189
  Width = 696
  Height = 520
  BorderIcons = [biSystemMenu]
  Caption = 'Proveedores Notificados por la SUNAT'
  Color = 14869218
  Constraints.MaxHeight = 520
  Constraints.MaxWidth = 696
  Constraints.MinHeight = 520
  Constraints.MinWidth = 696
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bbtnOK: TBitBtn
    Left = 362
    Top = 450
    Width = 90
    Height = 31
    Hint = 'Grabar Informaci'#243'n'
    Caption = 'Grabar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
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
  object Z2bbtnCancel: TBitBtn
    Left = 583
    Top = 450
    Width = 90
    Height = 31
    Hint = 'Salir'
    Caption = 'Salir'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
  object bbtnAnula: TBitBtn
    Left = 473
    Top = 450
    Width = 90
    Height = 31
    Hint = 'Desactivar'
    Caption = 'Levantar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = bbtnAnulaClick
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
  object pnlCab2: TPanel
    Left = 4
    Top = 344
    Width = 678
    Height = 102
    TabOrder = 3
    object Label8: TLabel
      Left = 343
      Top = 16
      Width = 106
      Height = 16
      Caption = 'Fecha de Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 19
      Top = 16
      Width = 115
      Height = 16
      Caption = 'Usuario de Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 19
      Top = 68
      Width = 94
      Height = 16
      Caption = 'Usuario Levante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label11: TLabel
      Left = 343
      Top = 68
      Width = 104
      Height = 16
      Caption = 'Fecha de Levante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 5
      Top = 48
      Width = 668
      Height = 6
    end
    object dbeUsuReg: TwwDBEdit
      Left = 152
      Top = 11
      Width = 120
      Height = 25
      Color = clInfoBk
      DataField = 'USUARIO'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeUsuDes: TwwDBEdit
      Left = 152
      Top = 66
      Width = 120
      Height = 25
      Color = clInfoBk
      DataField = 'USUCIER'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeFecReg: TwwDBDateTimePicker
      Left = 492
      Top = 13
      Width = 168
      Height = 25
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Color = clInfoBk
      DataField = 'FECREG'
      Epoch = 1950
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 2
    end
    object dbeFecDes: TwwDBDateTimePicker
      Left = 492
      Top = 65
      Width = 168
      Height = 25
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Color = clInfoBk
      DataField = 'FECCIE'
      Epoch = 1950
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 3
    end
  end
  object pnlCab1: TPanel
    Left = 4
    Top = 4
    Width = 678
    Height = 336
    TabOrder = 4
    object Label1: TLabel
      Left = 11
      Top = 16
      Width = 56
      Height = 16
      Caption = 'NUMERO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 147
      Top = 105
      Width = 57
      Height = 16
      Caption = 'Resoluci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 295
      Top = 105
      Width = 80
      Height = 16
      Caption = 'Fecha Emisi'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 431
      Top = 105
      Width = 94
      Height = 16
      Caption = 'Fecha Recepci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 590
      Top = 105
      Width = 35
      Height = 16
      Caption = 'Monto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 446
      Top = 296
      Width = 79
      Height = 19
      Caption = 'Monto Saldo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 27
      Top = 302
      Width = 40
      Height = 16
      Caption = 'Estado'
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
      Top = 90
      Width = 668
      Height = 6
    end
    object dbeNumero: TwwDBEdit
      Left = 82
      Top = 9
      Width = 60
      Height = 27
      Color = clInfoBk
      DataField = 'NUMERO'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeSaldo: TwwDBEdit
      Left = 558
      Top = 292
      Width = 100
      Height = 25
      DataField = 'SALDO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object pnlEstado: TPanel
      Left = 114
      Top = 283
      Width = 209
      Height = 46
      Color = clSilver
      Enabled = False
      TabOrder = 10
      object rgEstado: TwwRadioGroup
        Left = 6
        Top = 1
        Width = 199
        Height = 38
        DisableThemes = False
        Columns = 2
        DataField = 'ESTADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        Items.Strings = (
          'Activo'
          'Desactivo')
        ParentFont = False
        TabOrder = 0
        Values.Strings = (
          'A'
          'D')
      end
    end
    object pnlCab3: TPanel
      Left = 1
      Top = 37
      Width = 673
      Height = 48
      BevelOuter = bvNone
      TabOrder = 1
      object lblProv: TLabel
        Left = 11
        Top = 16
        Width = 39
        Height = 16
        Caption = 'R.U.C.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblProvNom: TLabel
        Left = 255
        Top = 16
        Width = 107
        Height = 16
        Caption = 'Nombre Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dblcdProv: TwwDBLookupComboDlg
        Left = 82
        Top = 12
        Width = 120
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
          'PROVRUC'#9'15'#9'RUC'#9'F'
          'PROVDES'#9'40'#9'Raz'#243'n Social'#9'F'
          'PROV'#9'15'#9'C'#243'digo'#9'F')
        DataField = 'PROVRUC'
        LookupField = 'PROVRUC'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 11
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcdProvExit
      end
      object dbeNombre: TwwDBEdit
        Left = 368
        Top = 12
        Width = 294
        Height = 25
        DataField = 'PROVDES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlLev: TPanel
      Left = 8
      Top = 240
      Width = 664
      Height = 35
      Enabled = False
      TabOrder = 5
      object Label14: TLabel
        Left = 22
        Top = 10
        Width = 46
        Height = 16
        Caption = 'Levante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dbeResolucion3: TwwDBEdit
        Left = 109
        Top = 5
        Width = 150
        Height = 25
        DataField = 'NUMRESLEV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dtpFecEmi3: TwwDBDateTimePicker
        Left = 282
        Top = 5
        Width = 100
        Height = 25
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECEMILEV'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
      end
      object dbeFecRec3: TwwDBDateTimePicker
        Left = 420
        Top = 5
        Width = 100
        Height = 25
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECRECLEV'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 2
      end
    end
    object pnlp2: TPanel
      Left = 8
      Top = 202
      Width = 664
      Height = 35
      Enabled = False
      TabOrder = 4
      object Label13: TLabel
        Left = 22
        Top = 10
        Width = 68
        Height = 16
        Caption = 'Pago Parcial'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dbeResolucion2: TwwDBEdit
        Left = 109
        Top = 5
        Width = 150
        Height = 25
        DataField = 'NUMRESFIN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dtpFecEmi2: TwwDBDateTimePicker
        Left = 282
        Top = 5
        Width = 100
        Height = 25
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECEMIFIN'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
      end
      object dbeFecRec2: TwwDBDateTimePicker
        Left = 420
        Top = 5
        Width = 100
        Height = 25
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECRECFIN'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 2
      end
      object dbeDeuda2: TwwDBEdit
        Left = 550
        Top = 5
        Width = 100
        Height = 25
        DataField = 'PAGFIN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlp1: TPanel
      Left = 8
      Top = 164
      Width = 664
      Height = 35
      Enabled = False
      TabOrder = 3
      object Label12: TLabel
        Left = 22
        Top = 10
        Width = 68
        Height = 16
        Caption = 'Pago Parcial'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dbeResolucion1: TwwDBEdit
        Left = 109
        Top = 5
        Width = 150
        Height = 25
        DataField = 'NUMRESPAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dtpFecEmi1: TwwDBDateTimePicker
        Left = 282
        Top = 5
        Width = 100
        Height = 25
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECEMIPAR'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
      end
      object dbeFecRec1: TwwDBDateTimePicker
        Left = 420
        Top = 5
        Width = 100
        Height = 25
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECRECPAR'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 2
      end
      object dbeDeuda1: TwwDBEdit
        Left = 550
        Top = 5
        Width = 100
        Height = 25
        DataField = 'PAGPAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlDeuda: TPanel
      Left = 8
      Top = 126
      Width = 664
      Height = 35
      Enabled = False
      TabOrder = 2
      object Label15: TLabel
        Left = 22
        Top = 10
        Width = 36
        Height = 16
        Caption = 'Deuda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dbeResolucion: TwwDBEdit
        Left = 109
        Top = 5
        Width = 150
        Height = 25
        DataField = 'NUMRES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dtpFecEmi: TwwDBDateTimePicker
        Left = 282
        Top = 5
        Width = 100
        Height = 25
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECEMI'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
      end
      object dbeFecRec: TwwDBDateTimePicker
        Left = 420
        Top = 5
        Width = 100
        Height = 25
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECREC'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 2
      end
      object dbeDeuda: TwwDBEdit
        Left = 550
        Top = 5
        Width = 100
        Height = 25
        DataField = 'DEUDA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object cb1: TCheckBox
      Left = 10
      Top = 127
      Width = 16
      Height = 17
      TabOrder = 6
      OnClick = cb1Click
    end
    object cb2: TCheckBox
      Left = 10
      Top = 165
      Width = 16
      Height = 17
      TabOrder = 7
      OnClick = cb2Click
    end
    object cb3: TCheckBox
      Left = 10
      Top = 203
      Width = 16
      Height = 17
      TabOrder = 8
      OnClick = cb3Click
    end
    object cb4: TCheckBox
      Left = 10
      Top = 241
      Width = 16
      Height = 17
      TabOrder = 9
      OnClick = cb4Click
    end
  end
end
