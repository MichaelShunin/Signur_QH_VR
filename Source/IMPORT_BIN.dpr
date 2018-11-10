library IMPORT_BIN;

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
  Classes,
  dateutils,
  tvc_u in 'tvc_u.pas';

{$R *.res}
{const
  ScaleTD_LNG = 1000; }
type
{$A-}
  TBINShapka = record
(*
-> Seance 99
-> Folder GelP
-> Date 02/09/2004
-> Time 11:30:01,510 Local
-> Channels 4
-> Freq 100 Hz/Ch
-> Range -5 V
-> BUFFER 10 sec
-> FORMAT BIN/LBS
-> DAQ 516
-> 0 Timer         N/A 6 1
-> 1 Velosimeter    Z  1 1
-> 2 Velosimeter   O-W 1 1
-> 3 Velosimeter   N-S 1 1
-> EOH*)

 Header: array[1..500] of char;
(*
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
  *)
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

procedure GETINFO_BIN(
  FileName: TFilename;
  var SignalShapka: TSignalShapka //описание входного сигнала
  )
  export;
var
  FDS: TFileStream;
  BIN: TBinShapka;
  NFiles:integer;
  dataSize:Integer;
  ShapArray:array of TBinShapka;
  f:File of byte;
  File_size:integer;
  eTime:real;
  hh,mm,ss,dss:word;
  dd,mmm,yy:word;
i: integer;
s:string;
Strings:TStringList;
nchanstr:string;
Freqstr:string;
begin

try
   AssignFile(f, FileName);    Reset(f);
   File_size:=Filesize(F);
   CloseFile(f);
 except
end;
 try
//  NFiles:=File_size div sizeof(TBinShapka);
//  setlength(shaparray,Nfiles);

(*
-> Seance 99                         0
-> Folder GelP                       1
-> Date 02/09/2004                   2
-> Time 11:30:01,510 Local           3
-> Channels 4                        4
-> Freq 100 Hz/Ch                    5
-> Range -5 V                        6
-> BUFFER 10 sec                     7
-> FORMAT BIN/LBS                    8
-> DAQ 516                           9
-> 0 Timer         N/A 6 1           10
-> 1 Velosimeter    Z  1 1           11
-> 2 Velosimeter   O-W 1 1           12
-> 3 Velosimeter   N-S 1 1           13
*)
  FDS := TFileStream.Create(Filename, fmOpenRead);
  FDS.Read(Bin, 500);
  s:=Bin.Header;
  s:=copy(s,1,pos('-> EOH',s)+8);
  datasize:=File_size-length(s);
  Strings:=TStringList.Create;
  Strings.Text:=s;
//  Timestr:=Strings[3];
  hh:=strtoint(copy(Strings[3],9,2));
  mm:=strtoint(copy(Strings[3],12,2));
  ss:=strtoint(copy(Strings[3],15,2));
  dss:=strtoint(copy(Strings[3],18,3));

  dd:=strtoint(copy(Strings[2],9,2));
  mmm:=strtoint(copy(Strings[2],12,2));
  yy:=strtoint(copy(Strings[2],15,4));
  SignalShapka.Date_Eksp:=encodedatetime(yy,mmm,dd,hh,mm,ss,dss);
  nchanstr:=strings[4];
  delete(nchanstr,1,12);
  SignalShapka.NChanal:=strtoint(trim(NChanstr));
  SignalShapka.NChanalOriginal:=SignalShapka.NChanal;
  freqstr:=strings[5];
  delete(freqstr,1,8);
  freqstr:=trim(freqstr);
  freqstr:=copy(freqstr, 1,pos('Hz/Ch',freqstr)-1);
  signalshapka.TD:=1/strtoint(trim(freqstr));
  SignalShapka.NPoints:=DataSize div 2 div Signalshapka.NChanal;
  for i:=0 to  SignalShapka.Nchanal-1 do SignalShapka.quants[i].a1:=5.12/32767.0;
  for i:=0 to  SignalShapka.NChanal-1 do SignalShapka.quants[i].a0:=0;
  for i:=0 to  SignalShapka.NChanal-1 do SignalShapka.quants[i].a2:=0;
  for i:=0 to  SignalShapka.NChanal-1 do SignalShapka.quants[i].a3:=0;
  for i:=0 to SignalShapka.NChanal-1 do
   SignalShapka.ChanName[i] := copy(strings[10+i],6,17);

  SignalShapka.typeofsignal:='BIN';
  SignalShapka.e_functime:='t';
  SignalShapka.TipData := cRealLong ;
