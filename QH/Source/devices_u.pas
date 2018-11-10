unit devices_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  Menus, ComCtrls, ExtCtrls,  StdCtrls, DB,
  Buttons, TxFrame, DbGridUnit, IBCustomDataSet, IBQuery, IBUpdateSQL,
  DBCtrls, Mask, Grids, DBGrids,DBGridEh, IBSQL, rxStrUtils, utils, ImgList;

type
  TDevices_Form = class(TForm)
    CalcsPanel: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    pcInputValues: TPageControl;
    TabSheet1: TTabSheet;
    DbGridFrame1: TDbGridFrame;
    DbGridFrame2: TDbGridFrame;
    ds_devices: TDataSource;
    q_devices: TIBQuery;
    N1: TMenuItem;
    miDeleteCalculation: TMenuItem;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    edName: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    edDescr: TDBMemo;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    miClose: TMenuItem;
    N2: TMenuItem;
    miCreateNew: TMenuItem;
    miSaveEdit: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    updateDevice: TIBUpdateSQL;
    q_table2: TIBQuery;
    ds_table2: TDataSource;
    updateTable2: TIBUpdateSQL;
    TabSheet4: TTabSheet;
    FrameTable6: TDbGridFrame;
    FrameTable4: TDbGridFrame;
    DbGridFrame5: TDbGridFrame;
    DbGridFrame6: TDbGridFrame;
    FrameRPPP: TDbGridFrame;
    DbGridFrame3: TDbGridFrame;
    N5: TMenuItem;
    Panel2: TPanel;
    btnSaveInputData: TBitBtn;
    btnProcessing: TBitBtn;
    btnSaveOutput: TBitBtn;
    ImageList1: TImageList;
    q_devicesID: TIntegerField;
    q_devicesNAME: TIBStringField;
    q_devicesDEVICENUMBER: TIBStringField;
    q_devicesTYPEDEVICE_ID: TIntegerField;
    q_devicesCREATE_DATE: TDateField;
    q_devicesSALE_DATE: TDateField;
    q_devicesCUSTOMER: TIBStringField;
    q_devicesDESCR: TIBStringField;
    q_devicesID_CONVERTER: TIntegerField;
    q_devicesLOCKED: TSmallintField;
    q_devicesDEVICETYPENAME: TIBStringField;
    q_devicesCONVERTERNAME: TIBStringField;
    procedure DbGridFrame1btnSearchCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miDeleteCalculationClick(Sender: TObject);
    procedure q_devicesAfterDelete(DataSet: TDataSet);
    procedure q_devicesAfterPost(DataSet: TDataSet);
    procedure miSaveEditClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure q_devicesAfterOpen(DataSet: TDataSet);
    procedure q_devicesAfterScroll(DataSet: TDataSet);
    procedure q_devicesBeforeScroll(DataSet: TDataSet);
    procedure q_devicesBeforeClose(DataSet: TDataSet);
    procedure q_table2AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure pcInputValuesChange(Sender: TObject);
    procedure btnProcessingClick(Sender: TObject);
    procedure DbGridFrame2GridGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure cbMainSizeMetricClick(Sender: TObject);
  private
    { Private declarations }
     // чтение выходного файла
     firstlineresult,lastLineresult:integer;
     NofPoints:integer;
    procedure GetAndSaveOutputParam_NOfPoint;
    procedure ShowOutputDataFromDB;
    Procedure ClearOutputDataINDB;
  public
    { Public declarations }
  end;

var
  Devices_Form: TDevices_Form;

implementation

uses dm_u, main_u, createNewcalc_u, cloneNewcalc_u;

{$R *.dfm}

procedure TDevices_Form.DbGridFrame1btnSearchCloseClick(
  Sender: TObject);
begin
  DbGridFrame1.btnSearchCloseClick(Sender);

end;

procedure TDevices_Form.FormShow(Sender: TObject);
begin
 q_devices.close;
 q_devices.open;
end;

procedure TDevices_Form.miDeleteCalculationClick(Sender: TObject);
begin
 if  application.MessageBox( pansiChar( format( QUEST_DeleteCalc,[q_devices.fieldbyname('Name').asstring])),
                  pchar(msg_warning), MB_YESNO or MB_ICONQUESTION) = idYes
            then q_devices.delete;
end;

procedure TDevices_Form.q_devicesAfterDelete(DataSet: TDataSet);
begin
 q_devices.Transaction.CommitRetaining;
end;

procedure TDevices_Form.q_devicesAfterPost(DataSet: TDataSet);
begin
   q_devices.Transaction.CommitRetaining;
end;

procedure TDevices_Form.miSaveEditClick(Sender: TObject);
begin
 q_devicesBeforeScroll(q_devices);

 if (q_devices.State in [dsedit]) then q_devices.post;
 if (q_table2.State in [dsEdit]) then q_table2.post;

