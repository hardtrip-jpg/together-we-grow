extends Button
class_name GiftItem

var gift : Dictionary

signal gift_selected(gift : Dictionary)

func _init(item_name : String, n_gift : Dictionary) -> void:
	name = item_name
	text += item_name + "\n"
	alignment = HORIZONTAL_ALIGNMENT_CENTER
	gift = n_gift
	text += str(gift["price"]) + "$"
	pressed.connect(check_valid)
	custom_minimum_size = Vector2(106, 0)

func check_valid() -> void:
	if gift["price"] <= Global.loaded_save.current_stats["money"]:
		gift_selected.emit(gift)
	
