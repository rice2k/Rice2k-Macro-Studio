@echo off
setlocal
set "LOGDIR=%USERPROFILE%\Documents\Rice2k Macro Studio\Errors"
if not exist "%LOGDIR%" set "LOGDIR=%TEMP%\Rice2k Macro Studio\Errors"
if not exist "%LOGDIR%" (
  echo No Rice2k Macro Studio log folder was found.
  pause
  exit /b 1
)
start "" explorer.exe "%LOGDIR%"
if exist "%LOGDIR%\launcher_log.txt" start "" notepad.exe "%LOGDIR%\launcher_log.txt"
