extends DialogueEngine

func _setup() -> void:
	add_text_entry("really?...").set_metadata_data({
		"author": Global.loaded_save.name,
		"background":"uid://b0qaw03j1bc7f",
		"emotion": "neutral",
		"music": [5,true]
	})

	add_text_entry("You don't like it?")
	add_text_entry("Eh").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "sad",
	})
	add_text_entry("It's ok").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "neutral",
	})
	add_text_entry("Well you have other gifts to open!")
	
	Global.loaded_save.current_stats["relationship"] -= 1
	if Global.loaded_save.current_stats["relationship"] < 1:
		Global.loaded_save.current_stats["relationship"] = 1
	
