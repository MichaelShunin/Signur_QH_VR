unit ExtraUnit;

interface

uses
  Classes, Controls, Graphics, SysUtils, Windows, DB, IBCustomDataSet, DbGridEh;

function GetFileVersion(const AFileName: string; var MS, LS: DWORD): Boolean;
function FormatVersion(MS, LS: DWORD): string;
function FontHeight(Font: TFont): Integer;
function ControlOffsetX(Control: TControl; DX: Integer = 0): Integer;
function ControlOffsetY(Control: TControl; DY: Integer = 0): Integer;
function TextWidth(WinControl: TWinControl; const Text: string): Integer;
procedure ControlVAllign(Control: TControl; MainControl: TControl); //вертикальное выравнивание одного контрола относительно другого

function LevenshteinSimilarity(const S, T: string): Double;
function LevenshteinSimilarityEx(PS: PChar; NS: Integer; PB: PWordArray; PT: PChar; NT: Integer): Double;

procedure FieldDateChanged(var Lock: Boolean; DateField, TimeField, DateTimeField: TField);
procedure FieldTimeChanged(var Lock: Boolean; DateField, TimeField, DateTimeField: TField);

procedure EnterAsTabKeyPress(Sender: TObject; var Key: Char);
function SelectNextControl(Control: TWinControl): Boolean;

function AddIntField(DataSet: TDataSet; const FieldName: string; Owner: TComponent = nil): TIntegerField;
function AddNumField(DataSet: TDataSet; const FieldName: string; Precision, Size: Integer; Owner: TComponent = nil): TIBBCDField;
function AddStrField(DataSet: TDataSet; const FieldName: string; Size: Integer; Owner: TComponent = nil): TIBStringField;

function NullToEmpty(V: Variant): Variant;

function FormatDb(const Format: string; DataSet: TDataSet): string;
function ConfirmDelete(const CustomConfirmation: string; DataSet: TDataSet): Boolean;
function ConfirmCascade(const CustomConfirmation: string; DataSet: TDataSet): Boolean;

//добавлено из других библиотек
procedure CheckRequiredFields( DataSet : TDataSet );
procedure TrimAndNullFields(DataSet: TDataSet);

procedure PrepareLookUpColumnExtra(Grd: TDBGridEh; const FN: String;
                              const LookUpTableName,
                                    LookUpKeyFld,
                                    LookUpDisplayFld : String;
                                    SQLTEXT : String = '' );


implementation

uses
  Variants, Forms, Dialogs, JvDSADialogs,
  DataUnit, mnutils;

function ConfirmDelete(const CustomConfirmation: string; DataSet: TDataSet): Boolean;
var
  S: string;
begin
  if DataSet = nil then S := CustomConfirmation
  else S := FormatDb(CustomConfirmation, DataSet);
  Result := JvDSADialogs.MessageDlg('Подтверждение удаления', S,
    mtConfirmation, [mbYes, mbNo], 0, dckScreen, 0, mbNo, mbNo) = mrYes;
end;

function ConfirmCascade(const CustomConfirmation: string; DataSet: TDataSet): Boolean;
const
  Buttons: array [0..1] of string = ('Удалить', 'Отмена');
var
  S: string;
begin
  if DataSet = nil then S := CustomConfirmation
  else S := FormatDb(CustomConfirmation, DataSet);
  Result := JvDSADialogs.MessageDlgEx('Каскадное удаление', S,
    mtConfirmation, Buttons, [mrOK, mrCancel], 0, dckScreen, 0, 1, 1) = mrOK;
end;

function FormatDb(const Format: string; DataSet: TDataSet): string;
var
  P, P1: PChar;
  S: string;
  Field: TField;
