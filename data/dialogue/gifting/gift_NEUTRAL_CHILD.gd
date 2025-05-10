extends DialogueEngine

func _setup() -> void:
	add_text_entry("ummm...").set_metadata_data({
		"author": Global.loaded_save.name,
		"background":"uid://b0qaw03j1bc7f",
		"emotion": "neutral",
		"music": [5,true]
	})
	add_text_entry("You don't like it?")
	add_text_entry("It's fine, it's pretty cool").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "neutral",
	})
	add_text_entry("I guess I'll try better next time")
