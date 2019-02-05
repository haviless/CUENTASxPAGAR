object FEscogeCia: TFEscogeCia
  Left = 302
  Top = 168
  Width = 263
  Height = 134
  Caption = 'Escoger Compa'#241'ia'
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCia: TLabel
    Left = 22
    Top = 13
    Width = 50
    Height = 13
    Caption = '&Compa'#241'ia:'
  end
  object dblcCia: TwwDBLookupCombo
    Left = 20
    Top = 28
    Width = 40
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'ID'#9'F'
      'CIADES'#9'40'#9'Compa'#241'ia'#9'F')
    LookupTable = DMCXP.cdsCia
    LookupField = 'CIAID'
    Options = [loColLines, loTitles]
    Style = csDropDownList
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    UseTFields = False
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcCiaExit
  end
  object edtCia: TEdit
    Left = 64
    Top = 28
    Width = 173
    Height = 21
    TabOrder = 1
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 66
    Width = 255
    Height = 41
    Align = alBottom
    Color = 10207162
    TabOrder = 2
    object btnAceptar: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 161
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
