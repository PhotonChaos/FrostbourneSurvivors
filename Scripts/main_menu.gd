class_name MainMenu
extends Control

signal start_game

func _on_play_button_pressed():
	start_game.emit()

func _on_quit_button_pressed():
	print("Quitting Game...")
	get_tree().quit()


