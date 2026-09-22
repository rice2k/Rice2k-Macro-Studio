@echo off
setlocal EnableExtensions EnableDelayedExpansion
title Rice2k Macro Studio v1.5.4 - Reliable Launcher
cd /d "%~dp0"

set "LOGDIR=%USERPROFILE%\Documents\Rice2k Macro Studio\Errors"
if not exist "%LOGDIR%" mkdir "%LOGDIR%" >nul 2>&1
if not exist "%LOGDIR%" (
    set "LOGDIR=%TEMP%\Rice2k Macro Studio\Errors"
    if not exist "%LOGDIR%" mkdir "%LOGDIR%" >nul 2>&1
)
set "LOG=%LOGDIR%\launcher_log.txt"
set "ERRORLOG=%LOGDIR%\error_log.txt"
set "HANGLOG=%LOGDIR%\hang_watchdog.log"

>>"%LOG%" echo ================================================================================
>>"%LOG%" echo [%DATE% %TIME%] Rice2k Macro Studio v1.5.4 launcher starting
>>"%LOG%" echo Folder: %CD%

echo.
echo ================================================================
echo   Rice2k Macro Studio v1.5.4
echo   Performance Hardening
echo ================================================================
echo.

if not exist "rice2k_macro_studio.py" goto :missing_files
if not exist "src_fragments\part_01.pyfrag" goto :missing_files
if not exist "src_patches\v1_5_4_performance_hardening.pyfrag" goto :missing_files
if not exist "requirements.txt" goto :missing_files

set "PY_EXE="
for /f "usebackq delims=" %%P in (`py -3 -c "import sys; print(sys.executable)" 2^>nul`) do if not defined PY_EXE set "PY_EXE=%%P"
if not defined PY_EXE (
    for /f "usebackq delims=" %%P in (`python -c "import sys; print(sys.executable)" 2^>nul`) do if not defined PY_EXE set "PY_EXE=%%P"
)
if not defined PY_EXE goto :no_python
if not exist "%PY_EXE%" goto :no_python

>>"%LOG%" echo Python executable: %PY_EXE%
"%PY_EXE%" --version >>"%LOG%" 2>&1

echo [1/6] Checking Tkinter...
"%PY_EXE%" -c "import tkinter; print('Tkinter OK', tkinter.TkVersion)" >>"%LOG%" 2>&1
if errorlevel 1 goto :tk_error

echo [2/6] Checking core packages...
"%PY_EXE%" -c "import pyautogui, pynput, psutil, screeninfo, pywinauto, PIL; print('Core dependencies OK')" >>"%LOG%" 2>&1
if errorlevel 1 (
    echo      Missing package detected. Repairing requirements...
    "%PY_EXE%" -m pip --version >>"%LOG%" 2>&1
    if errorlevel 1 "%PY_EXE%" -m ensurepip --upgrade >>"%LOG%" 2>&1
    "%PY_EXE%" -m pip install -r requirements.txt >>"%LOG%" 2>&1
)
"%PY_EXE%" -c "import pyautogui, pynput, psutil, screeninfo, pywinauto, PIL; print('Core dependencies OK after repair')" >>"%LOG%" 2>&1
if errorlevel 1 goto :dependency_error

echo [3/6] Compiling source loader...
"%PY_EXE%" -m py_compile "rice2k_macro_studio.py" >>"%LOG%" 2>&1
if errorlevel 1 goto :compile_error

echo [4/6] Validating reconstructed source...
"%PY_EXE%" -c "from pathlib import Path; parts=sorted(Path('src_fragments').glob('part_*.pyfrag')); patches=sorted(Path('src_patches').glob('*.pyfrag')); assert len(parts)==14, f'Expected 14 source fragments, found {len(parts)}'; assert len(patches)>=15, f'Expected at least 15 version patches, found {len(patches)}'; s=''.join(x.read_text(encoding='utf-8') for x in parts); marker='\nif __name__ == \"__main__\":\n    main()'; assert marker in s, 'main marker missing'; s=s.replace(marker,'\n\n'+'\n\n'.join(x.read_text(encoding='utf-8') for x in patches)+'\n\n'+marker,1); compile(s,'rice2k_macro_studio_full.py','exec'); print('Full patched source OK')" >>"%LOG%" 2>&1
if errorlevel 1 goto :rebuild_error

echo [5/6] Running GUI startup self-test...
"%PY_EXE%" -u "rice2k_macro_studio.py" --startup-test >>"%LOG%" 2>&1
set "SELFTEST_EXIT=%ERRORLEVEL%"
if not "%SELFTEST_EXIT%"=="0" goto :selftest_error

echo [6/6] Starting Rice2k Macro Studio...
>>"%LOG%" echo Startup self-test passed. Starting full application.
"%PY_EXE%" -u "rice2k_macro_studio.py" >>"%LOG%" 2>&1
set "APP_EXIT=%ERRORLEVEL%"
>>"%LOG%" echo Application returned exit code: %APP_EXIT%

echo.
echo Rice2k Macro Studio closed with exit code %APP_EXIT%.
echo Launcher log : %LOG%
echo Error log    : %ERRORLOG%
echo Hang log     : %HANGLOG%
echo.
echo Press any key to close this window.
pause >nul
exit /b %APP_EXIT%

:missing_files
echo ERROR: Required Rice2k Macro Studio files are missing.
>>"%LOG%" echo ERROR: Required project files are missing from %CD%
goto :show_failure
:no_python
echo ERROR: Python 3 was not found.
>>"%LOG%" echo ERROR: No usable Python executable was found.
goto :show_failure
:tk_error
echo ERROR: Tkinter is unavailable.
>>"%LOG%" echo ERROR: Tkinter startup check failed.
goto :show_failure
:dependency_error
echo ERROR: Required Python packages could not be loaded.
>>"%LOG%" echo ERROR: Core dependencies still fail after repair.
goto :show_failure
:compile_error
echo ERROR: Source loader failed its compile check.
>>"%LOG%" echo ERROR: rice2k_macro_studio.py failed py_compile.
goto :show_failure
:rebuild_error
echo ERROR: Reconstructed application source failed validation.
>>"%LOG%" echo ERROR: Reconstructed source failed validation.
goto :show_failure
:selftest_error
echo ERROR: GUI startup self-test failed with code %SELFTEST_EXIT%.
>>"%LOG%" echo ERROR: GUI startup self-test failed with code %SELFTEST_EXIT%.
goto :show_failure
:show_failure
echo.
echo Launcher log : %LOG%
echo Error log    : %ERRORLOG%
echo Hang log     : %HANGLOG%
echo.
if exist "%LOG%" powershell -NoProfile -Command "Get-Content -LiteralPath '%LOG%' -Tail 40" 2>nul
echo.
echo Press any key to close this window.
pause >nul
exit /b 1
