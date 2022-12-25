extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# var is_fav = true

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 1050
	position.y = get_parent().rng.randi_range(150, 300)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(Vector2(-get_parent().v, 0))
	if position.x < -10:
		queue_free()
