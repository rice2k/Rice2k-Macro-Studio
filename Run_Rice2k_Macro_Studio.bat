@echo off
setlocal EnableExtensions
title Rice2k Macro Studio v1.4.2 Launcher
cd /d "%~dp0"

set "LOGDIR=%USERPROFILE%\Documents\Rice2k Macro Studio\Errors"
if not exist "%LOGDIR%" mkdir "%LOGDIR%" >nul 2>&1
if not exist "%LOGDIR%" (
    set "LOGDIR=%TEMP%\Rice2k Macro Studio\Errors"
    if not exist "%LOGDIR%" mkdir "%LOGDIR%" >nul 2>&1
)
set "LOG=%LOGDIR%\launcher_log.txt"

>>"%LOG%" echo ================================================================================
>>"%LOG%" echo [%DATE% %TIME%] Rice2k Macro Studio v1.4.2 launcher starting
>>"%LOG%" echo Package folder: %CD%

echo.
echo Rice2k Macro Studio v1.4.2
echo Checking files, Python, and startup requirements...
echo.

if not exist "rice2k_macro_studio.py" goto missing_files
if not exist "src_fragments\part_01.pyfrag" goto missing_files
if not exist "src_patches\v1_1_website_filters.pyfrag" goto missing_files
if not exist "src_patches\v1_2_compact_ui.pyfrag" goto missing_files
if not exist "src_patches\v1_3a_theme_style.pyfrag" goto missing_files
if not exist "src_patches\v1_3b_assets_layout.pyfrag" goto missing_files
if not exist "src_patches\v1_3c_scroll_dashboard.pyfrag" goto missing_files
if not exist "src_patches\v1_3z_assign.pyfrag" goto missing_files
if not exist "src_patches\v1_4_1_compact_cleanup.pyfrag" goto missing_files
if not exist "src_patches\v1_4_1a_card_alt_fix.pyfrag" goto missing_files
if not exist "src_patches\v1_4_2_theme_runtime_fix.pyfrag" goto missing_files
if not exist "src_patches\v1_4_2a_sidebar_state_fix.pyfrag" goto missing_files
if not exist "requirements.txt" goto missing_files
goto files_ok

:missing_files
>>"%LOG%" echo ERROR: One or more required source/package files are missing.
echo ERROR: Required Rice2k Macro Studio files are missing.
echo Extract or clone the entire project, then run this launcher again.
echo Launcher log: %LOG%
pause
exit /b 9

:files_ok
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
    pause
    exit /b 10
)

%PY_CMD% -c "import tkinter; print('Tkinter OK', tkinter.TkVersion)" >>"%LOG%" 2>&1
if errorlevel 1 (
    echo ERROR: Tkinter is unavailable.
    >>"%LOG%" echo ERROR: Tkinter is unavailable.
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
    >>"%LOG%" echo ERROR: Source loader failed compile check.
    pause
    exit /b 12
)

%PY_CMD% -c "from pathlib import Path; parts=sorted(Path('src_fragments').glob('part_*.pyfrag')); patches=sorted(Path('src_patches').glob('*.pyfrag')); assert len(parts)==14, f'Expected 14 source fragments, found {len(parts)}'; assert len(patches)>=10, f'Expected at least 10 version patches, found {len(patches)}'; s=''.join(x.read_text(encoding='utf-8') for x in parts); marker='\nif __name__ == \"__main__\":\n    main()'; assert marker in s, 'main marker missing'; s=s.replace(marker,'\n\n'+'\n\n'.join(x.read_text(encoding='utf-8') for x in patches)+'\n\n'+marker,1); compile(s,'rice2k_macro_studio_full.py','exec'); print('Full patched application source OK')" >>"%LOG%" 2>&1
if errorlevel 1 (
    echo ERROR: Reconstructed application source failed validation.
    >>"%LOG%" echo ERROR: Reconstructed application source failed validation.
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
    echo Error log: %USERPROFILE%\Documents\Rice2k Macro Studio\Errors\error_log.txt
    pause
    exit /b %APP_EXIT%
)

endlocal
exit /b 0
