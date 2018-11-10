unit LayoutsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DbGridUnit, DB, DBClient, Grids, DBGridEh, StdCtrls,
  DialogUnit, MaximizedUnit;

type
{ TLayoutsForm }

  TLayoutsForm = class(TDialogForm)
    ButtonPanel: TPanel;
    Grid: TDBGridEh;
    LayoutsSource: TDataSource;
    LayoutsDataSet: TClientDataSet;
    LayoutsDataSetORDER: TIntegerField;
    LayoutsDataSetNAME: TStringField;
    OKBtn: TButton;
    CancelBtn: TButton;
    UpBtn: TButton;
    DownBtn: TButton;
    DeleteBtn: TButton;
    LayoutsDataSetPOINTER: TIntegerField;
    SelectBtn: TButton;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure UpBtnClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure LayoutsDataSetORDERGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure LayoutsSourceDataChange(Sender: TObject; Field: TField);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    FSelectedLayout: Integer;
    FLayoutMan: TGridLayoutMan;
    procedure Initialize(LayoutMan: TGridLayoutMan; SelectedLayout: Integer);
    procedure UpdateLayout;
  public
    class function EditLayout(LayoutMan: TGridLayoutMan; SelectedLayout: Integer): Integer;
  end;

var
  LayoutsForm: TLayoutsForm;

implementation

uses
  DataUnit;

{$R *.dfm}

{ TLayoutsForm }

class function TLayoutsForm.EditLayout(LayoutMan: TGridLayoutMan; SelectedLayout: Integer): Integer;
var
  Form: TLayoutsForm;
begin
  Form := TLayoutsForm.Create(nil);
  try
    Form.Initialize(LayoutMan, SelectedLayout);
    if Form.ShowModal = mrOK then
    begin
      Form.UpdateLayout;
      Result := Form.FSelectedLayout;
    end else
    begin
      Result := SelectedLayout;
    end;
  finally
    Form.Free;
  end;
end;

procedure TLayoutsForm.Initialize(LayoutMan: TGridLayoutMan; SelectedLayout: Integer);
var
  I: Integer;
  Layout: TGridLayout;
begin
  FLayoutMan := LayoutMan;
  FSelectedLayout := SelectedLayout;
  LayoutsDataSet.CreateDataSet;
  for I := 0 to FLayoutMan.Count - 1 do
  begin
    Layout := FLayoutMan[I];
    LayoutsDataSet.Insert;
    LayoutsDataSetORDER.AsInteger := I;
    LayoutsDataSetNAME.AsString := Layout.Name;
    LayoutsDataSetPOINTER.AsInteger := Integer(Layout);
    LayoutsDataSet.Post;
  end;
end;

procedure TLayoutsForm.UpdateLayout;
var
  N, I: Integer;
  Layout: TGridLayout;
begin
  N := 0;
  LayoutsDataSet.First;
  while not LayoutsDataSet.Eof do
  begin
    Layout := TGridLayout(LayoutsDataSetPOINTER.AsInteger);
    FLayoutMan.Move(FLayoutMan.IndexOf(Layout), N);
    Layout.Name := LayoutsDataSetNAME.AsString;
    Inc(N);
    LayoutsDataSet.Next;
  end;
  for I := FLayoutMan.Count - 1 downto N do FLayoutMan.Delete(I);
end;

procedure TLayoutsForm.OKBtnClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TLayoutsForm.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TLayoutsForm.UpBtnClick(Sender: TObject);
var
  P: Integer;
begin
  if FSelectedLayout = LayoutsDataSetORDER.AsInteger then Dec(FSelectedLayout);
  P := LayoutsDataSetPOINTER.AsInteger;
  LayoutsDataSet.Prior;
  LayoutsDataSet.Edit;
  LayoutsDataSetORDER.AsInteger := LayoutsDataSetORDER.AsInteger + 1;
  LayoutsDataSet.Post;
  LayoutsDataSet.Locate('POINTER', P, []);
  LayoutsDataSet.Edit;
  LayoutsDataSetORDER.AsInteger := LayoutsDataSetORDER.AsInteger - 1;
  LayoutsDataSet.Post;
end;

procedure TLayoutsForm.DownBtnClick(Sender: TObject);
var
  P: Integer;
begin
  if FSelectedLayout = LayoutsDataSetORDER.AsInteger then Inc(FSelectedLayout);
  P := LayoutsDataSetPOINTER.AsInteger;
  LayoutsDataSet.Next;
  LayoutsDataSet.Edit;
  LayoutsDataSetORDER.AsInteger := LayoutsDataSetORDER.AsInteger - 1;
  LayoutsDataSet.Post;
  LayoutsDataSet.Locate('POINTER', P, []);
  LayoutsDataSet.Edit;
  LayoutsDataSetORDER.AsInteger := LayoutsDataSetORDER.AsInteger + 1;
  LayoutsDataSet.Post;
end;

procedure TLayoutsForm.DeleteBtnClick(Sender: TObject);
var
  P, Order: Integer;
begin
  if FSelectedLayout = LayoutsDataSetORDER.AsInteger then FSelectedLayout := -1;
  P := LayoutsDataSetPOINTER.AsInteger;
  Order := LayoutsDataSetORDER.AsInteger;
  LayoutsDataSet.Delete;
  LayoutsDataSet.DisableControls;
  try
    LayoutsDataSet.First;
    while not LayoutsDataSet.Eof do
    begin
      LayoutsDataSet.Edit;
      if LayoutsDataSetORDER.AsInteger > Order then
      begin
        LayoutsDataSetORDER.AsInteger := LayoutsDataSetORDER.AsInteger - 1;
      end;
      LayoutsDataSet.Post;
      LayoutsDataSet.Next;
    end;
    LayoutsDataSet.Locate('POINTER', P, []);
  finally
    LayoutsDataSet.EnableControls;
  end;
end;

procedure TLayoutsForm.SelectBtnClick(Sender: TObject);
begin
  FSelectedLayout := LayoutsDataSetORDER.AsInteger;
  Grid.Invalidate;
end;

procedure TLayoutsForm.LayoutsDataSetORDERGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := IntToStr(LayoutsDataSetORDER.AsInteger + 1);
end;

procedure TLayoutsForm.LayoutsSourceDataChange(Sender: TObject;
  Field: TField);
var
  LayoutExists: Boolean;
begin
  LayoutExists := not LayoutsDataSet.Bof or not LayoutsDataSet.Eof;
  UpBtn.Enabled := LayoutsDataSetORDER.AsInteger > 0;
  DownBtn.Enabled := LayoutsDataSetORDER.AsInteger < (FLayoutMan.Count - 1);
  DeleteBtn.Enabled := LayoutExists;
  SelectBtn.Enabled := LayoutExists and (FSelectedLayout <> LayoutsDataSetORDER.AsInteger);
end;

procedure TLayoutsForm.GridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if LayoutsDataSetORDER.AsInteger = FSelectedLayout then AFont.Style := AFont.Style + [fsBold];
end;

end.
