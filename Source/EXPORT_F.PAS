unit Export_f;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls,messages,dialogs,
  FileCtrl, StdCtrls, Buttons, ExtCtrls,tvc_U;

type
  TExport_Form = class(TForm)
    ButtonOK: TBitBtn;
    BitBtn2: TBitBtn;
    Active_Visible: TRadioGroup;
    Part_All: TRadioGroup;
    Label2: TLabel;
    btnBrowse: TSpeedButton;
    SaveDialog: TSaveDialog;
    GroupBox1: TGroupBox;
    bX_Value: TCheckBox;
    bNumber: TCheckBox;
    bHeader: TCheckBox;
    FormatXEdit: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    FormatYEdit: TEdit;
    FileName: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ExportRec:texportRec;
  end;

var
  Export_Form: TExport_Form;

implementation

uses SysUtils;

{$R *.DFM}

procedure TExport_Form.FormCreate(Sender: TObject);
var FF:File of TExportRec;
begin
// Get_Lang_Par({Lang_Ini,}self,'Export');
 ExportRec.FormatX:='0.0000000';
 ExportRec.FormatY:='0.0000000';
 ExportRec.bHeader:=true;ExportRec.bX_Value:=true;ExportRec.bNumber:=true;
 assignFile(FF,ExportParFile);
   try
     Reset(FF);Read(FF,ExportRec);CloseFile(FF);
    except
       on EInOutError do
         MessageDlg(ExportParFile +' I/O error.', mtError, [mbOk], 0);
      end;
  FormatXEdit.Text:=ExportRec.FormatX;
  FormatYEdit.Text:=ExportRec.FormatY;
  bHeader.Checked:=ExportRec.bHeader;
  bX_Value.Checked:=ExportRec.bX_Value;
  bNumber.Checked:=ExportRec.bNumber;
{  Save_Lang_Par(Lang_Ini,self,'ExportForm');}


end;

procedure TExport_Form.FormDestroy(Sender: TObject);
var FF:File of TExportRec;
begin
  ExportRec.FormatX:=FormatXEdit.Text;
  ExportRec.FormatY:=FormatYEdit.Text;
  ExportRec.bHeader:=bHeader.Checked;
  ExportRec.bX_Value:=bX_Value.Checked;
  ExportRec.bNumber:=bNumber.Checked;
  assignFile(FF,ExportParFile);
   try
     Rewrite(FF);write(FF,ExportRec);CloseFile(FF);
    except
       on EInOutError do
         MessageDlg(ExportParFile +' I/O error.', mtError, [mbOk], 0);
      end;
end;

procedure TExport_Form.btnBrowseClick(Sender: TObject);
begin
 if savedialog.execute then Filename.Caption:=savedialog.FileName;;
end;

end.
