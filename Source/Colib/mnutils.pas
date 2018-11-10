unit mnutils;
interface



uses
{$IFDEF MSWINDOWS}
  WinSock,Windows,Graphics,Controls,Buttons,Forms,StdCtrls,ExtCtrls,mask,Dialogs,menus,
  SysUtils,
  Types,
  ActnList,grids,ValEdit,ComCtrls,
{$ELSE}
  QActnList,SysUtils,QGraphics,QControls,QButtons,QForms,QStdCtrls,QExtCtrls,Qmask,QDialogs,Qmenus,QComCtrls,
{$ENDIF}
  Variants,DB,Contnrs,XMLIntf,XMLDoc,iniFiles,strutils,Math,Classes;
//  IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer,IdSocketHandle,IdUDPClient;
type
   TBitBtnSet = Set of TBitBtnKind;
   TVarDyn    = Array of Variant;
   TNotifyProc =  procedure(Sender: TObject);
   TSimpleProc  =  procedure;
{$IFNDEF RX_D4}
  TSysCharSet = set of Char;
{$ENDIF}
  TCharSet = TSysCharSet;

{$IFDEF MSWINDOWS}

{$ELSE}
  TControlClass=class of TControl;
{$ENDIF}


 TSisPanel=class(TPanel)
   function GetButtonByCap(const  ACap : string): TBitBtn;
 end;

  TDummyClass=class
    Proc : TNotifyProc;
    SimpleProc : TSimpleProc;
    procedure NotifyDataEvent(Sender: TDataSet);
    procedure ProcedureOfObject;

  end;


const
   btnDefault     = [bkOk,bkCancel];

//---------------------  Misc  -------------------------------------------
procedure FillNull(var X);

//---------------------  File---------------------------------------------------
type  IFileIterator=Interface
        procedure Reset(const Path: string; Attr: Integer);
        function  Eof :  Boolean;
        function  Next: String;
        function  GetItem : String;
      end;

      TFileIterator=class(TInterfacedObject,IFileIterator)
      private
        srActivated : Boolean;
        sr: TSearchRec;
        fEof : Boolean;
      public
        Destructor Destroy;override;
        procedure AfterConstruction;override;
        procedure Reset(const Path: string; Attr: Integer);
        function  Next: String;
        function  Eof :  Boolean;
        function  GetItem : String;
      end;
function GetFileIterator(const Path: string; Attr: Integer) : IFileIterator;
function FindFile(const AFileName: string): string;
//--------------------- String Utils -------------------------------------------
type  IStringIterator=Interface
        procedure Reset(const AItems :String; ADelim : Char=';');
        function  Eof :  Boolean;
        function  Next: String;
        function  Count: Integer;
        function  GetItem  : String;
        function  GetIndex : Integer;
      end;

     TStringIterator=class(TInterfacedObject,IStringIterator)
     private
        FIndex : Integer; 
        FDelim : Char;
        FItems : String;
        FItem  : String;
        FItemsLn : Integer;
        FPos   : Integer;
     public
        function  Count: Integer;
        procedure Reset(const AItems :String; ADelim : Char=';');
        function  Eof  :  Boolean;
        function  Next : String;
        function  GetItem : String;
        function  GetIndex : Integer;
      end;

function  GetStringIterator(const AItems :String; ADelim : Char=';') : IStringIterator;
function  SplitString(Src : String; const Delim: string;var Dst1, Dst2: string): Boolean;
function  StrToFloatEx(StrValue: string): double;
function  DblQuotedStr(const AValue : String): String;
function  GetFieldIndex(const AFieldNames, AFieldName : string): integer;
function  FieldInList(const AList,AFieldName: string):Boolean;
Function  StringWithDelim(const AStrings: array of string; const Delim: string; AddEmpty: Boolean = False): string;
function  IntToBase32(Value: Integer; Digits: Integer): string;
function  TranslateRuToLat(const Value: String): String;
function  WrapTextEx(const Line, BreakStr: string; const BreakChars: TSysCharSet;
  MaxCol: Integer;var LineCount : integer): string;
Function  WrapTextByWordCount(const AValue: string; WordCount: integer): string;
function  ExtractString(const Delim1, Delim2 : string;const Src: string ): string;
function  SetMarked(const Src: string;  const AMark : string; const Params : string = ''): string;
function  ExtractMarked(const Src: string;  const AMark : string): string;
Function  GetNames(List : TStringList): String;
function  IncString(AValue: string; Digits : Byte) : string;
procedure StrCopyEx(var Buf : array of char;const AText : String);
function  Encrypt_Decrypt(const Key: string; AText : PChar; TextLn : Integer; Encrypt: Boolean): String;
function  RandomString(Ln : Integer): String;
function  PosCaseIns(const SubStr, S: string; Offset: Cardinal = 1): Integer;
function  TransformString(const FormatStr, Delim, AValue: string; AValueDelim : Char = ';'): string;
function  GetNameByValue(Items: TStringList;const Value : String): String;
procedure LoadSectionFromStrings(const Sec: String;Src,Dst: TStrings ); // Загружает содежимое секции вида [Sec]
type
 TCryptStrings=class(TStringList)
 private
   FKey      : String;
 public
   procedure SaveToStream(Stream: TStream); override;
   procedure LoadFromStream(Stream: TStream); override;
   procedure LoadSection(const Sec: String; Items : TStrings);
   function  LoadSectionAsText(const Sec: String) : String;
   property  Key : String read FKey write FKey;
 end;



//------------------------------------------------------------------------------



function  FontStyleToInt(Value: TFontStyles) : integer;
function  IntToFontStyle(Value: integer) : TFontStyles;
function  GetCmdLineValue(const Switch: string;
                         const DefValue: string = '';
                         const Chars: TSysCharSet=['-','/'];
                         IgnoreCase: Boolean =  True): string;


procedure ShowPopUpMenu(Btn: TControl; Menu : TPopupMenu);
function  ShowFormModal(fc : TFormClass; const frmid : String= ''):Boolean;
function  AddButton(Parent: TWinControl;Kind: TBitBtnKind; const Cap : string='';Tag : integer = 0): TBitBtn;
function  AddButtonAtButtonPanel(AForm: TForm;Kind: TBitBtnKind; const Cap : string='';Tag : integer = 0): TBitBtn;
function  AddStandartButtonPanel(AForm: TForm; const btnOKCap : string = '';Buttons: TBitBtnSet= btnDefault): TSisPanel;
function  CreateSimpleForm(MainControl: TControlClass;Buttons: TBitBtnSet= btnDefault):TForm;
function  ShowMemoForm(const ACap : String;  var AText : String;const MaxLen :  Integer = -1 ):Boolean;
function  ShowInputForm(const ACap : String;const mask : String;  var AText : String):Boolean;
function  ShowValueEditor(const ACap : String;  var AText : String;ReadOnly: Boolean = True):Boolean;

//--------------------  Variant Utils ------------------------------------------
function VarCompare(const V1,V2: variant): Integer;
function VarIsEqual(const V1,V2: variant): Boolean;
function VarToFloat(const V : Variant): double;
function VarToInt(const V : Variant): Integer;
function VarToIntDef(const V : Variant;Def : Integer): Integer;
function VarArrayToVar(const V: Array of Variant): Variant;
procedure VarArrayToStrings(const V: Array of Variant; Strings : TStrings);
function VarArrayToString(const V: Array of Variant): String;
function StringToVarArray(const S: String): TVarDyn;
function VarToVarArray(const V:  Variant): TVarDyn;
function VarAsDate(const V:  Variant): Variant;
function VarNow : Variant;
procedure VarSetValueByName(var VarArray : Variant; const ANames: string; const AName : string; const V: variant );
function  VarGetValueByName(VarArray : Variant; const ANames: string; const AName : string ): Variant;
function  COALLESCE(const Args : Array of variant): Variant;
procedure VarAddItemAndRedimArray(var V : Variant; Item: Variant);
procedure VarAddArrayAndRedimArray(var V : Variant; VarDyn: TVarDyn);
function VarLoadXML(node : ixmlNode): Variant;
//------------------------------------------------------------------------------
procedure LoadWindowPosition(Form :  TForm; const Id : string);
procedure SaveWindowPosition(Form :  TForm; const Id : string);
//------------------------------------------------------------------------------
//------------------ TCollectionEx   ----------------------------------------
//------------------------------------------------------------------------------

