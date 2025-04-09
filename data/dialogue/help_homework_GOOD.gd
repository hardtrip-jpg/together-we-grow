extends DialogueEngine

func _setup() -> void:
	add_text_entry("Hey, I just got the result for my test you helped me study on").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "neutral",
		"background": "uid://b0qaw03j1bc7f",
		"music": [4, false]
	})
	add_text_entry("[rainbow freq=1.0 sat=0.4 val=0.8]I PASSED![/rainbow]").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "happy",
		"music": [4, true]
	})
	add_text_entry("Thanks you so much! I love you!").set_metadata_data({
		"author": Global.loaded_save.name,
	})

	Global.loaded_save.current_stats["relationship"] += 1
	Global.loaded_save.current_stats["nerd"] += 1
	if Global.loaded_save.current_stats["relationship"] > 5:
		Global.loaded_save.current_stats["relationship"] = 5
	
