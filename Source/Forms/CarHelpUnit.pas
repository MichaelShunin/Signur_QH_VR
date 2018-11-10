unit CarHelpUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MaximizedUnit, ComCtrls, QpHelpFrameUnit, DB, StdCtrls,
  IBCustomDataSet, IBQuery, ExtCtrls, ExtraUnit, StorageUnit, GFunctions,
  ImgList, ToolWin, EmTelEditUnit, EmBillEditUnit;

type
  TCarHelpForm = class(TMaximizedForm, IRememberable)
    PageControl1: TPageControl;
    CommonSheet: TTabSheet;
    QpSheet: TTabSheet;
    QpFrame: TQpbHelpFrame;
    ArrivalQuery: TIBQuery;
    ArrivalQueryCAR_ID: TIntegerField;
    ArrivalQueryNUMBER: TIntegerField;
    ArrivalQueryARRIVAL_DATE: TDateField;
    ArrivalQueryARRIVAL_TIME: TTimeField;
    ArrivalQueryREPLACED_NUMBER: TIntegerField;
    ArrivalQueryMAIN_BILL_ID: TIntegerField;
    ArrivalQueryEXTRA_BILL_NUMBER: TIBStringField;
    ArrivalQueryTRAIN_NUMBER: TSmallintField;
    ArrivalQueryCTYPE_NAME: TIBStringField;
    ArrivalQueryQPO_NUMBER: TSmallintField;
    ArrivalQueryGTD: TIBStringField;
    ArrivalQueryWEIGHT_OB: TIntegerField;
    ArrivalQueryWEIGHT_ON: TIntegerField;
    ArrivalQueryZPU: TIBStringField;
    ArrivalQueryOWNERSHIP: TSmallintField;
    ArrivalQueryCN_NUMBER: TSmallintField;
    TrainLabel: TLabel;
    TrNumberLabel: TLabel;
    TrDateLabel: TLabel;
    TrTimeLabel: TLabel;
    ArrivalSource: TDataSource;
    ATrNumberLabel: TLabel;
    ATrDateLabel: TLabel;
    ATrTimeLabel: TLabel;
    BillNumberLabel: TLabel;
    BillPreparedLabel: TLabel;
    ABillNumberLabel: TLabel;
    ABillPreparedLabel: TLabel;
    ProductLabel: TLabel;
    AProductLabel: TLabel;
    StationLabel: TLabel;
    AStationLabel: TLabel;
    OwnerLabel: TLabel;
    AOwnerLabel: TLabel;
    SenderLabel: TLabel;
    ASenderLabel: TLabel;
    ManufactLabel: TLabel;
    AManufactLabel: TLabel;
    ExtraBillLabel: TLabel;
    AExtraBillLabel: TLabel;
    ReplacedLabel: TLabel;
    AReplacedLabel: TLabel;
    TypeLabel: TLabel;
    ATypeLabel: TLabel;
    OBruttoLabel: TLabel;
    AOBruttoLabel: TLabel;
    ONettoLabel: TLabel;
    AONettoLabel: TLabel;
    QPOLabel: TLabel;
    AQPOLabel: TLabel;
    GTDLabel: TLabel;
    AGTDLabel: TLabel;
    CNLabel: TLabel;
    ACNLabel: TLabel;
    ZPULabel: TLabel;
    AZPULabel: TLabel;
    OwnershipLabel: TLabel;
    AOwnershipLabel: TLabel;
    ArrivalQueryBILL_NUMBER: TIBStringField;
    ArrivalQueryPRODUCT_NAME: TIBStringField;
    ArrivalQuerySTATION_NAME: TIBStringField;
    ArrivalQueryPREPARED: TDateField;
    ArrivalQueryBILL_TRAIN_NUMBER: TSmallintField;
    ArrivalQueryBILL_TRAIN_DATE: TDateField;
    ArrivalQueryBILL_TRAIN_TIME: TTimeField;
    BillTrainLabel: TLabel;
    BillTrainNumberLabel: TLabel;
    ABillTrainNumberLabel: TLabel;
    BillTrainDateLabel: TLabel;
    ABillTrainDateLabel: TLabel;
    BillTrainTimeLabel: TLabel;
    ABillTrainTimeLabel: TLabel;
    ArrivalPanel: TPanel;
    Splitter1: TSplitter;
    PlacPanel: TPanel;
    PlStateLabel: TLabel;
    APlStateLabel: TLabel;
    PLabel: TLabel;
    PDateLabel: TLabel;
    APDateLabel: TLabel;
    PTimeLabel: TLabel;
    APTimeLabel: TLabel;
    ELabel: TLabel;
    EDateLabel: TLabel;
    AEDateLabel: TLabel;
    ETimeLabel: TLabel;
    AETimeLabel: TLabel;
    CLabel: TLabel;
    CDateLabel: TLabel;
    ACDateLabel: TLabel;
    CTimeLabel: TLabel;
    ACTimeLabel: TLabel;
    UploadLabel: TLabel;
    AUploadLabel: TLabel;
    BBruttoLabel: TLabel;
    ABBruttoLabel: TLabel;
    BNettoLabel: TLabel;
    ABNettoLabel: TLabel;
    VolumeLabel: TLabel;
    AVolumeLabel: TLabel;
    DBruttoLabel: TLabel;
    ADBruttoLabel: TLabel;
    DNettoLabel: TLabel;
    ADNettoLabel: TLabel;
    QPBLabel: TLabel;
    AQPBLabel: TLabel;
    TemperLabel: TLabel;
    ATemperLabel: TLabel;
    PlacQuery: TIBQuery;
    LineLabel: TLabel;
    ALineLabel: TLabel;
    PlacQueryLINE: TIntegerField;
    PlacQueryDT_P_DATE: TDateField;
    PlacQueryDT_P_TIME: TTimeField;
    PlacQueryDT_C_DATE: TDateField;
    PlacQueryDT_C_TIME: TTimeField;
    PlacQueryDT_E_DATE: TDateField;
    PlacQueryDT_E_TIME: TTimeField;
    PlacQueryTEMPER: TSmallintField;
    PlacQueryPL_STATE_NAME: TIBStringField;
    PlacQueryUPLOAD_B: TIntegerField;
    PlacQueryVOLUME_B: TIntegerField;
    PlacQueryWEIGHT_BB: TIntegerField;
    PlacQueryWEIGHT_BN: TIntegerField;
    PlacQueryDEB_BRUTTO: TLargeintField;
    PlacQueryDEB_NETTO: TLargeintField;
    PlacQueryQPB_NUMBER: TSmallintField;
    NotArrivedLabel: TLabel;
    PlacQueryNUMBER: TIntegerField;
    PlacQueryREG_NUMBER: TIntegerField;
    StatNumberLabel: TLabel;
    AStatNumberLabel: TLabel;
    RegNumberLabel: TLabel;
    ARegNumberLabel: TLabel;
    ArrivalQueryOWNER_NAME: TIBStringField;
    ArrivalQuerySENDER_NAME: TIBStringField;
    ArrivalQueryMANUFACT_NAME: TIBStringField;
    EmSheet: TTabSheet;
    BPanel: TPanel;
    Splitter2: TSplitter;
    TPanel: TPanel;
    BNamePanel: TPanel;
    TNamePanel: TPanel;
    ImageList: TImageList;
    PlacQueryEB_STATION_NAME: TIBStringField;
    PlacQueryEB_RECIPIENT_NAME: TIBStringField;
    PlacQueryTEL_DATE: TDateField;
    PlacQueryTEL_NUMBER: TIBStringField;
    PlacQueryTEL_FIRM_NAME: TIBStringField;
    EBStationLabel: TLabel;
    AEBStationLabel: TLabel;
    EBRecipLabel: TLabel;
    AEBRecipLabel: TLabel;
    TFirmLabel: TLabel;
    ATFirmLabel: TLabel;
    TDateLabel: TLabel;
    ATDateLabel: TLabel;
    TNumberLabel: TLabel;
    ATNumberLabel: TLabel;
    BNoLabel: TLabel;
    TNoLabel: TLabel;
    PlacQueryEMBILL_ID: TIntegerField;
    PlacQueryTEL_ID: TIntegerField;
    BToolBar: TToolBar;
    BOpenBtn: TToolButton;
    TToolBar: TToolBar;
    TOpenBtn: TToolButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TOpenBtnClick(Sender: TObject);
    procedure BOpenBtnClick(Sender: TObject);
  protected
    procedure FontChanged; override;
  { IRememberable }
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string);
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string);
  public
    procedure Initialize(ACarID: integer; AOnlyArrival: boolean; ANotArrived: boolean);
  end;

