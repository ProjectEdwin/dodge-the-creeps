# Changelog

All notable changes to this project will be documented in this file.

This project follows a very scientific release model:
- Build something
- Break something
- Fix something
- Ship it anyway

---

## [0.0.2] - 2026-02-11

### Added
- Powerups:
  - **Ghost**: pass through enemies temporarily (Ghost voice by Jeesely — official Ghost Voice Actor).
  - **Bomb**: clears all enemies on screen.
  - **Tiny**: shrinks the player for tighter dodging.
- Powerup system rules:
  - Powerups start spawning after score **20**
  - Only **one** powerup spawns at a time
  - Powerups are **random**
  - Powerups are **not stackable**
- Nicer powerup icons (match the player vibe).
- Different mob sizes introduced gradually.

### Gameplay Changes
- Bigger play area:
  - Viewport increased to **720x720**
  - Updated MobPath to fit the new area
- Improved player control (slightly slower movement).
- Continued gradual difficulty:
  - Mob velocity ramps up over time
  - Mob spawn rate ramps up over time

### Audio
- New sound effects (many made by Edwin; Ghost is Jeesely).
- Refactored sounds into separate scenes to avoid main scene size errors.

### Fixed
- Fixed MobTimer bug.

---

## [0.0.1] - 2026-02-06

### Added
- Hi-score system (Best score tracking + UI + sound).
- Smaller sprites for more playable area.
- Title screen labels (ProjectEdwin Edition + version label).
- Early adaptive difficulty:
  - gradual mob velocity increase
  - gradual spawn frequency increase

---

## [0.0.0] - Initial Tutorial State

- Base version from Godot’s “Dodge the Creeps” tutorial.