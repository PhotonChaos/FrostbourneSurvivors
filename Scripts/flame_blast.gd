extends Area2D

@export var damage: int = 30

@onready var animator: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	animator.play(&"default")


func _on_animated_sprite_2d_animation_finished():
	print(self)
	queue_free()


func _on_area_entered(area):
	area.hit(damage)
