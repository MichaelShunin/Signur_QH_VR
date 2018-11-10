CREATE OR ALTER trigger hoursdata_bi for hoursdata
active before insert position 0
AS   
 declare variable max_hour_value timestamp;  
 BEGIN   
  IF (NEW.ID_HOURSDATA IS NULL) THEN   
      NEW.ID_HOURSDATA = GEN_ID(GEN_HOURSDATA_ID,1);

   new.d_value = null;   

   if (new.id_device = 0 ) then new.id_device = null;

   if (new.id_device is null) then
    begin
     select max(hd.hour_value) from hoursdata hd  where
      hd.hour_value<new.hour_value and
      hd.eksp_nomer = new.eksp_nomer
              into :max_hour_value;
      select s_value from hoursdata  where
       eksp_nomer = new.eksp_nomer and
       hour_value = :max_hour_value
             into new.d_value;   
     end
   if (not (new.id_device is null)) then
    begin
     select max(hd.hour_value) from hoursdata hd  where
      hd.hour_value<new.hour_value and
      hd.eksp_nomer = new.eksp_nomer and
      hd.id_device = new.id_device
              into :max_hour_value;
      select s_value from hoursdata  where
       eksp_nomer = new.eksp_nomer and
       hour_value = :max_hour_value and
       id_device = new.id_device
             into new.d_value;   
     end
  if (not (new.d_value is null)) then new.d_value = new.s_value - new.d_value;   
 END
