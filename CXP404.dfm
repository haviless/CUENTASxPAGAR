object CFRepMov: TCFRepMov
  Left = 293
  Top = 188
  BorderStyle = bsSingle
  Caption = 'Reporte Movimientos'
  ClientHeight = 484
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 199
    Top = 106
    Width = 180
    Height = 38
    Shape = bsFrame
    Visible = False
  end
  object Bevel5: TBevel
    Left = 8
    Top = 108
    Width = 181
    Height = 36
    Shape = bsFrame
  end
  object Label3: TLabel
    Left = 18
    Top = 100
    Width = 52
    Height = 13
    Caption = 'Por Estado'
  end
  object Label4: TLabel
    Left = 207
    Top = 98
    Width = 65
    Height = 13
    Caption = 'Ordenado por'
    Visible = False
  end
  object Label1: TLabel
    Left = 12
    Top = 2
    Width = 47
    Height = 13
    Caption = 'Compa'#241'ia'
  end
  object pnlComando: TPanel
    Left = 0
    Top = 448
    Width = 386
    Height = 36
    TabOrder = 1
    object Z2bbtnImprimir: TBitBtn
      Left = 158
      Top = 3
      Width = 90
      Height = 30
      Caption = 'Detalle'
      TabOrder = 0
      OnClick = bbtnImprimirClick
      Glyph.Data = {
        BE080000424DBE0800000000000036000000280000001B0000001A0000000100
        18000000000088080000CE0E0000D80E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C080
        8080000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000808080C0C0
        C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C000000080808080800080808080
        8000808080808000808080808000808080808000808080808000808080808000
        808080808000808080808080808000000000C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000C0C0C0C0C0C0000000C0C0C0C0C0C00000008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000000000C0C0C0
        C0C0C0000000C0C0C0C0C0C00000008080008080000000000000008080000000
        0000000080800000000000000080800080800080800080800000000000000000
        0000000000000000000000808000000000C0C0C0C0C0C0000000C0C0C0C0C0C0
        0000008080008080000000000000008080000000000000008080000000000000
        0080800080800080800080800000000000000000000000000000000000000080
        8000000000C0C0C0C0C0C0000000C0C0C0C0C0C0000000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        00808000808000808000808000808000808000808000000000C0C0C0C0C0C000
        0000C0C0C0C0C0C0000000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        00808000808000808000000000C0C0C0C0C0C0000000C0C0C0C0C0C0000000C0
        C0C0C0C0C0FFFFFFFFFFFFC0C0C0FFFFFFC0C0C0FFFFFFC0C0C0FFFFFFFFFFFF
        C0C0C0FFFFFFC0C0C0FFFFFFC0C0C0FFFFFFFFFFFFC0C0C0FFFFFFC0C0C00000
        00C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C0C0C0C0C0C0C0000000808000808000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808000808000
        000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C00000
        00000000000000000000FFFFFF00000000000080808080808000000080808000
        0000808080000000FFFFFF000000000000000000000000C0C0C0C0C0C0C0C0C0
        C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF0000000000008080800000
        00808080000000000000C0C0C0000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF000000
        808080000000000000808080000000FFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000FFFFFF000000000000808080808080000000000000FFFFFF000000000000
        000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
        00000000000000000000000000000000000000000000000000C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000}
    end
    object Z2bbtnSalir: TBitBtn
      Left = 287
      Top = 3
      Width = 90
      Height = 30
      TabOrder = 1
      OnClick = Z2bbtnSalirClick
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
    object bbtnResumen: TBitBtn
      Left = 13
      Top = 3
      Width = 90
      Height = 30
      Caption = 'Resumen'
      TabOrder = 2
      OnClick = bbtnResumenClick
      Glyph.Data = {
        BE080000424DBE0800000000000036000000280000001B0000001A0000000100
        18000000000088080000CE0E0000D80E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C080
        8080000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000808080C0C0
        C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C000000080808080800080808080
        8000808080808000808080808000808080808000808080808000808080808000
        808080808000808080808080808000000000C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000C0C0C0C0C0C0000000C0C0C0C0C0C00000008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000000000C0C0C0
        C0C0C0000000C0C0C0C0C0C00000008080008080000000000000008080000000
        0000000080800000000000000080800080800080800080800000000000000000
        0000000000000000000000808000000000C0C0C0C0C0C0000000C0C0C0C0C0C0
        0000008080008080000000000000008080000000000000008080000000000000
        0080800080800080800080800000000000000000000000000000000000000080
        8000000000C0C0C0C0C0C0000000C0C0C0C0C0C0000000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        00808000808000808000808000808000808000808000000000C0C0C0C0C0C000
        0000C0C0C0C0C0C0000000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        00808000808000808000000000C0C0C0C0C0C0000000C0C0C0C0C0C0000000C0
        C0C0C0C0C0FFFFFFFFFFFFC0C0C0FFFFFFC0C0C0FFFFFFC0C0C0FFFFFFFFFFFF
        C0C0C0FFFFFFC0C0C0FFFFFFC0C0C0FFFFFFFFFFFFC0C0C0FFFFFFC0C0C00000
        00C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C0C0C0C0C0C0C0000000808000808000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808000808000
        000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C00000
        00000000000000000000FFFFFF00000000000080808080808000000080808000
        0000808080000000FFFFFF000000000000000000000000C0C0C0C0C0C0C0C0C0
        C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF0000000000008080800000
        00808080000000000000C0C0C0000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF000000
        808080000000000000808080000000FFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000FFFFFF000000000000808080808080000000000000FFFFFF000000000000
        000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
        00000000000000000000000000000000000000000000000000C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000}
    end
  end
  object gbRango: TGroupBox
    Left = 8
    Top = 149
    Width = 371
    Height = 296
    Caption = 'Proveedores'
    TabOrder = 0
    object lvTipoProv: TListView
      Left = 96
      Top = 81
      Width = 71
      Height = 59
      Checkboxes = True
      Columns = <
        item
          Caption = 'C'#243'digo'
          Width = 74
        end
        item
          Caption = 'Descripci'#243'n'
          Width = 217
        end>
      Enabled = False
      GridLines = True
      MultiSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object rbProvTodos: TRadioButton
      Left = 9
      Top = 18
      Width = 59
      Height = 15
      Caption = 'Todos'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbProvTodosClick
    end
    object rbProvEscoger: TRadioButton
      Left = 9
      Top = 33
      Width = 57
      Height = 19
      Caption = 'Escoger :'
      TabOrder = 2
      OnClick = rbProvEscogerClick
    end
    object dbgProv: TwwDBGrid
      Left = -1
      Top = 55
      Width = 360
      Height = 234
      DisableThemesInTitle = False
      Selected.Strings = (
        'ACTXOC'#9'2'#9'.'
        'PROV'#9'7'#9'C'#243'digo'
        'PROVRUC'#9'12'#9'R.U.C.'
        'PROVDES'#9'31'#9'Proveedor'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = 15792632
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = [dgEnterToTab]
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 3
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = True
      OnTitleButtonClick = dbgProvTitleButtonClick
      OnEnter = dbgProvEnter
    end
  end
  object cboEstado: TComboBox
    Left = 20
    Top = 117
    Width = 159
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      'Todos'
      'Inicial'
      'Anulados'
      'Aceptados'
      'Contabilizados'
      'Eliminados')
  end
  object cboOrdenar: TComboBox
    Left = 211
    Top = 116
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    Visible = False
    OnExit = cboOrdenarExit
    Items.Strings = (
      'Documento'
      'Proveedor')
  end
  object dblcCia: TwwDBLookupCombo
    Left = 12
    Top = 17
    Width = 51
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'Cia'#9'F'
      'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
    LookupField = 'CIAID'
    Options = [loColLines, loRowLines, loTitles]
    DropDownCount = 15
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
    OnExit = dblcCiaExit
    OnNotInList = dblcCiaNotInList
  end
  object edtCia: TEdit
    Left = 68
    Top = 16
    Width = 305
    Height = 20
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object pnlOrden: TPanel
    Left = 76
    Top = 166
    Width = 223
    Height = 70
    BevelInner = bvRaised
    BevelWidth = 2
    Color = 10207162
    TabOrder = 6
    Visible = False
    object lblBusca: TLabel
      Left = 16
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel2: TBevel
      Left = 10
      Top = 30
      Width = 204
      Height = 2
    end
    object isBusca: TwwIncrementalSearch
      Left = 18
      Top = 39
      Width = 191
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object btnSalir: TBitBtn
      Left = 201
      Top = 5
      Width = 17
      Height = 15
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalirClick
      Glyph.Data = {
        7A010000424D7A0100000000000036000000280000000C000000090000000100
        18000000000044010000C40E0000C40E00000000000000000000C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3
        C6C6C3C6000000000000C6C3C6C6C3C6C6C3C6C6C3C6000000000000C6C3C6C6
        C3C6C6C3C6C6C3C6C6C3C6000000000000C6C3C6C6C3C6000000000000C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000000000000000000000C6C3
        C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000000000C6
        C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000000000
        000000000000C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C60000000000
        00C6C3C6C6C3C6000000000000C6C3C6C6C3C6C6C3C6C6C3C6C6C3C600000000
        0000C6C3C6C6C3C6C6C3C6C6C3C6000000000000C6C3C6C6C3C6C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6}
    end
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 42
    Width = 370
    Height = 52
    Caption = 'Fecha de Emision'
    TabOrder = 7
    object Label2: TLabel
      Left = 71
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object Label5: TLabel
      Left = 225
      Top = 24
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object dtpDesde: TwwDBDateTimePicker
      Left = 107
      Top = 21
      Width = 90
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
    object dtpHasta: TwwDBDateTimePicker
      Left = 258
      Top = 21
      Width = 90
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
    object rbFETodos: TRadioButton
      Left = 10
      Top = 16
      Width = 45
      Height = 15
      Caption = 'Todo'
      TabOrder = 2
      Visible = False
      OnClick = rbProvTodosClick
    end
    object rbFEEscoger: TRadioButton
      Left = 10
      Top = 30
      Width = 57
      Height = 19
      Caption = 'Rango'
      Checked = True
      TabOrder = 3
      TabStop = True
      Visible = False
      OnClick = rbProvEscogerClick
    end
  end
  object ppdbRepMov: TppDBPipeline
    UserName = 'dbRepMov'
    Left = 40
    Top = 384
  end
  object ppRepMov: TppReport
    AutoStop = False
    DataPipeline = ppdbRepMov
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Reporte'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 5000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\OP\Dema\MovProveedor2.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 145
    Top = 388
    Version = '7.02'
    mmColumnWidth = 190000
    DataPipelineName = 'ppdbRepMov'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object pplblCia: TppLabel
        UserName = 'lblEmpresa1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'lblPagina3'
        Caption = 'PAGINA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 149225
        mmTop = 529
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'FECHA  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 149225
        mmTop = 4763
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'HORA   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 149225
        mmTop = 8996
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'svPagina1'
        VarType = vtPageNo
        DisplayFormat = '000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170127
        mmTop = 265
        mmWidth = 5556
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'svFecha1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170127
        mmTop = 4498
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'svHora1'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170127
        mmTop = 8731
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'lblSistema1'
        Caption = 'Cuentas por Pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 4233
        mmWidth = 31485
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'lblTitulo1'
        Caption = 'Movimiento de Documentos por Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 78052
        mmTop = 1588
        mmWidth = 51858
        BandType = 0
      end
      object pplblLin01: TppLabel
        UserName = 'lblLin01'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 265
        mmTop = 18256
        mmWidth = 203200
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 25929
        mmWidth = 203200
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 21960
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'N'#176'Registro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 39423
        mmTop = 21960
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Monto Ori.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 74348
        mmTop = 21960
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Saldo Ori'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 114300
        mmTop = 21960
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'F. Emi.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 154517
        mmTop = 21960
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'F.Vcmto.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170127
        mmTop = 21960
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 21960
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'F.Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 192352
        mmTop = 21960
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Mda.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 66675
        mmTop = 21960
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Est.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 58473
        mmTop = 21960
        mmWidth = 7408
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 0
        mmTop = 18521
        mmWidth = 204259
        BandType = 0
      end
      object pplblLin02: TppLine
        UserName = 'lblLin02'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 0
        mmTop = 26723
        mmWidth = 204259
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Monto Loc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 21960
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Saldo Loc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 133350
        mmTop = 21960
        mmWidth = 16669
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        AutoSize = False
        CalcOrder = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable1Calc
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 74083
        mmTop = 265
        mmWidth = 37571
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'CPNODOC'
        DataPipeline = ppdbRepMov
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 19315
        mmTop = 265
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'CPNOREG'
        DataPipeline = ppdbRepMov
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 39952
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'CPMTOORI'
        DataPipeline = ppdbRepMov
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 74877
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'CPSALORI'
        DataPipeline = ppdbRepMov
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'CPFEMIS'
        DataPipeline = ppdbRepMov
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'CPFVCMTO'
        DataPipeline = ppdbRepMov
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'FPAGO'
        DataPipeline = ppdbRepMov
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 186796
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText102'
        DataField = 'TMONABR'
        DataPipeline = ppdbRepMov
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 265
        mmWidth = 6615
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'CPESTADO'
        DataPipeline = ppdbRepMov
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 61383
        mmTop = 265
        mmWidth = 4498
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'CPMTOLOC'
        DataPipeline = ppdbRepMov
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 93663
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'CPSALLOC'
        DataPipeline = ppdbRepMov
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 132027
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object lblLin03: TppLabel
        UserName = 'lblLin03'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 203465
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'CPSALLOC'
        DataPipeline = ppdbRepMov
        DisplayFormat = '###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 3704
        mmWidth = 17992
        BandType = 7
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 80963
        mmTop = 3704
        mmWidth = 5556
        BandType = 7
      end
      object ppLabel35: TppLabel
        UserName = 'Label101'
        Caption = '$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 80963
        mmTop = 8996
        mmWidth = 1852
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'CPMTOLOC'
        DataPipeline = ppdbRepMov
        DisplayFormat = '###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 93398
        mmTop = 3704
        mmWidth = 17992
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'CPMTOEXT'
        DataPipeline = ppdbRepMov
        DisplayFormat = '###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 93398
        mmTop = 8996
        mmWidth = 17992
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'CPSALEXT'
        DataPipeline = ppdbRepMov
        DisplayFormat = '###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepMov'
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 8996
        mmWidth = 17992
        BandType = 7
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 0
        mmTop = 0
        mmWidth = 204259
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PROV'
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppDBText24: TppDBText
          UserName = 'DBText24'
          DataField = 'PROV'
          DataPipeline = ppdbRepMov
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 1058
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          AutoSize = True
          DataField = 'AUXNOMB'
          DataPipeline = ppdbRepMov
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 16933
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel38: TppLabel
          UserName = 'Label38'
          Caption = 'Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 35983
          mmTop = 529
          mmWidth = 9260
          BandType = 5
          GroupNo = 0
        end
        object ppDBText33: TppDBText
          UserName = 'DBText201'
          DataField = 'AUXNOMB'
          DataPipeline = ppdbRepMov
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 46038
          mmTop = 529
          mmWidth = 27517
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'CPMTOORI'
          DataPipeline = ppdbRepMov
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 75671
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc102'
          DataField = 'CPMTOLOC'
          DataPipeline = ppdbRepMov
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 94456
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'CPSALORI'
          DataPipeline = ppdbRepMov
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 113771
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'CPSALLOC'
          DataPipeline = ppdbRepMov
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 132821
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DOCID'
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBText25: TppDBText
          UserName = 'DBText25'
          DataField = 'DOCID'
          DataPipeline = ppdbRepMov
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 16140
          mmTop = 529
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'DOCABR'
          DataPipeline = ppdbRepMov
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 22754
          mmTop = 529
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppLabel37: TppLabel
          UserName = 'Label37'
          Caption = 'Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 44186
          mmTop = 529
          mmWidth = 9260
          BandType = 5
          GroupNo = 1
        end
        object ppDBText28: TppDBText
          UserName = 'DBText28'
          DataField = 'DOCABR'
          DataPipeline = ppdbRepMov
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 54769
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'CPMTOORI'
          DataPipeline = ppdbRepMov
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 75671
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'CPMTOLOC'
          DataPipeline = ppdbRepMov
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 94456
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'CPSALORI'
          DataPipeline = ppdbRepMov
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 113771
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'CPSALLOC'
          DataPipeline = ppdbRepMov
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbRepMov'
          mmHeight = 3704
          mmLeft = 132821
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
