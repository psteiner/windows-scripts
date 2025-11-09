@echo off
rem dox: Print system PATH in single lines
rem dox: source: http://www.perlmonks.org/?node_id=757655
REM dox: %path:;=" "% turns semicolons into spaces
for %%i in ("%path:;=" "%") do (
    if {%1} EQU {} (
        REM %%~i strips surrounding spaces
        echo %%~i
    ) else (
        REM filter on %1
        echo %%~i | find /i "%1"
    )
)
