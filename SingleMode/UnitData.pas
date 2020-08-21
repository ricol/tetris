unit UnitData;

interface

uses
  Messages, Windows, SysUtils, UnitCommon;

function GetCount(count: integer): integer;
function RGB(r, g, b: Byte): LongWord;
function GetTempDirectory(): string;
function GetColor(n: integer): TColor;
procedure GenerateNextSquare(var next: TSquareArray; m, n: integer);
// 随机产生下一个方块
function CanGetSquare(s: TSquareArray): boolean;
// 是否能在主窗口显示下一个方块
procedure GetSquare(var s, next: TSquareArray);
procedure ChangeSquare(m: integer; var s: TSquareArray); // 方块变形
// 当前方块是否能在主窗口中变形
function CanChangeSquare(m: integer; var s: TSquareArray): boolean;
procedure MoveSquare(var s: TSquareArray; direction: TDirection);
procedure SetData(var data: TDataArray; x: integer; y: integer);
procedure FreeData(var data: TDataArray);
procedure InitData(var data: TDataArray);
// 方块在数组中位置到窗口具体位置的转换
function IToX(i: integer): integer;
function JToY(j: integer): integer;
function TouchBottom(s: TSquareArray; bottom: TDataArray): boolean;
procedure AddToBottom(s: TSquareArray; var bottom: TDataArray);
function NeedDeleteBottom(data: TDataArray; var num: integer): boolean;
function GetRandomType(): TType;
procedure DataToData(var source, target: TSquareType);
procedure SquareArrayCopyTo(var source, target: TSquareArray);
function IsNum(c: Char): boolean;
function IsNumber(s: string): boolean;
procedure GetNeedDeleteBottom(data: TDataArray; var nums: array of integer;
  var len: integer);
// 处理底部方块堆
procedure ProcessBottom(data: TDataArray; nums: array of integer; len: integer);
// 给底部方块堆添加未消行，以增加难度
procedure AddSomeToBottom(var data: TDataArray; num: integer);
function GetRandomNumber(n: integer): cardinal;

implementation

uses UnitMain;

function GetRandomNumber(n: integer): cardinal;
var
  i, num: integer;
begin
  num := random(n);
  result := num;
  for i := 0 to num do
    result := random(n);
end;

// 根据消去的行数算应得的分数

function GetCount(count: integer): integer;
begin
  case count of
    1:
      result := 1 * COUNTMUL;
    2:
      result := 3 * COUNTMUL;
    3:
      result := 6 * COUNTMUL;
    4:
      result := 10 * COUNTMUL;
  else
    result := 0;
  end;
end;

function RGB(r, g, b: Byte): LongWord;
begin
  result := (r or (g shl 8) or (b shl 16));
end;

function GetTempDirectory(): string;
var
  i: integer;
  Path: array [1 .. 255] of Char;
begin
  for i := 1 to 255 do
    Path[i] := #$0;
  GetTempPath(255, PChar(@Path));
  result := Trim(string(Path));
end;

function IsNum(c: Char): boolean;
begin
  try
    StrToInt(c);
    result := true;
  except
    result := false;
  end;
end;

function IsNumber(s: string): boolean;
var
  i, len: integer;
begin
  len := Length(s);
  result := true;
  for i := 1 to len do
  begin
    if not IsNum(s[i]) then
    begin
      result := false;
      exit;
    end;
  end;
end;

procedure AddSomeToBottom(var data: TDataArray; num: integer);
var
  i, j: integer;
begin
  for i := 0 to MAX_X - 1 do
    for j := 0 to MAX_Y - 1 - num do
    begin
      data[i, j].SquareType := data[i, j + num].SquareType;
      data[i, j].Pos.i := data[i, j + num].Pos.i;
      data[i, j].Pos.j := data[i, j + num].Pos.j - num;
      data[i, j].Color := data[i, j + num].Color;
    end;
  for j := MAX_Y - 1 - num + 1 to MAX_Y - 1 do
  begin
    for i := 0 to MAX_X - 1 do
    begin
      data[i, j].SquareType := GetRandomType();
      data[i, j].Color := GOtherColor;
      data[i, j].Pos.i := i;
      data[i, j].Pos.j := j;
    end;
  end;
end;

procedure GenerateNextSquare(var next: TSquareArray; m, n: integer);
var
  i, j, num: integer;
begin
  GNextI := m;
  GNextJ := n;
  num := GForm[GNextI, GNextJ];
  for j := 0 to MAX - 1 do
    for i := 0 to MAX - 1 do
    begin
      if ((num shl (j * 4 + i)) and $8000) = $8000 then
        next[i, j].SquareType := SQUARE
      else
        next[i, j].SquareType := BLANK;
      next[i, j].Pos.i := i + MAX_X div 2 - 2;
      next[i, j].Pos.j := j;
      next[i, j].Color := GetColor(GNextI);
    end;