var
  CarHelpForm: TCarHelpForm;

procedure CarHelp(ACarID: integer; AOnlyArrival: boolean; ANotArrived: boolean);


implementation

{$R *.dfm}

procedure CarHelp(ACarID: integer; AOnlyArrival: boolean; ANotArrived: boolean);
var
  Form: TCarHelpForm;
begin
  Form := TCarHelpForm.Create(Application);
  try
    Form.Initialize(ACarID, AOnlyArrival, ANotArrived);
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TCarHelpForm.Initialize(ACarID: integer; AOnlyArrival: boolean; ANotArrived: boolean);
var
  S: string;
begin
  ArrivalQuery.ParamByName('CAR_ID').AsInteger:=ACarID;
  ArrivalQuery.Open;
  Caption:='Справка по в/ц '+ArrivalQueryNUMBER.AsString;
  ATrNumberLabel.Caption:=ArrivalQueryTRAIN_NUMBER.AsString;
  ATrDateLabel.Caption:=ArrivalQueryARRIVAL_DATE.AsString;
  S:=ArrivalQueryARRIVAL_TIME.AsString;
  Delete(S,Length(S)-2,3);
  ATrTimeLabel.Caption:=S;
  ABillNumberLabel.Caption:=ArrivalQueryBILL_NUMBER.AsString;
  ABillPreparedLabel.Caption:=ArrivalQueryPREPARED.AsString;
  AProductLabel.Caption:=ArrivalQueryPRODUCT_NAME.AsString;
  AStationLabel.Caption:=ArrivalQuerySTATION_NAME.AsString;
  AOwnerLabel.Caption:=ArrivalQueryOWNER_NAME.AsString;
  ASenderLabel.Caption:=ArrivalQuerySENDER_NAME.AsString;
  AManufactLabel.Caption:=ArrivalQueryMANUFACT_NAME.AsString;
  ABillTrainNumberLabel.Caption:=ArrivalQueryBILL_TRAIN_NUMBER.AsString;
  ABillTrainDateLabel.Caption:=ArrivalQueryBILL_TRAIN_DATE.AsString;
  S:=ArrivalQueryBILL_TRAIN_TIME.AsString;
  Delete(S,Length(S)-2,3);
  ABillTrainTimeLabel.Caption:=S;
  AExtraBillLabel.Caption:=ArrivalQueryEXTRA_BILL_NUMBER.AsString;
  AReplacedLabel.Caption:=ArrivalQueryREPLACED_NUMBER.AsString;
  ATypeLabel.Caption:=ArrivalQueryCTYPE_NAME.AsString;
  AOBruttoLabel.Caption:=ArrivalQueryWEIGHT_OB.AsString;
  AONettoLabel.Caption:=ArrivalQueryWEIGHT_ON.AsString;
  AQPOLabel.Caption:=ArrivalQueryQPO_NUMBER.AsString;
  ACNLabel.Caption:=ArrivalQueryCN_NUMBER.AsString;
  AGTDLabel.Caption:=ArrivalQueryGTD.AsString;
  AZPULabel.Caption:=ArrivalQueryZPU.AsString;
  if (ArrivalQueryOWNERSHIP.AsInteger=1)
    then AOwnershipLabel.Caption:='1'
    else AOwnershipLabel.Caption:='0';

  if ANotArrived then begin
    TrainLabel.Visible:=false;
    TrNumberLabel.Visible:=false;
    ATrNumberLabel.Visible:=false;
    TrDateLabel.Visible:=false;
    ATrDateLabel.Visible:=false;
    TrTimeLabel.Visible:=false;
    ATrTimeLabel.Visible:=false;
  end
  else NotArrivedLabel.Visible:=false;

  if not AOnlyArrival then begin
    PlacQuery.ParamByName('CAR_ID').AsInteger:=ACarID;
    PlacQuery.Open;
    APlStateLabel.Caption:=PlacQueryPL_STATE_NAME.AsString;
    ALineLabel.Caption:=PlacQueryLINE.AsString;
    APDateLabel.Caption:=PlacQueryDT_P_DATE.AsString;
    S:=PlacQueryDT_P_TIME.AsString;
    Delete(S,Length(S)-2,3);
    APTimeLabel.Caption:=S;
    AEDateLabel.Caption:=PlacQueryDT_E_DATE.AsString;
    S:=PlacQueryDT_E_TIME.AsString;
    Delete(S,Length(S)-2,3);
    AETimeLabel.Caption:=S;
    ACDateLabel.Caption:=PlacQueryDT_C_DATE.AsString;
    S:=PlacQueryDT_C_TIME.AsString;
    Delete(S,Length(S)-2,3);
    ACTimeLabel.Caption:=S;

    if not PlacQueryUPLOAD_B.IsNull
      then AUploadLabel.Caption := UploadToStr(PlacQueryUPLOAD_B.AsInteger)
      else AUploadLabel.Caption := '';

    AVolumeLabel.Caption:=PlacQueryVOLUME_B.AsString;
    ABBruttoLabel.Caption:=PlacQueryWEIGHT_BB.AsString;
    ABNettoLabel.Caption:=PlacQueryWEIGHT_BN.AsString;
    ADBruttoLabel.Caption:=PlacQueryDEB_BRUTTO.AsString;
    ADNettoLabel.Caption:=PlacQueryDEB_NETTO.AsString;
    AQPBLabel.Caption:=PlacQueryQPB_NUMBER.AsString;
    ATemperLabel.Caption:=PlacQueryTEMPER.AsString;
    AStatNumberLabel.Caption:=PlacQueryNUMBER.AsString;
    ARegNumberLabel.Caption:=PlacQueryREG_NUMBER.AsString;

    //данные порожняка
    if not PlacQueryEMBILL_ID.IsNull then begin
      BNoLabel.Visible := false;
      AEBStationLabel.Caption := PlacQueryEB_STATION_NAME.AsString;
      AEBRecipLabel.Caption := PlacQueryEB_RECIPIENT_NAME.AsString;
    end
    else begin
      BNoLabel.Visible := true;
      EBStationLabel.Visible := false;
      AEBStationLabel.Visible := false;
      EBRecipLabel.Visible := false;
      AEBRecipLabel.Visible := false;
    end;
    if not PlacQueryTEL_ID.IsNull then begin
      TNoLabel.Visible := false;
      ATFirmLabel.Caption := PlacQueryTEL_FIRM_NAME.AsString;
      ATDateLabel.Caption := FormatDateTime('dd.mm.yy', PlacQueryTEL_DATE.AsDateTime);
      ATNumberLabel.Caption := PlacQueryTEL_NUMBER.AsString;
    end
    else begin
      TNoLabel.Visible := true;
      TFirmLabel.Visible := false;
      ATFirmLabel.Visible := false;
      TDateLabel.Visible := false;
      ATDateLabel.Visible := false;
      TNumberLabel.Visible := false;
      ATNumberLabel.Visible := false;
    end;
  end
  else begin
    PlacPanel.Visible:=false;
    BPanel.Visible := false;
    TPanel.Visible := false;
    Caption := Caption + ' (только информация о прибытии)';
  end;
  QpFrame.Initialize(ACarID);
