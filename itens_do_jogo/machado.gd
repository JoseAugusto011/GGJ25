extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		print("Pegou Machado")
		Matrizes.item_nome = "machado"
		Matrizes.item_quantidade = 0
		Matrizes.item_texture = "res://itens_do_jogo/machado_icone.png"
		Matrizes.adicionar = true
		queue_free()
	
