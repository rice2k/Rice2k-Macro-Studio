# Rice2k Macro Studio v1.4.2 — Theme Runtime Fix

## Problem fixed

In v1.4.1 the Settings theme Combobox was bound directly to the live `theme_var`. Selecting a different entry changed what `colors()` returned immediately, but the header, sidebar, raw Tk buttons, ttk styles, and hover callbacks had already been created with the old palette. The result could be a mixed UI: the dropdown might say `dark` while visible controls still looked light, or hover states could reapply old colors.

## v1.4.2 behavior

Theme selection is now atomic:

1. Select **Dark**, **Neo Green**, or **Soft Light**.
2. The selected key is saved to settings.
3. Previous mouse-wheel bindings and clock jobs are cleaned up.
4. Old visual widgets are destroyed.
5. ttk styles and raw Tk controls are rebuilt from the selected palette.
6. Fresh hover bindings are attached.
7. The page you were viewing is reopened.

This prevents stale colors and mixed-theme controls.

## Header Theme control

The header Theme button now cycles:

`Dark → Neo Green → Soft Light → Dark`

and applies the theme immediately.

## Button-state validation

The v1.4.2 test pass confirms that all sidebar navigation buttons stay enabled and can open their destination after repeated theme changes. Secondary button hover, focus, pressed, and disabled states are explicitly themed.
