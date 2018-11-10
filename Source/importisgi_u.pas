unit importisgi_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ShellCtrls, ExtCtrls, StdCtrls, ToolWin, ImgList,
  Menus, Buttons, TeEngine, Series, TeeProcs, Chart,dm_U,ibblob, Grids,
  DBGrids,tvc_u,dateutils, DBCtrls,shellapi;


var
 ScaleTD_LCR:double =1000;
 EmptyOborot:integer = 0; 
 OborotMax:integer = 33; 
type
  TImportisgi_form = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    StaticText2: TStaticText;
    LB: TListBox;
    OD: TOpenDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Object_CB: TComboBox;
    Reason_CB: TComboBox;
    Author_CB: TComboBox;
    Memo1: TMemo;
    GB3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dateEksp: TStaticText;
    Freq: TStaticText;
    NChan: TStaticText;
    NPoint: TStaticText;
    Duration: TStaticText;
    SaveBtn: TBitBtn;
    CheckBox1: TCheckBox;
    LB1: TListBox;
    GB: TPanel;
    N2: TMenuItem;
    N3: TMenuItem;
    Label10: TLabel;
    E_Name: TEdit;
    AutoCB: TCheckBox;
    emptyoborotpanel: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    DBText1: TDBText;
    Label14: TLabel;
    DBText2: TDBText;
    Contact1: TMenuItem;
    EtapPanel: TPanel;
    Label11: TLabel;
    Stage_CB: TComboBox;
    ModePanel: TPanel;
    Mode: TLabel;
    Oil: TLabel;
    OnlyFile_CB: TCheckBox;
    LabelInfo: TLabel;
    procedure N1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure LBClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure AutoCBClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Archiev_FormcleaerlbClick(Sender: TObject);
    procedure Object_CBClick(Sender: TObject);
    procedure Contact1Click(Sender: TObject);
    procedure WMCopyData(var m : TMessage); message WM_COPYDATA;
  private
    { Private declarations }
  typeOfFile:string;
  ChArr:array of TChart;
  LCR:TLCRShapka;
  E24:TE24Shapka;
  S386:TS386Shapka;
  LNG_1:TLongshapka;
  LNG_4:TLongshapka;
  LNG:TLongshapka;
  OSL:TOSLShapka;
  krd:TkrdShapka;
  ovv:TOvvShapka;
  evv:TEvvShapka;
  avv:TAvvShapka;
  ufa:TUfashapka;
  DataProperties:TSignalShapka;
//  LNG:TLNGShapka;
  DataDouble:array of array of  double;
  Data_Int:array of array of  integer;
  stage_array:array[0..40] of TStageRec;
  StageCount:integer;
  EtapStart,EtapFinish:integer;
  Mode_i,Oil_i:integer;
  ext:string;
  procedure  GetFilefiltr;
  Procedure GetDataProperties (typeoffile:string;var FDS:TFilestream;FileName:string);
  Procedure GetDoubleData (typeoffile:string;var FDS:TFilestream;Filename:string);
  Procedure GetProcessing (Processing:string);
 public
    { Public declarations }
 Function CreateEksp(E_ID_parent:integer;SourceFile,E_name_Text,Stage_CB_Text,Object_CB_Text,Author_CB_Text,Reason_CB_text,memo1_text,Mode_caption, Oil_Caption:string):integer;
 procedure GetSignal(bprocessing:boolean);

  end;

var
  Importisgi_form: TImportisgi_form;

implementation

uses config, setup_u,math, utils;

{$R *.dfm}

procedure TImportisgi_form.N1Click(Sender: TObject);
begin
 close;
end;

procedure TImportisgi_form.SpeedButton1Click(Sender: TObject);
var i:integer;
begin
 if od.execute then
  begin
   for i:= 0 to OD.Files.count-1 do
   if LB1.items.indexof(OD.Files[i])=-1 then
    begin
     LB1.Items.add(OD.Files[i]);
     LB.Items.add(extractfilename(OD.Files[i]));
    end;
    Lb.ItemIndex:=Lb.Items.count-1;
    LBclick(nil);
    Checkbox1.Checked:=false;
   end; 
end;

procedure TImportisgi_form.FormCreate(Sender: TObject);
begin
OD.InitialDir:=extractfilepath(application.exename)+'data';
memo1.text:='';
top:=30;
with  TConfigurationManager.GetInstance.IniFile do
    begin
     ScaleTD_LCR:=ReadFloat('LCR','LCR_TD',ScaleTD_LCR);
     autocb.Checked:=Readbool('import','autocb',true);
    end;
// DM.GetStringsFromIBSQL(dm.q_general,stage_CB.Items,'select distinct test_stage  from protocolparams where pp_active=''*'' order by test_stage','test_stage');
 stage_CB.Items.assign(Etapstrings);
 stage_CB.itemindex:=-1;
 EmptyOborotPanel.visible:=false;
end;

procedure TImportisgi_form.SaveBtnClick(Sender: TObject);
var i,j:integer;
 NCount:integer;
begin
    labelinfo.Caption:='Подготовка к сохранению сигнала';labelinfo.Update;
with  TConfigurationManager.GetInstance.IniFile do
    begin
     writebool('import','autocb',autocb.checked);
    end;

if object_CB.Text='' then
 begin
  showmessage('Не задан объект испытаний');
  exit
 end;

try
 nCount:=0;

 if lb.Items.count=1 then lb.selected[0]:=true;
 for i:= LB.items.count-1 downto 0 do
   if LB.Selected[i] then
    begin
     LB.ITEMINDEX:=I;
     Getsignal(true); // после этого есть запись DataProperties  и массив Data
//     lb.update;
     CreateEksp(0,lb.Items[i],E_name.Text,Stage_CB.Text,Object_CB.Text,Author_CB.Text,Reason_CB.text,memo1.text,Mode.caption, Oil.Caption);
     lb.Items.delete(i);
     lb1.Items.delete(i);
     lb.update;
     ncount:=NCount+1;
    end;
  dm.RestartTransaction;
  dm.GetActiveDevices;
  if charr<>nil then
  for j:=low(Charr) to High(Charr)
     do begin
         charr[j].series[0].Free;
         charr[j].free;
        end;
  Charr:=nil;
  if lb.items.count=0 then close
   else
    begin
     lb.itemindex:=0;
     lbclick(nil);
     if nCount=0 then showmessage('Не указаны файлы для импорта');
    end;
 except
        on E: Exception do
          showmessage('Ошибка при записи в базу: ' + E.Message);
      end;
end;

procedure TImportisgi_form.LBClick(Sender: TObject);
begin
 GetSignal(false);
end;


procedure TImportisgi_form.GetSignal(bprocessing:boolean);
var
  FileDataSource:TFileStream;
  i,j:integer;
  FLS:TFastLineSeries;
  s:string;
begin
try
 filedatasource:=nil;
 try
 if lb.itemindex>-1 then GB3.Caption:=' Файл  '+LB1.Items[LB.itemindex];
 s:= LB1.Items[LB.itemindex] ;
 typeoffile:=lowercase(extractfileext( LB1.Items[LB.itemindex] ));
 delete(typeoffile,1,1);
 if ((typeoffile='krd') and (object_CB.Text='')) then
     begin
      showmessage('Не задан объект испытаний. Необходимо определить число холостых оборотов и максимальное число оборотов');
      exit
     end; GB3.visible:=true;
 gb.Visible:=true;
 FileDataSource:=TFileStream.Create(LB1.Items[LB.itemindex],fmOpenRead);

 GetDataProperties(Typeoffile,FiledataSource,LB1.Items[LB.itemindex]);
 onlyfile_CB.Hint:=LB1.Items[LB.itemindex]+'.'+ext;

 except
   on E: Exception do
    begin      gb3.Caption:= e.Message;      exit;     end;
 end;

 try  dateeksp.Caption:=formatdatetime('dd mmm yyyy hh:mm:ss',DataProperties.Date_Eksp);
           except    on E: Exception do         dateeksp.Caption:='error '+e.message;   end;
 try   Freq.Caption:=formatfloat('0.00',1/(DataProperties.TD));
          except    Freq.Caption:='error';   end;
 try  Nchan.caption:=inttostr(DataProperties.NChanal);
          except    NChan.Caption:='error';   end;
 try  NPoint.Caption:=inttostr(DataProperties.NPoints);
          except    NPoint.Caption:='error';   end;
 try   Duration.Caption:=Formatfloat('0.0000',DataProperties.NPoints*DataProperties.TD);
          except on E: Exception do     duration.Caption:='error '+e.message;   end;

 if autoCB.checked then E_name.Text:=changesymbol(Extractfilename(LB1.Items[LB.itemindex])+' '+dateEksp.caption,' ','_');
 dm.devices.Locate('typeoffile',typeoffile,[]);


(* if charr<>nil then
  for j:=low(Charr) to High(Charr)
     do begin
         charr[j].series[0].Free;
         charr[j].free;
        end;

 chArr:=nil;  setlength(ChArr,DataProperties.Nchanal);
  *)

(*
 DM.channels.first;
 for j:=0 to DataProperties.nchanal-1 do
   begin
    ChArr[j]:=TChart.create(GB);
    ChArr[j].parent:=GB;
    ChArr[j].align:=alnone;
    Charr[j].Height:=trunc(GB.Height/5{DataProperties.nChanal});
    Charr[j].left:=1;
    Charr[j].width:=Charr[j].parent.width-2;
    Charr[j].top:=j*Charr[j].height;
    FLS:=TFastlineseries.Create(self);
    FLS.clear;
    FLS.SeriesColor:=clBackground;
    Charr[j].AddSeries(FLS);
    Charr[j].AllowZoom:=false;
    Charr[j].AllowPanning:=pmNone;
    charr[j].View3D:=false;
    Charr[j].clippoints:=false;
    Charr[j].Frame.Visible:=false;
    Charr[j].leftaxis.Axis.Color:=clAppWorkSpace;
    Charr[j].BottomAxis.Grid.Visible:=false;
    charr[j].Legend.Visible:=false;
    charr[j].Bottomaxis.Visible:=(j>DataProperties.NChanal-1);
//    charr[j].Bottomaxis.Title. .Caption:='t, сек';
    charr[j].LeftAxis.Labels:=false;
    if dm.Channels.eof then charr[j].LeftAxis.Title.Caption:='  '
     else  charr[j].LeftAxis.Title.Caption:=dm.Channels.fieldbyname('Ch_Short_Name').asstring{+ ',' +dm.Channels.fieldbyname('Channel_Num').asstring};
    charr[j].LeftAxis.Title.Font.Size:=8;
    Dm.channels.Next;
    Charr[j].BufferedDisplay:=true;
   end;
  *)

 DataDouble:=nil;  setlength(DataDouble,DataProperties.Nchanal,DataProperties.npoints);
 Data_int:=nil;  setlength(Data_Int,2,DataProperties.npoints);

 if bprocessing then GetDoubleData(Typeoffile,FiledataSource,LB1.Items[LB.itemindex]);
 if bProcessing then GetProcessing(dm.devices.fieldbyname('Processing').asstring);

 SaveBtn.enabled:=true;

 (*
  for i:=0 to (DataProperties.Npoints-1) do
    for j:=0 to 4{DataProperties.nchanal-1} do
     begin
      charr[j].Series[0].AddXY(i*DataProperties.TD,datadouble[j,i]);
     end;

  for j:=5 to DataProperties.nchanal-1 do
     begin
      charr[j].visible:=false;
     end;
*)
 finally
 if filedatasource<>nil then Filedatasource.free;
 end;

