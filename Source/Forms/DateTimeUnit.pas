unit DateTimeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, StorageUnit, DB;

type
{ TDateTimeFrame }

  TDateTimeFrame = class(TFrame, IRememberable)
    FromDatePicker: TDateTimePicker;
    ToDatePicker: TDateTimePicker;
    FromTimePicker: TDateTimePicker;
    ToTimePicker: TDateTimePicker;
    FromCheck: TCheckBox;
    ToCheck: TCheckBox;
    LimitBevel: TBevel;
    FromLabel: TLabel;
    ToLabel: TLabel;
    procedure FromDatePickerChange(Sender: TObject);
    procedure FromDatePickerCloseUp(Sender: TObject);
    procedure ToDatePickerChange(Sender: TObject);
    procedure ToDatePickerCloseUp(Sender: TObject);
    procedure FromTimePickerChange(Sender: TObject);
    procedure FromTimePickerExit(Sender: TObject);
    procedure FromTimePickerKeyPress(Sender: TObject; var Key: Char);
    procedure ToTimePickerChange(Sender: TObject);
    procedure ToTimePickerExit(Sender: TObject);
    procedure ToTimePickerKeyPress(Sender: TObject; var Key: Char);
    procedure FromCheckClick(Sender: TObject);
    procedure ToCheckClick(Sender: TObject);
    procedure FromDatePickerKeyPress(Sender: TObject; var Key: Char);
  private
    FDateFromUpdated: Boolean;
    FDateToUpdated: Boolean;
    FForceDates: Boolean;
    FOnChange: TNotifyEvent;
    FTimeFromUpdated: Boolean;
    FTimeToUpdated: Boolean;
    function GetIgnoreFrom: Boolean;
    procedure SetIgnoreFrom(AIgnoreFrom: Boolean);
    function GetDateFrom: TDateTime;
    procedure SetDateFrom(ADateFrom: TDateTime);
    function GetIgnoreTo: Boolean;
    procedure SetIgnoreTo(AIgnoreTo: Boolean);
    function GetDateTo: TDateTime;
    procedure SetDateTo(ADateTo: TDateTime);
    procedure SetForceDates(AForceDates: Boolean);
    procedure Changed;
    procedure UpdateFromDatePicker;
    procedure UpdateToDatePicker;
    procedure FontChanged;
    procedure CMFontChanged(var Msg: TMessage); message CM_FONTCHANGED;
    function GetWantedHeight: Integer;
  protected
  { IRememberable }
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string);
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string);
  public
    function SetParams(Params: TParams): Boolean;
    function SetParamsAsDate(Params: TParams): Boolean;
    property DateFrom: TDateTime read GetDateFrom write SetDateFrom;
    property DateTo: TDateTime read GetDateTo write SetDateTo;
    property ForceDates: Boolean read FForceDates write SetForceDates;
    property IgnoreFrom: Boolean read GetIgnoreFrom write SetIgnoreFrom;
    property IgnoreTo: Boolean read GetIgnoreTo write SetIgnoreTo;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property WantedHeight: Integer read GetWantedHeight;
  end;

implementation

uses
  DateUtils, ExtraUnit, Math;

{$R *.dfm}

{ TDateTimeFrame }

function TDateTimeFrame.SetParams(Params: TParams): Boolean;
var
  D: TDateTime;
  P: TParam;
  B: Boolean;
begin
  Result := False;

  B := IgnoreFrom and not ForceDates;
  P := Params.FindParam('IGNORE_FROM');
  if (P <> nil) and (P.IsNull or (P.AsInteger <> Ord(B))) then
  begin
    P.AsInteger := Ord(B);
    Result := True;
  end;

  if not B then
  begin
    D := DateFrom;
    P := Params.FindParam('DATE_FROM');
    if (P <> nil) and (P.IsNull or (P.AsDateTime <> D)) then
    begin
      P.AsDateTime := D;
      Result := True;
    end;
  end;

  B := IgnoreTo and not ForceDates;
  P := Params.FindParam('IGNORE_TO');
  if (P <> nil) and (P.IsNull or (P.AsInteger <> Ord(B))) then
  begin
    P.AsInteger := Ord(B);
    Result := True;
  end;

  if not B then
  begin
    D := DateTo;
    P := Params.FindParam('DATE_TO');
    if (P <> nil) and (P.IsNull or (P.AsDateTime <> D)) then
    begin
      P.AsDateTime := D;
      Result := True;
    end;
  end;
end;

function TDateTimeFrame.SetParamsAsDate(Params: TParams): Boolean;
var
  D: TDateTime;
  P: TParam;
  B: Boolean;
