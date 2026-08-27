extends Node2D

@export var spawn_point: PathFollow2D
@export var enemy_scene: PackedScene
@export var score_label: Label

func _pause_button_() -> void:
	get_tree().change_scene_to_file("res://pausemenu.tscn")

func _spawn_enemy() -> void:
	spawn_point.progress_ratio = randf_range(0.0, 1.0)
	var enemy = enemy_scene.instantiate()
	enemy.global_position = spawn_point.global_position
	add_child(enemy)
