extends CharacterBody2D

@export var starting_health = 10
@export var speed = 140
@export var attack_damage = 1
@export var inv_time = 1.0

@onready var health = starting_health
@onready var itime = inv_time

var target_velocity = Vector2.ZERO

func hit(damage: int) -> void:
	if itime > 0: return
	
	health -= damage
	print("Hit! Remaining health: %d" % health)
	itime += inv_time
	
	if health <= 0:
		health = 0
		print("GAME OVER")

func _process(delta: float) -> void:
	if itime > 0:
		itime = max(0, itime - delta)

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1

	# IDEA: We can avoid normalizing here by testing if x*y != 0
	# then if true, set both to 1/sqrt(2) (which is ~0.7071067)
	if direction != Vector2.ZERO:
		direction = direction.normalized() * speed

	velocity.x = direction.x
	velocity.y = direction.y

	move_and_slide()
