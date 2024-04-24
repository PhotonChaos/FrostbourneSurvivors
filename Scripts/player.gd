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

@export_subgroup("Cheats")
@export var cheats: bool = false

@onready var hurtbox: HurtBox = $HurtBox

@onready var itime = inv_time
@onready var xp = 0
@onready var cooldown: float = 0

var level = 0
var target_velocity = Vector2.ZERO
var knife = preload("res://Scenes/flame_knife.tscn")
var flame_blast = preload("res://Scenes/flame_blast.tscn")

## This is here so that we don't immediately pause again when we unpause the game via hotkey
var just_paused = false  


func attack1():
	var dir = (get_global_mouse_position() - global_position).normalized()
	var proj_node = knife.instantiate()
	var proj: Projectile = proj_node.get_node(^"Projectile")

	proj_node.global_position = global_position + dir * 10
	proj_node.rotation = dir.angle() 
	
	proj.damage_source = HurtBox.DamageSource.PLAYER
	proj.damage = 3
	proj.speed = 130
	
	get_parent().add_child(proj_node)
	
func attack2():
	var blast_node: Node2D = flame_blast.instantiate()
	blast_node.global_position = global_position
	get_parent().add_child(blast_node)
	
func attack3():
	pass

func reset():
	hurtbox.health = starting_health
	cooldown = 0
	itime = inv_time
	xp = 0
	
	health_changed.emit(hurtbox.health)
	xp_changed.emit(xp)
	
	position = Vector2(302, 145)

func gain_hp(health: int) -> void:
	hurtbox.heal(health)

func gain_xp(experience: int) -> void:
	if experience >= 0:
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
	if cooldown > 0: cooldown = max(0, cooldown - delta)
	if itime > 0: itime = max(0, itime - delta)
		
	if Input.is_action_pressed("attack1") && cooldown == 0:
		cooldown += shot_cooldown
		attack1()
		
	if Input.is_action_just_pressed("attack"):
		attack2()
		
	if Input.is_action_just_pressed("attack2"):
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

