unit QpFilterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
{ TQpFilterFrame }

  TQpFilterFrame = class(TFrame)
    Bevel: TBevel;
    FilterLabel: TLabel;
    FilterCombo: TComboBox;
    procedure FilterComboChange(Sender: TObject);
    procedure FilterComboDropDown(Sender: TObject);
  private
    FFilterID: Integer;
    FOnChange: TNotifyEvent;
    procedure SetFilterID(AFilterID: Integer);
    procedure AssignFilterID(AFilterID: Integer);
    procedure RefreshFilters;
    procedure Changed;
    procedure FontChanged;
    procedure CMFontChanged(var Msg: TMessage); message CM_FONTCHANGED;
  public
    property FilterID: Integer read FFilterID write SetFilterID;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

implementation

uses
  QpFilterListUnit, Math, ExtraUnit;

{$R *.dfm}

{ TQpFilterFrame }

procedure TQpFilterFrame.SetFilterID(AFilterID: Integer);
begin
  if FFilterID <> AFilterID then AssignFilterID(AFIlterID);
end;

procedure TQpFilterFrame.AssignFilterID(AFilterID: Integer);
var
  Index: Integer;
begin
  Index := FilterCombo.Items.IndexOfObject(Pointer(AFilterID));
  if Index <> -1 then
  begin
    FilterCombo.ItemIndex := Index;
    FFilterID := AFilterID;
    Changed;
  end;
end;

procedure TQpFilterFrame.FilterComboChange(Sender: TObject);
var
  FID: Integer;
begin
  if FilterCombo.ItemIndex = FilterCombo.Items.Count - 1 then
  begin
    FilterListForm.FilterID := FilterID;
    FID := 0;
    if FilterListForm.ShowModal = mrOK then FID := FilterListForm.FilterID;
    RefreshFilters;
    AssignFilterID(FID);
  end else
  begin
    FFilterID := Integer(FilterCombo.Items.Objects[FilterCombo.ItemIndex]);
    Changed;
  end;
end;

procedure TQpFilterFrame.Changed;
begin
  if Assigned(OnChange) then OnChange(Self);
end;

procedure TQpFilterFrame.FilterComboDropDown(Sender: TObject);
begin
  RefreshFilters;
end;

procedure TQpFilterFrame.RefreshFilters;
var
  NewListID: Integer;
begin
  NewListID := FilterListForm.UpdateList(FilterCombo.Items, FilterCombo.Tag);
  if FilterCombo.Tag <> NewListID then
  begin
    AssignFilterID(FilterID);
    FilterCombo.Tag := NewListID;
  end;
end;

procedure TQpFilterFrame.CMFontChanged(var Msg: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) and HandleAllocated then FontChanged;
end;

procedure TQpFilterFrame.FontChanged;
begin
  FilterCombo.Top := 3 + FilterCombo.Height + 4;
  FilterCombo.Width := Max(150, TextWidth(Self, '<Нет ограничений>') + 2 * FilterCombo.Height);
  Width := ControlOffsetX(FilterCombo, 2);
end;

end.
