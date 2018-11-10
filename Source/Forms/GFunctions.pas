unit GFunctions;

interface

uses
  DB, SysUtils, IBQuery, Windows, Forms, StrUtils;

  //названия месяцев

const
  Monthes: array[1..12] of string = ('январь','февраль','март','апрель','май',
             'июнь','июль','август','сентябрь','октябрь','ноябрь','декабрь');

//FormatDateTime('mmmm', Date);

//функция для нефтяного времени, не используется
function GetOilTime(ADate: TDateTime): TDateTime;

//проверка корректности ввода даты
function CheckDate(AField: TField): boolean;

//проверка корректности ввода номера в/ц по общеизвестному алгоритму с контрольной цифрой
function CheckCarNumber(N: integer): boolean;

//обратное вычисление массы брутто на основе массы нетто и балласта
function FillBruttoFromNettoBl(ANetto: integer; ABallast: double): integer;


//перенумерация в/ц в запросе, используется для восстановления нормальной нумерации в/ц в поезде, накладной и подаче и т.д.
procedure CarRenumeration(AQuery: TIBQuery; AField: TField);

//свой LOCATE
procedure GLocate(ADataSet: TDataSet; const AFieldName: string; AValue: integer);

//словесное представление числа
function DCNumberToPhrase(
   N0: comp;                //число
   Rd0: byte;               //род числа
   UkrKey: Boolean          //ключ украинского языка
   ): string;

//функция, удаляющая из строки с перечисленными через запятую числами определенное число
function DelFromIDList(
   S: string;               //исходная строка
   I: integer               //удаляемое число
   ): string;

//функция ищет вхождение подстроки, расположенной между символами-разделителями в данной строке
function FindSubStrDec(
  const S: string;          //исходная строка
  Sub: string;              //строка, которую ищем
  Dec: char                //символ-разделитель
  ): boolean;

//представление целого в виде вещественного с одним знаком (например 1234 -> "123,4")
function UploadToStr(AVal: integer): string;

//обработка пользовательского исключения БД
procedure ProcDBErr(E: EDatabaseError);

//выделение первой строки из строки с переносами
function GetGridStr(S: string): string;

implementation

function GetOilTime(ADate: TDateTime): TDateTime;
begin
  exit;
end;

function CheckDate(AField: TField): boolean;
var
  XDate: TDateTime;
  XYear, XMonth, XDay: word;
begin
  try
    Result:=true;
    if AField.IsNull then exit;
    XDate:=AField.AsDateTime;
    DecodeDate(XDate, XYear, XMonth, XDay);
    if (XYear<1900) or (XYear>3000) then begin
      Result:=false;
      exit;
    end;
  except
    Result:=false;
  end;
end;

function CheckCarNumber(N: integer): boolean;
var
  X: integer;
begin
  X := (((Trunc(N/10) mod 10)*2) mod 10) + Trunc((Trunc(N/10) mod 10)/5) +
    (((Trunc(N/1000) mod 10)*2) mod 10) + Trunc((Trunc(N/1000) mod 10)/5) +
    (((Trunc(N/100000) mod 10)*2) mod 10) + Trunc((Trunc(N/100000) mod 10)/5) +
    (((Trunc(N/10000000) mod 10)*2) mod 10) + Trunc((Trunc(N/10000000) mod 10)/5) +
    (Trunc(N/100) mod 10) + (Trunc(N/10000)  mod 10) + (Trunc(N/1000000) mod 10);
  if (((10 - (N mod 10)) mod 10) = (X mod 10))
    then Result := true
    else Result := false; 
end;


function FillBruttoFromNettoBl(ANetto: integer; ABallast: double): integer;
var
  XW: integer;
begin
  if (ABallast=0) then begin
    Result:=ANetto;
  end
  else begin
    XW:=ANetto;
    while true do begin
      if (ANetto = XW - Round(XW*ABallast/100)) then begin
        Result:=XW;
        exit;
      end;
      inc(XW);
    end;
  end;
end;



procedure CarRenumeration(AQuery: TIBQuery; AField: TField);
var
  BM: TBookMark;
