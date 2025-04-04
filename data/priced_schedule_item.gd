extends ScheduleItemResource
class_name PricedScheduleItemResource

@export var price : int

func _init(p_name := "", p_postion := [Vector2.ZERO], p_age := Vector2(1,10), p_symbol := "", p_price := 0) -> void:
	item_name = p_name
	schedule_positions = p_postion
	required_age = p_age
	symbol = p_symbol
	price = p_price
