library import_ADB;

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
  ScaleTD_ADB = 1000;
type
{$A-}
  TADBShapka = record

//���������� � ����� �������������
   logo: array[1..36] of char;
//����� ������������	short int (2)
 Registrator_Number: smallint;
//����� �������	short int (2)
 Profile_Number :smallint;
//����� ������ ����������	short int (2)
 Array_Station:smallint;
//
//����� ������ ������	short int (2)
  Explotion_Point: smallint;
//���	short int (2)
  Year:word;
//�����	short int (2)
  Month: word;
//����	short int (2)
  Day: word;
//���	short int (2)
  hour: word;
//������	short int (2)
 Minute: word;
//�������	short int (2)
 Sec: word;
//������������	short int (2)
 MSec: word;
//������� �������������	short int (2)
 Freq: word;
//���� ��������� 1-�� �����������	short int (2)
 First_attenuator:smallint;
//���� ��������� 2-�� �����������	short int (2)
 Second_Attenuator:smallint;
//���������� �������	short int (2)
 NChan: word;
//����� ������ � ��������	int (4)
 NPoint: integer;
//������ ������ ��������	short int (2)
 FormatRecord: smallint;
//��� ������	short int (2)
 RecordType: smallint;
//���� ��������� �����������	short int (2)
 Flag_integrator:smallint;
//������	[    ] (180)
 Reserv: array[1..180] of char;

 {�������������� �����:
������������ �������� �� 1-� ������	int (4)
�������� 1-�� ������� �� 1-� ������	int (4)
����������������...	int (4)
�������� ���������� ������� �� 1-� ������	int (4)
����������������...	int (4)
������������ �������� �� i-� ������	int (4)
�������� 1-�� ������� �� i-� ������	int (4)
����������������...	int (4)
�������� ���������� ������� �� i-� ������	int (4)
����������������...	int (4)
������������ �������� �� N-� ������	int (4)
�������� 1-�� ������� �� N-� ������	int (4)
����������������...	int (4)
�������� ���������� ������� �� N-� ������	int (4)

  }
  end;

{$A+}

procedure GetData_ADB(
  SourceFilename: TFilename; // �������� ������
  DestFilename: TFileName; // ������ ����� ����� ��� ������ �� �������
  SignalShapka: TSignalShapka; //�������� �������� �������
  var ChanArray: TChanArray //��������  ������ �� �������
  );
  export;
var
  FDS, FDD: TFileStream;
  ADB: TADBShapka;
  i, j: integer;
  DataInt: array of integer;
  DataSingle: array of single;
  MaxY, MinY:single;
begin
  FDS := TFileStream.Create(SourceFilename, fmOpenRead);
  FDS.Read(ADB, SizeOf(TADBShapka));
  FDS.position:=SizeOf(TADBShapka);
  DataSingle := nil; setlength(DataSingle, sizeof(single)*(SignalShapka.npoints));
  for j := 0 to SignalShapka.NchanalOriginal - 1 do
  begin
     FDS.seek(SizeOf(TADBShapka) + j * sizeof(integer) * (SignalShapka.npoints+1), soFromBeginning);
     DataInt := nil; setlength(DataInt, sizeof(integer)*(SignalShapka.npoints+1));
     FDS.Read(DataInt[0], csizeRez[calldata18] * SignalShapka.Npoints+1);
     maxY:= DataInt[1]; minY:=DataInt[1];
     for i := 1 to (SignalShapka.Npoints ) do
           begin
            DataSingle[i-1] := DataInt[i]{ * SignalShapka.quants[j].a1};
            if maxY<DataSingle[i-1]  then maxY:=DataSingle[i-1];
            if minY>DataSingle[i-1]  then minY:=DataSingle[i-1];
           end;
     dataInt := nil;
     FDD := TFileStream.Create(DestFileName + '_' + inttostr(j + 1) + '.gms', fmCreate);
     FDD.write(datasingle[0], sizeof(DataSingle) * SignalShapka.Npoints);
     FDD.Destroy;
    ChanArray[j].NOMER:=j+1;
    ChanArray[j].HEADER:='ch:'+inttostr(j+1);
    ChanArray[j].DELTX:=SignalShapka.TD;
    ChanArray[j].NAMEX:='t';
    ChanArray[j].RAZMX:='���';
    ChanArray[j].NAMEY:='Y'+inttostr(j);
    ChanArray[j].RazmY:='�';
    ChanArray[j].MULTX:=1;
    ChanArray[j].MULTY:=1;
    ChanArray[j].MAXX:=signalshapka.NPoints*signalshapka.TD;
    ChanArray[j].MAXY:=maxY;
    ChanArray[j].MINX:=0;
    ChanArray[j].MINY:=MinY;
    ChanArray[j].DateTime_START:=signalshapka.Date_Eksp;
    ChanArray[j].POINTALL:=Signalshapka.NPoints;
    ChanArray[j].BMAXMINX:=true;
    ChanArray[j].BMAXMINY:=true;
    ChanArray[j].FileDat:=DestFileName + '_' + inttostr(j + 1) + '.gms';
    ChanArray[j].SIGNALMEMO:=copy(signalshapka.windowheader,1,80);
    ChanArray[j].SIGNAL_SELECTED:=1;
    ChanArray[j].File_Seek:=0;
  end;
  datasingle := nil;
  FDS.Free;
