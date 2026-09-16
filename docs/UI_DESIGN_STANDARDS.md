# 🎨 Rice2k UI Design Standards

These standards apply to Rice2k Macro Studio and should be reused for future Rice2k desktop utilities.

## 1. Never allow bright system-white interaction states

Every supported theme must explicitly define colors for:

- normal
- hover / active
- keyboard focus
- pressed
- disabled
- readonly
- selected

Do not rely on the operating system's default ttk colors. Windows can otherwise fall back to a bright white highlight that clashes with dark themes.

This rule applies to buttons, sidebar controls, checkboxes, radio buttons, comboboxes, entries, spinboxes, scales, Treeviews, list selections, and scrollbars.

## 2. Scroll by default

Major pages that can grow vertically should use a scrollable canvas/frame.

- Mouse-wheel scrolling should work while the pointer is over the page.
- Windows `<MouseWheel>` events should be supported.
- Linux/X11 `<Button-4>` / `<Button-5>` support can remain for development/testing.
- Listboxes and Treeviews keep their own native scrolling.
- Hide the page scrollbar when the page fits without scrolling.

## 3. Compact spacing

Prefer grouped cards and concise padding over large empty areas.

Current targets:

| Area | Standard |
|---|---|
| Main page edge | ~10–14 px |
| Control row spacing | ~3–6 px |
| Compact sidebar | ~160 px or less |
| Tree row height | ~24–26 px |
| Standard button padding | ~8–10 × 5–7 px |

Compact does **not** mean cramped. Controls must remain easy to identify and click.

## 4. Do not stretch content just because space exists

Long settings/help areas should use readable centered widths instead of filling the entire application window.

Good candidates for centered content:
- Recordings library
- Web Capture / Automation settings
- Calendar help/instructions
- Settings
- Diagnostics/help cards

Controls should sit visually close to the text they belong to.

## 5. Typography

On Windows prefer:

1. **Segoe UI Variable**
2. **Segoe UI**
3. Platform-safe fallback

For code/log/technical data prefer Cascadia Mono, then Consolas.

Do not bundle or redistribute font files.

## 6. Navigation

Use an icon + short-label sidebar.

- Keep labels visible; do not rely on icons alone.
- Use a clear active-page state.
- Keep navigation icons visually uniform and compact.
- Avoid native white focus rectangles or OS highlight fallbacks.

## 7. Primary controls

Important actions should be obvious without making every control oversized.

Recommended hierarchy:
- **Accent:** Start / Play
- **Positive accent:** Stop + Save / export / utility actions
- **Danger red:** Emergency Stop / destructive actions
- **Neutral:** secondary actions

Use icon + text on important controls when it improves scanning.

## 8. Themes

### Dark
Professional navy/blue default theme.

### Neo Green
High-contrast deep green/black theme with neon-green accents.

### Soft Light
Pale blue-gray surfaces instead of pure-white page/card backgrounds.

Each theme must define all interaction-state colors. Do not assume a color exists only because another theme has it.

## 9. Accessibility and safety

- Icons have text labels for important actions.
- Dangerous actions use danger styling.
- Disabled text stays readable but subdued.
- Keyboard focus remains visible without switching to white.
- Tooltips supplement labels; primary controls remain understandable without them.

## 10. New page checklist

Before a new page is considered finished:

- [ ] Does it scroll if content can exceed the window?
- [ ] Are all interaction states explicitly themed?
- [ ] Is spacing compact and consistent?
- [ ] Is the content width appropriate instead of unnecessarily stretched?
- [ ] Does it use the shared font stack?
- [ ] Does it work at the minimum supported window size?
- [ ] Are important actions clear without a tooltip?
- [ ] Does keyboard focus remain visible without a white flash?
- [ ] Do disabled controls stay inside the theme palette?
- [ ] Has the page been smoke-tested in **Dark**, **Neo Green**, and **Light**?

## 11. Current reference palettes

### Dark
- App background: `#08111F`
- Main panel: `#0D1A2B`
- Card: `#0F1E31`
- Accent: `#178BFF`
- Accent teal: `#39D4C4`
- Success: `#35D487`
- Danger: `#FF4D5A`

### Neo Green
- App background: `#06110C`
- Main panel: `#0A1A14`
- Card: `#0B1E15`
- Accent: `#39FF88`
- Secondary accent: `#00E5A8`
- Border: `#1D6A45`

### Soft Light
- App background: `#E8EEF5`
- Main panel: `#F7FAFD`
- Card: `#F2F6FB`
- Accent: `#0E7C86`
- Border: `#C8D8E7`

The design principles matter more than exact values: compact, readable, explicit states, scrollable pages, centered content when appropriate, and clear action hierarchy.
