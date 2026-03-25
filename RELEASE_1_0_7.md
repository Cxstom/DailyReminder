# v1.7 — New Profession Cooldowns & Per-Character Tracking Preferences

### New Profession Cooldowns

Two new profession cooldowns are now tracked:

- **Brilliant Glass** (Jewelcrafting) — 20-hour cooldown, spell ID 47280.
- **Void Sphere** (Enchanting) — 48-hour cooldown, spell ID 28028.

Both are detected automatically via spell cast (`UNIT_SPELLCAST_SUCCEEDED`) and trade skill window scan (`TRADE_SKILL_SHOW`), just like existing cooldowns. They appear in the cross-character Profession Cooldowns window, the professions alert system, and all settings UI.

### Per-Character Cooldown Tracking Preferences

You can now configure **which cooldowns to track for each character** individually. This gives full granularity over alerts and the status window — for example, you can track only Transmutes on your Alchemist and only Primal Mooncloth on your Tailor.

The new **Tracked Cooldowns** section in the Professions settings tab (Game Menu → Options → AddOns → Daily Reminder → Professions) uses a **two-panel layout**:

**Left panel — Cooldown checkboxes:**
A fixed set of checkboxes for every trackable cooldown, updated dynamically based on the character selected on the right. Checkboxes are immediately responsive — toggling one updates that character's preferences in real time.

- Brilliant Glass (Jewelcrafting)
- Primal Mooncloth (Tailoring)
- Salt Shaker (Leatherworking)
- Shadowcloth (Tailoring)
- Spellcloth (Tailoring)
- Transmutes — shared CD (Alchemy)
- Void Sphere (Enchanting)

**Right panel — Character selector:**
A scrollable character list with **up/down arrow buttons** at the top and bottom (retail WoW style). Arrows enter a **disabled state** (desaturated, dimmed) when there aren't enough entries to scroll. Clicking a character highlights it and updates the left panel. Mouse wheel scrolling is supported.

Each character entry includes a **delete button** (×) on the right side. Clicking it removes all profession cooldown data and tracking preferences for that character from the saved database. The list refreshes automatically after deletion.

Checkboxes default to **enabled** (track everything). Preferences are saved per-character in `DailyReminderDB.profCDPrefs` and persist across sessions.

Untracked cooldowns are:
- **Excluded from alerts** — the "All cooldowns ready" notification only considers tracked cooldowns.
- **Excluded from the status window** — the Profession Cooldowns window only shows tracked entries.

A **smart guard** prevents the "All cooldowns ready" alert from firing when a character has disabled all cooldown tracking entirely.

### First-Run Setup Wizard

The Professions section in the first-run setup wizard now includes a **collapsible sub-section** (using the same +/- toggle pattern as the Quests section) where new users can pre-select which cooldowns to track for the current character. All cooldowns are enabled by default.

When the "Cooldown Tracking" master checkbox is unchecked, all sub-checkboxes are **visually grayed out and disabled**, matching the Quests section behavior.

Cooldown preferences chosen in the wizard are saved immediately on "Save & Continue" and apply to the current character.

On a **fresh install**, alert checks are now suppressed until the wizard is completed — no more reminders popping up before the player has configured their preferences.

### Combined Popup Alerts

When multiple categories (Quests, Consortium, Professions) fire **popup alerts** close together — for example, all three triggering on login — they are now **merged into a single summary window** instead of spawning overlapping individual popups at the same screen position.

The combined popup:
- Shows each category under its own **section header** (e.g. `— Quests —`, `— Consortium —`, `— Professions —`).
- Each section header has a **dismiss icon** (×) anchored to its right. Clicking it silences **only that category** for the session — the section dims with a strikethrough visual, and a chat confirmation message is printed. This replaces the old single "Don't remind this session" button that dismissed everything at once.
- A single **OK** button at the bottom closes the window.
- Plays only **one sound** (the first non-silent alert sound in the batch).

If only **one** category fires a popup alert, the original individual popup is shown as before — the combined view only activates when two or more popup alerts arrive within a ~2.5-second collection window.

Alerts configured as **Chat Message** or **Raid Warning Text** are unaffected and fire immediately as before.

### Consortium Alert Text

The Consortium alert message has been simplified. Instead of the redundant `"Consortium: Membership Benefits (available to pick up)"`, it now reads:

- `Available to pick up  (X days left this month)`
- `Ready to turn in  (X days left this month)`

The category name is already shown in the popup title or combined popup section header, so repeating it in the body was unnecessary.

### UI Updates

- The **Profession Cooldowns window** subtitle now reads "Tailoring, Alchemy, Leatherworking, Jewelcrafting & Enchanting — all characters".
- The **Professions settings tab** description now lists all five supported professions.
- Both panels in the tracked cooldowns section have a subtle **bordered dark background** for visual separation from the rest of the settings panel.
- The character list supports **mouse wheel scrolling** and auto-selects the first character on open.
- The Professions tab content height has been increased to accommodate the new section.
- All popup windows (alerts, combined popup, setup wizard, Consortium and Professions status) now appear at the **top center** of the screen instead of dead center, for a less intrusive default position.

