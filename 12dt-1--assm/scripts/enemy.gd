extends CharacterBody2D

const PLAYER_GROUP = "player"
const SCORE_PER_DEFEAT = 1
var speed: float = 75.0
var player: CharacterBody2D
var health: int = 1

func _ready() -> void:
	for node in get_tree().get_nodes_in_group(PLAYER_GROUP):
		player = node

func _process(delta: float) -> void:
	print(player)
	#Moves the enemy towards the player
	if not player == null:
		look_at(player.global_position)
		velocity = Vector2.RIGHT.rotated(rotation) * speed
		move_and_slide()
		
#Reduces enemy health when hit 
func take_damage() -> void:
	if health > 1:
		health =- 1
	else:
		global.score += SCORE_PER_DEFEAT
		queue_free()
		
func _damage_player(body: Node2D) -> void:
	if body == player:
		player.take_damage()
		queue_free()