begin
  Result := False;

  B := IgnoreFrom and not ForceDates;
  P := Params.FindParam('IGNORE_FROM');
  if (P <> nil) and (P.IsNull or (P.AsInteger <> Ord(B))) then
  begin
    P.AsInteger := Ord(B);
    Result := True;
  end;

  if not B then
  begin
    D := DateFrom;
    P := Params.FindParam('DATE_FROM');
    if (P <> nil) and (P.IsNull or (P.AsDate <> DateOf(D))) then
    begin
      P.AsDate := DateOf(D);
      Result := True;
    end;
  end;

  B := IgnoreTo and not ForceDates;
  P := Params.FindParam('IGNORE_TO');
  if (P <> nil) and (P.IsNull or (P.AsInteger <> Ord(B))) then
  begin
    P.AsInteger := Ord(B);
    Result := True;
  end;

  if not B then
  begin
    D := DateTo;
    P := Params.FindParam('DATE_TO');
    if (P <> nil) and (P.IsNull or (P.AsDate <> DateOf(D))) then
    begin
      P.AsDate := DateOf(D);
      Result := True;
    end;
  end;
end;

function TDateTimeFrame.GetDateFrom: TDateTime;
begin
  Result := DateOf(FromDatePicker.Date) + TimeOf(FromTimePicker.Time);
end;

function TDateTimeFrame.GetDateTo: TDateTime;
begin
  Result := DateOf(ToDatePicker.Date) + TimeOf(ToTimePicker.Time);
end;

function TDateTimeFrame.GetIgnoreFrom: Boolean;
begin
  Result := not FromCheck.Checked;
end;

function TDateTimeFrame.GetIgnoreTo: Boolean;
begin
  Result := not ToCheck.Checked;
end;

procedure TDateTimeFrame.SetDateFrom(ADateFrom: TDateTime);
begin
  FromDatePicker.Date := DateOf(ADateFrom);
  FromTimePicker.Time := TimeOf(ADateFrom);
end;

procedure TDateTimeFrame.SetDateTo(ADateTo: TDateTime);
begin
  ToDatePicker.Date := DateOf(ADateTo);
  ToTimePicker.Time := TimeOf(ADateTo);
end;

procedure TDateTimeFrame.SetIgnoreFrom(AIgnoreFrom: Boolean);
begin
  FromCheck.Checked := not AIgnoreFrom;
end;

procedure TDateTimeFrame.SetIgnoreTo(AIgnoreTo: Boolean);
begin
  ToCheck.Checked := not AIgnoreTo;
end;

procedure TDateTimeFrame.Changed;
begin
  if Assigned(OnChange) then OnChange(Self);
end;

procedure TDateTimeFrame.UpdateFromDatePicker;
var
  D1, D2: TDateTime;
begin
  D1 := DateOf(FromDatePicker.Date) + TimeOf(FromTimePicker.Time);
  D2 := DateOf(ToDatePicker.Date) + TimeOf(ToTimePicker.Time);

  if D2 < D1 then
  begin
    ToDatePicker.Date := DateOf(D1);
    ToTimePicker.Time := TimeOf(D1);
  end;

  if FromCheck.Checked then Changed;
end;

procedure TDateTimeFrame.FromDatePickerChange(Sender: TObject);
begin
  if FromDatePicker.DroppedDown then FDateFromUpdated := True
  else UpdateFromDatePicker;
end;

procedure TDateTimeFrame.FromDatePickerCloseUp(Sender: TObject);
begin
  if FDateFromUpdated then
  begin
    UpdateFromDatePicker;
    FDateFromUpdated := False;
  end;
end;

procedure TDateTimeFrame.UpdateToDatePicker;
var
  D1, D2: TDateTime;
begin
  D1 := DateOf(FromDatePicker.Date) + TimeOf(FromTimePicker.Time);
  D2 := DateOf(ToDatePicker.Date) + TimeOf(ToTimePicker.Time);

  if D1 > D2 then
  begin
    FromDatePicker.Date := DateOf(D2);
    FromTimePicker.Time := TimeOf(D2);
  end;

  if ToCheck.Checked then Changed;
end;

procedure TDateTimeFrame.ToDatePickerChange(Sender: TObject);
begin
  if ToDatePicker.DroppedDown then FDateToUpdated := True
  else UpdateToDatePicker;
end;

procedure TDateTimeFrame.ToDatePickerCloseUp(Sender: TObject);
begin
  if FDateToUpdated then
  begin
    UpdateToDatePicker;
    FDateToUpdated := False;
  end;
end;

procedure TDateTimeFrame.FromTimePickerChange(Sender: TObject);
begin
  if FromTimePicker.Focused then FTimeFromUpdated := True
  else UpdateFromDatePicker;
end;

procedure TDateTimeFrame.FromTimePickerExit(Sender: TObject);
begin
  if FTimeFromUpdated then
  begin
    UpdateFromDatePicker;
    FTimeFromUpdated := False;
  end;
