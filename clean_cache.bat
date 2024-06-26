@echo off
title Clean Cache and Temp Files
echo Cleaning Cache and Temp Files...

REM Stop Windows Update service
echo Stopping Windows Update service...
net stop wuauserv
echo Windows Update service stopped.

REM Clear Windows Temp folder
echo Deleting Windows Temp files...
del /s /q %windir%\temp\*
for /d %%p in (%windir%\temp\*.*) do rmdir /s /q "%%p"

REM Clear User Temp folder
echo Deleting User Temp files...
del /s /q %temp%\*
for /d %%p in (%temp%\*.*) do rmdir /s /q "%%p"

REM Clear Internet Explorer cache
echo Deleting Internet Explorer Cache...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8

REM Clear Internet Explorer Cookies
echo Deleting Internet Explorer Cookies...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2

REM Clear Internet Explorer History
echo Deleting Internet Explorer History...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1

REM Clear Windows Update Cache
echo Deleting Windows Update Cache...
del /s /q %windir%\SoftwareDistribution\Download\*
for /d %%p in (%windir%\SoftwareDistribution\Download\*.*) do rmdir /s /q "%%p"

REM Clear Windows Prefetch files
echo Deleting Windows Prefetch files...
del /s /q %windir%\Prefetch\*

REM Clear Thumbnail Cache
echo Deleting Thumbnail Cache...
del /s /q %userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db

REM Clear Edge Cache
echo Deleting Microsoft Edge Cache...
for /d %%p in (%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\*.*) do rmdir /s /q "%%p"
del /s /q %userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\*

REM Clear Chrome Cache (if installed)
echo Deleting Google Chrome Cache...
for /d %%p in (%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache\*.*) do rmdir /s /q "%%p"
del /s /q %userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache\*

REM Clear Firefox Cache (if installed)
echo Deleting Mozilla Firefox Cache...
for /d %%p in (%userprofile%\AppData\Local\Mozilla\Firefox\Profiles\*.*\cache2\*.*) do rmdir /s /q "%%p"
del /s /q %userprofile%\AppData\Local\Mozilla\Firefox\Profiles\*.*\cache2\*

REM Start Windows Update service
echo Starting Windows Update service...
net start wuauserv
echo Windows Update service started.

echo All specified caches and temporary files have been deleted.
pause
exit