end;

procedure TImportisgi_form.FormResize(Sender: TObject);
var j:integer;
begin
  if chArr<>nil then
  for j:=low(charr) to high(charr) do
   begin
    Charr[j].Height:=trunc(GB.Height/((high(Charr)-low(charr)+1)));
    Charr[j].left:=1;
    Charr[j].width:=Charr[j].parent.width-2;
    Charr[j].top:=j*Charr[j].height; 
   end;

end;

procedure TImportisgi_form.FormActivate(Sender: TObject);
begin
DM.GetStringsFromIBSQL(dm.q_general,Object_CB.Items,'select distinct O_Name from objects order by O_Name','O_Name');
if Object_CB.items.count>0 then Object_CB.itemindex:=0 else Object_CB.itemindex:=-1;;
DM.GetStringsFromIBSQL(dm.q_general,Reason_CB.Items,'select distinct E_Test_Reason from eksp order by E_Test_Reason','E_Test_Reason');
Reason_Cb.Text:='';
DM.GetStringsFromIBSQL(dm.q_general,Author_CB.Items,'select distinct E_Author from eksp order by E_Author','E_Author');
Author_Cb.Text:='';
DM.GetActiveDevices;
GetFileFiltr;
end;

procedure TImportisgi_form.N3Click(Sender: TObject);
var SetupForm:tSetup_Form;
begin
 SetupForm:=TSetup_form.create(self);
 SetupForm.showmodal;
 DM.GetActiveDevices;
 GetFileFiltr;
 if LB.itemindex<>-1 then lbclick(nil);
end;

procedure TImportisgi_form.AutoCBClick(Sender: TObject);
begin
if lb.items.count=0 then exit;
if lb.itemindex=-1 then exit;
if (autoCB.checked and (LB.itemindex>-1)) then 
 E_name.Text:=Extractfilename(LB1.Items[LB.itemindex])+' '+dateEksp.caption; 
 e_name.Enabled:=not autocb.Checked;
end;

procedure TImportisgi_form.FormDestroy(Sender: TObject);
var j:integer;
begin
// Data:=nil;
 DataDouble:=nil;
 data_int:=nil;
 if charr<>nil then
  for j:=low(Charr) to High(Charr)
     do begin
         charr[j].series[0].Free;
         charr[j].free;
        end;
 chArr:=nil;
end;

procedure TImportisgi_form.CheckBox1Click(Sender: TObject);
var i:integer;
begin
 for i:=0 to LB.items.count-1 do LB.Selected[i]:=checkbox1.Checked;
end;

procedure TImportisgi_form.Archiev_FormcleaerlbClick(Sender: TObject);
begin
lb.Items.clear;
lb1.items.clear;
GB3.visible:=false;
gb.Visible:=false;
e_name.text:='';
end;

procedure  TImportisgi_form.GetFilefiltr;
begin
 od.Filter:='';
 dm.devices.first;
 while not dm.devices.eof do
 begin
  if od.filter<>'' then od.filter:=od.filter+'|';
  od.Filter:=od.filter+dm.devices.fieldbyname('filefilter').asstring;
  dm.devices.next;
 end;
end;

Procedure TImportisgi_form.GetDataProperties (typeoffile:string;var FDS:TFilestream;filename:string);
//формирует единое описание сигналов по шапке сигналаЮ считанной из файла
var i:integer;
 s:string;
 F:file of byte;
 file_size:integer;
 start,finish:double;
begin
// stage_CB.text:='';
// stage_CB.enabled:=false;
// StageCount:=1;
 Etappanel.Visible:=false;
 Modepanel.Visible:=false;
 Mode.Caption:='';
 Oil.Caption:='';
 mode_I:=-1;
 oil_I:=0;
 if uppercase(typeoffile)='E24' then
  begin
   stage_CB.text:='';
   stage_CB.enabled:=false;
   StageCount:=1;
    Etappanel.Visible:=true;
   FDS.Free;
   AssignFile(f, FileName);    Reset(f);
   File_size:=Filesize(F);
   CloseFile(f);
   FDS:=TFileStream.Create(FileName,fmOpenRead);
   FDS.Read(E24,SizeOf(TE24shapka));
//   DataProperties.TipData:=LNG.TipData;
   DataProperties.date_eksp:= encodedatetime( E24.yyb+2000,e24.mmmb,e24.ddb,
                                              e24.hhb,e24.minb,e24.ssb,0)+e24.tkb/1024/60/60/24;
   start:= DataProperties.date_eksp;
   Finish:=encodedatetime( E24.yye+2000,e24.mmme,e24.dde,
                                              e24.hhe,e24.mine,e24.sse,0)+e24.tke/1024/60/60/24;
//   DataProperties.TD:=1/e24.frq;
   DataProperties.NChanal:=0;
   for i:=1 to 4 do
    if e24.g[i]<>0 then DataProperties.NChanal := DataProperties.NChanal +1;
   DataProperties.NPoints:=(File_size-SizeOf(E24)) div 4 div DataProperties.NChanal ;

   DataProperties.NChanalOriginal:=DataProperties.NChanal;
   DataProperties.TD:=(Finish-Start)*24*60*60/DataProperties.NPoints ;
   for i:=0 to 31 do DataProperties.quants[i].a1:=1;
   for i:=0 to 31 do DataProperties.quants[i].a0:=1;
   for i:=0 to 31 do DataProperties.quants[i].a2:=1;
   for i:=0 to 31 do DataProperties.quants[i].a3:=1;
   DataProperties.typeofsignal:='e24';
   DataProperties.e_functime:='t';
    mode_i:=0;
  end;
 if uppercase(typeoffile)='386' then
  begin
   stage_CB.text:='';
   stage_CB.enabled:=false;
   StageCount:=1;
    Etappanel.Visible:=true;
   FDS.Free;
   AssignFile(f, FileName);    Reset(f);
   File_size:=Filesize(F);
   CloseFile(f);
   FDS:=TFileStream.Create(FileName,fmOpenRead);
   FDS.Read(S386,SizeOf(TS386shapka));
//   DataProperties.TipData:=LNG.TipData;
   DataProperties.date_eksp:= encodedatetime( S386.yyb+2000,S386.mmmb,S386.ddb,
                                              S386.hhb,S386.minb,S386.ssb,0)+S386.tkb/1024/60/60/24;
   start:= DataProperties.date_eksp;
   Finish:=encodedatetime( S386.yye+2000,S386.mmme,S386.dde,
                                              S386.hhe,S386.mine,S386.sse,0)+S386.tke/1024/60/60/24;
