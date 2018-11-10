library import_LCR;

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
  Classes,  dateutils,
{  math,}
{  forms,}
  tvc_u in 'tvc_u.pas';

{$R *.res}
const
 ScaleTD_LCR  = 1000000;
type
{$A-}
  TLCRShapka = record
    Signatura:longint;
    TipData:byte;
    Year,Month,Day,
    Hour,Min,Sec,DSec:word;
    TD:double;   //шаг дискретизации, c
    NPoints:longint;
    NChanal:byte;
    ChanOn:array[0..31] of byte;
    Quants:array[0..31] of double;
  end;

{$A+}

procedure GetData_LCR(
  SourceFilename: TFilename; // исходный сигнал
  DestFilename: TFileName; // шаблон имени файла для данных по каналам
  SignalShapka: TSignalShapka; //описание входного сигнала
  var ChanArray: TChanArray //описание  данных по каналам
  );
  export;
var
  FDS, FDD: TFileStream;
  LCR: TLCRShapka;
  i, j: integer;
  DataSingle: array of single;
  Data: smallint;
begin
  FDS := TFileStream.Create(SourceFilename, fmOpenRead);
  FDS.Read(LCR, SizeOf(TLCRShapka));
  DataSingle := nil; setlength(DataSingle, sizeof(single)*SignalShapka.npoints);
  for j := 0 to SignalShapka.NchanalOriginal - 1 do
  begin
//     filename:=s+'ln'+inttostr(j+1);
    FDD := TFileStream.Create(DestFileName + '_ch' + inttostr(j + 1) + '.gms',
      fmCreate or fmShareDenyNone);
    FDS.seek(SizeOf(TLCRShapka) + SizeOf(TPrimech) + j * sizeof(single) * SignalShapka.npoints, soFromBeginning);
    for i := 0 to (SignalShapka.Npoints - 1) do
    begin
//     FDS.seek(SizeOf(TLCRShapka)+i*(Signalshapka.npoints)*2+j*2,soFromBeginning);
     FDS.position:=SizeOf(TLCRShapka)+i*(Signalshapka.nchanal)*2+j*2;
     FDS.Read(Data, 2);
     DataSingle[i] := Data * SignalShapka.quants[j].a1;
    end;
    FDD.write(datasingle[0], sizeof(DataSingle) * SignalShapka.Npoints);
    FDD.destroy;
    ChanArray[j].NOMER:=j+1;
    ChanArray[j].HEADER:='LCR';
    ChanArray[j].DELTX:=lcr.TD;
    ChanArray[j].NAMEX:='t';
    ChanArray[j].RAZMX:='сек';
    ChanArray[j].NAMEY:='U'+inttostr(j);
    ChanArray[j].RazmY:='В';
    ChanArray[j].RazmY:='В';
    ChanArray[j].MULTX:=1;
    ChanArray[j].MULTY:=1;
    ChanArray[j].MAXX:=0;
    ChanArray[j].MAXY:=0;
    ChanArray[j].MINX:=0;;
    ChanArray[j].MINY:=0;
    ChanArray[j].DateTime_START:=signalshapka.Date_Eksp;
    ChanArray[j].POINTALL:=Signalshapka.NPoints;
    ChanArray[j].BMAXMINX:=false;
    ChanArray[j].BMAXMINY:=false;
    ChanArray[j].FileDat:=DestFileName + '_ch' + inttostr(j + 1) + '.gms';
    ChanArray[j].SIGNALMEMO:='';
    ChanArray[j].SIGNAL_SELECTED:=1;
    ChanArray[j].File_Seek:=0;
  end;
  datasingle := nil;
//  FDD.close;
  FDS.destroy;
end;



procedure  GETINFO_LCR(
        FileName:TFilename;
        var SignalShapka:TSignalShapka    //описание входного сигнала
        )
 export;
var
 FDS:TFileStream;
 LCR:TLCRShapka;
 var i:integer;
begin
  FDS:=TFileStream.Create(Filename,fmOpenRead);
  FDS.Read(LCR,SizeOf(TLCRShapka));
  SignalShapka.TipData:=LCR.TipData;
  SignalShapka.date_eksp:= encodedatetime( lcr.Year,lcr.Month,lcr.Day,
                                              lcr.Hour,lcr.min,lcr.sec,lcr.dSec);
  SignalShapka.TD:=LCR.Td/ScaleTD_LCR;
  SignalShapka.NPoints:=lcr.Npoints;
  SignalShapka.NChanal:=lcr.Nchanal;
  SignalShapka.NChanalOriginal:=lcr.Nchanal;
  for i:=0 to 31 do SignalShapka.ChanOn[i]:=lcr.chanOn[i];
  for i:=0 to 31 do SignalShapka.quants[i].a1:=lcr.quants[i];
  for i:=0 to 31 do SignalShapka.quants[i].a0:=0;
  for i:=0 to 31 do SignalShapka.quants[i].a2:=0;
  for i:=0 to 31 do SignalShapka.quants[i].a3:=0;
  SignalShapka.typeofsignal:='lcr';
  SignalShapka.e_functime:='t';
  FDS.free;
end;


exports
 GETINFO_LCR name 'GETINFO_LCR',
 GETDATA_LCR name 'GETDATA_LCR';
end.

