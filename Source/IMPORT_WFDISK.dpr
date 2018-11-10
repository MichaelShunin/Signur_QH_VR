library IMPORT_WFDISK;

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
{const
  ScaleTD_LNG = 1000; }
type
{$A-}
  TWFDISKShapka = record
 sta:	array[1..7] of char	; //		Код станции
 chan:	array[1..9] of char	;//		Код канала. Код из 8 символов однозначно связывает канал со станцией
 time:	array[1..18]of char; //f17.5		Любое возможное значение времени	Эпохальное время первого отсчета  записи. Эпохальное время- время, отсчитываемое от 0 часов 0 минут 0 секунд 1января 1970 года по Гринвичу	секунды
 wfid:	array[1..9]of char		; //	> 0	Идентификатор волновой формы
 chanid:array[1..9]of char		; //-1	> 0	Идентификатор канала
 jdate:	array[1..9]of char		; //-1	Yyyyddd (yyyy-год, ddd- день от начала года)	Дата проведения записи
 endtime: array[1..18] of char;      //	f17.5	+9999999999.999	Любое возможное значение времени <+9999999999.999	Эпохальное время последнего отсчета  записи. Эпохальное время- время, отсчитываемое от 0 часов  0 минут 0 секунд  1января 1970года по Гринвичу	секунды
 nsamp:	array[1..9] of char		; //Не допускается	> 0	Число отсчетов в волновой форме
 samprate: array[1..12] of char	; //;//	f11.7	Не допускается	> 0.0	Частота дискретизации	1/сек
 calib:	array[1..17] of char	; //;//f16.6	Не допускается	 0	Номинальный коэффициент калибровки	нанометр/ единица измерения амплитуды в файле с волновой формой
 calper:	array[1..17] of char	; //;//f16.6	Не допускается	> 0.0	Значение номинального периода, для которого определен калибровочный коэффициент calib	секунды
 instype:	array[1..7] of char		; //-		Тип прибора
 segtype:	array[1..2] of char		; //-	o=подлинник v= фактический, действительный s=сегментированный d=копия	Тип сегмента
 datatype:	array[1..3] of char			; {a0= 15-byte ASCII single precision b0=24-byte ASCII double precision c0=12-byte ASCII integer a =15-byte ASCII single precision b =24-byte ASCII double precision c =12- byte ASCII integer
                                t4=4-byte SUN IEEE single precision real
                                t8=8-byte SUN IEEE double precision real
                                s4=4-byte SUN IEEE integer
                                s2=2-byte SUN IEEE  short integer
                                f4=4-byte VAX IEEE single precision real
                                f8=8-byte VAX IEEE double precision real
                                i4=4-byte VAX IEEE integer
                                i2=2-byte VAX IEEE short integer
                                g2=2-byte NORESS gain ranged	Формат данных в файле с волновой формой}
 clip:	array[1..2] of char		; //-	c= вследствие насыщения произведено ограничение сигнала n= насыщения  сигнала не было 	  Признак насыщения сигнала
 dir:	array[1..65] of char	; //	Не допускается		  Директория, в которой размещен файл с волновой формой
 dfile:	array[1..33] of char       ; //Не допускается		  Имя файла с волновой формой
 foff:	array[1..11] of char       	; //		; //Не допускается	  0	  Смещение файла. Смещение (в байтах) сегмента данных относительно физического начала файла данных. Значение колонки не нулевое, если начало отсчета не точно совпадает с началом файла.
 commid:array[1..9] of char		; //-1	> 0	  Идентификатор комментария (по таблице remark)
 lddate:array[1..18] of char      	; //	Не допускается		Дата и время ввода данных
 addchar: char;
  end;

{$A+}

Function CharArrToStr(CharArr:array of char):string;
var
 i:integer;
 s:string;
begin
 s:='';
 for i:=low(charArr) to high(Chararr) do
  s:=s+chararr[i];
  result:=trim(s);
end;

procedure GETINFO_WFDISK(
  FileName: TFilename;
  var SignalShapka: TSignalShapka //описание входного сигнала
  )
  export;
var
  FDS: TFileStream;
  WFDISK: TWFDISKShapka;
  NFiles:integer;
  ShapArray:array of TWFDISKShapka;
  f:File of byte;
  File_size:integer;
  eTime:real;
var i: integer;
begin
try
   AssignFile(f, FileName);    Reset(f);
   File_size:=Filesize(F);
   CloseFile(f);
 except
