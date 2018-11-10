unit Import_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, menu_f, Menus, StdCtrls, Buttons, ExtCtrls,
  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer, cxListBox,
  tvc_u, ComCtrls, Grids, DBGrids;

type

  TImportForm = class(TMenuForm)
    Panel2: TPanel;
    Panel3: TPanel;
    LB1: TListBox;
    OD: TOpenDialog;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    LV: TListView;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    memo: TEdit;
    N3: TMenuItem;
    Label3: TLabel;
    SignalSource: TEdit;
    Theme: TComboBox;
    Author: TComboBox;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure ImportClick(Sender: TObject);
//    procedure LBClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure GetFilefiltr;
  public
    { Public declarations }
    SignalShapka: TSignalShapka;
    FilterIndex:integer;
    function GetFileInfo(Filename: TFilename): boolean;
    function GetFileData(Filename: TFilename): boolean;
  end;

var
  ImportForm: TImportForm;

implementation

uses config, DM_dm, Main_f;

{$R *.dfm}

procedure TImportForm.FormCreate(Sender: TObject);
begin
  inherited;
  OD.InitialDir := AppConfig.dataPath;
  GetFilefiltr;
end;


procedure TImportform.GetFilefiltr;
begin
  od.Filter := '';
  if not dm.devices.active then dm.devices.Open;
  dm.devices.first;
  while not dm.devices.eof do
  begin
    if od.filter <> '' then od.filter := od.filter + '|';
    od.Filter := od.filter + dm.devices.fieldbyname('filefilter').asstring;
    dm.devices.next;
  end;
end;

procedure TImportForm.ImportClick(Sender: TObject);
var i: integer;
 LI:TListItem;
begin
  od.FilterIndex:=filterIndex;
  if od.execute then
  begin
    for i := 0 to OD.Files.count - 1 do
      if LB1.items.indexof(OD.Files[i]) = -1 then
      begin
       if GetFileInfo(OD.Files[i]) then
        begin
        FilterIndex:=OD.FilterIndex;
        LB1.Items.add(OD.Files[i]);
        LI:=LV.Items.Add;
        LI.Caption:=extractfilename(OD.Files[i]);
        LI.SubItems.add(FormatDatetime('dd mmm yy    hh:mm:ss.dss', signalshapka.Date_Eksp));
        LI.SubItems.add(inttostr(signalshapka.NChanal));
        LI.SubItems.add(formatfloat('0.000', signalshapka.NPoints * signalshapka.Td));
        LI.SubItems.add(formatfloat('0.000', 1 / signalshapka.Td));
        LI.SubItems.add(signalshapka.windowheader);
        end;
    LV.ItemIndex := LV.Items.count - 1;
//    Checkbox1.Checked:=false;
    appconfig.saveDataPath(extractfilepath(OD.Files[0]));
  end;
end;
end;



procedure TImportForm.cxButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

function TImportForm.GetFileData(FileName: TFileName): boolean;
var
  s,ext: string;
  Handle: THandle;
  GetDataProc: TGetdata_Proc;
  ChanArray: TChanArray;
  DestFileName: TFilename;
  i,id:integer;
begin
  result := false;
  ext := ansiuppercase(extractFileExt(Filename));
  if not dm.devices.Locate('typeoffile', ext, []) then
  begin
    showmessage('Неизвестный тип файла');
    exit;
  end;
  Handle := LoadLibrary(pchar(dm.devices.fieldbyname('dll_name').asstring));
  if Handle >= 32 then { if <=32 - error ! }
  begin
    @GetDataProc := GetProcAddress(Handle,
      pchar(dm.devices.fieldbyname('GetDATA_function_name').asstring));
    if assigned(GetDataProc) then
    begin
      GetMem(ChanArray, sizeof(TChanRec) * SignalShapka.NChanal);
      DestFileName := dm.ActiveStoragepath + GetGuidStr;
//      DestFileName := AppConfig.DataStoragePath + GetGuidStr;
      GetDataProc(Filename, // создание файлов с данными по каналам в single-виде
        DestFilename,
        SignalShapka,
        ChanArray);
