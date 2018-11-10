unit Import_signur_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, menu_f, Menus, StdCtrls, Grids, DBGridEh, ComCtrls, DB,
  IBCustomDataSet, IBQuery, ExtCtrls, IBSQL, math;

const

//Количество строк (записи отсчета)  в архиве  - предельное число отсчетов в архиве
//Limit_samples

Limit_H = 2502;//2920;
Limit_D = 2202;
Limit_On = 100 ;
Limit_Off = 100 ;
Limit_Events = 100;


//Предельный размер пакета (максимальное число строк в пакете)
//Max_Samples_In_Batch

Max_H = Limit_H;//31         ;
Max_D = Limit_D;//36;// 35 ;//36          ;
Max_On = Limit_ON;//50          ;
Max_Off = Limit_off;//50          ;
Max_Events= Limit_Events;//50         ;

// Device_type:
//  0:  EchoR
//  1: Echo_AS
//  2:  Akron
//  3: AKRON 2 CH


type

{$A-}

TBCDByte = Byte;

 TDateTime_SourceRecord_H = record
  hour:TBCDByte;
  day:TBCDByte;
  month:TBCDByte;
  year:TBCDByte;
 end;

 TDateTime_SourceRecord_D = record
  day:TBCDByte;
  month:TBCDByte;
  year:TBCDByte;
 end;

 TDateTime_SourceRecord_OnOff = record
  Minute:TBCDByte;
  hour:TBCDByte;
  day:TBCDByte;
  month:TBCDByte;
  year:TBCDByte;
 end;


 THours_SourceValue_ER = record  //Echo_R
   value: longword;
   DT:TDateTime_SourceRecord_H
  end;

 THours_SourceValue_EA = record          //Echo_A
   value: single;
   DT:TDateTime_SourceRecord_H
  end;
 THours_SourceValue_A = record  //Akron
   value: longword;
   Mult_Byte:byte;  // введен в июле 2008
   DT:TDateTime_SourceRecord_H ;
  end;

 TDays_SourceValue_ER = record
  value: longword;
  DT:TDateTime_SourceRecord_D;    // EchoR
  end;

 TDays_SourceValue_EA = record
  value: longint;
  DT:TDateTime_SourceRecord_D;    // EchoA
  end;

 TDays_SourceValue_A = record
  value: longword;
  Mult_Byte:byte;    // введен в июле 2008
  DT:TDateTime_SourceRecord_D;    // Акрон

 end;


 TDateTime_Value = record
  value: double;
  Date_Time:Tdatetime;
 end;

 THours_SourceArray_ER = array[1..Max_H] of THours_SourceValue_ER;
 THours_SourceArray_EA = array[1..Max_H] of THours_SourceValue_EA;
 THours_SourceArray_A = array[1..Max_H] of THours_SourceValue_A;
 TDays_SourceArray_EA = array[1..Max_D] of TDays_SourceValue_EA;
 TDays_SourceArray_ER = array[1..Max_D] of TDays_SourceValue_ER;
 TDays_SourceArray_A = array[1..Max_D] of TDays_SourceValue_A;

 TOn_SourceArray = array[1..Max_On] of TDateTime_SourceRecord_OnOff;
 TOff_SourceArray = array[1..Max_Off] of TDateTime_SourceRecord_OnOff;

 TOff_ReasonArray = array[1..Max_Off] of byte;

 ToDo = record
  what: byte;
  start: integer;
  Max: integer;
  Status: byte;
  end;

  TScript =  array of ToDo;




  TImport_Signur_Form2 = class(TMenuForm)
    miLoadData: TMenuItem;
    q: TIBSQL;
    Button1: TButton;
    procedure miLoadDataClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Fname:string;
    device_type:integer;
    Channel:Integer;
    device_type_string:string;
    eksp_nomer:integer;
    typeoffile:integer;
    mult_k:Extended;//double;
    H_SourceArray_ER:THours_SourceArray_ER;
    H_SourceArray_EA:THours_SourceArray_EA;
    H_SourceArray_A:THours_SourceArray_A;
    D_SourceArray_ER:TDays_SourceArray_ER;
    D_SourceArray_EA:TDays_SourceArray_EA;
    D_SourceArray_A:TDays_SourceArray_A;
    On_SourceArray: TOn_SourceArray;
    Off_SourceArray: TOff_SourceArray;
    Off_ReasonArray: TOff_ReasonArray;
     FD, FDR:TFilestream;
