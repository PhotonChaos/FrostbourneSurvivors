class_name Projectile
extends Node2D

@export var damage: int
@export var speed: float
@export var die_on_hit: bool

var damage_source: HurtBox.DamageSource
var velocity: Vector2 = Vector2.ZERO

func should_damage(body: Node2D):
	var hb = body.get_node("HurtBox") as HurtBox
	print(hb)
	return hb and hb.damage_source != damage_source

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2.from_angle(rotation) * speed


func _physics_process(delta):
	position += velocity * delta


func _on_area_entered(area: Area2D) -> void:
	if should_damage(area):
		print(area)
		area.get_node("HurtBox").hit(damage)
	
	if die_on_hit:
		queue_free()
