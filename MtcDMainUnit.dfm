object MainMtcGeoForm: TMainMtcGeoForm
  Left = 347
  Top = 113
  Caption = 'Grafik Test'
  ClientHeight = 941
  ClientWidth = 1161
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 249
    Top = 0
    Width = 8
    Height = 922
    Beveled = True
    ExplicitHeight = 927
  end
  object PaintPanel: TPanel
    Left = 257
    Top = 0
    Width = 904
    Height = 922
    Align = alClient
    TabOrder = 0
    object PaintBox: TPaintBox
      Left = 1
      Top = 1
      Width = 902
      Height = 920
      Align = alClient
      OnPaint = PaintBoxPaint
      ExplicitLeft = -3
      ExplicitTop = -127
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 922
    Width = 1161
    Height = 19
    Panels = <>
  end
  object ControlPanel: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 922
    Align = alLeft
    TabOrder = 2
    object OptionsPanel: TPanel
      Left = 1
      Top = 880
      Width = 247
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      object RefreshButton: TButton
        Left = 86
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Yenile'
        TabOrder = 0
        OnClick = RefreshButtonClick
      end
    end
    object MainPageControl: TPageControl
      Left = 1
      Top = 1
      Width = 247
      Height = 879
      ActivePage = BasicFunctionsTabSheet
      Align = alClient
      TabOrder = 1
      object BasicFunctionsTabSheet: TTabSheet
        Caption = 'Basic Functions'
        ImageIndex = 1
        object BFGroup: TRadioGroup
          Left = 0
          Top = 0
          Width = 239
          Height = 851
          Align = alClient
          TabOrder = 0
          OnClick = BFGroupClick
        end
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 344
    Top = 32
    object MenuItem_File: TMenuItem
      Caption = 'File'
      object MenuItem_Exit: TMenuItem
        Caption = 'Exit'
      end
    end
  end
end
