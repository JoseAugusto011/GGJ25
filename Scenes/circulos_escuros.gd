extends Node2D
const SPEED = 3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(get_parent().get_parent().position)
	#Vector2(32,32)
	#+ get_parent().position
	#( get_viewport().get_visible_rect().size )
	#print(get_viewport().get_visible_rect().size)
	var vec = ((get_viewport().get_mouse_position() ) / 8) - self.position + Vector2(-11,8)# getting the vector from self to the mouse
	vec = vec * delta * SPEED # normalize it and multiply by time and speed
	position += vec # move by that vector
	#pass
