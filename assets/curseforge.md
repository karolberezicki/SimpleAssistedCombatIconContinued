***

Miss Hekili in Midnight? This is a simple icon that can be placed anywhere on the screen that will show the current 'Assisted Highlight' spell without having to look at your action bars all the time.

It will display the spell icon, the keybind it is on, its cooldown (plus the GCD), spell charges and whether it is usable or not (in range, out of mana, etc.) to show you what the next button you should press is.

*   Configure just about everything, with 6 options for when to show and hide.
*   Supports anchoring to any other frame, including target nameplates and the mouse cursor!

_Open settings with **/saci**, or in the Addon Compartment menu on the minimap, or in the Interface Options!_

**Does NOT require Assisted Highlight or any other setting to be enabled, or the Single-Button Assistant to be on your bars, to work; it just works "out of the box".**

# **FAQ**

***

1.  #### Displaying a queue of spells in priority order will not be possible in Midnight and is not part of the Blizzard API.
2.  #### Which spell gets displayed, and when, is decided entirely by the Blizzard API.
3.  #### Blacklisting abilities is also not possible due to how the recommendations come from Blizzard.

# **Addon Compatibility**

***

These addons are currently supported:

*   _Masque_
*   _ElvUI_
*   _Dominos_
*   _Bartender4_
*   _ConsolePort_
*   _DataBroker integrations_

If keybinds are not detected for another action bar addon, let us know in the comments or on [GitHub](https://github.com/karolberezicki/SimpleAssistedCombatIconContinued/issues)!

# **Advanced**

***

The addon uses the `assistedCombatIconUpdateRate` CVar to throttle icon updates in combat. The default of 0.1s should be perfectly fine in 99% of cases. Setting it higher (0.2 or 0.3) is recommended if it causes any issues or if the spell icon tends to flicker between abilities too much:

```
/console assistedCombatIconUpdateRate 0.2
```

The new value applies immediately.
