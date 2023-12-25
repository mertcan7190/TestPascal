@echo off

SET MSBUILD="C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\amd64\MSBuild.exe"
SET RSVARS="C:\Program Files (x86)\Embarcadero\Studio\21.0\bin\rsvars.bat"


SET PROJECT=C:\Users\mertcan.sayiner\Desktop\TestPascal\MtcGEODemo.dproj


call %RSVARS%
%MSBUILD% %PROJECT% "/t:Clean,Make" "/p:config=Debug" "/verbosity:minimal"

if %ERRORLEVEL% NEQ 0 GOTO END



echo. 

C:\Users\mertcan.sayiner\Desktop\TestPascal\MtcGEODemo.exe

:END