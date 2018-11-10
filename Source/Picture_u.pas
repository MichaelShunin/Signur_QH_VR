unit Picture_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxImage, cxDBEdit, cxMemo, cxTextEdit;

type
  TPictureform = class(TForm)
    cxDBImage1: TcxDBImage;
    Panel5: TPanel;
    btnClose: TcxButton;
    Label5: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label6: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label7: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label12: TLabel;
    cxDBMemo4: TcxDBMemo;
    cxDBTextEdit4: TcxDBTextEdit;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pictureform: TPictureform;

implementation

uses Exp_f;

{$R *.dfm}

procedure TPictureform.btnCloseClick(Sender: TObject);
begin
 close;
end;

end.
