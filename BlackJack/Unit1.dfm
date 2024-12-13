object Form1: TForm1
  Left = 987
  Top = 395
  Width = 305
  Height = 218
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 289
    Height = 46
    Align = alTop
    Alignment = taCenter
    Caption = 'BlackJack'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btn_start: TButton
    Left = 0
    Top = 60
    Width = 289
    Height = 57
    Caption = 'Start'
    TabOrder = 0
    OnClick = btn_startClick
  end
  object btn_exit: TButton
    Left = -1
    Top = 137
    Width = 290
    Height = 41
    Caption = 'Exit'
    TabOrder = 1
    OnClick = btn_exitClick
  end
end
