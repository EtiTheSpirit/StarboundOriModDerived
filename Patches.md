# Patches

Here you can see the updates made to the mod.

# Version 1.8.3 Formal Decommission
In effect 25 May 2021 at 4:45 PM Central

The mod has been discontinued until further notice. Unless decided otherwise later down the line, will no longer be worked on by me. Users are authorized to continue working on it granted they link back to this mod.


# Version 1.8.3
Released 24 Feb 2020 at 2:21 AM Central

```diff
* Fixed a bug causing passive events to not work. While this bug was not observable (unless you enabled debug switches via XModConfig), it is fixed nonetheless.
* Changed the description of the passive event config flag.
```

***
# Version 1.8.2
Released 23 Feb 2020 at 9:04 PM Central

```diff
+ New graphics for Spirit Well teleporters. They are no longer super blue, and look a bit more like the normal game models.
* Fixed a bug causing tails to disappear when walking backwards.
* Tweaked mobility to make it not so difficult to jump onto narrow platforms. Holding shift while jumping onto these is advised.
```

***
# Version 1.8.1
Released 23 Feb 2020 at 6:30 PM Central

```diff
+ Brand new (slightly less shit) respawn cinematic. Will be refined later:tm:.
```

***
# Version 1.8.0
Released 23 Feb 2020 at 1:04 AM Central

```diff
+ Added natural (vanilla) speed buffs, jump buffs, and no fall damage buffs. These are no longer reliant on Frackin' Races.
+ Added three new effects `spiritguardiannofalldamage` `spiritguardiancore` and `spiritguardiandoublejump` (broken)
* Huge tweaks to Frackin' Races stats. See FrackinRacesStatGuide.MD for more information.
```

***
# Version 1.7.1
Released 15 Feb 2020 at 5:25 PM Central

```diff
+ Added XModConfigProxy which should resolve the errors users were getting due to not having XModConfig
+ Added a one-off message to encourage users to actually install XModConfig (since it's really handy)
```

***
Released 15 Feb 2020 -- time undocumented

# Version 1.7
```diff
+ Added support for XModConfig (enable/disable features for this mod on the fly!)
+ New easter egg message for March 11, 2020
```

***
Date and time undocumented.

# Version 1.6

```diff
+ Added two new items, mecharmspiritbeam and mecharmlightcannon, which are not ready for production use but can be spawned in as needed. Known issue: The light cannon is wildly overpowered in FU.
```

***

# Version 1.5.4
Released 11 Jul 2019 at 2:16 PM Central

## Changes
```diff
+ Appended respawnhardcore.cinematic for Frackin' Universe compatibility.
``` 

***

# Version 1.5.3
Released 11 Jul 2019 at 2:16 PM Central

## Changes
```diff
* Fixed issue where a Sein voice line would play every time you teleported.
``` 

***

# Version 1.5.2
Released 11 Jul 2019 at 11:12 AM Central

## Changes
```diff
* Fixed issue where I left the debug switch for dialog on. The messages should no longer appear every time you teleport.
``` 

***

# Version 1.5.1
Released 27 Jun 2019 at 1:11 PM Central

## Changes
```diff
+ Added internal option to radio message chatter sent by the custom event system to use Sein voice lines. These lines are not implemented due to them being quite invasive. If CF adds mod config files, this will be configurable.
* Changed functionality of some passive event scripts
* Changed text of one of the passive messages.
``` 
***
# Version 1.5.0
Released 10 May 2019 at 11:07 PM Central

## Changes
```diff
- Removed RED color group from avatar model, changing the amount of color combos from 1331 to 121.
```

---

# Version 1.4.11
Released 12 Apr 2019 at 9:45 AM Central

## Changes
```diff
* Edited credits codex to accommodate for "Ori Challenges" discord name being officially changed.
* Changed credits codex icon
```

## Known Bugs
 * None
 
 ---

# Version 1.4.10
Released 8 Apr 2019 at 1:30 PM Central

From here on out, proper semantic versioning will be used.

## Changes
```diff
- Removed poll announcement.
```

## Known Bugs
 * None
 
 ---

# Version 1.4.9e
Released 2 Apr 2019 at 12:34 PM Central

## Changes
```diff
* Change display message added in 1.4.9d to point here instead of to pastebin.
```

## Known Bugs
 * None
 
 ---

# Version 1.4.9d
Released 2 Apr 2019 at 12:02 AM Central

