extends Node


# Declare member variables here. Examples:
var day_end = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$EndDay.set_process(false)
	$EndDay.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if day_end == true:
		$EndDay.set_process(true)
		$EndDay.visible = true
	else:
		pass



func _on_EndDay_pressed():
	get_tree().change_scene("res://requests.tscn")
