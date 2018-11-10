unit main_u;

interface

uses
  Windows, Messages, SysUtils, Classes,ShellAPI,
  Variants,  Graphics, Controls, Forms, MaximizedUnit,
  Dialogs, Menus, StdCtrls, Grids, DBGrids, ComCtrls, ToolWin, StdActns,
  ActnList,tvc_u, PropStorageEh, ExtCtrls, Buttons, DBCtrls, Mask, DBGridEh,
  PropFilerEh, Gauges, DB, IBCustomDataSet, IBQuery, IBSQL, IBUpdateSQL,
 // TxFrame,
  DbGridUnit, TxFrame;
  //, TxFrame;



const
WM_COPYDATA        = $004a;

  GET_ARCH            =  1;
  MSG_CONNECT         =  0;
  MSG_NOCONNECT       =  1;
  MSG_DISCONNECT      =  2;
  MSG_ARCH_EMPTY      =  3;
  MSG_DATA_DISTORTED  =  4;
  MSG_DATA_RECEIVED   =  5;
  GET_GAUGEPROGRESS   =  6;
  DRIVER_HANDLE       =  7;


type
  Tmain = class(TForm)
//  Tmain = class(TMaximizedForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ToolBar1: TToolBar;
    OpenItem: TMenuItem;
    ExitItem: TMenuItem;
    N15: TMenuItem;
    ExitButton: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    FileExit1: TFileExit;
    N7: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Action_UserGuide: TAction;
    Action_About: TAction;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    N2: TMenuItem;
    miCreateCalculation: TMenuItem;
    actCreateDevice: TAction;
    actArchiev: TAction;
    SQL1: TMenuItem;
    PanelMsg: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Label4: TLabel;
    gbObject: TGroupBox;
    DBGridEh2: TDBGridEh;
    Panel5: TPanel;
    gbResult: TGroupBox;
    Grid_QV: TDBGridEh;
    PropStorageEh1: TPropStorageEh;
    iniPS_Man: TIniPropStorageManEh;
    btnReadMKRC: TSpeedButton;
    Gauge: TGauge;
    Button1: TButton;
    q_att: TIBQuery;
    q_add_Meas: TIBQuery;
    q_add_seria_meas: TIBQuery;
    q_add_Object_meas: TIBSQL;
    q_add_MeasID: TIntegerField;
    q_meas: TIBQuery;
    Update_Meas: TIBUpdateSQL;
    Label1: TLabel;
    ds_q_meas: TDataSource;
    DBMemo2: TDBMemo;
    q_object_info: TIBQuery;
    ds_object_info: TDataSource;
    q_add_seria_measID: TIntegerField;
    Q_ADD_v_q: TIBSQL;
    q_VQ: TIBQuery;
    ds_q_VQ: TDataSource;
    Panel1: TPanel;
    pnlError: TPanel;
    Label6: TLabel;
    DBText4: TDBText;
    pnlSeria: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    DBText5: TDBText;
    Panel6: TPanel;
    Label8: TLabel;
    DBText6: TDBText;
    btnPrint: TSpeedButton;
    Panel7: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    Label5: TLabel;
    DBText3: TDBText;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Panel8: TPanel;
    Label3: TLabel;
    Label12: TLabel;
    DBText2: TDBText;
    Panel9: TPanel;
    DBEdit1: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    q_attID: TIntegerField;
    q_attOBJECT_TYPE: TSmallintField;
    q_attATT_NAME: TIBStringField;
    q_attVALUE_DIM: TIBStringField;
    q_attIS_V_Q: TSmallintField;
    q_object_infoID: TIntegerField;
    q_object_infoID_MEASUREMENT: TIntegerField;
    q_object_infoID_ATT: TIntegerField;
    q_object_infoTYPE_4_ARRAY_NUM: TSmallintField;
    q_object_infoATT_VALUE: TFloatField;
    q_object_infoATT_NAME: TIBStringField;
    q_object_infoVALUE_DIM: TIBStringField;
    q_object_infoIS_V_Q: TSmallintField;
    q_VQID: TIntegerField;
    q_VQID_MEASUREMENT: TIntegerField;
    q_VQV_VALUE: TFloatField;
    q_VQQ_VALUE: TFloatField;
    l1: TMenuItem;
    GridFrame: TDbGridFrame;
    N22: TMenuItem;
    N23: TMenuItem;
    N21: TMenuItem;
    N12: TMenuItem;
    N11: TMenuItem;
    pmReplaceParent: TMenuItem;
    N20: TMenuItem;
    pmDeleteDevice: TMenuItem;
    MenuItem1: TMenuItem;
    q_measOBJECT_TYPE_NAME: TIBStringField;
    q_measOBJECT_TYPE: TSmallintField;
    q_measID: TIntegerField;
    q_measID_MEAS: TIntegerField;
    q_measMEAS_DATE: TDateTimeField;
    q_measDEVICE_NUMBER: TIntegerField;
    q_measERROR: TIntegerField;
    q_measARCH_TYPE: TIBStringField;
    q_measTIME_AVERAGE: TIntegerField;
    q_measN_SERIA: TIntegerField;
    q_measK_Q_TO_V: TFloatField;
    q_measOBJECT_NAME: TIBStringField;
    q_measDESCR: TIBStringField;
    q_measMEAS_NUMBER: TIntegerField;
    q_measDIG_AFTER_POINT: TSmallintField;
    q_measDIM_VALUE: TSmallintField;
    N5: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure ExitItemClick(Sender: TObject);
    procedure Action_AboutExecute(Sender: TObject);
    procedure Action_UserGuideExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actCreateDeviceExecute(Sender: TObject);
    procedure actArchievExecute(Sender: TObject);
    procedure SQL1Click(Sender: TObject);
    procedure btnReadMKRCClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MessageReceiver(var Msg: TWMCopyData);   message WM_COPYDATA;
    procedure q_measAfterOpen(DataSet: TDataSet);
    procedure q_measBeforeClose(DataSet: TDataSet);
    procedure ds_q_measDataChange(Sender: TObject; Field: TField);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure Grid_QVDblClick(Sender: TObject);
    procedure PanelMsgClick(Sender: TObject);
    procedure l1Click(Sender: TObject);
    procedure GridFrameGridGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure btnPrintClick(Sender: TObject);
    procedure q_VQQ_VALUEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure q_measDEVICE_NUMBERGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
 
  private
    { Private declarations }
  public
    { Public declarations }
    CD:TCopyDataStruct;

    defaultType:integer;
    ID_Device:integer;
    procedure LoadDataFromFile(Dir_Name:string);

  end;

