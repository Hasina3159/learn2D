extends Line2D

@export var length = 50;
var point = Vector2.ZERO;

func _process(delta: float) -> void:
	global_position = Vector2.ZERO;
	global_rotation = 0;
	add_point(get_parent().position);
	while (get_point_count() > length):
		remove_point(0);
