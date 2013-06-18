object FormMain: TFormMain
  Left = 299
  Top = 32
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20420#32599#26031#26041#22359#28216#25103' - RICOL'
  ClientHeight = 575
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000400E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000001E60
    0000002880000052A0000051FF003DC000007CFF400000D0FF0080002800FF00
    510080C8FF00FF80A80000000000000000000000000000000000000000002222
    2222222222222222222222222222966666666626666666666266666666629666
    6666662666666666626666666662966666666626666666666266666666629666
    6666662666666666626666666662966666666626666666666266666666629666
    6666662666666666626666666662966666666626666666666266666666629666
    6666662666666666626666666662966666666626666666666266666666629999
    999999999999999992999999999987777777777922222222240000000000A888
    8888887666666666644444444440A8888888887666666666644444444440A888
    8888887666666666644444444440A8888888887666666666644444444440A888
    8888887666666666644444444440A8888888887666666666644444444440A888
    8888887666666666644444444440A8888888887666666666644444444440A888
    888888766666666664444444444088888888887922222222254444444440A888
    8888887333333333344444444440A8888888887333333333344444444440A888
    8888887333333333344444444440A8888888887333333333344444444440A888
    8888887333333333344444444440A8888888887333333333344444444440A888
    8888887333333333344444444440A8888888887333333333344444444440A888
    8888887333333333344444444440A88888888879333333333444444444440000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 575
    Align = alClient
    BevelOuter = bvLowered
    BevelWidth = 2
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object PanelLeft: TPanel
      Left = 2
      Top = 2
      Width = 287
      Height = 571
      Align = alLeft
      BevelOuter = bvLowered
      Color = clBlack
      ParentBackground = False
      TabOrder = 0
      object PaintBoxMain: TPaintBox
        Left = 1
        Top = 1
        Width = 285
        Height = 569
        Align = alClient
        PopupMenu = PopupMenuMain
        OnPaint = PaintBoxMainPaint
      end
      object MediaPlayer1: TMediaPlayer
        Left = 24
        Top = 488
        Width = 253
        Height = 30
        Visible = False
        TabOrder = 0
      end
    end
    object PanelRight: TPanel
      Left = 289
      Top = 2
      Width = 143
      Height = 571
      Align = alClient
      BevelOuter = bvLowered
      Color = clBlack
      ParentBackground = False
      TabOrder = 1
      object PanelNext: TPanel
        Left = 1
        Top = 1
        Width = 141
        Height = 126
        Align = alTop
        BevelOuter = bvLowered
        Color = clBlack
        ParentBackground = False
        TabOrder = 0
        object PaintBoxNext: TPaintBox
          Left = 1
          Top = 1
          Width = 139
          Height = 124
          Align = alClient
          PopupMenu = PopupMenuView
          OnPaint = PaintBoxNextPaint
        end
      end
      object PanelInfo: TPanel
        Left = 1
        Top = 127
        Width = 141
        Height = 443
        Align = alClient
        BevelOuter = bvLowered
        Color = clBlack
        ParentBackground = False
        PopupMenu = PopupMenuInformation
        TabOrder = 1
        object lblDifCaption: TLabel
          Left = 22
          Top = 106
          Width = 36
          Height = 12
          Caption = #32423#21035#65306
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblDifContent: TLabel
          Left = 42
          Top = 136
          Width = 24
          Height = 12
          Caption = #20013#32423
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblCountCaption: TLabel
          Left = 22
          Top = 197
          Width = 36
          Height = 12
          Caption = #24471#20998#65306
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblCountContent: TLabel
          Left = 48
          Top = 223
          Width = 7
          Height = 12
          Caption = '0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblControlCaption: TLabel
          Left = 22
          Top = 288
          Width = 36
          Height = 12
          Caption = #25511#21046#65306
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblControlContentUp: TLabel
          Left = 30
          Top = 314
          Width = 72
          Height = 12
          Caption = #19978#38190' '#65293' '#21464#24418
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblControlContentDown: TLabel
          Left = 30
          Top = 338
          Width = 72
          Height = 12
          Caption = #19979#38190' '#65293' '#19979#33853
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblControlContentLeft: TLabel
          Left = 30
          Top = 362
          Width = 72
          Height = 12
          Caption = #24038#38190' '#65293' '#24038#31227
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblControlContentRight: TLabel
          Left = 30
          Top = 386
          Width = 72
          Height = 12
          Caption = #21491#38190' '#65293' '#21491#31227
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblControlContentReturn: TLabel
          Left = 30
          Top = 410
          Width = 72
          Height = 12
          Caption = #22238#36710' '#65293' '#26242#20572
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblModeCaption: TLabel
          Left = 22
          Top = 16
          Width = 36
          Height = 12
          Caption = #27169#24335#65306
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblModeContent: TLabel
          Left = 42
          Top = 48
          Width = 24
          Height = 12
          Caption = #21333#26426
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
      end
    end
  end
  object WinsockClient: TWinsock
    Left = 112
    Top = 24
    Width = 28
    Height = 28
    OnError = WinsockClientError
    OnDataArrival = WinsockClientDataArrival
    OnClose = WinsockClientClose
    ControlData = {
      2143341208000000E5020000E502000092D88D24000006000000000000000000
      0000000000000000}
  end
  object WinsockServer: TWinsock
    Left = 160
    Top = 24
    Width = 28
    Height = 28
    OnError = WinsockServerError
    OnDataArrival = WinsockServerDataArrival
    OnConnectionRequest = WinsockServerConnectionRequest
    OnClose = WinsockServerClose
    ControlData = {
      2143341208000000E5020000E502000092D88D24000006000000000000000000
      0000000000000000}
  end
  object MainMenu1: TMainMenu
    Left = 48
    Top = 16
    object MenuGame: TMenuItem
      Caption = #28216#25103
      object MenuGameStart: TMenuItem
        Caption = #24320#22987
        OnClick = MenuGameStartClick
      end
      object MenuGameStop: TMenuItem
        Caption = #32467#26463
        Enabled = False
        OnClick = MenuGameStopClick
      end
      object MenuGameSeperator: TMenuItem
        Caption = '-'
      end
      object MenuGameExit: TMenuItem
        Caption = #36864#20986
        OnClick = MenuGameExitClick
      end
    end
    object MenuConfig: TMenuItem
      Caption = #35774#32622
      object MenuConfigColor: TMenuItem
        Caption = #39068#33394
        object MenuMainColor: TMenuItem
          Caption = #20027#31383#21475
          object MenuColorSquare: TMenuItem
            Caption = #26041#22359
            OnClick = MenuColorSquareClick
          end
          object MenuColorBackGround: TMenuItem
            Caption = #32972#26223
            OnClick = MenuColorBackGroundClick
          end
          object MenuColorGrid: TMenuItem
            Caption = #32593#26684
            OnClick = MenuColorGridClick
          end
          object MenuColorAdd: TMenuItem
            Caption = #22686#21152#22534
            OnClick = MenuColorAddClick
          end
          object MenuColorHeap: TMenuItem
            Caption = #22266#23450#22534
            OnClick = MenuColorHeapClick
          end
          object MenuColorDefault: TMenuItem
            Caption = #40664#35748
            OnClick = MenuColorDefaultClick
          end
        end
        object MenuViewColor: TMenuItem
          Caption = #39044#35272#31383#21475
          object MenuViewSquareColor: TMenuItem
            Caption = #26041#22359
            OnClick = MenuViewSquareColorClick
          end
          object MenuViewBackGroundColor: TMenuItem
            Caption = #32972#26223
            OnClick = MenuViewBackGroundColorClick
          end
          object MenuViewGridColor: TMenuItem
            Caption = #32593#26684
            OnClick = MenuViewGridColorClick
          end
          object MenuViewColorDefault: TMenuItem
            Caption = #40664#35748
            OnClick = MenuViewColorDefaultClick
          end
        end
        object MenuInforColor: TMenuItem
          Caption = #20449#24687#31383#21475
          object MenuInforCaptionColor: TMenuItem
            Caption = #26631#39064
            OnClick = MenuInforCaptionColorClick
          end
          object MenuInforContentColor: TMenuItem
            Caption = #20869#23481
            OnClick = MenuInforContentColorClick
          end
          object MenuInforBackGroundColor: TMenuItem
            Caption = #32972#26223
            OnClick = MenuInforBackGroundColorClick
          end
          object MenuInforColorDefault: TMenuItem
            Caption = #40664#35748
            OnClick = MenuInforColorDefaultClick
          end
        end
      end
      object MenuConfigDif: TMenuItem
        Caption = #38590#24230
        object MenuDifLow: TMenuItem
          AutoCheck = True
          Caption = #21021#32423
          RadioItem = True
          OnClick = MenuDifLowClick
        end
        object MenuDifMedium: TMenuItem
          AutoCheck = True
          Caption = #20013#32423
          Checked = True
          RadioItem = True
          OnClick = MenuDifMediumClick
        end
        object MenuDifAdvance: TMenuItem
          AutoCheck = True
          Caption = #39640#32423
          RadioItem = True
          OnClick = MenuDifAdvanceClick
        end
        object MenuDifSpecial: TMenuItem
          AutoCheck = True
          Caption = #29305#32423
          RadioItem = True
          OnClick = MenuDifSpecialClick
        end
      end
      object MenuSoundEffect: TMenuItem
        Caption = #38899#25928
        object MenuSoundTransform: TMenuItem
          Caption = #21464#24418
          OnClick = MenuSoundTransformClick
        end
        object MenuSoundFall: TMenuItem
          Caption = #19979#33853
          Checked = True
          OnClick = MenuSoundFallClick
        end
        object MenuSoundWipeoff: TMenuItem
          Caption = #28040#21435
          Checked = True
          OnClick = MenuSoundWipeoffClick
        end
        object MenuSoundPoint: TMenuItem
          Caption = #25253#20998
          OnClick = MenuSoundPointClick
        end
      end
      object MenuBackGroundMusic: TMenuItem
        Caption = #32972#26223#38899#20048
        OnClick = MenuBackGroundMusicClick
      end
      object MenuConfigSeperator: TMenuItem
        Caption = '-'
      end
      object MenuAutoDif: TMenuItem
        Caption = #33258#21160#22686#21152#38590#24230
        OnClick = MenuAutoDifClick
      end
      object MenuAutoDifChange: TMenuItem
        Caption = #38590#24230#35843#33410
        Enabled = False
        object MenuAutoDifFast: TMenuItem
          AutoCheck = True
          Caption = #24555
          RadioItem = True
          OnClick = MenuAutoDifFastClick
        end
        object MenuAutoDifMedium: TMenuItem
          AutoCheck = True
          Caption = #20013
          Checked = True
          RadioItem = True
          OnClick = MenuAutoDifMediumClick
        end
        object MenuAutoDifLow: TMenuItem
          AutoCheck = True
          Caption = #24930
          RadioItem = True
          OnClick = MenuAutoDifLowClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MenuFallTime: TMenuItem
        Caption = #19979#33853#36895#24230
        object MenuFallTimeSlow: TMenuItem
          AutoCheck = True
          Caption = #24930
          Checked = True
          RadioItem = True
          OnClick = MenuFallTimeSlowClick
        end
        object MenuFallTimeQuick: TMenuItem
          AutoCheck = True
          Caption = #24555
          RadioItem = True
          OnClick = MenuFallTimeQuickClick
        end
      end
      object MenuShowGhost: TMenuItem
        Caption = #26174#31034#24433#23376
        Checked = True
        OnClick = MenuShowGhostClick
      end
    end
    object MenuNet: TMenuItem
      Caption = #32593#32476
      object MenuGameNetMode: TMenuItem
        Caption = #32593#32476#27169#24335
        OnClick = MenuGameNetModeClick
      end
      object MenuRole: TMenuItem
        Caption = #26412#26426#35282#33394
        Enabled = False
        object MenuNetServerMode: TMenuItem
          Caption = #26381#21153#22120
          object MenuServerListen: TMenuItem
            Caption = #26381#21153#22120#24320#22987#30417#21548
            OnClick = MenuServerListenClick
          end
          object MenuServerClose: TMenuItem
            Caption = #26381#21153#22120#32456#27490#30417#21548
            Enabled = False
            OnClick = MenuServerCloseClick
          end
          object N4: TMenuItem
            Caption = '-'
          end
          object MenuServerSendData: TMenuItem
            Caption = #21457#36865#25968#25454#32473#23458#25143#26426
            Enabled = False
            OnClick = MenuServerSendDataClick
          end
        end
        object MenuNetClientMode: TMenuItem
          Caption = #23458#25143#26426
          object MenuClientConnect: TMenuItem
            Caption = #36830#25509#21040#26381#21153#22120
            OnClick = MenuClientConnectClick
          end
          object MenuClientDisConnect: TMenuItem
            Caption = #20174#26381#21153#22120#26029#24320
            Enabled = False
            OnClick = MenuClientDisConnectClick
          end
          object N5: TMenuItem
            Caption = '-'
          end
          object MenuClientSendData: TMenuItem
            Caption = #21457#36865#25968#25454#32473#26381#21153#22120
            Enabled = False
            OnClick = MenuClientSendDataClick
          end
        end
        object N2: TMenuItem
          Caption = '-'
        end
        object MenuGameNetStart: TMenuItem
          Caption = #28216#25103#24320#22987
          Enabled = False
          OnClick = MenuGameNetStartClick
        end
        object MenuGameNetStop: TMenuItem
          Caption = #28216#25103#32467#26463
          Enabled = False
          OnClick = MenuGameNetStopClick
        end
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MenuWinSockMsg: TMenuItem
        Caption = #36890#35759#25511#20214#20449#24687
        Enabled = False
        OnClick = MenuWinSockMsgClick
      end
    end
    object MenuHelp: TMenuItem
      Caption = #24110#21161
      object MenuHelpAbout: TMenuItem
        Caption = #20851#20110
        OnClick = MenuHelpAboutClick
      end
    end
  end
  object TimerSquareMove: TTimer
    Enabled = False
    Interval = 400
    OnTimer = TimerSquareMoveTimer
    Left = 48
    Top = 160
  end
  object TimerAutoAddDifficulty: TTimer
    Enabled = False
    Interval = 20000
    OnTimer = TimerAutoAddDifficultyTimer
    Left = 48
    Top = 88
  end
  object ColorDialog1: TColorDialog
    Left = 48
    Top = 320
  end
  object TimerShowWinsockState: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerShowWinsockStateTimer
    Left = 48
    Top = 224
  end
  object PopupMenuInformation: TPopupMenu
    Left = 120
    Top = 96
    object PopupMenuCaption: TMenuItem
      Caption = #26631#39064
      OnClick = PopupMenuCaptionClick
    end
    object PopupMenuContent: TMenuItem
      Caption = #20869#23481
      OnClick = PopupMenuContentClick
    end
    object PopupMenuBackGround: TMenuItem
      Caption = #32972#26223
      OnClick = PopupMenuBackGroundClick
    end
    object PopupMenuInformationColorDefault: TMenuItem
      Caption = #40664#35748
      OnClick = PopupMenuInformationColorDefaultClick
    end
  end
  object PopupMenuMain: TPopupMenu
    Left = 176
    Top = 96
    object PopupMenuMainColorSquare: TMenuItem
      Caption = #26041#22359
      OnClick = PopupMenuMainColorSquareClick
    end
    object PopupMenuMainColorBackGround: TMenuItem
      Caption = #32972#26223
      OnClick = PopupMenuMainColorBackGroundClick
    end
    object PopupMenuMainColorGrid: TMenuItem
      Caption = #32593#26684
      OnClick = PopupMenuMainColorGridClick
    end
    object PopupMenuMainColorAdd: TMenuItem
      Caption = #22686#21152#22534
      OnClick = PopupMenuMainColorAddClick
    end
    object PopupMenuMainColorHeap: TMenuItem
      Caption = #22266#23450#22534
      OnClick = PopupMenuMainColorHeapClick
    end
    object PopupMenuMainColorDefault: TMenuItem
      Caption = #40664#35748
      OnClick = PopupMenuMainColorDefaultClick
    end
  end
  object PopupMenuView: TPopupMenu
    Left = 232
    Top = 96
    object PopupMenuViewColorSquare: TMenuItem
      Caption = #26041#22359
      OnClick = PopupMenuViewColorSquareClick
    end
    object PopupMenuViewColorBackGround: TMenuItem
      Caption = #32972#26223
      OnClick = PopupMenuViewColorBackGroundClick
    end
    object PopupMenuViewColorGrid: TMenuItem
      Caption = #32593#26684
      OnClick = PopupMenuViewColorGridClick
    end
    object PopupMenuViewColorDefault: TMenuItem
      Caption = #40664#35748
      OnClick = PopupMenuViewColorDefaultClick
    end
  end
  object TimerPlayGuard: TTimer
    Interval = 5000
    OnTimer = TimerPlayGuardTimer
    Left = 50
    Top = 274
  end
end
