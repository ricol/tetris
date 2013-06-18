unit UnitAbout;

interface

uses Messages, Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
  private
    { Private declarations }
    procedure ProcessMessage_WM_KILLFOCUS(var tmMsg: TMessage); message WM_KILLFOCUS;
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

{ TAboutBox }

procedure TAboutBox.ProcessMessage_WM_KILLFOCUS(var tmMsg: TMessage);
begin
  OutputDebugString('WM_KILLFOCUS');
  inherited;
end;

end.