end;


procedure TCarHelpForm.FormDestroy(Sender: TObject);
begin
  inherited;
  if self=CarHelpForm then CarHelpForm:=nil;
end;

procedure TCarHelpForm.FontChanged;
begin
  TrNumberLabel.Top:=ControlOffsetY(TrainLabel, 0);
  ATrNumberLabel.Top:=TrNumberLabel.Top;
  TrDateLabel.Top:=ControlOffsetY(TrNumberLabel, 0);
  ATrDateLabel.Top:=TrDateLabel.Top;
  TrTimeLabel.Top:=ControlOffsetY(TrDateLabel, 0);
  ATrTimeLabel.Top:=TrTimeLabel.Top;

  TrNumberLabel.Left:=TrainLabel.Left+8;
  TrDateLabel.Left:=TrNumberLabel.Left;
  TrTimeLabel.Left:=TrNumberLabel.Left;

  ATrNumberLabel.Left:=ControlOffsetX(TrNumberLabel, 20);
  ATrDateLabel.Left:=ATrNumberLabel.Left;
  ATrTimeLabel.Left:=ATrNumberLabel.Left;

  BillNumberLabel.Top:=ControlOffsetY(TrTimeLabel, 16);
  ABillNumberLabel.Top:=BillNumberLabel.Top;
  BillPreparedLabel.Top:=ControlOffsetY(BillNumberLabel, 0);
  ABillPreparedLabel.Top:=BillPreparedLabel.Top;
  ProductLabel.Top:=ControlOffsetY(BillPreparedLabel, 0);
  AProductLabel.Top:=ProductLabel.Top;
  StationLabel.Top:=ControlOffsetY(ProductLabel, 0);
  AStationLabel.Top:=StationLabel.Top;
  OwnerLabel.Top:=ControlOffsetY(StationLabel, 0);
  AOwnerLabel.Top:=OwnerLabel.Top;
  SenderLabel.Top:=ControlOffsetY(OwnerLabel, 0);
  ASenderLabel.Top:=SenderLabel.Top;
  ManufactLabel.Top:=ControlOffsetY(SenderLabel, 0);
  AManufactLabel.Top:=ManufactLabel.Top;

  ABillNumberLabel.Left:=ControlOffsetX(BillNumberLabel, 8);
  ABillPreparedLabel.Left:=ControlOffsetX(BillPreparedLabel, 8);
  AProductLabel.Left:=ControlOffsetX(ProductLabel, 8);
  AStationLabel.Left:=ControlOffsetX(StationLabel, 8);
  AOwnerLabel.Left:=ControlOffsetX(OwnerLabel, 8);
  ASenderLabel.Left:=ControlOffsetX(SenderLabel, 8);
  AManufactLabel.Left:=ControlOffsetX(ManufactLabel, 8);

  BillTrainLabel.Top:=ControlOffsetY(ManufactLabel, 16);
  BillTrainNumberLabel.Top:=ControlOffsetY(BillTrainLabel, 0);
  ABillTrainNumberLabel.Top:=BillTrainNumberLabel.Top;
  BillTrainDateLabel.Top:=ControlOffsetY(BillTrainNumberLabel, 0);
  ABillTrainDateLabel.Top:=BillTrainDateLabel.Top;
  BillTrainTimeLabel.Top:=ControlOffsetY(BillTrainDateLabel, 0);
  ABillTrainTimeLabel.Top:=BillTrainTimeLabel.Top;

  BillTrainNumberLabel.Left:=BillTrainLabel.Left+8;
  BillTrainDateLabel.Left:=BillTrainNumberLabel.Left;
  BillTrainTimeLabel.Left:=BillTrainNumberLabel.Left;

  ABillTrainNumberLabel.Left:=ControlOffsetX(BillTrainNumberLabel, 20);
  ABillTrainDateLabel.Left:=ABillTrainNumberLabel.Left;
  ABillTrainTimeLabel.Left:=ABillTrainNumberLabel.Left;

  ExtraBillLabel.Top:=ControlOffsetY(BillTrainTimeLabel, 16);
  AExtraBillLabel.Top:=ExtraBillLabel.Top;
  ReplacedLabel.Top:=ControlOffsetY(ExtraBillLabel, 0);
  AReplacedLabel.Top:=ReplacedLabel.Top;
  TypeLabel.Top:=ControlOffsetY(ReplacedLabel, 0);
  ATypeLabel.Top:=TypeLabel.Top;
  OBruttoLabel.Top:=ControlOffsetY(TypeLabel, 0);
  AOBruttoLabel.Top:=OBruttoLabel.Top;
  ONettoLabel.Top:=ControlOffsetY(OBruttoLabel, 0);
  AONettoLabel.Top:=ONettoLabel.Top;
  QPOLabel.Top:=ControlOffsetY(ONettoLabel, 0);
  AQPOLabel.Top:=QPOLabel.Top;

  CNLabel.Top:=ControlOffsetY(QPOLabel, 16);
  ACNLabel.Top:=CNLabel.Top;
  GTDLabel.Top:=ControlOffsetY(CNLabel, 0);
  AGTDLabel.Top:=GTDLabel.Top;
  ZPULabel.Top:=ControlOffsetY(GTDLabel, 0);
  AZPULabel.Top:=ZPULabel.Top;
  OwnershipLabel.Top:=ControlOffsetY(ZPULabel, 0);
  AOwnershipLabel.Top:=OwnershipLabel.Top;

  AExtraBillLabel.Left:=ControlOffsetX(ExtraBillLabel, 8);
  AReplacedLabel.Left:=ControlOffsetX(ReplacedLabel, 8);
  ATypeLabel.Left:=ControlOffsetX(TypeLabel, 8);
  AOBruttoLabel.Left:=ControlOffsetX(OBruttoLabel, 8);
  AONettoLabel.Left:=ControlOffsetX(ONettoLabel, 8);
  AQPOLabel.Left:=ControlOffsetX(QPOLabel, 8);
  ACNLabel.Left:=ControlOffsetX(CNLabel, 8);
  AGTDLabel.Left:=ControlOffsetX(GTDLabel, 8);
  AZPULabel.Left:=ControlOffsetX(ZPULabel, 8);
  AOwnershipLabel.Left:=ControlOffsetX(OwnershipLabel, 8);

  APlStateLabel.Left:=ControlOffsetX(PlStateLabel, 8);
  LineLabel.Top:=ControlOffsetY(PlStateLabel, 16);
  ALineLabel.Top:=LineLabel.Top;
  ALineLabel.Left:=ControlOffsetX(LineLabel, 8);

  PLabel.Top:=ControlOffsetY(LineLabel, 16);
  PDateLabel.Top:=ControlOffsetY(PLabel, 0);
  APDateLabel.Top:=PDateLabel.Top;
  PTimeLabel.Top:=ControlOffsetY(PDateLabel, 0);
  APTimeLabel.Top:=PTimeLabel.Top;
  PDateLabel.Left:=PLabel.Left+8;
  PTimeLabel.Left:=PDateLabel.Left;
  APTimeLabel.Left:=ControlOffsetX(PTimeLabel, 20);
  APDateLabel.Left:=APTimeLabel.Left;

  ELabel.Top:=ControlOffsetY(PTimeLabel, 16);
  EDateLabel.Top:=ControlOffsetY(ELabel, 0);
  AEDateLabel.Top:=EDateLabel.Top;
  ETimeLabel.Top:=ControlOffsetY(EDateLabel, 0);
  AETimeLabel.Top:=ETimeLabel.Top;
  EDateLabel.Left:=ELabel.Left+8;
  ETimeLabel.Left:=EDateLabel.Left;
  AETimeLabel.Left:=ControlOffsetX(ETimeLabel, 20);
  AEDateLabel.Left:=AETimeLabel.Left;

  CLabel.Top:=ControlOffsetY(ETimeLabel, 16);
  CDateLabel.Top:=ControlOffsetY(CLabel, 0);
  ACDateLabel.Top:=CDateLabel.Top;
  CTimeLabel.Top:=ControlOffsetY(CDateLabel, 0);
  ACTimeLabel.Top:=CTimeLabel.Top;
  CDateLabel.Left:=CLabel.Left+8;
  CTimeLabel.Left:=CDateLabel.Left;
  ACTimeLabel.Left:=ControlOffsetX(CTimeLabel, 20);
  ACDateLabel.Left:=ACTimeLabel.Left;

  UploadLabel.Top:=ControlOffsetY(CTimeLabel, 16);
  AUploadLabel.Top:=UploadLabel.Top;
  AUploadLabel.Left:=ControlOffsetX(UploadLabel, 8);
  VolumeLabel.Top:=ControlOffsetY(UploadLabel, 0);
  AVolumeLabel.Top:=VolumeLabel.Top;
  AVolumeLabel.Left:=ControlOffsetX(VolumeLabel, 8);
  BBruttoLabel.Top:=ControlOffsetY(VolumeLabel, 16);
  ABBruttoLabel.Top:=BBruttoLabel.Top;
  ABBruttoLabel.Left:=ControlOffsetX(BBruttoLabel, 8);
  BNettoLabel.Top:=ControlOffsetY(BBruttoLabel, 0);
  ABNettoLabel.Top:=BNettoLabel.Top;
  ABNettoLabel.Left:=ControlOffsetX(BNettoLabel, 8);
  DBruttoLabel.Top:=ControlOffsetY(BNettoLabel, 0);
  ADBruttoLabel.Top:=DBruttoLabel.Top;
  ADBruttoLabel.Left:=ControlOffsetX(DBruttoLabel, 8);
  DNettoLabel.Top:=ControlOffsetY(DBruttoLabel, 0);
  ADNettoLabel.Top:=DNettoLabel.Top;
  ADNettoLabel.Left:=ControlOffsetX(DNettoLabel, 8);
  QPBLabel.Top:=ControlOffsetY(DNettoLabel, 0);
  AQPBLabel.Top:=QPBLabel.Top;
  AQPBLabel.Left:=ControlOffsetX(QPBLabel, 8);
  TemperLabel.Top:=ControlOffsetY(QPBLabel, 0);
  ATemperLabel.Top:=TemperLabel.Top;
  ATemperLabel.Left:=ControlOffsetX(TemperLabel, 8);
  StatNumberLabel.Top:=ControlOffsetY(TemperLabel, 16);
  AStatNumberLabel.Top:=StatNumberLabel.Top;
  AStatNumberLabel.Left:=ControlOffsetX(StatNumberLabel, 8);
  RegNumberLabel.Top:=ControlOffsetY(StatNumberLabel, 16);
  ARegNumberLabel.Top:=RegNumberLabel.Top;
  ARegNumberLabel.Left:=ControlOffsetX(RegNumberLabel, 8);

  AEBStationLabel.Left := ControlOffsetX(EBStationLabel, 8);
  EBRecipLabel.Top := ControlOffsetY(EBStationLabel, 0);
  AEBRecipLabel.Top := EBRecipLabel.Top;
  AEBRecipLabel.Left := ControlOffsetX(EBRecipLabel, 8);

  ATFirmLabel.Left := ControlOffsetX(TFirmLabel, 8);
  TDateLabel.Top := ControlOffsetY(TFirmLabel, 0);
  ATDateLabel.Top := TDateLabel.Top;
  ATDateLabel.Left := ControlOffsetX(TDateLabel, 8);
  TNumberLabel.Top := ControlOffsetY(TDateLabel, 0);
  ATNumberLabel.Top := TNumberLabel.Top;
  ATNumberLabel.Left := ControlOffsetX(TNumberLabel, 8);
