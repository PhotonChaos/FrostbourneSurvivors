class_name Character
extends Resource

## The name of the character
@export var name: String

## A short description of the character
@export var bio: String

@export_subgroup("Stats")
## The amount of health the player starts with
@export var max_health: int

## The amount of mana the character starts with
@export var max_mana: int

## Movement speed in pixels per second
@export var speed: int

@export_subgroup("Attacks")
@export var primary_attack: Attack
@export var special_attack_1: Attack
@export var special_attack_2: Attack

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
