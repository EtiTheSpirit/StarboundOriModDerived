# Upcoming Patch Info

You can get information on upcoming patches in [Patches-Indev.md](https://github.com/XanTheDragon/StarboundOriModDerived/blob/master/Patches-Indev.md).

# Version 1.4.3c

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

## Changes
```diff
* Slightly altered the tech screen graphics to make the head shape different.
```

## Known Bugs
 * None

---

# Version 1.4.3

## Changes
```diff
* Fixed the fenerox bug where talking to them caused them to die.
```

## Known Bugs
 * None

---

# Version 1.4.2d

## Changes
```diff
+ Added new icons for Spirit Guardian Chair, Spirit Guardian Bed, and Spirit Guardian Flag.
* Fixed the description of the Spirit Guardian flag (It used to show the standard protectorate description)
```

## Known Bugs
 * Fenerox will still die if you talk to them. The reason is unknown. They have their own unique dialog handlers, but patches to them have failed to resolve the issue.

---

# Version 1.4.2c

## Changes
```diff
* Fixed a bug causing FrackinUniverses/FrackinRaces to error.
```

## Known Bugs
 * Fenerox will still die if you talk to them. The reason is unknown. They have their own unique dialog handlers, but patches to them have failed to resolve the issue.

---
# Version 1.4.2b

## Changes
```diff
+ Added spirit images for the tech interface rather than just using the human image. Images will be improved at a later date.
```

## Known Bugs
 * Fenerox will still die if you talk to them. The reason is unknown. They have their own unique dialog handlers, but patches to them have failed to resolve the issue.

---
# Version 1.4.2

## Changes
```diff
+ Started work on a soon-to-be-added prototype respawn that's really rough around the edges and doesn't work at all. Files are there still if you are so inclined to see the work so far.
* Edited teleportation and mech drop pod effects. Teleportation now has a noisy appearance inside of it (makes it look a bit more unique) and the mech drop pod is a bit more green/blue in its color, and also has lines of energy traversing it.
```

## Known Bugs
 * Fenerox will still die if you talk to them. The reason is unknown. They have their own unique dialog handlers, but patches to them have failed to resolve the issue.

---
# Version 1.4.1

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
