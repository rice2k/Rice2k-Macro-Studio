Rice2k Macro Studio v1.0 Reliable Launcher + Crash Logging

IMPORTANT STARTUP FIX
The previous build could fail before showing the GUI because the Dashboard referenced a missing `choose_recording` method. A second missing `open_raw_editor` method also broke Smart Targets when that page was opened. Both are fixed.

RUN THE APP
1. Extract the ENTIRE ZIP to a normal folder first.
2. Double-click Run_Rice2k_Macro_Studio.bat.
3. The launcher checks Python, Tkinter, dependencies, and Python syntax before starting the GUI.

DO NOT run only the BAT directly from inside the ZIP. The launcher now detects missing package files and tells you to extract the full ZIP.

RELIABLE LAUNCHER
Run_Rice2k_Macro_Studio.bat now:
- Prefers Windows `py -3` so the Microsoft Store `python` alias does not silently interfere.
- Falls back to `python` when appropriate.
- Verifies Tkinter.
- Checks pyautogui, pynput, psutil, screeninfo, and pywinauto.
- Runs pip/ensurepip repair when packages are missing.
- Runs py_compile before starting.
- Keeps the console open when startup fails.
- Detects incomplete ZIP extraction.
- Writes a launcher log every time.

LAUNCHER LOG
Normal:
%USERPROFILE%\Documents\Rice2k Macro Studio\Errors\launcher_log.txt

Fallback:
%TEMP%\Rice2k Macro Studio\Errors\launcher_log.txt

SETUP DIAGNOSTICS
Run:
Run_Setup_Diagnostics.bat

It checks:
- py / python / pythonw locations
- Python version
- Tkinter
- pyautogui
- pynput
- psutil
- screeninfo
- pywinauto
- source compile status

APP ERROR LOGGING
The application now catches/logs:
- Startup/mainloop failures
- Tkinter callback exceptions
- Worker-thread exceptions
- Normal handled exceptions
- Python faulthandler output where supported

Normal error log:
Documents\Rice2k Macro Studio\Errors\error_log.txt

Startup log:
Documents\Rice2k Macro Studio\Errors\startup_log.txt

If Documents cannot be written, fallback logs are written under:
%TEMP%\Rice2k Macro Studio\

SETTINGS RECOVERY
Old, malformed, or invalid settings are sanitized on startup:
- Invalid speed/repeat/delay/countdown values reset safely
- Invalid theme/mode values reset
- Duplicate/bad hotkeys reset to defaults
- Corrupt JSON settings fall back to defaults and generate an error log

ADDITIONAL BUG FIXES
- Fixed missing choose_recording method that prevented the GUI from opening.
- Added missing Raw Action Editor implementation.
- Fixed Raw Action Editor header/help overlap.
- Fixed speed label so it updates while moving the slider.
- Stopped rewriting settings on every tiny speed-slider movement.
- Hardened save_vars against invalid/partially typed numeric fields.
- Scroll wheel can now be recorded independently even when Mouse clicks is unchecked.
- Mouse movement can also create the mouse listener independently.
- Target validation is stricter: matching `msedge.exe`/`chrome.exe` alone is no longer enough when a window title was recorded.
- Wrong window/tab in the same application is more likely to pause instead of receiving a click.
- Desktop shortcut installer can target the reliable BAT when an EXE has not been built yet.
- Removed obsolete Browser_Capture_Helper.html to avoid confusing it with the current smart browser helper.

CALENDAR / SMART TARGET FEATURES RETAINED
- Calendar Guide
- Dynamic TODAY rule
- Windows UI Automation targets
- Browser Smart Capture
- Calendar self-test
- Reopened-window resolution
- Safe simple-click semantic invocation
- Website date-picker semantic replay
- Scroll recording/playback
- Smart Actions
- Exports: JSON, TXT, CSV, Python, Smart JSON, Smart CSV
- Professional GUI and hover hints

DEFAULT HOTKEYS
F8 Start
F9 Stop + Save
F10 Pause / Resume
F12 Play
ESC Emergency Stop

BUILD EXE
Run Build_Rice2k_Macro_Studio_EXE.bat.
The browser helper is bundled with the EXE build.

If Run_Rice2k_Macro_Studio.bat still fails on your PC, run Run_Setup_Diagnostics.bat and send the resulting setup_diagnostics.txt or launcher_log.txt.
