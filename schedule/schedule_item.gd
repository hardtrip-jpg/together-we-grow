extends MarginContainer
class_name ScheduleItem

var positions := [Vector2.ZERO]
var resource : ScheduleItemResource
var button : Button

signal set_item(item : ScheduleItem)

func _init(res : ScheduleItemResource) -> void:
	resource = res
	positions = resource.schedule_positions
	custom_minimum_size = Vector2(10,90);
	#var panel := PanelContainer.new()
	button = Button.new()
	button.text = resource.item_name
	button.pressed.connect(selected)
	
	#panel.add_child(button)
	add_child(button)

func selected() -> void:
	set_item.emit(self)
