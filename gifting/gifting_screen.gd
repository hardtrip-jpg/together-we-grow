extends Control
class_name GiftingManager

@export var gifts_inventory : HFlowContainer
@export var money_label : Label

var gifts : Dictionary = {
	1: {"Xylophone":{"price": 3,"nerd": 1, "loser": 1},"Puzzle":{"price": 3,"nerd": 2},"Ball":{"price": 2,"athletic": 2},"Shirt":{"price": 1,"loser": 2},"Movie VHS":{"price": 2,"rebel": 2},"Socks":{"price": 0, "loser": 1}},
	2: {"Computer":{"price": 5,"nerd": 2, "rebel": 2},"Sport Net":{"price": 3,"athletic": 2, "rebel": 1},"Poster":{"price": 1,"rebel": 2},"Book":{"price": 1,"loser": 1, "nerd": 1},"Ball":{"price": 1,"athletic": 1}, "Science Kit":{"price": 2, "nerd": 2}, "Figurine":{"price": 3, "loser": 2, "nerd": 1}, "Socks":{"price": 0}},
	3: {"Computer":{"price": 5,"nerd": 3, "rebel": 3},"DND":{"price": 2,"loser": 3},"Poster":{"price": 1,"rebel": 3},"Video Game":{"price": 3,"loser": 3, "nerd": 2},"Book":{"price": 1,"nerd": 3},"Shoes":{"price": 3, "athletic": 3}, "Socks":{"price": 0}}
}

signal gift_selected(likeness : String)

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
	var highest_stat : String
	var highest_val : int = 0
	for x : String in Global.loaded_save.current_stats:
		if x == "relationship":
			continue
		if Global.loaded_save.current_stats[x] > highest_val && x != "money" :
			highest_stat = x
			highest_val = Global.loaded_save.current_stats[x]
	
	var highest_change : String
	var gift_highest_val : int = 0
	var lowest_change : String
	var gift_lowest_val : int = 0
	
	
	for x : String in gift:
		var val : int = gift[x]
		if x == "price":
			val = val * -1
			x = "money"
			
		if val > gift_highest_val && x != "money":
			highest_change = x
			gift_highest_val = val
		elif val < gift_lowest_val && x != "money":
			lowest_change = x
			gift_lowest_val = val
			
		Global.loaded_save.current_stats[x] += val
		print("Added ", val, " to ", x)
	money_label.text = "Money: " + str(Global.loaded_save.current_stats["money"]) + "$"
	
	var likeness : String
	if highest_stat == highest_change:
		likeness = "good"
	elif highest_stat == lowest_change:
		likeness = "neutral"
	else:
		likeness = "bad"
	print("Highest stat: ", highest_stat)
	print(likeness)
	gift_selected.emit(likeness)