end;

procedure TDevices_Form.miCloseClick(Sender: TObject);
begin
 miSaveEditClick(nil);
 close
end;

procedure TDevices_Form.q_devicesAfterOpen(DataSet: TDataSet);
begin
(* calcType.ItemIndex:=q_devices.fieldbyname('Calc_Type_Num').asinteger;
 PazRotor.ItemIndex:=q_devices.fieldbyname('Paz_Rotor_Type').asinteger;
 PazStator.ItemIndex:=q_devices.fieldbyname('Paz_Stator_Type').asinteger;
 SteelStator.ItemIndex:=q_devices.fieldbyname('Steel_Stator').asinteger;
 SteelRotor.ItemIndex:=q_devices.fieldbyname('Steel_Rotor').asinteger;
 ObmotkaSchema.ItemIndex:=q_devices.fieldbyname('Obmotka_Schema').asinteger;
 ObmotkaSterghen.ItemIndex:=q_devices.fieldbyname('Obmotka_Sterghen').asinteger;
*)
 q_table2.open;
end;

procedure TDevices_Form.q_devicesAfterScroll(DataSet: TDataSet);
begin
(* calcType.ItemIndex:=q_devices.fieldbyname('Calc_Type_Num').asinteger;
 PazRotor.ItemIndex:=q_devices.fieldbyname('Paz_Rotor_Type').asinteger;
 PazStator.ItemIndex:=q_devices.fieldbyname('Paz_Stator_Type').asinteger;
 SteelStator.ItemIndex:=q_devices.fieldbyname('Steel_Stator').asinteger;
 SteelRotor.ItemIndex:=q_devices.fieldbyname('Steel_Rotor').asinteger;
 ObmotkaSchema.ItemIndex:=q_devices.fieldbyname('Obmotka_Schema').asinteger;
 ObmotkaSterghen.ItemIndex:=q_devices.fieldbyname('Obmotka_Sterghen').asinteger;
 if pcInputValues.ActivePage=TabMainEngine then pbMainEngine.Repaint  ;
*)end;

procedure TDevices_Form.q_devicesBeforeScroll(DataSet: TDataSet);
begin
try
 if (q_devices.State in [dsedit]) then q_devices.post;
(* q_devices.edit;
 q_devices.fieldbyname('Calc_Type_Num').asinteger :=  calcType.ItemIndex;
 case   q_devices.fieldbyname('Calc_Type_Num').asinteger of
  0: q_devices.fieldbyname('Calc_Type').asstring:='CHECK';
  1: q_devices.fieldbyname('Calc_Type').asstring:='OPTIM';
  2: q_devices.fieldbyname('Calc_Type').asstring:='CHCK_CIRCLE';
 end;
 q_devices.fieldbyname('Paz_Rotor_Type').asinteger:= PazRotor.ItemIndex;
 q_devices.fieldbyname('Paz_Stator_Type').asinteger:=PazStator.ItemIndex;
 q_devices.fieldbyname('Steel_Stator').asinteger:=SteelStator.ItemIndex ;
 q_devices.fieldbyname('Steel_Rotor').asinteger:=  SteelRotor.ItemIndex;
 q_devices.fieldbyname('Obmotka_Schema').asinteger:=  ObmotkaSchema.ItemIndex;
 q_devices.fieldbyname('Obmotka_Sterghen').asinteger:=ObmotkaSterghen.ItemIndex;
 q_devices.post;
*)     except on E: Exception do
           showmessage('Ошибка при сохранении расчета в базу данных:' +E.Message);
 end;
end;

procedure TDevices_Form.q_devicesBeforeClose(DataSet: TDataSet);
begin
q_table2.close;
end;

procedure TDevices_Form.q_table2AfterPost(DataSet: TDataSet);
begin
 dm.tranDefault.CommitRetaining
end;

procedure TDevices_Form.FormCreate(Sender: TObject);
begin
 pcInputValues.ActivePageIndex:=0;
end;

procedure TDevices_Form.pcInputValuesChange(Sender: TObject);
begin
 miSaveEditClick(nil);
end;

procedure TDevices_Form.btnProcessingClick(Sender: TObject);
begin
 try

 except on E: Exception do
           showmessage('Ошибка при вызове расчетной программы:' +E.Message);
  end;
end;


procedure TDevices_Form.DbGridFrame2GridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
if column.FieldName='CV_VALUE' then
 if  q_table2.fieldbyname('Image').asinteger=1 then  background:=clyellow;

end;

procedure TDevices_Form.cbMainSizeMetricClick(Sender: TObject);
begin
pbMainEngine.Repaint
end;

procedure TDevices_Form.ShowOutputDataFromDB;
begin
end;

procedure TDevices_Form.GetAndSaveOutputParam_NOfPoint;
 begin
end;

Procedure TDevices_Form.ClearOutputDataINDB;
begin
end;

end.
