class_name Pickup
extends Area2D

@export var health_value: int = 0
@export var xp_value: int = 0

func _on_area_entered(area: Area2D) -> void:
	var hb = area as HurtBox
	
	if health_value: hb.heal(health_value)
	if xp_value: hb.get_parent().gain_xp(xp_value)
	
	queue_free()
