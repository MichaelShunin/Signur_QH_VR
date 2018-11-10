unit import_DAT_Dialog;
{ Приводится форма, служащая шаблоном для построения программы
  импорта  в базу данных GeMiSWin сигналов из файлов
  нестандартного или нерегулярного формата.
  Форма может работать, ТОЛЬКО будучи вызванной из GeMiSWin в качестве
  внешней программы.
  При этом  управляющие данные  в программу импорта GeMiSWin  передает в
  качестве параметров  при вызове программы импорта,
  а результаты работы программы импорта передаются в
  файлах Imp_exp.cfg,  Imp_Sig.cfg , в  файле c отсчетами импортируемых сигналов и
  в сообщении wm_endImport_No_Tabl_Gl, передаваемом в GeMiSWin}

interface

uses
  SysUtils, forms,WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls,Gauges, ExtCtrls, Spin, Mask, ToolEdit, CurrEdit,
  ComCtrls, PropFilerEh, PropStorageEh;

 const

 NrezArray = 4095;
   {определение имен файлов, посредством которых осуществляется обмен данными
    между GeMisWin и программой импорта}
 Imp_ExpDat_FileName_Const =  'Imp_Exp.cfg';  {Не подлежит изменению!}
 Imp_SigDat_FileName_Const =  'IMP_Sig.cfg';  {Не подлежит изменению!}

 cReal = 0;  {Не подлежит изменению! используется для задания типа отсчетов, передаваемых в GeMiSWin}
 {cообщения}
 wm_endImport_No_Tabl_Gl:word =wm_user+417;{посылается по окончании программы импорта данных пользователя,
              если программа НЕ осуществляет ввод в таблицы баз данных GeMiSWin,
             а сохраняет информацию об импортированных сигналах в файлах
            Imp_Exp.cfg и Imp_Sig.cfg.
            Д.б. зарегистрировано как глобальное сообщение Windows}
type
  Shortstring = string;
  {Массив для хранения отсчетов, считываемых из исходного файла}
  TRezArraySingle =array[0..NRezArray] of single;
  {Запись для хранения информации о параметрах импортируемого эксперимента}
  TExp_Rec = record
    ExpNomer:longint;      {номер эксперимента в базе данных GeMisWin,может использоваться для связи
                            таблиц базы данных GeMiSWin с базами данных Пользователя}
    Theme:  string[30];    {тема импортируемого эксперимента}
    Header: string[50];    {заголовок импортируемого эксперимента}
    Author: string[20];    {автор импортируемого эксперимента}
    Date:TDateTime;        {дата импортируемого эксперимента}
    Time:TDateTime;        {время импортируемого эксперимента}
    N_Channel:word;        {число каналов  импортируемого эксперимента}
   end;
  {Запись для хранения информации о параметрах сигналов импортируемого эксперимента}
  TSig_Rec = record
    ChanHeader:string[15];  { наименование канала}
    ChanNameY:string[6];    { краткое обозначение сигнала канала}
    ChanRazmY:string[6];    { размерность физ.величины сигнала канала}
    ChanNameX:string[6];    { наименоввание оси Х}
    ChanRazmX:string[6];    { размерность  оси Х}
    DeltX:real;            {шаг дискретизации сигналов импортируемого эксперимента
                            ! Одинаков для всех каналов одного эксперимента ! }
    RezType:byte;          { тип данных отсчетов, лежащих в файле FName
                            для слова типа Single  необходимо вернуть значение cRealLong или cReal
                            для слова типа integer необходимо вернуть значение cAllData
                            для слова типа longint необходимо вернуть значение cAllData18
                            При использование Get_ChanRez необходимо возвратить значение,
                            равное cRealLong
                            см. файл USER_TVC.pas}
    A0:real;             {значение коэффициента Ao, используемого при
                         перерасчете значения отсчета, хранящегося в файле - результате импорта,
                         в физическую величину при построении графика
                         для сигнала канала  c номером Chan .
                         При использование Get_ChanRez необходимо возвратить значение, равное 0
                         Для пересчета используется функция  Y = A0+A1*R+A2*R^2+A3*R^3.
                         Пересчет делается при работе с уже импортированным в базу данных GeMiSWin сигналом.
                         Его целесообразно использовать при хранении в базе данных отсчетов в формате
                         integer в целях экономии дискового пространства.
                         }
    A1:real;            {значение коэффициента A1}
    A2:real;            {значение коэффициента A2}
    A3:real;            {значение коэффициента A3}
    MaxY:real;          {максимальное значение сигнала}
    MinY:real;          {минимальное значение сигнала}
    bMaxMinY:boolean;   {true - MaxY и MinY - установлены
                         false - MaxY и MinY - не определены}
    Seek_Start:longint; {значение, определяющее местоположение
                      отсчета с номером 0 сигнала в файле FName }
    FName:string[80];      {файл, в который программа импорта должна поместить
                           отсчеты сигнала импортируемого эксперимента.
                           В файле должны лежать значения физической величины
                           импортируемого сигнала в виде чисел формата Single.
                           Целесообразно сигналы всех каналов помещать в один файл }
    PointAll:longint;   { число отсчетов в сигнале канала}
   end;

