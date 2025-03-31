extends Resource
class_name ScheduleItemResource

@export var item_name : String
@export var schedule_positions : Array
@export var required_age : Vector2
@export var symbol : String
@export var color : Color
@export var stat_changes : Dictionary

func _init(p_name := "", p_postion := [Vector2.ZERO], p_age := Vector2(1,10), p_symbol := "", p_stat := {}) -> void:
	item_name = p_name
	schedule_positions = p_postion
	required_age = p_age
	symbol = p_symbol
	stat_changes = p_stat

func match_age(age : int) -> bool:
	var return_var := false
	if age >= required_age.x && age <= required_age.y:
		return_var = true
	return return_var
