program Tetris;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FormMain} ,
  UnitData in 'UnitData.pas',
  UnitCommon in 'UnitCommon.pas',
  UnitAbout in 'UnitAbout.pas' {AboutBox} ,
  UnitThreadSoundRelease in 'UnitThreadSoundRelease.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;

end.
