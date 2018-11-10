unit DetailFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StorageUnit;

type
{ TDetailFrame }

  TDetailFrame = class(TFrame, IRememberable)
  private
    procedure CMFontChanged(var Msg: TMessage); message CM_FONTCHANGED;
  protected
  { IRememberable }
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string);
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string);
  protected
    FSavedActiveControl: TWinControl;
    FID: Integer;
    procedure SetTitle(const Title: string);
    procedure FontChanged; virtual;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure CloseFrame;
    procedure Initialize(AID: Integer); virtual;
    property ID: Integer read FID;
  end;

implementation

{$R *.dfm}

{ TDetailFrame }

procedure TDetailFrame.AfterConstruction;
begin
  inherited AfterConstruction;
 // if Owner.Owner <> nil then StorageUnit.LoadState(Self, Owner.Owner.Name, 'FRAME#'+Name);
end;

procedure TDetailFrame.BeforeDestruction;
begin
//  if Owner.Owner <> nil then StorageUnit.SaveState(Self, Owner.Owner.Name, 'FRAME#'+Name);
  inherited BeforeDestruction;
end;

procedure TDetailFrame.Initialize(AID: Integer);
begin
  FID := AID;
end;

{ IRememberable }

procedure TDetailFrame.SaveState(Storage: TStorage; const SectionName, Prefix: string);
begin
//  SaveChildState(Self, SectionName, Prefix + Name + '.');
end;

procedure TDetailFrame.LoadState(Storage: TStorage; const SectionName, Prefix: string);
begin
//  LoadChildState(Self, SectionName, Prefix + Name + '.');
end;

type
  TXWinControl = class(TWinControl)
  end;

procedure TDetailFrame.SetTitle(const Title: string);
begin
  TXWinControl(Parent).Text := Title;
end;

procedure TDetailFrame.CloseFrame;
begin
  if Parent <> nil then PostMessage(Parent.Handle, CM_RELEASE, 0, 0);
end;

procedure TDetailFrame.CMFontChanged(var Msg: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) and HandleAllocated then FontChanged;
end;

procedure TDetailFrame.FontChanged;
begin
  { do nothing }
end;


end.
