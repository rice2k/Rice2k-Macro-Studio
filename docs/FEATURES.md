# ✨ Rice2k Macro Studio Feature Guide

This page explains what each feature does, when to use it, and when another option is a better fit.

---

## 🎯 Recording Modes

### 🖱 Click-Only Fast

**Best default for most desktop automation.**

Records useful actions without storing every cursor movement.

Use it for:
- Repetitive clicking
- Forms
- Desktop applications
- Basic browser workflows when semantic browser capture is not needed
- Scroll + click workflows

Recommended settings:

| Option | Setting |
|---|---:|
| Mouse clicks | On |
| Scroll | On |
| Keyboard | Only when needed |
| Mouse movement | Off |
| Skip movement on playback | On |

Why use it:
- Smaller recordings
- Faster replay
- Less movement noise
- Easier Smart Actions review

---

### 🎬 Physical Replay

Records the actual pointer path in addition to clicks and scroll.

Use it when:
- Hover behavior matters
- A drag/path matters
- The target reacts to cursor movement before clicking

Avoid it when:
- Only the final click matters
- The interface moves often
- You want the smallest/fastest recording

---

### 🪟 Window-Aware

Adds stronger target validation around desktop actions.

Use it when:
- Several applications are open
- The same macro must avoid clicking the wrong program
- You want playback to pause if the foreground window changes

It can compare recorded/current:
- Process name
- Window title
- HWND when still valid

Window-Aware is still active-desktop replay; it does not make physical mouse actions invisible or background-only.

---

### 🧠 Windows Smart Targets

Uses Windows UI Automation information when available.

Smart target metadata may include:
- Control name
- Control type
- AutomationId
- Class name
- Framework ID
- Process
- PID
- HWND
- Window title
- Window rectangle

Use it when:
- A button or control can move
- Coordinates are not stable
- An accessible Windows control is available

Playback tries a recognized semantic target first for safe simple clicks and can fall back to coordinates when appropriate.

---

## 🌐 Browser Smart Capture

Browser Smart Capture records website elements semantically instead of relying only on screen coordinates.

Possible metadata:
- URL
- Page title
- Tag
- Role
- Visible text
- aria-label
- Associated label
- Placeholder metadata
- ID
- Name/type
- CSS-like selector
- XPath
- Date attributes
- Optional x/y click position
- Scroll position
- Selection state
- Optional non-sensitive input value

Use it when:
- Website layouts can move
- Buttons/links need semantic recognition
- You need website scrolling or selections
- You want click coordinates to be optional

See [Website Recording Guide](WEBSITE_RECORDING.md).

---

## 🌐 Website Recording Filters

Available in **Automation → Website Recording Filters**.

| Filter | What it records | Default |
|---|---|---:|
| Clicks | Semantic website clicks | On |
| Scroll | Page/element scroll position | On |
| Click location | x/y attached to click record | On |
| Text input | Final non-sensitive field value | Off |
| Selections | Dropdown/checkbox/radio/date state | On |

### Presets

| Preset | Use when |
|---|---|
| All Safe | You want most useful browser behavior without text input |
| Clicks Only | You only need semantic clicks |
| Click + Location | You want semantic clicks plus coordinate fallback/reference |
| Scroll Only | You only need website scrolling |
| Input Only | You only need ordinary non-sensitive field input |
| Selection Only | You only need dropdown/checkbox/radio/date choices |

---

## 📅 Dynamic TODAY

A TODAY rule means:

> Select the date that is current when the macro runs.

Use it for:
- Daily forms
- Date pickers
- Calendars where the correct date changes every day

Do not use fixed coordinates for a calendar when the day position can move between months.

See [Calendar Automation Guide](CALENDAR_AUTOMATION.md).

---

## 🧾 Smart Actions

Smart Actions turns low-level events into a cleaner review timeline.

Examples:
- Mouse down/up → one click
- Normal typed characters → text block
- Scroll remains a scroll action
- Browser click/scroll/input/selection stays categorized

Use it when:
- Reviewing what a macro actually does
- Exporting cleaner JSON/CSV
- Finding the important actions without movement noise

---

## 🧰 Raw Action Editor

Use the Raw Action Editor for low-level corrections.

You can:
- Review exact raw events
- Delete selected actions
- Edit delay between actions
- Save an edited copy

Use it when:
- A bad click was recorded
- A wait is too long/short
- You need to remove a low-level event

Use Smart Actions first for understanding; use Raw Action Editor for precise surgery.

---

## ▶ Playback Controls

### Speed
Controls how quickly recorded delays are replayed.

- `1x` = recorded timing
- Higher = faster
- Lower = slower

### Repeat count
Runs the recording multiple times.

### Delay between repeats
Useful for periodic workflows where each cycle should wait before starting again.

### Countdown
Gives you time to switch to the correct application before replay begins.

### Emergency Stop
Default: **Esc**

Stops playback and releases held inputs.

---

## 🧪 Pre-flight

Run Pre-flight before an important replay.

It checks common issues such as:
- Recording loaded
- Required libraries
- UI Automation availability
- Smart-target metadata
- Virtual desktop data
- Target process/window information
- Hotkey uniqueness

---

## 🪵 Error Logging

Use logs when the launcher or app behaves unexpectedly.

See [Logging & Diagnostics](LOGGING_AND_DIAGNOSTICS.md).

---

## 🧩 Quick Decision Table

| Situation | Use |
|---|---|
| Repetitive desktop clicking | Click-Only Fast |
| Exact pointer path | Physical Replay |
| Wrong-window risk | Window-Aware |
| Desktop button moves | Windows Smart Targets |
| Website button/layout moves | Browser Smart Capture |
| Website scroll only | Scroll Only preset |
| Website selections only | Selection Only preset |
| Ordinary website text field | Input Only / Text Input enabled |
| Daily changing date | TODAY rule |
| Understand a recording | Smart Actions |
| Remove/edit exact events | Raw Action Editor |
| Something fails before startup | Setup Diagnostics + launcher log |
