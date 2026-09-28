# Rice2k Macro Studio v1.5.7 — Compact Window + Next Run Countdown

## Window size

- Default window: **1060 × 700**.
- Minimum window: **720 × 500**.
- The main window remains resizable and major pages are scrollable when space is limited.

## Window switching / front-lock behavior

The main application window is explicitly non-topmost. The recording mini-controller is no longer forced always-on-top. Stopping a recording also suppresses the older forced `lift()` behavior, so an idle Rice2k Macro Studio window should behave like a normal Windows application when switching between programs.

## Next-run countdown

Repeat delays still use minutes. During the delay between repeated runs, Playback Status updates once per second in `MM:SS` format, for example:

`Next run in 25:06`

The countdown uses interruptible waits so Stop/Esc remain responsive.

## Standalone EXE runner

Standalone macro runners use the same countdown and smaller resizable window behavior.
