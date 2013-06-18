unit UnitMain;

interface

uses
  Windows, Messages, Controls, Classes, Dialogs, SysUtils, Variants, Forms,
  ExtCtrls,
  Menus, StdCtrls, MMSystem, MSWinsockLib_TLB, OleCtrls, UnitCommon, UnitData,
  SyncObjs,
  MPlayer;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    MenuGame: TMenuItem;
    MenuConfig: TMenuItem;
    MenuHelp: TMenuItem;
    MenuHelpAbout: TMenuItem;
    MenuGameStart: TMenuItem;
    MenuGameStop: TMenuItem;
    MenuGameSeperator: TMenuItem;
    MenuGameExit: TMenuItem;
    MenuConfigColor: TMenuItem;
    PanelMain: TPanel;
    TimerSquareMove: TTimer;
    MenuConfigDif: TMenuItem;
    MenuDifLow: TMenuItem;
    MenuDifMedium: TMenuItem;
    MenuDifAdvance: TMenuItem;
    MenuDifSpecial: TMenuItem;
    PanelLeft: TPanel;
    PanelRight: TPanel;
    PaintBoxMain: TPaintBox;
    PanelNext: TPanel;
    PaintBoxNext: TPaintBox;
    MenuAutoDif: TMenuItem;
    TimerAutoAddDifficulty: TTimer;
    PanelInfo: TPanel;
    lblDifCaption: TLabel;
    lblDifContent: TLabel;
    lblCountCaption: TLabel;
    lblCountContent: TLabel;
    lblControlCaption: TLabel;
    lblControlContentUp: TLabel;
    lblControlContentDown: TLabel;
    lblControlContentLeft: TLabel;
    lblControlContentRight: TLabel;
    lblControlContentReturn: TLabel;
    MenuConfigSeperator: TMenuItem;
    MenuAutoDifChange: TMenuItem;
    MenuAutoDifFast: TMenuItem;
    MenuAutoDifMedium: TMenuItem;
    MenuAutoDifLow: TMenuItem;
    lblModeCaption: TLabel;
    lblModeContent: TLabel;
    MenuNet: TMenuItem;
    MenuServerListen: TMenuItem;
    MenuClientConnect: TMenuItem;
    MenuWinSockMsg: TMenuItem;
    MenuNetServerMode: TMenuItem;
    MenuNetClientMode: TMenuItem;
    MenuServerClose: TMenuItem;
    MenuClientDisConnect: TMenuItem;
    MenuColorSquare: TMenuItem;
    MenuColorBackGround: TMenuItem;
    MenuColorHeap: TMenuItem;
    MenuColorAdd: TMenuItem;
    ColorDialog1: TColorDialog;
    N1: TMenuItem;
    MenuSoundEffect: TMenuItem;
    MenuRole: TMenuItem;
    MenuFallTime: TMenuItem;
    MenuFallTimeSlow: TMenuItem;
    MenuFallTimeQuick: TMenuItem;
    MenuSoundTransform: TMenuItem;
    MenuSoundFall: TMenuItem;
    MenuSoundWipeoff: TMenuItem;
    MenuSoundPoint: TMenuItem;
    MenuServerSendData: TMenuItem;
    MenuGameNetStart: TMenuItem;
    MenuGameNetStop: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    MenuClientSendData: TMenuItem;
    N5: TMenuItem;
    MenuGameNetMode: TMenuItem;
    TimerShowWinsockState: TTimer;
    MenuColorGrid: TMenuItem;
    PopupMenuInformation: TPopupMenu;
    PopupMenuCaption: TMenuItem;
    PopupMenuBackGround: TMenuItem;
    PopupMenuContent: TMenuItem;
    PopupMenuMain: TPopupMenu;
    PopupMenuView: TPopupMenu;
    PopupMenuMainColorSquare: TMenuItem;
    PopupMenuMainColorBackGround: TMenuItem;
    PopupMenuMainColorGrid: TMenuItem;
    PopupMenuMainColorAdd: TMenuItem;
    PopupMenuMainColorHeap: TMenuItem;
    PopupMenuViewColorSquare: TMenuItem;
    PopupMenuViewColorBackGround: TMenuItem;
    PopupMenuViewColorGrid: TMenuItem;
    PopupMenuInformationColorDefault: TMenuItem;
    PopupMenuMainColorDefault: TMenuItem;
    PopupMenuViewColorDefault: TMenuItem;
    MenuColorDefault: TMenuItem;
    MenuMainColor: TMenuItem;
    MenuViewColor: TMenuItem;
    MenuInforColor: TMenuItem;
    MenuViewSquareColor: TMenuItem;
    MenuViewBackGroundColor: TMenuItem;
    MenuViewGridColor: TMenuItem;
    MenuViewColorDefault: TMenuItem;
    MenuInforCaptionColor: TMenuItem;
    MenuInforContentColor: TMenuItem;
    MenuInforColorDefault: TMenuItem;
    MenuInforBackGroundColor: TMenuItem;
    MenuShowGhost: TMenuItem;
    WinsockClient: TWinsock;
    WinsockServer: TWinsock;
    TimerPlayGuard: TTimer;
    MediaPlayer1: TMediaPlayer;
    MenuBackGroundMusic: TMenuItem;
    procedure MenuGameExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBoxMainPaint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuGameStartClick(Sender: TObject);
    procedure MenuGameStopClick(Sender: TObject);
    procedure TimerSquareMoveTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MenuDifLowClick(Sender: TObject);
    procedure MenuDifMediumClick(Sender: TObject);
    procedure MenuDifAdvanceClick(Sender: TObject);
    procedure MenuDifSpecialClick(Sender: TObject);
    procedure PaintBoxNextPaint(Sender: TObject);
    procedure MenuAutoDifClick(Sender: TObject);
    procedure TimerAutoAddDifficultyTimer(Sender: TObject);
    procedure MenuAutoDifFastClick(Sender: TObject);
    procedure MenuAutoDifMediumClick(Sender: TObject);
    procedure MenuAutoDifLowClick(Sender: TObject);
    procedure MenuColorSquareClick(Sender: TObject);
    procedure MenuColorBackGroundClick(Sender: TObject);
    procedure MenuColorHeapClick(Sender: TObject);
    procedure MenuColorAddClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuFallTimeSlowClick(Sender: TObject);
    procedure MenuFallTimeQuickClick(Sender: TObject);
    procedure MenuSoundTransformClick(Sender: TObject);
    procedure MenuSoundFallClick(Sender: TObject);
    procedure MenuSoundWipeoffClick(Sender: TObject);
    procedure MenuSoundPointClick(Sender: TObject);
    procedure MenuServerListenClick(Sender: TObject);
    procedure MenuServerCloseClick(Sender: TObject);
    procedure MenuClientConnectClick(Sender: TObject);
    procedure MenuClientDisConnectClick(Sender: TObject);
    procedure WinsockClientClose(Sender: TObject);
    procedure WinsockClientDataArrival(ASender: TObject;
      bytesTotal: Integer);
    procedure WinsockServerClose(Sender: TObject);
    procedure WinsockServerConnectionRequest(ASender: TObject;
      requestID: Integer);
    procedure WinsockServerDataArrival(ASender: TObject;
      bytesTotal: Integer);
    procedure MenuWinSockMsgClick(Sender: TObject);
    procedure MenuServerSendDataClick(Sender: TObject);
    procedure MenuClientSendDataClick(Sender: TObject);
    procedure WinsockClientError(ASender: TObject; Number: SmallInt;
      var Description: WideString; Scode: Integer; const Source,
      HelpFile: WideString; HelpContext: Integer;
      var CancelDisplay: WordBool);
    procedure WinsockServerError(ASender: TObject; Number: SmallInt;
      var Description: WideString; Scode: Integer; const Source,
      HelpFile: WideString; HelpContext: Integer;
      var CancelDisplay: WordBool);
    procedure MenuGameNetModeClick(Sender: TObject);
    procedure MenuGameNetStartClick(Sender: TObject);
    procedure MenuGameNetStopClick(Sender: TObject);
    procedure TimerShowWinsockStateTimer(Sender: TObject);
    procedure MenuColorGridClick(Sender: TObject);
    procedure PopupMenuCaptionClick(Sender: TObject);
    procedure PopupMenuContentClick(Sender: TObject);
    procedure PopupMenuBackGroundClick(Sender: TObject);
    procedure PopupMenuInformationColorDefaultClick(Sender: TObject);
    procedure PopupMenuViewColorSquareClick(Sender: TObject);
    procedure PopupMenuViewColorBackGroundClick(Sender: TObject);
    procedure PopupMenuViewColorGridClick(Sender: TObject);
    procedure PopupMenuViewColorDefaultClick(Sender: TObject);
    procedure PopupMenuMainColorSquareClick(Sender: TObject);
    procedure PopupMenuMainColorBackGroundClick(Sender: TObject);
    procedure PopupMenuMainColorGridClick(Sender: TObject);
    procedure PopupMenuMainColorAddClick(Sender: TObject);
    procedure PopupMenuMainColorHeapClick(Sender: TObject);
    procedure PopupMenuMainColorDefaultClick(Sender: TObject);
    procedure MenuColorDefaultClick(Sender: TObject);
    procedure MenuViewSquareColorClick(Sender: TObject);
    procedure MenuViewBackGroundColorClick(Sender: TObject);
    procedure MenuViewGridColorClick(Sender: TObject);
    procedure MenuViewColorDefaultClick(Sender: TObject);
    procedure MenuInforCaptionColorClick(Sender: TObject);
    procedure MenuInforContentColorClick(Sender: TObject);
    procedure MenuInforBackGroundColorClick(Sender: TObject);
    procedure MenuInforColorDefaultClick(Sender: TObject);
    procedure MenuShowGhostClick(Sender: TObject);
    procedure TimerPlayGuardTimer(Sender: TObject);
    procedure MenuBackGroundMusicClick(Sender: TObject);
    procedure MenuHelpAboutClick(Sender: TObject);
  private
    bSquare, bAutoDif, bGameRunning, bGameStart, bConnected, bNetGameRunning,
      bShowGhost,
      bNetGameOtherRunning, bSoundTransform, bSoundFall, bSoundPoint,
      bSoundWipeoff: boolean;
    GInterval, GCount, GTimeAddDif, GAddDifNum, GFallTime: integer;
    GHandle: DWORD;
    GameMode: TMode;
    procedure DrawBackGround(); //���Ʊ���
    procedure DrawSquare(tmpSquare: TSquareType; tmpPenColor,
      tmpBrushColor: TColor); //���������еķ���
    procedure DrawSquareArray(tmpSquare: TSquareArray); //���������еķ���
    procedure DrawBottomArray(tmpData: TDataArray); //���Ƶײ������
    procedure DrawBlank(tmpData: TDataArray); //��������û�з��������
    procedure SelfChange(); //���ڴ�С������Ϸ��С����
    procedure EraseOldSquare(tmpOldSquare: TSquareArray); //��ȥ�ɷ���
    procedure ShowNextSquare(tmpNextSquare: TSquareType; tmpPenColor,
      tmpBrushColor:
      TColor); //���Ʒ���
    procedure ShowNextSquareArray(var tmpNextSquare: TSquareArray);
    //������һ������
    function GetCount(tmpCount: integer): integer; //������ȥ��������Ӧ�õķ���
    procedure ShowNextBackGround(); //����Ԥ�������еı���
    procedure HideNowSquare(tmpSquare: TSquareArray); //���ص�ǰ����
    procedure AddSomeToBottom(var tmpData: TDataArray; num: integer);
    //�������δ����
    procedure MoveNowSquareToBottomDirectly
      (var tmpSquare: TSquareArray; tmpData: TDataArray); //��ǰ�������䴦��
    procedure InitWinsockServer(); //��ʼ��������WinsockActiveX�ؼ�
    procedure InitWinsockClient(); //��ʼ���ͻ���WinsockActiveX�ؼ�
    procedure SetGameMode(tmp: TMode); //������Ϸģʽ
    procedure SendCommand(tmp: string); //���ݵ�ǰ��ɫ��Է���������
    function GetWinsockState(tmpState: cardinal): string;
    procedure CreateGhostSquare(tmpGhostSquare: TSquareArray); //����Ӱ�ӷ���
    procedure ShowGhostSquare(tmpGhostSquare: TSquareArray; flag: boolean);
    //��ʾӰ�ӷ���
    procedure ProcessMessage_MESSAGE_SOUND(var tmpMessage: TMessage); message MESSAGE_SOUND;
  { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses UnitAbout, UnitThreadSoundRelease;

{$R *.dfm}

var
  GCriticalSection: TCriticalSection;
  GThread: TThreadSoundRelease;

function IsNum(tmpC: Char): boolean;
begin
  try
    StrToInt(tmpC);
    result := true;
  except
    result := false;
  end;
end;

function IsNumber(tmp: string): boolean;
var
  i, len: integer;
begin
  len := Length(tmp);
  result := true;
  for i := 1 to len do
  begin
    if not IsNum(tmp[i]) then
    begin
      result := false;
      exit;
    end;
  end;
end;

function ShowCount(p: Pointer): integer; stdcall;
var
  i, tmp: integer;
begin
  GCriticalSection.Acquire;
  try
    try
      tmp := StrToInt(FormMain.lblCountContent.Caption);
      for i := tmp to FormMain.GCount do
      begin
        FormMain.lblCountContent.Caption := IntToStr(i);
        Sleep(SLEEPTIME);
      end;
      FormMain.lblCountContent.Repaint;
    except
      Beep;
    end;
  finally
    GCriticalSection.Release;
  end;
  result := 0;
end;

function StringToOleVariant(tmpS: string): OleVariant;
var
  tmpP: pointer;
  tmpSize: integer;
begin
  tmpSize := Length(tmpS);
  result := VarArrayCreate([0, 2 * tmpSize - 1], varByte);
  tmpP := VarArrayLock(result);
  try
    Move((PChar(tmpS))^, (PChar(tmpP))^, 2 * tmpSize);
  finally
    VarArrayUnLock(result);
  end;
end;

function PlayCount(p: Pointer): integer; stdcall;
var
  tmpCount, tmpBai, tmpShi, tmpGe: integer;
begin
  tmpCount := FormMain.GCount;
  tmpGe := tmpCount mod 10;
  tmpShi := ((tmpCount - tmpGe) mod 100) div 10;
  tmpBai := ((tmpCount - tmpShi * 10 - tmpGe) mod 1000) div 100;
  if (tmpBai = 0) and (tmpShi = 0) and (tmpGe = 0) then
    PlaySound(PChar('Wave' + IntToStr(tmpGe)), hInstance, SND_SYNC or
      SND_RESOURCE)
  else if (tmpBai = 0) and (tmpShi = 0) and (tmpGe <> 0) then
    PlaySound(PChar('Wave' + IntToStr(tmpGe)), hInstance, SND_SYNC or
      SND_RESOURCE)
  else if (tmpBai = 0) and (tmpShi <> 0) and (tmpGe = 0) then
  begin
    PlaySound(PChar('Wave' + IntToStr(tmpShi)), hInstance, SND_SYNC or
      SND_RESOURCE);
    PlaySound(PChar('WaveShi'), hInstance, SND_SYNC or SND_RESOURCE);
  end
  else if (tmpBai = 0) and (tmpShi <> 0) and (tmpGe <> 0) then
  begin
    PlaySound(PChar('Wave' + IntToStr(tmpShi)), hInstance, SND_SYNC or
      SND_RESOURCE);
    PlaySound(PChar('WaveShi'), hInstance, SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('Wave' + IntToStr(tmpGe)), hInstance, SND_SYNC or
      SND_RESOURCE);
  end
  else if (tmpBai <> 0) and (tmpShi = 0) and (tmpGe = 0) then
  begin
    PlaySound(PChar('Wave' + IntToStr(tmpBai)), hInstance, SND_SYNC or
      SND_RESOURCE);
    PlaySound(PChar('WaveBai'), hInstance, SND_SYNC or SND_RESOURCE);
  end
  else if (tmpBai <> 0) and (tmpShi = 0) and (tmpGe <> 0) then
  begin
    PlaySound(PChar('Wave' + IntToStr(tmpBai)), hInstance, SND_SYNC or
      SND_RESOURCE);
    PlaySound(PChar('WaveBai'), hInstance, SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('Wave0'), hInstance, SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('Wave' + IntToStr(tmpGe)), hInstance, SND_SYNC or
      SND_RESOURCE);
  end
  else if (tmpBai <> 0) and (tmpShi <> 0) and (tmpGe = 0) then
  begin
    PlaySound(PChar('Wave' + IntToStr(tmpBai)), hInstance, SND_SYNC or
      SND_RESOURCE);
    PlaySound(PChar('WaveBai'), hInstance, SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('Wave' + IntToStr(tmpShi)), hInstance, SND_SYNC or
      SND_RESOURCE);
    PlaySound(PChar('WaveShi'), hInstance, SND_SYNC or SND_RESOURCE);
  end
  else if (tmpBai <> 0) and (tmpShi <> 0) and (tmpGe <> 0) then
  begin
    PlaySound(PChar('Wave' + IntToStr(tmpBai)), hInstance, SND_SYNC or
      SND_RESOURCE);
    PlaySound(PChar('WaveBai'), hInstance, SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('Wave' + IntToStr(tmpShi)), hInstance, SND_SYNC or
      SND_RESOURCE);
    PlaySound(PChar('WaveShi'), hInstance, SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('Wave' + IntToStr(tmpGe)), hInstance, SND_SYNC or
      SND_RESOURCE);
  end;
  PlaySound(PChar('WaveFen'), hInstance, SND_SYNC or SND_RESOURCE);
  result := 0;
end;

procedure TFormMain.AddSomeToBottom(var tmpData: TDataArray; num: integer);
var
  i, j: integer;
begin
  for i := 0 to MAX_X - 1 do
    for j := 0 to MAX_Y - 1 - num do
    begin
      tmpData[i, j].SquareType := tmpData[i, j + num].SquareType;
      tmpData[i, j].Pos := tmpData[i, j + num].Pos;
      tmpData[i, j].Color := tmpData[i, j + num].Color;
    end;
  for j := MAX_Y - 1 - num + 1 to MAX_Y - 1 do
  begin
    for i := 0 to MAX_X - 1 do
    begin
      tmpData[i, j].SquareType := GetRandomType();
      tmpData[i, j].Color := GOtherColor;
    end;
  end;
end;

procedure TFormMain.CreateGhostSquare(tmpGhostSquare: TSquareArray);
var
  i, j: Integer;
begin
  if not bSquare then
    Exit;
  SquareArrayCopyTo(GNowSquare, GGhostSquare);
  while not TouchBottom(GGhostSquare, Data) do
  begin
    for i := 0 to MAX - 1 do
      for j := 0 to MAX - 1 do
        inc(GGhostSquare[i, j].Pos.j);
  end;
end;

procedure TFormMain.DrawBackGround();
begin
  with PaintBoxMain do
  begin
    Canvas.Pen.Color := GBackGroundColor;
    Canvas.Pen.Width := 1;
    Canvas.Brush.Color := GBackGroundColor;
    Canvas.Rectangle(0, 0, Width - 1, Height - 1);
  end;
end;

procedure TFormMain.DrawBlank(tmpData: TDataArray);
var
  i, j, tmpX, tmpY: integer;
begin
  for i := 0 to MAX_X - 1 do
    for j := 0 to MAX_Y - 1 do
      with PaintBoxMain do
      begin
        if tmpData[i, j].SquareType = BLANK then
        begin
          tmpX := IToX(i);
          tmpY := JToY(j);
          Canvas.Pen.Color := GBlankColor;
          Canvas.Pen.Width := 1;
          Canvas.Brush.Color := GBlankColor;
          Canvas.Rectangle(tmpX, tmpY, tmpX + LENX, tmpY + LENY);
        end;
      end;
end;

procedure TFormMain.EraseOldSquare(tmpOldSquare: TSquareArray);
var
  i, j, tmpI, tmpJ, PosX, PosY: integer;
begin
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if tmpOldSquare[i, j].SquareType = SQUARE then
      begin
        tmpI := tmpOldSquare[i, j].Pos.i;
        tmpJ := tmpOldSquare[i, j].Pos.j;
        PosX := IToX(tmpI);
        PosY := JToY(tmpJ);
        with PaintBoxMain do
        begin
          Canvas.Pen.Color := GBlankColor;
          Canvas.Pen.Width := 1;
          Canvas.Brush.Color := GBlankColor;
          Canvas.Rectangle(PosX, PosY, PosX + LENX, PosY + LENY);
        end;
      end;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GCriticalSection.Free;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  GInterval := 400;
  GTimeAddDif := 20000;
  GAddDifNum := 1;
  GCount := 0;
  GFallTime := 10;
  GHeapColor := clBlue;
  GBackGroundColor := RGB(0, 0, 64);
  GSquareColor := clRed;
  GOtherColor := clYellow;
  GBlankColor := RGB(0, 0, 64);
  GViewSquareColor := clRed;
  GViewBlankColor := RGB(0, 0, 64);
  GViewBackGroundColor := RGB(0, 0, 64);
  GInforCaptionColor := clLime;
  GInforContentColor := clLime;
  GInforBackGround := RGB(0, 0, 64);
  PanelInfo.Color := GInforBackGround;
  bSquare := false;
  bAutoDif := false;
  bGameStart := false;
  bGameRunning := false;
  SetGameMode(SINGLE);
  bSoundTransform := false;
  bShowGhost := true;
  bSoundFall := true;
  bSoundPoint := false;
  bSoundWipeoff := true;
  bConnected := false;
  bNetGameRunning := false;
  bNetGameOtherRunning := false;
  SetData(Data, MAX_X, MAX_Y);
  InitData(Data);
  Randomize();
  TimerAutoAddDifficulty.Interval := GTimeAddDif;
  GCriticalSection := TCriticalSection.Create();
  GThread := TThreadSoundRelease.Create(self);
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FreeData(data);
end;

procedure TFormMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if bGameRunning and bSquare and (Key = VK_LEFT) then
  begin
    ShowGhostSquare(GGhostSquare, false);
    SquareArrayCopyTo(GNowSquare, GOldSquare);
    MoveSquare(GNowSquare, TOLEFT);
    EraseOldSquare(GOldSquare);
    CreateGhostSquare(GGhostSquare);
    ShowGhostSquare(GGhostSquare, true);
    DrawSquareArray(GNowSquare);
  end
  else if bGameRunning and bSquare and (Key = VK_RIGHT) then
  begin
    ShowGhostSquare(GGhostSquare, false);
    SquareArrayCopyTo(GNowSquare, GOldSquare);
    MoveSquare(GNowSquare, TORIGHT);
    EraseOldSquare(GOldSquare);
    CreateGhostSquare(GGhostSquare);
    ShowGhostSquare(GGhostSquare, true);
    DrawSquareArray(GNowSquare);
  end
  else if bGameRunning and bSquare and (Key = VK_UP) then
  begin
    if CanChangeSquare(GNowJ, GNowSquare) then
    begin
      ShowGhostSquare(GGhostSquare, false);
      SquareArrayCopyTo(GNowSquare, GOldSquare);
      EraseOldSquare(GOldSquare);
      ChangeSquare(GNowJ, GNowSquare);
      if bSoundTransform then
        PlaySound('WaveTransform', hInstance, SND_ASYNC or SND_RESOURCE);
      CreateGhostSquare(GGhostSquare);
      ShowGhostSquare(GGhostSquare, true);
      DrawSquareArray(GNowSquare);
    end;
  end
  else if bGameRunning and bSquare and (Key = VK_DOWN) then
  begin
    TimerSquareMove.Enabled := false;
    MoveNowSquareToBottomDirectly(GNowSquare, data);
    TimerSquareMoveTimer(Sender);
    if not CanGetSquare(GNextSquare) then
    begin
      if GameMode = SINGLE then
        MenuGameStopClick(Sender)
      else
      begin
        SendCommand(CONNECTCOMMANDFAIL + lblCountContent.Caption);
        TimerSquareMove.Enabled := false;
        FreeData(Data);
        SetData(Data, MAX_X, MAX_Y);
        InitData(Data);
        bSquare := false;
        bGameRunning := false;
        bGameStart := false;
        bNetGameRunning := false;
        MenuGameNetStart.Enabled := true;
        MenuGameNetStop.Enabled := false;
      end;
      if bSoundPoint then
        CreateThread(nil, 0, @PlayCount, nil, 0, GHandle);
      MessageBox(Self.Handle, STRINGGAMEOVER, STRINGGAME, MB_OK or
        MB_ICONINFORMATION);
      exit;
    end;
    GetSquare(GNowSquare, GNextSquare);
    GenerateNextSquare(GNextSquare, random(MAXFORM), random(MAX));
    ShowNextSquareArray(GNextSquare);
    TimerSquareMove.Interval := GInterval;
    bSquare := true;
    CreateGhostSquare(GGhostSquare);
    ShowGhostSquare(GGhostSquare, true);
    DrawSquareArray(GNowSquare);
    TimerSquareMove.Enabled := true;
  end
  else if bGameStart and (Key = VK_RETURN) and (not bConnected) then
  begin
    TimerSquareMove.Interval := GInterval;
    TimerSquareMove.Enabled := not TimerSquareMove.Enabled;
    bGameRunning := not bGameRunning;
    if bGameRunning then
      Self.Caption := STRCAPTIONSINGLEMODE
    else
      Self.Caption := STRCAPTIONSINGLEMODE + ' ��ͣ';
  end
  else if Key = VK_ESCAPE then
    Close;
end;

function TFormMain.GetCount(tmpCount: integer): integer;
begin
  case tmpCount of
    1: result := 1 * COUNTMUL;
    2: result := 3 * COUNTMUL;
    3: result := 6 * COUNTMUL;
    4: result := 9 * COUNTMUL;
  else
    result := 0;
  end;
end;

function TFormMain.GetWinsockState(tmpState: cardinal): string;
begin
  if tmpState = sckClosed then
    result := 'sckClosed'
  else if tmpState = sckOpen then
    result := 'sckOpen'
  else if tmpState = sckListening then
    result := 'sckListening'
  else if tmpState = sckConnectionPending then
    result := 'sckConnectionPending'
  else if tmpState = sckResolvingHost then
    result := 'sckResolvingHost'
  else if tmpState = sckHostResolved then
    result := 'sckHostResolved'
  else if tmpState = sckConnecting then
    result := 'sckConnecting'
  else if tmpState = sckConnected then
    result := 'sckConnected'
  else if tmpState = sckClosing then
    result := 'sckClosing'
  else if tmpState = sckError then
    result := 'sckError'
  else
    result := 'sckClosed';
end;

procedure TFormMain.HideNowSquare(tmpSquare: TSquareArray);
begin
  bSquare := false;
  SquareArrayCopyTo(tmpSquare, GOldSquare);
  EraseOldSquare(GOldSquare);
end;

procedure TFormMain.InitWinsockClient;
begin
  if WinsockClient.State <> sckClosed then
    WinsockClient.Close;
end;

procedure TFormMain.InitWinsockServer;
begin
  if WinsockServer.State <> sckClosed then
    WinsockServer.Close;
end;

procedure TFormMain.MenuGameExitClick(Sender: TObject);
begin
  Close();
end;

procedure TFormMain.MenuGameNetModeClick(Sender: TObject);
begin
  if GameMode = SINGLE then
  begin
    if bGameStart then
    begin
      if MessageBox(Self.Handle, '��Ϸ�������У����ھ�ֹͣ��', '��Ϣ',
        MB_OKCANCEL) = ID_OK then
      begin
        MenuGameStopClick(Sender);
        PaintBoxMainPaint(Sender);
        PaintBoxNextPaint(Sender);
      end
      else
        Exit;
    end;
  end
  else if (GameMode = SERVER) and (bNetGameRunning) then
  begin
    MessageBox(Self.Handle, '������Ϸ�������У����ȹر���Ϸ��', '��������Ϣ',
      MB_OK);
    Exit;
  end
  else if (GameMode = CLIENT) and (bNetGameRunning) then
  begin
    MessageBox(Self.Handle, '������Ϸ�������У����ȹر���Ϸ��', '�ͻ�����Ϣ',
      MB_OK);
    Exit;
  end;
  if WinsockServer.State <> sckClosed then
  begin
    MessageBox(Self.Handle, '��������û�йر��������ӣ����ȹر��������ӣ�',
      '��������Ϣ', MB_OK);
    Exit;
  end
  else if WinsockClient.State <> sckClosed then
  begin
    MessageBox(Self.Handle, '�ͻ�����û�йر��������ӣ����ȹر��������ӣ�',
      '�ͻ�����Ϣ', MB_OK);
    Exit;
  end;
  MenuGameNetMode.Checked := not MenuGameNetMode.Checked;
  if MenuGameNetMode.Checked then
  begin
    MenuRole.Enabled := true;
    MenuWinsockMsg.Enabled := true;
    MenuGameStart.Enabled := false;
    MenuGameStop.Enabled := false;
    MenuConfigDif.Enabled := false;
    MenuAutoDif.Enabled := false;
    MenuAutoDifChange.Enabled := false;
  end
  else
  begin
    MenuRole.Enabled := false;
    MenuWinsockMsg.Enabled := false;
    MenuGameStart.Enabled := true;
    MenuGameStop.Enabled := false;
    MenuConfigDif.Enabled := true;
    MenuAutoDif.Enabled := true;
    MenuAutoDifChange.Enabled := false;
  end;
end;

procedure TFormMain.MenuGameNetStartClick(Sender: TObject);
begin
  bNetGameRunning := true;
  MenuGameNetStart.Enabled := false;
  MenuGameNetStop.Enabled := true;
  if bConnected then
  begin
    if GameMode = SERVER then
      WinsockServer.SendData(StringToOleVariant(CONNECTCOMMANDGAMESTART))
    else if GameMode = CLIENT then
      WinsockClient.SendData(StringToOleVariant(CONNECTCOMMANDGAMESTART));
  end;
  GCount := 0;
  lblCountContent.Caption := IntToStr(GCount);
  bGameRunning := true;
  bGameStart := true;
  GenerateNextSquare(GNextSquare, random(MAXFORM), random(MAX));
  DrawBlank(Data);
  TimerSquareMove.Enabled := true;
end;

procedure TFormMain.MenuGameNetStopClick(Sender: TObject);
begin
  bNetGameRunning := false;
  MenuGameNetStart.Enabled := true;
  MenuGameNetStop.Enabled := false;
  if bConnected then
  begin
    if GameMode = SERVER then
      WinsockServer.SendData(StringToOleVariant(CONNECTCOMMANDGAMESTOP))
    else if GameMode = CLIENT then
      WinsockClient.SendData(StringToOleVariant(CONNECTCOMMANDGAMESTOP));
  end;
end;

procedure TFormMain.MenuGameStartClick(Sender: TObject);
begin
  GCount := 0;
  lblCountContent.Caption := IntToStr(GCount);
  MenuGameStart.Enabled := false;
  MenuGameStop.Enabled := true;
  SetGameMode(SINGLE);
  bGameRunning := true;
  bGameStart := true;
  GenerateNextSquare(GNextSquare, random(MAXFORM), random(MAX));
  DrawBlank(Data);
  TimerSquareMove.Enabled := true;
  if MenuAutoDif.Checked then
    TimerAutoAddDifficulty.Enabled := true;
  Self.Caption := STRCAPTIONSINGLEMODE;
  if MenuBackGroundMusic.Checked then
  begin
    MediaPlayer1.DeviceType := dtAutoSelect;
    MediaPlayer1.Open;
    MediaPlayer1.Play;
  end;
end;

procedure TFormMain.MenuGameStopClick(Sender: TObject);
begin
  TimerSquareMove.Enabled := false;
  TimerAutoAddDifficulty.Enabled := false;
  MenuGameStart.Enabled := true;
  MenuGameStop.Enabled := false;
  MediaPlayer1.Stop;
  FreeData(Data);
  SetData(Data, MAX_X, MAX_Y);
  InitData(Data);
  bSquare := false;
  bGameRunning := false;
  bGameStart := false;
  SetGameMode(SINGLE);
  Self.Caption := STRCAPTIONSINGLEMODE;
end;

procedure TFormMain.MenuInforBackGroundColorClick(Sender: TObject);
begin
  PopupMenuViewColorGridClick(Sender);
end;

procedure TFormMain.MenuInforCaptionColorClick(Sender: TObject);
begin
  PopupMenuCaptionClick(Sender);
end;

procedure TFormMain.MenuInforColorDefaultClick(Sender: TObject);
begin
  PopupMenuViewColorDefaultClick(Sender);
end;

procedure TFormMain.MenuInforContentColorClick(Sender: TObject);
begin
  PopupMenuContentClick(Sender);
end;

procedure TFormMain.MenuClientConnectClick(Sender: TObject);
var
  tmpHost: string;
begin
  InitWinsockClient();
  SetGameMode(CLIENT);
  WinsockClient.RemotePort := LOCALPORT;
  tmpHost := InputBox('��Ϣ', '������Է� IP ��ַ: ', '127.0.0.1');
  WinsockClient.RemoteHost := tmpHost;
  WinsockClient.Connect;
  MenuClientConnect.Enabled := false;
  MenuClientDisConnect.Enabled := true;
  MenuServerListen.Enabled := false;
  MenuServerClose.Enabled := false;
  MenuServerSendData.Enabled := false;
  MenuClientSendData.Enabled := true;
  MessageBox(Self.Handle, '��������...', '�ͻ�����Ϣ', MB_OK);
end;

procedure TFormMain.MenuClientDisConnectClick(Sender: TObject);
begin
  if WinsockClient.State = sckConnected then
    WinsockClient.SendData(StringToOleVariant(CONNECTCOMMANDQUITTOSERVER));
  SetGameMode(SINGLE);
  MenuClientDisConnect.Enabled := false;
  MenuClientConnect.Enabled := true;
  MenuServerListen.Enabled := true;
  MenuServerClose.Enabled := false;
  MenuServerSendData.Enabled := false;
  MenuClientSendData.Enabled := false;
end;

procedure TFormMain.MenuColorAddClick(Sender: TObject);
begin
  PopupMenuMainColorAddClick(Sender);
end;

procedure TFormMain.MenuColorBackGroundClick(Sender: TObject);
begin
  PopupMenuMainColorBackGroundClick(Sender);
end;

procedure TFormMain.MenuColorDefaultClick(Sender: TObject);
begin
  PopupMenuMainColorDefaultClick(Sender);
end;

procedure TFormMain.MenuColorGridClick(Sender: TObject);
begin
  PopupMenuMainColorGridClick(Sender);
end;

procedure TFormMain.MenuColorHeapClick(Sender: TObject);
begin
  PopupMenuMainColorHeapClick(Sender);
end;

procedure TFormMain.MenuColorSquareClick(Sender: TObject);
begin
  PopupMenuMainColorSquareClick(Sender);
end;

procedure TFormMain.MenuServerCloseClick(Sender: TObject);
begin
  InitWinsockServer();
  SetGameMode(SERVER);
  MenuServerClose.Enabled := false;
  MenuServerListen.Enabled := true;
  MenuClientConnect.Enabled := true;
  MenuClientDisConnect.Enabled := false;
  MenuClientSendData.Enabled := false;
  MenuServerSendData.Enabled := false;
  MessageBox(Self.Handle, '������ֹͣ�˼�����', '��Ϣ', MB_OK);
end;

procedure TFormMain.MenuServerListenClick(Sender: TObject);
begin
  InitWinsockServer();
  WinsockServer.LocalPort := LOCALPORT;
  WinsockServer.Listen;
  SetGameMode(SERVER);
  MenuServerListen.Enabled := false;
  MenuServerClose.Enabled := true;
  MenuClientConnect.Enabled := false;
  MenuClientDisConnect.Enabled := false;
  MenuServerSendData.Enabled := true;
  MenuClientSendData.Enabled := false;
  MessageBox(Self.Handle, '���������ڼ���...', '��������Ϣ', MB_OK);
end;

procedure TFormMain.MenuSoundFallClick(Sender: TObject);
begin
  MenuSoundFall.Checked := not MenuSoundFall.Checked;
  bSoundFall := MenuSoundFall.Checked;
end;

procedure TFormMain.MenuSoundPointClick(Sender: TObject);
begin
  MenuSoundPoint.Checked := not MenuSoundPoint.Checked;
  bSoundPoint := MenuSoundPoint.Checked;
end;

procedure TFormMain.MenuSoundTransformClick(Sender: TObject);
begin
  MenuSoundTransform.Checked := not MenuSoundTransform.Checked;
  bSoundTransform := MenuSoundTransform.Checked;
end;

procedure TFormMain.MenuSoundWipeoffClick(Sender: TObject);
begin
  MenuSoundWipeoff.Checked := not MenuSoundWipeoff.Checked;
  bSoundWipeoff := not bSoundWipeoff;
end;

procedure TFormMain.MenuViewBackGroundColorClick(Sender: TObject);
begin
  PopupMenuViewColorBackGroundClick(Sender);
end;

procedure TFormMain.MenuViewColorDefaultClick(Sender: TObject);
begin
  PopupMenuViewColorDefaultClick(Sender);
end;

procedure TFormMain.MenuViewGridColorClick(Sender: TObject);
begin
  PopupMenuViewColorGridClick(Sender);
end;

procedure TFormMain.MenuViewSquareColorClick(Sender: TObject);
begin
  PopupMenuViewColorSquareClick(Sender);
end;

procedure TFormMain.MenuClientSendDataClick(Sender: TObject);
var
  tmpMessage: string;
begin
  if WinsockClient.State <> sckConnected then
  begin
    MessageBox(Self.Handle, 'û�н������ӣ�', '��Ϣ', MB_OK);
    Exit;
  end;
  tmpMessage := InputBox('��Ϣ', '��������Ҫ���͸��Է�����Ϣ��', '��ã�');
  WinsockClient.SendData(StringToOleVariant(tmpMessage));
end;

procedure TFormMain.MenuWinSockMsgClick(Sender: TObject);
begin
  WinsockClient.AboutBox;
end;

procedure TFormMain.MenuServerSendDataClick(Sender: TObject);
var
  tmpMessage: string;
begin
  if WinsockServer.State <> sckConnected then
  begin
    MessageBox(Self.Handle, 'û�н�������', '��Ϣ', MB_OK);
    Exit;
  end;
  tmpMessage := InputBox('��Ϣ', '��������Ҫ���͸��Է�����Ϣ��', '��ã�');
  WinsockServer.SendData(StringToOleVariant(tmpMessage));
end;

procedure TFormMain.MenuShowGhostClick(Sender: TObject);
begin
  MenuShowGhost.Checked := not MenuShowGhost.Checked;
  bShowGhost := MenuShowGhost.Checked;
end;

procedure TFormMain.MoveNowSquareToBottomDirectly(var tmpSquare: TSquareArray;
  tmpData: TDataArray);
var
  i, j: integer;
begin
  while not TouchBottom(tmpSquare, tmpData) do
  begin
    SquareArrayCopyTo(tmpSquare, GOldSquare);
    for i := 0 to MAX - 1 do
      for j := 0 to MAX - 1 do
        inc(tmpSquare[i, j].Pos.j);
    EraseOldSquare(GOldSquare);
    DrawSquareArray(tmpSquare);
    Sleep(GFallTime);
  end;
end;

procedure TFormMain.MenuDifLowClick(Sender: TObject);
begin
  TimerSquareMove.Interval := 1000;
  GInterval := 1000;
  lblDifContent.Caption := '����';
end;

procedure TFormMain.MenuDifMediumClick(Sender: TObject);
begin
  TimerSquareMove.Interval := 400;
  GInterval := 400;
  lblDifContent.Caption := '�м�';
end;

procedure TFormMain.MenuAutoDifClick(Sender: TObject);
begin
  MenuAutoDif.Checked := not MenuAutoDif.Checked;
  bAutoDif := not bAutoDif;
  TimerAutoAddDifficulty.Enabled := not TimerAutoAddDifficulty.Enabled;
  MenuAutoDifChange.Enabled := not MenuAutoDifChange.Enabled;
end;

procedure TFormMain.MenuAutoDifFastClick(Sender: TObject);
begin
  GTimeAddDif := 5000;
  TimerAutoAddDifficulty.Interval := GTimeAddDif;
end;

procedure TFormMain.MenuAutoDifLowClick(Sender: TObject);
begin
  GTimeAddDif := 40000;
  TimerAutoAddDifficulty.Interval := GTimeAddDif;
end;

procedure TFormMain.MenuAutoDifMediumClick(Sender: TObject);
begin
  GTimeAddDif := 20000;
  TimerAutoAddDifficulty.Interval := GTimeAddDif;
end;

procedure TFormMain.MenuDifAdvanceClick(Sender: TObject);
begin
  TimerSquareMove.Interval := 200;
  GInterval := 200;
  lblDifContent.Caption := '�߼�';
end;

procedure TFormMain.MenuDifSpecialClick(Sender: TObject);
begin
  TimerSquareMove.Interval := 100;
  GInterval := 100;
  lblDifContent.Caption := '�ؼ�';
end;

procedure TFormMain.MenuFallTimeQuickClick(Sender: TObject);
begin
  GFallTime := 0;
end;

procedure TFormMain.MenuFallTimeSlowClick(Sender: TObject);
begin
  GFallTime := 10;
end;

procedure TFormMain.PaintBoxMainPaint(Sender: TObject);
begin
  DrawBackGround();
  DrawBlank(Data);
  //  DrawBottom(Data);
  DrawBottomArray(Data);
  SelfChange();
  if bSquare then
    DrawSquareArray(GNowSquare);
end;

procedure TFormMain.PaintBoxNextPaint(Sender: TObject);
begin
  ShowNextBackGround();
  if bSquare then
    ShowNextSquareArray(GNextSquare);
end;

procedure TFormMain.PopupMenuBackGroundClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    GInforBackGround := ColorDialog1.Color;
  PanelInfo.Color := GInforBackGround;
end;

procedure TFormMain.PopupMenuCaptionClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    GInforCaptionColor := ColorDialog1.Color;
  lblModeCaption.Font.Color := GInforCaptionColor;
  lblDifCaption.Font.Color := GInforCaptionColor;
  lblCountCaption.Font.Color := GInforCaptionColor;
  lblControlCaption.Font.Color := GInforCaptionColor;
end;

procedure TFormMain.PopupMenuContentClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    GInforContentColor := ColorDialog1.Color;
  lblModeContent.Font.Color := GInforContentColor;
  lblDifContent.Font.Color := GInforContentColor;
  lblCountContent.Font.Color := GInforContentColor;
  lblControlContentUp.Font.Color := GInforContentColor;
  lblControlContentDown.Font.Color := GInforContentColor;
  lblControlContentLeft.Font.Color := GInforContentColor;
  lblControlContentRight.Font.Color := GInforContentColor;
  lblControlContentReturn.Font.Color := GInforContentColor;
end;

procedure TFormMain.PopupMenuInformationColorDefaultClick(Sender: TObject);
begin
  GInforBackGround := RGB(0, 0, 64);
  ;
  GInforCaptionColor := clLime;
  GInforContentColor := clLime;
  PanelInfo.Color := GInforBackGround;
  lblModeCaption.Font.Color := GInforCaptionColor;
  lblDifCaption.Font.Color := GInforCaptionColor;
  lblCountCaption.Font.Color := GInforCaptionColor;
  lblControlCaption.Font.Color := GInforCaptionColor;
  lblModeContent.Font.Color := GInforContentColor;
  lblDifContent.Font.Color := GInforContentColor;
  lblCountContent.Font.Color := GInforContentColor;
  lblControlContentUp.Font.Color := GInforContentColor;
  lblControlContentDown.Font.Color := GInforContentColor;
  lblControlContentLeft.Font.Color := GInforContentColor;
  lblControlContentRight.Font.Color := GInforContentColor;
  lblControlContentReturn.Font.Color := GInforContentColor;
end;

procedure TFormMain.PopupMenuMainColorAddClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    GOtherColor := ColorDialog1.Color;
end;

procedure TFormMain.PopupMenuMainColorBackGroundClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    GBlankColor := ColorDialog1.Color;
  PaintBoxMainPaint(Sender);
  PaintBoxNextPaint(Sender);
end;

procedure TFormMain.PopupMenuMainColorDefaultClick(Sender: TObject);
begin
  GHeapColor := clBlue;
  GBackGroundColor := RGB(0, 0, 64);
  ;
  GSquareColor := clRed;
  GOtherColor := clYellow;
  GBlankColor := RGB(0, 0, 64);
  ;
  PaintBoxMainPaint(Sender);
end;

procedure TFormMain.PopupMenuMainColorGridClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    GBackGroundColor := ColorDialog1.Color;
  PaintBoxMainPaint(Sender);
  PaintBoxNextPaint(Sender);
end;

procedure TFormMain.PopupMenuMainColorHeapClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    GHeapColor := ColorDialog1.Color;
end;

procedure TFormMain.PopupMenuMainColorSquareClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    GSquareColor := ColorDialog1.Color;
end;

procedure TFormMain.PopupMenuViewColorBackGroundClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    GViewBlankColor := ColorDialog1.Color;
  PaintBoxNextPaint(Sender);
end;

procedure TFormMain.PopupMenuViewColorDefaultClick(Sender: TObject);
begin
  GViewSquareColor := clRed;
  GViewBlankColor := RGB(0, 0, 64);
  ;
  GViewBackGroundColor := RGB(0, 0, 64);
  ;
  PaintBoxNextPaint(Sender);
end;

procedure TFormMain.PopupMenuViewColorGridClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    GViewBackGroundColor := ColorDialog1.Color;
  PaintBoxNextPaint(Sender);
end;

procedure TFormMain.PopupMenuViewColorSquareClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    GViewSquareColor := ColorDialog1.Color;
  PaintBoxNextPaint(Sender);
end;

procedure TFormMain.ProcessMessage_MESSAGE_SOUND(var tmpMessage: TMessage);
begin
  OutputDebugString('MESSAGE_SOUND received.');
  if FileExists(GetTempDirectory + 'music.wav') then
  begin
    MediaPlayer1.FileName := GetTempDirectory + 'music.wav';
    MediaPlayer1.DeviceType := dtAutoSelect;
    MediaPlayer1.Open;
  end else
    MessageBox(Self.Handle, '�Բ��������ļ���ʱ�����ã�', '��Ϣ', MB_OK);
end;

procedure TFormMain.SelfChange;
begin
  Self.PanelLeft.Width := MAX_X * MULX + 2 * STARTX;
  Self.ClientHeight := MAX_Y * MULY + 2 * STARTY;
end;

procedure TFormMain.SendCommand(tmp: string);
begin
  if bConnected then
  begin
    if GameMode = SERVER then
      WinsockServer.SendData(StringToOleVariant(tmp))
    else if GameMode = CLIENT then
      WinsockClient.SendData(StringToOleVariant(tmp))
    else
      MessageBox(Self.Handle, '��������ģʽ', '��Ϣ', MB_OK or
        MB_ICONINFORMATION);
  end;
end;

procedure TFormMain.SetGameMode(tmp: TMode);
begin
  GameMode := tmp;
  if GameMode = SINGLE then
  begin
    Self.Caption := STRCAPTIONSINGLEMODE;
    Application.Title := STRCAPTIONSINGLEMODE;
    lblModeContent.Caption := '����';
  end
  else if GameMode = SERVER then
  begin
    Self.Caption := STRCAPTIONSERVERMODE;
    Application.Title := STRCAPTIONSERVERMODE;
    lblModeContent.Caption := '������';
  end
  else if GameMode = CLIENT then
  begin
    Self.Caption := STRCAPTIONCLIENTMODE;
    Application.Title := STRCAPTIONCLIENTMODE;
    lblModeContent.Caption := '�ͻ���';
  end;
end;

procedure TFormMain.ShowGhostSquare(tmpGhostSquare: TSquareArray; flag:
  boolean);
var
  tmpColor: TColor;
  i, j, posX, posY: integer;
begin
  if not bShowGhost then
    Exit;
  if flag then
    tmpColor := GSquareColor
  else
    tmpColor := GBlankColor;
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if tmpGhostSquare[i, j].SquareType = SQUARE then
      begin
        posX := IToX(tmpGhostSquare[i, j].Pos.i);
        posY := JToY(tmpGhostSquare[i, j].Pos.j);
        with PaintBoxMain do
        begin
          Canvas.Pen.Color := tmpColor;
          Canvas.Pen.Width := 1;
          Canvas.Brush.Color := GBlankColor;
          Canvas.Rectangle(posX, posY, posX + LENX, posY + LENY);
        end;
      end;
end;

procedure TFormMain.ShowNextBackGround;
var
  i, j, PosX, PosY: integer;
begin
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
    begin
      PosX := IToX(i);
      PosY := JToY(j);
      with PaintBoxNext do
      begin
        Canvas.Pen.Color := GViewBackGroundColor;
        Canvas.Brush.Color := GViewBlankColor;
        Canvas.Pen.Width := 1;
        Canvas.Rectangle(PosX - 1, PosY - 1, PosX + LENX + 1, PosY + LENY + 1);
      end;
    end;
end;

procedure TFormMain.ShowNextSquare(tmpNextSquare: TSquareType; tmpPenColor,
  tmpBrushColor: TColor);
var
  tmpI, tmpJ, PosX, PosY: integer;
begin
  tmpI := tmpNextSquare.Pos.i - MAX_X div 2 + 2;
  tmpJ := tmpNextSquare.Pos.j;
  PosX := IToX(tmpI);
  PosY := JToY(tmpJ);
  with PaintBoxNext do
  begin
    Canvas.Pen.Color := tmpPenColor;
    Canvas.Pen.Width := 1;
    Canvas.Brush.Color := tmpBrushColor;
    Canvas.Rectangle(PosX, PosY, PosX + LENX, PosY + LENY);
    Canvas.Pen.Color := GViewBlankColor;
    Canvas.Rectangle(PosX + 1, PosY + 1, PosX + LENX - 1, PosY + LENY - 1);
  end;
end;

procedure TFormMain.DrawSquare(tmpSquare: TSquareType; tmpPenColor,
  tmpBrushColor: TColor);
var
  tmpI, tmpJ, PosX, PosY: integer;
begin
  tmpI := tmpSquare.Pos.i;
  tmpJ := tmpSquare.Pos.j;
  PosX := IToX(tmpI);
  PosY := JToY(tmpJ);
  with PaintBoxMain do
  begin
    Canvas.Pen.Color := tmpPenColor;
    Canvas.Pen.Width := 1;
    Canvas.Brush.Color := tmpBrushColor;
    Canvas.Rectangle(PosX, PosY, PosX + LENX, PosY + LENY);
    Canvas.Pen.Color := GBlankColor;
    Canvas.Rectangle(PosX + 1, PosY + 1, PosX + LENX - 1, PosY + LENY - 1);
  end;
end;

procedure TFormMain.TimerShowWinsockStateTimer(Sender: TObject);
begin
  GetWinsockState(WinsockServer.State);
  GetWinsockState(WinsockClient.State);
end;

procedure TFormMain.TimerSquareMoveTimer(Sender: TObject);
var
  tmpNum, tmpCount: integer;
  bDelete: boolean;
begin
  if bSquare then
  begin
    if TouchBottom(GNowSquare, Data) then
    begin
      AddToBottom(GNowSquare, Data);
      ShowGhostSquare(GGhostSquare, false);
      if bSoundFall and (not NeedDeleteBottom(Data, tmpNum)) then
        PlaySound('WaveFall', hInstance, SND_ASYNC or SND_RESOURCE);
      //      DrawBottom(Data);
      DrawBottomArray(Data);
      tmpCount := 0;
      bDelete := false;
      while NeedDeleteBottom(Data, tmpNum) do
      begin
        inc(tmpCount);
        ChangeBottom(Data, tmpNum);
        bDelete := true;
      end;
      if (tmpCount <> 0) and (GameMode <> SINGLE) then
      begin
        SendCommand(IntToStr(tmpCount));
      end;
      if bSoundWipeoff and bDelete then
        PlaySound('WaveDelete', hInstance, SND_ASYNC or SND_RESOURCE);
      GCount := GCount + GetCount(tmpCount);
      if tmpCount <> 0 then
        CreateThread(nil, 0, @ShowCount, nil, 0, GHandle);
      //      DrawBottom(Data);
      DrawBottomArray(Data);
      DrawBlank(Data);
      bSquare := false;
      //      Sleep(700);
      exit;
    end;
    SquareArrayCopyTo(GNowSquare, GOldSquare);
    MoveSquare(GNowSquare, TODOWN);
    EraseOldSquare(GOldSquare);
    DrawSquareArray(GNowSquare);
  end
  else
  begin
    if not CanGetSquare(GNextSquare) then
    begin
      if GameMode = SINGLE then
        MenuGameStopClick(Sender)
      else
      begin
        SendCommand(CONNECTCOMMANDFAIL + lblCountContent.Caption);
        TimerSquareMove.Enabled := false;
        FreeData(Data);
        SetData(Data, MAX_X, MAX_Y);
        InitData(Data);
        bSquare := false;
        bGameRunning := false;
        bGameStart := false;
        bNetGameRunning := false;
        MenuGameNetStart.Enabled := true;
        MenuGameNetStop.Enabled := false;
      end;
      if bSoundPoint then
        CreateThread(nil, 0, @PlayCount, nil, 0, GHandle);
      MessageBox(Self.Handle, STRINGGAMEOVER, STRINGGAME, MB_OK or
        MB_ICONINFORMATION);
      exit;
    end;
    GetSquare(GNowSquare, GNextSquare);
    GenerateNextSquare(GNextSquare, random(MAXFORM), random(MAX));
    ShowNextSquareArray(GNextSquare);
    TimerSquareMove.Interval := GInterval;
    bSquare := true;
    CreateGhostSquare(GGhostSquare);
    ShowGhostSquare(GGhostSquare, true);
    DrawSquareArray(GNowSquare);
  end;
end;

procedure TFormMain.WinsockClientClose(Sender: TObject);
begin
  MenuServerListen.Enabled := true;
  MenuServerClose.Enabled := false;
  MenuClientConnect.Enabled := true;
  MenuClientDisConnect.Enabled := false;
  MenuServerSendData.Enabled := false;
  MenuClientSendData.Enabled := false;
  SetGameMode(SINGLE);
  bConnected := false;
  WinsockClient.Close;
  MenuGameNetStart.Enabled := false;
  MenuGameNetStop.Enabled := false;
  MessageBox(Self.Handle, '�������ӹرգ�', '�ͻ�����Ϣ', MB_OK);
end;

procedure TFormMain.WinsockClientDataArrival(ASender: TObject;
  bytesTotal: Integer);
var
  tmpOleVariant: OleVariant;
  subCommand, s, subS: string;
  tmpPoint, len: integer;
  i: Integer;
begin
  WinsockClient.GetData(tmpOleVariant);
  subCommand := Copy(string(TmpOleVariant), 1, 8);
  if subCommand = CONNECTCOMMANDACCEPTEDTOCLIENT then
  begin
    MenuClientConnect.Enabled := false;
    MenuClientDisConnect.Enabled := true;
    MenuServerListen.Enabled := false;
    MenuServerClose.Enabled := false;
    MenuServerSendData.Enabled := false;
    MenuClientSendData.Enabled := true;
    SetGameMode(CLIENT);
    bConnected := true;
    MenuGameNetStart.Enabled := true;
    MenuGameNetStop.Enabled := false;
    MessageBox(Self.Handle, '�ɹ��������ӣ�', '�ͻ�����Ϣ', MB_OK);
  end
  else if subCommand = CONNECTCOMMANDUNACCEPTEDTOCLIENT then
  begin
    MenuClientConnect.Enabled := true;
    MenuClientDisConnect.Enabled := false;
    MenuServerListen.Enabled := true;
    MenuServerClose.Enabled := false;
    MenuServerSendData.Enabled := false;
    MenuClientSendData.Enabled := false;
    SetGameMode(SINGLE);
    bConnected := false;
    MessageBox(Self.Handle, '�Է��ܾ���������ӣ�', '�ͻ�����Ϣ', MB_OK);
  end
  else if subCommand = CONNECTCOMMANDGAMESTART then
  begin
    bNetGameOtherRunning := true;
    if bNetGameRunning then
      MessageBox(Self.Handle, '�Է��Ѿ���ʼ����Ϸ��', '�ͻ�����Ϣ', MB_OK)
    else
      MessageBox(Self.Handle, '�Է��Ѿ���ʼ����Ϸ����Ҳ���Կ�ʼ�ˣ�',
        '�ͻ�����Ϣ', MB_OK);
  end
  else if subCommand = CONNECTCOMMANDGAMESTOP then
  begin
    bNetGameOtherRunning := false;
    MessageBox(Self.Handle, '�Է�����ֹͣ����Ϸ��', '�ͻ�����Ϣ', MB_OK);
  end
  else if subCommand = CONNECTCOMMANDFAIL then
  begin
    TimerSquareMove.Enabled := false;
    FreeData(Data);
    SetData(Data, MAX_X, MAX_Y);
    InitData(Data);
    bSquare := false;
    bGameRunning := false;
    bGameStart := false;
    bNetGameRunning := false;
    MenuGameNetStart.Enabled := true;
    MenuGameNetStop.Enabled := false;
    s := string(tmpOleVariant);
    len := Length(s);
    for i := 9 to len do
      subS := subS + s[i];
    tmpPoint := StrToInt(subS);
    MessageBox(Self.Handle, PChar(Format('�Է��Ѿ����ˣ���Ӯ�ˣ�' + #$D + #$D +
      '  ��ĵ÷֣�%d' + #$D + #$D +
      '�Է��ĵ÷֣�%d',
      [StrToInt(lblCountContent.Caption), tmpPoint])), '�ͻ�����Ϣ', MB_OK);
  end
  else if IsNumber(string(tmpOleVariant)) then
  begin
    GAddDifNum := StrToInt(string(tmpOleVariant));
    TimerAutoAddDifficultyTimer(nil);
  end
  else
  begin
    MessageBox(Self.Handle, PChar(format('%s', [string(tmpOleVariant)])),
      '���ԶԷ�����Ϣ', MB_OK);
  end;

end;

procedure TFormMain.WinsockClientError(ASender: TObject; Number: SmallInt;
  var Description: WideString; Scode: Integer; const Source,
  HelpFile: WideString; HelpContext: Integer; var CancelDisplay: WordBool);
begin
  InitWinsockClient();
  SetGameMode(SINGLE);
  MenuServerListen.Enabled := true;
  MenuServerClose.Enabled := false;
  MenuClientConnect.Enabled := true;
  MenuClientDisConnect.Enabled := false;
  MenuServerSendData.Enabled := false;
  MenuClientSendData.Enabled := false;
  SetGameMode(SINGLE);
  MessageBox(Self.Handle, '�������ӳ���', '��Ϣ', MB_OK);
end;

procedure TFormMain.WinsockServerClose(Sender: TObject);
begin
  MenuServerListen.Enabled := true;
  MenuServerClose.Enabled := false;
  MenuClientConnect.Enabled := true;
  MenuClientDisConnect.Enabled := false;
  MenuServerSendData.Enabled := false;
  MenuClientSendData.Enabled := false;
  SetGameMode(SINGLE);
  bConnected := false;
  MenuGameNetStart.Enabled := false;
  MenuGameNetStop.Enabled := false;
  MessageBox(Self.Handle, '��·���ӹر��ˣ�', '��������Ϣ', MB_OK);
end;

procedure TFormMain.WinsockServerConnectionRequest(ASender: TObject;
  requestID: Integer);
begin
  InitWinsockServer();
  if MessageBox(Self.Handle, PChar(format('�����ԣ�' + #$D + #$A +
    'IP(%s) Port(%d) ' + #$D + #$A + '���������󣬽�����',
    [WinsockServer.RemoteHostIP, WinsockServer.RemotePort])), '��������Ϣ',
    MB_OKCANCEL) = ID_OK then
  begin
    WinsockServer.Accept(requestID);
    WinsockServer.SendData(StringToOleVariant(CONNECTCOMMANDACCEPTEDTOCLIENT));
    bConnected := true;
    MenuGameNetStart.Enabled := true;
    MenuGameNetStop.Enabled := false;
  end
  else
  begin
    WinsockServer.Listen;
    MessageBox(Self.Handle, '�ܾ��˶Է�����������', '��������Ϣ', MB_OK);
  end;
end;

procedure TFormMain.WinsockServerDataArrival(ASender: TObject;
  bytesTotal: Integer);
var
  tmpOleVariant: OleVariant;
  subCommand, s, subS: string;
  len, i, tmpPoint: integer;
begin
  WinsockServer.GetData(tmpOleVariant);
  subCommand := Copy(string(TmpOleVariant), 1, 8);
  if subCommand = CONNECTCOMMANDQUITTOSERVER then
  begin
    InitWinsockServer();
    WinsockServer.Listen;
    MessageBox(Self.Handle, '�Է������ر������ӣ�', '��������Ϣ', MB_OK);
  end
  else if subCommand = CONNECTCOMMANDGAMESTART then
  begin
    bNetGameOtherRunning := true;
    if bNetGameRunning then
      MessageBox(Self.Handle, '�Է��Ѿ���ʼ����Ϸ��', '��������Ϣ', MB_OK)
    else
      MessageBox(Self.Handle, '�Է��Ѿ���ʼ����Ϸ����Ҳ���Կ�ʼ�ˣ�',
        '��������Ϣ', MB_OK);
  end
  else if subCommand = CONNECTCOMMANDGAMESTOP then
  begin
    bNetGameOtherRunning := false;
    MessageBox(Self.Handle, '�Է�����ֹͣ����Ϸ��', '��������Ϣ', MB_OK);
  end
  else if subCommand = CONNECTCOMMANDFAIL then
  begin
    TimerSquareMove.Enabled := false;
    FreeData(Data);
    SetData(Data, MAX_X, MAX_Y);
    InitData(Data);
    bSquare := false;
    bGameRunning := false;
    bGameStart := false;
    bNetGameRunning := false;
    MenuGameNetStart.Enabled := true;
    MenuGameNetStop.Enabled := false;
    s := string(tmpOleVariant);
    len := Length(s);
    for i := 9 to len do
      subS := subS + s[i];
    tmpPoint := StrToInt(subS);
    MessageBox(Self.Handle, PChar(Format('�Է��Ѿ����ˣ���Ӯ�ˣ�' + #$D + #$D +
      '  ��ĵ÷֣�%d' + #$D + #$D +
      '�Է��ĵ÷֣�%d',
      [StrToInt(lblCountContent.Caption), tmpPoint])), '��������Ϣ', MB_OK);
  end
  else if IsNumber(string(tmpOleVariant)) then
  begin
    GAddDifNum := StrToInt(string(tmpOleVariant));
    TimerAutoAddDifficultyTimer(nil);
  end
  else
  begin
    MessageBox(Self.Handle, PChar(format('%s', [string(TmpOleVariant)])),
      '���ԶԷ�����Ϣ', MB_OK);
  end;
end;

procedure TFormMain.WinsockServerError(ASender: TObject; Number: SmallInt;
  var Description: WideString; Scode: Integer; const Source,
  HelpFile: WideString; HelpContext: Integer; var CancelDisplay: WordBool);
begin
  InitWinsockServer();
  SetGameMode(SINGLE);
  MenuServerListen.Enabled := true;
  MenuServerClose.Enabled := false;
  MenuClientConnect.Enabled := true;
  MenuClientDisConnect.Enabled := false;
  MenuServerSendData.Enabled := false;
  MenuClientSendData.Enabled := false;
  SetGameMode(SINGLE);
  MessageBox(Self.Handle, '�������ӳ���', '��Ϣ', MB_OK);
end;

procedure TFormMain.TimerAutoAddDifficultyTimer(Sender: TObject);
begin
  if (GameMode = SINGLE) and (not bGameRunning) then
    exit;
  if (GameMode <> SINGLE) and (not bNetGameRunning) then
    exit;
  TimerSquareMove.Enabled := false;
  Application.ProcessMessages;
  HideNowSquare(GNowSquare);
  ShowGhostSquare(GGhostSquare, false);
  AddSomeToBottom(Data, GAddDifNum);
  //  DrawBottom(Data);
  DrawBottomArray(Data);
  DrawBlank(Data);
  TimerSquareMove.Enabled := true;
end;

procedure TFormMain.TimerPlayGuardTimer(Sender: TObject);
begin
  if bGameRunning then
  begin
    if MenuBackGroundMusic.Checked then
    begin
      if MediaPlayer1.Position >= MediaPlayer1.Length then
      begin
        MediaPlayer1.Open;
        MediaPlayer1.Play;
      end;
    end;
  end;
end;

procedure TFormMain.MenuBackGroundMusicClick(Sender: TObject);
begin
  MenuBackGroundMusic.Checked := not MenuBackGroundMusic.Checked;
  if bGameRunning and MenuBackGroundMusic.Checked then
    MediaPlayer1.Play
  else
    MediaPlayer1.Stop;
end;

procedure TFormMain.MenuHelpAboutClick(Sender: TObject);
var
  tmpFormAbout: TAboutBox;
begin
  tmpFormAbout := TAboutBox.Create(nil);
  try
    tmpFormAbout.ShowModal;
  finally
    tmpFormAbout.Free;
  end;
end;

procedure TFormMain.DrawSquareArray(tmpSquare: TSquareArray);
var
  i, j: integer;
begin
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if tmpSquare[i, j].SquareType = SQUARE then
        DrawSquare(tmpSquare[i, j], tmpSquare[i, j].Color, tmpSquare[i,
          j].Color);
end;

procedure TFormMain.ShowNextSquareArray(var tmpNextSquare: TSquareArray);
var
  i, j: integer;
begin
  ShowNextBackGround();
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if tmpNextSquare[i, j].SquareType = SQUARE then
        ShowNextSquare(tmpNextSquare[i, j], tmpNextSquare[i, j].Color,
          tmpNextSquare[i, j].Color);
end;

procedure TFormMain.DrawBottomArray(tmpData: TDataArray);
var
  i, j, tmpX, tmpY: integer;
begin
  for i := 0 to MAX_X - 1 do
    for j := 0 to MAX_Y - 1 do
      if tmpData[i, j].SquareType = OTHER then
      begin
        tmpX := IToX(i);
        tmpY := JToY(j);
        with PaintBoxMain do
        begin
          Canvas.Pen.Color := tmpData[i, j].Color;
          Canvas.Pen.Width := 1;
          Canvas.Brush.Color := tmpData[i, j].Color;
          Canvas.Rectangle(tmpX, tmpY, tmpX + LENX, tmpY + LENY);
          Canvas.Pen.Color := GBlankColor;
          Canvas.Rectangle(tmpX + 1, tmpY + 1, tmpX + LENX - 1, tmpY + LENY - 1);
        end;
      end;
end;

end.

