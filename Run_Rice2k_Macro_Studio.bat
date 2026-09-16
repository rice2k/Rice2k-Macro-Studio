@echo off
setlocal EnableExtensions
title Rice2k Macro Studio v1.0 Launcher
cd /d "%~dp0"

set "LOGDIR=%USERPROFILE%\Documents\Rice2k Macro Studio\Errors"
if not exist "%LOGDIR%" mkdir "%LOGDIR%" >nul 2>&1
if not exist "%LOGDIR%" (
    set "LOGDIR=%TEMP%\Rice2k Macro Studio\Errors"
    if not exist "%LOGDIR%" mkdir "%LOGDIR%" >nul 2>&1
)
set "LOG=%LOGDIR%\launcher_log.txt"

>>"%LOG%" echo ================================================================================
>>"%LOG%" echo [%DATE% %TIME%] Rice2k Macro Studio v1.0 launcher starting
>>"%LOG%" echo Package folder: %CD%
>>"%LOG%" echo User: %USERNAME%
>>"%LOG%" echo Computer: %COMPUTERNAME%

echo.
echo Rice2k Macro Studio v1.0
echo Checking files, Python, and startup requirements...
echo.

if not exist "rice2k_macro_studio.py" (
    >>"%LOG%" echo ERROR: rice2k_macro_studio.py is missing from %CD%.
    echo ERROR: rice2k_macro_studio.py was not found beside this launcher.
    echo Extract the ENTIRE repository or ZIP first.
    echo Launcher log: %LOG%
    pause
    exit /b 9
)

if not exist "src_fragments\part_01.pyfrag" (
    >>"%LOG%" echo ERROR: src_fragments are missing from %CD%.
    echo ERROR: The src_fragments folder is missing or incomplete.
    echo Extract or clone the entire Rice2k-Macro-Studio repository.
    echo Launcher log: %LOG%
    pause
    exit /b 9
)

if not exist "requirements.txt" (
    >>"%LOG%" echo ERROR: requirements.txt is missing from %CD%.
    echo ERROR: requirements.txt is missing. Extract the entire package again.
    echo Launcher log: %LOG%
    pause
    exit /b 9
)

set "PY_CMD="
py -3 -c "import sys; print(sys.executable)" >>"%LOG%" 2>&1
if not errorlevel 1 set "PY_CMD=py -3"
if not defined PY_CMD (
    python -c "import sys; print(sys.executable)" >>"%LOG%" 2>&1
    if not errorlevel 1 set "PY_CMD=python"
)

if not defined PY_CMD (
    >>"%LOG%" echo ERROR: No working Python installation was found.
    echo ERROR: A working Python installation was not found.
    echo Install Python 3.10 or newer and enable "Add python.exe to PATH".
    if exist "dist\Rice2k Macro Studio.exe" (
        >>"%LOG%" echo Python unavailable; trying dist\Rice2k Macro Studio.exe
        start "" "dist\Rice2k Macro Studio.exe"
        if not errorlevel 1 exit /b 0
    )
    echo Launcher log: %LOG%
    pause
    exit /b 10
)

>>"%LOG%" echo Python command selected: %PY_CMD%
%PY_CMD% --version >>"%LOG%" 2>&1

%PY_CMD% -c "import tkinter; print('Tkinter OK', tkinter.TkVersion)" >>"%LOG%" 2>&1
if errorlevel 1 (
    >>"%LOG%" echo ERROR: Tkinter is unavailable.
    echo ERROR: This Python installation does not include Tkinter / Tcl-Tk.
    echo Reinstall the normal Windows Python distribution with Tcl/Tk enabled.
    echo Launcher log: %LOG%
    pause
    exit /b 11
)

%PY_CMD% -c "import pyautogui, pynput, psutil, screeninfo, pywinauto; print('Dependencies OK')" >>"%LOG%" 2>&1
if errorlevel 1 (
    echo One or more packages are missing. Installing or repairing requirements...
    >>"%LOG%" echo Dependencies missing; running pip install -r requirements.txt
    %PY_CMD% -m pip --version >>"%LOG%" 2>&1
    if errorlevel 1 %PY_CMD% -m ensurepip --upgrade >>"%LOG%" 2>&1
    %PY_CMD% -m pip install -r requirements.txt >>"%LOG%" 2>&1
    if errorlevel 1 (
        >>"%LOG%" echo WARNING: pip install returned an error.
        echo WARNING: Package installation reported an error. The app will still be attempted.
    )
)

%PY_CMD% -c "import pyautogui, pynput, psutil, screeninfo, pywinauto; print('Dependencies OK after repair')" >>"%LOG%" 2>&1
if errorlevel 1 >>"%LOG%" echo WARNING: One or more packages still failed import.

rem Compile both the loader and the full reconstructed application source.
%PY_CMD% -m py_compile "rice2k_macro_studio.py" >>"%LOG%" 2>&1
if errorlevel 1 (
    >>"%LOG%" echo ERROR: rice2k_macro_studio.py loader failed py_compile.
    echo ERROR: The source loader failed its compile check.
    echo Launcher log: %LOG%
    pause
    exit /b 12
)

%PY_CMD% -c "from pathlib import Path; p=Path('src_fragments'); parts=sorted(p.glob('part_*.pyfrag')); assert len(parts)==14, f'Expected 14 source fragments, found {len(parts)}'; compile(''.join(x.read_text(encoding='utf-8') for x in parts), 'rice2k_macro_studio_full.py', 'exec'); print('Full application source OK')" >>"%LOG%" 2>&1
if errorlevel 1 (
    >>"%LOG%" echo ERROR: Reconstructed application source failed validation.
    echo ERROR: The application source fragments are missing, incomplete, or contain an error.
    echo Launcher log: %LOG%
    pause
    exit /b 13
)

>>"%LOG%" echo Loader and full source checks passed.
>>"%LOG%" echo Starting Rice2k Macro Studio...
echo Starting Rice2k Macro Studio...

%PY_CMD% -u "rice2k_macro_studio.py" >>"%LOG%" 2>&1
set "APP_EXIT=%ERRORLEVEL%"

>>"%LOG%" echo Application exit code: %APP_EXIT%
>>"%LOG%" echo [%DATE% %TIME%] Launcher finished

if not "%APP_EXIT%"=="0" (
    echo.
    echo Rice2k Macro Studio stopped with error code %APP_EXIT%.
    echo Launcher log: %LOG%
    echo Normal app error log: %USERPROFILE%\Documents\Rice2k Macro Studio\Errors\error_log.txt
    echo Fallback app error log: %TEMP%\Rice2k Macro Studio\error_log.txt
    pause
    exit /b %APP_EXIT%
)

endlocal
exit /b 0
