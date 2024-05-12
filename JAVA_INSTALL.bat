@echo off
set networkPath=\\192.168.0.232\ms\JAVA
:choose_installer
echo Select an installer:
echo 1. jdk 11
echo 2. jdk 13
echo 3. jdk 17
echo 4. jdk 18
echo 5. jdk 21
echo 6. jdk 8
set /p choice="Enter your choice : "
if "%choice%"=="1" (set installer=%networkPath%\jdk-11.0.17_windows-x64_bin.exe) else if "%choice%"=="2" (set installer=%networkPath%\jdk-13.0.2_windows-x64_bin.exe) else if "%choice%"=="3" (set installer=%networkPath%\jdk-17.0.5_windows-x64_bin.exe) else if "%choice%"=="4" (set installer=%networkPath%\jdk-18.0.2.1_windows-x64_bin.exe) else if "%choice%"=="5" (set installer=%networkPath%\jdk-21_windows-x64_bin.exe) else if "%choice%"=="6" (set installer=%networkPath%\jdk-8u351-windows-x64.exe) else ( echo Invalid choice. Please enter valid choice goto choose_installer ) 
echo To Install %installer%... 
pause 
%installer% /s
echo Installation done
pause