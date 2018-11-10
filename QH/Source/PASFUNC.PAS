{$B-}
unit pasfunc;

interface

uses SysUtils, Math, PasCalc;

procedure SetFunctions(PC : TPasCalc);

implementation

function fFloatToStr(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  s : string;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;

  Str(TPVar(A.Items[0])^.Num:0:15,s);
  while s[Length(s)]='0' do s := copy(s,1,Length(s)-1);
  if s[Length(s)]='.' then s := copy(s,1,Length(s)-1);

  R.Str := s;
  R.Numeric := false;
end;


function fIntToStr(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  i : integer;
begin
  Result := fFloatToStr(Sender,A,R);
  if Result then
  begin
    i := Pos('.',R.Str);
    if i>0 then R.Str:=copy(R.Str,1,i-1);
  end;
end;


function fStrToFloat(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var i : integer;
begin
  Result := false;
  if (A.Count<>1) or TPVar(A.Items[0])^.Numeric then Exit;

  Val(Trim(TPVar(A.Items[0])^.Str),R.Num,i);
  if i<>0 then Exit;

  Result := true;
  R.Numeric := true;
end;


function fStrToInt(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or TPVar(A.Items[0])^.Numeric then Exit;

  R.Num := StrToInt(TPVar(A.Items[0])^.Str);

  Result := true;
  R.Numeric := true;
end;


function fVal(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  x : extended;
  i : integer;
begin
  Result := false;

  if (A.Count<>3)
  or TPVar(A.Items[0])^.Numeric
  or (TPVar(A.Items[1])^.Name<>'VAR')
  or (TPVar(A.Items[2])^.Name<>'VAR') then Exit;

  Result := true;

  Val(TPVar(A.Items[0])^.Str,x,i);
  TPVar(A.Items[1])^.Num := x;
  TPVar(A.Items[1])^.Numeric := true;
  TPVar(A.Items[2])^.Num := i;
  TPVar(A.Items[2])^.Numeric := true;
end;


function fCopy(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>3)
  or TPVar(A.Items[0])^.Numeric
  or not TPVar(A.Items[1])^.Numeric
  or not TPVar(A.Items[2])^.Numeric then Exit;

  R.Str := copy(TPVar(A.Items[0])^.Str,
                Trunc(TPVar(A.Items[1])^.Num),
                Trunc(TPVar(A.Items[2])^.Num));

  R.Numeric := false;
  Result := true;
end;


function fPos(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>2)
  or TPVar(A.Items[0])^.Numeric
  or TPVar(A.Items[1])^.Numeric then Exit;

  R.Num := Pos(TPVar(A.Items[0])^.Str,
               TPVar(A.Items[1])^.Str);

  Result := true;
  R.Numeric := true;
end;


function fLength(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or TPVar(A.Items[0])^.Numeric then Exit;
  R.Num := Length(TPVar(A.Items[0])^.Str);
  Result := true;
  R.Numeric := true;
end;


function fInsert(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;

  if (A.Count<>3)
  or TPVar(A.Items[0])^.Numeric
  or TPVar(A.Items[1])^.Numeric
  or (TPVar(A.Items[1])^.Name<>'VAR')
  or not TPVar(A.Items[2])^.Numeric then Exit;

  Result := true;

  Insert(TPVar(A.Items[0])^.Str,
         TPVar(A.Items[1])^.Str,
         Trunc(TPVar(A.Items[1])^.Num));

  R.Str := TPVar(A.Items[1])^.Str;
  R.Numeric := false;
end;


function fDelete(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;

  if (A.Count<>3)
  or TPVar(A.Items[0])^.Numeric
  or (TPVar(A.Items[0])^.Name<>'VAR')
  or not TPVar(A.Items[1])^.Numeric
  or not TPVar(A.Items[2])^.Numeric then Exit;

  Result := true;

  Delete(TPVar(A.Items[0])^.Str,
         Trunc(TPVar(A.Items[1])^.Num),
         Trunc(TPVar(A.Items[1])^.Num));

  R.Str := TPVar(A.Items[0])^.Str;
  R.Numeric := false;
end;


function fTrim(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Str := Trim(TPVar(A.Items[0])^.Str);
  R.Numeric := false;
end;


function fTrimLeft(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Str := TrimLeft(TPVar(A.Items[0])^.Str);
  R.Numeric := false;
end;


function fTrimRight(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Str := TrimRight(TPVar(A.Items[0])^.Str);
  R.Numeric := false;
end;


function fUpperCase(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Str := AnsiUpperCase(TPVar(A.Items[0])^.Str);
  R.Numeric := false;
end;


function fLowerCase(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Str := AnsiLowerCase(TPVar(A.Items[0])^.Str);
  R.Numeric := false;
end;


function fFormat(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  i,n : integer;
  ff : boolean;
  fs,s,fmt : string;
begin
  Result := false;
  if (A.Count<2) or TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  s:=''; fmt:=''; ff:=false; n:=0;
  fs := TPVar(A.Items[0])^.Str;
  for i := 1 to Length(fs) do
  begin
    if fs[i]='%' then ff := true;
    if ff then fmt := fmt + fs[i] else s := s + fs[i];
    if ff and (fs[i] in ['A'..'Z','a'..'z']) then
    begin
      ff := false;
      inc(n);
      if n<A.Count then
      begin
        if TPVar(A.Items[n])^.Numeric then
        begin
          try
            s := s + Format(fmt,[TPVar(A.Items[n])^.Num]);
          except
            s := s + Format(fmt,[Trunc(TPVar(A.Items[n])^.Num)]);
          end;
        end else s := s + Format(fmt,[TPVar(A.Items[n])^.Str]);
      end;
      fmt := '';
    end;
  end;
  R.Str := s+fmt;
  R.Numeric := false;
end;


function fDateToStr(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Str := DateToStr(TPVar(A.Items[0])^.Num);
  R.Numeric := false;
end;


function fStrToDate(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := StrToDate(TPVar(A.Items[0])^.Str);
  R.Numeric := true;
end;


function fFormatDateTime(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>2)
  or TPVar(A.Items[0])^.Numeric
  or not TPVar(A.Items[1])^.Numeric then Exit;
  Result := true;
  R.Str := FormatDateTime(TPVar(A.Items[0])^.Str, TPVar(A.Items[1])^.Num);
  R.Numeric := false;
end;


function fNow(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if A.Count<>0 then Exit;
  Result := true;
  R.Num  := Now;
  R.Numeric := true;
end;


function fDate(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if A.Count<>0 then Exit;
  Result := true;
  R.Num  := Date;
  R.Numeric := true;
end;


function fTime(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if A.Count<>0 then Exit;
  Result := true;
  R.Num  := Time;
  R.Numeric := true;
end;


function fStrToTime(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := StrToTime(TPVar(A.Items[0])^.Str);
  R.Numeric := true;
end;


function fTimeToStr(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Str := TimeToStr(TPVar(A.Items[0])^.Num);
  R.Numeric := false;
end;


function fDayOfWeek(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := DayOfWeek(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fIncMonth(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>2)
  or not TPVar(A.Items[0])^.Numeric
  or not TPVar(A.Items[1])^.Numeric then Exit;
  Result := true;
  R.Num := IncMonth(TPVar(A.Items[0])^.Num,Trunc(TPVar(A.Items[1])^.Num));
  R.Numeric := true;
end;


function fDecodeDate(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  i : integer;
  D,M,Y : word;
begin
  Result := false;
  if A.Count<>4 then Exit;
  for i := 0 to 3 do if not TPVar(A.Items[i])^.Numeric then Exit;
  for i := 1 to 3 do if TPVar(A.Items[i])^.Name<>'VAR' then Exit;
  Result := true;
  DecodeDate(TPVar(A.Items[0])^.Num,Y,M,D);
  TPVar(A.Items[1])^.Num := Y;
  TPVar(A.Items[2])^.Num := M;
  TPVar(A.Items[3])^.Num := D;
  R.Num := TPVar(A.Items[0])^.Num;
  R.Numeric := true;
end;


function fDecodeTime(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  i : integer;
  H,M,S,MS : word;
begin
  Result := false;
  if A.Count<>5 then Exit;
  for i := 0 to 4 do if not TPVar(A.Items[i])^.Numeric then Exit;
  for i := 1 to 4 do if TPVar(A.Items[i])^.Name<>'VAR' then Exit;
  Result := true;
  DecodeTime(TPVar(A.Items[0])^.Num,H,M,S,MS);
  TPVar(A.Items[1])^.Num := H;
  TPVar(A.Items[2])^.Num := M;
  TPVar(A.Items[3])^.Num := S;
  TPVar(A.Items[4])^.Num := MS;
  R.Num := TPVar(A.Items[0])^.Num;
  R.Numeric := true;
end;


function fEncodeDate(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  i : integer;
begin
  Result := false;
  if A.Count<>3 then Exit;
  for i := 0 to 2 do if not TPVar(A.Items[i])^.Numeric then Exit;
  Result := true;
  R.Num := EncodeDate(Trunc(TPVar(A.Items[0])^.Num),
                      Trunc(TPVar(A.Items[1])^.Num),
                      Trunc(TPVar(A.Items[2])^.Num));
  R.Numeric := true;
end;


function fEncodeTime(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  i : integer;
begin
  Result := false;
  if A.Count<>4 then Exit;
  for i := 0 to 5 do if not TPVar(A.Items[i])^.Numeric then Exit;
  Result := true;
  R.Num := EncodeTime(Trunc(TPVar(A.Items[0])^.Num),
                      Trunc(TPVar(A.Items[1])^.Num),
                      Trunc(TPVar(A.Items[2])^.Num),
                      Trunc(TPVar(A.Items[3])^.Num));
  R.Numeric := true;
end;


function fSin(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Sin(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fCos(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Cos(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fTan(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Tan(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fArcSin(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := ArcSin(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fArcCos(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := ArcCos(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fArcTan(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := ArcTan(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fExp(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Exp(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fLn(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Ln(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fIntPower(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>2)
  or not TPVar(A.Items[0])^.Numeric
  or not TPVar(A.Items[1])^.Numeric then Exit;
  Result := true;
  R.Num := IntPower(TPVar(A.Items[0])^.Num,Trunc(TPVar(A.Items[1])^.Num));
  R.Numeric := true;
end;


function fSqr(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Sqr(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fSqrt(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Sqrt(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fAbs(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Abs(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fInt(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Int(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fFrac(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Frac(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fRound(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Round(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fTrunc(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Trunc(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fCeil(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Ceil(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fFloor(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<>1) or not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  R.Num := Floor(TPVar(A.Items[0])^.Num);
  R.Numeric := true;
end;


function fMax(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  i : integer;
  N : string;
begin
  Result := false;
  if A.Count=0 then Exit;

  N := R.Name;
  R := TPVar(A.Items[0])^;
  R.Name := N;

  for i:=0 to A.Count-1 do
  begin
    if R.Numeric<>TPVar(A.Items[i])^.Numeric then Exit;

    if R.Numeric then
    begin
      if TPVar(A.Items[i])^.Num>R.Num
      then R.Num := TPVar(A.Items[i])^.Num;
    end else
    begin
      if TPVar(A.Items[i])^.Str>R.Str
      then R.Str := TPVar(A.Items[i])^.Str;
    end;
  end;
  Result := true;
end;


function fMin(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  i : integer;
  N : string;
begin
  Result := false;
  if A.Count=0 then Exit;

  N := R.Name;
  R := TPVar(A.Items[0])^;
  R.Name := N;

  for i:=0 to A.Count-1 do
  begin
    if R.Numeric<>TPVar(A.Items[i])^.Numeric then Exit;

    if R.Numeric then
    begin
      if TPVar(A.Items[i])^.Num<R.Num
      then R.Num := TPVar(A.Items[i])^.Num;
    end else
    begin
      if TPVar(A.Items[i])^.Str<R.Str
      then R.Str := TPVar(A.Items[i])^.Str;
    end;
  end;
  Result := true;
end;


function fInc(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<1) or (A.Count>2) then Exit;
  if A.Count=1 then
  begin
    if TPVar(A.Items[0])^.Numeric=false then Exit;
    TPVar(A.Items[0])^.Num:=TPVar(A.Items[0])^.Num+1;
  end else
  begin
    if (TPVar(A.Items[0])^.Numeric=false) or (TPVar(A.Items[1])^.Numeric=false) then Exit;
    TPVar(A.Items[0])^.Num:=TPVar(A.Items[0])^.Num+TPVar(A.Items[1])^.Num;
  end;
  Result:=true;
  R.Numeric:=true;
end;


function fDec(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  Result := false;
  if (A.Count<1) or (A.Count>2) then Exit;
  if A.Count=1 then
  begin
    if TPVar(A.Items[0])^.Numeric=false then Exit;
    TPVar(A.Items[0])^.Num:=TPVar(A.Items[0])^.Num-1;
  end else
  begin
    if (TPVar(A.Items[0])^.Numeric=false) or (TPVar(A.Items[1])^.Numeric=false) then Exit;
    TPVar(A.Items[0])^.Num:=TPVar(A.Items[0])^.Num-TPVar(A.Items[1])^.Num;
  end;
  Result:=true;
  R.Numeric:=true;
end;


function fSetVar(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  s : string;
begin
  // Set simple variable (not array) value
  Result := false;
  if (A.Count<>2) or TPVar(A.Items[0])^.Numeric then Exit;
  s := AnsiUpperCase(TPVar(A.Items[0])^.Str);
  if TPVar(A.Items[1])^.Numeric
  then Result := (Sender as TPasCalc).SetVarNum(s,TPVar(A.Items[1])^.Num)
  else Result := (Sender as TPasCalc).SetVarStr(s,TPVar(A.Items[1])^.Str);
end;


function fGetVar(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
begin
  // Get variable value
  Result := false;
  if (A.Count<>1) then Exit;
  Result := (Sender as TPasCalc).VarByName(AnsiUpperCase(TPVar(A.Items[0])^.Str),R);
end;


function fDecode(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  i : integer;
  N : string;
  X : TVar;
begin
  Result := false;
  if A.Count<3 then Exit;

  X := TPVar(A.Items[0])^;
  N := R.Name;

  i := 1;
  while i<A.Count-1 do
  begin
    if X.Numeric=TPVar(A.Items[i])^.Numeric then
    begin
      if X.Numeric then
      begin
        if TPVar(A.Items[i])^.Num=X.Num then
        begin
          R := TPVar(A.Items[i+1])^;
          R.Name := N;
          Result :=true;
          Exit;
        end;
      end else
      begin
        if TPVar(A.Items[i])^.Str=X.Str then
        begin
          R := TPVar(A.Items[i+1])^;
          R.Name := N;
          Result :=true;
          Exit;
        end;
      end;
    end;
    i := i + 2;
  end;
  if not Odd (A.Count) then
  begin
    R := TPVar(A.Items[A.Count-1])^;
    R.Name := N;
    Result := true;
  end;
end;


function fYearDays(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var y,m,d : word;
begin
  Result := false;
  if A.Count<>1 then Exit;
  if not TPVar(A.Items[0])^.Numeric then Exit;
  Result := true;
  DecodeDate(TPVar(A.Items[0])^.Num,y,m,d);
  if IsLeapYear(y) then R.Num := 366 else R.Num := 365;
  R.Numeric := true;
end;


function fYearFrac(Sender:TObject; var A:TVarList; var R:TVar) : boolean;
var
  x : extended;
  dt1,dt2,ds,de : TDateTime;
  y1,m1,d1,
  y2,m2,d2,i,n : word;
begin
  Result := false;
  if A.Count<>2 then Exit;
  if not TPVar(A.Items[0])^.Numeric
  or not TPVar(A.Items[1])^.Numeric then Exit;

  Result := true;

  dt1 := TPVar(A.Items[0])^.Num;
  dt2 := TPVar(A.Items[1])^.Num;

  if dt1>dt2 then
  begin
    dt1 := dt2;
    dt2 := TPVar(A.Items[0])^.Num;
  end;

  DecodeDate(dt1,y1,m1,d1);
  DecodeDate(dt2,y2,m2,d2);

  x := 0;
  for i := y1 to y2 do
  begin
    if i=y1 then ds := dt1 else ds := EncodeDate(i,1,1);
    if i=y2 then de := dt2 else de := EncodeDate(i+1,1,1);
    if IsLeapYear(i) then n := 366 else n := 365;
    x := x + (de-ds)/n;
  end;

  R.Num := x;
  R.Numeric := true;
end;


procedure SetFunctions(PC : TPasCalc);
begin
  // String routines
  PC.SetFunction('Val',            @fVal);
  PC.SetFunction('IntToStr',       @fIntToStr);
  PC.SetFunction('StrToInt',       @fStrToInt);
  PC.SetFunction('FloatToStr',     @fFloatToStr);
  PC.SetFunction('StrToFloat',     @fStrToFloat);
  PC.SetFunction('Copy',           @fCopy);
  PC.SetFunction('Pos',            @fPos);
  PC.SetFunction('Length',         @fLength);
  PC.SetFunction('Insert',         @fInsert);
  PC.SetFunction('Delete',         @fDelete);
  PC.SetFunction('Trim',           @fTrim);
  PC.SetFunction('TrimLeft',       @fTrimLeft);
  PC.SetFunction('TrimRight',      @fTrimRight);
  PC.SetFunction('UpperCase',      @fUpperCase);
  PC.SetFunction('LowerCase',      @fLowerCase);
  PC.SetFunction('Format',         @fFormat);

  // Date/time routines
  PC.SetFunction('Now',            @fNow);
  PC.SetFunction('Date',           @fDate);
  PC.SetFunction('Time',           @fTime);
  PC.SetFunction('DateToStr',      @fDateToStr);
  PC.SetFunction('StrToDate',      @fStrToDate);
  PC.SetFunction('TimeToStr',      @fTimeToStr);
  PC.SetFunction('StrToTime',      @fStrToTime);
  PC.SetFunction('FormatDateTime', @fFormatDateTime);
  PC.SetFunction('DayOfWeek',      @fDayOfWeek);
  PC.SetFunction('IncMonth',       @fIncMonth);
  PC.SetFunction('DecodeDate',     @fDecodeDate);
  PC.SetFunction('DecodeTime',     @fDecodeTime);
  PC.SetFunction('EncodeDate',     @fEncodeDate);
  PC.SetFunction('EncodeTime',     @fEncodeTime);

  // Arithmetic routines
  PC.SetFunction('Abs',            @fAbs);
  PC.SetFunction('Int',            @fInt);
  PC.SetFunction('Frac',           @fFrac);
  PC.SetFunction('Round',          @fRound);
  PC.SetFunction('Ceil',           @fCeil);
  PC.SetFunction('Floor',          @fFloor);
  PC.SetFunction('Trunc',          @fTrunc);
  PC.SetFunction('Sin',            @fSin);
  PC.SetFunction('Cos',            @fCos);
  PC.SetFunction('Tan',            @fTan);
  PC.SetFunction('ArcSin',         @fArcSin);
  PC.SetFunction('ArcCos',         @fArcCos);
  PC.SetFunction('ArcTan',         @fArcTan);
  PC.SetFunction('Exp',            @fExp);
  PC.SetFunction('Ln',             @fLn);
  PC.SetFunction('IntPower',       @fIntPower);
  PC.SetFunction('Sqr',            @fSqr);
  PC.SetFunction('Sqrt',           @fSqrt);
  PC.SetFunction('Inc',            @fInc);
  PC.SetFunction('Dec',            @fDec);

  // PASCALC functions
  PC.SetFunction('Min',            @fMin);
  PC.SetFunction('Max',            @fMax);
  PC.SetFunction('GetVar',         @fGetVar);
  PC.SetFunction('SetVar',         @fSetVar);
  PC.SetFunction('Decode',         @fDecode);
  PC.SetFunction('YearDays',       @fYearDays);
  PC.SetFunction('YearFrac',       @fYearFrac);
end;

end.


