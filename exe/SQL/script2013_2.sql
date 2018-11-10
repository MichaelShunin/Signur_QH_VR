CREATE OR ALTER PROCEDURE ADDHOURSDATA (
    eksp_nomer integer,
    hour_value timestamp,
    s_value double precision,
    prior_hour_value timestamp,
    channel integer)
as
begin
  /* Procedure Text */
  if (channel=0) then
  begin
  if (not (exists (select id_hoursdata from HoursData
   where
   eksp_nomer= :eksp_nomer and
   Hour_Value = :Hour_Value and
   (id_device is null)
     ))) then
    insert into HoursData (Hour_Value, eksp_nomer, s_Value, prior_Hour_Value, id_device)
       values (:Hour_Value, :eksp_nomer, :s_Value, :prior_Hour_Value,null);
  end
  if (channel in (1,2)) then
  begin
  if (not (exists (select id_hoursdata from HoursData
   where
   eksp_nomer= :eksp_nomer and
   Hour_Value = :Hour_Value and
   id_device = :channel)
   )) then
    insert into HoursData (Hour_Value, eksp_nomer, s_Value, prior_Hour_Value, id_device)
       values (:Hour_Value, :eksp_nomer, :s_Value, :prior_Hour_Value,:channel);
  end
end


