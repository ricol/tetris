program Tetris;

uses
  Forms,
  Main in 'Main.pas' {FormMain},
  Data in 'Data.pas',
  Common in 'Common.pas',
  About in 'About.pas' {AboutBox},
  ThreadSoundRelease in 'ThreadSoundRelease.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;

end.
