extends Area2D


#variables and set up stuff
var requests = []
var rng = RandomNumberGenerator.new()
#different possible fish requests, [orange, yellow, purple]
var orderTypes = [[1,0,0], [0,1,0], [0,0,1], [3,0,0], [0,2,0], [2,0,1], [1,1,1]]
#hide the NextDayButton for now
func hideButton():
	$NextDayButton.hide()


#get the requests
func getRequests():
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

#display the orders
func display():
	$Request1.text = "Request 1\nOrange fish: " + str(requests[0][0]) +  "     Gold Fish: " + str(requests[0][1]) + "     Purple fish: " + str(requests[0][2])
	$Request2.text = "Request 2\nOrange fish: " + str(requests[1][0]) +  "     Gold Fish: " + str(requests[1][1]) + "     Purple fish: " + str(requests[1][2])
	$Request3.text = "Request 3\nOrange fish: " + str(requests[2][0]) +  "     Gold Fish: " + str(requests[2][1]) + "     Purple fish: " + str(requests[2][2])


#if the button to fulfill requests is pressed
func _on_Button_pressed():
	if $Request1Checkbox.is_pressed() and $inventory.fill_req(requests[0]):
		requests[0] = [10,10,10] #set to an amount that can't be fulfilled
		$Request1.text = "Request 1 COMPLETE!"
	if $Request2Checkbox.is_pressed() and $inventory.fill_req(requests[1]):
		requests[1] = [10,10,10] #set to an amount that can't be fulfilled
		$Request2.text = "Request 2 COMPLETE!"
	if $Request3Checkbox.is_pressed() and $inventory.fill_req(requests[2]):
		requests[2] = [10,10,10] #set to an amount that can't be fulfilled
		$Request3.text = "Request 3 COMPLETE!"
	uncheck()

#uncheck all the checked checkboxes
func uncheck():
	$Request1Checkbox.pressed = false
	$Request2Checkbox.pressed = false
	$Request3Checkbox.pressed = false

#if the GoFishButton is pressed
func _on_GoFishButton_pressed():
	uncheck()
	$NextDayButton.show()
	$GoFishButton.hide()

#if the NextDayButton is pressed
func _on_NextDayButton_pressed():
	requests = []
	$inventory.reset()
	getRequests()
	display()
	uncheck()
	$GoFishButton.show()
	$NextDayButton.hide()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
