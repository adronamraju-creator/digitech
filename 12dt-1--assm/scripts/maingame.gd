extends Node2D

@export var spawn_point: PathFollow2D
@export var enemy_scene: PackedScene
@export var score_label: Label
@export var pause_menu: ColorRect

func _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	score_label.text = str(global.score)

func _pause_button_() -> void:
	pause_menu.visible = true
	Engine.time_scale = 0




func _resume_game() -> void:
	pause_menu.visible = false
	Engine.time_scale = 1
	
