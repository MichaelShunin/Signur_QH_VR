unit About;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls,  cxButtons, cxLookAndFeelPainters;

type
  TAboutBox = class(TForm)              
    Panel1: TPanel;
    Comments: TLabel;
    BitBtn1: TcxButton;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation
 uses TVC_u, DM_dm;
{$R *.DFM}

procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
(*{panel1.Visible:=false;}
{Panel2.Visible:=false;}
{if Gemis_Ini.ReadString('APB','APB','7368_no')='7368' then
    Panel2.Visible:=true else panel1.Visible:=true;}
if GemisWin_Version in [0] then   Label6.Caption := 'Демонстрационная версия';
*)
{if Gemis_Ini.ReadString('APB','APB','7368_no')='7368' then
    begin
     Label7.Visible:=false;
     Label5.Visible:=false;
     Label4.Visible:=false;
     Label8.Visible:=false;
     Label6.Visible:=false;
    end else}
//    panel1.Visible:=true;
//if GemisWin_Version in [0] then   Label6.Caption := 'Demo version';
// Get_Lang_Par({Lang_2_Ini,}self,'About');
{ Save_Lang_Par(Lang_2_Ini,self,'About');}
 StaticText1.Caption:=Program_Name;
end;

end.

