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
	var inv = get_parent().get_parent().get_node("Inventory")
	
	if  name == "Orange":
		$ding.play()
		limit -= 1
		inv.update_orange()
	elif name == "Yellow":
		$ding.play()
		limit -= 1
		inv.update_gold()
	elif name == "Purple":
		$ding.play()
		limit -= 1
		inv.update_purple()
	elif name == "Rings":
		limit -= 1
	elif name == "Umbrella":
		limit -= 1
	
	fish_hit = true
	
	if limit <= 0:
		get_node("../..").day_end =  true
		get_tree().paused = true


