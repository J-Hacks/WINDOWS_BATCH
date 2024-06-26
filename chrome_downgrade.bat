@echo off
title Uninstall and Install Specific Version of Google Chrome

REM Define variables
set networkPath=\\path\to\network\location\chrome_installer.exe
set chromeInstaller=%temp%\chrome_installer.exe

REM Uninstall Google Chrome
echo Uninstalling Google Chrome...
wmic product where "name='Google Chrome'" call uninstall /nointeractive
if %errorlevel% neq 0 (
    echo Error uninstalling Google Chrome or Google Chrome is not installed.
)

REM Wait for a few seconds to ensure uninstallation is complete
timeout /t 5 /nobreak >nul

REM Copy installer from network path
echo Copying Chrome installer from network path...
copy %networkPath% %chromeInstaller%
if %errorlevel% neq 0 (
    echo Error copying Chrome installer from network path.
    exit /b %errorlevel%
)

REM Install Chrome
echo Installing Chrome...
start /wait %chromeInstaller% /silent /install
if %errorlevel% neq 0 (
    echo Error installing Chrome.
    exit /b %errorlevel%
)

REM Stop and disable Chrome update service
echo Stopping and disabling Chrome update service...
sc stop gupdate
sc config gupdate start= disabled
sc stop gupdatem
sc config gupdatem start= disabled

REM Clean up
echo Cleaning up...
del %chromeInstaller%

REM Notify user
echo Chrome has been successfully uninstalled and reinstalled. > %temp%\chrome_notification.txt
msg * /time:0 < %temp%\chrome_notification.txt
del %temp%\chrome_notification.txt

exit
