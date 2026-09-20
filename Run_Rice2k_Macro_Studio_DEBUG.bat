@echo off
setlocal
cd /d "%~dp0"
call "%~dp0Run_Rice2k_Macro_Studio.bat"
set "LOGDIR=%USERPROFILE%\Documents\Rice2k Macro Studio\Errors"
if not exist "%LOGDIR%" set "LOGDIR=%TEMP%\Rice2k Macro Studio\Errors"
if exist "%LOGDIR%\launcher_log.txt" start "" notepad.exe "%LOGDIR%\launcher_log.txt"
if exist "%LOGDIR%\error_log.txt" start "" notepad.exe "%LOGDIR%\error_log.txt"
exit /b
