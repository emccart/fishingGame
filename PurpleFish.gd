extends KinematicBody2D


var going_left = false
var left_side = 50
var right_side = 974
var rng = RandomNumberGenerator.new()
var speed = rng.randf_range(1.0, 2.0)


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if going_left:
		move_and_collide(Vector2(-speed,0))
		if position.x<=left_side:
			going_left = false
			scale.x = scale.x * -1
	else:
		move_and_collide(Vector2(speed,0))
		if position.x>=right_side:
			going_left = true
			scale.x = scale.x * -1
