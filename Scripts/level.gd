class_name Level
extends Node2D

@export var spawn_distance = 30
# List of enemies per wave
@export var waves: Array[int] = []

@onready var player: Player = $Player

var bunni_prefab = preload("res://Scenes/enemy.tscn")
var time = 0

# TODO: Require enemy type. Just does bunnies for now.
func spawn_enemy(location: Vector2) -> Node:
	var enemy_scene = bunni_prefab.instantiate()
	enemy_scene.global_position = location
	add_child(enemy_scene)
	return enemy_scene

func spawn_wave(count: int) -> void:
	for i in range(count):
		var spawn_pos = player.global_position + Vector2.from_angle(randf_range(0, 2 * PI)).normalized() * spawn_distance
		spawn_enemy(spawn_pos)


func _ready():
	pass # Replace with function body.

func _process(delta):
	time += delta
	
	if time > 3:
		time -= 3
		spawn_wave(12)

func _on_projectile_boundary_area_exited(area: Area2D) -> void:
	area.get_parent().queue_free()
