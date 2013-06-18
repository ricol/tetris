unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, StdCtrls, Buttons, BestScor, ImgList, ComCtrls;

type
  TFormMain = class(TForm)
    Panel1: TPanel;
    Image: TImage;
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Nouveau1: TMenuItem;
    N1: TMenuItem;
    Quitter1: TMenuItem;
    ImageList: TImageList;
    B_fond: TSpeedButton;
    TimerChute: TTimer;
    Pause1: TMenuItem;
    Jeu1: TMenuItem;
    Niveaudedpart1: TMenuItem;
    Dificult1: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N12: TMenuItem;
    N22: TMenuItem;
    N32: TMenuItem;
    N42: TMenuItem;
    N52: TMenuItem;
    N62: TMenuItem;
    N72: TMenuItem;
    N82: TMenuItem;
    N92: TMenuItem;
    N4: TMenuItem;
    MeilleursScores1: TMenuItem;
    N01: TMenuItem;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Label1: TLabel;
    L_Score: TLabel;
    Label3: TLabel;
    L_Niveau: TLabel;
    MotifLst: TImageList;
    Label2: TLabel;
    L_Lignes: TLabel;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure Nouveau1Click(Sender: TObject);
    procedure Pause1Click(Sender: TObject);
    procedure Quitter1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerChuteTimer(Sender: TObject);
    procedure Createpiece;
    procedure Draw;
    function Rotate: boolean;
    function Move(x, y: integer): boolean;
    procedure SupprimeLigne;
    procedure CheckedRefresh;
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure N01Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure N82Click(Sender: TObject);
    procedure N92Click(Sender: TObject);
    procedure MeilleursScores1Click(Sender: TObject);
    { procedure APropos1Click(Sender: TObject);
      procedure AlAide1Click(Sender: TObject);
      procedure LeJeu1Click(Sender: TObject); }
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  PieceType = record
    x: Byte;
    y: Byte;
    Num: Byte;
    Etat: Byte;
    Forme: array [1 .. 16] of boolean;
    FormePrec: array [1 .. 16] of boolean;
  end;

const
  T_piece: array [0 .. 27] of Word = (52224, 52224, 52224, 52224, 50240, 59392,
    35008, 11776, 51328, 36352, 17600, 57856, 35904, 27648, 35904, 27648, 19584,
    50688, 19584, 50688, 19968, 19520, 3648, 17984, 17476, 61440, 17476, 61440);
  T_Speed: array [1 .. 10] of Word = (350, 320, 290, 260, 230, 200, 170,
    140, 110, 80);
  T_Points: array [0 .. 4] of Word = (0, 100, 300, 600, 1000);
  T_Clig: array [0 .. 1] of Word = (100, 150);

var
  FormMain: TFormMain;
  Piece: PieceType;
  PieceSuiv: PieceType;
  anim: Byte;
  Nbsup: Byte;
  Difficult: Byte;
  NiveauDep: Byte;
  nblignes: Word;
  score: Word;
  winner: boolean;
  EnPartie: boolean;
  T_sup: array [1 .. 4] of Byte;
  T_jeu: array [0 .. 11, 0 .. 19] of Byte;
  T_anim: array [1 .. 4, 0 .. 10] of Byte;

implementation

{$R *.DFM}

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.FormCreate(Sender: TObject);
var
  i: Byte;
begin
  EnPartie := False;
  Application.onActivate := Pause1Click;
  Application.onDeActivate := Pause1Click;
  Clientwidth := 408;
  Clientheight := 408 + StatusBar1.Height;
  NiveauDep := 1;
  Difficult := 0;
  randomize;
  Image.canvas.Draw(0, 0, B_fond.glyph);
  for i := 1 to 18 do
    T_jeu[0, i] := 9;
  for i := 1 to 18 do
    T_jeu[11, i] := 9;
  for i := 0 to 11 do
    T_jeu[i, 18] := 9;
  TimerChute.Interval := T_Speed[nblignes div 10 + NiveauDep];
  L_Score.caption := inttostr(score);
  L_Niveau.caption := inttostr(nblignes div 10 + NiveauDep);
  L_Lignes.caption := inttostr(nblignes);
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.Nouveau1Click(Sender: TObject);
var
  i, j: Byte;
  w: Word;
