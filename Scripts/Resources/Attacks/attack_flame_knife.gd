class_name AttackFlameKnife
extends Attack

@export var damage: int
@export var speed: float
@export_file("*.tscn") var knife_scene: String

func execute(level_root: Node2D, position: Vector2, dir: Vector2, mana_spent: int):
	var knife_obj = load(knife_scene)
	var proj_node = knife_obj.instantiate()
	var proj: Projectile = proj_node.get_node(^"Projectile")

	proj_node.global_position = position + dir * 10
	proj_node.rotation = dir.angle() 
	
	proj.damage_source = HurtBox.DamageSource.PLAYER
	proj.damage = damage
	proj.speed = speed
	
	level_root.add_child(proj_node)
