{$X+,N+,E+,L+,D+,O+,F+}
unit MDrv;

interface

uses
  windows, SysUtils, WinTypes, WinProcs, Messages, Classes{, filebuff};

{type shortstring = string;}
const
 Maska0: array[0..7] of byte = ($FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F);
 Maska1: array[0..7] of byte = ($01,$02,$04,$08,$10,$20,$40,$80);

 ErrNo  =0; { нет ошибок}
 ErrSave=-1; {ошибка при сохранении на диск}
 ErrLoad=-2; {ошибка при чтении с диска}
 ErrMem =1; {не хватает памяти }

 cRealLong = 0;   cWordLong = 1;    cADCLong = 2;
 cLong18 = 3;   cVoltMeterLong = 4;    cBasaLong      =5;
 cSeismoReal =6;  cSeismoWord =7;    cSeismoLInt =8;
 cWordLongLupa = 9;   CAllDynData18=10;  CAllDynData=11;
 CAllData18=12;   CAllData=13;  cMapData = 14;
 cAnyChanal =15;  CLCardData=16;


 cSizeRez: array[CRealLong..cLCardData] of byte =
    (SizeOf(Single),SizeOf(word),SizeOf(Word),
     SizeOf(LongInt), SizeOf(Single),SizeOf(Single),
     SizeOf(Single), SizeOf(Word),SizeOf(LongInt),
     SizeOf(Word), SizeOf(LongInt),SizeOf(Word),
     SizeOf(LongInt),SizeOf(Word),SizeOf(Single),
     SizeOf(Single),SizeOf(Single));

 cbFirst=true;cbLast=true;cbNotFirst=false;cbNotLast=false;
  cmRealT = 106; RealT = 0;  cTimeWrong = 0;
  cmRealF = 107; RealF = 4;  cTimeREIM  = 1;
  cmImgT  = 108; ImgT =  1;  cTimeAmph   = 2;
  cmImgF  = 109; ImgF =  5;  cFreqWrong = 0;
  cmAmT   = 110; AmT  =  2;  cFreqREIM  = 1;
  cmAmF   = 111; AmF  =  6;  cFreqAmph   = 2;
  cmPhT   = 112; PhT  =  3;
  cmPhF   = 113; PhF  =  7;


{$IFDEF DEBUGVERS}
 PointMax=256;  wnPointMax :word  = PointMax ;
{$ENDIF}
{$IFNDEF DEBUGVERS}
 PointMax=8192;  wnPointMax :word  = PointMax ;
{$ENDIF}
 PointMaxPoly = 32000;  { не уменьшать! }
 wnPointMin :word  = 16;
 NStrokPrimech=10;
 WidthStrokPrimech=60;
{$IFDEF LCARD}
 SizeBufferDef =128;
{$ENDIF}
{$IFNDEF LCARD}
 SizeBufferDef =512;
{$ENDIF}
 MaxWin = 16;
  MaxX = 250;MaxY = 185+20;
  LowMemSize: word = (PointMax*2) div 16;

  cMaxChanal     = 12;(*4*)
  cMaxDynChan    = 4{16;   для LCard-seismo};
  cMaxDynChanal  = 4;
  cMaxLupaChanal = 4;

  MaxNumGraph = 16;


type
 PathStr = string[80];
 tText20 = string[20];
 DataReal=array[0..PointMax] of single;
 PDataReal=^DataReal;
 DataWord=array[0..PointMax] of smallint;
 PDataWord=^DataWord;
 DataW=array[-1024..0] of smallint;
 PDataW=^DataW;
 DataSignRe=array[0..(PointMax div 8)] of byte;
 PDataSignRe=^DataSignRe;
 DataByte = array[0..PointMax] of Byte;
 pDataByte = ^DataByte;
 DataPoly=array[0..PointMaxPoly] of smallint;
 PDataPoly=^DataPoly;
 TBuffer=array[0..SizeBufferDef-1] of smallint;
 PBuffer=^TBuffer;
 DataLInt=array[0..PointMax] of LongInt;
 PDataLInt=^DataLInt;
 TBufferLInt=array[0..SizeBufferDef-1] of LongInt;
 PBufferLInt=^TBufferLInt;
 TBufferReal=array[0..SizeBufferDef-1] of single;
 PBufferReal=^TBufferReal;
 TAxisStr= string[5];
 THeaderStr= string[40];
 TPrimech= array[1..NStrokPrimech] of string[WidthStrokPrimech];
 PrimechPtr=^TPrimech;
 tFileNameStr = string[79];


 TStatRec = record
   bStatMax:boolean;
   rStatMax:real;
   bStatMin:boolean;
   rStatMin:real;
   bStatMx:boolean;
   rStatMx:real;
   bStatDx:boolean;
   rStatDx:real;
   NUsr:longint;
   bTekPar:boolean;
  end;

 tDateTimeRec = record
  Year,
  Month,
  Day,
  DayOfWeek,
  Hour,
  Minute,
  Second,
  Sec100: word;
  end;


 TSignalShapka=record
   wNPoint:word;  {число отсчетов в каждом массиве}
   pRet,pImt,pReF,pImF: PDataReal; {указатели на массивы}
   pTekArray:pDataReal;
   pSignRe:pDataSignRe;
   DeltX:single;
   whatInf,whatInT:byte;
   rClock:single;        {частота дискретизации Гц}
   bRealSignal: boolean; {мнимая часть во временной области =0 ==> true}
   byHowProcess:word; { какие данные лежат в pRe^ и pIm^  }
   scAxisX,scAxisY:TAxisStr;  {обозначение осей}
   ScFile:TFileNameStr;
   scHeader: THeaderStr;
   First,Last:word;
   rMaxX,rMinX,rMaxY,rMinY:single; { максимальные значения в массивах DataReal и по оси X }
   fText:tFileNameStr;
   pPrimech: PrimechPtr;
  end;
 PSignalShapka=^TSignalShapka;

 TPolyShapka=record
   wNPoint:word;  {число отсчетов в каждом массиве}
   pPolyX,pPolyY: PDataPoly; {указатели на массивы}
  end;
 PPolyShapka=^TPolyShapka;

 TLongShapka=record
   bMaxMinExistAll,bMaxMinExist: boolean;
   rMaxX,rMinX,rMaxY,rMinY:single;
   ActChanal:byte;  { активный канал -    нумерация от 0}
   NChanal:byte;  { сколько всего каналов. Для одноканального - 1, для 2-х каналов - 2  и т.д. }
   lPointStart,lPointEnd,lPointAll:longInt;
   rTimeStart:single;
   shTimeFormat:shortint;
   rClock:single;        {частота дискретизации Гц}
   bCreated:boolean;
   scAxisX,scAxisY:TAxisStr;  {обозначение осей}
   ScFile:TFileNameStr;
   TipData:byte;
   LADC:longint;
   MaxRez:single;
   scHeader: THeaderStr;
   AbsTime:tDateTimeRec;
   fText:tFileNameStr;
   pPrimech: PrimechPtr;
  end;

 PData=^TData;
 TData= class(TObject)     {абстрактный обьект - прародитель объектов данных}
    lSizeData:longint;  { Размер обьекта и всех его данных в памяти }
     StatRec:TStatRec;
     bChange:boolean;
     constructor Init(Size:longint);
     Function GetSize:longint;
     Procedure FreeHeap; virtual;
     function GetHeap:boolean;  virtual;
     Function SaveToDisk:boolean;virtual;
     Function SaveToFile:boolean;virtual;
     Function Save_Free:boolean;virtual;
     Function Copy(FnameSource,FNameDest:shortstring;Portion:word):boolean; virtual;
     Function AddToCopy(FnameSource,FNameDest:shortstring;EndP,LastP:longint;Portion:word):boolean; virtual;
     Function GetStatMax:boolean;virtual;
     Function GetStatMin:boolean;virtual;
     Function GetStatMx:boolean;virtual;
     Function GetStatDx:boolean;virtual;
     Procedure GetTekMxDX(Rez:real); virtual;
     Procedure GetTekPar(Rez:real); virtual;
     Function GetData(Point:longint;var Rez:real):boolean; virtual;
     Function GetNPoint:longInt; virtual;
     Function GetPointStart:longInt; virtual;
     Function GetPointEnd:longInt; virtual;
     procedure GetMaxVal;virtual;  { устанавливает максимальные значения в шапке сигнала }
     Function GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean; virtual;
     Function FindMaxMin(var Max,Min:real;var NumMax,NumMin:longint):boolean; virtual;
     Procedure GetSignalSettings; virtual;
{     Function SetData(Point:longint;Rez:real):boolean; virtual;}
     Function AddTable(FITab:TFileStream;Format:byte):boolean; virtual;
     Function NextString(Point:longint;Format:byte):shortstring; virtual;
     Function GetShapka(Format:byte):shortstring; virtual;

     Function GetClock(Format:byte):shortstring; virtual;
     Function GetFreq:real; virtual;
     function GetNChan:byte; virtual;
     Function GetDataChan(Point:longint; Chan:byte; var Rez:real):boolean; virtual;

     Destructor Done; virtual;
   end;

  PSignalData=^TSignalData;        {объект для SignalWin}
   TSignalData=class(TData)
     Shapka:TSignalShapka;
     constructor InitFromMemory(PToParents:PSignalData);
     constructor InitFromDisk(Fname:TFileNameStr);
     Procedure FreeHeap; virtual;
     function GetHeap: boolean;  virtual;
     Function SaveToDisk:boolean;virtual;
     Function Save(FName:shortstring):boolean;virtual;
     Function Save_Free:boolean;virtual;
     Function SaveToFile:boolean;virtual;
     Function GetNPoint:longInt; virtual;
     Function GetPointStart:longInt; virtual;
     Function GetPointEnd:longInt; virtual;
     Function GetData(Point:longint;var Rez:real):boolean;Virtual;
     Function GetValY(var Xm,Ym:real;var Point:Word):boolean;virtual;
     Function GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean; virtual;
     Function FindMaxMin(var Max,Min:real;var NumMax,NumMin:longint):boolean; virtual;
     procedure GetMaxVal;virtual;  { устанавливает максимальные значения в шапке сигнала }
     function SetFirstLast(X1,X2,Y1,Y2:real):boolean;virtual;
     Procedure GetSignalSettings; virtual;
{     Function SetData(Point:longint;Rez:real):boolean; virtual;}
     Function GetShapka(Format:byte):shortstring; virtual;
     Function GetClock(Format:byte):shortstring; virtual;
     Function GetFreq:real; virtual;
     Function NextString(Point:longint;Format:byte):shortstring; virtual;
     Destructor Done; virtual;
   end;

   PPolyData=^TPolyData;
   TPolyData=class(TData)                 {объект для отображения кривых}
     Shapka:TPolyShapka;
     constructor Init(NPoint:LongInt);
     Procedure FreeHeap; virtual;
     function GetHeap: boolean;  virtual;
     Function SaveToDisk:boolean;virtual;
     Function SaveToFile:boolean;virtual;
     Function Save_Free:boolean;virtual;
     Destructor Done; virtual;
   end;

  PLongData=^TLongData;        {объект для LongWin}
   TLongData=class(TData)
     Shapka:TLongShapka;
     Fi,FiR:TFileStream;
     BufferADCStart,BufferADCHalf:Pointer;
     SigmaKod:real;
     bProcessParty:boolean;
     constructor InitFirst(Fname:TFileNameStr);
     constructor InitSecond(Fname:TFileNameStr;Point1,Point2:longint);
     Constructor InitForSeismo(Fname:TFileNameStr;Point1:LongInt);
     Procedure FreeHeap; virtual;
     function GetHeap: boolean;  virtual;
     Function SaveToDisk:boolean;virtual;
     Function Save(FName:shortstring):boolean;virtual;
     Function SaveShapka(Fname:TFileNameStr):boolean;
     Function Save_Free:boolean;virtual;
     Function SaveToFile:boolean;virtual;
     Function SetMaxMin:boolean;virtual;
     Function FindMaxMin(var Max,Min:real;var NumMax,NumMin:longint):boolean; virtual;
     Function GetValY(var Xm,Ym:real;var Point:Longint):boolean;virtual;
     Function WriteDataFromBuf(PointBegin:longint;BufPtr:Pointer):boolean;virtual;
     Function GetDataFromBuf(Point:longint;BufPtr:Pointer):real;virtual;
     Function GetNPoint:longInt; virtual;
     Function GetPointStart:longInt; virtual;
     Function GetPointEnd:longInt; virtual;
     Procedure GetMaxVal; virtual;
     Function SetMaxMinAll:boolean; virtual;
     Destructor Done; virtual;
     Function GetShapka(Format:byte):shortstring; virtual;

     Function GetClock(Format:byte):shortstring; virtual;
     Function GetFreq:real; virtual;
     function GetNChan:byte; virtual;
     Function GetDataChan(Point:longint; Chan:byte; var Rez:real):boolean; virtual;

     Function NextString(Point:longint;Format:byte):shortstring; virtual;
     Function SaveMaxMin:boolean;
     Function AddToCopy(FnameSource,FNameDest:shortstring;EndP,LastP:longint;Portion:word):boolean; virtual;
     Function CopyAll(FnameSource,FNameDest:shortstring;Portion:word):boolean; virtual;
   end;

  PLongDataReal=^TLongDataReal;        {объект для LongWin    Данные на диске типа Real}
  TLongDataReal=class(TLongData)
     constructor InitFirst(Fname:TFileNameStr);
     Function GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean; virtual;
     Function GetData(Point:longint;var Rez:real):boolean;Virtual;
{     Function SetData(Point:longint;Rez:real):boolean; virtual;}
   end;

  PLongDataWord=^TLongDataWord;        {объект для LongWin    Данные на диске типа smallint}
   TLongDataWord=class(TLongData)
     constructor InitFirst(Fname:TFileNameStr);
     Function GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean; virtual;
     Function GetData(Point:longint;var Rez:real):boolean;Virtual;
{     Function SetData(Point:longint;Rez:real):boolean; virtual;}
   end;

  PLongDataLInt=^TLongDataLInt;        {объект для LongWin    Данные на диске типа smallint}
   TLongDataLInt=class(TLongData)
     constructor InitFirst(Fname:TFileNameStr);
     Function GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean; virtual;
     Function GetData(Point:longint;var Rez:real):boolean;Virtual;
{     Function SetData(Point:longint;Rez:real):boolean; virtual;}
   end;

  PLongDataADC=^TLongDataADC;        {объект для LongWin  данные на диске типа smallint}
   TLongDataADC=class(TLongData)
     constructor InitFirst(Fname:TFileNameStr;LadcIni:longint;MaxRezIni:real;rClockIni:real);
     Function GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean; virtual;
{     Function SetData(Point:longint;Rez:real):boolean; virtual;}
     Function WriteDataFromBuf(PointBegin:longint;BufPtr:Pointer):boolean;virtual;
     Function GetDataFromBuf(Point:longint;BufPtr:Pointer):real;virtual;
     Function GetData(Point:longint;var Rez:real):boolean;Virtual;
     Destructor Done; Virtual;
   end;

  PLongDataADC18=^TLongDataADC18;        {объект для LongWin  данные на диске типа LongInt}
  TLongDataADC18=class(TLongData)
     constructor InitFirst(Fname:TFileNameStr;LadcIni:longint;MaxRezIni:real;rClockIni:real);
     Function GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean; virtual;
{     Function SetData(Point:longint;Rez:real):boolean; virtual;}
     Function WriteDataFromBuf(PointBegin:longint;BufPtr:Pointer):boolean;virtual;
     Function GetDataFromBuf(Point:longint;BufPtr:Pointer):real;virtual;
     Function GetData(Point:longint;var Rez:real):boolean;Virtual;
     Destructor Done; Virtual;
   end;

