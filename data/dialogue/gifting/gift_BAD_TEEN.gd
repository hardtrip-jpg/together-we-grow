extends DialogueEngine

func _setup() -> void:
	add_text_entry("This is my gift?").set_metadata_data({
		"author": Global.loaded_save.name,
		"background":"uid://b0qaw03j1bc7f",
		"emotion": "neutral",
		"music": [5,true]
	})
	add_text_entry("You don't like it?")
	add_text_entry("Well, it's not what I wanted really").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "sad",
	})
	add_text_entry("We can get something else if you want?")
	add_text_entry("I don't care it's fine").set_metadata_data({
		"author": Global.loaded_save.name,
		"emotion": "sad",
	})
	add_text_entry("Oh, ok..")
	
	Global.loaded_save.current_stats["relationship"] -= 1
	if Global.loaded_save.current_stats["relationship"] < 1:
		Global.loaded_save.current_stats["relationship"] = 1
