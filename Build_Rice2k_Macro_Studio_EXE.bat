@echo off
setlocal EnableExtensions
title Build Rice2k Macro Studio v1.6.0 EXE
cd /d "%~dp0"

set "PY_EXE="
for /f "usebackq delims=" %%P in (`py -3 -c "import sys; print(sys.executable)" 2^>nul`) do if not defined PY_EXE set "PY_EXE=%%P"
if not defined PY_EXE (
    for /f "usebackq delims=" %%P in (`python -c "import sys; print(sys.executable)" 2^>nul`) do if not defined PY_EXE set "PY_EXE=%%P"
)
if not defined PY_EXE (
    echo ERROR: Python 3 was not found.
    echo Install Python 3 from python.org, then run this build again.
    pause
    exit /b 1
)

echo.
echo ================================================================
echo   Rice2k Macro Studio v1.6.0 - Clean Windows EXE Build
echo ================================================================
echo Python: %PY_EXE%
echo.

echo [1/6] Installing/updating build requirements...
"%PY_EXE%" -m pip install --upgrade pip
if errorlevel 1 goto :fail
"%PY_EXE%" -m pip install -r requirements.txt
if errorlevel 1 goto :fail
"%PY_EXE%" -m pip install --upgrade "pyinstaller>=6.20,<7"
if errorlevel 1 goto :fail

echo.
echo [2/6] Validating full reconstructed application source...
"%PY_EXE%" -c "from pathlib import Path; parts=sorted(Path('src_fragments').glob('part_*.pyfrag')); patches=sorted(Path('src_patches').glob('*.pyfrag')); assert len(parts)==14, f'Expected 14 source fragments, found {len(parts)}'; s=''.join(p.read_text(encoding='utf-8') for p in parts); marker='\nif __name__ == \"__main__\":\n    main()'; assert marker in s, 'main marker missing'; s=s.replace(marker,'\n\n'+'\n\n'.join(p.read_text(encoding='utf-8') for p in patches)+'\n\n'+marker,1); compile(s,'rice2k_macro_studio_full.py','exec'); print(f'Compile OK: {len(parts)} fragments + {len(patches)} patches')"
if errorlevel 1 goto :fail

echo.
echo [3/6] Removing stale PyInstaller output...
if exist "build" rmdir /s /q "build"
if exist "dist" rmdir /s /q "dist"
if exist "Rice2k Macro Studio.spec" del /f /q "Rice2k Macro Studio.spec"

echo.
echo [4/6] Building EXE with protected Windows manifest...
echo NOTE: This intentionally uses the console bootloader with --hide-console.
echo       It avoids the PyInstaller windowed-bootloader Ordinal 380 failure.
"%PY_EXE%" -m PyInstaller ^
  --clean ^
  --noconfirm ^
  --onefile ^
  --console ^
  --hide-console hide-late ^
  --noupx ^
  --name "Rice2k Macro Studio" ^
  --manifest "Rice2kMacroStudio.manifest" ^
  --icon "rice2k_macro_studio.png" ^
  --add-data "rice2k_macro_studio.png;." ^
  --add-data "Browser_Element_Capture_Helper.html;." ^
  --add-data "src_fragments;src_fragments" ^
  --add-data "src_patches;src_patches" ^
  rice2k_macro_studio.py
if errorlevel 1 goto :fail

if not exist "dist\Rice2k Macro Studio.exe" (
    echo ERROR: PyInstaller completed but the EXE was not found.
    goto :fail
)

echo.
echo [5/6] Running the built EXE startup self-test...
"dist\Rice2k Macro Studio.exe" --startup-test
set "TEST_EXIT=%ERRORLEVEL%"
if not "%TEST_EXIT%"=="0" (
    echo ERROR: Built EXE startup self-test failed with code %TEST_EXIT%.
    echo The EXE will not be marked as ready.
    goto :fail
)

echo.
echo [6/6] Build verified successfully.
echo.
echo ================================================================
echo   SUCCESS
echo ================================================================
echo EXE:
echo %CD%\dist\Rice2k Macro Studio.exe
echo.
echo The EXE passed the application's startup self-test on this PC.
echo You can now double-click it normally.
echo.
pause
exit /b 0

:fail
echo.
echo ================================================================
echo   BUILD FAILED
echo ================================================================
echo Do not use any EXE left from an older dist folder.
echo Review the messages above, then run this file again.
echo.
pause
exit /b 1
