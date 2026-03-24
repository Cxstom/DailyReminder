# Changelog

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

