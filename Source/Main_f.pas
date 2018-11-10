
unit Main_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, menu_f, Buttons, StdCtrls, ExtCtrls, ImgList, ActnList,
  ComCtrls, ToolWin, tvc_u,  shellapi, cxLookAndFeelPainters, cxButtons,
  PropStorageEh, XPMan, math, IBScript, IBSQL;

type
  TMainForm = class(TMenuForm)
    SpeedPanel: TPanel;
    OpenBtn: TSpeedButton;
    ExitBtn: TSpeedButton;
    SpeedButton3: TSpeedButton;
    PacketButton: TButton;
    UserButton: TButton;
    Ch_2_Button: TButton;
    CrossWinButton: TBitBtn;
    SignalBaseOpenItem: TMenuItem;
    Open_Niks: TMenuItem;
    MenuItem3: TMenuItem;
    Create_Signal1: TMenuItem;
    N12: TMenuItem;
    Import2: TMenuItem;
    MenuExport: TMenuItem;
    N13: TMenuItem;
    Print_Item1: TMenuItem;
    Printersetup2: TMenuItem;
    miWindowItem: TMenuItem;
    TileHor2: TMenuItem;
    Tilevert2: TMenuItem;
    Cascade2: TMenuItem;
    N14: TMenuItem;
    MenuItem4: TMenuItem;
    miImagebackGround: TMenuItem;
    Autosave: TMenuItem;
    Chan_Col: TMenuItem;
    Color_Scale: TMenuItem;
    Zoom_For_Visible: TMenuItem;
    Item_Niks: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    Upgrade_Item: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TcxButton;
    ToolButton2: TcxButton;
    ActionList: TActionList;
    ActClose: TAction;
    ImageList: TImageList;
    actOpenExp: TAction;
    actImport: TAction;
    ToolButton4: TcxButton;
    Timer1: TTimer;
    CursorsButton: TcxButton;
    ToolButton5: TToolButton;
    ObzorkaButton: TcxButton;
    AudioButton: TBitBtn;
    FiltrButton: TcxButton;
    ToolButton6: TToolButton;
    PrintDialog1: TPrintDialog;
    MatlabButton: TcxButton;
    FindSignalButton: TBitBtn;
    ToolButton7: TToolButton;
    N3: TMenuItem;
    btnLoadInfoFromDevice: TcxButton;
    FFTButton: TcxButton;
    FTButton: TcxButton;
    cxButton1: TcxButton;
    RegPropStorageManEh1: TRegPropStorageManEh;
    miHTML: TMenuItem;
    btnSchedule: TcxButton;
    StatusBar: TStatusBar;
    btnLoadUSAD: TcxButton;
    q1: TIBSQL;
    btnLoadFTP: TcxButton;
    procedure ActCloseExecute(Sender: TObject);
    procedure actOpenExpExecute(Sender: TObject);
    procedure actImportExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TileHor2Click(Sender: TObject);
    procedure Tilevert2Click(Sender: TObject);
    procedure Cascade2Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure AutosaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CursorsButtonClick(Sender: TObject);
    procedure ObzorkaButtonClick(Sender: TObject);
    procedure Color_ScaleClick(Sender: TObject);
    procedure AudioButtonClick(Sender: TObject);
    procedure FTButtonClick(Sender: TObject);
    procedure FFTButtonClick(Sender: TObject);
    procedure FiltrButtonClick(Sender: TObject);
    procedure MatlabButtonClick(Sender: TObject);
    procedure MenuExportClick(Sender: TObject);
    procedure FindSignalButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miShowWinClick(Sender: TObject);
    procedure btnLoadInfoFromDeviceClick(Sender: TObject);
    procedure miHTMLClick(Sender: TObject);
    procedure btnScheduleClick(Sender: TObject);
    procedure btnLoadUSADClick(Sender: TObject);
    procedure btnLoadFTPClick(Sender: TObject);
  private
    { Private declarations }
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);

  public
    { Public declarations }
    ActiveForm:TForm;
    ReturnRec:TReturnRec;
    bneedUpdate_D_Value:Boolean;
  end;

