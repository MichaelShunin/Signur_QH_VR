unit GFunctions;

interface

uses
  DB, SysUtils, IBQuery, Windows, Forms, StrUtils;

  //�������� �������

const
  Monthes: array[1..12] of string = ('������','�������','����','������','���',
             '����','����','������','��������','�������','������','�������');

//FormatDateTime('mmmm', Date);

//������� ��� ��������� �������, �� ������������
function GetOilTime(ADate: TDateTime): TDateTime;

//�������� ������������ ����� ����
function CheckDate(AField: TField): boolean;

//�������� ������������ ����� ������ �/� �� �������������� ��������� � ����������� ������
function CheckCarNumber(N: integer): boolean;

//�������� ���������� ����� ������ �� ������ ����� ����� � ��������
function FillBruttoFromNettoBl(ANetto: integer; ABallast: double): integer;


//������������� �/� � �������, ������������ ��� �������������� ���������� ��������� �/� � ������, ��������� � ������ � �.�.
procedure CarRenumeration(AQuery: TIBQuery; AField: TField);

//���� LOCATE
procedure GLocate(ADataSet: TDataSet; const AFieldName: string; AValue: integer);

//��������� ������������� �����
function DCNumberToPhrase(
   N0: comp;                //�����
   Rd0: byte;               //��� �����
   UkrKey: Boolean          //���� ����������� �����
   ): string;

//�������, ��������� �� ������ � �������������� ����� ������� ������� ������������ �����
function DelFromIDList(
   S: string;               //�������� ������
   I: integer               //��������� �����
   ): string;

//������� ���� ��������� ���������, ������������� ����� ���������-������������� � ������ ������
function FindSubStrDec(
  const S: string;          //�������� ������
  Sub: string;              //������, ������� ����
  Dec: char                //������-�����������
  ): boolean;

//������������� ������ � ���� ������������� � ����� ������ (�������� 1234 -> "123,4")
function UploadToStr(AVal: integer): string;

//��������� ����������������� ���������� ��
procedure ProcDBErr(E: EDatabaseError);

//��������� ������ ������ �� ������ � ����������
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
//    �������� �� ��������       //
///////////////////////////////////

function DelFromIDList(S: string; I: integer): string;
var
  XS: string;
  k: integer;
begin
  XS:=IntToStr(I);
  if (Length(XS)=Length(S)) then begin  //���� � ������ ������ ��� �����
    Result:=''; exit;
  end;
  k:=Pos(XS, S);

  if (k=0) //���� �� �������
  then Result:=S
  else begin
     if ((k + Length(XS) - 1)=Length(S)) //���� ������� ����� � �����
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
// ������� �������������� ����� � ������      //
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
        1: S:=S+'��� ';
        2: S:=S+'��_��_ ';
        3: S:=S+'������ ';
        4: S:=S+'��������� ';
        5: S:=S+'�''����� ';
        6: S:=S+'�_����� ';
        7: S:=S+'�_���� ';
        8: S:=S+'�_�_���� ';
        9: S:=S+'���''����� ';
        end
    else
      case W div 100 of
        1: S:=S+'��� ';
        2: S:=S+'������ ';
        3: S:=S+'������ ';
        4: S:=S+'��������� ';
        5: S:=S+'������� ';
        6: S:=S+'�������� ';
        7: S:=S+'������� ';
        8: S:=S+'��������� ';
        9: S:=S+'��������� ';
        end;
    K:=W mod 100;
    if K div 10 = 1 then begin
      if UkrKey then
        case K mod 10 of
          0: S:=S+'������ ';
          1: S:=S+'���������� ';
          2: S:=S+'���������� ';
          3: S:=S+'���������� ';
          4: S:=S+'������������ ';
          5: S:=S+'�''��������� ';
          6: S:=S+'�_��������� ';
          7: S:=S+'�_�������� ';
          8: S:=S+'�_�_�������� ';
          9: S:=S+'���''��������� ';
          end
      else
        case K mod 10 of
          0: S:=S+'������ ';
          1: S:=S+'����������� ';
          2: S:=S+'���������� ';
          3: S:=S+'���������� ';
          4: S:=S+'������������ ';
          5: S:=S+'���������� ';
          6: S:=S+'����������� ';
          7: S:=S+'���������� ';
          8: S:=S+'������������ ';
          9: S:=S+'������������ ';
          end;
      end
    else begin
      if UkrKey then
        case K div 10 of
          2: S:=S+'�������� ';
          3: S:=S+'�������� ';
          4: S:=S+'����� ';
          5: S:=S+'�''������� ';
          6: S:=S+'�_������� ';
          7: S:=S+'�_������ ';
          8: S:=S+'�_�_������ ';
          9: S:=S+'���''������ ';
          end
      else
        case K div 10 of
          2: S:=S+'�������� ';
          3: S:=S+'�������� ';
          4: S:=S+'����� ';
          5: S:=S+'��������� ';
          6: S:=S+'���������� ';
          7: S:=S+'��������� ';
          8: S:=S+'����������� ';
          9: S:=S+'��������� ';
          end;
      case K mod 10 of
        1: if UkrKey then
             case Rd of
               0: S:=S+'���� ';
               1: S:=S+'���� ';
               2: S:=S+'���� ';
               end
           else
             case Rd of
               0: S:=S+'���� ';
               1: S:=S+'���� ';
               2: S:=S+'���� ';
               end;
        2: if UkrKey then begin
             if Rd=1 then S:=S+'��_ '
                     else S:=S+'��� ';
             end
           else begin
             if Rd=1 then S:=S+'��� '
                     else S:=S+'��� ';
             end;
        3: if UkrKey then S:=S+'��� ' else      S:=S+'��� ';
        4: if UkrKey then S:=S+'������ ' else   S:=S+'������ ';
        5: if UkrKey then S:=S+'�''��� ' else   S:=S+'���� ';
        6: if UkrKey then S:=S+'�_��� ' else    S:=S+'����� ';
        7: if UkrKey then S:=S+'�_� ' else      S:=S+'���� ';
        8: if UkrKey then S:=S+'�_�_� ' else    S:=S+'������ ';
        9: if UkrKey then S:=S+'���''��� ' else S:=S+'������ ';
        end;
      end;
    end;
