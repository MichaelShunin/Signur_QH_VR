unit Import_signur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, menu_f, Menus, StdCtrls, Grids, DBGridEh, ComCtrls, DB,
  IBCustomDataSet, IBQuery, ExtCtrls, IBSQL;


type

TBCDByte = Byte;
TBCD4Byte = array[1..4] of TBCDByte;

 TDateTime_SourceRecord = record
  minuta:TBCDByte;
  hour:TBCDByte;
  day:TBCDByte;
  month:TBCDByte;
 end;

 TDateTime_SourceValue = record
  value: TBCD4Byte;
  DateTimeRec:TBCD4Byte;
 end;

 TDateTime_Value = record
  value: double;
  Date_Time:Tdatetime;
 end;

 TOn_SourceArray = array[1..50] of TBCD4Byte;
 TOff_SourceArray = array[1..50] of TBCD4Byte;

 TOn_Array = array[1..50] of TDatetime;
 TOff_Array = array[1..50] of TDatetime;

 THoursSourceData = array[1..25] of TDateTime_SourceValue;
 TDaysSourceData = array[1..31] of TDateTime_SourceValue;

 THoursData = array[1..25] of TDateTime_Value;
 TDaysData = array[1..31] of TDateTime_Value;
 TAfterDaysData = array[1..80] of byte;

 TSignurSourceRecord  = record
  Curr_Volume : TBCD4Byte;
  Curr_LifeLength : TBCD4Byte;
  TempValue:array[1..85] of byte;
  P1:byte;
  P2: byte;
  P3:byte;
  Aon:TOn_SourceArray;
  Aoff:TOff_SourceArray;
  Ah: THoursSourceData;
  Ad: TDaysSourceData;
  Ad_Fake: TAfterDaysData;

  P4:byte;
//  CheckSum:byte;
  end;

 TSignurRecord  = record
  Curr_Volume : double;
  Curr_LifeLength : Ttime;
  P1:byte;
  P2: byte;
  P3:byte;
  Aon:TOn_Array;
  Aoff:TOff_Array;
  Ah: THoursData;
  Ad: TDaysData;
  P4:byte;
  CheckSum:byte;
  end;



  TImport_Signur_Form = class(TMenuForm)
    miLoadData: TMenuItem;
    q: TIBSQL;
    procedure miLoadDataClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Fname:string;
    device_type:integer;
    eksp_nomer:integer;
    SignurSourceRecord:TSignurSourceRecord;
    SignurRecord:TSignurRecord;
    Filedata: file of TSignurSourceRecord;
  end;

var
  Import_Signur_Form: TImport_Signur_Form;

implementation

uses DM_dm;

{$R *.dfm}

Function BCDByte_to_double(BCDByte:TBCDByte):double;
var
 ed: byte;
 Des:byte;
begin
 ed:=BCDByte and $0F;
 DES:=((BCDByte and $F0) shr 4);
 result:=des*10+ed;
end;

Function BCD4Byte_to_double(BCD4Byte:TBCD4Byte):double;
var
 ed: byte;
 Des:byte;
 i:integer;
begin
 if ((BCD4Byte[1]=$FF) and (BCD4Byte[2]=$FF)
 and (BCD4Byte[3]=$FF)  and (BCD4Byte[3]=$FF)) then  result :=0
   else
   begin
     ed:=BCD4Byte[1] and $0F;
     DES:=((BCD4Byte[1] and $F0) shr 4);
     result:=des*10+ed;

     ed:=BCD4Byte[2] and $0F;
     DES:=((BCD4Byte[2] and $F0) shr 4);
     result:=Result+des*1000+ed*100;

     ed:=BCD4Byte[3] and $0F;
     DES:=((BCD4Byte[3] and $F0) shr 4);
     result:=Result+des*100000+ed*10000;

     ed:=BCD4Byte[4] and $0F;
     DES:=((BCD4Byte[4] and $F0) shr 4);
     result:=Result+des*10000000+ed*1000000;
  end
end;


Function BCD4Byte_to_Datetime(BCD4Byte:TBCD4Byte):Tdatetime;
var
 ed: byte;
 Des:byte;
 Minute,Hour,day,Month:word;
begin
 if ((BCD4Byte[1]=$FF) and (BCD4Byte[2]=$FF)
 and (BCD4Byte[3]=$FF)  and (BCD4Byte[3]=$FF)) then  result :=0
   else
   begin
    ed:=BCD4Byte[1] and $0F;
    DES:=((BCD4Byte[1] and $F0) shr 4);
    Minute:=des*10+ed;

    ed:=BCD4Byte[2] and $0F;
    DES:=((BCD4Byte[2] and $F0) shr 4);
    Hour:=des*10+ed;
                    //                              {} if Hour >24 then Hour :=13 ;
    ed:=BCD4Byte[3] and $0F;
    DES:=((BCD4Byte[3] and $F0) shr 4);
    day:=des*10+ed;

    ed:=BCD4Byte[4] and $0F;
    DES:=((BCD4Byte[4] and $F0) shr 4);
    Month:=des*10+ed;
   try
    if ((Month in [1,2,3,4,5,6,7,8,9,10,11,12]) and
       (day in [1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]) and
       (Hour in [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]) and
       (Minute in [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59])
       )  then
         result:=encodedate(currentYear,month,day)+encodetime(hour,minute,0,0)
        else result:=0;
    if result > now then
     result:=encodedate(currentYear-1,month,day)+encodetime(hour,minute,0,0);
    except
    result:=0;
    end
   end;

end;