var
  MainForm: TMainForm;

implementation

uses DM_dm, Exp_f, IMAGE_u, config, Cursors,  Obzorka, Formtext,
  About, Colscale, Dialog_GetParam, Scale_h, Export_f; //, Schedule_u;

{$R *.dfm}

procedure TMainForm.ActCloseExecute(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TMainForm.actOpenExpExecute(Sender: TObject);
begin
  inherited;
  if not assigned(ExpForm) then
   begin
     ExpForm := TExpForm.create(self);
     expForm.WindowState := wsmaximized;//Normal;
     expForm.cbDatabases.Items.assign(dm.databases);
     expForm.cbDatabases.itemindex:=0;

     dm.db_path:=AppConfig.inifile.Readstring('DB','Path','');
     try
      dm.ConnectToDatabase(expForm.cbDatabases.itemindex);
      except
       shellexecute(Application.Handle, nil, pchar(extractfilepath(application.exename)+'ibstart.bat'), nil, nil, SW_SHOW);
       sleep(8000);
       try
        dm.ConnectToDatabase(expForm.cbDatabases.itemindex);
        except on e:exception do
         begin
          showmessage('Возможно не инсталлирован сервер базы данных Interbase(Firebird) или отсутствует база данных signur.gdb. Ошибка:'+e.Message);
          halt;
         end
        end
      end;

   dm.checkNewFild;



   dm.q.SQL.Clear;
   dm.q.SQL.add('select * from devices where id_device in (22,23)');
   dm.q.Open;
   if DM.q.RecordCount=0 then
    begin
      dm.checkNewFild_2014;

    end  ;

   DM.checkNewProcedure_2016; 

   dm.q.Close;
   dm.q.SQL.Clear;
   dm.q.SQL.add('select * from hoursdata where  ( s_value is null)  or   (s_value > 10000000000000)   or ((s_value < -10000000000000))');
   dm.q.Open;
   while not dm.q.Eof do
     begin
      if ( (not (dm.q.fieldbyname('S_Value').isnull)) and
                  IsNan(dm.q.fieldbyname('S_Value').value)) then
           begin
            if not dm.sql.transaction.intransaction then DM.sql.Transaction.StartTransaction;
            dm.sql.close;
            dm.sql.SQL.Text:='update hoursdata set s_value= 0 where id_hoursData = '+dm.q.fieldbyname('ID_Hoursdata').asstring;
            dm.sql.ExecQuery;
            dm.sql.Transaction.CommitRetaining;
           end;
       if ((not (dm.q.fieldbyname('D_Value').isnull)) and
               IsNan(dm.q.fieldbyname('D_Value').value)) then
           begin
            if not dm.sql.transaction.intransaction then DM.sql.Transaction.StartTransaction;
            dm.sql.close;
            dm.sql.SQL.Text:='update hoursdata set d_value= 0 where id_hoursData = '+dm.q.fieldbyname('ID_Hoursdata').asstring;
            dm.sql.ExecQuery;
            dm.sql.Transaction.CommitRetaining;
           end     ;
       dm.q.Next;
      end;
    dm.q.Close;
    dm.q.SQL.Clear;
    dm.q.SQL.add('select *  from DaysData where ( s_value is null)  or   (s_value > 1000000000000000)   or ((s_value < -1000000000000000)) ');
    dm.q.Open;
    while not dm.q.Eof do
     begin
         if ( (not (dm.q.fieldbyname('S_Value').isnull)) and
                  IsNan(dm.q.fieldbyname('S_Value').value)) then
           begin
            if not dm.sql.transaction.intransaction then DM.sql.Transaction.StartTransaction;
            dm.sql.close;
            dm.sql.SQL.Text:='update Daysdata set s_value= 0 where id_DaysData = '+dm.q.fieldbyname('ID_Daysdata').asstring;
            dm.sql.ExecQuery;
            dm.sql.Transaction.CommitRetaining;
           end;
         if ( (not (dm.q.fieldbyname('D_Value').isnull)) and
               IsNan(dm.q.fieldbyname('D_Value').value)) then
           begin
            if not dm.sql.transaction.intransaction then DM.sql.Transaction.StartTransaction;
            dm.sql.close;
            dm.sql.SQL.Text:='update Daysdata set d_value= 0 where id_DaysData = '+dm.q.fieldbyname('ID_Daysdata').asstring;
            dm.sql.ExecQuery;
            dm.sql.Transaction.CommitRetaining;
           end     ;
        dm.q.Next;
      end;
    dm.q.Close; dm.sql.close;

    dm.q.SQL.Text:=' update devices set STARTNUMBER_LARGEARCH = 4000 where  ID_DEVICE<>15' ;
    if not dm.q.Transaction.active then  dm.q.Transaction.startTransaction;
    dm.q.ExecSQL;
    dm.q.transaction.commitretaining;

     dm.q.SQL.Text:=' update devices set STARTNUMBER_LARGEARCH = 4000 where  ID_DEVICE=15' ;
    if not dm.q.Transaction.active then  dm.q.Transaction.startTransaction;
    dm.q.ExecSQL;
    dm.q.transaction.commitretaining;

        dm.q.SQL.Text:=' update devices set device_name=:name where id_device = 16';
        DM.q.ParamByName('name').asstring:='АКРОН-02-2';
    if not dm.q.Transaction.active then  dm.q.Transaction.startTransaction;
    dm.q.ExecSQL;
    dm.q.transaction.commitretaining;

        dm.q.SQL.Text:=' update devices set device_name=:name where id_device = 23';
        DM.q.ParamByName('name').asstring:='АКРОН-02-3';
    if not dm.q.Transaction.active then  dm.q.Transaction.startTransaction;
    dm.q.ExecSQL;
    dm.q.transaction.commitretaining;

          dm.q.SQL.Text:=' update devices set device_name=:name where id_device = 13';
        DM.q.ParamByName('name').asstring:='ЭХО-Р-02';
    if not dm.q.Transaction.active then  dm.q.Transaction.startTransaction;
    dm.q.ExecSQL;
    dm.q.transaction.commitretaining;

          dm.q.SQL.Text:=' update devices set device_name=:name where id_device = 14';
        DM.q.ParamByName('name').asstring:='ЭХО-АС-01';
    if not dm.q.Transaction.active then  dm.q.Transaction.startTransaction;
    dm.q.ExecSQL;
    dm.q.transaction.commitretaining;

    dm.q.SQL.Text:=' update devices set STARTNUMBER_LARGEARCH=0 where id_device in (16,22,23)';
   if not dm.q.Transaction.active then  dm.q.Transaction.startTransaction;
    dm.q.ExecSQL;
    dm.q.transaction.commitretaining;


    if bneedUpdate_D_Value then     // 2016 12 1     - bNeedUpdate всегда false,  D_Value  теперь достается процедурой и его пересчитывать не надо
     begin
      dm.sql.close;
      dm.sql.SQL.Text:='update hoursdata hd set hd.d_value =0 where hd.eksp_nomer in (select e.eksp_nomer from  eksp e where e.hide=0)';
      dm.sql.ExecQuery;
      dm.sql.Transaction.CommitRetaining;
      dm.sql.close;
      dm.sql.SQL.Text:='update Daysdata hd set hd.d_value =0 where hd.eksp_nomer in (select e.eksp_nomer from  eksp e where e.hide=0)';
      dm.sql.ExecQuery;
      dm.sql.Transaction.CommitRetaining;
      AppConfig.IniFile.WriteBool('system','bneedUpdate_D_Value',false);
     end;

     expform.eksps.close;
     expform.eksps.open;
     ExpForm.show;
//     btnScheduleClick(nil);
   end
    else
   begin
   if expform.windowstate = wsNormal  then expform.windowstate :=wsMinimized else
    begin
     expForm.WindowState := wsMaximized;//Normal;
// expform.eksps.close;
// expform.eksps.open;
     ExpForm.show;
    end;
   end;
// expform.eksps.close;
// expform.eksps.open;
end;

procedure TMainForm.actImportExecute(Sender: TObject);
begin
  inherited;
    try
    actOpenExpExecute(nil);
 //   ExpForm.miImportClick(nil);
  except  on e:exception do
         begin
          showmessage(' Ошибка:'+e.Message);
          halt;
         end
  end;

end;

procedure TMainForm.Timer1Timer(Sender: TObject);
var s:string;
begin
  inherited;
  timer1.enabled := false;
//  if ass
  if not assigned(DM) then
  try
    dm := TDM.create(self);
  except
  end;

  try
   actOpenExpExecute(nil);
  except on e:exception do
         begin
          s:=e.message;
          if pos('INTERFACE_MODE',s)>0 then
            begin
  //           showmessage(' Ошибка:'+e.Message);
             q1.SQL.Text:='ALTER TABLE EKSP ADD INTERFACE_MODE SMALLINT DEFAULT 0';
             q1.ExecQuery;
             q1.SQL.Text:='ALTER TABLE EKSP ADD VIA_MODEM SMALLINT DEFAULT 0';
             q1.ExecQuery;
             q1.sql.Clear;
             q1.SQL.Add('ALTER TRIGGER EKSP_BI ');
             q1.SQL.Add(              ' AS                   ');
             q1.SQL.Add(              ' BEGIN                ');
             q1.SQL.Add(              '   IF (NEW.EKSP_NOMER IS NULL) THEN ');
             q1.SQL.Add(              '     NEW.EKSP_NOMER = GEN_ID(GEN_EKSP_ID,1); ');
             q1.SQL.Add(              '   for  ');
             q1.SQL.Add(              '    select (eksp_signalsource) from eksp where eksp_theme = new.eksp_theme ');
             q1.SQL.Add(              '    into new.eksp_signalsource do ');
             q1.SQL.Add(              '     begin ');
             q1.SQL.Add(              '     end     ');
             q1.SQL.Add(              '   new.via_modem = 0; ');
             q1.SQL.Add(              '   if (new.modem=1 ) then new.via_modem = 1;');
             q1.SQL.Add(              '   new.interface_mode = 0; ');
             q1.SQL.Add(              '   if (new.modbus = 1) then new.interface_mode = 1;');
             q1.SQL.Add(              ' END ');

             q1.ExecQuery;
             q1.Transaction.CommitRetaining;
              q1.SQL.Text:='update eksp set interface_mode = 0';
      //        q1.ExecQuery;
              q1.SQL.Text:='update eksp set VIA_Modem = 0';
       //       q1.ExecQuery;
       //       q1.Transaction.CommitRetaining;
             ShowMessage(' Обновление базы данных произведено. Выполните повторный вход в программу');
             Halt;
            end;
          //halt;
          //actOpenExpExecute(nil);
         end

  end;

end;

procedure TMainForm.TileHor2Click(Sender: TObject);
begin
  inherited;
 TileMode := tbHorizontal;
  Tile;
end;

procedure TMainForm.Tilevert2Click(Sender: TObject);
begin
  inherited;
 TileMode := tbVertical;
 Tile;
end;

procedure TMainForm.Cascade2Click(Sender: TObject);
begin
  inherited;
 Cascade;
end;

procedure TMainForm.N14Click(Sender: TObject);
var
 i:integer;
 begin
  for i:=Application.ComponentCount-1 downto 0 do
    begin
    if (Application.Components[i] is TImageForm )
        then TImageForm(Application.Components[i]).close;
    if (Application.Components[i] is TTextForm )
        then TTextForm(Application.Components[i]).close;
    if (Application.Components[i] is TObzorkaForm )
        then TObzorkaForm(Application.Components[i]).close;
  end;
   Expform.Show;
end;

procedure TMainForm.AutosaveClick(Sender: TObject);
begin
  inherited;
   Autosave.Checked:=not AutoSave.checked;
end;


procedure TMainForm.AppMessage(var Msg: TMsg; var Handled: Boolean);
var
    i:word;
    RetFile:file of TReturnRec;
begin
  if  (Msg.message = wm_endProcessing_Gl_2004) then
  begin
   for i:=0 to Application.ComponentCount-1 do
   if (((Application.Components[i] is TImageForm ) and
        (TImageForm(Application.Components[i]).Handle = Msg.wParam))
        or
       ((Application.Components[i] is TObzorkaForm ) and
        (TObzorkaForm(Application.Components[i]).Handle = Msg.wParam))
              )
        then
    begin
       assignFile(RetFile,ReturnFileName);
       Reset(RetFile);Read(RetFile,ReturnRec);
       CloseFile(retFile);
       if Msg.lParam = 0 then SendMessage(Msg.wParam, wm_EndProcessing,0,longint(@ReturnRec))
        else SendMessage(Msg.wParam, wm_End2ChProcessing,0,longint(@ReturnRec));
       break;
    end;
 end;
 if  (Msg.message = wm_endMeas_Gl) then
  begin
   SendMessage(ExpForm.Handle, wm_StartImport,0,0);
   exit;
  end;
 if  (Msg.message = wm_endMeasImport_No_Tabl_Gl) then
  begin
   exit;
  end;
 if  (Msg.message = wm_endMeasImport_Gl) then
  begin
   exit;
  end;
 if  (Msg.message = wm_endImport_Gl) then
  begin
   exit;
  end;
 if  (Msg.message = wm_endImport_No_Tabl_Gl) then
  begin
   exit;
  end;

 if  (Msg.message = wm_SetUserCursor_GL) then  {простановка курсора из внешнего программы}
 begin
   for i:=0 to Application.ComponentCount-1 do
   if (((Application.Components[i] is TImageForm ) and
        (TImageForm(Application.Components[i]).Handle = Msg.wParam)) )
        then
    begin
       TImageForm(Application.Components[i]).PointNumber:=MSG.lParam;
//       SetCursorFromAudio(TImageForm(Application.Components[i]),false);
       break;
    end;
 end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption:=Program_Name;
  Application.OnMessage:=AppMessage;
  AutoSave.Checked := AppConfig.inifile.Readbool('system','AutoSave',true);
  AudioButton.Enabled:=False;
  FFTButton.Enabled:=false;
  FTButton.Enabled:=False;
  MatLabButton.Enabled:=False;
  {FxButton.Enabled:=False;}
  ObzorkaButton.Enabled:=False;
  FiltrButton.Enabled:=False;
  FindSignalButton.enabled:=false;
  freeandnil(mainmenuitem);
  freeandnil(expmenuitem);
  bneedUpdate_D_Value:= false; //AppConfig.inifile.Readbool('system','bneedUpdate_D_Value',true);

end;

procedure TMainForm.CursorsButtonClick(Sender: TObject);
begin
  inherited;
 if ActiveForm is TIMageForm then
  begin
  if cursors_form=nil then Cursors_form:=TCursors_Form.Create(mainForm);
  Cursors_Form.Cursors.Close;
  Cursors_Form.Cursors.ParamByName('id_eksp_Parent_Param').asinteger :=
    TImageForm(ActiveForm).SelectViewQueryEksp_Parent.Value;
  Cursors_Form.Cursors.ParamByName('AxisXName_Param').asString:=
    TImageForm(ActiveForm).Sig_TableNameX.Value;
  Cursors_Form.Cursors.Open;
  Cursors_Form.Show;
  exit;
 end;
 if ActiveForm is TObzorkaForm then
  begin
  if cursors_form=nil then Cursors_form:=TCursors_Form.Create(mainForm);
  Cursors_Form.Cursors.Close;
  Cursors_Form.Cursors.ParamByName('id_eksp_Parent_Param').asinteger :=
    TObzorkaForm(ActiveForm).SelectViewQueryEksp_Parent.Value;
  Cursors_Form.Cursors.ParamByName('AxisxName_Param').asString:=
    TObzorkaForm(ActiveForm).Sig_TablenameX.Value;
  Cursors_Form.Cursors.Open;
  Cursors_Form.Show;
  exit;
 end;
end;

procedure TMainForm.ObzorkaButtonClick(Sender: TObject);
begin
  inherited;
 if ActiveForm is TIMageForm then
   TImageForm(ActiveForm).ObzorkaButtonClick(Sender);
end;

procedure TMainForm.Color_ScaleClick(Sender: TObject);
begin
  inherited;
 color_scale_form:=TColor_Scale_Form.create(self);
 color_scale_form.Show;
end;

procedure TMainForm.AudioButtonClick(Sender: TObject);
begin
  inherited;
 if ActiveForm is TIMageForm then
   TImageForm(ActiveForm).AudioItemClick(Sender);
end;

procedure TMainForm.FTButtonClick(Sender: TObject);
begin
  inherited;
if Sender <> UserButton then
 if ActiveForm is TIMageForm then
    TImageForm(ActiveForm).Call_ProcClick(Sender)
end;

procedure TMainForm.FFTButtonClick(Sender: TObject);
begin
  inherited;
 if ActiveForm is TIMageForm then
  TImageForm(ActiveForm).Call_ProcClick(Sender)
 end;
procedure TMainForm.FiltrButtonClick(Sender: TObject);
begin
  inherited;
 if ActiveForm is TIMageForm then
  TImageForm(ActiveForm).Call_ProcClick(Sender)
end;

procedure TMainForm.MatlabButtonClick(Sender: TObject);
begin
  inherited;
 if Sender <> UserButton then
  if ActiveForm is TIMageForm then
        TImageForm(ActiveForm).Call_ProcClick(Sender)
end;

procedure TMainForm.MenuExportClick(Sender: TObject);
begin
  inherited;
 if ActiveForm is TIMageForm then
     SendMessage(TImageForm(ActiveForm).Handle, wm_Export,0,0);

end;

procedure TMainForm.FindSignalButtonClick(Sender: TObject);
begin
  inherited;
  if Sender <> UserButton then
   if ActiveForm is TIMageForm then
    TImageForm(ActiveForm).FindSignal(Sender)

end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
 //canClose:= application.MessageBox( 'Вы действительно желаете завершить работу с программой?',
 //                 'Подтверждение', MB_YESNO or MB_ICONQUESTION) = idYes;
 canClose:=true;
 if canclose then
  begin
   expform.miClearClick(nil);
   expform.close;
  end;
 if canclose then DialogGetParam.close;
 if canclose then SCALE_HELP_Form.close;
 if canclose then  Export_Form.close;
end;

procedure TMainForm.miShowWinClick(Sender: TObject);
begin
  inherited;
  TForm(Tmenuitem(sender).tag).show;
  TForm(Tmenuitem(sender).tag).WindowState := wsNormal;
end;

procedure TMainForm.btnLoadInfoFromDeviceClick(Sender: TObject);
begin
  inherited;
  Expform.btnLoadInfoFromDeviceClick(sender);
end;

procedure TMainForm.miHTMLClick(Sender: TObject);
var
 s:string;
begin
  inherited;
  s:=extractfilepath(Application.exename)+'HTML\Signur.mht';
  ShellExecute(Application.Handle, nil, pchar(s), nil, nil, SW_SHOW);


end;

procedure TMainForm.btnScheduleClick(Sender: TObject);
begin
  inherited;
(* if ScheduleForm=nil then Scheduleform:=TScheduleForm.Create(mainForm);
 if sender=nil then dm.CreateSchedule;
 if sender<> nil then
  begin
  ScheduleForm.show;
  ScheduleForm.btnShowScheduleclick(nil);
  end;
  *)
end;

procedure TMainForm.btnLoadUSADClick(Sender: TObject);
begin
  inherited;
  Expform.miBlueToothClick(sender);
end;

procedure TMainForm.btnLoadFTPClick(Sender: TObject);
begin
  inherited;
  Expform.btnLoadFTP(sender);
end;

end.

