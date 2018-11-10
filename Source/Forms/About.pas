unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DBCtrls, DB, ExtCtrls, ShellAPI;

type
  TAboutForm = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    URLLabel: TLabel;
    Label3: TLabel;
    procedure URLLabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

procedure CallAbout;

implementation

{$R *.dfm}

procedure CallAbout;
var
  Form: TAboutForm;
begin
  Form := TAboutForm.Create(Application);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;



procedure TAboutForm.URLLabelClick(Sender: TObject);
begin
  ShellAPI.ShellExecute(Handle, 'open', Pointer(URLLabel.Caption),
    nil, nil, SW_SHOWDEFAULT);
end;

end.
