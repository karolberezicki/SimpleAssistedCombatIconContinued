# Simple Assisted Combat Icon (fork)

> **This repository is a fork.** The original addon, Simple Assisted Combat Icon (Rotation Helper), is written and maintained by **Katur239**: [upstream repository](https://github.com/katur239/SimpleAssistedCombatIcon) · [CurseForge page](https://www.curseforge.com/wow/addons/simple-assisted-combat-icon).
>
> This fork is based on upstream version `12.0.7.1` (commit `36a3a78`), the latest upstream `main` as of 2026-11-04. It is now version `12.1.5.1`, targets WoW 12.1.5, and adds [these changes](#changes-in-this-fork). The CurseForge page and its downloads belong to upstream, so they don't include those changes.

A World of Warcraft (Retail) addon that shows one movable icon with the ability Blizzard's Assisted Combat system currently recommends, so you don't have to keep looking at your action bars. CurseForge pitches it as a Hekili replacement for the Midnight expansion.

The icon shows:

- the recommended spell
- the keybind it is on
- its cooldown, including the global cooldown
- its spell charges (off by default, see [Cooldown and charges](#cooldown-and-charges))
- whether it is usable, using a colour tint:

| Tint | Meaning |
| --- | --- |
| Red | Out of range (takes priority over the others) |
| None | Usable |
| Blue | Not enough mana |
| Grey | Not usable |

It works out of the box. You don't need to enable Assisted Highlight or any other setting, and the Single-Button Assistant doesn't have to be on your bars.

## Changes in this fork

These changes were made on 2026-11-04, relative to upstream `12.0.7.1`:

- **Fixed the Target Nameplate anchor.** With any display condition other than Always Show, the icon never appeared, or stayed at the fade alpha if Fade instead of Hiding was on.
- **Fixed `/saci toggle`.** It now works like right-clicking the DataBroker launcher: it starts or stops icon updates, shows or hides the icon immediately, and refreshes the DataBroker label and any open settings window. Previously, turning the addon on after it loaded disabled left the icon hidden until `/saci reload`.
- **Fixed disabling with Fade instead of Hiding on.** The icon stayed on screen at the fade alpha. It now hides completely while the addon is disabled.
- **Fixed the update rate.** A saved `assistedCombatIconUpdateRate` could be missed if CVars finished loading after the addon read them, and changes only applied after `/saci reload`. The addon now reads the value once CVars have loaded and applies changes immediately.
- **Updated to WoW 12.1.5:** Interface `120105`, version `12.1.5.1`.
- **Updated libraries:** Ace3 to `r1403`, LibSharedMedia-3.0 to `v12.1.3` and LibDualSpec-1.0 to `v1.35.1`. See [Embedded libraries](#embedded-libraries).
- **Added documentation and license files:** this README and the GPLv3 `LICENSE`.

## Installation

Copy or clone this repository into your AddOns folder. The folder name must match the `.toc` file:

```text
World of Warcraft/_retail_/Interface/AddOns/SimpleAssistedCombatIcon/
```

There is no build step. All required libraries are embedded in `Libs/`.

## Usage

Open the settings in any of these ways:

- Type `/saci`.
- Use the Addon Compartment menu on the minimap.
- Use the game's Interface Options.
- Left-click the DataBroker launcher. Right-clicking it enables or disables the addon.

| Command | Action |
| --- | --- |
| `/saci` | Open or close the settings |
| `/saci lock` | Toggle the icon lock |
| `/saci unlock` | Unlock the icon |
| `/saci toggle` | Enable or disable the addon |
| `/saci reload` | Restart the addon |
| `/saci debug` | Print diagnostics for rotation spells and addon status (not listed in the in-game usage text) |

By default, the icon is 48 px, centred on the screen, unlocked and always shown. To move it, drag it. You can only drag or lock it while it is anchored to **Screen**. Hold **Ctrl** while hovering over the icon to show a lock/unlock button.

## Settings

CurseForge describes the settings as "configure just about everything", with 6 options for when to show and hide the icon. The sections below list what the code currently exposes.

### General

Toggles for Enabled, Lock Frame, Enable Cooldown and Enable Keybind.

### Display conditions

| Option | Effect |
| --- | --- |
| Always Show | Always shows the icon and clears the other conditions (default) |
| Show with target | Shows the icon when you have a hostile target that isn't dead |
| Show in combat | Shows the icon while you are in combat |
| Hide while mounted | Hides the icon while mounted; Druid Travel Form (shapeshift form 3) also counts |
| Hide in a Vehicle / Pet Battle | Hides the icon in vehicles and pet battles |
| Hide in Healer Role | Hides the icon while your group role is healer; it still shows while solo |

Two more options change how the conditions apply. Both are unavailable while Always Show is on:

- **All Conditions Only** requires every selected condition to be met, rather than any of them.
- **Fade instead of Hiding** fades the icon to a set **Fade out Alpha** instead of hiding it.

### Icon and border

- **Size:** 20 to 300.
- **Alpha:** 0 to 1.
- **Icon Scale:** 0.25 to 2.
- **Visible Abilities Only:** only recommends abilities currently visible on your action bars. This option appears only on the default UI, not with ElvUI, Bartender4 or Dominos action bars.
- **Border:** thickness (0 to 10) and colour. These are hidden while Masque is skinning the icon.

### Position and anchoring

- **Frame Strata:** `BACKGROUND` through `TOOLTIP`.
- **Anchor Frame:**
  - Screen
  - Player Unit Frame
  - Target Unit Frame
  - Essential Cooldown Viewer
  - Utility Cooldown Viewer
  - Personal Resource Display
  - Target Nameplate
  - Mouse Cursor
  - Other (any frame, by name)
- **Anchor points and offsets:** icon anchor point, relative anchor point and X/Y offsets (-500 to 500).
- **Inherit Frame Visibility:** hides the icon when the anchor frame isn't visible. This option doesn't appear for Screen, Mouse Cursor or Target Nameplate.

### Cooldown and charges

- **Cooldown:** Draw Edge, Draw Bling and Hide Cooldown Numbers.
- **Spell charges:** Show Swipe, Show Count and Draw Edge. **Show Swipe and Show Count are off by default.**
- **Charge count text:** font, size, outline, colour, anchor and X/Y offsets.

### Keybind text

- **Appearance:** font, size, outline, colour, anchor and X/Y offsets.
- **Override Text:** set custom keybind text for each rotation spell.
- **Use ConsolePort GamePad Icons:** requires the ConsolePort addon.

### Profiles

Settings are stored in AceDB profiles, with a shared default profile. LibDualSpec adds per-specialization profiles, which you can also use to hide the icon on specific specs.

## Addon compatibility

| Addon | Integration |
| --- | --- |
| Masque | Skins the icon and cooldown. Keybind text isn't skinned. |
| ElvUI | Detects keybinds when ElvUI's action bar module is enabled |
| Dominos | Detects keybinds |
| Bartender4 | Detects keybinds |
| ConsolePort | Optional gamepad icons for keybinds |
| DataBroker | Launcher for settings and enable/disable |

Only one action bar addon's keybinds are read, in this order: Dominos, Bartender4, ElvUI, then the default UI. If more than one is active and keybind text is on, the addon prints a warning in chat that keybinds will be inconsistent.

## Limitations

These come from the upstream FAQ:

- **No spell queue:** showing upcoming spells in priority order isn't possible in Midnight and isn't part of the Blizzard API.
- **No control over recommendations:** which spell appears, and when, is decided entirely by Blizzard's API.
- **No blacklisting:** abilities can't be excluded, because the recommendations come directly from Blizzard.

## Advanced: update rate

The addon refreshes the icon at the interval set by the `assistedCombatIconUpdateRate` CVar. Upstream gives its default as 0.1 seconds, which should be fine in nearly all cases. If it causes issues or the icon flickers between abilities, upstream recommends 0.2 or 0.3:

```text
/console assistedCombatIconUpdateRate 0.2
```

The change applies immediately. The addon only uses its own 0.25-second value if it can't read the CVar.

## Project state

| | |
| --- | --- |
| Addon version | `12.1.5.1` |
| Game version | Retail, Interface `120105` (12.1.5) |
| Latest upstream release | `12.0.7.1`, 2026-06-18 |
| Upstream CurseForge game versions | 12.0.7, 12.0.5, 12.0.1 |
| Upstream CurseForge listing | Tagged *Unlisted* on 2026-11-04 |
| Saved variables | `SCAIDB` (database schema version 5, older profiles are migrated on load) |
| Build, tests, release automation | None in this repository |

### Code layout

| Path | Purpose |
| --- | --- |
| `SimpleAssistedCombatIcon.toc` | Addon metadata and load order |
| `Core.lua` | Addon setup, defaults, database migrations, settings UI, slash commands, Addon Compartment and DataBroker |
| `CombatAssistIcon.xml` | Icon frame definition; also loads `CombatAssistIcon.lua` |
| `CombatAssistIcon.lua` | Icon behaviour: events, update timer, visibility, cooldowns, range and usability, keybind lookup |
| `Debug.lua` | Development profiler. It isn't listed in the `.toc`, so it doesn't load in normal use |
| `Libs/` | Embedded third-party libraries |

On each update, the addon checks visibility and asks `C_AssistedCombat.GetNextCastSpell` for the recommendation. It then refreshes the icon, keybind text and tint. Keybind text is resolved in this order: per-spell override, ConsolePort (if enabled), then the action bar button mappings.

To use the profiler, add `Debug.lua` to the `.toc` after `CombatAssistIcon.xml`, then run `/run SACIProfiler:Report()`.

### Embedded libraries

| Library | Version |
| --- | --- |
| Ace3 subset: AceAddon, AceConfig, AceConsole, AceDB, AceDBOptions, AceEvent, AceGUI | `r1403` |
| CallbackHandler-1.0 | From Ace3 `r1403` |
| LibSharedMedia-3.0 | `v12.1.3` |
| LibDualSpec-1.0 | `v1.35.1` |
| LibDataBroker-1.1 | `v1.1.4` |
| LibStub | Minor version 2 |
| AceGUI-3.0-SharedMediaWidgets (only the `LSM30_Font` widget) | Widget version 13 |
| LibKeyBound, registered as `LibKeyBound-CUSTOM` | Customized copy |

The LibKeyBound copy is cut down to its `ToShortKey` function, so don't replace it with upstream LibKeyBound-1.0.

`LibActionButton-1.0` isn't embedded. It is used from Bartender4 or ElvUI when they are active.

## Credits

- **Katur239:** original author and maintainer.
- **Thisnthat and xururuca:** contributed upstream fixes.

## License

The CurseForge listing declares the project as **GNU General Public License v3 (GPLv3)**. Upstream's repository doesn't include a license file, so this fork added the unmodified license text in [`LICENSE`](LICENSE), based on that listing. The libraries in `Libs/` are third-party projects under their own licenses.
