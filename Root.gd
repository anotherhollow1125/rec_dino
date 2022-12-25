extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_gameover = false
var resettable = false
var v = 5
var rng = RandomNumberGenerator.new()
var f_count = 0
export(PackedScene) var c1
export(PackedScene) var c2
export(PackedScene) var fav
export(PackedScene) var lgtm

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if resettable and Input.is_action_just_pressed("ui_up"):
		get_tree().reload_current_scene()

func _on_SpawnTimer_timeout():
	var target = [c1, c2, fav, lgtm][rng.randi_range(0, 3)]
	var t = target.instance()
	add_child(t)
	
func game_over():
	is_gameover = true
	$HUD/GameOver.visible = true
	$SpawnTimer.stop()
	$ResetTimer.start()
	v = 0

func _on_FavSensor_body_entered(body):
	f_count += 1
	$HUD/FavNum.text = "FAV: %s" % f_count
	if f_count % 3 == 0:
		v = 5 + f_count / 3
		$SpawnTimer.wait_time = max($SpawnTimer.wait_time - 0.05, 0.3)
	body.queue_free()


func _on_CactusSensor_body_entered(body):
	game_over()

func _on_ResetTimer_timeout():
	$HUD/BlinkTimer.start()
	resettable = true
