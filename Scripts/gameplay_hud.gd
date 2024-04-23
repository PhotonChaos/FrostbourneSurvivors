extends Control

@onready var health_label : Label = $HBoxContainer/Label
@onready var xp_label : Label = $HBoxContainer/Label2
@onready var game_over_rect: ColorRect = $GameOver

func _ready():
	game_over_rect.set_visible(false)

func _on_player_health_changed(health: int) -> void:
	print(health)
	health_label.text = str(health)


func _on_player_xp_changed(xp: int) -> void:
	xp_label.text = str(xp)


func _on_player_game_over() -> void:
	game_over_rect.set_visible(true)


func _on_restart_button_pressed():
	game_over_rect.set_visible(false)
