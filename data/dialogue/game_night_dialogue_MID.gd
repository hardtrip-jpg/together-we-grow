extends DialogueEngine

func _setup() -> void:
	add_text_entry("Ehh, yeah you can take the Gloporsmuch").set_metadata_data({"author": Global.loaded_save.name, "emotion": "sad", "music": [6,false], "background": "uid://b0qaw03j1bc7f"})
	add_text_entry("We can just quit instead of playing")
	add_text_entry("OH YES PLEASE! This is BORING").set_metadata_data({"author": Global.loaded_save.name, "emotion":"happy"})
