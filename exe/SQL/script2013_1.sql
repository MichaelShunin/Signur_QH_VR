CREATE OR ALTER PROCEDURE ADDDAYSDATA (
    eksp_nomer integer,
    day_value date,
    s_value double precision,
    prior_day_value date,
    channel integer)
as
begin
  /* Procedure Text */
  if (channel=0) then
  begin
  if (not (exists (select id_daysdata from DaysData
   where
   eksp_nomer= :eksp_nomer and
   Day_Value = :Day_Value  and
   (id_device is null)
   ))) then
    insert into DaysData (Day_Value, eksp_nomer, s_Value,prior_Day_Value, id_device )
       values (:Day_Value, :eksp_nomer, :s_Value,:prior_Day_Value , null);
  end
  if (channel in (1,2)) then
  begin
  if (not (exists (select id_daysdata from DaysData
   where
   eksp_nomer= :eksp_nomer and
   Day_Value = :Day_Value and
   id_device = :channel
   )))  then
    insert into DaysData (Day_Value, eksp_nomer, s_Value,prior_Day_Value, id_device )
       values (:Day_Value, :eksp_nomer, :s_Value,:prior_Day_Value , :channel);
  end

end