//   DataProperties.TD:=1/S386.frq;
   DataProperties.NChanal:=10;
   {   for i:=1 to 45do
    if S386.g[i]<>0 then DataProperties.NChanal := DataProperties.NChanal +1;
 }  DataProperties.NPoints:=trunc((File_size-SizeOf(S386))/4/5) ;

   DataProperties.NChanalOriginal:=DataProperties.NChanal-5;
   case S386.frq of
    0:begin
       DataProperties.TD:=1/25;//(Finish-Start)*24*60*60/DataProperties.NPoints ;
       ext:='25';
      end;
    1:begin
       DataProperties.TD:=1/50;
       ext:='50';
      end;
    2:begin
       DataProperties.TD:=1/100;
       ext:='100';
      end;
    3:begin
       DataProperties.TD:=1/200;
       ext:='200';
      end;
    4:begin
       DataProperties.TD:=1/128;
       ext:='128';
      end;
   end;

   for i:=0 to 31 do DataProperties.quants[i].a1:=1;
   for i:=0 to 31 do DataProperties.quants[i].a0:=1;
   for i:=0 to 31 do DataProperties.quants[i].a2:=1;
   for i:=0 to 31 do DataProperties.quants[i].a3:=1;
   DataProperties.typeofsignal:='S386';
   DataProperties.e_functime:='t';
   mode_i:=0;
  end;

 if typeoffile='lng' then
  begin
   stage_CB.text:='';
   stage_CB.enabled:=false;
   StageCount:=1;
   Etappanel.Visible:=true;
   FDS.Read(LNG,SizeOf(TLongshapka));
   DataProperties.TipData:=LNG.TipData;
   DataProperties.date_eksp:= encodedatetime( LNG.abstime.Year,LNG.abstime.Month,LNG.abstime.Day,
                                              LNG.abstime.Hour,LNG.abstime.minute,LNG.abstime.second,LNG.abstime.Sec100);
   DataProperties.TD:=1/LNG.rclock;
   DataProperties.NPoints:=LNG.lPointAll;
   DataProperties.NChanal:=LNG.Nchanal;
   DataProperties.NChanalOriginal:=LNG.Nchanal;
   for i:=0 to 31 do DataProperties.quants[i].a1:=LNG.MaxRez/LNG.LADC;
   for i:=0 to 31 do DataProperties.quants[i].a0:=0;
   for i:=0 to 31 do DataProperties.quants[i].a2:=0;
   for i:=0 to 31 do DataProperties.quants[i].a3:=0;
   DataProperties.typeofsignal:='lng';
   DataProperties.e_functime:='t';
  end;
 if typeoffile='ufa' then
  begin
   stage_CB.text:='';
   stage_CB.enabled:=false;
   StageCount:=1;
    Etappanel.Visible:=true;
   FDS.Read(UFA,SizeOf(TUFAshapka));
   DataProperties.TipData:=UFA.TipData;
   DataProperties.date_eksp:= encodedatetime( UFA.abstime.Year,UFA.abstime.Month,UFA.abstime.Day,
                                              UFA.abstime.Hour,UFA.abstime.minute,UFA.abstime.second,UFA.abstime.Sec100);
   DataProperties.TD:=1/UFA.rclock;
   DataProperties.NPoints:=UFA.lPointAll;
   DataProperties.NChanal:=UFA.Nchanal+2;
   DataProperties.NChanalOriginal:=UFA.Nchanal;
   for i:=0 to 31 do DataProperties.quants[i].a1:=UFA.MaxRez/UFA.LADC;
   for i:=0 to 31 do DataProperties.quants[i].a0:=0;
   for i:=0 to 31 do DataProperties.quants[i].a2:=0;
   for i:=0 to 31 do DataProperties.quants[i].a3:=0;
   DataProperties.typeofsignal:='ufa';
   DataProperties.e_functime:='t';
  end; 
 if typeoffile='1ln' then 
  begin
   stage_CB.text:='';
   stage_CB.enabled:=false;
   StageCount:=1;
    Etappanel.Visible:=true;
   FDS.Read(LNG_1,SizeOf(TLongshapka));
   DataProperties.TipData:=LNG_1.TipData;
   DataProperties.date_eksp:= encodedatetime( lng_1.abstime.Year,lng_1.abstime.Month,lng_1.abstime.Day,
                                              lng_1.abstime.Hour,lng_1.abstime.minute,lng_1.abstime.second,lng_1.abstime.Sec100);
   DataProperties.TD:=1/LNG_1.rclock;
   DataProperties.NPoints:=LNG_1.lPointAll;
   DataProperties.NChanal:=LNG_1.Nchanal;
   DataProperties.NChanalOriginal:=LNG_1.Nchanal;
   for i:=0 to 31 do DataProperties.quants[i].a1:=lng_1.MaxRez/lng_1.LADC;
   for i:=0 to 31 do DataProperties.quants[i].a0:=0;
   for i:=0 to 31 do DataProperties.quants[i].a2:=0;
   for i:=0 to 31 do DataProperties.quants[i].a3:=0;
   DataProperties.typeofsignal:='1ln';
   DataProperties.e_functime:='t';
  end; 
 if typeoffile='4ln' then
  begin
   stage_CB.text:='';
   stage_CB.enabled:=false;
   StageCount:=1;
   FDS.Read(LNG_4,SizeOf(TLongshapka));
   DataProperties.TipData:=LNG_4.TipData;
   DataProperties.date_eksp:= encodedatetime( lng_4.abstime.Year,lng_4.abstime.Month,lng_4.abstime.Day,
                                              lng_4.abstime.Hour,lng_4.abstime.minute,lng_4.abstime.second,lng_4.abstime.Sec100);
   DataProperties.TD:=1/LNG_4.rclock;
   DataProperties.NPoints:=LNG_4.lPointAll;
   DataProperties.NChanal:=LNG_4.Nchanal+2;
   DataProperties.NChanalOriginal:=LNG_4.Nchanal;
   for i:=0 to 31 do DataProperties.quants[i].a1:=LNG_4.MaxRez/LNG_4.LADC;
   for i:=0 to 31 do DataProperties.quants[i].a0:=0;
   for i:=0 to 31 do DataProperties.quants[i].a2:=0;
   for i:=0 to 31 do DataProperties.quants[i].a3:=0;
   DataProperties.typeofsignal:='4ln';
   DataProperties.e_functime:='t';
  end;
 if typeoffile='lcr' then
  begin
   stage_CB.text:='';
   stage_CB.enabled:=false;
   StageCount:=1;
   Etappanel.Visible:=true;
   FDS.Read(LCR,SizeOf(TLCRShapka));
   DataProperties.TipData:=LCR.TipData;
   DataProperties.date_eksp:= encodedatetime( lcr.Year,lcr.Month,lcr.Day,
                                              lcr.Hour,lcr.min,lcr.sec,lcr.dSec);
   DataProperties.TD:=LCR.Td/ScaleTD_LCR;
   DataProperties.NPoints:=lcr.Npoints;
   DataProperties.NChanal:=lcr.Nchanal;
   DataProperties.NChanalOriginal:=lcr.Nchanal;
   for i:=0 to 31 do DataProperties.ChanOn[i]:=lcr.chanOn[i];
   for i:=0 to 31 do DataProperties.quants[i].a1:=lcr.quants[i];
   for i:=0 to 31 do DataProperties.quants[i].a0:=0;
   for i:=0 to 31 do DataProperties.quants[i].a2:=0;
   for i:=0 to 31 do DataProperties.quants[i].a3:=0;
   DataProperties.typeofsignal:='lcr';
   DataProperties.e_functime:='t';
  end;
 if typeoffile='krd' then 
  begin
   stage_CB.text:='';
   stage_CB.enabled:=false;
   StageCount:=1;
   Etappanel.Visible:=true;
   FDS.Read(krd,SizeOf(TkrdShapka));
   if krd.etap1<10 then s:=' '+inttostr(krd.etap1) else s:=inttostr(krd.etap1);
   s:=s+'->';
   if krd.etap2<10 then s:=s+' ';
   s:=S+inttostr(krd.etap2);
   StageCount:=abs(krd.etap1-krd.etap2);
   stage_CB.text:=s;
   etapstart:=krd.etap1;
   etapFinish:=krd.etap2;
   DataProperties.TipData:=krd.TipData;
   DataProperties.date_eksp:= encodedatetime( krd.Year,krd.Month,krd.Day,
                                              krd.Hour,krd.min,krd.sec,krd.dSec);
   DataProperties.TD:=krd.Td/ScaleTD_LCR;
   DataProperties.NPoints:=krd.Npoints;
   //krd - сигналы должны порождать два дополнительных канала
   DataProperties.NChanal:=krd.Nchanal+2;
   DataProperties.NChanalOriginal:=krd.Nchanal;
   for i:=0 to 31 do DataProperties.ChanOn[i]:=krd.chanOn[i];
   for i:=0 to 31 do DataProperties.quants[i].a1:=krd.quants[i];
   DataProperties.quants[krd.Nchanal].a1:=DataProperties.quants[krd.Nchanal-1].a1;
   DataProperties.quants[krd.Nchanal+1].a1:=1;
   for i:=0 to 31 do DataProperties.quants[i].a0:=0;
   for i:=0 to 31 do DataProperties.quants[i].a2:=0;
   for i:=0 to 31 do DataProperties.quants[i].a3:=0;
   DataProperties.typeofsignal:='krd';
   DataProperties.e_functime:='t';   
   mode_i:=0;
  end;
 if typeoffile='osl' then 
  begin
   stage_CB.text:='';
   stage_CB.enabled:=false;
   StageCount:=1;
   Etappanel.Visible:=true;
   FDS.Read(osl,SizeOf(ToslShapka));
   autocb.Checked:=false;
   if osl.etap1<10 then s:=' '+inttostr(osl.etap1) else s:=inttostr(osl.etap1);
   s:=s+'->';
   if osl.etap2<10 then s:=s+' ';
   s:=S+inttostr(osl.etap2);
   stage_CB.text:=s;
   DataProperties.TipData:=OSL.TipData;
   DataProperties.date_eksp:= encodedatetime( osl.Year,osl.Month,osl.day,
                                              osl.Hour,osl.min,osl.sec,osl.dSec);
   DataProperties.TD:=osl.Td/ScaleTD_LCR;;
   DataProperties.NPoints:=osl.Npoints;
   DataProperties.NChanal:=osl.Nchanal;
   DataProperties.NChanalOriginal:=osl.Nchanal;
   for i:=0 to 31 do DataProperties.ChanOn[i]:=osl.chanOn[i];
   for i:=0 to 31 do DataProperties.quants[i].a1:=osl.quants[i];
   for i:=0 to 31 do DataProperties.quants[i].a0:=0;
   for i:=0 to 31 do DataProperties.quants[i].a2:=0;
   for i:=0 to 31 do DataProperties.quants[i].a3:=0;
   DataProperties.typeofsignal:='osl';
   DataProperties.e_functime:='t';
    mode_i:=0;
  end;
 if typeoffile='ovv' then 
  begin
   FDS.Read(ovv,SizeOf(TovvShapka));
   Modepanel.Visible:=true;
//  stage_CB.Items.assign(Etapstrings_prm);
//   stage_CB.enabled:=true;
   DataProperties.TipData:=ovv.TipData;
   DataProperties.date_eksp:= encodedatetime( ovv.Year,ovv.Month,ovv.Day,
                                              ovv.Hour,ovv.min,ovv.sec,ovv.dSec);
   DataProperties.TD:=ovv.Td/ScaleTD_LCR;;
   DataProperties.NPoints:=ovv.Npoints;
   DataProperties.NChanal:=ovv.Nchanal;
   DataProperties.NChanalOriginal:=ovv.Nchanal;
   for i:=0 to 31 do DataProperties.ChanOn[i]:=ovv.chanOn[i];
   for i:=0 to 31 do DataProperties.quants[i].a1:=ovv.quants[i];
   for i:=0 to 31 do DataProperties.quants[i].a0:=0;
   for i:=0 to 31 do DataProperties.quants[i].a2:=0;
   for i:=0 to 31 do DataProperties.quants[i].a3:=0;
   DataProperties.typeofsignal:='ovv';
   DataProperties.e_functime:='t';
   Oil.caption:='Без масла';
   if ovv.Oil=0 then Oil.Caption:='С маслом';
   Mode.Caption:=Modearray[ovv.tmode];
   case ovv.tmode of
    0: Mode.caption:=Mode.Caption+'('+inttostr(ovv.ttime[0]*2)+')';
    1: Mode.caption:=Mode.Caption+'('+inttostr(ovv.ttime[0]*2)+')';
    2: Mode.caption:=Mode.Caption+'('+inttostr(ovv.ttime[0]*2)+'-'+
                                      inttostr(ovv.ttime[1]*2)+'-'+
                                      inttostr(ovv.ttime[2]*2)+')';
    3: Mode.caption:=Mode.Caption+'('+inttostr(ovv.ttime[0]*2)+'-'+
                                      inttostr(ovv.ttime[1]*2)+'-'+
                                      inttostr(ovv.ttime[2]*2)+')';
    4: Mode.caption:=Mode.Caption+'('+inttostr(ovv.ttime[0]*2)+'-'+
                                      inttostr(ovv.ttime[1]*2)+'-'+
                                      inttostr(ovv.ttime[2]*2)+'-'+
                                      inttostr(ovv.ttime[3]*2)+'-'+
                                      inttostr(ovv.ttime[4]*2)+')';
   end;
   stage_CB.text:=Mode.Caption+' '+Oil.Caption;
   Mode_I:=ovv.tmode;
   Oil_I:=ovv.oil;
  end; 
 if typeoffile='avv' then 
  begin
   FDS.Read(avv,SizeOf(TavvShapka));
   Modepanel.Visible:=true;
//  stage_CB.Items.assign(Etapstrings_prm);
//   stage_CB.enabled:=true;
   DataProperties.TipData:=avv.TipData;
   DataProperties.date_eksp:= encodedatetime( avv.Year,avv.Month,avv.Day,
                                              avv.Hour,avv.min,avv.sec,avv.dSec);
   DataProperties.TD:=avv.Td/ScaleTD_LCR;;
   DataProperties.NPoints:=avv.Npoints;
   DataProperties.NChanal:=avv.Nchanal;
   DataProperties.NChanalOriginal:=avv.Nchanal;
   for i:=0 to 31 do DataProperties.ChanOn[i]:=avv.chanOn[i];
   for i:=0 to 31 do DataProperties.quants[i].a1:=avv.quants[i];
   for i:=0 to 31 do DataProperties.quants[i].a0:=0;
   for i:=0 to 31 do DataProperties.quants[i].a2:=0;
   for i:=0 to 31 do DataProperties.quants[i].a3:=0;
   DataProperties.typeofsignal:='avv';
   DataProperties.e_functime:='t';
