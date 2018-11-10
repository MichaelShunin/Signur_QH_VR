unit CarNAHelpUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit, Buttons, ExtCtrls, DbGridUnit, CarSelUnit,
  StdCtrls, DB, IBCustomDataSet, IBQuery, CarHelpUnit;

type
  TCarNAHelpForm = class(TMaximizedForm)
    Panel: TPanel;
    CarSelButton: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Frame: TDbGridFrame;
    ArrivalLabel: TLabel;
    DataQuery: TIBQuery;
    DataQueryCAR_ID: TIntegerField;
    DataQueryNUMBER: TIntegerField;
    DataQueryTRAIN_NUMBER: TSmallintField;
    DataQueryARRIVAL_DATE: TDateField;
    DataQueryARRIVAL_TIME: TTimeField;
    DataQueryBILL_NUMBER: TIBStringField;
    DataQueryPREPARED: TDateField;
    procedure FormDestroy(Sender: TObject);
    procedure CarSelButtonClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FrameGridDblClick(Sender: TObject);
    procedure FrameGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FNumber: integer;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  CarNAHelpForm: TCarNAHelpForm;

implementation

{$R *.dfm}

procedure TCarNAHelpForm.FormDestroy(Sender: TObject);
begin
  inherited;
  if self=CarNAHelpForm then CarNAHelpForm:=nil;
end;

procedure TCarNAHelpForm.CarSelButtonClick(Sender: TObject);
begin
  inherited;
  FNumber:=SelectCarNumber;
  RefreshData;
end;

procedure TCarNAHelpForm.RefreshData;
begin
  DataQuery.Close;
  DataQuery.ParamByName('NUMBER').AsInteger := FNumber;
  DataQuery.Open;
end;

procedure TCarNAHelpForm.FormHide(Sender: TObject);
begin
  inherited;
  DataQuery.Close;
end;

procedure TCarNAHelpForm.FrameGridDblClick(Sender: TObject);
begin
  inherited;
  if not DataQueryCAR_ID.IsNull then CarHelp(DataQueryCAR_ID.AsInteger, true, true);
end;

procedure TCarNAHelpForm.FrameGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key=VK_RETURN) then begin
    if not DataQueryCAR_ID.IsNull then CarHelp(DataQueryCAR_ID.AsInteger, true, true);
    Key:=0;
  end;
end;

end.
