extends Area2D


# Declare member variables here. Examples:
var fish_hit = false
var limitReached = false
var limit = 6
onready var mainNode =  get_node(".")

# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	var velocity = Vector2(0, 100)
#	position += velocity * delta
func drop():
	var velocity = Vector2(0, 2)
		
	position += velocity
	
	if position.y >= 570:
		position.y = 0
		return false
	elif fish_hit == true:
		fish_hit = false
		position.y = 0
		return false
		
		


func _caught_fish(body):
	print(body)
	
	var name = body.caught()
	if  name == "Orange":
		print("Orangefish")
		limit -= 1
	elif name == "Yellow":
		print("Yellowfish")
		limit -= 1
	elif name == "Purple":
		print("Purplefish")
		limit -= 1
	elif name == "Rings":
		print("Plasticrings")
		limit -= 1
	elif name == "Umbrella":
		print("Umbrella")
		limit -= 1
	
	fish_hit = true
	
	if limit <= 0:
		get_node("../..").day_end =  true
		get_tree().paused = true


