@echo off
title Build Rice2k Macro Studio v1.5.1 EXE
cd /d "%~dp0"

echo Installing/updating requirements...
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

echo.
echo Building EXE...
pyinstaller ^
  --clean ^
  --noconfirm ^
  --onefile ^
  --windowed ^
  --name "Rice2k Macro Studio" ^
  --icon "rice2k_macro_studio.png" ^
  --add-data "rice2k_macro_studio.png;." ^
  --add-data "Browser_Element_Capture_Helper.html;." ^
  --add-data "src_fragments;src_fragments" ^
  --add-data "src_patches;src_patches" ^
  rice2k_macro_studio.py

echo.
echo Done.
echo EXE:
echo %cd%\dist\Rice2k Macro Studio.exe
pause
