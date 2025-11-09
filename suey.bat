@echo off
rem dox: suey.bat - almost su on Windows :)
rem if {%1}=={} echo suey.bat [username] & goto :EOF
runas /u:Administrator /savecred "cmd /k /t:0A & title suey & cd %1 & cls"
