extends Area2D


# Do this later. All enemies are bunnies for now.
#enum EnemyType {
#	BAT,
#	BUNNY,
#	JELLYFISH
#}


@export var speed = 40
@export var health = 10
@export var attack = 2
# @export var type = EnemyType.BUNNY;

@onready var player = get_tree().get_first_node_in_group("player")


func _ready() -> void:
	add_to_group("nightmares")


func _physics_process(delta: float) -> void:
	position += (player.get_position() - position).normalized() * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hit(attack)
