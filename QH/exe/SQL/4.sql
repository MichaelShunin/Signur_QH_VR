CREATE OR ALTER trigger devices_bi for devices
active before insert position 0
AS
BEGIN
  IF (NEW.ID IS NULL) THEN
    NEW.ID = GEN_ID(GEN_DEVICES_ID,1);
--  new.record_date = 'now';
new.l_0 = 0;
END