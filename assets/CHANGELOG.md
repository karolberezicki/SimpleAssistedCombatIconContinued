# Changelog

Newest first. Entries for 12.0.1.10 to 12.0.7.1 are the changelogs from their CurseForge files. Older files are no longer listed on CurseForge, so their entries come from the original repository's commit history. Dates are CurseForge upload dates where known, otherwise commit dates. Issue numbers refer to the [original repository](https://github.com/katur239/SimpleAssistedCombatIcon).

## 12.1.5.1 (2026-11-24)

Simple Assisted Combat Icon is now maintained by Senoy, with Katur239's blessing.

- Updated for WoW 12.1.5.
- Fixed the **Target Nameplate** anchor: with any display condition other than **Always Show**, the icon never appeared, or stayed at the fade alpha when **Fade instead of Hiding** was on.
- Fixed `/saci toggle`: it now works like right-clicking the DataBroker launcher, so the icon starts or stops immediately and the DataBroker label and an open settings window are refreshed. Previously, turning the addon on after it loaded disabled left the icon hidden until `/saci reload`.
- Fixed disabling the addon with **Fade instead of Hiding** on: the icon stayed on screen at the fade alpha. It now hides completely.
- Fixed the `assistedCombatIconUpdateRate` CVar: a saved value could be ignored if CVars finished loading after the addon, and changes only applied after `/saci reload`. Changes now apply immediately.
- Updated libraries: Ace3 r1403, LibSharedMedia-3.0 v12.1.3 and LibDualSpec-1.0 v1.35.1.

## 12.0.7.1 (2026-06-18)

- TOC update for 12.0.7.
- Misc fixes:
  - Keybind lookup now checks every key bound to an action and skips values it can't read.
  - Improved ElvUI and Bartender4 detection.
  - Fixed keybinds on the Bartender4 stance bar.

## 12.0.1.12 (2026-03-25)

- Updated to the new Cooldown APIs from this week's hotfixes.
- Fixed a Lua error with charge counts when the charge swipe is disabled. The charge count now only shows for spells with more than one charge.

## 12.0.1.11 (2026-03-24)

- Blizzard made breaking changes to the Cooldown APIs this week, with no PTR testing, that caused Lua errors. This update handles that until the addon can be properly updated to the new APIs once they are added.
- Fixed **Fade instead of Hiding** keeping the icon at the fade alpha even when it should be fully shown (introduced in 12.0.1.10).

## 12.0.1.10 (2026-03-19)

