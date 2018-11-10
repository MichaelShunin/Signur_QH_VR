unit IntList;

interface

uses
  Classes;

// List челых чисел
  
type
  TIntegerList = class(TList)
    private
    protected
      function GetInt(Index: Integer): Integer;
      procedure PutInt(Index, Item: Integer);
    public
      function Add(var Item: Integer): Integer;
      function Extract(var Item: Integer): Integer;
      function First: Integer;
      function IndexOf(var Item: Integer): Integer;
      procedure Insert(Index: Integer; var Item: Integer);
      function Last: Integer;
      function Remove(Item: Integer): Integer;
      property Items[Index: Integer]: Integer read GetInt write PutInt; default;
  end;

implementation

function TIntegerList.Add(var Item: Integer): Integer;
begin
  Result := (Inherited Add(@Item));
end;

function TIntegerList.Extract(var Item: Integer): Integer;
begin
  Result := Integer((Inherited Extract(@Item))^);
end;

function TIntegerList.First: Integer;
begin
  Result := Integer((Inherited First)^);
end;

function TIntegerList.IndexOf(var Item: Integer): Integer;
begin
  Result := Inherited IndexOf(@Item);
end;

procedure TIntegerList.Insert(Index: Integer; var Item: Integer);
begin
  Inherited Insert(Index, @Item);
end;

function TIntegerList.Last: Integer;
begin
  Result := Integer((Inherited Last)^);
end;

function TIntegerList.Remove(Item: Integer): Integer;
begin
  Result := (Inherited Remove(@Item));
end;

function TIntegerList.GetInt(Index: Integer): Integer;
begin
  Result := Integer(Get(Index)^);
end;

procedure TIntegerList.PutInt(Index, Item: Integer);
begin
  Put(Index, @Item);
end;

end.