var
  main: Tmain;

implementation

uses about_u, dm_u,    config    , CreateNewDevice_u,
 { device_u, createNewDevice_new_u, }SQLMonitorUnit, VRDevice_u,
  createNewDevice_new_u, htmlreport_u;

{$R *.dfm}

procedure Tmain.FormShow(Sender: TObject);
begin
 if dm.resultConnection<>'' then
  begin
    showmessage( dm.resultConnection);
    halt;
  end;
{
 dm.GetName_IDStringsFromQuery(dm.q,'select name, id from device order by name',cbdevices.items, 'Name', 'ID');
 if cbdevices.items.count>0 then cbdevices.itemindex:=0;
}

 q_meas.Close;
 q_meas.open;
end;

procedure Tmain.ExitItemClick(Sender: TObject);
begin
close;
end;

procedure Tmain.Action_AboutExecute(Sender: TObject);
var AboutForm:tAbout_Form;
begin
 AboutForm:=Tabout_form.create(self);
 AboutForm.OkButton.Caption:='Продолжить работу';
 AboutForm.showmodal;
end;

procedure Tmain.Action_UserGuideExecute(Sender: TObject);

 var
 s:string;
begin
  inherited;
  s:=extractfilepath(Application.exename)+'HTML\Signur_MKRS.mht';
  ShellExecute(Application.Handle, nil, pchar(s), nil, nil, SW_SHOW);


end;

procedure Tmain.FormCreate(Sender: TObject);
begin
 iniPS_man.IniFileName:=extractfilepath(application.exename)+'vr_geom.ini';
 left:=0;
 top:=0;
// height:=Toolbar1.Height+375;
// width:=640;
 defaulttype:=0;
// TMaximizedF FontButtonVisible:=false;
DBGridEh2.Columns[0].width:=200;
DBGridEh2.Columns[1].width:=150;
end;

procedure Tmain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//canClose:= application.MessageBox( pchar(QUEST_CloseProgram),
 //                 pchar(msg_warning), MB_YESNO or MB_ICONQUESTION) = idYes;
canclose:=True;
end;

procedure Tmain.actCreateDeviceExecute(Sender: TObject);
var
 Device_ID:integer;
Label M1; 
begin

 try
 //CreateNewDevice_Form_new.Composition_DeviceTYPE:=defaulttype;
 M1: If CreateNewDevice_Form_new.showmodal = mrOK then
  begin
    (*
    dm.CreateNewDevice.ParamByName('Name').asstring:=CreateNewDevice_form_New.Device_Name;
    dm.CreateNewDevice.ParamByName('DeviceTYPE').asstring:=CreateNewDevice_form_new.Device_TYPE;
    dm.CreateNewDevice.ParamByName('Number').asstring:=CreateNewDevice_form_new.Device_Number;
    dm.CreateNewDevice.ExecProc;
    dm.CreateNewDevice.transaction.CommitRetaining;

    dm.GetName_IDStringsFromQuery(dm.q,'select name, id from device order by name',cbdevices.items, 'Name', 'ID');
    if cbdevices.items.count>0 then cbdevices.itemindex:=0;
    cbdevices.itemindex:=cbdevices.items.indexof(CreateNewDevice_form_New.Device_Name);
    *)
     end;
    except on E: Exception do
           showmessage('Ошибка при регистрации прибора в базе данных:' +E.Message);
  end;

end;


procedure Tmain.actArchievExecute(Sender: TObject);
begin
 (*if cbdevices.ItemIndex=-1 then
  begin
   showmessage('Не выбран прибор или в базе данных нет ни одного зарегистрированного устройства');
   exit;
  end
   else
 ID_Device:=Integer(cbDevices.Items.Objects[cbdevices.ItemIndex]);
 VRDeviceForm.caption:='Архив измерений для прибора '+cbdevices.Text;
 VRdeviceform.show;*)
end;

procedure Tmain.SQL1Click(Sender: TObject);
begin
TSQLMonitor.Open;
end;
(*
procedure TMain.btnReadMKPCClick(Sender: TObject);

end;{btnReadMKPCClick__________________________________________________________}
*)
procedure TMain.MessageReceiver(var Msg: TWMCopyData);
var
  oc, mess : Integer;
  fn : String;
  DriverHandle : THandle;
begin
  oc := Msg.CopyDataStruct.dwData;
  fn := PChar(Msg.CopyDataStruct.lpData);
  if (oc=DRIVER_HANDLE) then
    DriverHandle := StrToInt(fn);
  if (oc=GET_ARCH) then
    begin
      mess := StrToInt(fn);
      case  mess of
           MSG_CONNECT        : PanelMsg.Caption :=
                                'установлено соединение с МКРС';
           MSG_NOCONNECT      : PanelMsg.Caption :=
                                'соединение с МКРС не установлено';
           MSG_DISCONNECT     : PanelMsg.Caption :=
                                'соединение с МКРС разорвалось';
           MSG_ARCH_EMPTY     : PanelMsg.Caption :=
                                'нет архивных данных';
           MSG_DATA_DISTORTED : PanelMsg.Caption :=
                                'принятые данные искажены';
           MSG_DATA_RECEIVED  :
              begin
              PanelMsg.Caption :='архивы МКРС считаны';
              PanelMsg.update;
              LoadDataFromFile('');
              PanelMsg.Caption :=' ';
              PanelMsg.update;
              end;
      end;
    end;
  if (oc=GET_GAUGEPROGRESS) then
    begin
     Gauge.Progress := Msg.CopyDataStruct.cbData;
     Gauge.Visible:=True;
     Gauge.Update;
    end; 
  Repaint;
