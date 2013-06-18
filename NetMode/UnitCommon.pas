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
  LOCALPORT = 2000;
  MAXFORM = 7; //这个数据表示一共有多少类型的方块，可以自己随时增加其它类型方块。
  MAXNUM = 100;
  COUNTMUL = 1;
  SLEEPTIME = 60;
  STRINGGAME = '关于';
  STRINGGAMEOVER = '游戏结束';
  STRINGVERSION = '俄罗斯方块游戏 - RICOL';

  MESSAGE_SOUND = WM_USER + 1;

type
  TColor = -$7FFFFFFF - 1..$7FFFFFFF;
  TDirection = (TOUP, TODOWN, TORIGHT, TOLEFT);
  TPosition = record
    i, j: integer;
  end;
  TType = (BLANK, SQUARE, OTHER);
  TSquareType = record
    SquareType: TType;
    Pos: TPosition;
    Color: TColor;
  end;
  TDataArray = array of array of TSquareType;
  TSquareArray = array[0..MAX - 1, 0..MAX - 1] of TSquareType;
  TFormArray = array[0..MAXFORM - 1, 0..MAX - 1] of integer;
  TMode = (SINGLE, SERVER, CLIENT);

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

  CONNECTCOMMANDQUITTOSERVER = 'COMMANDA';
  CONNECTCOMMANDACCEPTEDTOCLIENT = 'COMMANDB';
  CONNECTCOMMANDUNACCEPTEDTOCLIENT = 'COMMANDC';
  CONNECTCOMMANDGAMESTART = 'COMMANDD';
  CONNECTCOMMANDGAMESTOP = 'COMMANDE';
  CONNECTCOMMANDFAIL = 'COMMANDF';
  CONNECTCOMMANDPOINT = 'COMMANDG';
  STRCAPTIONSERVERMODE = '俄罗斯方块游戏 － 网络模式 - 本机角色：服务器';
  STRCAPTIONCLIENTMODE = '俄罗斯方块游戏 － 网络模式 - 本机角色：客户机';
  STRCAPTIONSINGLEMODE = '俄罗斯方块游戏 － 单机模式';

var
  GBlankColor, GHeapColor, GOtherColor, GBackGroundColor, GSquareColor,
    GViewBlankColor, GViewBackGroundColor, GViewSquareColor,
    GInforCaptionColor, GInforContentColor, GInforBackGround, GBlinkColor:
  TColor;
  Data: TDataArray;
  GNowSquare, GNextSquare, GOldSquare, GTmpSquare, GGhostSquare: TSquareArray;
  GNowI, GNowJ, GNextI, GNextJ: integer;
  GMsgBuf: string;
  GForm: TFormArray = (
    //从左到右分别表示的该类型方块面向上下左右时的二进制结构
    //例如$4E00 -> [4] -> [0100]
    //             [e]    [1110]
    //             [0]    [0000]
    //             [0]    [0000]
    ($F000, $4444, $F000, $4444),
    ($6600, $6600, $6600, $6600),
    ($4E00, $4C40, $E400, $8C80),
    ($C600, $4C80, $C600, $4C80),
    ($6C00, $8C40, $6C00, $8C40),
    ($88C0, $2E00, $C440, $E800),
    ($44C0, $E200, $C880, $8E00));
  //这是所有类型的方块，目前一共七种。
  //自己可增可减，注意MAXFORM应该和这个数组的行数一致。目前为7行。

implementation

end.
