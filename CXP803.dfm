object FToolCCProv: TFToolCCProv
  Left = 43
  Top = 132
  Width = 812
  Height = 150
  Caption = 'FToolCCProv'
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
    Width = 804
    Height = 123
    Align = alClient
    BevelInner = bvRaised
    Color = 14869218
    TabOrder = 0
    object sbEjecuta: TSpeedButton
      Left = 343
      Top = 82
      Width = 39
      Height = 41
      Hint = 'Aceptaci'#243'n'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF5555555555555C055555
        55555555577FF55555555555CCC05555555555557777F55555555555CCC05555
        555555557777FF555555555CCCCC05555555555777777F55555555CCCCCC0555
        5555557777777FF555555CCC05CCC05555555777757777F55555CC05555CC055
        55557775555777FF55555555555CCC05555555555557777F555555555555CC05
        555555555555777FF555555555555CC05555555555555777FF555555555555CC
        05555555555555777FF555555555555CC05555555555555777FF555555555555
        5CC0555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sbEjecutaClick
    end
    object SpeedButton2: TSpeedButton
      Left = 482
      Top = 76
      Width = 39
      Height = 41
      Hint = 'Proveedore'
      Flat = True
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
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object Label11: TLabel
      Left = 18
      Top = 4
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
    object Label1: TLabel
      Left = 39
      Top = 44
      Width = 44
      Height = 15
      Caption = 'Fecha Al'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 120
      Top = 44
      Width = 52
      Height = 15
      Caption = 'Proveedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dbeCIA: TwwDBEdit
      Left = 51
      Top = 20
      Width = 200
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dtpFecha: TwwDBDateTimePicker
      Left = 16
      Top = 60
      Width = 95
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
    object dbeProv: TwwDBEdit
      Left = 191
      Top = 60
      Width = 170
      Height = 23
      CharCase = ecUpperCase
      DataField = 'CLIEDES'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeCiaCod: TwwDBEdit
      Left = 14
      Top = 20
      Width = 35
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeProvCod: TwwDBEdit
      Left = 116
      Top = 60
      Width = 73
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnTodos: TBitBtn
      Left = 610
      Top = 13
      Width = 85
      Height = 25
      Hint = 'Todos los Tip. Documentos'
      Caption = 'Todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnTodosClick
    end
    object bbtnLetras: TBitBtn
      Left = 878
      Top = 45
      Width = 86
      Height = 25
      Hint = 'Tipo Doc. Letras'
      Caption = 'Letras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnLetrasClick
    end
    object bbtnProvision: TBitBtn
      Left = 878
      Top = 13
      Width = 86
      Height = 25
      Hint = 'Tip. Doc Provisi'#243'n'
      Caption = 'Provision'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnProvisionClick
    end
    object bbtnAnticipo: TBitBtn
      Left = 610
      Top = 77
      Width = 86
      Height = 25
      Hint = 'Tip. Doc Anticipo'
      Caption = 'Anticipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbtnAnticipoClick
    end
    object bbtnNotCredito: TBitBtn
      Left = 610
      Top = 45
      Width = 85
      Height = 25
      Hint = 'Tip.Doc. Nota de Cr'#233'dito'
      Caption = 'Nota de Cr'#233'dito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = bbtnNotCreditoClick
    end
    object GroupBox1: TGroupBox
      Left = 395
      Top = 5
      Width = 211
      Height = 112
      Caption = 'Saldos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      object Label3: TLabel
        Left = 65
        Top = 12
        Width = 23
        Height = 15
        Caption = 'Solo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 144
        Top = 12
        Width = 26
        Height = 15
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 63
        Top = 68
        Width = 23
        Height = 15
        Caption = 'Solo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 143
        Top = 68
        Width = 26
        Height = 15
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 4
        Top = 60
        Width = 203
        Height = 3
      end
      object Label7: TLabel
        Left = 9
        Top = 34
        Width = 25
        Height = 15
        Caption = 'M.N.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 11
        Top = 87
        Width = 23
        Height = 15
        Caption = 'M.E.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dbesaltotmn: TwwDBEdit
        Left = 128
        Top = 29
        Width = 73
        Height = 23
        CharCase = ecUpperCase
        DataField = 'SALDTACTMN'
        DataSource = DMCXP.dsCXP
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbesaltotme: TwwDBEdit
        Left = 128
        Top = 83
        Width = 73
        Height = 23
        CharCase = ecUpperCase
        DataField = 'SALDTACTME'
        DataSource = DMCXP.dsCXP
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
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
      object dbesalactme: TwwDBEdit
        Left = 40
        Top = 83
        Width = 73
        Height = 23
        CharCase = ecUpperCase
        DataField = 'SALDSACTME'
        DataSource = DMCXP.dsCXP
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbesalactmn: TwwDBEdit
        Left = 40
        Top = 29
        Width = 73
        Height = 23
        CharCase = ecUpperCase
        DataField = 'SALDSACTMN'
        DataSource = DMCXP.dsCXP
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object GrEstados: TGroupBox
      Left = 16
      Top = 85
      Width = 321
      Height = 31
      Caption = 'Estados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      object RbTodos: TRadioButton
        Left = 6
        Top = 11
        Width = 73
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RbTodosClick
      end
      object RbPendientes: TRadioButton
        Left = 103
        Top = 11
        Width = 89
        Height = 17
        Caption = 'Pendientes'
        TabOrder = 1
        OnClick = RbPendientesClick
      end
      object RbCancelados: TRadioButton
        Left = 212
        Top = 11
        Width = 89
        Height = 17
        Caption = 'Cancelados'
        TabOrder = 2
        OnClick = RbCanceladosClick
      end
    end
    object BitBtn1: TBitBtn
      Left = 878
      Top = 77
      Width = 85
      Height = 25
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
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
  object ppdbCab: TppDBPipeline
    DataSource = DMCXP.dsQry5
    UserName = 'dbCab'
    Left = 456
    Top = 48
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'PROVRUC'
      FieldName = 'PROVRUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'CPSERIE'
      FieldName = 'CPSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'CPNODOC'
      FieldName = 'CPNODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CPNOREG'
      FieldName = 'CPNOREG'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'TCANJEID'
      FieldName = 'TCANJEID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'CCPCANJE'
      FieldName = 'CCPCANJE'
      FieldLength = 6
      DisplayWidth = 6
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'CCPFCJE'
      FieldName = 'CCPFCJE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'DOCID2'
      FieldName = 'DOCID2'
      FieldLength = 2
      DisplayWidth = 2
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'CPSERIE2'
      FieldName = 'CPSERIE2'
      FieldLength = 5
      DisplayWidth = 5
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'CPNODOC2'
      FieldName = 'CPNODOC2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOORI'
      FieldName = 'DCDMOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOLOC'
      FieldName = 'DCDMOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOEXT'
      FieldName = 'DCDMOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      FieldAlias = 'DCDUSER'
      FieldName = 'DCDUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      FieldAlias = 'DCDFREG'
      FieldName = 'DCDFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      FieldAlias = 'DCDHREG'
      FieldName = 'DCDHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      FieldAlias = 'DCDAAAA'
      FieldName = 'DCDAAAA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 20
    end
    object ppField22: TppField
      FieldAlias = 'DCDMM'
      FieldName = 'DCDMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 21
    end
    object ppField23: TppField
      FieldAlias = 'DCDDD'
      FieldName = 'DCDDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object ppField24: TppField
      FieldAlias = 'DCDTRI'
      FieldName = 'DCDTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField25: TppField
      FieldAlias = 'DCDSEM'
      FieldName = 'DCDSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField26: TppField
      FieldAlias = 'DCDSS'
      FieldName = 'DCDSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 25
    end
    object ppField27: TppField
      FieldAlias = 'DCDANOMM'
      FieldName = 'DCDANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'DCDAATRI'
      FieldName = 'DCDAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'DCDAASEM'
      FieldName = 'DCDAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 28
    end
    object ppField30: TppField
      FieldAlias = 'DCDAASS'
      FieldName = 'DCDAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 29
    end
    object ppField31: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 30
    end
    object ppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDTCAMB'
      FieldName = 'DCDTCAMB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'CJEANTMN'
      FieldName = 'CJEANTMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'CJEANTME'
      FieldName = 'CJEANTME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALLOC'
      FieldName = 'SALLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALEXT'
      FieldName = 'SALEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppField37: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 36
    end
    object ppField38: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 37
    end
    object ppField39: TppField
      FieldAlias = 'ECNOCOMP'
      FieldName = 'ECNOCOMP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 38
    end
    object ppField40: TppField
      FieldAlias = 'ECANOMM'
      FieldName = 'ECANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 39
    end
    object ppField41: TppField
      FieldAlias = 'DOCABR'
      FieldName = 'DOCABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 40
    end
    object ppField42: TppField
      FieldAlias = 'PROVDES'
      FieldName = 'PROVDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 41
    end
    object ppField43: TppField
      FieldAlias = 'TMONDES'
      FieldName = 'TMONDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 42
    end
    object ppField44: TppField
      FieldAlias = 'TMONABR'
      FieldName = 'TMONABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 43
    end
    object ppField45: TppField
      FieldAlias = 'TMON_LOC'
      FieldName = 'TMON_LOC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 44
    end
    object ppField46: TppField
      FieldAlias = 'CIADES'
      FieldName = 'CIADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 45
    end
  end
  object ppdbDet: TppDBPipeline
    DataSource = DMCXP.dsQry6
    UserName = 'dbDet'
    Left = 456
    Top = 88
    object ppField47: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField48: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppField49: TppField
      FieldAlias = 'PROVRUC'
      FieldName = 'PROVRUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppField50: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField51: TppField
      FieldAlias = 'CPSERIE'
      FieldName = 'CPSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 4
    end
    object ppField52: TppField
      FieldAlias = 'CPNODOC'
      FieldName = 'CPNODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppField53: TppField
      FieldAlias = 'CPNOREG'
      FieldName = 'CPNOREG'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppField54: TppField
      FieldAlias = 'TCANJEID'
      FieldName = 'TCANJEID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField55: TppField
      FieldAlias = 'CCPCANJE'
      FieldName = 'CCPCANJE'
      FieldLength = 6
      DisplayWidth = 6
      Position = 8
    end
    object ppField56: TppField
      FieldAlias = 'CCPFCJE'
      FieldName = 'CCPFCJE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppField57: TppField
      FieldAlias = 'DOCID2'
      FieldName = 'DOCID2'
      FieldLength = 2
      DisplayWidth = 2
      Position = 10
    end
    object ppField58: TppField
      FieldAlias = 'CPSERIE2'
      FieldName = 'CPSERIE2'
      FieldLength = 5
      DisplayWidth = 5
      Position = 11
    end
    object ppField59: TppField
      FieldAlias = 'CPNODOC2'
      FieldName = 'CPNODOC2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppField60: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOORI'
      FieldName = 'DCDMOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOLOC'
      FieldName = 'DCDMOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDMOEXT'
      FieldName = 'DCDMOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField64: TppField
      FieldAlias = 'DCDUSER'
      FieldName = 'DCDUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppField65: TppField
      FieldAlias = 'DCDFREG'
      FieldName = 'DCDFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 18
    end
    object ppField66: TppField
      FieldAlias = 'DCDHREG'
      FieldName = 'DCDHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 19
    end
    object ppField67: TppField
      FieldAlias = 'DCDAAAA'
      FieldName = 'DCDAAAA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 20
    end
    object ppField68: TppField
      FieldAlias = 'DCDMM'
      FieldName = 'DCDMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 21
    end
    object ppField69: TppField
      FieldAlias = 'DCDDD'
      FieldName = 'DCDDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object ppField70: TppField
      FieldAlias = 'DCDTRI'
      FieldName = 'DCDTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField71: TppField
      FieldAlias = 'DCDSEM'
      FieldName = 'DCDSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField72: TppField
      FieldAlias = 'DCDSS'
      FieldName = 'DCDSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 25
    end
    object ppField73: TppField
      FieldAlias = 'DCDANOMM'
      FieldName = 'DCDANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 26
    end
    object ppField74: TppField
      FieldAlias = 'DCDAATRI'
      FieldName = 'DCDAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 27
    end
    object ppField75: TppField
      FieldAlias = 'DCDAASEM'
      FieldName = 'DCDAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 28
    end
    object ppField76: TppField
      FieldAlias = 'DCDAASS'
      FieldName = 'DCDAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 29
    end
    object ppField77: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 30
    end
    object ppField78: TppField
      Alignment = taRightJustify
      FieldAlias = 'DCDTCAMB'
      FieldName = 'DCDTCAMB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'CJEANTMN'
      FieldName = 'CJEANTMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'CJEANTME'
      FieldName = 'CJEANTME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALLOC'
      FieldName = 'SALLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALEXT'
      FieldName = 'SALEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppField83: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 36
    end
    object ppField84: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 37
    end
    object ppField85: TppField
      FieldAlias = 'ECNOCOMP'
      FieldName = 'ECNOCOMP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 38
    end
    object ppField86: TppField
      FieldAlias = 'ECANOMM'
      FieldName = 'ECANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 39
    end
    object ppField87: TppField
      FieldAlias = 'DOCABR'
      FieldName = 'DOCABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 40
    end
    object ppField88: TppField
      FieldAlias = 'PROVDES'
      FieldName = 'PROVDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 41
    end
    object ppField89: TppField
      FieldAlias = 'TMONDES'
      FieldName = 'TMONDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 42
    end
    object ppField90: TppField
      FieldAlias = 'TMONABR'
      FieldName = 'TMONABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 43
    end
    object ppField91: TppField
      FieldAlias = 'TMON_LOC'
      FieldName = 'TMON_LOC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 44
    end
    object ppField92: TppField
      FieldAlias = 'CIADES'
      FieldName = 'CIADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 45
    end
  end
  object pprReporte: TppReport
    AutoStop = False
    DataPipeline = ppdbCab
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SOLFormatos\CxP\SACSA\CtaCteDetProv.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 488
    Top = 48
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbCab'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 60854
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 16933
        mmLeft = 3175
        mmTop = 31750
        mmWidth = 191294
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'CUENTA CORRIENTE DE PROVEEDORES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 68263
        mmTop = 14817
        mmWidth = 60854
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 164571
        mmTop = 8996
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Hora : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 164571
        mmTop = 13758
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'P'#225'gina : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 164571
        mmTop = 18785
        mmWidth = 11906
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178859
        mmTop = 8996
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 175948
        mmTop = 13758
        mmWidth = 17727
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 192088
        mmTop = 18785
        mmWidth = 1588
        BandType = 0
      end
      object pplblCiades: TppLabel
        UserName = 'lblCiades'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 11377
        mmTop = 7144
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Proveedor : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 35190
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PROV'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 3969
        mmLeft = 24077
        mmTop = 35190
        mmWidth = 11113
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PROVDES'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 3969
        mmLeft = 36513
        mmTop = 35190
        mmWidth = 71967
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Direcci'#243'n : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 40481
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PROVDIR'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 3969
        mmLeft = 24077
        mmTop = 40481
        mmWidth = 127794
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'R.U.C. : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114300
        mmTop = 35190
        mmWidth = 11377
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PROVRUC'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 3969
        mmLeft = 127794
        mmTop = 35190
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Saldos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 50536
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Sistema de Cuentas por Pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 11906
        mmWidth = 41804
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppRegion1: TppRegion
        UserName = 'Region1'
        Caption = 'Region1'
        mmHeight = 16140
        mmLeft = 7673
        mmTop = 5556
        mmWidth = 187590
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'CPMTOLOC'
          DataPipeline = ppdbCab
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbCab'
          mmHeight = 3969
          mmLeft = 60590
          mmTop = 15346
          mmWidth = 17198
          BandType = 4
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'CPPAGLOC'
          DataPipeline = ppdbCab
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbCab'
          mmHeight = 3969
          mmLeft = 86519
          mmTop = 15346
          mmWidth = 16933
          BandType = 4
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Monto Local'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 59531
          mmTop = 7938
          mmWidth = 18256
          BandType = 4
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Monto Pagado Loc.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 83609
          mmTop = 7938
          mmWidth = 28046
          BandType = 4
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Tipo de Documento '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 12435
          mmTop = 7938
          mmWidth = 28840
          BandType = 4
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'TIPO'
          DataPipeline = ppdbCab
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbCab'
          mmHeight = 3969
          mmLeft = 15875
          mmTop = 15346
          mmWidth = 7408
          BandType = 4
        end
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        DrillDownComponent = ppRegion1
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppdbDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 23283
        mmWidth = 203200
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppdbDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Template.FileName = 'C:\SOLExes\SOLFormatos\CxP\SACSA\CtaCteDetProv.rtm'
          Left = 488
          Top = 64
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppdbDet'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Serie '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 20902
              mmTop = 2381
              mmWidth = 7673
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Numero '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 34131
              mmTop = 2381
              mmWidth = 11906
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label101'
              Caption = 'Monto Local'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 113242
              mmTop = 2381
              mmWidth = 18256
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Monto Pagado Local'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 136261
              mmTop = 2381
              mmWidth = 29633
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Fecha Emisi'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 54769
              mmTop = 2381
              mmWidth = 20373
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Fecha Vencim.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 79640
              mmTop = 2381
              mmWidth = 20373
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'CPSERIE'
              DataPipeline = ppdbDet
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3969
              mmLeft = 19844
              mmTop = 1323
              mmWidth = 7938
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'CPNODOC'
              DataPipeline = ppdbDet
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3969
              mmLeft = 33602
              mmTop = 1323
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              AutoSize = True
              DataField = 'CPMTOLOC'
              DataPipeline = ppdbDet
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3969
              mmLeft = 113506
              mmTop = 1323
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText101'
              AutoSize = True
              DataField = 'CPPAGLOC'
              DataPipeline = ppdbDet
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3969
              mmLeft = 138907
              mmTop = 1323
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'CPFEMIS'
              DataPipeline = ppdbDet
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3969
              mmLeft = 55298
              mmTop = 1852
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              AutoSize = True
              DataField = 'CPFVCMTO'
              DataPipeline = ppdbDet
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3969
              mmLeft = 82021
              mmTop = 1588
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 7938
            mmPrintPosition = 0
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'Totales : '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 92075
              mmTop = 3175
              mmWidth = 12965
              BandType = 7
            end
            object ppDBCalc1: TppDBCalc
              UserName = 'DBCalc1'
              DataField = 'CPMTOLOC'
              DataPipeline = ppdbDet
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3969
              mmLeft = 113242
              mmTop = 3175
              mmWidth = 17198
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'CPPAGLOC'
              DataPipeline = ppdbDet
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3969
              mmLeft = 139436
              mmTop = 3175
              mmWidth = 17198
              BandType = 7
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = '------------------------------------------'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 112448
              mmTop = 0
              mmWidth = 44450
              BandType = 7
            end
          end
        end
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Saldos Totales : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 3704
        mmWidth = 23283
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        AutoSize = True
        DataField = 'CPMTOLOC'
        DataPipeline = ppdbCab
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 3969
        mmLeft = 50006
        mmTop = 3704
        mmWidth = 27781
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        AutoSize = True
        DataField = 'CPPAGLOC'
        DataPipeline = ppdbCab
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 3969
        mmLeft = 86519
        mmTop = 3440
        mmWidth = 26723
        BandType = 7
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 760
    Top = 16
  end
end
