unit menu_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, common_u, Menus, common_f;

type
  TMenuForm = class(TCommonForm)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miClose: TMenuItem;
    miHelp: TMenuItem;
    miHelpAbout: TMenuItem;
    procedure miCloseClick(Sender: TObject);
    procedure miHelpAboutClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MenuForm: TMenuForm;

implementation

uses About, Main_f;

{$R *.dfm}

procedure TMenuForm.miCloseClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TMenuForm.miHelpAboutClick(Sender: TObject);
var About:TAboutBox;
begin
   Application.CreateForm(TAboutBox, About);
   About.ShowModal;
end;


procedure TMenuForm.FormShow(Sender: TObject);
begin
  inherited;
  if windowstate = wsminimized then windowstate := wsNormal;
end;


procedure TMenuForm.FormActivate(Sender: TObject);
begin
    inherited;
  if windowstate = wsminimized then windowstate := wsNormal;
end;


end.

