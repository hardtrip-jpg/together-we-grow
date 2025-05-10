extends DialogueEngine

func _setup() -> void:
	add_text_entry("He he Lois. Check this out. He He.").set_metadata_data({
		"background": "uid://b0qaw03j1bc7f",
		"emotion": "neutral",
		"author": "Television"
	})
	add_text_entry("He he").set_metadata_data({
		"emotion": "happy",
		"author": Global.loaded_save.name
	})
	add_text_entry("He he")
	add_text_entry("...")
	add_text_entry("...").set_metadata_data({
		"emotion": "neutral",
		"author": Global.loaded_save.name
	})
	add_text_entry("He he Lois. He he.").set_metadata_data({
		"author": "Television"
	})
	Global.loaded_save.current_stats["loser"] += 3
