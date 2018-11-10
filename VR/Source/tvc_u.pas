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
  ('��������� ','���������� ','��������� �� �� ','�������� ��� ','���������� ��� ');
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
    TD:double;   //��� �������������, ���  ��� ��� �� �
    NPoints:longint;
    NChanalOriginal:byte;
    NChanal:byte;
    ChanOn:array[0..255] of byte;  // �� ����� 256 �������
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
    TD:double;   //��� �������������, mkc
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
    TD:double;   //��� �������������, mkc
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
      TD:double;         //��� �������������, mkc
      NPoints:longint;
      NChanal:byte;
      ChanOn:array[0..31] of byte;
      Quants:array[0..31] of double;
      TMode:byte; TTime:array[0..4] of byte;
      Oil:byte;
     end;
{TMode - ����� ���������, �� 0 �� 4.

���������  (0)
����������  (0)
��������� �� �� (0-0-0)
�������� ��� (0-0-0)
���������� ��� (0-0-0-0-0)

TTime - ������������ � �������� �������� �� 0 �� 128, ������, �������, ����� ������� �� 2�� �� ������
�������. ����� �������� ������� ���� �� �������, ������� ����� ��� ������� ������. ������, ���
��������� (����� 0) ����� ����� ������ ������ ����, ��� ����������� ��� (����� 4) - ��� ����.
Oil - ������� �����, 0 ��� 1 (��� ��� ����).
��� 3 �������������� ���� ����� �������� ������ ��� ��, ��� ����� � ������ ��� ����� ���� �����. ���
�� � ����� ������ ����� ���� �����.}
 TEvvShapka = record
//      file://Signatura:longint;
      Etap1,Etap2:byte; Sign:Smallint;
      TipData:byte;
      Year,Month,Day,
      Hour,Min,Sec,DSec:word;
      TD:double;         //��� �������������, mkc
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
      TD:double;         //��� �������������, mkc
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
    TD:double;   //��� �������������, mkc
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
   ActChanal:byte;  { ��⨢�� ����� -    �㬥��� �� 0}
   NChanal:byte;  { ᪮�쪮 �ᥣ� �������. ��� ���������쭮�� - 1, ��� 2-� ������� - 2  � �.�. }
   lPointStart,lPointEnd,lPointAll:longInt;
   rTimeStart:single;
   shTimeFormat:shortint;
   rClock:single;        {���� ����⨧�樨 ��}
   bCreated:boolean;
   scAxisX,scAxisY:TAxisStr;  {������祭�� �ᥩ}
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
   ActChanal:byte;  { ��⨢�� ����� -    �㬥��� �� 0}
   NChanal:byte;  { ᪮�쪮 �ᥣ� �������. ��� ���������쭮�� - 1, ��� 2-� ������� - 2  � �.�. }
   lPointStart,lPointEnd,lPointAll:longInt;
   rTimeStart:single;
   shTimeFormat:shortint;
   rClock:single;        {���� ����⨧�樨 ��}
   bCreated:boolean;
   scAxisX,scAxisY:TAxisStr;  {������祭�� �ᥩ}
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

