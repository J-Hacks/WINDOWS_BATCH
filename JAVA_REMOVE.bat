@echo off
setlocal enabledelayedexpansion
@echo on 
REM Uninstalling Java
echo Uninstalling Java...
echo Machine will restart to cancel close this terminal
echo Machine will restart
echo Machine will restart
pause
@echo off
wmic product where "name like 'Java%%'" call uninstall
