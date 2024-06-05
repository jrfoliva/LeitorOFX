object FOFXReader: TFOFXReader
  Left = 423
  Top = 213
  Width = 782
  Height = 386
  Caption = 'Leitura de Arquivo Formato OFX'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 766
    Height = 347
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlMenu: TPanel
      Left = 0
      Top = 0
      Width = 137
      Height = 347
      Align = alLeft
      BevelOuter = bvNone
      Color = clHighlight
      TabOrder = 0
      object Panel1: TPanel
        Left = 0
        Top = 154
        Width = 137
        Height = 193
        Align = alBottom
        BevelOuter = bvNone
        Color = clHighlight
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 137
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        Color = clHighlight
        TabOrder = 1
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 137
          Height = 73
          Align = alClient
          Alignment = taCenter
          Caption = 'Menu'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
      end
      object btnSelecionarArq: TButton
        Left = 5
        Top = 74
        Width = 129
        Height = 33
        Caption = 'Selecionar Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnSelecionarArqClick
      end
      object btnImportar: TBitBtn
        Left = 4
        Top = 117
        Width = 129
        Height = 33
        Caption = 'Importar'
        Default = True
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 1
        ParentFont = False
        TabOrder = 3
        OnClick = btnImportarClick
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
        Layout = blGlyphRight
        NumGlyphs = 2
      end
    end
    object pnlPrincipal: TPanel
      Left = 137
      Top = 0
      Width = 629
      Height = 347
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 73
        Width = 629
        Height = 257
        Align = alClient
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = DBGrid1DrawColumnCell
      end
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 629
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object LHeader: TLabel
          Left = 0
          Top = 0
          Width = 629
          Height = 73
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 330
        Width = 629
        Height = 17
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.OFX'
    InitialDir = 'C:\PROJETOS\OFXREADER'
    Left = 8
    Top = 40
  end
  object DataSource1: TDataSource
    Left = 653
    Top = 34
  end
end
