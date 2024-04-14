class_name HurtBox
extends Area2D

enum DamageSource {
	PLAYER,
	ENEMY
}

@export var max_health = 10
@export var max_inv_time = 1.0
@export var damage_source: DamageSource = DamageSource.ENEMY

@onready var itime = 0
@onready var health = max_health

func hit(damage: int) -> void:
	if itime > 0: return
	
	health -= damage
	print("Hit! Remaining health: %d" % health)
	itime += max_inv_time
	
	if health <= 0:
		health = 0
		print("GAME OVER")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if itime > 0:
		itime = max(0, itime - delta)