end;

procedure TDateTimeFrame.FromTimePickerKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) and FTimeFromUpdated then
  begin
    UpdateFromDatePicker;
    FTimeFromUpdated := False;
    Key := #0;
  end;
end;

procedure TDateTimeFrame.ToTimePickerChange(Sender: TObject);
begin
  if ToTimePicker.Focused then FTimeToUpdated := True
  else UpdateToDatePicker;
end;

procedure TDateTimeFrame.ToTimePickerExit(Sender: TObject);
begin
  if FTimeToUpdated then
  begin
    UpdateToDatePicker;
    FTimeToUpdated := False;
  end;
end;

procedure TDateTimeFrame.ToTimePickerKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) and FTimeToUpdated then
  begin
    UpdateFromDatePicker;
    FTimeToUpdated := False;
    Key := #0;
  end;
end;

procedure TDateTimeFrame.FromCheckClick(Sender: TObject);
begin
  Changed;
end;

procedure TDateTimeFrame.ToCheckClick(Sender: TObject);
begin
  Changed;
end;

procedure TDateTimeFrame.SetForceDates(AForceDates: Boolean);
begin
  if FForceDates <> AForceDates then
  begin
    FForceDates := AForceDates;
    FromCheck.Visible := not ForceDates;
    ToCheck.Visible := not ForceDates;
    FromLabel.Visible := ForceDates;
    ToLabel.Visible := ForceDates;
    if ForceDates then
    begin
      FromCheck.Checked := True;
      ToCheck.Checked := True;
    end;
  end;
end;

{ IRememberable }

procedure TDateTimeFrame.SaveState(Storage: TStorage; const SectionName, Prefix: string);
begin
  Storage.WriteBool(SectionName, Prefix + Name + '.IgnoreFrom', IgnoreFrom);
  Storage.WriteBool(SectionName, Prefix + Name + '.IgnoreTo', IgnoreTo);
  Storage.WriteDateTime(SectionName, Prefix + Name + '.DateFrom', DateFrom);
  Storage.WriteDateTime(SectionName, Prefix + Name + '.DateTo', DateTo);
end;

procedure TDateTimeFrame.LoadState(Storage: TStorage; const SectionName, Prefix: string);
begin
  IgnoreFrom := Storage.ReadBool(SectionName, Prefix + Name + '.IgnoreFrom', IgnoreFrom);
  IgnoreTo := Storage.ReadBool(SectionName, Prefix + Name + '.IgnoreTo', IgnoreTo);
  DateFrom := Storage.ReadDateTime(SectionName, Prefix + Name + '.DateFrom', DateFrom);
  DateTo := Storage.ReadDateTime(SectionName, Prefix + Name + '.DateTo', DateTo);
end;

procedure TDateTimeFrame.CMFontChanged(var Msg: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) and HandleAllocated then FontChanged;
end;

procedure TDateTimeFrame.FontChanged;
var
  H: Integer;
begin
  H := FontHeight(Font);

  ToDatePicker.Top := ControlOffsetY(FromDatePicker, 4);
  FromCheck.Height := H + 6;
  FromCheck.Width := FromCheck.Height + Max(TextWidth(Self, FromCheck.Caption), TextWidth(Self, ToCheck.Caption));
  FromLabel.Height := FromCheck.Height;
  FromLabel.Width := FromCheck.Width - 8;
  ToCheck.Top := ToDatePicker.Top + 2;
  ToCheck.Height := FromCheck.Height;
  ToCheck.Width := FromCheck.Width;
  ToLabel.Top := ToCheck.Top;
  ToLabel.Height := ToCheck.Height;
  ToLabel.Width := ToCheck.Width - 8;
  FromDatePicker.Left := ControlOffsetX(FromCheck, 2);
  ToDatePicker.Left := FromDatePicker.Left;

  ToDatePicker.Width := Max(97, TextWidth(Self, '31.12.2004') + 32);
  FromDatePicker.Width := ToDatePicker.Width;

  FromTimePicker.Left := ControlOffsetX(FromDatePicker, 8);
  FromTimePicker.Width := Max(73, TextWidth(Self, '23:59') + 32);
  ToTimePicker.Top := ToDatePicker.Top;
  ToTimePicker.Left := FromTimePicker.Left;
  ToTimePicker.Width := FromTimePicker.Width;

  Width := ControlOffsetX(ToTimePicker, 2);
end;

function TDateTimeFrame.GetWantedHeight: Integer;
begin
  Result := ControlOffsetY(ToDatePicker, 4);
end;

procedure TDateTimeFrame.FromDatePickerKeyPress(Sender: TObject; var Key: Char);
begin
  EnterAsTabKeyPress(Sender, Key);
end;

end.
