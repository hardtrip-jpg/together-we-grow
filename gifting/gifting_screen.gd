extends Control
class_name GiftingManager

@export var gifts_inventory : HFlowContainer
@export var money_label : Label

var gifts : Dictionary = {
	1: {"Xylophone":{"price": 3,"nerd": 1, "loser": 1},"Puzzle":{"price": 3,"nerd": 2},"Ball":{"price": 2,"athletic": 2},"Shirt":{"price": 1,"loser": 2},"Movie VHS":{"price": 2,"rebel": 2}},
	2: {"Computer":{"price": 5,"nerd": 2, "rebel": 2},"Sport Net":{"price": 3,"athletic": 2, "rebel": 1},"Poster":{"price": 1,"rebel": 2},"Book":{"price": 1,"loser": 1, "nerd": 1},"Ball":{"price": 1,"athletic": 1}, "Science Kit":{"price": 2, "nerd": 2}, "Figurine":{"price": 3, "loser": 2, "nerd": 1}},
	3: {"Computer":{"price": 5,"nerd": 3, "rebel": 3},"DND":{"price": 2,"loser": 3},"Poster":{"price": 1,"rebel": 3},"Video Game":{"price": 3,"loser": 3, "nerd": 2},"Book":{"price": 1,"nerd": 3},"Shoes":{"price": 3, "athletic": 3}}
}

signal gift_selected

func _ready() -> void:
	init_giftshop()

func init_giftshop() -> void:
	money_label.text = "Money: " + str(Global.loaded_save.current_stats["money"]) + "$"
	for x in gifts_inventory.get_children():
		x.queue_free()
	var current_gifts_dict : Dictionary = gifts[Global.loaded_save.current_age]
	for x : String in current_gifts_dict:
		var new_gift := GiftItem.new(x, current_gifts_dict[x])
		gifts_inventory.add_child(new_gift)
		new_gift.gift_selected.connect(select_gift)

func select_gift(gift : Dictionary) -> void:
	for x : String in gift:
		var val : int = gift[x]
		if x == "price":
			val = val * -1
			x = "money"
		Global.loaded_save.current_stats[x] += val
		print("Added ", val, " to ", x)
	money_label.text = "Money: " + str(Global.loaded_save.current_stats["money"]) + "$"
	gift_selected.emit()
