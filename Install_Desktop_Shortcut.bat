@echo off
title Install Rice2k Macro Studio Shortcut
cd /d "%~dp0"

set "SHORTCUT=%USERPROFILE%\Desktop\Rice2k Macro Studio.lnk"

if exist "dist\Rice2k Macro Studio.exe" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$s=(New-Object -COM WScript.Shell).CreateShortcut('%SHORTCUT%'); $s.TargetPath='%CD%\dist\Rice2k Macro Studio.exe'; $s.WorkingDirectory='%CD%\dist'; $s.IconLocation='%CD%\dist\Rice2k Macro Studio.exe,0'; $s.Save()"
    echo Desktop shortcut created for the EXE:
    echo %SHORTCUT%
    pause
    exit /b 0
)

if not exist "Run_Rice2k_Macro_Studio.bat" (
    echo Run_Rice2k_Macro_Studio.bat was not found.
    echo Extract the complete ZIP first.
    pause
    exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -Command "$s=(New-Object -COM WScript.Shell).CreateShortcut('%SHORTCUT%'); $s.TargetPath='%CD%\Run_Rice2k_Macro_Studio.bat'; $s.WorkingDirectory='%CD%'; $s.IconLocation=$env:SystemRoot+'\System32\shell32.dll,137'; $s.Save()"

echo Desktop shortcut created for the reliable launcher:
echo %SHORTCUT%
pause
