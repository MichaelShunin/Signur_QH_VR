unit BlueTooth_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, menu_f, Menus, cxLookAndFeelPainters, cxButtons, StdCtrls,
  Buttons, ExtCtrls, Gauges, tvc_u, Grids, Outline, DirOutln, FileCtrl;

const
                                                            
   DriverFileName = 'SIGNURDRIVER2.EXE';
//  DriverFileName = 'GETSIGNURDATA.EXE';
     Get_USAD_INFO = 1;
     GET_USAD_Arch = 13;
     GET_USAD_Clear = 14;

    GET_GAUGEPROGRESS  = $c0;
    DRIVER_HANDLE      = $c6;

     WM_COPYDATA        = $004a;


type
 tRec = record
  c: integer;
  d: string;
 end;

  TBlueToothForm = class(TMenuForm)
    pnButtons: TPanel;
    lbStrNum: TLabel;
    lbStrInit: TLabel;
    btnIdentification: TBitBtn;
    btnArchH: TBitBtn;
    btnArchD: TBitBtn;
    btnGetArch: TBitBtn;
    btnArchOnOffErr: TBitBtn;
    btnArchP: TBitBtn;
    btnLoadInfoFromDevice: TcxButton;
    btnClear: TBitBtn;
    pnInfo: TPanel;
    Panel1: TPanel;
    PB: TGauge;
    Timer1: TTimer;
    lb: TListBox;
    Timer2: TTimer;
    procedure btnIdentificationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MessageReceiver(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
        path, fn, txt : string;
        WaitAnswer:boolean;
        result : Word;
        waitCount, waitCountMax:longint;
        opCode:integer;
        DriverHandle:word;
        USAD_ARCH:string;
  public
    { Public declarations }
    N_Files:integer ; // количество накопленных архивных файлов
    procedure Get_Arch_Data;

  end;

var
  BlueToothForm: TBlueToothForm;

implementation

uses DM_dm, Exp_f;

{$R *.dfm}

procedure TBlueToothForm.btnIdentificationClick(Sender: TObject);

begin
  inherited;
  if not FileExists(path+'/'+DriverFileName) then
    begin
    pnInfo.Caption := 'программа-драйвер не найдена';
    exit;
   end;
 lb.Visible:=false;lb.Update;
 OpCode := GET_USAD_Info;
 if (Sender=btnIdentification) then
     OpCode := GET_USAD_Info;
 if (Sender=btnGetArch)  then
  begin
   OpCode := GET_USAD_Arch;
   if N_Files = 0 then
    begin
     showMessage('Не выполнена идентификация или УСАД не содержит данных');
     exit;
    end;
  end;
 if (Sender=btnClear) then OpCode:=GET_USAD_Clear;
 pnButtons.Enabled:=false;

 WaitAnswer := true;
 waitCount:=0;
 pnInfo.Caption := 'ожидание ответа...';
 txt := path+'\'+DriverFileName+' '+IntToStr(Handle)+' '+IntToStr(OpCode);
 result := WinExec(PChar(txt),SW_SHOWMINIMIZED);
 Repaint;
 Timer1.enabled:=true;
 if result<33 then
   begin
     case result of
           0  :    txt := 'недостаточно памяти';
          11  :    txt := 'программа-драйвер не найдена'
          else     txt := 'некорректный вызов программы-драйвера'
       end;
       Timer1.enabled:=false;
     Application.MessageBox(PChar(txt),'Ошибка',MB_ICONERROR);
     pnInfo.Caption := '';
     pnButtons.Enabled:=true;
     WaitAnswer := False;
     waitCount:=0;
   end

end;

procedure TBlueToothForm.FormCreate(Sender: TObject);
begin
  inherited;
  GetDir(0,path);
  WaitAnswer := False;
  waitCount:=0;
  N_Files:=0;
  Timer1.enabled:=false;
  lb.Visible:=false;
end;

procedure TBlueToothForm.Timer1Timer(Sender: TObject);
begin
  inherited;
 if waitAnswer then
  begin
   waitCount:=waitCount+1;
   case opcode of
    GET_USAD_Info: WaitCountMax:=round((Timer1.Interval/1000)*60); // 30 сек                                //
    GET_USAD_Arch: if N_Files<>0 then WaitCountMax:=round(10/(Timer1.Interval/1000)*N_Files*1.3) //10 сек на файл и запас в 30%
        else WaitCountMax:=round((Timer1.Interval/1000)*20);  //10 сек
    GET_USAD_Clear:WaitCountMax:=round((Timer1.Interval/1000)*40); // 20 сек
   end;
   if waitcount>waitCountMax   then
     begin
      waitCount:=0;
      timer1.Enabled:=false;
      ShowMessage('Программа драйвер не отвечает');
      pnInfo.Caption := '';
      pnButtons.Enabled:=true;
      WaitAnswer := False;
      waitCount:=0;
      lb.Visible:=false;
     end

  end;
end;

procedure TBlueToothForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  WaitAnswer := False;
  waitCount:=0;
  N_Files:=0;
  Timer1.enabled:=false;
  pnInfo.caption:='';
  lb.Visible:=FALSE;
  pnButtons.Enabled:=true;
   lb.Visible:=false;
end;


procedure TBlueToothForm.MessageReceiver(var Msg: TWMCopyData);
var
  oc, mess : Integer;
  USAD_INFO_STR, USAD_CLEAR,NFilesStr:string;
      CD:TCopyDataStruct;
    RecToTransfer:TRecToTransfer;
begin
show;
CD:=PCopyDataStruct(msg.CopyDataStruct)^;

 RecToTransfer.otherdata:=cd.cbData;
                  //
// УСАД / версия 1 / 22 файла

  oc := Msg.CopyDataStruct.dwData;

  pnInfo.Caption:='';
{  if (oc=DRIVER_HANDLE) then
    DriverHandle := StrToInt(fn);
 }
  //else   DriverAnswer:= True;
  if (oc=GET_USAD_INFO) then
    begin
      RecToTransfer.fname:=pChar(msg.copydatastruct.lpData);
      USAD_INFO_STR := RecToTransfer.FName;
      WaitAnswer:=false; pnButtons.Enabled:=true; Timer1.Enabled:=false;
      Repaint;
   N_Files:=10;
      pnInfo.Caption:=USAD_INFO_STR;//'УСАД содержит архивы приборов. Всего '+nFilesstr;
      update;
      Timer2.Enabled:=true;
      Exit;
    end;
    if (oc=GET_GAUGEPROGRESS) then
    begin
      pb.Visible:=true;      WaitAnswer:=false;  Timer1.Enabled:=false;
      pb.MaxValue:=100;
      pb.Progress:=rectotransfer.otherData;
      pnInfo.Caption:='Идет считывание архивов из УСАД';
      Repaint;
      Exit;
    end;
    if (oc=GET_USAD_ARCH) then
    begin
      RecToTransfer.fname:=pChar(msg.copydatastruct.lpData);
      USAD_ARCH := RecToTransfer.FName+'\ARCH\';
      WaitAnswer:=false; pnButtons.Enabled:=true; Timer1.Enabled:=false;
      Repaint;
      pnInfo.Caption:='Архивы приборов переданы в папку '+USAD_ARCH;
      pb.Visible:=false;
      update; sleep(1000);
      Get_Arch_Data;
      Exit;
    end;
    if (oc=GET_USAD_CLEAR) then
    begin
      USAD_CLEAR := 'Очистка выполнена';
      WaitAnswer:=false; pnButtons.Enabled:=true; Timer1.Enabled:=false;
      Repaint;
      pnInfo.Caption:=USAD_CLEAR;
      Exit;
    end;
end;

procedure TBlueToothForm.Get_Arch_Data;
var
 i:integer;
 s:string;
 Device_number, Device_id :integer;
 Device_type:string;
 Device_num_str:string;
 HourLast, DayLast: TDatetime;
 bClear:boolean;

 RecToTransfer:TRecToTransfer;
 CD : TCopyDataStruct;

function GetFiles(Path:String; Full: Boolean = False):TStrings;
   Var
   Rec:TSearchRec;
   TMP:TStrings;
   ls: String;
   i: integer;
begin
  Result:=TStringList.Create;
  if Path[Length(Path)]<>'\' Then Path:=Path+'\';
  //ChDir(Path);
  if FindFirst(Path+'\*.*',faAnyFile,Rec)=0 then
    begin
     if (Rec.Name<>'.')and(Rec.Name<>'..') then
       if (Rec.Attr and faDirectory) <> 0 then begin
       TMP:=GetFiles(Path+Rec.Name,True);
       Result.AddStrings(TMP);
       TMP.Free;
       end else Result.Add(Path+Rec.Name);

     while FindNext(Rec)=0 do
       begin
        if (Rec.Name<>'.')and(Rec.Name<>'..') then
         if (Rec.Attr and faDirectory) <> 0 then begin
         TMP:=GetFiles(Path+Rec.Name,True);
         Result.AddStrings(TMP);
         TMP.Free;
         end else Result.Add(Path+Rec.Name);
       end;
    end;
 if not Full then
  for i:=0 to Result.Count-1 do
   begin
     ls := Result[i];
     Delete(ls,1,Length(Path));
     Result[i] := ls;
   end;
  FindClose(Rec);
end;

procedure RemoveAll(path: string);
var
  sr: TSearchRec;
begin
  if FindFirst(path + '\*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if sr.Attr and faDirectory = 0 then
      begin
        DeleteFile(path + '\' + sr.name);
      end
      else
      begin
        if pos('.', sr.name) <= 0 then
          RemoveAll(path + '\' + sr.name);
      end;
    until
      FindNext(sr) <> 0;
  end;
  FindClose(sr);
  RemoveDirectory(PChar(path));
end;


Procedure getHourDayLast(DeviceId: integer);
 begin
  dm.q.close;
  dm.q.SQL.Clear;
  dm.q.SQL.add('select max(Hour_Value) as hourlast from HoursData where Eksp_Nomer = :Eksp_Nomer');
  dm.q.parambyname('eksp_Nomer').asinteger:=DeviceId;
  dm.q.Open;
  if dm.q.fieldbyname('HourLast').isnull then HourLast:=0 else HourLast:=dm.q.fieldbyname('hourlast').value;
  dm.q.close;
  dm.q.SQL.Clear;
  dm.q.SQL.add('select max(day_Value) as daylast from daysData where Eksp_Nomer = :Eksp_Nomer');
  dm.q.parambyname('eksp_Nomer').asinteger:=DeviceId;
  dm.q.Open;
  if dm.q.fieldbyname('daylast').isnull then dayLast:=0 else DayLast:=dm.q.fieldbyname('daylast').value;
 end;



begin
LB.Visible:=false;
bClear:=true;
lB.Items.clear;
LB.Items.assign(gETfILES(USAD_ARCH,false));
FOR I:=0 TO lb.items.count-1 do
 begin
  lb.ItemIndex:=i;
  update;
  // извслечь номер прибора
  s:=lb.items[i];       // 044441305101622
  Device_type:=s[1];     // найти nbg прибора
  Device_Num_str:=copy(s,2,4);
  device_number:=strtoint(device_Num_str);
  Device_Id:=dm.GetDeviceCode(device_number, Device_Type[1]);
  if device_id = 0 then
   BEGIN
     lb.items[i]:='ОШИБКА. Нет прибора '+Device_Num_str+' в БД:  '+lb.items[i];
     bClear:=false;
   END
   else
    begin
       getHourDayLast(Device_ID);
   // определить тип файла
         RecToTransfer.TypeOfFile:=100;
         if pos ('temp_h',s)>0 then
                  RecToTransfer.TypeOfFile:=1 {Hours};
         if pos ('temp_d',s)>0 then
                  RecToTransfer.TypeOfFile:=2 {Days};
         if pos ('temp_on',s)>0 then
                  RecToTransfer.TypeOfFile:=3 {On_event};
         if pos ('temp_off',s)>0 then
                  RecToTransfer.TypeOfFile:=4 {off_event};
         if pos ('temp_err',s)>0 then
                  RecToTransfer.TypeOfFile:=40 {off_event +причины отключений
                                                 причины отключений будут выбираться из temp_err файла при считывнии temp_off};
         if pos ('temp_p',s)>0 then
                  RecToTransfer.TypeOfFile:=5 {таблица параметров};  // импорт таблицы параметров не выполняется из прибора
         RecToTransfer.FName:=USAD_ARCH+'\'+s;
  // загрузить данные в архив
        RecToTransfer.otherdata:=Device_ID;  // код записи в архиве, для который передаются данные
          RecToTransfer.Mult_k:=1;
         RecToTransfer.HourLast:=HourLast;
         RecToTransfer.dayLast:=dayLast;
         CD.lpData := @RecToTransfer;
         CD.dwData :=length(RecToTransfer.Fname);
         cd.cbData := sizeof(RecToTransfer);
         pnInfo.Caption   := 'обработка '+s;
         pnInfo.Update;
         if RecToTransfer.TypeOfFile in [1,2,3,4] then
            sendMessage(ExpForm.Handle, WM_COPYDATA, Handle, integer(@CD));
         show;
   end;
  end;

  for i:=lb.Items.count-1 downto 0 do
  begin
   s:=lb.items[i];
   if pos('ОШИБКА.',s)<=0 then begin lb.ItemIndex:=i; lb.DeleteSelected;end
     else deletefile(USAD_ARCH+'\'+s);
  end;
   sleep(1500);
  if bClear then RemoveAll(USAD_ARCH);
  lb.Visible:=not bClear;
  pnInfo.Caption   := 'Загрузка данных из накопителя в БД Сигнур завершена';
  Update;


end;

procedure TBlueToothForm.Timer2Timer(Sender: TObject);

begin
  inherited;
  timer2.Enabled:=false;
  btnIdentificationClick(btnGetArch);
end;


end.
