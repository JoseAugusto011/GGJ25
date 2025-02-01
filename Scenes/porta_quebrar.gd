extends Area2D

var entrou = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("click") and entrou:
		$Sprite2D.frame = 1
		$Sprite2D2.frame = 1
		$CollisionShape2D.disabled = true
		Matrizes.Matrix_cb[1][2]=0


func _on_mouse_entered() -> void:
	if Matrizes.atual == "machado":
		entrou = true
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	entrou = false
	pass # Replace with function body.
