# Upcoming Patch Info

You can get information on upcoming patches in [Patches-Indev.md](https://github.com/XanTheDragon/StarboundOriModDerived/blob/master/Patches-Indev.md).

#### NOTE: VERSION 1.4.5 HAS CHANGED THE SHIP TELEPORTER OBJECT. IF YOUR SHIP TELEPORTER HAS BEEN REPLACED WITH A STANDARD TELEPORTER VARIANT (WHICH WILL ASK YOU TO BOOKMARK IT WHEN YOU FIRST USE IT), AND YOU WANT THE SHIP TELEPORTER BACK, USE `/admin`, MOUSE OVER YOUR SHIP'S TELEPORTER, USE `/entityeval object.smash()`, SPAWN IN A SHIP TELEPORTER WITH `/spawnitem spiritguardianshipteleporter`, AND PLACE IT DOWN WHERE IT SHOULD GO.

# Version 1.4.6b
Released 26 Jan 2019

## Changes
```diff
* Reduced Spirit Guardian tenant furnishing requirement to 9 (from 24)
* Reduced Spirit Guardian tenant Tier 4 item requirement to 4 (from 6)
```

## Known Bugs
 * None
 
 ---

# Version 1.4.6a
Released 25 Jan 2019

## Changes
```diff
* Fixed a critical bug causing all new profiles to fail due to the ship teleporter not being updated in the ship creation instructions.
* Fixed a bug causing spirit guardians to take 100% precedence when spawing tenants[1]
```
`[1]` Reported by https://steamcommunity.com/workshop/filedetails/discussion/1614494395/1743356517523977015/#c1742232339933056535

## Known Bugs
 * None
 
 ---

# Version 1.4.6
Released 24 Jan 2019

## Changes
```diff
+ Appended new respawn effect. Please do not hesitate to give insight or criticism on the effect.
* Updated race description on the character creation screen
```

## Known Bugs
 * None

---

# Version 1.4.5
Release date not logged.

## Changes
```diff
+ Appended generic "spiritguardianteleporter' teleporter.
* Fixed naming convention of ship teleporter. Ship teleporter has been renamed to "spiritguardianshipteleporter".
* Fixed the covers on spirit guardian beds
```

## Known Bugs
 * Existing Ship teleporters are replaced with the standard variant. This cannot be fixed automatically. Notice has been added to the top of the page.

---

# Version 1.4.4
Release date not logged.

## Changes
```diff
+ Appended "spiritguardianlight" item that can be handcrafted for 15 pixels + 10 plant fibre. This is a crafting item
+ Appended function to "spiritshard" item. Crafted with 10 spiritguardianlight. Used to create spiritbow, spiritdagger, spiritbroadsword, spiritshield, and lightvessel
+ Appended "lightvessel" item. This has no use for the moment, but will be used to craft end-game items.
+ Appended new sounds for Spirit Torches ripped from Ori.
+ Appended recipes for "spiritdagger" and "spiritshield" items.
+ Appended sounds for spiritshield.
* Changed name of "Spirit Light" to "Spirit Torch"
* Fixed indev value for shield health, it was way too high.
* Fixed a bug causing the indev dagger item to be entirely broken
```

## Known Bugs
 * None
 
 ---

# Version 1.4.3c
Release date not logged.

## Changes
```diff
+ Appended a new "spiritshield" item. This item is exactly as it sounds (A shield for Spirit Guardians). This item is not available in the crafting menu yet, but is fully functional.
+ Appended new sounds for the Spirit Guardian Shield.
+ Appended new sounds for a new respawn idea. This respawn is, as usual, not implemented yet.
* Fixed up some of the codex writing.
```

## Known Bugs
 * None
 
 ---
 
# Version 1.4.3b
Release date not logged.

## Changes
```diff
+ Released three codex entries. These are not in any treasure pools (So you can't get them through normal means). For those who are antsy to read, the item names are "spiritguardianfirstgeneration-codex", "spiritguardiandiary0-codex", "spiritguardianscience0-codex"
* Improved tech screen images again. Should be easier to look at.
* Improved indev ship designs and collision. The ships have not released yet but the files are there if you want to look at them.
* Appended a prototype indev behavior modifier for Erchius Ghosts and the Spooked effect. There is a test status effect that prevents ghosts from spawning, and if one already exists then they can't damage you. This is marked as a change (rather than an addition) because it's not fully ready, but it works. The item name that does this is `spiritguardiantesthead`
```

## Known Bugs
 * None

---

# Version 1.4.3a
Release date not logged.

## Changes
```diff
* Slightly altered the tech screen graphics to make the head shape different.
```

## Known Bugs
 * None

---

# Version 1.4.3
Release date not logged.

## Changes
```diff
* Fixed the fenerox bug where talking to them caused them to die.
```

## Known Bugs
 * None

---

# Version 1.4.2d
Release date not logged.

## Changes
```diff
+ Added new icons for Spirit Guardian Chair, Spirit Guardian Bed, and Spirit Guardian Flag.
* Fixed the description of the Spirit Guardian flag (It used to show the standard protectorate description)
```

## Known Bugs
 * Fenerox will still die if you talk to them. The reason is unknown. They have their own unique dialog handlers, but patches to them have failed to resolve the issue.

---

# Version 1.4.2c
Release date not logged.

## Changes
```diff
* Fixed a bug causing FrackinUniverses/FrackinRaces to error.
```

## Known Bugs
 * Fenerox will still die if you talk to them. The reason is unknown. They have their own unique dialog handlers, but patches to them have failed to resolve the issue.

---
# Version 1.4.2b
Release date not logged.

## Changes
```diff
+ Added spirit images for the tech interface rather than just using the human image. Images will be improved at a later date.
```

## Known Bugs
 * Fenerox will still die if you talk to them. The reason is unknown. They have their own unique dialog handlers, but patches to them have failed to resolve the issue.

---
# Version 1.4.2
Release date not logged.

## Changes
```diff
+ Started work on a soon-to-be-added prototype respawn that's really rough around the edges and doesn't work at all. Files are there still if you are so inclined to see the work so far.
* Edited teleportation and mech drop pod effects. Teleportation now has a noisy appearance inside of it (makes it look a bit more unique) and the mech drop pod is a bit more green/blue in its color, and also has lines of energy traversing it.
```

## Known Bugs
 * Fenerox will still die if you talk to them. The reason is unknown. They have their own unique dialog handlers, but patches to them have failed to resolve the issue.

---
# Version 1.4.1
Release date not logged.

## Changes
```diff
+ Added dialog for generic conversation (e.g. talking to NPCs on planets.) (converse.config)
+ Added dialog for NPCs in friendly ships or stations (spaceconverse.config)
+ Added dialog for Guards in strongholds / buildings (guard.config)
+ Added dialog for tenants in a home (grumble.config)
+ Added a species effect called spiritguardianglow. This effect causes the player to emit light.
* Fixed a bug causing NPCs to die if you talk to them. This patch does not include the fenerox, as they have a unique handler that I've still not managed to fix.
```

## Known Bugs
 * Fenerox will still die if you talk to them. The reason is unknown. They have their own unique dialog handlers, but patches to them have failed to resolve the issue.
