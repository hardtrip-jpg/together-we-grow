extends DialogueEngine

func _setup() -> void:
	add_text_entry("ooo").set_metadata_data({
		"author": Global.loaded_save.name,
		"background":"uid://b0qaw03j1bc7f",
		"emotion": "happy",
		"music": [5,true]
	})
	add_text_entry("gift gift!").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "neutral",
	})
	add_text_entry("You like it?")
	add_text_entry("gift gift!").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "happy",
	})
	add_text_entry("I guess you do!")
	
	
