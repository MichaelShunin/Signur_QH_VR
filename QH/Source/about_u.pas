unit about_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,shellapi, jpeg;

type
  TAbout_Form = class(TForm)
    Image1: TImage;
    Panel1: TPanel;                                                   
    Comments: TLabel;
    OkButton: TBitBtn;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CommentsClick(Sender: TObject);
    procedure CopyrightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  About_Form: TAbout_Form;

implementation

uses dm_u;

{$R *.dfm}

procedure TAbout_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action:=cafree;
end;



procedure TAbout_Form.CommentsClick(Sender: TObject);
begin
ShellExecute(Application.Handle, nil, PChar(comments.hint), nil, nil, SW_SHOW)
end;

procedure TAbout_Form.CopyrightClick(Sender: TObject);
begin
//ShellExecute(Application.Handle, nil, PChar(copyright.hint), nil, nil, SW_SHOW)
end;

end.
