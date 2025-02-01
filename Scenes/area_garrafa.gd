extends Area2D



func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		print("Pegou garrafa")
		Matrizes.item_nome = "garrafa"
		Matrizes.item_quantidade = 0
		Matrizes.item_texture = "res://mikael_pasta/novidades/assets_puzzles/garrafaVeneno.png"
		Matrizes.adicionar = true
		queue_free()
