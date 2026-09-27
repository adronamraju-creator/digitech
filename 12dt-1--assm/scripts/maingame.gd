extends Node2D

const MIN_SPAWN_RATIO = 0.0
const MAX_SPAWN_RATIO = 1.0

@export var spawn_point: PathFollow2D
@export var enemy_scene: PackedScene
@export var score_label: Label

func _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	score_label.text = str(global.score)

# Spawns an enemy at a random position
func _spawn_enemy() -> void:
	var spawn_ratio: float = randf_range(MIN_SPAWN_RATIO, MAX_SPAWN_RATIO)
	
	if spawn_ratio >= MIN_SPAWN_RATIO and spawn_ratio <= MAX_SPAWN_RATIO:
		spawn_point.progress_ratio = spawn_ratio
	var enemy = enemy_scene.instantiate()
	enemy.global_position = spawn_point.global_position
	add_child(enemy)


	