type
  TStringArray = array of String;

  TCollectionExItem= class(TCollectionItem)
    procedure  AssignToXMLNode(node : IXMLNode; DisplayText : Boolean = False); virtual; abstract;
    procedure  AssignFromXMLNode(node : IXMLNode; DisplayText : Boolean = False); virtual; abstract;
    class procedure  LoadPropertyNames(ANames :  TStrings); virtual; abstract;
    function   Edit: Boolean; virtual;
    procedure LoadPickList(const AKey : String;  List : TStrings); virtual; abstract;
  end;

  TCollectionExItemClass = class of TCollectionExItem;

  TLoadPickListProc  =procedure(const AKey : String;  List : TStrings);

  TCollectionEx= class(TCollection)
  private
    FONLoadPickListProc  : TLoadPickListProc;
  protected
    function  GetAsXMLText: String;
    procedure SetAsXMLText(AText : String);
  public
    procedure LoadFromXMLNode(Node: IXMLNode);
    procedure SaveToXMLNode(Node: IXMLNode);
    procedure LoadFromXMLDoc(Doc: IXMLDocument);
    procedure SaveToXMLDoc(Doc: IXMLDocument);
    property  AsXMLText: String read GetAsXMLText write SetAsXMLText;
    property  ONLoadPickListProc  : TLoadPickListProc read FONLoadPickListProc  write FONLoadPickListProc;
  end;

//------------------------------------------------------------------------------
//--------------------------  NET -----------------------------------------------
//------------------------------------------------------------------------------
const
  BufferSize =  1000;
type
  TSimplePacket=packed record
    CipherKey : array [0..20] of char;
    DataLn    : Word;
    Data      : array [0..BufferSize] of char;
    CRC       : Integer;
    Error     : Boolean;
  end;
procedure PackPacket(var Pkt : TSimplePacket;const CipherKey, Data : String);
procedure PackError(var Pkt : TSimplePacket;const CipherKey, Error : String);
Function  UnPackPacket(const Pkt : TSimplePacket) : String;
//------------------------------------------------------------------------------
function  StartProgram(CL: string; ShowWindow : Boolean =  True; TimeOut : Integer =  INFINITE) : Cardinal;
//------------------------------------------------------------------------------

{$IFDEF MSWINDOWS}
function  CallUDPServer(var Pct : TSimplePacket;var HOST : string;  APort : Integer; ATimeOut : Integer ): Boolean;
function  GetRemoteValue(const key, cmd : String; Port : Integer;  var Value : String) : Boolean;
{$ENDIF}
//------------------------------------------------------------------------------
type 
TSQL_Kind = (skNone,skSelect,skInsert,skUpdate,skDelete);

function GenerateSQLText(const TableName,Fields,KeyFields: string; SQL_Kind: TSQL_Kind): string;


type
  TDocCollection=class;

  TDocument=class(TComponent)
  private
    FTitle  : String;
    FID     : String;
  public
    class function LoadSourceList : TVarDyn; virtual;abstract;
    procedure Load(const ID : String); virtual;abstract;
    procedure Save; virtual;abstract;
    function  Delete: Boolean; virtual;abstract;
    function  Edit: Boolean; virtual;abstract;

    property  Title  : String read FTitle write FTitle;
  end;

  TDocumentClass=class of TDocument;


  TDocCollection=class(TComponent)
  private
    FOnOpen : TNotifyEvent;
    FSelected : TDocument;
    FList : TObjectList;
//    FDocumentClass : TDocumentClass;
    procedure ControlClick(Sender : TObject);
    function GetDocument(idx : Integer) : TDocument;
    procedure SetSelected(ASelected : TDocument);
  public
    EditAction,
    InsertAction,
    DeleteAction : TAction;
    Constructor Create(AOwner : TComponent);override;
    Destructor  Destroy;override;
    function   GetDocumentClass : TDocumentClass; virtual; abstract;
    procedure  Load;
    procedure  Open(Sender : TObject);
    function   Edit: Boolean;
    function   Insert: Boolean;
    procedure  Delete;
    property   Selected : TDocument read FSelected write SetSelected;
    property   List :  TObjectList read FList;
    property   Items[idx : Integer] : TDocument read GetDocument; default;
    procedure  InspectAction;
  published
    property   OnOpen : TNotifyEvent read FOnOpen write FOnOpen;
  end;


function WordCount(const S: string; const WordDelims: TCharSet): Integer;

var
  ini  : TIniFile;
//------------------------------------------------------------------------------

implementation
//------------------------------------------------------------------------------
function GetFileIterator(const Path: string; Attr: Integer) : IFileIterator;
begin
  result := IFileIterator(TFileIterator.Create);
  result.Reset(Path, Attr);
end;
//------------------------------------------------------------------------------
procedure TFileIterator.AfterConstruction;
begin
  srActivated :=  False;
end;
//------------------------------------------------------------------------------
Destructor TFileIterator.Destroy;
begin
  If srActivated then SysUtils.FindClose(sr);
  Inherited;
end;
//------------------------------------------------------------------------------
procedure TFileIterator.Reset(const Path: string; Attr: Integer);
begin
  If srActivated then SysUtils.FindClose(sr);
  srActivated := FindFirst(Path, faArchive, sr) = 0;
  fEof := not srActivated; 
end;
//------------------------------------------------------------------------------
function  TFileIterator.Eof :  Boolean;
begin
  result := fEof;
end;
//------------------------------------------------------------------------------
function  TFileIterator.Next: String;
begin
{$IFDEF MSWINDOWS}
  result := sr.FindData.cFileName;
{$ELSE}
  result := sr.Name;
{$ENDIF}
  fEof := FindNext(sr) <> 0;
end;
//------------------------------------------------------------------------------
function  TFileIterator.GetItem : String;
begin
{$IFDEF MSWINDOWS}
  result := sr.FindData.cFileName;
{$ELSE}
  result := sr.Name;
{$ENDIF}
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function SplitString(Src : String;const Delim: string;var Dst1, Dst2: string): Boolean;
var
  p : integer;
begin
  Dst1 := ''; 
  Dst2 := '';
  p := Pos(Delim, Src);
  if p>0 then
  begin
    Dst1 := Trim(Copy(Src, 1, p-1));
    Dst2 := Trim(Copy(Src, p+1, Length(Src)));
    result :=  True;
  end else
    result :=  False;
end;
//------------------------------------------------------------------------------
function  DblQuotedStr(const AValue : String): String;
begin
  result := '"' + AValue + '"';
end;
//------------------------------------------------------------------------------
function GetFieldIndex(const AFieldNames, AFieldName : string): integer;
var
  i : integer;
  j : integer;
  s : string;
begin
  i := 1;
  j := 0;
  result := -1;
  while  i <= Length(AFieldNames) do
  begin
    s := ExtractFieldName(AFieldNames,i);
    if AnsiSameText(s,AFieldName) then
    begin
      result := j;
      Break;
    end;
    Inc(j);
  end;
end;
//------------------------------------------------------------------------------
function FieldInList(const AList,AFieldName: string):Boolean;
var
  i: integer;
  s : string;
begin
  result :=  false;
  i:= 1;
  while i <= Length(AList) do
  begin
    s := ExtractFieldName(AList,i);
    if AnsiSameText(s, AFieldName)   then result :=  true;
    if result then break;
  end;
end;
//------------------------------------------------------------------------------
function IntToBase32(Value: Integer; Digits: Integer): string;
var
  mod_ : integer;
  offset : Byte;
