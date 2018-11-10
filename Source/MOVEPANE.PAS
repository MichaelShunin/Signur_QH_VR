unit Movepane;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls;

type
  TWhoToMove = (mwNone, mwSelf, mwParent);
  TMovingPanel = class(TPanel)
  private
    OldX,
    OldY,
    OldLeft,
    OldTop             : Integer;
    ScreenDC           : HDC;
    MoveRect           : TRect;
    Moving             : Boolean;
    FMoveWho           : TWhoToMove;
    FLimitRect  : TRect;
  protected
    { Protected declarations }
  public
    procedure MouseDown(Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer); override;
    property LimitRect : TRect read FLimitRect write FLImitRect;
  published
    property MoveWho : TWhoToMove  read FMoveWho write FMoveWho;
  end;

procedure Register;

implementation

procedure TMovingPanel.MouseDown(Button: TMouseButton;
                    Shift: TShiftState; X, Y: Integer);
var
   TempRect : TRect;
begin
  inherited MouseDown(Button,Shift,X,Y);
  if (MoveWho <> mwNone) and (Button = mbLeft) then begin
    SetCapture(Self.Handle);
    if MoveWho = mwParent then
       if Parent = Screen.ActiveForm then
          ScreenDC := GetDC(0)
       else
            ScreenDC := GetDC(Parent.Parent.Handle)
    else
        ScreenDC := GetDC(Parent.Handle);

    OldX := X;
    OldY := Y;
    OldLeft := X;
    OldTop := Y;
    if MoveWho = mwParent then
      MoveRect := Rect(Parent.Left, Parent.Top,
                     Parent.Left + Parent.Width, Parent.Top + Parent.Height)
    else
      MoveRect := Rect(Self.Left, Self.Top,
                     Self.Left + Self.Width, Self.Top + Self.Height);
    DrawFocusRect(ScreenDC,MoveRect);
    Moving := True;
  end;
end;

procedure TMovingPanel.MouseMove(Shift: TShiftState; X,Y: Integer);
begin
  inherited MouseMove(Shift,X,Y);
  if (MoveWho <> mwNone) and Moving then begin
    DrawFocusRect(ScreenDC,MoveRect);
    OldX := X;
    OldY := Y;
    if MoveWho = mwParent then
      MoveRect := Rect(Parent.Left+OldX-OldLeft,Parent.Top+OldY-OldTop,
                     Parent.Left+Parent.Width+OldX-OldLeft,Parent.Top+Parent.Height+OldY-OldTop)
    else
      MoveRect := Rect(Self.Left+OldX-OldLeft,Self.Top+OldY-OldTop,
                     Self.Left+Self.Width+OldX-OldLeft,Self.Top+Self.Height+OldY-OldTop);
    DrawFocusRect(ScreenDC,MoveRect);
  end;

end;

procedure TMovingPanel.MouseUp(Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button,Shift,X,Y);
  if (MoveWho <> mwNone) and (Button = mbLeft) then begin
    ReleaseCapture;
    DrawFocusRect(ScreenDC,MoveRect);
    if MoveWho = mwParent then
    begin
      Parent.Visible := False;
      Parent.Left := Parent.Left+X-OldLeft;
      Parent.Top := Parent.Top+Y-OldTop;
      Parent.Visible := True;
    end
    else begin
      Self.Visible := False;
      Self.Left := Self.Left+X-OldLeft;
      Self.Top := Self.Top+Y-OldTop;
      Self.Visible := True;
    end;
    ReleaseDC(0,ScreenDC);
    Moving := False;
  end;
end;


procedure Register;
begin
  RegisterComponents('Samples', [TMovingPanel]);
end;

end.
