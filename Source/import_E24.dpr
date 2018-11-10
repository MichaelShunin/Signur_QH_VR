library import_E24;

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

{$A+}

procedure GetData_E24_simple(
  SourceFilename: TFilename; // исходный сигнал
  DestFilename: TFileName; // шаблон имени файла для данных по каналам
  SignalShapka: TSignalShapka; //описание входного сигнала
  var ChanArray: TChanArray //описание  данных по каналам
  );
  export;
var
  FDS, FDD: TFileStream;
  E24: TE24Shapka;
  i, j: integer;
  DataSingle: array of single;
  DataWord: array of smallint;
  DataInt: array of integer;
  DataE24:array of array of  integer;
begin
  FDS := TFileStream.Create(SourceFilename, fmOpenRead);
  FDS.Read(E24, SizeOf(TE24Shapka));
  FDS.position:=SizeOf(TE24Shapka){+SizeOf(TPrimech)};
  DataSingle := nil; setlength(DataSingle, sizeof(single)*SignalShapka.npoints);
  DataE24:=nil;
  setlength(DataE24,SignalShapka.npoints,SignalShapka.Nchanaloriginal);

  for j := 0 to SignalShapka.NchanalOriginal - 1 do
  begin
   FDD := TFileStream.Create(DestFileName + '_ch' + inttostr(j + 1) + '.gms', fmCreate);
    for i:=0 to (SignalShapka.Npoints-1) do
      begin
       FDS.Position:=SizeOf(TE24Shapka)+i*(4*SignalShapka.NchanalOriginal)+j*4;
       FDS.Read(dataE24[i,j],4) ;
       DataSingle[i]:=DataE24[i,j]*1/429497 ;
     end;
    FDD.write(datasingle[0], sizeof(DataSingle) * SignalShapka.Npoints);
    FDD.Destroy;
    ChanArray[j].NOMER:=j+1;
    ChanArray[j].HEADER:='E24_'+inttostr(j);
    ChanArray[j].DELTX:=signalshapka.TD;
    ChanArray[j].NAMEX:='t';
    ChanArray[j].RAZMX:='сек';
    ChanArray[j].NAMEY:='V'+inttostr(j);
    ChanArray[j].RazmY:='В';
    ChanArray[j].RazmY:='В';
    ChanArray[j].MULTX:=1;
    ChanArray[j].MULTY:=1;
    ChanArray[j].MAXX:=0;//E24.rMaxX;
    ChanArray[j].MAXY:=0;//E24.rMaxY;
    ChanArray[j].MINX:=0;//E24.rMinX;
    ChanArray[j].MINY:=0;//E24.rMinY;
    ChanArray[j].DateTime_START:=signalshapka.Date_Eksp;
    ChanArray[j].POINTALL:=Signalshapka.NPoints;
    ChanArray[j].BMAXMINX:=false;//E24.bMaxMinExist;
    ChanArray[j].BMAXMINY:=false;//E24.bMaxMinExistAll;
    ChanArray[j].FileDat:=DestFileName + '_ch' + inttostr(j + 1) + '.gms';
    ChanArray[j].SIGNALMEMO:='';
    ChanArray[j].SIGNAL_SELECTED:=1;
    ChanArray[j].File_Seek:=0;
  end;
  dataE24:=nil;
  datasingle := nil;
//  FDD.close;
  FDS.Free;
end;


{$A+}

procedure GetData_E24(
  SourceFilename: TFilename; // исходный сигнал
  DestFilename: TFileName; // шаблон имени файла для данных по каналам
  SignalShapka: TSignalShapka; //описание входного сигнала
  var ChanArray: TChanArray //описание  данных по каналам
  );
  export;
var
  FDS, FDD: TFileStream;
  E24: TE24Shapka;
  i, j: integer;
  DataS: array  of single;
  DataSingle9: array  of double;
  DataSingleSource: array  of double;
  DataSingle: array of array of single;
//  DataWord: array of smallint;
  DataInt: array of integer;
  DataS386:array of array of  integer;
  max,sum,min1,max1,Mx:double;
  jmax,N802080:integer;
BitArray: array[1..32] of byte;
jcurrent,jbit,k,m:integer;
minuta, chas:double;
dayweek, week, gpsUTC:integer;
t0,dateeksp:Tdatetime;
 ii,E_ID:integer;
 iDown,iUp,imed:integer;

 c5,c6, c7,c8,c9:integer;
 s:string;
 label M1;
 
