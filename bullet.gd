extends CharacterBody2D

var mouse_pos;
var speed = 1000;
var direction;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_pos = get_global_mouse_position();
	direction = (mouse_pos - position).normalized();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = (direction * speed);
	move_and_slide();
