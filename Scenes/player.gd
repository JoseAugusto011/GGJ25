extends Area2D


var Matrix = [ [1,1,1,1,1,1,1,1,1], [1,0,0,0,0,0,0,0,1], [1,0,1,1,1,1,1,0,1], [1,0,1,0,0,0,1,0,1],
 [1,0,0,0,1,0,0,0,1], [1,0,1,0,0,0,1,0,1], [1,0,1,1,1,1,1,0,1], [1,0,0,0,0,0,0,0,1], [1,1,1,1,1,1,1,1,1]] 
#
#	começa Matrix[1][1]
#0 e (1,0)
var PontoCardeal = 0
var xBase = 1 # Aperta pra frente altera esse valor
var yBase = 1

# Norte = 0 Leste = 1 Sul = 2 oeste = 3 -> Move sentido leste Horário,oeste antihorário, para trás

# camera.xBase, camera.yBase == (0,0)

func InputMovement():
	
	# Adicionar verificações para camera não sair dos tiles maps
	
	
	if Input.is_action_just_pressed("Frente"): 
		
		
		# Se o ponto cardeal for zero -> camera.yBase -= 384
		# Se o ponto cardeal for um -> camera.xBase += 384 * 4
		# Se o ponto cardeal for dois -> camera.yBase += 384
		# Se o ponto cardeal for três -> camera.xBase -= 384 * 4
		
		if PontoCardeal == 0:
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
				$".".position.x = position.x - 128
			
			
			
			#$".".position.y = position.y + 128
			#$".".position.x = 384 * (PontoCardeal + xBase * 4)
			#$".".position.x = 384 * (PontoCardeal + xBase * 4)
			print("Frente ",PontoCardeal)
	else: 
		pass
		
	if Input.is_action_just_pressed("Atras"):
		PontoCardeal+=2
		print("Atras")
		PontoCardeal %= 4
		
		$".".rotation = PontoCardeal * 3.14 / 2
		
		if PontoCardeal == 0:
			$".".position.x = position.x - 64
			$".".position.y = position.y - 64
		if PontoCardeal == 1:
			$".".position.x = position.x + 64
			$".".position.y = position.y - 64
		if PontoCardeal == 2:
			$".".position.x = position.x + 64
			$".".position.y = position.y + 64
		if PontoCardeal == 3:
			$".".position.x = position.x - 64
			$".".position.y = position.y + 64
			
			
	if Input.is_action_just_pressed("Direita"):
		PontoCardeal+=1
		print("Direita")
		PontoCardeal %= 4
		
		$".".rotation = PontoCardeal * 3.14 / 2
		
		if PontoCardeal == 0:
			$".".position.y = position.y - 64
		if PontoCardeal == 1:
			$".".position.x = position.x + 64
		if PontoCardeal == 2:
			$".".position.y = position.y + 64
		if PontoCardeal == 3:
			$".".position.x = position.x - 64
		

	if Input.is_action_just_pressed("Esquerda"):
		PontoCardeal+=3
		print("Esquerda")
		PontoCardeal %= 4
		
		$".".rotation = PontoCardeal * 3.14 / 2
		
		if PontoCardeal == 0:
			$".".position.x = position.x - 64
		if PontoCardeal == 1:
			$".".position.y = position.y - 64
		if PontoCardeal == 2:
			$".".position.x = position.x + 64
		if PontoCardeal == 3:
			$".".position.y = position.y + 64
		
		
	if PontoCardeal == 0:
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
			get_node("com_murro").disabled= true
	
	
	#$".".position.x = 384 * (PontoCardeal + xBase * 4)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	InputMovement()
