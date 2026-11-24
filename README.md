# Simple Assisted Combat Icon

A World of Warcraft (Retail) addon that shows one movable icon with the ability Blizzard's Assisted Combat system currently recommends, together with its keybind, cooldown and whether it is usable, so you don't have to keep looking at your action bars.

Download it from [CurseForge](https://www.curseforge.com/wow/addons/simple-assisted-combat-icon).

## About this repository

The addon was created by **Katur239** ([original repository](https://github.com/katur239/SimpleAssistedCombatIcon)). Katur239 has stepped back from it and added Senoy as an author on the CurseForge project, so development continues here, and releases go to the same CurseForge page. This repository started from the original's latest version, `12.0.7.1` (commit `36a3a78`).

Changes by version, including the ones made here, are in the [changelog](assets/CHANGELOG.md).

## Usage

Open the settings with `/saci`, from the Addon Compartment menu on the minimap, from the game's Interface Options, or by left-clicking the DataBroker launcher.

| Command | Action |
| --- | --- |
| `/saci` | Open or close the settings |
| `/saci lock` | Toggle the icon lock |
| `/saci unlock` | Unlock the icon |
| `/saci toggle` | Enable or disable the addon |
| `/saci reload` | Restart the addon |
| `/saci debug` | Print diagnostics for rotation spells and addon status |

## Development

| Path | Purpose |
| --- | --- |
| `SimpleAssistedCombatIcon/` | The addon itself. The folder name must match the `.toc` and the folder CurseForge installs, so keep it |
| `assets/` | CurseForge description and changelog |
| `release.ps1` | Builds `release/SimpleAssistedCombatIcon_<version>.zip`, taking the version from the `.toc` |

To test in game, copy or link `SimpleAssistedCombatIcon/` into `World of Warcraft/_retail_/Interface/AddOns/`. There is no build step.

`Debug.lua` is a development profiler. It isn't listed in the `.toc`, and `release.ps1` leaves it out of the zip. To use it, add it to the `.toc` after `CombatAssistIcon.xml`, then run `/run SACIProfiler:Report()`.

### Embedded libraries

| Library | Version |
| --- | --- |
| Ace3 subset: AceAddon, AceConfig, AceConsole, AceDB, AceDBOptions, AceEvent, AceGUI, CallbackHandler | `r1403` |
| LibSharedMedia-3.0 | `v12.1.3` |
| LibDualSpec-1.0 | `v1.35.1` |
| LibDataBroker-1.1 | `v1.1.4` |
| LibStub | Minor version 2 |
| AceGUI-3.0-SharedMediaWidgets (only the `LSM30_Font` widget) | Widget version 13 |
| LibKeyBound, registered as `LibKeyBound-CUSTOM` | Customized copy |

The LibKeyBound copy is cut down to its `ToShortKey` function, so don't replace it with upstream LibKeyBound-1.0.

## Credits

- **Katur239:** original author.
- **Thisnthat and xururuca:** contributed fixes to the original repository.
- **Senoy:** current maintainer.

## License

GNU General Public License v3, as declared on the CurseForge project. See [`LICENSE`](LICENSE). The libraries in `SimpleAssistedCombatIcon/Libs/` are third-party projects under their own licenses.
