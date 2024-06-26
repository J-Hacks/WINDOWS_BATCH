@echo off
title Set Proxy for Current User

REM Define proxy settings
set proxyAddress=proxy.server.com
set proxyPort=8080

REM Set the proxy for Internet Explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d %proxyAddress%:%proxyPort% /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "<local>" /f

REM Notify user
echo Proxy settings have been configured.
pause
exit
