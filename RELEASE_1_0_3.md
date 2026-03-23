# v1.3 — Consortium Monthly Quest Tracking

### New Feature: Consortium Membership Benefits

Track the monthly **Membership Benefits** quest from The Consortium across all your characters. The quest resets on the 1st of each month and varies by reputation standing:

| Standing | Quest ID |
|----------|----------|
| Friendly | 9886 |
| Honored  | 9884 |
| Revered  | 9885 |
| Exalted  | 9887 |

#### Implementation and logic

- On login (and on each daily check cycle), the addon queries your Consortium reputation via `GetFactionInfoByID` to determine which quest variant applies.
- It checks whether the quest has been turned in this month (`IsQuestFlaggedCompleted`), is in your quest log, or is available to pick up.
- Status is stored in the account-wide `DailyReminderDB.consortium` table, keyed by `"CharName-RealmName"`, so all characters can see each other's status.

#### Status values

| Status | Meaning |
|--------|---------|
| **Available** (green) | Quest can be picked up from Gezhe in Nagrand |
| **In Progress** (yellow) | Quest is in your quest log, not yet complete |
| **Ready to Turn In** (orange) | Quest objectives complete, go turn it in |
| **Completed** (gray) | Already turned in this month |
| **Not Eligible** (dark gray) | Below Friendly with The Consortium |
| **Needs Update** (red) | Data is from a previous month — log into this character to refresh |

#### Consortium Status Window

A new cross-character status window shows all known characters in a table with columns: **Character** (class-coloured), **Standing**, **Status**, and **Last Updated**.

Access it via:
- **Shift-click** the minimap button
- `/dr consortium` slash command

#### Alert integration

When enabled, the Consortium check runs alongside daily quest checks. You'll be alerted if the quest is **available to pick up** or **ready to turn in**, using whatever alert type you've configured (chat, raid warning, or popup).

### Other Changes

- **Forward declaration fix** — Fixed a latent Lua scoping issue where `RunCheck` was referenced before its `local` declaration in the first-run setup callback.
- **Settings panel** — Added "Consortium Monthly Quest" checkbox to both the first-run setup popup and the addon settings panel.
- **Minimap tooltip** — Updated to show the new Shift-click action.
- **Slash commands** — Added `/dr consortium`.

