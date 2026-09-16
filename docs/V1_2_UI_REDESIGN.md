# 🖥 Rice2k Macro Studio v1.2 — Compact UI Redesign

## Goal

Version 1.2 redesigns the desktop interface without removing the existing automation feature set. The priorities are:

- tighter spacing
- faster visual scanning
- consistent dark interaction states
- mouse-wheel scrolling inside the application
- clearer primary actions
- reusable UI rules for future Rice2k tools

## What stayed intact

The redesign does **not** remove the v1.1 automation features:

- Mouse click recording
- Independent scroll recording
- Optional keyboard recording
- Optional full mouse movement path
- Click-Only Fast
- Physical Replay
- Window-Aware target checks
- Windows Smart Targets / UI Automation metadata
- Browser Smart Capture
- Website recording filters and presets
- Dynamic Calendar TODAY rules
- Recordings manager
- Recovery journal
- Smart Actions
- Raw Action Editor
- JSON / TXT / CSV / Python / Smart JSON / Smart CSV exports
- Diagnostics / pre-flight / calibration
- Error, startup, thread, Tkinter, and launcher logging
- Configurable hotkeys and emergency stop

## Compact sidebar

The sidebar is reduced to approximately **152 px** and uses short icon + label navigation:

- Dashboard
- Recordings
- Smart Targets
- Exports
- Web / Automation
- Calendar
- Diagnostics
- Settings
- Help

The current page receives a blue active style rather than a system-white focus/highlight.

## Dashboard redesign

The dashboard is arranged around a compact action hierarchy:

### Main controls

- ▶ Start
- ■ Stop + Save
- Ⅱ Pause / Resume
- ▶ Play
- ■ Emergency Stop

### Status cards

- Actions Recorded
- Elapsed
- Playback

### Recording / playback settings

Recording options and playback settings now sit side-by-side to reduce vertical space.

### Quick information

The bottom dashboard row provides:

- Quick Actions
- Tips
- Hotkey reference

## Bright-white highlight fix

The previous interface could inherit a bright system-white background when certain ttk controls were active, focused, selected, disabled, or highlighted.

v1.2 explicitly maps interaction-state colors for:

- standard buttons
- primary buttons
- accent buttons
- danger buttons
- sidebar buttons
- checkboxes
- radio buttons
- entries
- spinboxes
- comboboxes
- scales
- treeviews
- tree headings
- scrollbars
- list/text selections

This prevents Windows/theme fallback from unexpectedly replacing the dark interface with white control states.

## Scrolling

Scrollable pages now bind mouse-wheel input while the pointer is over their page container.

Supported input:

- Windows `<MouseWheel>`
- Linux/X11 `<Button-4>` / `<Button-5>` for development/testing

Lists and Treeviews keep native scrolling.

## Font system

On Windows the app selects:

1. **Segoe UI Variable** when installed
2. **Segoe UI** otherwise

Technical/monospaced content prefers Cascadia Mono, then Consolas.

## Branding / icon

v1.2 adopts the blue/cyan **mouse + gear** icon as the primary Rice2k Macro Studio identity. The runtime PNG is used by the Tk window and the build package also carries icon assets for Windows packaging.

## Validation

The v1.2 build passed a 31-check validation pass including:

- Python compile/import
- Duplicate/missing callback scan
- GUI smoke test across all nine main pages
- Dark hover/disabled/read-only state verification
- Mouse-wheel scroll verification
- Icon validation
- EXE build asset checks
- Error/startup logging
- Browser-helper JavaScript validation
- Website filters retained
- Calendar TODAY retained
- Smart Targets retained
- Raw editor retained
- Export support retained

The final Windows host should still be used to verify native Windows font rendering, physical input replay, and live Windows UI Automation behavior.

## Related pages

- [UI Design Standards](UI_DESIGN_STANDARDS.md)
- [Feature Guide](FEATURES.md)
- [User Guide](USER_GUIDE.md)
- [Version History](VERSION_HISTORY.md)
- [Changelog](../CHANGELOG.md)