begin
  try
    BM := AQuery.GetBookMark;
    AQuery.DisableControls;
    AQuery.Close;
    AQuery.Open;
    while not AQuery.EOF do begin
      AQuery.Edit;
      AField.AsInteger := AQuery.RecNo;
      AQuery.Post;
      AQuery.Next;
    end;
    if AQuery.BookMarkValid(BM) then AQuery.GotoBookMark(BM);
  finally
    AQuery.EnableControls;
  end;
end;

procedure GLocate(ADataSet: TDataSet; const AFieldName: string; AValue: integer);
var
  XField: TField;
begin
  XField:=ADataSet.FieldByName(AFieldName);
  if not Assigned(XField) then exit;
  ADataSet.First;
  while not ADataSet.EOF do begin
    if (XField.AsInteger=AValue) then exit;
    ADataSet.Next;
  end;
end;


///////////////////////////////////
//    операции со строками       //
///////////////////////////////////

function DelFromIDList(S: string; I: integer): string;
var
  XS: string;
  k: integer;
begin
  XS:=IntToStr(I);
  if (Length(XS)=Length(S)) then begin  //если в строке только это число
    Result:=''; exit;
  end;
  k:=Pos(XS, S);

  if (k=0) //если не найдена
  then Result:=S
  else begin
     if ((k + Length(XS) - 1)=Length(S)) //если искомое число в конце
       then Delete(S, k-1, Length(XS)+1)
       else Delete(S, k, Length(XS)+1);
     Result:=S;
  end;
end;

function FCharPos(const S: string; const C: Char; const Index: Integer = 1): Integer;
var
  i: integer;
begin
  Result:=0;
  for i:=Index to Length(S) do begin
    if (S[i]=C) then begin
      Result:=i;
      exit;
    end;
  end;
end;

function FindSubStrDec(const S: string; Sub: string; Dec: char): boolean;
var
  k, j: integer;
  XS: string;
  XKey: boolean;
begin
  Result:=false; XKey:=true;
  while (1=1) do begin
    if XKey then begin
      j:=FCharPos(S, Dec, 1);
      if (j=0)
        then exit
      else begin
        XS:=Copy(S, 1, j-1);
        if (XS=Sub) then begin
          Result:=true;
          exit;
        end
        else begin
          XKey:=false;
          k:=j;
        end;
      end;
    end  
    else begin
      j:=FCharPos(S, Dec, k+1);
      if (j=0) then begin
        XS:=Copy(S, k+1, Length(S));
        if (XS=Sub) then Result:=true;
        exit;
      end
      else begin
        XS:=Copy(S, k+1, j-k-1);
        if (XS=Sub) then begin
          Result:=true;
          exit;
        end
        else begin
          k:=j;
        end;
      end;
    end;
  end;
end;

function GetGridStr(S: string): string;
var
  P: integer;
