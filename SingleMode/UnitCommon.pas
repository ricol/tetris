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
  MAXFORM = 7; // ������ݱ�ʾһ���ж������͵ķ��飬�����Լ���ʱ�����������ͷ��顣
  MAXNUM = 100;
  COUNTMUL = 1;
  SLEEPTIME = 60;
  BLINKTIME = 100;
  NEXTTIME = 100;
  STRINGGAME = '����';
  STRINGGAMEOVER = '��Ϸ����';
  STRINGVERSION = '����˹������Ϸ - RICOL';

  MESSAGE_SOUND = WM_USER + 1;

type
  TColor = -$7FFFFFFF - 1 .. $7FFFFFFF;
  TDirection = (TOUP, TODOWN, TORIGHT, TOLEFT); // ��ʾ�����ƶ�����

  TPosition = record
    i, j: integer;
  end;

  TType = (BLANK, SQUARE, OTHER); // ��ʾ���������з�������

  TSquareType = record // �����ڷ���ṹ
    SquareType: TType; // ��������
    Pos: TPosition; // ���鵱ǰλ��
    Color: TColor; // ���鵱ǰ��ɫ
  end;

  TDataArray = array of array of TSquareType; // ���������з�����ɵ�����
  TSquareArray = array [0 .. MAX - 1, 0 .. MAX - 1] of TSquareType;
  // ��ǰ����������
  TFormArray = array [0 .. MAXFORM - 1, 0 .. MAX - 1] of integer;
  // ����Զ���ķ�����״

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

  STRCAPTION = '����˹������Ϸ';

var
  GBlankColor, GHeapColor, GOtherColor, GBackGroundColor, GSquareColor,
    GViewBlankColor, GViewBackGroundColor, GViewSquareColor, GInforCaptionColor,
    GInforContentColor, GInforBackGround, GBlinkColor: TColor;
  GData: TDataArray;
  GNowSquare, GNextSquare, GOldSquare, GTmpSquare, GGhostSquare: TSquareArray;
  GNowI, GNowJ, GNextI, GNextJ: integer;
  GForm: TFormArray = (
    // �����ҷֱ��ʾ�ĸ����ͷ���������������ʱ�Ķ����ƽṹ
    // ����$4E00 -> [4] -> [0100]
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
  // �����������͵ķ��飬Ŀǰһ�����֡�
  // �Լ������ɼ�������״���飬������������ע�͵��ķ���һ����
  // ��ע��MAXFORMӦ�ú�������������һ�¡�ĿǰΪ7�С�

implementation

end.
