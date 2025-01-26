extends Control

var d1 = 0
var d2 = 0
var d3 = 0
var d4 = 0

@onready var t1 = get_node("Label")
@onready var t2 = get_node("Label2")
@onready var t3 = get_node("Label3")
@onready var t4 = get_node("Label4")

func verify_sequence():
	
	if d1==1:
		if d2 == 1:
			if d3 ==  1:
				if d4 == 1:
					print("BAzinga")
					# Pausa a execução por 2 segundos
					await get_tree().create_timer(2.0).timeout

					queue_free()


func alter_digit(d):

	
	d = (d)%2
	
	
	return d
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass	
		

func _process(delta: float) -> void:
	
	verify_sequence()

	



func _on_sino_1_pressed() -> void:
	print("!1")
	d1+=1
	d4+=1
	d1 =  alter_digit(d1)
	t1.text = str(d1)
	d4 = alter_digit(d4)
	t4.text = str(d4)
	
	print("d1: ",d1,"\t","d2: ",d2,"\t","d3: ",d3,"\t","d4: ",d4,"\n")
	


func _on_sino_2_pressed() -> void:
	print("!2")
	d2+=1
	d4+=1
	d2 = alter_digit(d2)
	d4 = alter_digit(d4)
	t2.text = str(d2)
	t4.text = str(d4)
	
	print("d1: ",d1,"\t","d2: ",d2,"\t","d3: ",d3,"\t","d4: ",d4,"\n")
	
func _on_sino_3_pressed() -> void:
	print("!3")
	
	d2+=1
	d3+=1	
	d2 = alter_digit(d2)
	d3 = alter_digit(d3)
	t2.text = str(d2)
	t3.text = str(d3)
	
	print("d1: ",d1,"\t","d2: ",d2,"\t","d3: ",d3,"\t","d4: ",d4,"\n")

func _on_sino_4_pressed() -> void:
	print("!4")
	d4+=1
	d4 = alter_digit(d4)
	t4.text = str(d4)
	
	print("d1: ",d1,"\t","d2: ",d2,"\t","d3: ",d3,"\t","d4: ",d4,"\n")
