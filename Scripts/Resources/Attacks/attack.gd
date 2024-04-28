class_name Attack
extends Resource

## The display name of the attack. Keep it short
@export var name: String

## The description presented to the user. Make sure this outlines what the user needs to know.
@export var description: String

## The mana cost of the attack. Use -1 for an X spell.
@export var mana_cost: int

## The cooldown the attack has after used. Negative values are treated as 0.
@export var cooldown: float

## The texture that will be displayed on the UI to represent the attack
@export var ui_icon: Texture2D


func _init(p_attack_name="UNKNOWN ATTACK", p_desc="IDK what this does", p_mana=1, p_cooldown=1, p_ui_icon=null) -> void:
	name = p_attack_name
	description = p_desc
	mana_cost = p_mana
	cooldown = p_cooldown
	ui_icon = p_ui_icon
	
	
func execute(level_root: Node2D, position: Vector2, direction: Vector2, mana_spent: int):
	## Called to use the attack
	pass
