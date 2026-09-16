<div align="center">

# Rice2k Macro Studio

### Record • Automate • Simplify

**A Windows macro recording and automation studio by Rice2k**

![Version](https://img.shields.io/badge/version-1.3-0B83FF)
![Platform](https://img.shields.io/badge/platform-Windows-178BFF)
![UI](https://img.shields.io/badge/UI-Mockup--Matched-20D6C2)
![Status](https://img.shields.io/badge/status-active-26DB7A)

</div>

Rice2k Macro Studio records and replays mouse clicks, keyboard input, scrolling, optional mouse movement, smart Windows UI targets, browser element actions, and dynamic calendar rules such as **TODAY**.

## v1.3 Mockup-Matched UI

<div align="center">
<img src="rice2k_macro_studio.png" width="128" alt="Rice2k Macro Studio icon">
</div>

Version 1.3 rebuilds the shell and Dashboard around the approved visual concept instead of only applying colors to standard widgets.

### What changed visually

- Full branded top header with the Rice2k mouse-and-gear identity
- Compact icon-led sidebar matching the approved layout
- Card-based Dashboard instead of thin `ttk` fieldsets
- Larger recording/playback controls
- Status chips and large stat cards
- Two-column recording/playback settings area
- Quick Actions, Tips, and Hotkeys cards
- Persistent footer status area
- Auto-hiding page scrollbar
- Mouse-wheel scrolling on scrollable pages
- Explicit dark hover, focus, pressed, disabled, readonly, and selected states
- No system-white hover fallback in dark mode
- Segoe UI Variable / Segoe UI font preference on Windows
- Custom Rice2k Macro Studio application icon

## Navigation

| Page | Use it for |
| --- | --- |
| **Dashboard** | Start/stop recording, playback, quick settings, hotkeys |
| **Recordings** | Load, replay, export, or recover saved recordings |
| **Web Capture** | Browser semantic capture and website recording filters |
| **Smart Targets** | Review recognized Windows/browser targets and dynamic rules |
| **Calendar** | Configure and test dynamic **TODAY** calendar actions |
| **Settings** | Theme, countdown, timing, and global hotkeys |
| **Diagnostics** | Pre-flight tests, calibration, error logs, UIA status |
| **Export** | JSON, TXT, CSV, Python, Smart JSON, Smart CSV |
| **Help** | Built-in workflow and feature documentation |

## Recommended everyday setup

For most tasks:

- **Mouse clicks:** On
- **Scroll wheel:** On
- **Keyboard:** Only when needed
- **Mouse movement path:** Off
- **Skip movement on playback:** On
- **Mode:** Click-Only Fast

Use **Smart Targets** when the target button/control can move. Use **Web Capture** when automating browser pages. Use **Physical Replay** only when the exact pointer path matters.

## Website recording filters

Browser Smart Capture can independently record:

- **Clicks**
- **Scroll**
- **Click location**
- **Text input** — opt-in
- **Selections** — dropdowns, checkbox/radio state, date/month/week

Presets include **All Safe**, **Clicks Only**, **Click + Location**, **Scroll Only**, **Input Only**, and **Selection Only**.

Text input is off by default. Passwords, passcodes, tokens, secrets, API keys, authentication fields, OTP/verification codes, CVV/CVC, PIN, SSN, and similar security fields are blocked/redacted.

## Dynamic calendar TODAY

### Windows/native calendar

1. Record the calendar date click.
2. Open **Smart Targets**.
3. Select the recognized date click.
4. Choose **Mark Selected = TODAY**.
5. Save the edited copy.

### Website calendar

1. Create/open the Browser Element Capture helper.
2. Start Smart Capture.
3. Open the calendar.
4. Choose **Mark Next = TODAY**.
5. Click today's date.

The replay resolves the current date again instead of reusing the old coordinate.

## Playback and safety

- Repeat count and delay between runs
- Playback speed control
- Pause/resume
- Emergency stop
- Held-key/button cleanup
- Target-window validation
- Pause if target changes
- Multi-monitor/DPI metadata
- Mouse-only safe mode

> Physical replay controls the active desktop. For true simultaneous independent work, use semantic browser automation, another Windows session, a VM/Remote Desktop session, or another PC.

## Default hotkeys

| Action | Hotkey |
| --- | --- |
| Start Recording | `F8` |
| Stop + Save | `F9` |
| Pause / Resume | `F10` |
| Play | `F12` |
| Emergency Stop | `Esc` |

## Error logs and diagnostics

Normal log folder:

`Documents\Rice2k Macro Studio\Errors`

Files may include:

- `launcher_log.txt`
- `startup_log.txt`
- `error_log.txt`
- `faulthandler.log`
- `setup_diagnostics.txt`

If the Documents path cannot be written, startup/error logging falls back under `%TEMP%\Rice2k Macro Studio`.

Run `Run_Setup_Diagnostics.bat` when the launcher or GUI fails to start.

## Run

1. Extract the complete ZIP or clone the repository.
2. Run `Run_Rice2k_Macro_Studio.bat`.
3. The launcher verifies Python, Tkinter, dependencies, source fragments, version patches, and source compilation before startup.

## Build the EXE

Run:

`Build_Rice2k_Macro_Studio_EXE.bat`

Expected output:

`dist\Rice2k Macro Studio.exe`

The build bundles the browser helper, app icon, source fragments, and version patches. Navigation icons have embedded fallbacks so source installs remain self-contained.

## Documentation

- [`docs/V1_3_UI_REDESIGN.md`](docs/V1_3_UI_REDESIGN.md) — v1.3 visual implementation
- [`docs/UI_DESIGN_STANDARDS.md`](docs/UI_DESIGN_STANDARDS.md) — UI rules for this and future Rice2k tools
- [`docs/VERSION_HISTORY.md`](docs/VERSION_HISTORY.md) — release history
- [`CHANGELOG.md`](CHANGELOG.md) — version changes
- [`README.txt`](README.txt) — compact offline guide

## Project

Created by **Rice2k**.

Repository: `rice2k/Rice2k-Macro-Studio`