begin
  P := Pos(#13, S);
  if (P>0)
    then Result := LeftStr(S, P-1)
    else Result := S;
end;


////////////////////////////////////////////////
// функции преобразования числа в строку      //
////////////////////////////////////////////////

procedure DivAndMod(var C: comp; D: integer; var Rest: word);
var
  C1,C2: comp;
begin
  if D=0 then begin
    Rest:=0; C:=0; exit; end;
  C1:=C/D; C2:=C1*D;
  if C2>C then begin
    C2:=C2-D; C1:=C1-1; end;
  Rest:=Round(C-C2); C:=C1;
end;

function GetCaseForNumber(N: word): word;
var
  D,E: word;
begin
  D:=(N mod 100) div 10;
  if D=1 then GetCaseForNumber:=2
  else begin
    E:=N mod 10;
    if E=1 then GetCaseForNumber:=0 else
    if (E>=2) and (E<=4) then GetCaseForNumber:=1
                         else GetCaseForNumber:=2;
    end;
  end;

function DCNumberToPhrase(N0: comp; Rd0: byte; UkrKey: Boolean): string;
var
  N: comp;
  Trd,Trn,Mrd,Mln,Tsc,Edn: word;
  S: string;

  procedure WordToPhrase(W: word; Rd: byte);
  var
    K: word;
  begin
    if UkrKey then
      case W div 100 of
        1: S:=S+'сто ';
        2: S:=S+'дв_ст_ ';
        3: S:=S+'триста ';
        4: S:=S+'чотириста ';
        5: S:=S+'п''ятсот ';
        6: S:=S+'ш_стсот ';
        7: S:=S+'с_мсот ';
        8: S:=S+'в_с_мсот ';
        9: S:=S+'дев''ятсот ';
        end
    else
      case W div 100 of
        1: S:=S+'сто ';
        2: S:=S+'двести ';
        3: S:=S+'триста ';
        4: S:=S+'четыреста ';
        5: S:=S+'пятьсот ';
        6: S:=S+'шестьсот ';
        7: S:=S+'семьсот ';
        8: S:=S+'восемьсот ';
        9: S:=S+'девятьсот ';
        end;
    K:=W mod 100;
    if K div 10 = 1 then begin
      if UkrKey then
        case K mod 10 of
          0: S:=S+'десять ';
          1: S:=S+'одинадцять ';
          2: S:=S+'дванадцять ';
          3: S:=S+'тринадцять ';
          4: S:=S+'чотирнадцять ';
          5: S:=S+'п''ятнадцять ';
          6: S:=S+'ш_стнадцять ';
          7: S:=S+'с_мнадцять ';
          8: S:=S+'в_с_мнадцять ';
          9: S:=S+'дев''ятнадцять ';
          end
      else
        case K mod 10 of
          0: S:=S+'десять ';
          1: S:=S+'одиннадцать ';
          2: S:=S+'двенадцать ';
          3: S:=S+'тринадцать ';
          4: S:=S+'четырнадцать ';
          5: S:=S+'пятнадцать ';
          6: S:=S+'шестнадцать ';
          7: S:=S+'семнадцать ';
          8: S:=S+'восемнадцать ';
          9: S:=S+'девятнадцать ';
          end;
      end
    else begin
      if UkrKey then
        case K div 10 of
          2: S:=S+'двадцять ';
          3: S:=S+'тридцять ';
          4: S:=S+'сорок ';
          5: S:=S+'п''ятдесят ';
          6: S:=S+'ш_стдесят ';
          7: S:=S+'с_мдесят ';
          8: S:=S+'в_с_мдесят ';
          9: S:=S+'дев''яносто ';
          end
      else
        case K div 10 of
          2: S:=S+'двадцать ';
          3: S:=S+'тридцать ';
          4: S:=S+'сорок ';
          5: S:=S+'пятьдесят ';
          6: S:=S+'шестьдесят ';
          7: S:=S+'семьдесят ';
          8: S:=S+'восемьдесят ';
          9: S:=S+'девяносто ';
          end;
      case K mod 10 of
        1: if UkrKey then
             case Rd of
               0: S:=S+'один ';
               1: S:=S+'одна ';
               2: S:=S+'одно ';
               end
           else
             case Rd of
               0: S:=S+'один ';
               1: S:=S+'одна ';
               2: S:=S+'одно ';
               end;
        2: if UkrKey then begin
             if Rd=1 then S:=S+'дв_ '
                     else S:=S+'два ';
             end
           else begin
             if Rd=1 then S:=S+'две '
                     else S:=S+'два ';
             end;
        3: if UkrKey then S:=S+'три ' else      S:=S+'три ';
        4: if UkrKey then S:=S+'чотири ' else   S:=S+'четыре ';
        5: if UkrKey then S:=S+'п''ять ' else   S:=S+'пять ';
        6: if UkrKey then S:=S+'ш_сть ' else    S:=S+'шесть ';
        7: if UkrKey then S:=S+'с_м ' else      S:=S+'семь ';
        8: if UkrKey then S:=S+'в_с_м ' else    S:=S+'восемь ';
        9: if UkrKey then S:=S+'дев''ять ' else S:=S+'девять ';
        end;
      end;
    end;
begin
  if N0>999999999999999999.0 then begin
    if UkrKey then Result:='Дуже велике число'
              else Result:='Слишком большое число';
    exit; end;
  if N0=0 then begin
    if UkrKey then Result:='нуль'
              else Result:='ноль';
    exit; end;
  if N0<0 then begin
    if UkrKey then Result:='в_д''ємне число'
              else Result:='отрицательное число';
    exit; end;
  N:=N0;
  DivAndMod(N,1000,Edn);
  DivAndMod(N,1000,Tsc);
  DivAndMod(N,1000,Mln);
  DivAndMod(N,1000,Mrd);
  DivAndMod(N,1000,Trn);
  DivAndMod(N,1000,Trd);
  S:='';
  if Trd<>0 then begin
    WordToPhrase(Trd,0);
    if UkrKey then
      case GetCaseForNumber(Trd) of
        0: S:=S+'трильярд ';
        1: S:=S+'трильярди ';
        2: S:=S+'трильярд_в ';
        end
    else
      case GetCaseForNumber(Trd) of
        0: S:=S+'триллиард ';
        1: S:=S+'триллиарда ';
        2: S:=S+'триллиардов ';
        end;
    end;
  if Trn<>0 then begin
    WordToPhrase(Trn,0);
    if UkrKey then
      case GetCaseForNumber(Trn) of
        0: S:=S+'трильон ';
        1: S:=S+'трильони ';
        2: S:=S+'трильон_в ';
        end
    else
      case GetCaseForNumber(Trn) of
        0: S:=S+'триллион ';
        1: S:=S+'триллиона ';
        2: S:=S+'триллионов ';
        end;
    end;
  if Mrd<>0 then begin
    WordToPhrase(Mrd,0);
    if UkrKey then
      case GetCaseForNumber(Mrd) of
        0: S:=S+'м_льярд ';
        1: S:=S+'м_льярди ';
        2: S:=S+'м_льярд_в ';
        end
    else
      case GetCaseForNumber(Mrd) of
        0: S:=S+'миллиард ';
        1: S:=S+'миллиарда ';
        2: S:=S+'миллиардов ';
        end;
    end;
  if Mln<>0 then begin
    WordToPhrase(Mln,0);
    if UkrKey then
      case GetCaseForNumber(Mln) of
        0: S:=S+'м_льон ';
        1: S:=S+'м_льони ';
        2: S:=S+'м_льон_в ';
        end
    else
      case GetCaseForNumber(Mln) of
        0: S:=S+'миллион ';
        1: S:=S+'миллиона ';
        2: S:=S+'миллионов ';
        end;
    end;
  if Tsc<>0 then begin
    WordToPhrase(Tsc,1);
    if UkrKey then
      case GetCaseForNumber(Tsc) of
        0: S:=S+'тисяча ';
        1: S:=S+'тисяч_ ';
        2: S:=S+'тисяч ';
        end
    else
      case GetCaseForNumber(Tsc) of
        0: S:=S+'тысяча ';
        1: S:=S+'тысячи ';
        2: S:=S+'тысяч ';
        end;
    end;
  if Edn<>0 then begin
    WordToPhrase(Edn,Rd0);
    end;
  Result:=Trim(S);
end;

function UploadToStr(AVal: integer): string;
var
  S: string;
  L: integer;
begin
  S := IntToStr(AVal);
  L := Length(S);
  if (S[L]='0') then begin
    if (L>1)
      then Result := copy(S, 1, L - 1)
      else Result := '0';
  end
  else begin
    if (L>1)
      then Result := copy(S, 1, L - 1) + ',' + S[L]
      else Result := '0,' + S[L];
  end;    
end;

procedure ProcDBErr(E: EDatabaseError);
var
  S: string;
  P: integer;
begin
  S := E.Message;
  P := Pos('FSACS', S);
  if (P>0) then Delete(S, 1, P + 5);
  Application.MessageBox(PChar(S), 'Ошибка', MB_OK or MB_ICONSTOP);
end;  

end.