end;

procedure TCarHelpForm.SaveState(Storage: TStorage; const SectionName, Prefix: string);
begin
  Storage.WriteInteger(SectionName, Prefix + Name + '.ArrivalPanel.Width', ArrivalPanel.Width);
  Storage.WriteInteger(SectionName, Prefix + Name + '.BPanel.Width', BPanel.Width);
end;

procedure TCarHelpForm.LoadState(Storage: TStorage; const SectionName, Prefix: string);
begin
  ArrivalPanel.Width := Storage.ReadInteger(SectionName, Prefix + Name + '.ArrivalPanel.Width', ArrivalPanel.Width);
  BPanel.Width := Storage.ReadInteger(SectionName, Prefix + Name + '.BPanel.Width', BPanel.Width);
end;

procedure TCarHelpForm.FormShow(Sender: TObject);
begin
  inherited;
  QpFrame.FitGeometry;
end;

procedure TCarHelpForm.TOpenBtnClick(Sender: TObject);
begin
  if not PlacQueryTEL_ID.IsNull
    then EmShowTel(PlacQueryTEL_ID.AsInteger, true);
end;

procedure TCarHelpForm.BOpenBtnClick(Sender: TObject);
begin
  if not PlacQueryEMBILL_ID.IsNull
    then EmShowBill(PlacQueryEMBILL_ID.AsInteger, true);
end;

end.
