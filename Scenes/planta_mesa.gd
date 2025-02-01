extends Area2D
var entrou = false
var frase = "copo"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("click") and entrou:
		if frase == "copo":
			$Node2D/planta_normal.frame = 1
			$planta_fbranca.frame = 1
			$planta_preto.frame = 1
			
			$CollisionShape2D.disabled = true
			$CollisionShape2D2.disabled = false
			
			entrou = false
			frase = "garrafa"
			
			print("Ativou copo")
		else:
			$Node2D/planta_normal.frame = 2
			$planta_fbranca.frame = 2
			$planta_preto.frame = 2
			
			$CollisionShape2D2.disabled = true
			print("Ativou veneno")
			


func _on_mouse_entered() -> void:
	if Matrizes.atual == frase:
		entrou = true
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	entrou = false
	pass # Replace with function body.