end;



procedure GETINFO_ADB(
  FileName: TFilename;
  var SignalShapka: TSignalShapka //�������� �������� �������
  )
  export;
var
  FDS: TFileStream;
  ADB: TADBShapka;
var i: integer;
begin
  FDS := TFileStream.Create(Filename, fmOpenRead);
  FDS.Read(ADB, SizeOf(TADBShapka));

  SignalShapka.TipData := cLong18;
  SignalShapka.date_eksp := encodedatetime(ADB.Year+2000, ADB.Month, ADB.Day,
    ADB.Hour, ADB.minute, ADB.sec, ADB.MSec);
  if ADB.Freq=35 then SignalShapka.TD := 0.028;
  if ADB.Freq=70 then SignalShapka.TD := 0.014;
  if ADB.Freq=140 then SignalShapka.TD := 0.007;
  if ADB.Freq=31 then SignalShapka.TD := 0.032;
  if ADB.Freq=62 then SignalShapka.TD := 0.016;
  if ADB.Freq=125 then SignalShapka.TD := 1/125;
  if ADB.Freq=250 then SignalShapka.TD := 1/250;
  if ADB.Freq=500 then SignalShapka.TD := 1/500;
  if ADB.Freq=1000 then SignalShapka.TD := 1/1000;
//   35 , 70 ��� 140 �� ��� "������-01" � 31, 62, 125, 250, 500 ��� 1000
//��� �� �������� 35 �� ���������� (1.0/0.028) ��, ��� 70 �� - (1.0/0.014) ��,
//��� 140 �� - (1.0/0.007) �� (��� "������-01"),
//��� 31 �� - (1.0/0.032) ��, ��� 62 �� - (1.0/0.016) �� (��� "������-02").
  SignalShapka.NPoints := ADB.NPoint;
  SignalShapka.NChanal := ADB.Nchan;
  SignalShapka.NChanalOriginal := ADB.Nchan;
  for i := 0 to 31 do SignalShapka.quants[i].a1 := 1;
  for i := 0 to 31 do SignalShapka.quants[i].a0 := 0;
  for i := 0 to 31 do SignalShapka.quants[i].a2 := 0;
  for i := 0 to 31 do SignalShapka.quants[i].a3 := 0;
  SignalShapka.typeofsignal := 'ADB';
  SignalShapka.e_functime := 't';
  SignalShapka.windowheader:='#R:'+inttostr(adb.Registrator_Number)+' #P:'+inttostr(ADB.Profile_Number)+
                             ' #AS:'+inttostr(adb.Array_Station)+' #EP:'+inttostr(ADB.Explotion_Point);
  FDS.free;
end;


exports
  GETINFO_ADB name 'GETINFO_ADB',
  GETDATA_ADB name 'GETDATA_ADB';
end.


