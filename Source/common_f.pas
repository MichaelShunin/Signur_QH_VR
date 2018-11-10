unit common_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TCommonForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mainmenuItem:TMenuItem;
    ExpmenuItem:TMenuItem;
  end;

var
  CommonForm: TCommonForm;

implementation

uses Main_f, Exp_f;

{$R *.dfm}
procedure TCommonForm.FormCreate(Sender: TObject);
var
  item: TMenuitem;
begin
  if MainForm = nil then exit;
  item := TMenuitem.create(MainForm.mainmenu);
  Mainmenuitem := item;
  item.caption := caption;
  item.tag := Integer(self);
  item.onclick := MainForm.miShowWinclick;
  MainForm.miwindowitem.add(item);
  if ExpForm = nil then exit;
  item := TMenuitem.create(ExpForm.mainmenu);
  Expmenuitem := item;
  item.caption := caption;
  item.tag := Integer(self);
  item.onclick := ExpForm.miShowWinclick;
  ExpForm.miwindow.add(item);
end;

procedure TCommonForm.FormDestroy(Sender: TObject);
begin
 if Mainmenuitem<>nil then  freeandnil(Mainmenuitem);
 if ExpMenuItem<>nil then  freeandnil(Expmenuitem);
end;


end.

