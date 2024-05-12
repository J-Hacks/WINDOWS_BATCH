@echo off
set networkPath=\\192.168.0.232\ms\NODE
:choose_installer
echo Select an installer:
echo 1. node-v12.22.1-x64.msi
echo 2. node-v14.10.1-x64.msi
echo 3. node-v14.16.1-x64.msi
echo 4. node-v14.20.0-x64.msi
echo 5. node-v14.4.0-x64.msi
echo 6. node-v16.0.0-x64.msi
echo 7. node-v16.13.0-x64.msi
echo 8. node-v16.14.0-x64.msi
echo 9. node-v18.18.0-x64.msi
echo 10. node-v18.18.1-x64.msi
set /p choice="Enter your choice : "
if "%choice%"=="1" (set installer=%networkPath%\node-v12.22.1-x64.msi) else if "%choice%"=="2" (set installer=%networkPath%\node-v14.10.1-x64.msi) else if "%choice%"=="3" (set installer=%networkPath%\node-v14.16.1-x64.msi) else if "%choice%"=="4" (set installer=%networkPath%\node-v14.20.0-x64.msi) else if "%choice%"=="5" (set installer=%networkPath%\node-v14.4.0-x64.msi) else if "%choice%"=="6" (set installer=%networkPath%\node-v16.0.0-x64.msi) else if "%choice%"=="7" (set installer=%networkPath%\node-v16.13.0-x64.msi) else if "%choice%"=="8" (set installer=%networkPath%\node-v16.14.0-x64.msi) else if "%choice%"=="9" (set installer=%networkPath%\node-v18.18.0-x64.msi) else if "%choice%"=="10" (set installer=%networkPath%\node-v18.18.1-x64.msi) else ( echo Invalid choice. Please enter valid choice goto choose_installer ) 
echo Installing %installer%... 
pause 
start msiexec /i "%installer%" /qn
echo Installed successfully
pause