<div align="center">

# Rice2k Macro Studio

### Record • Automate • Simplify

**A Windows macro recording and automation studio by Rice2k**

![Version](https://img.shields.io/badge/version-1.4.1-39FF88)
![Platform](https://img.shields.io/badge/platform-Windows-178BFF)
![UI](https://img.shields.io/badge/UI-Compact%20Polished-20D6C2)
![Status](https://img.shields.io/badge/status-active-26DB7A)

</div>

Rice2k Macro Studio records and replays mouse clicks, keyboard input, scrolling, optional mouse movement, smart Windows UI targets, browser element actions, and dynamic calendar rules such as **TODAY**.

## v1.4.1 — Compact Cleanup

<div align="center">
<img src="rice2k_macro_studio.png" width="128" alt="Rice2k Macro Studio icon">
</div>

Version **1.4.1** keeps the v1.3 mockup-matched shell while tightening the parts that still felt oversized or inconsistent after real Windows testing.

### What changed

- Added **Neo Green** theme — deep green/black surfaces with neon-green accents
- Reworked **Light** into a softer blue/gray theme instead of harsh white
- Tightened Dashboard cards, spacing, and primary controls
- Normalized sidebar icons to a smaller compact size
- Added compact checkbox/radio styling
- Removed excess blank space at the top of **Recordings**
- Centered **Recordings**, **Web Capture**, **Calendar**, and **Settings** content instead of stretching every box edge-to-edge
- Moved option controls closer to the text they belong to
- Preserved explicit hover/focus/pressed/disabled colors to prevent bright-white Windows fallback states
- Preserved mouse-wheel scrolling and auto-hiding page scrollbars

### Themes

| Theme | Best for | Look |
| --- | --- | --- |
| **Dark** | Default everyday use | Navy/blue professional UI |
| **Neo Green** | High-contrast / retro-tech look | Black/deep green + neon green |
| **Light** | Bright rooms / light preference | Soft blue-gray surfaces, not pure white |

See [v1.4.1 Compact Cleanup](docs/V1_4_1_COMPACT_CLEANUP.md) for detailed design notes and testing.

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

Use **Smart Targets** when a target button/control can move. Use **Web Capture** for browser automation. Use **Physical Replay** when the exact pointer path matters.

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

Replay resolves the current date again instead of reusing the old coordinate.

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

## Logs and diagnostics

Normal log folder:

`Documents\Rice2k Macro Studio\Errors`

Files may include `launcher_log.txt`, `startup_log.txt`, `error_log.txt`, `faulthandler.log`, and `setup_diagnostics.txt`.

Run `Run_Setup_Diagnostics.bat` when the launcher or GUI fails to start.

## Run

1. Extract the complete ZIP or clone the repository.
2. Run `Run_Rice2k_Macro_Studio.bat`.
3. The launcher verifies Python, Tkinter, dependencies, source fragments, version patches, and source compilation before startup.

## Build the EXE

Run `Build_Rice2k_Macro_Studio_EXE.bat`.

Expected output: `dist\Rice2k Macro Studio.exe`

## Documentation

- [`docs/V1_4_1_COMPACT_CLEANUP.md`](docs/V1_4_1_COMPACT_CLEANUP.md) — current theme/layout cleanup
- [`docs/V1_3_UI_REDESIGN.md`](docs/V1_3_UI_REDESIGN.md) — original mockup-matched shell redesign
- [`docs/UI_DESIGN_STANDARDS.md`](docs/UI_DESIGN_STANDARDS.md) — UI rules for this and future Rice2k tools
- [`docs/VERSION_HISTORY.md`](docs/VERSION_HISTORY.md) — release history
- [`CHANGELOG.md`](CHANGELOG.md) — detailed version changes

## Project

Created by **Rice2k**.

Repository: `rice2k/Rice2k-Macro-Studio`
