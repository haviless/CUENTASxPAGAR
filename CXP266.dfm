object FEditaOP: TFEditaOP
  Left = 859
  Top = 259
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Cambiar Importes'
  ClientHeight = 273
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCab: TPanel
    Left = 0
    Top = 3
    Width = 487
    Height = 263
    BevelOuter = bvNone
    TabOrder = 0
    object lblSaldo: TLabel
      Left = 15
      Top = 22
      Width = 89
      Height = 19
      Caption = 'Importe Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblImporte: TLabel
      Left = 15
      Top = 202
      Width = 103
      Height = 19
      Caption = 'Importe a Pagar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRetencion: TLabel
      Left = 15
      Top = 52
      Width = 60
      Height = 19
      Caption = 'Retenci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOtroDscto: TLabel
      Left = 15
      Top = 82
      Width = 110
      Height = 19
      Caption = 'Otros Descuentos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblObservac: TLabel
      Left = 15
      Top = 172
      Width = 88
      Height = 19
      Caption = 'Observaciones'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCtaCntOtrDcto: TLabel
      Left = 15
      Top = 112
      Width = 118
      Height = 19
      Caption = 'Cta.Cont Otr.Dcto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 255
      Top = 52
      Width = 67
      Height = 19
      Caption = 'Detracci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCCosto: TLabel
      Left = 14
      Top = 141
      Width = 81
      Height = 19
      Caption = 'Centro Costo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeImporte: TwwDBEdit
      Left = 140
      Top = 200
      Width = 100
      Height = 21
      DataField = 'IMPPAGO'
      DataSource = DMCXP.dsDetallePres
      Enabled = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeSaldo: TwwDBEdit
      Left = 140
      Top = 20
      Width = 100
      Height = 21
      DataField = 'CPMTOORI'
      DataSource = DMCXP.dsDetallePres
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnCamb: TBitBtn
      Left = 105
      Top = 50
      Width = 20
      Height = 20
      Caption = 'Dif.'
      TabOrder = 1
      OnClick = bbtnCambClick
    end
    object dbeRetencion: TwwDBEdit
      Left = 140
      Top = 50
      Width = 100
      Height = 21
      TabOrder = 2
      UnboundDataType = wwDefault
      UnboundAlignment = taRightJustify
      WantReturns = False
      WordWrap = False
      OnExit = dbeRetencionExit
    end
    object dbeotrosdesc: TwwDBEdit
      Left = 140
      Top = 80
      Width = 100
      Height = 21
      DataField = 'IMPOTRDTO'
      DataSource = DMCXP.dsDetallePres
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = dbeotrosdescEnter
      OnExit = dbeotrosdescExit
    end
    object dbeObservacion: TwwDBEdit
      Left = 140
      Top = 170
      Width = 334
      Height = 21
      CharCase = ecUpperCase
      DataField = 'OBSERVA'
      DataSource = DMCXP.dsDetallePres
      MaxLength = 100
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnOk: TBitBtn
      Left = 426
      Top = 221
      Width = 42
      Height = 33
      TabOrder = 8
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
    object edtCtaCnt: TEdit
      Left = 244
      Top = 110
      Width = 230
      Height = 21
      Enabled = False
      TabOrder = 10
    end
    object dblcdCtaCnt: TwwDBLookupComboDlg
      Left = 140
      Top = 110
      Width = 100
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DMCXP.cdsQry5
      LookupField = 'CUENTAID'
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblcdCtaCntChange
      OnExit = dblcdCtaCntExit
    end
    object dbeDetraccion: TwwDBEdit
      Left = 326
      Top = 50
      Width = 100
      Height = 21
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdCCosto: TwwDBLookupComboDlg
      Left = 139
      Top = 139
      Width = 100
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DMCXP.cdsQryCCosto
      LookupField = 'CCOSID'
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdCCostoExit
    end
    object edtCCosto: TEdit
      Left = 243
      Top = 139
      Width = 230
      Height = 21
      Enabled = False
      TabOrder = 11
    end
  end
end
