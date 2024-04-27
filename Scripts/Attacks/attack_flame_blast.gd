class_name AttackFlameBlast
extends Attack

@export var damage: int
@export var flame_blast: Area2D

func execute(dir: Vector2, mana_spent: int):
	var blast_node: Node2D = flame_blast.instantiate()
	blast_node.global_position = global_position

	get_parent().add_child(blast_node)
