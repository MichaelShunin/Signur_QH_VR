CREATE OR ALTER trigger hoursdata_bu0 for hoursdata
active before update position 0
AS
BEGIN
  new.d_value = null;
  if (new.id_device is null) then
  begin
   select s_value from hoursdata
     where eksp_nomer = new.eksp_nomer  and
       hour_value =
        (select max(hour_value) from hoursdata where
          hour_value<new.hour_value and eksp_nomer = new.eksp_nomer )
            into new.d_value;
    if (not (new.d_value is null)) then new.d_value = new.s_value - new.d_value;
  end
  if (not (new.id_device is null)) then
  begin
   select s_value from hoursdata
     where
       eksp_nomer = new.eksp_nomer  and
       id_device = new.id_device    and
        hour_value =
        (select max(hour_value) from hoursdata where
          hour_value<new.hour_value and
          eksp_nomer = new.eksp_nomer and
          id_device = new.id_device )
            into new.d_value;
    if (not (new.d_value is null)) then new.d_value = new.s_value - new.d_value;
  
  end
END

