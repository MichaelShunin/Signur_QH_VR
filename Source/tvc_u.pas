unit tvc_u;

interface
uses sysutils, forms, messages, windows, filebuff,mdrv;

const



  AudioParFileName = 'audio.cfg';
  AudioWavFileName = 'audio.wav';

  NStrokPrimech = 10;
  WidthStrokPrimech = 60;
  Zapas = 10;

  cRealLong = 0; cWordLong = 1; cADCLong = 2;
  cLong18 = 3; cVoltMeterLong = 4; cBasaLong = 5;
  cSeismoReal = 6; cSeismoWord = 7; cSeismoLInt = 8;
  cWordLongLupa = 9; CAllDynData18 = 10; CAllDynData = 11;
  CAllData18 = 12; CAllData = 13; cMapData = 14;
  cAnyChanal = 15; CLCardData = 16;

  cSizeRez: array[CRealLong..cLCardData] of byte =
  (SizeOf(Single), SizeOf(word), SizeOf(Word),
    SizeOf(LongInt), SizeOf(Single), SizeOf(Single),
    SizeOf(Single), SizeOf(Word), SizeOf(LongInt),
    SizeOf(Word), SizeOf(LongInt), SizeOf(Word),
    SizeOf(LongInt), SizeOf(Word), SizeOf(Single),
    SizeOf(Single), SizeOf(Single));


  cMaxViewPage = 100;
  colors: array[1..16] of longint =
  (0, 128, 255,  8388608, $000080FF, 32768, 65280, 65535, 8388736, 8421376, 8421504,
    12632256, 16711935, 16776960, 16777215, 128);
  Linestyles: array[1..16] of byte =
  (5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5);
  LineWidth: array[1..16] of byte =
  (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
  LineHide: array[1..16] of boolean =
  (true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);


  SourceFileName_Const = 'Source.cfg';
  ReturnFileName_Const = 'Return.cfg';
  FiltrParFileName = 'filtrPar.cfg';
  FuncParFileName = 'funcPar.cfg';
  SeismoParFileName = 'seismPar.cfg';
  SpectrParFileName = 'spctrPar.cfg';
  AB_ProcParFileName = 'ABPrcPar.cfg';
  ExportFileName = 'export.cfg';
  ExportPackFileName = 'P_export.cfg';

  cNoMap_View = 1;
  cTimeMap_View = 2;
  cFreqMap_View = 3;
  cText_View = 4;
  cNothing_View = 5;
  cKxxMap_View = 6;
  cY_X_View = 7;
  CProcRez_is_Signal = cNoMap_View;
  cProcRez_is_Text = cText_View;
  cProcRez_is_Nothing = cNothing_View;
  cProcRez_is_FreqMap = cFreqMap_View;
  cProcRez_is_TimeMap = cTimeMap_View;
  cProcRez_is_KxxMap = cKxxMap_View;
  cProcRez_is_Y_X = cY_X_View;

  {  FontScale = 30;}
 { Во столько раз размер шрифта в пунктах меньше высоты страницы в миллиметрах }
  HeightScale: longint = round(81);
 { Во столько раз размер шрифта в пикселах меньше высоты страницы в пикселах }

{cообщения}
  wm_SetStartPoint = wm_user + 400;
  wm_EndProcessing = wm_user + 401;
  wm_SetPartAll = wm_User + 402;
  wm_setFon = wm_User + 403;
  wm_Export = wm_User + 404;
  wm_AddCursorsList = wm_User + 405;
  wm_SetCursorsList = wm_user + 406;
  wm_DeleteCursor = wm_User + 407;
  wm_ShowCursor = wm_User + 408;
  wm_SetCursorFromObzorka = wm_User + 409;
  wm_DelCursorFromObzorka = wm_User + 410;
  wm_SetCursorFromAudio = wm_User + 411;
  wm_NextChan_FromAudio = wm_User + 412;
  wm_PrevChan_FromAudio = wm_User + 413;
  wm_StartProcessing = wm_user + 414;
  wm_end2ChProcessing = wm_user + 415;
  wm_EndImport = wm_user + 416;
  wm_endProcessing_Gl_2004: word = wm_user + 401;
  wm_endImport_Gl: word = wm_user + 417;
  wm_endImport_No_Tabl_Gl: word = wm_user + 418; {посылается по окончании программы импорта данных пользователя,
              если программа НЕ осуществляет ввод в таблицы баз данных GeMiSWin,
             а сохраняет информацию об импортированных сигналах в файлах
            Imp_Exp.cfg и Imp_Sig.cfg.
            Д.б. зарегистрировано как глобальное сообщение Windows}
  wm_endMeasImport_No_Tabl_Gl: word = wm_user + 419; {посылается по окончании программы измерения
             и импорта данных пользователя,
              если программа НЕ осуществляет ввод в таблицы баз данных GeMiSWin,
             а сохраняет информацию об импортированных сигналах в файлах
            Imp_Exp.cfg и Imp_Sig.cfg.
            Д.б. зарегистрировано как глобальное сообщение Windows}
  wm_endMeasImport_Gl: word = wm_user + 420; {посылается по окончании программы измерения
             и импорта данных пользователя,
              если программа осуществляет ввод в таблицы баз данных GeMiSWin,
            Д.б. зарегистрировано как глобальное сообщение Windows}
  wm_endMeas_Gl: word = wm_user + 421; {посылается по окончании программы измерения  пользователя,
              если программа только сохраняет результаты в файлах,
            Д.б. зарегистрировано как глобальное сообщение Windows}
  wm_StartImport = wm_user + 422;
  wm_Check_DB = wm_user + 423;
  wm_SetUserCursor_Gl: word = wm_user + 424; {посылается из внешней программы в случае
  необходимости простановки курсора в обрабатываемом образе
  номер отсчета передается как TMsg.lParam
    Д.б. зарегистрировано как глобальное сообщение Windows}

// {$A-}

 WM_COPYDATA = $004A;

 type

{ DataReal=array[0..PointMax] of single;
 PDataReal=^DataReal;
 }

   prmType = record
                   Tone     : byte;
                   PhoneNmb : String[20];
                   Access   : Integer
                  end;

    prmModemType = record
                   Tone     : Boolean;
                   PhoneNmb : String[20];
                   Access   : Integer
                  end;

  prmModbusType = record
                   Addr     : Integer;  //1..247
                   Bdr      : Byte;     //1200(0), 2400(1), 4800(2), 9600(3)
                   Parity   : Byte     //нет(0), чёт.(1), нечёт.(2)
                  end;


  PCopyDataStruct = ^TCopyDataStruct;
  TCopyDataStruct = record
    dwData: LongInt;
    cbData: LongInt;
    lpData: Pointer;
  end;


  PRecToTransfer = ^TRecToTransfer;
  TRecToTransfer = packed record
    FName:string[255];
    otherData:word;
    TypeOfFile: byte;
    Mult_K:single;
    HourLast: tdatetime;
    DayLast:tdatetime;  
  end;

  TFuncPar = record
    ActivePage: Byte;
    C1_Edit: double;
    c2_Edit: double;
    Sk_Sredn: longint;
    bskUsr: boolean;
    bDopZero: boolean;
    Format_S: string[30];
    Chisl_Har: smallint;
    MinCB: boolean;
    MaxCB: boolean;
    MxCB: Boolean;
  end;
  TFiltrPar = record
    PorLF:byte;
    FLF:double;
    PorHF:byte;
    FHF:double;
    NachUchast:longint;
    end;
  TSpectrPar = record
    VidFunc: smallint;
    PointFFT: word;
    WindowFunc: smallint;
    OneOrMany: smallint;
    Smesh: Longint;
    SrednOrMap: smallint;
    SelectedSignal: smallint;
    Ao: double;
  end;
  TAB_ProcPar = record
    ActivePage: Byte;
    A_B_Vid: smallint;
    VidFunc: smallint;
    PointFFT: word;
    WindowFunc: smallint;
    OneOrMany: smallint;
    Smesh: Longint;
    SrednOrMap: smallint;
    Selected_A_Signal: smallint;
    Selected_B_Signal: smallint;
  end;

  TSourceRec = record
    PointAll, PointStart, PointEnd: longint;
    DateTimeStart: real;
    DeltX: real;
    RezType: byte;
    A0, A1, A2, A3: real;
    Seek_Start: longint;
    FileDatSource: string[255];
    FileDatDest: string[255];
    MaxY: real;
    MinY: real;
    KindCurve: byte;
    NAllCurveInPage: word;
    NameX, NameY: string[6];
    RazmX, RazmY: string[6];
    Eksp_nomer: longint;
    Eksp_Parent: longint;
    FName: string[255];
    TekPageName: string[20];
    TekColor: longint;
    Source_Caption: string[80];
    Auto: byte;
    Param: byte;
    CaseParam: byte;
    Theme_Eksp: string[30];
    Header_eksp: string[50];
    Author: string[20];
    App_Handle: THandle;
    Source_Handle: hWnd;
    StoragePath: string[255];
  end;
  TCrossWin_Rec = record
    PointAll, PointStart, PointEnd: longint;
    TextMinX, TextMaxX: string[20];
    DeltX: real;
    NAllCurveInPage: word;
    NVisibleCurve: word;
    NameX, RazmX: string[6];
    FName: string[255];
    TekPageName: string[20];
    Source_Caption: string[80];
    Theme_Eksp: string[30];
    Header_eksp: string[50];
    Author: string[20];
    StoragePath: string[255]
  end;

  TReturnRec = record
    ProcRez_Type: byte;
    TipFunc: word;
    PartAll: boolean;
    SelectSignal: smallint;
    Showresult: boolean;
    ShowWin: smallint;
    Nsignal: word;
    PageName: string[20];
    HeadWin: string[40];
    FName: string[255];
    Parent_Handle: hWnd;
  end;

  TAxisStr = string[5];
  TPrimech = array[1..NStrokPrimech] of string[WidthStrokPrimech];
  PrimechPtr = ^TPrimech;
  tFileNameStr = string[79];
  THeaderStr = string[40];
  tDateTimeRec_Gemis = record
    Year,
      Month,
      Day,
      DayOfWeek,
      Hour,
      Minute,
      Second,
      Sec100: word;
  end;

  TQuantRec = record
    a0, a1, a2, a3: double
  end;

  TSignalShapka = record
//    Signatura:longint;
    TipData: byte;
    Date_Eksp: TDatetime;
    TD: double; //шаг дискретизации, сек  или шаг по Х
    NPoints: longint;
    NChanalOriginal: byte;
    NChanal: byte;
    ChanOn: array[0..255] of byte; // не более 256 каналов
    Quants: array[0..255] of TQuantRec;
    ChanName: array[0..255] of string[7];
    FormatY: array[0..255] of string[5];
    typeofsignal: string[8];
    AxisX_Name: string[15];
    windowheader: string[30];
    E_stage: string[30];
    FormatX: string[15];
    XY_Mode: string[3];
    e_functime: char;
    e_name: string[45];
  end;

  tWavShapka = record
    RiffStr: array[0..3] of char;
    Razmer1: longint;
    WaveFmt: array[0..7] of char;
    PCM_Format: longint;
    Tip_Format: word;
    NChannels: word;
    NSamplesPerSec: longint;
    NAvgPerSec: longint;
    NBlockAlaign: word;
    BitsPerSample: word;
    DataStr: array[0..3] of char;
    Razmer2: longint;
  end;
  tWavShapka_Fact = record
    RiffStr: array[0..3] of char;
    Razmer1: longint;
    WaveFmt: array[0..7] of char;
    PCM_Format: longint;
    Tip_Format: word;
    NChannels: word;
    NSamplesPerSec: longint;
    NAvgPerSec: longint;
    NBlockAlaign: word;
    BitsPerSample: word;
    FactStr: array[0..3] of char;
    Razmer2: longint;
    R1: longint;
    DataStr: array[0..3] of char;
    R2: longint;
  end;
  tWavShapka_Fact_21 = record
    RiffStr: array[0..3] of char;
    Razmer1: longint;
    WaveFmt: array[0..7] of char;
    PCM_Format: longint;
    Tip_Format: word;
    NChannels: word;
    NSamplesPerSec: longint;
    NAvgPerSec: longint;
    NBlockAlaign: word;
    BitsPerSample: word;
    ppp: word;
    FactStr: array[0..3] of char;
    Razmer2: longint;
    R1: longint;
    DataStr: array[0..3] of char;
    R2: longint;
  end;


  TData = array of array of single;

  TChanRec = record
    NOMER: integer;
    HEADER: string[255];
    DELTX: DOUBLE;
    NAMEX: string[8];
    NAMEY: string[8];
    RAZMX: string[8];
    RAZMY: string[8];
    MULTX: DOUBLE;
    MULTY: DOUBLE;
    MAXX: DOUBLE;
    MAXY: DOUBLE;
    MINX: DOUBLE;
    MINY: DOUBLE;
    DateTime_START: tDATEtime;
    POINTALL: INTEGER;
    BMAXMINX: boolean;
    BMAXMINY: boolean;
    FILEDAT: string[255];
    SIGNALMEMO: string[255];
    SIGNAL_SELECTED: integer;
    FILE_SEEK: INTEGER;
  end;
  TChanArray = array of TChanRec;

  TGetInfo_Proc = procedure(
    Filename: TFilename; // исходный сигнал
    var SignalShapka: TSignalShapka //описание входного сигнала
{        var DataDouble_Source:TDataDouble;    // входной массив,
        var XData_Source:TDataXDouble;  // входной массив с описание оси абсцисс сигнала,
        var LCR_Dest:TSignalShapka;        //описание выходного сигнала
        var DataDouble_Dest:TDataDouble; //вsходной массив, создается и заполняется в ходе обработки
        var XData_Dest:TDataXDouble;// выходной массив с описание оси абсцисс сигнала, создается и заполняется в ходе обработки, в ответ на информацию о порядке обработки сисгнала (сколько кривых, с какой по какую точку и т.д.)
        var procDescr:string;            //описание выполненной обработки
        var ResultFile:TFileName   //выходной файл с результатом обработки
 }
    );

  TGetData_Proc = procedure(
    SourceFilename: TFilename; // исходный сигнал
    DestFilename: TFileName; // шаблон имени файла для данных по каналам
    SignalShapka: TSignalShapka; //описание входного сигнала
    var ChanArray: TChanArray //описание  данных по каналам
    );

  TSigTabRec = record
    RR1: real;
    Ky: real;
    FileDat: string[255];
    FileDat_abs: string[255];
    PointAll: longint;
    A0: real;
    A1: real;
    A2: real;
    A3: real;
    DeltX: real;
    RezType: byte;
    BMaxMinY: boolean;
    MaxY: real;
    MinY: real;
    DateTimeStart: real;
    Eksp_Nomer: longint;
    Seek_Start: longint;
    TotalMinX:real;
    TotalMaxX:real;
    TotalPointAll:integer;
  end;
  pSigTabRec = ^TSigTabRec;

//    TPolyArr = array[0..1505] of word;
  TPolyArr = array[0..1505] of word;
  pPolyArr = ^TPolyArr;

  TGetRezRec = record
    bSeek: boolean;
    Shag: byte;
    FileDat: TBufferedFile;
    Point: longint;
    A0, A1, A2, A3: real;
    RezType: byte;
    Rez: Real;
    seek_Start: longint;
  end;

   TExportRec = record
    FormatX,FormatY:string[80];
    bHeader,bNumber,bX_value:boolean;
    end;


function CoCreateGuid(out guid: TGUID): HResult; stdcall; external 'ole32.dll' name 'CoCreateGuid';
function GetGUIDStr: string;
function DosToWin(const Dos: string): string;
procedure GetRezFromFile_New(var GetRezRec: TGetRezRec);
procedure GetRezFromFile(FileDat: TBufferedFile; Point: longint; A0, A1, A2, A3: real; RezType: byte;
  var Rez: Real; var Status: integer; seek_start: longint);
Procedure GetSpectr(
          FileSource:TBufferedFile;
          VidFunc,WindowFunc:integer;AoForLog:double;
          PointStart:longint;PointFFT:word;
          A0,A1,A2,A3:real;RezType:word;
          BufRez:pDataReal;seek_start:longint);
Procedure GetSpectr_AB( FileSource_A,FileSource_B:TBufferedFile;
                     VidFunc,WindowFunc:integer;
                     PointStart:longint;PointFFT:word;
                     A0_A,A1_A,A2_A,A3_A:real;RezType_A:word;seek_start_A:longint;
                     A0_B,A1_B,A2_B,A3_B:real;RezType_B:word;seek_start_B:longint;
                     BufRez:pDataReal);

Function GetTimeName:shortstring;
procedure MakeTimeWindow(NumPoints : integer;
                     var XRea     : pDataReal;
                         Window    : byte);
Procedure MyDelay(Msec:integer);

var
  ViewNum: longint; {для передачи параметра при открытии ImageForm }
  FormatAll, FormatAfterPoint: word;
  BytesRead, BytesWrote: word;
  colorMap: array[0..1024] of longint;
  AudioParFile, AudioWavFile: string;
  PromFileName: string;
  SourceFileName, ReturnFileName: string;
  FiltrParFile, FuncParFile, SeismoParFile, ExportparFile, PackExportParFile,
    AB_ProcParFile, SpectrParFile: string;

implementation

uses config;

function GetGUIDStr: string;
var
  GUID: TGUID;
begin
  CoCreateGUID(GUID);
  Result := GuidToString(GUID);
end;

function DosToWin(const Dos: string): string;
const
  WinCode = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя';
  DosCode = #$80#$81#$82#$83#$84#$85#$86#$87#$88#$89#$8A#$8B#$8C#$8D#$8E#$8F +
    #$90#$91#$92#$93#$94#$95#$96#$97#$98#$99#$9A#$9B#$9C#$9D#$9E#$9F +
    #$A0#$A1#$A2#$A3#$A4#$A5#$A6#$A7#$A8#$A9#$AA#$AB#$AC#$AD#$AE#$AF +
    #$E0#$E1#$E2#$E3#$E4#$E5#$E6#$E7#$E8#$E9#$EA#$EB#$EC#$ED#$EE#$EF;

  function DecodeChar(Ch: Char): Char;
  var
    p, wp: PChar;
  begin
    wp := PChar(DosCode);
    p := AnsiStrRScan(wp, Ch);

    if p <> nil then
      Result := WinCode[p - wp + 1]
    else
      Result := Ch;
  end;

var
  i: Integer;
begin
  SetLength(Result, Length(Dos));
  for i := 1 to Length(Dos) do
    Result[i] := DecodeChar(Dos[i]);
end;

procedure GetRezFromFile_New(var GetRezRec: TGetRezRec);
var RezInteger: Integer; RezLI: Longint; RezSingle: Single;
begin
  RezInteger := 0; RezLI := 0; RezSingle := 0;
  with GetRezRec do
  begin
    if bSeek then FileDat.Seek(Seek_Start + (Point * Shag));
    Rez := 0;
    case RezType of
      cRealLong, cAnyChanal, cSeismoReal:
        begin
          FileDat.Read(RezSingle, Shag, BytesRead);
          Rez := A0 + RezSingle * A1;
        end;
      cAllData, cWordLong, cSeismoWord:
        begin
          FileDat.Read(RezInteger, Shag, BytesRead);
          Rez := A0 + RezInteger * A1; ;
        end;
      cAllData18, cLong18, cSeismoLInt:
        begin
          FileDat.Read(RezLI, Shag, BytesRead);
          Rez := A0 + RezLI * A1;
        end;
    end;
    if A2 <> 0 then Rez := Rez + Rez * Rez * A2;
    if A3 <> 0 then Rez := Rez + Rez * Rez * Rez * A3;
  end;
end;

procedure GetRezFromFile(FileDat: TBufferedFile; Point: longint; A0, A1, A2, A3: real; RezType: byte;
  var Rez: Real; var Status: integer; seek_start: longint);
var Shag: integer;
  RezInteger: Integer; RezLI: Longint; RezSingle: Single;
begin
  Shag := cSizeRez[RezType];
  FileDat.Seek(Seek_Start + (Point * Shag));
  RezInteger := 0; RezLI := 0; RezSingle := 0;
  Rez := 0;
  case RezType of
    cRealLong, cAnyChanal, cSeismoReal:
      begin
        FileDat.Read(RezSingle, Shag, BytesRead);
        Rez := A0 + RezSingle * A1;
      end;
    cAllData, cWordLong, cSeismoWord:
      begin
        FileDat.Read(RezInteger, Shag, BytesRead);
        Rez := A0 + RezInteger * A1; ;
      end;
    cAllData18, cLong18, cSeismoLInt:
      begin
        FileDat.Read(RezLI, Shag, BytesRead);
        Rez := A0 + RezLI * A1;
      end;
  end;
  if A2 <> 0 then Rez := Rez + Rez * Rez * A2;
  if A3 <> 0 then Rez := Rez + Rez * Rez * Rez * A3;
{   Rez:=PromRez;}
end;


Procedure GetSpectr( FileSource:TBufferedFile;
                     VidFunc,WindowFunc:integer;AoForLog:double;
                     PointStart:longint;PointFFT:word;
                     A0,A1,A2,A3:real;RezType:word;
                     BufRez:pDataReal;seek_start:longint);
var
 i,j:longint;rez:real;
 RealT,ImT:pDataReal;
 SignRe:pDataSignRe;
 Status:integer;
 ln10,ln10_20:double;
begin
  GetMem(RealT,SizeOf(single)*(PointFFT+2));
  GetMem(ImT,SizeOf(Single)*(PointFFT+2));
  GetMem(SignRe,SizeOf(byte)*(PointFFT div 8)+1);
  for i:=0 to PointFFT-1 do
     begin
      GetRezFromFile(FileSource,PointStart+i,A0,A1,A2,A3,RezType,Rez,Status,Seek_Start);
      RealT^[i]:=Rez;
      ImT^[i]:=0;
     end;
   for i:=0 to PointFFT div 8  do SignRe^[i]:=0;
   MakeTimeWindow(PointFFT,RealT,WindowFunc);
   application.ProcessMessages;
   BPF(PointFFT,false,RealT,ImT);
   case VidFunc of
    0: for i:=0 to (PointFFT div 2) -1   do BufRez^[i]:=BufRez^[i]+RealT^[i];
    1: for i:=0 to (PointFFT div 2) -1   do BufRez^[i]:=BufRez^[i]+ImT^[i];
    2: begin
        GetAmPhFromReIm(PointFFT,RealT,ImT,SignRe);
        for i:=0 to (PointFFT div 2) -1  do BufRez^[i]:=BufRez^[i]+RealT^[i];
       end;
    3: begin
        GetAmPhFromReIm(PointFFT,RealT,ImT,SignRe);
        for i:=0 to (PointFFT div 2) -1  do BufRez^[i]:=BufRez^[i]+ImT^[i];
       end;
    4: begin
        GetAmPhFromReIm(PointFFT,RealT,ImT,SignRe);
        ln10:=1/ln(10);
        for i:=0 to (PointFFT div 2) -1  do BufRez^[i]:=BufRez^[i]+Ln(1+RealT^[i]/AoForLog)*ln10;
       end;
    5: begin
        GetAmPhFromReIm(PointFFT,RealT,ImT,SignRe);
        ln10_20:=20/ln(10);
        for i:=0 to (PointFFT div 2) -1  do BufRez^[i]:=BufRez^[i]+Ln(1+RealT^[i]/AoForLog)*ln10_20;
       end;
     6,7:begin
          for i:=0 to PointFFT-1 do
          begin
           RealT^[i]:=RealT^[i]*RealT^[i]+ImT^[i]*ImT^[i];
           ImT^[i]:=0;
          end;
          BPF(PointFFT ,true,RealT,ImT);
          J:=(PointFFT div 2) -1;
          for i:=0 to j do RealT^[i]:=RealT^[i]/2;
          if VidFunc=7 then
           begin
            if RealT^[0]=0 then RealT^[0]:=1;
            for i:=
            1 to j do RealT^[i]:=RealT^[i]/RealT^[0];
            RealT^[0]:=1;
           end;
          for i:=0 to j   do BufRez^[i]:=BufRez^[i]+RealT^[i];
         end;
   end;
 FreeMem(RealT,SizeOf(Single)*(PointFFT+2));
 FreeMem(ImT,SizeOf(Single)*(PointFFT+2));
 FreeMem(SignRe,SizeOf(byte)*(PointFFT div 8)+1);
end;

Procedure GetSpectr_AB( FileSource_A,FileSource_B:TBufferedFile;
                     VidFunc,WindowFunc:integer;
                     PointStart:longint;PointFFT:word;
                     A0_A,A1_A,A2_A,A3_A:real;RezType_A:word;seek_start_A:longint;
                     A0_B,A1_B,A2_B,A3_B:real;RezType_B:word;seek_start_B:longint;
                     BufRez:pDataReal);
var
 i,j:longint;rez:real;
 RealT_A,RealT_B,ImT_A,ImT_B:pDataReal;
 SignRe:pDataSignRe;
 Status:integer;
 ln10,ln10_20:double;
 A_A,A_B:real;
begin
{-A-}
{  GetMem(SignRe,SizeOf(byte)*(PointFFT div 8)+1);}
  GetMem(RealT_A,SizeOf(single)*(PointFFT+2));
  GetMem(ImT_A,SizeOf(Single)*(PointFFT+2));
  for i:=0 to PointFFT-1 do
     begin
      GetRezFromFile(FileSource_A,PointStart+i,A0_A,A1_A,A2_A,A3_A,RezType_A,Rez,Status,Seek_Start_A);
      RealT_A^[i]:=Rez;
      ImT_A^[i]:=0;
     end;
{   for i:=0 to PointFFT div 8  do SignRe^[i]:=0;}
   MakeTimeWindow(PointFFT,RealT_A,WindowFunc);
   application.ProcessMessages;
   BPF(PointFFT,false,RealT_A,ImT_A);
{-B-}  GetMem(RealT_B,SizeOf(single)*(PointFFT+2));
  GetMem(ImT_B,SizeOf(Single)*(PointFFT+2));
  for i:=0 to PointFFT-1 do
     begin
      GetRezFromFile(FileSource_B,PointStart+i,A0_B,A1_B,A2_B,A3_B,RezType_B,Rez,Status,Seek_Start_B);
      RealT_B^[i]:=Rez;
      ImT_B^[i]:=0;
     end;
{   for i:=0 to PointFFT div 8  do SignRe^[i]:=0;}
   MakeTimeWindow(PointFFT,RealT_B,WindowFunc);
   application.ProcessMessages;
   BPF(PointFFT,false,RealT_B,ImT_B);
{Processing}
   case VidFunc of
    0: for i:=0 to (PointFFT div 2) -1   do
         BufRez^[i]:=BufRez^[i]+(RealT_A^[i]*RealT_B^[i]+ImT_A^[i]*ImT_B^[i]);
    1: for i:=0 to (PointFFT div 2) -1   do
        BufRez^[i]:=BufRez^[i]+(RealT_A^[i]*ImT_B^[i]-ImT_A^[i]*RealT_B^[i]);
    2: begin
        for i:=0 to (PointFFT div 2) -1  do BufRez^[i]:=BufRez^[i]+
         Amplituda(RealT_A^[i]*RealT_B^[i]+ImT_A^[i]*ImT_B^[i],
                   RealT_A^[i]*ImT_B^[i]-ImT_A^[i]*RealT_B^[i]) ;
       end;
    3: begin
        for i:=0 to (PointFFT div 2) -1  do
         begin
          A_A:=RealT_A^[i]*RealT_A^[i]+ImT_A^[i]*ImT_A^[i];
          A_B:=RealT_B^[i]*RealT_B^[i]+ImT_B^[i]*ImT_B^[i];
          if A_A*A_B<>0 then BufRez^[i]:=BufRez^[i]+
           sqrAmpl(RealT_A^[i]*RealT_B^[i]+ImT_A^[i]*ImT_B^[i],
                   RealT_A^[i]*ImT_B^[i]-ImT_A^[i]*RealT_B^[i])/(A_A*A_B)
                    else BufRez^[i]:=BufRez^[i];

          end;
       end;
     4:begin
          for i:=0 to PointFFT-1 do
          begin
           A_A:=RealT_A^[i]*RealT_B^[i]+ImT_A^[i]*ImT_B^[i];
           ImT_A^[i]:=RealT_A^[i]*ImT_B^[i]-ImT_A^[i]*RealT_B^[i];
           RealT_A^[i]:=A_A;
          end;
          BPF(PointFFT ,true,RealT_A,ImT_A);
          J:=(PointFFT div 2) -1;
          for i:=0 to j do RealT_A^[i]:=RealT_A^[i]/2;
          for i:=0 to j   do BufRez^[i]:=BufRez^[i]+RealT_A^[i];
         end;
   end;
 FreeMem(RealT_A,SizeOf(Single)*(PointFFT+2));
 FreeMem(ImT_A,SizeOf(Single)*(PointFFT+2));
 FreeMem(RealT_B,SizeOf(Single)*(PointFFT+2));
 FreeMem(ImT_B,SizeOf(Single)*(PointFFT+2));
{ FreeMem(SignRe,SizeOf(byte)*(PointFFT div 8)+1);}
end;

procedure HanningWindowFirstPart(NumPoints : integer;
                             var p         : pDataReal);
  var j: integer;
  begin
    for j:=0 to NumPoints-1 do p^[j]:=(1/2)*(1-cos(2*pi*j/NumPoints))*p^[j];
  end;

procedure Minimum4TermWindow(NumPoints : integer;
                             var p         : pDataReal);
  var j: integer;
  const A0=0.35875; A1=0.48829;A2=0.14128;A3=0.01168;
  begin
    for j:=0 to NumPoints-1 do p^[j]:=P^[j]*(A0-A1*sqr(Cos(pi*j/NumPoints))+
                                                A2*cos(4*pi*j/NumPoints)-
                                                A3*cos(6*pi*j/NumPoints));
  end;

procedure HanningWindowSecondPart(NumPoints : integer;
                              var p         : pDataReal);
  var j: integer;
  begin
   for j:=0 to NumPoints-1 do p^[j]:=p^[j]*sqrt(8/3);
  end;

procedure HammingWindow(NumPoints : integer;
                    var p         : pDataReal);
  var j: integer;
  begin
    for j:=0 to NumPoints-1 do p^[j]:=(0.54-0.46*cos(2*pi*j/NumPoints))*p^[j];
  end;

procedure KaiserBesselWindow(NumPoints : integer;
                         var p         : pDataReal);
  var j: integer;
  begin
    for j:=0 to NumPoints-1 do
      p^[j]:=p^[j] * (1 - 1.24*cos(2*pi*j/NumPoints)
                        + 0.244*cos(4*pi*j/NumPoints)
                        - 0.00305*cos(6*pi*j/NumPoints));
  end;

procedure FlatTopWindow(NumPoints : integer;
                    var p         : pDataReal);
  var j: integer;
  begin
    for j:=0 to NumPoints-1 do
      p^[j]:=p^[j] * (1 - 1.93*cos(2*pi*j/NumPoints)
                        + 1.29*cos(4*pi*j/NumPoints)
                        - 0.388*cos(6*pi*j/NumPoints)
                        + 0.0322*cos(8*pi*j/NumPoints));
  end;

procedure BlackmanHarrisWindow(NumPoints : integer;
                           var p         : pDataReal);
  var
    j: integer;
  begin
    for j:=0 to NumPoints-1 do
      p^[j]:=p^[j] * (0.42-0.5*cos(2*pi*j/NumPoints)
                          +0.8*cos(4*pi*j/NumPoints));
  end;

procedure BarlettWindow(NumPoints : integer;
                   var p         : pDataReal);
var j: integer;
begin
  for j:=0 to NumPoints div 2 - 1 do p^[j]:=p^[j]*(2*j/(NumPoints-1));
  for j:=NumPoints div 2 to NumPoints - 1 do p^[j]:=p^[j]*(2-2*j/(NumPoints-1));
end;

procedure TriangleWindow(NumPoints : integer;
                     var p         : pDataReal);
var j: integer;
begin
  for j:=0 to NumPoints div 2 - 1 do p^[j]:=p^[j]*(j+1)/NumPoints;
  for j:=NumPoints div 2 to NumPoints - 1 do p^[j]:=p^[j]*(NumPoints-j)/NumPoints;
end;

procedure MakeTimeWindow(NumPoints : integer;
                     var XRea     : pDataReal;
                         Window    : byte);
begin
      case Window of
        0: begin { Rectangular Window } end;
        1: HanningWindowFirstPart(NumPoints,XRea);
        2: HammingWindow(NumPoints,XRea);
        3: KaiserBesselWindow(NumPoints,XRea);
        4: FlatTopWindow(NumPoints,XRea);
        5: BlackmanHarrisWindow(NumPoints,XRea);
        6: BarlettWindow(NumPoints,XRea);
        7: TriangleWindow(NumPoints,XRea);
        8: Minimum4TermWindow(NumPoints,XRea);
      end;
end;

Function GetTimeName:shortstring;
var
     HS,MS,SS,DSS:string[2];
     H,M,S,DS:word;
begin
    DecodeTime(Time,H,M,S,DS);
    Str(H:1,HS);   if H<10 then HS:='0'+Hs;
    Str(M:1,MS);   if m<10 then MS:='0'+Ms;
    Str(S:1,SS);   if s<10 then sS:='0'+ss;
    Str(DS:1,DSS); if ds<10 then dss:='0'+dss;
    GetTimeName:=HS+MS+SS+DSS;
end;

Procedure MyDelay(Msec:integer);
 var
  i:integer;
begin
  for i:=0 to MSec do
   begin
    application.ProcessMessages;
    sleep(1);
   end;
end;


var
  i: word;
{ WindowsDir: String;
 FZashita:text;
 Zashita:string;}
// AliasMan2: TAliasManager;
  Mess_SS: string;
  p: pstring;
begin
  FormatAll := 6; FormatAfterPoint := 2;


 {задание имени файлов обмена данными с программой импорта }
// Imp_Exp_FileName:=GemisWin_Dat_Path+Imp_ExpDat_FileName_Const;
// Imp_Sig_FileName:=GemisWin_Dat_Path+Imp_SigDat_FileName_Const;

{  demo:=0;
  Demo:=strToInt(GemisIni.Values['Margin_all']);
 }
  for i := 0 to 256 do ColorMap[i] := 16711680 + i * 256;
  for i := 256 to 512 do ColorMap[i] := 16776960 - 65536 * (i - 256);
  for i := 512 to 768 do ColorMap[i] := 65280 + (i - 512);
  for i := 768 to 1024 do ColorMap[i] := 65535 - 256 * (i - 768);


//  for i:=1 to 16 do colors[i]:=AppConfig.IniFile.ReadInteger('Channel','Chanal_Color_'+intToStr(i),i);
//  for i:=1 to 16 do LineStyles[i]:=AppConfig.IniFile.ReadInteger('Channel','Chanal_Style_'+intToStr(i),i);
//  for i:=1 to 16 do LineWidth[i]:=AppConfig.IniFile.ReadInteger('Channel','Chanal_Width_'+intToStr(i),i);
//  for i:=1 to 16 do
//  if AppConfig.IniFile.ReadInteger('Channel','Chanal_Hide_'+intToStr(i),1) = 1 then  LineHide[i]:=true else LineHide[i]:=false;


{$IFDEF EXE}
// p:='wm_endProcessing_Gl_2004';
  wm_endProcessing_Gl_2004 := RegisterWindowMessage(pChar('wm_endProcessing_Gl_2004'));
// disposeStr(p);
{$ENDIF}

  SourceFileName := extractfilepath(application.exename) + SourceFileName_Const;
  ReturnFileName := extractfilepath(application.exename) + ReturnFileName_Const;

  FiltrParFile := extractfilepath(application.exename) + FiltrParFileName;
  FuncParFile := extractfilepath(application.exename) + FuncparFileName;
  SeismoParFile := extractfilepath(application.exename) + SeismoparFileName;
  SpectrParFile := extractfilepath(application.exename) + SpectrParFileName;
  AB_ProcParFile := extractfilepath(application.exename) + AB_ProcParFileName;
  ExportParFile := extractfilepath(application.exename) + ExportFileName;
  PackExportParFile := extractfilepath(application.exename) + ExportPackFileName;
  AudioParFile := extractfilepath(application.exename) + AudioParFileName;
  AudioWavFile := extractfilepath(application.exename) + AudioWavFileName;

(* p:=newstr('wm_ENDIMPORT_NO_Tabl_GL');
 wm_endImport_No_Tabl_Gl:=RegisterWindowMessage(pChar(p));
 disposeStr(p);
*)


(* p:=newstr('wm_ENDIMPORT_GL');
 wm_endImport_Gl:=RegisterWindowMessage(pChar(p));
 disposeStr(p);

 p:=newstr('wm_ENDMeasIMPORT_NO_Tabl_GL');
 wm_endMeasImport_No_Tabl_Gl:=RegisterWindowMessage(pChar(p));
 disposeStr(p);

 p:=newstr('wm_ENDMeasIMPORT_GL');
 wm_endMeasImport_Gl:=RegisterWindowMessage(pChar(p));
 disposeStr(p);

 p:=newstr('wm_ENDMeas_GL');
 wm_endMeas_Gl:=RegisterWindowMessage(pChar(p));
 disposeStr(p);

 p:=newstr('wm_setUserCursor_GL');
 wm_setUserCursor_GL:=RegisterWindowMessage(pChar(p));
 disposeStr(p);
*)

end.

