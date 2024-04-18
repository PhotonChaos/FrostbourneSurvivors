extends Control

@onready var health_label : Label = $HBoxContainer/Label
@onready var xp_label : Label = $HBoxContainer/Label2


func _on_player_health_changed(health: int) -> void:
	print(health)
	health_label.text = str(health)


func _on_player_xp_changed(xp: int) -> void:
	xp_label.text = str(xp)


func _on_player_game_over() -> void:
	print("GAME OVER")