//    SignurRecord:TSignurRecord;
//    Filedata: file of TSignurSourceRecord;
    HourLast: TDateTime;
    DayLast: TDateTime;
  end;

var
  Import_Signur_Form2: TImport_Signur_Form2;

implementation

uses DM_dm;

{$R *.dfm}


Function HDateTime_to_Datetime(HDateTime:TDateTime_SourceRecord_H):Tdatetime;
var
 ed: byte;
 Des:byte;
 Hour,day,Month,Year:word;
begin
 if (
    ((HDateTime.hour=$FF) and (HDateTime.day=$FF)
      and (HDateTime.month=$FF)  and (HDateTime.year=$FF))
     or
    ((HDateTime.hour=0) and (HDateTime.day=0)
      and (HDateTime.month=0)  and (HDateTime.year=0))
      )
   then  result :=0
   else
   begin
    ed:=HDateTime.year and $0F;
    DES:=((HDateTime.year and $F0) shr 4);
    Year:=des*10+ed+2000;

    ed:=HDateTime.hour and $0F;
    DES:=((HDateTime.hour and $F0) shr 4);
    Hour:=des*10+ed;

    ed:=HDateTime.day and $0F;
    DES:=((HDateTime.day and $F0) shr 4);
    day:=des*10+ed;

    ed:=HDateTime.month and $0F;
    DES:=((HDateTime.month and $F0) shr 4);
    Month:=des*10+ed;
    try
     result:=encodedate(Year,month,day)+encodetime(hour,0,0,0);
     except
     result:=0;
    end;
    {if result > now then      // не надо проверять для приборов с большими архивами
     result:=encodedate(currentYear-1,month,day)+encodetime(hour,0,0,0);}
   end;
end;

Function DDateTime_to_Datetime(DDateTime:TDateTime_SourceRecord_D):Tdatetime;
var
 ed: byte;
 Des:byte;
 Hour,day,Month,Year:word;
begin
 if (
     ((DDateTime.day=$FF)
      and (DDateTime.month=$FF)  and (DDateTime.year=$FF))
     or
     ((DDateTime.day=0)
      and (DDateTime.month=0)  and (DDateTime.year=0))
    )
  then  result :=0
   else
   begin
    ed:=DDateTime.year and $0F;
    DES:=((DDateTime.year and $F0) shr 4);
    Year:=des*10+ed+2000;

    ed:=DDateTime.day and $0F;
    DES:=((DDateTime.day and $F0) shr 4);
    day:=des*10+ed;

    ed:=DDateTime.month and $0F;
    DES:=((DDateTime.month and $F0) shr 4);
    Month:=des*10+ed;
    try
     result:=encodedate(Year,month,day)+encodetime(0,0,0,0);
     except
     result:=0;
    end;

    {if result > now then     // не надо проверять для приборов с большими архивами
     result:=encodedate(currentYear-1,month,day)+encodetime(0,0,0,0);}
   end;
end;


Function OnOffDateTime_to_Datetime(OnOffDateTime:TDateTime_SourceRecord_OnOff):Tdatetime;
var
 ed: byte;
 Des:byte;
 Minute,Hour,day,Month,Year:word;
