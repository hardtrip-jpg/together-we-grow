extends DialogueEngine

func _setup() -> void:
	add_text_entry("Hey! You can't do that!").set_metadata_data({"author": Global.loaded_save.name, "emotion": "sad", "music": [6,false], "background": "uid://b0qaw03j1bc7f"})
	add_text_entry("Yes I can! Now you take 3 doomages")
	add_text_entry("No.. YOU TAKE 3 DOOMAGES! Ha ha!").set_metadata_data({"author": Global.loaded_save.name, "emotion":"happy"})
	add_text_entry("WHEN DID YOU GET THAT CARD!")
	add_text_entry("he he").set_metadata_data({"author": Global.loaded_save.name,})
	
	Global.loaded_save.current_stats["relationship"] += 1
	if Global.loaded_save.current_stats["relationship"] > 5:
		Global.loaded_save.current_stats["relationship"] = 5
