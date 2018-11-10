create or ALTER PROCEDURE COPYDEVICE(OLD_DEVICE_ID INTEGER)
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