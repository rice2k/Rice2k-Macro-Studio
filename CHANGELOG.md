# 📝 Rice2k Macro Studio Changelog

This page records user-facing changes to **Rice2k Macro Studio**. For the shorter chronological summary, see [Version History](docs/VERSION_HISTORY.md).

---

## v1.1 — Website Recording Filters

**Status:** Current release  
**Theme:** More precise website recording with privacy-first input capture.

### 🌐 Website capture
- Added independent browser capture toggles for:
  - Clicks
  - Scroll
  - Click location
  - Text input
  - Selections
- Added quick presets:
  - All Safe
  - Clicks Only
  - Click + Location
  - Scroll Only
  - Input Only
  - Selection Only
- Browser helper receives the app's saved website-filter defaults when generated.
- Browser helper filters can also be changed live while recording.
- Added debounced page/element scroll recording.
- Added semantic scroll replay using stored scroll positions.
- Added optional click coordinates so website clicks can be semantic-only when desired.

### ⌨ Input and selections
- Added opt-in recording/replay for ordinary non-sensitive text fields.
- Added dropdown selection recording/replay.
- Added checkbox/radio state recording/replay.
- Added date/month/week selection recording/replay.
- Added native website date input support for the dynamic TODAY rule.

### 🧠 Smart Actions and exports
- Smart Actions distinguishes:
  - `browser_click`
  - `browser_scroll`
  - `browser_input`
  - `browser_selection`
- Smart JSON/CSV preserve browser event type and event details.
- Browser scroll positions, optional input values, selected text/index, checked state, and optional click coordinates can be preserved in exports.

### 🔒 Privacy and safety
- Text-input recording remains **OFF by default**.
- Password, passcode, token, secret, API-key, authentication, OTP, verification-code, CVV/CVC, PIN, SSN, and similar security fields are blocked/redacted.
- Sensitive input replay is blocked.

### 🧰 Source/build layout
- Added `src_patches/v1_1_website_filters.pyfrag`.
- Source loader injects version patches before `main()` starts.
- Launcher validates reconstructed patched source before startup.
- EXE build includes `src_patches`.

---

## v1.0 — Rice2k Macro Studio Initial GitHub Release

**Theme:** Rebrand, reliability, diagnostics, smart targets, calendar rules, and polished project packaging.

### 🎨 Project identity
- Renamed application to **Rice2k Macro Studio**.
- Renamed launcher, Python entry point, build output, icons, app folder, and documentation.
- Added GitHub-ready source-loader structure.

### 🚀 Reliable startup
- Rebuilt Windows launcher as a self-diagnosing startup utility.
- Detects `py -3` and standard `python` installations.
- Checks Tkinter before GUI startup.
- Checks/repairs required Python packages.
- Runs Python compile validation before launching.
- Detects incomplete source/package extraction.
- Added `Run_Setup_Diagnostics.bat`.

### 🪵 Error handling and logs
- Added launcher logging.
- Added startup logging.
- Added general application error logging.
- Added Tkinter callback exception logging.
- Added worker-thread exception logging.
- Added Python `faulthandler` output where supported.
- Added fallback log location under `%TEMP%` when Documents is unavailable.

### ⚙ Settings hardening
- Corrupt settings JSON can recover to safe defaults.
- Invalid speed/repeat/delay/countdown values are sanitized.
- Invalid mode/theme values reset safely.
- Duplicate/invalid hotkeys reset to defaults.
- Settings writes use a temporary file before replacement.

### 🖱 Recording/playback
- Mouse clicks
- Scroll recording/playback
- Optional keyboard recording
- Optional full movement path
- Click-Only Fast mode
- Physical Replay mode
- Window-Aware mode
- Adjustable speed/repeats/delay
- Pause/resume
- Emergency stop
- Held-input cleanup
- Multi-monitor/DPI metadata

### 🧠 Smart targets
- Windows application/window metadata.
- UI Automation control recognition when available.
- Control name/type/AutomationId/class/framework.
- Semantic activation before coordinate fallback for simple left clicks.
- Target-window validation.
- Reopened-window resolution when an old HWND is stale.

### 📅 Calendar automation
- Added dynamic `TODAY` rules.
- Added Calendar Guide page.
- Added Calendar TODAY self-test.
- Added browser calendar semantic matching.
- Added Windows UI Automation calendar matching.
- Reduced false positives for generic "Today" buttons and duplicate day cells.

### 🧾 Review/export
- Smart Actions review.
- Raw Action Editor.
- JSON export.
- Readable TXT export.
- Raw CSV export.
- Smart JSON/CSV export.
- Python/PyAutoGUI-style export.

---

## Pre-v1.0 Development Lineage

Before the Rice2k Macro Studio name, the project went through a series of internal **Mouse Recorder Pro** builds. Those builds introduced the features that became v1.0:

| Internal milestone | Major work introduced |
|---|---|
| Early builds | Mouse recording, replay, repeats, delays, speed controls |
| Keyboard builds | Optional keyboard capture/replay and recording controls |
| All Upgrades | Profiles, recovery, target warnings, exports, themes |
| Performance + Hotkeys | Click-only fast mode, global hotkeys, playback optimization |
| Automation Modes | Physical, browser, click-fast, window-aware workflows |
| GUI + Error Logs | Dashboard redesign and error-log UI |
| Stable + Scroll | Scroll support, state machine, safer playback, Smart Actions |
| Professional UI + Export | Professional colors, tooltips, export center, help pages |
| Smart Targets + Calendar TODAY | UI Automation metadata and dynamic date rules |
| Calendar Guide + Debugged Smart Targets | Calendar documentation and deeper bug fixes |
| Reliable Launcher + Crash Logging | Self-diagnosing launcher and expanded exception logging |

These development milestones were consolidated and rebranded into **Rice2k Macro Studio v1.0**.

---

## Documentation

- [Feature Guide](docs/FEATURES.md)
- [User Guide](docs/USER_GUIDE.md)
- [Website Recording](docs/WEBSITE_RECORDING.md)
- [Calendar Automation](docs/CALENDAR_AUTOMATION.md)
- [Logging & Diagnostics](docs/LOGGING_AND_DIAGNOSTICS.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)
- [Version History](docs/VERSION_HISTORY.md)
