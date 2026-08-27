extends CharacterBody2D

var speed: float = 75.0
var player: CharacterBody2D
var health: int = 1

func _ready() -> void:
	for node in get_tree().get_nodes_in_group("player"):
		player = node

func _process(delta: float) -> void:
	print(player)
	if not player ==  null:
		look_at(player.global_position)
		velocity = Vector2(1,0).rotated(rotation) * speed
		
		move_and_slide()
		
func take_damage() -> void:
	if health > 1:
		health =- 1
	else:
		global.score += 1
		queue_free()
		
func _damage_player(body: Node2D) -> void:
	if body == player:
		player.take_damage()
		queue_free()
