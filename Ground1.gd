extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x = 512

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	x = (x + get_parent().v) % 2048
	position.x = 1536 - x 
