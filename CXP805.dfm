object FToolVista: TFToolVista
  Left = 249
  Top = 109
  Width = 769
  Height = 116
  Caption = 'FToolVista'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 89
    Align = alClient
    BevelInner = bvRaised
    Color = 14869218
    TabOrder = 0
    object Label11: TLabel
      Left = 15
      Top = 15
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcCia: TwwDBLookupCombo
      Left = 14
      Top = 32
      Width = 46
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
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
      Style = csDropDownList
      DropDownCount = 15
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object dbeCIA: TwwDBEdit
      Left = 62
      Top = 32
      Width = 180
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = ANSI_CHARSET
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
    object bbtnEjecuta: TBitBtn
      Left = 699
      Top = 35
      Width = 39
      Height = 41
      Hint = 'Filtrar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnEjecutaClick
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
    object GroupBox1: TGroupBox
      Left = 256
      Top = 6
      Width = 185
      Height = 74
      Caption = 'Fecha Comprobante'
      TabOrder = 3
      object Label1: TLabel
        Left = 19
        Top = 21
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label2: TLabel
        Left = 20
        Top = 47
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object dtpFIni: TwwDBDateTimePicker
        Left = 65
        Top = 15
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
      end
      object dtpFFin: TwwDBDateTimePicker
        Left = 65
        Top = 43
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 1
      end
    end
    object rgEstado: TRadioGroup
      Left = 449
      Top = 7
      Width = 234
      Height = 74
      Caption = 'Estado'
      Columns = 2
      ItemIndex = 4
      Items.Strings = (
        'Todas'
        'Inicial'
        'Aceptadas'
        'Canceladas'
        'Saldo >0')
      TabOrder = 4
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 704
    Top = 4
  end
end
