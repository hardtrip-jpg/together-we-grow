extends DialogueEngine

func _setup() -> void:
	add_text_entry("wait! this is my gift?!").set_metadata_data({
		"author": Global.loaded_save.name,
		"background":"uid://b0qaw03j1bc7f",
		"emotion": "neutral",
		"music": [5,true]
	})
	add_text_entry("You don't like it?")
	add_text_entry("NO! I LOVE IT!!").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "happy",
	})
	add_text_entry("How did you know this is what I wanted?!?").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "happy",
	})
	add_text_entry("Can I go try it?!").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "happy",
	})
	add_text_entry("It is your birthday! Go ahead!")
	
	Global.loaded_save.current_stats["relationship"] += 1
	if Global.loaded_save.current_stats["relationship"] > 5:
		Global.loaded_save.current_stats["relationship"] = 5
