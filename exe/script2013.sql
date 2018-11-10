/* Server version: WI-V6.3.5.4926 Firebird 1.5 
   SQLDialect: 3. ODS: 10.0. Forced writes: Off. Sweep inteval: 20000.
   Page size: 4096. Cache pages: 2048 (8192 Kb). Read-only: False. */
SET NAMES WIN1251;

SET SQL DIALECT 3;

CONNECT '127.0.0.1:C:\signur\exe\Databases\_Default\Signur_opora.GDB' USER 'SYSDBA' PASSWORD 'masterkey';

SET AUTODDL ON;

/* Alter Procedure... */
/* Alter (ADDDAYSDATA) */
SET TERM ^ ;

ALTER PROCEDURE ADDDAYSDATA(EKSP_NOMER INTEGER,
DAY_VALUE DATE,
S_VALUE DOUBLE PRECISION,
PRIOR_DAY_VALUE DATE,
CHANNEL INTEGER)
 AS
begin
  /* Procedure Text */
  if (channel=0) then
  begin
  if (not (exists (select id_daysdata from DaysData
   where eksp_nomer= :eksp_nomer and Day_Value = :Day_Value))) then
    insert into DaysData (Day_Value, eksp_nomer, s_Value,prior_Day_Value, id_device )
       values (:Day_Value, :eksp_nomer, :s_Value,:prior_Day_Value , null);
  end
  if (channel in (1,2)) then
  begin
  if (not (exists (select id_daysdata from DaysData
   where eksp_nomer= :eksp_nomer and Day_Value = :Day_Value and id_device = :channel))) then
    insert into DaysData (Day_Value, eksp_nomer, s_Value,prior_Day_Value, id_device )
       values (:Day_Value, :eksp_nomer, :s_Value,:prior_Day_Value , :channel);
  end

end
^

/* Alter (ADDHOURSDATA) */
ALTER PROCEDURE ADDHOURSDATA(EKSP_NOMER INTEGER,
HOUR_VALUE TIMESTAMP,
S_VALUE DOUBLE PRECISION,
PRIOR_HOUR_VALUE TIMESTAMP,
CHANNEL INTEGER)
 AS
begin
  /* Procedure Text */
  if (channel=0) then
  begin
  if (not (exists (select id_hoursdata from HoursData
   where eksp_nomer= :eksp_nomer and Hour_Value = :Hour_Value))) then
    insert into HoursData (Hour_Value, eksp_nomer, s_Value, prior_Hour_Value, id_device)
       values (:Hour_Value, :eksp_nomer, :s_Value, :prior_Hour_Value,null);
  end
  if (channel in (1,2)) then
  begin
  if (not (exists (select id_hoursdata from HoursData
   where eksp_nomer= :eksp_nomer and Hour_Value = :Hour_Value))) then
    insert into HoursData (Hour_Value, eksp_nomer, s_Value, prior_Hour_Value, id_device)
       values (:Hour_Value, :eksp_nomer, :s_Value, :prior_Hour_Value,:channel);
  end
end
^

/* Alter exist trigger... */
ALTER TRIGGER DAYSDATA_BU0
AS
BEGIN
 if (new.id_device is null) then
 begin
  IF (NEW.ID_DAYSDATA IS NULL) THEN
    NEW.ID_DAYSDATA = GEN_ID(GEN_DAYSDATA_ID,1);
   new.d_value = null;
  select s_value from daysdata
     where eksp_nomer = new.eksp_nomer
       and day_value = (select max(day_value) from daysdata where
          day_value<new.day_value and eksp_nomer = new.eksp_nomer )
            into new.d_value;
  if (not (new.d_value is null)) then new.d_value = new.s_value - new.d_value;
 end
 if (not (new.id_device is null)) then
 begin
   IF (NEW.ID_DAYSDATA IS NULL) THEN
    NEW.ID_DAYSDATA = GEN_ID(GEN_DAYSDATA_ID,1);
   new.d_value = null;
  select s_value from daysdata
     where eksp_nomer = new.eksp_nomer and id_device = new.id_device
       and day_value = (select max(day_value) from daysdata where
          day_value<new.day_value and eksp_nomer = new.eksp_nomer and id_device = new.id_device)
            into new.d_value;
  if (not (new.d_value is null)) then new.d_value = new.s_value - new.d_value;
 end
END
^

/* Alter exist trigger... */
ALTER TRIGGER HOURSDATA_BU0
AS
BEGIN
  new.d_value = null;
  if (new.id_device is null) then
  begin
  select s_value from hoursdata
     where eksp_nomer = new.eksp_nomer
       and hour_value = (select max(hour_value) from hoursdata where
          hour_value<new.hour_value and eksp_nomer = new.eksp_nomer )
            into new.d_value;
    if (not (new.d_value is null)) then new.d_value = new.s_value - new.d_value;
  end
  if (not (new.id_device is null)) then
  begin
   select s_value from hoursdata
     where eksp_nomer = new.eksp_nomer  and id_device = new.id_device
       and hour_value = (select max(hour_value) from hoursdata where
          hour_value<new.hour_value and eksp_nomer = new.eksp_nomer
          and id_device = new.id_device )
            into new.d_value;
    if (not (new.d_value is null)) then new.d_value = new.s_value - new.d_value;
  
  end
END
^

