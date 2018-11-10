unit tvc_u;

interface
      const

  MAX_SELECT_IN_TRANSACTION = 500;

 cRealLong = 0;   cWordLong = 1;    cADCLong = 2;
 cLong18 = 3;   cVoltMeterLong = 4;    cBasaLong      =5;
 cSeismoReal =6;  cSeismoWord =7;    cSeismoLInt =8;
 cWordLongLupa = 9;   CAllDynData18=10;  CAllDynData=11;
 CAllData18=12;   CAllData=13;  cMapData = 14;
 cAnyChanal =15;  CLCardData=16;

 SpectrParFileName='spctrPar.cfg';
   Zapas = 100;
 
 cSizeRez: array[CRealLong..cLCardData] of byte =
    (SizeOf(Single),SizeOf(word),SizeOf(Word),
     SizeOf(LongInt), SizeOf(Single),SizeOf(Single),
     SizeOf(Single), SizeOf(Word),SizeOf(LongInt),
     SizeOf(Word), SizeOf(LongInt),SizeOf(Word),
     SizeOf(LongInt),SizeOf(Word),SizeOf(Single),
     SizeOf(Single),SizeOf(Single));
 WM_COPYDATA = $004A;

 ModeArray:array[0..4] of string =
  ('Включение ','Отключение ','Включение на КЗ ','Успешное АПВ ','Неуспешное АПВ ');
 ModeTimeArray:array[0..4] of byte =
  (1,1,3,3,5);

 type
  PCopyDataStruct = ^TCopyDataStruct;
  TCopyDataStruct = record
    dwData: LongInt;
    cbData: LongInt;
    lpData: Pointer;
  end;
  PRecToPass = ^TRecToPass;
  TRecToPass = packed record
    FName:shortstring;
  end;
  
  type
{$A-}
  TQuantRec = record 
  a0,a1,a2,a3:double
  end;

  TStageRec = record
   Pointstart, pointFinish: integer;
   etapstart,etapfinish: smallint;
   end;

const
 NStrokPrimech=10;
 WidthStrokPrimech=60;

type
 TAxisStr= string[5];
 TPrimech= array[1..NStrokPrimech] of string[WidthStrokPrimech];
 PrimechPtr=^TPrimech;
 tFileNameStr = string[79];
 THeaderStr= string[40];
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

  TSignalShapka = record
//    Signatura:longint;
    TipData:byte;
    Date_Eksp:TDatetime;
    TD:double;   //шаг дискретизации, сек  или щаг по Х
    NPoints:longint;
    NChanalOriginal:byte;
    NChanal:byte;
    ChanOn:array[0..255] of byte;  // не более 256 каналов
    Quants:array[0..255] of TQuantRec;
    ChanName:array[0..255] of string[7];
    FormatY:array[0..255] of string[5];
    typeofsignal:string[8];
    AxisX_Name:string[15];
    windowheader:string[30];
    E_stage:string[30];
    FormatX:string[15];
    XY_Mode:string[3];
    e_functime:char;
    e_name:string[45];
 end;

  TLCRShapka = record
    Signatura:longint;
    TipData:byte;
    Year,Month,Day,
    Hour,Min,Sec,DSec:word;
    TD:double;   //шаг дискретизации, mkc
    NPoints:longint;
    NChanal:byte;
    ChanOn:array[0..31] of byte;
    Quants:array[0..31] of double;
  end;
  TOSLShapka = record
    etap1:byte;etap2:byte;Zapas:word;//Signatura:longint;
    TipData:byte;
    Year,Month,Day,
    Hour,Min,Sec,DSec:word;
    TD:double;   //шаг дискретизации, mkc
    NPoints:longint;
    NChanal:byte;
    ChanOn:array[0..31] of byte;
    Quants:array[0..31] of double;
      TMode:byte; TTime:array[0..4] of byte;
      Oil:byte;
  end;
 TOvvShapka = record
//      file://Signatura:longint;
      Etap1,Etap2:byte; Sign:Smallint;
      TipData:byte;
      Year,Month,Day,
      Hour,Min,Sec,DSec:word;
      TD:double;         //шаг дискретизации, mkc
      NPoints:longint;
      NChanal:byte;
      ChanOn:array[0..31] of byte;
      Quants:array[0..31] of double;
      TMode:byte; TTime:array[0..4] of byte;
      Oil:byte;
     end;
{TMode - режим испытаний, от 0 до 4.

Включение  (0)
Отключение  (0)
Включение на КЗ (0-0-0)
Успешное АПВ (0-0-0)
Неуспешное АПВ (0-0-0-0-0)

TTime - длительности в условных единицах от 0 до 128, сейчас, кажется, Быков заложит по 2мс на каждую
единицу. Имеют значение столько байт из массива, сколько нужно для каждого режима. Скажем, для
Включения (режим 0) имеет смысл только первый байт, для Неуспешного АПВ (режим 4) - все пять.
Oil - наличие масла, 0 или 1 (нет или есть).
Эти 3 дополнительных поля имеют значение только для ВВ, для Осцил и КрДиаг там может быть мусор. Для
ВВ в полях этапов может быть мусор.}
 TEvvShapka = record
//      file://Signatura:longint;
      Etap1,Etap2:byte; Sign:Smallint;
      TipData:byte;
      Year,Month,Day,
      Hour,Min,Sec,DSec:word;
      TD:double;         //шаг дискретизации, mkc
      NPoints:longint;
      NChanal:byte;
      ChanOn:array[0..31] of byte;
      Quants:array[0..31] of double;
      TMode:byte; TTime:array[0..4] of byte;
      Oil:byte;
     end;
 TAvvShapka = record
