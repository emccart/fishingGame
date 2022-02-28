extends RichTextLabel

onready var hookNode =  get_node("../Boat/Hook")

func _process(delta):
	var count = String(hookNode.limit)
	set_text( "Catches Remaining: " + count)
