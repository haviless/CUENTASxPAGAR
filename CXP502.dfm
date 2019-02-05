object FCierreOpe: TFCierreOpe
  Left = 328
  Top = 174
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'SOL Cuentas por Pagar'
  ClientHeight = 473
  ClientWidth = 416
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 93
    Top = 1
    Width = 232
    Height = 35
    Caption = 'Periodos Operativos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bbtnGraba: TBitBtn
    Left = 8
    Top = 442
    Width = 95
    Height = 26
    Caption = 'Aceptar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnClick = bbtnGrabaClick
  end
  object bbtnSalir: TBitBtn
    Left = 312
    Top = 442
    Width = 95
    Height = 26
    Caption = '&Salir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = bbtnSalirClick
  end
  object Panel1: TPanel
    Left = 6
    Top = 40
    Width = 400
    Height = 41
    BevelInner = bvLowered
    Color = 14869218
    TabOrder = 0
    object lblCia: TLabel
      Left = 22
      Top = 14
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object dblcCia: TwwDBLookupCombo
      Left = 91
      Top = 9
      Width = 50
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      LookupTable = DMCXP.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      DropDownCount = 15
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcCiaEnter
      OnExit = dblcCiaExit
      OnNotInList = dblcCiaNotInList
    end
    object edtCia: TEdit
      Left = 144
      Top = 9
      Width = 249
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnlAct: TPanel
    Left = 6
    Top = 88
    Width = 400
    Height = 150
    BevelInner = bvLowered
    Color = 14869218
    TabOrder = 1
    object Label2: TLabel
      Left = 224
      Top = 17
      Width = 62
      Height = 15
      Caption = 'Nro.Periodo'
    end
    object Label3: TLabel
      Left = 12
      Top = 57
      Width = 65
      Height = 15
      Caption = 'Fecha Inicio'
    end
    object Label4: TLabel
      Left = 7
      Top = 6
      Width = 204
      Height = 23
      Caption = 'Periodo Actual de Trabajo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 224
      Top = 56
      Width = 58
      Height = 15
      Caption = 'Fecha Final'
    end
    object Label6: TLabel
      Left = 12
      Top = 99
      Width = 40
      Height = 15
      Caption = 'Usuario'
    end
    object Label7: TLabel
      Left = 224
      Top = 102
      Width = 55
      Height = 15
      Caption = 'Fecha Reg.'
    end
    object Label8: TLabel
      Left = 224
      Top = 125
      Width = 50
      Height = 15
      Caption = 'Hora Reg.'
    end
    object sbAjustaPerAct: TSpeedButton
      Left = 11
      Top = 125
      Width = 103
      Height = 22
      Caption = 'Ajusta Per.Actual'
      Enabled = False
      Flat = True
      OnClick = sbAjustaPerActClick
    end
    object dbeNoCierreU: TwwDBEdit
      Left = 290
      Top = 12
      Width = 95
      Height = 23
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      UnboundAlignment = taRightJustify
      WantReturns = False
      WordWrap = False
    end
    object dtpFIniU: TwwDBDateTimePicker
      Left = 81
      Top = 51
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 1
    end
    object dtpFCierreU: TwwDBDateTimePicker
      Left = 290
      Top = 51
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 2
      OnExit = dtpFCierreUExit
    end
    object dtpFRegU: TwwDBDateTimePicker
      Left = 290
      Top = 95
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 3
      UnboundDataType = wwDTEdtDate
    end
    object dtpHRegU: TwwDBDateTimePicker
      Left = 290
      Top = 119
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 4
      UnboundDataType = wwDTEdtTime
    end
    object dbeUserU: TwwDBEdit
      Left = 81
      Top = 94
      Width = 95
      Height = 23
      Enabled = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object pnlReg3: TPanel
    Left = 6
    Top = 289
    Width = 400
    Height = 150
    BevelInner = bvLowered
    Color = 14869218
    TabOrder = 2
    Visible = False
    object Label9: TLabel
      Left = 224
      Top = 16
      Width = 62
      Height = 15
      Caption = 'Nro.Periodo'
    end
    object Label10: TLabel
      Left = 12
      Top = 56
      Width = 65
      Height = 15
      Caption = 'Fecha Inicio'
    end
    object Label11: TLabel
      Left = 7
      Top = 6
      Width = 201
      Height = 23
      Caption = 'Nuevo Periodo de Trabajo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 224
      Top = 55
      Width = 58
      Height = 15
      Caption = 'Fecha Final'
    end
    object Label13: TLabel
      Left = 12
      Top = 102
      Width = 40
      Height = 15
      Caption = 'Usuario'
    end
    object Label14: TLabel
      Left = 224
      Top = 102
      Width = 55
      Height = 15
      Caption = 'Fecha Reg.'
    end
    object Label15: TLabel
      Left = 224
      Top = 125
      Width = 50
      Height = 15
      Caption = 'Hora Reg.'
    end
    object dbeNoCierre: TwwDBEdit
      Left = 290
      Top = 11
      Width = 95
      Height = 23
      DataField = 'NOCIERRE'
      DataSource = DMCXP.dsCierre
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      UnboundAlignment = taRightJustify
      WantReturns = False
      WordWrap = False
      OnExit = dbeNoCierreExit
    end
    object dtpFIni: TwwDBDateTimePicker
      Left = 81
      Top = 50
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'FINICIO'
      DataSource = DMCXP.dsCierre
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
      OnExit = dtpFIniExit
    end
    object dtpFCierre: TwwDBDateTimePicker
      Left = 290
      Top = 50
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'FCIERRE'
      DataSource = DMCXP.dsCierre
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
      OnExit = dtpFCierreExit
    end
    object dtpFReg: TwwDBDateTimePicker
      Left = 290
      Top = 95
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'FREG'
      DataSource = DMCXP.dsCierre
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 3
      UnboundDataType = wwDTEdtDate
    end
    object dtpHReg: TwwDBDateTimePicker
      Left = 290
      Top = 119
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'HREG'
      DataSource = DMCXP.dsCierre
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 4
      UnboundDataType = wwDTEdtTime
    end
    object dbeUser: TwwDBEdit
      Left = 81
      Top = 95
      Width = 95
      Height = 23
      DataField = 'USUARIO'
      DataSource = DMCXP.dsCierre
      Enabled = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object bbtnNuevo: TBitBtn
    Left = 7
    Top = 263
    Width = 150
    Height = 26
    Caption = 'Generar Nuevo Periodo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Visible = False
    OnClick = bbtnNuevoClick
  end
end
