unit Getgwrez;

interface
 uses
  sysutils,WinTypes, WinProcs, Classes, Graphics,tvc_U,FileBuff;

 procedure GetMaxMinX(PointStart,PointEnd:longint; var minX,MaxX:Real; var Status:integer;SigTabRec:TSigTabRec);
 procedure GetMaxMinY(PointStart,PointEnd:longint; var MinY,MaxY:Real;
     var PointMin,PointMax:longint; var Status:integer;SigTabRec:TSigTabRec);
 procedure GetMaxMinY2(FileDat:TFileStream;PointStart,PointEnd:longint; var MaxY,MinY:Real;
     var PointMin,PointMax:longint; var Status:integer;SigTabRec:TSigTabRec);
// procedure GetMaxMinY2(FileDat:TBufferedFile;PointStart,PointEnd:longint; var MaxY,MinY:Real;
//     var PointMin,PointMax:longint; var Status:integer;SigTabRec:TSigTabRec);
{ procedure GetRezArray(PointStart,PointEnd:longint; Buffer:Pointer; var Status:integer);
}
  procedure GetRez(FileDat:TFileStream;Point:longint; var Rez:Real; var Status:integer;SigTabRec:TSigTabRec);
//  procedure GetRez(FileDat:TBufferedFile;Point:longint; var Rez:Real; var Status:integer;SigTabRec:TSigTabRec);
//  procedure GetReadFileDat(Var FileDat:TBufferedFile; var Status:integer;SigTabRec:TSigTabRec);
  procedure GetReadFileDat(Var FileDat:TFileStream; var Status:integer;SigTabRec:TSigTabRec);
implementation
    uses mDrv,Image_u;


{procedure GetReadFileDat(Var FileDat:TBufferedFile; var Status:integer;SigTabRec:TSigTabRec);
begin
  if SigTabRec.FileDat<>'' then
    FileDat:=TBufferedFile.Create(SigTabRec.FileDat,2048);
    FileDat.Reset;
  Status:=0
end;
 }
procedure GetReadFileDat(Var FileDat:TFileStream; var Status:integer;SigTabRec:TSigTabRec);
begin
  if SigTabRec.FileDat<>'' then
    FileDat:=TFileStream.Create(SigTabRec.FileDat_abs,fmShareDenyNone	{fmOpenread}{2048});
//    FileDat.Reset;
  Status:=0
end;
procedure GetRez(FileDat:TFileStream{BufferedFile};Point:longint; var Rez:Real; var Status:integer;SigTabRec:TSigTabRec);
 var Shag:longint;
     RezInteger:Integer;RezLI:Longint;RezSingle:Single;
     PromRez:Real;
 begin
   RezInteger:=0;RezLI:=0;RezSingle:=0;
   Shag:=cSizeRez[SigTabRec.RezType];
   filedat.position:=SigTabRec.Seek_start+(Point*Shag);
//   FileDat.Seek(SigTabRec.Seek_start+(Point*Shag));
   case SigTabRec.RezType of
         cRealLong,cAnyChanal,cSeismoReal: FileDat.Read(RezSingle,Shag{,BytesRead});
         cAllData,cWordLong,cSeismoWord:FileDat.Read(RezInteger,Shag{,BytesRead});
         cAllData18,cLong18,cSeismoLInt:FileDat.Read(RezLI,Shag{,BytesRead});
   end;
   Rez:=0;
   case SigTabRec.RezType of
      cRealLong,cAnyChanal,cSeismoReal:Rez:=RezSingle;
      cAllData,cWordLong,cSeismoWord:Rez:=RezInteger;
      cAllData18,cLong18,cSeismoLInt:Rez:=RezLI;
   end;
{   Rez:=SigTabRec.A0+Rez*(SigTabRec.A1+
                                 Rez*SigTabRec.A2+
                                 Rez*Rez*SigTabRec.A3);
}   PromRez:=SigTabRec.A0+Rez*SigTabRec.A1;
   if SigTabRec.A2<>0 then PromRez:=PromRez+Rez*Rez*SigTabRec.A2;
   if SigTabRec.A3<>0 then PromRez:=PromRez+Rez*Rez*Rez*SigTabRec.A3;
   Rez:=PromRez;
 end;

 procedure GetMaxMinX(PointStart,PointEnd:longint; var minX,MaxX:Real; var Status:integer;SigTabRec:TSigTabRec);
 begin
   MinX:=sigtabrec.DateTimeStart+pointstart*SigTabRec.DeltX/(24*60*60);
   MaxX:=sigtabrec.DateTimeStart+PointEnd*SigTabRec.DeltX/(24*60*60);