//   Oil.caption:='Без масла';
//   if avv.Oil=1 then Oil.Caption:='С маслом';
   Mode.Caption:=Modearray[avv.tmode];
   case avv.tmode of
    0: Mode.caption:=Mode.Caption+'('+inttostr(avv.ttime[0]*2)+')';
    1: Mode.caption:=Mode.Caption+'('+inttostr(avv.ttime[0]*2)+')';
    2: Mode.caption:=Mode.Caption+'('+inttostr(avv.ttime[0]*2)+'-'+
                                      inttostr(avv.ttime[1]*2)+'-'+
                                      inttostr(avv.ttime[2]*2)+')';
    3: Mode.caption:=Mode.Caption+'('+inttostr(avv.ttime[0]*2)+'-'+
                                      inttostr(avv.ttime[1]*2)+'-'+
                                      inttostr(avv.ttime[2]*2)+')';
    4: Mode.caption:=Mode.Caption+'('+inttostr(avv.ttime[0]*2)+'-'+
                                      inttostr(avv.ttime[1]*2)+'-'+
                                      inttostr(avv.ttime[2]*2)+'-'+
                                      inttostr(avv.ttime[3]*2)+'-'+
                                      inttostr(avv.ttime[4]*2)+')';
   end;
   stage_CB.text:=Mode.Caption;//+' '+Oil.Caption;
   Mode_I:=avv.tmode;
//   Oil_I:=avv.oil;
  end; 
 if typeoffile='evv' then 
  begin
   FDS.Read(evv,SizeOf(TevvShapka));
   Modepanel.Visible:=true;
//  stage_CB.Items.assign(Etapstrings_prm);
//   stage_CB.enabled:=true;
   DataProperties.TipData:=evv.TipData;
   DataProperties.date_eksp:= encodedatetime( evv.Year,evv.Month,evv.Day,
                                              evv.Hour,evv.min,evv.sec,evv.dSec);
   DataProperties.TD:=evv.Td/ScaleTD_LCR;;
   DataProperties.NPoints:=evv.Npoints;
   DataProperties.NChanal:=evv.Nchanal;
   DataProperties.NChanalOriginal:=evv.Nchanal;
   for i:=0 to 31 do DataProperties.ChanOn[i]:=evv.chanOn[i];
   for i:=0 to 31 do DataProperties.quants[i].a1:=evv.quants[i];
   for i:=0 to 31 do DataProperties.quants[i].a0:=0;
   for i:=0 to 31 do DataProperties.quants[i].a2:=0;
   for i:=0 to 31 do DataProperties.quants[i].a3:=0;
   DataProperties.typeofsignal:='evv';
   DataProperties.e_functime:='t';
//   Oil.caption:='Без масла';
//   if evv.Oil=1 then Oil.Caption:='С маслом';
   Mode.Caption:=Modearray[evv.tmode];
   case evv.tmode of
    0: Mode.caption:=Mode.Caption+'('+inttostr(evv.ttime[0]*2)+')';
    1: Mode.caption:=Mode.Caption+'('+inttostr(evv.ttime[0]*2)+')';
    2: Mode.caption:=Mode.Caption+'('+inttostr(evv.ttime[0]*2)+'-'+
                                      inttostr(evv.ttime[1]*2)+'-'+
                                      inttostr(evv.ttime[2]*2)+')';
    3: Mode.caption:=Mode.Caption+'('+inttostr(evv.ttime[0]*2)+'-'+
                                      inttostr(evv.ttime[1]*2)+'-'+
                                      inttostr(evv.ttime[2]*2)+')';
    4: Mode.caption:=Mode.Caption+'('+inttostr(evv.ttime[0]*2)+'-'+
                                      inttostr(evv.ttime[1]*2)+'-'+
                                      inttostr(evv.ttime[2]*2)+'-'+
                                      inttostr(evv.ttime[3]*2)+'-'+
                                      inttostr(evv.ttime[4]*2)+')';
   end;
   stage_CB.text:=Mode.Caption;//+' '+Oil.Caption;
   Mode_I:=evv.tmode;
  end;
end;



Procedure TImportisgi_form.GetDoubleData (typeoffile:string;var FDS:TFilestream;Filename:string);
//формирует массив отсчетов АЦП, считывая их из  файла
//формирует массив сигнала в виде значений физической величины, учитывая значения кванта из описания сигналда в файле
var k,i,j:integer;
  Data:array of array of  smallint;
  DataE24:array of array of  integer;
  DataS386:array of array of  integer;
  DataInt:array of  integer;
  DataSingle:array of  single;
  FD:TFilestream;
  s,s1:string;
begin
 labelinfo.Caption:='Чтение параметров сигнала';labelinfo.Update;
 if ((typeoffile='lcr') or (typeoffile='osl') or (typeoffile='krd')) then
   begin
   Data:=nil;  setlength(Data,DataProperties.npoints,DataProperties.Nchanaloriginal);
   for i:=0 to (DataProperties.Npoints-1) do
    for j:=0 to DataProperties.nchanaloriginal-1 do
     begin
      FDS.Read(data[i,j],2) ;
      DataDouble[j,i]:=Data[i,j]*DataProperties.quants[j].a1 ;
     end;
     data:=nil;
    end;
 if ((typeoffile='avv') or (typeoffile='evv') or (typeoffile='ovv') ) then
   begin
   Data:=nil;  setlength(Data,DataProperties.npoints,DataProperties.Nchanaloriginal);
   for i:=0 to (DataProperties.Npoints-1) do
    for j:=0 to DataProperties.nchanaloriginal-1 do
     begin
      FDS.Read(data[i,j],2) ;
      DataDouble[j,i]:=Data[i,j]*DataProperties.quants[j].a1;
     end;
     data:=nil;
    end;
 if ((typeoffile='1ln')) then
   begin
   DataInt:=nil;  setlength(DataInt,DataProperties.npoints);
   s:=filename;
   s:=copy(s,1,length(s)-3);
//   s:=s+'ln1';
   filename:=s+'ln1';
   FD:=TFileStream.Create(Filename,fmOpenRead);
   FD.seek(SizeOf(TLongShapka)+SizeOf(TPrimech),soFromBeginning	);
   FD.Read(dataInt[0],4*DataProperties.Npoints) ;
   for i:=0 to (DataProperties.Npoints-1) do
     begin
//      FD.Read(dataInt[i],4) ;
      DataDouble[0,i]:=DataInt[i]*DataProperties.quants[0].a1 ;
     end;
     dataInt:=nil;
   FD.free;
  end;
 if ((typeoffile='4ln')) then
   begin
   DataInt:=nil;  setlength(DataInt,DataProperties.npoints);
   s:=filename;
   s:=copy(s,1,length(s)-3);
   for j:=0 to DataProperties.NchanalOriginal-1 do
   begin
     filename:=s+'ln'+inttostr(j+1);
     FD:=TFileStream.Create(Filename,fmOpenRead);
     FD.seek(SizeOf(TLongShapka)+SizeOf(TPrimech),soFromBeginning	);
     FD.Read(dataInt[0],4*DataProperties.Npoints) ;
     for i:=0 to (DataProperties.Npoints-1) do
       begin
        DataDouble[j,i]:=DataInt[i]*DataProperties.quants[j].a1 ;
       end;
     FD.free;
   end;
   dataInt:=nil;
  end;
 if ((uppercase(typeoffile)='E24')) then
   begin
   DataE24:=nil;  setlength(DataE24,DataProperties.npoints,DataProperties.Nchanaloriginal);
   for i:=0 to (DataProperties.Npoints-1) do
    for j:=0 to DataProperties.nchanaloriginal-1 do
     begin
      FDS.Read(dataE24[i,j],4) ;
      DataDouble[j,i]:=DataE24[i,j]*1/429497 ;
     end;
     dataE24:=nil;
  end;
 if ((uppercase(typeoffile)='386')) then
   begin
   DataS386:=nil;  setlength(DataS386,DataProperties.npoints,DataProperties.Nchanaloriginal);
   labelinfo.caption:='чтение входного сигнала в память';labelinfo.update;
   k:=0;
   for i:=0 to (DataProperties.Npoints-1) do
    for j:=0 to DataProperties.nchanaloriginal-1 do
     begin
      if i=1 then
       begin
//        labelinfo.caption:='чтение входного сигнала в память ('+inttostr(k)+')';labelinfo.update;
        k:=k+1;
       end;
      FDS.Read(dataS386[i,j],4) ;
      DataDouble[j,i]:=DataS386[i,j]*1/429497 ;
     end;
     dataS386:=nil;
  end;
 labelinfo.caption:='чтение входного сигнала в память выполнено';labelinfo.update;

 if ((typeoffile='lng')) then
   begin
   DataSingle:=nil;  setlength(DataSingle,DataProperties.npoints);
   for j:=0 to DataProperties.NchanalOriginal-1 do
   begin
//     filename:=s+'ln'+inttostr(j+1);
     FDS.seek(SizeOf(TLongShapka)+SizeOf(TPrimech)+j*sizeof(single)*DataProperties.npoints,soFromBeginning	);
     FDS.Read(DataSingle[0],sizeof(single)*DataProperties.Npoints) ;
     for i:=0 to (DataProperties.Npoints-1) do
       begin
        DataDouble[j,i]:=DataSingle[i]*DataProperties.quants[j].a1 ;
       end;
   end;
 end;
 if ((typeoffile='ufa')) then
   begin
    DataInt:=nil;  setlength(DataInt,DataProperties.npoints);
    for j:=0 to DataProperties.NchanalOriginal-1 do
    begin
//     filename:=s+'ln'+inttostr(j+1);
     FDS.seek(SizeOf(TUFAShapka)+SizeOf(TPrimech)+j*sizeof(integer)*DataProperties.npoints,soFromBeginning	);
     FDS.Read(DataInt[0],sizeof(integer)*DataProperties.Npoints) ;
     for i:=0 to (DataProperties.Npoints-1) do
       begin
        DataDouble[j,i]:=DataInt[i]*DataProperties.quants[j].a1 ;
       end;
    end;
   DataInt:=nil;
  end; 
 labelinfo.Caption:='';labelinfo.Update;
end;


