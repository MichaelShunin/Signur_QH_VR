unit StringPropsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
{ TStringPropForm }

  TStringPropForm = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    NameLabel: TLabel;
    IdentLabel: TLabel;
    NameEdit: TEdit;
    IdentEdit: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StringPropForm: TStringPropForm;

implementation

{$R *.dfm}

end.
