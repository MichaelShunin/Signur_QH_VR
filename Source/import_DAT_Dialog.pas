unit import_DAT_Dialog;
{ ���������� �����, �������� �������� ��� ���������� ���������
  �������  � ���� ������ GeMiSWin �������� �� ������
  �������������� ��� ������������� �������.
  ����� ����� ��������, ������ ������ ��������� �� GeMiSWin � ��������
  ������� ���������.
  ��� ����  ����������� ������  � ��������� ������� GeMiSWin  �������� �
  �������� ����������  ��� ������ ��������� �������,
  � ���������� ������ ��������� ������� ���������� �
  ������ Imp_exp.cfg,  Imp_Sig.cfg , �  ����� c ��������� ������������� �������� �
  � ��������� wm_endImport_No_Tabl_Gl, ������������ � GeMiSWin}

interface

uses
  SysUtils, forms,WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls,Gauges, ExtCtrls, Spin, Mask, ToolEdit, CurrEdit,
  ComCtrls, PropFilerEh, PropStorageEh;

 const

 NrezArray = 4095;
   {����������� ���� ������, ����������� ������� �������������� ����� �������
    ����� GeMisWin � ���������� �������}
 Imp_ExpDat_FileName_Const =  'Imp_Exp.cfg';  {�� �������� ���������!}
 Imp_SigDat_FileName_Const =  'IMP_Sig.cfg';  {�� �������� ���������!}

 cReal = 0;  {�� �������� ���������! ������������ ��� ������� ���� ��������, ������������ � GeMiSWin}
 {c��������}
 wm_endImport_No_Tabl_Gl:word =wm_user+417;{���������� �� ��������� ��������� ������� ������ ������������,
              ���� ��������� �� ������������ ���� � ������� ��� ������ GeMiSWin,
             � ��������� ���������� �� ��������������� �������� � ������
            Imp_Exp.cfg � Imp_Sig.cfg.
            �.�. ���������������� ��� ���������� ��������� Windows}
type
  Shortstring = string;
  {������ ��� �������� ��������, ����������� �� ��������� �����}
  TRezArraySingle =array[0..NRezArray] of single;
  {������ ��� �������� ���������� � ���������� �������������� ������������}
  TExp_Rec = record
    ExpNomer:longint;      {����� ������������ � ���� ������ GeMisWin,����� �������������� ��� �����
                            ������ ���� ������ GeMiSWin � ������ ������ ������������}
    Theme:  string[30];    {���� �������������� ������������}
    Header: string[50];    {��������� �������������� ������������}
    Author: string[20];    {����� �������������� ������������}
    Date:TDateTime;        {���� �������������� ������������}
    Time:TDateTime;        {����� �������������� ������������}
    N_Channel:word;        {����� �������  �������������� ������������}
   end;
  {������ ��� �������� ���������� � ���������� �������� �������������� ������������}
  TSig_Rec = record
    ChanHeader:string[15];  { ������������ ������}
    ChanNameY:string[6];    { ������� ����������� ������� ������}
    ChanRazmY:string[6];    { ����������� ���.�������� ������� ������}
    ChanNameX:string[6];    { ������������� ��� �}
    ChanRazmX:string[6];    { �����������  ��� �}
    DeltX:real;            {��� ������������� �������� �������������� ������������
                            ! �������� ��� ���� ������� ������ ������������ ! }
    RezType:byte;          { ��� ������ ��������, ������� � ����� FName
                            ��� ����� ���� Single  ���������� ������� �������� cRealLong ��� cReal
                            ��� ����� ���� integer ���������� ������� �������� cAllData
                            ��� ����� ���� longint ���������� ������� �������� cAllData18
                            ��� ������������� Get_ChanRez ���������� ���������� ��������,
                            ������ cRealLong
                            ��. ���� USER_TVC.pas}
    A0:real;             {�������� ������������ Ao, ������������� ���
                         ����������� �������� �������, ����������� � ����� - ���������� �������,
                         � ���������� �������� ��� ���������� �������
                         ��� ������� ������  c ������� Chan .
                         ��� ������������� Get_ChanRez ���������� ���������� ��������, ������ 0
                         ��� ��������� ������������ �������  Y = A0+A1*R+A2*R^2+A3*R^3.
                         �������� �������� ��� ������ � ��� ��������������� � ���� ������ GeMiSWin ��������.
                         ��� ������������� ������������ ��� �������� � ���� ������ �������� � �������
                         integer � ����� �������� ��������� ������������.
                         }
    A1:real;            {�������� ������������ A1}
    A2:real;            {�������� ������������ A2}
    A3:real;            {�������� ������������ A3}
    MaxY:real;          {������������ �������� �������}
    MinY:real;          {����������� �������� �������}
    bMaxMinY:boolean;   {true - MaxY � MinY - �����������
                         false - MaxY � MinY - �� ����������}
    Seek_Start:longint; {��������, ������������ ��������������
                      ������� � ������� 0 ������� � ����� FName }
    FName:string[80];      {����, � ������� ��������� ������� ������ ���������
                           ������� ������� �������������� ������������.
                           � ����� ������ ������ �������� ���������� ��������
                           �������������� ������� � ���� ����� ������� Single.
                           ������������� ������� ���� ������� �������� � ���� ���� }
    PointAll:longint;   { ����� �������� � ������� ������}
   end;

