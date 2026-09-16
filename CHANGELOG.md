# Changelog

## v1.4.1 — Compact Cleanup

**Status:** Current release  
**Focus:** Theme reliability, compact Dashboard, uniform sidebar icons, cleaner option controls, and reduced stretching.

### Themes
- Added **Neo Green** — deep green/black surfaces with neon-green accents.
- Reworked **Light** into a softer blue/gray theme instead of harsh white.
- Kept explicit hover/focus/pressed/disabled/readonly/selected colors so Windows does not fall back to bright white interaction states.

### Layout
- Tightened Dashboard spacing and reduced oversized cards/gaps.
- Normalized sidebar icons to a compact size.
- Added compact checkbox/radio styles.
- Reduced wasted space at the top of the Recordings page.
- Centered Recordings, Web Capture, Calendar, and Settings content so large boxes do not stretch across the entire window.
- Grouped website recording filters into tighter columns closer to their labels.

### Reliability
- Fixed the v1.3 visual override layer so all three themes contain the card/border colors used by the mockup UI.
- Preserved mouse-wheel scrolling and auto-hiding vertical scrollbars.
- Preserved all website filters, Smart Targets, Calendar TODAY, exports, diagnostics, launcher logging, and error logging.

### Validation
- 36 validation checks passed with 0 failures.
- GUI smoke-tested Dashboard, Recordings, Web Capture, Calendar, Settings, Diagnostics, Export, Smart Targets, and Help in **Dark**, **Neo Green**, and **Light**.
- Browser helper and generated bookmarklet JavaScript syntax re-tested.
- Error/startup log output re-tested.

## v1.3 — Mockup-Matched UI

### UI
- Rebuilt the application shell to match the approved Rice2k Macro Studio concept.
- Added branded top header with app identity and tagline.
- Kept the approved mouse-and-gear application icon.
- Added icon-based sidebar navigation.
- Rebuilt Dashboard into card-based sections.
- Added status chips, larger action controls, and larger stat cards.
- Added Quick Actions, Tips, and Hotkeys cards.
- Added persistent footer with status, loaded file, data directory, and live time.

### Interaction
- Explicit dark-theme hover/focus/pressed/disabled/readonly/selected states.
- Added application-level mouse-wheel support for scrollable pages.
- Added auto-hiding vertical scrollbar behavior.

### Feature compatibility
All v1.2 automation features were retained.

## v1.2 — Compact UI Redesign

- Compact sidebar and spacing.
- First custom application icon.
- Improved dark interaction states.
- Added page scrolling.
- Retained v1.1 website recording filters.

## v1.1 — Website Recording Filters

- Added Clicks, Scroll, Click Location, Text Input, and Selections filters.
- Added browser capture presets.
- Added opt-in safe text input capture.
- Added semantic browser scroll and selection replay.

## v1.0 — Initial Rice2k Macro Studio Release

- Renamed project from Mouse Recorder Pro.
- Consolidated mouse, keyboard, scroll, smart-target, calendar, export, diagnostics, and launcher features.
