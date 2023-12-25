
unit MtcDMainUnit;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  Menus,
  MtcGEO,
  MtcGEOGraphics,
  Mtc_Intersections;



type eFunctions = (
                   eSegmentIntersections,
                   eRandomSegmentIntersections,
                   eRandomCircleIntersections
                  );


const cFunctionStrings : array [Low(eFunctions)..High(eFunctions)] of string = (
                                                                                'Vektor Kesisimleri',
                                                                                'Rastgele Vektor Kesisimleri',
                                                                                'Rastgele Cember Kesisimleri'
                                                                               );


type MtcGEOProctor = procedure(const Graphic : TMtcGeoGraphics);

type fg_functionality = record
     functype : eFunctions;
     proctor  : MtcGEOProctor;
     valid    : Boolean;
end;



type
  TMainMtcGeoForm = class(TForm)
    PaintPanel             : TPanel;
    StatusBar              : TStatusBar;
    MainMenu               : TMainMenu;
    MenuItem_File          : TMenuItem;
    MenuItem_Exit          : TMenuItem;
    ControlPanel           : TPanel;
    OptionsPanel           : TPanel;
    RefreshButton          : TButton;
    Splitter1              : TSplitter;
    PaintBox: TPaintBox;
    MainPageControl: TPageControl;
    BasicFunctionsTabSheet: TTabSheet;
    BFGroup: TRadioGroup;

    procedure BFGroupClick       (Sender: TObject);
    procedure FormCreate         (Sender: TObject);
    procedure RefreshButtonClick (Sender: TObject);
    procedure PaintBoxResize     (Sender: TObject);
    procedure PaintBoxPaint      (Sender: TObject);


  private
    { Private declarations }

    FuncList : Array of fg_functionality;

    procedure ExecuteProctor;
    procedure Clear;

  public
    { Public declarations }

  end;

var
  MainMtcGeoForm: TMainMtcGeoForm;

implementation

{$R *.dfm}

function Create_FGFType(const functype : eFunctions; const proctor : MtcGEOProctor):fg_functionality;
begin
  Result.functype := functype;
  Result.proctor  := proctor;
  Result.valid    := True;
end;


procedure TMainMtcGeoForm.FormCreate(Sender: TObject);
var
  eFuncIter : eFunctions;
  i         : Integer;
begin
  for eFuncIter := Low(eFunctions) to High(eFunctions) do
  begin
    BFGroup.Items.Add(cFunctionStrings[eFuncIter]);
  end;

  if Assigned(FuncList) then
    Finalize(FuncList);

  SetLength(FuncList,Ord(High(eFunctions)) + 1);

  for i := 0 to Length(FuncList) - 1 do
  begin
    FuncList[i].valid := False;
  end;

  (* Register Demo Functions *)
  FuncList[Ord(eSegmentIntersections)      ] := Create_FGFType(eSegmentIntersections,       SegmentIntersect00     );
  FuncList[Ord(eRandomSegmentIntersections)] := Create_FGFType(eRandomSegmentIntersections, SegmentIntersect01     );
  FuncList[Ord(eRandomCircleIntersections) ] := Create_FGFType(eRandomCircleIntersections,  CircleIntersect00      );



  Clear;

end;

procedure TMainMtcGeoForm.RefreshButtonClick(Sender: TObject);
begin
  ExecuteProctor;
end;


procedure TMainMtcGeoForm.BFGroupClick(Sender: TObject);
begin
  ExecuteProctor;
end;


procedure TMainMtcGeoForm.ExecuteProctor;
var
  Graphic : TMtcGEOGraphics;
begin
  if BFGroup.ItemIndex > -1 then
  begin
    Graphic := TMtcGEOGraphics.Create(PaintBox.Canvas,PaintBox.Width,PaintBox.Height);
    try
      PaintBox.Canvas.Brush.Style := bsClear;
      StatusBar.SimpleText := 'Current View: ' + BFGroup.Items[BFGroup.ItemIndex];
      if FuncList[BFGroup.ItemIndex].valid then
      begin
        try
          FuncList[BFGroup.ItemIndex].proctor(Graphic);
        except

        end;

      end
      else
      begin

      end;
    finally
      Graphic.Free;
    end;
  end;
end;




procedure TMainMtcGeoForm.PaintBoxResize(Sender: TObject);
begin
 {$IFDEF GR32_USED}
   PaintBox.Buffer.Clear(clWhite32);
 {$ENDIF}
 ExecuteProctor;
end;


procedure TMainMtcGeoForm.Clear;
var
  Graphic : TMtcGEOGraphics;
begin
  Graphic := TMtcGEOGraphics.Create(PaintBox.Canvas,PaintBox.Width,PaintBox.Height);
  try
    Graphic.Clear(clWhite);
  finally
    Graphic.Free;
  end;
end;


procedure TMainMtcGeoForm.PaintBoxPaint(Sender: TObject);
begin
  Clear;
  ExecuteProctor;
end;

end.
