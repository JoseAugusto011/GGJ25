extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if Matrizes.portaDestruida and Matrizes.testura != null and Matrizes.soltou:
		
		# Pausa a execução por 2 segundos
		await get_tree().create_timer(2.0).timeout	
		
		

		queue_free()