end;

function CanGetSquare(s: TSquareArray): boolean;
var
  i, j, m, n: integer;
begin
  result := true;
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if s[i, j].SquareType = SQUARE then
      begin
        m := s[i, j].Pos.i;
        n := s[i, j].Pos.j;
        if GData[m, n].SquareType = OTHER then
        begin
          result := false;
          exit;
        end;
      end;
end;

procedure GetSquare(var s, next: TSquareArray);
var
  i, j: integer;
begin
  GNowI := GNextI;
  GNowJ := GNextJ;
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
    begin
      s[i, j].SquareType := next[i, j].SquareType;
      s[i, j].Pos := next[i, j].Pos;
      s[i, j].Color := next[i, j].Color;
    end;
end;

function GetColor(n: integer): TColor;
begin
  case n of
    0:
      result := RGB(0, 255, 128);
    1:
      result := RGB(128, 128, 255);
    2:
      result := RGB(255, 255, 0);
    3:
      result := RGB(255, 0, 0);
    4:
      result := RGB(255, 0, 255);
    5:
      result := RGB(128, 255, 255);
    6:
      result := RGB(255, 128, 64);
  else
    result := GSquareColor;
  end;
end;

function GetRandomType(): TType;
begin
  if random(10) > 1 then
    result := OTHER
  else
    result := BLANK;
end;

function CanChangeSquare(m: integer; var s: TSquareArray): boolean;
var
  i, j, num, OldJ, ii, jj: integer;
begin
  SquareArrayCopyTo(s, GTmpSquare);
  OldJ := m;
  m := m + 1;
  if m > 3 then
    m := 0;
  GNowJ := m;
  num := GForm[GNowI, GNowJ];
  for j := 0 to MAX - 1 do
    for i := 0 to MAX - 1 do
      if ((num shl (j * 4 + i)) and $8000) = $8000 then
        s[i, j].SquareType := SQUARE
      else
        s[i, j].SquareType := BLANK;
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
    begin
      if s[i, j].SquareType = SQUARE then
      begin
        ii := s[i, j].Pos.i;
        jj := s[i, j].Pos.j;
        if (ii < 0) or (ii > MAX_X - 1) or (jj < 0) or (jj > MAX_Y - 1) or
          (GData[ii, jj].SquareType = OTHER) then
        begin
          result := false;
          SquareArrayCopyTo(GTmpSquare, s);
          GNowJ := OldJ;
          exit;
        end;
      end;
    end;
  result := true;
  SquareArrayCopyTo(GTmpSquare, s);
  GNowJ := OldJ;
end;

procedure ChangeSquare(m: integer; var s: TSquareArray);
var
  i, j, num: integer;
begin
  m := m + 1;
  if m > 3 then
    m := 0;
  GNowJ := m;
  num := GForm[GNowI, GNowJ];
  for j := 0 to MAX - 1 do
    for i := 0 to MAX - 1 do
      if ((num shl (j * 4 + i)) and $8000) = $8000 then
        s[i, j].SquareType := SQUARE
      else
        s[i, j].SquareType := BLANK;
end;

function NeedDeleteBottom(data: TDataArray; var num: integer): boolean;
var
  i, j: integer;
begin
  result := false;
  num := -1;
  for j := MAX_Y downto 0 do
  begin
    num := j;
    for i := 0 to MAX_X - 1 do
    begin
      if data[i, j].SquareType <> OTHER then
      begin
        num := -1;
        break;
      end;
    end;
    if num <> -1 then
    begin
      result := true;
      exit;
    end;
  end;
end;

procedure GetNeedDeleteBottom(data: TDataArray; var nums: array of integer;
  var len: integer);
var
  i, j: integer;
  flag: boolean;
begin
  len := 0;
  for j := MAX_Y - 1 downto 0 do
  begin
    flag := true;
    for i := 0 to MAX_X - 1 do
    begin
      if data[i, j].SquareType <> OTHER then
      begin
        flag := false;
        break;
      end;
    end;
    if flag then
    begin
      inc(len);
      nums[len] := j;
    end;
  end;
end;

// 需要优化

procedure ProcessBottom(data: TDataArray; nums: array of integer; len: integer);
var
  i, j, num: integer;
