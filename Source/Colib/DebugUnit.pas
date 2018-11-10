unit DebugUnit;

interface

uses
  SysUtils;

procedure IgnoreException(ExClass: ExceptClass);

implementation

uses
  Classes, JclDebug, JclHookExcept;

var
  IgnoreList: TList;

procedure IgnoreException(ExClass: ExceptClass);
begin
  if IgnoreList = nil then IgnoreList := TList.Create;
  IgnoreList.Add(Pointer(ExClass));
end;

procedure AddToLog(const S: string);
var
  FileName: string;
  FS: TFileStream;
begin
  try
    FileName := ChangeFileExt(ParamStr(0), '.dbg');

    if not FileExists(FileName) then TFileStream.Create(FileName, fmCreate).Free;
    FS := TFileStream.Create(FileName, fmOpenReadWrite or fmShareDenyWrite);
    try
      FS.Position := FS.Size;
      FS.WriteBuffer(PChar(S)^, Length(S));
    finally
      FS.Free;
    end;
  except
    { suppress any exception }
  end;
end;

procedure DoExceptNotify(ExceptObj: TObject; ExceptAddr: Pointer; OSException: Boolean);
var
  Strings: TStrings;
  S: string;
begin
  if JclExceptionTrackingActive then
  begin
    if (IgnoreList <> nil) and (IgnoreList.IndexOf(Pointer(ExceptObj.ClassType)) <> -1) then Exit;

    Strings := TStringList.Create;
    try
      S := '**************** [' + DateTimeToStr(Now) + ']';
      if ExceptObj is Exception then S := S + '  ' + Exception(ExceptObj).Message;
      S := S + #13#10;
      AddToLog(S);

      if JclLastExceptStackListToStrings(Strings, True, True, True) then
      begin
        AddToLog(Strings.Text);
      end;
    finally
      Strings.Free;
    end;
  end;
end;

initialization
  JclStackTrackingOptions := [stStack, stExceptFrame, stRawMode];
  if JclStartExceptionTracking then JclAddExceptNotifier(DoExceptNotify, npNormal);
finalization
  JclRemoveExceptNotifier(DoExceptNotify);
  JclStopExceptionTracking;
  IgnoreList.Free;
  IgnoreList := nil;
end.
