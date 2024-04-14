class_name Projectile
extends Area2D


enum DamageSource {
	PLAYER,
	ENEMY
}


var damage_source: DamageSource
var damage: int
var speed: float

var velocity: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2.from_angle(rotation) * 3


func _physics_process(delta):
	position += velocity * delta


func _on_body_entered(body):
	if body.is_in_group("player") and damage_source == DamageSource.ENEMY:
		body.hit(damage)
	elif damage_source == DamageSource.PLAYER and body.is_in_group("nightmares"):
		print("KILL")