begin

  FDS := TFileStream.Create(SourceFilename, fmOpenRead);
  FDS.Read(E24, SizeOf(TE24Shapka));
  FDS.position:=SizeOf(TE24Shapka){+SizeOf(TPrimech)};
  DataSingle := nil;
  if SignalShapka.NchanalOriginal=4 then
   setlength(DataSingle, SignalShapka.Nchanaloriginal+5+1,sizeof(single)*SignalShapka.npoints) else
  setlength(DataSingle, SignalShapka.Nchanaloriginal+5,sizeof(single)*SignalShapka.npoints);

  DataS386:=nil;
  setlength(DataS386,SignalShapka.npoints,SignalShapka.Nchanaloriginal);
  for j := 0 to SignalShapka.NchanalOriginal - 1 do
    begin
      for i:=0 to (SignalShapka.Npoints-1) do
        begin
         FDS.Position:=SizeOf(TE24Shapka)+i*(4*SignalShapka.NchanalOriginal)+j*4;
         FDS.Read(dataS386[i,j],4) ;
         DataSingle[j,i]:=DataS386[i,j]*1/429497 ;
       end;
    end;
  if SignalShapka.NchanalOriginal=4 then
  begin
    setlength(DataSingle9,SignalShapka.NPoints);
    for i:=0 to (SignalShapka.Npoints-1) do
        begin
         DataSingle9[i]:=DataSingle[3,i];
         DataSingle[3,i]:=DataSingle[2,i];
         DataSingle[2,i]:=DataSingle[1,i];
         DataSingle[1,i]:=DataSingle[0,i];
         DataSingle[0,i]:=DataSingle9[i];
       end;
   datasingle9 := nil;
  end;

  setlength(DataSingleSource,SignalShapka.NPoints);
  for i:=0 to (SignalShapka.Npoints-1) do
    DataSingleSource[i]:=DataSingle[0,i];

  min1:= DataSingle[0,0];
  max1:= DataSingle[0,0];
  sum:=0;
  for I := 0 to SignalShapka.Npoints-1 do
    begin
     if min1 > Datasingle[0,i] then  min1 := Datasingle[0,i];
     if max1 < Datasingle[0,i] then  max1 := DataSingle[0,i];
     sum:=sum+Datasingle[0,i];
    end;
  mx:=Sum/SignalShapka.Npoints;
//   labelinfo.Caption:='коррекция выбросов на канале времени';labelinfo.Update;

 if max1<>min1 then
   for j:=1 to SignalShapka.NPoints-1 do
       if ((DataSingle[0,j]-mx)>(mx-min1)*10) then
        begin DataSingle[0,j]:=DataSingle[0,j-1]; end;

  min1:= DataSingle[0,0];
  max1:= DataSingle[0,0];
  for I := 0 to SignalShapka.Npoints-1 do
    begin
     if min1 > Datasingle[0,i] then  min1 := Datasingle[0,i];
     if max1 < Datasingle[0,i] then  max1 := DataSingle[0,i];
    end;

  for I := 0 to SignalShapka.Npoints-1 do
    begin
     if Datasingle[0,i] > ((max1-min1)/10+min1) then  Datasingle[0,i]:=max1;
    end;

//   labelinfo.Caption:='поиск метки времени';labelinfo.Update;

   if max1<>min1 then
   for j:=0 to SignalShapka.NPoints-1 do
       DataSingle[6,j]:=round(1/(max1-min1)*DataSingle[0,j])
     else     for j:=0 to SignalShapka.NPoints-1 do  DataSingle[6,j]:=DataSingle[0,j];

   for j:=0 to SignalShapka.NPoints-2 do
    begin
     if  ((DataSingle[6,j]=1) and (DataSingle[6,j+1]=1)) then
           DataSingle[7,j+1]:=DataSingle[7,j]+1
            else  DataSingle[7,j+1]:=0;
     if  ((DataSingle[6,j]=0) and (DataSingle[6,j+1]=0)) then
           DataSingle[8,j+1]:=DataSingle[8,j]+1
            else  DataSingle[8,j+1]:=0;
     end;

   for j:=100 to SignalShapka.NPoints-2 do
    begin
     if  ((DataSingle[7,j]>=0.75/SignalShapka.Td) and
         (DataSingle[7,j-round(1/SignalShapka.Td)]>=0.75/SignalShapka.Td)) then
           begin
            DataSingle[9,j+1]:=1;
            N802080:=j;
            break;
           end
            else  DataSingle[9,j+1]:=0;
    end;
   max:=0;
   jmax:=N802080;
   for j:=N802080-round(1/SignalShapka.Td) to N802080 do
    begin
     if  (DataSingle[8,j]>max) then
           begin
            max:=DataSingle[8,j];
            jMax:=j;
           end
    end;

