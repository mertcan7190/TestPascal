


unit MtcGEOGraphics;

Interface

uses
   Graphics,
   Classes,
   MtcGEO;


type TMtcGEOGraphics = class

    private

       Canvas  : TCanvas;
       FWidth  : Integer;
       FHeight : Integer;

       procedure SetWidth(const cWidth : Integer);
       function  GetWidth : Integer;

       procedure SetHeight(const cHeight : Integer);
       function  GetHeight : Integer;

       procedure SetPen(const cPen : TPen);
       function  GetPen : TPen;

       procedure SetBrush(const cBrush : TBrush);
       function  GetBrush : TBrush;

       function  GetCenterX : Double;
       function  GetCenterY : Double;

    public

       constructor Create(const Can : TCanvas);                                 overload;
       constructor Create(const Can : TCanvas; const cWidth,cHeight:Integer);   overload;

       procedure Clear(const Color:TColor);

       procedure Draw(const Point     : TPoint2D);                              overload;
       procedure Draw(const Line      : TLine2D);                               overload;
       procedure Draw(const Segment   : TSegment2D);                            overload;
       procedure Draw(const Triangle  : TTriangle2D);                           overload;
       procedure Draw(const Rectangle : TRectangle);                            overload;
       procedure Draw(const Quadix    : TQuadix2D);                             overload;
       procedure Draw(const Circle    : TCircle);                               overload;
       procedure Draw(const Polygon   : TPolygon2D);                            overload;
       procedure Draw(const Curve     : TPoint2DArray);                         overload;
       procedure Draw(const Obj       : TGeometricObject);                      overload;

       procedure DrawPixel(const x,y:Double);                                   overload;
       procedure DrawPixel(const Point : TPoint2D);                             overload;

       procedure DrawPoint(const x,y:Double);                                   overload;
       procedure DrawPoint(const Point : TPoint2D);                             overload;

       procedure DrawLine(const x1,y1,x2,y2:Double);                            overload;
       procedure DrawLine(const Point1,Point2:TPoint2D);                        overload;
       procedure DrawLine(const Line : TLine2D);                                overload;

       procedure DrawSegment(const x1,y1,x2,y2:Double);                         overload;
       procedure DrawSegment(const Point1,Point2:TPoint2D);                     overload;
       procedure DrawSegment(const Seg:TSegment2D);                             overload;

       procedure DrawTriangle(const x1,y1,x2,y2,x3,y3:Double);                  overload;
       procedure DrawTriangle(const Point1,Point2,Pnt3:TPoint2D);               overload;
       procedure DrawTriangle(const Triangle : TTriangle2D);                    overload;

       procedure DrawRectangle(const x1,y1,x2,y2:Double);                       overload;
       procedure DrawRectangle(const Point1,Point2:TPoint2D);                   overload;
       procedure DrawRectangle(const Rectangle : TRectangle);                   overload;

       procedure DrawQuadix(const x1,y1,x2,y2,x3,y3,x4,y4:Double);              overload;
       procedure DrawQuadix(const Point1,Point2,Pnt3,Pnt4:TPoint2D);            overload;
       procedure DrawQuadix(const Quad:TQuadix2D);                              overload;

       procedure DrawCircle(const x,y,Radius:Double);                           overload;
       procedure DrawCircle(const Point : TPoint2D; const Radius:Double);       overload;
       procedure DrawCircle(const Circle :TCircle);                             overload;

       procedure DrawEllipse(const x,y,a,b:Double);                             overload;


       procedure DrawPolygon(const Point:array of TPoint2D);                    overload;
       procedure DrawPolygon(const Polygon:TPolygon2D);                         overload;

       procedure DrawCurve(Const Curve : TPoint2DArray);

       property  Width   : Integer read GetWidth  write SetWidth;
       property  Height  : Integer read GetHeight write SetHeight;
       Property  CenterX : Double  read GetCenterX;
       Property  CenterY : Double  read GetCenterY;
       property  Pen     : TPen    read GetPen    write SetPen;
       property  Brush   : TBrush  read GetBrush  write SetBrush;
