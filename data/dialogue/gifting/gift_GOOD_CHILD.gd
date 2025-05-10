extends DialogueEngine

func _setup() -> void:
	add_text_entry("REALLY?!").set_metadata_data({
		"author": Global.loaded_save.name,
		"background":"uid://b0qaw03j1bc7f",
		"emotion": "neutral",
		"music": [5,true]
	})
	add_text_entry("AAAAAAA").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "happy",
	})
	add_text_entry("YIPPIE!").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "happy",
	})
	add_text_entry("Glad you like it!")
	
	Global.loaded_save.current_stats["relationship"] += 1
	if Global.loaded_save.current_stats["relationship"] > 5:
		Global.loaded_save.current_stats["relationship"] = 5
