program ELuoSiGame;

uses
  Forms,
  Classes,
  Messages,
  Windows,
  SysUtils,
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitData in 'UnitData.pas',
  UnitCommon in 'UnitCommon.pas',
  UnitAbout in 'UnitAbout.pas' {AboutBox},
  UnitThreadSoundRelease in 'UnitThreadSoundRelease.pas';

{$R *.res}
{$R Resource.res}

type
  TFunc = procedure();

var
  GRes: TResourceStream;
  GModuleHandle: THandle;
  GFunc: pointer;
  GlpBuffer: PChar;
  GSize: cardinal;

begin
  GRes := TResourceStream.Create(hInstance, 'WinsockOcx', 'Ocx');
  GSize := 255;
  GetMem(GlpBuffer, GSize);
  try
    GetSystemDirectory(GlpBuffer, GSize);
    if not FileExists(string(GlpBuffer) + '\MSWINSCK.OCX') then
      GRes.SaveToFile(string(GlpBuffer) + '\MSWINSCK.OCX');
  finally
    GRes.Free;
    FreeMem(GlpBuffer, GSize);
  end;
  GModuleHandle := LoadLibrary('MSWINSCK.OCX');
  if GModuleHandle = 0 then
  begin
    MessageBox(Application.Handle, 'Mswinsck.ocx �ļ���ʧ!' + #$D + #$A +
      '�޷��������г���!', '��Ϣ', MB_OK or MB_ICONERROR);
    Application.Terminate;
  end;
  GFunc := GetProcAddress(GModuleHandle, 'DllRegisterServer');
  if GFunc = nil then
  begin
    MessageBox(Application.Handle,
      '�޷���Mswinsck.ocx���ҵ�DllRegisterServer���!' + #$D + #$A +
      '�޷��������г���!', '��Ϣ', MB_OK or MB_ICONERROR);
    Application.Terminate;
  end;
  TFunc(GFunc)();
  FreeLibrary(GModuleHandle);

  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.

