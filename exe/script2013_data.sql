SET SQL DIALECT 3;

SET NAMES WIN1251;


CONNECT '127.0.0.1:C:\signur\exe\Databases\_Default\Signur_opora.GDB' USER 'SYSDBA' PASSWORD 'masterkey';

INSERT INTO DEVICES (ID_DEVICE, SERIAL_NUM, DEVICE_TYPE, DEVICE_NAME, DESCR, N_BITS, ACTUAL, N_CHANNEL, FREQUENCY, CUSTOMER, CUSTOMER_DESCR, FILEFILTER, FORMAT_X, PROCESSING, WINDOWHEADER, TYPEOFFILE, DLL_NAME, GETINFO_FUNCTION_NAME, GETDATA_FUNCTION_NAME, STARTNUMBER_LARGEARCH)
  VALUES (16, '1', 3, '�����-2', NULL, 10, '��', 5, 1000, 'Signur2', NULL, '���������� ������', '##0.##', '0', '������', '.DAT', 'Import_Signur_2', 'GETINFO_SIGNUR', 'GETDATA_SIGNUR', 4000);


COMMIT WORK;

SET GENERATOR GEN_DEVICES TO 16;