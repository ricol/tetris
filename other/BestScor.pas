unit BestScor;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TBestScorDlg = class(TForm)
    OKBtn: TButton;
    Bevel1: TBevel;
    Reinit: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReinitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  scor = record
    Name: String[15];
    scor: Word;
  end;

var
  BestScorDlg: TBestScorDlg;
  ABest: array [1 .. 3] of scor;
  F: textFile;

implementation

uses UnitMain;

{$R *.DFM}

procedure TBestScorDlg.FormCreate(Sender: TObject);
var
  i, j: Byte;
begin
  for i := 1 to 3 do
    ABest[i].Name := 'Joe La Fiote__';
  for i := 1 to 3 do
    ABest[i].scor := 500;
{$I-}
  assignFile(F, 'BestScor');
  FileMode := 0;
  Reset(F);
  if (IOResult = 0) then
    for i := 1 to 3 do
    begin
      readln(F, ABest[i].Name, ABest[i].scor);
      j := 0;
      repeat
        inc(j)
      until (ABest[i].Name[j] <> ' ');
      ABest[i].Name := copy(ABest[i].Name, j, length(ABest[i].Name) - j + 1);
    end;
  CloseFile(F);
{$I+}
  if Winner then
  begin
    i := 1;
    while ((ABest[i].scor > Score) and (i < 5)) do
      inc(i);
    if (i > 3) then
      exit;
    case i of
      1:
        begin
          ABest[3].Name := ABest[2].Name;
          ABest[2].Name := ABest[1].Name;
          ABest[1].Name := 'Anonyme';
          ABest[3].scor := ABest[2].scor;
          ABest[2].scor := ABest[1].scor;
          Edit1.ReadOnly := False;
          ABest[1].scor := Score;
          ActiveControl := Edit1;
        end;
      2:
        begin
          ABest[3].Name := ABest[2].Name;
          ABest[2].Name := 'Anonyme';
          ABest[3].scor := ABest[2].scor;
          Edit2.ReadOnly := False;
          ABest[2].scor := Score;
          ActiveControl := Edit2;
        end;
      3:
        begin
          ABest[3].Name := 'Anonyme';
          Edit3.ReadOnly := False;
          ABest[3].scor := Score;
          ActiveControl := Edit3;
        end;
    end;
  end;
  Edit1.Text := ABest[1].Name;
  Edit2.Text := ABest[2].Name;
  Edit3.Text := ABest[3].Name;
  Label4.Caption := inttostr(ABest[1].scor);
  Label5.Caption := inttostr(ABest[2].scor);
  Label6.Caption := inttostr(ABest[3].scor);
end;

procedure TBestScorDlg.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Byte;
begin
  ABest[1].Name := Edit1.Text;
  ABest[2].Name := Edit2.Text;
  ABest[3].Name := Edit3.Text;
{$I-}
  assignFile(F, 'BestScor');
  FileMode := 1;
  reWrite(F);
  for i := 1 to 3 do
    Writeln(F, ABest[i].Name:15, ABest[i].scor:3);
  CloseFile(F);
{$I+}
end;

procedure TBestScorDlg.ReinitClick(Sender: TObject);
var
  i: Byte;
begin
  for i := 1 to 3 do
    ABest[i].Name := 'Joe La Fiote';
  for i := 1 to 3 do
    ABest[i].scor := 500;
  Edit1.Text := ABest[1].Name;
  Edit2.Text := ABest[2].Name;
  Edit3.Text := ABest[3].Name;
  Label4.Caption := inttostr(ABest[1].scor);
  Label5.Caption := inttostr(ABest[2].scor);
  Label6.Caption := inttostr(ABest[3].scor);
end;

end.
