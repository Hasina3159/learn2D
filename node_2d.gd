extends Node2D

@export var jump_particles : PackedScene;
@export var bullet : PackedScene;
var player_initial_size;
var mouse_pos;
var RANDOM_SHAKE_STRENGTH: float = 30.0
# Multiplier for lerping the shake strength to zero
var SHAKE_DECAY_RATE: float = 5.0

@onready var camera = $Camera2D
@onready var rand = RandomNumberGenerator.new()

var shake_strength: float = 0.0

func _ready() -> void:
	rand.randomize();
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_pos = get_global_mouse_position();
	var player = $CharacterBody2D;
	#var new_scale_x = 0.013 + abs(player.velocity.y / 350 / 300);
	#var new_scale_x = 0.013 + abs(player.velocity.y / 350 / 300);
	#$CharacterBody2D/Sprite2D.scale.x = new_scale_x;
	#$CharacterBody2D/Sprite2D.scale.x = new_scale_x;
	if (Input.is_action_just_pressed("shoot")):
		var new_bullet = bullet.instantiate();
		new_bullet.position = player.position;
		new_bullet.rotation = player.rotation;
		shake_strength = RANDOM_SHAKE_STRENGTH / 2
		SHAKE_DECAY_RATE = 25
		add_child(new_bullet);
	if (Input.is_action_just_pressed("particles") && $CharacterBody2D.velocity.y < 0):
		var new_jump_particle = jump_particles.instantiate();
		new_jump_particle.position.x = $CharacterBody2D.position.x;
		new_jump_particle.position.y = $floor/CollisionShape2D.position.y;
		new_jump_particle.emitting = true;
		shake_strength = RANDOM_SHAKE_STRENGTH 
		SHAKE_DECAY_RATE = 30
		add_child(new_jump_particle);
	#print("IS ON FLOOR : ", $CharacterBody2D.is_on_floor(), ", New scale Y : ", new_scale_x);
	shake_strength = lerp(shake_strength, 0.0, SHAKE_DECAY_RATE * delta)

	$Camera2D.offset = random_vect();

func random_vect() -> Vector2:
	return (Vector2(
		randf_range(-shake_strength, shake_strength),
		randf_range(-shake_strength, shake_strength)
	));
	