type

  TChanalInfoRec = record
      NameChanal:string[5];
      RazmChan: string[5];
      YMax:single;
      YMin:single;
      VidOtobr:byte;
      NomInPoly:byte;
     end;

  TChanalInfoArray= array[0..255] of TChanalInfoRec;

  PAnyChanalData=^TAnyChanalData;        {объект для AnyChanWin    Данные на диске типа Real}
  TAnyChanalData=class(TLongDataReal)
     ChanalInfo: ^TChanalInfoArray;  {лежит в конце файла}
     constructor InitFirst(Fname:TFileNameStr);
     constructor InitSecond(Fname:TFileNameStr;Point1,Point2:longint);
     Constructor InitForSeismo(Fname:TFileNameStr;Point1:LongInt);
     Function GetChanalInfo:boolean; virtual;
     function GetHeap: boolean;  virtual;
     Function LoadToHeap:boolean;virtual;
     Function Save(FName:shortstring):boolean;virtual;
     Function SetMaxMin:boolean;virtual;
     Procedure GetMaxVal; virtual;
     Function SetMaxMinAll:boolean; virtual;
     Destructor Done; virtual;
{     Function Nextshortstring(Point:longint;Format:byte):shortstring; virtual;}
   end;

  TLongNumArr=array[1..cMaxDynChan] of word;
  TLongDataArr=array[1..cMaxDynChan] of pLongData;

  TMaxRezArrayAll = array [0..cMaxDynChan] of single;  {cMaxDynChan для получения адреса для DataAll}
  pMaxRezArrayAll = ^TMaxRezArrayAll;


   TMaxRezArray = array [0..cMaxLupaChanal-1] of single;
   pMaxRezArray = ^TMaxRezArray;

  TDataAll = array [0..cMaxDynChan-1] of pLongData;
  TBufNameAll = array [0..cMaxDynChan-1] of TFileNameStr;
  TFiArray=array[1..cMaxDynChan] of TFileStream;

  PAllData18=^TAllData18;        {объект для LongWin    Данные на диске типа longInteg}
  TAllData18=class(TLongData)
    MaxRezArrAll:pMaxRezArrayAll;
    DataAll:^TDataAll;
    FiAll:TFiArray;
    BufNameAll:^TBufNameAll;
     constructor InitFirst(Fname:TFileNameStr);
     Procedure GetName(i:word);
     Destructor Done; virtual;
   end;

  PAllData=^TAllData;        {объект для LongWin    Данные на диске типа smallint}
  TAllData=class(TAllData18)
     constructor InitFirst(Fname:TFileNameStr);
   end;

(*  PFuncColl=^TFuncColl;
  TFuncColl=class(TCollection)
    Procedure FreeItem(Item:Pointer);virtual;
   end;
*)
var
 SizeBuffer,SizeBufWrite,MSize : word;
 Rad,Grad:real;

procedure  BPF (NN:smallint;IN1:boolean;var  X101,X201 : pDATAReal );
                {NN-число точек  IN1=false - FFT  IN1=true - inverse FFT }
Function Fasa(RS:real;ImageS:real):real;
Function Amplituda(RS,ImageS:real):real;
Function SQRAmpl(RS,ImageS:real):real;
Procedure GetReImFromAmPh(N:word;Re,Im:pDataReal;SignRe:pDataSignRe);
Procedure GetAmPhFromReIm(N:word;Re,Im:pDataReal;SignRe:pDataSignRe);

Procedure GetAbsTime(var AbsTime:tDateTimeRec);
Function GetAbsTimeStr(AbsTime:tDateTimeRec):shortstring;
procedure GetAbsTimeFromSec(var AbsTime:tDateTimeRec;SecGlob:real);
Function maxAvail:longint;
Function memAvail:longint;

implementation
(*
procedure EmptyInterrupt(Flags, CS, IP, AX, BX, CX, DX, SI, DI, DS, ES, BP: Word);
interrupt;
begin
end;    { EmptyInterrupt }
*)
 Function maxAvail:longint;
 begin
  Maxavail:=GetFreeSpace(0) ;
 end;
 Function memAvail:longint;
 begin
  Memavail:=GetFreeSpace(0) ;
 end;
 
 procedure  BPF (NN:smallint;IN1:boolean;VAR  X101,X201 : pDATAReal);
   LABEL
       60,65,55,75,76;
   VAR
        SI,NX,NX201,M,MX,JBPF1,JBPF2,IR,IT,ITT,N2,N1,JBPF,KBPF : smallint;
        WP,ARG,W1,W2,T1,T2 : REAL;
        I:smallint;
   BEGIN
   for i:=NN-1 downto 0 do
    begin
     X101^[i+1]:=X101^[i];X201^[i+1]:=X201^[i];
    end;
   IT:=0;    IR:=NN DIV 2;
   WHILE (IR<>0) DO
       BEGIN IT:=IT+1; IR:=IR DIV 2;     END;
   IF IN1 THEN begin X101^[1]:=X101^[1]*2;SI:=-1 end
                 else si:=1;
(*   IF IN1 THEN SI:=-1 else si:=1;*)
   NX201:=NN;
   FOR ITT:=1 TO IT DO
     BEGIN
      NX:=NX201;
      NX201:=NX DIV 2;
      WP:=PI/NX201;
      FOR M:=1 TO NX201 DO
       BEGIN
        ARG:=(M-1)*WP;
        W1:=COS(ARG);
        W2:=SI*SIN(ARG);
        MX:=NX;
        REPEAT
         JBPF1:=MX-NX+M;
         JBPF2:=JBPF1+NX201;
         T1:=X101^[JBPF1]-X101^[JBPF2];
         T2:=X201^[JBPF1]-X201^[JBPF2];
         X101^[JBPF1]:=X101^[JBPF1]+X101^[JBPF2];
         X201^[JBPF1]:=X201^[JBPF1]+X201^[JBPF2];
         X101^[JBPF2]:=T1*W1-T2*W2;
         X201^[JBPF2]:=T1*W2+W1*T2;         MX:=MX+NX;
        UNTIL (MX > NN);
       END;
      END;
      N2:=NN DIV 2;      N1:=NN-1;      JBPF:=1;
      FOR I:=1 TO N1 DO
       BEGIN
        IF (I>=JBPF) THEN GOTO 55;
        T1:=X101^[JBPF]; T2:=X201^[JBPF]; X101^[JBPF]:=X101^[I]; X201^[JBPF]:=X201^[I]; X101^[I]:=T1;  X201^[I]:=T2;
        55:KBPF:=NN DIV 2;
        60:IF (KBPF>=JBPF) THEN GOTO  65;
        JBPF:=JBPF-KBPF;         KBPF:=KBPF DIV 2;         GOTO 60;
        65: JBPF:=JBPF+KBPF;
       END;

(*       IF IN1 THEN GOTO 75;
        FOR I:=1 TO NN DO
         BEGIN  X101^[I]:=X101^[I]/NN; X201^[I]:=X201^[I]/NN;   END;
      75: BEGIN
           FOR I:=2 TO NN DO
            BEGIN  X101^[I]:=X101^[I]*2; X201^[I]:=X201^[I]*2;   END;
          END;
  *)
       IF not IN1 THEN
      Begin;
        FOR I:=1 TO NN DO
         BEGIN  X101^[I]:=X101^[I]/NN; X201^[I]:=X201^[I]/NN;   END;
      75: BEGIN
           FOR I:=2 TO NN DO
            BEGIN  X101^[I]:=X101^[I]*2; X201^[I]:=X201^[I]*2;   END;
          END;
       end
        else
         begin
              FOR I:=1 TO NN DO
               BEGIN  X101^[I]:=X101^[I]/2; X201^[I]:=X201^[I]/2;   END;
         end;

      for i:=0 to NN-1 do
       begin
        X101^[i]:=X101^[i+1];X201^[i]:=X201^[i+1];
       end;

      END;

Function Fasa(RS,ImageS:real):real;
var Faza:real;
begin
   if RS <>0 then
     begin
         Faza:=Arctan(abs(ImageS /RS ))*180/Pi;
         if ImageS >0 then
           begin
            if RS <0 then Faza:=180-abs(Faza);
           end;
         if ImageS <0 then
           begin
            if RS >0 then Faza:=-abs(Faza)
              else Faza:=-(180-abs(Faza));
           end;
     end
     else begin
	   if ImageS <0 then Faza:=-90;
	   if ImageS >0 then Faza:=90;
           if ImageS=0 then Faza:=0;
	  end;
 Fasa:=Faza;
end;

Function Amplituda(RS,ImageS:real):real;
begin
 Amplituda:=sqrt(RS*RS+ImageS*ImageS);
