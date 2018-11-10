unit GUTForVCL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ComCtrls, StdCtrls, Grids, DB, DBTables, DBGrids,
  DBCtrls;

type
  TAlignmentV = (          // Вертикальное выравнивание строк
    vaTopJustify,          // - по верхней кромке
    vaCenter,              // - по центру
    vaBottomJustify);      // - по нижней кромке


procedure UTAdjustShadowBitmap(   // Настроить теневой TBitMap
  ACanvas: TCanvas;               // -- канва-образец (основная канва для вывода)
  ARect: TRect;                   // -- область для вывода основной канва
  ABitMap: TBitMap);             


procedure UTCopyFromImageList(    // Скопировать BitMap из ImageList-а в канву
  ACanvas: TCanvas;               // -- канва для вывода
  ARect: TRect;                   // -- область канвы, куда копируется BitMap
  AImageList: TImageList;         // -- ImageList, из которого копируется картинка
  AImageIndex: integer;           // -- индекс картинки в ImageList-е
  HAlignment: TAlignment;         // -- ключ выравнивания по горизонтали
  VAlignment: TAlignmentV;        // -- ключ выравнивания по вертикали
  AStretchIfGreater: Boolean);    // -- true - сжимать BiyMap, если картинка не помещается

procedure UTCopyBitMap(           // Скопировать BitMap в канву
  ACanvas: TCanvas;               // -- канва для вывода
  ARect: TRect;                   // -- область канвы, куда копируется BitMap
  ABitMap: TBitMap;               // -- копируемый BitMap
  HAlignment: TAlignment;         // -- ключ выравнивания по горизонтали
  VAlignment: TAlignmentV;        // -- ключ выравнивания по вертикали
  AStretchIfGreater: Boolean);    // -- true - сжимать BiyMap, если картинка не помещается

procedure UTDisplayShadowBitmap(  // Скопировать теневую канву на основную
  ACanvas: TCanvas;               // -- канва-образец (основная канва для вывода)
  ARect: TRect;                   // -- область для вывода основной канвы
  ABitMap: TBitMap);              // -- копируемый BitMap

implementation

{          Настроить параметры теневого TBitMap-а          }

procedure UTAdjustShadowBitmap(ACanvas: TCanvas; ARect: TRect; ABitMap: TBitMap);
var
  XWidth,XHeight: integer;
begin
  if ABitmap<>nil then begin
    XWidth:=ARect.Right-ARect.Left;
    XHeight:=ARect.Bottom-ARect.Top;
    ABitmap.Width:=XWidth;
    ABitmap.Height:=XHeight;

    ABitmap.Canvas.Font:=ACanvas.Font;
    ABitmap.Canvas.Font.Color:=ACanvas.Font.Color;
    ABitmap.Canvas.Brush:=ACanvas.Brush;
    ABitmap.Canvas.Pen:=ACanvas.Pen;

    ABitmap.Canvas.FillRect(Classes.Rect(0,0,XWidth,XHeight));
    end;
end;


{        Скопировать BitMap из ImageList-а в канву         }

procedure UTCopyFromImageList(ACanvas: TCanvas; ARect: TRect;
          AImageList: TImageList; AImageIndex: integer;
          HAlignment: TAlignment; VAlignment: TAlignmentV;
          AStretchIfGreater: Boolean);
var
  XBitMap: TBitMap;
  XWidth,XHeight: integer;
  XRect: TRect;
begin
  if Assigned(AImageList) then begin
    XBitMap:=TBitMap.Create;
    if Assigned(XBitMap) then begin
      try
        XWidth:=AImageList.Width; XHeight:=AImageList.Height;
        XBitMap.Width:=XWidth; XBitMap.Height:=XHeight;
        XRect:=Rect(0,0,XWidth,XHeight);
        XBitMap.Canvas.Brush.Color:=ACanvas.Brush.Color;
        XBitMap.Canvas.FillRect(XRect);
        AImageList.GetBitmap(AImageIndex,XBitMap);
        XBitMap.TransparentColor:=ACanvas.Brush.Color;
        UTCopyBitMap(ACanvas,ARect,XBitMap,
                     HAlignment,VAlignment,AStretchIfGreater);
      finally
        XBitMap.Free;
        end;
      end;
    end;