begin
  EnPartie := True;
  score := 500 * (Difficult + NiveauDep - 1);
  nblignes := 0;
  for i := 0 to 27 do
    for j := 0 to 25 do
      MotifLst.Draw(canvas, 16 * i, 16 * j,
        (nblignes div 10 + NiveauDep - 1) mod 9);
  L_Score.caption := inttostr(score);
  L_Niveau.caption := inttostr(nblignes div 10 + NiveauDep);
  L_Lignes.caption := inttostr(nblignes);
  TimerChute.Interval := T_Speed[nblignes div 10 + NiveauDep];
  TimerChute.Enabled := True;
  for i := 1 to 10 do
    for j := 1 to 17 do
      T_jeu[i, j] := 0;
  for i := 1 to 7 * Difficult do
    T_jeu[Random(10) + 1, 17 - Random(Difficult)] := Random(8);
  PieceSuiv.Num := Random(7);
  Piece.y := 1;
  w := T_piece[4 * PieceSuiv.Num];
  for i := 0 to 15 do
  begin
    PieceSuiv.Forme[16 - i] := (w mod 2 = 1);
    w := w div 2;
  end;
  Createpiece;
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.Pause1Click(Sender: TObject);
begin
  if not(EnPartie) then
    exit;
  Pause1.Checked := Not(Pause1.Checked);
  TimerChute.Enabled := Not(Pause1.Checked);
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.Quitter1Click(Sender: TObject);
begin
  close;
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((anim > 0) or (not(EnPartie) and (Key <> 27))) then
    exit;
  { VK_Left  := 37 }  { VK_Right := 39 }
  { VK_Up    := 38 }  { VK_Down  := 40 }  { Vk_Esc   := 27 }
  case Key of
    { esc } 27:
      close;
    { left } 37:
      Move(-1, 0);
    { up } 38:
      Rotate;
    { right } 39:
      Move(1, 0);
    { bottom } 40:
      Move(0, 1);
  end;
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.TimerChuteTimer(Sender: TObject);
var
  i, j, k: Byte;
begin
  if (anim > 0) then
  begin
    TimerChute.Interval := T_Clig[anim mod 2];
    if (anim mod 2 = 1) then
    begin
      for i := 1 to Nbsup do
        for j := 1 to 10 do
          T_jeu[j, T_sup[i]] := T_anim[i, j];
    end
    else
    begin
      for i := 1 to Nbsup do
        for j := 1 to 10 do
          T_jeu[j, T_sup[i]] := 0;
    end;
    dec(anim);
    if (anim = 0) then
    begin
      Image.canvas.Draw(0, 0, B_fond.glyph);
      for k := 1 to Nbsup do
        for j := T_sup[k] downto 2 do
          for i := 1 to 10 do
            T_jeu[i, j] := T_jeu[i, j - 1];
      inc(score, T_Points[Nbsup]);
      inc(nblignes, Nbsup);
      L_Score.caption := inttostr(score);
      L_Niveau.caption := inttostr(nblignes div 10 + NiveauDep);
      L_Lignes.caption := inttostr(nblignes);
      TimerChute.Interval := T_Speed[nblignes div 10 + NiveauDep];
      for i := 0 to 27 do
        for j := 0 to 25 do
          MotifLst.Draw(canvas, 16 * i, 16 * j,
            (nblignes div 10 + NiveauDep - 1) mod 9);
      Createpiece;
    end;
    Draw;
    exit;
  end;
  if not(Move(0, 1)) then
  begin
    for i := 0 to 15 do
      if Piece.Forme[i + 1] then
        T_jeu[Piece.x + i mod 4, Piece.y + i div 4] := Piece.Num + 1;
    SupprimeLigne;
  end;
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.Createpiece;
var
  i: Byte;
  w: Word;