end;
Function SQRAmpl(RS,ImageS:real):real;
begin
 sqrAmpl:=(RS*RS+ImageS*ImageS);
end;

Procedure GetReImFromAmPh(N:word;Re,Im:pDataReal;SignRe:pDataSignRe);
  var
   Prom:real;i:word;
  begin
   for i:=0 to N-1 do
    begin
     Prom:=abs(Re^[i]*cos(Im^[i]*Rad));
     Im^[i]:=Re^[i]*sin(Im^[i]*Rad);
     if ((SignRe^[i div 8] and Maska1[i mod 8] ) >0)  then Re^[i]:=Prom
       else  Re^[i]:=-Prom;
    end;
  end;

Procedure GetAmPhFromReIm(N:word;Re,Im:pDataReal;SignRe:pDataSignRe);
  var
   Prom:real;i:word;
  begin
   for i:=0 to N-1 do
    begin
     Prom:=Amplituda(Re^[i],Im^[i]);
     if Re^[i]>0 then SignRe^[i div 8]:=SignRe^[i div 8] or Maska1[i mod 8]
          else SignRe^[i div 8]:=SignRe^[i div 8] and Maska0[i mod 8];
     Im^[i]:=Fasa(Re^[i],Im^[i]);
     Re^[i]:=Prom;
    end;
  end;




{--------------------------------------------------------------------}
{ Методы объекта TData                                               }
{----------абстрактный объект для порождения потомков----------------}
Constructor TData.Init(Size:LongInt);
 begin
  lSizeData:=Size;
  bChange:=false;
  StatRec.bStatMax:=false;
  StatRec.bStatMin:=false;
  StatRec.bStatMx:=false;
  StatRec.bStatDx:=false;
  StatRec.NUsr:=0;
  StatRec.bTekpar:=false;
 end;
Function TData.GetSize:longint;
begin
 GetSize:=lSizeData;
end;
Procedure TData.FreeHeap;
 begin
 end;
function TData.GetHeap:boolean;
 begin
 end;
Function TData.SaveToDisk:boolean;
 begin
 end;
Function TData.SaveToFile:boolean;
 begin
 end;
Function TData.Save_Free:boolean;
 begin
 end;

function TData.Copy(FnameSource,FNameDest:shortstring;Portion:word):boolean;
var
  Copy1,Copy2:TFileStream;
  J,MSize1,MSize2:word;
begin
  Copy:=false;
  Copy1:=TFileStream.Create(FNameSource,fmOpenRead+fmShareDenyNone);
  Copy2:=TFileStream.Create(FNameDest, fmCreate);
  Copy2.CopyFrom(Copy1,Copy1.Size);
  Copy:=True;
  Copy2.Destroy;
  Copy1.Destroy;
end;   { Copy }

Function TData.AddToCopy(FnameSource,FNameDest:shortstring;EndP,LastP:longint;Portion:word):boolean;
begin
end;   { AddToCopy }

Function TData.GetData(Point:longint;var Rez:real):boolean;
 begin
 end;

{Function TData.SetData(Point:longint;Rez:real):boolean;
 begin
 end;
 }
Function TData.GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean;
begin
end;

Function TData.FindMaxMin(var Max,Min:real;var NumMax,NumMin:longint):boolean;
begin
end;

Function TData.GetNPoint:longInt;
  begin
  end;
Function TData.GetPointStart:longInt;
  begin
  end;
Function TData.GetPointEnd:longInt;
  begin
  end;

Procedure TData.GetSignalSettings;
 begin
 end;


Procedure TData.GetMaxVal;
 begin
 end;

Function TData.GetStatMax:boolean;
 var Max,Min:real;var NumMax,NumMin:longint;
 begin
  if StatRec.bStatMax then begin GetStatMax:=true;exit;end;
  StatRec.bStatMax:=false;
  GetStatMax:=FindMaxMin(max,Min,NumMax,NumMin);
 end;

Function TData.GetStatMin:boolean;
 var Max,Min:real;var NumMax,NumMin:longint;
 begin
  if StatRec.bStatMin then begin GetStatMin:=true;exit;end;
  StatRec.bStatMin:=false;
  GetStatMin:=FindMaxMin(max,Min,NumMax,NumMin);
 end;

Function TData.GetStatMx:boolean;
 var Max,Min:real;var NumMax,NumMin:longint;
 begin
  if StatRec.bStatMx then begin GetStatMx:=true;exit;end;
  StatRec.bStatMx:=false;
  GetStatMx:=FindMaxMin(max,Min,NumMax,NumMin);
 end;

Function TData.GetStatDx:boolean;
 var i,i1,i2:longint;Rez:real;Sum:real;
begin
   StatRec.NUsr:=GetNPoint;
   if StatRec.bStatDx then begin GetStatDx:=true;exit;end;
   StatRec.bStatDx:=false;
   GetStatDx:=false;
   if not GetStatMX then exit;
   i1:=GetPointStart;i2:=GetPointEnd;Sum:=0;
   for i:=i1 to i2 do
    begin
     if not GetData(i,Rez) then exit;
     Sum:=Sum+sqr(Rez-StatRec.rStatMx);
    end;
   if i1<>i2 then StatRec.rStatDX:=Sum/(i2-i1) else StatRec.rStatDx:=Sum;
   StatRec.bStatDx:=True;
 end;

Procedure TData.GetTekPar(Rez:real);
 begin
 end;

Procedure TData.GetTekMxDX(Rez:real);
 begin
      with StatRec do
           begin
            inc(NUsr);
            rStatMx:=rStatMx/NUsr*(NUsr-1)+Rez/NUsr;
            if NUsr=1 then rStatDx:=0
             else rStatDx:=rStatDx/(NUsr-1)*(NUsr-2)+sqr(Rez-rStatMx)/(NUsr-1);
          end;
 end;

Function TData.Nextstring(Point:longint;Format:byte):shortstring;
begin
end;

Function TData.GetShapka(Format:byte):shortstring;
begin
end;

Function TData.GetClock(Format:byte):shortstring;
begin
end;

Function TData.GetFreq:real;
begin
end;

