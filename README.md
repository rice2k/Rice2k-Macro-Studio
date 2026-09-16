<p align="center">
  <img src="rice2k_macro_studio.png" width="128" alt="Rice2k Macro Studio logo">
</p>

<h1 align="center">Rice2k Macro Studio</h1>

<p align="center"><strong>Record. Automate. Simplify.</strong></p>

<p align="center">
  <img alt="Version" src="https://img.shields.io/badge/version-1.2-178BFF">
  <img alt="Platform" src="https://img.shields.io/badge/platform-Windows-0078D4">
  <img alt="Python" src="https://img.shields.io/badge/Python-3.10%2B-3776AB">
  <img alt="Status" src="https://img.shields.io/badge/status-active-35D487">
  <img alt="UI" src="https://img.shields.io/badge/UI-compact%20dark-10243A">
  <img alt="Browser" src="https://img.shields.io/badge/browser-smart%20capture-8A2BE2">
</p>

**Rice2k Macro Studio** is a Windows macro recorder and automation utility built around mouse/keyboard/scroll capture, smart desktop targets, browser element capture, dynamic calendar rules, replay controls, diagnostics, recovery, and multiple export formats.

---

## 🧭 Start Here

| I want to… | Use this |
|---|---|
| Record ordinary desktop clicks quickly | **Click-Only Fast** |
| Replay the exact mouse path | **Physical Replay** |
| Avoid clicking the wrong app/window | **Window-Aware + target validation** |
| Click controls that move around | **Windows Smart Targets** |
| Automate websites semantically | **Browser Smart Capture** |
| Record only website scrolling | **Scroll Only** preset |
| Record web clicks without coordinates | **Clicks Only** preset |
| Record web clicks with coordinate fallback | **Click + Location** preset |
| Record dropdowns / checkboxes / radio buttons | **Selection Only** / **All Safe** |
| Enter ordinary non-sensitive web text | Enable **Text Input** |
| Always choose the current date | **TODAY rule** |
| Review simplified actions | **Smart Actions** |
| Edit raw low-level actions | **Raw Action Editor** |
| Diagnose startup problems | `Run_Setup_Diagnostics.bat` |
| Diagnose replay problems | **Pre-flight + Error Logs** |

---

## ✨ Current Release — v1.2 Compact UI Redesign

v1.2 keeps the full v1.1 automation feature set and replaces the visual shell with a tighter, more consistent design system.

### UI changes

- Compact **152 px icon + label sidebar**
- Rice2k **mouse + gear** visual identity
- Tighter dashboard cards and page spacing
- Icon-forward Start / Stop + Save / Pause / Play / Emergency controls
- Compact quick actions, tips, playback settings, and hotkey reference
- **Segoe UI Variable** on supported Windows versions, falling back to Segoe UI
- Dark entries, spinboxes, comboboxes, treeviews, scrollbars, and selections
- Explicit hover / focus / pressed / disabled / readonly colors
- Fix for the bright-white Windows ttk highlight fallback in dark mode
- Mouse-wheel scrolling on scrollable pages
- Active sidebar state instead of white focus highlighting

Full UI rules: **[UI Design Standards](docs/UI_DESIGN_STANDARDS.md)**  
Detailed redesign notes: **[v1.2 UI Redesign](docs/V1_2_UI_REDESIGN.md)**

---

## 🚀 Quick Start

1. Download or clone the repository.
2. Extract the complete folder if you downloaded a ZIP.
3. Run:

```text
Run_Rice2k_Macro_Studio.bat
```

The launcher checks Python, Tkinter, dependencies, source fragments, source patches, and compile status before opening the application.

### Recommended first recording

| Setting | Recommended |
|---|---:|
| Mouse clicks | ✅ On |
| Scroll wheel | ✅ On |
| Keyboard | Only when needed |
| Mouse movement path | ❌ Off |
| Skip movement on playback | ✅ On |
| Mode | **Click-Only Fast** |

Default hotkeys: **F8 Start · F9 Stop + Save · F10 Pause/Resume · F12 Play · Esc Emergency Stop**

---

## 🧩 Main Features

### 🖱 Desktop recording
- Mouse clicks
- Independent scroll-wheel recording
- Optional keyboard capture/replay
- Optional full mouse-movement path
- Pause/resume recording
- Floating recording controller
- Multi-monitor / virtual-desktop metadata
- DPI and window metadata

### ▶ Playback
- Adjustable speed
- Repeat count
- Delay between runs
- Countdown
- Pause/resume
- Emergency stop
- Interruptible waits
- Held mouse/key cleanup
- Target-window validation
- Pause if the target application/window changes

