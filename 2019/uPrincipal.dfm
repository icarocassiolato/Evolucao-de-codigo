object FrmPrincipal: TFrmPrincipal
  Left = 415
  Top = 191
  Width = 308
  Height = 468
  Caption = 'Janela M'#225'gica'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    300
    437)
  PixelsPerInch = 96
  TextHeight = 13
  object LblSobre: TLabel
    Left = 237
    Top = 416
    Width = 38
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Sobre'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = LblSobreClick
  end
  object LblTutorial: TLabel
    Left = 173
    Top = 416
    Width = 49
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Tutorial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = LblTutorialClick
  end
  object GbxCursor: TGroupBox
    Left = 0
    Top = 0
    Width = 300
    Height = 121
    Align = alTop
    Caption = 'Cursor'
    TabOrder = 0
    DesignSize = (
      300
      121)
    object ImgCursorIcone: TImage
      Left = 256
      Top = 16
      Width = 32
      Height = 32
    end
    object MmoCursor: TMemo
      Left = 15
      Top = 16
      Width = 234
      Height = 97
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ScrollBars = ssHorizontal
      TabOrder = 0
      OnKeyPress = OnKeyPressGenerico
    end
  end
  object GbxSelecionado: TGroupBox
    Left = 0
    Top = 121
    Width = 300
    Height = 120
    Align = alTop
    Caption = 'Selecionado'
    TabOrder = 1
    DesignSize = (
      300
      120)
    object ImgSelecionadoIcone: TImage
      Left = 256
      Top = 16
      Width = 32
      Height = 32
    end
    object MmoSelecionado: TMemo
      Left = 15
      Top = 16
      Width = 234
      Height = 97
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ScrollBars = ssHorizontal
      TabOrder = 0
      OnKeyPress = OnKeyPressGenerico
    end
  end
  object GbxAcoes: TGroupBox
    Left = 0
    Top = 241
    Width = 300
    Height = 168
    Align = alTop
    Caption = 'A'#231#245'es com o objeto'
    TabOrder = 2
    DesignSize = (
      300
      168)
    object BtnOcultar: TSpeedButton
      Left = 15
      Top = 29
      Width = 81
      Height = 22
      Caption = 'Ocultar'
      OnClick = BtnOcultarClick
    end
    object BtnMostrar: TSpeedButton
      Left = 111
      Top = 29
      Width = 81
      Height = 22
      Caption = 'Mostrar'
      OnClick = BtnMostrarClick
    end
    object LblTransparencia: TLabel
      Left = 21
      Top = 57
      Width = 68
      Height = 13
      Caption = 'Transpar'#234'ncia'
    end
    object BtnFechar: TSpeedButton
      Left = 207
      Top = 29
      Width = 81
      Height = 22
      Caption = 'Fechar'
      OnClick = BtnFecharClick
    end
    object TbrTransparencia: TTrackBar
      Left = 12
      Top = 75
      Width = 277
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Max = 255
      Position = 255
      TabOrder = 0
      TickMarks = tmBoth
      TickStyle = tsNone
      OnChange = TbrTransparenciaChange
    end
    object GbxEnviarTecla: TGroupBox
      Left = 15
      Top = 105
      Width = 170
      Height = 56
      Caption = 'Enviar tecla'
      TabOrder = 1
      object BtnEnviarTecla: TSpeedButton
        Left = 72
        Top = 24
        Width = 81
        Height = 22
        Caption = 'Enviar'
        OnClick = BtnEnviarTeclaClick
      end
      object EdtTecla: TEdit
        Left = 14
        Top = 24
        Width = 43
        Height = 21
        MaxLength = 1
        TabOrder = 0
        OnKeyPress = EdtTeclaKeyPress
      end
    end
  end
  object ChkSempreFrente: TCheckBox
    Left = 8
    Top = 415
    Width = 97
    Height = 17
    Caption = 'Sempre '#224' frente'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = ChkSempreFrenteClick
  end
  object TmrAtualizacao: TTimer
    Interval = 100
    OnTimer = TmrAtualizacaoTimer
    Left = 80
    Top = 32
  end
end
