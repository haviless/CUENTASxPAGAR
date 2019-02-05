object FNuevoProv: TFNuevoProv
  Left = 550
  Top = 219
  Width = 358
  Height = 240
  Caption = 'Recodificaci'#243'n de Proveedor'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 11
    Top = 4
    Width = 334
    Height = 161
    Caption = 'Proveedor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object gbAntiguo: TGroupBox
      Left = 16
      Top = 16
      Width = 289
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
        OnExit = dblcdAntProvExit
      end
      object edtAntRuc: TEdit
        Left = 160
        Top = 36
        Width = 121
        Height = 23
        TabOrder = 2
      end
    end
    object gbnuevo: TGroupBox
      Left = 16
      Top = 88
      Width = 289
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
        Left = 14
        Top = 34
        Width = 49
        Height = 23
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CLAUXID'#9'2'#9'Id.'#9'F'
          'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
        LookupTable = DMCXP.cdsCLAux1
        LookupField = 'CLAUXID'
        Options = [loColLines, loRowLines, loTitles]
        DropDownCount = 15
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcNueClAuxExit
      end
      object edtNueRuc: TEdit
        Left = 160
        Top = 34
        Width = 121
        Height = 23
        TabOrder = 2
      end
      object edtNueProv: TEdit
        Left = 63
        Top = 34
        Width = 87
        Height = 23
        TabOrder = 1
      end
    end
  end
  object Button11: TButton
    Left = 116
    Top = 170
    Width = 121
    Height = 33
    Hint = 'Cambia el Codigo de Proveedor en todas las tablas que se usa'
    Caption = 'Recodificar Proveedor'
    TabOrder = 1
    OnClick = Button11Click
  end
  object CheckBox1: TCheckBox
    Left = 11
    Top = 176
    Width = 93
    Height = 17
    Caption = 'Insertar Nuevo'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object Button1: TButton
    Left = 256
    Top = 170
    Width = 84
    Height = 32
    Caption = 'Otra Recodific'
    TabOrder = 3
    OnClick = Button1Click
  end
end