end;{MessageReceiver_  }


procedure Tmain.btnReadMKRCClick(Sender: TObject);
var
 t : String;
 result : Word;
begin
  PanelMsg.Caption:='';PanelMsg.Update;
  t := extractFilePath(Application.exename)+'mkrsdriver.exe '+IntToStr(Handle)+' '+IntToStr(GET_ARCH);
  result := WinExec(PChar(t),SW_SHOWnormal);
  Repaint;
  if result<33 then
    begin
       case result of
           0                    :    t := 'недостаточно памяти';
           ERROR_FILE_NOT_FOUND :    t := 'программа-драйвер не найдена'
           else     t := 'некорректный вызов программы-драйвера'
       end;
       Application.MessageBox(PChar(t),'Ошибка',MB_ICONERROR);
       PanelMsg.Caption := '';
    end;

end;

procedure Tmain.LoadDataFromFile(Dir_Name:string);

type
 type_4_paramRecord = record
  Rasstoyanie:single;
  Glubina:single;
  K_Sher:single
  end;

 V_Q_Record = record
 V:single;
 Q:single;
 end;

 TBCD5Byte=array[1..5] of byte;

var
 ii_S:integer;
 II_OS:Integer;
 F:TFilestream;
 id_meas:integer;

 Meas_Unit:byte;
 Dim_Value :Byte;
 Dig_After_Point: Byte;

{$A-}
 AOM_Shapka : record
  offset:word;
  pointer_To_Data:array[1..1000] of word;
 end;

 ptrToData:word;

 Seria_Type_Info : record
  ObjType:byte;
  DT: TBCD5Byte;
  Device_Number:word;
  T_Usr:byte;
  N_Point_In_Seria:byte;
  NPoint_In_type4_ParamArray:byte;
 end;

 Seria_Add_Info : record                   //    результат в АОИ для типа 4 число строк в массиве параметров
  K_Q_To_V:single;
  end;

 Seria_array : array[1..256] of single;
 //seria_1_4_array: array of V_Q_Record;

 Type_Info : record          // общая часть результата в АОИ для всех типов
  ObjType:byte;
  DT:TBCD5Byte;
  Device_Number:word;
  Error:byte;
  NPoint:byte ;  // всегда 1   для типа 4  - число элементов в массиве описания лотка
 end;

 Type_0_Result : record        //    результат в АОИ для типа 0
   V:single
  end;

 Type_3_Result_Source : record        //    результат в АОИ для типа 1
  Shirina_m:single;
  Uroven_Zap_m:single;
  K_Sher:byte;
  V:single;
  Q:single
  end;

  Seria_Type_3_Result_Source : record        //    результат в АСИ для типа 1
  Shirina_m:single;
  Uroven_Zap_m:single;
  K_Sher:byte;
  end;

  i_RS:integer;
  Type_3_Result : record        //    результат в АОИ для типа 1
  RS:array[1..5] of single
  {Shirina_m:single;
  Uroven_Zap_m:single;
  K_Sher:single;
  V:single;
  Q:single }
  end;


  Type_2_Result : record        //    результат в АОИ для типа 2
  RS:array[1..4] of single

  {Diametr_m:single;
  Uroven_Zap_m:single;
  V:single;
  Q:single}
  end;

   Seria_Type_2_Result : record        //    результат в АСИ для типа 2
  RS:array[1..2] of single
      end;

  Type_1_Result : record            //    результат в АОИ для типа 1
  RS:array[1..4] of single

  {
  Diametr_m:single;
  Uroven_Zap_m:single;
  V:single;
  Q:single }
  end;

  Seria_Type_1_Result : record            //    результат в АCИ для типа 1
  RS:array[1..2] of single ;
  end;


 Type_4_Info : record                   //    результат в АОИ для типа 4 число строк в массиве параметров
  N_Point:byte;
  end;




 Type_4_Result : array of Type_4_ParamRecord;
 j_4_point:integer;
 Type_4_4 : record                                //    результат в АОИ для типа 4 при числе строк апароаметров = 4
  param_array : array[1..4,1..3] of single;
  V:single;
  Q:single;
  end;

Type_4_5 : record                              //    результат в АОИ для типа 4 при числе строк апароаметров = 5
  param_array : array[1..5,1..3] of single;
  V:single;
  Q:single;
  end;
Type_4_6 : record
  param_array : array[1..6,1..3] of single;        //    результат в АОИ для типа 4 при числе строк апароаметров = 6
  V:single;
  Q:single;
  end;

Type_4_7 : record                                //    результат в АОИ для типа 4 при числе строк апароаметров = 7
  param_array : array[1..7,1..3] of single;
  V:single;
  Q:single;
  end;

Type_4_8 : record                               //    результат в АОИ для типа 4 при числе строк апароаметров = 8
  param_array : array[1..8,1..3] of single;
  V:single;
  Q:single;
  end;

Type_4_9 : record                               //    результат в АОИ для типа 4 при числе строк апароаметров = 9
  param_array : array[1..9,1..3] of single;
  V:single;
  Q:single;
  end;

 Seria_Type_4_4 : record                                //    результат в АCИ для типа 4 при числе строк апароаметров = 4
  param_array : array[1..4,1..3] of single;
  end;

 Seria_Type_4_5 : record                              //    результат в АCИ для типа 4 при числе строк апароаметров = 5
  param_array : array[1..5,1..3] of single;
  end;
 Seria_type_4_6 : record
  param_array : array[1..6,1..3] of single;        //    результат в АCИ для типа 4 при числе строк апароаметров = 6
  end;

 Seria_Type_4_7 : record                                //    результат в АCИ для типа 4 при числе строк апароаметров = 7
  param_array : array[1..7,1..3] of single;
  end;

 Seria_Type_4_8 : record                               //    результат в АCИ для типа 4 при числе строк апароаметров = 8
  param_array : array[1..8,1..3] of single;
  end;

 Seria_Type_4_9 : record                               //    результат в АCИ для типа 4 при числе строк апароаметров = 9
  param_array : array[1..9,1..3] of single;
  end;


 ASM_Shapka : record
  offset:word;
  pointer_To_Data:array[1..500] of word;
   end;

