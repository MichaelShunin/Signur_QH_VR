unit resources;

interface
{const
 rpHardware = 'HARDWARE';

 slog_addHWtoComp='add HW to comp';
  }

{var
 path_reportfile,
 ReportURL_Home:string;}
resourcestring
{$IFDEF LANG_EN}
  WARNING = 'Warning';
  ERROR = 'Error';
{  msgErro_NoSelectedUser  = ' �� ������ ������������' ;
  msgErrorOnDeleteSW = ' ��������� ����������� �� ����������';
  msg_Cantdelete_department='��� ������������� ������ ������� ' ;
  msg_DepartmentHaschild = '��� ������������� ����� ����������� ���������';
  msgNoSelectedResource = '��� ��������� ��������' ;
  msgErro_NoSelectedTask = '��� ��������� �����' ;
  Comp_User_HEADER_GB = 'The computer of "%s" consists of: ';
  ERROR_INVALID_LicCount = 'Count of License must be more of zero';
  Comp_HEADER_GB = 'The computer "%s" consists of: ';
  QUEST_DELETE_DIV = 'Are you sure you want to delete "%s"? All users of this department will be unassigned.';
  QUEST_DELETE_UserGroup =  'Are you sure you want to delete user group "%s"? '              ;
  QUEST_DELETE_UserGroupmember = 'Are you sure you want to delete user "%s"?  from the group?'  ;
  QUEST_ERASE_HW = 'Are you sure you want to discard "%s?"';
  QUEST_BREAK_HW = 'Are you sure you want to register breakage of "%s? S/N: %s"';
  QUEST_GET_Comp = 'Are you sure you want to get computer %s'#10'from "%s"?';
  QUEST_GET_HW = 'Are you sure you want to get "%s %s S/N: %s"'#10'from "%s"?';
  QUEST_ERASE_ARM = 'Are you sure you want to unregister computer Inv/N: "%s"?';
  QUEST_ERASE_TaskFromResource ='�� ������������� ������ ������� ������ "%s"? �� ������ ������������ � ��������?'  ;
  QUEST_ERASE_Report = 'Are you sure you want to delete report "%s"?';
  QUEST_GETOFF_HW = 'Are you sure you want to get off "%s" from computer?;
  QUEST_FREE_ARM = 're you sure you want to free computer S/N: "%s"?';
  QUEST_READ_BUG = 'Are you sure you want to mark message as read?';
  QUEST_ERASE_USER = 'Are you sure you want to unregister user %s?';
  QUEST_SendToUser_ARM = 'Are you sure you want to Send computer Inv/N: "%s" to use?';
  QUEST_Buy_HW = 'Are you sure want to registrate hardware?';
  QUEST_CancelBUY_HW ='Are you sure want to cancel registration of hardware?'
  QUEST_CancelBUY_Comp ='Are you sure want to cancel registration of computer?'
  QUEST_No_HW = ' There are not assigned hardware for computer';
  Quest_No_Inv = ' Number must not be empty' ;
  Quest_No_C_name = ' Computer name must not be empty' ;

  ERROR_DUBLICATE_USER = 'User registration error.'#10'Dublicate login name!';
  ERROR_INVALID_HWTYPE = 'Name of hardware type cannot be empty';
  ERROR_INVALID_SWTYPE = 'Name of software type cannot be empty';
  ERROR_INVALID_SWName = 'Name of software cannot be empty';
  ERROR_INVALID_ResourceName =  'Name of resource cannot be empty';
  ERROR_INVALID_ResourceWTYPE ='Name of resource cannot be empty';
  Error_no_free_License = 'The selected software has not got free licence';
 }  
{  HT_NAME = 'Type';
  HW_NAME = 'Name';
  HW_MODEL = 'Model';
  HW_COUNT = 'Amount';
  HW_BDATE = 'Receipt date';
  HW_DATE = 'Dispatch date';
  HW_SN = 'S/N';
  HARDWARE_LIST_CAPTION = 'Hardware list:';
  D_NAME = 'Department';

  OS_TYPE = 'OS Type';
  SW_TYPE_NAME = 'Type';
  OS_NAME = 'Op. system';
  SW_NAME = 'Name';
  SW_LCOUNT = 'License count';
  SW_LUSED = 'Licenses used';
  SOFTWARE_LIST_CAPTION = 'Software list:';

  SEND_SW_AMOUNT = 'License count: (Max=%s)';

  C_INV = 'Serial number';
  C_U_ID = 'Owner';

  U_FIO = 'User';

  UR_DATE = 'Message date';
  FREE_COMP_USER = '[ unassigned ]';
  FREE_DEP = '[  unassigned  ]';
}
{$ELSE}
  WARNING = '��������';
  ERROR = '������';
{  msgErro_NoSelectedUser  = ' �� ������ ������������' ;
  msgErrorOnDeleteSW = ' ��������� ����������� �� ����������';
  msg_Cantdelete_department='��� ������������� ������ ������� ' ;
  msgNoSelectedResource = '��� ��������� ��������' ;
  msg_DepartmentHaschild = '��� ������������� ����� ����������� ���������';
  msgErro_NoSelectedTask = '��� ��������� �����' ;
  GroupsOfUser_GB = '������������ "%s" ������ � ������ ����� ';
  ResourcesOfUser_GB = '������������ "%s" ����� ������ � �������� ';
  Comp_HEADER_GB = '������ ����������  "%s"';
  ERROR_INVALID_LicCount = '����� �������� ������ ���� ����� 0';
  QUEST_DELETE_DIV = '�� ������������� ������ ������� "%s"? ��� ���������� ����� ������������� ��������� ����������.';
  QUEST_DELETE_UserGroup = '�� ������������� ������ ������� ������ "%s"? ';
  QUEST_DELETE_UserGroupmember = '�� ������������� ������ ������� ����� ������ "%s"? '  ;
  QUEST_ERASE_TaskFromResource ='�� ������������� ������ ������� ������ "%s"? �� ������ ������������ � ��������?'  ;
  QUEST_DELETE_ResourcesofGroup = '�� ������������� ������ ��������� ������ ������ � ������� "%s"? ';
  QUEST_ERASE_HW = '�� ������������� ������ ������� "%s?"';
  QUEST_BREAK_HW = '�� ������������� ������ ���������������� ������� "%s? S/N: %s"';
  QUEST_GET_HW = '�� ������������� ������ ��������� "%s %s S/N: %s"'#10'�� "%s" �� ����� ���?';
  QUEST_GET_Comp = ' �� ������������� ������ ��������� ��������� %s'#10'�� "%s" �� ����� ���?';
  QUEST_ERASE_ARM = '�� ������������� ������ ��������� ��������� ���.� "%s" �� �������������?';
  QUEST_ERASE_Report = '�� ������������� ������ ������� ����� %s" ?';
  QUEST_GetOFF_HW = '�� ������������� ������ ������� "%s" �� ����������?';
  QUEST_FREE_ARM = '�� ������������� ������ ���������� ��������� ���.� "%s"?';
  QUEST_READ_BUG = '�� ������������� ������ �������� ��������� ��� �����������?';
  QUEST_ERASE_USER = '�� ������������� ������ ������� ������� ������ ������������ %s?';
  QUEST_SendToUser_ARM = '�� ������ �������� ��������� ���. ����� : "%s" ������������?';
  QUEST_Buy_HW = '�� ������������� ������� �������������?';
  QUEST_CancelBUY_HW ='�� ������ �������� �����������';
  QUEST_CancelBUY_Comp ='�� ������ �������� ����������� ����������?';
  QUEST_No_HW = ' �� ������ �������������';
  Quest_No_Inv = ' ���. ����� �� ������ ���� ������' ;
  Quest_No_C_name = ' Computer name must not be empty' ;
  Error_no_free_License = 'The selected software has not got free licence';

  ERROR_DUBLICATE_USER = '������ �������� ���������� � ������������.'#10'������������ � ����� ������� ������� ��� ����������!';
  ERROR_INVALID_HWTYPE = '�������� ���� ������������ �� ����� ���� ������';
  ERROR_INVALID_SWTYPE = '�������� ���� �� �� ����� ���� ������';
  ERROR_INVALID_Resource_Name = '�������� ������� �� ����� ���� ������';
  ERROR_INVALID_ResourceWTYPE ='�������� ���� ������� �� ����� ���� ������';
  ERROR_INVALID_SWName = '�������� �� �� ����� ���� ������';
 }
 QUEST_DeleteDevice = '�� ������������� ������ ������� ���������� �� ���������� %s � ������� %s?';
 QUEST_DeleteFunction = '�� ������������� ������ ������� ������� %s (������� ��������� %s)?';
 QUEST_DeleteObject = '�� ������������� ������ ������� ���������� �� ������� %s ?';
 QUEST_DeleteObjectType = '�� ������������� ������ ������� ���������� � ���� ������� %s ?';
 QUEST_DeleteEksp = '�� ������������� ������ ������� ���������� �� ���������  %s � ���� ��������� � ��� �����������?';
 QUEST_DeleteStandard =  '�� ������������� ������ ������� ���������� �� �������  %s ?';
 QUEST_DeleteProtocolType =  '�� ������������� ������ ������� ���������� � ���� ���������  %s ?';
 QUEST_DeleteProtocol = '�� ������������� ������ ������� �� ������ ��������  %s ?'; 
 QUEST_CloseProgram = '�� ������������� ������  ��������� ������ � ����������?';
 QUEST_DeleteAllEksp = '�� ������������� ������ ������� �� ������ ��� ���������� ��������� ?';
 Msg_Warning = '��������������';
 
{
  HT_NAME = '���';
  HW_NAME = '��������';
  HW_MODEL = '������';
  HW_COUNT = '����������';
  HW_BDATE = '���� ���������';
  HW_DATE = '���� ��������';
  HW_SN = 'S/N';
  HARDWARE_LIST_CAPTION = '������ �������������:';
  D_NAME = '�������������';


  OS_TYPE = '��� ��';
  SW_TYPE_NAME = '��� ';
  OS_NAME = '��. �������';
  SW_NAME = '��������';
  SW_LCOUNT = '���������� ��������';
  SW_LUSED = '������������';
  SOFTWARE_LIST_CAPTION = '������ ��:';

  SEND_SW_AMOUNT = '���������� ��������: (����.=%s)';

  C_INV = '����������� �����';
  C_U_ID = '�������������';

  U_FIO = '������������';

  UR_DATE = '���� ���������';
  FREE_COMP_USER = '[ ����������� ]';
  FREE_DEP = '[  �� ���������  ]';
}
{$ENDIF}

implementation

end.

