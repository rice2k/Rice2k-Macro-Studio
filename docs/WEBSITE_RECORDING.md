# 🌐 Website Recording Guide

Rice2k Macro Studio can record website actions semantically instead of depending only on screen coordinates.

This is useful when page elements move, the browser window changes size, or you only want to record specific kinds of browser activity.

---

## Browser Smart Capture workflow

1. Open **Automation**.
2. Configure **Website Recording Filters**.
3. Click **Create Browser Capture Helper**.
4. Open the generated helper in Edge/Chrome.
5. Generate the Smart Capture bookmarklet.
6. Add it to the bookmarks bar.
7. Open the website you want to record.
8. Run the bookmarklet.
9. Perform the website actions.
10. Copy/download the captured JSON when finished.
11. Import it into **Smart Targets + Actions** if you want to review it in the app.

---

## Recording filters

### ✅ Clicks
Records semantic website click targets.

Typical data:
- URL
- Page title
- Tag
- Role
- Visible text
- aria-label
- Associated label
- ID/name/type
- Selector
- XPath

Use when:
- Buttons and links matter
- Coordinates may move
- You want semantic replay

---

### ✅ Scroll
Records page or scrollable-element positions.

The browser helper uses a short debounce so a continuous wheel gesture does not create an excessive number of tiny scroll records.

Use when:
- The macro must reach a section before clicking
- A panel/list has its own scroll position
- You want a scroll-only browser macro

Preset: **Scroll Only**

---

### ✅ Click location
Adds x/y coordinates to click records.

Use it when:
- Coordinates are useful as reference/fallback
- You are debugging element recognition

Turn it off when:
- You want semantic-only click records
- Coordinates add unnecessary noise

Presets:
- **Clicks Only** = semantic click, no location
- **Click + Location** = semantic click plus x/y

---

### ⬜ Text input
Records the final value of ordinary non-sensitive text fields.

**Off by default.**

Use it when:
- A macro must fill a normal text field
- The entered value is not a credential/security secret

The helper blocks/redacts fields that appear to contain:
- Passwords/passcodes
- Secrets
- Tokens
- API keys
- Authentication credentials
- OTP/one-time codes
- Verification codes
- CVV/CVC
- PINs
- SSNs/social-security data

Sensitive input replay is also blocked.

Preset: **Input Only**

---

### ✅ Selections
Records state changes for controls such as:
- Dropdown/select choices
- Checkboxes
- Radio buttons
- Date fields
- Month fields
- Week fields

Use when:
- A workflow includes choosing an option rather than typing
- Checkbox/radio state matters

Preset: **Selection Only**

---

## Quick presets

| Preset | Clicks | Scroll | Location | Input | Selections |
|---|---:|---:|---:|---:|---:|
| All Safe | ✅ | ✅ | ✅ | ❌ | ✅ |
| Clicks Only | ✅ | ❌ | ❌ | ❌ | ❌ |
| Click + Location | ✅ | ❌ | ✅ | ❌ | ❌ |
| Scroll Only | ❌ | ✅ | ❌ | ❌ | ❌ |
| Input Only | ❌ | ❌ | ❌ | ✅ | ❌ |
| Selection Only | ❌ | ❌ | ❌ | ❌ | ✅ |

---

## Semantic targeting

Browser capture can use information such as:
- `id`
- CSS-like selector
- XPath
- role
- aria-label
- text/label

This is generally more resilient than replaying the same screen coordinate after a website layout changes.

---

## Browser replay behavior

### Clicks
Finds the semantic target and activates it.

### Scroll
Restores page or element scroll position.

### Text input
Sets a non-sensitive field value and dispatches normal input/change events.

### Selections
Restores dropdown/checkbox/radio/date state and dispatches appropriate events.

### TODAY
Recalculates the current date at replay time.

See [Calendar Automation Guide](CALENDAR_AUTOMATION.md).

---

## Recommended browser setups

### Simple buttons/links
Use **Clicks Only**.

### Buttons + coordinate troubleshooting
Use **Click + Location**.

### Reading/scrolling workflow
Use **Scroll Only**.

### Form with ordinary text fields
Enable **Text input** only for the part you need.

### Form with dropdowns/checkboxes
Use **Selection Only** or **All Safe**.

### General browser workflow
Use **All Safe** and enable Text Input separately only if needed.

---

## Privacy recommendations

- Keep Text Input off unless the macro actually requires it.
- Review captured JSON before storing/sharing it.
- Do not use macros to store credentials or authentication secrets.
- Prefer selections/buttons over typing when both are available.

---

## Troubleshooting browser capture

### Target not found
The site may have changed selector/DOM structure.

Try:
- Capture the action again
- Prefer labels/roles/IDs over coordinates
- Check whether the element is inside a dynamic popup/dialog

### Scroll target not found
A scrollable container may have been recreated by the site.

Capture a fresh run and compare its selector.

### Text field does not replay
Check whether it is intentionally blocked as sensitive or whether the site requires custom JavaScript/framework events.

### Calendar selects the wrong day
Use **Mark Next = TODAY** instead of a fixed day click when the goal is always the current date.

---

## Related pages

- [User Guide](USER_GUIDE.md)
- [Feature Guide](FEATURES.md)
- [Calendar Automation](CALENDAR_AUTOMATION.md)
- [Troubleshooting](TROUBLESHOOTING.md)
