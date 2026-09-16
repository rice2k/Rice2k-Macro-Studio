# 📝 Rice2k Macro Studio Changelog

This page records user-facing changes to **Rice2k Macro Studio**. For a shorter chronology, see [Version History](docs/VERSION_HISTORY.md).

---

## v1.2 — Compact UI Redesign

**Status:** Current release  
**Theme:** A tighter, darker, scrollable desktop UI with explicit interaction-state styling.

### 🎨 Compact interface
- Replaced the wide sidebar with a compact ~152 px icon + label sidebar.
- Added visible Rice2k mouse-and-gear branding.
- Reorganized the Dashboard into:
  - Main recording/playback controls
  - Actions / elapsed / playback status cards
  - Recording options
  - Playback options
  - Quick Actions
  - Tips
  - Hotkey reference
- Reduced button padding, tree-row height, card spacing, and page margins.
- Added active-page sidebar highlighting.

### 🖱 Main controls
- Added icon-forward labels for Start, Stop + Save, Pause/Resume, Play, and Emergency Stop.
- Kept default hotkeys visible in the dashboard.
- Kept all v1.1 recording/playback options intact.

### 🌑 Bright-white highlight fix
- Explicitly mapped dark colors for normal, active, hover, focus, pressed, disabled, readonly, and selected states.
- Applied explicit states to:
  - Standard buttons
  - Primary / accent / danger buttons
  - Sidebar buttons
  - Checkboxes
  - Radio buttons
  - Entries
  - Spinboxes
  - Comboboxes
  - Scales
  - Treeviews / headings
  - Scrollbars
  - List/Text selections
- Prevents Windows ttk/system-theme fallback from turning highlighted or disabled controls bright white.

### 🖱 Page scrolling
- Added mouse-wheel scrolling to scrollable pages while the pointer is over the page.
- Supports Windows `<MouseWheel>` behavior.
- Retains X11 wheel bindings for development/testing.
- Listboxes and Treeviews keep their native scrolling.

### 🔤 Typography
- Uses **Segoe UI Variable** on supported Windows versions.
- Falls back to **Segoe UI**.
- Technical/monospaced content prefers Cascadia Mono / Consolas.

### 🖼 Branding and icon
- Added the blue/cyan mouse + gear Rice2k Macro Studio icon.
- Runtime UI loads the PNG icon.
- Build package retains Windows icon assets.

### ✅ Validation
- Python compile/import passed.
- No duplicate class methods.
- No missing direct UI callbacks.
- GUI smoke-tested Dashboard, Recordings, Smart Targets, Exports, Automation, Calendar, Diagnostics, Settings, and Help.
- Verified dark active/disabled/readonly state colors.
- Verified mouse-wheel scrolling.
- Verified icon files/build references.
- Verified error/startup logging.
- Verified browser-helper JavaScript.
- Verified v1.1 Website Filters, Calendar TODAY, Smart Targets, Raw Editor, and exports remain present.
- Final v1.2 validation: **31 checks, 0 failures**.

### 📚 Documentation
- Added [UI Design Standards](docs/UI_DESIGN_STANDARDS.md).
- Added [v1.2 UI Redesign](docs/V1_2_UI_REDESIGN.md).
- Updated README and Version History for v1.2.

---

## v1.1 — Website Recording Filters

**Theme:** More precise website recording with privacy-first input capture.

### 🌐 Website capture
- Added independent browser capture toggles for Clicks, Scroll, Click Location, Text Input, and Selections.
- Added All Safe, Clicks Only, Click + Location, Scroll Only, Input Only, and Selection Only presets.
- Added debounced page/element scroll recording.
- Added semantic scroll replay.
- Added optional click coordinates for semantic-only browser clicks.

### ⌨ Input and selections
- Added opt-in ordinary non-sensitive text input recording/replay.
- Added dropdown, checkbox/radio, date/month/week selection recording/replay.
- Added native website date-input support for TODAY.

### 🔒 Privacy
- Text input remains OFF by default.
- Password, passcode, token, secret, API-key, auth, OTP, verification code, CVV/CVC, PIN, SSN, and similar fields are blocked/redacted.
- Sensitive input replay is blocked.

### 🧰 Source layout
- Added `src_patches/v1_1_website_filters.pyfrag`.
- Loader applies patches before `main()`.
- Launcher validates reconstructed source.

---

## v1.0 — Rice2k Macro Studio Initial GitHub Release

### Project identity
- Renamed application to **Rice2k Macro Studio**.
- Added GitHub-ready source-loader/fragment layout.

### Reliability
- Self-diagnosing Windows launcher.
- Python/Tkinter/dependency checks.
- Setup diagnostics.
- Startup/error/thread/Tkinter logs.
- `faulthandler` where supported.
- Settings recovery/sanitation.

### Recording/playback
- Mouse clicks, scroll, optional keyboard, optional movement path.
- Click-Only Fast, Physical Replay, Window-Aware.
- Speed, repeats, delay, pause/resume, emergency stop.
- Multi-monitor/DPI metadata.

### Smart Targets / Calendar
- Windows UI Automation metadata.
- Semantic target activation with coordinate fallback.
- Dynamic TODAY rule.
- Calendar Guide and self-test.

### Review/export
- Smart Actions.
- Raw Action Editor.
- JSON / TXT / CSV / Python / Smart JSON / Smart CSV exports.

---

## Pre-v1.0 Development Lineage

Before the Rice2k Macro Studio name, the project used the internal **Mouse Recorder Pro** development name. Major milestones introduced mouse/keyboard recording, performance hotkeys, automation modes, error logs, independent scroll, Smart Actions, professional export/help UI, Smart Targets, Calendar TODAY, and the reliable launcher that became the v1.0 base.

---

## Documentation

- [Feature Guide](docs/FEATURES.md)
- [User Guide](docs/USER_GUIDE.md)
- [Website Recording](docs/WEBSITE_RECORDING.md)
- [Calendar Automation](docs/CALENDAR_AUTOMATION.md)
- [Logging & Diagnostics](docs/LOGGING_AND_DIAGNOSTICS.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)
- [UI Design Standards](docs/UI_DESIGN_STANDARDS.md)
- [Version History](docs/VERSION_HISTORY.md)
