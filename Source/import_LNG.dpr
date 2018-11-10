library import_LNG;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  sharemem,
  windows,
  SysUtils,
  Classes, dateutils,
{  math,}
{  forms,}
  tvc_u in 'tvc_u.pas';

{$R *.res}
const
  ScaleTD_LNG = 1000;
type
{$A-}
  TLongShapka = record
    bMaxMinExistAll, bMaxMinExist: boolean;
    rMaxX, rMinX, rMaxY, rMinY: single;
    ActChanal: byte; { активный канал -    нумерация от 0}
    NChanal: byte; { сколько всего каналов. Для одноканального - 1, для 2-х каналов - 2  и т.д. }
    lPointStart, lPointEnd, lPointAll: longInt;
    rTimeStart: single;
    shTimeFormat: shortint;
    rClock: single; {частота дискретизации Гц}
    bCreated: boolean;
    scAxisX, scAxisY: TAxisStr; {обозначение осей}
    ScFile: TFileNameStr;
    TipData: byte;
    LADC: longint;
    MaxRez: single;
    scHeader: THeaderStr;
    AbsTime: tDateTimeRec_Gemis;
    fText: tFileNameStr;
    pPrimech: PrimechPtr;
  end;

{$A+}

procedure GetData_LNG(
  SourceFilename: TFilename; // шёїюфэ√щ ёшуэры
  DestFilename: TFileName; // °рсыюэ шьхэш Їрщыр фы  фрээ√ї яю ърэрырь
  SignalShapka: TSignalShapka; //юяшёрэшх тїюфэюую ёшуэрыр
  var ChanArray: TChanArray //юяшёрэшх  фрээ√ї яю ърэрырь
  );
  export;
var
  FDS, FDD: TFileStream;
  LNG: TLONGShapka;
  i, j: integer;
  DataSingle: array of single;
  DataWord: array of smallint;
  DataInt: array of integer;
begin
  FDS := TFileStream.Create(SourceFilename, fmOpenRead);
  FDS.Read(LNG, SizeOf(TLONGShapka));
  FDS.position:=SizeOf(TLONGShapka)+SizeOf(TPrimech);
  DataSingle := nil; setlength(DataSingle, sizeof(single)*SignalShapka.npoints);
  for j := 0 to SignalShapka.NchanalOriginal - 1 do
  begin
//     filename:=s+'ln'+inttostr(j+1);
    FDD := TFileStream.Create(DestFileName + '_ch' + inttostr(j + 1) + '.gms', fmCreate);
    case signalshapka.TipData of
      cRealLong, cSeismoReal:
        begin
                FDS.Read(DataSingle[0], sizeof(single) * SignalShapka.Npoints);
          for i := 0 to (SignalShapka.Npoints - 1) do
            DataSingle[i] := DataSingle[i] * 1{SignalShapka.quants[j].a1};
        end;
      cWordLong,cSeismoWord,CAllData:
        begin
          FDS.seek(SizeOf(TLongShapka) + SizeOf(TPrimech) + j * sizeof(word) * SignalShapka.npoints, soFromBeginning);
          DataWord := nil; setlength(DataWord, sizeof(word)*SignalShapka.npoints);
          FDS.Read(DataWord[0], csizeRez[cWordLong] * SignalShapka.Npoints);
          for i := 0 to (SignalShapka.Npoints - 1) do
            DataSingle[i] := DataWord[i] * SignalShapka.quants[j].a1;
          dataWord := nil;
        end;
      cAllData18:
        begin
          FDS.seek(SizeOf(TLongShapka) + SizeOf(TPrimech) + j * sizeof(integer) * SignalShapka.npoints, soFromBeginning);
          DataInt := nil; setlength(DataInt, sizeof(integer)*SignalShapka.npoints);
          FDS.Read(DataInt[0], csizeRez[calldata18] * SignalShapka.Npoints);
          for i := 0 to (SignalShapka.Npoints - 1) do
            DataSingle[i] := DataInt[i] * SignalShapka.quants[j].a1;
          dataInt := nil;
        end;
    end; //case
    FDD.write(datasingle[0], sizeof(DataSingle) * SignalShapka.Npoints);
    FDD.Destroy;
    ChanArray[j].NOMER:=j+1;
    ChanArray[j].HEADER:=dostowin(lng.scHeader);
    ChanArray[j].DELTX:=1/lng.rClock;
    ChanArray[j].NAMEX:=lng.scAxisX;
    ChanArray[j].RAZMX:='ёхъ';
    ChanArray[j].NAMEY:=lng.scAxisY+inttostr(j);
    ChanArray[j].RazmY:='┬';
    ChanArray[j].RazmY:='┬';
    ChanArray[j].MULTX:=1;
    ChanArray[j].MULTY:=1;
    ChanArray[j].MAXX:=lng.rMaxX;
    ChanArray[j].MAXY:=lng.rMaxY;
    ChanArray[j].MINX:=lng.rMinX;
    ChanArray[j].MINY:=lng.rMinY;
    ChanArray[j].DateTime_START:=signalshapka.Date_Eksp;
    ChanArray[j].POINTALL:=Signalshapka.NPoints;
    ChanArray[j].BMAXMINX:=lng.bMaxMinExist;
    ChanArray[j].BMAXMINY:=lng.bMaxMinExistAll;
    ChanArray[j].FileDat:=DestFileName + '_ch' + inttostr(j + 1) + '.gms';
    ChanArray[j].SIGNALMEMO:='';
    ChanArray[j].SIGNAL_SELECTED:=1;
    ChanArray[j].File_Seek:=0;
  end;
  datasingle := nil;
//  FDD.close;
  FDS.Free;
end;



procedure GETINFO_LNG(
  FileName: TFilename;
  var SignalShapka: TSignalShapka //юяшёрэшх тїюфэюую ёшуэрыр
  )
  export;
var
  FDS: TFileStream;
  LNG: TLONGShapka;
var i: integer;
begin
  FDS := TFileStream.Create(Filename, fmOpenRead);
  FDS.Read(LNG, SizeOf(TLONGShapka));

  SignalShapka.TipData := LNG.TipData;
  SignalShapka.date_eksp := encodedatetime(LNG.abstime.Year, LNG.abstime.Month, LNG.abstime.Day,
    LNG.abstime.Hour, LNG.abstime.minute, LNG.abstime.second, LNG.abstime.Sec100);
  SignalShapka.TD := 1 / LNG.rclock;
  SignalShapka.NPoints := LNG.lPointAll;
  SignalShapka.NChanal := LNG.Nchanal;
  SignalShapka.NChanalOriginal := LNG.Nchanal;
  for i := 0 to 31 do SignalShapka.quants[i].a1 := LNG.MaxRez / LNG.LADC;
  for i := 0 to 31 do SignalShapka.quants[i].a0 := 0;
  for i := 0 to 31 do SignalShapka.quants[i].a2 := 0;
  for i := 0 to 31 do SignalShapka.quants[i].a3 := 0;
  SignalShapka.typeofsignal := 'lng';
  SignalShapka.e_functime := 't';

  FDS.free;
end;


exports
  GETINFO_LNG name 'GETINFO_LNG',
  GETDATA_LNG name 'GETDATA_LNG';
end.