begin
  result := '';
  repeat
    mod_  := Value Mod 32;
    Value := Value Div 32;
    offset := 48;
    if Mod_ > 9 then Inc(offset,7);
    result := Chr(Offset + Mod_) + result;
    Dec(Digits);
  until Value = 0;
  if Digits > 0 then Result := DupeString('0',Digits) + Result;
end;
//------------------------------------------------------------------------------
function TranslateRuToLat(const Value: String): String;
var
  i : Integer;
  c : Char;
  s : String;
begin
  result := '';
  for i := 1 to Length(Value)  do
  begin
    c := AnsiLowerCase(Value[i])[1];
    case c of
      'а': s := 'a';
      'б': s := 'b';
      'в': s := 'v';
      'г': s := 'g';
      'д': s := 'd';
      'е': s := 'e';
      'ж': s := 'z';
      'з': s := 'z';
      'и': s := 'i';
      'й': s := 'i';
      'к': s := 'k';
      'л': s := 'l';
      'м': s := 'm';
      'н': s := 'n';
      'о': s := 'o';
      'п': s := 'p';
      'р': s := 'r';
      'с': s := 's';
      'т': s := 't';
      'у': s := 'u';
      'ф': s := 'v';
      'х': s := 'h';
      'ц': s := 'z';
      'ч': s := 'z';
      'ш': s := 'sh';
      'щ': s := 'ssh';
      'ь': s := 'X';
      'ъ': s := 'XX';
      'э': s := 'ee';
      'ю': s := 'yu';
      'я': s := 'ya';
      'a'..'z',
      '0'..'9' : s := c;
       else
             s := 'X';
    end;
    result := result + s;
  end;
end;
//------------------------------------------------------------------------------
Function WrapTextByWordCount(const AValue: string; WordCount: integer): string;
var
  i : integer;
  i_Space : integer;
  WC : integer;
  Space : Boolean;
  AddS  : string;
begin
  WC := 0;
  i_Space := 0;
  Space :=  True;
  for i:= 1 to Length(AValue) do
  begin
    if AValue[i] = ' ' then
    begin
      if not Space then i_Space:=i;
      Space :=  True;
    end else
    begin
      Space :=  False;
    end;

    if (i_Space=i) then {Начало пробела}
    begin
      Inc( WC );
      if WC = WordCount then
      begin
        AddS := sLineBreak;
        WC := 0;
      end else
        AddS := AValue[I];
    end else
    begin
      if (WC>0) or (Not Space) then  AddS := AValue[I];
    end;
    Result := Result + AddS;
  end;
end;

//------------------------------------------------------------------------------
function WrapTextEx(const Line, BreakStr: string; const BreakChars: TSysCharSet;
  MaxCol: Integer;var LineCount : integer): string;
var
  i : integer;
begin
  Result := WrapText(Line,BreakStr,BreakChars,MaxCol);
  i := 0;
  LineCount := 0;
  repeat
    Inc(LineCount);
    Inc(i);
    i := PosEx(BreakStr,Result,i);
  until i = 0;
end;
//------------------------------------------------------------------------------
function ExtractString(const Delim1, Delim2 : string;const Src: string ): string;
var
  t1,t2     : integer;
  l1  : integer;
begin
  t1 := Pos(Delim1,Src);
  t2 := 0;
  l1  := Length(Delim1);
  if t1>0 then t2 := Pos(Delim2,Copy(Src,t1+ l1,Length(Src)) );
  if (t1 > 0) and (t2 > 0)
    then result :=  Copy( Src,t1+l1,t2-1)
    else result :=  '';
end;
//------------------------------------------------------------------------------
function SetMarked(const Src: string;  const AMark : string; const Params : string = ''): string;
begin
  result := Format('<%s %s>%s</%0:s>',[AMark,Params,Src]);
end;
//------------------------------------------------------------------------------
function ExtractMarked(const Src: string;  const AMark : string): string;
begin
  result := Trim(ExtractString( Format('<%s>',[AMark]),Format('</%s>',[AMark]),Src));
  if result = '' then
    result := Trim(ExtractString( Format('<%s >',[AMark]),Format('</%s>',[AMark]),Src));
end;
//------------------------------------------------------------------------------
Function GetNames(List : TStringList): String;
var
  i : Integer;