## Changes
```diff
+ Added a message to get users to help me out with feedback. This radio message will only show once.
+ Added a new Xan radio message type. c:
+ Added sounds for Xan radio message type. Man I sound great.
+ Added XanScriptCore / "XCore" into the mod which offers some neat little lua thingies.
+ Added new event handler script for special events like Ori's birthday on March 11, or even my birthday!
* Reduced brightness of `spiritguardianglow` effect to 25% (from 50%)
- Removed `spiritguardianpassiveevt` status effect since it's no longer handled there.
```
https://docs.google.com/forms/d/e/1FAIpQLSeqoa5QQVHivQHBMIpRKrBi8ZmPxKZT8D6WbzRnXy2SWnMZUw/viewform


## Known Bugs
 * None
 
 ---

# Version 1.4.9c
Released 30 Mar 2019 at 12:24 PM Central

## Changes
```diff
* Fixed Issue #5
```

## Known Bugs
 * None
 
 ---

# Version 1.4.9b
Released 29 Mar 2019 at 5:33 PM Central

## Changes
```diff
+ Added XCustomDeathSound mod as a stock option built into this mod.
* Fixed an issue where the in-game mod version still said 1.4.8c. A bit out of date!
```

## Known Bugs
 * None
 
 ---

# Version 1.4.9a
Released 28 Mar 2019 at 11:43 AM Central

## Changes
```diff
+ Added files for a prototype Sein-like S.A.I.L, but this change is not live and the spirit icon is used.
* Changed sprites in the tech console to be a little bit better. I may rework these again in the future.
```

## Known Bugs
 * None
 
 ---

# Version 1.4.9
Released 26 Mar 2019 at 3:40 PM Central

## Changes
```diff
+ Added a new song file for in-game instruments written by Moisés Nieto (https://www.youtube.com/watch?v=njEycbetcmY). Thanks to him for giving me the MIDI.
+ Added more to the credits codex and made it more presentable in general.
* Made the credits codex a default codex entry.
* Improved grammar in various lore-based codex entries.
* Added racial tagging to codex entries as well as categories for the codex viewer if you have Extended GUI or anything.
* Changed the writing of codex entries to use arbitrary time rather than a made-up Earth-based timescale since there is no official backing lore for this.
* Added extra stats to the Frackin Races patch. See below.
- Removed Datacube style cover for credits codex, made a more cohesive image (It was being used as a placeholder)
```

### Frackin' Races Patch
All stats have been finalized. These perks will only be usable if you have Frackin' Races installed.
```diff
+ Bonus: +20% Maximum Speed, Maximum Energy, Jump Height, and Food Delta (Hunger lasts longer)
+ Bonus: -40% Falling Damage
+ Bonus: +10% Resistance to Shadow and Cosmic damage sources.
+ Bonus: +15% Total Resistance and +10% Maximum Health when in Jungles, Forests, Bogs, or Arboreal biomes.
+ Bonus: +30% Power and +10% Total Resistance when using wands or staves.
+ Bonus: Bioluminescent (Emit light) (This is a vanilla perk)
- Weakness: -20% Maximum Health
- Weakness: -30% Resistance to Physical and Toxic damage.
```

## Known Bugs
 * FR: Sometimes buffs don't apply in certain biomes but this is dodgy and needs to be investigated further.
 
 ---


# Version 1.4.8c
Released 20 Mar 2019

## Changes
```diff
* Updated race description to be more descriptive and better in general.
```

## Known Bugs
 * None
 
 ---

# Version 1.4.8b
Released 19 Mar 2019

## Changes
```diff
* Changed race title from 'spiritguardian' to 'Spirit Guardian' (for compatibility with Frackin Races)
```

## Known Bugs
 * None
 
 ---

# Version 1.4.8a
Released 18 Mar 2019 (Double release, see 1.4.8 below)

## Changes
```diff
* Fixed a bug causing Spirit Light Essence to not be a default recipe.
```

## Known Bugs
 * None
 
 ---

# Version 1.4.8
Released 18 Mar 2019

## Changes
```diff
+ Added Frackin Races support via external mod, submitted pull request for official implementation into FR.
+ Added Frackin Universe B.Y.O.S.
* Changed mod ID from "Ori Mod" to "Ori Mod Redux" to ensure only the modern patches for ^ can be used.
```

## Known Bugs
 * None
 
 ---

# Version 1.4.7
Released 11 Mar 2019

## Changes
```diff
+ Added a special quest that will only appear on March 11 as a little joke + acknowledgement to Ori's birthday. Questid is "march11"
+ Added a credits codex named "spiritguardiancredits"
```

## Known Bugs
 * None
 
 ---


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
