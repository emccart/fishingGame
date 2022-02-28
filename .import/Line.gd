extends Node2D

func _draw():
	draw_line(Vector2(0,0), Vector2(position.x +1, position.y +1), Color(255, 255, 255), 3)
	pass

func _process(delta):
	update()
