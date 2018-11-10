unit SelectForm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, IBQuery;

type
  TSelectFrm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    IsGetID: boolean;
  public
    ID: Integer;
    AName: string;
    procedure GetValueFromQuery(AIBQuery: TIBQuery; StringField, ObjectField: string);
    procedure GetValueFromQueryText(AQueryText :string);
    procedure GetValueFromQueryText_ID(AQueryText: string;StringField, ObjectField: string);
    { Public declarations }
  end;

implementation

uses DM_u;

{$R *.dfm}

procedure TSelectFrm.GetValueFromQuery(AIBQuery: TIBQuery; StringField, ObjectField: string);
begin
  with ListBox1.Items, AIBQuery do
  begin
    Clear;
    Active := True;
    while not Eof do
    begin
      AddObject(Trim(FieldByName(StringField).AsString) ,
        TObject(FieldByName(ObjectField).AsInteger));
      Next;
    end;
    Active := False;
  end;
  IsGetID := True;
end;

procedure TSelectFrm.GetValueFromQueryText(AQueryText: string);
begin
  with dm.AnyQuery do begin
    Close;
    SQL.Text := AQueryText;
    Open;
    while not Eof do
    begin
      ListBox1.Items.Add(Trim(Fields[0].AsString));
      Next;
    end;
    Close;
  end;
  IsGetID := False;
end;

procedure TSelectFrm.GetValueFromQueryText_ID(AQueryText: string;StringField, ObjectField: string);
begin
  with dm.AnyQuery do begin
    Close;
    SQL.Text := AQueryText;
    Open;
    while not Eof do
    begin
      ListBox1.Items.AddObject(Trim(FieldByName(StringField).AsString) ,
        TObject(FieldByName(ObjectField).AsInteger));
      Next;
    end;
    Close;
  end;
  IsGetID := true;
end;

procedure TSelectFrm.Button1Click(Sender: TObject);
begin
  if IsGetID then ID := integer(ListBox1.Items.Objects[ListBox1.ItemIndex])
  else ID := 0;
  AName :=  ListBox1.Items[ListBox1.ItemIndex];
end;

procedure TSelectFrm.ListBox1DblClick(Sender: TObject);
begin
  Button1.Click;
end;

end.

