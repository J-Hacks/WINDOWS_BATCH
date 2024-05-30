@echo off
set networkPath=\\192.168.0.232\ms
REM get config file from xml file
%networkPath%\OfficeDeployment\setup.exe /configure %networkPath%\OfficeDeployment\configuration-Office365-x64_share.xml
