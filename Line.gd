extends Node2D
var x = position.x

func _draw():
	draw_line(Vector2(position.x, position.y -27.5), (Vector2(x, -global_position.y+60)), Color(255, 255, 255), 1)

func _process(delta):
	update()

