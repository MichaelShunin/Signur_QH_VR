unit main_u;

interface

uses
  Windows, Messages, SysUtils, Classes,ShellAPI,
  Variants,  Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Grids, DBGrids, ComCtrls, ToolWin, StdActns,
  ActnList,tvc_u, PropStorageEh;

type
  Tmain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ToolBar1: TToolBar;
    OpenItem: TMenuItem;
    ExitItem: TMenuItem;
    N15: TMenuItem;
    ExitButton: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    FileExit1: TFileExit;
    N7: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Action_UserGuide: TAction;
    Action_About: TAction;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    N2: TMenuItem;
    miCreateCalculation: TMenuItem;
    actCreateDevice: TAction;
    actArchiev: TAction;
    SQL1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure ExitItemClick(Sender: TObject);
    procedure Action_AboutExecute(Sender: TObject);
    procedure Action_UserGuideExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
    procedure actCreateDeviceExecute(Sender: TObject);
    procedure actArchievExecute(Sender: TObject);
    procedure SQL1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    defaultType:integer;
  end;

var
  main: Tmain;

implementation

uses about_u, dm_u,    config    , CreateNewDevice_u,
  device_u, createNewDevice_new_u, SQLMonitorUnit;

{$R *.dfm}

procedure Tmain.FormShow(Sender: TObject);
begin
 if dm.resultConnection<>'' then
  begin
    showmessage( dm.resultConnection);
    halt;
  end;
end;

procedure Tmain.ExitItemClick(Sender: TObject);
begin
close;
end;

procedure Tmain.Action_AboutExecute(Sender: TObject);
var AboutForm:tAbout_Form;
begin
 AboutForm:=Tabout_form.create(self);
 AboutForm.OkButton.Caption:='Продолжить работу';
 AboutForm.showmodal;
end;

procedure Tmain.Action_UserGuideExecute(Sender: TObject);
begin
// Shellexecute(
 ShellExecute(Application.Handle, nil, pchar(extractfilepath(application.exename)+Help_URL), nil, nil, SW_SHOW);
end;

procedure Tmain.FormCreate(Sender: TObject);
begin
 left:=0;
 top:=0;
 height:=Toolbar1.Height+75;
 width:=640;
 defaulttype:=0;
end;

procedure Tmain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//canClose:= application.MessageBox( pchar(QUEST_CloseProgram),
 //                 pchar(msg_warning), MB_YESNO or MB_ICONQUESTION) = idYes;
canclose:=True;
end;

procedure Tmain.FormResize(Sender: TObject);
begin
// left:=0;
// top:=0;
 height:=Toolbar1.Height+75;
// width:=640;
end;


procedure Tmain.actCreateDeviceExecute(Sender: TObject);
var
 Device_ID:integer;
Label M1; 
begin

 try
 CreateNewDevice_Form_new.Composition_DeviceTYPE:=defaulttype;
 M1: If CreateNewDevice_Form_new.showmodal = mrOK then
  begin

    dm.CreateNewDevice_new.ParamByName('Name').asstring:=CreateNewDevice_form_New.DeviceName;
    dm.CreateNewDevice_new.ParamByName('Composition_DeviceTYPE').asinteger:=CreateNewDevice_form_new.Composition_DeviceTYPE;
    dm.CreateNewDevice_New.ExecProc;
    dm.CreateNewDevice_New.transaction.CommitRetaining;
    if device_form = nil then Device_Form:=TDevice_Form.create(self);
    device_form.q_devices.AfterScroll:=nil;
    device_form.q_devices.BeforeScroll:=nil;
    device_id:=dm.CreateNewDevice_New.ParamByName('Device_ID').asinteger;
    device_form.hide;
    device_form.rgRG_Filter.ItemIndex:=CreateNewDevice_form_new.Composition_DeviceTYPE;
    device_form.miRefreshClick(nil);

    device_form.q_devices.Locate('ID',device_id,[]);
    device_form.updateDetailInfo;
    device_form.pcInputValues.ActivePageIndex:=1;
    device_form.DevicesPanel.visible:=false;
    device_form.windowstate:=wsMaximized;
    device_form.show;
    device_form.q_devices.AfterScroll:=device_form.q_devicesAfterScroll;
    device_form.q_devices.BeforeScroll:=device_form.q_devicesBeforeScroll;
    device_form.edDeviceNumber.SetFocus;
    device_form.q_devicesAfterScroll(nil);
    end;
    except on E: Exception do
           showmessage('Ошибка при регистрации прибора в базе данных:' +E.Message);
  end;

end;


procedure Tmain.actArchievExecute(Sender: TObject);
begin
  if device_form = nil then Device_Form:=TDevice_Form.create(self);
   device_form.devicespanel.Visible:=false;
    device_form.show;
    device_form.windowstate:=wsMaximized;



end;

procedure Tmain.SQL1Click(Sender: TObject);
begin
TSQLMonitor.Open;
end;

end.
