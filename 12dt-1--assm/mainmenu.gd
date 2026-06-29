extends Control


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func _new_game() -> void:
	get_tree().change_scene_to_file("res://maingame.tscn")

func _options_() -> void:
	get_tree().change_scene_to_file("res://optionsmenu.tscn")

func _exit_() -> void:
	get_tree().quit()
