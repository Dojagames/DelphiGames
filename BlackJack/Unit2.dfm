object Form2: TForm2
  Left = 902
  Top = 363
  Width = 443
  Height = 318
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 427
    Height = 46
    Align = alTop
    Alignment = taCenter
    Caption = 'Dealer:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 0
    Top = 48
    Width = 78
    Height = 32
    Caption = 'Cards:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 0
    Top = 102
    Width = 82
    Height = 46
    Align = alCustom
    Alignment = taCenter
    Caption = 'You:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 0
    Top = 152
    Width = 78
    Height = 32
    Caption = 'Cards:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 307
    Top = 59
    Width = 31
    Height = 13
    Caption = 'Count:'
  end
  object D_Count_Text: TLabel
    Left = 339
    Top = 59
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label5: TLabel
    Left = 308
    Top = 163
    Width = 31
    Height = 13
    Caption = 'Count:'
  end
  object Count_Text: TLabel
    Left = 340
    Top = 163
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Button1: TButton
    Left = -1
    Top = 245
    Width = 218
    Height = 33
    Caption = 'Hit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 245
    Width = 209
    Height = 33
    Caption = 'Stay'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Player_Cards: TStringGrid
    Left = 86
    Top = 157
    Width = 210
    Height = 25
    BorderStyle = bsNone
    ColCount = 2
    DefaultColWidth = 20
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 2
  end
  object Dealer_Cards: TStringGrid
    Left = 86
    Top = 53
    Width = 210
    Height = 25
    BorderStyle = bsNone
    ColCount = 2
    DefaultColWidth = 20
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 3
  end
  object Button3: TButton
    Left = -1
    Top = 246
    Width = 426
    Height = 33
    Caption = 'Play Again'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button3Click
  end
end
