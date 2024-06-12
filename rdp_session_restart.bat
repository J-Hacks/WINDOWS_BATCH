@echo off
setlocal

echo Stopping services...

REM List of services to restart
set services=bits wuauserv cryptsvc

for %%s in (%services%) do (
    echo Stopping %%s...
    net stop %%s
    timeout /t 5 /nobreak >nul
)

echo Starting services...

for %%s in (%services%) do (
    echo Starting %%s...
    net start %%s
    timeout /t 5 /nobreak >nul
)

echo Services have been restarted.

endlocal
