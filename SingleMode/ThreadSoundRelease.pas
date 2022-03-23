unit ThreadSoundRelease;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, Data, StdCtrls, MMSystem, Common, SyncObjs,
  MPlayer;

type
  TThreadSoundRelease = class(TThread)
  private
    FForm: TForm;
    procedure ReleaseMusicFromResource(FileName: string);
  public
    constructor Create(tmpForm: TForm); overload;
    procedure Execute; override;
  end;

implementation

{ TThreadSoundRelease }

procedure TThreadSoundRelease.Execute;
begin
  OutputDebugString('SoundRelease...');
  Sleep(1000);
  ReleaseMusicFromResource(GetTempDirectory + 'music.wav');
  PostMessage(FForm.Handle, MESSAGE_SOUND, 0, 0);
end;

constructor TThreadSoundRelease.Create(tmpForm: TForm);
begin
  inherited Create(false);
  FForm := tmpForm;
end;

//  Õ∑≈±≥æ∞“Ù¿÷
procedure TThreadSoundRelease.ReleaseMusicFromResource(FileName: string);
var
  r: TResourceStream;
begin
  r := TResourceStream.Create(HInstance, 'BackGroundMusic', 'wave');
  r.SaveToFile(FileName);
  r.Free;
end;

end.
