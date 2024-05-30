@echo off
setlocal enabledelayedexpansion

rem Define network prefix
set "network_prefix=192.168.0"

rem Function to check if IP is up
:is_up
set "ip=%1"
ping -n 1 -w 1000 !ip! >nul && (
    echo !ip! is up
    call :get_folders !ip!
) || (
    echo !ip! is down
)
exit /b

rem Function to get folders
:get_folders
set "ip=%1"
set "root_path=\\!ip!\c$\Users"
if not exist "!root_path!" exit /b


echo Folders on !ip!:
for /d %%F in ("!root_path!\*") do (
    echo %%F
)
exit /b

rem Main script
for /l %%i in (1,1,254) do (
    call :is_up %network_prefix%.%%i
)