end;




Implementation

constructor TMtcGEOGraphics.Create(const Can:TCanvas);
begin
  Canvas := Can;
  Width  := 0;
  Height := 0;
end;
(* End Of Create *)


constructor TMtcGEOGraphics.Create(const Can:TCanvas; const cWidth,cHeight:Integer);
begin
  Canvas := Can;
  Width  := cWidth;
  Height := cHeight;
end;
(* End Of Create *)


procedure TMtcGEOGraphics.SetWidth(const cWidth : Integer);
begin
  FWidth := cWidth;
end;
(* End Of Set Width *)

function TMtcGEOGraphics.GetWidth : Integer;
begin
 Result := FWidth;
end;
(* End Of Get Width *)


procedure TMtcGEOGraphics.SetHeight(const cHeight : Integer);
begin
  FHeight := cHeight;
end;
(* End Of Set Height*)


function TMtcGEOGraphics.GetHeight : Integer;
begin
  Result := FHeight;
end;
(* End Of Get Height *)


procedure TMtcGEOGraphics.Clear(const Color:TColor);
var
  TmpBrushColor : TColor;
  TmpBrushStyle : TBrushStyle;
begin
  TmpBrushColor := Canvas.Brush.Color;
  TmpBrushStyle := Canvas.Brush.Style;

  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(Rect(0,0,Width,Height));

  Canvas.Brush.Color := TmpBrushColor;
  Canvas.Brush.Style := TmpBrushStyle;
end;
(* End Of Clear *)


procedure TMtcGEOGraphics.Draw(const Point:TPoint2D);
begin
  DrawPoint(Point);
end;
(* End of Draw *)


procedure TMtcGEOGraphics.Draw(const Line:TLine2D);
begin
  DrawLine(Line);
end;
(* End of Draw *)


procedure TMtcGEOGraphics.Draw(const Segment:TSegment2D);
begin
  DrawSegment(Segment);
end;
(* End of Draw *)


procedure TMtcGEOGraphics.Draw(const Triangle:TTriangle2D);
begin
  DrawTriangle(Triangle);
end;
(* End of Draw *)


procedure TMtcGEOGraphics.Draw(const Rectangle:TRectangle);
begin
  DrawRectangle(Rectangle);
end;
(* End of Draw *)


procedure TMtcGEOGraphics.Draw(const Quadix:TQuadix2D);
begin
  DrawQuadix(Quadix);
end;
(* End of Draw *)


procedure TMtcGEOGraphics.Draw(const Circle:TCircle);
begin
  DrawCircle(Circle);
end;
(* End of Draw *)


procedure TMtcGEOGraphics.Draw(const Polygon:TPolygon2D);
begin
  DrawPolygon(Polygon);
end;
(* End of Draw *)


procedure TMtcGEOGraphics.Draw(Const Curve:TPoint2DArray);
begin
  DrawCurve(Curve);
end;
(* End of Draw *)


procedure TMtcGEOGraphics.Draw(const Obj : TGeometricObject);
begin
  case Obj.ObjectType of
    geoPoint2D   : Draw(Obj.Point2D   );
    geoLine2D    : Draw(Obj.Line2D    );
    geoSegment2D : Draw(Obj.Segment2D );
    geoTriangle2D: Draw(Obj.Triangle2D);
    geoQuadix2D  : Draw(Obj.Quadix2D  );
    geoRectangle : Draw(Obj.Rectangle );
    geoCircle    : Draw(Obj.Circle    );
    //geoPolygon2D : DrawPolygon(@Obj.Polygon2D);
  end;
end;
(* End of Draw *)


procedure TMtcGEOGraphics.DrawPixel(const x,y:Double);
begin
  Canvas.Pixels[Round(x),Round(y)] := Canvas.Pen.Color;
