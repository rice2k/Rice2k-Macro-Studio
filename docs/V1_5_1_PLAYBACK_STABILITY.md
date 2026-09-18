# Rice2k Macro Studio v1.5.1 — Playback Stability Fix

## Why this release exists

A dense macro or very high playback speed could dispatch input events with effectively no cooperative delay. On Windows that can monopolize mouse/keyboard processing and make the computer appear frozen. Separately, target validation could pause the macro when the user intentionally switched windows.

## Fixes

### System-friendly action throttle

Playback now uses a small minimum cooperative delay after dispatched input events. The default is **3 ms** and can be adjusted from **0–20 ms**.

### Window switching

**Keep playing if I switch windows** is ON by default. Normal Click-Only Fast, Physical Replay, and Browser modes do not pause merely because the active window changes.

**Window-Aware** mode intentionally disables this option and enables strict target validation/pause behavior.

### Standalone EXE runners

Macros exported as Standalone EXE use the same cooperative wait/throttle protection. Esc and the PyAutoGUI upper-left failsafe remain available.

## Safety note

When window switching is allowed, physical playback continues on the active desktop. The macro can therefore click/type into whatever is currently at the recorded coordinates. Use Window-Aware mode when this is undesirable.
