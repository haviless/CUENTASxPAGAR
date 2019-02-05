object FSelCCosto: TFSelCCosto
  Left = 445
  Top = 100
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Seleccione Centro de Costos'
  ClientHeight = 553
  ClientWidth = 522
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Bevel1: TBevel
    Left = 6
    Top = 512
    Width = 509
    Height = 40
    Shape = bsFrame
  end
  object pnlPendientes: TPanel
    Left = 6
    Top = 1
    Width = 509
    Height = 248
    BevelInner = bvRaised
    BorderStyle = bsSingle
    Caption = 'pnlPendientes'
    TabOrder = 0
    object Label16: TLabel
      Left = 2
      Top = 2
      Width = 501
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Centros de Costos'
      Color = clActiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object dbgPendientes: TwwDBGrid
      Left = 2
      Top = 18
      Width = 501
      Height = 224
      DisableThemesInTitle = False
      Selected.Strings = (
        'CCOSID'#9'15'#9'Centro de Costo'
        'CCOSDES'#9'40'#9'Descripci'#243'n'
        'CCOSABR'#9'20'#9'Abr.')
      MemoAttributes = [mSizeable, mWordWrap, mGridShow]
      IniAttributes.Delimiter = ';;'
      TitleColor = 11974251
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = clInfoBk
      DataSource = dsDocsCont
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = [dgEnterToTab]
      MultiSelectOptions = [msoShiftSelect]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -12
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = True
      UseTFields = False
      OnTitleButtonClick = dbgPendientesTitleButtonClick
      OnDragOver = dbgPendientesDragOver
      OnEndDrag = dbgPendientesEndDrag
      OnMouseDown = dbgPendientesMouseDown
    end
    object pnlBusca: TPanel
      Left = 96
      Top = 88
      Width = 281
      Height = 41
      Color = 10207162
      TabOrder = 1
      Visible = False
      object lblBusca: TLabel
        Left = 12
        Top = 13
        Width = 146
        Height = 15
        Caption = 'Nombre de Clase de Auxiliar'
      end
      object isBusca: TwwIncrementalSearch
        Left = 160
        Top = 8
        Width = 105
        Height = 23
        DataSource = dsDocsCont
        TabOrder = 0
        OnKeyPress = isBuscaKeyPress
      end
    end
  end
  object pnlDocCanje: TPanel
    Left = 6
    Top = 253
    Width = 509
    Height = 257
    BevelInner = bvRaised
    BorderStyle = bsSingle
    Caption = 'pnlDocCanje'
    TabOrder = 1
    object Label17: TLabel
      Left = 2
      Top = 2
      Width = 501
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Seleccionados'
      Color = clActiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object dbgDocCanje: TwwDBGrid
      Left = 2
      Top = 18
      Width = 501
      Height = 233
      DisableThemesInTitle = False
      Selected.Strings = (
        'CCOSID'#9'15'#9'Centro de Costo'
        'CCOSDES'#9'40'#9'Descripci'#243'n'
        'CCOSABR'#9'20'#9'Abr.')
      IniAttributes.Delimiter = ';;'
      TitleColor = 11974251
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsDocContClone
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = []
      MultiSelectOptions = [msoShiftSelect]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -12
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      OnDragOver = dbgDocCanjeDragOver
      OnEndDrag = dbgDocCanjeEndDrag
      OnMouseDown = dbgDocCanjeMouseDown
    end
  end
  object bbtnOk: TBitBtn
    Left = 446
    Top = 518
    Width = 30
    Height = 30
    TabOrder = 2
    OnClick = bbtnOkClick
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
    Left = 481
    Top = 518
    Width = 30
    Height = 30
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object cds: TwwClientDataSet
    Aggregates = <>
    Filter = 'FLAG='#39'N'#39
    Filtered = True
    Params = <>
    ProviderName = 'prvDocsCont'
    ValidateWithMask = True
    Left = 114
    Top = 17
  end
  object dsDocsCont: TwwDataSource
    DataSet = cds
    Left = 148
    Top = 20
  end
  object cdsClone: TwwClientDataSet
    Aggregates = <>
    Filter = 'FLAG='#39'S'#39
    Filtered = True
    Params = <>
    ValidateWithMask = True
    Left = 114
    Top = 47
  end
  object dsDocContClone: TwwDataSource
    DataSet = cdsClone
    Left = 148
    Top = 50
  end
end
