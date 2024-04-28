class_name Player
extends CharacterBody2D

signal pause
signal game_over
signal health_changed(health: int)
signal xp_changed(xp: int)

@export var starting_health: int = 10
@export var speed: int = 140
@export var attack_damage: int = 1
@export var inv_time: float = 1.0
@export var shot_cooldown = 0.1

@export_subgroup("Attacks")
@export var primary_attack: Attack
@export var special_attack_1: Attack
@export var special_attack_2: Attack

@export_subgroup("Cheats")
@export var cheats: bool = false

@onready var hurtbox: HurtBox = $HurtBox

@onready var itime = inv_time
@onready var xp = 0
@onready var cooldown1: float = 0
@onready var cooldown2: float = 0
@onready var cooldown3: float = 0

var level = 0
var target_velocity = Vector2.ZERO
var knife = preload("res://Scenes/flame_knife.tscn")
var flame_blast = preload("res://Scenes/flame_blast.tscn")

## This is here so that we don't immediately pause again when we unpause the game via hotkey
var just_paused = false  


func attack1():
	var mouse_aim = (get_global_mouse_position() - global_position).normalized()
	primary_attack.execute(get_parent(), global_position, mouse_aim, primary_attack.mana_cost)


func attack2():
	var mouse_aim = (get_global_mouse_position() - global_position).normalized()
	special_attack_1.execute(get_parent(), global_position, mouse_aim, special_attack_1.mana_cost)


func attack3():
	var mouse_aim = (get_global_mouse_position() - global_position).normalized()
	special_attack_2.execute(get_parent(), global_position, mouse_aim, special_attack_2.mana_cost)


func reset():
	hurtbox.health = starting_health
	cooldown1 = 0
	cooldown2 = 0
	cooldown3 = 0
	itime = inv_time
	xp = 0
	
	health_changed.emit(hurtbox.health)
	xp_changed.emit(xp)
	
	position = Vector2(302, 145)

func gain_hp(health: int) -> void:
	hurtbox.heal(health)

func gain_xp(experience: int) -> void:
	xp += experience
	xp_changed.emit(xp)

# ###########
# Signals
func _on_hurt_box_health_depleted():
	game_over.emit()


func _on_hurt_box_health_updated(health: int) -> void:
	health_changed.emit(health)

# ###########
# Builtins

func _ready() -> void:
	xp_changed.emit(xp)


func _process(delta: float) -> void:
	if cooldown1 > 0: cooldown1 = max(0, cooldown1 - delta)
	if cooldown2 > 0: cooldown2 = max(0, cooldown2 - delta)
	if cooldown3 > 0: cooldown3 = max(0, cooldown3 - delta)

	if itime > 0: itime = max(0, itime - delta)
		
	if Input.is_action_pressed("attack1") and primary_attack != null and cooldown1 == 0 and xp >= primary_attack.mana_cost:
		gain_xp(-primary_attack.mana_cost)
		cooldown1 += primary_attack.cooldown
		attack1()
		
	if Input.is_action_just_pressed("attack") and special_attack_1 != null and cooldown2 == 0 and xp >= special_attack_1.mana_cost:
		gain_xp(-special_attack_1.mana_cost)
		cooldown2 += special_attack_1.cooldown
		attack2()
		
	if Input.is_action_just_pressed("attack2") and special_attack_2 != null and cooldown3 == 0 and xp >= special_attack_2.mana_cost:
		gain_xp(-special_attack_2.mana_cost)
		cooldown3 += special_attack_2.cooldown
		attack3()


func _physics_process(_delta: float) -> void:
	if not just_paused and Input.is_action_just_pressed("escape"):
		just_paused = true
		pause.emit()
		return
		
	if just_paused: just_paused = false
	
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	var final_speed = speed
	
	if Input.is_action_pressed("sneak"):
		final_speed = final_speed / 2
	
	# IDEA: We can avoid normalizing here by testing if x*y != 0
	# then if true, set both to 1/sqrt(2) (which is ~0.7071067)
	if direction != Vector2.ZERO:
		direction = direction.normalized() * final_speed

	velocity = direction
	move_and_slide()