- Protected showing and hiding the icon when it may be anchored to protected frames. Fixes [#14](https://github.com/katur239/SimpleAssistedCombatIcon/issues/14).
- Dead units no longer count for **Show with target**. Closes [#15](https://github.com/katur239/SimpleAssistedCombatIcon/issues/15).
- TOC update for the 12.0.5 PTR.

## 12.0.1.9 (2026-03-08)

- Fixed the DataBroker label not updating when **Enabled** is changed ([#13](https://github.com/katur239/SimpleAssistedCombatIcon/pull/13), thanks Thisnthat).
- Fixed the addon not starting when it was loaded disabled and then enabled from DataBroker ([#13](https://github.com/katur239/SimpleAssistedCombatIcon/pull/13), thanks Thisnthat).

## 12.0.1.8 (2026-03-06)

- Fixed Lua errors when pressing Ctrl with a nameplate as the anchor.
- Fixed nameplate visibility.
- The icon no longer always shows while unlocked, which was confusing people. The display options now apply while unlocked too.

## 12.0.1.7 (2026-03-05)

- The icon is now only anchored to the chosen frame instead of becoming its child, to avoid conflicts with other addons like BetterCooldownManager.
- Added **Inherit Frame Visibility**: hides the icon while its anchor frame is hidden or fully transparent.
- Fixed **Override text** not overriding ConsolePort bindings.
- Renamed anchor options: **Frame Parent** is now **Anchor Frame**, **Cursor** is now **Mouse Cursor**.

## 12.0.1.6 (2026-03-03)

- Fixed Target Nameplate scaling: the icon no longer resizes with the nameplate. Closes [#11](https://github.com/katur239/SimpleAssistedCombatIcon/issues/11).

## 12.0.1.5 (2026-03-02)

- Fixed ConsolePort icons when other action bar addons are enabled.
- Druid Travel Form now counts as mounted for **Hide while mounted**.
- Fixed the DataBroker label showing the previous state after a right-click.

## 12.0.1.4 (2026-02-21)

- Added an **Icon Scale** slider.
- Added a dropdown of common frame anchors: Screen, Player and Target Unit Frames, Essential and Utility Cooldown Viewers, Personal Resource Display, or any other frame by name.
- Added Cursor anchoring: the icon follows the mouse.
- Added Target Nameplate anchoring. Closes [#10](https://github.com/katur239/SimpleAssistedCombatIcon/issues/10).
- Added LibDataBroker support: left-click opens the settings, right-click enables or disables the addon.
- Unlocking and dragging the icon now only works while it is anchored to the screen. `/saci` now also closes the settings if they are open.

## 12.0.1.3 (2026-02-18)

- Fixed some shortened keybind texts (numpad decimal, arrow keys).
- Fixed other typos.

## 12.0.1.2 (2026-02-17)

- Fixed a typo interfering with macro and Single-Button Assistant detection.
- Fixed a Lua error on load when an optional library isn't available.

## 12.0.1.1 (2026-02-16)

- Rewrote action button detection to handle custom paging on action bar addons.
- Added an option to override the keybind text for any ability.
- Added hiding in pet battles: the vehicle option is now **Hide in a Vehicle / Pet Battle**.
- Added **Visible Abilities Only** (Default UI only): uses Blizzard's own filtering to skip abilities that aren't on your action bars.
- TOC update for 12.0.1.

## 12.0.0.14 (2026-02-02)

- Switched to a custom version of LibKeyBound so the addon no longer overrides ElvUI's keybind display.
- Added LibDualSpec: profiles can be set per specialization and swap automatically on spec change.
- Fixed certain Bartender4 buttons not showing the keybind.
- Fixed the icon staying visible after `/saci toggle` turned the addon off.

## 12.0.0.13 (2026-02-01)

- Fixed Lua errors when changing profiles. Switching, creating, copying or resetting a profile now applies its settings right away.

## 12.0.0.12 (2026-01-31)

- Action bar addon detection now checks for every loaded addon (ElvUI, Bartender4, Dominos) instead of stopping at the first one, and warns in chat when more than one is loaded.
- The Ctrl lock button is turned off while the icon is anchored to another frame, to prevent Lua errors with protected frames.

## 12.0.0.11a (2026-01-30)

- Fixed a Lua error when using Dominos.

## 12.0.0.11.1 (2026-01-30)

- Improved update timing: the icon now refreshes at the `assistedCombatIconUpdateRate` rate both in and out of combat.
- Improved Bartender4 button override detection.
- `/saci reload` restarts the addon, and `/saci debug` also reports whether the addon is enabled and updating.

## 12.0.0.11 (2026-01-30)

- Improved the Lock/Unlock button: it now appears when you hover over the icon while holding Ctrl.
- Improved action button detection, and fixed an issue with addon override bars.
- Added `/saci reload` to re-scan your action bars, and some debug helpers.
- TOC update for 12.0.0 and 12.0.1.

## 12.0.0.10 (2026-01-28)

- Fixed **Enable Cooldown** not turning the cooldown swipe off.
- More work on ElvUI compatibility.
- Fixed a Lua error on load caused by settings that 12.0.0.9 saved incorrectly. Fixes [#6](https://github.com/katur239/SimpleAssistedCombatIcon/issues/6).
- Fixed inconsistent dragging: dragging the icon now always anchors it back to the screen.
- Added `/saci debug`.
- Code cleanup.

## 12.0.0.9 (2026-01-27)

- Added **All Conditions Only** to switch the display options between all conditions (and) and any condition (or).
- Unlocked mode no longer overrides the border color. A Lock button appears on the icon instead, and `/saci unlock` was added.
- Added separate icon and relative anchor points.
- Keybind detection always falls back to the default UI, and handles ElvUI loaded with its action bars disabled.
- Fixed drag and drop not saving the anchor frame.

## 12.0.0.8 (2026-01-26)

- Added ElvUI support.
- **Show with target** now works with both hard and soft targets.
- The icon now shows in combat **or** with a target, instead of requiring both.
- Added **Fade instead of Hiding**, with a **Fade out Alpha** slider.

## 12.0.0.7a (2026-01-25)

- Fixed a Lua error on load caused by the embedded libraries loading in the wrong order.

## 12.0.0.7 (2026-01-25)

- Added ConsolePort support: an option to show gamepad button icons instead of keyboard bindings.
- Minor profile fixes, including a Lua error on load for profiles with the cooldown turned off.

## 12.0.0.6b (2026-01-25)

- Fixed Lua errors around Brewmaster again: an invalid spell ID was still getting through.

## 12.0.0.6a (2026-01-24)

- Second attempt at fixing Brewmaster Lua errors, with more validation checks on the spell ID.

## 12.0.0.6 (2026-01-24)

- Added LibKeyBound to handle keybind abbreviations. Closes [#2](https://github.com/katur239/SimpleAssistedCombatIcon/issues/2).
- Added slash commands: `/saci lock` and `/saci toggle`.
- Reorganized the settings window.
- Added options for the spell charge count and its cooldown animation.
- Added an icon **Alpha** option and **Hide Cooldown Numbers**.
- Added better spell ID validation to fix "bad argument" errors from the range check. Fixes [#4](https://github.com/katur239/SimpleAssistedCombatIcon/issues/4).

## 12.0.0.5 (2026-01-23)

- Fixed Dominos keybindings. Thanks xururuca!
- Fixed edge cases of the display options not behaving consistently.
- Added options for the cooldown edge and bling animations.
- Added an option to anchor the icon to another frame.
- Added an option to enable or disable the addon entirely.

## 12.0.0.4 (2026-01-22)

- Added keybind support for the stance bar.
- Reworked the display options so they can be combined.
- Added **Hide while mounted**.
- Replaced per-frame updates with a timer, which the mounted option needs.
- Reworked Bartender4 support again to be more performant.

## 12.0.0.3 (2026-01-21)

- First attempt at fixing Bartender4 support with class bars.

## 12.0.0.2 (2026-01-14)

- Added better abbreviations for keybind texts.

## 12.0.0.1 (2026-01-06)

- Fixed the icon position not applying consistently across characters.
- Added profile management.
- Added options to hide the icon in a vehicle or as a healer.
- Updated libraries.

## 11.2.7.8 to 11.2.7.12 (2025-12-01 to 2025-12-09)

The first releases, for The War Within. Their individual files are no longer available, so their changes are grouped here.

- First release: one movable icon showing the spell Blizzard's Assisted Combat recommends next, with keybind text, cooldown swipe and a usability tint (red out of range, blue out of mana, grey unusable). Display modes, size, border, position, keybind font options and Masque support. Settings open with `/saci`, from the Addon Compartment or from the AddOns settings.
- Fixed LibSharedMedia fonts: the keybind font dropdown lists every shared font.
- Small visual fixes, code cleanup and optimizations.
- Reworked keybind detection to be more accurate and faster.
- The icon updates even if the recommended spell hasn't changed, in case its keybind has.
- Added initial support for Dominos and Bartender4.
- Fixed the embedded libraries' load order.
