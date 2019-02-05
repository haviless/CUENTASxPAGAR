object FInserta: TFInserta
  Left = 140
  Top = 59
  Width = 759
  Height = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCia: TLabel
    Left = 24
    Top = -1
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
  object dblcCia: TwwDBLookupCombo
    Left = 24
    Top = 15
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
      'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
    LookupTable = DMCXP.cdsCia
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
  end
  object edtCia: TEdit
    Left = 67
    Top = 15
    Width = 137
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
  object PageControl1: TPageControl
    Left = 3
    Top = 50
    Width = 745
    Height = 532
    ActivePage = TabSheet8
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label1: TLabel
        Left = 26
        Top = 49
        Width = 168
        Height = 13
        Caption = 'Letras Generadas en CXP301'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 18
        Top = 270
        Width = 24
        Height = 13
        Caption = 'Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 18
        Top = 294
        Width = 37
        Height = 13
        Caption = 'No Doc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 4
        Top = 5
        Width = 733
        Height = 212
        Shape = bsFrame
      end
      object lblProv: TLabel
        Left = 18
        Top = 244
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
      object Bevel2: TBevel
        Left = 1
        Top = 226
        Width = 736
        Height = 210
        Shape = bsFrame
      end
      object dbg1: TwwDBGrid
        Left = 16
        Top = 65
        Width = 721
        Height = 134
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object Button1: TButton
        Left = 24
        Top = 12
        Width = 145
        Height = 25
        Caption = 'Busca Faltantes en CXP304'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button3: TButton
        Left = 324
        Top = 283
        Width = 97
        Height = 25
        Caption = 'Inserta en CXP304'
        TabOrder = 2
        OnClick = Button3Click
      end
      object edtSerie: TEdit
        Left = 80
        Top = 270
        Width = 79
        Height = 21
        TabOrder = 3
      end
      object edtNDoc: TEdit
        Left = 80
        Top = 294
        Width = 79
        Height = 21
        TabOrder = 4
      end
      object dblcdProv: TwwDBLookupComboDlg
        Left = 80
        Top = 242
        Width = 90
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
        LookupTable = DMCXP.cdsProv
        LookupField = 'PROV'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 10
        ParentFont = False
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object Button2: TButton
        Left = 184
        Top = 283
        Width = 105
        Height = 25
        Caption = 'Filtra Documentos'
        TabOrder = 6
        OnClick = Button2Click
      end
      object dbg2: TwwDBGrid
        Left = 11
        Top = 323
        Width = 726
        Height = 92
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 7
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object Bevel4: TBevel
        Left = -7
        Top = 226
        Width = 736
        Height = 210
        Shape = bsFrame
      end
      object Bevel3: TBevel
        Left = -4
        Top = 5
        Width = 733
        Height = 212
        Shape = bsFrame
      end
      object Label4: TLabel
        Left = 18
        Top = 49
        Width = 106
        Height = 13
        Caption = 'Canjes en CXP308'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 10
        Top = 270
        Width = 27
        Height = 13
        Caption = 'Canje'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 10
        Top = 244
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
      object Label6: TLabel
        Left = 40
        Top = 304
        Width = 120
        Height = 13
        Caption = 'Docs.Referencia CxP304'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 353
        Top = 302
        Width = 72
        Height = 13
        Caption = 'Letras -CxP301'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbg3: TwwDBGrid
        Left = 8
        Top = 65
        Width = 721
        Height = 134
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object Button4: TButton
        Left = 16
        Top = 12
        Width = 145
        Height = 25
        Caption = 'Busca Faltantes en CXP305'
        TabOrder = 1
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 316
        Top = 261
        Width = 97
        Height = 25
        Caption = 'Inserta en CXP305'
        TabOrder = 2
        OnClick = Button5Click
      end
      object edtCanje: TEdit
        Left = 72
        Top = 270
        Width = 79
        Height = 21
        TabOrder = 3
      end
      object wwDBLookupComboDlg1: TwwDBLookupComboDlg
        Left = 72
        Top = 242
        Width = 90
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
        LookupTable = DMCXP.cdsProv
        LookupField = 'PROV'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 10
        ParentFont = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object Button6: TButton
        Left = 176
        Top = 259
        Width = 105
        Height = 25
        Caption = 'Filtra Documentos'
        TabOrder = 5
        OnClick = Button6Click
      end
      object dbg4: TwwDBGrid
        Left = 3
        Top = 323
        Width = 334
        Height = 92
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 6
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object dbg5: TwwDBGrid
        Left = 342
        Top = 320
        Width = 384
        Height = 96
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 7
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object Label9: TLabel
        Left = 16
        Top = 47
        Width = 115
        Height = 13
        Caption = 'Cabecera de Canjes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 24
        Width = 36
        Height = 13
        Caption = 'Periodo'
      end
      object lblTotalReg: TLabel
        Left = 656
        Top = 192
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 579
        Top = 194
        Width = 50
        Height = 13
        Caption = 'Total Reg:'
      end
      object dbg8: TwwDBGrid
        Left = 8
        Top = 65
        Width = 713
        Height = 120
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object edtPeriodo: TEdit
        Left = 48
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object Button7: TButton
        Left = 208
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Filtrar'
        TabOrder = 2
        OnClick = Button7Click
      end
      object Panel1: TPanel
        Left = 378
        Top = 5
        Width = 185
        Height = 56
        TabOrder = 3
        object Label12: TLabel
          Left = 16
          Top = 8
          Width = 60
          Height = 13
          Caption = 'Actualizados'
        end
        object Label13: TLabel
          Left = 16
          Top = 24
          Width = 77
          Height = 13
          Caption = 'No Actualizados'
        end
        object lblSave: TLabel
          Left = 107
          Top = 10
          Width = 3
          Height = 13
        end
        object lblNoSave: TLabel
          Left = 105
          Top = 24
          Width = 3
          Height = 13
        end
        object Label14: TLabel
          Left = 16
          Top = 38
          Width = 77
          Height = 13
          Caption = 'No Encontrados'
        end
        object lblnofind: TLabel
          Left = 108
          Top = 39
          Width = 3
          Height = 13
        end
      end
      object pbTablas: TProgressBar
        Left = 14
        Top = 230
        Width = 707
        Height = 16
        Cursor = crArrow
        BorderWidth = 2
        TabOrder = 4
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 3
      object Label15: TLabel
        Left = 16
        Top = 47
        Width = 115
        Height = 13
        Caption = 'Cabecera de Canjes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 8
        Top = 24
        Width = 36
        Height = 13
        Caption = 'Periodo'
      end
      object Label17: TLabel
        Left = 656
        Top = 192
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 579
        Top = 194
        Width = 50
        Height = 13
        Caption = 'Total Reg:'
      end
      object Label25: TLabel
        Left = 573
        Top = 16
        Width = 143
        Height = 13
        Caption = 'Actualiza Letra Inicial,Nro Reg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object wwDBGrid1: TwwDBGrid
        Left = 8
        Top = 65
        Width = 713
        Height = 120
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object edtAnomm: TEdit
        Left = 48
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object Button8: TButton
        Left = 208
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Filtrar'
        TabOrder = 2
        OnClick = Button8Click
      end
      object Panel2: TPanel
        Left = 378
        Top = 5
        Width = 185
        Height = 56
        TabOrder = 3
        object Label19: TLabel
          Left = 16
          Top = 8
          Width = 60
          Height = 13
          Caption = 'Actualizados'
        end
        object Label20: TLabel
          Left = 16
          Top = 24
          Width = 77
          Height = 13
          Caption = 'No Actualizados'
        end
        object Label21: TLabel
          Left = 107
          Top = 10
          Width = 3
          Height = 13
        end
        object Label22: TLabel
          Left = 105
          Top = 24
          Width = 3
          Height = 13
        end
        object Label23: TLabel
          Left = 16
          Top = 38
          Width = 77
          Height = 13
          Caption = 'No Encontrados'
        end
        object Label24: TLabel
          Left = 108
          Top = 39
          Width = 3
          Height = 13
        end
      end
      object ProgressBar1: TProgressBar
        Left = 14
        Top = 230
        Width = 707
        Height = 16
        Cursor = crArrow
        BorderWidth = 2
        TabOrder = 4
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'TabSheet5'
      ImageIndex = 4
      object Label26: TLabel
        Left = 160
        Top = 32
        Width = 15
        Height = 13
        Caption = 'Cia'
      end
      object edtcompania: TEdit
        Left = 200
        Top = 24
        Width = 57
        Height = 21
        TabOrder = 0
      end
      object Button9: TButton
        Left = 128
        Top = 72
        Width = 105
        Height = 25
        Caption = 'Actualiza Cpnoreg'
        TabOrder = 1
        OnClick = Button9Click
      end
      object dbgn1: TwwDBGrid
        Left = 32
        Top = 120
        Width = 320
        Height = 120
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object Button10: TButton
        Left = 24
        Top = 72
        Width = 105
        Height = 25
        Caption = 'Actualiza Flagvar'
        TabOrder = 3
        OnClick = Button10Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'TabSheet6'
      ImageIndex = 5
      object GroupBox1: TGroupBox
        Left = 32
        Top = 112
        Width = 361
        Height = 177
        Caption = 'Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Button11: TButton
          Left = 224
          Top = 72
          Width = 121
          Height = 33
          Caption = 'Eliminacion de  Prov.'
          TabOrder = 2
          OnClick = Button11Click
        end
        object gbAntiguo: TGroupBox
          Left = 16
          Top = 24
          Width = 162
          Height = 66
          Caption = 'Antiguo'
          TabOrder = 0
          object Label27: TLabel
            Left = 20
            Top = 19
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
          object Label30: TLabel
            Left = 68
            Top = 19
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
          object dblcAntClAux: TwwDBLookupCombo
            Left = 14
            Top = 36
            Width = 49
            Height = 23
            CharCase = ecUpperCase
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CLAUXID'#9'2'#9'Id.'#9'F'
              'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
            LookupTable = DMCXP.cdsClAux
            LookupField = 'CLAUXID'
            Options = [loColLines, loRowLines, loTitles]
            DropDownCount = 15
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcAntClAuxExit
          end
          object dblcdAntProv: TwwDBLookupComboDlg
            Left = 63
            Top = 36
            Width = 90
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
            LookupTable = DMCXP.cdsProv
            LookupField = 'PROV'
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            MaxLength = 10
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object gbnuevo: TGroupBox
          Left = 16
          Top = 96
          Width = 162
          Height = 67
          Caption = 'Nuevo'
          TabOrder = 1
          object Label29: TLabel
            Left = 9
            Top = 15
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
          object Label28: TLabel
            Left = 61
            Top = 15
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
          object dblcNueClAux: TwwDBLookupCombo
            Left = 10
            Top = 34
            Width = 49
            Height = 23
            CharCase = ecUpperCase
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CLAUXID'#9'2'#9'Id.'#9'F'
              'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
            LookupTable = DMCXP.cdsClAux
            LookupField = 'CLAUXID'
            Options = [loColLines, loRowLines, loTitles]
            DropDownCount = 15
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            SearchDelay = 2
            PreciseEditRegion = False
            AllowClearKey = False
          end
          object dblcdNueProv: TwwDBLookupComboDlg
            Left = 61
            Top = 34
            Width = 90
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
            LookupTable = DMCXP.cdsProv
            LookupField = 'PROV'
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            MaxLength = 10
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object edtAntRuc: TEdit
          Left = 192
          Top = 36
          Width = 121
          Height = 23
          TabOrder = 3
        end
        object edtNueRuc: TEdit
          Left = 184
          Top = 122
          Width = 121
          Height = 23
          TabOrder = 4
        end
      end
      object CheckBox1: TCheckBox
        Left = 328
        Top = 96
        Width = 69
        Height = 17
        Caption = 'Insertar'
        TabOrder = 1
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'TabSheet7'
      ImageIndex = 6
      object Label31: TLabel
        Left = 16
        Top = 40
        Width = 55
        Height = 13
        Caption = 'Cabecera'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label32: TLabel
        Left = 19
        Top = 158
        Width = 66
        Height = 13
        Caption = 'Docs Canje'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 24
        Top = 272
        Width = 36
        Height = 13
        Caption = 'Letras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCont: TLabel
        Left = 584
        Top = 88
        Width = 40
        Height = 13
        Caption = 'lblCont'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label35: TLabel
        Left = 592
        Top = 208
        Width = 38
        Height = 13
        Caption = 'Label35'
      end
      object Label36: TLabel
        Left = 584
        Top = 320
        Width = 38
        Height = 13
        Caption = 'Label36'
      end
      object Label37: TLabel
        Left = 22
        Top = 376
        Width = 121
        Height = 13
        Caption = 'Detalle de Retencion'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button12: TButton
        Left = 64
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Filtra CXP308'
        TabOrder = 0
        OnClick = Button12Click
      end
      object dbgCCanje: TwwDBGrid
        Left = 16
        Top = 56
        Width = 561
        Height = 89
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object dbgCanje: TwwDBGrid
        Left = 16
        Top = 173
        Width = 561
        Height = 89
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object dbgLetras: TwwDBGrid
        Left = 16
        Top = 285
        Width = 561
        Height = 89
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 3
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object wwDBGrid2: TwwDBGrid
        Left = 17
        Top = 392
        Width = 560
        Height = 78
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 4
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object edtCje: TEdit
        Left = 160
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 5
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'TabSheet8'
      ImageIndex = 7
      object Button13: TButton
        Left = 648
        Top = 0
        Width = 75
        Height = 25
        Caption = 'Actualiza Nreg CN320'
        TabOrder = 0
        OnClick = Button13Click
      end
      object Button14: TButton
        Left = 48
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Filtra CAJA304'
        TabOrder = 1
        OnClick = Button14Click
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 56
        Width = 649
        Height = 120
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object PB2: TProgressBar
        Left = 14
        Top = 230
        Width = 707
        Height = 16
        Cursor = crArrow
        BorderWidth = 2
        TabOrder = 3
      end
      object BitBtn1: TBitBtn
        Left = 272
        Top = 24
        Width = 201
        Height = 25
        Caption = 'Actualiza NroCheque en CAJA304'
        TabOrder = 4
        OnClick = BitBtn1Click
      end
      object edtPeriodo2: TEdit
        Left = 128
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object Button15: TButton
        Left = 32
        Top = 192
        Width = 89
        Height = 25
        Caption = 'Actualiza CNT301'
        TabOrder = 6
        OnClick = Button15Click
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'TabSheet9'
      ImageIndex = 8
      object Label34: TLabel
        Left = 24
        Top = 144
        Width = 37
        Height = 13
        Caption = 'CxP304'
      end
      object Label38: TLabel
        Left = 16
        Top = 296
        Width = 37
        Height = 13
        Caption = 'CxP305'
      end
      object Button16: TButton
        Left = 24
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Filtra CxP308'
        TabOrder = 0
        OnClick = Button16Click
      end
      object DBGrid2: TDBGrid
        Left = 16
        Top = 56
        Width = 553
        Height = 81
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBGrid3: TDBGrid
        Left = 16
        Top = 160
        Width = 545
        Height = 120
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBGrid4: TDBGrid
        Left = 16
        Top = 312
        Width = 545
        Height = 89
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
end