{   for j:=0 to SignalShapka.NPoints-1 do
       DataSingle[1,j]:=DataSingle[6,j];
   for j:=0 to SignalShapka.NPoints-1 do
       DataSingle[2,j]:=DataSingle[7,j];
   for j:=0 to SignalShapka.NPoints-1 do
       DataSingle[3,j]:=DataSingle[8,j];
   for j:=0 to SignalShapka.NPoints-1 do
       DataSingle[4,j]:=DataSingle[9,j];
    DataSingle[4,jmax]:=100;

//goto m1;
 }

 {2005}
   jmax:=jmax+1;
{--}

   DataSingle[5,jmax]:=10;

   jbit:=jmax+round(1.3/SignalShapka.td);
   for k:=0 to 7 do
    begin
     bitarray[k+1]:=round(DataSingle[6,jbit+round(1/SignalShapka.td)*k]);
     DataSingle[5,jbit+round(1/SignalShapka.td)*k]:=5;
    end;
   jbit:=jmax+round(1.3/SignalShapka.td)+round(7/SignalShapka.td);

   jBit:=Jbit+round(3/SignalShapka.td);
   for k:=0 to 7 do
    begin
     bitarray[8+k+1]:=round(DataSingle[6,jbit+round(1/SignalShapka.td)*k]);
     DataSingle[5,jbit+round(1/SignalShapka.td)*k]:=5;
    end;
   jbit:=jmax+round(1.3/SignalShapka.td)+round(17/SignalShapka.td);

   jBit:=Jbit+round(3/SignalShapka.td);
   for k:=0 to 7 do
    begin
     bitarray[16+k+1]:=round(DataSingle[6,jbit+round(1/SignalShapka.td)*k]);
     DataSingle[5,jbit+round(1/SignalShapka.td)*k]:=5;
    end;
   jbit:=jmax+round(1.3/SignalShapka.td)+round(27/SignalShapka.td);

   jBit:=Jbit+round(3/SignalShapka.td);
   for k:=0 to 7 do
    begin
     bitarray[24+k+1]:=round(DataSingle[6,jbit+round(1/SignalShapka.td)*k]);
     DataSingle[5,jbit+round(1/SignalShapka.td)*k]:=5;
    end;

    Minuta:=bitarray[1]+2*bitarray[2]+4*bitarray[3]+8*bitarray[4]+16*bitarray[5]+32*bitarray[6];
    Chas:=bitarray[6+1]+2*bitarray[6+2]+4*bitarray[6+3]+8*bitarray[6+4]+16*bitarray[6+5];
    dayweek:=bitarray[6+5+1]+2*bitarray[6+5+2]+4*bitarray[6+5+3];
    week:=bitarray[15]+2*bitarray[16]+4*bitarray[17]+8*bitarray[18]+16*bitarray[19]+32*bitarray[20]+
          64*bitarray[21]+128*bitarray[22]+256*bitarray[23]+512*bitarray[24]+1024*bitarray[25]+
          2048*bitarray[26];
    GPSUTC:=bitarray[27]+2*bitarray[28]+4*bitarray[29]+8*bitarray[30]+16*bitarray[31]+32*bitarray[32];

    if GPSUTC<>0 then
        DateEksp:=encodedate(2000,1,2)+7*week+dayweek+chas/24.0+minuta/24.0/60.0
       else DateEksp:=signalshapka.Date_Eksp ;

 //   s:=formatdatetime('dd.mm.yy hh:mm:ss:dss',dateeksp);
//    s:=s+' ';
{    DateEksp:=round(dateEksp*86400.0);

    dateeksp:=dateEksp/86400.0;
    s:=formatdatetime('dd.mm.yy hh:mm:ss:dss',dateeksp);
 }
 //   s:=s+' ';

