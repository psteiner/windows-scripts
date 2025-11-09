@echo off
REM dox: This script prints "dox" documentation for any script
REM dox: that uses the dox: tag to create embedded documentation.
rem dox: ---
REM dox: dox expects the dox: tag to follow a line-oriented comment token, e.g.
REM dox: REM dox: this is an example of a dox line
REM dox: ---
REM dox: dox can be multi-line, and can be anywhere in the script
REM dox: ---
REM dox: Blank lines can be inserted with three dashes, e.g.
REM dox: REM dox: ---

setlocal EnableDelayedExpansion

if not {%echo%}=={} echo %echo%

REM toggle subroutine tracing
if not {%DEBUG%}=={} (set TRACE=echo) else (set TRACE=rem)

set spec=%1

REM go to the scripts directory
pushd %~dp0

if defined spec (
    set list=*%spec%*
) else (
    set list=*
)

REM loop through all file types specified for the dir command, skip directories
for /f %%i in ('dir /b /a:-d /o:n %list%.pl %list%.py %list%.bat %list%.ini %list%.rb') do (
    call :PRINT_DOX %%i
)

goto :EOF


:PRINT_DOX
    set fname=%1
    REM loop through all lines in the file
    for /f "tokens=1,2,*" %%a in (%fname%) do (
        REM token 1 is the line comment character(s), the "DOX:" tag is token 2
        if /i {%%b} EQU {dox:} (
            REM only output the filename once with a dash leader
            if defined fname (
                echo.
                echo !fname! -------------------------
                set fname=
            )
            REM output the documentation
            if {%%c} EQU {---} (echo.) else (echo    %%c)
        )

    )
goto :EOF

popd

endlocal