unit HelloUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  THelloForm = class(TForm)
    NameLabel: TLabel;
    Timer: TTimer;
    procedure FormDestroy(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  public
    procedure execute(AName: string);
  end;

var
  HelloForm: THelloForm;

implementation

{$R *.dfm}

procedure THelloForm.FormDestroy(Sender: TObject);
begin
  if (self = HelloForm) then HelloForm := nil;
end;

procedure THelloForm.execute(AName: string);
begin
  NameLabel.Caption := AName;
  ShowModal;
end;

procedure THelloForm.TimerTimer(Sender: TObject);
begin
  Close;
end;

end.