Function TData.GetNChan:byte;
begin
  GetNChan:=1;     { У всех, кроме TLongData, один канал //ГБ }
end;

Function TData.GetDataChan(Point:longint; Chan:byte; var Rez:real):boolean;
 begin
   GetDataChan:=GetData(Point,Rez);
 end;

Function TData.AddTable(FITab:TFileStream;Format:byte):boolean;
var i:longint; Stroka:shortstring; Stroka1:shortstring;
begin
 Stroka:=GetClock(Format)+chr(13)+chr(10);
 if Stroka<>chr(10)+chr(13) then FITab.Write(Stroka[1],Length(Stroka));
 Stroka:=GetShapka(Format)+chr(13)+chr(10);
 FITab.Write(Stroka[1],Length(Stroka));
 for i:=GetPointStart to GetPointEnd do
  begin
   Stroka1:=Nextstring(i,Format)+chr(13)+chr(10);
   FiTab.Write(Stroka1[1],Length(Stroka1));
  end;
end;

Destructor TData.Done;
 begin
 end;

{--------------------------------------------------------------------}
{ Методы объекта TSignalData                                         }
{---------- объект для получения данных для СИГНАЛа  ----------------}

Constructor TSignalData.InitFromMemory(PToParents:PSignalData);
 begin
    TData.Init(SizeOf(TPrimech)+(longint(pToParents^.Shapka.wNPoint)+2)*SizeOf(Single)*4+
                    (pToParents^.Shapka.wNPoint div 8) );
    Shapka:=pToParents^.Shapka;
    if not GetHeap then fail;
    Shapka.pPrimech^:=pToParents^.Shapka.pPrimech^;
    move(pToParents^.Shapka.pImt^,Shapka.pImt^,pToParents^.Shapka.wNPoint*SizeOf(Single));
    move(pToParents^.Shapka.pRet^,Shapka.pRet^,pToParents^.Shapka.wNPoint*SizeOf(Single));
    move(pToParents^.Shapka.pImf^,Shapka.pImf^,pToParents^.Shapka.wNPoint*SizeOf(Single));
    move(pToParents^.Shapka.pRef^,Shapka.pRef^,pToParents^.Shapka.wNPoint*SizeOf(Single));
    move(pToParents^.Shapka.pSignRe^,Shapka.pSignRe^,pToParents^.Shapka.wNPoint div 8);
 end;

Constructor TSignalData.InitFromDisk(Fname:TFileNameStr);
 var
     Fi:TFileStream;
 begin
    Fi:=tFileStream.Create(FName,fmOpenRead+fmShareDenyNone);
    if Fi=nil then fail;
    Fi.read(Shapka,SizeOf(TSignalShapka));
    if not GetHeap then begin Fi.destroy;fail;end;
    Fi.read(Shapka.pPrimech^,SizeOf(TPrimech));
    Fi.read(Shapka.pRet^,Shapka.wNPoint*SizeOf(Single));
    Fi.read(Shapka.pImt^,Shapka.wNPoint*SizeOf(Single));
    Fi.read(Shapka.pRef^,Shapka.wNPoint*SizeOf(Single));
    Fi.read(Shapka.pImf^,Shapka.wNPoint*SizeOf(Single));
    Fi.read(Shapka.pSignRe^,Shapka.wNPoint div 8);
    Shapka.ScFile:=FName;
    TData.Init(SizeOf(TPrimech)+(longint(Shapka.wNPoint)+2)*SizeOf(Single)*4+(Shapka.wnPoint div 8));
    Fi.Destroy;
 end;



Procedure TSignalData.FreeHeap;
var
 NeedMem:Word;
 begin
  with Shapka do
   begin
    NeedMem:=(wNPoint+2)*SizeOf(Single);
    if PImf <> nil then FreeMem(pImf,NeedMem);
    if pRef <> nil then FreeMem(pRef,NeedMem);
    if PImt <> nil then FreeMem(pImt,NeedMem);
    if pRet <> nil then FreeMem(pRet,NeedMem);
    if pSignRe <> nil then FreeMem(pSignRe,wnPoint div 8);
    if pPrimech<>nil then FreeMem(pPrimech,SizeOf(TPrimech));
    PImf:=nil;pRef:=nil;PImt:=nil;pRet:=nil;pTekArray:=nil;pPrimech:=nil;pSignRe:=nil;
   end;
 end;

function TSignalData.GetHeap:boolean;
var NeedMem:word;
 begin
  with Shapka do
   begin
     NeedMem:=SizeOf(TPrimech);
     if memavail > 0 then;
     if MaxAvail > NeedMem then GetMem(Pointer(pPrimech),NeedMem) else begin GetHeap:=False;exit;end;
     NeedMem:=(wNPoint+2)*SizeOf(Single);
     if MaxAvail > NeedMem then GetMem(Pointer(pImf),NeedMem) else
        begin
         FreeMem(pPrimech,SizeOf(TPrimech));pPrimech:=nil;
         GetHeap:=False;
         exit;
        end;
     if MaxAvail > NeedMem then GetMem(Pointer(pRef),NeedMem) else
        begin
         FreeMem(pImf,NeedMem);PImf:=Nil;
         FreeMem(pPrimech,SizeOf(TPrimech));pPrimech:=nil;
         GetHeap:=False;
         exit;
        end;
     if MaxAvail > NeedMem then GetMem(Pointer(pImt),NeedMem) else
        begin
         FreeMem(pImf,NeedMem);PImf:=Nil;
         FreeMem(pRef,NeedMem);PRef:=Nil;
         FreeMem(pPrimech,SizeOf(TPrimech));pPrimech:=nil;
         GetHeap:=False;
         exit;
        end;
     if MaxAvail > NeedMem then GetMem(Pointer(pRet),NeedMem) else
        begin
         FreeMem(pImt,NeedMem);PImt:=Nil;
         FreeMem(pImf,NeedMem);PImf:=Nil;
         FreeMem(pRef,NeedMem);PRef:=Nil;
         FreeMem(pPrimech,SizeOf(TPrimech));pPrimech:=nil;
         GetHeap:=False;
         exit;
        end;
     if MaxAvail > wnPoint div 8 then GetMem(Pointer(pSignRe),wnPoint div 8) else
        begin
         FreeMem(pRet,NeedMem);PReT:=Nil;
         FreeMem(pImt,NeedMem);PImt:=Nil;
         FreeMem(pImf,NeedMem);PImf:=Nil;
         FreeMem(pRef,NeedMem);PRef:=Nil;
         FreeMem(pPrimech,SizeOf(TPrimech));pPrimech:=nil;
         GetHeap:=False;
         exit;
        end;
   end;
   GetHeap:=true;
 end;


Function TSignalData.Save(FName:shortstring):boolean;
 var
     Fi:TFileStream;
 begin
    Fi:=TFileStream.Create(Fname,fmCreate);
    Fi.write(Shapka.pPrimech^,SizeOf(TPrimech));
    Fi.write(Shapka.pRet^,Shapka.wNPoint*SizeOf(Single));
    Fi.write(Shapka.pImt^,Shapka.wNPoint*SizeOf(Single));
    Fi.write(Shapka.pRef^,Shapka.wNPoint*SizeOf(Single));
    Fi.write(Shapka.pImf^,Shapka.wNPoint*SizeOf(Single));
    Fi.write(Shapka.pSignRe^,Shapka.wNPoint div 8);
    Fi.Destroy;
    Save:=true;
 end;

Function TSignalData.SaveToDisk:boolean;
 begin
 end;

Function TSignalData.SaveToFile:boolean;
 begin
 end;

Function TSignalData.Save_Free:boolean;
 begin
  Save_Free:=SaveToDisk;
  FreeHeap;
 end;


Function TSignalData.GetNPoint:longInt;
  begin
   GetNPoint:=Shapka.wnPoint;
  end;
Function TSignalData.GetPointStart:longInt;
  begin
   GetPointStart:=0;
  end;
Function TSignalData.GetPointEnd:longInt;
  begin
   GetPointEnd:=Shapka.wnPoint-1;
  end;

Function TSignalData.GetData(Point:longint;var Rez:real):boolean;
 begin
   Rez:=Shapka.pTekArray^[Point];
   GetData:=true;
 end;

{Function TSignalData.SetData(Point:longint;Rez:real):boolean;
 begin
   Shapka.pTekArray^[Point]:=Rez;
   SetData:=true;
 end;
 }
Procedure TSignalData.GetSignalSettings;
 begin
 case Shapka.byHowProcess of    {выполни БПФ, если надо  }
   cmRealT,cmImgT,cmAmT,cmphT:
     if Shapka.WhatInT = cTimeWrong then
      case Shapka.WhatinF of
       cFreqWrong: begin RunError(249); exit; end;
       cFreqReIm: begin
                   move(Shapka.pImf^,Shapka.pImt^,Shapka.wNPoint*SizeOf(Single));
                   move(Shapka.pRef^,Shapka.pRet^,Shapka.wNPoint*SizeOf(Single));
                   BPF(Shapka.wnPoint,True,Shapka.pReT,Shapka.pImT);
                   Shapka.WhatInT:=cTimeREIM;
                  end;
       cFreqAmPh: begin
                   move(Shapka.pImf^,Shapka.pImt^,Shapka.wNPoint*SizeOf(Single));
                   move(Shapka.pRef^,Shapka.pRet^,Shapka.wNPoint*SizeOf(Single));
                   GetReImFromAmPh(Shapka.wnPoint,Shapka.pRet,Shapka.pImt,Shapka.pSignRe);
                   BPF(Shapka.wnPoint,True,Shapka.pReT,Shapka.pImT);
                   Shapka.WhatInT:=cTimeREIM;
                  end;
     end;
   cmRealf,cmImgf,cmAmf,cmphf:
     if Shapka.WhatInf = cFreqWrong then
      case Shapka.WhatinT of
       cTimeWrong: begin RunError(249); exit; end;
       cTimeReIm: begin
                   move(Shapka.pImt^,Shapka.pImf^,Shapka.wNPoint*SizeOf(Single));
                   move(Shapka.pRet^,Shapka.pRef^,Shapka.wNPoint*SizeOf(Single));
                   BPF(Shapka.wnPoint,false,Shapka.pRef,Shapka.pImf);
                   Shapka.WhatInf:=cFreqREIM;
                  end;
       cTimeAmPh: begin
                   move(Shapka.pImt^,Shapka.pImf^,Shapka.wNPoint*SizeOf(Single));
                   move(Shapka.pRet^,Shapka.pRef^,Shapka.wNPoint*SizeOf(Single));
                   GetReImFromAmPh(Shapka.wnPoint,Shapka.pRef,Shapka.pImf,Shapka.pSignRe);
                   BPF(Shapka.wnPoint,false,Shapka.pRef,Shapka.pImf);
                   Shapka.WhatInf:=cFreqREIM;
                  end;
        end;
     else RunError(248);
   end;

  case Shapka.byHowProcess of     {перевод  Re,Im <-> Am Ph)  }
   cmRealt,cmImgT:if Shapka.WhatinT = ctimeAmPh then
                   begin
                      GetReImFromAmPh(Shapka.wnPoint,Shapka.pRet,Shapka.pImt,Shapka.pSignRe);
                      Shapka.WhatInT:=cTimeREIM;
                   end;
   cmAmT,cmPhT:if Shapka.WhatinT = cTimeREIM then
                   begin
                     GetAmPhFromReIm(Shapka.wnPoint,Shapka.pRet,Shapka.pImt,Shapka.pSignRe);
                     Shapka.WhatInT:=cTimeAmPh;
                   end;
   cmRealf,cmImgf:if Shapka.Whatinf = cFreqAmPh then
                   begin
                      GetReImFromAmPh(Shapka.wnPoint,Shapka.pRef,Shapka.pImf,Shapka.pSignRe);
                      Shapka.WhatInf:=cFreqREIM;
                   end;
   cmAmf,cmPhf:if Shapka.Whatinf = cFreqREIM then
                   begin
                     GetAmPhFromReIm(Shapka.wnPoint,Shapka.pRef,Shapka.pImf,Shapka.pSignRe);
                     Shapka.WhatInf:=cFreqAmPh;
                   end;
   end;

   case Shapka.byHowProcess of
   cmRealt,cmAmT:  Shapka.pTekArray:=Shapka.pReT;
   cmRealf,cmAmf:  Shapka.pTekArray:=Shapka.pRef;
   cmImgt,cmPht:   Shapka.pTekArray:=Shapka.pImt;
   cmImgf,cmPhf:   Shapka.pTekArray:=Shapka.pImf;
  end;

  case Shapka.byHowProcess of
   cmRealt,cmAmT,cmImgt,cmPht:  begin Shapka.scAxisX:='t';Shapka.Deltx:=1/Shapka.rClock;end;
   cmRealf,cmAmf,cmImgf,cmPhf:  begin Shapka.scAxisX:='f';Shapka.Deltx:=Shapka.rClock/Shapka.wnPoint;end;
  end;
  case Shapka.byHowProcess of
   cmRealt,cmRealf:  Shapka.scAxisY:='Re';
   cmAmf,cmAmt:      Shapka.scAxisY:='Ampl';
   cmImgt,cmImgf:    Shapka.scAxisY:='Img';
   cmPht,cmPhf:      Shapka.scAxisY:='Ph';
  end;

 end;


Function TSignalData.GetValY(var Xm,Ym:real;var Point:Word):boolean;
 begin
 GetSignalSettings;
 GetValY:=false;
 with Shapka do
  begin
    if (Xm>rMaxX) then begin point:=$FFFF;GetValY:=True;exit;end;
    if (Xm<rMinX) then begin Point:=$FFFE;GetValY:=True;exit;end;
{    Point:=trunc((Xm-rminX)/(rMaxX-rMinX)*(wnPoint-1));}
    Point:=round((Xm-rminX)/(rMaxX-rMinX)*(wnPoint-1));
    Xm:=rMinX+Point*DeltX;
    GetValY:=true;
    Ym:=pTekArray^[Point];
  end;
end;

Function TSignalData.GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean;
var Rez:real;i:longInt;Sum:real;
begin
    GetSignalSettings;
    GetMaxMin:=False;
    Max:=Shapka.pTekArray^[Point1];
    Min:=Max;NumMax:=Point1;NumMin:=Point1;Sum:=Max;
    i:=Point1+1;
    repeat {for i:=Point1+1 to Point2 do
     begin                              }
      Rez:=Shapka.pTekArray^[i];
      if Rez>Max then begin Max:=Rez;NumMax:=i;end;
      if Rez<Min then begin Min:=Rez;NumMin:=i;end;
      Sum:=Sum+Rez;
      inc(i,Shag);
     until i>Point2 {end};
    StatRec.bStatMx:=true;
    StatRec.rStatMx:=Sum/(Point2-Point1+1)*Shag;
    StatRec.bStatMax:=true;StatRec.rStatMax:=Max;
    StatRec.bStatMin:=true;StatRec.rStatMin:=Min;
    GetMaxMin:=True;
end;

Function TSignalData.FindMaxMin(var Max,Min:real;var NumMax,NumMin:longint):boolean;
var Rez:real;i:longInt;
begin
    StatRec.bTekPar:=false;
    FindMaxMin:=GetMaxMin(0,Shapka.wnPoint-1,Max,Min,NumMax,NumMin,1);
end;

procedure TSignalData.GetMaxVal;
 var
  ii:smallint;Y:real;
begin
 GetSignalSettings;
 with Shapka do
   begin
     rmaxX:=(wnPoint-1)*DeltX;
     rMinX:=0;
     rMaxY:=pTekArray^[0]; rminY:=rMaxY;
     for iI:=1 to wnpoint-1   do
       begin
        Y:=pTekArray^[ii];
        if rmaxY<Y then rmaxY:=Y;
        if rminY>Y then rminY:=Y;
       end;
   end;
end;    { GetMaxVal }

function TSignalData.SetFirstLast(X1,X2,Y1,Y2:real):boolean;
var
 i:smallint;
begin
 GetSignalSettings;
 with Shapka do
  begin
  if (X1>X2) or (X1>=rMaxX) or (X2<=rMinX) or (Y1>Y2) then
   SetFirstLast:=false
  else
    begin
  if rMinX>=X1 then First:=0
    else
     begin
       First:=trunc((X1-rMinX)/(rMaxX-rMinX)*wnPoint);
       if First>0 then
       While not ((((First-1)*DeltX<X1) and (First*DeltX>=X1)) or (First-1=0)) do
         if DEltX*First>X1 then dec(First) else inc(First);
     end;

  if rMaxX<=X2 then Last:=wnPoint-1
    else
     begin
      Last:=trunc((X2-rMinX)/(rMaxX-rMinX)*wnPoint);
      if Last<wnPoint then
       While not (((DeltX*last<=X2) and (DEltX*(last+1)>X2)) or (last+1=wnPoint)) do
         if DeltX*last>X2 then dec(last) else inc(last);
     end;

  if First>=Last then begin SetFirstLast:=false;exit;end;

  if (rMinY<Y1) or (rMaxY>Y2) then
  for i:=First to last do
   if (pTekArray^[i]>Y2) or (pTekArray^[i]<Y1) then begin
    exit;
    end;

    SetFirstLast:=true;
    end;
  end;
end; {SetFirstLast}


Function TSignalData.NextString(Point:longint;Format:byte):shortstring;
var Rez:real;
begin
 GetData(Point,Rez);
 NextString:=IntToStr(Point)+'   X='+
       FloatToStrF(Point*Shapka.DeltX,ffgeneral,1,Format)+'  Y='+FloatToStrF(Rez,ffGeneral,1,Format);
end;

Function TSignalData.GetShapka(Format:byte):shortstring;
var AddS:string[2];
begin
 if length(Shapka.ScHeader)>15+format then AddS:=chr(13)+chr(10) else AddS:=' ';
 GetShapka:=Shapka.scHeader+AddS+
         '   X:'+Shapka.scAxisX+'     Y:'+Shapka.ScAxisY;
(* case Format of
  11: Stroka:=StrCat(Stroka,pChar('   #           X           Y'));
   6: Stroka:=StrCat(Stroka,pChar('   #      X      Y'));
   2: Stroka:=StrCat(Stroka,pChar('   #     X    Y'));
 end;
  *)
end;

