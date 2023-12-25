
program MtcGEODemo;
uses
  Forms,
  Graphics,
  MtcDMainUnit,
  MtcGEO,
  MtcGEOGraphics,
  Mtc_Intersections;



{$R *.res}
begin
  Application.Initialize;
  Application.Title := 'MtcGEO Demonstration Suite (version 0.0.1)';
  Application.CreateForm(TMainMtcGeoForm, MainMtcGeoForm);
  Application.Run;
end.
