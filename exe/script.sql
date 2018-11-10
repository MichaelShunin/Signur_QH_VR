
ALTER TABLE EKSP ADD INTERFACE_MODE SMALLINT DEFAULT 0
^

DESCRIBE FIELD INTERFACE_MODE TABLE EKSP
'0 - RS232    1 - RS485(ModBus)'
^

ALTER TABLE EKSP ADD VIA_MODEM SMALLINT DEFAULT 0^

DESCRIBE FIELD VIA_MODEM TABLE EKSP
'0 - не использовать модем  1 - обращение к прибору через модем'
^




ALTER TRIGGER EKSP_BI
AS
BEGIN
  IF (NEW.EKSP_NOMER IS NULL) THEN
    NEW.EKSP_NOMER = GEN_ID(GEN_EKSP_ID,1);
  for
   select (eksp_signalsource) from eksp where eksp_theme = new.eksp_theme
   into new.eksp_signalsource do
    begin
    end
 --   добавление для 2011 года - поддержка модема-концентратора
  new.via_modem = 0;
  if (new.modem=1 ) then new.via_modem = 1;
  new.interface_mode = 0;
  if (new.modbus = 1) then new.interface_mode = 1;
END
^