begin
  if N0>999999999999999999.0 then begin
    if UkrKey then Result:='���� ������ �����'
              else Result:='������� ������� �����';
    exit; end;
  if N0=0 then begin
    if UkrKey then Result:='����'
              else Result:='����';
    exit; end;
  if N0<0 then begin
    if UkrKey then Result:='�_�''���� �����'
              else Result:='������������� �����';
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
        0: S:=S+'�������� ';
        1: S:=S+'��������� ';
        2: S:=S+'��������_� ';
        end
    else
      case GetCaseForNumber(Trd) of
        0: S:=S+'��������� ';
        1: S:=S+'���������� ';
        2: S:=S+'����������� ';
        end;
    end;
  if Trn<>0 then begin
    WordToPhrase(Trn,0);
    if UkrKey then
      case GetCaseForNumber(Trn) of
        0: S:=S+'������� ';
        1: S:=S+'�������� ';
        2: S:=S+'�������_� ';
        end
    else
      case GetCaseForNumber(Trn) of
        0: S:=S+'�������� ';
        1: S:=S+'��������� ';
        2: S:=S+'���������� ';
        end;
    end;
  if Mrd<>0 then begin
    WordToPhrase(Mrd,0);
    if UkrKey then
      case GetCaseForNumber(Mrd) of
        0: S:=S+'�_����� ';
        1: S:=S+'�_������ ';
        2: S:=S+'�_�����_� ';
        end
    else
      case GetCaseForNumber(Mrd) of
        0: S:=S+'�������� ';
        1: S:=S+'��������� ';
        2: S:=S+'���������� ';
        end;
    end;
  if Mln<>0 then begin
    WordToPhrase(Mln,0);
    if UkrKey then
      case GetCaseForNumber(Mln) of
        0: S:=S+'�_���� ';
        1: S:=S+'�_����� ';
        2: S:=S+'�_����_� ';
        end
    else
      case GetCaseForNumber(Mln) of
        0: S:=S+'������� ';
        1: S:=S+'�������� ';
        2: S:=S+'��������� ';
        end;
    end;
  if Tsc<>0 then begin
    WordToPhrase(Tsc,1);
    if UkrKey then
      case GetCaseForNumber(Tsc) of
        0: S:=S+'������ ';
        1: S:=S+'�����_ ';
        2: S:=S+'����� ';
        end
    else
      case GetCaseForNumber(Tsc) of
        0: S:=S+'������ ';
        1: S:=S+'������ ';
        2: S:=S+'����� ';
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
  Application.MessageBox(PChar(S), '������', MB_OK or MB_ICONSTOP);
end;  

end.