Function TSignalData.GetClock(Format:byte):shortstring;
begin
 GetClock:=' Fd='+floatToStrF(Shapka.rClock,ffgeneral,1,Format)+' ├Ў';
end;

Function TSignalData.GetFreq:real;
begin
  GetFreq:=Shapka.rClock;
end;

Destructor TSignalData.Done;
 begin
  FreeHeap;
  inherited Done;
 end;


{--------------------------------------------------------------------}
{ Методы объекта TPolyData                                           }
{---------- объект для отображения графика  -------------------------}

Constructor TPolyData.Init(NPoint:LongInt);
 begin
    Shapka.wNPoint:=NPoint;
    TData.Init(NPoint*SizeOf(Word)*2);
    if not GetHeap then fail;
 end;

(*Function TPolyData.GetSizeData:longint;
 begin
  GetSizeData:=Shapka.wNPoint*SizeOf(Word)*2;
 end;*)


Procedure TPolyData.FreeHeap;
 begin
  with Shapka do
   begin
    if pPolyX<>nil then FreeMem(pPolyX,wNPoint*SizeOf(word));
    pPolyX:=nil;
    if pPolyY<>nil then FreeMem(pPolyY,wNPoint*SizeOf(word));
    pPolyY:=nil;
   end;
 end;

function TPolyData.GetHeap:boolean;
var NeedMem:word;
 begin
  with Shapka do
   begin
     NeedMem:=wNPoint*SizeOf(Word);
     if MaxAvail > NeedMem then GetMem(Pointer(pPolyX),NeedMem) else
        begin
         GetHeap:=False;
         exit;
        end;
     if MaxAvail > NeedMem then GetMem(Pointer(pPolyY),NeedMem) else
        begin
         FreeMem(pPolyX,wNPoint*SizeOf(Word));pPolyX:=nil;
         GetHeap:=False;
         exit;
        end;
   end;
   GetHeap:=true;
 end;


Function TPolyData.SaveToDisk:boolean;
 begin
 end;

 Function TPolyData.SaveToFile:boolean;
 begin
 end;

Function TPolyData.Save_Free:boolean;
 begin
  FreeHeap;
 end;

Destructor TPolyData.Done;
 begin
   FreeHeap;
   inherited Done;
 end;

{--------------------------------------------------------------------}
{ Методы объекта TLongData                                           }
{---------- объект для получения данных для длинной реализации-------}

Constructor TLongData.InitFirst(Fname:TFileNameStr);
 begin
    Fi:=nil;
{    if not DataControl^.Check_Free(MSize) then Fail;}
    Fi:=TFileStream.Create(FName,fmOpenReadWrite+fmShareDenyNone);
    if Fi=nil then fail;
    Fi.read(Shapka,SizeOf(TLongShapka));
    if not GetHeap then begin Fi.Destroy;fail;end;
    Fi.read(Shapka.pPrimech^,SizeOf(TPrimech));
    inherited Init(SizeOf(TPrimech));
    Shapka.bCreated:=False;
    Shapka.scFile:=Fname;
    if Shapka.lPointEnd=Shapka.lPointAll then dec(Shapka.lPointEnd);
    bProcessParty:=false;
 end;

Constructor TLongData.InitSecond(Fname:TFileNameStr;Point1,Point2:LongInt);
 begin
    Fi:=nil;
    Fi:=TFileStream.Create(FName,fmopenReadWrite+fmShareDenyNone);
    if Fi=nil then fail;
    Fi.read(Shapka,SizeOf(TLongShapka));
    if not GetHeap then begin Fi.Destroy;fail;end;
    Fi.read(Shapka.pPrimech^,SizeOf(TPrimech));
    inherited Init(SizeOf(TPrimech));
    Shapka.bMaxMinExist:=false;
    Shapka.bCreated:=True;
    Shapka.lPointStart:=Point1;
    Shapka.lPointEnd:=Point2;
    Shapka.rTimeStart:=Point1/Shapka.rClock;
    Shapka.scFile:=Fname;
 end;

Constructor TLongData.InitForSeismo(Fname:TFileNameStr;Point1:LongInt);
var Divider:longint;
 begin
    Fi:=nil;
    Fi:=TFileStream.Create(FName,fmOpenReadWrite+fmShareDenyNone);
    if Fi=nil then fail;
    Fi.read(Shapka,SizeOf(TLongShapka));
    if not GetHeap then begin Fi.Destroy;fail;end;
    Fi.read(Shapka.pPrimech^,SizeOf(TPrimech));
    inherited Init(SizeOf(TPrimech));
    Shapka.bMaxMinExist:=false;
    Shapka.bCreated:=True;
    Shapka.lPointStart:=Point1;
    if abs(Shapka.lPointEnd-Shapka.lPointAll)<10 then
     begin
      if Shapka.lPointEnd>10000 then Divider:=10;
      if Shapka.lPointEnd>5000 then Divider:=5;
      if Shapka.lPointEnd>1000 then Divider:=3;
      if Shapka.lPointEnd<=1000 then Divider:=2;
      Shapka.lPointEnd:=Shapka.lPointEnd div Divider;
     end;
  Shapka.rTimeStart:=Point1/Shapka.rClock;
  Shapka.scFile:=Fname;
 end;

{Function TLongData.GetNameArch:TFileNameStr;
 begin
 end;}

Procedure TLongData.FreeHeap;
 begin
  with Shapka do
   begin
{    if pPrimech<>nil then FreeMem(pPrimech,SizeOf(TPrimech));
    pPrimech:=nil;                                            }
   end;
 end;

function TLongData.GetHeap:boolean;
var NeedMem:word;
 begin
  with Shapka do
   begin
     NeedMem:=SizeOf(TPrimech);
     if MaxAvail > NeedMem then GetMem(Pointer(pPrimech),NeedMem)
              else begin GetHeap:=False;exit;end;
   end;
   GetHeap:=true;
 end;


Function TLongData.Save(FName:shortstring):boolean;
 var
     FiW:tFileStream;
 begin
    FiW:=TFileStream.Create(Fname,fmopenReadWrite+fmShareDenyNone);
    FiW.write(Shapka,SizeOf(TLongShapka));
    FiW.write(Shapka.pPrimech^,SizeOf(TPrimech));
    FiW.Destroy;
    Save:=true;
 end;


Function TLongData.SaveShapka(Fname:TFileNameStr):boolean;
 begin
    SaveShapka:=Save(FName);
 end;

Function TLongData.SaveToDisk:boolean;
 begin
    SaveToDisk:=Save(Shapka.ScFile);
 end;

Function TLongData.SaveToFile:boolean;
 begin
    SaveToFile:=Save(Shapka.ScFile);
 end;

Function TLongData.SaveMaxMin:boolean;
 var
     FiW:TFileStream;
 begin
    FiW:=TFileStream.Create(Shapka.scFile,fmOpenWrite+fmShareDenyNone);
    FiW.write(Shapka,SizeOf(single)*4+2+1);
    FiW.Destroy;
    SaveMaxMin:=true;
 end;

Function TLongData.Save_Free:boolean;
 begin
  Save_Free:=SaveToDisk;
  FreeHeap;
 end;


Function TLongData.GetValY(var Xm,Ym:real;var Point:Longint):boolean;
begin
  GetValY:=false;
 with Shapka do
  begin
  if not bMaxMinExist then SetMaxMin;
  if (Xm>rMaxX) then begin point:=-2;GetValY:=True;exit;end;
  if (Xm<rMinX) then begin Point:=-1;GetValY:=True;exit;end;
  if rMaxX=rMinX then
   begin
    Point:=0;
    Xm:=rTimeStart;
   end
   else
    begin
    { Point:=trunc(Xm/(rMaxX-rMinX)*(lPointEnd-lPointStart));}
    Point:=round(Xm/(rMaxX-rMinX)*(lPointEnd-lPointStart));
{     if Point<lPointStart then Point:=lPointStart;
     if Point>lPointEnd then Point:=lPointEnd;
 }    if Point<>0 then Xm:=rTimeStart+(Point-lPointStart)/rClock;
    end;
  if not GetData(Point,Ym) then exit;
  end;
  GetValY:=True;
end;

Procedure TLongData.GetMaxVal;
 begin
  if Shapka.bMaxMinExist then exit;
  SetMaxMin;
 end;

Function TLongData.SetMaxMin:boolean;
var i:longInt;   Rez:real; OldActive:byte; j:longint; K:longint;
 begin
 OldActive:=Shapka.ActChanal;
 for j:=0 to Shapka.NChanal-1 do
 begin
 with Shapka do
  begin
    SetMaxMin:=False;  bMaxMinExist:=false;
    rMinX:=rTimeStart;rMaxX:=lPointEnd/rClock;
    i:=lPointStart;
    k:=0;
    ActChanal:=j;
    if J=0 then
     begin
      if GetData(i,Rez) then begin rMaxY:=Rez;rMinY:=rez;end
                 else   begin Shapka.ActChanal:=OldActive;Exit;end;
      K:=1
     end;
    for i:=lPointStart+k to lPointEnd-1 do
      if GetData(i,Rez) then
       begin
        if rMaxY<Rez then rMaxY:=Rez;
        if rMinY>Rez then rMinY:=Rez;
       end    else begin
                    if i<lPointAll-1 then Shapka.ActChanal:=OldActive;Exit;end;
    if rmaxY=rMinY then
     begin
      if rmaxY=0 then begin rmaxY:=1;rminY:=-1;end
       else begin
              rmaxY:=rmaxY+abs(rMaxY)/4;
              rminY:=rminY-abs(rMinY)/6;
            end;
     end;
   end;
 end;
 SetMaxMin:=True; Shapka.bMaxMinExist:=true;
 Shapka.ActChanal:=OldActive;
end;

Function TLongData.SetMaxMinAll:boolean;
var i:longInt;   Rez:real; OldActive:byte; j:byte; k:longint;
 begin
 if Shapka.bMaxMinexistAll then begin SetMaxMinAll:=true;exit; end;
 OldActive:=Shapka.ActChanal;
 for j:=0 to Shapka.NChanal-1 do
 begin
 with Shapka do
  begin
    SetMaxMinAll:=False;  bMaxMinExist:=false;
    rMinX:=rTimeStart;rMaxX:=lPointEnd/rClock;
    i:=0;
    ActChanal:=j;
    if J=0 then
     begin
      if GetData(i,Rez) then begin rMaxY:=Rez;rMinY:=rez;end
                 else   begin Shapka.ActChanal:=OldActive;Exit;end;
      K:=1
     end;
    for i:=k to lPointAll-1 do
      if GetData(i,Rez) then
       begin
        if rMaxY<Rez then rMaxY:=Rez;
        if rMinY>Rez then rMinY:=Rez;
       end         else
        begin
         if i<lPointall-1 then Shapka.ActChanal:=OldActive;Exit;
        end;
    if rmaxY=rMinY then
     begin
      if rmaxY=0 then begin rmaxY:=1;rminY:=-1;end
       else begin
              rmaxY:=rmaxY+abs(rMaxY)/4;
              rminY:=rminY-abs(rMinY)/6;
            end;
     end;
  end;
 end;
 SetMaxMinAll:=True; Shapka.bMaxMinExist:=true;Shapka.bMaxMinExistAll:=true;
 Shapka.ActChanal:=OldActive;
end;

(*
Function TLongData.GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean;
begin
end;
  *)
Function TLongData.FindMaxMin(var Max,Min:real;var NumMax,NumMin:longint):boolean;
begin
  StatRec.bTekPar:=false;
  FindMaxMin:=GetMaxMin(GetPointStart,GetPointEnd,Max,Min,NumMax,NumMin,1);
end;

Function TLongData.GetNPoint:longInt;
  begin
   if not bProcessParty then GetNPoint:=Shapka.LpointAll-1 else GetNPoint:=Shapka.lPointEnd-Shapka.lPointStart;
  end;

Function TLongData.GetPointStart:longInt;
  begin
   if not bProcessParty then GetPointStart:=0 else GetPointStart:=Shapka.lPointStart;
  end;
Function TLongData.GetPointEnd:longInt;
  begin
   if not bProcessParty then GetPointEnd:=Shapka.LpointAll-1 else GetPointEnd:=Shapka.lPointEnd;
  end;
