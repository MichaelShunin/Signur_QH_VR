unit CrossDetailedFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StorageUnit;

type
{ TDetailedFrame }

  TDetailedFrame = class(TFrame, IRememberable)
    PageControl: TPageControl;
  private
    FMainFrame: TFrame;
  protected
  { IRememberable }
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string);
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string);
  public
    procedure AfterLink; virtual;
    property MainFrame: TFrame read FMainFrame write FMainFrame;
  end;

implementation

{$R *.dfm}

{ TDetailedFrame }

procedure TDetailedFrame.AfterLink;
begin
  { do nothing }
end;

{ IRememberable }

procedure TDetailedFrame.SaveState(Storage: TStorage; const SectionName, Prefix: string);
begin
  SaveChildState(Self, SectionName, Prefix + Name + '.');
end;

procedure TDetailedFrame.LoadState(Storage: TStorage; const SectionName, Prefix: string);
begin
  LoadChildState(Self, SectionName, Prefix + Name + '.');
end;

end.
