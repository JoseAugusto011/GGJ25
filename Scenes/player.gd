extends Area2D


"""var Matrix = [ [1,1,1,1,1,1,1,1,1], [1,0,0,0,0,0,0,0,1], [1,0,1,1,1,1,1,0,1], [1,0,1,0,0,0,1,0,1],
 [1,0,0,0,1,0,0,0,1], [1,0,1,0,0,0,1,0,1], [1,0,1,1,1,1,1,0,1], [1,0,0,0,0,0,0,0,1], [1,1,1,1,1,1,1,1,1]]"""

"""var Matrix_cima_baixo = [ [1,1,1,1,1,1,1], [0,1,1,1,1,1,0], [0,1,1,1,1,1,0], [0,1,0,1,0,1,0],
 [0,1,0,1,0,1,0], [0,1,1,1,1,1,0], [0,1,1,1,1,1,0], [1,1,1,1,1,1,1]]

var Matrix_esquerda_direita = [ [1,1,1,1,1,1,1], [0,1,1,0,1,1,0], [0,1,1,0,1,1,0], [0,1,0,1,0,1,0],
 [0,1,0,1,0,1,0], [0,1,1,0,1,1,0], [0,1,1,0,1,1,0], [1,1,1,1,1,1,1]]"""


var Matrix_cima_baixo = Matrizes.Matrix_cb

var Matrix_esquerda_direita = Matrizes.Matrix_ed
 
#
#	começa Matrix[1][1]
#0 e (1,0)
var PontoCardeal = 0
var cardeal_x = 0
var cardeal_y = 0
var xBase = 1 # Aperta pra frente altera esse valor
var yBase = 1
var x_extra = 0
var y_extra = 0


# Norte = 0 Leste = 1 Sul = 2 oeste = 3 -> Move sentido leste Horário,oeste antihorário, para trás

# camera.xBase, camera.yBase == (0,0)