//    labelinfo.caption:=formatdatetime('dd mm yyyy, hh:mm:ss:dss', dateeksp);labelinfo.Update;

    setlength(DataSingle9,SignalShapka.NPoints);
    DataSingle9[jmax]:=dateeksp;
    DataSingle9[jmax-1]:=dateeksp-SignalShapka.TD/86400.0;
    T0:=dateeksp;
    jcurrent:=jmax;

    dataInt:=nil; setlength(dataInt,SignalShapka.NPoints);
    for j:=0 to Jmax do  Dataint[j]:=j;
    for j:=Jmax+1 to SignalShapka.NPoints-2 do
     begin
      if  ((DataSingle[6,j]=0) and (DataSingle[6,j+1]=1)) then
           begin
            t0:=T0+signalshapka.td/86400.0;
            DataSingle9[j]:=T0;
            dataint[j]:=(j-jcurrent)-round(1/SignalShapka.td);
            jcurrent:=j;
           end
            else
             begin
              DataSingle9[j]:=DataSingle9[j-1]+SignalShapka.TD/86400.0;
              DataInt[j]:=0;
             end;
     end;
   DataInt[SignalShapka.NPoints-1]:=0;
   T0:=dateeksp;
   jcurrent:=Jmax;
   DataSingle9[SignalShapka.NPoints-1]:=
   DataSingle9[SignalShapka.NPoints-2]+SignalShapka.TD/86400.0;

   for j:=Jmax downto 1 do
    begin
{     if  ((DataSingle[6,j-1]=0) and (DataSingle[6,j]=1)) then
           begin
            t0:=T0-signalshapka.td/60/24/60;
            DataSingle9[j]:=T0;
            dataint[j]:=(jcurrent-j)-round(1/SignalShapka.td);
            jcurrent:=j;
           end
            else
             begin
 }//             DataSingle9[j]:=DataSingle9[j+1]-SignalShapka.TD/60/60/24;
//               DataSingle9[j-1]:=DataSingle9[j]-SignalShapka.TD/60.0/60.0/24.0;
              DataInt[j]:=0;
//             end;
     end;
//   DataSingle9[0]:=DataSingle9[1]-SignalShapka.TD/60/60/24;

   SignalShapka.date_eksp:=dateEksp-Signalshapka.TD*(jmax+0.0)/86400.0;
//    s:=formatdatetime('dd.mm.yy hh:mm:ss:dss',SignalShapka.date_eksp);
//    s:=s+' ';
   dataInt[0]:=0;
 //end;


{ data_Int[1,0]:=0;
 for j:=1 to SignalShapka.NPoints-1 do
  begin
   if data_Int[0,j]<>0 then
    begin
      labelinfo.caption:=inttostr(j);
      labelinfo.Update;
    end;
    data_int[1,j]:=data_Int[1,j-1]+data_Int[0,j]+1;
   end;
}

//   memo2.Lines.clear;
//   for j:=0 to 100 do memo2.Lines.add(formatfloat('0.000',DataSingle[9,j]*24*60*60)+'c '+formatdatetime('hh:mm:ss.',Tdatetime(DataSingle[9,j]))+inttostr(MilliSecondOf(DataSingle[9,j])));
// labelinfo.Caption:='';labelinfo.Update;
// s:=formatdatetime('dd.mm.yyyy hh:mm:ss:dss',dateeksp)+' '+formatdatetime('dd.mm.yyyy hh:mm:ss:dss',DataSingle[9,0]);
// caption:=s;


M1: DataS:=nil;  setlength(DataS,SignalShapka.npoints);

{2005} for i:=0 to (SignalShapka.Npoints-1) do   DataSingle[0,i]:= DataSingleSource[i];
   DataSingle[0,jmax]:=max1*1.5;
//отладка
 //  for i:=0 to (SignalShapka.Npoints-1) do   DataSingle[1,i]:= Dataint[i];

 ii:=0;
 for j:=0 to SignalShapka.NChanalOriginal-1 do
  begin
//    labelinfo.Caption:='Запись канала ('+inttostr(j)+') в файл';labelinfo.Update;

    iDown:=0; iUp:=0; imed:=0;
    repeat
//        datas[idown]:=dataSingle[j,iUp];
//        idown:=idown+1;
//        iUp:=iUp+1;

      if iUp >= SignalShapka.NPoints-1 then
       begin
        datas[idown]:=dataSingle[j,iUp];
        idown:=idown+1;
       end
        else
           case dataint[iMed] of
           1:begin
               iUp:=iUp+1;
               Imed:=imed+1;
              end;
            0:begin
               datas[idown]:=dataSingle[j,iUp];
               idown:=idown+1;
               iUp:=iUp+1;
               Imed:=imed+1;
              end;
           -1:begin
               datas[idown]:=(dataSingle[j,iUp]+dataSingle[j,iUp-1])/2;
               idown:=idown+1;
               datas[idown]:=dataSingle[j,iUp];
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


    until idown > SignalShapka.NPoints-1;

    FDD := TFileStream.Create(DestFileName + '_ch' + inttostr(j + 1) + '.gms', fmCreate);
    FDD.write(datas[0], sizeof(Single) * SignalShapka.Npoints);
    FDD.Destroy;

  end;




  for j := 0 to SignalShapka.NchanalOriginal - 1 do
  begin
