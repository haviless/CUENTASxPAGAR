object FTipoReg: TFTipoReg
  Left = 387
  Top = 223
  Width = 419
  Height = 317
  BorderIcons = [biSystemMenu]
  Caption = 'Tipo de Registro'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblTipReg: TLabel
    Left = 18
    Top = 37
    Width = 122
    Height = 15
    Caption = 'Tipo de Registro Nuevo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 18
    Top = 10
    Width = 123
    Height = 15
    Caption = 'Tipo de Registro Actual'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bbtnRegOk: TBitBtn
    Left = 284
    Top = 239
    Width = 30
    Height = 25
    Hint = 'Confirma Actualizaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
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
    Left = 321
    Top = 239
    Width = 30
    Height = 25
    Hint = 'Cancela Actualizaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
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
  object dblcTipReg: TwwDBLookupCombo
    Left = 156
    Top = 32
    Width = 46
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
    TabOrder = 2
    AutoDropDown = True
    ShowButton = True
    SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnEnter = dblcTipRegEnter
    OnExit = dblcTipRegExit
    OnNotInList = dblcTipRegNotInList
  end
  object edtTipReg: TEdit
    Left = 204
    Top = 32
    Width = 134
    Height = 23
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 29
    Top = 70
    Width = 353
    Height = 147
    Color = 14869218
    UseDockManager = False
    Enabled = False
    TabOrder = 4
    object lblCnpEgr: TLabel
      Left = 10
      Top = 18
      Width = 53
      Height = 15
      Caption = 'Concepto:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblGlosa: TLabel
      Left = 10
      Top = 50
      Width = 30
      Height = 15
      Caption = 'Glosa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCCosto: TLabel
      Left = 10
      Top = 82
      Width = 85
      Height = 15
      Caption = 'Centro de Costo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDH: TLabel
      Left = 10
      Top = 114
      Width = 78
      Height = 15
      Caption = '[D]ebe/[H]aber'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblImporte: TLabel
      Left = 151
      Top = 114
      Width = 48
      Height = 15
      Caption = 'Importe :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblcdCnpEgr: TwwDBLookupComboDlg
      Left = 112
      Top = 13
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
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbeGlosa: TwwDBEdit
      Left = 112
      Top = 45
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
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdCCosto: TwwDBLookupComboDlg
      Left = 112
      Top = 77
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
      MaxLength = 12
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
    end
    object dbeDH: TwwDBEdit
      Left = 112
      Top = 109
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
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeImporte: TwwDBEdit
      Left = 204
      Top = 109
      Width = 95
      Height = 23
      DataField = 'DCPMOORI'
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
  end
  object cbProrratea: TCheckBox
    Left = 40
    Top = 240
    Width = 169
    Height = 17
    Caption = #191' Prorratear con IGV?'
    TabOrder = 5
  end
  object edtTRegDesAct: TEdit
    Left = 204
    Top = 5
    Width = 134
    Height = 23
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edtTRegIdAct: TEdit
    Left = 156
    Top = 5
    Width = 45
    Height = 23
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
end
