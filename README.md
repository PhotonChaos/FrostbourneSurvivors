# Frostbourne Survivors
A game about surviving in the Frostbourne Wilds. This is from the Remagica TTRPG by ClariseTG.

# Plan
## Gameplay Loop

## Minimum Playable State
- [x] Player can move and shoot
- [ ] Player can die, with option to restart or quit
- [ ] Player has at least one alternate shot with a cooldown
- [ ] Enemies spawn in reasonable ways
- [x] Enemies can be hurt by player shots
- [x] Enemies drop pickups
- [ ] Pickups restore health / mana / XP to the player

## Alpha Requirements
- [ ] User can start level from main menu
- [ ] Options Menu Functional
- [ ] User can choose a Player character from a set of at least 2 options
- [ ] Player cannot pass through environment walls
- [ ] Camera follows player
- [ ] Map is larger than the screen
- [ ] Background is present
- [ ] Walls are present
## Ideas
- Make XP orbs actually a mana-like ammo system for stronger attacks?
- If excess mana is collected, turn into actual xp? Maybe add leveling just for stats
- Items for passive buffs
- Player chooses spell loadout to begin with, spells cost mana but are stronger
- X cost spell, hold attack down to charge it with mana then fire
- Dash ability for every character?
- Consumable item that grants a quick burst of mana to a player, in their inventory when they spawn in. Using an attack without enough mana will put up a UI hint and cancel the attack, using it again will proc the consumable and grant the burst. 
  - Possible specific hotkey for this burst

## Questions
- Should there be a leveling system at all?
- Should XP be orb-based, or kill based?
- What is the win condition?
- What is the end goal?
## Controls
- Spacebar: Spell 2 (OR DASH)
- Shift: Dash (OR SPELL 2)
- Right Click: Spell 1
- Left Click: Free Attack

The player will primarily use their Free Attack for chip damage, and for picking off fodder enemies when looking for pickups. 

> Unless a character comes with passive mana regen, this free attack is NECESSARY or the player will get soft-locked when they run out of mana, if there are no pikcups on the ground.

Spell 1 is an ability which will be used frequently, but not usually spammed for long. It could be a teleport, an AoE attack, a damaging dash, etc. This should cost a bit of mana, but should still be castable at least 4 times will a full mana bar, if not more.

Spell 2 is a more powerful spell, that should be used in special circumstances. It could be an X spell, or one that just costs a lot of mana. It's almost like an ultimate ability, and could act as a get-out-of-jail-free card for the player. It's control should be hard to fat-finger, but easy to use in a quick pinch.

## Characters
### Kana
Fire mage, uses lots of knives. Glass cannon.
- HP: Low
- MP: High
- Passive: ???

### Thapu
Wind mage, physical brawler, dodger
- HP: Low
- MP: High
- Passive: 
- Passive: 

#### Spell 1: Flame Knife
- Mana: 0
- Damage: 4
- Cooldown: 0.1s

#### Spell 2: Flame Charge
- Mana: 15
- Damage: 20
- Cooldown: 4s
- Kana charges forward and damages all enemies she touches

#### Spell 3: Flame Blast
- Mana: X
- Damage: 3X
- Cooldown: 25s
- Hold down attack to charge with mana. Release to fire a piercing beam of fire.
  - Lasts for X/10 seconds

# Technical Info
## Collision Layers

| Collision Layer | Objects Present                                            |
| --------------- | ---------------------------------------------------------- |
| 1               | The Player                                                 |
| 2               | Enemies                                                    |
| 3               | The Environment                                            |
| 4               | Pickups                                                    |
| 9               | Objects which should be deleted when they go out of bounds |


# Credits 
- ClariseTG, for the Remagica TTRPG this game is based on
  - And for the characters used
## Fonts Used
### Sparkly-Font
**By:** Sparkletastic
- license: SIL Open Font License (OFL)
- link: https://www.fontspace.com/sparkly-font-f11575