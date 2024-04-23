extends Node2D


@onready var main_menu: MainMenu = $MainMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	# TODO: Start BG music here
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_start_game():
	main_menu.hide()
