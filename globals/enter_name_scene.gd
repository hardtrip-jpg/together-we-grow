extends Control
class_name EnterNameScene

@export var text_edit : TextEdit
@export var button : Button

signal done_setting

func _ready() -> void:
	button.pressed.connect(set_name_baby)

func set_name_baby() -> void:
	if text_edit.text.length() <= 0:
		return
	
	Global.loaded_save.name = text_edit.text
	done_setting.emit()
