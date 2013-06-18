unit UnitData;

interface

uses
  Messages, Windows, SysUtils, UnitCommon;

function RGB(r, g, b: Byte): LongWord;
function GetTempDirectory(): string;
function GetColor(tmpNum: integer): TColor;
procedure GenerateNextSquare(var tmpNextSquare: TSquareArray; tmpI, tmpJ:
  integer);
function CanGetSquare(tmpSquare: TSquareArray): boolean;
procedure GetSquare(var tmpSquare, tmpNextSquare: TSquareArray);
procedure ChangeSquare(tmpJ: integer; var tmpSquare: TSquareArray);
function CanChangeSquare(tmpJ: integer; var tmpSquare: TSquareArray): boolean;
procedure MoveSquare(var tmpSquare: TSquareArray; tmpDirection: TDirection);
procedure SetData(var tmpData: TDataArray; tmpX: integer; tmpY: integer);
procedure FreeData(var tmpData: TDataArray);
procedure InitData(var tmpData: TDataArray);
function IToX(i: integer): integer;
function JToY(j: integer): integer;
function TouchBottom(tmpSquare: TSquareArray; tmpBottom: TDataArray): boolean;
procedure AddToBottom(tmpSquare: TSquareArray; var tmpBottom: TDataArray);
function NeedDeleteBottom(tmpData: TDataArray; var num: integer): boolean;
procedure ChangeBottom(var tmpData: TDataArray; num: integer);
function GetRandomType(): TType;
procedure DataToData(var tmpSource, tmpTarget: TSquareType);
procedure SquareArrayCopyTo(var tmpSource, tmpTarget: TSquareArray);
function IsNum(tmpC: Char): boolean;
function IsNumber(tmp: string): boolean;

implementation

function RGB(r, g, b: Byte): LongWord;
begin
  Result := (r or (g shl 8) or (b shl 16));
end;

function GetTempDirectory(): string;
var
  i: integer;
  Path: array[1..255] of char;
begin
  for i := 1 to 255 do
    Path[i] := #$0;
  GetTempPath(255, PChar(@Path));
  Result := Trim(string(Path));
end;

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

procedure GenerateNextSquare(var tmpNextSquare: TSquareArray; tmpI, tmpJ:
  integer);
var
  i, j, num: integer;
begin
  GNextI := tmpI;
  GNextJ := tmpJ;
  num := GForm[GNextI, GNextJ];
  for j := 0 to MAX - 1 do
    for i := 0 to MAX - 1 do
      if ((num shl (j * 4 + i)) and $8000) = $8000 then
      begin
        tmpNextSquare[i, j].SquareType := SQUARE;
        tmpNextSquare[i, j].Pos.i := i + MAX_X div 2 - 2;
        tmpNextSquare[i, j].Pos.j := j;
        tmpNextSquare[i, j].Color := GetColor(GNextI);
      end
      else
      begin
        tmpNextSquare[i, j].SquareType := BLANK;
        tmpNextSquare[i, j].Pos.i := i + MAX_X div 2 - 2;
        tmpNextSquare[i, j].Pos.j := j;
        tmpNextSquare[i, j].Color := GetColor(GNextI);
      end;
end;

function CanGetSquare(tmpSquare: TSquareArray): boolean;
var
  i, j, tmpI, tmpJ: integer;
begin
  result := true;
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if tmpSquare[i, j].SquareType = SQUARE then
      begin
        tmpI := tmpSquare[i, j].Pos.i;
        tmpJ := tmpSquare[i, j].Pos.j;
        if Data[tmpI, tmpJ].SquareType = OTHER then
        begin
          result := false;
          exit;
        end;
      end;
end;

procedure GetSquare(var tmpSquare, tmpNextSquare: TSquareArray);
var
  i, j: integer;
begin
  GNowI := GNextI;
  GNowJ := GNextJ;
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
    begin
      tmpSquare[i, j].SquareType := tmpNextSquare[i, j].SquareType;
      tmpSquare[i, j].Pos := tmpNextSquare[i, j].Pos;
      tmpSquare[i, j].Color := tmpNextSquare[i, j].Color;
    end;
