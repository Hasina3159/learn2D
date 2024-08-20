extends CharacterBody2D

@export var speed = 200;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position();
	var vect = Vector2.ZERO;
	if (Input.is_action_pressed("left")):
		vect.x = -speed;
	elif (Input.is_action_pressed("right")):
		vect.x = speed;
	if (Input.is_action_pressed("up")):
		vect.y = -speed;
	elif (Input.is_action_pressed("down")):
		vect.y = speed;
	velocity = vect;
		
		

	move_and_slide()
	look_at(mouse_pos);
