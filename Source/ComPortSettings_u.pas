unit ComPortSettings_u;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Spin, IniFiles;

type
  TComPortSettings_form = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    lbl1: TLabel;
    se1: TSpinEdit;
    chkAuto: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkAutoClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IniFile:TInifile;
  end;

var
  ComPortSettings_form: TComPortSettings_form;

implementation

uses master2013;

{$R *.dfm}

procedure TComPortSettings_form.FormCreate(Sender: TObject);
var

  Path:string;
begin
 GetDir(0,path);
 IniFile:=TInifile.Create(path+'\COMPORTSETTING.INI');
 se1.value:=Inifile.readinteger('COM','PORT',3);
 ChkAuto.checked:=IniFile.readbool('COM','AUTO',true);
end;

procedure TComPortSettings_form.FormShow(Sender: TObject);
begin
 se1.value:=Inifile.readinteger('COM','PORT',3);
 ChkAuto.checked:=IniFile.readbool('COM','AUTO',true);
 se1.visible:=not chkAuto.CHECKED;
 lbl1.visible:= not chkAuto.CHECKED;

end;

procedure TComPortSettings_form.chkAutoClick(Sender: TObject);
begin
  se1.Visible:=not chkAuto.CHECKED;
 lbl1.visible:= not chkAuto.CHECKED;
end;

procedure TComPortSettings_form.OKBtnClick(Sender: TObject);
var
    FComp : File of byte;
    path, fn : string;
    ComPort:Byte;
begin
 IniFile.writeinteger('COM','PORT',se1.Value);
 IniFile.writebool('COM','AUTO',chkAuto.CHECKED);

 GetDir(0,path);

 AssignFile(FComp,path+COMP_FILENAME);
 if FileExists(Path+COMP_FILENAME) then
      begin
       AssignFile(FComp,path+COMP_FILENAME);
       if chkAuto.Checked then
        begin           // ���� ���������, ��� �� ���� COMP ����� ������ �������������
          Reset(FComp);
          Read(FComp,Comport);
          CloseFile(FComp);
          if ComPort<128 then   // ���� ������ ������������� ���������� ����� �����, ��� ����� ��������� ���� COMP
             deletefile(path+COMP_FILENAME);
                // else  - ������ ������ �� ����, ����� ��� ������������� ���� ��� ���������
        end
         else      // ����� ����� ����� �������������, ���������� ���� COMP
          begin
           Rewrite(FComp);
           ComPort:=se1.Value;
           write(FComp, ComPort);
           CloseFile(FComp);
          end;
      end
       else    // ����� ���
        begin
          if (not chkAuto.Checked)  then
           begin                        // ����� ����� ����� �������������, ������ ���� COMP
           Rewrite(FComp);
           ComPort:=se1.Value;
           write(FComp, ComPort);
           CloseFile(FComp);
           end
        end;

  
end;

procedure TComPortSettings_form.CancelBtnClick(Sender: TObject);
begin
  se1.value:=Inifile.readinteger('COM','PORT',3);
 ChkAuto.checked:=IniFile.readbool('COM','AUTO',true);
end;

end.
