unit htmlreport_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EtHtmlClasses, EtHtmlControls, Grids, DBGrids,
  EtHtmlDBControls, DBCtrls, EtHtmlTable, DB, IBCustomDataSet, IBQuery;

type
  THTMLReport = class(TForm)
    HTMLPage: TEtHtmlPage;
    EtHtmlRuler2: TEtHtmlRuler;
    grid_object: TEtHtmlDBGrid;
    EtHtmlTable1: TEtHtmlTable;
    EtHtmlLabel7: TEtHtmlLabel;
    EtHtmlLabel2: TEtHtmlLabel;
    EtHtmlLabel3: TEtHtmlLabel;
    EtHtmlLabel4: TEtHtmlLabel;
    dt: TEtHtmlLabel;
    DEVICE_NUMBER: TEtHtmlLabel;
    OBJECT_TYPE_NAME: TEtHtmlLabel;
    OBJECT_NAME: TEtHtmlLabel;
    EtHtmlLabel1: TEtHtmlLabel;
    Descr: TEtHtmlMemo;
    Table1: TEtHtmlTable;
    Table2: TEtHtmlTable;
    EtHtmlLabel5: TEtHtmlLabel;
    EtHtmlLabel6: TEtHtmlLabel;
    EtHtmlLabel8: TEtHtmlLabel;
    Error: TEtHtmlLabel;
    TIME_AVERAGE: TEtHtmlLabel;
    N_seria: TEtHtmlLabel;
    EtHtmlLabel9: TEtHtmlLabel;
    EtHtmlLabel10: TEtHtmlLabel;
    GRID_MEAS: TEtHtmlDBGrid;
    q_VQ: TIBQuery;
    q_VQID: TIntegerField;
    q_VQID_MEASUREMENT: TIntegerField;
    q_VQV_VALUE: TFloatField;
    q_VQQ_VALUE: TFloatField;
    ds_q_vq: TDataSource;
    EtHtmlRuler1: TEtHtmlRuler;
    EtHtmlRuler3: TEtHtmlRuler;
    procedure q_VQQ_VALUEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HTMLReport: THTMLReport;

implementation

uses main_u;

{$R *.dfm}

procedure THTMLReport.q_VQQ_VALUEGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
 if q_VQ.fieldbyname('q_value').isnull then text := '' else
  begin
   text:=formatfloat('0.000',q_VQ.fieldbyname('q_value').value);
   if (main.q_meas.FieldByName('object_type').asinteger=0) then text:='';
  end;

  if q_VQq_vALUE.IsNull then text:=''
 else
  begin
   text:=formatfloat('0.000',q_vqq_Value.asfloat);
   if (not main.q_meas.FieldByName('Dig_after_Point').IsNull) then
     case main.q_meas.FieldByName('dig_after_point').AsInteger of
      0:text:=formatfloat('0',q_vqq_Value.asfloat);
      1:text:=formatfloat('0.0',q_vqq_Value.asfloat);
      2:text:=formatfloat('0.00',q_vqq_Value.asfloat);
      3:text:=formatfloat('0.000',q_vqq_Value.asfloat);
      4:text:=formatfloat('0.0000',q_vqq_Value.asfloat);
      else text:=formatfloat('0.00000',q_vqq_Value.asfloat);
      end
  end

end;

end.
