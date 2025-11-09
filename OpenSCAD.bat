@echo off
REM: dox: Fix OpenSCAD position on second monitor

reg add HKCU\SOFTWARE\OpenSCAD\OpenSCAD\window /v position /t REG_SZ /d "@Point(0 0)" /f

start "" "C:\Program Files\OpenSCAD\openscad.exe"
