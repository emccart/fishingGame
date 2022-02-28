extends Area2D



#hide the NextDayButton for now
func hideButton():
	$NextDayButton.hide()


#display the orders
func display():
	$Request1.text = "Request 1\nOrange fish: " + str($obtainRequest.requests[0][0]) +  "     Gold Fish: " + str($obtainRequest.requests[0][1]) + "     Purple fish: " + str($obtainRequest.requests[0][2])
	$Request2.text = "Request 2\nOrange fish: " + str($obtainRequest.requests[1][0]) +  "     Gold Fish: " + str($obtainRequest.requests[1][1]) + "     Purple fish: " + str($obtainRequest.requests[1][2])
	$Request3.text = "Request 3\nOrange fish: " + str($obtainRequest.requests[2][0]) +  "     Gold Fish: " + str($obtainRequest.requests[2][1]) + "     Purple fish: " + str($obtainRequest.requests[2][2])


#if the button to fulfill requests is pressed
func _on_Button_pressed():
	if $Request1Checkbox.is_pressed() and $Inventory.fill_req($obtainRequest.requests[0]):
		$obtainRequest.requests[0] = [10,10,10] #set to an amount that can't be fulfilled
		$Request1.text = "Request 1 COMPLETE!"
	if $Request2Checkbox.is_pressed() and $Inventory.fill_req($obtainRequest.requests[1]):
		$obtainRequest.requests[1] = [10,10,10] #set to an amount that can't be fulfilled
		$Request2.text = "Request 2 COMPLETE!"
	if $Request3Checkbox.is_pressed() and $Inventory.fill_req($obtainRequest.requests[2]):
		$obtainRequest.requests[2] = [10,10,10] #set to an amount that can't be fulfilled
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
	get_tree().change_scene("res://Fishing.tscn")

#if the NextDayButton is pressed
func _on_NextDayButton_pressed():
	$Inventory.reset()
	$obtainRequest.getRequests()
	display()
	uncheck()
	$GoFishButton.show()
	$NextDayButton.hide()

#First day
func firstDay():
	hideButton()
	$GoFishButton.show()
	$obtainRequest.getRequests()
	display()


# Called when the node enters the scene tree for the first time.
func _ready():
	display()
	$GoFishButton.hide()