end;

{       Скопировать BitMap в указанную область канвы       }

procedure UTCopyBitMap(ACanvas: TCanvas; ARect: TRect; ABitMap: TBitMap;
                       HAlignment: TAlignment; VAlignment: TAlignmentV;
                       AStretchIfGreater: Boolean);
var
  XBitMap,YBitMap: TBitMap;
  XRect,YRect: TRect;
  XWidth,YWidth: integer;
  XHeight,YHeight: integer;
begin
  if not Assigned(ACanvas) or not Assigned(ABitMap) then exit;
  YBitMap:=nil;

  try
    if AStretchIfGreater and
       ((ARect.Right-ARect.Left<ABitMap.Width) or
        (ARect.Bottom-ARect.Top<ABitMap.Height))
    then begin
      YBitMap:=TBitMap.Create;
      if ARect.Right-ARect.Left<ABitMap.Width
        then YBitMap.Width:=ARect.Right-ARect.Left
        else YBitMap.Width:=ABitMap.Width;
      if ARect.Bottom-ARect.Top<ABitMap.Height
        then YBitMap.Height:=ARect.Bottom-ARect.Top
        else YBitMap.Height:=ABitMap.Height;
      YRect:=Rect(0,0,YBitMap.Width,YBitMap.Height);
      YBitMap.Canvas.StretchDraw(YRect,ABitMap);
      YBitMap.TransparentColor:=ABitMap.TransparentColor;
      XBitMap:=YBitMap;
      end
    else XBitMap:=ABitMap;

    XRect:=ARect; YRect:=Rect(0,0,XBitMap.Width,XBitMap.Height);
    XWidth:=XRect.Right-XRect.Left;
    YWidth:=YRect.Right-YRect.Left;
    if XWidth>=YWidth then begin
      case HAlignment of
        taLeftJustify: XRect.Right:=XRect.Left+YWidth;
        taRightJustify: XRect.Left:=XRect.Right-YWidth;
        taCenter: begin
          XRect.Left:=XRect.Left + (XWidth-YWidth) div 2;
          XRect.Right:=XRect.Left+YWidth;
          end;
        end;
      end
    else begin
      case HAlignment of
        taLeftJustify: YRect.Right:=YRect.Left+XWidth;
        taRightJustify: YRect.Left:=YRect.Right-XWidth;
        taCenter: begin
          YRect.Left:=YRect.Left + (YWidth-XWidth) div 2;
          YRect.Right:=YRect.Left+XWidth;
          end;
        end;
      end;
    XHeight:=XRect.Bottom-XRect.Top;
    YHeight:=YRect.Bottom-YRect.Top;
    if XHeight>=YHeight then begin
      case VAlignment of
        vaTopJustify: XRect.Bottom:=XRect.Top+YHeight;
        vaBottomJustify: XRect.Top:=XRect.Bottom-YHeight;
        vaCenter: begin
          XRect.Top:=XRect.Top + (XHeight-YHeight) div 2;
          XRect.Bottom:=XRect.Top+YHeight;
          end;
        end;
      end
    else begin
      case VAlignment of
        vaTopJustify: YRect.Bottom:=YRect.Top+XHeight;
        vaBottomJustify: YRect.Top:=YRect.Bottom-XHeight;
        vaCenter: begin
          YRect.Top:=YRect.Top + (YHeight-XHeight) div 2;
          YRect.Bottom:=YRect.Top+XHeight;
          end;
        end;
      end;
    ACanvas.BrushCopy(XRect,XBitMap,YRect,XBitMap.TransparentColor);
  finally
    if Assigned(YBitMap) then YBitMap.Free;
    end;
end;

{ Скопировать теневую канву на основную (закончить вывод)  }

procedure UTDisplayShadowBitmap(ACanvas: TCanvas; ARect: TRect;
                                ABitMap: TBitMap);
var
  XRect: TRect;
begin
  XRect:=Classes.Rect(0,0,ARect.Right-ARect.Left,
                        ARect.Bottom-ARect.Top);
  ACanvas.CopyRect(ARect,ABitmap.Canvas,XRect);
end;


end.