end;
(* End Of DrawPixel *)


procedure TMtcGEOGraphics.DrawPixel(const Point : TPoint2D);
begin
  DrawPixel(Point.x,Point.y);
end;
(* End Of DrawPixel *)


procedure TMtcGEOGraphics.DrawPoint(const x,y:Double);
begin
  Canvas.MoveTo(Round(x)    ,Round(y)    );
  Canvas.LineTo(Round(x) + 1,Round(y) + 1);
end;
(* End Of DrawPoint *)


procedure TMtcGEOGraphics.DrawPoint(const Point : TPoint2D);
begin
  DrawPoint(Point.x,Point.y);
end;
(* End Of DrawPoint *)


procedure TMtcGEOGraphics.DrawLine(const x1,y1,x2,y2:Double);
begin
  Canvas.MoveTo(Round(x1),Round(y1));
  Canvas.LineTo(Round(x2),Round(y2));
end;
(* End Of DrawLine *)


procedure TMtcGEOGraphics.DrawLine(const Point1,Point2:TPoint2D);
begin
  DrawLine(Point1.x,Point1.y,Point2.x,Point2.y);
end;
(* End Of DrawLine *)


procedure TMtcGEOGraphics.DrawLine(const Line : TLine2D);
begin
  DrawLine(Line[1],Line[2]);
end;
(* End Of DrawLine *)


procedure TMtcGEOGraphics.DrawSegment(const x1,y1,x2,y2:Double);
begin
  Canvas.MoveTo(Round(x1),Round(y1));
  Canvas.LineTo(Round(x2),Round(y2));
end;
(* End Of DrawSegment *)


procedure TMtcGEOGraphics.DrawSegment(const Point1,Point2:TPoint2D);
begin
  DrawLine(Point1,Point2);
end;
(* End Of Draw Segment *)


procedure TMtcGEOGraphics.DrawSegment(const Seg:TSegment2D);
begin
  DrawLine(Seg[1],Seg[2]);
end;
(* End Of Draw Segment *)


procedure TMtcGEOGraphics.DrawTriangle(const x1,y1,x2,y2,x3,y3:Double);
begin
  DrawLine(x1,y1,x2,y2);
  DrawLine(x1,y1,x3,y3);
  DrawLine(x2,y2,x3,y3);
end;
(* End Of Draw Triangle *)


procedure TMtcGEOGraphics.DrawTriangle(const Point1,Point2,Pnt3:TPoint2D);
begin
  DrawSegment(Point1,Point2);
  DrawSegment(Point1,Pnt3);
  DrawSegment(Point2,Pnt3);
end;
(* End Of Draw Triangle *)


procedure TMtcGEOGraphics.DrawTriangle(const Triangle : TTriangle2D);
begin
  DrawSegment(Triangle[1],Triangle[2]);
  DrawSegment(Triangle[2],Triangle[3]);
  DrawSegment(Triangle[3],Triangle[1]);
end;
(* End Of Draw Triangle *)


procedure TMtcGEOGraphics.DrawRectangle(const x1,y1,x2,y2:Double);
begin
  DrawSegment(x1,y1,x2,y1);
  DrawSegment(x2,y1,x2,y2);
  DrawSegment(x2,y2,x1,y2);
  DrawSegment(x1,y2,x1,y1);
end;
(* End Of Draw Rectangle *)


procedure TMtcGEOGraphics.DrawRectangle(const Point1,Point2:TPoint2D);
begin
  DrawRectangle(Point1.x,Point1.y,Point2.x,Point2.y);
end;
(* End Of Draw Rectangle *)


procedure TMtcGEOGraphics.DrawRectangle(const Rectangle : TRectangle);
begin
  DrawRectangle(Rectangle[1],Rectangle[2]);
end;
(* End Of Draw Rectangle *)


