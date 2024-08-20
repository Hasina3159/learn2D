extends Node2D

@export var bullet : PackedScene;
var mouse_pos;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_pos = get_global_mouse_position();
	var player = $CharacterBody2D;
	if (Input.is_action_just_pressed("shoot")):
		var new_bullet = bullet.instantiate();
		new_bullet.position = player.position;
		new_bullet.rotation = player.rotation;
		add_child(new_bullet)
	
