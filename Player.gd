extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# applied_force = g


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if get_parent().is_gameover:
		$AnimatedSprite.playing = false
		return

	if Input.is_action_just_pressed("ui_up") and linear_velocity.y == 0.0:
		applied_force = Vector2(0.0, -50000)
	else:
		applied_force = Vector2(0.0, 0.0)
