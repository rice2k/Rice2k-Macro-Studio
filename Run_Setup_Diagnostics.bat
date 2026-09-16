@echo off
setlocal EnableExtensions
title Rice2k Macro Studio v1.0 - Setup Diagnostics
cd /d "%~dp0"

set "LOGDIR=%USERPROFILE%\Documents\Rice2k Macro Studio\Errors"
if not exist "%LOGDIR%" mkdir "%LOGDIR%" >nul 2>&1
if not exist "%LOGDIR%" (
  set "LOGDIR=%TEMP%\Rice2k Macro Studio\Errors"
  if not exist "%LOGDIR%" mkdir "%LOGDIR%" >nul 2>&1
)
set "LOG=%LOGDIR%\setup_diagnostics.txt"

>"%LOG%" echo Rice2k Macro Studio v1.0 Setup Diagnostics
>>"%LOG%" echo Date: %DATE% %TIME%
>>"%LOG%" echo Folder: %CD%
>>"%LOG%" echo.

echo Running setup diagnostics...
echo.

if not exist "rice2k_macro_studio.py" >>"%LOG%" echo ERROR: rice2k_macro_studio.py missing - extract or clone the full repository.
if not exist "src_fragments\part_01.pyfrag" >>"%LOG%" echo ERROR: src_fragments missing - extract or clone the full repository.
if not exist "requirements.txt" >>"%LOG%" echo ERROR: requirements.txt missing - extract or clone the full repository.

where py >>"%LOG%" 2>&1
where python >>"%LOG%" 2>&1
where pythonw >>"%LOG%" 2>&1

set "PY_CMD="
py -3 -c "import sys; print(sys.executable)" >>"%LOG%" 2>&1
if not errorlevel 1 set "PY_CMD=py -3"
if not defined PY_CMD (
  python -c "import sys; print(sys.executable)" >>"%LOG%" 2>&1
  if not errorlevel 1 set "PY_CMD=python"
)

if defined PY_CMD (
  >>"%LOG%" echo.
  >>"%LOG%" echo Selected Python: %PY_CMD%
  %PY_CMD% -c "import sys,platform; print(sys.version); print(platform.platform())" >>"%LOG%" 2>&1
  %PY_CMD% -c "import tkinter; print('tkinter OK', tkinter.TkVersion)" >>"%LOG%" 2>&1
  %PY_CMD% -c "import pyautogui; print('pyautogui OK', pyautogui.__version__)" >>"%LOG%" 2>&1
  %PY_CMD% -c "import pynput; print('pynput OK')" >>"%LOG%" 2>&1
  %PY_CMD% -c "import psutil; print('psutil OK', psutil.__version__)" >>"%LOG%" 2>&1
  %PY_CMD% -c "import screeninfo; print('screeninfo OK')" >>"%LOG%" 2>&1
  %PY_CMD% -c "import pywinauto; print('pywinauto OK', pywinauto.__version__)" >>"%LOG%" 2>&1
  %PY_CMD% -m py_compile rice2k_macro_studio.py >>"%LOG%" 2>&1
  %PY_CMD% -c "from pathlib import Path; parts=sorted(Path('src_fragments').glob('part_*.pyfrag')); print('source fragments', len(parts)); assert len(parts)==14, f'Expected 14 source fragments, found {len(parts)}'; compile(''.join(x.read_text(encoding='utf-8') for x in parts), 'rice2k_macro_studio_full.py', 'exec'); print('full application source OK')" >>"%LOG%" 2>&1
) else (
  >>"%LOG%" echo ERROR: No working Python interpreter detected.
)

echo Diagnostics complete.
echo Report:
echo %LOG%
echo.
type "%LOG%"
echo.
pause