Function TLongData.WriteDataFromBuf(PointBegin:longint;BufPtr:Pointer):boolean;
 begin
 end;

Function TLongData.GetDataFromBuf(Point:longint;BufPtr:Pointer):real;
begin
end;


Function TLongData.NextString(Point:longint;Format:byte):shortstring;
var Rez:real;
begin
 GetData(Point,Rez);
 NextString:=IntToStr(Point)+'   X='+
       FloatToStrF(Point/Shapka.RClock,ffNumber,1,Format)+'   Y='+FloatToStrF(Rez,ffNumber,1,Format);
end;

Function TLongData.GetClock(Format:byte):shortstring;
begin
 GetClock:=' Fd='+FloatToStrF(Shapka.rClock,ffNumber,1,Format)+' Hz';
end;

Function TLongData.GetFreq:real;
begin
  GetFreq:=Shapka.rClock;
end;

Function TLongData.GetNChan:byte;
begin
  GetNChan:=Shapka.NChanal;
end;

Function TLongData.GetDataChan(Point:longint; Chan:byte; var Rez:real):boolean;
var RealActChan:byte;
 begin
   RealActChan:=Shapka.ActChanal;
   Shapka.ActChanal:=Chan;
   GetDataChan:=GetData(Point,Rez);
   Shapka.ActChanal:=RealActChan;
 end;

Function TLongData.GetShapka(Format:byte):shortstring;
var AddS:string[2];
begin
 if length(Shapka.ScHeader)>15+format then AddS:=chr(13)+chr(10) else AddS:=' ';
 GetShapka:=GetAbsTimeStr(Shapka.AbsTime)+chr(13)+chr(10)+
    Shapka.scHeader+AddS+
         '   X:'+Shapka.scAxisX+'     Y:'+Shapka.ScAxisY;
(* case Format of
  11: Stroka:=StrCat(Stroka,pChar('   #           X           Y'));
   6: Stroka:=StrCat(Stroka,pChar('   #      X      Y'));
   2: Stroka:=StrCat(Stroka,pChar('   #     X    Y'));
 end;
  *)
end;

Function TLongData.CopyAll(FnameSource,FNameDest:shortstring;Portion:word):boolean;
 begin
  CopyAll:=Copy(FnameSource,FNameDest,Portion);
 end;

Function TLongData.AddToCopy(FnameSource,FNameDest:shortstring;EndP,LastP:longint;Portion:word):boolean;
var
  Copy1,Copy2:TFileStream;
  J,MSize1,MSize2:word;
  Shap1:TlongShapka;
begin
  AddToCopy:=false;
  Copy1:=TFileStream.Create(FNameSource,fmOpenRead+fmShareDenyNone);
  Copy2:=TFileStream.Create(FNameDest, fmOpenWrite+fmShareDenyNone);
  Copy1.read(Shap1,SizeOf(TLongShapka));
  Copy2.write(Shap1,SizeOf(TLongShapka));
  Copy1.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+cSizeRez[Shapka.TipData]*LastP);
  Copy2.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+cSizeRez[Shapka.TipData]*LastP);
  Copy2.CopyFrom(Copy1,cSizeRez[Shapka.TipData]*(EndP-LastP));
  AddToCopy:=True;
  Copy2.Destroy;
  Copy1.Destroy;
end;   { AddToCopy }

Destructor TLongData.Done;
 begin
  SaveMaxMin;
  FreeHeap;
  if Shapka.pPrimech<>nil then FreeMem(Shapka.pPrimech,SizeOf(TPrimech));
  Shapka.pPrimech:=nil;
  if Fi<>nil then Fi.Destroy;
  inherited Done;
 end;


{--------------------------------------------------------------------}
{ Методы объекта TLongDataReal                                       }
{---------- объект для получения данных для длинной реализации-------}

Constructor TLongDataReal.InitFirst(Fname:TFileNameStr);
 begin
    inherited InitFirst(FName);
    Shapka.TipData:=cRealLong;
 end;

Function TLongDataReal.GetData(Point:longint;var Rez:real):boolean;
 begin
    GetData:=False;
    Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+sizeOf(Single)*Point);
    Fi.Read(Rez,cSizeRez[Shapka.TipData]);{sizeOf(Single))};
    Getdata:=True;
 end;

Function TLongDataReal.GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean;
var Sum,Rez:real;i:longInt;
begin
    GetMaxMin:=False;
    Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+sizeOf(Single)*Point1);
    Fi.Read(Max,sizeOf(Single));
    Min:=Max;NumMax:=Point1;NumMin:=Point1;Sum:=0;
    i:=Point1;
    if Shag=1 then
    begin
      Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+sizeOf(Single)*i);
      for i:=Point1 to Point2 do
       begin
        Fi.Read(Rez,sizeOf(Single));
        if Rez>Max then begin Max:=Rez;NumMax:=i;end;
        if Rez<Min then begin Min:=Rez;NumMin:=i;end;
        if StatRec.bTekPar then GetTekMxDX(Rez) else Sum:=Sum+Rez;
        GetTekPar(Rez);
       end;
     end
      else
       repeat
          Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+sizeOf(Single)*i);
          Fi.Read(Rez,sizeOf(Single));
          if Rez>Max then begin Max:=Rez;NumMax:=i;end;
          if Rez<Min then begin Min:=Rez;NumMin:=i;end;
          if StatRec.bTekPar then GetTekMxDX(Rez) else Sum:=Sum+Rez;
          GetTekPar(Rez);
          inc(i,Shag);
       until i>Point2;
    GetMaxMin:=True;
    StatRec.bStatMax:=true;StatRec.rStatMax:=Max;
    StatRec.bStatMin:=true;StatRec.rStatMin:=Min;
    StatRec.bStatMx:=true;
    if not StatRec.bTekPar then
     begin
         StatRec.rStatMx:=Sum/(Point2-Point1+1)*Shag;
     end else StatRec.bStatDx:=true;;
end;


{Function TLongDataReal.SetData(Point:longint;Rez:real):boolean;
 var
     FiW:PFileStream;
 begin
    SetData:=False;
    FiW:=new(PDosStream,Init(Shapka.scFile,StOpenWrite));
    if FiW=nil then begin SetData:=false;exit;end;
    FiW^.Seek(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+sizeOf(Single)*Point);
    if FiW^.Status<>StOk then begin Dispose(FiW,Done);exit;end;
    FiW^.write(Rez,sizeOf(Single));
    if FiW^.Status<>StOk then begin Dispose(FiW,Done);exit;end;
    Setdata:=True;
    Dispose(FiW,Done);
 end;
}
{--------------------------------------------------------------------}
{ Методы объекта TLongDataWord                                       }
{---------- объект для получения данных для длинной реализации-------}

Constructor TLongDataWord.InitFirst(Fname:TFileNameStr);
 begin
    inherited InitFirst(FName) ;
    Shapka.TipData:=cWordLong;
 end;

Function TLongDataWord.GetData(Point:longint;var Rez:real):boolean;
var Kod:smallint;
 begin
    GetData:=False;
    Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(Word)*Point);
    Fi.Read(Kod,SizeOf(Word));
    Rez:=Shapka.MaxRez*Kod/Shapka.LADC;
    Getdata:=True;
 end;

Function TLongDataWord.GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean;
var TekKodMax,TekKodMin,Kod:smallint;i:longInt;Rez:real;Sum:real;
begin
    GetMaxMin:=False;
    Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(word)*Point1);
    Fi.Read(TekKodMax,SizeOf(word));
    TekKodMin:=TekKodMax;NumMax:=Point1;NumMin:=Point1;Sum:=0;
    i:=Point1;
    if Shag=1 then
    begin
      Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(word)*i);
      for i:=Point1 to Point2 do
       begin
        Fi.Read(Kod,SizeOf(word));
        if Kod>TekKodMax then begin TekKodMax:=Kod;NumMax:=i;end;
        if Kod<TekKodMin then begin TekKodMin:=Kod;NumMin:=i;end;
        if StatRec.bTekPar then GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC)  else Sum:=Sum+Kod;
        GetTekPar(Rez);
       end;
    end
     else
       repeat
        Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(word)*i);
        Fi.Read(Kod,SizeOf(word));
        if Kod>TekKodMax then begin TekKodMax:=Kod;NumMax:=i;end;
        if Kod<TekKodMin then begin TekKodMin:=Kod;NumMin:=i;end;
        if StatRec.bTekPar then GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC)  else Sum:=Sum+Kod;
{        GetTekPar(Rez);}
        inc(i,Shag);
       until i>Point2;
    Max:=Shapka.MaxRez*TekKodMax/Shapka.LADC;
    Min:=Shapka.MaxRez*TekKodMin/Shapka.LADC;
    GetMaxMin:=True;
    if not StatRec.bTekPar then
    begin
       Sum:=Sum*Shapka.MaxRez/Shapka.LADC;
       StatRec.rStatMx:=Sum/(Point2-Point1+1)*Shag;
    end else StatRec.bStatDx:=true;;
    StatRec.bStatMax:=true;StatRec.rStatMax:=Max;
    StatRec.bStatMin:=true;StatRec.rStatMin:=Min;
    StatRec.bStatMx:=true;
end;

{Function TLongDataWord.SetData(Point:longint;Rez:real):boolean;
 var
     FiW:PDosStream;Kod:smallint;
 begin
    SetData:=False;
    FiW:=new(PDosStream,Init(Shapka.scFile,StOpenWrite));
    if FiW=nil then begin SetData:=false;exit;end;
    FiW^.Seek(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(word)*Point);
    if FiW^.Status<>StOk then begin Dispose(FiW,Done);exit;end;
    Kod:=Round(Rez/Shapka.MaxRez*Shapka.LADC);
    FiW^.write(Kod,SizeOf(word));
    if FiW^.Status<>StOk then begin Dispose(FiW,Done);exit;end;
    Setdata:=True;
    Dispose(FiW,Done);
 end;
}{--------------------------------------------------------------------}
{ Методы объекта TLongDataLInt                                       }
{---------- объект для получения данных для длинной реализации-------}

Constructor TLongDataLInt.InitFirst(Fname:TFileNameStr);
 begin
    Inherited InitFirst(FName) ;
    Shapka.TipData:=cLong18;
 end;

Function TLongDataLInt.GetData(Point:longint;var Rez:real):boolean;
var Kod:LongInt;
 begin
    GetData:=False;
    Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(LongInt)*Point);
    Fi.Read(Kod,SizeOf(LongInt));
    Rez:=Shapka.MaxRez*Kod/Shapka.LADC;
    Getdata:=True;
 end;

Function TLongDataLInt.GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean;
var TekKodMax,TekKodMin,Kod:LongInt;i:longInt;Rez,Sum:Real;
begin
    GetMaxMin:=False;
    Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(LongInt)*Point1);
    Fi.Read(TekKodMax,SizeOf(LongInt));
    TekKodMin:=TekKodMax;NumMax:=Point1;NumMin:=Point1;Sum:=0;
    i:=Point1;
    if Shag=1 then
    begin
      Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(longint)*i);
      for i:=Point1 to Point2 do
       begin
        Fi.Read(Kod,SizeOf(longint));
        if Kod>TekKodMax then begin TekKodMax:=Kod;NumMax:=i;end;
        if Kod<TekKodMin then begin TekKodMin:=Kod;NumMin:=i;end;
        if StatRec.bTekPar then GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC)  else Sum:=Sum+Kod;
{        GetTekPar(Rez);}
       end;
    end
     else
       repeat
        Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(longint)*i);
        Fi.Read(Kod,SizeOf(longint));
        if Kod>TekKodMax then begin TekKodMax:=Kod;NumMax:=i;end;
        if Kod<TekKodMin then begin TekKodMin:=Kod;NumMin:=i;end;
        if StatRec.bTekPar then GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC)  else Sum:=Sum+Kod;
{        GetTekPar(Rez);}
        inc(i,Shag);
       until i>Point2;
    Max:=Shapka.MaxRez*TekKodMax/Shapka.LADC;
    Min:=Shapka.MaxRez*TekKodMin/Shapka.LADC;
    GetMaxMin:=True;
    StatRec.bStatMx:=true;
   if not StatRec.bTekPar then
    begin
     Sum:=Sum*Shapka.MaxRez/Shapka.LADC;
     StatRec.rStatMx:=Sum/(Point2-Point1+1);
    end else StatRec.bStatDx:=true;
    StatRec.rStatMax:=Max;  StatRec.bStatMax:=true;
    StatRec.bStatMin:=true;StatRec.rStatMin:=Min;
