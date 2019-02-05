object FToolCtaCteProv: TFToolCtaCteProv
  Left = 89
  Top = 504
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cta. Cte. Proveedores'
  ClientHeight = 81
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 81
    Align = alClient
    BevelInner = bvRaised
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label11: TLabel
      Left = 15
      Top = 6
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
      Top = 23
      Width = 46
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
      OnNotInList = dblcCiaNotInList
    end
    object dbeCIA: TwwDBEdit
      Left = 62
      Top = 23
      Width = 311
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
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
      Left = 611
      Top = 19
      Width = 39
      Height = 41
      Hint = 'Filtrar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
    object BitBtn1: TBitBtn
      Left = 665
      Top = 19
      Width = 39
      Height = 41
      Hint = 'Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Visible = False
      Glyph.Data = {
        CE020000424DCE020000000000007600000028000000220000001E0000000100
        04000000000058020000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFF0078800FFFFFFFFFFFFFFFF000000FFFFFFFFF00777888800
        FFFFFFFFFFFFFF000000FFFFFFF007777800888800FFFFFFFFFFFF000000FFFF
        F0077778878800888800FFFFFFFFFF000000FFF00777788787888800888800FF
        FFFFFF000000FF07777887778788888800888800FFFFFF000000FF8778877777
        87888888880088880FFFFF000000FF888777777787888888888800880FFFFF00
        0000F8878777777787888888888888000FFFFF000000F8F7877777778F888888
        8888888800FFFF000000F8F78777777F8877888888888888800FFF000000F8F7
        87777FF777887788888888888080FF000000F8F7877FF7777777887788888888
        80780F000000F8F78FF77799778877887788888880788F000000F8FF8877AA77
        8877777088778888808FFF000000F88F778877887777700F7088778880FFFF00
        0000FFF88F77888877700FFFF077887780FFFF000000FFFFF88F7788800FFFCC
        F7087788FFFFFF000000FFFFFFF88F7788FFCCFFFF0888FFFFFFFF000000FFFF
        FFFFF88F778FFFFCCF70FFFFFFFFFF000000FFFFFFFFFFF88F8FFCCFFFF70FFF
        FFFFFF000000FFFFFFFFFFFFF888FFFFCCFF70FFFFFFFF000000FFFFFFFFFFFF
        FFF8FFCCFFFFF70FFFFFFF000000FFFFFFFFFFFFFFFF8FFFFFCCFF700FFFFF00
        0000FFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFF000000FFFFFFFFFFFFFFFFFF8F
        FFFFF88FFFFFFF000000FFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFF888FFFFFFFFFFF000000}
    end
    object gbPER: TGroupBox
      Left = 383
      Top = 5
      Width = 209
      Height = 69
      Caption = 'Periodo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label1: TLabel
        Left = 7
        Top = 13
        Width = 68
        Height = 15
        Caption = 'Fecha Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 114
        Top = 12
        Width = 58
        Height = 15
        Caption = 'Fecha Final'
      end
      object Label3: TLabel
        Left = 98
        Top = 31
        Width = 9
        Height = 15
        Caption = 'al'
      end
      object dtpINI: TwwDBDateTimePicker
        Left = 7
        Top = 27
        Width = 87
        Height = 23
        TabStop = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'Draft 12cpi'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
      end
      object chbFecha: TCheckBox
        Left = 9
        Top = 51
        Width = 77
        Height = 16
        Caption = 'Todos'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 2
        OnClick = chbFechaClick
      end
      object dtpFIN: TwwDBDateTimePicker
        Left = 114
        Top = 27
        Width = 87
        Height = 23
        TabStop = False
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
  object Timer1: TTimer
    Left = 792
    Top = 96
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 720
    Top = 32
  end
end
