extends PanelContainer

@onready var grid_container = $MarginContainer/GridContainer
@export var itemArray: Array[Item]

func add_item_resource() -> void:
	for child in grid_container.get_children():
		if child is Slot and child.slotItemResource == null:
			var item : Item = Item.new()
	
			item.texture = load("res://icon.svg")
			item.quantity = randi_range(1, 20)
	
			itemArray.append(item)
			
			child.set_item(item)
			return

func clear_all_inventory_items() -> void:
	itemArray.clear()
	
	for child in grid_container.get_children():
		if child is Slot:
			child.set_data_empty()




func _on_machado_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		for child in grid_container.get_children():
			if child is Slot and child.slotItemResource == null:
				var item : Item = Item.new()
		
				item.texture = load("res://itens_do_jogo/machado_icone.png")
				item.quantity = 0
				itemArray.append(item)
				print(itemArray)
				child.set_item(item)
				return
		
	pass # Replace with function body.
