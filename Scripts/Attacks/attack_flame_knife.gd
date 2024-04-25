extends Attack

@export var damage: int
@export var speed: float
@export var knife: Area2D

func execute(dir: Vector2, mana_spent: int):
	var proj_node = knife.instantiate()
	var proj: Projectile = proj_node.get_node(^"Projectile")

	proj_node.global_position = global_position + dir * 10
	proj_node.rotation = dir.angle() 
	
	proj.damage_source = HurtBox.DamageSource.PLAYER
	proj.damage = damage
	proj.speed = speed
	
	get_parent().add_child(proj_node)
