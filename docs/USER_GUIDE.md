# 📖 Rice2k Macro Studio User Guide

This guide walks through the normal workflow from startup to recording, reviewing, replaying, exporting, and troubleshooting.

---

## 1. Start the application

Run:

```text
Run_Rice2k_Macro_Studio.bat
```

The launcher checks Python, Tkinter, packages, source fragments, patches, and compile status before starting the GUI.

If the launcher reports a setup problem, run:

```text
Run_Setup_Diagnostics.bat
```

---

## 2. Dashboard

The Dashboard is the main control center.

### Main controls

| Control | Purpose |
|---|---|
| Start / F8 | Begin recording |
| Stop + Save / F9 | End recording and save it |
| Pause / Resume / F10 | Pause recording or playback |
| Play / F12 | Replay the loaded recording |
| Emergency Stop / Esc | Immediately stop playback |

### What to record

You can independently enable:
- Mouse clicks
- Scroll wheel
- Keyboard
- Mouse movement path

For most macros, use clicks + scroll and leave movement off.

---

## 3. Choose an automation mode

Open **Automation**.

### Click-Only Fast
Recommended default. Records important actions but not every pointer movement.

### Physical Replay
Use when the exact mouse path matters.

### Browser Element Capture
Use for websites where semantic elements are more reliable than x/y coordinates.

### Window-Aware
Use when you want stronger protection against clicking the wrong desktop application/window.

For a deeper comparison, see [Feature Guide](FEATURES.md).

---

## 4. Record a desktop macro

Recommended first workflow:

1. Select **Click-Only Fast**.
2. Enable **Mouse clicks**.
3. Enable **Scroll** if needed.
4. Enable **Keyboard** only if the workflow needs typing.
5. Leave **Mouse movement path** off unless movement itself matters.
6. Press **F8**.
7. Perform the task.
8. Press **F9** to stop + save.

The recording is stored under the Rice2k Macro Studio data folder.

---

## 5. Review before replay

### Smart Targets + Actions

Use this for a readable timeline of meaningful actions.

Good for:
- Understanding the macro
- Finding clicks
- Seeing recognized controls
- Seeing browser actions
- Seeing TODAY rules

### Raw Action Editor

Use this when you need to:
- Delete exact raw events
- Change an action delay
- Inspect low-level details

---

## 6. Playback

Before playing an important macro:

1. Load the recording.
2. Run **Pre-flight**.
3. Put the target application in the expected state.
4. Confirm speed/repeat/delay.
5. Press **F12**.

### Speed
- `1x` follows recorded timing.
- Higher values shorten delays.
- Lower values slow the replay.

### Repeat count
Use this when the same workflow must run multiple times.

### Delay between repeats
Use this when each repeated cycle should wait before starting again.

### Emergency Stop
Press **Esc** if playback is going to the wrong place.

---

## 7. Target safety

### Validate target before click/scroll
Compares recorded target information against the current foreground window.

### Pause if target changes
Stops progress instead of blindly clicking another application.

### Windows Smart Targets
When supported, Rice2k Macro Studio records UI Automation metadata and may activate a recognized control semantically.

This is most useful when the control moves but remains identifiable.

---

## 8. Website recording

Open **Automation → Website Recording Filters**.

Choose what should be captured:
- Clicks
- Scroll
- Click location
- Text input
- Selections

Then generate/open the browser helper.

See [Website Recording Guide](WEBSITE_RECORDING.md) for the full workflow.

---

## 9. Calendar TODAY

Use TODAY when a macro should choose the date that is current when it runs.

For Windows calendars:
- Record the date click
- Open Smart Targets
- Select the click
- Mark it TODAY
- Save the edited copy

For website calendars:
- Start Browser Smart Capture
- Click **Mark Next = TODAY**
- Click today's date

See [Calendar Automation Guide](CALENDAR_AUTOMATION.md).

---

## 10. Exports

Open **Exports** after loading or recording a macro.

| Export | Best for |
|---|---|
| Raw JSON | Full backup / machine-readable data |
| Readable TXT | Human review |
| Raw CSV | Spreadsheet analysis |
| Python | Manual PyAutoGUI-style customization |
| Smart JSON | Clean semantic action data |
| Smart CSV | Clean action data for spreadsheets |

Exports do not modify the original recording.

---

## 11. Diagnostics

### Pre-flight Test
Use before a macro that matters.

### Calendar TODAY Test
Checks date-label recognition and Windows UI Automation availability.

### Calibration X/Y
Use only if physical-coordinate playback is consistently offset by the same number of pixels.

### Debug logging
Useful while troubleshooting, but mouse-move debug logging can create large logs.

---

## 12. Settings

Settings include:
- Theme
- Countdown
- Human-like timing variation
- Hotkeys
- Recording/playback behavior

Hotkeys must be unique.

Default hotkeys:

| Action | Key |
|---|---:|
| Start | F8 |
| Stop + Save | F9 |
| Pause / Resume | F10 |
| Play | F12 |
| Emergency Stop | Esc |

---

## 13. Recommended workflows

### Ordinary desktop repetition
`Click-Only Fast → Record → Smart Actions → Pre-flight → Play`

### Website automation
`Browser mode → Select browser filters → Generate helper → Capture → Import/review → Replay/export`

### Unstable desktop layout
`Window-Aware + Smart Targets → Record → Pre-flight → Replay`

### Daily calendar form
`Record/capture calendar → Mark TODAY → Save → Replay on future dates`

### Debugging
`Run Setup Diagnostics → Check launcher/error logs → Run Pre-flight → Enable debug logging only if needed`

---

## Related pages

- [Feature Guide](FEATURES.md)
- [Website Recording](WEBSITE_RECORDING.md)
- [Calendar Automation](CALENDAR_AUTOMATION.md)
- [Logging & Diagnostics](LOGGING_AND_DIAGNOSTICS.md)
- [Troubleshooting](TROUBLESHOOTING.md)