begin
  Result := '';
  P := PChar(Format);
  while (P^ <> #0) do
  begin
    P1 := StrScan(P, '%');
    if P1 = nil then
    begin
      Result := Result + string(P);
      Break;
    end;
    SetString(S, P, P1 - P);
    Result := Result + S;
    P := P1 + 1;
    if P^ = '%' then
    begin
      Result := Result + '%';
      P := P + 1;
      Continue;
    end;
    P1 := StrScan(P, '%');
    if P1 = nil then Break;
    SetString(S, P, P1 - P);
    Field := DataSet.FindField(S);
    if Field <> nil then Result := Result + Field.DisplayText;
    P := P1 + 1;
  end;
end;

function AddIntField(DataSet: TDataSet; const FieldName: string; Owner: TComponent): TIntegerField;
begin
  if Owner = nil then Owner := DataSet.Owner;
  Result := TIntegerField.Create(Owner);
  Result.FieldName := FieldName;
  Result.DataSet := DataSet;
end;

function AddNumField(DataSet: TDataSet; const FieldName: string; Precision, Size: Integer; Owner: TComponent): TIBBCDField;
begin
  if Owner = nil then Owner := DataSet.Owner;
  Result := TIBBCDField.Create(Owner);
  Result.FieldName := FieldName;
  Result.Precision := 9;
  Result.Size := 4;
  Result.DataSet := DataSet;
end;

function AddStrField(DataSet: TDataSet; const FieldName: string; Size: Integer; Owner: TComponent): TIBStringField;
begin
  if Owner = nil then Owner := DataSet.Owner;
  Result := TIBStringField.Create(Owner);
  Result.FieldName := FieldName;
  Result.Size := Size;
  Result.DataSet := DataSet;
end;

type
  TXWinControl = class(TWinControl)
  end;

procedure EnterAsTabKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and SelectNextControl(Sender as TWinControl) then Key := #0;
end;

function SelectNextControl(Control: TWinControl): Boolean;
var
  WinControl: TWinControl;
  ParentForm: TCustomForm;
begin
  ParentForm := GetParentForm(Control);
  WinControl := TXWinControl(ParentForm).FindNextControl(Control, True, True, False);
  Result := WinControl <> nil;
  if Result then WinControl.SetFocus;
end;

function TextWidth(WinControl: TWinControl; const Text: string): Integer;
var
  Canvas: TCanvas;
begin
  Canvas := TCanvas.Create;
  try
    Canvas.Handle := GetDC(WinControl.Handle);
    try
      Canvas.Font := TXWinControl(WinControl).Font;
      Result := Canvas.TextWidth(Text);
    finally
      ReleaseDC(WinControl.Handle, Canvas.Handle);
      Canvas.Handle := 0;
    end;
  finally
    Canvas.Free;
  end;
end;

function ControlOffsetX(Control: TControl; DX: Integer): Integer;
begin
  Result := Control.Left + Control.Width + DX;
end;

function ControlOffsetY(Control: TControl; DY: Integer): Integer;
begin
  Result := Control.Top + Control.Height + DY;
end;

function FontHeight(Font: TFont): Integer;
begin
  Result := Font.Height;
  if Result < 0 then Result := - Result;
end;

procedure ControlVAllign(Control: TControl; MainControl: TControl);
begin
  Control.Top := MainControl.Top + Round((MainControl.Height - Control.Height) / 2);
end;  

function GetFileVersion(const AFileName: string; var MS, LS: DWORD): Boolean;
var
  VersionSize, SomeHandle: Cardinal;
  Data: Pointer;
  VersionInfo: PVSFixedFileInfo;
  L: Cardinal;
  FileName: string;
begin
  Result := False;

{ from SysUtils.pas vvv }
  // GetFileVersionInfo modifies the filename parameter data while parsing.
  // Copy the string const into a local variable to create a writeable copy.
  FileName := AFileName;
  UniqueString(FileName);
{ from SysUtils.pas ^^^ }

  VersionSize := GetFileVersionInfoSize(PChar(FileName), SomeHandle);

  if VersionSize > 0 then
  begin
    Data := AllocMem(VersionSize);
    try
      if GetFileVersionInfo(PChar(FileName), SomeHandle, VersionSize, Data) then
      begin
        if VerQueryValue(Data, '\', Pointer(VersionInfo), L) then
        begin
          if (L = SizeOf(TVSFixedFileInfo)) and (VersionInfo.dwSignature = $FEEF04BD) then
          begin
            MS := VersionInfo.dwFileVersionMS;
            LS := VersionInfo.dwFileVersionLS;
            Result := True;
          end;
        end;
      end;
    finally
      FreeMem(Data);
    end;
  end;
end;

function FormatVersion(MS, LS: DWORD): string;
begin
  Result := Format('Версия %d.%d.%d  Сборка %d',
    [ HiWord(MS), LoWord(MS), HiWord(LS), LoWord(LS) ]);
end;

{$OPTIMIZATION ON}

{ MUST: NS >= NT }
function LevenshteinSimilarityEx(PS: PChar; NS: Integer; PB: PWordArray; PT: PChar; NT: Integer): Double;
var
  I, J: Integer;
  Prev, Next, B: Word;
begin
  if NT = 0 then
  begin
    if NS = 0 then Result := 1 else Result := 0;
  end else
  begin
    for J := 0 to NS do PB[J] := J;

    for I := 1 to NT do
    begin
      Prev := PB[0];
      PB[0] := I;
      for J := 1 to NS do
      begin
        if PS[J - 1] <> PT[I - 1] then Inc(Prev);
        Next := PB[J - 1] + 1;
        B := PB[J] + 1;
        if Next > B then Next := B;
        if Next > Prev then Next := Prev;
        Prev := PB[J];
        PB[J] := Next;
      end;
    end;

    Result := 1 - (PB[NS] / NT);
    if Result < 0 then Result := 0;
  end;
end;

function Min3(A, B, C:Integer): Integer;
begin
  Result := A;
  if Result > B then Result := B;
  if Result > C then Result := C;
end;

var
  LevBuffer: array [0..1023] of Word;

function LevenshteinSimilarity(const S, T: string): Double;
var
  Matrix: array of array of Integer;
  Dist, N, M, L: Integer;
  I, J: Integer;
  Si, Tj: Char;
  Cost: Integer;

  SS, TT: string;
  NN, MM: Integer;
  PB: PWordArray;
begin
  N := Length(S);
  M := Length(T);

  if N <= M then
  begin
    SS := S; TT := T;
    NN := N; MM := M;
  end else
  begin
    SS := T; TT := S;
    NN := M; MM := N;
  end;

  if NN < 1024 then
  begin
    Result := LevenshteinSimilarityEx(PChar(SS), NN, @LevBuffer[0], PChar(TT), MM);
    Exit;
  end else
  begin
    PB := AllocMem(NN * SizeOf(Word));
    try
      Result := LevenshteinSimilarityEx(PChar(SS), NN, @LevBuffer[0], PChar(TT), MM);
      Exit;
    finally
      FreeMem(PB);
    end;
  end;

  SetLength(Matrix, N + 1, M + 1);

  if N = 0 then Dist := M
  else if M = 0 then Dist := N else
  begin
    for I := 0 to N do Matrix[I, 0] := I;
    for J := 0 to M do Matrix[0, J] := J;
    for I := 1 to N do
    begin
      Si := S[I];
      for J := 1 to M do
      begin
        Tj := T[J];
        Cost := Ord(Si <> Tj);
        Matrix[I, J] := Min3(Matrix[I - 1, J] + 1, Matrix[I, J - 1] + 1, Matrix[I - 1, J - 1] + Cost);
      end;
    end;
    Dist := Matrix[N, M];
  end;

  if M > N then L := M else L := N;

  Result := 1 - (Dist / L);
  if Result < 0 then Result := 0;
end;

procedure FieldDateChanged(var Lock: Boolean; DateField, TimeField, DateTimeField: TField);
begin
  if not Lock then
  begin
    Lock := True;
    try
      if DateField.IsNull then
      begin
        TimeField.Clear;
        DateTimeField.Clear;
      end else
      begin
        if TimeField.IsNull then TimeField.AsDateTime := 0;
        DateTimeField.AsDateTime := DateField.AsDateTime + TimeField.AsDateTime;
      end;
    finally
      Lock := False;
    end;
  end;
end;

procedure FieldTimeChanged(var Lock: Boolean; DateField, TimeField, DateTimeField: TField);
begin
  if not Lock then
  begin
    Lock := True;
    try
      if TimeField.IsNull then
      begin
        DateField.Clear;
        DateTimeField.Clear;
      end else
      begin
        if DateField.IsNull then DateField.AsDateTime := Date;
        DateTimeField.AsDateTime := DateField.AsDateTime + TimeField.AsDateTime;
      end;
    finally
      Lock := False;
    end;
  end;
end;

function NullToEmpty(V: Variant): Variant;
begin
  if VarIsNull(V) then Result := Unassigned else Result := V; 
end;

procedure CheckRequiredFields(DataSet: TDataSet);
var
  I: Integer;
begin
  with DataSet do
    for I := 0 to FieldCount-1 do
      with Fields[I] do
        if Required and not ReadOnly and (FieldKind = fkData) and (IsNull or (AsString = ''))
          then begin
                 FocusControl;
                 raise Exception.Create( Format('Поле ''%s'' не может оставаться пустым', [DisplayName]) );
               end;
end;

procedure TrimAndNullFields(DataSet: TDataSet);
var
  I: Integer;
  F: TField;
begin
  with DataSet do
    for I := 0 to FieldCount-1 do begin
      F := Fields[I];
      if not F.ReadOnly and not F.IsNull and (F.FieldKind = fkData)
         and ((F is TStringField) or (F is TMemoField))
      then begin
        F.AsString := Trim(F.AsString);
        if (F.AsString = '') then F.Clear;
      end;
    end;  
end;


procedure PrepareLookUpColumnExtra(Grd: TDBGridEh; const FN: String;
                              const LookUpTableName,
                                    LookUpKeyFld,
                                    LookUpDisplayFld : String;
                                    SQLTEXT : String = '' );
var
  Col  : TColumnEh;
begin
  Col := Grd[FN];
  if Col =  nil  then  exit;
  Col.KeyList.Clear;
  Col.PickList.Clear;
  with CommonData.AnyQuery do
  begin
    if SQLTEXT = '' then  SQLTEXT := GenerateSQLText(LookUpTableName, LookUpKeyFld + ';' + LookUpDisplayFld, '', skSelect);
    SQL.Text := SQLTEXT;
    Open;
    Col.ReadOnly := IsEmpty;
    while  not Eof do
    begin
      Col.KeyList.Add(Fields[0].AsString);
      Col.PickList.Add(Fields[1].AsString);
      Next;
    end;
  end;
end;

end.
