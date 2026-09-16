# 🪵 Logging & Diagnostics

Rice2k Macro Studio includes multiple layers of logging so startup, GUI, thread, playback, and environment problems are easier to trace.

---

## Normal log location

```text
Documents\Rice2k Macro Studio\Errors
```

If Documents cannot be written, fallback startup/error logs can be written under:

```text
%TEMP%\Rice2k Macro Studio
```

---

## Log files

### `launcher_log.txt`
Created by `Run_Rice2k_Macro_Studio.bat`.

Contains information such as:
- Package folder
- Python detection
- Python version
- Tkinter check
- Dependency import checks
- Dependency repair attempts
- Source-loader compile check
- Reconstructed source validation
- Application exit code

Use this first when the program does not open.

---

### `startup_log.txt`
Tracks major application startup milestones.

Examples:
- Python app entry
- Folder/DPI setup complete
- GUI initialized
- GUI closed normally
- Fatal startup error

Use this when the launcher starts Python but the GUI fails during initialization.

---

### `error_log.txt`
General application error log.

Can include:
- Handled exceptions
- Startup/mainloop failures
- Tkinter callback errors
- Worker-thread exceptions
- File/load/export problems
- Open-folder errors
- Browser-helper creation/import errors

Entries include date/time, app version, Python version, platform, source, error type, message, and traceback where available.

---

### `faulthandler.log`
Low-level Python fault information when `faulthandler` is supported/enabled.

Useful when:
- Python crashes without a normal traceback
- A native extension causes a hard failure
- Threads appear involved in a low-level fault

---

### `setup_diagnostics.txt`
Created by:

```text
Run_Setup_Diagnostics.bat
```

Checks may include:
- `py`
- `python`
- `pythonw`
- Python version/platform
- Tkinter
- PyAutoGUI
- pynput
- psutil
- screeninfo
- pywinauto
- Python source compile status

Use this when the launcher reports an environment problem.

---

## In-app diagnostics

### Pre-flight Test
Run before an important playback.

Checks can include:
- Recording loaded
- Input libraries
- Recorder libraries
- Windows UI Automation availability
- Smart-target metadata count
- Virtual desktop information
- Target application/window information
- Hotkey uniqueness

---

### Calendar TODAY Test
Tests:
- Current-date label recognition
- Windows UI Automation availability

Use it when a TODAY calendar step is not resolving correctly.

---

### Debug logging
Debug logging can include additional action details, including mouse moves.

Use it temporarily while troubleshooting because movement-heavy recordings can generate large logs.

---

## What to collect for a bug report

If something breaks, the most useful set is:

1. What you were doing
2. Exact button/mode used
3. Whether it was desktop or browser automation
4. `launcher_log.txt` if startup was involved
5. `error_log.txt`
6. `setup_diagnostics.txt` if Python/dependencies were involved
7. A screenshot of the app state/error
8. Whether Pre-flight passed or failed
9. Whether the issue repeats with a fresh recording

Do not share credentials, secrets, private tokens, or sensitive captured data.

---

## Common log flow

```text
BAT launcher starts
        ↓
launcher_log.txt
        ↓
Python application starts
        ↓
startup_log.txt
        ↓
GUI / worker / handled exception
        ↓
error_log.txt
        ↓
low-level Python/native fault (if any)
        ↓
faulthandler.log
```

---

## Log rotation

The application rotates the main error log when it grows beyond the configured size, keeping backup files so one long-running error stream does not grow forever.

---

## Related pages

- [Troubleshooting](TROUBLESHOOTING.md)
- [User Guide](USER_GUIDE.md)
- [Feature Guide](FEATURES.md)
