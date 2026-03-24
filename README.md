# Daily Reminder

A lightweight World of Warcraft addon that reminds you to turn in completed daily quests, tracks Consortium monthly quest status, and monitors profession cooldowns across all your characters.

## Features

- **First-time setup wizard** — on first install, a popup lets you pick which daily categories to track
- **Automatic detection** of completed dungeon, heroic, PvP, Ogri'la / Sha'tari Skyguard, cooking, and fishing dailies
- **Consortium monthly tracking** — monitors Membership Benefits quest availability based on your reputation, shared across all characters on the account
- **Profession cooldown tracking** — monitors Tailoring cloth, Alchemy transmute, and Leatherworking cooldowns across all characters with a cross-character status window
- **Multiple alert types** — chat message, raid warning text, or popup window
- **Configurable sound alerts** — choose from several built-in sounds or disable them
- **Category toggles** — enable or disable tracking per category at any time
- **Minimap button** — left-click to open settings, shift-click for Consortium status, ctrl-click for profession cooldowns, right-click to check dailies
- **Session dismiss** — silence reminders until your next login

## Tracked Dailies

| Category | Quests |
|----------|--------|
| Dungeon  | Shattered Halls, Coilfang, Botanica, Arcatraz, and more |
| Heroic   | All TBC heroic dungeon dailies including Magister's Terrace |
| PvP      | Call to Arms battleground dailies + world PvP (Hellfire, Terokkar, Nagrand) for both factions |
| Ogri'la / Sha'tari Skyguard | The Relic's Emanation, Bomb Them Again!, Wrangle More Aether Rays!, Banish More Demons, Fires Over Skettis, Escape from Skettis |
| Cooking | Manalicious, Revenge is Tasty, Soup for the Soul, Super Hot Stew |
| Fishing | Bait Bandits, Crocolisks in the City, Felblood Fillet, Shrimpin' Ain't Easy, The One That Got Away |
| Consortium (Monthly) | Membership Benefits — varies by reputation (Friendly / Honored / Revered / Exalted) |
| Profession Cooldowns | Primal Mooncloth, Spellcloth, Shadowcloth (Tailoring); all Primal/Diamond transmutes (Alchemy); Salt Shaker (Leatherworking) |

## Slash Commands

| Command | Description |
|---------|-------------|
| `/dr` | Open settings |
| `/dr check` | Force a daily quest check |
| `/dr resume` | Re-enable reminders after dismissing |
| `/dr minimap` | Toggle the minimap button |
| `/dr consortium` | Open Consortium status window |
| `/dr professions` | Open profession cooldowns window |

## Installation

1. Download and extract into your `Interface/AddOns` folder.
2. Ensure the folder is named `DailyReminder`.
3. Restart the game or reload the UI (`/reload`).

## Configuration

Open **Game Menu → Options → AddOns → Daily Reminder**, or left-click the minimap button.

