# Frostbourne Survivors
A game about surviving in the Frostbourne Wilds. This is from the Remagica TTRPG by ClariseTG.

# Plan
- Make XP orbs actually a mana-like ammo system for stronger attacks?
- If excess mana is collected, turn into actual xp? Maybe add leveling just for stats
- Items for passive buffs
- Player chooses spell loadout to begin with, spells cost mana but are stronger
- X cost spell, hold attack down to charge it with mana then fire

## Controls
- Spacebar: Attack 2
- Right Click: Attack 1
- Left Click: Free Attack

## Characters
### Kana
Fire mage, uses lots of knives. Glass cannon.
- HP: Low
- MP: High
- Passive: ???

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


## Fonts Used
### Sparkly-Font
By: Sparkletastic
- license: SIL Open Font License (OFL)
- link: https://www.fontspace.com/sparkly-font-f11575