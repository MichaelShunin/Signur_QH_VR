unit DialogUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit;

type
{ TDialogForm }

  TDialogForm = class(TMaximizedForm)
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override; 
  end;

var
  DialogForm: TDialogForm;

implementation

{$R *.dfm}

{ TDialogForm }

constructor TDialogForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  IgnoreLimits := True;
end;

end.
