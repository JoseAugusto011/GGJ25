extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		print("click")
		Matrizes.Matrix_ed[1][3] = 0
		$Sprite2D.frame=1
		$Sprite2D2.frame=1
		$Sprite2D3.frame=1
		$Sprite2D4.frame=1