begin
 if (
    ((OnOffDateTime.hour=$FF) and (OnOffDateTime.day=$FF)
     and (OnOffDateTime.month=$FF)  and (OnOffDateTime.year=$FF) and (OnOffDateTime.Minute=$FF))
    or
    ((OnOffDateTime.hour=0) and (OnOffDateTime.day=0)
     and (OnOffDateTime.month=0)  and (OnOffDateTime.year=0) and (OnOffDateTime.Minute=0))
    )
     then  result :=0
   else
   begin
    ed:=OnOffDateTime.Minute and $0F;
    DES:=((OnOffDateTime.Minute and $F0) shr 4);
    Minute:=des*10+ed;

    ed:=OnOffDateTime.year and $0F;
    DES:=((OnOffDateTime.year and $F0) shr 4);
    Year:=des*10+ed+2000;

    ed:=OnOffDateTime.hour and $0F;
    DES:=((OnOffDateTime.hour and $F0) shr 4);
    Hour:=des*10+ed;

    ed:=OnOffDateTime.day and $0F;
    DES:=((OnOffDateTime.day and $F0) shr 4);
    day:=des*10+ed;

    ed:=OnOffDateTime.month and $0F;
    DES:=((OnOffDateTime.month and $F0) shr 4);
    Month:=des*10+ed;
    try
     result:=encodedate(Year,month,day)+encodetime(hour,minute,0,0);
     except
     result:=0;
    end;
   {  if result > now then    // не надо проверять для приборов с большими архивами
       result:=encodedate(currentYear-1,month,day)+encodetime(hour,minute,0,0);
   }end;
end;

procedure TImport_Signur_Form2.miLoadDataClick(Sender: TObject);
var
 i:integer;
 //Mult:double;
 prom_value:Extended;
 Mult_Byte:byte;
 nn:integer;
 dt :tDatetime;
 File_Off_ReasonName:string;
