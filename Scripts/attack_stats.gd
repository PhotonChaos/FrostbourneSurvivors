extends Resource
class_name AttackStats

@export var attack_name: String
@export var damage: int
@export var speed: int

func _init(p_attack_name="UNKNOWN ATTACK", p_damage=0, p_speed=0) -> void:
	attack_name = p_attack_name
	damage = p_damage
	speed = p_speed
