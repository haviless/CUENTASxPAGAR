object FAsientos: TFAsientos
  Left = 241
  Top = 178
  Width = 740
  Height = 500
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Asientos Contables'
  Color = clBtnFace
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 740
  Constraints.MinHeight = 500
  Constraints.MinWidth = 740
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDoc: TPanel
    Left = 4
    Top = 8
    Width = 722
    Height = 457
    TabOrder = 5
    Visible = False
    object dbgDoc: TwwDBGrid
      Left = 8
      Top = 16
      Width = 705
      Height = 401
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DMCXP.dsHLetras
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      TabOrder = 0
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
      Left = 648
      Top = 424
      Width = 59
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = BitBtn5Click
    end
    object BitBtn7: TBitBtn
      Left = 576
      Top = 424
      Width = 59
      Height = 25
      Caption = 'Grabar'
      TabOrder = 2
      OnClick = BitBtn7Click
    end
  end
  object dbgConta: TwwDBGrid
    Left = 7
    Top = 26
    Width = 716
    Height = 392
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
  end
  object pnlLote: TPanel
    Left = 568
    Top = 422
    Width = 153
    Height = 41
    TabOrder = 1
    Visible = False
    object dbeLote: TwwDBEdit
      Left = 7
      Top = 9
      Width = 50
      Height = 21
      DataField = 'CNTLOTE'
      DataSource = DMCXP.dsDetCjeProv
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object BitBtn1: TBitBtn
      Left = 65
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Grabar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object BitBtn2: TBitBtn
    Left = 136
    Top = 432
    Width = 121
    Height = 25
    Caption = 'Elimina y Contabilizar'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 24
    Top = 432
    Width = 105
    Height = 25
    Caption = 'Elimina Asiento'
    TabOrder = 3
    Visible = False
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 272
    Top = 432
    Width = 161
    Height = 25
    Caption = 'Ver Documentos a Contabilizar'
    TabOrder = 4
    Visible = False
    OnClick = BitBtn4Click
  end
  object BitBtn6: TBitBtn
    Left = 440
    Top = 432
    Width = 95
    Height = 25
    Caption = 'Ver Documentos'
    TabOrder = 6
    Visible = False
    OnClick = BitBtn6Click
  end
end
