extends Area2D


# Declare member variables here. Examples:
export var speed = 400 
var hookDeployed = false

# Called when the node enters the scene tree for the first time.
#func _ready():


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if (hookDeployed == false):
		var velocity = Vector2.ZERO # The player's movement vector.
		if Input.is_action_pressed("move_right"):
			scale.x = -1
			velocity.x += 1
		if Input.is_action_pressed("move_left"):
			scale.x = 1
			velocity.x -= 1
		
		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
		else:
			pass
		
		position += velocity * delta
		position.x = clamp(position.x, 70, 954)

		if Input.is_action_pressed("cast_line"):
			hookDeployed = true
	
	else:
		hookDeployed = $Hook.drop()
		
