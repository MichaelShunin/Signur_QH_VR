CREATE OR ALTER trigger daysdata_bi for daysdata
active before insert position 0
AS                                 
  declare variable max_d_value date; 
  BEGIN  
   if (new.id_device = 0) then new.id_device = null;
   IF (NEW.ID_DAYSDATA IS NULL) THEN
      NEW.ID_DAYSDATA = GEN_ID(GEN_DAYSDATA_ID,1); 

   select max(day_value) from daysdata where
            day_value<new.day_value and eksp_nomer = new.eksp_nomer  
             into :max_d_value;        
  if (new.id_device is null) then
      select s_value from daysdata  where
         eksp_nomer = new.eksp_nomer
         and day_value = :max_d_value
         and (id_device is null) into new.d_value;
  if (new.id_device in (1,2)) then
      select s_value from daysdata  where
         eksp_nomer = new.eksp_nomer
         and day_value = :max_d_value
         and id_device  = new.id_device into new.d_value;
  if (not (new.d_value is null)) then new.d_value = new.s_value - new.d_value;
END
