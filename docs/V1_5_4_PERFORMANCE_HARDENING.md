# Rice2k Macro Studio v1.5.4 — Performance Hardening

## Audit goal

v1.5.4 follows the v1.5.3 UI-freeze fix with a broader scan for code paths that become expensive as a recording, log, file list, or browser capture grows.

## Fixed / hardened areas

### Recording metadata

Foreground-window/process lookups are cached for short intervals instead of being repeated for every high-frequency keyboard/scroll event. DPI lookup is cached as well.

### Smart Target lookup

Windows UI Automation lookup is bounded. If a target application is slow or unresponsive, recording falls back to coordinates rather than waiting indefinitely for semantic metadata.

### Stop + Save

Stopping a recording now detaches listeners quickly and performs Smart Action generation plus JSON serialization away from Tk's UI thread. Recording files are written through a temporary file and atomically renamed on success. A failed save keeps the recovery journal.

### Recovery and editors

- Recovery JSONL is streamed line-by-line.
- Raw Action Editor uses 2,000-action pages in the downloadable build.
- Smart Target/browser previews are bounded for large recordings.
- Saved Recordings view is capped to the newest 1,000 files in the downloadable build.
- Full exports still use the complete recording.

### Browser Smart Capture

The downloadable v1.5.4 helper no longer re-stringifies the entire capture on every event. Its live preview displays the newest 50 actions and redraws at most every 80 ms. Copy JSON and Download JSON still include every captured action.

## Tests

- 25-second heavy recording stress: 15,000+ actions; elapsed UI reached 00:24; heartbeat stayed responsive.
- 80,000-action asynchronous save: the UI continued processing while an ~18 MB recording was generated.
- 60,000+ action Raw Editor dataset: only 2,000 rows rendered at once.
- 12,000-line recovery journal: streamed import passed.
- Slow UI Automation simulation: bounded return in approximately 0.08 seconds.
- Dark, Neo Green, and Soft Light primary pages: passed.
- Browser helper and generated bookmarklet JavaScript syntax: passed.

## Remaining Windows-specific validation

Physical mouse/keyboard hooks and real Windows UI Automation still require final confirmation on the target Windows desktop.