end;

{Function TLongDataLInt.SetData(Point:longint;Rez:real):boolean;
 var
     FiW:PDosStream;Kod:longint;
 begin
    SetData:=False;
    FiW:=new(PDosStream,Init(Shapka.scFile,StOpenWrite));
    if FiW=nil then begin SetData:=false;exit;end;
    FiW^.Seek(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(LongInt)*Point);
    if FiW^.Status<>StOk then begin Dispose(FiW,Done);exit;end;
    Kod:=Round(Rez/Shapka.MaxRez*Shapka.LADC);
    FiW^.write(Kod,SizeOf(LongInt));
    if FiW^.Status<>StOk then begin Dispose(FiW,Done);exit;end;
    Setdata:=True;
    Dispose(FiW,Done);
 end;
}
{--------------------------------------------------------------------}
{ Методы объекта TLongDataADC                                       }
{---------- объект для получения данных для длинной реализации-------}

Constructor TLongDataADC.InitFirst(Fname:TFileNameStr;LadcIni:longint;MaxRezIni:real;rClockIni:real);
 begin
    if MaxAvail <= SizeOf(TBuffer) then Fail
              else GetMem(Pointer(BufferADCStart),SizeOf(TBuffer));
    BufferADCHalf:=addr(TBuffer(BufferADCStart^)[SizeBufWrite]);
    inherited InitFirst(FName) ;
    Shapka.LAdc:=LADCIni;Shapka.MaxRez:=MaxRezIni;Shapka.rClock:=RClockIni;
    FiR:=nil;
    FiR:=TFileStream.Create(FName,fmOpenRead+fmShareDenyNone);
    if FiR=nil then
      begin
       Fi.Destroy;FreeHeap;fail;
      end;
    Shapka.TipData:=cWordLong; { becouse used in Zoom }
 end;


Function TLongDataADC.GetData(Point:longint;var Rez:real):boolean;
var  kod:smallint;
 begin
    GetData:=False;
    Fir.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(smallint)*Point);
    FiR.read(Kod,SizeOf(smallint));
    Rez:=Shapka.MaxRez*Kod/Shapka.LADC;
    Getdata:=True;
 end;

Function TLongDataADC.GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean;
var TekKodMax,TekKodMin,Kod:smallint;i:longInt;Rez,Sum:Real;
begin
    GetMaxMin:=False;
    Fir.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(word)*Point1);
    FiR.read(TekKodMax,SizeOf(word));
    TekKodMin:=TekKodMax;NumMax:=Point1;NumMin:=Point1;Sum:=0;
    i:=Point1;
    if Shag=1 then
    begin
      for i:=Point1 to Point2 do
       begin
        Fir.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(word)*i);
        FiR.read(Kod,SizeOf(word));
        if Kod>TekKodMax then begin TekKodMax:=Kod;NumMax:=i;end;
        if Kod<TekKodMin then begin TekKodMin:=Kod;NumMin:=i;end;
{        if StatRec.bTekPar then GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC)  else Sum:=Sum+Kod;}
       if not StatRec.bTekPar then Sum:=Sum+Kod else GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC);
{         GetTekPar(Rez);}
       end;
    end
     else
       repeat
        Fir.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(word)*i);
        FiR.read(Kod,SizeOf(word));
        if Kod>TekKodMax then begin TekKodMax:=Kod;NumMax:=i;end;
        if Kod<TekKodMin then begin TekKodMin:=Kod;NumMin:=i;end;
{        if StatRec.bTekPar then GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC)  else Sum:=Sum+Kod;}
       if not StatRec.bTekPar then Sum:=Sum+Kod else GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC);
{         GetTekPar(Rez);}
        inc(i,Shag);
       until i>Point2;
 (*   for i:=Point1 to Point2 do
     begin
      Fir.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+SizeOf(word)*i);
      if FiR^.Status<>StOk then exit;
      FiR^.read(Kod,SizeOf(word));
      if FiR^.Status<>StOk then exit;
      if Kod>TekKodMax then begin TekKodMax:=Kod;NumMax:=i;end;
      if Kod<TekKodMin then begin TekKodMin:=Kod;NumMin:=i;end;
      if not StatRec.bTekPar then Sum:=Sum+Kod else GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC);
{      GetTekPar(Rez);}
     end;  *)
    Max:=Shapka.MaxRez*TekKodMax/Shapka.LADC;
    Min:=Shapka.MaxRez*TekKodMin/Shapka.LADC;
    StatRec.bStatMax:=true;StatRec.rStatMax:=Max;
    StatRec.bStatMin:=true;StatRec.rStatMin:=Min;
    GetMaxMin:=True;
    StatRec.bStatMx:=true;
    if not StatRec.bTekpar then
     begin
      Sum:=Sum*Shapka.MaxRez/Shapka.LADC;
      StatRec.rStatMx:=Sum/(Point2-Point1+1);
     end else   StatRec.bStatDx:=true;
end;

Function TLongDataADC.WriteDataFromBuf(PointBegin:longint;BufPtr:Pointer):boolean;
type TBuffer=array[0..(SizeBufferDef div 2)-1] of smallint;
var Buf:^TBuffer;N:word;
 begin
     N:=SizeOf(smallint)*SizeBufWrite;
     WriteDataFromBuf:=False;
     Buf:=BufPtr;
     if PointBegin=-1 then PointBegin:=0;
     Fi.Position:=(Fi.Size);
     Fi.write(Buf^,N);
     Shapka.LPointEnd:=Shapka.LPointEnd+SizeBufWrite;
     Shapka.LPointAll:=Shapka.LPointEnd;
     Shapka.rMaxX:=Shapka.LPointEnd/Shapka.rClock;
     if not SaveShapka(Shapka.scFile) then Exit;
     Fi.Destroy; Fi:=nil;
     FiR.Destroy;Fir:=Nil;
     FiR:=TFileStream.Create(Shapka.scFile,fmOpenRead+fmShareDenyNone);
     Fi:=TFileStream.Create(Shapka.scFile,fmOpenwrite+fmShareDenyNone);
     WriteDataFromBuf:=True;
 end;

{Function TLongDataADC.SetData(Point:longint;Rez:real):boolean;
var Kod:smallint;
 begin
    SetData:=False;
    Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(smallint)*Point);
    if Fi^.Status<>StOk then exit;
    Kod:=round(Rez/Shapka.MaxRez*Shapka.Ladc);
    Fi^.write(Kod,SizeOf(smallint));
    if Fi^.Status<>StOk then exit;
    SetData:=True;
 end;
 }
Function TLongDataADC.GetDataFromBuf(Point:longint;BufPtr:Pointer):real;
type TBuffer=array[0..SizeBufferDef-1] of smallint;
var Buf:^TBuffer;
 begin
     Buf:=BufPtr;
     GetDataFromBuf:=Shapka.MaxRez*Buf^[Point mod SizeBuffer]/Shapka.LADC;
 end;

Destructor TLongDataADC.Done;
 begin
  FreeMem(BufferADCStart,SizeOf(TBuffer));
  FreeHeap;
  if Shapka.pPrimech<>nil then FreeMem(Shapka.pPrimech,SizeOf(TPrimech));
  Shapka.pPrimech:=nil;
  if Fi<>nil then Fi.Destroy;
  if FiR<>nil then FiR.Destroy;
  inherited Done;
 end;
{--------------------------------------------------------------------}
{ Методы объекта TLongDataADC18                                       }
{---------- объект для получения данных для длинной реализации-------}

Constructor TLongDataADC18.InitFirst(Fname:TFileNameStr;LadcIni:longint;MaxRezIni:real;rClockIni:real);
 begin
    if MaxAvail <= SizeOf(TBufferLInt) then Fail
              else GetMem(Pointer(BufferADCStart),SizeOf(TBufferLInt));
    BufferADCHalf:=addr(TBufferLInt(BufferADCStart^)[SizeBufWrite]);
    inherited InitFirst(FName) ;
    Shapka.LAdc:=LADCIni;Shapka.MaxRez:=MaxRezIni;Shapka.rClock:=rClockIni;
    FiR:=nil;
    FiR:=TFileStream.Create(FName,fmOpenRead+fmShareDenyNone);
    if FiR=nil then
      begin
       Fi.Destroy;FreeHeap;fail;
      end;
    Shapka.TipData:=cLong18; { becouse used in Zoom }
 end;


Function TLongDataADC18.GetData(Point:longint;var Rez:real):boolean;
var  kod:LongInt;
 begin
    GetData:=False;
    Fir.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(LongInt)*Point);
    FiR.read(Kod,SizeOf(LongInt));
    Rez:=Shapka.MaxRez*Kod/Shapka.LADC;
    Getdata:=True;
 end;

Function TLongDataADC18.GetMaxMin(Point1,Point2:longint;var Max,Min:real;var NumMax,NumMin:longint;Shag:word):boolean;
var TekKodMax,TekKodMin,Kod:LongInt;i:longInt;Rez,Sum:real;
begin
    GetMaxMin:=False;
    Fir.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(LongInt)*Point1);
    FiR.read(TekKodMax,SizeOf(LongInt));
    TekKodMin:=TekKodMax;NumMax:=Point1;NumMin:=Point1;Sum:=0;
    i:=Point1;
    if Shag=1 then
    begin
      Fir.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(longint)*i);
      for i:=Point1 to Point2 do
       begin
        FiR.read(Kod,SizeOf(longint));
        if Kod>TekKodMax then begin TekKodMax:=Kod;NumMax:=i;end;
        if Kod<TekKodMin then begin TekKodMin:=Kod;NumMin:=i;end;
{        if StatRec.bTekPar then GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC)  else Sum:=Sum+Kod;}
       if not StatRec.bTekPar then Sum:=Sum+Kod else GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC);
{        GetTekPar(Rez);}
       end;
    end
     else
       repeat
        Fir.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(longint)*i);
        FiR.read(Kod,SizeOf(longint));
        if Kod>TekKodMax then begin TekKodMax:=Kod;NumMax:=i;end;
        if Kod<TekKodMin then begin TekKodMin:=Kod;NumMin:=i;end;
{        if StatRec.bTekPar then GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC)  else Sum:=Sum+Kod;}
        if not StatRec.bTekPar then Sum:=Sum+Kod else GetTekMxDx(Shapka.MaxRez*Kod/Shapka.LADC);
{        GetTekPar(Rez);}
        inc(i,Shag);
       until i>Point2;
    Max:=Shapka.MaxRez*TekKodMax/Shapka.LADC;
    Min:=Shapka.MaxRez*TekKodMin/Shapka.LADC;
    StatRec.bStatMax:=true;StatRec.rStatMax:=Max;
    StatRec.bStatMin:=true;StatRec.rStatMin:=Min;
    GetMaxMin:=True;
    StatRec.bStatMx:=true;
    if not StatRec.bTekPar then
     begin
       Sum:=Sum*Shapka.MaxRez/Shapka.LADC;
       {if Point2-Point1<>0 then} StatRec.rStatMx:=Sum/(Point2-Point1+1)
         {else StatRec.rStatMx:=Sum};
     end else StatRec.bStatDx:=true
end;

Function TLongDataADC18.WriteDataFromBuf(PointBegin:longint;BufPtr:Pointer):boolean;

type TBuffer=array[0..(SizeBufferDef div 2)-1] of LongInt;
var Buf:^TBuffer;N:word;
 begin
     WriteDataFromBuf:=False;
     N:=SizeOf(LongInt)*SizeBufWrite;
     Buf:=BufPtr;
     if PointBegin=-1 then PointBegin:=0;
     Fi.Position:=(Fi.Size);
     Fi.write(Buf^,N);
     Shapka.LPointEnd:=Shapka.LPointEnd+SizeBufWrite;
     Shapka.LPointAll:=Shapka.LPointEnd;
     Shapka.rMaxX:=Shapka.LPointEnd/Shapka.rClock;
     if not SaveShapka(Shapka.scFile) then Exit;
     Fi.Destroy; Fi:=nil;
     FiR.Destroy;Fir:=Nil;
     FiR:=TFileStream.Create(Shapka.scFile,fmOpenRead+fmShareDenyNone);
     Fi:=TFileStream.Create(Shapka.scFile,fmOpenWrite+fmShareDenyNone);
     WriteDataFromBuf:=True;
 end;

