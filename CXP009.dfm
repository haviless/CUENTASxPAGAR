object FActAgRet: TFActAgRet
  Left = 430
  Top = 173
  Width = 331
  Height = 227
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Actualizaci'#243'n'
  Color = 13165023
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 323
    Height = 200
    BevelOuter = bvNone
    BorderWidth = 1
    Color = 14869218
    TabOrder = 0
    object fcLabel1: TfcLabel
      Left = 10
      Top = 6
      Width = 306
      Height = 51
      AutoSize = False
      Caption = 'Actualizaci'#243'n de Agentes de Retenci'#243'n y Buenos Contribuyentes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.VAlignment = vaTop
      TextOptions.WordWrap = True
    end
    object Panel2: TPanel
      Left = 7
      Top = 57
      Width = 309
      Height = 122
      Color = 14869218
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object fcLabel2: TfcLabel
        Left = 37
        Top = 28
        Width = 232
        Height = 36
        AutoSize = False
        Caption = 'Realiz'#243' la Ultima Actualizaci'#243'n de los Archivos de la SUNAT ?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaTop
        TextOptions.WordWrap = True
      end
      object bbtnAceptar: TfcShapeBtn
        Left = 225
        Top = 84
        Width = 34
        Height = 31
        Hint = 'Actualizar Datos'
        Color = clInactiveCaptionText
        DitherColor = clWhite
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
        Options = [boFocusable]
        ParentClipping = True
        ParentShowHint = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        ShowHint = True
        TabOrder = 0
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = bbtnAceptarClick
      end
      object bbtnCancelar: TfcShapeBtn
        Left = 264
        Top = 84
        Width = 34
        Height = 31
        Hint = 'Cancelar'
        Color = clInactiveCaptionText
        DitherColor = clWhite
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          04000000000068010000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033911833333333333333333F333333333333
          0000339111833333911333333388F333333F3333000033911118333911118333
          38F38F333F88F33300003339111183911111833338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003339
          1118333911183333338F33838F338F33000033911183333391118333338FF833
          38F338F300003391183333333911133333388333338FFF830000333913333333
          3391833333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Options = [boFocusable]
        ParentClipping = True
        ParentShowHint = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        ShowHint = True
        TabOrder = 1
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = bbtnCancelarClick
      end
    end
  end
end
