unit DefaultUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
{ TDefaultForm }

  TDefaultForm = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  protected
    procedure CtrlEnterPressed; virtual;
  public
    { Public declarations }
  end;

var
  DefaultForm: TDefaultForm;

implementation

{$R *.dfm}

{ TDefaultForm }

procedure TDefaultForm.CtrlEnterPressed;
begin
  if fsModal in FormState then ModalResult := mrOk;
end;

procedure TDefaultForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  WinControl: TWinControl;
begin
  if (Key = VK_RETURN) and (Shift = []) then
  begin
    WinControl := FindNextControl(ActiveControl, True, True, False);
    if WinControl <> nil then
    begin
      WinControl.SetFocus;
      Key := 0;
    end;
    Exit;
  end;

  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
  begin
    CtrlEnterPressed;
    Key := 0;
    Exit;
  end;
end;

end.