//      file://Signatura:longint;
      Etap1,Etap2:byte; Sign:Smallint;
      TipData:byte;
      Year,Month,Day,
      Hour,Min,Sec,DSec:word;
      TD:double;         //шаг дискретизации, mkc
      NPoints:longint;
      NChanal:byte;
      ChanOn:array[0..31] of byte;
      Quants:array[0..31] of double;
      TMode:byte; TTime:array[0..4] of byte;
      Oil:byte;
     end;
 TkrdShapka = record
    etap1:byte;etap2:byte;Zapas:word;//Signatura:longint;
    TipData:byte;
    Year,Month,Day,
    Hour,Min,Sec,DSec:word;
    TD:double;   //шаг дискретизации, mkc
    NPoints:longint;
    NChanal:byte;
    ChanOn:array[0..31] of byte;
    Quants:array[0..31] of double;
      TMode:byte; TTime:array[0..4] of byte;
      Oil:byte;
  end;

  TE24Shapka = record
    tkb:word;ssb,minb,hhb,ddb,mmmb,yyb:byte;
    tke:word;sse,mine,hhe,dde,mmme,yye:byte;
    frq:byte;
    g:array[1..4] of byte;c4t:byte;com:byte;
    mins,hhs,dds,mmms,yys:byte;
    numf,save:word;
    alt,lon,lat:single;
    plt,dum:word;
    Memo:array[0..11,0..23] of char;
  end;
  TS386Shapka = record
    tkb:word;ssb,minb,hhb,ddb,mmmb,yyb:byte;
    tke:word;sse,mine,hhe,dde,mmme,yye:byte;
    frq:byte;
    g:array[1..4] of byte;c4t:byte;com:byte;
    mins,hhs,dds,mmms,yys:byte;
    numf,save:word;
    alt,lon,lat:single;
    plt,dum:word;
    Memo:array[0..11,0..23] of char;
    aa:array[0..3] of char;
  end;
 TLongShapka=record
   bMaxMinExistAll,bMaxMinExist: boolean;
   rMaxX,rMinX,rMaxY,rMinY:single;
   ActChanal:byte;  {  ЄвЁў­л© Є ­ « -    ­г¬Ґа жЁп ®в 0}
   NChanal:byte;  { бЄ®«мЄ® ўбҐЈ® Є ­ «®ў. „«п ®¤­®Є ­ «м­®Ј® - 1, ¤«п 2-е Є ­ «®ў - 2  Ё в.¤. }
   lPointStart,lPointEnd,lPointAll:longInt;
   rTimeStart:single;
   shTimeFormat:shortint;
   rClock:single;        {з бв®в  ¤ЁбЄаҐвЁ§ жЁЁ ѓж}
   bCreated:boolean;
   scAxisX,scAxisY:TAxisStr;  {®Ў®§­ зҐ­ЁҐ ®бҐ©}
   ScFile:TFileNameStr;
   TipData:byte;
   LADC:longint;
   MaxRez:single;
   scHeader: THeaderStr;
   AbsTime:tDateTimeRec_Gemis;
   fText:tFileNameStr;
   pPrimech: PrimechPtr;
  end;
 TUFAShapka=record
   bMaxMinExistAll,bMaxMinExist: boolean;
   rMaxX,rMinX,rMaxY,rMinY:single;
   ActChanal:byte;  {  ЄвЁў­л© Є ­ « -    ­г¬Ґа жЁп ®в 0}
   NChanal:byte;  { бЄ®«мЄ® ўбҐЈ® Є ­ «®ў. „«п ®¤­®Є ­ «м­®Ј® - 1, ¤«п 2-е Є ­ «®ў - 2  Ё в.¤. }
   lPointStart,lPointEnd,lPointAll:longInt;
   rTimeStart:single;
   shTimeFormat:shortint;
   rClock:single;        {з бв®в  ¤ЁбЄаҐвЁ§ жЁЁ ѓж}
   bCreated:boolean;
   scAxisX,scAxisY:TAxisStr;  {®Ў®§­ зҐ­ЁҐ ®бҐ©}
   ScFile:TFileNameStr;
   TipData:byte;
   LADC:longint;
   MaxRez:single;
   scHeader: THeaderStr;
   AbsTime:tDateTimeRec_Gemis;
   fText:tFileNameStr;
   pPrimech: PrimechPtr;
  end;
  TSpectrPar = record
    VidFunc:smallint;
    PointFFT:word;
    WindowFunc:smallint;
    OneOrMany:smallint;
    Smesh:Longint;
    SrednOrMap:smallint;
    SelectedSignal:smallint;
    Ao:double;
    end;
  TAB_ProcPar = record
    ActivePage:Byte;
    A_B_Vid:smallint;
    VidFunc:smallint;
    PointFFT:word;
    WindowFunc:smallint;
    OneOrMany:smallint;
    Smesh:Longint;
    SrednOrMap:smallint;
    Selected_A_Signal:smallint;
    Selected_B_Signal:smallint;
   end;
{$A+}
  TData = array of array of  smallint;
  TDataDouble= array of array of  double;
  TDataXDouble= array of  double;
{----------------------------------------------}
var
 ISGI:boolean;
 warningParam:boolean;
implementation
begin
  warningParam:=true;
end.

