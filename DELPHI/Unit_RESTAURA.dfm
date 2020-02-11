object Form_RESTAURA: TForm_RESTAURA
  Left = 0
  Top = 0
  Caption = 'Form_RESTAURA'
  ClientHeight = 79
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 104
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    Left = 32
    Top = 64
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Data Source=(local)'
    Parameters = <>
    Left = 112
    Top = 64
  end
end
