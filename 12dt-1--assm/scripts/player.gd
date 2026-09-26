extends CharacterBody2D

var speed: float = 300.0
var health: int = 10
var can_shoot: bool = true

@export var pivot: Node2D
@export var bullet_spawn: Marker2D
@export var bullet_scene: PackedScene
@export var bullet_time: Timer
@export var health_ui: ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction: Vector2 = Vector2(0.0,0.0)
	direction.x = Input.get_axis("ui_left","ui_right")
	direction.y = Input.get_axis("ui_up","ui_down")
	
	velocity = speed * direction.normalized()
	
	pivot.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("ui_shoot") and can_shoot:
		_shoot()
	
	move_and_slide()
	
func take_damage() -> void:
	if health > 1:
		health =- 1
	else:
		get_tree().call_deferred("reload_current_scene")
	
func _shoot() -> void:
	var bullet =  bullet_scene.instantiate()
	bullet.global_rotation = pivot.global_rotation
	bullet.global_position = bullet_spawn.global_position
	add_sibling(bullet)
