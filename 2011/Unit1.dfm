object Form1: TForm1
  Left = 420
  Top = 282
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Janela M'#225'gica'
  ClientHeight = 272
  ClientWidth = 319
  Color = clBtnFace
  Constraints.MaxHeight = 310
  Constraints.MinHeight = 305
  Constraints.MinWidth = 320
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    319
    272)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 48
    Width = 108
    Height = 13
    Caption = 'N'#237'vel de transpar'#234'ncia'
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 80
    Height = 13
    Caption = 'Handle da janela'
  end
  object SpeedButton1: TSpeedButton
    Left = 120
    Top = 24
    Width = 57
    Height = 22
    Anchors = [akTop, akRight]
    Caption = 'Esconder'
    Enabled = False
    Flat = True
    OnClick = SpeedButton1Click
    ExplicitLeft = 136
  end
  object SpeedButton2: TSpeedButton
    Left = 184
    Top = 24
    Width = 57
    Height = 22
    Anchors = [akTop, akRight]
    Caption = 'Mostrar'
    Enabled = False
    Flat = True
    OnClick = SpeedButton2Click
    ExplicitLeft = 200
  end
  object Label9: TLabel
    Left = 256
    Top = 254
    Width = 34
    Height = 13
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    Caption = 'Sobre'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = Label9Click
    ExplicitLeft = 272
  end
  object SpeedButton4: TSpeedButton
    Left = 248
    Top = 24
    Width = 49
    Height = 22
    Anchors = [akTop, akRight]
    Caption = 'Fechar'
    Enabled = False
    Flat = True
    OnClick = SpeedButton4Click
    ExplicitLeft = 264
  end
  object TrackBar1: TTrackBar
    Left = 8
    Top = 64
    Width = 137
    Height = 18
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    Max = 255
    Position = 255
    TabOrder = 1
    OnChange = TrackBar1Change
  end
  object Edit1: TEdit
    Left = 16
    Top = 24
    Width = 97
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyPress = Edit1KeyPress
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 96
    Width = 281
    Height = 73
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Cursor do mouse'
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 18
      Width = 37
      Height = 13
      Caption = 'Handle:'
    end
    object Label4: TLabel
      Left = 16
      Top = 37
      Width = 34
      Height = 13
      Caption = 'Classe:'
    end
    object Label5: TLabel
      Left = 16
      Top = 56
      Width = 31
      Height = 13
      Caption = 'T'#237'tulo:'
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 176
    Width = 281
    Height = 72
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Handle selecionado'
    TabOrder = 3
    object Label6: TLabel
      Left = 16
      Top = 18
      Width = 37
      Height = 13
      Caption = 'Handle:'
    end
    object Label7: TLabel
      Left = 16
      Top = 37
      Width = 34
      Height = 13
      Caption = 'Classe:'
    end
    object Label8: TLabel
      Left = 16
      Top = 56
      Width = 31
      Height = 13
      Caption = 'T'#237'tulo:'
    end
  end
  object GroupBox3: TGroupBox
    Left = 152
    Top = 48
    Width = 145
    Height = 41
    Anchors = [akTop, akRight]
    Caption = 'Enviar tecla'
    TabOrder = 4
    object SpeedButton3: TSpeedButton
      Left = 48
      Top = 16
      Width = 89
      Height = 22
      Caption = 'Enviar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333FF3333333333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333003333
        3333333333773333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButton3Click
    end
    object Edit2: TEdit
      Left = 16
      Top = 16
      Width = 25
      Height = 21
      Color = clSilver
      Enabled = False
      MaxLength = 1
      TabOrder = 0
      OnKeyDown = Edit2KeyDown
    end
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 252
    Width = 137
    Height = 17
    Caption = 'For'#231'ar programa a frente'
    Checked = True
    State = cbChecked
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 72
    Top = 8
  end
end
