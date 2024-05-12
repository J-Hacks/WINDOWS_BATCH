@echo off
set networkPath=\\192.168.0.232\ms\common
set chromeinstaller=%networkPath%\Chrome_114.exe
set gitbashinstaller=%networkPath%\Git-2.25.0-64-bit.exe
set nppinstaller=%networkPath%\notepadplus.exe
set postmaninstaller=%networkPath%\Postman-win64-Setup.exe
set vncinstaller=%networkPath%\tightvnc.msi
set gitinstaller=%networkPath%\TortoiseGitt.msi
set svninstaller=%networkPath%\TortoiseSVN.msi
set vscodeinstaller=%networkPath%\VSCode.exe
set zipinstaller=%networkPath%\7zip.msi
set crowd=\\192.168.0.200\cs_2022\WindowsSensor.MaverickGyr.exe
for /f "tokens=2 delims==." %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set datetime=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%-%datetime:~12,2%
for /f "tokens=*" %%A in ('hostname') do set hostname=%%A
set hostname_with_timestamp=%hostname%_%datetime%
echo %hostname_with_timestamp% >> \\192.168.0.232\ms\install.txt
:Installoption
echo 0. Exit
echo 1. chrome 
echo 2. gitbash
echo 3. Notepad++
echo 4. VSCode
echo 5. Postman
echo 6. VNC
echo 7. TortoiseGit
echo 8. TortoiseSVN
echo 9. 7Zip
echo 10.CrowdStrike
echo 11. All
set /p choice="Enter a choice: "
if "%choice%"=="0" goto :end
if "%choice%"=="11" goto :ALL
if "%choice%"=="1" (%chromeinstaller% /s & pause )
if "%choice%"=="2" (%gitbashinstaller% /s & pause )
if "%choice%"=="3" (%nppinstaller% /s & pause )
if "%choice%"=="4" (%vscodeinstaller% /s & pause )
if "%choice%"=="5" (%postmaninstaller% /s & pause )
if "%choice%"=="6" ( start msiexec /i %vncinstaller% /qn & pause )
if "%choice%"=="7" ( start msiexec /i %gitinstaller% /qn & pause )
if "%choice%"=="8" ( start msiexec /i %svninstaller% /qn & pause )
if "%choice%"=="9" ( start msiexec /i %zipinstaller% /qn & pause )
if "%choice%"=="10" (%crowd% /install /quiet /norestart /log C:\Windows\Logs\CrowdStrikeInstallation\CrowdStrikeSetup.log CID=1337C13FA701444DB25DC82FBD0EB6B2-44 & pause ) else ( echo Invalid choice. Please enter valid choice & goto :Installoption ) 
:ALL
@echo off
%chromeinstaller% /s & pause 
%gitbashinstaller% /s & pause 
%nppinstaller% /s & pause 
%vscodeinstaller% /s & pause 
%postmaninstaller% /s & pause 
start msiexec /i %vncinstaller% /qn & pause 
start msiexec /i %gitinstaller% /qn & pause 
start msiexec /i %svninstaller% /qn & pause 
start msiexec /i %zipinstaller% /qn & pause 
%crowd% /install /quiet /norestart /log C:\Windows\Logs\CrowdStrikeInstallation\CrowdStrikeSetup.log CID=1337C13FA701444DB25DC82FBD0EB6B2-44 & pause )
pause

:END
@echo off
endlocal
