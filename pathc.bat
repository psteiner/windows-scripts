@echo off
REM dox: Count characters in combined user and system PATH environment variables
setLocal EnableDelayedExpansion
for /f %%i in ('path ^| wc -c') do (
    set /a r=%%i-5 
    echo Size of path: !r!
)
endLocal