{Function TLongDataADC18.SetData(Point:longint;Rez:real):boolean;
var Kod:LongInt;
 begin
    SetData:=False;
    Fi.Position:=(SizeOf(Shapka)+SizeOf(TPrimech)+
    Shapka.ActChanal*Shapka.lPointAll*cSizeRez[Shapka.TipData]+SizeOf(LongInt)*Point);
    if Fi^.Status<>StOk then exit;
    Kod:=round(Rez/Shapka.MaxRez*Shapka.Ladc);
    Fi^.write(Kod,SizeOf(LongInt));
    if Fi^.Status<>StOk then exit;
    SetData:=True;
 end;
 }
Function TLongDataADC18.GetDataFromBuf(Point:longint;BufPtr:Pointer):real;
type TBuffer=array[0..SizeBufferDef-1] of LongInt;
var Buf:^TBuffer;
 begin
     Buf:=BufPtr;
     GetDataFromBuf:=Shapka.MaxRez*Buf^[Point mod SizeBuffer]/Shapka.LADC;
 end;

Destructor TLongDataADC18.Done;
 begin
  FreeMem(BufferADCStart,SizeOf(TBufferLInt));
  FreeHeap;
  if Shapka.pPrimech<>nil then FreeMem(Shapka.pPrimech,SizeOf(TPrimech));
  Shapka.pPrimech:=nil;
  if Fi<>nil then Fi.Destroy; Fi:=nil;
  if FiR<>nil then FiR.Destroy; Fir:=nil;
  inherited Done;
 end;
{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}

Constructor TAnyChanalData.InitFirst(Fname:TFileNameStr);
 begin
    inherited initFirst(FName) ;
    if Not GetChanalInfo then begin Fail;exit;end;
    Shapka.TipData:=cAnyChanal;
 end;


Constructor TAnyChanalData.InitSecond(Fname:TFileNameStr;Point1,Point2:LongInt);
 begin
   inherited InitSecond( Fname,Point1,Point2) ;
   if Not GetChanalInfo then begin Fail;exit;end;
   Shapka.TipData:=cAnyChanal;
 end;

Constructor TAnyChanalData.InitForSeismo(Fname:TFileNameStr;Point1:LongInt);
 begin
   inherited InitForSeismo( Fname,Point1) ;
   if Not GetChanalInfo then begin Fail;exit;end;
   Shapka.TipData:=cAnyChanal;
 end;

Function TAnyChanalData.GetChanalInfo:boolean;
var i:byte;
begin
 GetChanalInfo:=false;
 if ChanalInfo=nil then   GetMem(ChanalInfo,Shapka.NChanal*SizeOf(TChanalInfoRec));

 Fi.Position:=(Sizeof(TLongShapka)+SizeOf(TPrimech)+
    Shapka.lPointall*LongInt(Shapka.nChanal)*SizeOf(single));
 Fi.Read(ChanalInfo^,Shapka.NChanal*SizeOf(TChanalInfoRec));
 GetChanalInfo:=true;
 for i:=0 to Shapka.NChanal-1 do
  begin
   if (ChanalInfo^[i].NomInPoly <>255) then Shapka.ActChanal:=i;
   if ChanalInfo^[i].YMax=ChanalInfo^[i].YMin then ChanalInfo^[i].YMax:=ChanalInfo^[i].YMax+1;
  end;
 Shapka.scAxisY:=ChanalInfo^[Shapka.ActChanal].NameChanal;
end;

function TAnyChanalData.GetHeap:boolean;
var NeedMem:word;
 begin
  with Shapka do
   begin
     NeedMem:=SizeOf(TPrimech)+longint(SizeOf(TChanalInfoRec))*Shapka.NChanal;
     if MaxAvail > NeedMem then GetMem(Pointer(pPrimech),SizeOf(TPrimech))
              else begin GetHeap:=False;exit;end;
    GetMem(ChanalInfo,Shapka.NChanal*SizeOf(TChanalInfoRec));
   end;
   GetHeap:=true;
 end;

Function TAnyChanalData.LoadToHeap:boolean;
 begin
    Fi.Position:=(0);
    Fi.read(Shapka,SizeOf(TLongShapka));
    Fi.Position:=(SizeOf(TLongShapka));
    Fi.read(Shapka.pPrimech^,SizeOf(TPrimech));
    LoadToHeap:=GetChanalInfo;
 end;

Function TAnyChanalData.Save(FName:shortstring):boolean;
 var
     FiW:TFileStream;
 begin
    FiW:=TFileStream.Create(Fname,fmOpenWrite+fmShareDenyNone);
    if FiW=nil then begin Save:=false;exit;end;
    FiW.Position:=(0);
    FiW.write(Shapka,SizeOf(TLongShapka));
    FiW.write(Shapka.pPrimech^,SizeOf(TPrimech));
    FiW.Position:=(Sizeof(TLongShapka)+SizeOf(TPrimech)+Shapka.lPointall*LongInt(Shapka.nChanal)*sizeOf(Single));
    FiW.Write(ChanalInfo^,Shapka.NChanal*SizeOf(TChanalInfoRec));
    FiW.Destroy;
    Save:=true;
 end;


Procedure TAnyChanalData.GetMaxVal;
 begin
{  if Shapka.bMaxMinExist then exit;
  SetMaxMin;}
  with Shapka do
  begin
   rMinX:=rTimeStart;rMaxX:=lPointEnd/rClock;
   rMaxY:=ChanalInfo^[ActChanal].YMax;
   RMinY:=ChanalInfo^[ActChanal].YMin;;
   if rmaxY=0 then begin rmaxY:=1;rminY:=-1;end;
  end;
 end;

Function TAnyChanalData.SetMaxMin:boolean;
 begin
 SetMaxMin:=True; Shapka.bMaxMinExist:=true;
 GetMaxVal;
end;

Function TAnyChanalData.SetMaxMinAll:boolean;
 begin
 SetMaxMinAll:=SetMaxMin;
end;

{Function TAnyChanalData.NextString(Point:longint;Format:byte):shortstring;
var Rez:real;
begin
 GetData(Point,Rez);
 NextString:=LongIntToStr(Point,6)+'   X='+
     RealToStr(Point/Shapka.RClock,1,Format)+' '+ChanalInfo^[Shapka.ActChanal].NameChanal+'='+RealToStr(Rez,1,Format);
end;
 }

Destructor TAnyChanalData.Done;
 begin
  SaveMaxMin;
  FreeHeap;
  if Shapka.pPrimech<>nil then FreeMem(Shapka.pPrimech,SizeOf(TPrimech));
  Shapka.pPrimech:=nil;
  if Fi<>nil then Fi.Destroy; Fi:=Nil;
  FreeMem(ChanalInfo,Shapka.NChanal*SizeOf(TChanalInfoRec));
  ChanalInfo:=nil;
  inherited Done;
 end;
{--------------------------------------------------------------------}
{ Методы объекта TAllData18                                          }
{---------- объект для получения данных для длинной реализации-------}

Constructor TAllData18.InitFirst(Fname:TFileNameStr);
var
 i,j:byte;

 begin
    inherited InitFirst(FName) ;
    Shapka.TipData:=cAllData18;
    MaxRezArrAll:=pMaxRezArrayAll(Shapka.pPrimech);
    BufNameAll:=(addr(MaxRezArrAll^[cMaxDynChan]));
 (*   for i:=1 to Shapka.NChanal do
     begin
{      GetName(i-1);}
      FiAll[i]:=TFileStream.Create(BufNameAll^[i-1],fmOpenRead);
      if FiAll[i]=nil then
       begin
        fail; exit;
       end
     end;
*)end;

Procedure TAllData18.GetName(i:word);
var
 P: PathStr;
 D: shortstring;{DirStr;}
 N: shortstring{NameStr;};
 E: shortstring{ExtStr;};
begin
{ FSplit(BufNameAll^[i],D,N,E); BufNameAll^[i]:=N+E;
 FSplit(Shapka.scFile,D,N,E);
 BufNameAll^[i]:=D+BufNameAll^[i];}
end;

Destructor TAllData18.Done ;
var
 j:byte;
begin
  for j:=1 to Shapka.NChanal do
     if FiAll[j]<>nil then begin FiAll[j].Destroy; FiAll[j]:=nil;end;
  inherited done;
end;

{--------------------------------------------------------------------}
{          Методы объекта TAllData                                   }
{---------- объект для получения данных для длинной реализации-------}

Constructor TAllData.InitFirst(Fname:TFileNameStr);
var
 i,j:byte;
 begin
    inherited InitFirst(FName) ;
    Shapka.TipData:=cAllData;
    MaxRezArrAll:=pMaxRezArrayAll(Shapka.pPrimech);
    BufNameAll:=(addr(MaxRezArrAll^[cMaxDynChan]));
  (*  for i:=1 to Shapka.NChanal do
     begin
      FiAll[i]:=nil;
      {GetName(i-1);}
      FiAll[i]:=TFileStream.Create(BufNameAll^[i-1],fmOpenRead);
      if FiAll[i]=nil then
       begin
        fail; exit;
       end
     end;
*)end;


{+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}









 Procedure GetAbsTime(var AbsTime:tDateTimeRec);
begin
 with AbsTime do
  begin
   decodeDate(date,Year,Month,Day);
   DecodeTime(Time,Hour,Minute,Second,Sec100);
  end;
end;

procedure GetAbsTimeFromSec(var AbsTime:tDateTimeRec;SecGlob:real);
var Ost:real;
begin
(*  AbsTime.Sec100:=trunc((SecGlob-trunc(SecGlob))*100);
  AbsTime.Second:=trunc(SecGlob-(AbsTime.Hour+0.0)*3600.0-
                                 AbsTime.Minute*60);
  AbsTime.Minute:=trunc((SecGlob-(AbsTime.Hour+0.0)*3600.0)/60);
  AbsTime.Hour:=trunc(SecGlob/3600) mod 24;
  AbsTime.Day:=AbsTime.Day+(trunc(SecGlob/3600) div 24);
  *)
  with AbsTime  do
   begin
{    Day:=trunc(SecGlob /(3600*24));Ost:=SecGlob-(Day+0.0)*3600*24;}
    Hour:=trunc(SecGlob/3600);
    Ost:=SecGlob-longint(Hour)*3600;
    Minute:=trunc(Ost/60);
{    if Minute>59 then
      Day:=Day;      }
    Second:=trunc(Ost-Minute*60);
    Sec100:=trunc((SecGlob-trunc(SecGlob))*100);

    Day:=Day+(Hour div 24);Hour:=Hour mod 24;

   end;
end;

Function GetAbsTimeStr(AbsTime:tDateTimeRec):shortstring;
 var Stroka:shortstring;
begin
 Stroka:='';
 with AbsTime do
  begin
   if Day<10 then Stroka:=Stroka+'0'+IntToStr(Day) else Stroka:=Stroka+IntToStr(Day);
   if Month<10 then Stroka:=Stroka+'.0'+IntToStr(Month) else Stroka:=Stroka+'.'+IntToStr(Month);
   if Year<1900 then Stroka:=Stroka+'.000'+IntToStr(Year) else Stroka:=Stroka+'.'+IntToStr(Year);
   if Hour<10 then Stroka:=Stroka+'  0'+IntToStr(Hour) else Stroka:=Stroka+'  '+IntToStr(Hour);
   if Minute<10 then Stroka:=Stroka+':0'+IntToStr(Minute) else Stroka:=Stroka+':'+IntToStr(Minute);
   if Second<10 then Stroka:=Stroka+':0'+IntToStr(Second) else Stroka:=Stroka+':'+IntToStr(Second);
   if Sec100<10 then Stroka:=Stroka+'.0'+IntToStr(Sec100) else Stroka:=Stroka+'.'+IntToStr(Sec100);
  end;
  GetAbsTimeStr:=Stroka;
end;

begin

  Rad:=pi/180;
  Grad:=180/Pi;             

 end.
