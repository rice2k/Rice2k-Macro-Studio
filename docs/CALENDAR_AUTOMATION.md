# 📅 Calendar Automation Guide

Calendar controls are a special case because the correct date changes over time and the same screen position can represent a different day next month.

Rice2k Macro Studio includes a dynamic **TODAY** rule so a macro can mean:

> Select the date that is current when the macro runs.

---

## Why fixed coordinates are risky

A recorded click on day `16` may be correct today, but next month:
- Day 16 can move to another row/column
- Adjacent-month days can appear in the same grid
- The calendar can open at a different position
- The application window can move

Use a TODAY rule when the goal is the current date, not a specific fixed coordinate.

---

## Windows / native application calendar

### Workflow

1. Record yourself opening the calendar and clicking today's date.
2. Stop + Save.
3. Open **Smart Targets + Actions**.
4. Select the recognized date click.
5. Click **Mark Selected = TODAY**.
6. Click **Save Edited Copy**.
7. Use the edited recording for future playback.

### What happens during replay

Rice2k Macro Studio can:
- Re-resolve the current target window if the recorded HWND is stale
- Search Windows UI Automation descendants
- Compare accessible date labels
- Consider control type/class
- Use a bare day number only as a safer fallback when it is unique among compatible controls

---

## Website calendar/date picker

### Workflow

1. Open **Automation**.
2. Configure Website Recording Filters.
3. Generate/open Browser Smart Capture.
4. Open the website's date picker.
5. Click **Mark Next = TODAY**.
6. Click today's date.
7. Continue recording as needed.
8. Copy/download the browser capture.

### How website TODAY detection works

The browser helper checks stronger semantic date signals first:

- `aria-current="date"`
- `data-date="YYYY-MM-DD"`
- `datetime="YYYY-MM-DD"`
- `<time datetime="...">`
- Accessible labels/titles containing today's date
- Calendar-scoped `Today`, `Current Date`, or `Go to Today` controls
- A unique day-number fallback inside a recognized calendar scope

---

## Native HTML date input

For `<input type="date">`, the TODAY rule can set the field to the current ISO date during replay and dispatch normal input/change events.

That avoids storing/replaying yesterday's date value.

---

## Calendar TODAY self-test

Open either:
- **Calendar Guide**, or
- **Diagnostics**

Then run **Calendar TODAY Test**.

It verifies current-date label matching and reports whether Windows UI Automation is available.

---

## When TODAY is appropriate

Use TODAY for:
- Daily reports
- Today's shipping/receiving date
- Forms that must always use the current date
- A website date picker where the day changes every run

Do not use TODAY when:
- You intentionally need a fixed historical date
- You need tomorrow, next Monday, month-end, or another rule that is not currently implemented

---

## If TODAY cannot be found

Some calendars are custom-drawn and expose little or no accessibility/DOM information.

Try:
1. Open the calendar manually before replay.
2. Run the Calendar TODAY self-test.
3. Review the recorded Smart Target metadata.
4. For websites, capture a fresh semantic browser action.
5. If no semantic date information exists, use coordinate fallback carefully.

---

## Safer calendar practices

- Prefer semantic date labels over coordinates.
- Run Pre-flight before important automation.
- Avoid a bare day-number match when multiple `16`, `30`, etc. cells are visible.
- Re-record after major website/application UI redesigns.
- Review the Smart Actions timeline before reusing a calendar macro long-term.

---

## Future dynamic-date rule ideas

Potential future rules include:
- TOMORROW
- Yesterday
- `+N` days
- `-N` days
- Next weekday
- First day of month
- Last day of month
- Date read from a field

Current implemented dynamic rule: **TODAY**.

---

## Related pages

- [Website Recording](WEBSITE_RECORDING.md)
- [Feature Guide](FEATURES.md)
- [User Guide](USER_GUIDE.md)
- [Troubleshooting](TROUBLESHOOTING.md)
