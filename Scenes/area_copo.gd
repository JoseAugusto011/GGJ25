extends Area2D



func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		print("Pegou copo")
		Matrizes.item_nome = "copo"
		Matrizes.item_quantidade = 0
		Matrizes.item_texture = "res://slot_inventario.png"
		Matrizes.adicionar = true
		queue_free()
