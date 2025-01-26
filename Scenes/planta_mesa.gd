extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if _on_mouse_entered():
		
		if Matrizes.usandoCopo and Matrizes.testura != null and Matrizes.soltou:
			$Node2D/planta_normal.frame = 1
			$planta_fbranca.frame = 1
			$planta_preto.frame = 1
			
			$CollisionShape2D.disabled = true
			$CollisionShape2D2.disabled = false
			print("Ativou copo")
			await get_tree().create_timer(2.0).timeout
			
		if Matrizes.usandoGarrafa  and Matrizes.testura != null and Matrizes.soltou:
			
			$Node2D/planta_normal.frame = 2
			$planta_fbranca.frame = 2
			$planta_preto.frame = 2
			
			
			$CollisionShape2D2.disabled = true
			print("Ativou garrafa")


func _on_mouse_entered():
		
		return true
	
