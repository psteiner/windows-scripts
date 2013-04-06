@echo off

echo [info] find offending file

for /f "tokens=*" %%f in ('where /R "c:\vagrant" "ssh.rb" ^| grep "lib\\\vagrant\\\ssh.rb"') do (set _TMP=%%f)

echo.
set _TMP

set _PATCH=vagrant-ssh-windows-patch.diff

echo [info] make patch file %_PATCH%

 (
    echo/57a58
    echo/^> =begin
    echo/65a67,71
    (echo/^> )
    echo/^> =end
    (echo/^> )
    echo/^>       which = Util::Platform.windows? ? "where ssh >NUL 2>&1" : "which ssh >/dev/null 2>&1"
    echo/^>       raise Errors::SSHUnavailable if !Kernel.system^(which^)
    ) >%_PATCH%
    
echo [info] back up original file

echo copy %_TMP% %_TMP%.%RANDOM%.bak

echo [info] patch %_TMP%

patch -i %_PATCH% %_TMP%

echo [info] cleanup

rem del %_PATCH%