begin
  if (Piece.y = 0) then
  begin
    TimerChute.Enabled := False;
    winner := True;
    with TBestScorDlg.Create(Self) do
      try
        ShowModal;
      finally
        Free;
      end;
    winner := False;
    EnPartie := False;
    Piece.y := 5;
    exit;
  end;
  Piece.Num := PieceSuiv.Num;
  PieceSuiv.Num := Random(7);
  w := T_piece[4 * PieceSuiv.Num];
  for i := 0 to 15 do
  begin
    PieceSuiv.Forme[16 - i] := (w mod 2 = 1);
    w := w div 2;
  end;
  Image1.canvas.Brush.color := clblack;
  Image1.canvas.fillrect(rect(0, 0, 60, 80));
  for i := 0 to 15 do
    if PieceSuiv.Forme[i + 1] then
      ImageList.DrawOverlay(Image1.canvas, 20 * (i mod 4), 20 * (i div 4),
        PieceSuiv.Num, 1);
  w := T_piece[4 * Piece.Num];
  Piece.Etat := 0;
  Piece.x := 4;
  Piece.y := 0;
  for i := 0 to 15 do
  begin
    Piece.Forme[16 - i] := (w mod 2 = 1);
    w := w div 2;
  end;
  Draw;
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.Draw;
var
  m, n: Byte;
begin
  Image.canvas.Draw(0, 0, B_fond.glyph);
  for m := 1 to 10 do
    for n := 1 to 17 do
      if (T_jeu[m, n] > 0) then
        ImageList.DrawOverlay(Image.canvas, 20 * m, 20 * n, T_jeu[m, n] - 1, 1);
  for m := 0 to 15 do
    if (Piece.Forme[m + 1] and (anim = 0)) then
      ImageList.DrawOverlay(Image.canvas, 20 * (Piece.x + m mod 4),
        20 * (Piece.y + m div 4), Piece.Num, 1);
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
function TFormMain.Rotate: boolean;
var
  formesav: array [1 .. 16] of boolean;
  i: Byte;
  w: Word;
begin
  for i := 1 to 16 do
    formesav[i] := Piece.Forme[i];
  inc(Piece.Etat);
  w := T_piece[4 * Piece.Num + Piece.Etat mod 4];
  for i := 0 to 15 do
  begin
    Piece.Forme[16 - i] := (w mod 2 = 1);
    w := w div 2;
  end;
  result := True;
  for i := 0 to 15 do
    if (Piece.Forme[i + 1] and (T_jeu[Piece.x + i mod 4, Piece.y + i div 4]
      > 0)) then
      result := False;
  if result then
    Draw
  else
  begin
    dec(Piece.Etat);
    for i := 1 to 16 do
      Piece.Forme[i] := formesav[i];
  end;
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
function TFormMain.Move(x, y: integer): boolean;
var
  i: Byte;
begin
  result := True;
  for i := 0 to 15 do
    if (Piece.Forme[i + 1] and (T_jeu[Piece.x + x + i mod 4,
      Piece.y + y + i div 4] > 0)) then
      result := False;
  if result then
  begin
    inc(Piece.x, x);
    inc(Piece.y, y);
    Draw;
  end;
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.SupprimeLigne;
var
  sup: boolean;
  i, j: Byte;
begin
  Nbsup := 0;
  for i := 1 to 4 do
    T_sup[i] := 0;
  for j := 1 to 17 do
  begin
    sup := True;
    for i := 1 to 10 do
      if (T_jeu[i, j] = 0) then
        sup := False;
    if sup then
      inc(Nbsup);
    if sup then
      T_sup[Nbsup] := j;
  end;
  if (Nbsup > 0) then
  begin
    anim := 6;
    TimerChute.Interval := 20;
    for i := 1 to Nbsup do
      for j := 1 to 10 do
        T_anim[i, j] := T_jeu[j, T_sup[i]];
  end
  else
    Createpiece;
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.CheckedRefresh;
begin
  N11.Checked := False;
  N21.Checked := False;
  N31.Checked := False;
  N41.Checked := False;
  N51.Checked := False;
  N61.Checked := False;
  N71.Checked := False;
  N81.Checked := False;
  N91.Checked := False;
  N01.Checked := False;
  N12.Checked := False;
  N22.Checked := False;
  N32.Checked := False;
  N42.Checked := False;
  N52.Checked := False;
  N62.Checked := False;
  N72.Checked := False;
  N82.Checked := False;
  N92.Checked := False;
  case NiveauDep of
    1:
      N11.Checked := True;
    2:
      N21.Checked := True;
    3:
      N31.Checked := True;
    4:
      N41.Checked := True;
    5:
      N51.Checked := True;
    6:
      N61.Checked := True;
    7:
      N71.Checked := True;
    8:
      N81.Checked := True;
    9:
      N91.Checked := True;
  end;
  case Difficult of
    0:
      N01.Checked := True;
    1:
      N12.Checked := True;
    2:
      N22.Checked := True;
    3:
      N32.Checked := True;
    4:
      N42.Checked := True;
    5:
      N52.Checked := True;
    6:
      N62.Checked := True;
    7:
      N72.Checked := True;
    8:
      N82.Checked := True;
    9:
      N92.Checked := True;
  end;
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.N11Click(Sender: TObject);
begin
  NiveauDep := 1;
  CheckedRefresh;
