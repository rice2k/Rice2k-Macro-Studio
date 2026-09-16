# 🕒 Rice2k Macro Studio Version History

This page is the quick chronological history of the project. For detailed release notes, see [CHANGELOG.md](../CHANGELOG.md).

---

## Current Release

### 🔵 v1.3 — Mockup-Matched UI
**Released:** September 16, 2026  
**Status:** Current

Focus: make the actual application structure match the approved Rice2k Macro Studio design concept rather than using the concept only as a color/spacing reference.

Major additions / changes:
- Full branded top application header
- Approved mouse + gear application identity
- Custom icon-based sidebar navigation
- Card-based Recording Dashboard
- Larger Start / Stop / Pause / Play / Emergency controls
- Ready / loaded-recording status chips
- Larger Actions / Elapsed / Playback status cards
- Side-by-side recording and playback settings
- Quick Actions / Tips / Hotkeys cards
- Persistent footer with status, file, data folder, and live time
- Auto-hiding vertical scrollbar
- Application-level mouse-wheel scrolling
- Explicit dark normal / hover / focus / pressed / disabled / readonly / selected states
- 46-check validation pass with 0 failures

Why v1.3 exists:
- v1.2 was compact and functional, but still looked like a standard ttk utility.
- v1.3 rebuilds the shell and Dashboard composition itself to match the approved mockup much more closely.

Retained:
- Website recording filters
- Clicks / Scroll / Click Location / Text Input / Selections
- Smart Targets
- Dynamic TODAY
- Exports
- Diagnostics / logs / recovery
- Raw Action Editor
- Configurable hotkeys
- Launcher diagnostics

See [v1.3 UI Redesign](V1_3_UI_REDESIGN.md) and [UI Design Standards](UI_DESIGN_STANDARDS.md).

---

## v1.2 — Compact UI Redesign
**Released:** September 16, 2026  
**Status:** Superseded by v1.3

Focus: make the desktop application tighter, easier to scan, easier to scroll, and visually consistent while retaining all v1.1 automation features.

Major additions / changes:
- Compact icon + label sidebar
- New mouse + gear application identity
- Compact dashboard layout
- Icon-forward primary controls
- Tighter page and control spacing
- Segoe UI Variable / Segoe UI Windows font selection
- Explicit dark hover, focus, pressed, disabled, readonly, and selected states
- Mouse-wheel scrolling on scroll-frame pages

See [v1.2 UI Redesign](V1_2_UI_REDESIGN.md).

---

## v1.1 — Website Recording Filters
**Released:** September 16, 2026  
**Status:** Superseded by v1.2

Focus: make browser recording selective, easier to understand, and safer to use.

Major additions:
- Independent website recording toggles
- Click recording
- Scroll recording
- Optional click location
- Opt-in non-sensitive text input
- Dropdown / checkbox / radio / date selections
- Browser presets
- Semantic scroll replay
- Browser Smart Action categories
- Sensitive input blocking/redaction

---

## v1.0 — Rice2k Macro Studio Initial GitHub Release
**Released:** September 16, 2026  
**Status:** Superseded

Focus: consolidate the mature internal recorder into a named, documented GitHub application.

Included:
- Rice2k Macro Studio branding
- Mouse / keyboard / scroll recording
- Click-Only Fast
- Physical Replay
- Window-Aware targeting
- Windows Smart Targets
- Browser Smart Capture
- Dynamic TODAY calendar rules
- Smart Actions
- Raw Action Editor
- JSON / TXT / CSV / Python exports
- Diagnostics and calibration
- Recovery journal
- Reliable launcher
- Setup diagnostics
- Error/startup/thread/Tkinter logging
- Settings recovery/sanitation

---

# Development Lineage Before v1.0

Before the Rice2k Macro Studio name, development used the internal **Mouse Recorder Pro** name.

| Milestone | Major work introduced |
|---|---|
| Early recorder builds | Mouse capture, playback, repeat count, delays, speed controls |
| Keyboard expansion | Optional keyboard recording/replay and improved controls |
| All Upgrades | Profiles, crash recovery, target warnings, themes, exports |
| Performance + Hotkeys | Click-only capture, F8/F9/F10/F12, emergency stop, performance work |
| Automation Modes | Click-fast, physical, browser and window-aware workflows |
| GUI + Error Logs | Grouped dashboard controls and error-log page |
| Stable + Scroll | Independent scroll, state machine, Smart Actions, recovery journal |
| Professional UI + Export | Professional theme, hover help, export center, help pages |
| Smart Targets + Calendar TODAY | UI Automation metadata and dynamic date rules |
| Calendar Guide + Debugged Smart Targets | Calendar guide, tests, safer target behavior |
| Reliable Launcher + Crash Logging | Self-diagnosing launcher, logs, settings hardening |

These milestones became the feature base for **Rice2k Macro Studio v1.0**.

---

## Related pages

- [Detailed Changelog](../CHANGELOG.md)
- [Feature Guide](FEATURES.md)
- [User Guide](USER_GUIDE.md)
- [v1.3 UI Redesign](V1_3_UI_REDESIGN.md)
- [UI Design Standards](UI_DESIGN_STANDARDS.md)
- [Documentation Home](README.md)
