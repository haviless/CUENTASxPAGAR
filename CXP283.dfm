object FAnula: TFAnula
  Left = 491
  Top = 347
  Width = 560
  Height = 395
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Retenciones'
  Color = 13165023
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgRet: TwwDBGrid
    Left = 24
    Top = 112
    Width = 505
    Height = 208
    DisableThemesInTitle = False
    Selected.Strings = (
      'DOCID'#9'5'#9'Doc.Id'#9'F'
      'SERIE'#9'05'#9'Serie'#9'F'
      'NODOC'#9'12'#9'N'#250'mero'#9'F'
      'MTOLOC'#9'12'#9'Mto.Loc'#9'F'
      'MTOEXT'#9'12'#9'Mto.Ext'#9'F'
      'MTORETLOC'#9'10'#9'Ret.Loc'#9'F'
      'MTORETEXT'#9'10'#9'Ret.Ext'#9'F')
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMCXP.DSRETENCION
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    FooterColor = 10207162
  end
  object bbtnAnula: TBitBtn
    Left = 272
    Top = 327
    Width = 75
    Height = 25
    Caption = 'Anular'
    TabOrder = 1
    OnClick = bbtnAnulaClick
  end
  object BitBtn2: TBitBtn
    Left = 448
    Top = 327
    Width = 75
    Height = 25
    Caption = 'Cerrar'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object Panel1: TPanel
    Left = 24
    Top = 6
    Width = 505
    Height = 99
    Color = 10207162
    TabOrder = 3
    object Label1: TLabel
      Left = 42
      Top = 6
      Width = 30
      Height = 13
      Caption = 'Serie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 122
      Top = 6
      Width = 44
      Height = 13
      Caption = 'N'#250'mero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 234
      Top = 6
      Width = 36
      Height = 13
      Caption = 'Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 39
      Top = 54
      Width = 32
      Height = 13
      Caption = 'Clase'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 114
      Top = 54
      Width = 42
      Height = 13
      Caption = 'Auxiliar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 234
      Top = 54
      Width = 39
      Height = 13
      Caption = 'R.U.C.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 409
      Top = 6
      Width = 40
      Height = 13
      Caption = 'Estado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 353
      Top = 0
      Width = 4
      Height = 99
    end
    object Label8: TLabel
      Left = 409
      Top = 53
      Width = 44
      Height = 13
      Caption = 'Usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 36
      Top = 22
      Width = 44
      Height = 21
      DataField = 'RETSERIE'
      DataSource = DMCXP.dsConsulta
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit2: TwwDBEdit
      Left = 106
      Top = 22
      Width = 85
      Height = 21
      DataField = 'RETNUMERO'
      DataSource = DMCXP.dsConsulta
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBDateTimePicker1: TwwDBDateTimePicker
      Left = 218
      Top = 22
      Width = 92
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'FECPAGO'
      DataSource = DMCXP.dsConsulta
      Epoch = 1950
      ReadOnly = True
      ShowButton = True
      TabOrder = 2
    end
    object wwDBEdit3: TwwDBEdit
      Left = 34
      Top = 68
      Width = 39
      Height = 21
      DataField = 'CLAUXID'
      DataSource = DMCXP.dsConsulta
      ReadOnly = True
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit4: TwwDBEdit
      Left = 101
      Top = 68
      Width = 90
      Height = 21
      DataField = 'AUXID'
      DataSource = DMCXP.dsConsulta
      ReadOnly = True
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit5: TwwDBEdit
      Left = 218
      Top = 68
      Width = 105
      Height = 21
      DataField = 'AUXRUC'
      DataSource = DMCXP.dsConsulta
      ReadOnly = True
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit6: TwwDBEdit
      Left = 393
      Top = 22
      Width = 76
      Height = 21
      DataField = 'ECESTADO'
      DataSource = DMCXP.dsConsulta
      ReadOnly = True
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit7: TwwDBEdit
      Left = 393
      Top = 69
      Width = 76
      Height = 21
      DataField = 'USUARIO'
      DataSource = DMCXP.dsConsulta
      ReadOnly = True
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object bbtnActiva: TBitBtn
    Left = 360
    Top = 327
    Width = 75
    Height = 25
    Caption = 'Activar'
    TabOrder = 4
    OnClick = bbtnActivaClick
  end
  object bbtnReemplazar: TBitBtn
    Left = 32
    Top = 327
    Width = 75
    Height = 25
    Caption = 'Reemplazar'
    TabOrder = 5
    OnClick = bbtnReemplazarClick
  end
  object BitBtn1: TBitBtn
    Left = 152
    Top = 328
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 6
    OnClick = BitBtn1Click
  end
end
