object FTransfDAOT: TFTransfDAOT
  Left = 169
  Top = 155
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 
    'Transferencia al DAOT (Declaraci'#243'n Anual de Obligaciones con Ter' +
    'ceros)'
  ClientHeight = 493
  ClientWidth = 806
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 6
    Top = 3
    Width = 796
    Height = 110
  end
  object lblCia: TLabel
    Left = 76
    Top = 7
    Width = 23
    Height = 13
    Caption = 'RUC'
  end
  object Label2: TLabel
    Left = 20
    Top = 7
    Width = 40
    Height = 13
    Caption = 'Ejercicio'
  end
  object Label3: TLabel
    Left = 371
    Top = 7
    Width = 23
    Height = 13
    Caption = 'UITs'
  end
  object Label4: TLabel
    Left = 411
    Top = 7
    Width = 45
    Height = 13
    Caption = 'Valor UIT'
  end
  object Label5: TLabel
    Left = 13
    Top = 419
    Width = 49
    Height = 13
    Caption = 'Proveedor'
  end
  object Label1: TLabel
    Left = 459
    Top = 95
    Width = 339
    Height = 13
    Caption = 
      'El DAOT considera las facturas por la fecha de EMISION del Prove' +
      'edor'
  end
  object Label6: TLabel
    Left = 350
    Top = 416
    Width = 15
    Height = 13
    Caption = 'Cia'
  end
  object Label7: TLabel
    Left = 386
    Top = 415
    Width = 20
    Height = 13
    Caption = 'Mes'
  end
  object sbDisenoRep: TSpeedButton
    Left = 3
    Top = 464
    Width = 8
    Height = 22
    Flat = True
    OnClick = sbDisenoRepClick
  end
  object BitBtn2: TBitBtn
    Left = 490
    Top = 466
    Width = 23
    Height = 23
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    Visible = False
  end
  object dblcRUC: TwwDBLookupCombo
    Left = 76
    Top = 22
    Width = 120
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIARUC'#9'15'#9'RUC'#9'F'
      'CIADES'#9'20'#9'Compa'#241#237'a'#9'F')
    LookupTable = DMCXP.cdsQry1
    LookupField = 'CIARUC'
    Options = [loColLines, loRowLines, loTitles]
    Style = csDropDownList
    TabOrder = 1
    AutoDropDown = True
    ShowButton = True
    SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
    UseTFields = False
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblcRUCExit
  end
  object edtCia: TEdit
    Left = 200
    Top = 22
    Width = 160
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 2
  end
  object bbtnBorra: TBitBtn
    Left = 767
    Top = 457
    Width = 32
    Height = 30
    Hint = 'Borrar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
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
  object bbtnGrabaTxt: TBitBtn
    Left = 633
    Top = 457
    Width = 32
    Height = 30
    Hint = 'Grabar Daot en Archivo Texto'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = bbtnGrabaTxtClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
  object edtNomArch: TEdit
    Left = 352
    Top = 465
    Width = 134
    Height = 21
    Color = 14869218
    Enabled = False
    TabOrder = 11
    Visible = False
  end
  object dbgObligaciones: TwwDBGrid
    Left = 6
    Top = 126
    Width = 795
    Height = 284
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    KeyOptions = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
    TabOrder = 12
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgObligacionesDblClick
    OnKeyDown = dbgObligacionesKeyDown
  end
  object bbtnImprime: TBitBtn
    Left = 550
    Top = 457
    Width = 32
    Height = 30
    Hint = 'Imprimir'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = bbtnImprimeClick
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
  object bbtnRecuperar: TBitBtn
    Left = 766
    Top = 11
    Width = 31
    Height = 31
    Hint = 'Abrir Archivo previamente Generado'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = bbtnRecuperarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555555555555555555555555555555555555555555555555555555555555
      555555555555555555555555555555555555555FFFFFFFFFF555550000000000
      55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
      B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
      000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
      555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
      55555575FFF75555555555700007555555555557777555555555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
  end
  object bbtnGrabaCds: TBitBtn
    Left = 591
    Top = 457
    Width = 32
    Height = 30
    Hint = 'Grabar Archivo'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = bbtnGrabaCdsClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    NumGlyphs = 2
  end
  object dbeUITs: TwwDBEdit
    Left = 369
    Top = 22
    Width = 28
    Height = 21
    TabOrder = 3
    UnboundDataType = wwDefault
    UnboundAlignment = taRightJustify
    WantReturns = False
    WordWrap = False
  end
  object dbeValorUIT: TwwDBEdit
    Left = 400
    Top = 22
    Width = 62
    Height = 21
    Enabled = False
    TabOrder = 4
    UnboundDataType = wwDefault
    UnboundAlignment = taRightJustify
    WantReturns = False
    WordWrap = False
  end
  object bbtnGenerar: TBitBtn
    Left = 728
    Top = 11
    Width = 31
    Height = 31
    Hint = 'Generar Informaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = bbtnGenerarClick
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
  end
  object bbtnDetalle: TBitBtn
    Left = 14
    Top = 459
    Width = 75
    Height = 29
    Caption = 'Detalle'
    TabOrder = 16
    OnClick = bbtnDetalleClick
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
  object bbtnDetalleRep: TBitBtn
    Left = 92
    Top = 459
    Width = 75
    Height = 29
    Caption = 'Detalle'
    Enabled = False
    TabOrder = 17
    OnClick = bbtnDetalleRepClick
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
  object dblcdProv: TwwDBLookupComboDlg
    Left = 12
    Top = 433
    Width = 117
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
      'PROVRUC'#9'15'#9'RUC'#9'F'
      'PROVDES'#9'40'#9'Raz'#243'n Social'#9'F'
      'PROVNOMCOM'#9'30'#9'Nombre Comercial'#9'F'
      'PROV'#9'15'#9'C'#243'digo'#9'F')
    LookupTable = DMCXP.cdsProv
    LookupField = 'PROVRUC'
    SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
    MaxLength = 11
    ParentFont = False
    TabOrder = 18
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
    OnEnter = dblcdProvEnter
    OnExit = dblcdProvExit
  end
  object edtProv: TEdit
    Left = 136
    Top = 433
    Width = 185
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
    TabOrder = 19
  end
  object rgTipoDiario: TRadioGroup
    Left = 16
    Top = 56
    Width = 438
    Height = 49
    Caption = 'Tipo de Diario'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Reg.Compras+4ta.Categor'#237'a'
      'Especificar')
    TabOrder = 6
    OnClick = rgTipoDiarioClick
  end
  object dblcTDiario: TwwDBLookupCombo
    Left = 315
    Top = 68
    Width = 45
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TDIARID'#9'2'#9'Id'#9'F'
      'TDIARDES'#9'40'#9'Tipo Diario'#9'F')
    LookupTable = DMCXP.cdsTDiario
    LookupField = 'TDIARID'
    Options = [loColLines, loRowLines, loTitles]
    Enabled = False
    TabOrder = 20
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcTDiarioExit
  end
  object edtTDiario: TEdit
    Left = 361
    Top = 68
    Width = 85
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 21
  end
  object dbeAno: TSpinEdit
    Left = 16
    Top = 22
    Width = 54
    Height = 22
    MaxValue = 2020
    MinValue = 1998
    TabOrder = 0
    Value = 1998
    OnExit = dbeAnoExit
    OnKeyPress = dbeAnoKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 671
    Top = 457
    Width = 75
    Height = 30
    Caption = 'Daot x C'#237'a'
    TabOrder = 22
    OnClick = BitBtn1Click
  end
  object GroupBox1: TGroupBox
    Left = 478
    Top = 7
    Width = 138
    Height = 86
    Caption = 'Se considera'
    TabOrder = 7
    object cbGravado: TCheckBox
      Left = 31
      Top = 16
      Width = 85
      Height = 17
      Caption = 'Gravado'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbGravado2: TCheckBox
      Left = 31
      Top = 31
      Width = 85
      Height = 17
      Caption = 'Gravado 2'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object cbNoGravado: TCheckBox
      Left = 31
      Top = 46
      Width = 85
      Height = 17
      Caption = 'No Gravado'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object cbAdqNoGra: TCheckBox
      Left = 31
      Top = 62
      Width = 85
      Height = 17
      Caption = 'Adq.No Grav'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object BitBtn4: TBitBtn
    Left = 172
    Top = 459
    Width = 75
    Height = 29
    Caption = 'Exportar'
    Enabled = False
    TabOrder = 23
    OnClick = BitBtn4Click
    Glyph.Data = {
      1E060000424D1E06000000000000360000002800000017000000150000000100
      180000000000E8050000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F8F9F8F8F8FEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F2F46A656D645E6AE7E5
      E8FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFD7B777F
      1110122D2A3196929DE7E5E9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE0DCE45F5C62100F101D1C1F4B4A4C76707DE1DFE3FFFFFFFEFFFEE1F9E3
      EDF9EDE7F9E8E9F9E9EAF9EBE6F9E7EDF9EDE5F9E6ECF9ECE7F9E7EBF9EBE7F9
      E7ECF9ECFAFDFAE6E5E7ABA7AFC9C2CD605D6277717DEFEEF095919C5B5762FF
      FFFFF8FDF96AD86D8BD88C7BD87C7FD88084D88579D87B8DD88D73D8758AD88A
      7AD87A85D8847AD87A8AD88AD8F0D9817F848B858EE9E8EADDD9E0D3CFD8F9F9
      FAFFFFFF111111FFFFFFF4FCF633B92F4CC04A62CB6160CB5F5DCB5D64CB635A
      CB5967CB665CCB5B63CB625DCB5C47C44532BB2FB0E4B1595A5AB7B7B7FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF111111FFFFFFF2FCF638BA3580D580DFF9E1DCF9
      DFD8F9DBE1F9E2D4F9D6D6F2D8A4E7A7A1E7A4A2E7A578D67741BF3EB1E4B159
      5A59B7B7B7FFFFFFE2E0E3DAD8DCFAFAFBBEBDC0454347FFFFFFF1FCF43DBA39
      81DA81CDF7CEB8E8B7B4E8B4C4E8C2B4E8B3B0DDAE64D26356D15751C65054C0
      5143BA40B0E4B188898C8F8E91E9E9EAA09CA5636067CDCBD089858FC6C3CAFF
      FFFFF0FCF341BA3C80D97FA0E7A042C04043C04153C05051C14D60CE605CDB5F
      44C9433BC23950C94F46BD43B0E4B1E4E4E88A878E8482854D4A500C0B0D5350
      56CFC9D6FEFEFEFFFFFFEFFCF241BA3D81D9809BE49B32B92F37B83340B93C54
      C8536BDD6E4FCC4F34B9306AD0698ADE8A53C451B1E4B2FCFFFDE4E2E6979698
      47444A0A090A48454AD8D6DCFEFEFEFFFFFFF0FCF33EBA3B82DA83B2F1B44DCF
      4E39BC364BC94B6ADE6F57CC5739B9363FBD3C7BD87B93E29355C552B1E4B2FC
      FFFEFFFFFFFFFFFF9A959E555158C4C2C6FBFBFCFFFFFFFFFFFFF1FCF43BBA39
      8ADB8AF2FDF399EE9F4BD44C5FDD6351CE533AB8374DBF4A92D790C6F1C79FE7
      A051C54FB1E4B1FDFFFEFFFFFFFFFFFFDAD8DBD0CED2F9F9F9FFFFFFFFFFFFFF
      FFFFF3FCF53ABA3783DB83DBFCDF7FED855AE25E49CE4938BA3534B83141BC3E
      85D082DFF0DFB8E9B850C54FB0E4B1FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF3FCF637BA3480DA81A6EEA84EDA4F43CF4433BB3052
      C04E6CC76930B82D3FBC3C8ED98E9DE39E4EC54CB0E4B0FEFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FCF634BA3182D98396E49736C0
      3431BC2F52C14FBCE0B9CCE7CB69C76730B82D6FD26E8EE08F4CC54AB0E4B1FE
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCF63ABA36
      76DB78C1F6C595E29790E292C2E8C3F8FAF7F9FCF9D0EED09AE29BBEEEBEB4E7
      B450C54EADE4AEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF0FCF52AB9274FC8507EDD8080DA8289DA897EDB7FA5DDA37DDD7E98DC98
      79DA7B91DC9171D07046BE42B6E4B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF7FCF745B8412ABA293BBC3839BC3739BC3744BC403B
      BC3948BC4438BC353CBC3A37BC343BBB382EB92CA7E4A9FCFFFDFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEEAF9EDD8F9DDE0F9E4DEF9
      E2DDF9E0E3F9E6D8F9DBE4F9E5DAF9DEE2F9E5DBF9E0E2F9E5DAF9DEEDFDEFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFFFEFEFFFFFEFFFEFEFFFEFEFFFFFEFFFEFEFFFFFEFFFEFEFFFFFEFFFEFEFF
      FFFEFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF}
  end
  object BitBtn3: TBitBtn
    Left = 600
    Top = 424
    Width = 86
    Height = 25
    Caption = 'Fecha Emisi'#243'n'
    TabOrder = 24
    OnClick = BitBtn3Click
  end
  object dbgData: TwwDBGrid
    Left = 48
    Top = 493
    Width = 697
    Height = 161
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMCXP.dsQry8
    TabOrder = 25
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object BitBtn5: TBitBtn
    Left = 688
    Top = 424
    Width = 86
    Height = 25
    Caption = 'Fecha Registro'
    TabOrder = 26
    OnClick = BitBtn5Click
  end
  object meCia: TMaskEdit
    Left = 347
    Top = 430
    Width = 26
    Height = 21
    TabOrder = 27
    Text = '02'
  end
  object meMes: TMaskEdit
    Left = 380
    Top = 430
    Width = 49
    Height = 21
    TabOrder = 28
    Text = '200901'
  end
  object BitBtn6: TBitBtn
    Left = 436
    Top = 426
    Width = 49
    Height = 25
    Caption = 'Detalle'
    TabOrder = 29
    OnClick = BitBtn6Click
  end
  object rgOrden: TRadioGroup
    Left = 627
    Top = 23
    Width = 89
    Height = 59
    Caption = 'Orden'
    ItemIndex = 0
    Items.Strings = (
      'RUC/DNI'
      'Importe')
    TabOrder = 30
  end
  object bbtnRenumerar: TBitBtn
    Left = 500
    Top = 424
    Width = 78
    Height = 25
    Hint = 'Renumerar Correlativo'
    Caption = 'Renumerar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 31
    OnClick = bbtnRenumerarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F33F333F3337F330FF0FFF0FFF
      F03337F37F337F3337F330FF0FFF0FFFF03337F37FFF7FFF37F330F00000000F
      F03337F77777777337F330FFF0FFF0FFF03337F337F337F337F330FFF0FFF0FF
      F03337F337FFF7FFF7F330FF00000000F03337F37777777737F330FFFF0FFF0F
      F03337F3337F337F37F330FFFF0FFF0FF03337F33373337337F330FFFFFFFFFF
      F03337F33333333FF7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
    Spacing = 0
  end
  object pnDetalle: TPanel
    Left = 88
    Top = 72
    Width = 657
    Height = 297
    TabOrder = 32
    Visible = False
    object Label10: TLabel
      Left = 9
      Top = 24
      Width = 23
      Height = 13
      Caption = 'RUC'
    end
    object Label11: TLabel
      Left = 131
      Top = 24
      Width = 63
      Height = 13
      Caption = 'Raz'#243'n Social'
    end
    object stxTitulo2: TPanel
      Left = 1
      Top = 1
      Width = 655
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Detalle de Documentos por Proveedor'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object dbgDetalleProveedor: TwwDBGrid
      Left = 8
      Top = 64
      Width = 641
      Height = 201
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
    object btnSalir: TBitBtn
      Left = 614
      Top = 267
      Width = 35
      Height = 27
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnSalirClick
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
    object btnExportarExcel: TBitBtn
      Left = 577
      Top = 267
      Width = 35
      Height = 27
      TabOrder = 3
      OnClick = btnExportarExcelClick
      Glyph.Data = {
        F6010000424DF60100000000000076000000280000001C000000180000000100
        04000000000080010000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF0FFFFFF0000FFFFFFFFFFFF
        FFFFFFFF00FFFFFF0000FFFFFFFFFFFFFFFFFFF00000FFFF0000FFFFFFFFFFFF
        FFFFFFFF00FF0FFF0000FFFFFFFFFFFFFFFFFF0FF0FFF0FF0000272727272727
        2727F0FFFFFFF0FF00007272727272727272F0FFFFFFF0FF000027FFFFFFFFFF
        FF27F0FFFFFFF0FF000072FFFFFFF7272772F0FFF0FF0FFF000027F2727272F2
        7227FF0FF00FFFFF000072F727272F272F72FFF00000FFFF000027F27272F272
        7F27FFFFF00FFFFF000072FF272F27272F72FFFFF0FFFFFF000027FFF2F2727F
        FF27FFFFFFFFFFFF000072FF2F272727FF72FFFFFFFFFFFF000027F2F2727272
        7F27FFFFFFFFFFFF000072F72727F7272F72FFFFFFFFFFFF000027F2727FFF72
        7F27FFFFFFFFFFFF000072FFFFFFFFFFFF72FFFFFFFFFFFF0000272727272727
        2727FFFFFFFFFFFF00007272727272727272FFFFFFFFFFFF0000}
    end
    object dbeRuc: TwwDBEdit
      Left = 8
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeProveedor: TwwDBEdit
      Left = 131
      Top = 40
      Width = 517
      Height = 21
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object btnImprimeDet: TBitBtn
      Left = 542
      Top = 267
      Width = 32
      Height = 27
      Hint = 'Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnImprimeDetClick
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
  end
  object cbDisenoRep: TCheckBox
    Left = 144
    Top = 416
    Width = 97
    Height = 17
    Caption = 'Dise'#241'o Rep'
    TabOrder = 33
    Visible = False
  end
  object savdlg1: TSaveDialog
    DefaultExt = 'txt'
    FileName = '*.txt'
    Filter = 'txt'
    Left = 773
    Top = 419
  end
  object scFILES: TStrContainer
    Left = 772
    Top = 389
  end
  object ppReporteDAOT: TppReport
    AutoStop = False
    DataPipeline = ppDBReporteDAOT
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 19050
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 377826
    PrinterSetup.PaperSize = 256
    Template.FileName = 'C:\SOLExes\SOLFormatos\CXP\Bhl\ReporteDAOT.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 352
    Top = 464
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBReporteDAOT'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37042
      mmPrintPosition = 0
      object pplblTit: TppLabel
        UserName = 'lblTit'
        Caption = 'DECLARACION ANUAL DE OPERACIONES CON TERCEROS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 10cpi'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 6615
        mmTop = 6615
        mmWidth = 145786
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Tipo Persona'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 11642
        mmTop = 26194
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'RUC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 28310
        mmTop = 26194
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Raz'#243'n Social'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 60854
        mmTop = 26194
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 33073
        mmWidth = 231775
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'P'#225'gina :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 284957
        mmTop = 2910
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 284957
        mmTop = 7673
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Hora :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 284957
        mmTop = 12700
        mmWidth = 7673
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 309563
        mmTop = 2910
        mmWidth = 13758
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 299774
        mmTop = 7673
        mmWidth = 23548
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        AutoSize = False
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 299509
        mmTop = 12700
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Item'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 26194
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Apellido Paterno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 118534
        mmTop = 26194
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Apellido Materno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 177271
        mmTop = 26194
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Nombres'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 235744
        mmTop = 26194
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Importe Anual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 305859
        mmTop = 26194
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 21696
        mmWidth = 231775
        BandType = 0
      end
      object pplblRUC: TppLabel
        UserName = 'lblRUC'
        Caption = 'RUC : XXXXXXXXXXXXXXX'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 10cpi'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 6615
        mmTop = 13758
        mmWidth = 66411
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppdbTipoPersona: TppDBText
        UserName = 'dbTipoPersona'
        DataField = 'TIPPERID'
        DataPipeline = ppDBReporteDAOT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBReporteDAOT'
        mmHeight = 3704
        mmLeft = 13494
        mmTop = 0
        mmWidth = 10848
        BandType = 4
      end
      object ppdbPROVRUC: TppDBText
        UserName = 'dbPROVRUC'
        DataField = 'PROVRUC'
        DataPipeline = ppDBReporteDAOT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBReporteDAOT'
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 0
        mmWidth = 30692
        BandType = 4
      end
      object ppdbProvDes: TppDBText
        UserName = 'dbProvDes'
        DataField = 'PROVDES'
        DataPipeline = ppDBReporteDAOT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBReporteDAOT'
        mmHeight = 3704
        mmLeft = 59796
        mmTop = 0
        mmWidth = 56886
        BandType = 4
      end
      object ppdbCorrel: TppDBText
        UserName = 'dbCorrel'
        DataField = 'CORRELAT'
        DataPipeline = ppDBReporteDAOT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBReporteDAOT'
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 0
        mmWidth = 10583
        BandType = 4
      end
      object ppdbApePat: TppDBText
        UserName = 'dbApePat'
        DataField = 'PROVAPEPAT'
        DataPipeline = ppDBReporteDAOT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBReporteDAOT'
        mmHeight = 3704
        mmLeft = 118534
        mmTop = 0
        mmWidth = 56886
        BandType = 4
      end
      object ppdbApeMat: TppDBText
        UserName = 'dbApeMat'
        DataField = 'PROVAPEMAT'
        DataPipeline = ppDBReporteDAOT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBReporteDAOT'
        mmHeight = 3704
        mmLeft = 177271
        mmTop = 0
        mmWidth = 56886
        BandType = 4
      end
      object ppdbNombres: TppDBText
        UserName = 'dbNombres'
        DataField = 'PROVNOMBRE'
        DataPipeline = ppDBReporteDAOT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBReporteDAOT'
        mmHeight = 3704
        mmLeft = 235744
        mmTop = 0
        mmWidth = 56886
        BandType = 4
      end
      object ppdbImporte: TppDBText
        UserName = 'dbImporte'
        AutoSize = True
        DataField = 'IMPORTE'
        DataPipeline = ppDBReporteDAOT
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBReporteDAOT'
        mmHeight = 3704
        mmLeft = 311944
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Total     :   '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 3704
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'PROVRUC'
        DataPipeline = ppDBReporteDAOT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBReporteDAOT'
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 3704
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 231775
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'IMPORTE'
        DataPipeline = ppDBReporteDAOT
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBReporteDAOT'
        mmHeight = 3704
        mmLeft = 304271
        mmTop = 3704
        mmWidth = 19050
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Registros en el Reporte'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 58208
        mmTop = 3704
        mmWidth = 29898
        BandType = 7
      end
    end
  end
  object pprDetalle: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rDetalle'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SolFormatos\CxP\Incoresa\ReporteDAOTDet.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 255
    Top = 464
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object pplblCiaDet: TppLabel
        UserName = 'lblCiaDet'
        Caption = 'DISTRIBUIDORA INCORESA S.A'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 265
        mmWidth = 55033
        BandType = 0
      end
      object pplblTitDet: TppLabel
        UserName = 'lblTitDet'
        Caption = 
          'CONSISTENCIA DETALLADA PARA DECLARACION ANUAL DE OPERACIONES CON' +
          ' TERCEROS - EJERCICIO 2002'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 15875
        mmWidth = 190500
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 154782
        mmTop = 265
        mmWidth = 21167
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtTime
        DisplayFormat = 'h:nn:ss AM/PM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 154782
        mmTop = 5292
        mmWidth = 21167
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 173832
        mmTop = 10848
        mmWidth = 2117
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'F. Emisi'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 23813
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Serie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25135
        mmTop = 23813
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'N'#250'mero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 42333
        mmTop = 23813
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 87842
        mmTop = 23813
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Importe Local'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 113242
        mmTop = 23548
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Importe Ext.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 142346
        mmTop = 23548
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Imp. Equiv. Loc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 169069
        mmTop = 23548
        mmWidth = 33867
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CPSERIE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 23813
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'CPNODOC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 42598
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'TMONABR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 87577
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'MTOLOC'
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 125942
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'MTOEXT'
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 152665
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'CPFEMIS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'MONTOMN'
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 182034
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'MTOLOC'
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 113242
        mmTop = 2117
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'MTOEXT'
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 139965
        mmTop = 2117
        mmWidth = 25400
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 96044
        mmTop = 529
        mmWidth = 104775
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'MONTOMN'
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 169334
        mmTop = 2117
        mmWidth = 27517
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PROVRUC'
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'PROVRUC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 12965
          mmTop = 1323
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'PROVDES'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 64558
          mmTop = 1323
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'RUC :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 3704
          mmTop = 1323
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'PROVEEDOR :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 42598
          mmTop = 1323
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'MTOLOC'
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 113242
          mmTop = 1323
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'MTOEXT'
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 139965
          mmTop = 1323
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 96044
          mmTop = 0
          mmWidth = 104246
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'MONTOMN'
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 169334
          mmTop = 1323
          mmWidth = 27517
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
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'DOCID'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 11113
          mmTop = 0
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'DOCDES'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 43127
          mmTop = 0
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 96044
          mmTop = 0
          mmWidth = 103717
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'MTOLOC'
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 113242
          mmTop = 529
          mmWidth = 25400
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'MTOEXT'
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 139965
          mmTop = 529
          mmWidth = 25400
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'MONTOMN'
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 169334
          mmTop = 529
          mmWidth = 27517
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprDetalle
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 288
    Top = 464
  end
  object ppDBReporteDAOT: TppDBPipeline
    UserName = 'DBReporteDAOT'
    Left = 320
    Top = 464
  end
end
