@echo off
title Build Rice2k Macro Studio v1.0 EXE
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
  --icon "rice2k_macro_studio.ico" ^
  --add-data "rice2k_macro_studio.ico;." ^
  --add-data "Browser_Element_Capture_Helper.html;." ^
  rice2k_macro_studio.py

echo.
echo Done.
echo EXE:
echo %cd%\dist\Rice2k Macro Studio.exe
pause
