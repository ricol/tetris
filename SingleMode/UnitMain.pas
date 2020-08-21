unit UnitMain;

{
  CONTACT: WANGXINGHE1983@GMAIL.COM
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, UnitData, StdCtrls, MMSystem, UnitCommon, SyncObjs,
  MPlayer, ComCtrls;

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
    MenuColorSquare: TMenuItem;
    MenuColorBackGround: TMenuItem;
    MenuColorHeap: TMenuItem;
    MenuColorAdd: TMenuItem;
    ColorDialog1: TColorDialog;
    N1: TMenuItem;
    MenuSoundEffect: TMenuItem;
    MenuFallTime: TMenuItem;
    MenuFallTimeSlow: TMenuItem;
    MenuFallTimeQuick: TMenuItem;
    MenuSoundTransform: TMenuItem;
    MenuSoundFall: TMenuItem;
    MenuSoundWipeoff: TMenuItem;
    MenuSoundPoint: TMenuItem;
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
    MediaPlayer1: TMediaPlayer;
    MenuBackGroundMusic: TMenuItem;
    TimerPlayGuard: TTimer;
    MenuVisualEffect: TMenuItem;
    MenuBlink: TMenuItem;
    MenuColorOther: TMenuItem;
    MenuColorBlink: TMenuItem;
    MenuSoundOver: TMenuItem;
    MenuSoundPause: TMenuItem;
    MenuSoundMove: TMenuItem;
    procedure MenuGameExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBoxMainPaint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuGameStartClick(Sender: TObject);
    procedure MenuGameStopClick(Sender: TObject);
    procedure TimerSquareMoveTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MenuHelpAboutClick(Sender: TObject);
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
    procedure MenuBackGroundMusicClick(Sender: TObject);
    procedure TimerPlayGuardTimer(Sender: TObject);
    procedure MenuBlinkClick(Sender: TObject);
    procedure MenuColorBlinkClick(Sender: TObject);
    procedure MenuSoundOverClick(Sender: TObject);
    procedure MenuSoundPauseClick(Sender: TObject);
    procedure MenuSoundMoveClick(Sender: TObject);
  private
    bSquare, bAutoDif, bGameRunning, bGameStart, bShowGhost, bSoundRotate,
      bSoundFall, bSoundPoint, bSoundPause, bSoundWipeoff, bBlink, bBlinking,
      bSoundMove, bSoundOver: boolean;
    GInterval, GCount, GTimeAddDif, GAddDifNum, GFallTime: integer;
    GHandle: DWORD;
    procedure DrawBackGround(); // ���Ʊ���
    procedure DrawSquare(s: TSquareType; penColor, brushColor: TColor); // ���Ʒ���
    procedure DrawSquareArray(s: TSquareArray); // ���������еķ���
    procedure DrawBottomArray(data: TDataArray); // ���Ƶײ������
    procedure DrawBlankArray(data: TDataArray); // ��������û�з��������
    procedure SelfChange(); // ���ڴ�С������Ϸ��С����
    procedure EraseOldSquare(s: TSquareArray); // �����ɷ���
    procedure ShowNextSquareArray(var next: TSquareArray);
    // ������һ������
    procedure ShowNextSquare(next: TSquareType; penColor, brushColor: TColor);
    // ���Ʒ���
    procedure ShowNextBackGround(); // ����Ԥ�������еı���
    procedure HideNowSquare(s: TSquareArray); // ���ص�ǰ����
    procedure BlinkLine(data: TDataArray; nums: array of integer; len: integer);
    // ��˸�ײ��������ķ�����
    procedure MoveNowSquareToBottomDirectly(var tmpSquare: TSquareArray;
      tmpData: TDataArray); // ��ǰ�������䴦��
    procedure CreateGhostSquare(s: TSquareArray); // ����Ӱ�ӷ���
    procedure ShowGhostSquare(s: TSquareArray; flag: boolean);
    // ��ʾӰ�ӷ���
    procedure ProcessMessage_MESSAGE_SOUND(var MyMessage: TMessage);
      message MESSAGE_SOUND;
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses UnitAbout, UnitThreadSoundRelease;

{$R *.dfm}
{$R Resource.RES}

var
  GCriticalSection: TCriticalSection;
  GThread: TThreadSoundRelease;

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

// ���Ǳ��ֺ��������Ա���󲻳���һǧ�����֡�����û���ҵ����ʵ������ļ���
// 1.wav,2.wav,...,0.wav,bai.wav[��],shi.wav[ʮ],fen.wav[��]��

function PlayCount(p: Pointer): integer; stdcall;
var
  count, bai, shi, ge: integer;
begin
  count := FormMain.GCount;
  ge := count mod 10;
  shi := ((count - ge) mod 100) div 10;
  bai := ((count - shi * 10 - ge) mod 1000) div 100;
  if (bai = 0) and (shi = 0) and (ge = 0) then
    PlaySound(PChar('Wave' + IntToStr(ge)), hInstance, SND_SYNC or SND_RESOURCE)
  else if (bai = 0) and (shi = 0) and (ge <> 0) then
    PlaySound(PChar('Wave' + IntToStr(ge)), hInstance, SND_SYNC or SND_RESOURCE)
  else if (bai = 0) and (shi <> 0) and (ge = 0) then
  begin
    PlaySound(PChar('Wave' + IntToStr(shi)), hInstance,
      SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('WaveShi'), hInstance, SND_SYNC or SND_RESOURCE);
  end
  else if (bai = 0) and (shi <> 0) and (ge <> 0) then
  begin
    PlaySound(PChar('Wave' + IntToStr(shi)), hInstance,
      SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('WaveShi'), hInstance, SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('Wave' + IntToStr(ge)), hInstance,
      SND_SYNC or SND_RESOURCE);
  end
  else if (bai <> 0) and (shi = 0) and (ge = 0) then
  begin
    PlaySound(PChar('Wave' + IntToStr(bai)), hInstance,
      SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('WaveBai'), hInstance, SND_SYNC or SND_RESOURCE);
  end
  else if (bai <> 0) and (shi = 0) and (ge <> 0) then
  begin
    PlaySound(PChar('Wave' + IntToStr(bai)), hInstance,
      SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('WaveBai'), hInstance, SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('Wave0'), hInstance, SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('Wave' + IntToStr(ge)), hInstance,
      SND_SYNC or SND_RESOURCE);
  end
  else if (bai <> 0) and (shi <> 0) and (ge = 0) then
  begin
    PlaySound(PChar('Wave' + IntToStr(bai)), hInstance,
      SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('WaveBai'), hInstance, SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('Wave' + IntToStr(shi)), hInstance,
      SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('WaveShi'), hInstance, SND_SYNC or SND_RESOURCE);
  end
  else if (bai <> 0) and (shi <> 0) and (ge <> 0) then
  begin
    PlaySound(PChar('Wave' + IntToStr(bai)), hInstance,
      SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('WaveBai'), hInstance, SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('Wave' + IntToStr(shi)), hInstance,
      SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('WaveShi'), hInstance, SND_SYNC or SND_RESOURCE);
    PlaySound(PChar('Wave' + IntToStr(ge)), hInstance,
      SND_SYNC or SND_RESOURCE);
  end;
  PlaySound(PChar('WaveFen'), hInstance, SND_SYNC or SND_RESOURCE);
  result := 0;
end;

// ����Ӱ�ӷ���

procedure TFormMain.CreateGhostSquare(s: TSquareArray);
var
  i, j: integer;
begin
  if not bSquare then
    Exit;
  SquareArrayCopyTo(GNowSquare, GGhostSquare);
  while not TouchBottom(GGhostSquare, GData) do
  begin
    for i := 0 to MAX - 1 do
      for j := 0 to MAX - 1 do
        inc(GGhostSquare[i, j].Pos.j);
  end;
end;

// ���Ʊ���

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

// ��������û�з��������

procedure TFormMain.DrawBlankArray(data: TDataArray);
var
  i, j: integer;
begin
  for i := 0 to MAX_X - 1 do
    for j := 0 to MAX_Y - 1 do
      if data[i, j].SquareType = BLANK then
        DrawSquare(data[i, j], GBlankColor, GBlankColor);
end;

// �����ɷ���

procedure TFormMain.EraseOldSquare(s: TSquareArray);
var
  i, j: integer;
begin
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if s[i, j].SquareType = SQUARE then
        DrawSquare(s[i, j], GBlankColor, GBlankColor);
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GCriticalSection.Free;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  // ��ʼ������ȫ�ֱ�����
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
  GBlinkColor := GBlankColor;
  PanelInfo.Color := GInforBackGround;
  bSquare := false;
  bAutoDif := false;
  bGameStart := false;
  bGameRunning := false;
  bSoundRotate := false;
  bShowGhost := true;
  bSoundFall := true;
  bSoundPoint := true;
  bSoundWipeoff := false;
  bSoundMove := false;
  bSoundOver := true;
  bSoundPause := true;
  bBlinking := false;
  bBlink := true;
  SetData(GData, MAX_X, MAX_Y);
  InitData(GData);
  Randomize();
  TimerAutoAddDifficulty.Interval := GTimeAddDif;
  GCriticalSection := TCriticalSection.Create();
  GThread := TThreadSoundRelease.Create(Self);
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FreeData(GData);
end;

procedure TFormMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if bGameRunning and bSquare and (Key = VK_LEFT) then
  begin
    if bSoundMove then
      PlaySound('WaveMove', hInstance, SND_ASYNC or SND_RESOURCE);
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
    if bSoundMove then
      PlaySound('WaveMove', hInstance, SND_ASYNC or SND_RESOURCE);
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
      if bSoundRotate then
        PlaySound('WaveRotate', hInstance, SND_ASYNC or SND_RESOURCE);
      CreateGhostSquare(GGhostSquare);
      ShowGhostSquare(GGhostSquare, true);
      DrawSquareArray(GNowSquare);
    end;
  end
  else if bGameRunning and bSquare and (Key = VK_DOWN) then
  begin
    TimerSquareMove.Enabled := false;
    MoveNowSquareToBottomDirectly(GNowSquare, GData);
    TimerSquareMoveTimer(Sender);
    if not CanGetSquare(GNextSquare) then
    begin
      MenuGameStopClick(Sender);
      if bSoundPoint then
        CreateThread(nil, 0, @PlayCount, nil, 0, GHandle);
      if bSoundOver then
        PlaySound('WaveGameFail', hInstance, SND_ASYNC or SND_RESOURCE);
      MessageBox(Self.Handle, '���ã���Ϸ�����ˣ�', '��Ϸ��Ϣ', MB_OK or MB_ICONINFORMATION);
      Exit;
    end;
    Sleep(NEXTTIME);
    GetSquare(GNowSquare, GNextSquare);
    GenerateNextSquare(GNextSquare, GetRandomNumber(MAXFORM),
      GetRandomNumber(MAX));
    ShowNextSquareArray(GNextSquare);
    TimerSquareMove.Interval := GInterval;
    bSquare := true;
    CreateGhostSquare(GGhostSquare);
    ShowGhostSquare(GGhostSquare, true);
    DrawSquareArray(GNowSquare);
    TimerSquareMove.Enabled := true;
  end
  else if bGameStart and (Key = VK_RETURN) then
  begin
    if bSoundPause then
      PlaySound('WavePause', hInstance, SND_ASYNC or SND_RESOURCE);
    TimerSquareMove.Interval := GInterval;
    TimerSquareMove.Enabled := not TimerSquareMove.Enabled;
    bGameRunning := not bGameRunning;
    if bGameRunning then
      Self.Caption := STRCAPTION
    else
      Self.Caption := STRCAPTION + ' ��ͣ';
  end
  else if Key = VK_ESCAPE then
    Close;
end;

// ���ص�ǰ����

procedure TFormMain.HideNowSquare(s: TSquareArray);
begin
  bSquare := false;
  SquareArrayCopyTo(s, GOldSquare);
  EraseOldSquare(GOldSquare);
end;

procedure TFormMain.MenuGameExitClick(Sender: TObject);
begin
  Close();
end;

procedure TFormMain.MenuGameStartClick(Sender: TObject);
begin
  GCount := 0;
  lblCountContent.Caption := IntToStr(GCount);
  MenuGameStart.Enabled := false;
  MenuGameStop.Enabled := true;
  bGameRunning := true;
  bGameStart := true;
  if MenuBackGroundMusic.Checked then
  begin
    MediaPlayer1.DeviceType := dtAutoSelect;
    MediaPlayer1.Open;
    MediaPlayer1.Play;
  end;
  GenerateNextSquare(GNextSquare, GetRandomNumber(MAXFORM),
    GetRandomNumber(MAX));
  DrawBlankArray(GData);
  TimerSquareMove.Enabled := true;
  if MenuAutoDif.Checked then
    TimerAutoAddDifficulty.Enabled := true;
  Self.Caption := STRCAPTION;
end;

procedure TFormMain.MenuGameStopClick(Sender: TObject);
begin
  TimerSquareMove.Enabled := false;
  TimerAutoAddDifficulty.Enabled := false;
  MediaPlayer1.Stop;
  MenuGameStart.Enabled := true;
  MenuGameStop.Enabled := false;
  FreeData(GData);
  SetData(GData, MAX_X, MAX_Y);
  InitData(GData);
  bSquare := false;
  bGameRunning := false;
  bGameStart := false;
  Self.Caption := STRCAPTION;
end;

procedure TFormMain.MenuHelpAboutClick(Sender: TObject);
var
  fAbout: TAboutBox;
begin
  fAbout := TAboutBox.Create(nil);
  try
    fAbout.ShowModal;
  finally
    fAbout.Free;
  end;
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

procedure TFormMain.MenuColorAddClick(Sender: TObject);
begin
  PopupMenuMainColorAddClick(Sender);
end;

procedure TFormMain.MenuColorBackGroundClick(Sender: TObject);
begin
  PopupMenuMainColorBackGroundClick(Sender);
end;

procedure TFormMain.MenuColorBlinkClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    GBlinkColor := ColorDialog1.Color;
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

procedure TFormMain.MenuSoundFallClick(Sender: TObject);
begin
  MenuSoundFall.Checked := not MenuSoundFall.Checked;
  bSoundFall := MenuSoundFall.Checked;
end;

procedure TFormMain.MenuSoundMoveClick(Sender: TObject);
begin
  bSoundMove := not bSoundMove;
  MenuSoundMove.Checked := bSoundMove;
end;

procedure TFormMain.MenuSoundOverClick(Sender: TObject);
begin
  bSoundOver := not bSoundOver;
  MenuSoundOver.Checked := bSoundOver;
end;

procedure TFormMain.MenuSoundPauseClick(Sender: TObject);
begin
  bSoundPause := not bSoundPause;
  MenuSoundPause.Checked := bSoundPause;
end;

procedure TFormMain.MenuSoundPointClick(Sender: TObject);
begin
  MenuSoundPoint.Checked := not MenuSoundPoint.Checked;
  bSoundPoint := MenuSoundPoint.Checked;
end;

procedure TFormMain.MenuSoundTransformClick(Sender: TObject);
begin
  MenuSoundTransform.Checked := not MenuSoundTransform.Checked;
  bSoundRotate := MenuSoundTransform.Checked;
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

procedure TFormMain.MenuShowGhostClick(Sender: TObject);
begin
  MenuShowGhost.Checked := not MenuShowGhost.Checked;
  bShowGhost := MenuShowGhost.Checked;
end;

// ��ǰ�������䴦��

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
    if GFallTime <> 0 then
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
  bAutoDif := not bAutoDif;
  MenuAutoDif.Checked := bAutoDif;
  TimerAutoAddDifficulty.Enabled := bAutoDif;
  MenuAutoDifChange.Enabled := bAutoDif;
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
  DrawBlankArray(GData);
  DrawBottomArray(GData);
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
  GSquareColor := clRed;
  GOtherColor := clYellow;
  GBlankColor := RGB(0, 0, 64);
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
  GViewBackGroundColor := RGB(0, 0, 64);
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

procedure TFormMain.ProcessMessage_MESSAGE_SOUND(var MyMessage: TMessage);
begin
  OutputDebugString('MESSAGE_SOUND received.');
  if FileExists(GetTempDirectory + 'music.wav') then
  begin
    MediaPlayer1.FileName := GetTempDirectory + 'music.wav';
    MediaPlayer1.DeviceType := dtAutoSelect;
    MediaPlayer1.Open;
  end
  else
    MessageBox(Self.Handle, '�Բ��������ļ���ʱ�����ã�', '��Ϣ', MB_OK);
end;

// ���ڴ�С������Ϸ��С����

procedure TFormMain.SelfChange;
begin
  Self.PanelLeft.Width := MAX_X * MULX + 2 * STARTX;
  Self.ClientHeight := MAX_Y * MULY + 2 * STARTY;
end;

// ��ʾӰ�ӷ���

procedure TFormMain.ShowGhostSquare(s: TSquareArray; flag: boolean);
var
  Color: TColor;
  i, j: integer;
begin
  if not bShowGhost then
    Exit;
  if flag then
    Color := GSquareColor
  else
    Color := GBlankColor;
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if s[i, j].SquareType = SQUARE then
        DrawSquare(s[i, j], Color, GBlankColor);
end;

// ����Ԥ�������еı���

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

// ������һ������

procedure TFormMain.ShowNextSquareArray(var next: TSquareArray);
var
  i, j: integer;
begin
  ShowNextBackGround();
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if next[i, j].SquareType = SQUARE then
        ShowNextSquare(next[i, j], next[i, j].Color, next[i, j].Color);
end;

procedure TFormMain.ShowNextSquare(next: TSquareType;
  penColor, brushColor: TColor);
var
  i, j, x, y: integer;
begin
  i := next.Pos.i - MAX_X div 2 + 2;
  j := next.Pos.j;
  x := IToX(i);
  y := JToY(j);
  with PaintBoxNext do
  begin
    Canvas.Pen.Color := penColor;
    Canvas.Pen.Width := 1;
    Canvas.Brush.Color := brushColor;
    Canvas.Rectangle(x, y, x + LENX, y + LENY);
    Canvas.Pen.Color := GViewBlankColor;
    Canvas.Rectangle(x + 1, y + 1, x + LENX - 1, y + LENY - 1);
  end;
end;

// ���Ƶײ������

procedure TFormMain.DrawBottomArray(data: TDataArray);
var
  i, j: integer;
begin
  for i := 0 to MAX_X - 1 do
    for j := 0 to MAX_Y - 1 do
      if data[i, j].SquareType = OTHER then
        DrawSquare(data[i, j], data[i, j].Color, data[i, j].Color);
end;

// ���Ʒ���
// �������׺õĻ������Գ��Խ�������Ƶø������ۡ�

procedure TFormMain.DrawSquare(s: TSquareType; penColor, brushColor: TColor);
var
  i, j, PosX, PosY: integer;
begin
  i := s.Pos.i;
  j := s.Pos.j;
  PosX := IToX(i);
  PosY := JToY(j);
  with PaintBoxMain do
  begin
    Canvas.Pen.Color := penColor;
    Canvas.Pen.Width := 1;
    Canvas.Brush.Color := brushColor;
    Canvas.Rectangle(PosX, PosY, PosX + LENX, PosY + LENY);
    Canvas.Pen.Color := GBlankColor;
    Canvas.Rectangle(PosX + 1, PosY + 1, PosX + LENX - 1, PosY + LENY - 1);
  end;
end;

// ���������еķ���

procedure TFormMain.DrawSquareArray(s: TSquareArray);
var
  i, j: integer;
begin
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if s[i, j].SquareType = SQUARE then
        DrawSquare(s[i, j], s[i, j].Color, s[i, j].Color);
end;

procedure TFormMain.TimerSquareMoveTimer(Sender: TObject);
var
  num, count, len: integer;
  bDelete, bNeedDelete: boolean;
  nums: array [1 .. MAX_Y] of integer;
begin
  if bSquare then
  begin
    // bSquare = true��ʾ��ǰ�������д����ƶ��еķ���
    if TouchBottom(GNowSquare, GData) then
    begin
      // ��ǰ�����Ѿ��ƶ����ײ������
      AddToBottom(GNowSquare, GData); // ��ӵ�ǰ���鵽�ײ�
      ShowGhostSquare(GGhostSquare, false); // ������ǰ�������Ӱ

      bNeedDelete := NeedDeleteBottom(GData, num); // �ײ��������Ҫ����
      if bSoundFall and (not bNeedDelete) then
        PlaySound('WaveFall', hInstance, SND_ASYNC or SND_RESOURCE);
      DrawBottomArray(GData); // ��ʾ�ײ������
      count := 0;
      bDelete := false;

      if bNeedDelete then
      begin
        len := 0;
        GetNeedDeleteBottom(GData, nums, len); // �õ���Ҫ���������
        count := len;
        if bBlink then
          BlinkLine(GData, nums, len); // ��˸��Ҫ�������
        bDelete := true;
        ProcessBottom(GData, nums, len); // �����
      end;
      if bSoundWipeoff and bDelete then
        PlaySound('WaveDelete', hInstance, SND_ASYNC or SND_RESOURCE);
      GCount := GCount + GetCount(count);
      CreateThread(nil, 0, @ShowCount, nil, 0, GHandle); // �����̶߳�̬��ʾ����
      DrawBottomArray(GData); // �ػ�ײ������
      DrawBlankArray(GData); // �ػ�հ�����
      bSquare := false;
    end
    else
    begin
      // ��ǰ���黹û�д���
      SquareArrayCopyTo(GNowSquare, GOldSquare);
      MoveSquare(GNowSquare, TODOWN);
      EraseOldSquare(GOldSquare);
      DrawSquareArray(GNowSquare);
    end;
  end
  else
  begin
    // bSquare = false��ʾ��ǰ�����治���ڿ��ƶ��ķ���
    if not CanGetSquare(GNextSquare) then
    begin
      // ���ܹ����������ϲ������飬��Ϸ������
      MenuGameStopClick(Sender);
      if bSoundPoint then
        CreateThread(nil, 0, @PlayCount, nil, 0, GHandle);
      if bSoundOver then
        PlaySound('WaveGameFail', hInstance, SND_ASYNC or SND_RESOURCE);
      MessageBox(Self.Handle, '���ã���Ϸ�����ˣ�', '��Ϸ��Ϣ', MB_OK or MB_ICONINFORMATION);
    end
    else
    begin
      // �ܹ����������ϲ������飬��Ϸ�������С�
      Sleep(NEXTTIME);
      GetSquare(GNowSquare, GNextSquare); // �õ���һ������浽��ǰ����
      GenerateNextSquare(GNextSquare, GetRandomNumber(MAXFORM),
        GetRandomNumber(MAX));
      // ����������һ������
      ShowNextSquareArray(GNextSquare); // Ԥ��������ʾ��������һ������
      TimerSquareMove.Interval := GInterval;
      bSquare := true;
      CreateGhostSquare(GGhostSquare); // ������ǰ�������Ӱ����
      ShowGhostSquare(GGhostSquare, true); // ��ʾ��Ӱ����
      DrawSquareArray(GNowSquare); // �������ڻ��Ƶ�ǰ����
    end;
  end;
end;

procedure TFormMain.TimerAutoAddDifficultyTimer(Sender: TObject);
begin
  if (not bGameRunning) or bBlinking then
    Exit;
  TimerSquareMove.Enabled := false;
  Application.ProcessMessages;
  HideNowSquare(GNowSquare);
  ShowGhostSquare(GGhostSquare, false);
  AddSomeToBottom(GData, GAddDifNum);
  DrawBottomArray(GData);
  DrawBlankArray(GData);
  TimerSquareMove.Enabled := true;
end;

procedure TFormMain.MenuBackGroundMusicClick(Sender: TObject);
begin
  if FileExists(GetTempDirectory + 'Music.wav') then
  begin
    MediaPlayer1.FileName := GetTempDirectory + 'Music.wav';
    MediaPlayer1.Open;
    MenuBackGroundMusic.Checked := not MenuBackGroundMusic.Checked;
    if bGameRunning and MenuBackGroundMusic.Checked then
      MediaPlayer1.Play
    else
      MediaPlayer1.Stop;
  end
  else
    MessageBox(Self.Handle, '�Բ��������ļ���ʱ�����ã�', '��Ϣ', MB_OK);
end;

procedure TFormMain.MenuBlinkClick(Sender: TObject);
begin
  bBlink := not bBlink;
  MenuBlink.Checked := bBlink;
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

// ��˸�ײ��������ķ�����

procedure TFormMain.BlinkLine(data: TDataArray; nums: array of integer;
  len: integer);
var
  start, i, j, k: integer;
begin
  if len <= 0 then
    Exit;
  bBlinking := true;
  for k := 1 to 3 do
  begin
    for start := 1 to len do
    begin
      j := nums[start];
      for i := 0 to MAX_X - 1 do
        DrawSquare(data[i, j], GBlinkColor, GBlinkColor);
    end;
    Sleep(BLINKTIME div 6);
    for start := 1 to len do
    begin
      j := nums[start];
      for i := 0 to MAX_X - 1 do
        DrawSquare(data[i, j], data[i, j].Color, data[i, j].Color);
    end;
    Sleep(BLINKTIME div 6);
  end;
  bBlinking := false;
end;

end.