Procedure TImportisgi_form.GetProcessing (Processing:string);
// для случая обработки (1), порождающей дополнительные каналы, выполняет эту обработку, формируя эти  сигналы
var i,j:integer;
mx,meanvalue,Ku,min1,max1:double;
podst,nob,Delt,Xpr,Rez,DI:double;R0,R1,R2,R3,R4:double;
NstageCount,holhod:integer;
noborot:integer;
max:real;   jmax,N802080:integer;
BitArray: array[1..32] of byte;
jcurrent,jbit,k,m:integer;
minuta, chas, dayweek, week, gpsUTC:integer;
t0,dateeksp:Tdatetime;
s:string;
begin
 labelinfo.Caption:='Обработка данных';labelinfo.Update;
 if trim(Processing)='1' then
  begin
   min1:= MinValue(DataDouble[DataProperties.NChanal-3]);
   max1:= MaxValue(DataDouble[DataProperties.NChanal-3]);
   if max1<>min1 then
   for j:=0 to DataProperties.NPoints-1 do
       DataDouble[DataProperties.NChanal-2,j]:=360/(max1-min1)*DataDouble[DataProperties.NChanal-3,j]
       
     else
     for j:=0 to DataProperties.NPoints-1 do
        DataDouble[DataProperties.NChanal-2,j]:=DataDouble[DataProperties.NChanal-3,j];

     DI:=12*DataProperties.Td;
     i:=0;
     R0:=DataDouble[DataProperties.NChanal-2,i];
     R1:=DataDouble[DataProperties.NChanal-2,i+1];
     R2:=DataDouble[DataProperties.NChanal-2,i+2];
     R3:=DataDouble[DataProperties.NChanal-2,i+3];
     Rez:=(-3*R0+4*R1-R2)*6/DI;
     DataDouble[DataProperties.NChanal-1,0]:=Rez;
     Rez:=(-3*R1+4*R2-R3)*6/DI;
     DataDouble[DataProperties.NChanal-1,1]:=rez;
     for i:=0+2 to DataProperties.NPoints-1-2 do
       begin
         R0:=DataDouble[DataProperties.NChanal-2,i-2];
         R1:=DataDouble[DataProperties.NChanal-2,i-1];
         R3:=DataDouble[DataProperties.NChanal-2,i+1];
         R4:=DataDouble[DataProperties.NChanal-2,i+2];
         Rez:=(R0-8*R1+8*R3-R4)/DI;
         DataDouble[DataProperties.NChanal-1,i]:=rez;
       end; {i}
      R0:=DataDouble[DataProperties.NChanal-2,DataProperties.NPoints-1-3];
      R1:=DataDouble[DataProperties.NChanal-2,DataProperties.NPoints-1-2];
      R2:=DataDouble[DataProperties.NChanal-2,DataProperties.NPoints-1-1];
      R3:=DataDouble[DataProperties.NChanal-2,DataProperties.NPoints-1-0];
      Rez:=(R0-4*R1+3*R2)*6/DI;
      DataDouble[DataProperties.NChanal-1,DataProperties.NPoints-1-1]:=rez;
      Rez:=(R1-4*R2+3*R3)*6/DI;
      DataDouble[DataProperties.NChanal-1,DataProperties.NPoints-1]:=rez;

   for j:=0 to DataProperties.NPoints-1 do
    begin
      DataDouble[DataProperties.NChanal-2,j]:=DataDouble[DataProperties.NChanal-1,j];
    end;

   meanValue:=mean(Datadouble[DataProperties.NChanal-2]);

//   if meanvalue<0 then

   for i:=0 to ((DataProperties.NPoints-1) div 40) do DataDouble[DataProperties.NChanal-2,i]:=meanValue;

   max1:=maxvalue(Datadouble[DataProperties.NChanal-2]);
   min1:=minvalue(Datadouble[DataProperties.NChanal-2]);
   if (max1-meanvalue)>(meanvalue-min1) then
    for j:=0 to DataProperties.NPoints-1 do
     begin
       DataDouble[DataProperties.NChanal-2,j]:=-DataDouble[DataProperties.NChanal-3,j];
     end
      else  for j:=0 to DataProperties.NPoints-1 do
     begin
       DataDouble[DataProperties.NChanal-2,j]:=DataDouble[DataProperties.NChanal-3,j];
     end   ;

  min1:= MinValue(DataDouble[DataProperties.NChanal-2]);
  max1:= MaxValue(DataDouble[DataProperties.NChanal-2]);

  if max1=min1 then max1:=min1+1;
   for j:=0 to DataProperties.NPoints-1 do
    begin
      DataDouble[DataProperties.NChanal-1,j]:=360/(max1-min1)*DataDouble[DataProperties.NChanal-2,j];
   end;

  meanValue:=mean(Datadouble[DataProperties.NChanal-1]);
  if meanValue<0 then
   begin

    min1:= abs(MinValue(DataDouble[DataProperties.NChanal-1])-MaxValue(DataDouble[DataProperties.NChanal-1]));
    for j:=0 to DataProperties.NPoints-1 do
    begin
      DataDouble[DataProperties.NChanal-1,j]:=DataDouble[DataProperties.NChanal-1,j]+min1;
      if DataDouble[DataProperties.NChanal-1,j]> 360 then DataDouble[DataProperties.NChanal-1,j]:=360;
      if DataDouble[DataProperties.NChanal-1,j]< 0 then DataDouble[DataProperties.NChanal-1,j]:=0;
    end;
  end;
    
  j:=0;
  repeat
     if  DataDouble[DataProperties.NChanal-1,j] = 0 then break
      else  DataDouble[DataProperties.NChanal-1,j] := 0;
     j:=j+1;
    until j> DataProperties.NPoints-1;

  for j:=0 to DataProperties.NPoints-1 do
    begin
      DataDouble[DataProperties.NChanal-2,j]:=DataDouble[DataProperties.NChanal-1,j];
    end;

   podst:=  DataDouble[DataProperties.NChanal-2,3];
   Nob:=0;  delt:=0;
   for j:=0 to DataProperties.NPoints-2 do
    begin
      if ((nob=0) and ((DataDouble[DataProperties.NChanal-2,j]-podst) > 5)) then Nob:=1;
      delt:=DataDouble[DataProperties.NChanal-2,j+1]  - DataDouble[DataProperties.NChanal-2,j];
      if delt<-30 then NOb:=Nob+1;
      IF DELT<-20  THEN DataDouble[DataProperties.NChanal-2,j]:=0;
      DataDouble[DataProperties.NChanal-1,j]:=NOb;
    end;
   DataDouble[DataProperties.NChanal-1,DataProperties.NPoints-1]:=NOb;
   Noborot:=trunc(Nob);
   stageCount:=(Noborot div OborotMax)+1;
   if ((Nob>0) and ((Noborot mod OborotMax)=0)) then StageCount:=StageCount-1;
   Nob:=0;  holhod:=0;
   for j:=0 to DataProperties.NPoints-2 do
    begin
      Noborot:= trunc(DataDouble[DataProperties.NChanal-1,j])-Emptyoborot;
//      DataDouble[DataProperties.NChanal-3,j]:=Noborot;
      if Noborot<=0 then 
       begin
        Noborot:=1;
        DataDouble[DataProperties.NChanal-2,j]:=0;
        DataDouble[DataProperties.NChanal-1,j]:=1;
       end 
       else
        begin
         {if Noborot > oborotmax then } DataDouble[DataProperties.NChanal-1,j]:=(Noborot mod oborotmax){+1};
//           else DataDouble[DataProperties.NChanal-1,j]:=Noborot;
         if DataDouble[DataProperties.NChanal-1,j]=0 then
         DataDouble[DataProperties.NChanal-1,j]:=oborotmax;
         if NOborot=0 then DataDouble[DataProperties.NChanal-1,j]:=1;
        end;
      Nob:=DataDouble[DataProperties.NChanal-1,j];   
    end; 
   NStageCount:=0;
   Stage_Array[NstageCount].PointStart:=0;
   Stage_Array[NstageCount].PointFinish:=DataProperties.NPoints-1;
   Stage_Array[NstageCount].etapstart:=etapstart;
   if etapstart>EtapFinish then  Stage_Array[NstageCount].etapFinish:=etapstart-1
    else  Stage_Array[NstageCount].etapFinish:=etapstart+1 ;;
   for j:=1 to DataProperties.NPoints-2 do
    begin
      if DataDouble[DataProperties.NChanal-1,j]-DataDouble[DataProperties.NChanal-1,j-1] <0 then
       begin
        NStagecount:=NStageCount+1;
        Stage_Array[NstageCount-1].PointFinish:=j;
        Stage_Array[NstageCount].PointStart:=j;
        Stage_Array[NstageCount].PointFinish:=DataProperties.NPoints-1;
        Stage_Array[NStageCount].etapstart:=Stage_Array[nstageCount-1].EtapFinish;
        if etapstart>EtapFinish then  Stage_Array[NstageCount].etapFinish:=Stage_Array[nstageCount].EtapStart-1
          else  Stage_Array[nstageCount].EtapFinish:=Stage_Array[nstageCount].EtapStart+1;
       end; 
    end;

   DataDouble[DataProperties.NChanal-1,DataProperties.NPoints-1]:=NOb;

