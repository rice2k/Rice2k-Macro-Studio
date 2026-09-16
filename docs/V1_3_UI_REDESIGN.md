# Rice2k Macro Studio v1.3 UI Redesign

Version 1.3 exists because the v1.2 implementation was visually too far from the approved concept. v1.2 used the concept mainly as a color and density reference, leaving the interface structurally similar to a standard Tk/ttk utility.

v1.3 changes the actual application composition.

## Structural changes

- Added the branded application header.
- Kept the approved mouse-and-gear app identity.
- Rebuilt the sidebar with image icons and compact navigation.
- Rebuilt Dashboard around bordered visual cards.
- Moved Ready / loaded-file information into dashboard chips and the global footer.
- Increased typography and control weight to match the concept.
- Added large primary recording/playback buttons.
- Added large Actions / Elapsed / Playback stat cards.
- Rebuilt recording and playback configuration as side-by-side cards.
- Added Quick Actions, Tips, and Hotkeys cards.
- Added a persistent footer with status, current file, app data path, and live time.

## Interaction-state fix

Dark-mode controls explicitly define:

- normal
- hover
- focus
- pressed
- readonly
- selected
- disabled

This prevents Windows or the active Tk theme from falling back to bright white highlight backgrounds.

## Scrolling

Scrollable pages register with a single application-level mouse-wheel handler. The vertical scrollbar automatically hides when the content fits and appears when it does not.

This is now a Rice2k UI standard for future desktop tools.

## Source layout

The GitHub version keeps the validated base source under `src_fragments/` and applies ordered version patches from `src_patches/`.

v1.3 adds:

- `v1_3a_theme_style.pyfrag`
- `v1_3b_assets_layout.pyfrag`
- `v1_3c_scroll_dashboard.pyfrag`
- `v1_3z_assign.pyfrag`

Navigation icons include embedded PNG fallbacks, so the source build remains self-contained even when optional `assets/ui/` images are absent.

## Feature preservation

The redesign does not remove automation functionality. v1.3 retains:

- mouse/keyboard/scroll recording
- scroll-only recording
- click-only recording
- movement path recording
- Smart Targets / Windows UI Automation
- Browser Smart Capture filters
- Calendar TODAY
- Raw Action Editor
- repeat/delay/speed
- target validation
- profiles/recovery
- exports
- diagnostics
- configurable hotkeys
- launcher/error logging