// сохранение записи о сигнале и эксперименте в базе данных
(*      if ansiuppercase(Ext)='.ASC' then
       begin
        SignalShapka.NPoints:=ChanArray[0].POINTALL;
        SignalShapka.NChanal:=High(ChanArray)-low(ChanArray);
        SignalShapka.NChanalOriginal:=High(ChanArray)-low(ChanArray);
        SignalShapka.Td:=ChanArray[0].DELTX;
        signalshapka.Date_Eksp:=ChanArray[0].DateTime_START;

       end;
  *)    if trim(theme.text)='' then dm.Create_Eksp.ParamByName('EKSP_THEME').asstring:='Не задано' else
         dm.Create_Eksp.ParamByName('EKSP_THEME').asstring:=theme.text;
      dm.Create_Eksp.ParamByName('EKSP_Date').asdatetime:=trunc(signalshapka.Date_Eksp);
      dm.Create_Eksp.ParamByName('EKSP_Time').asdatetime:=signalshapka.Date_Eksp-trunc(signalshapka.Date_Eksp);
      dm.Create_Eksp.ParamByName('EKSP_Header').asstring:=extractfilename(Filename);
      dm.Create_Eksp.ParamByName('EKSP_Author').asstring:=Author.Text;
      dm.Create_Eksp.ParamByName('EKSP_memo').asstring:=memo.text;
      dm.Create_Eksp.ParamByName('EKSP_SignalSource').asstring:=SignalSource.text;
      dm.Create_Eksp.ParamByName('EKSP_SOURCEFILE').asstring:=FileName;
      dm.Create_Eksp.ExecProc;
      Id:=dm.Create_Eksp.ParamByName('ID').asinteger;
      dm.q.sql.clear;
      dm.q.sql.add('insert into signals');
      dm.q.sql.add(' (  EKSP_NOMER, EKSP_PARENT, CHANAL_NOMER,');
      dm.q.sql.add('    CHANAL_HEADER,  DELTX , NAMEX, NAMEY, RAZMX, RAZMY,');
      dm.q.sql.add('    MULTX, MULTY,  MAXX,    MAXY  ,');
      dm.q.sql.add('    MINX ,    MINY ,    DATE_START , TIME_START,');
      dm.q.sql.add('    POINTALL,BMAXMINX,  BMAXMINY,  FILEDAT,  REZTYPE,');
      dm.q.sql.add('    REZLENGTH ,  A0 ,A1 , A2 ,A3  ,SIGNALMEMO , SIGNAL_SELECTED ,FILE_SEEK, datetimestart)');
      dm.q.sql.add(' values ( :EKSP_NOMER, :EKSP_PARENT, :CHANAL_NOMER,');
      dm.q.sql.add('    :CHANAL_HEADER,  :DELTX , :NAMEX, :NAMEY, :RAZMX, :RAZMY,');
      dm.q.sql.add('    :MULTX, :MULTY,  :MAXX,    :MAXY  ,');
      dm.q.sql.add('    :MINX ,    :MINY ,    :DATE_START , :TIME_START,');
      dm.q.sql.add('    :POINTALL,:BMAXMINX,  :BMAXMINY,  :FILEDAT,  :REZTYPE,');
      dm.q.sql.add('    :REZLENGTH ,  0 ,1 , 0 ,0  ,:SIGNALMEMO , 1 ,0, :datetimestart)');
      dm.q.parambyname('eksp_nomer').asinteger:=ID;
      dm.q.parambyname('eksp_Parent').asinteger:=ID;
      dm.q.parambyname('RezType').asinteger:=cRealLong;
      dm.q.parambyname('RezLength').asinteger:=sizeof(Single);
      for i:=0 to signalshapka.NChanal-1 do
       begin
        dm.q.parambyname('Chanal_Nomer').asinteger:=i+1;
        dm.q.parambyname('Chanal_Header').asstring:=copy (ChanArray[i].HEADER,1,15);
        dm.q.parambyname('DeltX').asfloat:=ChanArray[i].DELTX;
        dm.q.parambyname('NameX').asstring:=ChanArray[i].NameX;
        dm.q.parambyname('NameY').asstring:=ChanArray[i].NameY;
        dm.q.parambyname('RazmX').asstring:=ChanArray[i].RazmX;
        dm.q.parambyname('RazmY').asstring:=ChanArray[i].RazmY;
        dm.q.parambyname('MinX').asfloat:=ChanArray[i].minx;
        dm.q.parambyname('MinY').asfloat:=ChanArray[i].minY;
        dm.q.parambyname('MaxX').asfloat:=ChanArray[i].MaxX;
        dm.q.parambyname('MaxY').asfloat:=ChanArray[i].MaxY;
        dm.q.parambyname('DateTimeStart').asfloat:=ChanArray[i].DateTime_START;
        dm.q.parambyname('Date_Start').asdatetime:=trunc(ChanArray[i].DateTime_START);
        dm.q.parambyname('Time_Start').asDatetime:=ChanArray[i].DateTime_START-trunc(ChanArray[i].DateTime_START);
        dm.q.parambyname('PointAll').asinteger:=ChanArray[i].POINTALL;
        dm.q.parambyname('bmaxMinX').asinteger:=integer(false);
        dm.q.parambyname('bmaxMinY').asinteger:=integer(false);
        s:=ChanArray[i].FILEDAT;
        delete(s,1,length(dm.ActiveStoragepath));
        dm.q.parambyname('Filedat').asstring:=s;//ChanArray[i].FILEDAT;
        dm.q.parambyname('SignalMemo').asstring:=ChanArray[i].SIGNALMEMO;
        dm.q.execSQL;
       end;

      dm.Create_Eksp.Transaction.CommitRetaining;
      ChanArray:=nil;
      Result := true;
    end
    else
    begin
      showmessage('Некорректное имя процедуры для файлов типа ' + dm.devices.fieldbyname('typeoffile').asstring);
