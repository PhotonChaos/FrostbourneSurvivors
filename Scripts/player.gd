class_name Player
extends CharacterBody2D

signal game_over
signal health_changed(health: int)
signal xp_changed(xp: int)

@export var starting_health: int = 10
@export var speed: int = 140
@export var attack_damage: int = 1
@export var inv_time: float = 1.0

@onready var health = starting_health
@onready var itime = inv_time
@onready var xp = 0

var level = 0
var target_velocity = Vector2.ZERO
var knife = preload("res://Scenes/flame_knife.tscn")

func shoot():
	for i in range(30):
		var angle = randf_range(0, 2*PI)
		var dir = Vector2.from_angle(angle)
		var proj_node = knife.instantiate()
		var proj: Projectile = proj_node.get_node(^"Projectile")

		proj_node.global_position = global_position + dir * 10
		proj_node.rotation = angle
		
		proj.damage_source = HurtBox.DamageSource.PLAYER
		proj.damage = 3
		proj.speed = 70
		
		get_parent().add_child(proj_node)

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
	if itime > 0:
		itime = max(0, itime - delta)
		
	if Input.is_action_just_pressed("attack"):
		shoot()

func _physics_process(_delta: float) -> void:
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

