Rice2k Macro Studio v1.1 - Website Recording Filters

QUICK START
1. Clone/download the full repository.
2. Run Run_Rice2k_Macro_Studio.bat on Windows.
3. Use Run_Setup_Diagnostics.bat if the launcher reports a dependency/startup problem.

WEBSITE RECORDING FILTERS
Automation > Website Recording Filters lets you choose exactly what Browser Smart Capture records:
- Clicks
- Scroll
- Click location coordinates
- Non-sensitive text input
- Selections (dropdown / checkbox / radio / date controls)

PRESETS
- All Safe
- Clicks Only
- Click + Location
- Scroll Only
- Input Only
- Selection Only

Text input is OFF by default. Passwords, passcodes, tokens, secrets, API keys, authentication fields, OTP/verification codes, CVV/CVC, PIN, SSN, and similar security fields are always blocked/redacted.

BROWSER HELPER
Create the browser helper from Automation > Create Browser Capture Helper.
The generated helper starts with the website filter defaults saved in the app, and the floating browser panel lets you change filters while recording.

Browser capture can record/replay:
- Semantic clicks
- Optional click x/y location
- Page and scrollable-element scroll positions
- Non-sensitive text-field values when explicitly enabled
- Dropdown selections
- Checkbox/radio states
- Date/month/week selections
- Dynamic Calendar TODAY actions

CALENDAR TODAY
For a website calendar, click Mark Next = TODAY in the browser capture panel and then click the date that should always mean the current date.
For a Windows/native calendar, record the date click, open Smart Targets + Actions, mark the selected action TODAY, and save the edited copy.

OTHER FEATURES
- Mouse, keyboard, scroll, and optional movement recording
- Click-Only Fast and Physical Replay modes
- Window-Aware validation
- Windows UI Automation Smart Targets
- Smart Actions and Raw Action Editor
- Repeat, delay, speed, pause/resume and emergency stop
- Multi-monitor/DPI metadata
- JSON/TXT/CSV/Python/Smart JSON/Smart CSV exports
- Pre-flight diagnostics
- Recovery journal and detailed error logs
- Professional dark/light GUI with hover help

ERROR LOGS
Documents\Rice2k Macro Studio\Errors

BUILD EXE
Run Build_Rice2k_Macro_Studio_EXE.bat.
The build includes src_fragments and src_patches so v1.1 website filters are present in the EXE.

DEFAULT HOTKEYS
F8  Start
F9  Stop + Save
F10 Pause / Resume
F12 Play
ESC Emergency Stop

Created by Rice2k
Repository: rice2k/Rice2k-Macro-Studio
