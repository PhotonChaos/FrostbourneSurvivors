class_name HurtBox
extends Area2D

signal health_depleted
signal health_updated(health: int)

enum DamageSource {
	PLAYER,
	ENEMY
}

@export var max_health = 10
@export var max_inv_time = 1.0
@export var damage_source: DamageSource = DamageSource.ENEMY

@onready var itime = 0
@onready var health = max_health

func heal(hp: int) -> void:
	# TODO: Make this return int if there was overheal
	health = min(max_health, health + hp)
	health_updated.emit(health)

func hit(damage: int) -> void:
	if itime > 0: return
	
	health -= damage
	itime += max_inv_time
	
	if health <= 0:
		health = 0  # TODO: This can be eliminated to possibly handle overkill damage
		health_depleted.emit()
	
	health_updated.emit(health)

func _ready() -> void:
	health_updated.emit(health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if itime > 0:
		itime = max(0, itime - delta)
