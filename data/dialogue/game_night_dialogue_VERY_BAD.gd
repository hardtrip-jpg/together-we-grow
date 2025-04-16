extends DialogueEngine

func _setup() -> void:
	add_text_entry("NO THATS SUPPOSED TO BE MY SPACE").set_metadata_data({"author": Global.loaded_save.name, "emotion": "sad", "music": [6,false], "background": "uid://b0qaw03j1bc7f"})
	add_text_entry("But I built a hotel there last round")
	add_text_entry("No.. I DID! That's why I have 3 smickeroons less").set_metadata_data({"author": Global.loaded_save.name})
	add_text_entry("I will not allow cheating in this household!")
	add_text_entry("You're so damn stupid").set_metadata_data({"author": Global.loaded_save.name,
	"emotion": "happy"})
	add_text_entry("THATS IT! YOUR ROOM, NOW!").set_metadata_data({"emotion": "sad"})
	
	Global.loaded_save.current_stats["relationship"] -= 1
	if Global.loaded_save.current_stats["relationship"] < 0:
		Global.loaded_save.current_stats["relationship"] = 0
