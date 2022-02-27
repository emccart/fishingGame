extends Control

var orangeCount = 1
var purpleCount = 4
var goldCount = 7

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Orangefish/OrangeCount").text = str(orangeCount)
	get_node("Purplefish/PurpleCount").text = str(purpleCount)
	get_node("Goldfish/GoldCount").text = str(goldCount)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
