CREATE OR ALTER procedure GET_DAYSDATA (
    EKSP_NOMER_IN integer,
    ID_DEVICE_IN integer,
    DD1 date,
    DD2 date)
returns (
    ID_DAYSDATA integer,
    ID_DEVICE integer,
    DAY_VALUE date,
    S_VALUE double precision,
    EKSP_NOMER integer,
    PRIOR_DAY_VALUE date,
    D_VALUE_PRIOR double precision,
    D_VALUE double precision,
    ONOFF_EXISTS integer)
as
declare variable S_VALUE_NEXT double precision;
declare variable day_value_next date;
declare variable d_delt double precision;
BEGIN
  d_value = null;
  s_value_next = null;
  if (id_device_IN = 0) then
 begin
  select first 1 s_value , day_value from DAYsdata dd1
  where
   dd1.DAY_value >:dd2    and
      dd1.eksp_nomer = :eksp_nomer_IN   and
      dd1.id_device is null
        order by dd1.DAY_value
        into :s_value_next, :day_value_next;
    FOR
    select   hD.id_DAYsdata, hd.id_device, hd.DAY_value, hd.s_value, hd.eksp_nomer, hd.prior_DAY_value,
    d_value, 
    (select count(oo.id_onoff) from on_off oo where oo.eksp_nomer = hd.eksp_nomer
     and oo.onoff_event between ( hd.DAY_value-1 ) and hd.DAY_value ) as onoff_exists
    from DAYsData HD
    where 
    eksp_nomer = :eksp_nomer_in
    and DAY_Value between :DD1 and :DD2
    order by hd.DAY_value desc
    INTO :ID_DAYSDATA,
         :ID_DEVICE,
         :DAY_VALUE,
         :S_VALUE,
         :EKSP_NOMER,
         :PRIOR_DAY_VALUE,
         :D_VALUE_prior,
         :ONOFF_EXISTS
  DO
  BEGIN
    if (s_value_next is null) then d_value = null;
    if (not (s_value is null)) then d_value = s_value_next - s_value;
    s_value_next = s_value;
    d_delt = day_value_next - day_value;
    if (d_delt >1) then d_value = null;
    day_value_next = day_value;
     SUSPEND;
  END
 end
 if (id_device_IN in (1,2)) then
 begin
  select first 1 s_value , day_value from DAYsdata dd1
  where
   dd1.DAY_value >:dd2    and
      dd1.eksp_nomer = :eksp_nomer_IN   and
      dd1.id_device = :id_device_IN
        order by dd1.DAY_value
        into :s_value_next, :day_value_next;

    FOR
    select   hD.id_DAYsdata, hd.id_device, hd.DAY_value, hd.s_value, hd.eksp_nomer, hd.prior_DAY_value,
    d_value, 
    (select count(oo.id_onoff) from on_off oo where oo.eksp_nomer = hd.eksp_nomer
     and oo.onoff_event between ( hd.DAY_value-1 ) and hd.DAY_value ) as onoff_exists
    from DAYsData HD
    where 
    eksp_nomer = :eksp_nomer_in
    and DAY_Value between :DD1 and :DD2 and
    hd.id_device= :id_device_in
    order by hd.DAY_value desc
    INTO :ID_DAYSDATA,
         :ID_DEVICE,
         :DAY_VALUE,
         :S_VALUE,
         :EKSP_NOMER,
         :PRIOR_DAY_VALUE,
         :D_VALUE_prior,
         :ONOFF_EXISTS
  DO
  BEGIN
    if (s_value_next is null) then d_value = null;
    if (not (s_value is null)) then d_value = s_value_next - s_value;
    s_value_next = s_value;    
    d_delt = day_value_next - day_value;
    if (d_delt >1) then d_value = null;
    day_value_next = day_value;
    SUSPEND;
  END

 end

END
