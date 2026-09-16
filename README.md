# Rice2k Macro Studio

**Rice2k Macro Studio** is a Windows macro recording and automation utility by Rice2k. It records and replays mouse clicks, keyboard input, scrolling, optional mouse movement, smart Windows UI targets, browser element targets, and dynamic calendar actions such as **TODAY**.

## Highlights

- Mouse click, keyboard, scroll, and optional movement recording
- Click-Only Fast and Physical Replay modes
- Windows UI Automation smart-target recognition
- Browser Smart Capture with semantic element details
- Dynamic calendar **TODAY** rules for Windows and website date pickers
- Smart Actions review and raw action editing
- Repeat playback, delays, speed control, pause/resume, and emergency stop
- Multi-monitor and DPI-aware metadata
- Target-window validation
- JSON, TXT, CSV, Python, Smart JSON, and Smart CSV exports
- Pre-flight diagnostics, recovery journal, and detailed error logging
- Professional dark/light GUI with hover help
- Self-diagnosing Windows launcher

## Quick Start

1. Download or clone the **entire** repository.
2. On Windows, run `Run_Rice2k_Macro_Studio.bat`.
3. The launcher checks Python, Tkinter, dependencies, the source loader, and all application source fragments before opening the app.
4. For environment troubleshooting, run `Run_Setup_Diagnostics.bat`.

### Source layout

`rice2k_macro_studio.py` is the small entry-point/loader. The validated application source is stored in order under `src_fragments/part_01.pyfrag` through `part_14.pyfrag`. The loader joins those files and executes them as one application module. Keep the `src_fragments` folder beside the launcher/source file when cloning, downloading, or building.

### Recommended recording settings

For most automation tasks:

- Mouse clicks: **On**
- Scroll wheel: **On**
- Keyboard: only when needed
- Mouse movement path: **Off**
- Skip movement on playback: **On**
- Mode: **Click-Only Fast**

## Calendar TODAY Rules

For a Windows/native calendar:

1. Record the date click.
2. Open **Smart Targets + Actions**.
3. Select the recognized calendar click.
4. Choose **Mark Selected = TODAY**.
5. Save an edited copy.

For a website calendar:

1. Create/open `Browser_Element_Capture_Helper.html`.
2. Start the Rice2k Macro Studio Smart Capture bookmarklet.
3. Open the website calendar.
4. Choose **Mark Next = TODAY**.
5. Click today's date.

Future replay recalculates the current date instead of reusing the original day's coordinates.

## Error Logs

Normal logs are stored under:

`Documents\Rice2k Macro Studio\Errors`

The launcher and application can produce:

- `launcher_log.txt`
- `startup_log.txt`
- `error_log.txt`
- `faulthandler.log`
- `setup_diagnostics.txt`

If Documents is unavailable, startup/error logging falls back under `%TEMP%\Rice2k Macro Studio`.

## Build the EXE

Run:

`Build_Rice2k_Macro_Studio_EXE.bat`

The build bundles the application source fragments, browser capture helper, and PNG icon. The expected output is:

`dist\Rice2k Macro Studio.exe`

## Default Hotkeys

| Action | Hotkey |
|---|---|
| Start recording | F8 |
| Stop + Save | F9 |
| Pause / Resume | F10 |
| Play | F12 |
| Emergency Stop | Esc |

## Privacy

Browser Smart Capture does not intentionally store typed form values. Password-related fields are redacted.

## Limitations

Physical mouse/keyboard replay controls the active Windows desktop. It cannot reliably automate one desktop application with the physical pointer while you independently use the same desktop in another application. Browser semantic automation, a VM, Remote Desktop, another Windows session, or another PC are better choices for true simultaneous work.

## Project

Created by **Rice2k**.

Repository: `rice2k/Rice2k-Macro-Studio`
