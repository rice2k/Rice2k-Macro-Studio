<p align="center">
  <img src="rice2k_macro_studio.png" width="120" alt="Rice2k Macro Studio logo">
</p>

<h1 align="center">Rice2k Macro Studio</h1>

<p align="center">
  <strong>Windows macro recording, smart-target automation, website action capture, replay, diagnostics, and export tools.</strong>
</p>

<p align="center">
  <img alt="Version" src="https://img.shields.io/badge/version-1.1-4DA3FF">
  <img alt="Platform" src="https://img.shields.io/badge/platform-Windows-0078D4">
  <img alt="Python" src="https://img.shields.io/badge/Python-3.10%2B-3776AB">
  <img alt="Status" src="https://img.shields.io/badge/status-active-2EA44F">
  <img alt="Browser capture" src="https://img.shields.io/badge/browser-smart%20capture-8A2BE2">
  <img alt="Privacy" src="https://img.shields.io/badge/sensitive%20fields-blocked-F6C85F">
</p>

---

## 🧭 Project Navigation

| Area | Go here |
|---|---|
| 🚀 Start using the app | [Quick Start](#-quick-start) |
| ✨ See everything it can do | [Feature Guide](docs/FEATURES.md) |
| 📖 Learn the controls and workflow | [User Guide](docs/USER_GUIDE.md) |
| 🌐 Record websites | [Website Recording Guide](docs/WEBSITE_RECORDING.md) |
| 📅 Select TODAY dynamically | [Calendar Automation Guide](docs/CALENDAR_AUTOMATION.md) |
| 🪵 Understand logs and diagnostics | [Logging & Diagnostics](docs/LOGGING_AND_DIAGNOSTICS.md) |
| 🛠 Fix startup/playback problems | [Troubleshooting](docs/TROUBLESHOOTING.md) |
| 🕒 See version history | [Version History](docs/VERSION_HISTORY.md) |
| 📝 Read release-by-release changes | [CHANGELOG.md](CHANGELOG.md) |
| 📚 Documentation home | [docs/README.md](docs/README.md) |

---

## 🎯 What Rice2k Macro Studio Does

**Rice2k Macro Studio** is a Windows automation utility by **Rice2k** for recording and replaying actions while keeping the raw recording, smart-recognition data, browser targets, diagnostics, and exports easy to inspect.

It can work at several levels:

| Level | Best for | What it records |
|---|---|---|
| 🖱 **Click-Only Fast** | Most desktop workflows | Clicks, scroll, optional keyboard |
| 🎬 **Physical Replay** | Exact pointer-path workflows | Mouse movement, clicks, scroll, optional keyboard |
| 🪟 **Window-Aware** | Safer desktop replay | Process/window metadata + target validation |
| 🧠 **Windows Smart Targets** | Controls that move | UI Automation names, types, IDs, class/framework |
| 🌐 **Browser Smart Capture** | Websites and changing layouts | Semantic elements, selectors, URL/title, optional coordinates/input/selections |
| 📅 **Dynamic TODAY** | Calendars/date pickers | Intent to select the current date instead of yesterday's coordinates |

---

## ✨ Major Features

### 🖱 Desktop recording
- Mouse clicks
- Scroll wheel
- Keyboard recording when enabled
- Optional full mouse movement path
- Multi-monitor and DPI-aware metadata
- Pause/resume while recording
- Floating recording controls

### ▶ Playback
- Adjustable speed
- Repeat count
- Delay between repeats
- Countdown before playback
- Emergency stop
- Target-window validation
- Pause if the target changes
- Cleanup of held mouse buttons/keyboard keys if playback stops

### 🧠 Smart Targets
- Window title
- Process/application name
- PID / HWND
- Window rectangle
- Control name
- Control type
- Automation ID
- Control class
- Framework ID
- Coordinate fallback

### 🌐 Website Recording Filters — v1.1
Choose exactly what Browser Smart Capture records:

- ✅ **Clicks** — semantic button/link/element clicks
- ✅ **Scroll** — page and scrollable-element positions
- ✅ **Click location** — optional x/y coordinates
- ⬜ **Text input** — opt-in non-sensitive text values
- ✅ **Selections** — dropdowns, checkboxes, radio buttons, dates/months/weeks

Quick presets:

`All Safe` · `Clicks Only` · `Click + Location` · `Scroll Only` · `Input Only` · `Selection Only`

> **Privacy:** text-input recording is OFF by default. Password, passcode, token, secret, API-key, authentication, OTP, verification-code, CVV/CVC, PIN, SSN, and similar security fields are blocked/redacted.

### 📅 Calendar TODAY rules
Instead of replaying the coordinate where a date happened to be during recording, a step can mean:

> **Select the actual current date when this macro runs.**

Supported through Windows smart targets and Browser Smart Capture. See the [Calendar Automation Guide](docs/CALENDAR_AUTOMATION.md).

### 🧾 Review and export
- Smart Actions view
- Raw Action Editor
- JSON export
- Readable TXT export
- Raw CSV export
- Smart JSON export
- Smart CSV export
- Python/PyAutoGUI-style export

### 🛠 Reliability and diagnostics
- Self-diagnosing Windows launcher
- Dependency checks/repair
- Setup diagnostics utility
- Startup log
- Error log
- Tkinter callback exception logging
- Worker-thread exception logging
- `faulthandler` log where supported
- Crash/recovery journal
- Pre-flight test
- Calendar TODAY self-test
- Settings sanitation/recovery

---

## 🚀 Quick Start

### 1. Download or clone the repository

```text
git clone https://github.com/rice2k/Rice2k-Macro-Studio.git
```

Or download the repository ZIP from GitHub and **extract the entire folder** before running it.

### 2. Start Rice2k Macro Studio

Double-click:

```text
Run_Rice2k_Macro_Studio.bat
```

The launcher checks:

- Python
- Tkinter
- Required packages
- Source fragments and v1.1 patch
- Python compile status

### 3. Recommended first recording

For most tasks:

| Setting | Recommended |
|---|---:|
| Mouse clicks | ✅ On |
| Scroll | ✅ On |
| Keyboard | Only when needed |
| Mouse movement path | ❌ Off |
| Skip movement during playback | ✅ On |
| Mode | **Click-Only Fast** |

Press **F8** to start recording and **F9** to stop + save.

---

## 🧩 Which Feature Should I Use?

| Goal | Recommended feature |
|---|---|
| Repeat ordinary desktop clicks quickly | **Click-Only Fast** |
| Reproduce an exact mouse path | **Physical Replay** |
| Avoid clicking the wrong application | **Window-Aware + target validation** |
| Click a button even when it moves | **Windows Smart Targets** |
| Automate a website reliably | **Browser Smart Capture** |
| Record only web scrolling | **Scroll Only** preset |
| Record web clicks but no coordinates | **Clicks Only** preset |
| Record web clicks with x/y fallback | **Click + Location** preset |
| Record dropdown/checkbox choices | **Selection Only** or **All Safe** |
| Record ordinary website text fields | **Input Only** or enable Text Input |
| Always pick today's date | **TODAY rule** |
| Review a simplified recording | **Smart Actions** |
| Remove/edit low-level steps | **Raw Action Editor** |
| Diagnose a startup problem | **Run_Setup_Diagnostics.bat** |
| Diagnose a playback problem | **Pre-flight + Logs** |

---

## ⌨ Default Hotkeys

| Action | Hotkey |
|---|---:|
| Start recording | **F8** |
| Stop + Save | **F9** |
| Pause / Resume | **F10** |
| Play | **F12** |
| Emergency Stop | **Esc** |

Hotkeys can be changed in Settings. They must remain unique.

---

## 🪵 Logs and Diagnostics

Normal log location:

```text
Documents\Rice2k Macro Studio\Errors
```

Files may include:

| File | Purpose |
|---|---|
| `launcher_log.txt` | Python/dependency/startup checks |
| `startup_log.txt` | Application startup milestones |
| `error_log.txt` | Handled and unhandled Python/Tkinter/thread errors |
| `faulthandler.log` | Low-level Python fault information when supported |
| `setup_diagnostics.txt` | Environment/package diagnostic results |

If Documents cannot be written, startup/error logging falls back under `%TEMP%\Rice2k Macro Studio`.

Full details: [Logging & Diagnostics](docs/LOGGING_AND_DIAGNOSTICS.md)

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

The build includes the browser helper, source fragments, and version patches.

---

## 🕒 Current Version

### **v1.1 — Website Recording Filters**

Key additions:

- Independent website recording filters
- Scroll-only website recording
- Optional click coordinates
- Opt-in non-sensitive text input
- Dropdown/checkbox/radio/date selection capture
- New browser presets
- Smart Action support for browser scroll/input/selection data

See [Version History](docs/VERSION_HISTORY.md) and [CHANGELOG.md](CHANGELOG.md) for the full record.

---

## 🔒 Privacy and Safety Notes

Rice2k Macro Studio is designed to make recording behavior visible and inspectable.

- Website text input is **opt-in**.
- Sensitive credential/security fields are blocked/redacted.
- Browser replay blocks sensitive input replay.
- Physical mouse/keyboard replay controls the active Windows desktop.
- For truly simultaneous automation while you use the same PC independently, prefer semantic browser automation, a VM, Remote Desktop, another Windows session, or another PC.

---

## 📂 Repository Layout

```text
Rice2k-Macro-Studio/
├─ rice2k_macro_studio.py          # source loader
├─ src_fragments/                  # validated base application source
├─ src_patches/                    # version-specific source patches
├─ Browser_Element_Capture_Helper.html
├─ Run_Rice2k_Macro_Studio.bat
├─ Run_Setup_Diagnostics.bat
├─ Build_Rice2k_Macro_Studio_EXE.bat
├─ docs/
├─ CHANGELOG.md
├─ README.md
└─ VALIDATION_REPORT.json
```

---

## 👤 Project

Created and maintained as a **Rice2k** project.

**Repository:** `rice2k/Rice2k-Macro-Studio`
