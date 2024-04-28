class_name AttackFlameBlast
extends Attack

@export var damage: int
@export_file("*.tscn") var flame_blast_scene: String

func execute(level_root: Node2D, position: Vector2, dir: Vector2, mana_spent: int):
	var blast_obj = load(flame_blast_scene)
	var blast_node: Node2D = blast_obj.instantiate()
	blast_node.global_position = position

	level_root.add_child(blast_node)