begin
  inherited;
  nn:=sizeof(THours_SourceValue_ER);
  FD:=TFilestream.Create(FName, fmOpenRead);
  case typeoffile of
   1:{Hours}
     begin
      case device_type of
       0:begin
        // июнь  2016   FD.read(H_SourceArray_ER[1],FD.size{-1} {div sizeof(THours_SourceValue_ER)});
          FD.read(H_SourceArray_ER[1],FD.size-1 {div sizeof(THours_SourceValue_ER)});
          FD.Read(Mult_Byte,1) ;
         end;
       1:begin
      //  июнь  2016   FD.read(H_SourceArray_EA[1],FD.size{-1} {div sizeof(THours_SourceValue_EA)});
         FD.read(H_SourceArray_EA[1],FD.size-1 {div sizeof(THours_SourceValue_EA)});
          FD.Read(Mult_Byte,1) ;
         end;
       2,3:begin
          FD.read(H_SourceArray_A[1],FD.size{-1}{ div sizeof(THours_SourceValue_A)});
          FD.Read(Mult_Byte,1) ;    // для совместимости с предыдущим порядком работы
         end;
       end;   //case
      case device_type of
        0,1: begin  //Для Акронов коэффициент определяется для каждого отсчета ниже  при переборе отсчетов
              mult_k:=1;
              if mult_Byte=255 then mult_k:=1;   // имеет смысл для ЭхоР и Эхо_А

               case mult_byte of
               0: mult_k:=0.001;
               1: mult_k:=0.01;
               2: mult_k:=0.1;
               3: mult_k:=1;
               4: mult_k:=10;
               5: mult_k:=100;
              end;
             end;
         end;   //case
     end;
   2:{Days}
      begin
      case device_type of
       0:begin
      //  июнь  2016    FD.read(D_SourceArray_ER[1],FD.size{-1}{ div sizeof(TDays_SourceValue_ER)});
          FD.read(D_SourceArray_ER[1],FD.size-1{ div sizeof(TDays_SourceValue_ER)});
          FD.Read(Mult_Byte,1) ;
         end;
       1:begin
       //  июнь  2016    FD.read(D_SourceArray_EA[1],FD.size{-1}{ div sizeof(TDays_SourceValue_EA)});
          FD.read(D_SourceArray_EA[1],FD.size-1{ div sizeof(TDays_SourceValue_EA)});
          FD.Read(Mult_Byte,1) ;
         end;
       2,3:begin
          FD.read(D_SourceArray_A[1],FD.size{-1} {div sizeof(TDays_SourceValue_A)});
          FD.Read(Mult_Byte,1) ;    // для совместимости с предыдущим порядком работы
         end;
      end;  //case

       case device_type of
        0,1: begin  //Для Акронов коэффициент определяется для каждого отсчета ниже при переборе отсчетов
              mult_k:=1;
              if mult_Byte=255 then mult_k:=1;   // имеет смысл для ЭхоР и Эхо_А
              case mult_byte of
               0: mult_k:=0.001;
               1: mult_k:=0.01;
               2: mult_k:=0.1;
               3: mult_k:=1;
               4: mult_k:=10;
               5: mult_k:=100;
              end;
            end;
         end; //case
      end;
   3:{On} FD.read(On_SourceArray[1],FD.size{ div sizeof(TDateTime_SourceRecord_OnOff)});
   4:{Off}
     begin
      FD.read(Off_SourceArray[1],FD.size{ div sizeof(TDateTime_SourceRecord_OnOff)});
      File_Off_ReasonName :=extractFilepath(FName)+'Temp_err';
      if fileexists(File_Off_ReasonName) then
       begin
        try
         FDR:=TFilestream.Create(File_Off_ReasonName, fmOpenRead);
         if fdr.size>sizeof(Off_ReasonArray) then   FDR.Read(Off_ReasonArray[1],sizeof(Off_ReasonArray))
          else  FDR.Read(Off_ReasonArray[1],FDR.Size);
         finally
           FDR.Destroy;
         end
       end;
     end;
  end;
 Fd.Destroy;

  if typeoffile = 1{Hours}   then
  begin
  dm.q.SQL.Clear;
  dm.q.SQL.add(' execute procedure AddHoursData(:eksp_nomer,:Hour_Value,:s_Value,:Prior_Hour_Value, :channel)');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;

  for i:=length(H_SourceArray_ER) downto 1 do
    begin
       case device_type of
       0: begin
          dm.q.parambyname('Hour_Value').asdatetime:=HDatetime_to_Datetime(H_SourceArray_ER[i].DT);
          prom_value:=(H_SourceArray_ER[i].value);
          dm.q.parambyname('S_Value').value:=prom_value*mult_k;//(H_SourceArray_ER[i].value)*mult_k;
          dm.q.parambyname('Channel').asinteger:=0;
          end;
       1: begin      // июнь  2016            .
             // При обработке файлов temp_h и temp_d от ЭХО учитывать множитель, находящийся в последнем байте файла.
             // Сейчас значение объема в базе на 1000 меньше реального, см. вложенную базу ЭХО-Р-02 нр 4000 и файлы temp
