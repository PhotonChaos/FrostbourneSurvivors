class_name Enemy
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
@onready var sprite = $Sprite2D
@onready var hurtbox: HurtBox = $HurtBox
@onready var hitbox: CollisionShape2D = $AttackBox
@onready var animations = $AnimatedSprite2D

var is_alive = false

func set_alive(status: bool) -> void:
	## Sets the hitboxes and sprite visibility of the entity. True for on, False for off.
	is_alive = status
	
	hurtbox.monitoring = status
	hurtbox.set_deferred("monitorable", status)
	sprite.visible = status
	
	hitbox.set_deferred("disabled", !status)
	animations.visible = !status

func _ready() -> void:
	animations.play("spawn")
	add_to_group("nightmares")


func _physics_process(delta: float) -> void:
	if not is_alive: return
	
	position += (player.get_position() - position).normalized() * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hit(attack)

func _exit_tree() -> void:
	print_rich("[color=pink]ENEMY SLAIN[/color]")

func _on_hurt_box_health_depleted() -> void:
	set_alive(false)
	animations.play("death")


func _on_animated_sprite_2d_animation_finished() -> void:
	if animations.animation == &"spawn":
		set_alive(true)
	else:
		queue_free()
