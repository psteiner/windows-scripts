@echo off
REM dox: Clone raylib-template from my Github repo to new project name

setlocal EnableDelayedExpansion

if not {%echo%}=={} echo %echo%

REM toggle subroutine tracing
if not {%DEBUG%}=={} (set TRACE=echo) else (set TRACE=rem)

if {%1} equ {} (
   echo Usage: %0 project_name
   goto :EOF
)

set _TEMPLATE=raylib-template
set _PROJECT_NAME=%1
set _URL=https://github.com/psteiner/

git clone %_URL%%_TEMPLATE% %_PROJECT_NAME%
pushd %_PROJECT_NAME%
git remote remove origin
git remote add origin %_URL%%_PROJECT_NAME%
git remote -v
popd
endLocal