//              FreeLibrary(Handle);
      exit;
    end;
  end
  else
  begin
    showmessage('Некорректное имя dll ' + dm.devices.fieldbyname('dll_name').asstring);
    exit;
  end;
  FreeLibrary(Handle);

end;


function TImportForm.GetFileInfo(Filename: TFilename): boolean;
var
  Handle: THandle;
  GetInfoProc: TGetInfo_Proc;
  ext: string;
begin
  inherited;
  result := false;
  ext := ansiuppercase(extractFileExt(Filename));
  if not dm.devices.Locate('typeoffile', ext, []) then
  begin
    showmessage('Неизвестный тип файла');
    exit;
  end;
  Handle := LoadLibrary(pchar(dm.devices.fieldbyname('dll_name').asstring));
  if Handle >= 32 then { if <=32 - error ! }
  begin
    @GetInfoProc := GetProcAddress(Handle, pchar(dm.devices.fieldbyname('GetInfo_function_name').asstring));
    if assigned(GetInfoProc) then
    begin
      GetInfoProc(Filename, SignalShapka); //описание входного сигнала
      Result := true;
    end
    else
    begin
      showmessage('Некорректное имя процедуры для файлов типа ' + dm.devices.fieldbyname('typeoffile').asstring);
//              FreeLibrary(Handle);
      exit;
    end;
  end
  else
  begin
    showmessage('Некорректное имя dll ' + dm.devices.fieldbyname('dll_name').asstring);
    exit;
  end;
//      FreeLibrary(Handle);
end;


procedure TImportForm.cxButton2Click(Sender: TObject);
var
 i:integer;
begin
  inherited;
  if lV.items.count = 0 then exit;
  for i:= LV.items.count-1 downto 0 do
   if LV.items[i].selected then
    begin
     statusbar1.Panels[0].Text:='Ждите окончания загрузки';statusbar1.update;
     if ((ansiuppercase(extractFileExt(lb1.Items[i]))='.ASC') or
         (ansiuppercase(extractFileExt(lb1.Items[i]))='.DAT'))
           then
      begin
        sleep(1000);
        GetFileData(lb1.Items[i]);
        sleep(1000);
        LV.Items[i].delete;
        update;
      end
      else
      begin
      if GetFileInfo(lb1.Items[i]) then
       begin
        sleep(1000);
        GetFileData(lb1.Items[i]);
        sleep(1000);
        LV.Items[i].delete;
        update;
       end;
      end;
    end;
  statusbar1.Panels[0].Text:='';statusbar1.update;
  if LV.items.count=0 then close;
end;

procedure TImportForm.FormShow(Sender: TObject);
begin
  inherited;
 dm.GetStringsFromQuery(dm.sql,theme.Items,'select distinct eksp_theme as theme from eksp where (( eksp_proc = 0 ) or ( eksp_proc >2 ) )  and (id_uplevel=-1) ', 'theme');
 dm.GetStringsFromQuery(dm.sql,author.Items,'select distinct eksp_author as author from eksp where (( eksp_proc = 0 ) or ( eksp_proc >2 ) )  and (id_uplevel=-1) ', 'author');
 Importclick(nil);
end;

end.