{$A+}


 Function BCD5Byte_to_Datetime(DT:TBCD5Byte):Tdatetime;
 var
   ed: byte;
   Des:byte;
   Minute,Hour,day,Month,Year:word;
 begin
  if ((DT[1]=$FF) and (DT[2]=$FF)
                  and (DT[3]=$FF)  and (DT[4]=$FF) and (DT[5]=$FF)) then  result :=0
   else
   begin
    ed:=DT[1] and $0F;
    DES:=((DT[1] and $F0) shr 4);
    Minute:=des*10+ed;

    ed:=DT[2] and $0F;
    DES:=((DT[2] and $F0) shr 4);
    Hour:=des*10+ed;
                    //                              {} if Hour >24 then Hour :=13 ;
    ed:=DT[3] and $0F;
    DES:=((DT[3] and $F0) shr 4);
    day:=des*10+ed;

    ed:=DT[4] and $0F;
    DES:=((DT[4] and $F0) shr 4);
    Month:=des*10+ed;

   ed:=DT[5] and $0F;
    DES:=((DT[5] and $F0) shr 4);
    Year:=2000+des*10+ed;

   try
    if ((Month in [1,2,3,4,5,6,7,8,9,10,11,12]) and
       (day in    [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]) and
       (Hour in   [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]) and
       (Minute in [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59])
       )  then
         result:=encodedate(Year,month,day)+encodetime(hour,minute,0,0)
        else result:=0;
    except
   end;
  end;
 end;