//          dm.q.parambyname('Hour_Value').asdatetime:=HDatetime_to_Datetime(H_SourceArray_EA[i].DT);
//          dm.q.parambyname('S_Value').value:=H_SourceArray_EA[i].value;
//          dm.q.parambyname('Channel').asinteger:=0;

           dm.q.parambyname('Hour_Value').asdatetime:=HDatetime_to_Datetime(H_SourceArray_ER[i].DT);
           prom_value:=(H_SourceArray_ER[i].value);
           dm.q.parambyname('S_Value').value:=prom_value*mult_k;//(H_SourceArray_ER[i].value)*mult_k;
           dm.q.parambyname('Channel').asinteger:=0;
          end;
       2,3: begin
             dm.q.parambyname('Hour_Value').asdatetime:=HDatetime_to_Datetime(H_SourceArray_A[i].DT);
             if device_type = 2 then dm.q.parambyname('Channel').value:=0;
             if device_type = 3 then dm.q.parambyname('Channel').asinteger:=Channel;
             MULT_Byte:=H_SourceArray_A[i].Mult_Byte;  // июль 2008
             Mult_K:=1;
             if mult_Byte=255 then mult_k:=1;
             case mult_byte of
              0: mult_k:=0.001;
              1: mult_k:=0.01;
              2: mult_k:=0.1;
              3: mult_k:=1;
              4: mult_k:=10;
              5: mult_k:=100;
             end;

             if H_SourceArray_A[i].value>=$80000000 then
               Prom_value:=-1.0*(H_SourceArray_A[i].value and  $7FFFFFFF)
                else Prom_Value:=H_SourceArray_A[i].value;
             dm.q.parambyname('S_Value').value:=Prom_Value *mult_k;

    (*      if H_SourceArray_A[i].value>=$80000000 then
            dm.q.parambyname('S_Value').asfloat:=-((H_SourceArray_A[i].value and  $7FFFFFFF) *mult_k)
             else dm.q.parambyname('S_Value').asfloat:=(H_SourceArray_A[i].value)*mult_k;
      *)    end;
       end;
       dm.q.parambyname('Prior_Hour_Value').asdatetime:=dm.q.parambyname('Hour_Value').asdatetime-1/24.0;

       if (not isnan(dm.q.parambyname('S_Value').value)) then
          begin
           if ((dm.q.parambyname('Hour_Value').asdatetime>0)
            and(dm.q.parambyname('Hour_Value').asdatetime > HourLast)) then
                dm.q.execsql;
          end
     end;
   dm.q.SQL.Clear;
 //  dm.q.Transaction.commitretaining;

end;


  if typeoffile = 2{DAYS}   then
  begin
  dm.q.SQL.Clear;
  dm.q.SQL.add(' execute procedure AddDaysData(:eksp_nomer,:Day_Value,:s_Value,:Prior_Day_Value, :channel)');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  for i:= length(D_SourceArray_ER) downto 1 do
    begin
     case device_type of
       0: begin
          dt:= DDatetime_to_Datetime(D_SourceArray_ER[i].DT) ;
          if dt =0 then  dm.q.parambyname('Day_Value').Clear else
          dm.q.parambyname('Day_Value').asdatetime:=dt;
          prom_value:=D_SourceArray_ER[i].value;
          dm.q.parambyname('S_Value').value:=Prom_Value*mult_k;//   D_SourceArray_ER[i].value*mult_k;
          dm.q.parambyname('Channel').asinteger:=0;
          end;
       1: begin       // июнь  2016            .
             // При обработке файлов temp_h и temp_d от ЭХО учитывать множитель, находящийся в последнем байте файла.
             // Сейчас значение объема в базе на 1000 меньше реального, см. вложенную базу ЭХО-Р-02 нр 4000 и файлы temp
