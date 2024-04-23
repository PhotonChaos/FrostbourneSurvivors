class_name Projectile
extends Area2D

@export var damage: int
@export var speed: float
@export var die_on_hit: bool

var damage_source: HurtBox.DamageSource
var velocity: Vector2 = Vector2.ZERO

@onready var parent = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("projectiles")
	velocity = Vector2.from_angle(parent.rotation) * speed

func _physics_process(delta):
	parent.position += velocity * delta

func _on_area_entered(area: Area2D) -> void:
	# Use collisoin layers to make sure this is only called
	# when the projectile hits the correct target
	area.hit(damage)

	if die_on_hit:
		get_parent().queue_free()