begin
  if len <= 0 then
    exit;
  while NeedDeleteBottom(data, num) do
  begin
    for i := 0 to MAX_X - 1 do
      for j := num - 1 downto 0 do
      begin
        data[i, j + 1].SquareType := data[i, j].SquareType;
        data[i, j + 1].Color := data[i, j].Color;
        data[i, j + 1].Pos.i := data[i, j].Pos.i;
        data[i, j + 1].Pos.j := data[i, j].Pos.j + 1;
      end;
  end;
end;

function TouchBottom(s: TSquareArray; bottom: TDataArray): boolean;
var
  i, j, m, n: integer;
begin
  result := false;
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if s[i, j].SquareType = SQUARE then
      begin
        m := s[i, j].Pos.i;
        n := s[i, j].Pos.j + 1;
        if (n = MAX_Y) or (bottom[m, n].SquareType = OTHER) then
        begin
          result := true;
          exit;
        end;
      end;
end;

procedure AddToBottom(s: TSquareArray; var bottom: TDataArray);
var
  i, j, m, n: integer;
begin
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if s[i, j].SquareType = SQUARE then
      begin
        m := s[i, j].Pos.i;
        n := s[i, j].Pos.j;
        bottom[m, n].SquareType := OTHER;
        bottom[m, n].Color := s[i, j].Color;
        bottom[m, n].Pos := s[i, j].Pos;
      end;
end;

procedure DataToData(var source, target: TSquareType);
begin
  target.SquareType := source.SquareType;
  target.Pos := source.Pos;
  target.Color := source.Color;
end;

procedure SquareArrayCopyTo(var source, target: TSquareArray);
var
  i, j: integer;
begin
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      DataToData(source[i, j], target[i, j]);
end;

procedure MoveSquare(var s: TSquareArray; direction: TDirection);
var
  i, j, m, n: integer;
begin
  case direction of
    TOUP:
      ;
    TODOWN:
      begin
        SquareArrayCopyTo(s, GTmpSquare);
        for i := 0 to MAX - 1 do
          for j := 0 to MAX - 1 do
          begin
            if (s[i, j].SquareType = SQUARE) and (s[i, j].Pos.j >= MAX_Y - 1)
            then
            begin
              SquareArrayCopyTo(GTmpSquare, s);
              exit;
            end
            else
              s[i, j].Pos.j := s[i, j].Pos.j + 1;
          end;
      end;
    TORIGHT:
      begin
        SquareArrayCopyTo(s, GTmpSquare);
        for i := 0 to MAX - 1 do
          for j := 0 to MAX - 1 do
          begin
            m := s[i, j].Pos.i;
            n := s[i, j].Pos.j;
            if (s[i, j].SquareType = SQUARE) and (m + 1 <= MAX_X - 1) and
              (GData[m + 1, n].SquareType = OTHER) then
            begin
              SquareArrayCopyTo(GTmpSquare, s);
              exit;
            end
            else if (s[i, j].SquareType = SQUARE) and
              (s[i, j].Pos.i >= MAX_X - 1) then
            begin
              SquareArrayCopyTo(GTmpSquare, s);
              exit;
            end
            else
              s[i, j].Pos.i := s[i, j].Pos.i + 1;
          end;
      end;
    TOLEFT:
      begin
        SquareArrayCopyTo(s, GTmpSquare);
        for i := 0 to MAX - 1 do
          for j := 0 to MAX - 1 do
          begin
            m := s[i, j].Pos.i;
            n := s[i, j].Pos.j;
            if (s[i, j].SquareType = SQUARE) and (m - 1 >= 0) and
              (GData[m - 1, n].SquareType = OTHER) then
            begin
              SquareArrayCopyTo(GTmpSquare, s);
              exit;
            end
            else if (s[i, j].SquareType = SQUARE) and (s[i, j].Pos.i <= 0) then
            begin
              SquareArrayCopyTo(GTmpSquare, s);
              exit;
            end
            else
              s[i, j].Pos.i := s[i, j].Pos.i - 1;
          end;
      end;
  end;
end;

procedure SetData(var data: TDataArray; x: integer; y: integer);
begin
  SetLength(data, x, y);
end;

procedure FreeData(var data: TDataArray);
begin
  SetLength(data, 0, 0);
end;

procedure InitData(var data: TDataArray);
var
  i, j: integer;
begin
  for i := 0 to MAX_X - 1 do
    for j := 0 to MAX_Y - 1 do
    begin
      data[i, j].SquareType := BLANK;
      data[i, j].Color := clBlack;
      data[i, j].Pos.i := i;
      data[i, j].Pos.j := j;
    end;
end;

function IToX(i: integer): integer;
begin
  result := i * MULX + STARTX;
end;

function JToY(j: integer): integer;
begin
  result := j * MULY + STARTY;
end;

end.
