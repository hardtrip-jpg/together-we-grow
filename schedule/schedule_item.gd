extends MarginContainer
class_name ScheduleItem

var positions := [Vector2.ZERO]
var chance := 30

var possible_names := ["Board Games", "Soccer", "Zoo", "Work"]
var current_name : String

func _init() -> void:
	randomize()
	for y in 3:
		if randi_range(0,100) > chance:
			continue
		for x in 3:
			var check : bool = x == 1 && y == 1
			if check or randi_range(0,100) > 30 or x == y:
				continue
			
			positions.append(Vector2(x - 1,y - 1))
	
	var panel := PanelContainer.new()
	var label := Label.new()
	current_name = possible_names.pick_random()
	label.text = current_name
	panel.add_child(label)
	add_child(panel)
