extends Control

signal unpause
signal restart

@onready var health_label : Label = $HBoxContainer/Label
@onready var xp_label : Label = $HBoxContainer/Label2
@onready var children_label: Label = $HBoxContainer/Label3
@onready var game_over_rect: ColorRect = $GameOver
@onready var pause_menu: ColorRect = $PauseRect
@onready var attack_icon_1: TextureProgressBar = $AttackContainer/TextureProgressBar
@onready var attack_icon_2: TextureProgressBar = $AttackContainer/TextureProgressBar2

var attack_frame: Texture2D = preload("res://Textures/Attacks/AttackFrame.png")
var attack_frame_gold: Texture2D = preload("res://Textures/Attacks/GoldAttackFrame.png")

var is_gold = [true, true, true]

var children = 0

func _ready():
	game_over_rect.hide()
	pause_menu.hide()

################
## Debug Signals

func _on_level_child_entered_tree(node):
	if not children_label: return
	
	children += 1
	children_label.text = str(children)


func _on_level_child_exiting_tree(node):
	if not children_label: return
	
	children -= 1
	children_label.text = str(children)

################
## Player Signals

func _on_player_health_changed(health: int) -> void:
	print(health)
	health_label.text = str(health)


func _on_player_xp_changed(xp: int) -> void:
	xp_label.text = str(xp)


func _on_player_game_over() -> void:
	game_over_rect.show()
	
	
func _on_player_pause():
	pause_menu.show()
	
	
################
## UI Signals

func _on_restart_button_pressed():
	game_over_rect.hide()
	restart.emit()


func _on_quit_button_pressed():
	get_tree().quit()


func _on_pause_rect_unpause():
	unpause.emit()


func _on_player_attack_updated(attack: Attack, index: int):
	var target_icon: TextureProgressBar = attack_icon_1 if index == 1 else attack_icon_2
	
	target_icon.texture_under = attack.ui_icon
	target_icon.texture_progress = attack.ui_icon
	target_icon.texture_over = attack_frame_gold


func _on_player_cooldown_updated(time_left, initial_cooldown, index):
	var target_icon: TextureProgressBar = attack_icon_1 if index == 1 else attack_icon_2
	
	if initial_cooldown == 0:
		print("ERROR: Cooldown is 0 for attack index", index)
	
	target_icon.value = (initial_cooldown - time_left) / initial_cooldown * 16
	
	if time_left == 0:
		target_icon.texture_over = attack_frame_gold
	elif is_gold[index]:
		target_icon.texture_over = attack_frame
