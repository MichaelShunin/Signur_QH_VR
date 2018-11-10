unit WaitUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
{ TWaitForm }

  TWaitForm = class(TForm)
    InfoLabel: TLabel;
    ProgressBar: TProgressBar;
    CloseBtn: TButton;
    procedure FormShow(Sender: TObject);
  private
    FOnExecute: TNotifyEvent;
    procedure WMUser(var Msg: TMessage); message WM_USER;
  public
    class procedure Execute(const Msg: string; OnExecute: TNotifyEvent);
    property OnExecute: TNotifyEvent read FOnExecute write FOnExecute;
  end;

var
  WaitForm: TWaitForm;

implementation

{$R *.dfm}

{ TWaitForm }

class procedure TWaitForm.Execute(const Msg: string; OnExecute: TNotifyEvent);
var
  WaitForm: TWaitForm;
begin
  WaitForm := TWaitForm.Create(nil);
  try
    WaitForm.InfoLabel.Caption := Msg;
    WaitForm.OnExecute := OnExecute;
    WaitForm.ShowModal;
  finally
    WaitForm.Free;
  end;
end;

procedure TWaitForm.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_USER, 0, 0);
end;

procedure TWaitForm.WMUser(var Msg: TMessage);
begin
  if Assigned(OnExecute) then OnExecute(Self);
end;

end.
