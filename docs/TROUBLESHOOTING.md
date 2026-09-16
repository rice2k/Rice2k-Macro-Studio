# 🛠 Rice2k Macro Studio Troubleshooting

Use this page when the launcher, GUI, recording, playback, browser capture, or smart targeting does not behave as expected.

---

## App does not open

### 1. Make sure the whole project is present
Do not run a single BAT file copied out of the project by itself.

Expected items include:
- `rice2k_macro_studio.py`
- `src_fragments/`
- `src_patches/`
- `requirements.txt`
- `Browser_Element_Capture_Helper.html`

### 2. Run the normal launcher

```text
Run_Rice2k_Macro_Studio.bat
```

If it fails, read:

```text
Documents\Rice2k Macro Studio\Errors\launcher_log.txt
```

### 3. Run setup diagnostics

```text
Run_Setup_Diagnostics.bat
```

Review `setup_diagnostics.txt` for Python/Tkinter/package failures.

---

## Python not found

The launcher prefers `py -3`, then falls back to `python`.

Fixes:
- Install a normal Windows Python 3.10+ distribution
- Enable **Add python.exe to PATH** during install
- Make sure Tcl/Tk is included

A Microsoft Store alias named `python` is not always a complete working Python installation.

---

## Tkinter unavailable

Rice2k Macro Studio uses Tkinter for its GUI.

If diagnostics says Tkinter is missing:
- Reinstall standard Windows Python
- Make sure Tcl/Tk support is selected

---

## Missing packages

The launcher attempts package repair with pip.

Required packages include:
- pyautogui
- pynput
- psutil
- screeninfo
- pywinauto
- Pillow
- PyInstaller for EXE builds

Check `launcher_log.txt` if pip repair fails.

---

## Recording will not start

Check that at least one recording source is enabled:
- Mouse clicks
- Scroll
- Mouse movement
- Keyboard

Scroll can work independently of Mouse clicks.

If mouse/scroll recording fails, check pynput in setup diagnostics.

---

## Playback clicks the wrong place

Try these in order:

1. Run **Pre-flight**.
2. Make sure the expected application/window is foreground.
3. Enable target validation.
4. Enable pause-if-target-changes.
5. Use Window-Aware mode.
6. Prefer Windows Smart Targets when the control moves.
7. Use X/Y calibration only if the offset is consistent everywhere.

Do not use calibration to compensate for a completely different window layout.

---

## Wrong Edge/Chrome/Office window is targeted

Rice2k Macro Studio compares process and compatible window-title data when both were recorded.

If a same-process wrong tab/document is still involved:
- Put the exact expected window in front
- Re-record against a stable title/state
- Prefer Browser Smart Capture for website elements

---

## Playback is laggy

Try:
- Click-Only Fast mode
- Mouse movement path off
- Skip movement on playback on
- Lower unnecessary debug logging
- Remove movement-heavy raw actions

Physical Replay naturally contains many more actions than click-only recording.

---

## Scroll does not record

Make sure **Scroll** is enabled.

Mouse clicks do not have to be enabled for scroll-only desktop recording.

For website-specific scrolling, use Browser Smart Capture with **Scroll Only**.

---

## Website click target not found

The website DOM may have changed.

Try:
- Capture the action again
- Prefer semantic labels/IDs/roles/selectors
- Turn off click location if you want semantic-only recording
- Use click location if you need coordinate reference while debugging

---

## Website scroll target not found

The scrollable container may have been recreated or given a different selector.

Capture a fresh scroll action and compare it.

---

## Website text input is not being recorded

Check:
- Text Input filter is enabled
- The field is not intentionally classified as sensitive
- The field is an ordinary input/textarea rather than a custom editor

Sensitive password/security fields are intentionally blocked.

---

## Website input does not replay correctly

Some modern sites use custom JavaScript/framework event systems.

Try:
- Capture again
- Confirm the target selector is still valid
- Check whether the field is a custom component rather than a standard input
- Prefer selections/buttons where possible

---

## Checkbox/radio/select state is wrong

Use the **Selections** filter rather than treating the control as a generic click.

Browser selection replay is designed to restore the intended selected/checked state rather than blindly toggling it.

---

## TODAY calendar action fails

1. Run **Calendar TODAY Test**.
2. Open the calendar before replay if necessary.
3. Review the Smart Target / browser metadata.
4. For websites, recapture using **Mark Next = TODAY**.
5. For Windows, confirm UI Automation is available.

Some custom-drawn calendars expose no usable semantic date data.

See [Calendar Automation](CALENDAR_AUTOMATION.md).

---

## Hotkeys do not work

Check Settings and confirm:
- Keys are unique
- Another application is not intercepting them
- Global hotkey listener started normally

Default:
- F8 Start
- F9 Stop + Save
- F10 Pause/Resume
- F12 Play
- Esc Emergency Stop

---

## Error log is huge

Turn off Debug Logging after troubleshooting.

Mouse movement debug logging can be especially verbose.

The main error log also uses rotation to limit unbounded growth.

---

## Recording file will not load

Possible causes:
- File is not JSON
- JSON is damaged/truncated
- It was manually edited into an invalid structure

Check `error_log.txt` for the load exception.

---

## EXE build fails

Run:

```text
Build_Rice2k_Macro_Studio_EXE.bat
```

Check:
- Python is installed
- pip works
- PyInstaller installed successfully
- `rice2k_macro_studio.png` exists
- Browser helper exists
- `src_fragments` exists
- `src_patches` exists

---

## What to send when reporting a problem

Useful information:
- Screenshot/error message
- What you clicked
- Mode used
- Whether it was desktop or browser automation
- Relevant log files
- Pre-flight result
- Whether a fresh recording reproduces it

Never send passwords, credentials, secret tokens, or sensitive captured input.

---

## Related pages

- [Logging & Diagnostics](LOGGING_AND_DIAGNOSTICS.md)
- [User Guide](USER_GUIDE.md)
- [Feature Guide](FEATURES.md)
- [Website Recording](WEBSITE_RECORDING.md)
- [Calendar Automation](CALENDAR_AUTOMATION.md)