end;

function GetColor(tmpNum: integer): TColor;
begin
  case tmpNum of
    0: Result := RGB(0, 255, 128);
    1: Result := RGB(128, 128, 255);
    2: Result := RGB(255, 255, 0);
    3: Result := RGB(255, 0, 0);
    4: Result := RGB(255, 0, 255);
    5: Result := RGB(128, 255, 255);
    6: Result := RGB(255, 128, 64);
  else
    Result := GSquareColor;
  end;
end;

function GetRandomType(): TType;
begin
  if random(10) > 1 then
    result := OTHER
  else
    result := BLANK;
end;

function CanChangeSquare(tmpJ: integer; var tmpSquare: TSquareArray): boolean;
var
  i, j, num, OldJ, tmpII, tmpJJ: integer;
begin
  SquareArrayCopyTo(tmpSquare, GTmpSquare);
  OldJ := tmpJ;
  tmpJ := tmpJ + 1;
  if tmpJ > 3 then
    tmpJ := 0;
  GNowJ := tmpJ;
  num := GForm[GNowI, GNowJ];
  for j := 0 to MAX - 1 do
    for i := 0 to MAX - 1 do
      if ((num shl (j * 4 + i)) and $8000) = $8000 then
        tmpSquare[i, j].SquareType := SQUARE
      else
        tmpSquare[i, j].SquareType := BLANK;
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
    begin
      if tmpSquare[i, j].SquareType = SQUARE then
      begin
        tmpII := tmpSquare[i, j].Pos.i;
        tmpJJ := tmpSquare[i, j].Pos.j;
        if (tmpII < 0) or (tmpII > MAX_X - 1) or (tmpJJ < 0) or (tmpJJ > MAX_Y -
          1) or (Data[tmpII, tmpJJ].SquareType = OTHER) then
        begin
          result := false;
          SquareArrayCopyTo(GTmpSquare, tmpSquare);
          GNowJ := OldJ;
          exit;
        end;
      end;
    end;
  result := true;
  SquareArrayCopyTo(GTmpSquare, tmpSquare);
  GNowJ := OldJ;
end;

procedure ChangeSquare(tmpJ: integer; var tmpSquare: TSquareArray);
var
  i, j, num: integer;
begin
  tmpJ := tmpJ + 1;
  if tmpJ > 3 then
    tmpJ := 0;
  GNowJ := tmpJ;
  num := GForm[GNowI, GNowJ];
  for j := 0 to MAX - 1 do
    for i := 0 to MAX - 1 do
      if ((num shl (j * 4 + i)) and $8000) = $8000 then
        tmpSquare[i, j].SquareType := SQUARE
      else
        tmpSquare[i, j].SquareType := BLANK;
end;

function NeedDeleteBottom(tmpData: TDataArray; var num: integer): boolean;
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
      if tmpData[i, j].SquareType <> OTHER then
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

procedure ChangeBottom(var tmpData: TDataArray; num: integer);
var
  i, j: integer;
begin
  for i := 0 to MAX_X - 1 do
    for j := num - 1 downto 0 do
      tmpData[i, j + 1] := tmpData[i, j];
end;

function TouchBottom(tmpSquare: TSquareArray; tmpBottom: TDataArray): boolean;
var
  i, j, tmpI, tmpJ: integer;
begin
  result := false;
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if tmpSquare[i, j].SquareType = SQUARE then
      begin
        tmpI := tmpSquare[i, j].Pos.i;
        tmpJ := tmpSquare[i, j].Pos.j + 1;
        if (tmpJ = MAX_Y) or (tmpBottom[tmpI, tmpJ].SquareType = OTHER) then
        begin
          result := true;
          exit;
        end;
      end;
end;

procedure AddToBottom(tmpSquare: TSquareArray; var tmpBottom: TDataArray);
var
  i, j, tmpI, tmpJ: integer;
