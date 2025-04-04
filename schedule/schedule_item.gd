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
	var center_container := CenterContainer.new()
	var vbox := VBoxContainer.new()
	vbox.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	
	var text_button := TextureButton.new()
	text_button.texture_normal = load("uid://delvl4i48j5bv")
	text_button.texture_hover = load("uid://iu6hql5aknwf")
	text_button.texture_focused = load("uid://bu7pgnlqdnlw6")
	text_button.modulate = resource.color
	text_button.pressed.connect(selected)
	
	var texture := TextureRect.new()
	texture.texture = load(resource.symbol)
	texture.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var center_text := CenterContainer.new()
	center_text.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	var label := Label.new()
	label.text = resource.item_name
	label.autowrap_mode = TextServer.AUTOWRAP_WORD
	label.custom_minimum_size = Vector2(132,0)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	center_container.add_child(text_button)
	center_text.add_child(texture)
	vbox.add_child(center_text)
	vbox.add_child(label)
	center_container.add_child(vbox)
	add_child(center_container)

func selected() -> void:
	set_item.emit(self)
