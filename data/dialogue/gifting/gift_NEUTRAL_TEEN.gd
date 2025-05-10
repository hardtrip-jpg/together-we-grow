extends DialogueEngine

func _setup() -> void:
	add_text_entry("ummm... whats this?").set_metadata_data({
		"author": Global.loaded_save.name,
		"background":"uid://b0qaw03j1bc7f",
		"emotion": "neutral",
		"music": [5,true]
	})
	add_text_entry("You don't like it?")
	add_text_entry("it's for me?").set_metadata_data({
		"author": Global.loaded_save.name,
	})
	add_text_entry("Well yeah! It's you're birthday gift!")
	add_text_entry("Oh").set_metadata_data({
		"author": Global.loaded_save.name,
	})
	add_text_entry("Yeah, it's cool!").set_metadata_data({
		"author": Global.loaded_save.name,
	})