//   MinX:=PointStart*SigTabRec.DeltX;
//   MaxX:=PointEnd*SigTabRec.DeltX;
   Status:=0;
 end;

procedure GetMaxMinY(PointStart,PointEnd:longint; var MinY,MaxY:Real;
     var PointMin,PointMax:longint; var Status:integer;SigTabRec:TSigTabRec);
var
 FileDat:TFileStream;
// FileDat:TBufferedFile;
 Shag:longint;
 RezInteger:Integer;RezLI:Longint;RezSingle:Single;
 MinInteger:Integer;MinLI:Longint;MinSingle:Single;
 MaxInteger:Integer;MaxLI:Longint;MaxSingle:Single;
 i:Longint;
 PromMaxY,PromMinY:real;
 begin
   RezInteger:=0;RezLI:=0;RezSingle:=0;
   if ( SigTabRec.bMaxMinY<>true ) then
    begin
      GetReadFileDat(FileDat,Status,SigTabRec);
      if Status<>0 then exit;
      Shag:=cSizeRez[SigTabRec.RezType];
//      FileDat.Seek(SigTabRec.Seek_Start+PointStart*Shag);
      Filedat.position:=SigTabRec.Seek_Start+PointStart*Shag;
      case SigTabRec.RezType of
         cRealLong,cAnyChanal,cSeismoReal:begin FileDat.Read(RezSingle,Shag{,BytesRead});
            MaxSingle:=RezSingle;MinSingle:=MaxSingle;end;
         cAllData,cWordLong,cSeismoWord:begin FileDat.Read(RezInteger,Shag{,BytesRead});
            MaxInteger:=RezInteger;MinInteger:=MaxInteger;end;
         cAllData18,cLong18,cSeismoLInt:begin FileDat.Read(RezLI,Shag{,BytesRead});
            MaxLI:=RezLI;MinLI:=MaxLI;end;
      end;
      PointMax:=PointStart;PointMin:=PointStart;
      for i:=PointStart to PointEnd do
      case SigTabRec.RezType of
         cRealLong,cAnyChanal,cSeismoReal:begin
                                FileDat.Read(RezSingle,Shag{,BytesRead});
                                if MaxSingle<RezSingle then begin MaxSingle:=RezSingle;PointMax:=i;end;
                                if MinSingle>RezSingle then begin MinSingle:=RezSingle;PointMin:=i;end;
                               end;
         cAllData,cWordLong,cSeismoWord:
                               begin
                                FileDat.Read(RezInteger,Shag{,BytesRead});
                                if MaxInteger<RezInteger then begin MaxInteger:=RezInteger;PointMax:=i;end;
                                if MinInteger>RezInteger then begin MinInteger:=RezInteger;PointMin:=i;end;
                               end;
         cAllData18,cLong18,cSeismoLInt:
                               begin
                                FileDat.Read(RezLI,Shag{,BytesRead});
                                if MaxLI<RezLI then begin MaxLI:=RezLI;PointMax:=i;end;
                                if MinLI>RezLI then begin MinLI:=RezLI;PointMin:=i;end;
                               end;
         end;
      case SigTabRec.RezType of
         cRealLong,cAnyChanal,cSeismoReal:begin MaxY:=MaxSingle;MinY:=MinSingle;end;
         cAllData,cWordLong,cSeismoWord:begin MaxY:=MaxInteger; MinY:=MinInteger;end;
         cAllData18,cLong18,cSeismoLInt:begin MaxY:=MaxLI; MinY:=MinLI;end;
      end;
      PromMaxY:=SigTabRec.A0+MaxY*SigTabRec.A1;
      PromMinY:=SigTabRec.A0+MinY*SigTabRec.A1;
      if SigTabRec.A2<>0 then
       begin
        PromMaxY:=PromMaxY+MaxY*MaxY*SigTabRec.A2;
        PromMinY:=PromMinY+MinY*MinY*SigTabRec.A2;
       end;
      if SigTabRec.A3<>0 then
       begin
        PromMaxY:=PromMaxY+MaxY*MaxY*MaxY*SigTabRec.A3;
        PromMinY:=PromMinY+MinY*MinY*MinY*SigTabRec.A3;
       end;
      MaxY:=PromMaxY;MinY:=PromMinY;
      {FileDat.Close;}FileDat.Destroy;
    end
     else
      begin
       MinY:=SigTabRec.MinY;
       MaxY:=SigTabRec.MaxY;
      end;
   end;

