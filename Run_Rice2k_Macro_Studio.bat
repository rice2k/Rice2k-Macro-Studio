@echo off
setlocal EnableExtensions
title Rice2k Macro Studio v1.1 Launcher
cd /d "%~dp0"

set "LOGDIR=%USERPROFILE%\Documents\Rice2k Macro Studio\Errors"
if not exist "%LOGDIR%" mkdir "%LOGDIR%" >nul 2>&1
if not exist "%LOGDIR%" (
    set "LOGDIR=%TEMP%\Rice2k Macro Studio\Errors"
    if not exist "%LOGDIR%" mkdir "%LOGDIR%" >nul 2>&1
)
set "LOG=%LOGDIR%\launcher_log.txt"

>>"%LOG%" echo ================================================================================
>>"%LOG%" echo [%DATE% %TIME%] Rice2k Macro Studio v1.1 launcher starting
>>"%LOG%" echo Package folder: %CD%

echo.
echo Rice2k Macro Studio v1.1
echo Checking files, Python, and startup requirements...
echo.

if not exist "rice2k_macro_studio.py" (
    echo ERROR: rice2k_macro_studio.py is missing.
    pause
    exit /b 9
)
if not exist "src_fragments\part_01.pyfrag" (
    echo ERROR: src_fragments is missing or incomplete.
    pause
    exit /b 9
)
if not exist "src_patches\v1_1_website_filters.pyfrag" (
    echo ERROR: v1.1 source patch is missing.
    pause
    exit /b 9
)
if not exist "requirements.txt" (
    echo ERROR: requirements.txt is missing.
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
    echo ERROR: A working Python installation was not found.
    pause
    exit /b 10
)

%PY_CMD% -c "import tkinter; print('Tkinter OK', tkinter.TkVersion)" >>"%LOG%" 2>&1
if errorlevel 1 (
    echo ERROR: Tkinter is unavailable.
    pause
    exit /b 11
)

%PY_CMD% -c "import pyautogui, pynput, psutil, screeninfo, pywinauto; print('Dependencies OK')" >>"%LOG%" 2>&1
if errorlevel 1 (
    echo Installing or repairing requirements...
    %PY_CMD% -m pip --version >>"%LOG%" 2>&1
    if errorlevel 1 %PY_CMD% -m ensurepip --upgrade >>"%LOG%" 2>&1
    %PY_CMD% -m pip install -r requirements.txt >>"%LOG%" 2>&1
)

%PY_CMD% -m py_compile "rice2k_macro_studio.py" >>"%LOG%" 2>&1
if errorlevel 1 (
    echo ERROR: Source loader failed compile check.
    pause
    exit /b 12
)

%PY_CMD% -c "from pathlib import Path; p=Path('src_fragments'); parts=sorted(p.glob('part_*.pyfrag')); assert len(parts)==14, f'Expected 14 source fragments, found {len(parts)}'; s=''.join(x.read_text(encoding='utf-8') for x in parts); marker='\nif __name__ == \"__main__\":\n    main()'; assert marker in s, 'main marker missing'; patches=sorted(Path('src_patches').glob('*.pyfrag')); patch='\n\n'.join(x.read_text(encoding='utf-8') for x in patches); s=s.replace(marker,'\n\n'+patch+'\n\n'+marker,1); compile(s,'rice2k_macro_studio_full.py','exec'); print('Full patched application source OK')" >>"%LOG%" 2>&1
if errorlevel 1 (
    echo ERROR: Reconstructed application source failed validation.
    pause
    exit /b 13
)

echo Starting Rice2k Macro Studio...
>>"%LOG%" echo Starting Rice2k Macro Studio...
%PY_CMD% -u "rice2k_macro_studio.py" >>"%LOG%" 2>&1
set "APP_EXIT=%ERRORLEVEL%"
>>"%LOG%" echo Application exit code: %APP_EXIT%

if not "%APP_EXIT%"=="0" (
    echo Rice2k Macro Studio stopped with error code %APP_EXIT%.
    echo Launcher log: %LOG%
    pause
    exit /b %APP_EXIT%
)

endlocal
exit /b 0