Function BCD4Byte_to_time(BCD4Byte:TBCD4Byte):double;
var
 ed: byte;
 Des:byte;
 Minute,Hour,day,Month:word;
begin
 ed:=BCD4Byte[1] and $0F;
 DES:=((BCD4Byte[1] and $F0) shr 4);
 Minute:=des*10+ed;

 ed:=BCD4Byte[2] and $0F;
 DES:=((BCD4Byte[2] and $F0) shr 4);
 Hour:=des*10+ed;

 result:=encodetime(hour,minute,0,0);

end;


procedure TImport_Signur_Form.miLoadDataClick(Sender: TObject);
var
 i:integer;
 Mult:double;
begin
  inherited;
  assignfile(FileData, Fname);
  Reset(Filedata);
  Read(Filedata,SignurSourceRecord);
  closeFile(Filedata);
  signurRecord.Curr_Volume:=BCD4Byte_to_double(SignurSourceRecord.Curr_Volume);
//  signurRecord.Curr_LifeLength:=BCD4Byte_to_time(SignurSourceRecord.Curr_LifeLength);

  for i:=1 to length(SignurRecord.Aon) do
    SignurRecord.Aon[i]:=BCD4Byte_to_Datetime(SignurSourceRecord.Aon[i]);

  dm.q.SQL.Clear;
  dm.q.SQL.add(' delete from on_off oo where oo.eksp_nomer = :eksp_nomer and '+
               ' oo.onoff_event = (select max(onoff_event) from ' +
               '                     on_off where  eksp_nomer = :eksp_nomer)');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  dm.q.execsql;
  
  dm.q.SQL.Clear;
  dm.q.SQL.add(' execute procedure AddOnOffEvent(:eksp_nomer,:onOff_Event,:status, null)');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  dm.q.parambyname('status').asinteger:=1;

  for i:=1 to length(SignurRecord.Aon) do
    begin
     if SignurRecord.Aon[i]>0 then
      begin
       dm.q.parambyname('OnOff_Event').asdatetime:=SignurRecord.Aon[i];
       dm.q.execsql;
      end;
     end;


  for i:=1 to length(SignurRecord.Aoff) do
    SignurRecord.Aoff[i]:=BCD4Byte_to_Datetime(SignurSourceRecord.Aoff[i]);

  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  dm.q.parambyname('status').asinteger:=0;
  for i:=1 to length(SignurRecord.Aoff) do
    begin
     if SignurRecord.Aoff[i]>0 then
      begin
       dm.q.parambyname('OnOff_Event').asdatetime:=SignurRecord.Aoff[i];
       dm.q.execsql;
      end;
     end;

  case signursourcerecord.p4 of
   0:Mult:=0.001;
   1:Mult:=0.01;
   2:Mult:=0.1;
   3:Mult:=1;
   4:Mult:=10;
  end;

  if device_type=0 then mult:=mult*10;
 // device_type  0      ÝÕÎ Ð
 //              1      ÝÕÎ ÀÑ
 //              2      ÀÊÐÎÍ

  for i:=1 to length(SignurRecord.Ah) do
    begin
     SignurRecord.Ah[i].Date_Time:=BCD4Byte_to_Datetime(SignurSourceRecord.Ah[i].DatetimeRec);
     SignurRecord.Ah[i].Value:=Mult*BCD4Byte_to_Double(SignurSourceRecord.Ah[i].Value);
    end;

  dm.q.SQL.Clear;
  dm.q.SQL.add(' execute procedure AddHoursData(:eksp_nomer,:Hour_Value,:s_Value,:Prior_Hour_Value,0)');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  for i:=1 to length(SignurRecord.Ah) do
    begin
     if SignurRecord.Ah[i].Date_Time>0 then
      begin
       dm.q.parambyname('Hour_Value').asdatetime:=SignurRecord.Ah[i].Date_Time;
       dm.q.parambyname('S_Value').asfloat:=SignurRecord.Ah[i].value;
       dm.q.parambyname('Prior_Hour_Value').asdatetime:=SignurRecord.Ah[i].Date_Time-1/24.0;
       dm.q.execsql;
      end;
     end;

  for i:=1 to length(SignurRecord.Ad) do
    begin
     SignurRecord.Ad[i].Date_Time:=BCD4Byte_to_Datetime(SignurSourceRecord.Ad[i].DatetimeRec);
     SignurRecord.Ad[i].Value:=Mult*BCD4Byte_to_Double(SignurSourceRecord.Ad[i].Value);
    end ;

  dm.q.SQL.Clear;
  dm.q.SQL.add(' execute procedure AddDaysData(:eksp_nomer,:Day_Value,:s_Value,:Prior_Day_Value,0)');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  for i:=1 to length(SignurRecord.Ad) do
    begin
     if SignurRecord.Ad[i].Date_Time>0 then
      begin
       dm.q.parambyname('Day_Value').asdatetime:=SignurRecord.Ad[i].Date_Time;
       dm.q.parambyname('S_Value').asfloat:=SignurRecord.Ad[i].value;
       dm.q.parambyname('Prior_Day_Value').asdatetime:=SignurRecord.Ad[i].Date_Time-1;
       dm.q.execsql;
      end;
     end;

  dm.q.SQL.Clear;
  dm.q.SQL.add(' update hoursdata set d_value = 0 where eksp_nomer = :eksp_nomer');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  dm.q.execsql;
  dm.q.SQL.Clear;
  dm.q.SQL.add(' update DaysData set d_value = 0 where eksp_nomer = :eksp_nomer');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  dm.q.execsql;

 //dm.q.Transaction.commitretaining;


end;


end.
