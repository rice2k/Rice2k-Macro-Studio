@echo off
setlocal EnableExtensions
title Rice2k Macro Studio - Repair Recorder Dependency
cd /d "%~dp0"

set "LOGDIR=%USERPROFILE%\Documents\Rice2k Macro Studio\Errors"
if not exist "%LOGDIR%" mkdir "%LOGDIR%" >nul 2>&1
if not exist "%LOGDIR%" set "LOGDIR=%TEMP%\Rice2k Macro Studio\Errors"
if not exist "%LOGDIR%" mkdir "%LOGDIR%" >nul 2>&1
set "LOG=%LOGDIR%\pynput_repair_log.txt"

>"%LOG%" echo Rice2k Macro Studio Recorder Dependency Repair
echo Repairing mouse / scroll / keyboard recording support...

set "PY_EXE="
for /f "usebackq delims=" %%P in (`py -3 -c "import sys; print(sys.executable)" 2^>nul`) do if not defined PY_EXE set "PY_EXE=%%P"
if not defined PY_EXE for /f "usebackq delims=" %%P in (`python -c "import sys; print(sys.executable)" 2^>nul`) do if not defined PY_EXE set "PY_EXE=%%P"
if not defined PY_EXE goto no_python

>>"%LOG%" echo Python: %PY_EXE%
"%PY_EXE%" --version >>"%LOG%" 2>&1
"%PY_EXE%" -m pip --version >>"%LOG%" 2>&1
if errorlevel 1 "%PY_EXE%" -m ensurepip --upgrade >>"%LOG%" 2>&1

echo Installing clean pynput 1.8.2 + six...
"%PY_EXE%" -m pip install --upgrade --force-reinstall "pynput==1.8.2" "six>=1.16.0" >>"%LOG%" 2>&1
if errorlevel 1 goto repair_failed

set "PYNPUT_BACKEND_MOUSE=win32"
set "PYNPUT_BACKEND_KEYBOARD=win32"
echo Testing Win32 recorder backends...
"%PY_EXE%" -c "import os,sys; print('Python',sys.version); print('mouse backend',os.environ.get('PYNPUT_BACKEND_MOUSE')); from pynput import mouse,keyboard; from pynput.mouse import Listener as ML; from pynput.keyboard import Listener as KL; print('SUCCESS: mouse and keyboard backends imported')" >>"%LOG%" 2>&1
if errorlevel 1 goto backend_failed

"%PY_EXE%" -m pip check >>"%LOG%" 2>&1

echo.
echo Recorder dependency repair PASSED.
echo Close and reopen Rice2k Macro Studio.
echo Log: %LOG%
pause
exit /b 0

:no_python
echo ERROR: Python 3 was not found.>>"%LOG%"
echo ERROR: Python 3 was not found.
goto show
:repair_failed
echo ERROR: pip could not reinstall pynput.>>"%LOG%"
echo ERROR: pynput reinstall failed.
goto show
:backend_failed
echo ERROR: pynput is installed, but the Win32 backend still failed.>>"%LOG%"
echo ERROR: Win32 mouse/keyboard backend still failed.
echo The exact Python exception is in the repair log.
goto show
:show
echo.
echo Log: %LOG%
echo.
type "%LOG%"
echo.
pause
exit /b 1