begin
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      if tmpSquare[i, j].SquareType = SQUARE then
      begin
        tmpI := tmpSquare[i, j].Pos.i;
        tmpJ := tmpSquare[i, j].Pos.j;
        tmpBottom[tmpI, tmpJ].SquareType := OTHER;
        tmpBottom[tmpI, tmpJ].Color := tmpSquare[i, j].Color;
        //        tmpBottom[tmpI, tmpJ].Color := HeapColor;
      end;
end;

procedure DataToData(var tmpSource, tmpTarget: TSquareType);
begin
  tmpTarget.SquareType := tmpSource.SquareType;
  tmpTarget.Pos := tmpSource.Pos;
  tmpTarget.Color := tmpSource.Color;
end;

procedure SquareArrayCopyTo(var tmpSource, tmpTarget: TSquareArray);
var
  i, j: integer;
begin
  for i := 0 to MAX - 1 do
    for j := 0 to MAX - 1 do
      DataToData(tmpSource[i, j], tmpTarget[i, j]);
end;

procedure MoveSquare(var tmpSquare: TSquareArray; tmpDirection: TDirection);
var
  i, j, tmpI, tmpJ: integer;
begin
  case tmpDirection of
    TOUP: ;
    TODOWN:
      begin
        SquareArrayCopyTo(tmpSquare, GTmpSquare);
        for i := 0 to MAX - 1 do
          for j := 0 to MAX - 1 do
          begin
            if (tmpSquare[i, j].SquareType = SQUARE) and (tmpSquare[i, j].Pos.j
              >= MAX_Y - 1) then
            begin
              SquareArrayCopyTo(GTmpSquare, tmpSquare);
              exit;
            end
            else
              tmpSquare[i, j].Pos.j := tmpSquare[i, j].Pos.j + 1;
          end;
      end;
    TORIGHT:
      begin
        SquareArrayCopyTo(tmpSquare, GTmpSquare);
        for i := 0 to MAX - 1 do
          for j := 0 to MAX - 1 do
          begin
            tmpI := tmpSquare[i, j].Pos.i;
            tmpJ := tmpSquare[i, j].Pos.j;
            if (tmpSquare[i, j].SquareType = SQUARE) and (tmpI + 1 <= MAX_X - 1)
              and (Data[tmpI + 1, tmpJ].SquareType = OTHER) then
            begin
              SquareArrayCopyTo(GTmpSquare, tmpSquare);
              exit;
            end
            else if (tmpSquare[i, j].SquareType = SQUARE) and (tmpSquare[i,
              j].Pos.i >= MAX_X - 1) then
            begin
              SquareArrayCopyTo(GTmpSquare, tmpSquare);
              exit;
            end
            else
              tmpSquare[i, j].Pos.i := tmpSquare[i, j].Pos.i + 1;
          end;
      end;
    TOLEFT:
      begin
        SquareArrayCopyTo(tmpSquare, GTmpSquare);
        for i := 0 to MAX - 1 do
          for j := 0 to MAX - 1 do
          begin
            tmpI := tmpSquare[i, j].Pos.i;
            tmpJ := tmpSquare[i, j].Pos.j;
            if (tmpSquare[i, j].SquareType = SQUARE) and (tmpI - 1 >= 0) and
              (Data[tmpI - 1, tmpJ].SquareType = OTHER) then
            begin
              SquareArrayCopyTo(GTmpSquare, tmpSquare);
              exit;
            end
            else if (tmpSquare[i, j].SquareType = SQUARE) and (tmpSquare[i,
              j].Pos.i <= 0) then
            begin
              SquareArrayCopyTo(GTmpSquare, tmpSquare);
              exit;
            end
            else
              tmpSquare[i, j].Pos.i := tmpSquare[i, j].Pos.i - 1;
          end;
      end;
  end;
end;

procedure SetData(var tmpData: TDataArray; tmpX: integer; tmpY: integer);
begin
  SetLength(tmpData, tmpX, tmpY);
end;

procedure FreeData(var tmpData: TDataArray);
begin
  SetLength(tmpData, 0, 0);
end;

procedure InitData(var tmpData: TDataArray);
var
  i, j: integer;
begin
  for i := 0 to MAX_X - 1 do
    for j := 0 to MAX_Y - 1 do
      tmpData[i, j].SquareType := BLANK;
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
