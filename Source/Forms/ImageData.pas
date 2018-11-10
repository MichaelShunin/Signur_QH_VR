unit ImageData;

interface

uses
  SysUtils, Classes, ImgList, Controls, Graphics, Buttons;

const
  clStdColor      = $00E8E8E8;
  clReadOnlyColor = $00E8D8C8;
  clRedColor     = $00F0A0FF;

  //Картинки 32x16
  mbPrev         = 0;
  mbNext         = 1;
  mbCancel       = 2;
  mbFilter       = 3;
  mbToolFilter   = 4;
  mbToolFilterF  = 5;
  mbAll          = 6;

const
  //Картинки 32x32
  bbSave         = 0;
  bbCancel       = 0;


type
  TImageDataModule = class(TDataModule)
    ImageList: TImageList;
    BigImageList: TImageList;
    SmallImageList: TImageList;
    ImageList16: TImageList;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImageDataModule: TImageDataModule;

procedure LoadMiddleButton(AButton: TSpeedButton; Index: integer);

procedure LoadBigButton(AButton: TSpeedButton; Index: integer);


implementation


{$R *.dfm}

procedure LoadMiddleButton(AButton: TSpeedButton; Index: integer);
begin
  AButton.Glyph:=nil;
  if not Assigned(ImageDataModule)
    then ImageDataModule:=TImageDataModule.Create(nil);
  ImageDataModule.ImageList.GetBitMap(Index, AButton.Glyph);
end;

procedure LoadBigButton(AButton: TSpeedButton; Index: integer);
begin
  AButton.Glyph:=nil;
  if not Assigned(ImageDataModule)
    then ImageDataModule:=TImageDataModule.Create(nil);
  ImageDataModule.BigImageList.GetBitMap(Index, AButton.Glyph);
end;


procedure TImageDataModule.DataModuleDestroy(Sender: TObject);
begin
  if self=ImageDataModule then ImageDataModule:=nil;
end;

end.
