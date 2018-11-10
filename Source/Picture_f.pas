unit Picture_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxImage, cxDBEdit;

type
  TForm1 = class(TForm)
    cxDBImage1: TcxDBImage;
    Panel5: TPanel;
    btnEdit: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Exp_f;

{$R *.dfm}

end.