{
  if max1=min1 then max1:=min1+1;
   for j:=0 to DataProperties.NPoints-1 do
    begin
      DataDouble[DataProperties.NChanal-1,j]:=360/(max1-min1)*DataDouble[DataProperties.NChanal-1,j];
      if DataDouble[DataProperties.NChanal-1,j]> 360 then DataDouble[DataProperties.NChanal-1,j]:=360;
      if DataDouble[DataProperties.NChanal-1,j]< 0 then DataDouble[DataProperties.NChanal-1,j]:=0;
   end;
 }
{     R1:=DataDouble[DataProperties.NChanal-2,0];
     Rez:=R1*DataProperties.Td;
     DataDouble[DataProperties.NChanal-1,0]:=Rez;
     Xpr:=0;//R1;
     DI:=Rez;
     for i:=1 to DataProperties.NPoints-1 do
       begin
        XPr:=R1;
        R1:=DataDouble[DataProperties.NChanal-2,i];
        Rez:=DI+((R1+XPr)/2)*DataProperties.Td;
        DI:=Rez;
        DataDouble[DataProperties.NChanal-1,i]:=rez;
       end;
  min1:= MinValue(DataDouble[DataProperties.NChanal-1]);
  max1:= MaxValue(DataDouble[DataProperties.NChanal-1]);

   for j:=0 to DataProperties.NPoints-1 do
    begin
      DataDouble[DataProperties.NChanal-1,j]:=360/(max1-min1)*DataDouble[DataProperties.NChanal-1,j];
   end;
}
    end;

 if trim(Processing)='386' then  // обработка для сигналов Тимошука - расшифровка канала аналогового измерения времени
  begin
   min1:= MinValue(DataDouble[0]);
   max1:= MaxValue(DataDouble[0]);
   mx:=Mean(datadouble[0]);
   labelinfo.Caption:='коррекция выбросов на канале времени';labelinfo.Update;

   if max1<>min1 then
   for j:=1 to DataProperties.NPoints-1 do
       if ((DataDouble[0,j]-mx)>(mx-min1)*10) then
        begin
         DataDouble[0,j]:=DataDouble[0,j-1];
        end;

   min1:= MinValue(DataDouble[0]);
   max1:= MaxValue(DataDouble[0]);

   labelinfo.Caption:='поиск метки времени';labelinfo.Update;

   if max1<>min1 then
   for j:=0 to DataProperties.NPoints-1 do
       DataDouble[6,j]:=round(1/(max1-min1)*DataDouble[0,j])
     else     for j:=0 to DataProperties.NPoints-1 do  DataDouble[6,j]:=DataDouble[0,j];

   for j:=0 to DataProperties.NPoints-2 do
    begin
     if  ((DataDouble[6,j]=1) and (DataDouble[6,j+1]=1)) then
           DataDouble[7,j+1]:=DataDouble[7,j]+1
            else  DataDouble[7,j+1]:=0;
     if  ((DataDouble[6,j]=0) and (DataDouble[6,j+1]=0)) then
           DataDouble[8,j+1]:=DataDouble[8,j]+1
            else  DataDouble[8,j+1]:=0;
     end;

   for j:=100 to DataProperties.NPoints-2 do
    begin
     if  ((DataDouble[7,j]>=0.75/dataProperties.Td) and
         (DataDouble[7,j-100]>=0.75/dataProperties.Td)) then
           begin
            DataDouble[9,j+1]:=1;
            N802080:=j;
            break;
           end
            else
                 DataDouble[9,j+1]:=0;
     end;
   max:=0;
   jmax:=N802080;
   for j:=N802080-100 to N802080 do
    begin
     if  (DataDouble[8,j]>max) then
           begin
            max:=DataDouble[8,j];
            jMax:=j;
           end
     end;

   DataDouble[5,jmax]:=10;

   jbit:=jmax+round(1.30/Dataproperties.td);
   for k:=0 to 7 do
    begin
     bitarray[k+1]:=round(datadouble[6,jbit+round(1/Dataproperties.td)*k]);
     DataDouble[5,jbit+round(1/Dataproperties.td)*k]:=5;
    end;
   jbit:=jmax+round(1.3/Dataproperties.td)+round(7/Dataproperties.td);

   jBit:=Jbit+round(3/Dataproperties.td);
   for k:=0 to 7 do
    begin
     bitarray[8+k+1]:=round(datadouble[6,jbit+round(1/Dataproperties.td)*k]);
     DataDouble[5,jbit+round(1/Dataproperties.td)*k]:=5;
    end;
//   jbit:=jmax+130+700+1000;
   jbit:=jmax+round(1.3/Dataproperties.td)+round(17/Dataproperties.td);

   jBit:=Jbit+round(3/Dataproperties.td);
   for k:=0 to 7 do
    begin
     bitarray[16+k+1]:=round(datadouble[6,jbit+round(1/Dataproperties.td)*k]);
     DataDouble[5,jbit+round(1/Dataproperties.td)*k]:=5;
    end;
//   jbit:=jmax+130+700+1000+1000;
   jbit:=jmax+round(1.3/Dataproperties.td)+round(27/Dataproperties.td);

   jBit:=Jbit+300;
   for k:=0 to 7 do
    begin
     bitarray[24+k+1]:=round(datadouble[6,jbit+round(1/Dataproperties.td)*k]);
     DataDouble[5,jbit+round(1/Dataproperties.td)*k]:=5;
    end;

    Minuta:=bitarray[1]+2*bitarray[2]+4*bitarray[3]+8*bitarray[4]+16*bitarray[5]+32*bitarray[6];
    Chas:=bitarray[6+1]+2*bitarray[6+2]+4*bitarray[6+3]+8*bitarray[6+4]+16*bitarray[6+5];
    dayweek:=bitarray[6+5+1]+2*bitarray[6+5+2]+4*bitarray[6+5+3];
    week:=bitarray[15]+2*bitarray[16]+4*bitarray[17]+8*bitarray[18]+16*bitarray[19]+32*bitarray[20]+
          64*bitarray[21]+128*bitarray[22]+256*bitarray[23]+512*bitarray[24]+1024*bitarray[25]+
          2048*bitarray[26];
    GPSUTC:=bitarray[27]+2*bitarray[28]+4*bitarray[29]+8*bitarray[30]+16*bitarray[31]+32*bitarray[32];

    DateEksp:=encodedate(2000,1,2)+7*week+dayweek+chas/24+minuta/24/60;
    labelinfo.caption:=formatdatetime('dd mm yyyy, hh:mm:ss:dss', dateeksp);labelinfo.Update;

    datadouble[9,jmax]:=dateeksp;
    datadouble[9,jmax-1]:=dateeksp-dataproperties.TD/24/60/60;
    T0:=dateeksp;
    jcurrent:=jmax;
    for j:=0 to Jmax do  Data_int[0,j]:=j;
    for j:=Jmax+1 to DataProperties.NPoints-2 do
    begin
     if  ((DataDouble[6,j]=0) and (DataDouble[6,j+1]=1)) then
           begin
            t0:=T0+1/60/24/60;
            DataDouble[9,j]:=T0;
            data_int[0,j]:=(j-jcurrent)-round(1/dataProperties.td);
            jcurrent:=j;
           end
            else
             begin
              DataDouble[9,j]:=DataDouble[9,j-1]+dataproperties.TD/{60/}60/24;
              Data_Int[0,j]:=0;
             end;
     end;
   Data_Int[0,DataProperties.NPoints-1]:=0;
   T0:=dateeksp;
   jcurrent:=Jmax;
   DataDouble[9,DataProperties.NPoints-1]:=DataDouble[9,DataProperties.NPoints-2]+dataproperties.TD/60/60/24;
   for j:=Jmax downto 1 do
    begin
     if  ((DataDouble[6,j-1]=0) and (DataDouble[6,j]=1)) then
           begin
            t0:=T0-1/60/24/60;
            DataDouble[9,j]:=T0;
            data_int[0,j]:=(jcurrent-j)-round(1/dataProperties.td);
            jcurrent:=j;
           end
            else
             begin
              DataDouble[9,j]:=DataDouble[9,j+1]-dataproperties.TD/60/60/24;
              Data_Int[0,j]:=0;
             end;
     end;
   DataDouble[9,0]:=DataDouble[9,1]-dataproperties.TD/60/60/24;
   dataproperties.date_eksp:=DataDouble[9,0];
   data_Int[0,0]:=0;
 end;

 data_Int[1,0]:=0;
 for j:=1 to DataProperties.NPoints-1 do
  begin
   if data_Int[0,j]<>0 then
    begin
      labelinfo.caption:=inttostr(j);
      labelinfo.Update;
    end;
    data_int[1,j]:=data_Int[1,j-1]+data_Int[0,j]+1;
   end;
//   memo2.Lines.clear;
//   for j:=0 to 100 do memo2.Lines.add(formatfloat('0.000',DataDouble[9,j]*24*60*60)+'c '+formatdatetime('hh:mm:ss.',Tdatetime(DataDouble[9,j]))+inttostr(MilliSecondOf(DataDouble[9,j])));
 labelinfo.Caption:='';labelinfo.Update;
 s:=formatdatetime('dd.mm.yyyy hh:mm:ss:dss',dateeksp)+' '+formatdatetime('dd.mm.yyyy hh:mm:ss:dss',DataDouble[9,0]);
 caption:=s;
end;

Function TImportisgi_form.CreateEksp(E_ID_parent:integer;SourceFile,E_name_Text,Stage_CB_Text,Object_CB_Text,Author_CB_Text,Reason_CB_text,memo1_text,Mode_caption, Oil_Caption:string):Integer;
var
 ii,j,i,E_ID:integer;
 iDown,iUp,imed:integer;
 BS:TIBBlobstream;
 MS2,MS:TMemoryStream;
 s,processing:string;
 LNGShapka:TLongShapka;
 Primech:TPrimech;
 rs1,rs:single;
 DataS:array of  single;
