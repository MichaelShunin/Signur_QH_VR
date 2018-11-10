/* Server version: WI-V6.3.5.4926 Firebird 1.5 
   SQLDialect: 3. ODS: 10.1. Forced writes: On. Sweep inteval: 20000.
   Page size: 16384. Cache pages: 2048 (32768 Kb). Read-only: False. */
SET NAMES WIN1251;

SET SQL DIALECT 3;


SET AUTODDL ON;

ALTER TABLE DEVICES ADD L_0 DOUBLE PRECISION;

DESCRIBE FIELD L_0 TABLE DEVICES
'размер мертвой зоны, м';

/* Alter Procedure... */
/* Alter (CLONEDEVICE) */
SET TERM ^ ;

ALTER PROCEDURE CLONEDEVICE(OLD_DEVICE_ID INTEGER)
 RETURNS(DEVICE_ID INTEGER)
 AS
declare variable i integer;
begin
  /* Procedure Text */
  Device_ID = GEN_ID(GEN_DEVICES_ID,1);
  insert into devices (
  ID , NAME, TYPEDEVICE_ID ,  CUSTOMER,
  DESCR, ID_CONVERTER, LOCKED, device_Parent_ID,
  composition_Current,
  composition_RS,
  composition_Level,
  params_are_bad , L_0  )
   select :Device_ID,NAME, TYPEDEVICE_ID ,
           CUSTOMER,
           DESCR, ID_CONVERTER, 0, :Old_Device_ID,
           composition_Current,
           composition_RS,
           composition_Level,
           params_are_bad  , L_0
           from devices where id = :old_device_id;
   insert into DeviceParams
            (Device_ID, PARAMeter_ID, param_value  )
     select :device_id, Parameter_ID ,Param_Value
      from  deviceParams
      where  device_id = :old_device_id;
     delete from qh where device_id = :device_id;
     insert into qh
            ( DEVICE_ID, X_VALUE,Y_VALUE, I, T_COUNTER, X_PROCENT, Y_PROCENT)
      select :device_id, X_VALUE,Y_VALUE, I, T_COUNTER, X_PROCENT, Y_PROCENT from  QH
      where  device_id = :old_device_id;


  suspend;
end
^

/* Alter (COPYDEVICE) */
ALTER PROCEDURE COPYDEVICE(OLD_DEVICE_ID INTEGER)
 RETURNS(DEVICE_ID INTEGER)
 AS
declare variable i integer;
begin
  /* Procedure Text */
  Device_ID = GEN_ID(GEN_DEVICES_ID,1);
  insert into devices (
  ID , NAME, TYPEDEVICE_ID ,  CUSTOMER,
  DESCR, ID_CONVERTER, LOCKED,
  composition_Current,
  composition_RS,
  composition_Level,
  params_are_bad, L_0)
   select :Device_ID,NAME, TYPEDEVICE_ID ,
           CUSTOMER,
           DESCR, ID_CONVERTER, 0,
           composition_Current,
           composition_RS,
           composition_Level,
           params_are_bad  , L_0
           from devices where id = :old_device_id;
   insert into DeviceParams
            (Device_ID,      PARAMeter_ID, param_value  )
     select :device_id, Parameter_ID ,Param_Value
      from  deviceParams
      where  device_id = :old_device_id;
    delete from qh where device_id = :device_id;
     insert into qh
            (DEVICE_ID, X_VALUE,Y_VALUE, I, T_COUNTER, X_PROCENT, Y_PROCENT)
      select :device_id, X_VALUE,Y_VALUE, I, T_COUNTER, X_PROCENT, Y_PROCENT from  QH
      where  device_id = :old_device_id;

  suspend;
end
^

/* Alter exist trigger... */
ALTER TRIGGER DEVICES_BI
AS
BEGIN
  IF (NEW.ID IS NULL) THEN
    NEW.ID = GEN_ID(GEN_DEVICES_ID,1);
--  new.record_date = 'now';
 new.l_0=0;
END
^

