# v1.5 — Profession Cooldown Tracking

### New Feature: Profession Cooldowns

Track profession cooldowns across all your characters, with a cross-character status window showing time remaining for each.

#### Tracked Cooldowns

| Profession | Cooldowns | Duration        |
|------------|-----------|-----------------|
| Tailoring | Primal Mooncloth, Spellcloth, Shadowcloth | 3 days 20 hours |
| Alchemy | All Primal transmutes + Earthstorm/Skyfire Diamond (shared cooldown) | 20 hours |
| Leatherworking | Salt Shaker | 2 days 23 hours |

#### Implementation

- **Automatic detection via spell cast** — when you craft a cooldown item, the addon records it instantly via `UNIT_SPELLCAST_SUCCEEDED`.
- **Trade skill window scan** — opening a profession window (`TRADE_SKILL_SHOW`) scans for any active cooldowns, syncing accurate remaining times from the server.
- **Shared cooldown support** — Alchemy transmutes share a single cooldown; casting any one marks the entire group as on cooldown.
- **Cross-character storage** — cooldown data is saved account-wide so you can see all characters from any alt.

#### Profession Cooldowns Window

A new cross-character status window shows all known characters in a table with columns: **Character** (class-coloured), **Profession**, **Cooldown** (short name), and **Time Left** (colour-coded by urgency: orange > 1 day, yellow > 1 hour, green < 1 hour).

Access it via:
- **Ctrl-click** the minimap button
- `/dr professions` slash command

#### Toggle

The feature is **enabled by default** and can be toggled via:
- The first-run setup wizard (on fresh installs)
- The addon settings panel (Game Menu → Options → AddOns → Daily Reminder)

### Settings

- Added "Profession Cooldowns" checkbox to the first-run setup wizard and the addon settings panel.
- Minimap tooltip updated to show the new Ctrl-click action.