{  �����, �������������� ������ ������� �� �����  ������������ �
   ���� ������ ������������� � �������� GeMiSWin}

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
  Eksp_Nomer:longint; {�����, ������� ����� �������� ��������������
                      ������������ � ���� ������ GeMiSWin}
  App_Source_Handle:THandle;  {������ �� GeMisWin}
  ImpFile:string;  {��� �������������� �����}
  bDelFile:boolean; {������� ������������� �������� �������������� ����� ����� �������}
  db_Dat_Path:shortstring;      {����������, ��� ������ ���� ����������� ���� � ���������
                                �������� �������������� ������������}
  Imp_Exp_FileName,Imp_Sig_FileName:shortstring;
  Exp_File:file of TExp_rec; {� ���� ���� ��������� ������� ������ ��������
                              ��������� �� ������������ (�������� ��������� ����������
                              �������������, ������� ������ ��������������� ���� ������ Exp_rec � Exp_File}
  Sig_File:file of TSig_Rec; {� ���� ���� ��������� ������� ������ ��������
                              ��������� � ������ ������� ������������.
                              ������ ������� ������������� ���� ������ }
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
    { ��������� ������ ����������� �������������� ��� ���� }

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
{����� ����������� ������� (Get_*), �������� ������� ������ ���� ����������
������������� �� ��������� ���������� � ������� �������������� ����� ������.
������ � �������������� ����� ������ ������������ ������ FileDat ���� TFileStream,
������� ��������� � ������������ ��� ������� Get_*}

Function Get_EkspHeader:string;
begin          {������� ������ ���������� ������������ ������������,
                ����������� � ������������� �����}
{��������}
 Get_EkspHeader:='����������������� ������, ����: '+ ExtractFileName(ImpFile);
end;

Function Get_EkspAuthor:string;
begin     {������� ������ ���������� ��� ������, ������������ �����������,
                ���������� � ������������� �����}
 {��������}
 Get_EkspAuthor:='------- -.-.';
end;

Function Get_EkspTheme:string;
begin           {������� ������ ���������� ������������ ���� ������������,
                ����������� � ������������� �����}
 {��������}
 Get_EkspTheme:='����. ������';
end;

Function Get_N_Channel:word;
begin           {������� ������ ���������� ���������� ������� ������������,
                ����������� � ������������� �����.}
   {��������}
 Get_N_Channel:=glbNChan;
end;

Function Get_ChanPoint(Chan:word):longint;
begin    {������� ������ ���������� ���������� �������� �
           ������� ������  c ������� Chan .       }
   {��������}

 Get_ChanPoint:=glbNPoints;
end;

Function Get_MaxGaugeValue:longint;
begin            {������� ������ ���������� ��������, ������� ����� ������������
                  ��� ������� ������������� �������� ��� �������-���������� .
                  ������ ��� ������ ���� ����� ������ ���������� ��������
                   ���������� � ������������� �����}
 {��������}
 Get_MaxGaugeValue:=Get_N_Channel*Get_ChanPoint(1);
end;

Function Get_EkspDate:TDateTime;
var Y,M,D:word;
begin             {������� ������ ���������� �������� ���� ���������� ������������,
                   ����������� � ������������� �����}
 Get_EkspDate:=FileDateToDateTime(FileAge(ImpFile));
end;

Function Get_EkspTime:TDateTime;
begin             {������� ������ ���������� �������� ������� ���������� ������������,
                   ����������� � ������������� �����}
 Get_EkspTime:=FileDateToDateTime(FileAge(ImpFile));
end;

Function Get_EkspDeltX:real;
begin            {������� ������ ���������� �������� ���� ������������� ��������
                  �������� ������������, ����������� � ������������� �����.
                  ��� ������������� �� ���� ������� ������ ���� ��������}
  {��������}

// Get_EkspDeltX:=StrToFloat(ChangeSymbols('.,',DecimalSeparator,foMain.edTD.Text));
end;

Function Get_ChanHeader(Chan:Word):string;
begin           {������� ������ ���������� ������������ ������ � ������� Chan ������������,
                ����������� � ������������� �����
                ������ ���������� �� 1
                (������ ���� �� ����� 6 ��������)}
   {��������}
 Get_ChanHeader:='�����'+inttostr(Chan);
end;

Function Get_ChanNameY(Chan:Word):string;
begin      {������� ������ ���������� ������������ ���������� �������� ������ � ������� Chan ������������,
                ����������� � ������������� �����
                (������ ���� �� ����� 6 ��������)}
   {��������}
 Get_ChanNameY:='Ch '+inttostr(Chan);
end;

Function Get_ChanRazmY(Chan:Word):string;
begin           {������� ������ ���������� ������������ ����������� ���������� �������� ������
                 � ������� Chan ������������, ����������� � ������������� �����
                (������ ���� �� ����� 6 ��������)}
   {��������}
 Get_ChanRazmY:='�';
end;

Function Get_NameX:string;
begin      {������� ������ ���������� ������������ ��� X ��� ������� ��������  ������������,
                ����������� � ������������� �����
                (������ ���� �� ����� 6 ��������)}
   {��������}
 Get_NameX:='t';
end;

Function Get_RazmX:string;
begin   {������� ������ ���������� ������������ ����������� ��� X ��� ������� ��������  ������������,
         ����������� � ������������� �����
                (������ ���� �� ����� 6 ��������)}
   {��������}
 Get_RazmX:='c';
end;

Function Get_Signal_A0(Chan:word):real;
begin      {������� ������ ���������� �������� ������������ Ao, ������������� ���
            ����������� �������� �������, ����������� � ����� - ���������� �������,
            � ���������� �������� ��� ���������� �������
            ��� ������� ������  c ������� Chan .
            ��� ������������� Get_ChanRez ���������� ���������� ��������, ������ 0
            ��� ��������� ������������ �������  Y = A0+A1*R+A2*R^2+A3*R^3.
            �������� �������� ��� ������ � ��� ��������������� � ���� ������ GeMiSWin ��������.
            ��� ������������� ������������ ��� �������� � ���� ������ �������� � �������
            integer � ����� �������� ��������� ������������.
            }
  {��������}
 Get_Signal_A0:=0;
end;

Function Get_Signal_A1(Chan:word):real;
begin     {������� ������ ���������� �������� ������������ A1, ������������� ���
            ����������� �������� �������, ����������� � ����� - ���������� �������,
            � ���������� �������� ��� ���������� �������
            ��� ������� ������  c ������� Chan .
            ��� ������������� Get_ChanRez ���������� ���������� ��������, ������ 1  }
  {��������}
 Get_Signal_A1:=1;
end;

Function Get_Signal_A2(Chan:word):real;
begin      {������� ������ ���������� �������� ������������ A2, ������������� ���
            ����������� �������� �������, ����������� � ����� - ���������� �������,
            � ���������� �������� ��� ���������� �������
            ��� ������� ������  c ������� Chan .
            ��� ������������� Get_ChanRez ���������� ���������� ��������, ������ 0  }
    {��������}
 Get_Signal_A2:=0;
end;

Function Get_Signal_A3(Chan:word):real;
begin      {������� ������ ���������� �������� ������������ A3, ������������� ���
            ����������� �������� �������, ����������� � ����� - ���������� �������,
            � ���������� �������� ��� ���������� �������
            ��� ������� ������  c ������� Chan .
            ��� ������������� Get_ChanRez ���������� ���������� ��������, ������ 0  }
  {��������}
 Get_Signal_A3:=0;
end;


Function Get_ChanRez(Chan:word;Point:longint):single;
var P:single;
begin    {������� ������ ���������� �������� ������� � ������� Point
          ������� ������ � ������� Chan �� �������������� �����.
          ������� ���������� �� ����  }
   {��������}
 FileDat.Seek((Point*glbNChan+Chan-1)*SizeOf(single),soFromBeginning);
 FileDat.Read(P,SizeOf(single));

 Get_ChanRez:=P
end;


Function Get_FileSeek(Chan:word):longint;
begin  {������� ������ ���������� ��������, ������� ����� ���������� ��������������
          ������� � ������� 0 ������� ������ � ������� Chan � �����,
          ���������� � ���������� ������� ������}
 Get_FileSeek:=sizeof(single)*Get_ChanPoint(1)*(Chan-1);
end;
{_______________________________________________________________________________}


procedure TImportASCIIDialog.FormCreate(Sender: TObject);
begin
if impFile<>'' then Caption:=Caption+'  / '+ExtractFileName(ImpFile);
end;

{��������� ������� ������� �� ����� ImpFile � ���� ������ GeMisWin}
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
{�������� ������, � ������� ��������� ������� ������� GeMiSWin � ����������� ����� ������}
assignFile(Exp_File,Imp_exp_FileName);Rewrite(Exp_File);
assignFile(Sig_File,Imp_Sig_FileName);Rewrite(Sig_File);
  {�������� ������� ��� ������� � �������������� �����}
DecodeTime(Time,H,M,S,DS);
Str(M:1,MS);   if m<10 then MS:='0'+Ms;
Str(S:1,SS);   if s<10 then sS:='0'+ss;
Str(DS:1,DSS); if ds<10 then dss:='0'+dss;
TmpFile:=DB_dat_Path+'TF'+MS+SS+DSS+'.tmp';
FileDat:=TFileStream.Create(TMPFile,fmCreate);

{��������� ������ �� ���������� ����� }
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

laAction.Caption:='���������� ������� �� '+ImpFile+'...';
laAction.update;
   {�������� �����, � ������� ����� �������� ��������������� �������}
DecodeTime(Time,H,M,S,DS);
Str(M:1,MS);   if m<10 then MS:='0'+Ms;
Str(S:1,SS);   if s<10 then sS:='0'+ss;
Str(DS:1,DSS); if ds<10 then dss:='0'+dss;
FDDest:=TFileStream.Create(DB_dat_Path+'SF'+MS+SS+DSS+'.Dat',fmcreate);
{��������� �������-����������}
Gauge1.MinValue:=0;Gauge1.MaxValue:=Get_MaxGaugeValue;
Gauge1.Progress:=0;
Gauge1.Visible:=true;
{������������ ������ Exp_Rec}
Exp_Rec.Expnomer:=Eksp_Nomer;
Exp_Rec.Header:=Get_EkspHeader;
Exp_Rec.Date:=Get_EkspDate;
Exp_rec.Time:=Get_EkspTime;
Exp_rec.Author:=Get_EkspAuthor;
Exp_Rec.Theme:=Get_EkspTheme;
Exp_Rec.N_Channel:=Get_N_Channel;
write(Exp_File,Exp_Rec);  {���������� Exp_rec}
for Chan:=1 to Exp_Rec.N_Channel do  {���������� �������� �������}
 begin
     {������������ ������� Sig_rec.  ���� ������ ��� ������� ������}
  Sig_Rec.ChanHeader:=Get_ChanHeader(Chan);
  Sig_Rec.DeltX:=Get_EkspDeltx;
  Sig_Rec.ChanNameY:=Get_ChanNameY(Chan);
  Sig_Rec.ChanNameX:= Get_NameX;
  Sig_rec.ChanRazmX:= Get_RazmX;
  Sig_rec.ChanRazmY:= Get_ChanRazmY(Chan);
  {� ���� ����� ����� ������ ������� ������� ������ � ������� Chan}
  Sig_Rec.FName:= DB_dat_Path+'SF'+MS+SS+DSS+'.Dat';
  Sig_rec.RezType:= cReal;
  Sig_Rec.A0:= Get_Signal_A0(Chan);
  Sig_Rec.A1:= Get_Signal_A1(Chan);
  Sig_Rec.A2:= Get_Signal_A2(Chan);
  Sig_Rec.A3:= Get_Signal_A3(Chan);
  Sig_Rec.PointAll:= Get_ChanPoint(Chan);
  GetMem(RezSingle,SizeOf(TRezArraySingle)); {��������� ������ ��� ����� ��������,
                                              � ����� ����������� ������� � �����}
  cRezArray:=0;
  for Point:=0 to Sig_Rec.PointAll-1 do
  begin
   Rez:=Get_ChanRez(Chan,Point);  {���������� �������}
   RezSingle^[cRezArray]:=Rez;
   inc(cRezArray);
   if cRezArray>NRezArray then
          begin               {c��������� ������ ��������}
           FDDEst.Write(RezSingle^,SizeOf(TRezArraySingle));
           cRezArray:=0;
          end;
   if Point=0 then    {����������� �����������  ������� ������ }
    begin Min:=Rez;max:=Rez;   end
     else   begin if Max<Rez then Max:=rez;  if Min>Rez then Min:=Rez;  end;
   if ((Point mod 500) = 0) then   {����� ��������� ��� ���������� �������� �������}
       begin
        Application.ProcessMessages;  {����� �� "���������" Windows }
        Gauge1.progress:=Point+Sig_Rec.PointAll*(Chan-1); {���������� ������� ����������}
       end;
  end;
  if cRezArray<>0 then {c���������� ������ ��������}
       FDDEst.Write(RezSingle^,SizeOf(Single)*cRezArray);
  FreeMem(RezSingle,SizeOf(TRezArraySingle)); {������������ ������ ������ ��������}
  Sig_Rec.Seek_Start:= Get_FileSeek(Chan);
  Sig_Rec.MaxY:= Max;
  Sig_rec.MinY:=Min;
  Sig_rec.BMaxMinY:= true;
  Write(Sig_File,sig_Rec);      {���������� ������ � Sig_File}
 end;
FDDest.Free; FileDat.Free;     {������������ ��������}
closeFile( Exp_File);  CloseFile (Sig_File);
if bDelFile then   {����������� �������������� �����, ���� ��� ����������}
    deletefile(ImpFile);
if App_Source_Handle<>0 then  {������� ��������� � GeMiSWin � ���������� �������}
  PostMessage(App_Source_Handle, wm_endImport_No_Tabl_Gl,eksp_Nomer,Eksp_Nomer);
DeleteFile(TMPFile);
*)close;  {������ ��������};
end;

procedure TImportASCIIDialog.Button1Click(Sender: TObject);
begin
 close;
end;
{---------------------------------------------------------------------}
begin
end.


