unit Obzordlg;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, Spin,tvc_u;

type
  TObzorDialog = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    ChanalGroup: TRadioGroup;
    Header: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    memo: TEdit;
    Label3: TLabel;
    Author: TEdit;
    Panel1: TPanel;
    Label4: TLabel;
    SpinEdit1: TSpinEdit;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    RadioGroup1: TRadioGroup;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ObzorDialog: TObzorDialog;

implementation

uses DM_dm;

{$R *.DFM}

procedure TObzorDialog.FormCreate(Sender: TObject);
begin
// Get_Lang_Par({Lang_Ini,}self,'ObzorDlg');
 Header.Text:='Œ·ÁÓÍ‡';
 memo.Text:='';
 Author.Text:=Program_Name;//'Ã»—“»';//'Gemis for Win';
{ Save_Lang_Par(Lang_Ini,self,'ObzorDialog');}
end;

end.