### 🧠 Windows Smart Targets
- Window title
- Process/application name
- PID / HWND
- Window rectangle
- Control name/type
- Automation ID
- Control class/framework
- Semantic activation for supported simple controls
- Coordinate fallback
- Reopened-window resolution when the original HWND becomes stale

### 🌐 Website Recording Filters
Browser Smart Capture can independently record:

- **Clicks**
- **Scroll**
- **Click location**
- **Text input** — opt-in
- **Selections** — dropdowns / checkboxes / radios / dates

Presets:

`All Safe` · `Clicks Only` · `Click + Location` · `Scroll Only` · `Input Only` · `Selection Only`

> **Privacy:** Text input is OFF by default. Passwords, passcodes, tokens, secrets, API keys, authentication fields, OTP/verification codes, CVV/CVC, PIN, SSN, and similar security fields are blocked/redacted.

### 📅 Dynamic Calendar TODAY
A calendar action can mean **“select the actual current date when this runs”** rather than “click yesterday’s x/y position.”

Supported through Windows UI Automation and Browser Smart Capture.

### 🧾 Review & Export
- Smart Actions
- Raw Action Editor
- Raw JSON
- Readable TXT
- Raw CSV
- Smart JSON
- Smart CSV
- Python/PyAutoGUI-style export

### 🛠 Reliability & Diagnostics
- Self-diagnosing BAT launcher
- Setup diagnostics
- Startup log
- Error log
- Tkinter callback exception logging
- Worker-thread exception logging
- `faulthandler` logging where supported
- Recovery journal
- Pre-flight test
- Calendar TODAY self-test
- Settings validation/recovery

---

## 📚 Documentation

| Guide | Purpose |
|---|---|
| [Feature Guide](docs/FEATURES.md) | Detailed feature descriptions |
| [User Guide](docs/USER_GUIDE.md) | Recording and playback workflow |
| [Website Recording](docs/WEBSITE_RECORDING.md) | Browser filters and semantic capture |
| [Calendar Automation](docs/CALENDAR_AUTOMATION.md) | TODAY rules and date pickers |
| [Logging & Diagnostics](docs/LOGGING_AND_DIAGNOSTICS.md) | Logs, tests, and troubleshooting data |
| [Troubleshooting](docs/TROUBLESHOOTING.md) | Common startup/playback problems |
| [UI Design Standards](docs/UI_DESIGN_STANDARDS.md) | Compact UI rules for future Rice2k tools |
| [v1.2 UI Redesign](docs/V1_2_UI_REDESIGN.md) | What changed visually in v1.2 |
| [Version History](docs/VERSION_HISTORY.md) | Project chronology |
| [CHANGELOG.md](CHANGELOG.md) | Release-by-release changes |

---

## 🪵 Logs

Normal location:

```text
Documents\Rice2k Macro Studio\Errors
```

| File | Purpose |
|---|---|
| `launcher_log.txt` | Python/dependency/startup checks |
| `startup_log.txt` | Application startup milestones |
| `error_log.txt` | Handled/unhandled application errors |
| `faulthandler.log` | Low-level Python fault details |
| `setup_diagnostics.txt` | Environment/package diagnostic results |

If Documents cannot be written, error/startup logging falls back under `%TEMP%\Rice2k Macro Studio`.

---

## 🏗 Build the EXE

Run:

```text
Build_Rice2k_Macro_Studio_EXE.bat
```

Expected output:

```text
dist\Rice2k Macro Studio.exe
```

The build bundles the source fragments, all version patches, browser helper, and application icon.

---

## 📂 Source Layout

```text
Rice2k-Macro-Studio/
├─ rice2k_macro_studio.py
├─ src_fragments/
│  └─ part_01.pyfrag ... part_14.pyfrag
├─ src_patches/
│  ├─ v1_1_website_filters.pyfrag
│  └─ v1_2_compact_ui.pyfrag
├─ Browser_Element_Capture_Helper.html
├─ rice2k_macro_studio.png
├─ Run_Rice2k_Macro_Studio.bat
├─ Run_Setup_Diagnostics.bat
├─ Build_Rice2k_Macro_Studio_EXE.bat
├─ docs/
├─ CHANGELOG.md
└─ VALIDATION_REPORT.json
```

The loader reconstructs the base application and applies version patches in filename order before `main()` starts.

---

## 🔒 Safety / Privacy Notes

- Website text-input recording is opt-in.
- Sensitive credential/security fields are blocked/redacted.
- Physical replay controls the active Windows desktop.
- For truly simultaneous automation while independently using the same desktop, prefer browser semantic automation, a VM, Remote Desktop, another Windows session, or another PC.

---

## 👤 Project

Created and maintained as a **Rice2k** project.

**Repository:** `rice2k/Rice2k-Macro-Studio`
