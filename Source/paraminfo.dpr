library paraminfo;

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
  forms,
  SysUtils,
  Classes;

{$R *.res}


procedure  GETINFO_DAT(
        FileName:TFilename;
        var SignalShapka:TSignalShapka    //описание входного сигнала
        )
 export;
var
  IgnoreLine, IgnoreColumn:integer;
 TMPFile,TMPStr:string;
 DataF:TextFile;
 cPoint,IT:longint;
 ATmp:single;
 Err:integer;

 begin
//  FDS:=TFileStream.Create(Filename,fmOpenRead);
//  FDS.Read(DAT,SizeOf(TDATShapka));

  signalshapka.Date_Eksp:=FiledateToDateTime(Fileage(Filename));

  ImportASCIIDialog:=TImportASCIIDialog.create(Application);
  ImportASCIIDialog.DateExp.date:=trunc(SignalShapka.Date_Eksp);
  ImportASCIIDialog.TimeExp.Time:=SignalShapka.Date_Eksp-trunc(SignalShapka.Date_Eksp);
  ImportASCIIDialog.Filename.caption:=Filename;
  ImportASCIIDialog.ShowModal;
  SignalShapka.TipData:=1;//DAT.TipData;
  SignalShapka.date_eksp:= trunc(ImportASCIIDialog.DateExp.date)+
                            ImportASCIIDialog.TimeExp.time-trunc(ImportASCIIDialog.TimeExp.time);
  SignalShapka.TD:=ImportASCIIDialog.Td.Value;//DAT.Td/ScaleTD_DAT;
  IgnoreLine:=ImportASCIIDialog.IgnoreLine.Value;//DAT.Npoints;
  IgnoreColumn:=ImportASCIIDialog.IgnoreColumn.Value;//DAT.Npoints;
  ImportASCIIDialog.free;
  SignalShapka.TipData:=1;//DAT.TipData;
//  SignalShapka. .IgnoreLine:=ImportASCIIDialog.IgnoreLine;//DAT.Npoints;
//  SignalShapka.IgnoreColumn:=ImportASCIIDialog.IgnoreColumn;//DAT.Npoints;
  AssignFile(DataF,FileName);
  Reset(DataF);
  for IT:=1 to IgnoreLine do ReadLn(DataF,TMPStr);
  glbNPoints:=0;
  while not EOF(DataF) do
    begin
      ReadLn(DataF,TMPStr);
      if TMPStr='' then Break;
      if NWords(TMPStr,' ')=0 then Break;
      if glbNPoints=1 then glbNChan:=NWords(TMPStr,' ')-IgnoreColumn;
      for IT:=IgnoreColumn to glbNChan+IgnoreColumn  do
        begin
  {        ATmp:=StrToFloat(ChangeSymbols('.,',DecimalSeparator,ExtractWord(IT,TmpStr,' ;')));}
          Err:=0;
          val(ChangeSymbols('.,','.',ExtractWord(IT,TmpStr,' ;')),ATmp,Err);
          if Err>0 then Continue;
  //        FileDat.Write(ATmp,SizeOf(ATmp));
        end;
      if Err>0 then Continue;
      Inc(glbNPoints);
    end;
  CloseFile(DataF);

SignalShapka.NPoints:=glbNPoints;
SignalShapka.NChanal:=glbNChan;
SignalShapka.NChanalOriginal:=glbNChan;


{SignalShapka.NPoints:=1;
SignalShapka.NChanal:=1;
SignalShapka.NChanalOriginal:=1;
SignalShapka.Td:=1;
signalshapka.Date_Eksp:=FiledateToDateTime(Fileage(Filename));}

end;


exports
 GETINFO_DAT name 'GETINFO_DAT',
end.