func InputMovement():
	
	# Adicionar verificações para camera não sair dos tiles maps
	
	
	if Input.is_action_just_pressed("Frente"): 
		
		
		# Se o ponto cardeal for zero -> camera.yBase -= 384
		# Se o ponto cardeal for um -> camera.xBase += 384 * 4
		# Se o ponto cardeal for dois -> camera.yBase += 384
		# Se o ponto cardeal for três -> camera.xBase -= 384 * 4
		
		'''if PontoCardeal == 0:
			if Matrix[yBase-1][xBase] == 0:
				yBase -= 1
				$".".position.y = position.y - 128
		if PontoCardeal == 1:
			if Matrix[yBase][xBase+1] == 0:
				xBase += 1
				$".".position.x = position.x + 128
		if PontoCardeal == 2:
			if Matrix[yBase+1][xBase] == 0:
				yBase += 1
				$".".position.y = position.y + 128
		if PontoCardeal == 3:
			if Matrix[yBase][xBase-1] == 0:
				xBase -= 1
				$".".position.x = position.x - 128'''
				
		if PontoCardeal == 0:
			if Matrix_cima_baixo[yBase-1][xBase+x_extra-1] == 0:
				yBase -= 1
				#$".".position.y = position.y - 128
		if PontoCardeal == 1:
			if Matrix_esquerda_direita[xBase+x_extra][yBase-1] == 0:
				xBase += 1
				#$".".position.x = position.x + 128
		if PontoCardeal == 2:
			if Matrix_cima_baixo[yBase][xBase+x_extra-1] == 0:
				yBase += 1
				#$".".position.y = position.y + 128
		if PontoCardeal == 3:
			if Matrix_esquerda_direita[xBase+x_extra-1][yBase-1] == 0:
				xBase -= 1
				#$".".position.x = position.x - 128
		
		$".".position.x = (xBase+x_extra)*128 -96 + cardeal_x
		$".".position.y = yBase*128 -96 + cardeal_y
			
			
			
			#$".".position.y = position.y + 128
			#$".".position.x = 384 * (PontoCardeal + xBase * 4)
			#$".".position.x = 384 * (PontoCardeal + xBase * 4)
		#print("Frente ",PontoCardeal)

	else: 
		pass
		
	if Input.is_action_just_pressed("Atras"):
		PontoCardeal+=2
		#print("Atras")
		PontoCardeal %= 4
		
		$".".rotation = PontoCardeal * 3.14 / 2
		
		if PontoCardeal == 0:
			#$".".position.x = position.x - 64
			#$".".position.y = position.y - 64
			cardeal_x = 0
			cardeal_y = 0
		if PontoCardeal == 1:
			#$".".position.x = position.x + 64
			#$".".position.y = position.y - 64
			cardeal_x = 64
			cardeal_y = 0
		if PontoCardeal == 2:
			#$".".position.x = position.x + 64
			#$".".position.y = position.y + 64
			cardeal_x = 64
			cardeal_y = 64
		if PontoCardeal == 3:
			#$".".position.x = position.x - 64
			#$".".position.y = position.y + 64
			cardeal_x = 0
			cardeal_y = 64
		$".".position.x = (xBase+x_extra)*128 -96 + cardeal_x
		$".".position.y = (yBase+y_extra)*128 -96 + cardeal_y
			
			
	if Input.is_action_just_pressed("Direita"):
		PontoCardeal+=1
		#print("Direita")
		PontoCardeal %= 4
		
		$".".rotation = PontoCardeal * 3.14 / 2
		
		if PontoCardeal == 0:
			#$".".position.y = position.y - 64
			cardeal_y = 0
		if PontoCardeal == 1:
			#$".".position.x = position.x + 64
			cardeal_x = 64
		if PontoCardeal == 2:
			#$".".position.y = position.y + 64
			cardeal_y = 64
		if PontoCardeal == 3:
			#$".".position.x = position.x - 64
			cardeal_x = 0
		$".".position.x = (xBase+x_extra)*128 -96 + cardeal_x
		$".".position.y = (yBase+y_extra)*128 -96 + cardeal_y
		

	if Input.is_action_just_pressed("Esquerda"):
		PontoCardeal+=3
		#print("Esquerda")
		PontoCardeal %= 4
		
		$".".rotation = PontoCardeal * 3.14 / 2
		
		if PontoCardeal == 0:
			#$".".position.x = position.x - 64
			cardeal_x = 0
		if PontoCardeal == 1:
			#$".".position.y = position.y - 64
			cardeal_y = 0
		if PontoCardeal == 2:
			#$".".position.x = position.x + 64
			cardeal_x = 64
		if PontoCardeal == 3:
			#$".".position.y = position.y + 64
			cardeal_y = 64
		$".".position.x = (xBase+x_extra)*128 -96 + cardeal_x
		$".".position.y = (yBase+y_extra)*128 -96 + cardeal_y
		
		
	"""if PontoCardeal == 0:
		if Matrix[yBase-1][xBase] == 1:
			get_node("sem_murro").disabled= true
			get_node("sem_murro_2").disabled= true
			get_node("com_murro").disabled= false
		else:
			get_node("sem_murro").disabled= false
			get_node("sem_murro_2").disabled= false
			get_node("com_murro").disabled= true
	if PontoCardeal == 1:
		if Matrix[yBase][xBase+1] == 1:
			get_node("sem_murro").disabled= true
			get_node("sem_murro_2").disabled= true
			get_node("com_murro").disabled= false
		else:
			get_node("sem_murro").disabled= false
			get_node("sem_murro_2").disabled= false
			get_node("com_murro").disabled= true
	if PontoCardeal == 2:
		if Matrix[yBase+1][xBase] == 1:
			get_node("sem_murro").disabled= true
			get_node("sem_murro_2").disabled= true
			get_node("com_murro").disabled= false
		else:
			get_node("sem_murro").disabled= false
			get_node("sem_murro_2").disabled= false
			get_node("com_murro").disabled= true
	if PontoCardeal == 3:
		if Matrix[yBase][xBase-1] == 1:
			get_node("sem_murro").disabled= true
			get_node("sem_murro_2").disabled= true
			get_node("com_murro").disabled= false
		else:
			get_node("sem_murro").disabled= false
			get_node("sem_murro_2").disabled= false
			get_node("com_murro").disabled= true"""
	
	if Input.is_action_just_released("click"):
		
			Matrizes.soltou = true 
			print(".")
			
	if Input.is_action_just_pressed("click"):
		
		Matrizes.soltou = false
		print(";")
	#$".".position.x = 384 * (PontoCardeal + xBase * 4)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	
	if x_extra == 3:
		$bolhas.visible = true
		$bolhas.play("default")
		$circulos_base.visible = false
	else:
		$bolhas.visible = false
		$bolhas.pause()
		$circulos_base.visible = true
	if y_extra > 0:
		if Input.is_action_just_pressed("Atras") or Input.is_action_just_pressed("barra") or Input.is_action_just_pressed("Direita") or Input.is_action_just_pressed("Esquerda") or Input.is_action_just_pressed("Frente"):
			y_extra = 0
			$".".position.y = ((yBase+y_extra)*128 -96 + cardeal_y)
					
		
	InputMovement()


func _on_button_pressed() -> void:
	x_extra = 0
	$".".position.x = (xBase+x_extra)*128 -96 + cardeal_x




func _on_button_2_pressed() -> void:
	x_extra = 3
	$".".position.x = (xBase+x_extra)*128 -96 + cardeal_x
	
	


func _on_button_3_pressed() -> void:
	x_extra = 6
	$".".position.x = (xBase+x_extra)*128 -96 + cardeal_x


func _on_porta_mouse_entered() :
	
	if Matrizes.usandoMAchado:		
		Matrizes.portaDestruida = true
	return true
	

func _on_porta_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if Input.is_action_just_pressed("click"):
		if Machado.on_machado:
			
			if _on_porta_mouse_entered():
				
				Matrizes.portaDestruida = true
				
				
	


func _on_caixa_entrada_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		print("____")
		y_extra = 3
		$".".position.y = ((yBase+y_extra)*128 -96 + cardeal_y)
		


func _on_caixa_saida_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		print("__|__")
		y_extra = 0
		$".".position.y = ((yBase+y_extra)*128 -96 + cardeal_y)
		
