CREATE OR ALTER trigger daysdata_bu0 for daysdata
active before update position 0
AS
BEGIN
 if (new.id_device is null) then
 begin
  IF (NEW.ID_DAYSDATA IS NULL) THEN
    NEW.ID_DAYSDATA = GEN_ID(GEN_DAYSDATA_ID,1);
  new.d_value = null;
  select s_value from daysdata
     where
     eksp_nomer = new.eksp_nomer  and
     day_value =
     (select max(day_value) from daysdata where
          day_value<new.day_value and eksp_nomer = new.eksp_nomer )
            into new.d_value;
  if (not (new.d_value is null)) then new.d_value = new.s_value - new.d_value;
 end
 if (not (new.id_device is null)) then
 begin
   IF (NEW.ID_DAYSDATA IS NULL) THEN
    NEW.ID_DAYSDATA = GEN_ID(GEN_DAYSDATA_ID,1);
   new.d_value = null;
  select s_value from daysdata   where
  eksp_nomer = new.eksp_nomer and
  id_device = new.id_device   and
  day_value =
    (select max(day_value) from daysdata where
          day_value<new.day_value and
          eksp_nomer = new.eksp_nomer and
          id_device = new.id_device)
            into new.d_value;
  if (not (new.d_value is null)) then new.d_value = new.s_value - new.d_value;
 end
END