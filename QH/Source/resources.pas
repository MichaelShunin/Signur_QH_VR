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
{  msgErro_NoSelectedUser  = ' Не выбран пользователь' ;
  msgErrorOnDeleteSW = ' Программа установлена на компьютеры';
  msg_Cantdelete_department='Это подразделение нельзя удалить ' ;
  msg_DepartmentHaschild = 'Это подразделение имеет подчиненные структуры';
  msgNoSelectedResource = 'Нет выбранных ресурсов' ;
  msgErro_NoSelectedTask = 'нет выбранных задач' ;
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
  QUEST_ERASE_TaskFromResource ='Вы действительно хотите удалить задачу "%s"? из списка используемых с ресурсом?'  ;
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
  WARNING = 'Внимание';
  ERROR = 'Ошибка';
{  msgErro_NoSelectedUser  = ' Не выбран пользователь' ;
  msgErrorOnDeleteSW = ' Программа установлена на компьютеры';
  msg_Cantdelete_department='Это подразделение нельзя удалить ' ;
  msgNoSelectedResource = 'Нет выбранных ресурсов' ;
  msg_DepartmentHaschild = 'Это подразделение имеет подчиненные структуры';
  msgErro_NoSelectedTask = 'нет выбранных задач' ;
  GroupsOfUser_GB = 'Пользователь "%s" входит в состав групп ';
  ResourcesOfUser_GB = 'Пользователь "%s" имеет доступ к ресурсам ';
  Comp_HEADER_GB = 'Состав компьютера  "%s"';
  ERROR_INVALID_LicCount = 'Число лицензий должно быть более 0';
  QUEST_DELETE_DIV = 'Вы действительно хотите удалить "%s"? Все сотрудники этого подразделения останутся свободными.';
  QUEST_DELETE_UserGroup = 'Вы действительно хотите удалить группу "%s"? ';
  QUEST_DELETE_UserGroupmember = 'Вы действительно хотите удалить члена группы "%s"? '  ;
  QUEST_ERASE_TaskFromResource ='Вы действительно хотите удалить задачу "%s"? из списка используемых с ресурсом?'  ;
  QUEST_DELETE_ResourcesofGroup = 'Вы действительно хотите запретить доступ группы к ресурсу "%s"? ';
  QUEST_ERASE_HW = 'Вы действительно хотите списать "%s?"';
  QUEST_BREAK_HW = 'Вы действительно хотите зарегистрировать поломку "%s? S/N: %s"';
  QUEST_GET_HW = 'Вы действительно хотите отправить "%s %s S/N: %s"'#10'из "%s" на склад ОАО?';
  QUEST_GET_Comp = ' Вы действительно хотите отправить компьютер %s'#10'из "%s" на склад ОАО?';
  QUEST_ERASE_ARM = 'Вы действительно хотите разобрать компьютер инв.№ "%s" на комплектующие?';
  QUEST_ERASE_Report = 'Вы действительно хотите удалить отчет %s" ?';
  QUEST_GetOFF_HW = 'Вы действительно хотите удалить "%s" из компьютера?';
  QUEST_FREE_ARM = 'Вы действительно хотите освободить компьютер инв.№ "%s"?';
  QUEST_READ_BUG = 'Вы действительно хотите пометить сообщение как прочитанное?';
  QUEST_ERASE_USER = 'Вы действительно хотите удалить учётную запись пользователя %s?';
  QUEST_SendToUser_ARM = 'Вы хотите передать компьютер инв. номер : "%s" пользователю?';
  QUEST_Buy_HW = 'Вы подтверждаете закупку комплектующих?';
  QUEST_CancelBUY_HW ='Вы хотите отменить регистрацию';
  QUEST_CancelBUY_Comp ='Вы хотите отменить регистрацию компьютера?';
  QUEST_No_HW = ' Не заданы комплектующие';
  Quest_No_Inv = ' Инв. номер не должен быть пустым' ;
  Quest_No_C_name = ' Computer name must not be empty' ;
  Error_no_free_License = 'The selected software has not got free licence';

  ERROR_DUBLICATE_USER = 'Ошибка внесения информации о пользователе.'#10'Пользователь с такой учётной записью уже существует!';
  ERROR_INVALID_HWTYPE = 'Название типа оборудование не может быть пустым';
  ERROR_INVALID_SWTYPE = 'Название типа ПО не может быть пустым';
  ERROR_INVALID_Resource_Name = 'Название ресурса не может быть пустым';
  ERROR_INVALID_ResourceWTYPE ='Название типа ресурса не может быть пустым';
  ERROR_INVALID_SWName = 'Название ПО не может быть пустым';
 }
 QUEST_DeleteDevice = 'Вы действительно хотите удалить информацию об устройстве %s с номером %s?';
 QUEST_DeleteFunction = 'Вы действительно хотите удалить функцию %s (область обработки %s)?';
 QUEST_DeleteObject = 'Вы действительно хотите удалить информацию об объекте %s ?';
 QUEST_DeleteObjectType = 'Вы действительно хотите удалить информацию о типе объекта %s ?';
 QUEST_DeleteEksp = 'Вы действительно хотите удалить информацию об испытании  %s и всех связанных с ним результатах?';
 QUEST_DeleteStandard =  'Вы действительно хотите удалить информацию об уставке  %s ?';
 QUEST_DeleteProtocolType =  'Вы действительно хотите удалить информацию о типе протокола  %s ?';
 QUEST_DeleteProtocol = 'Вы действительно хотите удалить из архива протокол  %s ?'; 
 QUEST_CloseProgram = 'Вы действительно хотите  закончить работу с программой?';
 QUEST_DeleteAllEksp = 'Вы действительно хотите удалить из архива все показанные испытания ?';
 Msg_Warning = 'Предупреждение';
 
{
  HT_NAME = 'Тип';
  HW_NAME = 'Название';
  HW_MODEL = 'Модель';
  HW_COUNT = 'Количество';
  HW_BDATE = 'Дата получения';
  HW_DATE = 'Дата отправки';
  HW_SN = 'S/N';
  HARDWARE_LIST_CAPTION = 'Список комплектующих:';
  D_NAME = 'Подразделение';


  OS_TYPE = 'Тип ПО';
  SW_TYPE_NAME = 'Тип ';
  OS_NAME = 'Оп. система';
  SW_NAME = 'Название';
  SW_LCOUNT = 'Количество лицензий';
  SW_LUSED = 'использовано';
  SOFTWARE_LIST_CAPTION = 'Список ПО:';

  SEND_SW_AMOUNT = 'Количество лицензий: (Макс.=%s)';

  C_INV = 'Инвентарный номер';
  C_U_ID = 'Ответственный';

  U_FIO = 'Пользователь';

  UR_DATE = 'Дата сообщения';
  FREE_COMP_USER = '[ отсутствует ]';
  FREE_DEP = '[  не присвоено  ]';
}
{$ENDIF}

implementation

end.

