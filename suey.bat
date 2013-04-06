@echo off
rem suey.bat - almost su
rem if {%1}=={} echo suey.bat [username] & goto :EOF
runas /u:Administrator /savecred "cmd /k /t:0A & title suey & cd %1 & cls"
