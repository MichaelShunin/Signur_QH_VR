unit CarMainHelpUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit, Buttons, ExtCtrls, DbGridUnit, CarSelUnit,
  StdCtrls, DB, IBCustomDataSet, IBQuery, CarHelpUnit;

type
  TCarMainHelpForm = class(TMaximizedForm)
    Panel: TPanel;
    CarSelButton: TSpeedButton;
    Splitter: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    ArrivalFrame: TDbGridFrame;
    Panel3: TPanel;
    PlacFrame: TDbGridFrame;
    Panel4: TPanel;
    ArrivalLabel: TLabel;
    PlacLabel: TLabel;
    ArrivalQuery: TIBQuery;
    ArrivalQueryCAR_ID: TIntegerField;
    ArrivalQueryNUMBER: TIntegerField;
    ArrivalQueryARRIVAL_DATE: TDateField;
    ArrivalQueryARRIVAL_TIME: TTimeField;
    ArrivalQueryREPLACED_NUMBER: TIntegerField;
    ArrivalQueryMAIN_BILL_ID: TIntegerField;
    ArrivalQueryMAIN_BILL_NUMBER: TIBStringField;
    ArrivalQueryEXTRA_BILL_NUMBER: TIBStringField;
    ArrivalQueryTRAIN_NUMBER: TSmallintField;
    PlacQuery: TIBQuery;
    PlacQueryLINE: TIntegerField;
    PlacQueryDT_P_DATE: TDateField;
    PlacQueryDT_P_TIME: TTimeField;
    PlacQueryDT_C_DATE: TDateField;
    PlacQueryDT_C_TIME: TTimeField;
    PlacQueryDT_E_DATE: TDateField;
    PlacQueryDT_E_TIME: TTimeField;
    PlacQueryPL_STATE_NAME: TIBStringField;
    PlacQueryCAR_ID: TIntegerField;
    PlacQueryTEL_BEGDATE: TDateField;
    PlacQueryEM_STATION_NAME: TIBStringField;
    PlacQueryEM_RECIPIENT_NAME: TIBStringField;
    PlacQueryNUMBER: TIBStringField;
    PlacQueryTEL_DATE: TDateField;
    PlacQueryTELSENDER_NAME: TIBStringField;
    procedure FormDestroy(Sender: TObject);
    procedure CarSelButtonClick(Sender: TObject);
    procedure ArrivalQueryMAIN_BILL_IDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormHide(Sender: TObject);
    procedure DbGridFrame1GridDblClick(Sender: TObject);
    procedure DbGridFrame2GridDblClick(Sender: TObject);
    procedure ArrivalFrameGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PlacFrameGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FNumber: integer;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  CarMainHelpForm: TCarMainHelpForm;

implementation

{$R *.dfm}

procedure TCarMainHelpForm.FormDestroy(Sender: TObject);
begin
  inherited;
  if self=CarMainHelpForm then CarMainHelpForm:=nil;
end;

procedure TCarMainHelpForm.CarSelButtonClick(Sender: TObject);
begin
  inherited;
  FNumber:=SelectCarNumber;
  RefreshData;
end;

procedure TCarMainHelpForm.RefreshData;
begin
  ArrivalQuery.Close;
  ArrivalQuery.ParamByName('NUMBER').AsInteger := FNumber;
  ArrivalQuery.Open;
  PlacQuery.Open;
end;


procedure TCarMainHelpForm.ArrivalQueryMAIN_BILL_IDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  Text:='';
  if Sender.IsNull then Text:='без док.';
end;

procedure TCarMainHelpForm.FormHide(Sender: TObject);
begin
  inherited;
  ArrivalQuery.Close;
  PlacQuery.Close;
end;

procedure TCarMainHelpForm.DbGridFrame1GridDblClick(Sender: TObject);
begin
  inherited;
  if not ArrivalQueryCAR_ID.IsNull then CarHelp(ArrivalQueryCAR_ID.AsInteger, true, false);
end;

procedure TCarMainHelpForm.DbGridFrame2GridDblClick(Sender: TObject);
begin
  inherited;
  if not PlacQueryCAR_ID.IsNull then CarHelp(PlacQueryCAR_ID.AsInteger, false, false);
end;

procedure TCarMainHelpForm.ArrivalFrameGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key=VK_RETURN) then begin
    if not ArrivalQueryCAR_ID.IsNull then CarHelp(ArrivalQueryCAR_ID.AsInteger, true, false);
    Key:=0;
  end;
//  ArrivalFrame.FrameKeyDown(Sender, Key, Shift);
end;

procedure TCarMainHelpForm.PlacFrameGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key=VK_RETURN) then begin
    if not ArrivalQueryCAR_ID.IsNull then CarHelp(ArrivalQueryCAR_ID.AsInteger, false, false);
    Key:=0;
  end;  
//  PlacFrame.FrameKeyDown(Sender, Key, Shift);
end;

end.
