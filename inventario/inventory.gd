extends PanelContainer

@onready var grid_container = $MarginContainer/GridContainer
@export var itemArray: Array[Item]

func add_item(objeto,imagem,quantidade) -> void:
	for child in grid_container.get_children():
		if child is Slot and child.slotItemResource == null:
			var item : Item = Item.new()
			
			item.nome = objeto
			item.texture = load(imagem)
			item.quantity = quantidade
	
			itemArray.append(item)
			
			child.set_item(item)
			return

func clear_all_inventory_items() -> void:
	itemArray.clear()
	
	for child in grid_container.get_children():
		if child is Slot:
			child.set_data_empty()
			
			
func _process(delta: float) -> void:
	if Matrizes.adicionar:
		print("adicionar")
		add_item(Matrizes.item_nome, Matrizes.item_texture, Matrizes.item_quantidade)
		Matrizes.adicionar = false
	pass
