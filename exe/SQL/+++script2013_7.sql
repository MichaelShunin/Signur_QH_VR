
CREATE OR ALTER trigger eksp_bi for eksp
active before insert position 0
AS                   
 BEGIN                
   IF (NEW.EKSP_NOMER IS NULL) THEN 
     NEW.EKSP_NOMER = GEN_ID(GEN_EKSP_ID,1); 
   for  
    select (eksp_signalsource) from eksp where eksp_theme = new.eksp_theme 
    into new.eksp_signalsource do 
     begin 
     end     
   new.via_modem = 0; 
   if (new.modem=1 ) then new.via_modem = 1;
--   new.interface_mode = 0;
   if (new.modbus = 1) then new.interface_mode = 1;
 END



