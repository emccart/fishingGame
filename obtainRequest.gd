extends Control


#variables and set up stuff
var requests = [[0,0,0],[0,0,0],[0,0,0]]
var rng = RandomNumberGenerator.new()
#different possible fish requests, [orange, yellow, purple]
var orderTypes = [[1,0,0], [0,1,0], [0,0,1], [3,0,0], [0,2,0], [2,0,1], [1,1,1]]

#get the requests
func getRequests():
	requests = []
	rng.randomize()
	for i in 3:
		var randNum = rng.randi_range(0.0, 10.0)
		if randNum < 3:
			requests.append(orderTypes[0])
		elif randNum == 3 or randNum == 4:
			requests.append(orderTypes[1])
		elif randNum == 5 or randNum == 6:
			requests.append(orderTypes[2])
		else:
			requests.append(orderTypes[randNum-4])
