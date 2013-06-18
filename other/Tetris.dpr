program Tetris;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FormMain},
  BestScor in 'BestScor.pas' {BestScorDlg};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TBestScorDlg, BestScorDlg);
  Application.Run;
end.
