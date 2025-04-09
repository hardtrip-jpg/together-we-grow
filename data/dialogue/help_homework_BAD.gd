extends DialogueEngine

func _setup() -> void:
	add_text_entry("Hey, I just got the result for my test you helped me study on").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "neutral",
		"background": "uid://b0qaw03j1bc7f",
		"music": [4, false]
	})
	add_text_entry("I failed").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "sad",
		"music": [6, false]
	})
	add_text_entry("You were wrong about the circle thing, I was right").set_metadata_data({
		"author": Global.loaded_save.name,
	})
	add_text_entry("Don't help me with homework again").set_metadata_data({
		"author": Global.loaded_save.name,
	})
	Global.loaded_save.current_stats["relationship"] -= 1
	if Global.loaded_save.current_stats["relationship"] < 0:
		Global.loaded_save.current_stats["relationship"] = 0
