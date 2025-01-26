extends Control

var digit = 0

@onready var t1 = get_node("Label")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for button in get_tree().get_nodes_in_group("cadeado_btn"):
		print("bpota",button.name)		
		

func _process(delta: float) -> void:
	
	Matrizes.s3 = digit
	
func alter_digit_plus():
	var rf = (digit + 1)%10
	print(rf)
	digit = rf
	return str(rf)
	
func alter_digit_minus():
	var rf = (digit + 9)%10
	print(rf)
	if rf < 0:
		rf*=-1
	digit = rf
	
	return str(rf)

func _on_button_verde_pressed() -> void:
	print("pressed_ +1")
	
	t1.text = alter_digit_plus()
	
	


func _on_button_red_pressed() -> void:
	print("pressed_ -1")

	t1.text = alter_digit_minus()
