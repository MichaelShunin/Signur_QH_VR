unit CrossMainFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StorageUnit;

type
{ TMainFrame }

  TMainFrame = class(TFrame, IRememberable)
    DefaultButtonImage: TImage;
  private
    FDetailedFrame: TFrame;
  protected
  { IRememberable }
    procedure SaveState(Storage: TStorage; const SectionName, Prefix: string);
    procedure LoadState(Storage: TStorage; const SectionName, Prefix: string);
  public
    property DetailedFrame: TFrame read FDetailedFrame write FDetailedFrame;
  { CrossUnit interface }
    procedure AfterLink; virtual;
    function GetToolButtonCaption: string; virtual;
    function GetToolButtonGlyph: TBitmap; virtual;
  end;

implementation

{$R *.dfm}

{ TMainFrame }

procedure TMainFrame.AfterLink;
begin
  { do nothing }
end;

function TMainFrame.GetToolButtonCaption: string;
begin
  Result := Name;
end;

function TMainFrame.GetToolButtonGlyph: TBitmap;
begin
  Result := DefaultButtonImage.Picture.Bitmap;
end;

{ IRememberable }

procedure TMainFrame.SaveState(Storage: TStorage; const SectionName, Prefix: string);
begin
  SaveChildState(Self, SectionName, Prefix + Name + '.');
end;

procedure TMainFrame.LoadState(Storage: TStorage; const SectionName, Prefix: string);
begin
  LoadChildState(Self, SectionName, Prefix + Name + '.');
end;

end.