begin
  result := '';
  for i:=0  to List.Count-1 do
    result := StringWithDelim([result,List.Names[i]],#13);
end;
//------------------------------------------------------------------------------
function  PosCaseIns(const SubStr, S: string; Offset: Cardinal = 1): Integer;
begin
  result := PosEx(AnsiUpperCase(SubStr),AnsiUpperCase(S),Offset);
end;
//------------------------------------------------------------------------------
function TransformString(const FormatStr, Delim, AValue: string;  AValueDelim : Char = ';'): string;
var
  sit : IStringIterator;
begin
  sit := GetStringIterator(AValue,AValueDelim);
  result := '';
  while not sit.Eof do
    result:= result + Format(FormatStr,[sit.Next]) + Delim;
  SetLength(result,Length(result)-Length(Delim));
end;
//------------------------------------------------------------------------------
function GetNameByValue(Items: TStringList;const Value : String): String;
var
  I : Integer;
begin
  for I:= 0 to Items.Count-1 do
  if AnsiSameText(Items.ValueFromIndex[i],Value) then
  begin
    result := Items.Names[i];
    Break;
  end;
end;
//------------------------------------------------------------------------------
procedure LoadSectionFromStrings(const Sec: String;Src,Dst: TStrings );
var
  i : Integer;
  inside :  Boolean;
  s : String;
begin
  inside :=  False;
  for i:= 0  to Src.Count-1  do
  begin
    if  pos(';',trim(Src[i])) =1 then continue; 
    if AnsiSameText('[' + Sec + ']',Trim(Src[i])) then
    begin
      inside :=  True;
      Continue;
    end;
    s := Trim(Src[i]);
    if Inside and ('[' + ExtractString('[',']',s) + ']' = s) then exit; // Строка вида [****].
    if Inside then Dst.Add(S)
  end;
end;
//------------------------------------------------------------------------------
procedure TCryptStrings.SaveToStream(Stream: TStream);
var
  S: string;
begin
  S := GetTextStr;
  Encrypt_Decrypt(Key, PChar(S), Length(S), True);
  Stream.WriteBuffer(Pointer(S)^, Length(S));
end;
//------------------------------------------------------------------------------
procedure TCryptStrings.LoadFromStream(Stream: TStream);
var
  Size: Integer;
  S: string;
begin
  BeginUpdate;
  try
    Size := Stream.Size - Stream.Position;
    SetString(S, nil, Size);
    Stream.Read(Pointer(S)^, Size);
    Encrypt_Decrypt(Key, PChar(S), length(S), False);
    SetTextStr(S);
  finally
    EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TCryptStrings.LoadSection(const Sec: String; Items : TStrings);
begin
  LoadSectionFromStrings(Sec,self,Items);
end;
//------------------------------------------------------------------------------
function  TCryptStrings.LoadSectionAsText(const Sec: String) : String;
var
 items : TStringList;
begin
 items := TStringList.Create;
 try
   LoadSection(Sec,items);
   Result := items.Text;
 finally
   items.Free;
 end;
end;
//------------------------------------------------------------------------------
function IncString(AValue: string; Digits : Byte) : string;
var
  Nomer : integer;
begin
  while  ( Length(AValue)>0 ) and (AValue[1]='0') do
    AValue := Copy(AValue, 2, Length(AValue));
  Nomer := StrToIntDef( AValue, 0);
  Inc( Nomer );
  result := Format('%1.*d',[Digits,Nomer]);
end;
//------------------------------------------------------------------------------
procedure StrCopyEx(var Buf : array of Char; const AText : String);
begin
  StrLCopy(Buf,PChar(AText),SIZEOF(Buf));
end;
//------------------------------------------------------------------------------
Function StringWithDelim(const AStrings: array of string; const Delim: string; AddEmpty: Boolean = False): string;
var i: integer;
    s: string;
begin
  result:='';
  for i:= Low(AStrings) to  High(AStrings) do
  begin
    s := AStrings[i];
    if  (s>'') or ( AddEmpty ) then  result:= result + s + Delim;
  end;
  SetLength(result,Length(result)-Length(Delim));
end;
//------------------------------------------------------------------------------
function  GetStringIterator(const AItems :String; ADelim : Char=';') : IStringIterator;
begin
  result := IStringIterator(TStringIterator.Create);
  result.Reset(AItems, ADelim);
end;
//------------------------------------------------------------------------------
procedure TStringIterator.Reset(const AItems :String; ADelim : Char=';');
begin
  FIndex :=  -1; 
  FPos := 1;
  FItems := AItems;
  FDelim := ADelim;
  FItemsLn := Length(FItems);
end;
//------------------------------------------------------------------------------
function  TStringIterator.Count: Integer;
var
  sit : IStringIterator;
begin
  result := 0;
  sit := GetStringIterator(FItems,FDelim);
  while  not sit.Eof do
  begin
    sit.Next;
    Inc(Result);
  end;
end;
//------------------------------------------------------------------------------
function  TStringIterator.Eof :  Boolean;
begin
  result := FPos>FItemsLn;
end;
//------------------------------------------------------------------------------
function  TStringIterator.GetItem : String;
begin
  result :=  FItem;
end;
//------------------------------------------------------------------------------
function  TStringIterator.GetIndex : Integer;
begin
  result := FIndex;
end;
//------------------------------------------------------------------------------
function  TStringIterator.Next : String;
var
  I : Integer;
begin
  I := FPos;
  while (I <= FItemsLn) and (FItems[I] <> FDelim) do Inc(I);
  FItem := Trim(Copy(FItems, FPos, I - FPos));
  Result := FItem; 
  if (I <= FItemsLn) and (FItems[I] = FDelim) then Inc(I);
  FPos := I;
  Inc(FIndex); 
end;
//------------------------------------------------------------------------------
function StrToFloatEx(StrValue: string): double;
begin
  StrValue :=  Trim(StrValue);
  StrValue := AnsiReplaceText(StrValue,'.',DecimalSeparator);
  StrValue := AnsiReplaceText(StrValue,',',DecimalSeparator);
  result :=  StrToFloatDef( StrValue, 0) ;
end;
//------------------------------------------------------------------------------
const
    FontStyles : array [0..3] of TFontStyle =
      (fsBold,fsItalic,fsUnderline,fsStrikeOut);

function IntToFontStyle(Value: integer) : TFontStyles;
var
  i : integer;
begin
 result := [];
 for i:= Low(FontStyles) to High(FontStyles) do
   if (Value and (1 shl i))>0 then result := result + [FontStyles[i]];
end;
//------------------------------------------------------------------------------
function FontStyleToInt(Value: TFontStyles) : integer;
var
  i : integer;
begin
 result := 0;
 for i:= Low(FontStyles) to High(FontStyles) do
  if (FontStyles[i] in Value) then   result := result OR (1 shl i);
end;
//------------------------------------------------------------------------------
function GetCmdLineValue(const Switch: string;
                         const DefValue: string = '';
                         const Chars: TSysCharSet=['-','/'];
                         IgnoreCase: Boolean =  True): string;
var
  I: Integer;
  S: string;
begin
  for I := 1 to ParamCount do
  begin
    S := ParamStr(I);
    if (Chars = []) or (S[1] in Chars) then
      if IgnoreCase then
      begin
        if AnsiStartsText(Switch, Copy(S, 2, Maxint)) then
        begin
          Result := Trim(Copy(S, Length(Switch)+2 , Maxint));
          Exit;
        end;
      end
      else begin
        if (AnsiCompareStr(Copy(S, 2, Maxint), Switch) = 0) then
        begin
          Result := DefValue;
          Exit;
        end;
      end;
  end;
  Result := DefValue;
end;

procedure FillNull(var X);
begin
  FillChar(X,SizeOf(X),0);
end;
//------------------------------------------------------------------------------
function TSisPanel.GetButtonByCap(const ACap : string): TBitBtn;
  function GetButtonByCapInternal(AParent : TWinControl): TBitBtn;
  var
    i: integer;
    Ctrl : TControl;
  begin
    for i:= 0  to AParent.ControlCount-1 do
    begin
      Ctrl := AParent.Controls[i];
      if (Ctrl is TBitBtn) and
         AnsiSameText((Ctrl as TBitBtn).Caption,ACap) then
      begin
        result := Ctrl AS TBitBtn;
        Exit;
      end;
      if (Ctrl is TPanel) then
      begin
        result := GetButtonByCapInternal(Ctrl as TWinControl);
        if Result <> nil then exit;
      end;
    end;
  result := nil;
  end;
begin
  result := GetButtonByCapInternal(self)
end;
//------------------------------------------------------------------------------
function  CreateSimpleForm(MainControl: TControlClass;Buttons: TBitBtnSet= btnDefault):TForm;
var
  AControl : TControl;
begin
  result := TForm.Create(nil);
  result.Position := poScreenCenter;
  result.BorderIcons := [biSystemMenu];
  AControl := MainControl.Create(result);
  AControl.Align := alClient;
  AControl.Parent := Result;
  AddStandartButtonPanel(result,'',Buttons);
end;
//------------------------------------------------------------------------------
function  ShowMemoForm(const ACap : String;  var AText : String; const MaxLen :  Integer = -1 ):Boolean;
var
  frm : TForm;
  memo : TMemo;
begin
  frm := CreateSimpleForm(TMemo);
  memo := frm.Controls[0] as TMemo;
  memo.MaxLength := MaxLen;
  memo.Lines.Text := AText;
  frm.Caption := ACap;
  frm.ShowModal;
  result := frm.ModalResult=mrOK;
  if result then
    AText := memo.Lines.Text;
  frm.Free;
end;
//------------------------------------------------------------------------------
function  ShowInputForm(const ACap : String;const mask : String;  var AText : String):Boolean;
var
  frm : TForm;
  me : TMaskEdit;
begin
  frm := CreateSimpleForm(TMaskEdit);
  me := frm.Controls[0] as TMaskEdit;
  me.EditMask := mask;
  me.Text := AText;
  me.Align := alTop; 
  frm.Caption := ACap;
  frm.ShowModal;
  result := frm.ModalResult=mrOK;
  if result then
    AText := me.EditText;
  frm.Free;
end;
//------------------------------------------------------------------------------
function  ShowValueEditor(const ACap : String;  var AText : String;ReadOnly: Boolean = True):Boolean;
var
  frm : TForm;
{$IFDEF MSWINDOWS}
  vle : TValueListEditor;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  frm := CreateSimpleForm(TValueListEditor);
  vle := frm.Controls[0] as TValueListEditor;
  vle.DisplayOptions := vle.DisplayOptions - [doColumnTitles];
  if ReadOnly then
    vle.Options := vle.Options -[goEditing];
  vle.FixedCols := 1;
  vle.Strings.Text := AText;
  frm.Caption := ACap;
  result := frm.ShowModal=mrOK; 
  if result then
    AText := vle.Strings.Text;
  frm.Free;
{$ELSE}
{$ENDIF}
end;
//------------------------------------------------------------------------------
procedure ShowPopUpMenu(Btn: TControl; Menu : TPopupMenu);
var
  APoint : TPoint;
begin
  APoint := Btn.ClientToScreen(Point(0, Btn.ClientHeight));
  if (GetSystemMetrics(SM_CYMENU) * Menu.Items.Count) + APoint.Y >
     Screen.MonitorFromPoint(APoint).Height then
    Dec(APoint.Y, Btn.Height);
  if GetComCtlVersion = ComCtlVersionIE5 then
    Btn.Invalidate;
  Menu.Popup(APoint.X, APoint.Y);
end;
//------------------------------------------------------------------------------
function  ShowFormModal(fc : TFormClass; const frmid : String= ''):Boolean;
var
  frm : TForm;
begin
  frm := fc.Create(nil);
  LoadWindowPosition(frm, frm.Caption);
  result := frm.ShowModal =  mrOk;
  SaveWindowPosition(frm, frm.Caption);
  frm.Free;
end;
//------------------------------------------------------------------------------
const
  BtnWidth = 100;
  BtnStep  = 10;
function AddButton(Parent: TWinControl;Kind: TBitBtnKind; const Cap : string='';Tag : integer = 0): TBitBtn;
var
  Index : integer;
  i : Integer;
begin
  Index := 0;
  for i:= 0 to Parent.ControlCount-1 do
    if Parent.Controls[i] is TButton then Inc(Index);

  result := TBitBtn.Create(parent);
  result.Kind := Kind;
  result.Parent := Parent;
  result.SetBounds(BtnStep + (BtnWidth + BtnStep)*Index, 10,BtnWidth,25);
  Parent.Constraints.MinWidth := Parent.Constraints.MinWidth + result.Width + BtnStep;
  Parent.Width := max(Parent.Width, Parent.Constraints.MinWidth);
  if Cap > '' then result.Caption := Cap;
  result.Tag := Tag;
end;
//------------------------------------------------------------------------------
function AddButtonAtButtonPanel(AForm: TForm;Kind: TBitBtnKind; const Cap : string='';Tag : integer = 0): TBitBtn;
var
  ButtonPanel : TPanel;
begin
  ButtonPanel := TPanel(AForm.FindComponent('ButtonPanel'));
  if ButtonPanel =nil then Raise Exception.Create('ButtonPanel not fouund!');
  result := AddButton(ButtonPanel,Kind,Cap,Tag);
end;
//------------------------------------------------------------------------------
function  AddStandartButtonPanel(AForm: TForm;const btnOKCap : string = '';Buttons: TBitBtnSet= btnDefault): TSISPanel;
var
  pnl : TPanel;
  bk : TBitBtnKind;

const
  BitBtnCaptions: array[TBitBtnKind] of string = (
    '', 'ОК', 'Отмена', 'Помощь', 'Да','Нет','Закрыть','Прекратить',
    'Повторить','Игнорировать','Все');

begin
{  result := TSisPanel.Create(AForm);
  result.Constraints.MinWidth := BtnStep;
  result.Parent := AForm;
  result.ClientHeight := 45;
  result.Align := alBottom;
  result.BevelInner := bvNone;
  result.BevelOuter := bvNone;
  result.Name := 'ButtonPanel';
  result.Caption := '';


  pnl := TPanel.Create(AForm);
  pnl.Constraints.MinWidth := BtnStep;
  pnl.Parent := Result;
  pnl.Align := alRight;
  pnl.Width := 1;
  pnl.BevelInner := bvNone;
  pnl.BevelOuter := bvNone;

  BitBtnCaptions[bkOk]:= btnOKCap;
  for bk := bkCustom to bkAll do
    if bk in Buttons then
  begin
    AddButton(pnl, bk , BitBtnCaptions[bk] );
  end;
  result.Constraints.MinWidth := pnl.Constraints.MinWidth;    }
end;
//------------------------------------------------------------------------------
//----------------------- Variant Utils ----------------------------------------
//------------------------------------------------------------------------------
function VarArrayToVar(const V: Array of Variant): Variant;
begin
  case High(V) of
    -1:  result := NULL;
     0:  result := V[0];
    else
         result := VarArrayOf(V);
  end;
end;
//------------------------------------------------------------------------------
procedure VarArrayToStrings(const V: Array of Variant; Strings : TStrings);
var
  i : Integer;
begin
  if Strings=nil then exit;
  Strings.BeginUpdate;
  Strings.Clear;
  try
    for i:= 0 to Length(V)-1 do
        Strings.Add(VarToStr(V[i]))
  finally
    Strings.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
function VarArrayToString(const V: Array of Variant): String;
var
  i : Integer;
begin
  result := ''; 
  for i:= 0 to Length(V)-1 do
    result := StringWithDelim([Result,VarToStr(V[i])],';'); 
end;
//------------------------------------------------------------------------------
function StringToVarArray(const S: String): TVarDyn;
var
  sit : IStringIterator;
  i   : Integer;
begin
  sit := GetStringIterator(S);
  SetLength(result,sit.Count);
  i := 0;
  while not sit.Eof do
  begin
    result[i] := sit.Next;
    Inc(i); 
  end;
end;
//------------------------------------------------------------------------------
function VarToVarArray(const V:  Variant): TVarDyn;
var
  i : Integer;
  l : Integer;
begin
  if VarIsArray(V) then
  begin
    l := VarArrayHighBound(V,1);
    SetLength(result,l+1);
    for i:= 0  to l do result[i] := V[i];
  end else
  begin
    SetLength(result,1);
    result[0] := V;
  end;
end;
//------------------------------------------------------------------------------
procedure VarSetValueByName_(var VarArray : Variant; const ANames: string; const AName : string; const V: variant );
var
  i : integer;
begin
  i := GetFieldIndex(ANames,AName);
  if i = -1 then Raise Exception.Create('Index out of bounds of Names array');
  VarArray[i] := V;
end;
//------------------------------------------------------------------------------
procedure VarSetValueByName(var VarArray : Variant; const ANames: string; const AName : string; const V: variant );
var
  i : integer;
  sit : IStringIterator;
begin
  if not VarIsArray(V) then
  begin
    VarSetValueByName_(VarArray, ANames, AName, V)
  end else
  begin
    sit := GetStringIterator(AName);
    i := 0;
    while not sit.Eof do
    begin;
      VarSetValueByName_(VarArray, ANames, sit.Next, V[i]);
      Inc(i);
    end;
  end;
end;
//----------------------------------------------------------------------------//
function  VarGetValueByName(VarArray : Variant; const ANames: string; const AName : string ): Variant;
var
  i : integer;
begin
  i := GetFieldIndex(ANames,AName);
  if i = -1 then Raise Exception.Create('Index out of bounds of Names array');
  if (i=0) and not VarIsArray(VarArray) then
    result := VarArray
  else
    result := VarArray[i];
end;
//----------------------------------------------------------------------------//
function VarAsDate(const V:  Variant): Variant;
begin
  result := VarAsType(V,varDate); 
end;
//----------------------------------------------------------------------------//
function  VarNow : Variant;
begin
  result := VarAsType(Now, varDate); 
end;
//----------------------------------------------------------------------------//
function COALLESCE(const Args : Array of variant): Variant;
var
  i : integer;
begin
  for i:= Low(Args) to High(Args)  do
  if (not VarIsClear(Args[i])) and (Args[i]<> NULL) then Break;
  if i > High(Args) then result := Null  else result := Args[i];
end;
//------------------------------------------------------------------------------
procedure VarAddItemAndRedimArray(var V : Variant; Item: Variant);
var
  HB : Integer;
begin
  if VarIsArray(V) then
  begin
    HB := VarArrayHighBound(V,1);
    Inc(HB);
    VarArrayRedim(V,HB);
    V[HB]:= Item;
  end else
  begin
    if VarIsClear(V) then
      V := VarArrayOf([Item])
    else
      V := VarArrayOf([V, Item]);
  end;
end;
//------------------------------------------------------------------------------
procedure VarAddArrayAndRedimArray(var V : Variant; VarDyn: TVarDyn);
var
  i :  integer;
begin
  for i:= 0  to Length(VarDyn) -1  do
    VarAddItemAndRedimArray(V, VarDyn[i]);
end;
//------------------------------------------------------------------------------
function VarLoadXML(node : ixmlNode): Variant;
var
  i : Integer;
  varType : Integer;
begin
    if node = nil then
    begin
      result := Unassigned;
      exit;
    end;
    Result := VarArrayOf([NULL]);
    VarArrayRedim(Result,Node.ChildNodes.Count);
    node := node.ChildNodes.First;
    i := 0;
    while node<>nil do
    begin
      varType := varString;
      if node.NodeName = 'int' then varType := varInteger;
      if node.NodeName = 'str' then varType := varString;
      case varType of
        varInteger : result[i] := StrToInt(Trim(VarToStr(node.NodeValue))) ;
        varString  : result[i] := Trim(VarToStr(node.NodeValue)) ;
        else
         result[i] := VarAsType(node.NodeValue,varType) ;
      end;
      node := node.NextSibling;
      Inc(i);
    end;
    if VarArrayHighBound(Result,1)=1 then
      Result := Result[0];
end;
//------------------------------------------------------------------------------
procedure VarSaveXML(V: Variant; node : ixmlNode);
begin
end;
//------------------------------------------------------------------------------
Function GetVarTypeGroup(const V : Variant): Integer;
begin
  case varType(V) of
   varDouble,varSingle,
   varSmallint,varByte,
   varInteger, varInt64,
   varShortInt,varWord,
   varLongWord
     : result := 1;
   varString,varOleStr
     : result := 2;
   else result := 0;
  end;
end;

type
 TCmpLevels= (levGrp,levType,levNull);

Function LevProc(Lev : TCmpLevels; const V :  Variant) : Integer;
begin
  case Lev of
    levGrp  : result := GetVarTypeGroup(V);
    levType : result := VarType(V);
    levNull : result := Integer(V=NULL);
   else   result := 0;
  end;
end;

Function VarCompareInternal(const V1,V2 :  Variant) : Integer;
var
  i : TCmpLevels;
begin
  for i:= Low(TCmpLevels)  to  High(TCmpLevels) do
  begin
    result := LevProc(i, V2) - LevProc(i, V1);
    if result<>0 then break
  end;
  if (result=0) and (not (V1=NULL)) then
  begin
    if V1>V2 then result := 1;
    if V1<V2 then result := -1;
  end;
end;


function VarCompare(const V1,V2: variant): integer;



  (*
   Function VarCompareInternal(const V1,V2 :  Variant) : integer;
   var
     vt1,vt2   : Integer;
     vtg1,vtg2 : Integer;
     n1 ,n2   : boolean;
   begin
     vtg1 := GetVarTypeGroup(V1);
     vtg2 := GetVarTypeGroup(V2);
     result := 0;

     if  vtg1<vtg2 then result :=  1;
     if  vtg1>vtg2 then result := -1;
     if result=0 then
     begin
       vt1 := VarType(V1);
       vt2 := VarType(V2);
       if  vt1<vt2 then result :=  1;
       if  vt1>vt2 then result := -1;
       if result=0 then
       begin
         n1 := V1=NULL;
         n2 := V1=NULL;
         if n1>n2 then result := -1;
         if n1<n2 then result :=  1;
         if (result=0) and (not n1) then
         begin
           if V1>V2 then result := 1;
           if V1<V2 then result := -1;
         end;
       end;
     end;
   end;
   *)
var
   i: integer;
   d1,d2    : integer;
begin
  d1 := VarArrayDimCount(V1);
  d2 := VarArrayDimCount(V2);

  result :=  0;
  if  d1<d2 then result :=  1;
  if  d1>d2 then result := -1;

  if result = 0 then
  begin
    if (d1>0) then
    for i:=0  to VarArrayHighBound(V1,1) do
    begin
      result := VarCompareInternal(V1[i],V2[i]);
      if result<>0 then Exit;
    end else
    begin
      result := VarCompareInternal(V1,V2);
    end;
  end;
end;
//------------------------------------------------------------------------------
function VarIsEqual(const V1,V2: variant): Boolean;
begin
  result :=  VarCompare(V1,V2)=0;
end;
//------------------------------------------------------------------------------
function VarToFloat(const V : Variant): double;
begin
  result := StrToFloatEx(VarToStr(V));
end;
//------------------------------------------------------------------------------
function VarToInt(const V : Variant): Integer;
begin
  result := StrToInt(VarToStr(V));
end;
//------------------------------------------------------------------------------
function VarToIntDef(const V : Variant;Def : Integer): Integer;
begin
  result := StrToIntDef(VarToStr(V),Def);
end;

//------------------------------------------------------------------------------
procedure LoadWindowPosition(Form :  TForm; const Id : string);
var
  s : string;
  item : string;
  i : integer;
  j : integer;
begin
  s :=  ini.ReadString('WINDOW',ID,'');
  i :=  1;
  j :=  1;
  while i <= Length(s) do
  begin
    item := ExtractFieldName(s,i);
    case j of
     1: form.Left   := StrToIntDef(item,form.Left);
     2: form.Top    := StrToIntDef(item,form.Top);
     3: form.Width  := StrToIntDef(item,Form.Width);
     4: form.Height := StrToIntDef(item,Form.Height);
     end;
     inc(j);
  end;
end;
//------------------------------------------------------------------------------
procedure SaveWindowPosition(Form :  TForm; const Id : string);
begin
  ini.WriteString('WINDOW',ID, Format('%d;%d;%d;%d',
  [form.Left, form.Top, form.Width, form.Height]));
  ini.UpdateFile;
end;
//------------------------------------------------------------------------------
procedure TDummyClass.NotifyDataEvent(Sender: TDataSet);
begin
  Proc(Sender);
end;
//------------------------------------------------------------------------------
procedure TDummyClass.ProcedureOfObject;
begin
  SimpleProc;
end;

function RandomFrom(const AValues: array of string): string;
begin
  Result := AValues[Random(High(AValues) + 1)];
end;
//------------------------------------------------------------------------------
function  RandomString(Ln : Integer): String;
const
  CharArray = '!@#$%^&*()[]/><?abcdefghijklmnopqrstufvxyz0123456789ABCDEFGHIJKLPNOPQRSTUFVXYZ';
var
  i : Integer;
  l : Integer;
begin
  SetLength(result,Ln);
  l := Length(CharArray) ;
  Randomize;
  for i:= 1 to Ln do result[i] := CharArray[Random(l)+1];
end;
//------------------------------------------------------------------------------
function Encrypt_Decrypt(const Key: string; AText : PChar; TextLn : Integer; Encrypt: Boolean): String;
var
  i : Integer;
  kl : Integer;
  sign : integer;
  add_ : Integer;
begin
  kl := Length(Key);
  result := '';
  if Encrypt then sign := 1 else sign := -1;
  for i:=0  to TextLn-1 do
  begin
    add_ := Ord(key[(i mod kl)+1]);
    AText[i] := Char( Ord(AText[i])+ sign*add_);
  end;  
end;
//------------------------------------------------------------------------------
{$IFDEF MSWINDOWS}
type
 TPaketInfo=packed record
    Pkt  : ^TSimplePacket;
    addr : TSockAddr;
    Socket_Handle : TSocket; 
    Sock_Result : Integer;
  end;
//------------------------------------------------------------------------------
function  ThreadFunc(Parameter: Pointer) : Integer;
var
  ln : Integer;
begin
  ln := SIZEOF(TSimplePacket);
  with TPaketInfo(Parameter^) do
  begin
    Sock_Result := RecvFrom(Socket_Handle, Pkt^ , sizeOf(TSimplePacket) , 0 , addr , ln);
  end;
end;
//------------------------------------------------------------------------------
function CallUDPServer(var Pct : TSimplePacket; var HOST : String;  APort : Integer; ATimeOut : Integer ): Boolean;
var
  Th : THandle;
  FThreadID  : DWORD;
  BroadCastData : LongBool;
  Info : TPaketInfo;

  procedure CheckResult;
  begin
    if Info.Sock_Result= SOCKET_ERROR then RaiseLastOSError;
  end;

begin
  result :=  False;
  Info.Socket_Handle := SOCKET(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
  if Info.Socket_Handle = INVALID_SOCKET then Exit;
  try
    // Setting BroadCast Option
    BroadCastData :=  True;
    Info.Sock_Result := SetSockOpt(Info.Socket_Handle,
                                 SOL_SOCKET, SO_BROADCAST, PChar(@BroadCastData),
                                 SizeOf(BroadCastData));
    CheckResult;

    // Making BroadCast Address
    with Info.addr do
    begin
      sin_family := PF_INET;
      FillChar(sin_addr.S_un_b,4,#255);
 (*
      sin_addr.S_un_b.s_b1 := #127;
      sin_addr.S_un_b.s_b2 := #0;
      sin_addr.S_un_b.s_b3 := #0;
      sin_addr.S_un_b.s_b4 := #1;
  *)
      sin_port := HToNs(APort);
    end;
    Info.Pkt := @Pct;

    // Sending BroadCast Message
    Info.Sock_Result := SendTo(Info.Socket_Handle, Pct, SizeOf(Pct), 0, Info.addr,
                             SizeOf(TSockAddr));
    CheckResult;

    // Removing BroadCast Option
    BroadCastData :=  False;
    Info.Sock_Result := SetSockOpt(Info.Socket_Handle,
                                 SOL_SOCKET, SO_BROADCAST, PChar(@BroadCastData),
                                 SizeOf(BroadCastData));
    CheckResult;

    th := BeginThread(nil, 0, @ThreadFunc, @Info, 0 , FThreadID);

    // Sending BroadCast Message
    Result := WaitForSingleObject(th, ATimeOut) = WAIT_OBJECT_0;
    if Result then
    begin
      CheckResult;
      With Info.addr.sin_addr.S_un_b do
        HOST := Format('%d.%d.%d.%d',[Byte(s_b1),Byte(s_b2),Byte(s_b3),Byte(s_b4)]);
    end else
    begin
      TerminateThread(th, 0);
      Raise Exception.Create('Can''t find Server');
    end;
  finally
    CloseSocket(Info.Socket_Handle);
  end;
end;
//------------------------------------------------------------------------------
(*
function GetRemoteValue_Id(const key, cmd : String; Port : Integer;  var Value : String) : Boolean;
var
  Pkt : TSimplePacket;
  Client : TIdUDPClient;
  S : String;
  VPeerIP: string;
  VPeerPort: integer;
begin
  PackPacket(Pkt, Key, cmd);
  Client := TIdUDPClient.Create(nil);
  SetLength(S,SIZEOF(Pkt));
  CopyMemory(@(S[1]), @Pkt, SIZEOF(Pkt));
  Client.Broadcast(S, Port);
  Client.BroadcastEnabled := False;
  VPeerPort := 0;
  while VPeerPort<>Port do
    Client.ReceiveBuffer(Pkt,SIZEOF(Pkt),VPeerIP, VPeerPort, 20000);
  Client.Free;
  Value := UnPackPacket(Pkt);
  Result :=  True;
end;
*)
//------------------------------------------------------------------------------
var
  WSAData : TWSAData;
function GetRemoteValue(const key, cmd : String; Port : Integer;  var Value : String) : Boolean;
var
  Pkt : TSimplePacket;
  Host : String;
begin
  if WSAStartup($0101, WSAData) <> 0 then RaiseLastOSError;
  PackPacket(Pkt, Key, cmd);
  result := CallUDPServer(Pkt, Host,  Port,5000);
  if Result then
    Value := UnPackPacket(Pkt);
  WSACleanup;
end;
{$ENDIF}
//------------------------------------------------------------------------------
procedure PackPacket(var Pkt : TSimplePacket;const CipherKey, Data : String);
begin
  StrCopyEx(Pkt.CipherKey,CipherKey);
  Pkt.DataLn := min(Length(Data),BufferSize);
  StrCopyEx(Pkt.Data, Data);
  Pkt.Error := False;
  if CipherKey > '' then
    Encrypt_Decrypt(Pkt.CipherKey, Pkt.Data , Pkt.DataLn , True);
  Pkt.CRC := Pkt.DataLn;   
end;
//------------------------------------------------------------------------------
procedure PackError(var Pkt : TSimplePacket;const CipherKey, Error : String);
begin
  PackPacket(Pkt, CipherKey, Error);
  Pkt.Error := True;
end;
//------------------------------------------------------------------------------
Function UnPackPacket(const Pkt : TSimplePacket) : String;
begin
  if Pkt.CRC <> Pkt.DataLn then Raise Exception.Create('CRC is BAD !');
  if Pkt.CipherKey > '' then
    Encrypt_Decrypt(Pkt.CipherKey, Pkt.Data , Pkt.DataLn , False);
  result := Copy(Pkt.Data,1,Pkt.DataLn);
end;

//------------------------------------------------------------------------------
procedure TCollectionEx.LoadFromXMLNode(Node: IXMLNode);
begin
  Clear;
  if  node=nil then Exit;
  Node := node.ChildNodes.First;
  if Node=nil then Exit;
  while Node<>nil do
  begin
    (Add as TCollectionExItem).AssignFromXMLNode(Node);
    Node := Node.NextSibling;
  end;
end;
//------------------------------------------------------------------------------
procedure TCollectionEx.SaveToXMLNode(Node: IXMLNode);
var
  i : Integer;
begin
   for i:= 0  to Count -1  do
   begin
     (Items[i] as TCollectionExItem).AssignToXMLNode(Node.AddChild('item'));
   end;
end;
//------------------------------------------------------------------------------
procedure TCollectionEx.SaveToXMLDoc(Doc: IXMLDocument);
begin
  SaveToXMLNode(Doc.AddChild('body'));
end;
//------------------------------------------------------------------------------
procedure TCollectionEx.LoadFromXMLDoc(Doc: IXMLDocument);
var
  root : IXMLNode;
begin
  root := Doc.ChildNodes.FindNode('body');
  if root=nil then Exit;
  LoadFromXMLNode(Doc.ChildNodes[1]);
end;
//------------------------------------------------------------------------------
function TCollectionEx.GetAsXMLText: String;
var
  doc  : IXMLDocument;
begin
  doc := TXMLDocument.Create(nil);
  doc.Active :=  True;
  doc.Encoding := 'windows-1252';
  SaveToXMLDoc(doc);
  result := doc.XML.Text; 
end;
//------------------------------------------------------------------------------
procedure TCollectionEx.SetAsXMLText(AText : String);
var
  doc  : IXMLDocument;
begin
  doc := TXMLDocument.Create(nil);
  doc.XML.Text := AText;
  doc.Active :=  True;
  LoadFromXMLDoc(doc);
end;
//------------------------------------------------------------------------------
function   TCollectionExItem.Edit: Boolean;
{$IFDEF MSWINDOWS}
var
  f : TForm;
  ve : TValueListEditor;
  i : Integer;
  Names  : TStringList;
  node : IXMLNode;
  doc  : IXMLDocument;
  attName : String;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  Names  := TStringList.Create;
  doc := TXMLDocument.Create(nil);
  doc.Active :=  True;
  node := doc.AddChild('dummy');

  f := CreateSimpleForm(TValueListEditor);
  ve := f.Controls[0] as TValueListEditor;
  ve.DisplayOptions := ve.DisplayOptions - [doColumnTitles];
  ve.FixedCols := 1;

  LoadPropertyNames(Names);

  AssignToXMLNode(node, True);
  for I := 0 to node.AttributeNodes.Count-1 do
  begin
    attName := node.AttributeNodes[i].NodeName;
    ve.InsertRow(attName, VarToStr(node.AttributeNodes[i].NodeValue),True);
    ve.ItemProps[attName].KeyDesc := Names.Values[attName];
    LoadPickList(attName, ve.ItemProps[attName].PickList);
  end;
 (*
  for I := Low(Names) to High(Names) do
  begin
    ve.InsertRow(Names[i],Values[i],True);
    LoadPickList(Names[i], ve.ItemProps[Names[i]].PickList);
  end;
  *)
  result := f.ShowModal = mrOk;
  if result then
  begin
    for I := 0 to node.AttributeNodes.Count-1 do
      node.AttributeNodes[i].NodeValue := ve.Values[node.AttributeNodes[i].NodeName];
    AssignFromXMLNode(node, True);
   (*
    for I := Low(Names) to High(Names) do
      Values[i] := ve.Values[Names[i]];
    SetPropertyValues(Values);
    *)
  end;
  f.Free;
  Names.Free;
{$ENDIF}
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
constructor TDocCollection.Create(AOwner : TComponent);
begin
  inherited;
  FList := TObjectList.Create(True);

  InsertAction := TAction.Create(self);
  InsertAction.Caption := 'Добавить';
  InsertAction.Tag := 0;
  InsertAction.OnExecute := ControlClick;

  EditAction := TAction.Create(self);
  EditAction.Caption := 'Редактировать';
  EditAction.Tag := 1;
  EditAction.OnExecute := ControlClick;

  DeleteAction := TAction.Create(self);
  DeleteAction.Caption  := 'Удалить';
  DeleteAction.Tag  := 2;
  DeleteAction.OnExecute := ControlClick;
end;
//------------------------------------------------------------------------------
destructor TDocCollection.Destroy; 
begin
  FList.Free;
  inherited; 
end;
//------------------------------------------------------------------------------
function TDocCollection.Insert : Boolean;
var
  doc  : TDocument;
begin
  doc := GetDocumentClass.Create(nil);
  result := doc.Edit;
  if result then
  begin
    FList.Add(doc);
    doc.Save; 
    Selected := doc;
  end;
end;
//------------------------------------------------------------------------------
procedure TDocCollection.Open(Sender : TObject);
begin
  Selected := Sender as TDocument;
  if Assigned(FOnOpen) then FOnOpen(Selected);
  InspectAction;
end;
//------------------------------------------------------------------------------
procedure TDocCollection.SetSelected(ASelected : TDocument);
begin
  if (ASelected<>FSelected) then
  begin
    FSelected := ASelected;
    InspectAction; 
  end;
end;
//------------------------------------------------------------------------------
procedure TDocCollection.ControlClick(Sender : TObject);
begin
  case (Sender as TAction).Tag of
  0 : Insert;
  1 : Edit;
  2 : Delete; 
  end;
  InspectAction; 
end;
//------------------------------------------------------------------------------
function TDocCollection.GetDocument(idx : Integer) : TDocument;
begin
  result :=  FList[idx] as TDocument; 
end;
//------------------------------------------------------------------------------
procedure TDocCollection.InspectAction;
begin
  EditAction.Enabled := FSelected<>nil;
  DeleteAction.Enabled := FSelected<>nil; 
end;
//------------------------------------------------------------------------------
function TDocCollection.Edit;
begin
  if FSelected=nil then Exit;
  result := FSelected.Edit; 
  if result then
  begin
    FSelected.Save; 
  end;
end;

procedure TDocCollection.Delete;
begin
  if MessageDlg('Удалить?',
     mtConfirmation, [mbYes, mbNo], 0) <> mrYes then  exit;
  FList.Remove(FSelected);
  FSelected.Delete;
  FreeAndNil(FSelected);
  Selected := nil; 
end;

procedure TDocCollection.Load;
var
  doc : TDocument;
  I  :  Integer;
  V  : TVarDyn;
begin
  V := GetDocumentClass.LoadSourceList;
  for I := 0  to High(V) do
  begin
    doc := GetDocumentClass.Create(nil);
    doc.Load(V[i]);
    FList.Add(doc);
  end;
  FSelected := nil;
  InspectAction;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function  StartProgram(CL: string; ShowWindow : Boolean =  True; TimeOut : Integer =  INFINITE) : Cardinal;
var
 pi  : TProcessInformation;
 si  : TStartUpInfo        ;
 ExitCode : Cardinal;
begin
 FillChar(si,SizeOf(si),0);
 si.cb:=SizeOf(si);
 si.dwFlags := STARTF_USESHOWWINDOW;
 if ShowWindow then
   si.wShowWindow:=SW_NORMAL
 else   
   si.wShowWindow:=SW_HIDE;
 if  not CreateProcess(Nil,PChar(CL),nil,nil,False, NORMAL_PRIORITY_CLASS,Nil,Nil,si,pi)
   then RaiseLastOSError;
 ExitCode := WaitForSingleObject(pi.hProcess, TimeOut);
 if  ExitCode = WAIT_FAILED then RaiseLastOSError;
 if not GetExitCodeProcess(pi.hProcess  , result) then RaiseLastOSError;
 CloseHandle(pi.hThread);
end;
//-----------------------------------------------------------------------
function FindFileRecursive(const ADir: string; const FileName: string): string;
var
  sr: TSearchRec;
  d: string;
begin
  result := '';
  if FindFirst(ADir,faAnyFile,sr)=0 then
  begin
    repeat
      if (sr.Name='.') or (sr.Name='..') then continue;
      d := ExtractFilePath(ADir);
      if AnsiSameText(sr.Name,FileName) then
      begin
        result := D + sr.Name;
        break;
      end;
      if  (sr.Attr and faDirectory)>0 then
       begin
       result := FindFileRecursive(d +  sr.Name + '\*.*', FileName);
       if  result>'' then break;
       end;
    until FindNext(sr) <> 0;
  end;
  FindClose(sr);
end;
//-----------------------------------------------------------------------
function FindFile(const AFileName: string): string;
var
  DriveNum: Integer;
  DriveBits: set of 0..25;
begin
  result := '';
  Integer(DriveBits) := GetLogicalDrives;
  for DriveNum := 0 to 25 do
  begin
    if not (DriveNum in DriveBits) then Continue;
    result := FindFileRecursive(Char(DriveNum + Ord('a')) + ':\*.*',AFileName);
    if result>'' then break;
  end;
end;


function GenerateSQLText(const TableName,Fields,KeyFields: string; SQL_Kind: TSQL_Kind): string;
var
  St1,St2,St3 : string;

 function TransformString(const FormatStr, Delim, AValue: string ): string;
 var
  pos_ : Integer;
 begin
  pos_ := 1;
  result := '';
  while pos_ <= Length(AValue)  do
    result:= result + Format(FormatStr,[ExtractFieldName(AValue, Pos_ )]) + Delim;
  SetLength(result,Length(result)-Length(Delim));
 end;

begin
 if KeyFields> '' then
   ST3:= ' where '+ TransformString('%s=:%0:s',' and ',KeyFields);

 case SQL_Kind of
  skSelect : begin
               ST1:= TransformString('"%s"',',',Fields  );
               if (Pos('SELECT ',AnsiUpperCase(TableName)) = 0) and
                  (Pos('CALL ',AnsiUpperCase(TableName)) = 0)
                then
                 result := Format('select %s from %s %s',[ST1,TableName,ST3])
               else
                 result := TableName;
             end;
  skInsert : begin
               ST1:= TransformString('"%s"',',',Fields);
               ST2:= TransformString(':%s',',',Fields);
               result := Format('Insert into %s(%s) VALUES(%s)',[TableName,ST1,ST2]);
             end;
  skUpdate : begin
               ST1:= TransformString('"%s"=:%0:s',',',Fields);
               if KeyFields > '' then ST3:= ' where ';
               ST3:= ST3 + TransformString('%s=:old_%0:s',' and ',KeyFields);
               result := Format('Update %s set %s %s',[TableName,ST1,ST3])
             end;
  skDelete : begin
               result := Format('Delete from %s %s',[TableName,ST3]);
             end;
  skNone   : begin
               result := TableName;
             end;
  end;
end;

function WordCount(const S: string; const WordDelims: TCharSet): Integer;
var
  SLen, I: Cardinal;
begin
  Result := 0;
  I := 1;
  SLen := Length(S);
  while I <= SLen do begin
    while (I <= SLen) and (S[I] in WordDelims) do Inc(I);
    if I <= SLen then Inc(Result);
    while (I <= SLen) and not (S[I] in WordDelims) do Inc(I);
  end;
end;

initialization
  ini := TiniFile.Create( ChangeFileExt(ParamStr(0),'.ini') );

finalization
  ini.Free;


end.
