extends ColorRect

signal unpause

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		set_visible(false)
		unpause.emit()


func _on_resume_button_pressed():
	set_visible(false)
	unpause.emit()
