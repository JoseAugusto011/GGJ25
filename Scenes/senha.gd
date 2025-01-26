extends Control

func confere_senha():
	
	if Matrizes.s1 == 1:
		if Matrizes.s2 == 4:
			if Matrizes.s3 == 8:
				return true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if confere_senha():
		print("BINGO!")
		# Pausa a execução por 2 segundos
		await get_tree().create_timer(2.0).timeout

		queue_free()
