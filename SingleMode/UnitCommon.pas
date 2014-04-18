unit UnitCommon;

interface

uses
  Messages, Windows;

const
  MAX_X = 10;
  MAX_Y = 19;
  STARTX = 1;
  STARTY = 1;
  LENX = 29;
  LENY = 29;
  MULX = LENX + 1;
  MULY = LENY + 1;
  MAX = 4;
  MAXFORM = 7; // 这个数据表示一共有多少类型的方块，可以自己随时增加其它类型方块。
  MAXNUM = 100;
  COUNTMUL = 1;
  SLEEPTIME = 60;
  BLINKTIME = 100;
  NEXTTIME = 100;
  STRINGGAME = '关于';
  STRINGGAMEOVER = '游戏结束';
  STRINGVERSION = '俄罗斯方块游戏 - RICOL';

  MESSAGE_SOUND = WM_USER + 1;

type
  TColor = -$7FFFFFFF - 1 .. $7FFFFFFF;
  TDirection = (TOUP, TODOWN, TORIGHT, TOLEFT); // 表示方块移动方向

  TPosition = record
    i, j: integer;
  end;

  TType = (BLANK, SQUARE, OTHER); // 表示主窗口所有方块类型

  TSquareType = record // 主窗口方块结构
    SquareType: TType; // 方块类型
    Pos: TPosition; // 方块当前位置
    Color: TColor; // 方块当前颜色
  end;

  TDataArray = array of array of TSquareType; // 主窗口所有方块组成的数组
  TSquareArray = array [0 .. MAX - 1, 0 .. MAX - 1] of TSquareType;
  // 当前活动方块的数组
  TFormArray = array [0 .. MAXFORM - 1, 0 .. MAX - 1] of integer;
  // 存放自定义的方块形状

const
  clBlack = TColor($000000);
  clMaroon = TColor($000080);
  clGreen = TColor($008000);
  clOlive = TColor($008080);
  clNavy = TColor($800000);
  clPurple = TColor($800080);
  clTeal = TColor($808000);
  clGray = TColor($808080);
  clSilver = TColor($C0C0C0);
  clRed = TColor($0000FF);
  clLime = TColor($00FF00);
  clYellow = TColor($00FFFF);
  clBlue = TColor($FF0000);
  clFuchsia = TColor($FF00FF);
  clAqua = TColor($FFFF00);
  clLtGray = TColor($C0C0C0);
  clDkGray = TColor($808080);
  clWhite = TColor($FFFFFF);

  STRCAPTION = '俄罗斯方块游戏';

var
  GBlankColor, GHeapColor, GOtherColor, GBackGroundColor, GSquareColor,
    GViewBlankColor, GViewBackGroundColor, GViewSquareColor, GInforCaptionColor,
    GInforContentColor, GInforBackGround, GBlinkColor: TColor;
  GData: TDataArray;
  GNowSquare, GNextSquare, GOldSquare, GTmpSquare, GGhostSquare: TSquareArray;
  GNowI, GNowJ, GNextI, GNextJ: integer;
  GForm: TFormArray = (
    // 从左到右分别表示的该类型方块面向上下左右时的二进制结构
    // 例如$4E00 -> [4] -> [0100]
    // [e]    [1110]
    // [0]    [0000]
    // [0]    [0000]
    // ($AE00, $C8C0, $EA00, $C4C0),
    // ($8421, $1248, $8421, $1248),
    // ($2F40, $4C64, $4F20, $46C4),
    ($F000, $4444, $F000, $4444), ($6600, $6600, $6600, $6600),
    ($4E00, $4C40, $E400, $8C80), ($C600, $4C80, $C600, $4C80),
    ($6C00, $8C40, $6C00, $8C40), ($88C0, $2E00, $C440, $E800),
    ($44C0, $E200, $C880, $8E00));
  // 这是所有类型的方块，目前一共七种。
  // 自己可增可减各种形状方块，就像上面三行注释掉的方块一样，
  // 但注意MAXFORM应该和这个数组的行数一致。目前为7行。

implementation

end.