//procedure GetMaxMinY2(FileDat:TBufferedFile;PointStart,PointEnd:longint; var MaxY,MinY:Real;
//                      var PointMin,PointMax:longint; var Status:integer;SigTabRec:TSigTabRec);
procedure GetMaxMinY2(FileDat:TFileStream;PointStart,PointEnd:longint; var MaxY,MinY:Real;
                      var PointMin,PointMax:longint; var Status:integer;SigTabRec:TSigTabRec);
var
 Shag:longint;
 RezInteger:Integer;RezLI:Longint;RezSingle:Single;
 MinInteger:Integer;MinLI:Longint;MinSingle:Single;
 MaxInteger:Integer;MaxLI:Longint;MaxSingle:Single;
 i:Longint;
 PromMaxY,PromMinY:real;
 begin
      RezInteger:=0;RezLI:=0;RezSingle:=0;
      Shag:=cSizeRez[SigTabRec.RezType];
      Filedat.position:=SigTabRec.Seek_Start+PointStart*Shag;
//      FileDat.Seek(SigTabRec.Seek_Start+PointStart*Shag);
      case SigTabRec.RezType of
         cRealLong,cAnyChanal,cSeismoReal:begin FileDat.Read(MaxSingle,Shag{,BytesRead});MinSingle:=MaxSingle;end;
         cAllData,cWordLong,cSeismoWord:begin FileDat.Read(MaxInteger,Shag{,BytesRead});MinInteger:=MaxInteger;end;
         cAllData18,cLong18,cSeismoLInt:begin FileDat.Read(MaxLI,Shag{,BytesRead}); MinLI:=MaxLI;end;
      end;
      PointMax:=PointStart;PointMin:=PointStart;
      for i:=PointStart to PointEnd do
      case SigTabRec.RezType of
         cRealLong,cAnyChanal,cSeismoReal:begin
                                FileDat.Read(RezSingle,Shag{,BytesRead});
                                if MaxSingle<RezSingle then begin MaxSingle:=RezSingle;PointMax:=i;end;
                                if MinSingle>RezSingle then begin MinSingle:=RezSingle;PointMin:=i;end;
                               end;
         cAllData,cWordLong,cSeismoWord:
                               begin
                                FileDat.Read(RezInteger,Shag{,BytesRead});
                                if MaxInteger<RezInteger then begin MaxInteger:=RezInteger;PointMax:=i;end;
                                if MinInteger>RezInteger then begin MinInteger:=RezInteger;PointMin:=i;end;
                               end;
         cAllData18,cLong18,cSeismoLInt:
                               begin
                                FileDat.Read(RezLI,Shag{,BytesRead});
                                if MaxLI<RezLI then begin MaxLI:=RezLI;PointMax:=i;end;
                                if MinLI>RezLI then begin MinLI:=RezLI;PointMin:=i;end;
                               end;
         end;
      case SigTabRec.RezType of
         cRealLong,cAnyChanal,cSeismoReal:begin MaxY:=MaxSingle;MinY:=MinSingle;end;
         cAllData,cWordLong,cSeismoWord:begin MaxY:=MaxInteger; MinY:=MinInteger;end;
         cAllData18,cLong18,cSeismoLInt:begin MaxY:=MaxLI; MinY:=MinLI;end;
      end;
      PromMaxY:=SigTabRec.A0+MaxY*SigTabRec.A1;
      PromMinY:=SigTabRec.A0+MinY*SigTabRec.A1;
      if SigTabRec.A2<>0 then
       begin
        PromMaxY:=PromMaxY+MaxY*MaxY*SigTabRec.A2;
        PromMinY:=PromMinY+MinY*MinY*SigTabRec.A2;
       end;
      if SigTabRec.A3<>0 then
       begin
        PromMaxY:=PromMaxY+MaxY*MaxY*MaxY*SigTabRec.A3;
        PromMinY:=PromMinY+MinY*MinY*MinY*SigTabRec.A3;
       end;
      MaxY:=PromMaxY;MinY:=PromMinY;
   end;


end.


