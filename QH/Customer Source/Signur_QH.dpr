program Signur_QH;

uses
  sharemem,
  shellapi,
  windows,
//  TxFrame in '..\..\..\projects\AppProjects\AppCommon\TxFrame.pas' {TaxxiFrame: TFrame},

 TxFrame in 'C:\Projects\AppProjects\AppCommon\TxFrame.pas' {TaxxiFrame: TFrame},
  DbGridUnit in 'C:\Projects\AppProjects\AppCommon\DbGridUnit.pas' {DbGridFrame: TFrame},
   Forms,
  sysutils,
  dm_u in 'dm_u.pas' {DM: TDataModule},
  utils in 'utils.pas',
  config in 'config.pas',
  about_u in 'about_u.pas' {About_Form},
  main_u in 'main_u.pas' {main},
  tvc_u in 'tvc_u.pas',
//  DbGridUnit in '..\..\..\Projects\AppProjects\AppCommon\DbGridUnit.pas' {DbGridFrame: TFrame},
  cloneNewcalc_u in 'cloneNewcalc_u.pas' {CloneNewcalc_Form},
  rxStrUtils in 'rxStrUtils.pas',
  device_u in 'device_u.pas' {Device_Form},
  pasfunc in 'PASFUNC.PAS',
  pascalc in 'PASCALC.PAS',
  createNewDevice_new_u in 'createNewDevice_new_u.pas' {CreateNewDevice_Form_new},
  SelectForm in 'SelectForm.pas' {SelectFrm},
  ShowDeviceInfo_u in 'ShowDeviceInfo_u.pas' {ShowDeviceInfo_Form},
  MaximizedUnit in 'MaximizedUnit.pas' {MaximizedForm},
  SQLMonitorUnit in 'SQLMonitorUnit.pas',
  DeviceList_u in 'DeviceList_u.pas' {DeviceListForm};

{$R *.res}

var
  HM: THandle;
function Check: boolean;
begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'SignurMutex');
  Result := (HM <> 0);
  if HM = 0 then
    HM := CreateMutex(nil, false, 'SignurMutex');
end;

begin
  if Check then

     begin
      application.Initialize;
      application.MessageBox('Программа уже запущена.','Расчет характеристик приборов Сигнур',0);
      application.Terminate;
      Exit;
     end;

  decimalseparator:='.';
  Application.Initialize;
  Application.Title := '"Расчет характеристики расходомеров и уровнемеров Сигнур"';
  Application.CreateForm(Tmain, main);
  Application.CreateForm(TAbout_Form, About_Form);
  Application.CreateForm(TCreateNewDevice_Form_new, CreateNewDevice_Form_new);
  Application.CreateForm(TShowDeviceInfo_Form, ShowDeviceInfo_Form);
  Application.CreateForm(TDeviceListForm, DeviceListForm);
  //  Application.CreateForm(TMaximizedForm, MaximizedForm);
  Application.CreateForm(TDM, DM);

  if DM.resultConnection <>'' then
   begin
    DM.Free;
    shellexecute(Application.Handle, nil, pchar(extractfilepath(application.exename)+'ibstart.bat'), nil, nil, SW_show);
    sleep(8000);
    Application.CreateForm(TDM, DM);
    if dm.resultConnection<>'' then
         begin
          application.MessageBox(pansichar('Видимо, не инсталлирован сервер базы данных Interbase(Firebird) или отсутствует база данных. '+dm.resultConnection),pAnsiChar('Ошибка'));
          halt;
        end;
    end;
  about_form.close;
  Application.Run;
end.