//  SignalShapka.

   finally
//   setlength(shaparray,0);

    FDS.free;
    Strings.Free;
    end;

end;


procedure GetData_BIN(
  SourceFilename: TFilename; // исходный сигнал
  DestFilename: TFileName; // шаблон имени файла для данных по каналам
  SignalShapka: TSignalShapka; //описание входного сигнала
  var ChanArray: TChanArray //описание  данных по каналам
  );
  export;
var
  FDS,  FDD: TFileStream;

  f:file of byte;

  cf,i: integer;
  N,N1:integer;
  DataInt: array of smallint;
  DataSingle: array of single;
  File_Size:integer;
  NFiles:integer;
  StartPos:integer;
  BIN: TBinShapka;
  s:string;
  Nomer:Integer;
  Strings:TStringList;

 begin
try
   AssignFile(f, SourceFileName);    Reset(f);
   File_size:=Filesize(F);
   CloseFile(f);
 except
 end;
  StartPos:=File_Size - SignalShapka.NPoints*2*SignalShapka.NChanal;
  FDS := TFileStream.Create(SourceFilename, fmOpenRead);

  FDS.Read(Bin, 500);
  s:=Bin.Header;
  s:=copy(s,1,pos('-> EOH',s)+8);
  Strings:=TStringList.Create;
  Strings.Text:=s;

  for cf:=0 to SignalShapka.NChanal-1 do
   begin
      SignalShapka.NPoints:=SignalShapka.NPoints;
      SignalShapka.TD:=SignalShapka.TD;
      ChanArray[cf].NOMER:=cf+1;
      ChanArray[cf].HEADER:=Strings[10+cf];
      ChanArray[cf].DELTX:=SignalShapka.td;
      ChanArray[cf].NAMEX:='t';
      ChanArray[cf].RAZMX:='сек';
      ChanArray[cf].NAMEY:=copy(trim(copy(Strings[10+cf],pos('  ',Strings[10+cf]),length(Strings[10+cf]))),1,3);
      ChanArray[cf].RazmY:='В';
      ChanArray[cf].MULTX:=1;
      ChanArray[cf].MULTY:=1;
      ChanArray[cf].MAXX:=0;//BIN.rMaxX;
      ChanArray[cf].MAXY:=0;//BIN.rMaxY;
      ChanArray[cf].MINX:=0;//BIN.rMinX;
      ChanArray[cf].MINY:=0;//BIN.rMinY;
      ChanArray[cf].DateTime_START:=signalshapka.Date_Eksp;
      ChanArray[cf].POINTALL:=Signalshapka.NPoints;
      ChanArray[cf].BMAXMINX:=false;//BIN.bMaxMinExist;
      ChanArray[cf].BMAXMINY:=false;//BIN.bMaxMinExistAll;
      ChanArray[cf].FileDat:=DestFileName + '_ch' + inttostr(cf + 1) + '.gms';
      ChanArray[cf].SIGNALMEMO:=s;
      ChanArray[cf].SIGNAL_SELECTED:=1;
      ChanArray[cf].File_Seek:=0;

     SignalShapka.ChanName[cf] := ChanArray[cf].NAMEY;
   end;

     FDS.position:=StartPos;

     DataInt:=nil;
     setlength(DataInt,SignalShapka.npoints*SignalShapka.NChanal);
     FDS.Read(dataInt[0],SignalShapka.npoints*sizeof(smallint)*SignalShapka.NChanal) ;
     FDS.Destroy;

     DataSingle := nil; setlength(DataSingle, sizeof(single)*SignalShapka.npoints);

     for cf:=0 to SignalShapka.NChanal-1 do
      begin
      FDD := TFileStream.Create(DestFileName + '_ch' + inttostr(cf + 1) + '.gms', fmCreate);
       begin
        for i:=0 to (SignalShapka.Npoints-1) do
         begin
          nomer:= i*SignalShapka.NChanal+Signalshapka.NChanal-CF-1;
          DataSingle[i]:=DataInt[Nomer]*SignalShapka.quants[cf].a1;
         end;
        FDD.write(datasingle[0], sizeof(DataSingle) * SignalShapka.Npoints);
        FDD.Destroy;
       end;
      end;
      dataInt:=nil;

      datasingle := nil;
      Strings.free;
end;

exports
  GETINFO_BIN name 'GETINFO_BIN',
  GETDATA_BIN name 'GETDATA_BIN';
end.



