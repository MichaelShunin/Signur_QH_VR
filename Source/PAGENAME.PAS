{ Form Template - Source and Destination Choices Lists }
unit Pagename;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls,dialogs,tvc_U;

type
  TPageNameDialog = class(TForm)
    OKBtn: TBitBtn;
    pageNameList: TListBox;
    SrcLabel: TLabel;
    PagenameEdit: TEdit;
    Label1: TLabel;
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageNameDialog: TPageNameDialog;

implementation

{$R *.DFM}

procedure TPageNameDialog.OKBtnClick(Sender: TObject);
var i:word;
begin
 for i:=0 to PageNameList.Items.Count-1 do
  if PageNameList.Items[i] = PagenameEdit.Text then
   begin
    ShowMessage('Наименование создаваемой страницы должно быть уникальным! ');
    exit;
   end;
end;

procedure TPageNameDialog.FormCreate(Sender: TObject);
begin
//Get_Lang_Par({Lang_Ini,}self,'PageName');
{Save_Lang_Par(Lang_Ini,self,'PageName');}
end;

end.
