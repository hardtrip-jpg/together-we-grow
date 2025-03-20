extends MarginContainer
class_name ScheduleItem

var positions := [Vector2.ZERO]
var chance := 30


func _init() -> void:
	randomize()
	for y in 3:
		if randi_range(0,100) < 30:
			continue
		for x in 3:
			var check : bool = x == 1 && y == 1
			if check or randi_range(0,100) < 30 or x == y:
				continue
			
			positions.append(Vector2(x - 1,y - 1))
	
	var panel := PanelContainer.new()
	var label := Label.new()
	label.text = str(positions)
	panel.add_child(label)
	add_child(panel)
