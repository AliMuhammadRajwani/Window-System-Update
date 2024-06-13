@echo off
title Windows System Update
cls

:: Define log file
set LOG_FILE=system_update.log

:: Function to log with timestamp
echo Log started at %date% %time% > %LOG_FILE%

:: Check if PSWindowsUpdate module is installed
powershell -command "if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) { Install-Module -Name PSWindowsUpdate -Force }" >> %LOG_FILE% 2>&1

:: Import PSWindowsUpdate module
powershell -command "Import-Module PSWindowsUpdate" >> %LOG_FILE% 2>&1

:: Start the update process
echo Updating Windows System... >> %LOG_FILE%
echo ================================= >> %LOG_FILE%

:: Check for updates
echo Checking for updates... >> %LOG_FILE%
powershell -command "Start-Transcript -Path '%LOG_FILE%' -Append; Get-WindowsUpdate -AcceptAll -AutoReboot; Stop-Transcript" >> %LOG_FILE% 2>&1

:: Finishing up
echo ================================= >> %LOG_FILE%
echo Update process completed at %date% %time% >> %LOG_FILE%

:: Display log file
type %LOG_FILE%
pause
