extends Control

signal unpause
signal restart

@onready var health_label : Label = $HBoxContainer/Label
@onready var xp_label : Label = $HBoxContainer/Label2
@onready var game_over_rect: ColorRect = $GameOver
@onready var pause_menu: ColorRect = $PauseRect

func _ready():
	game_over_rect.set_visible(false)
	pause_menu.set_visible(false)

func _on_player_health_changed(health: int) -> void:
	print(health)
	health_label.text = str(health)


func _on_player_xp_changed(xp: int) -> void:
	xp_label.text = str(xp)


func _on_player_game_over() -> void:
	game_over_rect.set_visible(true)

###########
# UI Signals
func _on_restart_button_pressed():
	game_over_rect.set_visible(false)
	restart.emit()

func _on_resume_button_pressed():
	pause_menu.set_visible(false)
	unpause.emit()

func _on_quit_button_pressed():
	get_tree().quit()