//
            dt:= DDatetime_to_Datetime(D_SourceArray_EA[i].DT) ;
            if dt=0 then   dm.q.parambyname('Day_Value').clear
              else  dm.q.parambyname('Day_Value').asdatetime:=DT; //DDatetime_to_Datetime(D_SourceArray_EA[i].DT);

           prom_value:=D_SourceArray_ER[i].value;
       //     dm.q.parambyname('S_Value').value:=D_SourceArray_EA[i].value;
           dm.q.parambyname('S_Value').value:=Prom_Value*mult_k;//   D_SourceArray_ER[i].value*mult_k;
           dm.q.parambyname('Channel').asinteger:=0;
          end;
       2,3: begin
          if device_type = 2 then dm.q.parambyname('Channel').asinteger:=0;
          if device_type = 3 then dm.q.parambyname('Channel').asinteger:=Channel;

          dt:= DDatetime_to_Datetime(D_SourceArray_A[i].DT) ;

          if dt=0 then   dm.q.parambyname('Day_Value').clear else
                         dm.q.parambyname('Day_Value').asdatetime:=dt;
          MULT_Byte:=D_SourceArray_A[i].Mult_Byte;  // июль 2008
           Mult_K:=1;
          if mult_Byte=255 then mult_k:=1;
           case mult_byte of
            0: mult_k:=0.001;
            1: mult_k:=0.01;
            2: mult_k:=0.1;
            3: mult_k:=1;
            4: mult_k:=10;
            5: mult_k:=100;
           end;
          if D_SourceArray_A[i].value>=$80000000 then
            prom_value:=-1.0*(D_SourceArray_A[i].value and  $7FFFFFFF)
             else Prom_Value:=D_SourceArray_A[i].value;
          dm.q.parambyname('S_Value').value:=Prom_Value*Mult_K;
       (*
           if D_SourceArray_A[i].value>=$80000000 then
            dm.q.parambyname('S_Value').asfloat:=-((D_SourceArray_A[i].value and  $7FFFFFFF) *mult_k)
             else dm.q.parambyname('S_Value').asfloat:=D_SourceArray_A[i].value*mult_k;
         *)
          end;
       end;
       dm.q.parambyname('Prior_Day_Value').asdatetime:=dm.q.parambyname('Day_Value').asdatetime-1;

        if (not isnan(dm.q.parambyname('S_Value').value)) then
          begin
          if ((dm.q.parambyname('Day_Value').asdatetime>0)
              and(dm.q.parambyname('Day_Value').asdatetime > dayLast ))then
                     dm.q.execsql;
          end;
    end;

  dm.q.SQL.Clear;
  dm.q.SQL.add(' update DaysData set d_value = 0 where eksp_nomer = :eksp_nomer and day_value > :DayLast');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  dm.q.parambyname('dayLast').asdatetime:=DayLast;
  if dayLast>0 then dm.q.execsql;
  //dm.q.Transaction.commitretaining;
 end;

 if typeoffile = 3{On}   then
  begin

{  dm.q.SQL.add(' delete from on_off oo where oo.eksp_nomer = :eksp_nomer and status = 1 and '+
               ' oo.onoff_event = (select max(onoff_event) from ' +
               '                     on_off where  eksp_nomer = :eksp_nomer)');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  dm.q.execsql;
 }
  dm.q.SQL.Clear;
  dm.q.SQL.add(' execute procedure AddOnOffEvent(:eksp_nomer,:onOff_Event,:status,:Off_Reason_int)');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  dm.q.parambyname('status').asinteger:=1;
  dm.q.parambyname('off_Reason_Int').Clear;

  for i:=1 to length(On_SourceArray) do
    begin
       if OnOffDateTime_to_Datetime(On_SourceArray[i])<>0 then
        begin
         dm.q.parambyname('OnOff_Event').asdatetime:=OnOffDateTime_to_Datetime(On_SourceArray[i]);
         dm.q.execsql;
        end;
    end;
  //dm.q.Transaction.commitretaining;
 end;


 if typeoffile = 4{Off}   then
  begin

 { dm.q.SQL.Clear;
  dm.q.SQL.add(' delete from on_off oo where oo.eksp_nomer = :eksp_nomer and status=0 and '+
               ' oo.onoff_event = (select max(onoff_event) from ' +
               '                     on_off where  eksp_nomer = :eksp_nomer)');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  dm.q.execsql;
  }
  dm.q.SQL.Clear;
  dm.q.SQL.add(' execute procedure AddOnOffEvent(:eksp_nomer,:onOff_Event,:status,:Off_Reason_int)');
  dm.q.parambyname('eksp_nomer').asinteger:=eksp_nomer;
  dm.q.parambyname('status').asinteger:=0;

  for i:=1 to length(Off_SourceArray)-1 do
    begin
       if OnOffDateTime_to_Datetime(Off_SourceArray[i])<>0 then
        begin
         dm.q.parambyname('OnOff_Event').asdatetime:=OnOffDateTime_to_Datetime(Off_SourceArray[i]);
         if (i= length(Off_SourceArray)-1) then dm.q.parambyname('Off_Reason_Int').value:=Off_ReasonArray[1]
          else  dm.q.parambyname('Off_Reason_Int').value:=Off_ReasonArray[i+1];
         dm.q.execsql;
        end;
    end;
  //dm.q.Transaction.commitretaining;
 end;

end;


end.
