extends Control

export var fishCounts = [-1, -1, -1]
var totalFishCount = -3

func update_orange():
	fishCounts[0] += 1
	totalFishCount += 1
	get_node("Orangefish/OrangeCount").text = str(fishCounts[0])
	
func update_purple():
	fishCounts[1] += 1
	totalFishCount += 1
	get_node("Purplefish/PurpleCount").text = str(fishCounts[1])
	
func update_gold():
	fishCounts[2] += 1
	totalFishCount += 1
	get_node("Goldfish/GoldCount").text = str(fishCounts[2])

func _ready():
	update_orange()
	update_purple()
	update_gold()

func fill_req(var req):
	for x in 3:
		if req[x] > fishCounts[x] :
			return false
		else:
			fishCounts[x] -= req[x]
			totalFishCount -= req[x]
	return true
	
func reset():
	for x in 3:
		fishCounts[x] = 0
	totalFishCount = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