{  Форма, обеспечивающая импорт сигнала из файла  пользователя в
   базу данных экспериментов и сигналов GeMiSWin}

  TImportASCIIDialog = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    IgnoreLine: TSpinEdit;
    Label2: TLabel;
    Label4: TLabel;
    IgnoreColumn: TSpinEdit;
    Label7: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    DateExp: TDateTimePicker;
    Label6: TLabel;
    TimeExp: TDateTimePicker;
    Label3: TLabel;
    Td: TRxCalcEdit;
    RegPropStorageManEh1: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    Filename: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImportData;
  end;

var
  ImportASCIIDialog: TImportASCIIDialog;
  Eksp_Nomer:longint; {номер, который будет присвоен импортируемому
                      эксперименту в базе данных GeMiSWin}
  App_Source_Handle:THandle;  {ссылка на GeMisWin}
  ImpFile:string;  {имя импортируемого файла}
  bDelFile:boolean; {признак необходимости удаления импортируемого файла после импорта}
  db_Dat_Path:shortstring;      {директория, где должен быть расположени файл с отсчетами
                                сигналов импортируемого эксперимента}
  Imp_Exp_FileName,Imp_Sig_FileName:shortstring;
  Exp_File:file of TExp_rec; {в этот файл программа импорта должна положить
                              нформацию об эксперименте (возможно генерация нескольких
                              эеспериментов, каждому должна соответствовать одна запись Exp_rec в Exp_File}
  Sig_File:file of TSig_Rec; {в этот файл программа импорта должна положить
                              нформацию о каждом сигнале эксперимента.
                              Одному сигналу соответствует одна запись }
  FDDest,FileDat:TFileStream;
  p:pstring;
  Shapka:string;
  glbNPoints:longint;
  glbNChan:word;

implementation
{$R *.DFM}


(*
function WordPosition(N : integer; S : string; WordDelims : string) : integer;
  var I,WordCount:integer;
  begin
    { следующие подряд разделители воспринимались как один }

    WordCount:=1;
    I:=1;
    while (WordCount<N) and (I<Length(S)) do
      begin
        if (Pos(Copy(S,I,1),WordDelims)>0) and (Pos(Copy(S,I+1,1),WordDelims)=0)
          then Inc(WordCount);
        Inc(I);
      end;
    WordPosition:=I;
    if I>=Length(S) then WordPosition:=0;
  end;  { WordPosition }

function ExtractWord(N : integer; S : string; WordDelims : string) : string;
    {-Given a set of word delimiters, return the N'th word in S}
  var
    StartPos,EndPos:integer;
  begin
    StartPos := WordPosition(N, S, WordDelims);
    EndPos:=StartPos;
    while (EndPos <= Length(S)) and (Pos(S[EndPos],WordDelims)=0) do
      Inc(EndPos);
    ExtractWord:=System.Copy(S,StartPos,EndPos-StartPos);
  end;           { ExtractWord }

function NWords(S : string; WordDelims : string) : byte;
var Count:byte;
begin
  Count:=1;
  while WordPosition(Count,S,WordDelims)>0 do Inc(Count);
  Dec(Count);
  NWords:=Count;
end;        { NWords }
  *)
{_______________________________________________________________________________}
{Далее перечислены функции (Get_*), значения которых ДОЛЖНЫ быть определены
пользователем на основании информации о формате импортируемого файла данных.
Доступ к импортируемому файлу данных обеспечивает объект FileDat типа TFileStream,
который создается и уничтожается вне функций Get_*}

Function Get_EkspHeader:string;
begin          {функция должна возвратить наименование эксперимента,
                записанного в импортируемом файле}
{Например}
 Get_EkspHeader:='Экспериментальные данные, файл: '+ ExtractFileName(ImpFile);
end;

Function Get_EkspAuthor:string;
begin     {функция должна возвратить имя автора, проводившего эксперимент,
                записанный в импортируемом файле}
 {Например}
 Get_EkspAuthor:='------- -.-.';
end;

Function Get_EkspTheme:string;
begin           {функция должна возвратить наименование темы эксперимента,
                записанного в импортируемом файле}
 {Например}
 Get_EkspTheme:='Эксп. данные';
end;

Function Get_N_Channel:word;
begin           {функция должна возвратить количество каналов эксперимента,
                записанного в импортируемом файле.}
   {Например}
 Get_N_Channel:=glbNChan;
end;

Function Get_ChanPoint(Chan:word):longint;
begin    {функция должна возвратить количество отсчетов в
           сигнале канала  c номером Chan .       }
   {Например}

 Get_ChanPoint:=glbNPoints;
end;

Function Get_MaxGaugeValue:longint;
begin            {функция должна возвратить значение, которое будет использовано
                  для задания максимального значения для полоски-индикатора .
                  Обычно оно должно быть равно общему количеству отсчетов
                   записанных в импортируемом файле}
 {Например}
 Get_MaxGaugeValue:=Get_N_Channel*Get_ChanPoint(1);
end;

Function Get_EkspDate:TDateTime;
var Y,M,D:word;
begin             {функция должна возвратить значение даты проведения эксперимента,
                   записанного в импортируемом файле}
 Get_EkspDate:=FileDateToDateTime(FileAge(ImpFile));
end;

Function Get_EkspTime:TDateTime;
begin             {функция должна возвратить значение времени проведения эксперимента,
                   записанного в импортируемом файле}
 Get_EkspTime:=FileDateToDateTime(FileAge(ImpFile));
end;

Function Get_EkspDeltX:real;
begin            {функция должна возвратить значение шага дискретизации отсчетов
                  сигналов эксперимента, записанного в импортируемом файле.
                  Шаг дискретизации по всем каналам должен быть одинаков}
  {Например}

// Get_EkspDeltX:=StrToFloat(ChangeSymbols('.,',DecimalSeparator,foMain.edTD.Text));
end;

Function Get_ChanHeader(Chan:Word):string;
begin           {функция должна возвратить наименование канала с номером Chan эксперимента,
                записанного в импортируемом файле
                КАНАЛЫ НУМЕРУЮТСЯ ОТ 1
                (должно быть не более 6 символов)}
   {Например}
 Get_ChanHeader:='канал'+inttostr(Chan);
end;

Function Get_ChanNameY(Chan:Word):string;
begin      {функция должна возвратить наименование физической величины канала с номером Chan эксперимента,
                записанного в импортируемом файле
                (должно быть не более 6 символов)}
   {Например}
 Get_ChanNameY:='Ch '+inttostr(Chan);
end;

Function Get_ChanRazmY(Chan:Word):string;
begin           {функция должна возвратить наименование размерности физической величины канала
                 с номером Chan эксперимента, записанного в импортируемом файле
                (должно быть не более 6 символов)}
   {Например}
 Get_ChanRazmY:='В';
end;

Function Get_NameX:string;
begin      {функция должна возвратить наименование оси X для графика сигналов  эксперимента,
                записанного в импортируемом файле
                (должно быть не более 6 символов)}
   {Например}
 Get_NameX:='t';
end;

Function Get_RazmX:string;
begin   {функция должна возвратить наименование размерности оси X для графика сигналов  эксперимента,
         записанного в импортируемом файле
                (должно быть не более 6 символов)}
   {Например}
 Get_RazmX:='c';
end;

Function Get_Signal_A0(Chan:word):real;
begin      {функция должна возвратить значение коэффициента Ao, используемого при
            перерасчете значения отсчета, хранящегося в файле - результате импорта,
            в физическую величину при построении графика
            для сигнала канала  c номером Chan .
            При использование Get_ChanRez необходимо возвратить значение, равное 0
            Для пересчета используется функция  Y = A0+A1*R+A2*R^2+A3*R^3.
            Пересчет делается при работе с уже импортированным в базу данных GeMiSWin сигналом.
            Его целесообразно использовать при хранении в базе данных отсчетов в формате
            integer в целях экономии дискового пространства.
            }
  {Например}
 Get_Signal_A0:=0;
end;

Function Get_Signal_A1(Chan:word):real;
begin     {функция должна возвратить значение коэффициента A1, используемого при
            перерасчете значения отсчета, хранящегося в файле - результате импорта,
            в физическую величину при построении графика
            для сигнала канала  c номером Chan .
            При использование Get_ChanRez НЕОБХОДИМО возвратить значение, равное 1  }
  {Например}
 Get_Signal_A1:=1;
end;

Function Get_Signal_A2(Chan:word):real;
begin      {функция должна возвратить значение коэффициента A2, используемого при
            перерасчете значения отсчета, хранящегося в файле - результате импорта,
            в физическую величину при построении графика
            для сигнала канала  c номером Chan .
            При использование Get_ChanRez необходимо возвратить значение, равное 0  }
    {Например}
 Get_Signal_A2:=0;
end;

Function Get_Signal_A3(Chan:word):real;
begin      {функция должна возвратить значение коэффициента A3, используемого при
            перерасчете значения отсчета, хранящегося в файле - результате импорта,
            в физическую величину при построении графика
            для сигнала канала  c номером Chan .
            При использование Get_ChanRez необходимо возвратить значение, равное 0  }
  {Например}
 Get_Signal_A3:=0;
end;


Function Get_ChanRez(Chan:word;Point:longint):single;
var P:single;
begin    {функция должна возвратить значение отсчета с номером Point
          сигнала канала с номером Chan из импортируемого файла.
          Отсчеты нумеруются от нуля  }
   {Например}
 FileDat.Seek((Point*glbNChan+Chan-1)*SizeOf(single),soFromBeginning);
 FileDat.Read(P,SizeOf(single));

 Get_ChanRez:=P
end;


Function Get_FileSeek(Chan:word):longint;
begin  {функция должна возвратить значение, которое будет определять местоположение
          отсчета с номером 0 сигнала канала с номером Chan в файле,
          получаемом в результате импорта данных}
 Get_FileSeek:=sizeof(single)*Get_ChanPoint(1)*(Chan-1);
end;
{_______________________________________________________________________________}


procedure TImportASCIIDialog.FormCreate(Sender: TObject);
begin
if impFile<>'' then Caption:=Caption+'  / '+ExtractFileName(ImpFile);
end;

{процедура импорта сигнала из файла ImpFile в базу данных GeMisWin}
procedure TImportASCIIDialog.ImportData;
var
  RezSingle:^TRezArraySingle;
  cRezArray:word;
var
 Chan:word;Point:longint;
 MS,SS,DSS:string[2];
 H,M,S,DS:word;
 Rez:single;   min,max:real;
 Exp_Rec:TExp_Rec;
 Sig_Rec:TSig_Rec;
 TMPFile,TMPStr:string;
 DataF:TextFile;
 IT:longint;
 ATmp:single;
 Err:integer;
begin
{создание файлов, в которых программа импорта сообщит GeMiSWin о результатах своей работы}
assignFile(Exp_File,Imp_exp_FileName);Rewrite(Exp_File);
assignFile(Sig_File,Imp_Sig_FileName);Rewrite(Sig_File);
  {создание объекта для доступа к импортируемому файлу}
DecodeTime(Time,H,M,S,DS);
Str(M:1,MS);   if m<10 then MS:='0'+Ms;
Str(S:1,SS);   if s<10 then sS:='0'+ss;
Str(DS:1,DSS); if ds<10 then dss:='0'+dss;
TmpFile:=DB_dat_Path+'TF'+MS+SS+DSS+'.tmp';
FileDat:=TFileStream.Create(TMPFile,fmCreate);

{Перекачка данных из текстового файла }
AssignFile(DataF,ImpFile);
Reset(DataF);
(*for IT:=1 to SpinEdit1.Value do ReadLn(DataF,TMPStr);
glbNPoints:=0;
while not EOF(DataF) do
  begin
    ReadLn(DataF,TMPStr);
    if TMPStr='' then Break;
    if NWords(TMPStr,' ')=0 then Break;
    if glbNPoints=1 then glbNChan:=NWords(TMPStr,' ');
    for IT:=1 to NWords(TMPStr,' ') do
      begin
{        ATmp:=StrToFloat(ChangeSymbols('.,',DecimalSeparator,ExtractWord(IT,TmpStr,' ;')));}
        Err:=0;
        val(ChangeSymbols('.,','.',ExtractWord(IT,TmpStr,' ;')),ATmp,Err);
        if Err>0 then Continue;
        FileDat.Write(ATmp,SizeOf(ATmp));
      end;
    if Err>0 then Continue;
    Inc(glbNPoints);
  end;
CloseFile(DataF);
FileDat.Seek(0,soFromBeginning);

laAction.Caption:='Считывание сигнала из '+ImpFile+'...';
laAction.update;
   {создание файла, в который будут записаны импортированные отсчеты}
DecodeTime(Time,H,M,S,DS);
Str(M:1,MS);   if m<10 then MS:='0'+Ms;
Str(S:1,SS);   if s<10 then sS:='0'+ss;
Str(DS:1,DSS); if ds<10 then dss:='0'+dss;
FDDest:=TFileStream.Create(DB_dat_Path+'SF'+MS+SS+DSS+'.Dat',fmcreate);
{настройка полоски-индикатора}
Gauge1.MinValue:=0;Gauge1.MaxValue:=Get_MaxGaugeValue;
Gauge1.Progress:=0;
Gauge1.Visible:=true;
{Формирование записи Exp_Rec}
Exp_Rec.Expnomer:=Eksp_Nomer;
Exp_Rec.Header:=Get_EkspHeader;
Exp_Rec.Date:=Get_EkspDate;
Exp_rec.Time:=Get_EkspTime;
Exp_rec.Author:=Get_EkspAuthor;
Exp_Rec.Theme:=Get_EkspTheme;
Exp_Rec.N_Channel:=Get_N_Channel;
write(Exp_File,Exp_Rec);  {сохранение Exp_rec}
for Chan:=1 to Exp_Rec.N_Channel do  {считывание сигналов каналов}
 begin
     {формирование записей Sig_rec.  Одна запись для каждого канала}
  Sig_Rec.ChanHeader:=Get_ChanHeader(Chan);
  Sig_Rec.DeltX:=Get_EkspDeltx;
  Sig_Rec.ChanNameY:=Get_ChanNameY(Chan);
  Sig_Rec.ChanNameX:= Get_NameX;
  Sig_rec.ChanRazmX:= Get_RazmX;
  Sig_rec.ChanRazmY:= Get_ChanRazmY(Chan);
  {в этом файле будут лежать отсчеты сигнала канала с номером Chan}
  Sig_Rec.FName:= DB_dat_Path+'SF'+MS+SS+DSS+'.Dat';
  Sig_rec.RezType:= cReal;
  Sig_Rec.A0:= Get_Signal_A0(Chan);
  Sig_Rec.A1:= Get_Signal_A1(Chan);
  Sig_Rec.A2:= Get_Signal_A2(Chan);
  Sig_Rec.A3:= Get_Signal_A3(Chan);
  Sig_Rec.PointAll:= Get_ChanPoint(Chan);
  GetMem(RezSingle,SizeOf(TRezArraySingle)); {выделение памяти под буфер отсчетов,
                                              с целью оптимизации доступа к диску}
  cRezArray:=0;
  for Point:=0 to Sig_Rec.PointAll-1 do
  begin
   Rez:=Get_ChanRez(Chan,Point);  {считывание отсчета}
   RezSingle^[cRezArray]:=Rez;
   inc(cRezArray);
   if cRezArray>NRezArray then
          begin               {cохранение буфера отсчетов}
           FDDEst.Write(RezSingle^,SizeOf(TRezArraySingle));
           cRezArray:=0;
          end;
   if Point=0 then    {определение экстремумов  сигнала канала }
    begin Min:=Rez;max:=Rez;   end
     else   begin if Max<Rez then Max:=rez;  if Min>Rez then Min:=Rez;  end;
   if ((Point mod 500) = 0) then   {можно выключить для увеличения скорости импорта}
       begin
        Application.ProcessMessages;  {чтобы не "подвесить" Windows }
        Gauge1.progress:=Point+Sig_Rec.PointAll*(Chan-1); {обновление полоски индикатора}
       end;
  end;
  if cRezArray<>0 then {cсохранение буфера отсчетов}
       FDDEst.Write(RezSingle^,SizeOf(Single)*cRezArray);
  FreeMem(RezSingle,SizeOf(TRezArraySingle)); {освобождение памяти буфера отсчетов}
  Sig_Rec.Seek_Start:= Get_FileSeek(Chan);
  Sig_Rec.MaxY:= Max;
  Sig_rec.MinY:=Min;
  Sig_rec.BMaxMinY:= true;
  Write(Sig_File,sig_Rec);      {сохранение записи в Sig_File}
 end;
FDDest.Free; FileDat.Free;     {освобождение ресурсов}
closeFile( Exp_File);  CloseFile (Sig_File);
if bDelFile then   {Уничтожение импортируемого файла, если это необходимо}
    deletefile(ImpFile);
if App_Source_Handle<>0 then  {посылка сообщения в GeMiSWin о завершении импорта}
  PostMessage(App_Source_Handle, wm_endImport_No_Tabl_Gl,eksp_Nomer,Eksp_Nomer);
DeleteFile(TMPFile);
*)close;  {импорт завершен};
end;

procedure TImportASCIIDialog.Button1Click(Sender: TObject);
begin
 close;
end;
{---------------------------------------------------------------------}
begin
end.


