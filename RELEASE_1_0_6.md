# v1.6 — Per-Category Alerts, Smart Triggers & Consortium Reminder Window

### Per-Category Alert Systems

Quests, Consortium, and Professions now each have **fully independent alert configurations**. Each category gets its own:

- **Sound** — choose a different sound (or none) for each.
- **Alert Type** — Chat Message, Raid Warning Text, or Popup Window, configured independently.
- **Popup Window** — each category shows its own popup with its own "Don't remind this session" button.
- **Test Alert** button in the settings panel so you can preview exactly how each alert will look and sound.

Existing users upgrading from v1.5 will have their previous unified sound/alert-type settings automatically migrated to all three categories.

### Master Category Toggles

Each category (Quests, Consortium, Professions) now has a **master enable/disable checkbox** at the top of its settings tab. The Quests tab adds a new "Enable Quest Tracking" toggle that lets you disable all quest tracking at once without unchecking each category individually — useful if you only want the addon for Consortium or Professions.

When a master toggle is unchecked, all its **sub-checkboxes are visually grayed out and disabled**, making it immediately clear which controls are inactive. This applies to the Quest trigger checkboxes, quest category checkboxes, and Professions trigger checkboxes. The same visual disable effect is also present in the first-run setup wizard.

### Smart Quest & Professions Triggers

Both the quest and professions alert systems now let you choose **which events trigger a check**:

- **On Login / Reload** — fires when you first log in or `/reload` the UI (enabled by default).
- **When Leaving an Instance** — fires when you exit a dungeon, raid, or battleground (enabled by default).

The old `ZONE_CHANGED_NEW_AREA` trigger has been removed entirely. Previously, taking a flight path through multiple zones would spam the alert popup on every zone boundary — that no longer happens. Alerts now only fire on the specific events you choose.

### Consortium Reminder Window

Consortium alerts now fire **only on login** (never on zone changes) and include a new **reminder-days slider** (1–28 days):

- Set how many days before the month ends you want to start receiving Consortium reminders.
- Default is **7 days** — you'll only be reminded during the last week of the month.
- Players actively levelling Consortium reputation can set a low value (e.g. 1–3 days) to avoid being spammed while they're already working on it.
- The alert message now shows how many days remain in the current month.

### Settings Panel Redesign

The addon settings panel (Game Menu → Options → AddOns → Daily Reminder) has been completely reworked with a **tab-based layout**:

- **Quests** — Compact alert row (sound + type + test in one line), alert trigger toggles, and all quest category toggles.
- **Consortium** — Tracking toggle, compact alert row, and the reminder-days slider with explanatory text.
- **Professions** — Tracking toggle, compact alert row, and alert trigger toggles.

Each tab is wrapped in its own **scroll frame** — content that exceeds the visible area is scrollable instead of overflowing outside the panel.

Alert settings (Sound, Alert Type, Test Alert) are laid out **horizontally** on the same row to save vertical space and prevent overflow.

The reminder-days slider now uses **explicit texture assets** (background, border, thumb) instead of the `OptionsSliderTemplate`, ensuring it renders correctly in Classic TBC.

### First-Run Setup Wizard

- Checkboxes are now grouped under **three section headers** (Quests, Consortium, Professions) with visual separators.
- **Shortened labels** — removed redundant "Daily/Dailies" wording (e.g. "Dungeon Dailies (Normal)" → "Dungeons (Normal)") since the quest context is self-evident.
- Uses the same dark opaque background as the rest of the addon.

### Visual Consistency

All popup frames (quest alert, consortium alert, professions alert, setup wizard, status windows) now use the same **dark opaque background** (`UI-DialogBox-Background-Dark` with 95% opacity).