begin
 if dir_name<>'' then  f:=TFilestream.create(extractFilePath(application.exename)+'Files\'+Dir_name+'\os_tmp.mkrs',fmOpenRead)
   else  f:=TFilestream.create(extractFilePath(application.exename)+'\os_tmp.mkrs',fmOpenRead);
   if (f.Size>0) then
  begin  // работа с АОИ
   f.Read(Aom_shapka, sizeof(aom_shapka));
   // showmessage('читаю АОИ');
    ii_OS:=0;
   //for ii_OS:=1 to 1000 do
    while (II_OS<1000) do
    begin
     ii_OS:=ii_OS+1;

     if Aom_shapka.pointer_to_data[ii_OS]<>65535 then  // есть указатель на рнезультат в архиве
      begin
       // читаю порцию данных
       ptrToData:=Aom_shapka.pointer_to_data[ii_OS];
       f.Position:=word(aom_shapka.offset+ptrToData);
       f.Read(Type_Info,sizeof(Type_Info));
       f.Position:=word(aom_shapka.offset+ptrToData)+sizeof(Type_Info);
       
       Meas_Unit:=type_info.objtype and $F0;
       Dim_Value:=meas_unit shr 7;
       Dig_after_Point :=(meas_Unit shr 4) and $7;
       Type_info.objtype:=type_info.objtype and $0F;

       if Type_Info.Device_Number=0 then Type_Info.ObjType:=8;

       case Type_info.objtype of
        0,8: f.Read(Type_0_result,sizeOf(Type_0_Result));
        3: begin
            f.Read(Type_3_result_source,sizeOf(Type_3_Result_Source));
            Type_3_result.rs[1]:=Type_3_Result_Source.Shirina_m;
            Type_3_result.rs[2]:=Type_3_Result_Source.Uroven_Zap_m;
            case   Type_3_Result_Source.K_Sher of
             0:Type_3_result.rs[3]:=0.01;
             1:Type_3_result.rs[3]:=0.014;
             2:Type_3_result.rs[3]:=0.02;
            end;
            Type_3_result.rs[4]:=Type_3_Result_Source.V;
            Type_3_result.rs[5]:=Type_3_Result_Source.Q;
           end;
        2: f.Read(Type_2_result,sizeOf(Type_2_Result));
        1: f.Read(Type_1_result,sizeOf(Type_1_Result));
        4: begin
            f.Read(Type_4_info,sizeOf(Type_4_info));
            case Type_4_info.N_Point of
              4:f.Read(Type_4_4,sizeOf(Type_4_4));
              5:f.Read(Type_4_5,sizeOf(Type_4_5));
              6:f.Read(Type_4_6,sizeOf(Type_4_6));
              7:f.Read(Type_4_7,sizeOf(Type_4_7));
              8:f.Read(Type_4_8,sizeOf(Type_4_8));
              9:f.Read(Type_4_9,sizeOf(Type_4_9));
           end;
           end;
      end;
       // данные прочитаны. их надо положить в базу


      q_add_meas.Close;
      q_add_meas.ParamByName('ARCH_TYPE').asstring:='ОИ';
      q_add_meas.ParamByName('DEVICE_NUMBER').asinteger:=Type_Info.Device_Number;
      q_add_meas.ParamByName('OBJECT_TYPE').asinteger:=Type_Info.OBJTYPE;
      q_add_meas.ParamByName('Meas_date').asdatetime:=BCD5Byte_to_Datetime(Type_Info.dt);
      q_add_meas.ParamByName('Error').asinteger:=Type_Info.Error;
      q_add_meas.ParamByName('Meas_Number').asinteger:=II_OS;
      q_add_meas.parambyname('Dim_Value').value:=Dim_Value;
      q_add_meas.parambyname('Dig_After_Point').value:=Dig_After_Point;
      q_add_meas.open;

      ID_Meas:=q_add_meas.fieldbyname('ID').asinteger;
      q_add_meas.transaction.commitretaining;

      if id_meas>0 then
      begin

      q_att.close;
      q_att.ParamByName('Object_Type').asinteger:=Type_info.objtype;
      q_att.Open;
        i_RS:=1;
       while not   q_att.Eof do
       begin
        case Type_info.objtype of
         0,8: begin
            q_add_object_meas.parambyname('ID_att').asinteger:=q_att.fieldbyname('ID').asinteger;
            q_add_object_meas.parambyname('ID_measurement').asinteger:=id_meas;
            q_add_object_meas.parambyname('type_4_Array_Num').clear;
            q_add_object_meas.parambyname('att_value').value:=type_0_result.V;
            q_add_object_meas.ExecQuery;
            end;
         1:
          begin
            q_add_object_meas.parambyname('ID_att').asinteger:=q_att.fieldbyname('ID').asinteger;
            q_add_object_meas.parambyname('ID_measurement').asinteger:=id_meas;
            q_add_object_meas.parambyname('type_4_Array_Num').clear;
            q_add_object_meas.parambyname('att_value').value:=type_1_result.rs[i_RS];
            q_add_object_meas.ExecQuery;
          end;
         2:
          begin
            q_add_object_meas.parambyname('ID_att').asinteger:=q_att.fieldbyname('ID').asinteger;
            q_add_object_meas.parambyname('ID_measurement').asinteger:=id_meas;
            q_add_object_meas.parambyname('type_4_Array_Num').clear;
            q_add_object_meas.parambyname('att_value').value:=type_2_result.rs[i_RS];
            q_add_object_meas.ExecQuery;
          end;
         3:
          begin
            q_add_object_meas.parambyname('ID_att').asinteger:=q_att.fieldbyname('ID').asinteger;
            q_add_object_meas.parambyname('ID_measurement').asinteger:=id_meas;
            q_add_object_meas.parambyname('type_4_Array_Num').clear;
            q_add_object_meas.parambyname('att_value').value:=type_3_result.rs[i_RS];
            q_add_object_meas.ExecQuery;
          end;
         4:
          begin
            q_add_object_meas.parambyname('ID_att').asinteger:=q_att.fieldbyname('ID').asinteger;
            q_add_object_meas.parambyname('ID_measurement').asinteger:=id_meas;

            if i_rs in [1,2,3] then
             begin
             for j_4_point := 1 to Type_4_info.N_Point  do
                  begin
                   q_add_object_meas.parambyname('type_4_Array_Num').value:=j_4_point;
                    case Type_4_info.N_Point of
                      4:q_add_object_meas.parambyname('att_value').value:=type_4_4.param_array[j_4_point,i_RS];
                      5:q_add_object_meas.parambyname('att_value').value:=type_4_5.param_array[j_4_point,i_RS];
                      6:q_add_object_meas.parambyname('att_value').value:=type_4_6.param_array[j_4_point,i_RS];
                      7:q_add_object_meas.parambyname('att_value').value:=type_4_7.param_array[j_4_point,i_RS];
                      8:q_add_object_meas.parambyname('att_value').value:=type_4_8.param_array[j_4_point,i_RS];
                      9:q_add_object_meas.parambyname('att_value').value:=type_4_9.param_array[j_4_point,i_RS];
                    end ;

                   q_add_object_meas.ExecQuery;
                   end
              end;
             if i_RS =4 then
               begin
                   q_add_object_meas.parambyname('type_4_Array_Num').clear;
                   case Type_4_info.N_Point of
                      4:q_add_object_meas.parambyname('att_value').value:=type_4_4.V;
                      5:q_add_object_meas.parambyname('att_value').value:=type_4_5.V;
                      6:q_add_object_meas.parambyname('att_value').value:=type_4_6.V;
                      7:q_add_object_meas.parambyname('att_value').value:=type_4_7.V;
                      8:q_add_object_meas.parambyname('att_value').value:=type_4_8.V;
                      9:q_add_object_meas.parambyname('att_value').value:=type_4_9.V;
                    end ;
                   q_add_object_meas.ExecQuery;
               end;
             if i_RS =5 then
               begin
                   q_add_object_meas.parambyname('type_4_Array_Num').clear;
                   case Type_4_info.N_Point of
                      4:q_add_object_meas.parambyname('att_value').value:=type_4_4.Q;
                      5:q_add_object_meas.parambyname('att_value').value:=type_4_5.Q;
                      6:q_add_object_meas.parambyname('att_value').value:=type_4_6.Q;
                      7:q_add_object_meas.parambyname('att_value').value:=type_4_7.Q;
                      8:q_add_object_meas.parambyname('att_value').value:=type_4_8.Q;
                      9:q_add_object_meas.parambyname('att_value').value:=type_4_9.Q;
                    end ;
                   q_add_object_meas.ExecQuery;
                end;
          end;
         end ;  // case Type_info.objtype of
        i_RS:=I_RS+1;
        q_att.Next;
      end ;
      q_add_object_meas.transaction.commitretaining;

      // ТУТ НАДО ЗАПИСАТЬ ОТСЧЕТЫ СКОРОСТИ И РАСХОДА ДЛЯ id_mEAS
       Q_ADD_v_q.ParamByName('ID_MEASUREMENT').value:=id_meas;
       case Type_info.objtype of
         0: begin
             Q_ADD_v_q.ParamByName('V_Value').value:=type_0_result.V;
             Q_ADD_v_q.ParamByName('Q_Value').clear;
            end;
         1: begin
             Q_ADD_v_q.ParamByName('V_Value').value:=type_1_result.RS[3];
             Q_ADD_v_q.ParamByName('Q_Value').value:=type_1_result.RS[4];
            end;
         2: begin
             Q_ADD_v_q.ParamByName('V_Value').value:=type_2_result.RS[3];
             Q_ADD_v_q.ParamByName('Q_Value').value:=type_2_result.RS[4];
            end;
         3: begin
             Q_ADD_v_q.ParamByName('V_Value').value:=type_3_result.RS[4];
             Q_ADD_v_q.ParamByName('Q_Value').value:=type_3_result.RS[5];
            end;
         4: begin
              case Type_4_info.N_Point of
                      4:Q_ADD_v_q.ParamByName('V_Value').value:=type_4_4.V;
                      5:Q_ADD_v_q.ParamByName('V_Value').value:=type_4_5.V;
                      6:Q_ADD_v_q.ParamByName('V_Value').value:=type_4_6.V;
                      7:Q_ADD_v_q.ParamByName('V_Value').value:=type_4_7.V;
                      8:Q_ADD_v_q.ParamByName('V_Value').value:=type_4_8.V;
                      9:Q_ADD_v_q.ParamByName('V_Value').value:=type_4_9.V;
               end ;
              case type_4_info.N_Point of
                      4:Q_ADD_v_q.ParamByName('Q_Value').value:=type_4_4.Q;
                      5:Q_ADD_v_q.ParamByName('Q_Value').value:=type_4_5.Q;
                      6:Q_ADD_v_q.ParamByName('Q_Value').value:=type_4_6.V;
                      7:Q_ADD_v_q.ParamByName('Q_Value').value:=type_4_7.Q;
                      8:Q_ADD_v_q.ParamByName('Q_Value').value:=type_4_8.Q;
                      9:Q_ADD_v_q.ParamByName('Q_Value').value:=type_4_9.Q;
               end ;
            end;
        end;
        q_add_V_Q.ExecQuery;
        q_add_v_q.Transaction.CommitRetaining;
     end;
    end;
   end;
  end;
 f.Destroy;

 if dir_name='' then  f:=TFilestream.create(extractFilePath(application.exename)+'\s_tmp.mkrs',fmOpenRead)
    else f:=TFilestream.create(extractFilePath(application.exename)+'Files\'+Dir_name+'\s_tmp.mkrs',fmOpenRead);
 if (f.Size>0) then
  begin  // работа с АОИ
    f.Read(Asm_shapka, sizeof(asm_shapka));

    ii_s := 0;
            while (ii_s<499) do
            begin
            ii_S:=II_S+1;
             if Asm_shapka.pointer_to_data[ii_S]<>65535 then  // есть указатель на рнезультат в архиве
              begin
               // читаю порцию данных
               ptrToData:=Asm_shapka.pointer_to_data[ii_S];
               f.Position:=word(asm_shapka.offset+ptrToData);
               f.Read(Seria_Type_Info,sizeof(Seria_Type_Info));

               Meas_Unit:=Seria_type_info.objtype and $F0;
               Dim_Value:=meas_unit shr 7;
               Dig_after_Point :=(meas_Unit shr 4) and $7;
               Seria_type_info.objtype:=Seria_type_info.objtype and $0F;


              if Seria_Type_Info.device_Number=0 then seria_Type_Info.ObjType:=8;

               if Seria_Type_info.objtype<>4 then f.position:=f.position-1;

               case Seria_Type_info.objtype of
  //              0: f.Read(Type_0_result,sizeOf(Type_0_Result));
    //            0: f.Read(Type_0_result,sizeOf(Type_0_Result));
                3: begin
                    f.Read(seria_Type_3_result_source,sizeOf(Seria_Type_3_Result_Source));
                    Type_3_result.rs[1]:=seria_Type_3_Result_Source.Shirina_m;
                    Type_3_result.rs[2]:=seria_Type_3_Result_Source.Uroven_Zap_m;
                    case   seria_Type_3_Result_Source.K_Sher of
                     0:Type_3_result.rs[3]:=0.01;
                     1:Type_3_result.rs[3]:=0.014;
                     2:Type_3_result.rs[3]:=0.02;
                    end;
                    {Type_3_result.rs[4]:=Type_3_Result_Source.V;
                    Type_3_result.rs[5]:=Type_3_Result_Source.Q;}
                   end;
+                2: f.Read(Seria_Type_2_result,sizeOf(Seria_Type_2_Result));
                1: f.Read(Seria_Type_1_result,sizeOf(Seria_Type_1_Result));
                4: begin
                  //   f.Read(Type_4_info,sizeOf(Type_4_info));
                    case Seria_Type_info.NPoint_In_type4_ParamArray of
                      4:f.Read(Seria_Type_4_4,sizeOf(Seria_Type_4_4));
                      5:f.Read(Seria_Type_4_5,sizeOf(Seria_Type_4_5));
                      6:f.Read(Seria_Type_4_6,sizeOf(Seria_Type_4_6));
                      7:f.Read(Seria_Type_4_7,sizeOf(Seria_Type_4_7));
                      8:f.Read(Seria_Type_4_8,sizeOf(Seria_Type_4_8));
                      9:f.Read(Seria_Type_4_9,sizeOf(Seria_Type_4_9));
                   end;
                   end;
              end;
               f.Read(Seria_add_Info,sizeOf(Seria_add_info));


               f.Read(Seria_array,sizeOf(Single)*Seria_type_info.N_Point_In_Seria);

               // данные прочитаны. их надо положить в базу


              q_add_seria_meas.Close;
              q_add_seria_meas.ParamByName('ARCH_TYPE').asstring:='СИ';
              q_add_seria_meas.ParamByName('DEVICE_NUMBER').asinteger:=Seria_Type_Info.Device_Number;
              q_add_seria_meas.ParamByName('OBJECT_TYPE').asinteger:=Seria_Type_Info.OBJTYPE;
              q_add_seria_meas.ParamByName('Meas_date').asdatetime:=BCD5Byte_to_Datetime(Seria_Type_Info.dt);
              q_add_seria_meas.ParamByName('time_average').asinteger:=Seria_Type_Info.T_Usr;
              q_add_seria_meas.ParamByName('N_Seria').asinteger:=Seria_Type_Info.N_Point_In_Seria;
              q_add_seria_meas.ParamByName('Meas_Number').asinteger:=II_S;
              q_add_seria_meas.ParamByName('K_Q_TO_V').asfloat:=Seria_add_Info.K_Q_TO_V;
              q_add_Seria_meas.parambyname('Dim_Value').value:=Dim_Value;
              q_add_Seria_meas.parambyname('Dig_After_Point').value:=Dig_After_Point;

              q_add_seria_meas.open;

              ID_Meas:=q_add_seria_meas.fieldbyname('ID').asinteger;
              q_add_seria_meas.transaction.commitretaining;

              if id_meas>0 then
              begin

              q_att.close;
              q_att.ParamByName('Object_Type').asinteger:=seria_Type_info.objtype;
              q_att.Open;
                i_RS:=1;
               while not   q_att.Eof do
               begin
                if q_att.FieldByName('IS_V_Q').isnull then
                begin
                case SERIA_Type_info.objtype of
                 0: begin
                    q_add_object_meas.parambyname('ID_att').asinteger:=q_att.fieldbyname('ID').asinteger;
                    q_add_object_meas.parambyname('ID_measurement').asinteger:=id_meas;
                    q_add_object_meas.parambyname('type_4_Array_Num').clear;
                    q_add_object_meas.parambyname('att_value').value:=type_0_result.V;
                    q_add_object_meas.ExecQuery;
                    end;
                 1:
                  begin
                    q_add_object_meas.parambyname('ID_att').asinteger:=q_att.fieldbyname('ID').asinteger;
                    q_add_object_meas.parambyname('ID_measurement').asinteger:=id_meas;
                    q_add_object_meas.parambyname('type_4_Array_Num').clear;
                    q_add_object_meas.parambyname('att_value').value:=seria_type_1_result.rs[i_RS];
                    q_add_object_meas.ExecQuery;
                  end;
                 2:
                  begin
                    q_add_object_meas.parambyname('ID_att').asinteger:=q_att.fieldbyname('ID').asinteger;
                    q_add_object_meas.parambyname('ID_measurement').asinteger:=id_meas;
                    q_add_object_meas.parambyname('type_4_Array_Num').clear;
                    q_add_object_meas.parambyname('att_value').value:=seria_type_2_result.rs[i_RS];
                    q_add_object_meas.ExecQuery;
                  end;
                 3:
                  begin
                    q_add_object_meas.parambyname('ID_att').asinteger:=q_att.fieldbyname('ID').asinteger;
                    q_add_object_meas.parambyname('ID_measurement').asinteger:=id_meas;
                    q_add_object_meas.parambyname('type_4_Array_Num').clear;
                    q_add_object_meas.parambyname('att_value').value:=type_3_result.rs[i_RS];
                    q_add_object_meas.ExecQuery;
                  end;
                 4:
                  begin
                    q_add_object_meas.parambyname('ID_att').asinteger:=q_att.fieldbyname('ID').asinteger;
                    q_add_object_meas.parambyname('ID_measurement').asinteger:=id_meas;
                    if i_rs in [1,2,3] then
                     begin
                     for j_4_point := 1 to SERIA_type_info.NPoint_In_type4_ParamArray  do
                          begin
                           q_add_object_meas.parambyname('type_4_Array_Num').value:=j_4_point;
                            case SERIA_type_info.NPoint_In_type4_ParamArray of
                              4:q_add_object_meas.parambyname('att_value').value:=seria_type_4_4.param_array[j_4_point,i_RS];
                              5:q_add_object_meas.parambyname('att_value').value:=Seria_type_4_5.param_array[j_4_point,i_RS];
                              6:q_add_object_meas.parambyname('att_value').value:=Seria_type_4_6.param_array[j_4_point,i_RS];
                              7:q_add_object_meas.parambyname('att_value').value:=Seria_type_4_7.param_array[j_4_point,i_RS];
                              8:q_add_object_meas.parambyname('att_value').value:=Seria_type_4_8.param_array[j_4_point,i_RS];
                              9:q_add_object_meas.parambyname('att_value').value:=Seria_type_4_9.param_array[j_4_point,i_RS];
                            end ;
                           q_add_object_meas.ExecQuery;
                           end
                      end;

                  end;
                 end ;  // case Type_info.objtype of
                i_RS:=I_RS+1;
                end ;
                q_att.Next;
              end ;
              q_add_object_meas.transaction.commitretaining;

                 Q_ADD_v_q.ParamByName('ID_MEASUREMENT').value:=id_meas;

               for  i_RS:=1 to Seria_type_info.N_Point_In_Seria do
                begin
                   case seria_Type_info.objtype of
                     0: begin
                         Q_ADD_v_q.ParamByName('V_Value').value:=seria_array[i_RS];
                         Q_ADD_v_q.ParamByName('Q_Value').clear;
                        end;
                     1,2,3,4:
                        begin
                         Q_ADD_v_q.ParamByName('V_Value').value:=seria_array[i_RS]*seria_add_info.K_Q_To_V;
                         Q_ADD_v_q.ParamByName('Q_Value').value:=seria_array[i_RS];
                        end;
                    end;
                    q_add_V_Q.ExecQuery;
                 end;
                 q_add_v_q.Transaction.CommitRetaining;



             end;

            end
           end;



  end;
 f.Destroy;

 q_meas.close;
 q_meas.open;
 gauge.Visible:=false;
end;


procedure Tmain.Button1Click(Sender: TObject);
begin
  inherited;
  LoadDataFromFile('MKPC_09_11_15');
end;

procedure Tmain.q_measAfterOpen(DataSet: TDataSet);
begin
  inherited;
 q_meas.last;
 q_meas.first;
 q_object_info.Open;
 q_VQ.open;
end;

procedure Tmain.q_measBeforeClose(DataSet: TDataSet);
begin
  inherited;
 q_object_info.Close;
 q_VQ.close;
end;

procedure Tmain.ds_q_measDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (q_meas.FieldByName('Arch_type').asstring = 'ОИ') then
   begin
   pnlError.Visible:=true;
   pnlSeria.Visible:=false;         
   end;
  if (q_meas.FieldByName('Arch_type').asstring = 'СИ') then
   begin
    pnlError.Visible:=false;
    pnlSeria.Visible:=true;

   end;
   Grid_QV.columns[1].Visible:=(q_meas.FieldByName('object_type').asinteger<>0) ;
   case q_meas.FieldByName('Dim_Value').asinteger of
    0: Grid_QV.columns[1].Title.Caption:='куб.м/c';
    1: Grid_QV.columns[1].Title.Caption:='куб.м/час' ;
   end;
  
 if q_meas.FieldByName('Object_Type').AsInteger=8 then
    begin
     Grid_qV.columns[0].Title.Caption:='частота импульсов, N в сек';
     GRID_QV.columns[1].Visible:=false ;
     end
    else Grid_QV.columns[0].Title.Caption:='скорость, м/c';

 if q_meas.FieldByName('Object_Type').AsInteger=0 then
    begin
     GRID_QV.columns[1].Visible:= false;
     end;
   Panel1.Update;


   //   DBText3.Color:=clBtnFace;
      DBText3.Font.color:=clblack;
      DBText3.Alignment:=taLeftJustify;
if q_meas.FieldByName('Device_Number').AsInteger=1 then
    begin
     // DBText3.Color:=clBlack;
   //   DBText3.Alignment:=taCenter  ;
      DBText3.Font.color:=clblack;
    end;
if q_meas.FieldByName('Device_Number').AsInteger=2 then
    begin
     // DBText3.Color:=clRed;
      DBText3.Font.color:=clRed;
   //   DBText3.Alignment:=taCenter
    end;
end;

procedure Tmain.DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  inherited;
 { if pos('Скорость',q_object_info.fieldbyname('att_name').asstring)>0 then background:=clyellow;
   if pos('Расход',q_object_info.fieldbyname('att_name').asstring)>0 then background:=clAqua;
}end;

procedure Tmain.DBGridEh2DblClick(Sender: TObject);
begin
//  inherited;

end;

procedure Tmain.Grid_QVDblClick(Sender: TObject);
begin
//  inherited;

end;

procedure Tmain.PanelMsgClick(Sender: TObject);
begin
  inherited;
 panelmsg.Caption:='';
end;

procedure Tmain.l1Click(Sender: TObject);
begin
  inherited;
//TMaximizedF FontButtonClick;
end;

procedure Tmain.GridFrameGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (q_meas.FieldByName('Arch_type').asstring = 'СИ') then background :=clcream;
end;

procedure Tmain.btnPrintClick(Sender: TObject);
var
s:string;
HTML:Tstringlist;
HTMLReport:THTMLReport;
begin
//HTMLReport:=THtmlReport.Create(self);
 Application.CreateForm(THTMLReport, HTMLReport);
HTMLReport.q_VQ.close;
HTMLReport.q_VQ.parambyname('id_meas').asinteger:=q_meas.fieldbyname('id_meas').asinteger;
HTMLReport.q_VQ.open;

 if (q_meas.FieldByName('Arch_type').asstring = 'ОИ') then
   begin
    htmlreport.Table1.Visible:=true;
    htmlreport.Table2.Visible:=false;
   end;
  if (q_meas.FieldByName('Arch_type').asstring = 'СИ') then
   begin
    htmlreport.Table1.Visible:=false;
    htmlreport.Table2.Visible:=true;
   end;

  HTMLReport.grid_object.DataSource:=ds_object_info;
 // Grid_QV.columns[1].Visible:=(q_meas.FieldByName('object_type').asinteger<>0) ;

HtmlReport.dt.caption:=q_meas.fieldbynaME('MEAS_DATE').TEXT;
HtmlReport.device_number.caption:=q_meas.fieldbynaME('device_number').TEXT;
HtmlReport.object_type_name.caption:=q_meas.fieldbynaME('object_type_name').TEXT;
HtmlReport.object_name.caption:=q_meas.fieldbynaME('object_name').TEXT;
HtmlReport.descr.text:=q_meas.fieldbynaME('descr').TEXT;
HtmlReport.error.caption:=q_meas.fieldbynaME('error').TEXT;
HtmlReport.N_seria.caption:=q_meas.fieldbynaME('n_seria').TEXT;
HtmlReport.Time_average.caption:=q_meas.fieldbynaME('time_average').TEXT;
HtmlReport.grid_object.Visible:=q_meas.FieldByName('object_type').asinteger <> 0;
HTMLReport.GRID_MEAS.columns[1].Visible:=(q_meas.FieldByName('object_type').asinteger<>0) ;
 case q_meas.FieldByName('Dim_Value').asinteger of
    0: HTMLReport.GRID_MEAS.columns[1].Title.Caption:='куб.м/c';
    1: HTMLReport.GRID_MEAS.columns[1].Title.Caption:='куб.м/час' ;
   end;

 if q_meas.FieldByName('Object_Type').AsInteger=8 then
    begin
     HTMLReport.GRID_MEAS.columns[0].Title.Caption:='частота импульсов, N в сек';
     HTMLReport.GRID_MEAS.columns[1].Visible:=false ;
    end
    else HTMLReport.GRID_MEAS.columns[0].Title.Caption:='скорость, м/c';

 if q_meas.FieldByName('Object_Type').AsInteger=0 then
    begin
    HTMLReport.GRID_MEAS.columns[1].Visible:=false ;
     end;


 if not HTMLReport.GRID_MEAS.columns[1].Visible then
  begin
  HTMLReport.GRID_MEAS.columns[1].Title.Caption:='';
  HTMLReport.GRID_MEAS.columns[1].Width:=1;
  end    ;
//HtmlReport.grid_meas.datasource:=ds_q_v_q;
HTML:=TStringList.create;
html.text:=htmlReport.HtmlPage.HTMLPageScript(0);
html.savetofile(extractfilepath(application.exename)+'vr_report.htm');
html.free;
ShellExecute(Application.Handle, nil, pchar(extractfilepath(application.exename)+'vr_report.htm'), nil, nil, SW_SHOW);
//HtmlReport.show;
HTMLReport.free;
end;



procedure Tmain.q_VQQ_VALUEGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
 if q_VQQ_VALUE.IsNull then text:=''
 else
  begin
   text:=formatfloat('0.000',q_vqq_Value.asfloat);
   if (not q_meas.FieldByName('Dig_after_Point').IsNull) then
     case q_meas.FieldByName('dig_after_point').AsInteger of
      0:text:=formatfloat('0',q_vqq_Value.asfloat);
      1:text:=formatfloat('0.0',q_vqq_Value.asfloat);
      2:text:=formatfloat('0.00',q_vqq_Value.asfloat);
      3:text:=formatfloat('0.000',q_vqq_Value.asfloat);
      4:text:=formatfloat('0.0000',q_vqq_Value.asfloat);
      else text:=formatfloat('0.00000',q_vqq_Value.asfloat);
      end
  end
end;

procedure Tmain.q_measDEVICE_NUMBERGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 try
 text:=IntToStr(q_meas.FieldByName('Device_number').AsInteger);
 except
   end;
 if  q_meas.FieldByName('Device_number').AsInteger = 1 then text:='Черный';
 if  q_meas.FieldByName('Device_number').AsInteger = 2 then text:='Красный';


end;

end.

