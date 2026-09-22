<div align="center">

# Rice2k Macro Studio

### Record • Automate • Simplify

**A Windows macro recording and automation studio by Rice2k**

![Version](https://img.shields.io/badge/version-1.5.3-39FF88)
![Platform](https://img.shields.io/badge/platform-Windows-178BFF)
![UI](https://img.shields.io/badge/UI-Compact%20Polished-20D6C2)
![Status](https://img.shields.io/badge/status-active-26DB7A)

</div>

Rice2k Macro Studio records and replays mouse clicks, keyboard input, scrolling, optional mouse movement, smart Windows UI targets, browser element actions, and dynamic calendar rules such as **TODAY**.

## v1.5.3 — Recording Freeze Fix

This release focuses on long-running recording stability and the Elapsed timer stall reported during recording.

### What changed

- Fixed a UI log-drain callback that could stay busy while new events continued arriving and starve Tk's main event loop.
- Recording statistics now use incremental counters instead of repeatedly copying/scanning the full raw action list.
- Recovery-journal writes now use a background queue with batched disk writes.
- Elapsed recording time now uses a monotonic clock and the timer reschedules itself after transient callback errors.
- Added `hang_watchdog.log`, which records Python thread stacks if the UI heartbeat is stale for 5+ seconds.
- UI session logs and the UI log queue are bounded so long sessions cannot grow indefinitely.
- The downloadable v1.5.3 package also caches monitor metadata for each recording session and fixes Smart Target click metadata persistence.

### Stress-test result

A virtual-display regression test ran past the reported failure point with heavy simulated recording traffic:

- **18 seconds** continuous recording
- **4,473** simulated actions
- Elapsed timer reached **00:18**
- UI log queue remained responsive
- No watchdog stall was detected

See [`docs/V1_5_3_RECORDING_FREEZE_FIX.md`](docs/V1_5_3_RECORDING_FREEZE_FIX.md) for the troubleshooting details.

### Playback stability retained

- **Keep playing if I switch windows** is enabled by default for normal playback.
- Dense/high-speed playback keeps the system-friendly throttle added in v1.5.1.
- **Window-Aware** mode still enables strict target protection when you need it.
- Standalone EXE macros retain the playback throttle and emergency-stop behavior.

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
| **Export** | JSON, TXT, CSV, Python, Smart JSON, Smart CSV, Standalone EXE |
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
- Optional target-window protection
- Continue playback when switching windows
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
- `hang_watchdog.log`
- `faulthandler.log`
- `setup_diagnostics.txt`

If the UI ever stalls again, `hang_watchdog.log` is the first file to inspect because it records thread stacks during the stall.

## Run

1. Extract the complete ZIP or clone the repository.
2. Run `Run_Rice2k_Macro_Studio.bat`.
3. The launcher verifies Python, Tkinter, dependencies, source fragments, version patches, source compilation, and GUI startup before the normal launch.

## Build the EXE

Run `Build_Rice2k_Macro_Studio_EXE.bat`.

Expected output: `dist\Rice2k Macro Studio.exe`

## Documentation

- [`docs/V1_5_3_RECORDING_FREEZE_FIX.md`](docs/V1_5_3_RECORDING_FREEZE_FIX.md) — current recording-freeze fix
- [`docs/V1_5_1_PLAYBACK_STABILITY.md`](docs/V1_5_1_PLAYBACK_STABILITY.md) — playback stability behavior
- [`docs/STANDALONE_EXE_EXPORT.md`](docs/STANDALONE_EXE_EXPORT.md) — standalone EXE export
- [`docs/V1_4_2_THEME_RUNTIME_FIX.md`](docs/V1_4_2_THEME_RUNTIME_FIX.md) — theme runtime fix
- [`docs/UI_DESIGN_STANDARDS.md`](docs/UI_DESIGN_STANDARDS.md) — UI rules for Rice2k tools
- [`docs/VERSION_HISTORY.md`](docs/VERSION_HISTORY.md) — release history
- [`CHANGELOG.md`](CHANGELOG.md) — detailed version changes

## Project

Created by **Rice2k**.

Repository: `rice2k/Rice2k-Macro-Studio`
