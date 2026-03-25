# Changelog

## v1.8
- **Internal refactoring** — no new features, no behavior changes. Extracted 7 repeated code patterns into shared helpers, reducing the codebase by ~85 lines.
- **`CreateDarkDialogFrame`**: Consolidated the 17-line dark dialog frame boilerplate used by 5 frame creation functions into a single helper with a shared `DARK_DIALOG_BACKDROP` constant.
- **`CreatePopupShower`**: Replaced 3 nearly identical `Show*Popup` functions with a factory that returns closures, eliminating 3 redundant frame-variable locals.
- **`GetClassColoredName`**: Extracted the class-coloured character name formatting block repeated in 3 functions.
- **`GetSortedKeys`**: Extracted the sorted-keys-from-table pattern repeated in 3 functions.
- **`WriteCooldownData`**: Extracted the shared/standalone cooldown DB write logic duplicated in `RecordProfessionCooldown` and `ScanTradeSkillCooldowns`.
- **`ResetAllDismissFlags`**: Extracted the 3-flag dismiss reset repeated in 3 call sites.
- **`RunAllChecksStaggered`**: Extracted the staggered check pattern (0s / 0.5s / 1s) repeated in 2 call sites.

## v1.7
- **Jewelcrafting cooldown**: Added **Brilliant Glass** (spell ID 47280, 20-hour cooldown) tracking.
- **Enchanting cooldown**: Added **Void Sphere** (spell ID 28028, 48-hour cooldown) tracking.
- **Per-character cooldown preferences**: New "Tracked Cooldowns" section in the Professions settings tab lets you choose which cooldowns to track for each synced character. Untracked cooldowns are excluded from alerts and the status window.
- **Two-panel tracked cooldowns UI**: Left panel shows fixed cooldown checkboxes that update dynamically when a character is selected; right panel has a scrollable character list with up/down arrow buttons and disabled state when entries fit without scrolling.
- **Delete character data**: Each entry in the character list now has a delete button (×) that removes all profession cooldown data and tracking preferences for that character.
- **First-run wizard cooldown selection**: The Professions section in the setup wizard now has a collapsible sub-section (matching the Quests pattern) where new users can pick which cooldowns to track for the current character before completing setup.
- **Smart alert guard**: Profession alerts no longer fire "All cooldowns ready" when a character has zero tracked cooldowns.
- **Combined popup alerts**: When multiple categories (Quests, Consortium, Professions) fire popup alerts close together (e.g. on login), they are merged into a single summary window with section headers instead of overlapping individual popups. Each section has a **dismiss icon** (×) to silence that specific category for the session.
- **Consortium alert text**: Simplified to remove redundant "Membership Benefits" prefix — now shows "Available to pick up" or "Ready to turn in" with days remaining, since the section header already identifies the category.
- **First-run alert guard**: Alert checks no longer fire during a fresh install until the setup wizard is completed; checks run only after the player clicks "Save & Continue".
- Updated the professions status window subtitle and settings description to reflect the newly supported professions (Jewelcrafting, Enchanting).
- **Popup positioning**: Repositioned all popup windows to a more natural top-center screen position instead of dead center.

## v1.6
- **Per-category alert systems**: Quests, Consortium, and Professions now each have fully independent alert configurations (sound, alert type) instead of a single unified setting.
- **Master quest toggle**: New "Enable Quest Tracking" checkbox lets users disable all quest tracking at once without unchecking each category individually.
- **Visual disable effect**: When a category master toggle is unchecked, all its sub-checkboxes are grayed out and disabled for visual clarity.
- **Quest alert triggers**: Users can toggle two triggers independently — *Login / Reload* and *Leaving an Instance* (dungeon or battleground). Zone changes during flight paths no longer trigger alerts.
- **Professions alert system**: Professions now have their own independent alert configuration with separate sound, alert type, trigger toggles, and dismiss state.
- **Consortium reminder window**: New `consortiumReminderDays` slider (1–28 days) controls how many days before the month ends Consortium alerts start firing, so players actively levelling the reputation aren't spammed.
- Consortium alerts fire **only on login**, never on zone changes.
- Each alert category has its own **popup window**, **dismiss state**, and **Test Alert** button in the settings panel.
- **Compact settings layout**: Sound, Alert Type, and Test Alert controls are now on the same horizontal row, saving vertical space.
- **Scrollable settings tabs**: Each settings tab now has its own scroll frame to prevent content from overflowing outside the panel.
- **Slider visual fix**: The reminder-days slider now uses explicitly set textures for reliable rendering in Classic TBC.
- Redesigned the **settings panel** with a tab-based layout: Quests, Consortium, and Professions tabs.
- Reworked the **first-run setup wizard** with section headers, separators, and less redundant labels.
- Unified **dark opaque background** across all popup frames (alert popup, setup wizard, Consortium window) for visual consistency.
- Automatic **migration** of saved settings from v1.5's unified `sound`/`alertType` to the new per-category keys.

## v1.5
- Added **Profession Cooldowns** tracking across all characters: Tailoring cloths (Primal Mooncloth, Spellcloth, Shadowcloth), Alchemy transmutes (all Primal and Diamond transmutes with shared cooldown support), and Leatherworking (Salt Shaker).
- New cross-character **Profession Cooldowns window** (same table style as Consortium) showing character, profession, cooldown name, and time remaining with color-coded urgency.
- Cooldowns are detected automatically via **spell cast** (`UNIT_SPELLCAST_SUCCEEDED`) and **trade skill window scan** (`TRADE_SKILL_SHOW`).
- Access via **Ctrl-click** on the minimap button or `/dr professions`.
- Toggleable in both the first-run setup wizard and the addon settings panel.

## v1.4
- Added **Cooking Dailies** tracking (Shattrath cooking quests).
- Added **Fishing Dailies** tracking (Shattrath fishing quests).
- Both new categories enabled by default with toggles in setup wizard and settings panel.

## v1.3
- Added **Consortium monthly quest** tracking across all characters, with per-reputation quest detection and cross-character status window (Shift-click minimap or `/dr consortium`).
- Alerts fire when the quest is available or ready to turn in.
- Fixed a forward-declaration scoping issue with `RunCheck`.
- Added Consortium toggle to first-run setup and settings panel.
- Updated minimap tooltip and slash commands.

## v1.2
- Added **first-time setup wizard** for choosing tracked categories on install.
- Added **Ogri'la / Sha'tari Skyguard dailies** category.
- Added **World PvP dailies** (Hellfire Peninsula, Terokkar Forest, Nagrand) for both factions.
- Added **per-category toggles** to enable/disable tracking independently.
- Settings panel updated with "Tracked Categories" section.

