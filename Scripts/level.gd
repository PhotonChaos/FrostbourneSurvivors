class_name Level
extends Node2D

## The amount of time in seconds the player must survive for to win
@export var time_goal: float = 10*60  # 10 mins

@export_subgroup("Enemy Spawning")
## Min and max distance from the player enemies can spawn
@export var distance_range: Vector2 = Vector2(120, 150)

## Number of enemies per wave to spawn
@export var spawn_count = 10

@onready var player: Player = $Player
@onready var enemy_spawn_timer: Timer = $EnemySpawnTimer

var bunni_prefab = preload("res://Scenes/enemy.tscn")

func spawn_enemy(location: Vector2) -> Node:
	var enemy_scene = bunni_prefab.instantiate()
	enemy_scene.global_position = location
	add_child(enemy_scene)
	return enemy_scene

func spawn_wave(count: int) -> void:
	for i in range(count):
		var spawn_distance = randi_range(distance_range.x, distance_range.y)
		var spawn_offset_dir = Vector2.from_angle(randf_range(0, 2 * PI))
		var spawn_pos = player.global_position + spawn_offset_dir * spawn_distance
		
		spawn_enemy(spawn_pos)

func start():
	enemy_spawn_timer.start()
	print_rich("[color=green][b]LEVEL START[/b][/color]")

func _ready():
	start()

func _on_projectile_boundary_area_exited(area: Area2D) -> void:
	area.get_parent().queue_free()


func _on_enemy_spawn_timer_timeout():
	spawn_wave(spawn_count)