end;

procedure TFormMain.N21Click(Sender: TObject);
begin
  NiveauDep := 2;
  CheckedRefresh;
end;

procedure TFormMain.N31Click(Sender: TObject);
begin
  NiveauDep := 3;
  CheckedRefresh;
end;

procedure TFormMain.N41Click(Sender: TObject);
begin
  NiveauDep := 4;
  CheckedRefresh;
end;

procedure TFormMain.N51Click(Sender: TObject);
begin
  NiveauDep := 5;
  CheckedRefresh;
end;

procedure TFormMain.N61Click(Sender: TObject);
begin
  NiveauDep := 6;
  CheckedRefresh;
end;

procedure TFormMain.N71Click(Sender: TObject);
begin
  NiveauDep := 7;
  CheckedRefresh;
end;

procedure TFormMain.N81Click(Sender: TObject);
begin
  NiveauDep := 8;
  CheckedRefresh;
end;

procedure TFormMain.N91Click(Sender: TObject);
begin
  NiveauDep := 9;
  CheckedRefresh;
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.N01Click(Sender: TObject);
begin
  Difficult := 0;
  CheckedRefresh;
end;

procedure TFormMain.N12Click(Sender: TObject);
begin
  Difficult := 1;
  CheckedRefresh;
end;

procedure TFormMain.N22Click(Sender: TObject);
begin
  Difficult := 2;
  CheckedRefresh;
end;

procedure TFormMain.N32Click(Sender: TObject);
begin
  Difficult := 3;
  CheckedRefresh;
end;

procedure TFormMain.N42Click(Sender: TObject);
begin
  Difficult := 4;
  CheckedRefresh;
end;

procedure TFormMain.N52Click(Sender: TObject);
begin
  Difficult := 5;
  CheckedRefresh;
end;

procedure TFormMain.N62Click(Sender: TObject);
begin
  Difficult := 6;
  CheckedRefresh;
end;

procedure TFormMain.N72Click(Sender: TObject);
begin
  Difficult := 7;
  CheckedRefresh;
end;

procedure TFormMain.N82Click(Sender: TObject);
begin
  Difficult := 8;
  CheckedRefresh;
end;

procedure TFormMain.N92Click(Sender: TObject);
begin
  Difficult := 9;
  CheckedRefresh;
end;

{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ----------------------------------------------------------------------------------------------
  procedure TForm1.APropos1Click(Sender: TObject);
  begin
  Pause1Click(sender);
  with TAProposDlg.Create(Self) do
  try
  ShowModal;
  finally
  Free;
  end;
  Pause1Click(sender);
  end;
  {---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ----------------------------------------------------------------------------------------------
  procedure TForm1.AlAide1Click(Sender: TObject);
  begin
  Pause1Click(sender);
  with TReglesDlg.Create(Self) do
  try
  ShowModal;
  finally
  Free;
  end;
  Pause1Click(sender);
  end;
  {---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
procedure TFormMain.MeilleursScores1Click(Sender: TObject);
var
  reprise: boolean;
begin
  reprise := TimerChute.Enabled;
  TimerChute.Enabled := False;
  winner := False;
  with TBestScorDlg.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
  TimerChute.Enabled := reprise;
end;
{ ---------------------------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------------------------- }
{ ----------------------------------------------------------------------------------------------
  procedure TForm1.LeJeu1Click(Sender: TObject);
  begin
  Pause1Click(sender);
  with TLeJeuDlg.Create(Self) do
  try
  ShowModal;
  finally
  Free;
  end;
  Pause1Click(sender);
  end;
}

end.