begin
if not onlyfile_CB.Checked then
  begin
     dm.get_ekspID.ExecProc;
     e_id:=dm.get_ekspID.parambyname('ID').asinteger;
     dm.q_general.Close;
     dm.q_general.sql.clear;
     dm.q_general.sql.add('insert into eksp ');
     dm.q_general.sql.add(
     '(E_ID,E_NAME, E_DATE, E_TIME, E_SOURCEFILE, E_TEST_REASON,ID_OBJECT, E_AUTHOR, ID_DEVICE, N_CHANNELS,e_DESCR,Top,Width,Width_PG,Height,LeftCorner,Format_X,processing,typeoffile,windowheader,'+
      'e_leftPoint,E_rightpoint,e_stage,E_ID_Parent,axisX_name,e_functime,stagecount,E_Mode,E_Oil,mode,oil)');
     dm.q_general.sql.add(
     'values (:E_ID,:E_NAME, :E_DATE, :E_TIME, :E_SOURCEFILE, :E_TEST_REASON,:ID_OBJECT, :E_AUTHOR, :ID_DEVICE, :N_CHANNELS,:e_DESCR,:Top,:Width,:Width_PG,:Height,:leftCorner,:Format_X,:processing,:typeoffile,:windowheader,');
     dm.q_general.sql.add(
     ':e_leftPoint,:E_rightpoint,:e_stage,:E_ID_Parent,:AxisX_Name,:e_functime,:stage_count,:E_Mode,:E_Oil,:mode,:oil)');
      dm.q_general.ParamByName('e_ID').asinteger:=E_ID;
      dm.q_general.ParamByName('e_name').asstring:=copy(changesymbol(E_name_Text,' ','_'),1,47);
      dm.q_general.ParamByName('e_stage').asstring:=Stage_CB_text;
      if ((Mode_Caption+Oil_caption)<>'') then  dm.q_general.ParamByName('e_stage').asstring:=Oil_caption+' '+Mode_caption;
      dm.q_general.ParamByName('stage_count').asinteger:=stageCount;
      dm.q_general.ParamByName('mode').asinteger:=mode_I;
      dm.q_general.ParamByName('oil').asinteger:=oil_I;
      dm.q_general.ParamByName('axisX_Name').asstring:='t, с';
      dm.q_general.ParamByName('e_ID_Parent').asinteger:=E_ID_Parent;
      try
       dm.q_general.ParamByName('e_Date').asdatetime:=trunc(DataProperties.Date_eksp);
       except        dm.q_general.ParamByName('e_Date').asdatetime:=now;       end;
      try
       dm.q_general.ParamByName('e_time').asdatetime:=DataProperties.Date_eksp-trunc(DataProperties.Date_Eksp);
       except        dm.q_general.ParamByName('e_Date').asdatetime:=now;       end;

      Dm.q_general.ParamByName('E_LeftPoint').asinteger:=0;
      Dm.q_general.ParamByName('E_RightPoint').asinteger:=DataProperties.Npoints-1;
      Dm.q_general.ParamByName('Format_X').asstring:=dm.devices.fieldbyname('Format_X').asstring;
      Dm.q_general.ParamByName('windowheader').asstring:=dm.devices.fieldbyname('windowheader').asstring;
      Dm.q_general.ParamByName('processing').asstring:=dm.devices.fieldbyname('processing').asstring;
      Processing:=dm.devices.fieldbyname('processing').asstring;
      Dm.q_general.ParamByName('typeoffile').asstring:=dm.devices.fieldbyname('typeoffile').asstring;
      Dm.q_general.ParamByName('e_sourcefile').asstring:=sourcefile;
      Dm.q_general.ParamByName('e_Test_Reason').asstring:=reason_CB_text;
      Dm.q_general.ParamByName('e_Mode').asstring:=Mode_caption;
      Dm.q_general.ParamByName('e_Oil').asstring:=Oil_caption;
      Dm.q_general.ParamByName('e_functime').asstring:=dataproperties.e_functime;
      dm.Objects.locate('O_Name',Object_CB_text,[]);
      Dm.q_general.ParamByName('id_Object').asinteger:=dm.Objects.fieldbyname('ID_Objects').asinteger;
      Dm.q_general.ParamByName('e_Author').asstring:=Author_CB_text;
      Dm.q_general.ParamByName('id_device').asinteger:=dm.Devices.fieldbyname('ID_device').asinteger;
      Dm.q_general.ParamByName('N_Channels').asinteger:=DataProperties.NChanal;
      Dm.q_general.ParamByName('e_descr').asstring:=memo1_Text;
      with  TConfigurationManager.GetInstance.IniFile do
        begin
          Dm.q_general.ParamByName('Height').asinteger:=Readinteger('Work','Height',480);
          Dm.q_general.ParamByName('Width').asinteger:=Readinteger('Work','Width',640);
          Dm.q_general.ParamByName('Width_PG').asinteger:=Readinteger('Work','Width_PG',320);
          Dm.q_general.ParamByName('LeftCorner').asinteger:=Readinteger('Work','Left',50);
          Dm.q_general.ParamByName('Top').asinteger:=Readinteger('Work','Top',50);
       end;
 try
  DM.q_general.ExecQuery;
  dm.GetActiveDevices;
  dm.devices.Locate('typeoffile',typeoffile,[]);
  DM.GetEksp(E_ID);
  Dm.ActiveEksp.edit;
  MS:=Tmemorystream.Create;
  ms.Write(dataproperties,sizeof(TSignalShapka));
     DM.channels.First;
     dm.q_general.Close;
     dm.q_general.sql.clear;
     dm.q_general.sql.add('insert into Signals ');
     dm.q_general.sql.add('(s_num,S_NAME,S_SHORTNAME,FCLOCK,E_ID,S_POINTS,CALIBR,a0,a1,a2,a3,color,width,dimension,Format_Y,visible)');
     dm.q_general.sql.add('values (:S_Num,:S_NAME,:S_SHORTNAME,:FCLOCK,:E_ID,:S_POINTS,:CALIBR,:a0,:a1,:a2,:a3,:color,:width,:dimension,:Format_Y,:visible)');
     for j:=0 to DataProperties.NChanalOriginal-1 do
     begin
       labelinfo.Caption:='Запись канала ('+inttostr(j+1)+') в базу данных';labelinfo.Update;
       MS.write(datadouble[j,0],sizeof(double)*DataProperties.NPoints);
       Dm.q_general.ParamByName('s_name').asstring:=dm.channels.fieldbyname('Channel_Name').asstring;
       Dm.q_general.ParamByName('Format_Y').asstring:=dm.channels.fieldbyname('Format_Y').asstring;
       Dm.q_general.ParamByName('dimension').asstring:=dm.channels.fieldbyname('dimension').asstring;
       Dm.q_general.ParamByName('s_Shortname').asstring:=dm.channels.fieldbyname('Ch_short_Name').asstring;
       Dm.q_general.ParamByName('FClock').asfloat:=1/DataProperties.TD;
       Dm.q_general.ParamByName('E_ID').asinteger:=E_ID;
       Dm.q_general.ParamByName('S_num').asinteger:=j+1;
       Dm.q_general.ParamByName('S_Points').asfloat:=DataProperties.NPoints;
       Dm.q_general.ParamByName('Calibr').asstring:=dm.channels.fieldbyname('Calibr').asstring;
       Dm.q_general.ParamByName('Visible').asstring:=dm.channels.fieldbyname('Visible').asstring;
       Dm.q_general.ParamByName('a0').asfloat:=DataProperties.quants[j].a0;//dm.channels.fieldbyname('a0').asfloat;
       Dm.q_general.ParamByName('a1').asfloat:=DataProperties.quants[j].a1;//dm.channels.fieldbyname('a1').asfloat;
       Dm.q_general.ParamByName('a2').asfloat:=DataProperties.quants[j].a2;//dm.channels.fieldbyname('a2').asfloat;
       Dm.q_general.ParamByName('a3').asfloat:=DataProperties.quants[j].a3;//dm.channels.fieldbyname('a3').asfloat;
       Dm.q_general.ParamByName('color').asinteger:=dm.channels.fieldbyname('color').asinteger;
       Dm.q_general.ParamByName('width').asinteger:=dm.channels.fieldbyname('width').asinteger;
       DM.q_general.ExecQuery;
       dm.Channels.Next;
     end;
     if trim(processing)='1' then
       begin
           MS.write(datadouble[DataProperties.NChanalOriginal,0],sizeof(double)*DataProperties.NPoints);
           Dm.q_general.ParamByName('s_name').asstring:='Подготовка ';
           Dm.q_general.ParamByName('FClock').asfloat:=1/DataProperties.TD;
           Dm.q_general.ParamByName('E_ID').asinteger:=E_ID;
           Dm.q_general.ParamByName('S_num').asinteger:=j+1;
           Dm.q_general.ParamByName('S_Points').asfloat:=DataProperties.NPoints;
           Dm.q_general.ParamByName('Calibr').asstring:='Нет';
           Dm.q_general.ParamByName('Visible').asstring:='Да';
           Dm.q_general.ParamByName('a0').asfloat:=DataProperties.quants[DataProperties.NChanalOriginal-1].a0;
           Dm.q_general.ParamByName('a1').asfloat:=DataProperties.quants[DataProperties.NChanalOriginal-1].a1;
           Dm.q_general.ParamByName('a2').asfloat:=DataProperties.quants[DataProperties.NChanalOriginal-1].a2;
           Dm.q_general.ParamByName('a3').asfloat:=DataProperties.quants[DataProperties.NChanalOriginal-1].a3;
           DM.q_general.ExecQuery;
           MS.write(datadouble[DataProperties.NChanalOriginal+1,0],sizeof(double)*DataProperties.NPoints);
           Dm.q_general.ParamByName('s_name').asstring:='Обороты';
           Dm.q_general.ParamByName('format_Y').asstring:='0.0';
           Dm.q_general.ParamByName('s_Shortname').asstring:='N';
           Dm.q_general.ParamByName('dimension').asstring:='';
           Dm.q_general.ParamByName('FClock').asfloat:=1/DataProperties.TD;
           Dm.q_general.ParamByName('E_ID').asinteger:=E_ID;
           Dm.q_general.ParamByName('S_num').asinteger:=j+2;
           Dm.q_general.ParamByName('S_Points').asfloat:=DataProperties.NPoints;
           Dm.q_general.ParamByName('Calibr').asstring:='Нет';
           Dm.q_general.ParamByName('Visible').asstring:='Да';
           Dm.q_general.ParamByName('a0').asfloat:=0;
           Dm.q_general.ParamByName('a1').asfloat:=1;
           Dm.q_general.ParamByName('a2').asfloat:=0;
           Dm.q_general.ParamByName('a3').asfloat:=0;
           DM.q_general.ExecQuery;
         end;
   if trim(processing)='386' then
       begin
           labelinfo.Caption:='Запись канала Т в базу данных';labelinfo.Update;
           MS.write(datadouble[DataProperties.NChanalOriginal,0],sizeof(double)*DataProperties.NPoints);
           Dm.q_general.ParamByName('s_name').asstring:='T ';
           Dm.q_general.ParamByName('s_Shortname').asstring:='T';
           Dm.q_general.ParamByName('FClock').asfloat:=1/DataProperties.TD;
           Dm.q_general.ParamByName('E_ID').asinteger:=E_ID;
           Dm.q_general.ParamByName('S_num').asinteger:=j+1;
           Dm.q_general.ParamByName('S_Points').asfloat:=DataProperties.NPoints;
           Dm.q_general.ParamByName('Calibr').asstring:='Нет';
           Dm.q_general.ParamByName('Visible').asstring:='Да';
           Dm.q_general.ParamByName('a0').asfloat:=DataProperties.quants[DataProperties.NChanalOriginal-1].a0;
           Dm.q_general.ParamByName('a1').asfloat:=DataProperties.quants[DataProperties.NChanalOriginal-1].a1;
           Dm.q_general.ParamByName('a2').asfloat:=DataProperties.quants[DataProperties.NChanalOriginal-1].a2;
           Dm.q_general.ParamByName('a3').asfloat:=DataProperties.quants[DataProperties.NChanalOriginal-1].a3;
           DM.q_general.ExecQuery;
           labelinfo.Caption:='Запись канала Ти в базу данных';labelinfo.Update;
           MS.write(datadouble[DataProperties.NChanalOriginal+1,0],sizeof(double)*DataProperties.NPoints);
           Dm.q_general.ParamByName('s_name').asstring:='Tи';
           Dm.q_general.ParamByName('format_Y').asstring:='0.0';
           Dm.q_general.ParamByName('s_Shortname').asstring:='Tи';
           Dm.q_general.ParamByName('dimension').asstring:='';
           Dm.q_general.ParamByName('FClock').asfloat:=1/DataProperties.TD;
           Dm.q_general.ParamByName('E_ID').asinteger:=E_ID;
           Dm.q_general.ParamByName('S_num').asinteger:=j+2;
           Dm.q_general.ParamByName('S_Points').asfloat:=DataProperties.NPoints;
           Dm.q_general.ParamByName('Calibr').asstring:='Нет';
           Dm.q_general.ParamByName('Visible').asstring:='Нет';
           Dm.q_general.ParamByName('a0').asfloat:=0;
           Dm.q_general.ParamByName('a1').asfloat:=1;
           Dm.q_general.ParamByName('a2').asfloat:=0;
           Dm.q_general.ParamByName('a3').asfloat:=0;
           DM.q_general.ExecQuery;
           labelinfo.Caption:='Запись канала "1" в базу данных';labelinfo.Update;
           MS.write(datadouble[DataProperties.NChanalOriginal+2,0],sizeof(double)*DataProperties.NPoints);
           Dm.q_general.ParamByName('s_name').asstring:='"1"';
           Dm.q_general.ParamByName('s_shortname').asstring:='"1"';
           Dm.q_general.ParamByName('format_Y').asstring:='0.0';
           Dm.q_general.ParamByName('s_Shortname').asstring:='c0';
           Dm.q_general.ParamByName('dimension').asstring:='';
           Dm.q_general.ParamByName('FClock').asfloat:=1/DataProperties.TD;
           Dm.q_general.ParamByName('E_ID').asinteger:=E_ID;
           Dm.q_general.ParamByName('S_num').asinteger:=j+3;
           Dm.q_general.ParamByName('S_Points').asfloat:=DataProperties.NPoints;
           Dm.q_general.ParamByName('Calibr').asstring:='Нет';
           Dm.q_general.ParamByName('Visible').asstring:='Нет';
           Dm.q_general.ParamByName('a0').asfloat:=0;
           Dm.q_general.ParamByName('a1').asfloat:=1;
           Dm.q_general.ParamByName('a2').asfloat:=0;
           Dm.q_general.ParamByName('a3').asfloat:=0;
           DM.q_general.ExecQuery;
           labelinfo.Caption:='Запись канала "0" в базу данных';labelinfo.Update;
           MS.write(datadouble[DataProperties.NChanalOriginal+3,0],sizeof(double)*DataProperties.NPoints);
           Dm.q_general.ParamByName('s_name').asstring:='"0"';
           Dm.q_general.ParamByName('format_Y').asstring:='0.0';
           Dm.q_general.ParamByName('s_Shortname').asstring:='"0"';
           Dm.q_general.ParamByName('dimension').asstring:='';
           Dm.q_general.ParamByName('FClock').asfloat:=1/DataProperties.TD;
           Dm.q_general.ParamByName('E_ID').asinteger:=E_ID;
           Dm.q_general.ParamByName('S_num').asinteger:=j+4;
           Dm.q_general.ParamByName('S_Points').asfloat:=DataProperties.NPoints;
           Dm.q_general.ParamByName('Calibr').asstring:='Нет';
           Dm.q_general.ParamByName('Visible').asstring:='Нет';
           Dm.q_general.ParamByName('a0').asfloat:=0;
           Dm.q_general.ParamByName('a1').asfloat:=1;
           Dm.q_general.ParamByName('a2').asfloat:=0;
           Dm.q_general.ParamByName('a3').asfloat:=0;
           DM.q_general.ExecQuery;
           labelinfo.Caption:='Запись канала "время" в базу данных';labelinfo.Update;
           MS.write(datadouble[DataProperties.NChanalOriginal+4,0],sizeof(double)*DataProperties.NPoints);
           Dm.q_general.ParamByName('s_name').asstring:='время';
           Dm.q_general.ParamByName('format_Y').asstring:='0.0';
           Dm.q_general.ParamByName('s_Shortname').asstring:='вр';
           Dm.q_general.ParamByName('dimension').asstring:='';
           Dm.q_general.ParamByName('FClock').asfloat:=1/DataProperties.TD;
           Dm.q_general.ParamByName('E_ID').asinteger:=E_ID;
           Dm.q_general.ParamByName('S_num').asinteger:=j+5;
           Dm.q_general.ParamByName('S_Points').asfloat:=DataProperties.NPoints;
           Dm.q_general.ParamByName('Calibr').asstring:='Нет';
           Dm.q_general.ParamByName('Visible').asstring:='Нет';
           Dm.q_general.ParamByName('a0').asfloat:=0;
           Dm.q_general.ParamByName('a1').asfloat:=1;
           Dm.q_general.ParamByName('a2').asfloat:=0;
           Dm.q_general.ParamByName('a3').asfloat:=0;
           DM.q_general.ExecQuery;
         end;
    labelinfo.Caption:='Загрузка d поток';labelinfo.Update;

    dm.ActiveEkspE_data.LoadFromStream(MS);
    MS.Free;
    MS:=Tmemorystream.Create;
    labelinfo.Caption:='Сохранение потока';labelinfo.Update;
    ms.Write(stage_array,sizeof(stage_array));
    dm.ActiveEkspE_Stage_array.LoadFromStream(MS);
    MS.Free;
    labelinfo.Caption:='Database post';labelinfo.Update;
    dm.Activeeksp.post;
    result:=e_id;
  except
        on E: Exception do
          showmessage('Ошибка при записи в базу для '+sourcefile+' Вероятно, запись этого испытания уже сохранена. (' + E.Message+')');
      end;
  end;

 labelinfo.Caption:='Запись шапки сигнала в файл';labelinfo.Update;

 with LNGShapka do
  begin
   bMaxMinExistAll:=false;
   bMaxMinExist:=false;
   rMaxX:=1;
   rMinX:=0;
   rMaxY:=1;
   rMinY:=0;
   ActChanal:=1;  {  ЄвЁў­л© Є ­ « -    ­г¬Ґа жЁп ®в 0}
   NChanal:=5;  { бЄ®«мЄ® ўбҐЈ® Є ­ «®ў. „«п ®¤­®Є ­ «м­®Ј® - 1, ¤«п 2-е Є ­ «®ў - 2  Ё в.¤. }
   lPointStart:=0;
   lPointEnd:=(dataproperties.NPoints-1) div 10;
   lPointAll:=dataproperties.NPoints-1;
   rTimeStart:=Dataproperties.Date_Eksp;
   shTimeFormat:=0;//shortint;
   rClock:=1/(dataproperties.TD);        {з бв®в  ¤ЁбЄаҐвЁ§ жЁЁ ѓж}
   bCreated:=false;
   scAxisX:='t';
   scAxisY:='U';  {®Ў®§­ зҐ­ЁҐ ®бҐ©}
   ScFile:=
   onlyfile_CB.hint+'.lng';
   TipData:=cseismoreal;
   LADC:=18;
   MaxRez:=1;
   scHeader:=Formatdatetime('dd_mm_yyyy hh:mm:ss.dss', dataproperties.Date_Eksp);
   decodedatetime(dataproperties.Date_Eksp,absTime.year,absTime.month,absTime.day,absTime.hour, absTime.minute,absTime.second,absTime.sec100);

