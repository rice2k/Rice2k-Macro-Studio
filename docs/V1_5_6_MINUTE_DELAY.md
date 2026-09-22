# Rice2k Macro Studio v1.5.6 — Minute Delay

## Change

The **Delay between runs** control now uses **minutes** rather than seconds.

Examples:

- `0.5` = 30 seconds
- `1` = 60 seconds
- `8` = 480 seconds

The playback engine converts the configured minutes to seconds only when performing the actual wait.

## Compatibility

Older settings that contain `delay_seconds` are migrated automatically. For example, a legacy value of `480` becomes `8` minutes.

## Standalone EXE

Standalone EXE macro exports use the same minute-based delay control and conversion.

## Per-action timing

The Raw Action Editor still uses seconds for the delay between individual recorded actions. That is intentionally separate from the delay between repeated macro runs.

## Validation

- 480 legacy seconds -> 8.0 minutes: PASS
- 30 legacy seconds -> 0.5 minutes: PASS
- 8-minute playback delay -> 480-second engine wait: PASS
- GUI startup self-test: PASS
- Dark / Neo Green / Soft Light primary-page smoke test: PASS
- Standalone runner source compile: PASS
