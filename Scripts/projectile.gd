class_name Projectile
extends Area2D

@export var damage: int
@export var speed: float

var damage_source: HurtBox.DamageSource
var velocity: Vector2 = Vector2.ZERO

func should_damage(body: Node2D):
	var hb = body.get_node("HurtBox") as HurtBox
	
	return hb and hb.damage_source != damage_source

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2.from_angle(rotation) * 3


func _physics_process(delta):
	position += velocity * delta


func _on_body_entered(body):
	if should_damage(body):
		body.get_node("HurtBox").hurt()
