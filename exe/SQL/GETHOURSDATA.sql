CREATE OR ALTER procedure GET_HOURSDATA (
    EKSP_NOMER_IN integer,
    ID_DEVICE_IN integer,
    DD1 timestamp,
    DD2 timestamp)
returns (
    ID_HOURSDATA integer,
    ID_DEVICE integer,
    HOUR_VALUE timestamp,
    S_VALUE double precision,
    EKSP_NOMER integer,
    PRIOR_HOUR_VALUE timestamp,
    D_VALUE_PRIOR double precision,
    D_VALUE double precision,
    ONOFF_EXISTS integer)
as
declare variable S_VALUE_NEXT double precision;
declare variable H_VALUE_NEXT timestamp;
declare variable delt_T double precision;
BEGIN
  d_value = null;
  s_value_next = null;
  if (id_device_IN = 0) then
 begin
  select first 1 s_value, dd1.Hour_Value from hoursdata dd1
  where
   dd1.hour_value >:dd2    and
      dd1.eksp_nomer = :eksp_nomer_IN   and
      dd1.id_device is null
        order by dd1.hour_value
        into :s_value_next, :H_value_next;
    FOR
    select   hD.id_hoursdata, hd.id_device, hd.hour_value, hd.s_value, hd.eksp_nomer, hd.prior_hour_value,
    d_value, 
    (select count(oo.id_onoff) from on_off oo where oo.eksp_nomer = hd.eksp_nomer
     and oo.onoff_event between ( hd.hour_value-0.0416666666 ) and hd.hour_value ) as onoff_exists
    from HoursData HD
    where 
    eksp_nomer = :eksp_nomer_in
    and hour_Value between :DD1 and :DD2
    order by hd.hour_value desc
    INTO :ID_HOURSDATA,
         :ID_DEVICE,
         :HOUR_VALUE,
         :S_VALUE,
         :EKSP_NOMER,
         :PRIOR_HOUR_VALUE,
         :D_VALUE_prior,
         :ONOFF_EXISTS
  DO
  BEGIN
    if (s_value_next is null) then d_value = null;
    if (not (s_value is null)) then d_value = s_value_next - s_value;
    s_value_next = s_value;
    delt_T = h_Value_Next-Hour_Value   ;
    if ((delt_T) > 0.04266)  then
      d_Value =null;
    h_value_next = hour_value;
    SUSPEND;
  END
 end
 if (id_device_IN in (1,2)) then
 begin
  select first 1 s_value hour_value, hour_Value from hoursdata dd1
  where
   dd1.hour_value >:dd2    and
      dd1.eksp_nomer = :eksp_nomer_IN   and
      dd1.id_device = :id_device_IN
        order by dd1.hour_value
        into :s_value_next, :h_value_next;

    FOR
    select   hD.id_hoursdata, hd.id_device, hd.hour_value, hd.s_value, hd.eksp_nomer, hd.prior_hour_value,
    d_value, 
    (select count(oo.id_onoff) from on_off oo where oo.eksp_nomer = hd.eksp_nomer
     and oo.onoff_event between ( hd.hour_value-0.0416666666 ) and hd.hour_value ) as onoff_exists
    from HoursData HD
    where 
    eksp_nomer = :eksp_nomer_in
    and hour_Value between :DD1 and :DD2 and
    hd.id_device= :id_device_in
    order by hd.hour_value desc
    INTO :ID_HOURSDATA,
         :ID_DEVICE,
         :HOUR_VALUE,
         :S_VALUE,
         :EKSP_NOMER,
         :PRIOR_HOUR_VALUE,
         :D_VALUE_prior,
         :ONOFF_EXISTS
  DO
  BEGIN
    if (s_value_next is null) then d_value = null;
    if (not (s_value is null)) then d_value = s_value_next - s_value;
    s_value_next = s_value;
    delt_T = h_Value_Next-Hour_Value   ;
    if ((delt_T) > 0.04266)  then
             d_Value =null;
    h_value_next = hour_value;
    SUSPEND;
  END

 end

END


