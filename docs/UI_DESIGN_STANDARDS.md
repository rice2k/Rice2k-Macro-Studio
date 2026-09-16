# 🎨 Rice2k UI Design Standards

These standards were established with **Rice2k Macro Studio v1.2** and should be used for future Rice2k desktop utilities.

## 1. No bright system-white interaction states

Dark-theme widgets must explicitly define colors for:

- normal
- hover / active
- keyboard focus
- pressed
- disabled
- readonly
- selected

Do not rely on the operating system's default ttk colors. Windows can otherwise fall back to a bright white highlight that clashes with dark themes.

This rule applies to:

- Buttons
- Sidebar controls
- Checkboxes
- Radio buttons
- Comboboxes
- Entries
- Spinboxes
- Scales
- Treeviews and headings
- List selections
- Scrollbars

## 2. Scroll by default

Major pages that can grow vertically should use a scrollable canvas/frame.

- Mouse-wheel scrolling should work while the pointer is over the page.
- Windows `<MouseWheel>` events should be supported.
- Linux/X11 `<Button-4>` / `<Button-5>` events can remain supported for development/testing.
- Listboxes and Treeviews keep their own native scrolling.

## 3. Compact spacing

Prefer grouped cards and concise padding over large empty vertical areas.

Current v1.2 targets:

| Area | Standard |
|---|---|
| Main page edge | ~12–14 px |
| Control row spacing | ~4–6 px |
| Compact sidebar | ~150 px |
| Tree row height | ~22 px |
| Standard button padding | ~8 × 5 px |

Compact does **not** mean cramped. Controls must remain easy to identify and click.

## 4. Typography

On Windows use:

1. **Segoe UI Variable** when available
2. **Segoe UI** fallback
3. Platform-safe fallback only when neither exists

For code/log/technical data prefer:

1. Cascadia Mono
2. Consolas
3. Main UI font fallback

Do not bundle or redistribute font files.

## 5. Navigation

Use an icon + short-label sidebar.

- Keep labels visible; do not rely on icons alone.
- Current page uses a colored active state.
- Avoid white focus rectangles or operating-system highlight fallbacks.
- Keep the sidebar visually lighter than the main work area.

## 6. Primary controls

Important actions should be obvious without making every button oversized.

Recommended hierarchy:

- **Primary blue:** Start / Play
- **Accent teal:** Stop + Save / positive utility actions
- **Danger red:** Emergency Stop / destructive actions
- **Neutral dark:** secondary actions

Use icon + text on important controls when it improves scanning.

## 7. Accessibility and safety

- Icons always have text labels for important actions.
- Dangerous actions use the danger style.
- Disabled text stays readable but visually subdued.
- Keyboard focus remains visible without switching to white.
- Tooltips supplement labels; they should not be required to understand primary actions.

## 8. New page checklist

Before a new page is considered finished:

- [ ] Does it scroll if content can exceed the window?
- [ ] Are all interaction states explicitly themed?
- [ ] Is spacing compact and consistent?
- [ ] Does it use the shared font stack?
- [ ] Does it work at the minimum supported window size?
- [ ] Are important actions clear without a tooltip?
- [ ] Does keyboard focus remain visible without a white flash?
- [ ] Do disabled controls use dark-theme colors?
- [ ] Has the page been smoke-tested in both normal and reduced window sizes?

## 9. Rice2k Macro Studio reference palette

Current v1.2 dark palette:

| Role | Color |
|---|---|
| App background | `#08111F` |
| Main panel | `#0D1A2B` |
| Secondary panel | `#0A1625` |
| Hover panel | `#10243A` |
| Accent blue | `#178BFF` |
| Accent hover | `#2C9BFF` |
| Accent pressed | `#0D72D8` |
| Accent teal | `#39D4C4` |
| Success | `#35D487` |
| Warning | `#FFC857` |
| Danger | `#FF4D5A` |
| Border | `#21496D` |
| Input background | `#091523` |
| Disabled background | `#152438` |

These colors can evolve, but new Rice2k tools should preserve the same design principles: compact, dark, readable, explicit states, scrollable pages, and clear action hierarchy.