procedure TMtcGEOGraphics.DrawQuadix(const x1,y1,x2,y2,x3,y3,x4,y4:Double);
begin
  DrawSegment(x1,y1,x2,y2);
  DrawSegment(x2,y2,x3,y3);
  DrawSegment(x3,y3,x4,y4);
  DrawSegment(x4,y4,x1,y1);
end;
(* End Of Draw Quadix *)


procedure TMtcGEOGraphics.DrawQuadix(const Point1,Point2,Pnt3,Pnt4:TPoint2D);
begin
  DrawSegment(Point1,Point2);
  DrawSegment(Point2,Pnt3);
  DrawSegment(Pnt3,Pnt4);
  DrawSegment(Pnt4,Point1);
end;
(* End Of Draw Quadix *)


procedure TMtcGEOGraphics.DrawQuadix(const Quad:TQuadix2D);
begin
  DrawQuadix(Quad[1],Quad[2],Quad[3],Quad[4]);
end;
(* End Of Draw Quadix *)


procedure TMtcGEOGraphics.DrawCircle(const x,y,Radius:Double);
begin
  Canvas.Ellipse(Round(x - Radius),Round(y - Radius),Round(x + Radius),Round(y + Radius));
end;
(* End Of Draw Circle *)


procedure TMtcGEOGraphics.DrawCircle(const Point : TPoint2D; const Radius:Double);
begin
  Canvas.Ellipse(Round(Point.x - Radius),Round(Point.y - Radius),Round(Point.x + Radius),Round(Point.y + Radius));
end;
(* End Of Draw Circle *)


procedure TMtcGEOGraphics.DrawCircle(const Circle :TCircle);
begin
  DrawCircle(Circle.x,Circle.y,Circle.Radius);
end;
(* End Of Draw Circle *)


procedure TMtcGEOGraphics.DrawEllipse(const x,y,a,b:Double);
begin
  Canvas.Ellipse(Round(x - a),Round(y - b),Round(x + a),Round(y + b));
end;
(* End Of Draw Ellipse *)


procedure TMtcGEOGraphics.DrawPolygon(const Point:array of TPoint2D);
var
  i : Integer;
  j : Integer;
begin
  j := Length(Point) - 1;
  for i := 0 to Length(Point) - 1 do
  begin
    DrawLine(Point[j],Point[i]);
    j := i;
  end;
end;
(* End Of Draw Polygon *)


procedure TMtcGEOGraphics.DrawPolygon(const Polygon:TPolygon2D);
var
  i : Integer;
  j : Integer;
begin
 j := Length(Polygon) -1;
 for i := 0 to Length(Polygon) - 1 do
 begin
  DrawLine(Polygon[j],Polygon[i]);
  j := i;
 end;
end;
(* End Of Draw Polygon *)


procedure TMtcGEOGraphics.DrawCurve(Const Curve : TPoint2DArray);
var
  i : Integer;
begin
  for i := 0 To Length(Curve) - 2 do
  begin
    DrawLine(Curve[i],Curve[i + 1]);
  end;
end;
(* End Of Draw Curve *)


procedure TMtcGEOGraphics.SetPen(const cPen : TPen);
begin
  Canvas.Pen := cPen;
end;
(* End Of Set Pen *)


function TMtcGEOGraphics.GetPen : TPen;
begin
  Result := Canvas.Pen;
end;
(* End Of Get Pen *)


procedure TMtcGEOGraphics.SetBrush(const cBrush : TBrush);
begin
  Canvas.Brush := cBrush;
end;
(* End Of Get Brush *)


function TMtcGEOGraphics.GetBrush : TBrush;
begin
  Result := Canvas.Brush;
end;
(* End Of Set Brush *)


function TMtcGEOGraphics.GetCenterX : Double;
begin
  Result := FWidth * 0.5;
end;
(* End Of Get Center X *)


function TMtcGEOGraphics.GetCenterY : Double;
begin
  Result := FHeight * 0.5;
end;
(* End Of Get Center Y *)




end.