//    FDD := TFileStream.Create(DestFileName + '_ch' + inttostr(j + 1) + '.gms', fmCreate);
//    FDD.write(datasingle[j,0], sizeof(DataSingle) * SignalShapka.Npoints);
//    FDD.Destroy;
    ChanArray[j].NOMER:=j+1;
    ChanArray[j].HEADER:='SE24_'+inttostr(j);
    ChanArray[j].DELTX:=signalshapka.Td;
    ChanArray[j].NAMEX:='t';
    ChanArray[j].RAZMX:='сек';
    ChanArray[j].NAMEY:='V'+inttostr(j);
    ChanArray[j].RazmY:='В';
    ChanArray[j].RazmY:='В';
    ChanArray[j].MULTX:=1;
    ChanArray[j].MULTY:=1;
    ChanArray[j].MAXX:=0;//S386.rMaxX;
    ChanArray[j].MAXY:=0;//S386.rMaxY;
    ChanArray[j].MINX:=0;//S386.rMinX;
    ChanArray[j].MINY:=0;//S386.rMinY;
//    ChanArray[j].DateTime_START:=SignalShapka.Date_Eksp;
    ChanArray[j].DateTime_START:=Signalshapka.date_eksp;//DateEksp-(N802080*Signalshapka.Td)/60/60/24;
    ChanArray[j].POINTALL:=Signalshapka.NPoints;
    ChanArray[j].BMAXMINX:=false;//S386.bMaxMinExist;
    ChanArray[j].BMAXMINY:=false;//S386.bMaxMinExistAll;
    ChanArray[j].FileDat:=DestFileName + '_ch' + inttostr(j + 1) + '.gms';
    ChanArray[j].SIGNALMEMO:=inttostr(jmax)+' '+formatdatetime('dd mm yyyy, hh:mm:ss:dss', dateeksp);//'';
    ChanArray[j].SIGNAL_SELECTED:=1;
    ChanArray[j].File_Seek:=0;
  end;

  dataS386:=nil;
  datasingle := nil;
  datasingle9 := nil;
  datasingleSource := nil;
  DataS:=nil;
  DataInt:=nil;
  FDS.Free;
end;



procedure GETINFO_E24(
  FileName: TFilename;
  var SignalShapka: TSignalShapka //описание входного сигнала
  )
  export;
var
  FDS: TFileStream;
  E24: TE24Shapka;
  f:File of byte;
  File_size:integer;
  start,Finish:TDatetime;
var i: integer;
begin
try
   AssignFile(f, FileName);    Reset(f);
   File_size:=Filesize(F);
   CloseFile(f);
 except
end;
 try
  FDS := TFileStream.Create(Filename, fmOpenRead);
  FDS.Read(E24, SizeOf(TE24Shapka));


   SignalShapka.date_eksp:= encodedatetime( E24.yyb+2000,e24.mmmb,e24.ddb,
                                              e24.hhb,e24.minb,e24.ssb,0)+e24.tkb/1024/60/60/24;
   start:= SignalShapka.date_eksp;
   Finish:=encodedatetime( E24.yye+2000,e24.mmme,e24.dde,
                                              e24.hhe,e24.mine,e24.sse,0)+e24.tke/1024/60/60/24;
//   SignalShapka.TD:=1/e24.frq;
   SignalShapka.NChanal:=0;
   for i:=1 to 4 do
    if e24.g[i]<>0 then SignalShapka.NChanal := SignalShapka.NChanal +1;
   SignalShapka.NPoints:=(File_size-SizeOf(E24)) div 4 div SignalShapka.NChanal ;

   SignalShapka.NChanalOriginal:=SignalShapka.NChanal;
   SignalShapka.TD:=(Finish-Start)*24*60*60/SignalShapka.NPoints ;
   for i:=0 to 31 do SignalShapka.quants[i].a1:=1;
   for i:=0 to 31 do SignalShapka.quants[i].a0:=0;
   for i:=0 to 31 do SignalShapka.quants[i].a2:=0;
   for i:=0 to 31 do SignalShapka.quants[i].a3:=0;
   SignalShapka.typeofsignal:='e24';
   SignalShapka.e_functime:='t';
   SignalShapka.TipData := cRealLong{E24.TipData};
 //  SignalShapka.TD := 1 / E24.frq;
   SignalShapka.NChanalOriginal := SignalShapka.NChanal ;
   finally
   FDS.free;
  end;
end;


exports
  GETINFO_E24 name 'GETINFO_E24',
  GETData_E24 name 'GETDATA_E24',
  GETDATA_E24_simple name 'GETDATA_E24_Simple';
end.