end;
 try
  NFiles:=File_size div sizeof(TWFDISKShapka);
  setlength(shaparray,Nfiles);
  FDS := TFileStream.Create(Filename, fmOpenRead);
  FDS.Read(ShapArray[0], sizeof(TWFDISKShapka)*NFiles);
  i:=sizeof(shaparray[0].sta);
  decimalseparator:='.';
  Etime:=strtofloat( (chararrtostr(shaparray[low(Shaparray)].time)));
  SignalShapka.Date_Eksp:=encodedatetime(1970,1,1,0,0,0,0)+etime/60/60/24;
  SignalShapka.NChanal:=NFiles;
  SignalShapka.NChanalOriginal:=SignalShapka.NChanal;
  SignalShapka.NPoints:=strtoint(chararrtostr(shaparray[low(Shaparray)].nsamp));
  SignalShapka.TD:=1/strtofloat(chararrtostr(shaparray[low(Shaparray)].samprate));
  for i:=0 to NFiles-1 do SignalShapka.quants[i].a1:=1;
  for i:=0 to NFiles-1 do SignalShapka.quants[i].a0:=0;
  for i:=0 to NFiles-1 do SignalShapka.quants[i].a2:=0;
  for i:=0 to NFiles-1 do SignalShapka.quants[i].a3:=0;

  for i:=0 to NFiles-1 do
   SignalShapka.ChanName[i] := chararrToStr(shaparray[low(Shaparray)+i].chan);

  SignalShapka.typeofsignal:='WFDISC';
  SignalShapka.e_functime:='t';
  SignalShapka.TipData := cRealLong ;
//   SignalShapka.TD := 1 / WFDISK.frq;
   SignalShapka.NChanalOriginal := SignalShapka.NChanal ;

   finally
   setlength(shaparray,0);
    FDS.free;
  end;
end;


procedure GetData_WFDISK(
  SourceFilename: TFilename; // исходный сигнал
  DestFilename: TFileName; // шаблон имени файла для данных по каналам
  SignalShapka: TSignalShapka; //описание входного сигнала
  var ChanArray: TChanArray //описание  данных по каналам
  );
  export;
var
  FDS, FDS_Chan, FDD: TFileStream;

  f:file of byte;
  WFDISK: TWFDISKShapka;
  ShapArray:array of TWFDISKShapka;

  cf,i: integer;
  N,N1:integer;
  DataSingle: array of single;
  DataWord: array of smallint;
  DataInt: array of integer;
  DataWFDISK_t4:array of single;
  DataWFDISK_t8:array of double;
  DataWFDISK_s4:array of byte;
  DataWFDISK_s2:array of shortint;
  File_Size:integer;
  NFiles:integer;
begin

try
   AssignFile(f, SourceFileName);    Reset(f);
   File_size:=Filesize(F);
   CloseFile(f);
 except
end;
  NFiles:=File_size div sizeof(TWFDISKShapka);
  setlength(shaparray,Nfiles);
  FDS := TFileStream.Create(SourceFilename, fmOpenRead);
  FDS.Read(ShapArray[0], sizeof(TWFDISKShapka)*NFiles);
  i:=sizeof(shaparray[0].sta);
  SignalShapka.NChanal:=NFiles;
  SignalShapka.NChanalOriginal:=SignalShapka.NChanal;
