# Rice2k Macro Studio v1.4.1 — Compact Cleanup

Version 1.4.1 is a visual polish and bug-fix release based on real Windows screenshots of v1.3/v1.4. The automation engine and feature set remain intact.

## Goals

- Keep the approved mockup-matched identity.
- Remove excessive stretching and empty space.
- Make controls sit closer to the text they belong to.
- Make sidebar and Dashboard denser without becoming cramped.
- Make every theme deliberate instead of relying on Windows defaults.

## Theme changes

### Dark
The default professional navy/blue appearance remains. Interaction states continue to use explicit colors so hover/focus never flashes white.

### Neo Green
New in v1.4.1. Uses deep green/near-black surfaces, neon green accents, green status indicators, and the same card hierarchy as Dark.

### Soft Light
The previous light theme was too close to pure white. v1.4.1 uses pale blue-gray page and card surfaces with teal accents and lower-contrast borders.

## Layout changes

### Dashboard
- Reduced padding and vertical gaps.
- Kept icon-forward primary controls.
- Tightened stats, recording options, playback settings, Quick Actions, Tips, and Hotkeys.

### Sidebar
- Reduced sidebar width.
- Normalized navigation icons to a compact size.
- Preserved active-page highlighting in all themes.

### Recordings
- Removed the oversized blank area above Saved Recordings.
- Centered the recording library.
- Kept action buttons directly below the list.

### Web Capture / Automation
- Centers the main content instead of stretching every box to the full window.
- Website recording filters are grouped into two compact columns.
- Checkboxes are closer to their labels.

### Calendar and Settings
- Main content is centered and constrained.
- Text wraps inside readable widths rather than spanning the entire application.

## UI standards retained

- No bright-white hover or disabled-state fallback in Dark/Neo Green.
- Mouse-wheel scrolling on scrollable pages.
- Auto-hiding vertical scrollbar.
- Segoe UI Variable / Segoe UI preference on Windows.
- Compact controls and consistent spacing.

## Validation

The release was checked for:
- Python compile/import
- direct UI callback references
- Dark theme completeness
- Neo Green theme completeness
- Soft Light theme completeness
- Browser helper JavaScript syntax
- generated browser bookmarklet syntax
- launcher/build file markers
- app error-log output
- startup-log output
- website Smart Action data preservation
- all primary pages under Dark, Neo Green, and Light GUI smoke tests
- ZIP integrity

**Final result: 36 checks passed, 0 failures.**

Physical mouse/keyboard replay and Windows UI Automation still require final testing on a real Windows desktop.