//   AbsTime:tDateTimeRec_Gemis;
   fText:='';//tFileNameStr;
   Primech[1]:=scHeader;// PrimechPtr;
   Primech[2]:=extractfilename(onlyfile_CB.hint);// PrimechPtr;
  end;

 MS2:=Tmemorystream.Create;
 ms2.Write(lngshapka,sizeof(TLongShapka));
 ms2.Write(Primech,sizeof(TPrimech));
 DataS:=nil;  setlength(DataS,DataProperties.npoints);

// jcurrent:=0;
 ii:=0;
 for j:=0 to DataProperties.NChanalOriginal-1 do
  begin
    labelinfo.Caption:='Запись канала ('+inttostr(j)+') в файл';labelinfo.Update;

    iDown:=0; iUp:=0; imed:=0;
    repeat
      if iUp >= dataProperties.NPoints-1 then
       begin
        datas[idown]:=datadouble[j,iUp];
        idown:=idown+1;
       end
        else
           case data_int[0,iMed] of
           1:begin
               iUp:=iUp+1;
               Imed:=imed+1;
              end;
            0:begin
               datas[idown]:=datadouble[j,iUp];
               idown:=idown+1;
               iUp:=iUp+1;
               Imed:=imed+1;
              end;
           -1:begin
               datas[idown]:=(datadouble[j,iUp]+datadouble[j,iUp-1])/2;
               idown:=idown+1;
               datas[idown]:=datadouble[j,iUp];
               idown:=idown+1;
               iUp:=iUp+1;
               Imed:=imed+1;
              end;
              else
              begin
               idown:=idown+1;
               iUp:=iUp+1;
               Imed:=imed+1;
              end;
          end;
       if ((imed mod 10000 = 0)) then
         begin
          labelinfo.Caption:='Запись канала ('+inttostr(j)+'_'+inttostr(DataProperties.NPoints)+'_'+inttostr(imed)+') в файл';labelinfo.Update;
         end;
    until idown > dataProperties.NPoints-1;
    labelinfo.Caption:='Запись канала ('+inttostr(j) +') в файл';labelinfo.Update;
    ms2.Write(datas[0],DataProperties.NPoints*sizeof(single));
  end;

  (*
    for i:= 0 to DataProperties.NPoints-1 do
        begin
         rs:=datadouble[j,ii];
         if data_int[0,j]=0 then  datas[i]:=rs;//MS2.write(rs,sizeof(single));
         if data_int[0,j]=1 then
          begin
           rs1:=datadouble[j+1,ii];
           rs:=(rs+rs1)/2;
           datas[i]:=rs;//MS2.write(rs,sizeof(single));
          end;
         ii:=ii+1;
         if data_int[1,j]<1 then
          begin
           i:=i+1;
          end;
          if ((i mod 10000 = 0)) then
           begin
            labelinfo.Caption:='Запись канала ('+inttostr(j)+'_'+inttostr(DataProperties.NPoints)+'_'+inttostr(i)+') в файл';labelinfo.Update;
           end;
        end;
*)
{  for i:= 0 to DataProperties.NPoints-1 do
       begin
         rs:=datadouble[0,i];
         MS2.write(rs,sizeof(single));
        end;
  for i:= 0 to DataProperties.NPoints-1 do
        begin
         rs:=datadouble[DataProperties.NChanalOriginal+4,i];
         MS2.write(rs,sizeof(single));
        end;
            }
  s:= onlyfile_CB.hint;
//  s:=copy(s,1,pos('.',s));
  ms2.SaveToFile(s+'.lng');
  ms2.Free;
  DataS:=nil;
  labelinfo.Caption:='';labelinfo.Update;
//  caption:=inttostr(Sizeof(TSignalShapka));
end; //CreateEksp


procedure TImportisgi_form.Object_CBClick(Sender: TObject);
begin
   dm.Objects.locate('O_Name',Object_CB.text,[]);
   Emptyoborot:=dm.Objects.fieldbyname('emptyoborot').asinteger;
   OborotMax:=dm.Objects.fieldbyname('OborotMax').asinteger;
   EmptyOborotPanel.visible:=dm.Objects.fieldbyname('addparam').asstring='Холостые обороты';
end;

procedure TImportisgi_form.Contact1Click(Sender: TObject);
var
 s:string;
begin
 s:=extractfilepath(application.exename)+'Contact.exe '+inttostr(handle);
 winexec(pchar(s), cmdShow);
end;



procedure TImportisgi_form.WMCopyData(var m : TMessage);
Var 
    FName:string;
begin
 Fname:=PRecToPass(PCopyDataStruct(m.LParam)^.lpData)^.fname;
// caption:=fname;
 LB1.Items.add(fname);
 LB.Items.add(extractfilename(fname));
end;


end.