//  SignalShapka.NPoints:=strtoint(chararrtostr(shaparray[low(Shaparray)].nsamp));
  for i:=0 to NFiles-1 do SignalShapka.quants[i].a1:=1;
  for i:=0 to NFiles-1 do SignalShapka.quants[i].a0:=0;
  for i:=0 to NFiles-1 do SignalShapka.quants[i].a2:=0;
  for i:=0 to NFiles-1 do SignalShapka.quants[i].a3:=0;

  for cf:=0 to NFiles-1 do
   begin
      SignalShapka.NPoints:=strtoint(chararrtostr(shaparray[low(Shaparray)+cf].nsamp));
      SignalShapka.TD:=1/strtofloat(chararrtostr(shaparray[low(Shaparray)+cf].samprate));
      ChanArray[cf].NOMER:=cf+1;
      ChanArray[cf].HEADER:=chararrtostr(shaparray[low(Shaparray)+cf].chan);
      ChanArray[cf].DELTX:=SignalShapka.td;
      ChanArray[cf].NAMEX:='t';
      ChanArray[cf].RAZMX:='сек';
      ChanArray[cf].NAMEY:=chararrtostr(shaparray[low(Shaparray)+cf].chan);
      ChanArray[cf].RazmY:='В';
      ChanArray[cf].MULTX:=1;
      ChanArray[cf].MULTY:=1;
      ChanArray[cf].MAXX:=0;//WFDISK.rMaxX;
      ChanArray[cf].MAXY:=0;//WFDISK.rMaxY;
      ChanArray[cf].MINX:=0;//WFDISK.rMinX;
      ChanArray[cf].MINY:=0;//WFDISK.rMinY;
      ChanArray[cf].DateTime_START:=signalshapka.Date_Eksp;
      ChanArray[cf].POINTALL:=Signalshapka.NPoints;
      ChanArray[cf].BMAXMINX:=false;//WFDISK.bMaxMinExist;
      ChanArray[cf].BMAXMINY:=false;//WFDISK.bMaxMinExistAll;
      ChanArray[cf].FileDat:=DestFileName + '_ch' + inttostr(cf + 1) + '.gms';
      ChanArray[cf].SIGNALMEMO:=chararrtostr(shaparray[low(Shaparray)+cf].chan)+' clip:'+
                                chararrtostr(shaparray[low(Shaparray)+cf].clip)+' instype:'+
                                chararrtostr(shaparray[low(Shaparray)+cf].instype)+' segtype:'+
                                chararrtostr(shaparray[low(Shaparray)+cf].segtype);
      ChanArray[cf].SIGNAL_SELECTED:=1;
      ChanArray[cf].File_Seek:=0;

     SignalShapka.ChanName[cf] := chararrToStr(shaparray[low(Shaparray)+cf].chan);

     FDS_Chan := TFileStream.Create(extractfilepath(SourceFileName)+'/'+
                                        chararrtostr(shaparray[low(Shaparray)+cf].dfile),fmOpenRead);
     FDS_Chan.position:=strtoint(chararrtostr(shaparray[low(Shaparray)+cf].foff));
     FDD := TFileStream.Create(DestFileName + '_ch' + inttostr(cf + 1) + '.gms', fmCreate);

     DataSingle := nil; setlength(DataSingle, sizeof(single)*SignalShapka.npoints);

     if ((chararrtostr(shaparray[low(Shaparray)+cf].datatype) ='s2') or
         (chararrtostr(shaparray[low(Shaparray)+cf].datatype) ='i2')) then
      begin
       DataWFDISK_s2:=nil;
       setlength(DataWFDISK_s2,SignalShapka.npoints);
       FDS_chan.Read(dataWFDISK_s2[0],SignalShapka.npoints*sizeof(shortint)) ;
       for i:=0 to (SignalShapka.Npoints-1) do
        begin
         DataSingle[i]:=DataWFDISK_s2[i]*SignalShapka.quants[cf].a1; ;
       end;
       dataWFDISK_s2:=nil;
      end;

     if ((chararrtostr(shaparray[low(Shaparray)+cf].datatype) ='s4') or
        (chararrtostr(shaparray[low(Shaparray)+cf].datatype) ='i4')) then
      begin
       DataWFDISK_s4:=nil;
       setlength(DataWFDISK_s4,SignalShapka.npoints*4);
       FDS_chan.Read(dataWFDISK_s4[0],SignalShapka.npoints*sizeof(integer)) ;
       n1:=dataWFDISK_s4[0];
       n1:=not n1;
       n1:=n1-1;
       for i:=1 to (SignalShapka.Npoints) do
        begin
         if DataWFDISK_s4[i*4-4] >=128 then
          begin
             DataWFDISK_s4[i*4-1]:= not DataWFDISK_s4[i*4-1];
             DataWFDISK_s4[i*4-2]:= not DataWFDISK_s4[i*4-2];
             DataWFDISK_s4[i*4-3]:= not DataWFDISK_s4[i*4-3];
             DataWFDISK_s4[i*4-4]:= not DataWFDISK_s4[i*4-4];
             n1:=-(DataWFDISK_s4[i*4-1]+DataWFDISK_s4[i*4-2]*256+DataWFDISK_s4[i*4-3]*256*256+DataWFDISK_s4[i*4-4]*256*256*256);
          end else    n1:=DataWFDISK_s4[i*4-1]+DataWFDISK_s4[i*4-2]*256+DataWFDISK_s4[i*4-3]*256*256+DataWFDISK_s4[i*4-4]*256*256*256;
         DataSingle[i-1]:=n1{(DataWFDISK_s4[i] shr 32) *SignalShapka.quants[cf].a1; };
       end;
       dataWFDISK_s4:=nil;
      end;

     if ((chararrtostr(shaparray[low(Shaparray)+cf].datatype) ='t4') or
         (chararrtostr(shaparray[low(Shaparray)+cf].datatype) ='f4')) then
      begin
       DataWFDISK_t4:=nil;
       setlength(DataWFDISK_t4,SignalShapka.npoints);
       FDS_chan.Read(dataWFDISK_t4[0],SignalShapka.npoints*sizeof(single)) ;
       for i:=0 to (SignalShapka.Npoints-1) do
        begin
         DataSingle[i]:=DataWFDISK_t4[i]*SignalShapka.quants[cf].a1; ;
       end;
       dataWFDISK_t4:=nil;
      end;

     if ((chararrtostr(shaparray[low(Shaparray)+cf].datatype) ='t8') or
         (chararrtostr(shaparray[low(Shaparray)+cf].datatype) ='f8')) then
      begin
       DataWFDISK_t8:=nil;
       setlength(DataWFDISK_t8,SignalShapka.npoints);
       FDS_chan.Read(dataWFDISK_t8[0],SignalShapka.npoints*sizeof(double)) ;
       for i:=0 to (SignalShapka.Npoints-1) do
        begin
         DataSingle[i]:=DataWFDISK_t8[i]*SignalShapka.quants[cf].a1; ;
       end;
       dataWFDISK_t8:=nil;
      end;

      FDS_chan.destroy;

      FDD.write(datasingle[0], sizeof(DataSingle) * SignalShapka.Npoints);
      FDD.Destroy;
      datasingle := nil;
   end;
end;

exports
  GETINFO_WFDISK name 'GETINFO_WFDISK',
  GETDATA_WFDISK name 'GETDATA_WFDISK';
end.



